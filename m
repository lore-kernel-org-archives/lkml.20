Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C353B42DD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374647; cv=none; b=a/dpRZxCsjonM2fMDW6uUpdWhGyBObJC0RJnfGWSWPvAsG/X3WXwgkd7OLR0/oz75v9001ZvEYx9xxYh9mJ7OHzqItvn6IZBG3tCkbr1he5gXY8TtmNNO3WZstV2MS/uRf6AtrM7DyYjAVex/XX7UeknzQtRtM9/hQGvY2s3wec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374647; c=relaxed/simple;
	bh=akwEYZVThsLX8S1S17MnQXq0t3ME7/gWBEGN9oUoGw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=F74Acf7d7UiHU0pRkxG7CsKN58p9qRhvTbtEXk/59Pb60kQF6agegfIj/4vTg0Zm7YqXWnSDvcVvZunSRcDR8fsNt4VZgtB4ZpR0K5BxdS6W09I739j2W29+NOfiaWK5Q1x8ziPGc++T2S8TPh7aJKN7gBjPqfHMfxTA4uBbFis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RvXdLqMm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RvXdLqMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790374643; x=1821910643;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=akwEYZVThsLX8S1S17MnQXq0t3ME7/gWBEGN9oUoGw4=;
  b=RvXdLqMmfXzNaqxXnM2lFt9UpHTdF9f9C18aupi9otmdcxsIL2/6aBSx
   5at6RlfOX9+CvfdQWp0hNdju1F40VtK4ACRjMe7NoadXZZav7Vr14hh+n
   vH4X0y3PZWgoEtpJhNV8LwfMbUUPLyjI9dA1NxLRx98RkJceWc5Fp80+Q
   OMne8LhWgOdBV7VO6EOoQuv/vn02ITSRVGCKRbZYNhlefvV9lEsJwsSDt
   DDJ3zUxNX+JmDUju81w9EgEkcRtzxfM/oFP39ND3+5DnwIldDjHE3J7wX
   7fQRGOVyNAPj59Yp6VnhAOsie+MqV/SahRXiX5u9Mdj/feUtjzRGTHmPd
   w==;
X-CSE-ConnectionGUID: RDsrg5x9RxycEITJ2pT/NA==
X-CSE-MsgGUID: rIRIa2HUSZCth8ukjQ6cNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="112953035"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="112953035"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 15:17:22 -0700
X-CSE-ConnectionGUID: kLlabeB9TGS1elrbMiN5Cw==
X-CSE-MsgGUID: jazW7UagTCqKcUz8QAs12w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="279171682"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 25 Sep 2026 15:17:20 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAEEH-0000000001h-3toj;
	Fri, 25 Sep 2026 22:17:17 +0000
Date: Sat, 26 Sep 2026 00:16:49 +0200
From: kernel test robot <lkp@intel.com>
To: Liviu Stan <liviu.stan@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>
Subject: drivers/iio/temperature/ltc2983.c:1895:1: warning: the frame
 size of 1136 bytes is larger than 1024 bytes
Message-ID: <202609260048.kjlkLMOK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   165768bb70265b5c38cf0b73fafd75be235f8b14
commit: 3dd0c048409e335320418c632966f149be628fd4 iio: temperature: ltc2983:=
 Add support for ADT7604
date:   4 months ago
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/2026092=
6/202609260048.kjlkLMOK-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260926/202609260048.kjlkLMOK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 3dd0c048409e ("iio: temperature: ltc2983: Add support for ADT7604")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260048.kjlkLMOK-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/temperature/ltc2983.c: In function 'ltc2983_setup':
>> drivers/iio/temperature/ltc2983.c:1895:1: warning: the frame size of 113=
6 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    1895 | }
         | ^


vim +1895 drivers/iio/temperature/ltc2983.c

