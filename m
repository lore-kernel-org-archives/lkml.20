Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793995209;
	b=jhaG8zU4Ju1qSnflrFfVLwKr+IU/xGAz5Kqk86dZ+seaFUsBcQ7Wcm3Yhmsn+Fb9azI2
	 p4JQOoITfCzhPCW9Vw16T+aJZ4o3orVysrCePn7lfvfSRNVtKBqHas7DUy2atmKmmuXxT
	 U/IpFYLczQbfwMoBD0zoIkqGjwJOcI4AcQ30KkfAy4olLFMLdNhxYIdZOiHBaikFfyO1u
	 cInPMaE/AO0Lr/lmeWk+N2CGimqo52o3HBxsoWBya86Slk7lTZIgc3+5hD1qqQPC+4+du
	 DQirLSK8tjkft+jR6v33BG7B3gIBGLdNagwZR6Ot40B9FRdxdXz92gT6DvaPmuelkuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793995209;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=tg+5lTr7WFBIKY9ugixE62sxDt+K5j7rhcZZ0EPAoFc=;
	b=aCHIE9AQDiZKuwCKM8fcPtDT/x7+7e51LN0A0JdM6ay3mO/ygulH85Qc7CxoTSwFjpNa
	 t9RfnNqJZm+j059vML+mhrghAAfwl3gSojwJQjTUVonssaW8k75sRG51INwVdwws5lRgN
	 OenkVso7hIkIUq1snKSM05xytkNgLmd0ZRLxkrH310AaLO6yJBZKa4rjfB5mOtR4d3NfQ
	 rgt1Ao8RiV/mtVwSDSCH36OFs9HVJDpCr5NPuEOMHyd94J4q/HTaTPlokncdQ0DL6L+WF
	 kc4xj7PTwtzTTKyw28pFt5/1XWrUImAOhHQsNTCuunnFYu4mb2VvzfopA2f/YDCgMnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hu99P1DO;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860E7606A32E;
	Fri,  6 Nov 2026 20:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 860E7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hu99P1DO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793995206; x=1825531206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZQHCLmRl+5yI2qXtbalMXshMuhdAEpu2Wn4X55iw3i0=;
  b=hu99P1DOENva3WLSuy9odfLjNdSx4lNR9GbfQS+x8HhFK2wOj+ZJK7Xt
   ZqOCwcVJeCxgUS/D0CdLXhINpiFfYIQkJi5aDTorKpX1KVQs/QdGlWAVp
   34R2kRlKvlzwiUtV3oVhycicSV7KJmAo//4LMQmrxq2iRal3lWPPDE5x1
   sYdtAVYz1Itoco6iYv+8gpODcYN+rAfjHSqfeZ/36LnCFCCPQRGEJkVZ4
   PTAxjiTTkIglSQnuz4lXKskGfmb8MQfBiUfSSeXFcEVLYMKIfSz0iQrOm
   OsWEfPeidJAXqDwOPc5SIV7o9bCPejfEiP9u02PcWSITpf+98SkeuBydo
   w==;
X-CSE-ConnectionGUID: o6GvTra3SYCWOOLPkR1cFg==
X-CSE-MsgGUID: 6e7WlBnKRtK17qsjWrdtJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2829793"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2829793"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 12:00:06 -0800
X-CSE-ConnectionGUID: D1J1jMDwSDeG5ochW/bIkA==
X-CSE-MsgGUID: bcv/NWadRwmEXhTD7j15UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7383234"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Nov 2026 12:00:03 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPQ6S-00000000pqx-2wCw;
	Fri, 06 Nov 2026 20:00:00 +0000
Date: Sat, 7 Nov 2026 03:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, broonie@kernel.org, tiwai@suse.com,
	perex@perex.cz, amade@asmblr.net, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
	vkoul@kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v3 2/7] soundwire: intel: Allow for dynamic assignment of
 PDIs
Message-ID: <202611070307.UuD8O6zR-lkp@intel.com>
References: <20261106121557.2338556-3-cezary.rojewski@intel.com>
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
In-Reply-To: <20261106121557.2338556-3-cezary.rojewski@intel.com>

