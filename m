Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025951;
	b=ZgWzM832D7ZYnj1SJ/ouJbgox1FQDTpAQpyVCgyaqbesWTzFLlyiuUbb+WRPxJHnMwhA
	 fYpKmswEvEwwfTxoIINvtrrO/WBlSTc0VViUD8TABfSlQxCqsx8TqsdX5Al3N9PaQ/5TT
	 RBoyfK2o9rQ5uUNwFQS8Z5hR2CoFZHN0gUZKWcZ+m9jWj7UiM5Rf45zCW8Wpza9uYpHaV
	 fW9PqME/AFYkzeftsxTXEpy8T436jRVsRhR+ND8hzqeSVC87RdTc15ExR44YWi4+/vrrf
	 WqMkFfIgmoiMAlbVR+fa25Bu9yiqMQujOZX3Ju2QKi55ZSjKTD4+g9Qyo5iT5T4w6nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025951;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gRSKV6mkRNXym/QuyJGkrsvxD/gyct8zVn3i0QXwaGo=;
	b=nvhEXn9hGqGW5FeLAv+WM3HH16CqTEgd/THKGaTa7kRKJeug+TqOZ/YXwYh7g2tA0zVA
	 su/BL57sKyslMsVoTqJX45yNuFvUXyfZ+gmuRT2WmSYtA8nbC+3bdy+pmORWztVzJInri
	 O+5oAeoOxco4tltL/Ml5kMYHqzP+cXZ69WTKkehy4+xwRLWoDIxuPhCSF4GBYzsZ50XOX
	 /9xzgqKdUeppSRWNOPuT56E4mPdYG4fImfcKZi8hFt6EAHPGr+8r6Q7+YYzKtzKLR9eaq
	 PsVNhq4EUGJj2d6ZfPc8yfZ61mMenWNYlfXufkd5YpQAICzhrCFJUBmN1HIImCPQfDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SQNaR3XX;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6133E606A32C;
	Sat,  7 Nov 2026 04:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6133E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SQNaR3XX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794025950; x=1825561950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1T53sIhZg9iKg5N1Tv8ETyEt+UFopFJW9SxlBsWHluY=;
  b=SQNaR3XXF6O6hZ3nvlCsZzKrx29gzVe4Q6GeXwGd3o8w966E/KCvYKcu
   jVpRreUhssLG35YgbT2kcyS6Z5aPioxbhV818pK0qKjOSMSTUDQOACwL8
   l0zLfblPNRcI+6MoTGIiZ6DQG0DxZJ+exIZ+uptHsdW5GzCaOTTh9C0uU
   53Gd515ETdLA5yL91GrTDZuSfVaOQh5y19OxNoTRwpBucLGHrbhCl41mD
   hwQiELDQUXuaTW+UtPFaldSSsJ2NIMnBZrnrhEBPUB7G3Z029sXO54/JO
   6Mc0zjveAq0WGsQX4XNc+KrcvkStQvEPxqEiE1DCBvzRZX+2CnlbCNGZe
   A==;
X-CSE-ConnectionGUID: ercGPOUsSGKc95JiUoiong==
X-CSE-MsgGUID: Uc4c/JmgSFK/KFn/vkPj9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2834053"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2834053"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 20:32:29 -0800
X-CSE-ConnectionGUID: lN9+vu0aS7mdh3U882ioMg==
X-CSE-MsgGUID: uafI4vHpReeRikmetBX/xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="9289081"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 06 Nov 2026 20:32:26 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPY6J-00000000qKV-0DH4;
	Sat, 07 Nov 2026 04:32:23 +0000
Date: Sat, 7 Nov 2026 12:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: Syed Saba Kareem <syed.sabakareem@amd.com>, broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Sunil-kumar.Dommati@amd.com,
	vijendar.mukunda@amd.com, Mario.Limonciello@amd.com,
	venkataprasad.potturu@amd.com,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	"open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] ASoC: amd: acp: add Cirrus SoundWire configs for
 ACP7.F
Message-ID: <202611071205.FSWUFvJs-lkp@intel.com>
References: <20261106191627.1590542-2-syed.sabakareem@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106191627.1590542-2-syed.sabakareem@amd.com>

Hi Syed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[cannot apply to linus/master v7.4-rc1 next-20261105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Syed-Saba-Kareem/ASoC-amd-acp-add-SoundWire-speaker-quirks-for-Dell-platforms/20261107-004611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20261106191627.1590542-2-syed.sabakareem%40amd.com
patch subject: [PATCH 1/2] ASoC: amd: acp: add Cirrus SoundWire configs for ACP7.F
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20261107/202611071205.FSWUFvJs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071205.FSWUFvJs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611071205.FSWUFvJs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/amd/acp/amd-acp7x-acpi-match.c:394:43: warning: 'acp7x_cs35l63x4_l0u0246' defined but not used [-Wunused-const-variable=]
     394 | static const struct snd_soc_acpi_link_adr acp7x_cs35l63x4_l0u0246[] = {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~


vim +/acp7x_cs35l63x4_l0u0246 +394 sound/soc/amd/acp/amd-acp7x-acpi-match.c

   393	
 > 394	static const struct snd_soc_acpi_link_adr acp7x_cs35l63x4_l0u0246[] = {
   395		{
   396			.mask = BIT(0),
   397			.num_adr = ARRAY_SIZE(cs35l63x4_l0u0246_adr),
   398			.adr_d = cs35l63x4_l0u0246_adr,
   399		},
   400		{}
   401	};
   402	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
