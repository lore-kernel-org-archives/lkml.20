Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC85C3CA487
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789165769; cv=none; b=qhQQrjqAyRF8Tfgoq4gP0bWvWxltAIbEk79S6GshR0TuFirJY33KgawLn0Ulxv6VJnsYp9cyUmiriao48DlCI5SSLwPwH5t1qrVp168heq9M1fAi3mLe9nkdVW3kgKtfcjX2QlpXpqLqcBT5z0tyNG4o6c4dUjbsBfkVueR0XMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789165769; c=relaxed/simple;
	bh=KFmdk1Z3P9BN3XTveb+D4hxGPL2zW0JZzDNYhIlyC2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qmLz8tKXz3aMxPPEyg4m/ZBFYRs44WnM1J9B0PxKeWpOfrp/xycqdhHw8mv3Mky1zdEhdGTjhfx8Px1dmHPnD5j2kWos2eHER3/kWworb6aPH8juuYUe52f+EYreZw8B4fg9biNRTM4UYqT7BrfDKNVjKKy8H2nmraQHVD3q/mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBPN5i4I; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBPN5i4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789165767; x=1820701767;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KFmdk1Z3P9BN3XTveb+D4hxGPL2zW0JZzDNYhIlyC2M=;
  b=GBPN5i4ISxHLrHYV9kmEEY009cuLj7aNwzPNo/+VXfPxVDOTSXseVNB/
   4QNM/sd8TrT+t+im6F1KwbB8J837/DG3SSfew5B3XgNfKCe79lRYol/f2
   Oo5itjWeS+SEiv/HJnyd7XDza9OJ+yxiWJyNnzwSP7o3buiEwMXXzcINr
   gTwkTUr7rseyK2DUzI+3HaiGYKKds7QgmAXfqNdoKepWFgG27tjcWguiY
   nFLulp6Hm2Eeg0YQ8YCmjdaiQXzJfJwSf4LDp9NGVw4XvLEujm7jsnJ1s
   KK8CsaTYZKNEfSvMG230fNIoEf87JXXjm1BEkaHf/4jrDwHIfbLcnfzRT
   w==;
X-CSE-ConnectionGUID: zXrtI85/Rp6fCKCZAFL8zQ==
X-CSE-MsgGUID: Z+b3JAQrSMuSKMd/sEb0hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="112403831"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="112403831"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 15:29:26 -0700
X-CSE-ConnectionGUID: 3xuPTaxITjiUkct4Ld1DDA==
X-CSE-MsgGUID: 6iI1TSLqQwexBQcMgCBZ/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="268761748"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Sep 2026 15:29:24 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x59kI-000000000t9-0fq1;
	Fri, 11 Sep 2026 22:29:22 +0000
Date: Sat, 12 Sep 2026 00:29:03 +0200
From: kernel test robot <lkp@intel.com>
To: Liviu Stan <liviu.stan@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>
Subject: drivers/iio/temperature/ltc2983.c:549:29: warning: 'strcmp'
 of a string of length 24 and an array of size 22 evaluates to nonzero
Message-ID: <202609120045.OxEsKLIn-lkp@intel.com>
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
head:   827751b699b79a6e569983359c02dce67f81b94c
commit: 3dd0c048409e335320418c632966f149be628fd4 iio: temperature: ltc2983:=
 Add support for ADT7604
