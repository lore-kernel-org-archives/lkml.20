Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86B13E00B4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370540; cv=none; b=Ecas8hoVwZ0G+SYQ7RoIE8cpTR3FLU8wndzs9d/9H5omL38pQEWI3KOi5+Hg+v/yk6i22pXj+dLm1qjleUGP6Q/gVIPXT6r85v0gdi5uzj0dyAQ2dXmXCbEAyrKmYbM6MoxYm6O9k4TGu9H4mipLnP9u1MI3eHOT4Qm1cqKccOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370540; c=relaxed/simple;
	bh=MKYpkT5phzkURIH63z31Qlx4z7zapfNSyu4VEXLdRXg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VQHP/C9n8NERdGWcBXUDFuEq1+j59UT5q5XD87YEhNA4mg9kBEir6KiXs0MsZvH0ykS3QlgO5q1ErcY72wwXmY6CsltGcI28t2ZYMHdxVBRNYzwoogXT+bnfU4tVoFr/vGsLtH2pQeZiuQUK00GSI1vpF/S4MG14phC+lXBVOSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DG6bFhDv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DG6bFhDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790370539; x=1821906539;
  h=date:from:to:cc:subject:message-id;
  bh=MKYpkT5phzkURIH63z31Qlx4z7zapfNSyu4VEXLdRXg=;
  b=DG6bFhDvA24lcxH8vtPGw2YEG7F2imEECNII4W2HCheW21G3kGpx8hdl
   PdzHxCXK2AvXsxPjKdKis13BXwTJiIa6nAdHvHOsoFDsdNoV8bM3qJ+Ou
   LDiYhUYIdTXf9M25L3xWMZRK+gmsfilnuvJ4SR+oX+FHowepmdbiHmfX8
   Nk5lUg94Cth2bJbltOmyql6IyFWzWvwrcQBLqYxR6gzxRpvQcfuyAn1sQ
   I8OOgMyJ2YCQkE5kdu7iADLvCoh/kiB7+OIfa2M8PvztEtgwh4Ut+XDMm
   M1o6A1u6ps+0N+6pz8+SdqUUwcweKuarmT/0VJhDaflHOyQO5eEjvHS4w
   A==;
X-CSE-ConnectionGUID: juzbaIbiTnqzklSoSzQ9Aw==
X-CSE-MsgGUID: nW1NaMnhQIy/Ec+uMK4iAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90289542"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90289542"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 14:08:58 -0700
X-CSE-ConnectionGUID: +BSOF8bdRrGmqNbjxXJ2WA==
X-CSE-MsgGUID: VvsOS+QTSSi7/kLLXEvGSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="302363053"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 25 Sep 2026 14:08:57 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xADA7-000000000tP-04N8;
	Fri, 25 Sep 2026 21:08:55 +0000
Date: Fri, 25 Sep 2026 23:07:21 +0200
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: drivers/regulator/mt6363-regulator.c:366:2-3: Unneeded
 semicolon
Message-ID: <202609252049.3VHQla9a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   165768bb70265b5c38cf0b73fafd75be235f8b14
commit: 3c36965df80801344850388592e95033eceea05b regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
date:   11 months ago
config: i386-randconfig-2100-20260925 (https://download.01.org/0day-ci/archive/20260925/202609252049.3VHQla9a-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252049.3VHQla9a-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/regulator/mt6363-regulator.c:366:2-3: Unneeded semicolon
   drivers/regulator/mt6363-regulator.c:843:2-3: Unneeded semicolon

vim +366 drivers/regulator/mt6363-regulator.c

   348	
   349	static unsigned int mt6363_regulator_get_mode(struct regulator_dev *rdev)
   350	{
   351		struct mt6363_regulator_info *info = rdev_get_drvdata(rdev);
   352		unsigned int val;
   353		int ret;
   354	
   355		if (info->modeset_reg) {
   356			ret = regmap_read(rdev->regmap, info->modeset_reg, &val);
   357			if (ret) {
   358				dev_err(&rdev->dev, "Failed to get mt6363 mode: %d\n", ret);
   359				return ret;
   360			}
   361	
   362			if (val & info->modeset_mask)
   363				return REGULATOR_MODE_FAST;
   364		} else {
   365			val = 0;
 > 366		};
   367	
   368		ret = regmap_read(rdev->regmap, info->hw_lp_mode_reg, &val);
   369		val &= info->hw_lp_mode_mask;
   370	
   371		if (ret) {
   372			dev_err(&rdev->dev, "Failed to get lp mode: %d\n", ret);
   373			return ret;
   374		}
   375	
   376		if (val)
   377			return REGULATOR_MODE_IDLE;
   378		else
   379			return REGULATOR_MODE_NORMAL;
   380	}
   381	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
