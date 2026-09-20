Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C6628F5
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789894923; cv=none; b=kMXedYvri+IMJ9d7UX+bAIpm1Bp5pIdj7cvsqmX9p086+VchTIZWQlQiqrSsnjP/6p+xJywNKKxLIJBAtFbNfEMwkmViii4QxbUJSFNhCQZFbTY96HEU12y/Brkb17akvNLhP9qde15+IIjJugJuZyjnhA2/IVy00GhVsHIxaR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789894923; c=relaxed/simple;
	bh=FMByguiepzkzYRinbZ4+2CJcC0VTS7MBU34HXdEprL4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KUGEk2ovIMwm6YebnhoVLkkH6KwkVXJkIeqviaG6zU4+tG1WZFt/CB6B4XhGK1HNR+AS63AVYL9s476WgAOhpO3hvJDDMpjziZlf4AhB7whGP0G0j3PhxHKKScvpbw1Jkn77SxBc4+GLDga9Lb8SR8caPiH329cs7RdxUDw8nJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HmbnUZel; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HmbnUZel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789894921; x=1821430921;
  h=date:from:to:cc:subject:message-id;
  bh=FMByguiepzkzYRinbZ4+2CJcC0VTS7MBU34HXdEprL4=;
  b=HmbnUZelFn8GRqLoLserqJvg73Tbw6nnyZM8mjOjA57PJGT3A1bcsgkN
   Xi9x9upZ4ddBwYqisGoET/Yb/o968wuzWVvAPAX+a3QJ49vfjOIeQQ2ur
   N86kFrzFiGNduXb83RwduOixJY4zTYDn14zpxsOoTZS29D8Cp/tbUyCu8
   Mka5/b5xeTCugb9oGmO2Y0RRX/fWhn1qBMkNrroUbGfNybFv+1BHs3hz6
   623E5F0Ind1nJDYhvUVj4cxUo76VaeeBOshPu+WWeCOmKZwOBYrTNJQRc
   anVnp3CymMT0fGuV0Bbq7YvrVBM4qL3iqKw9r/2O3aHGoZIUif0lPaRbf
   Q==;
X-CSE-ConnectionGUID: SwuMrTThS+2LzLC0YSROKQ==
X-CSE-MsgGUID: vRVx9aUzQQuMc29OAP4gEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="908703"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="908703"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 02:02:00 -0700
X-CSE-ConnectionGUID: Pu4igwGSR2KyVZoO8SQZSA==
X-CSE-MsgGUID: trDWN1MTQYeeypnym5Ugyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="3275220"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 20 Sep 2026 02:01:59 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8DQp-00000000CCP-3WMS;
	Sun, 20 Sep 2026 09:01:55 +0000
Date: Sun, 20 Sep 2026 17:01:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@kernel.org>
Subject: drivers/media/i2c/max9286.c:1206:undefined reference to
 `gpiochip_get_data'
Message-ID: <202609201612.LAlHBtN0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: 2fc030f9ff287efc4510f4ae5efee0f23e64b608 media: i2c: drop unneeded dependencies on OF_GPIO
date:   5 months ago
config: x86_64-randconfig-1006-20260920 (https://download.01.org/0day-ci/archive/20260920/202609201612.LAlHBtN0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609201612.LAlHBtN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2fc030f9ff28 ("media: i2c: drop unneeded dependencies on OF_GPIO")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609201612.LAlHBtN0-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/i2c/max9286.o: in function `max9286_gpiochip_get':
>> drivers/media/i2c/max9286.c:1206:(.text+0x1318): undefined reference to `gpiochip_get_data'
   ld: drivers/media/i2c/max9286.o: in function `max9286_gpiochip_set':
   drivers/media/i2c/max9286.c:1199:(.text+0x13dc): undefined reference to `gpiochip_get_data'
   ld: drivers/media/i2c/max9286.o: in function `max9286_register_gpio':
>> drivers/media/i2c/max9286.c:1227:(.text+0x47c5): undefined reference to `devm_gpiochip_add_data_with_key'


vim +1206 drivers/media/i2c/max9286.c

c9352df7139bc5 Jacopo Mondi        2021-12-17  1203  
c9352df7139bc5 Jacopo Mondi        2021-12-17  1204  static int max9286_gpiochip_get(struct gpio_chip *chip, unsigned int offset)
66d8c9d2422da2 Kieran Bingham      2020-06-12  1205  {
66d8c9d2422da2 Kieran Bingham      2020-06-12 @1206  	struct max9286_priv *priv = gpiochip_get_data(chip);
66d8c9d2422da2 Kieran Bingham      2020-06-12  1207  
10c85e00f35689 Dmitry Torokhov     2026-02-18  1208  	return !!(priv->gpio_state & BIT(offset));
66d8c9d2422da2 Kieran Bingham      2020-06-12  1209  }
66d8c9d2422da2 Kieran Bingham      2020-06-12  1210  
66d8c9d2422da2 Kieran Bingham      2020-06-12  1211  static int max9286_register_gpio(struct max9286_priv *priv)
66d8c9d2422da2 Kieran Bingham      2020-06-12  1212  {
66d8c9d2422da2 Kieran Bingham      2020-06-12  1213  	struct device *dev = &priv->client->dev;
66d8c9d2422da2 Kieran Bingham      2020-06-12  1214  	struct gpio_chip *gpio = &priv->gpio;
66d8c9d2422da2 Kieran Bingham      2020-06-12  1215  	int ret;
66d8c9d2422da2 Kieran Bingham      2020-06-12  1216  
66d8c9d2422da2 Kieran Bingham      2020-06-12  1217  	/* Configure the GPIO */
66d8c9d2422da2 Kieran Bingham      2020-06-12  1218  	gpio->label = dev_name(dev);
66d8c9d2422da2 Kieran Bingham      2020-06-12  1219  	gpio->parent = dev;
66d8c9d2422da2 Kieran Bingham      2020-06-12  1220  	gpio->owner = THIS_MODULE;
66d8c9d2422da2 Kieran Bingham      2020-06-12  1221  	gpio->ngpio = 2;
66d8c9d2422da2 Kieran Bingham      2020-06-12  1222  	gpio->base = -1;
d9d87d90cc0b10 Bartosz Golaszewski 2025-07-17  1223  	gpio->set = max9286_gpiochip_set;
c9352df7139bc5 Jacopo Mondi        2021-12-17  1224  	gpio->get = max9286_gpiochip_get;
66d8c9d2422da2 Kieran Bingham      2020-06-12  1225  	gpio->can_sleep = true;
66d8c9d2422da2 Kieran Bingham      2020-06-12  1226  
c9352df7139bc5 Jacopo Mondi        2021-12-17 @1227  	ret = devm_gpiochip_add_data(dev, gpio, priv);
c9352df7139bc5 Jacopo Mondi        2021-12-17  1228  	if (ret)
c9352df7139bc5 Jacopo Mondi        2021-12-17  1229  		dev_err(dev, "Unable to create gpio_chip\n");
c9352df7139bc5 Jacopo Mondi        2021-12-17  1230  
c9352df7139bc5 Jacopo Mondi        2021-12-17  1231  	return ret;
c9352df7139bc5 Jacopo Mondi        2021-12-17  1232  }
c9352df7139bc5 Jacopo Mondi        2021-12-17  1233  

:::::: The code at line 1206 was first introduced by commit
:::::: 66d8c9d2422da21ed41f75c03ba0685987b65fe0 media: i2c: Add MAX9286 driver

:::::: TO: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
