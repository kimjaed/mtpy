# configure matplotlib for testing
import matplotlib.pyplot as plt

from mtpy.imaging.penetration_depth2d import plot2Dprofile
from tests.imaging import ImageTestCase, ImageCompare


class TestPenetration_depth2d(ImageTestCase):
    @classmethod
    def setUpClass(cls):
        super(TestPenetration_depth2d, cls).setUpClass()

        cls._edifiles = "data/edifiles"
        cls._period_list = [10400.01, 8799.998, 1800.0, 320.0001, 57.0, 9.4, 1.72, 0.35]

    def test_plot2Dprofile_no_period_list(self):
        """
        testing plot2Dprofile without period index list
        exception should be raised
        :return:
        """
        try:
            plot2Dprofile(self._edifiles)
        except Exception:
            pass

    @ImageCompare(fig_size=(8, 6))
    def test_plot2Dprofile_det(self):
        plot2Dprofile(self._edifiles, self._period_list, zcomponent='det')

    @ImageCompare(fig_size=(8, 6))
    def test_plot2Dprofile_zxy(self):
        plot2Dprofile(self._edifiles, self._period_list, zcomponent='zxy')

    @ImageCompare(fig_size=(8, 6))
    def test_plot2Dprofile_zyx(self):
        plot2Dprofile(self._edifiles, self._period_list, zcomponent='zyx')

    def test_plot2Dprofile_wrong_rho(self):
        try:
            plot2Dprofile(self._edifiles, self._period_list, zcomponent='dat')
        except Exception:
            pass
