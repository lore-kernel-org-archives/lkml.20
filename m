Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7BA36F8F2;
	Sat, 10 Oct 2026 04:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791608333; cv=none; b=K6sMkH6vctrmJQqCGFRLcw7J+TA/ghgjH9uj1sB/bbtsGtCm75vFhXTT5bcFnDFwJNFzUFa8YNGCeelVBx1QH2PBbXhylxDfALK05CptHl0zqh16j6O+xNhoCUr4ANTuvv8qROuH3BaFwLnRBJqrWhgPcFesqZkjc66d7PYUUSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791608333; c=relaxed/simple;
	bh=ag2XnCTWD1B3RSMs/txEiRAej3usmudDtH335mGetfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9VD2ghjxiqPx1cBjXOciaXzg2aiKF2L9sZlr7ld7MLxZcvGIfmTtaiaRH1pdBLOaLvUEyYxaKmXSz1MKD43Q0ia4LYfPrwWi6boThNhshzHR0IE9hv0W02xwLPM0NCxlnyhnLsanxui9U+8Xm8RiTnuMR0sl9aXzmHY7UjJPfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfUF7/w4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfUF7/w4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791608332; x=1823144332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ag2XnCTWD1B3RSMs/txEiRAej3usmudDtH335mGetfs=;
  b=dfUF7/w4kCy1FnniYcYWAP1aCarAtdOvM6Aay3RQllY0XP4F1AEd9nMv
   Wpw2rLGBQZrHocwpZt8SIYnK54DYBt87XtVC+BsGYYWgnTU3ffiYU7XAr
   L296FJGFkLGHpipezlJrJk7XTGPe88seKyuNAW+mBZVhjNt6CcvGKasWX
   G3Ah4pZxacSyK5yfFYlWbIXFkKnMCTm2pn11Ji+3HMnL6ywU3LnrAmU2E
   25fO2SoZgqBwOsHhlUAj4DvRIrGLubTu1djBvCmveR8U0o6Xvwh/DCKSi
   XYDGMswSC4w/O5ZZtXfNSW0WDdOn28LPdqg+fvshVSrberD862C+e+yoO
   A==;
X-CSE-ConnectionGUID: O931C6YASA2diH2AnbgrjQ==
X-CSE-MsgGUID: OoVXhG5GSbiv+YZtl995RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="514753"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="514753"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 21:58:51 -0700
X-CSE-ConnectionGUID: 7MXMr4H0Tx+E5wiNybeEbA==
X-CSE-MsgGUID: HK1/+BMeR6mAn//93gpzKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="456970"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Oct 2026 21:58:48 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFPAT-000000006VX-25AE;
	Sat, 10 Oct 2026 04:58:45 +0000
