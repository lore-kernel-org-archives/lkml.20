Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187465;
	b=YELHHS5kBIvNTOl9CzKJxhkbvkD761jsQTcZpycPnh2QUei/VEaiY3KlLMwUgGfWMssT
	 SW4XdmxYC608uc+AoaHMNkdIb1A3CAWnlk1h/NSnZJvwkIsQD2oxpNdRTxBDL+ft9Gs7r
	 n0s670XAQ1UWiuBWuCh87TobMKnBMsPO6M3r48y9T5Hn+0ptzCeXTifa63ioeRHjRUJYU
	 LJ+iUxuxVcX/dDgofSJMwV+ZugtR8GeYD7g/P0HfoHZ+o90Vsn0Ej98aER0DMnyWy1X9o
	 Ha4muRo19Z2/OI3LiuCzTdbjFuuxe1m2i+jVwUl/n8x9I1kNm24s5OTfxLChMR7Mu+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187465;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=C6WAnG6C57/4S/ClZcKNQvEzcKWrj3k46UumMgJ1YCg=;
	b=bKvO/+IbmxBwTEEpROn6uiJZfZJkIl61wEnnS+AZRhD2h/MFYk24CJDUgPROt/6UOyil
	 Tnszk//fTLQEiCpUbIj5vsNkNrpmEylHr+Oj5vPKVxbvdbHoaeHqovrr32bhKr7es0knP
	 luZqxU80oNAE+Qr+EExWeKlJOXK5oEBZ1RAsuagcoYaX24NjOezFWu7Jycs+NaIgso9ws
	 9rZ5xV8tb7XUevI/ygxbrjLLmOWbJ+lmHKB5eW50mecj2rKD3WbuyAfS3uXuyil30YSSa
	 nEgL65SOLy2aLtzGQoFGHvIRCk7GGF/LnmZGFQpOxqs1deRnvpQFEV4cybaElGkEPlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Okzr2CCo;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3487606A78C;
	Mon,  9 Nov 2026 01:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3487606A78C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Okzr2CCo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794187463; x=1825723463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kJ1QYogniBbEVXeRE/4mGGKLhvULHaZWXSTHyisVbmw=;
  b=Okzr2CCoqM2vxWIA1QJGv4W/wEETB4Kko2Cex/vXF2aNS5Y4lSE2+65x
   3lCQ5OpJB1J1EL8ZC1HfFm3fvNDXv9GAyYDdwnzMm1N0hqvgPDRo706UY
   2pClT1T4nB8ZdNQlnoHP0LVzGKgOT4FPKU4dw9hx4TeIOVgQoPAYo3bT3
   g0idj7z9AtfSVo1JODq5Pbs+u37a/4vqD8RTYT53q2DwtoxdNjgBQVUjG
   7FMrXL4ZmW7A1tABHCNtCDIQji3XiB4pd0Wb6YsvJqfQS9YyK7L46KEu1
   UkcLCV746aoaWXFHCRfgG9SDdFQpHNJk2/qQiEFX2s1kBZBZKIQavxEXn
   w==;
X-CSE-ConnectionGUID: pv5Frxg4SIaVVySVFa6FfQ==
X-CSE-MsgGUID: g2keCEW0QOeFLLdiwN0TEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2913838"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2913838"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 17:24:23 -0800
X-CSE-ConnectionGUID: rWy1vsjHSOSRuM0/Ko87nQ==
X-CSE-MsgGUID: mZzSNmlrQNeYNrB5/mx0VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7785511"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Nov 2026 17:24:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQE7K-00000000tfL-4Az2;
	Mon, 09 Nov 2026 01:24:14 +0000
