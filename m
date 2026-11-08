Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794101203;
	b=J5WlwgfCvkAb4c3s5r0dwArG6JQ/0qR/tTHloCqWWsB7duqME3BAnL7M4Rpel7vEWsAN
	 2DFPI3ZN9puwlLFiH/u1oYN+SFYjZR6wDTsFDVnwMFXTiaiE+cWTz/XitkSwoGq4iidgN
	 vq7UMUZv6qr0SdpmmfGKEbD45tLhlTrmEUbwNbHY/WiOUhzQJc6RE2oHMWfCNEq0Edv8h
	 HdsiE3HTcIjmqA1gXM1WOaQbRZIvYwkMvR3cDdJBVKycl8uotGdJ6frRyLJlqhTu2FADZ
	 ABW8N4stpfNsk3vYjG3jZuMSpSR4FRc9T4N59mvsma1sb0yJmavz366Hn9Syck6K6Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794101203;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=oJVbgkrPUFIJoDLSvIi2S4Vsm66yyTPXZFHZ7G6645s=;
	b=YLgImiUYj4BAf2sGYmzi4X3sKks6Yw8z/GzPOeQaVegcgfxNsVqrjtcSPXsSHkso99hw
	 LsQsuOvfavDfZ3qG6FuQ8pF9cMeTjtkgJzaza7nlc1imnwkHaqlcQSLLjCp/+wJDnYi0W
	 oj0mD8Au4azY3NdCJgvN+MBr6XV71uzcQYGxeQ7RNlrEgkl2DkJfEZTOAxqL35LtstC9W
	 BUKfzR0XSsyywGrpS/3fug1sHn7maMQGvfPGItwXc4wcEVc4DU9pdmxLF1XLCKXmz9kcR
	 /kAZc6khrEIEJq6oo6gR/OmDMG7rJVpjqqIdY6dx+lI9hm7qqa96ZvBshVR3RvRMmqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TXiaue5N;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B256606A330;
	Sun,  8 Nov 2026 01:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B256606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TXiaue5N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794101203; x=1825637203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=62G6CXvWJYpeXqAlqKEtBedlRvUTL3ZsGFn1+x5tC/Y=;
  b=TXiaue5N7oZ28bmS21bfLv9cRq2QYlQM3w/yOv8mw6onZF440GIwQpUF
   R3MEIPCviHoDiCqFagAuOZErAaYWNdYj9KTFx2DPF3wmQLlRz1W210ahP
   wk0iF/WPZPBA+8fTAx2Ao7mCizHcFW68MBoQuMnLVpobyuxJCGV1giivq
   HjZXFna99b3keKmUPyfjpAlGhF1n1m5P3Fwva32cINeUGjjsegxIMz7Ye
   4XtUHhxt3+fz0GEnVTpl7bQr5gDIRwb0XOqeQCQrcJTAMTeCQkkQVXw4K
   EWeLm1vuysCTt8fMItSLuDSMS/9LT2UguVLwf+PC2EjZRmuQ2y/td73EL
   g==;
X-CSE-ConnectionGUID: fSatIlZMTlC1Y7Ylnvzzfw==
X-CSE-MsgGUID: 7V4L3zQ5RO2XQc6D7efqWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2772342"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2772342"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 17:26:43 -0800
X-CSE-ConnectionGUID: vybv3uPPTWKHzk1p+7wyMQ==
X-CSE-MsgGUID: +YDOCgh+Q0u2MwqxxSp20g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7579703"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2026 17:26:38 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPrg3-00000000rsx-1BhI;
	Sun, 08 Nov 2026 01:26:35 +0000
Date: Sun, 8 Nov 2026 09:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, vkoul@kernel.org,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, yung-chuan.liao@linux.intel.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
	Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
	lee@kernel.org, Vijendar.Mukunda@amd.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 3/4] ASoC: SOF: amd: guard SDW IRQ work scheduling with
 interrupt_enabled flag
Message-ID: <202611080910.HG54RIuC-lkp@intel.com>
References: <20261107175339.3547918-4-Vijendar.Mukunda@amd.com>
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
In-Reply-To: <20261107175339.3547918-4-Vijendar.Mukunda@amd.com>

