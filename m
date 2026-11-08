Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794155054;
	b=yvfJcSFsBKWJu25Ee64lg40XXxhYGJ6KQ0wvOqsmsDULM3REfqdTmEuC8BlAOVo3NR5v
	 +/0mpQtIadhhirBJCggmOXLsh/h+5p6E1l/baXwpbviH6LR/icW/yud+Oj0ovSpKTzTdO
	 TRlfBXwSwih9zdACbB+XHc8blZQpg+igjnTfgPticQFRqqfwh1eZJG3hE7lq9GTtDXJWm
	 kxc2oj2vOYUoQQD+50met3TH7TI9WEf0OKr/7RlHLaLeWwzIHmfU/TZKIUb8OqIykTQ+t
	 PuIPDiQOtU1zYZCinnKTxrVCRk8afttH+wFsDIknUr52q1GJdv8FfClH2G1+6zNZV8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794155054;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=UngVRw8GQWYdjyr+KULccPn5n4fj0MKRALr0nR9QvcY=;
	b=WXyIeDAwZAygvgjYUIZuorWfktMVERF9S331qmobp9Y1IqKQ0AFsUCO3vQnnG6De8LKL
	 r3M8t83MW3Z1F3frmtP6AkeyHiTjBflXh7fFPqbWQ7AyyFuiZVn80RN9W/1MsBuhoVDO3
	 o5lC4GKP6/+pygnuFZ/AoKvyDs7w87N70iKic62l2qPed4c+BXpyzYtzNXhILalPuP/oC
	 13IM/+5H5YF4EzixcX4Z8YfncTfW20djwEaSPRH6rFy/AMCor7uqh50SBKrIbOIEc1xNV
	 xBJ2+q9cTO1Hxy4gnzaxZj1yoW5PqyKvqYQYpQ/zwJ0YnXcegesHxd8V3neZ4hXcCKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WUS2mJSK;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B89606A31C;
	Sun,  8 Nov 2026 16:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87B89606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WUS2mJSK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794155053; x=1825691053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2z7+Kqr4x9FWONKtsCoDgKGuvbSo1KMrBeyVW4Th+1c=;
  b=WUS2mJSK0ZAJ7wmEywlMdYguLxfVZAEvcmJ4iJP/jdLEgwT24ASNjxDW
   yqHrcSn5K2HfiR9fxRtiuR37Kuvzt2ZSoj+PB6kn0Js+Mz7KQAE9fNPgM
   nrgO1Y5unUSq9zCd8X/nn9ZLUkbGwV274AtA/oAa/XYaOUByXGZ4fsGPg
   arWD6+LJoCTmCYjtJYv+8nNlTrxYvpHEC1Oq1egjXZowMLcTyTQZl7BK9
   BU77Yo6UbxcDDG+x7QeeRS+mX9fRrDzlqMe2vx/5Oh5rpkNSiEGTwzSb3
   0ndr2bqHHPPu9/8z+1KeXVgNEHl1oUcBQmxhKpq1e2hRP5dpFMwR4DYiC
   A==;
X-CSE-ConnectionGUID: /zG9wqsNQQuFy+75uawj4A==
X-CSE-MsgGUID: dSCDuU4ER9e3Jk+mroZ6jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2787682"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2787682"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 08:24:13 -0800
X-CSE-ConnectionGUID: dK0PerLJSsyMfLXnUiUvhw==
X-CSE-MsgGUID: TPNNuuA8TkeKE0LZmUiCnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7724291"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Nov 2026 08:24:08 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ5gb-00000000tAN-0ZRf;
	Sun, 08 Nov 2026 16:24:05 +0000
Date: Mon, 9 Nov 2026 00:23:47 +0800
From: kernel test robot <lkp@intel.com>
To: Syed Saba Kareem <syed.sabakareem@amd.com>, broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Sunil-kumar.Dommati@amd.com,
	vijendar.mukunda@amd.com, Mario.Limonciello@amd.com,
	venkataprasad.potturu@amd.com,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Siva Subramanian Ravi Saravanan <sravisar@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/6] ASoC: soc-acpi: move common function topology
 helpers
Message-ID: <202611090051.8jaT0pb0-lkp@intel.com>
References: <20261107192744.2027264-4-syed.sabakareem@amd.com>
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
In-Reply-To: <20261107192744.2027264-4-syed.sabakareem@amd.com>

Hi Syed,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[cannot apply to linus/master v7.4-rc1 next-20261105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Syed-Saba-Kareem/ASoC-amd-acp-add-SoundWire-speaker-quirks-for-Dell-platforms/20261108-005658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20261107192744.2027264-4-syed.sabakareem%40amd.com
patch subject: [PATCH v2 3/6] ASoC: soc-acpi: move common function topology helpers
config: csky-randconfig-1001-20261108 (https://download.01.org/0day-ci/archive/20261109/202611090051.8jaT0pb0-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090051.8jaT0pb0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090051.8jaT0pb0-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: sound/soc/intel/common/snd-soc-acpi-intel-match.ko: symbol 'snd_soc_acpi_get_platform_name' undefined!
>> ERROR: modpost: sound/soc/intel/common/snd-soc-acpi-intel-match.ko: symbol 'snd_soc_acpi_tplg_files_exist' undefined!
>> ERROR: modpost: sound/soc/intel/common/snd-soc-acpi-intel-match.ko: symbol 'snd_soc_acpi_get_tplg_filename' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
