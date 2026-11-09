Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219962;
	b=D5PJQPVV0H0I5RXaSYf5PH+8V4WJjtNvYIG69b8CE3ewxyO6VaR2do8kt8pYpWPKUmVv
	 hRAxzs0mcUzFg444OFO7IlyZ3IabwWdVi3kJ6ZTY2TQZUMCNb3smDgVGaAfopxf5QyL2D
	 0Q/eOOmI2rwi9xbuFbZSLZu74/lKRzcNfz7MhJWkJciLKqWOvXVhw1ovRvUmZtEjCor92
	 ttJSCf3/MxyGt8P8EwdUhF1+AkaHh/8hRjTByHksGJ59P541PFjM1f21b17Gtc18hQg6j
	 VW1fvjM9TnJ+Lpc/jbWiNbU+YL/vF0k9FKO7SrFNqSsgbFiu6TcdqP/A4LOQloBxQ4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219962;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=uAYylga/6dqg9lHD3Vdh/9mixkw0gaI4seUq+mB8lOw=;
	b=1Ss4ouCRCYmMPgGhfG6Al1+fuc2lCijq4RhePa/hjwud5bPio7OEkBLwctDSFvYegku2
	 ueQ8e2QfFV2b8BbNd8iNrd33cz3TyOdzHEDUqwrjuYUMAyBly5QTpk8OepnAD/uMSRXke
	 RELCXKLLkZgPPj78YSnqECHzZp6ko+RX0j/XrE75+sF7TtZWKcPz+TybWZ27na+aQHw24
	 IklS72fvPGDEouMvFtXXHnM4Rd5k8hEzf12rQWGjI1AGgu6vm10v+V7wLyAlu5hOdsCr5
	 cRmIissrHgrP5jmfBKpSIxM5/EkeA4PAUZqtAZnUvuORHul0M5H4IlUQ89m4UDi3gpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FBXpmJM+;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFA7606A322;
	Mon,  9 Nov 2026 10:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BFA7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FBXpmJM+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794219961; x=1825755961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wZAgkrCqpZY89StHkZpGHI9uL51IbXkKoxUcszLReIg=;
  b=FBXpmJM+sB6KMbXaH544q9Z+rLH0QwEXVfk08lAq5njkcp85gRR32OHe
   K12sNYAXShvd3xVQM0wd33AVKrHiVMgL/gKsGdrGvzup7Vlk6XCmRPtRC
   XAnzkZ//s2egs3lV24afpzxQsN+mgx7vdPgo4KZI3GFNJ/6OvnIL8UXuz
   7LJXeRJ0jn6Ya+YLuQz/vEd10Rgwy4Z18JbVD1EwwZIpkeLeMxg5PafHE
   IMERRA/61gTXHFKuaVQNYKc/3dDPWgqzWky9SAg+P38QJ2HQdqCvkOv8s
   t0qSa6ac1nGmHGeZgxe1SHnVkO0M4/YrH/rALvrkG85qqF4Pw1szDWkIs
   w==;
X-CSE-ConnectionGUID: IuxyMQutTRaQEQHncdWjsA==
X-CSE-MsgGUID: vHcgl5HdTw2p++s6QX0Psw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2977710"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2977710"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 02:26:00 -0800
X-CSE-ConnectionGUID: BKWDyFRaQdGW/Pc1ghWc4g==
X-CSE-MsgGUID: 61ARG1fcRcGHnD1LWexdOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7993579"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Nov 2026 02:25:55 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQMZT-00000000uKJ-3T8v;
	Mon, 09 Nov 2026 10:25:51 +0000
Date: Mon, 9 Nov 2026 18:25:04 +0800
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
Subject: Re: [PATCH v3 3/6] ASoC: soc-acpi: move common function topology
 helpers
Message-ID: <202611091824.N70ZD8Wt-lkp@intel.com>
References: <20261108193119.2308421-4-syed.sabakareem@amd.com>
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
In-Reply-To: <20261108193119.2308421-4-syed.sabakareem@amd.com>