Date: Mon, 9 Nov 2026 09:24:08 +0800
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
Message-ID: <202611090919.XXJ8jSiT-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[cannot apply to linus/master v7.4-rc2 next-20261105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Syed-Saba-Kareem/ASoC-amd-acp-add-SoundWire-speaker-quirks-for-Dell-platforms/20261109-010030
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20261108193119.2308421-4-syed.sabakareem%40amd.com
patch subject: [PATCH v3 3/6] ASoC: soc-acpi: move common function topology helpers
config: sh-randconfig-1000-20261109 (https://download.01.org/0day-ci/archive/20261109/202611090919.XXJ8jSiT-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090919.XXJ8jSiT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090919.XXJ8jSiT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/soc-acpi.c:36:1: error: redefinition of 'snd_soc_acpi_find_machine'
      36 | snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/soc-acpi.c:11:
   include/sound/soc-acpi.h:40:1: note: previous definition of 'snd_soc_acpi_find_machine' with type 'struct snd_soc_acpi_mach *(struct snd_soc_acpi_mach *)'
      40 | snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-acpi.c: In function 'snd_soc_acpi_find_package':
>> sound/soc/soc-acpi.c:60:36: error: implicit declaration of function 'acpi_fetch_acpi_dev'; did you mean 'acpi_match_acpi_device'? [-Wimplicit-function-declaration]
      60 |         struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
         |                                    ^~~~~~~~~~~~~~~~~~~
         |                                    acpi_match_acpi_device
>> sound/soc/soc-acpi.c:60:36: error: initialization of 'struct acpi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> sound/soc/soc-acpi.c:66:25: error: invalid use of undefined type 'struct acpi_device'
      66 |         if (adev && adev->status.present && adev->status.functional) {
         |                         ^~
   sound/soc/soc-acpi.c:66:49: error: invalid use of undefined type 'struct acpi_device'
      66 |         if (adev && adev->status.present && adev->status.functional) {
         |                                                 ^~
>> sound/soc/soc-acpi.c:82:26: error: implicit declaration of function 'acpi_extract_package' [-Wimplicit-function-declaration]
      82 |                 status = acpi_extract_package(myobj,
         |                          ^~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-acpi.c: At top level:
>> sound/soc/soc-acpi.c:97:6: error: redefinition of 'snd_soc_acpi_find_package_from_hid'
      97 | bool snd_soc_acpi_find_package_from_hid(const u8 hid[ACPI_ID_LEN],
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/soc-acpi.h:46:1: note: previous definition of 'snd_soc_acpi_find_package_from_hid' with type 'bool(const u8 *, struct snd_soc_acpi_package_context *)' {aka '_Bool(const unsigned char *, struct snd_soc_acpi_package_context *)'}
      46 | snd_soc_acpi_find_package_from_hid(const u8 hid[ACPI_ID_LEN],
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/soc-acpi.c:111:27: error: redefinition of 'snd_soc_acpi_codec_list'
     111 | struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/sound/soc-acpi.h:53:41: note: previous definition of 'snd_soc_acpi_codec_list' with type 'struct snd_soc_acpi_mach *(void *)'
      53 | static inline struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~


vim +/snd_soc_acpi_find_machine +36 sound/soc/soc-acpi.c

95f098014815b3 sound/soc/intel/common/sst-match-acpi.c Vinod Koul           2015-11-05    6  
78d8db3cfe9439 sound/soc/soc-acpi.c                    Syed Saba Kareem     2026-11-09    7  #include <linux/device.h>
261e90829fe2f0 sound/soc/soc-acpi.c                    Paul Gortmaker       2019-04-13    8  #include <linux/export.h>
78d8db3cfe9439 sound/soc/soc-acpi.c                    Syed Saba Kareem     2026-11-09    9  #include <linux/firmware.h>
261e90829fe2f0 sound/soc/soc-acpi.c                    Paul Gortmaker       2019-04-13   10  #include <linux/module.h>
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  @11  #include <sound/soc-acpi.h>
95f098014815b3 sound/soc/intel/common/sst-match-acpi.c Vinod Koul           2015-11-05   12  
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   13  static bool snd_soc_acpi_id_present(struct snd_soc_acpi_mach *machine)
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   14  {
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   15  	const struct snd_soc_acpi_codecs *comp_ids = machine->comp_ids;
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   16  	int i;
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   17  
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   18  	if (machine->id[0]) {
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   19  		if (acpi_dev_present(machine->id, NULL, -1))
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   20  			return true;
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   21  	}
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   22  
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   23  	if (comp_ids) {
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   24  		for (i = 0; i < comp_ids->num_codecs; i++) {
28c916ade1bd42 sound/soc/soc-acpi.c                    Hans de Goede        2021-11-18   25  			if (acpi_dev_present(comp_ids->codecs[i], NULL, -1)) {
28c916ade1bd42 sound/soc/soc-acpi.c                    Hans de Goede        2021-11-18   26  				strscpy(machine->id, comp_ids->codecs[i], ACPI_ID_LEN);
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   27  				return true;
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   28  			}
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   29  		}
28c916ade1bd42 sound/soc/soc-acpi.c                    Hans de Goede        2021-11-18   30  	}
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   31  
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   32  	return false;
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   33  }
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   34  
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12   35  struct snd_soc_acpi_mach *
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  @36  snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
95f098014815b3 sound/soc/intel/common/sst-match-acpi.c Vinod Koul           2015-11-05   37  {
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12   38  	struct snd_soc_acpi_mach *mach;
a3e620f8422832 sound/soc/soc-acpi.c                    Keyon Jie            2018-11-16   39  	struct snd_soc_acpi_mach *mach_alt;
95f098014815b3 sound/soc/intel/common/sst-match-acpi.c Vinod Koul           2015-11-05   40  
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   41  	for (mach = machines; mach->id[0] || mach->comp_ids; mach++) {
cafa39b650ec3b sound/soc/soc-acpi.c                    Brent Lu             2021-10-30   42  		if (snd_soc_acpi_id_present(mach)) {
a3e620f8422832 sound/soc/soc-acpi.c                    Keyon Jie            2018-11-16   43  			if (mach->machine_quirk) {
a3e620f8422832 sound/soc/soc-acpi.c                    Keyon Jie            2018-11-16   44  				mach_alt = mach->machine_quirk(mach);
a3e620f8422832 sound/soc/soc-acpi.c                    Keyon Jie            2018-11-16   45  				if (!mach_alt)
a3e620f8422832 sound/soc/soc-acpi.c                    Keyon Jie            2018-11-16   46  					continue; /* not full match, ignore */
a3e620f8422832 sound/soc/soc-acpi.c                    Keyon Jie            2018-11-16   47  				mach = mach_alt;
a3e620f8422832 sound/soc/soc-acpi.c                    Keyon Jie            2018-11-16   48  			}
a3e620f8422832 sound/soc/soc-acpi.c                    Keyon Jie            2018-11-16   49  
7827d66946ad3a sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15   50  			return mach;
7827d66946ad3a sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15   51  		}
7827d66946ad3a sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15   52  	}
95f098014815b3 sound/soc/intel/common/sst-match-acpi.c Vinod Koul           2015-11-05   53  	return NULL;
95f098014815b3 sound/soc/intel/common/sst-match-acpi.c Vinod Koul           2015-11-05   54  }
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12   55  EXPORT_SYMBOL_GPL(snd_soc_acpi_find_machine);
8ceffd229f0ef1 sound/soc/intel/common/sst-match-acpi.c Vinod Koul           2016-02-08   56  
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12   57  static acpi_status snd_soc_acpi_find_package(acpi_handle handle, u32 level,
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   58  					     void *context, void **ret)
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   59  {
ff4865b3c8cd74 sound/soc/soc-acpi.c                    Rafael J. Wysocki    2022-01-26  @60  	struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
59ce3233a538fc sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2021-04-16   61  	acpi_status status;
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12   62  	struct snd_soc_acpi_package_context *pkg_ctx = context;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   63  
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   64  	pkg_ctx->data_valid = false;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   65  
ff4865b3c8cd74 sound/soc/soc-acpi.c                    Rafael J. Wysocki    2022-01-26  @66  	if (adev && adev->status.present && adev->status.functional) {
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   67  		struct acpi_buffer buffer = {ACPI_ALLOCATE_BUFFER, NULL};
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   68  		union acpi_object  *myobj = NULL;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   69  
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   70  		status = acpi_evaluate_object_typed(handle, pkg_ctx->name,
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   71  						NULL, &buffer,
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   72  						ACPI_TYPE_PACKAGE);
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   73  		if (ACPI_FAILURE(status))
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   74  			return AE_OK;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   75  
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   76  		myobj = buffer.pointer;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   77  		if (!myobj || myobj->package.count != pkg_ctx->length) {
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   78  			kfree(buffer.pointer);
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   79  			return AE_OK;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   80  		}
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   81  
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  @82  		status = acpi_extract_package(myobj,
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   83  					pkg_ctx->format, pkg_ctx->state);
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   84  		if (ACPI_FAILURE(status)) {
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   85  			kfree(buffer.pointer);
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   86  			return AE_OK;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   87  		}
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   88  
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   89  		kfree(buffer.pointer);
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   90  		pkg_ctx->data_valid = true;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   91  		return AE_CTRL_TERMINATE;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   92  	}
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   93  
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   94  	return AE_OK;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   95  }
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   96  
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  @97  bool snd_soc_acpi_find_package_from_hid(const u8 hid[ACPI_ID_LEN],
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12   98  				struct snd_soc_acpi_package_context *ctx)
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12   99  {
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  100  	acpi_status status;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  101  
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  102  	status = acpi_get_devices(hid, snd_soc_acpi_find_package, ctx, NULL);
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  103  
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  104  	if (ACPI_FAILURE(status) || !ctx->data_valid)
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  105  		return false;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  106  
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  107  	return true;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  108  }
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  109  EXPORT_SYMBOL_GPL(snd_soc_acpi_find_package_from_hid);
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  110  
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12 @111  struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
54746dabf770eb sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15  112  {
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  113  	struct snd_soc_acpi_mach *mach = arg;
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  114  	struct snd_soc_acpi_codecs *codec_list =
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  115  		(struct snd_soc_acpi_codecs *) mach->quirk_data;
54746dabf770eb sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15  116  	int i;
54746dabf770eb sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15  117  
54746dabf770eb sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15  118  	if (mach->quirk_data == NULL)
54746dabf770eb sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15  119  		return mach;
54746dabf770eb sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15  120  
54746dabf770eb sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15  121  	for (i = 0; i < codec_list->num_codecs; i++) {
0d5ea120abc020 sound/soc/soc-acpi.c                    Jeremy Cline         2018-01-05  122  		if (!acpi_dev_present(codec_list->codecs[i], NULL, -1))
54746dabf770eb sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15  123  			return NULL;
54746dabf770eb sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15  124  	}
54746dabf770eb sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15  125  
54746dabf770eb sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15  126  	return mach;
54746dabf770eb sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15  127  }
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  128  EXPORT_SYMBOL_GPL(snd_soc_acpi_codec_list);
54746dabf770eb sound/soc/intel/common/sst-match-acpi.c Naveen M             2017-05-15  129  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