date:   3 months ago
config: s390-randconfig-r052-20260911 (https://download.01.org/0day-ci/arch=
ive/20260912/202609120045.OxEsKLIn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260912/202609120045.OxEsKLIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 3dd0c048409e ("iio: temperature: ltc2983: Add support for ADT7604")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609120045.OxEsKLIn-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In function '__ltc2983_custom_sensor_new',
       inlined from 'ltc2983_thermistor_new' at drivers/iio/temperature/ltc=
2983.c:1069:24:
>> drivers/iio/temperature/ltc2983.c:549:29: warning: 'strcmp' of a string =
of length 24 and an array of size 22 evaluates to nonzero [-Wstring-compare]
     549 |    if ((index % 2) !=3D 0 && !strcmp(propname, "adi,custom-leak-=
detector"))
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~


vim +/strcmp +549 drivers/iio/temperature/ltc2983.c

   472=09
   473	static struct ltc2983_custom_sensor *
   474	__ltc2983_custom_sensor_new(struct ltc2983_data *st, const struct fw=
node_handle *fn,
   475				    const char *propname, const bool is_steinhart,
   476				    const u32 resolution, const bool has_signed)
   477	{
   478		struct ltc2983_custom_sensor *new_custom;
   479		struct device *dev =3D &st->spi->dev;
   480		/*
   481		 * For custom steinhart, the full u32 is taken. For all the others
   482		 * the MSB is discarded.
   483		 */
   484		const u8 n_size =3D is_steinhart ? 4 : 3;
   485		u8 index, n_entries;
   486		int ret;
   487=09
   488		if (is_steinhart)
   489			n_entries =3D fwnode_property_count_u32(fn, propname);
   490		else
   491			n_entries =3D fwnode_property_count_u64(fn, propname);
   492		/* n_entries must be an even number */
   493		if (!n_entries || (n_entries % 2) !=3D 0)
   494			return dev_err_ptr_probe(dev, -EINVAL,
   495						 "Number of entries either 0 or not even\n");
   496=09
   497		new_custom =3D devm_kzalloc(dev, sizeof(*new_custom), GFP_KERNEL);
   498		if (!new_custom)
   499			return ERR_PTR(-ENOMEM);
   500=09
   501		new_custom->size =3D n_entries * n_size;
   502		/* check Steinhart size */
   503		if (is_steinhart && new_custom->size !=3D LTC2983_CUSTOM_STEINHART_=
SIZE)
   504			return dev_err_ptr_probe(dev, -EINVAL,
   505						 "Steinhart sensors size(%zu) must be %u\n",
   506						 new_custom->size, LTC2983_CUSTOM_STEINHART_SIZE);
   507=09
   508		/* Check space on the table. */
   509		if (st->custom_table_size + new_custom->size >
   510		    (LTC2983_CUST_SENS_TBL_END_REG - LTC2983_CUST_SENS_TBL_START_RE=
G) + 1)
   511			return dev_err_ptr_probe(dev, -EINVAL,
   512						 "No space left(%d) for new custom sensor(%zu)\n",
   513						 st->custom_table_size, new_custom->size);
   514=09
   515		/* allocate the table */
   516		if (is_steinhart)
   517			new_custom->table =3D devm_kcalloc(dev, n_entries, sizeof(u32), GF=
P_KERNEL);
   518		else
   519			new_custom->table =3D devm_kcalloc(dev, n_entries, sizeof(u64), GF=
P_KERNEL);
   520		if (!new_custom->table)
   521			return ERR_PTR(-ENOMEM);
   522=09
   523		/*
   524		 * Steinhart sensors are configured with raw values in the firmware
   525		 * node. For the other sensors we must convert the value to raw.
   526		 * The odd index's correspond to temperatures and always have 1/1024
   527		 * of resolution. Temperatures also come in Kelvin, so signed values
   528		 * are not possible.
   529		 */
   530		if (is_steinhart) {
   531			ret =3D fwnode_property_read_u32_array(fn, propname, new_custom->t=
able, n_entries);
   532			if (ret < 0)
   533				return ERR_PTR(ret);
   534=09
   535			cpu_to_be32_array(new_custom->table, new_custom->table, n_entries);
   536		} else {
   537			ret =3D fwnode_property_read_u64_array(fn, propname, new_custom->t=
able, n_entries);
   538			if (ret < 0)
   539				return ERR_PTR(ret);
   540=09
   541			for (index =3D 0; index < n_entries; index++) {
   542				u64 temp =3D ((u64 *)new_custom->table)[index];
   543=09
   544				/*
   545				 * Users specify plain coverage percentage (0-100). Convert
   546				 * to =C2=B5K so __convert_to_raw() produces the correct hardware
   547				 * encoding: P + 273.15 K.
   548				 */
 > 549				if ((index % 2) !=3D 0 && !strcmp(propname, "adi,custom-leak-dete=
ctor"))
   550					temp =3D temp * 1000000 + 273150000;
   551=09
   552				if ((index % 2) !=3D 0)
   553					temp =3D __convert_to_raw(temp, 1024);
   554				else if (has_signed && (s64)temp < 0)
   555					temp =3D __convert_to_raw_sign(temp, resolution);
   556				else
   557					temp =3D __convert_to_raw(temp, resolution);
   558=09
   559				put_unaligned_be24(temp, new_custom->table + index * 3);
   560			}
   561		}
   562=09
   563		new_custom->is_steinhart =3D is_steinhart;
   564		/*
   565		 * This is done to first add all the steinhart sensors to the table,
   566		 * in order to maximize the table usage. If we mix adding steinhart
   567		 * with the other sensors, we might have to do some roundup to make
   568		 * sure that sensor_addr - 0x250(start address) is a multiple of 4
   569		 * (for steinhart), and a multiple of 6 for all the other sensors.
   570		 * Since we have const 24 bytes for steinhart sensors and 24 is
   571		 * also a multiple of 6, we guarantee that the first non-steinhart
   572		 * sensor will sit in a correct address without the need of filling
   573		 * addresses.
   574		 */
   575		if (is_steinhart) {
   576			new_custom->offset =3D st->custom_table_size /
   577						LTC2983_CUSTOM_STEINHART_ENTRY_SZ;
   578			st->custom_table_size +=3D new_custom->size;
   579		} else {
   580			/* mark as unset. This is checked later on the assign phase */
   581			new_custom->offset =3D -1;
   582		}
   583=09
   584		return new_custom;
   585	}
   586=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