Hi Cezary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next tiwai-sound/for-linus linus/master v7.4-rc1 next-20261105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/soundwire-intel-Define-stubs-when-library-is-disabled/20261106-131551
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20261106121557.2338556-3-cezary.rojewski%40intel.com
patch subject: [PATCH v3 2/7] soundwire: intel: Allow for dynamic assignment of PDIs
config: x86_64-randconfig-1015-20261106 (https://download.01.org/0day-ci/archive/20261107/202611070307.UuD8O6zR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611070307.UuD8O6zR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611070307.UuD8O6zR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soundwire/intel.c: In function 'intel_prepare':
>> drivers/soundwire/intel.c:807:17: warning: variable 'dir' set but not used [-Wunused-but-set-variable]
     807 |         int ch, dir;
         |                 ^~~
>> drivers/soundwire/intel.c:807:13: warning: variable 'ch' set but not used [-Wunused-but-set-variable]
     807 |         int ch, dir;
         |             ^~


vim +/dir +807 drivers/soundwire/intel.c

c46302ec554c57 Vinod Koul           2018-04-26  800  
27b198f409d876 Rander Wang          2020-02-14  801  static int intel_prepare(struct snd_pcm_substream *substream,
27b198f409d876 Rander Wang          2020-02-14  802  			 struct snd_soc_dai *dai)
27b198f409d876 Rander Wang          2020-02-14  803  {
a5a0239c27fe11 Bard Liao            2020-08-17  804  	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
a5a0239c27fe11 Bard Liao            2020-08-17  805  	struct sdw_intel *sdw = cdns_to_intel(cdns);
e0767e39107968 Pierre-Louis Bossart 2022-11-01  806  	struct sdw_cdns_dai_runtime *dai_runtime;
a5a0239c27fe11 Bard Liao            2020-08-17 @807  	int ch, dir;
244eb888f9ab86 Pierre-Louis Bossart 2020-09-04  808  	int ret = 0;
27b198f409d876 Rander Wang          2020-02-14  809  
7dddead766c082 Pierre-Louis Bossart 2022-11-01  810  	dai_runtime = cdns->dai_runtime_array[dai->id];
e0767e39107968 Pierre-Louis Bossart 2022-11-01  811  	if (!dai_runtime) {
e0767e39107968 Pierre-Louis Bossart 2022-11-01  812  		dev_err(dai->dev, "failed to get dai runtime in %s\n",
27b198f409d876 Rander Wang          2020-02-14  813  			__func__);
27b198f409d876 Rander Wang          2020-02-14  814  		return -EIO;
27b198f409d876 Rander Wang          2020-02-14  815  	}
27b198f409d876 Rander Wang          2020-02-14  816  
e0767e39107968 Pierre-Louis Bossart 2022-11-01  817  	if (dai_runtime->suspended) {
50cd92e0c8d35d Kuninori Morimoto    2023-09-11  818  		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
0a0d1740bd8fd7 Pierre-Louis Bossart 2023-03-21  819  		struct snd_pcm_hw_params *hw_params;
0a0d1740bd8fd7 Pierre-Louis Bossart 2023-03-21  820  
0a0d1740bd8fd7 Pierre-Louis Bossart 2023-03-21  821  		hw_params = &rtd->dpcm[substream->stream].hw_params;
0a0d1740bd8fd7 Pierre-Louis Bossart 2023-03-21  822  
e0767e39107968 Pierre-Louis Bossart 2022-11-01  823  		dai_runtime->suspended = false;
a5a0239c27fe11 Bard Liao            2020-08-17  824  
a5a0239c27fe11 Bard Liao            2020-08-17  825  		/*
a5a0239c27fe11 Bard Liao            2020-08-17  826  		 * .prepare() is called after system resume, where we
a5a0239c27fe11 Bard Liao            2020-08-17  827  		 * need to reinitialize the SHIM/ALH/Cadence IP.
a5a0239c27fe11 Bard Liao            2020-08-17  828  		 * .prepare() is also called to deal with underflows,
a5a0239c27fe11 Bard Liao            2020-08-17  829  		 * but in those cases we cannot touch ALH/SHIM
a5a0239c27fe11 Bard Liao            2020-08-17  830  		 * registers
a5a0239c27fe11 Bard Liao            2020-08-17  831  		 */
a5a0239c27fe11 Bard Liao            2020-08-17  832  
a5a0239c27fe11 Bard Liao            2020-08-17  833  		/* configure stream */
0a0d1740bd8fd7 Pierre-Louis Bossart 2023-03-21  834  		ch = params_channels(hw_params);
a5a0239c27fe11 Bard Liao            2020-08-17  835  		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
a5a0239c27fe11 Bard Liao            2020-08-17  836  			dir = SDW_DATA_DIR_RX;
a5a0239c27fe11 Bard Liao            2020-08-17  837  		else
a5a0239c27fe11 Bard Liao            2020-08-17  838  			dir = SDW_DATA_DIR_TX;
a5a0239c27fe11 Bard Liao            2020-08-17  839  
5977f02f8733d2 Cezary Rojewski      2026-11-06  840  		sdw_intel_pdi_config(&cdns->bus, dai_runtime->pdi);
a5a0239c27fe11 Bard Liao            2020-08-17  841  
a5a0239c27fe11 Bard Liao            2020-08-17  842  		/* Inform DSP about PDI stream number */
1d905d355ef329 Pierre-Louis Bossart 2023-05-15  843  		ret = intel_params_stream(sdw, substream, dai,
0a0d1740bd8fd7 Pierre-Louis Bossart 2023-03-21  844  					  hw_params,
a5a0239c27fe11 Bard Liao            2020-08-17  845  					  sdw->instance,
e0767e39107968 Pierre-Louis Bossart 2022-11-01  846  					  dai_runtime->pdi->intel_alh_id);
a5a0239c27fe11 Bard Liao            2020-08-17  847  	}
a5a0239c27fe11 Bard Liao            2020-08-17  848  
a5a0239c27fe11 Bard Liao            2020-08-17  849  	return ret;
27b198f409d876 Rander Wang          2020-02-14  850  }
27b198f409d876 Rander Wang          2020-02-14  851  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