6f7cadcf664b04 Cosmin Tanislav 2022-11-03  1805 =20
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1806  static int ltc2983_se=
tup(struct ltc2983_data *st, bool assign_iio)
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1807  {
6b047d099703c9 Liviu Stan      2026-05-25  1808  	struct device *dev =3D &s=
t->spi->dev;
3dd0c048409e33 Liviu Stan      2026-05-25  1809  	u32 iio_chan_t =3D 0, iio=
_chan_v =3D 0, iio_chan_r =3D 0, iio_chan_c =3D 0;
3dd0c048409e33 Liviu Stan      2026-05-25  1810  	u32 chan, iio_idx =3D 0, =
status;
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1811  	int ret;
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1812 =20
b76d26d69ecc97 Nuno S=C3=A1         2021-08-11  1813  	/* make sure the dev=
ice is up: start bit (7) is 0 and done bit (6) is 1 */
b76d26d69ecc97 Nuno S=C3=A1         2021-08-11  1814  	ret =3D regmap_read_=
poll_timeout(st->regmap, LTC2983_STATUS_REG, status,
b76d26d69ecc97 Nuno S=C3=A1         2021-08-11  1815  				       LTC2983_ST=
ATUS_UP(status) =3D=3D 1, 25000,
b76d26d69ecc97 Nuno S=C3=A1         2021-08-11  1816  				       25000 * 10=
);
a00838cae079b9 Nuno Sa         2024-06-06  1817  	if (ret)
6b047d099703c9 Liviu Stan      2026-05-25  1818  		return dev_err_probe(dev=
, ret, "Device startup timed out\n");
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1819 =20
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1820  	ret =3D regmap_updat=
e_bits(st->regmap, LTC2983_GLOBAL_CONFIG_REG,
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1821  				 LTC2983_NOTCH_FR=
EQ_MASK,
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1822  				 LTC2983_NOTCH_FR=
EQ(st->filter_notch_freq));
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1823  	if (ret)
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1824  		return ret;
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1825 =20
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1826  	ret =3D regmap_write=
(st->regmap, LTC2983_MUX_CONFIG_REG,
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1827  			   st->mux_delay_c=
onfig);
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1828  	if (ret)
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1829  		return ret;
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1830 =20
6f7cadcf664b04 Cosmin Tanislav 2022-11-03  1831  	if (st->info->has_eeprom =
&& !assign_iio) {
6f7cadcf664b04 Cosmin Tanislav 2022-11-03  1832  		ret =3D ltc2983_eeprom_c=
md(st, LTC2983_EEPROM_READ_CMD,
6f7cadcf664b04 Cosmin Tanislav 2022-11-03  1833  					 LTC2983_EEPROM_READ_=
TIME_MS,
6f7cadcf664b04 Cosmin Tanislav 2022-11-03  1834  					 LTC2983_EEPROM_READ_=
STATUS_REG,
6f7cadcf664b04 Cosmin Tanislav 2022-11-03  1835  					 LTC2983_EEPROM_READ_=
FAILURE_MASK);
6f7cadcf664b04 Cosmin Tanislav 2022-11-03  1836  		if (!ret)
6f7cadcf664b04 Cosmin Tanislav 2022-11-03  1837  			return 0;
6f7cadcf664b04 Cosmin Tanislav 2022-11-03  1838  	}
6f7cadcf664b04 Cosmin Tanislav 2022-11-03  1839 =20
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1840  	for (chan =3D 0; cha=
n < st->num_channels; chan++) {
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1841  		u32 chan_type =3D 0=
, *iio_chan;
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1842 =20
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1843  		ret =3D st->sensors=
[chan]->assign_chan(st, st->sensors[chan]);
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1844  		if (ret)
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1845  			return ret;
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1846  		/*
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1847  		 * The assign_iio f=
lag is necessary for when the device is
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1848  		 * coming out of sl=
eep. In that case, we just need to
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1849  		 * re-configure the=
 device channels.
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1850  		 * We also don't as=
sign iio channels for rsense.
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1851  		 */
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1852  		if (st->sensors[cha=
n]->type =3D=3D LTC2983_SENSOR_SENSE_RESISTOR ||
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1853  		    !assign_iio)
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1854  			continue;
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1855 =20
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1856  		/* assign iio chann=
el */
3dd0c048409e33 Liviu Stan      2026-05-25  1857  		switch (st->sensors[chan=
]->type) {
3dd0c048409e33 Liviu Stan      2026-05-25  1858  		case LTC2983_SENSOR_COPP=
ER_TRACE:
3dd0c048409e33 Liviu Stan      2026-05-25  1859  			if (st->sensors[chan]->=
n_iio_chan =3D=3D 1) {
3dd0c048409e33 Liviu Stan      2026-05-25  1860  				/* sub-ohm copper trac=
es produce only a resistance result */
3dd0c048409e33 Liviu Stan      2026-05-25  1861  				st->iio_chan[iio_idx++=
] =3D
3dd0c048409e33 Liviu Stan      2026-05-25  1862  					LTC2983_CHAN(IIO_RESI=
STANCE, iio_chan_r++, chan);
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1863  			} else {
3dd0c048409e33 Liviu Stan      2026-05-25  1864  				st->iio_chan[iio_idx++=
] =3D
3dd0c048409e33 Liviu Stan      2026-05-25  1865  					LTC2983_CHAN(IIO_TEMP=
, iio_chan_t++, chan);
3dd0c048409e33 Liviu Stan      2026-05-25  1866  				st->iio_chan[iio_idx++=
] =3D
3dd0c048409e33 Liviu Stan      2026-05-25  1867  					LTC2983_CHAN(IIO_RESI=
STANCE, iio_chan_r++, chan);
3dd0c048409e33 Liviu Stan      2026-05-25  1868  			}
3dd0c048409e33 Liviu Stan      2026-05-25  1869  			continue;
3dd0c048409e33 Liviu Stan      2026-05-25  1870  		case LTC2983_SENSOR_LEAK=
_DETECTOR:
3dd0c048409e33 Liviu Stan      2026-05-25  1871  			st->iio_chan[iio_idx++]=
 =3D
3dd0c048409e33 Liviu Stan      2026-05-25  1872  				LTC2983_CHAN(IIO_COVER=
AGE, iio_chan_c++, chan);
3dd0c048409e33 Liviu Stan      2026-05-25  1873  			st->iio_chan[iio_idx++]=
 =3D
3dd0c048409e33 Liviu Stan      2026-05-25  1874  				LTC2983_CHAN(IIO_RESIS=
TANCE, iio_chan_r++, chan);
3dd0c048409e33 Liviu Stan      2026-05-25  1875  			continue;
3dd0c048409e33 Liviu Stan      2026-05-25  1876  		case LTC2983_SENSOR_DIRE=
CT_ADC:
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1877  			chan_type =3D IIO_=
VOLTAGE;
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1878  			iio_chan =3D &iio_=
chan_v;
3dd0c048409e33 Liviu Stan      2026-05-25  1879  			break;
3dd0c048409e33 Liviu Stan      2026-05-25  1880  		default:
3dd0c048409e33 Liviu Stan      2026-05-25  1881  			chan_type =3D IIO_TEMP;
3dd0c048409e33 Liviu Stan      2026-05-25  1882  			iio_chan =3D &iio_chan_=
t;
3dd0c048409e33 Liviu Stan      2026-05-25  1883  			break;
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1884  		}
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1885 =20
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1886  		/*
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1887  		 * add chan as the =
iio .address so that, we can directly
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1888  		 * reference the se=
nsor given the iio_chan_spec
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1889  		 */
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1890  		st->iio_chan[iio_id=
x++] =3D LTC2983_CHAN(chan_type, (*iio_chan)++,
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1891  						       chan);
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1892  	}
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1893 =20
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1894  	return 0;
f110f3188e5639 Nuno S=C3=A1         2019-10-11 @1895  }
f110f3188e5639 Nuno S=C3=A1         2019-10-11  1896 =20

:::::: The code at line 1895 was first introduced by commit
:::::: f110f3188e5639c81c457b2b831d40dfe3891bdb iio: temperature: Add suppo=
rt for LTC2983

:::::: TO: Nuno S=C3=A1 <nuno.sa@analog.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