Date: Sat, 10 Oct 2026 12:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] ASoC: airoha: Add support for AN7581 PCM driver
Message-ID: <202610101205.hqe234SY-lkp@intel.com>
References: <20261009111334.23522-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009111334.23522-3-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20261008]
[cannot apply to linus/master v7.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/ASoC-dt-bindings-airoha-Add-AN7581-PCM-controller/20261009-131331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20261009111334.23522-3-ansuelsmth%40gmail.com
patch subject: [PATCH v3 2/2] ASoC: airoha: Add support for AN7581 PCM driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261010/202610101205.hqe234SY-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610101205.hqe234SY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610101205.hqe234SY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/airoha/an7581-pcm.c:618:10: error: 'const struct snd_soc_component_driver' has no member named 'pcm_construct'
     618 |         .pcm_construct = an7581_pcm_new,
         |          ^~~~~~~~~~~~~
   sound/soc/airoha/an7581-pcm.c:618:26: error: initialization of 'int (*)(struct snd_soc_component *, struct snd_pcm_substream *, struct timespec64 *, struct timespec64 *, struct snd_pcm_audio_tstamp_config *, struct snd_pcm_audio_tstamp_report *)' from incompatible pointer type 'int (*)(struct snd_soc_component *, struct snd_soc_pcm_runtime *)' [-Wincompatible-pointer-types]
     618 |         .pcm_construct = an7581_pcm_new,
         |                          ^~~~~~~~~~~~~~
   sound/soc/airoha/an7581-pcm.c:618:26: note: (near initialization for 'an7581_pcm_platform.get_time_info')
   sound/soc/airoha/an7581-pcm.c:603:12: note: 'an7581_pcm_new' declared here
     603 | static int an7581_pcm_new(struct snd_soc_component *component,
         |            ^~~~~~~~~~~~~~
   sound/soc/airoha/an7581-pcm.c: In function 'an7581_pcm_probe':
>> sound/soc/airoha/an7581-pcm.c:778:21: warning: unused variable 'connection_type' [-Wunused-variable]
     778 |         const char *connection_type;
         |                     ^~~~~~~~~~~~~~~


vim +/connection_type +778 sound/soc/airoha/an7581-pcm.c

   771	
   772	static int an7581_pcm_probe(struct platform_device *pdev)
   773	{
   774		struct snd_soc_card *card = &an7581_pcm_card;
   775		struct snd_soc_dai_link *dai_link;
   776		struct device *dev = &pdev->dev;
   777		struct an7581_pcm_priv *priv;
 > 778		const char *connection_type;
   779		int irq;
   780		int ret;
   781		int i;
   782	
   783		card->dev = dev;
   784	
   785		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   786		if (!priv)
   787			return -ENOMEM;
   788		snd_soc_card_set_drvdata(card, priv);
   789	
   790		priv->map = device_node_to_regmap(dev->of_node);
   791		if (IS_ERR(priv->map))
   792			return PTR_ERR(priv->map);
   793	
   794		priv->reset = devm_reset_control_get_exclusive(dev, "pcm1");
   795		if (IS_ERR(priv->reset))
   796			return PTR_ERR(priv->reset);
   797	
   798		irq = of_irq_get(dev_of_node(dev), 0);
   799		if (irq < 0)
   800			return irq;
   801	
   802		ret = devm_request_threaded_irq(dev, irq, an7581_pcm_irq_handler,
   803						NULL, IRQF_ONESHOT, dev_name(dev), priv);
   804		if (ret)
   805			return ret;
   806	
   807		spin_lock_init(&priv->desc_lock);
   808		mutex_init(&priv->user_lock);
   809	
   810		/* Reset the PCM interface */
   811		reset_control_assert(priv->reset);
   812		usleep_range(5000, 10000);
   813		reset_control_deassert(priv->reset);
   814		usleep_range(5000, 10000);
   815	
   816		ret = dma_set_mask(dev, DMA_BIT_MASK(32));
   817		if (ret)
   818			return ret;
   819	
   820		priv->tx_descs = dma_alloc_coherent(dev, sizeof(struct an7581_pcm_desc) *
   821						    AN7581_PCM_TX_DESCRIPTORS, &priv->tx_dma,
   822						    GFP_KERNEL);
   823		if (!priv->tx_descs)
   824			return -ENOMEM;
   825	
   826		priv->rx_descs = dma_alloc_coherent(dev, sizeof(struct an7581_pcm_desc) *
   827						    AN7581_PCM_RX_DESCRIPTORS, &priv->rx_dma,
   828						    GFP_KERNEL);
   829		if (!priv->rx_descs) {
   830			ret = -ENOMEM;
   831			goto err_free_tx;
   832		}
   833	
   834		for_each_card_prelinks(card, i, dai_link)
   835			dai_link->platforms->of_node = dev->of_node;
   836	
   837		ret = devm_snd_soc_register_component(dev,
   838						      &an7581_pcm_platform,
   839						      NULL, 0);
   840		if (ret) {
   841			dev_err_probe(dev, ret, "Cannot register PCM component\n");
   842			goto err_free_rx;
   843		}
   844	
   845		ret = devm_snd_soc_register_component(dev,
   846						      &an7581_pcm_dai_component,
   847						      an7581_pcm_dai_driver,
   848						      ARRAY_SIZE(an7581_pcm_dai_driver));
   849		if (ret) {
   850			dev_err_probe(dev, ret, "Cannot register PCM DAI component\n");
   851			goto err_free_rx;
   852		}
   853	
   854		ret = devm_snd_soc_register_card(dev, card);
   855		if (ret) {
   856			dev_err_probe(dev, ret, "%s snd_soc_register_card fail\n", __func__);
   857			goto err_free_rx;
   858		}
   859	
   860		return 0;
   861	
   862	err_free_rx:
   863		dma_free_coherent(dev, sizeof(struct an7581_pcm_desc) *
   864				  AN7581_PCM_RX_DESCRIPTORS, priv->rx_descs, priv->rx_dma);
   865	err_free_tx:
   866		dma_free_coherent(dev, sizeof(struct an7581_pcm_desc) *
   867				  AN7581_PCM_TX_DESCRIPTORS, priv->tx_descs, priv->tx_dma);
   868	
   869		return ret;
   870	}
   871	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