Hi Vijendar,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on vkoul-dmaengine/next linus/master v7.4-rc1 next-20261105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vijendar-Mukunda/ASoC-amd-ps-guard-adata-sdw-dereferences-with-NULL-check-in-IRQ-handler/20261107-232226
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20261107175339.3547918-4-Vijendar.Mukunda%40amd.com
patch subject: [PATCH 3/4] ASoC: SOF: amd: guard SDW IRQ work scheduling with interrupt_enabled flag
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20261108/202611080910.HG54RIuC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080910.HG54RIuC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080910.HG54RIuC-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sof/amd/acp.c: In function 'acp_irq_handler':
>> sound/soc/sof/amd/acp.c:589:55: error: 'struct amd_sdw_manager' has no member named 'interrupt_enabled'
     589 |                         if (amd_manager && amd_manager->interrupt_enabled)
         |                                                       ^~
   sound/soc/sof/amd/acp.c:621:63: error: 'struct amd_sdw_manager' has no member named 'interrupt_enabled'
     621 |                                 if (amd_manager && amd_manager->interrupt_enabled)
         |                                                               ^~


vim +589 sound/soc/sof/amd/acp.c

   566	
   567	static irqreturn_t acp_irq_handler(int irq, void *dev_id)
   568	{
   569		struct amd_sdw_manager *amd_manager;
   570		struct snd_sof_dev *sdev = dev_id;
   571		const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
   572		struct acp_dev_data *adata = sdev->pdata->hw_pdata;
   573		unsigned int base = desc->dsp_intr_base;
   574		unsigned int val;
   575		int irq_flag = 0, wake_irq_flag = 0;
   576	
   577		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET);
   578		if (val & ACP_DSP_TO_HOST_IRQ) {
   579			snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET,
   580					  ACP_DSP_TO_HOST_IRQ);
   581			return IRQ_WAKE_THREAD;
   582		}
   583	
   584		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat);
   585		if (val & ACP_SDW0_IRQ_MASK) {
   586			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_SDW0_IRQ_MASK);
   587			if (adata->sdw) {
   588				amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
 > 589				if (amd_manager && amd_manager->interrupt_enabled)
   590					schedule_work(&amd_manager->amd_sdw_irq_thread);
   591			}
   592			irq_flag = 1;
   593		}
   594	
   595		if (val & ACP_ERROR_IRQ_MASK) {
   596			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_ERROR_IRQ_MASK);
   597			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_sw0_i2s_err_reason, 0);
   598			/* ACP_SW1_I2S_ERROR_REASON is newly added register from rmb platform onwards */
   599			switch (adata->pci_rev) {
   600			case ACP_RMB_PCI_ID:
   601			case ACP63_PCI_ID:
   602			case ACP70_PCI_ID:
   603			case ACP71_PCI_ID:
   604			case ACP72_PCI_ID:
   605				snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SW1_I2S_ERROR_REASON, 0);
   606				break;
   607			default:
   608				break;
   609			}
   610			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_error_stat, 0);
   611			irq_flag = 1;
   612		}
   613	
   614		if (desc->ext_intr_stat1) {
   615			val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat1);
   616			if (val & ACP_SDW1_IRQ_MASK) {
   617				snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat1,
   618						  ACP_SDW1_IRQ_MASK);
   619				if (adata->sdw) {
   620					amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
   621					if (amd_manager && amd_manager->interrupt_enabled)
   622						schedule_work(&amd_manager->amd_sdw_irq_thread);
   623				}
   624				irq_flag = 1;
   625			}
   626			switch (adata->pci_rev) {
   627			case ACP70_PCI_ID:
   628			case ACP71_PCI_ID:
   629			case ACP72_PCI_ID:
   630				wake_irq_flag = amd_sof_check_and_handle_acp70_sdw_wake_irq(sdev);
   631				break;
   632			}
   633		}
   634		if (irq_flag || wake_irq_flag)
   635			return IRQ_HANDLED;
   636		else
   637			return IRQ_NONE;
   638	}
   639	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