Hi Syed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[cannot apply to linus/master v7.4-rc2 next-20261105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Syed-Saba-Kareem/ASoC-amd-acp-add-SoundWire-speaker-quirks-for-Dell-platforms/20261109-010030
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20261108193119.2308421-4-syed.sabakareem%40amd.com
patch subject: [PATCH v3 3/6] ASoC: soc-acpi: move common function topology helpers
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261109/202611091824.N70ZD8Wt-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091824.N70ZD8Wt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091824.N70ZD8Wt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/soc-acpi.c:36:1: error: redefinition of 'snd_soc_acpi_find_machine'
      36 | snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/soc-acpi.c:11:
   include/sound/soc-acpi.h:40:1: note: previous definition of 'snd_soc_acpi_find_machine' with type 'struct snd_soc_acpi_mach *(struct snd_soc_acpi_mach *)'
      40 | snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-acpi.c: In function 'snd_soc_acpi_find_package':
   sound/soc/soc-acpi.c:60:36: error: implicit declaration of function 'acpi_fetch_acpi_dev'; did you mean 'acpi_match_acpi_device'? [-Werror=implicit-function-declaration]
      60 |         struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
         |                                    ^~~~~~~~~~~~~~~~~~~
         |                                    acpi_match_acpi_device
>> sound/soc/soc-acpi.c:60:36: warning: initialization of 'struct acpi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/soc-acpi.c:66:25: error: invalid use of undefined type 'struct acpi_device'
      66 |         if (adev && adev->status.present && adev->status.functional) {
         |                         ^~
   sound/soc/soc-acpi.c:66:49: error: invalid use of undefined type 'struct acpi_device'
      66 |         if (adev && adev->status.present && adev->status.functional) {
         |                                                 ^~
   sound/soc/soc-acpi.c:82:26: error: implicit declaration of function 'acpi_extract_package' [-Werror=implicit-function-declaration]
      82 |                 status = acpi_extract_package(myobj,
         |                          ^~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-acpi.c: At top level:
   sound/soc/soc-acpi.c:97:6: error: redefinition of 'snd_soc_acpi_find_package_from_hid'
      97 | bool snd_soc_acpi_find_package_from_hid(const u8 hid[ACPI_ID_LEN],
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/soc-acpi.c:11:
   include/sound/soc-acpi.h:46:1: note: previous definition of 'snd_soc_acpi_find_package_from_hid' with type 'bool(const u8 *, struct snd_soc_acpi_package_context *)' {aka '_Bool(const unsigned char *, struct snd_soc_acpi_package_context *)'}
      46 | snd_soc_acpi_find_package_from_hid(const u8 hid[ACPI_ID_LEN],
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-acpi.c:111:27: error: redefinition of 'snd_soc_acpi_codec_list'
     111 | struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/soc-acpi.c:11:
   include/sound/soc-acpi.h:53:41: note: previous definition of 'snd_soc_acpi_codec_list' with type 'struct snd_soc_acpi_mach *(void *)'
      53 | static inline struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +60 sound/soc/soc-acpi.c

95f098014815b33 sound/soc/intel/common/sst-match-acpi.c Vinod Koul           2015-11-05   6  
78d8db3cfe94397 sound/soc/soc-acpi.c                    Syed Saba Kareem     2026-11-09   7  #include <linux/device.h>
261e90829fe2f0a sound/soc/soc-acpi.c                    Paul Gortmaker       2019-04-13   8  #include <linux/export.h>
78d8db3cfe94397 sound/soc/soc-acpi.c                    Syed Saba Kareem     2026-11-09   9  #include <linux/firmware.h>
261e90829fe2f0a sound/soc/soc-acpi.c                    Paul Gortmaker       2019-04-13  10  #include <linux/module.h>
7feb2f786a46d34 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12 @11  #include <sound/soc-acpi.h>
95f098014815b33 sound/soc/intel/common/sst-match-acpi.c Vinod Koul           2015-11-05  12  
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  13  static bool snd_soc_acpi_id_present(struct snd_soc_acpi_mach *machine)
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  14  {
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  15  	const struct snd_soc_acpi_codecs *comp_ids = machine->comp_ids;
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  16  	int i;
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  17  
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  18  	if (machine->id[0]) {
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  19  		if (acpi_dev_present(machine->id, NULL, -1))
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  20  			return true;
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  21  	}
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  22  
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  23  	if (comp_ids) {
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  24  		for (i = 0; i < comp_ids->num_codecs; i++) {
28c916ade1bd420 sound/soc/soc-acpi.c                    Hans de Goede        2021-11-18  25  			if (acpi_dev_present(comp_ids->codecs[i], NULL, -1)) {
28c916ade1bd420 sound/soc/soc-acpi.c                    Hans de Goede        2021-11-18  26  				strscpy(machine->id, comp_ids->codecs[i], ACPI_ID_LEN);
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  27  				return true;
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  28  			}
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  29  		}
28c916ade1bd420 sound/soc/soc-acpi.c                    Hans de Goede        2021-11-18  30  	}
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  31  
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  32  	return false;
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  33  }
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  34  
7feb2f786a46d34 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  35  struct snd_soc_acpi_mach *
7feb2f786a46d34 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  36  snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
95f098014815b33 sound/soc/intel/common/sst-match-acpi.c Vinod Koul           2015-11-05  37  {
7feb2f786a46d34 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  38  	struct snd_soc_acpi_mach *mach;
a3e620f8422832a sound/soc/soc-acpi.c                    Keyon Jie            2018-11-16  39  	struct snd_soc_acpi_mach *mach_alt;
95f098014815b33 sound/soc/intel/common/sst-match-acpi.c Vinod Koul           2015-11-05  40  
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  41  	for (mach = machines; mach->id[0] || mach->comp_ids; mach++) {
cafa39b650ec3ba sound/soc/soc-acpi.c                    Brent Lu             2021-10-30  42  		if (snd_soc_acpi_id_present(mach)) {
a3e620f8422832a sound/soc/soc-acpi.c                    Keyon Jie            2018-11-16  43  			if (mach->machine_quirk) {
a3e620f8422832a sound/soc/soc-acpi.c                    Keyon Jie            2018-11-16  44  				mach_alt = mach->machine_quirk(mach);
a3e620f8422832a sound/soc/soc-acpi.c                    Keyon Jie            2018-11-16  45  				if (!mach_alt)
a3e620f8422832a sound/soc/soc-acpi.c                    Keyon Jie            2018-11-16  46  					continue; /* not full match, ignore */
a3e620f8422832a sound/soc/soc-acpi.c                    Keyon Jie            2018-11-16  47  				mach = mach_alt;
a3e620f8422832a sound/soc/soc-acpi.c                    Keyon Jie            2018-11-16  48  			}
a3e620f8422832a sound/soc/soc-acpi.c                    Keyon Jie            2018-11-16  49  
7827d66946ad3af sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15  50  			return mach;
7827d66946ad3af sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15  51  		}
7827d66946ad3af sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15  52  	}
95f098014815b33 sound/soc/intel/common/sst-match-acpi.c Vinod Koul           2015-11-05  53  	return NULL;
95f098014815b33 sound/soc/intel/common/sst-match-acpi.c Vinod Koul           2015-11-05  54  }
7feb2f786a46d34 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  55  EXPORT_SYMBOL_GPL(snd_soc_acpi_find_machine);
8ceffd229f0ef13 sound/soc/intel/common/sst-match-acpi.c Vinod Koul           2016-02-08  56  
7feb2f786a46d34 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  57  static acpi_status snd_soc_acpi_find_package(acpi_handle handle, u32 level,
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  58  					     void *context, void **ret)
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  59  {
ff4865b3c8cd746 sound/soc/soc-acpi.c                    Rafael J. Wysocki    2022-01-26 @60  	struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
59ce3233a538fc2 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2021-04-16  61  	acpi_status status;
7feb2f786a46d34 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  62  	struct snd_soc_acpi_package_context *pkg_ctx = context;
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  63  
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  64  	pkg_ctx->data_valid = false;
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  65  
ff4865b3c8cd746 sound/soc/soc-acpi.c                    Rafael J. Wysocki    2022-01-26  66  	if (adev && adev->status.present && adev->status.functional) {
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  67  		struct acpi_buffer buffer = {ACPI_ALLOCATE_BUFFER, NULL};
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  68  		union acpi_object  *myobj = NULL;
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  69  
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  70  		status = acpi_evaluate_object_typed(handle, pkg_ctx->name,
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  71  						NULL, &buffer,
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  72  						ACPI_TYPE_PACKAGE);
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  73  		if (ACPI_FAILURE(status))
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  74  			return AE_OK;
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  75  
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  76  		myobj = buffer.pointer;
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  77  		if (!myobj || myobj->package.count != pkg_ctx->length) {
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  78  			kfree(buffer.pointer);
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  79  			return AE_OK;
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  80  		}
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  81  
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  82  		status = acpi_extract_package(myobj,
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  83  					pkg_ctx->format, pkg_ctx->state);
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  84  		if (ACPI_FAILURE(status)) {
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  85  			kfree(buffer.pointer);
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  86  			return AE_OK;
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  87  		}
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  88  
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  89  		kfree(buffer.pointer);
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  90  		pkg_ctx->data_valid = true;
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  91  		return AE_CTRL_TERMINATE;
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  92  	}
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  93  
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  94  	return AE_OK;
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  95  }
3421894765a345c sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  96  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
