Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F445437F7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953775; cv=none; b=J4ZyomymwTBSjh1Fp8beNb4Njt5k+nhfTztSeuMzvD5WwzLW+sdi+CasSie9ldTJ9w8DtxtU5Zt2sqEnnx+U08EKgCm8D0ffq/E5ulaaRsIIOd2lDQI6I7dBwCWKb9mJYbGdtlvzhgoTKgJCnVeRIkMf9d4566xobrzERBAzgtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953775; c=relaxed/simple;
	bh=qemW8SzFS57XAitUApZNwy4sQ3TT7TcV0G7+taWeT1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a3jykzcAcpzn+2u4g3/WwEe25vsNOG9xLwMBTcpRj0nayEIIxtfU0/ZuYfGRrXbQ3P+G+WO7JGwwtORMHsGPVujbtji1nk4dPy0tz4k6HlhA1tp+Z8Lp1bp+eWiuExQTtKz97+fDGcoiFjTOskQxyszyvIUeE83CA0VufnAQjLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xr83Cc/4; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xr83Cc/4"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2544ff970dso845005666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788953772; x=1789558572; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7cy5kq8NLyuBLDyhds0rj5QIT86At3JxPMpPLWi50Ns=;
        b=Xr83Cc/4LNZ8kcPJQDGbVNhmctfemSYKT2k9sW3Hm8XwXhBkI6UhU5vicj6NbzjI9k
         EZP+oWWoKuhqC7ONpI1DjBkbpYqundG4LxFnS4xQeGlFGnlUNsEAhSRpXmXDDccZWSNW
         kdR/Vn7Gh1dIDA+wOmV1tHZfVV5K20Vvyfz0OtLXTgYZlI6b6ez2kW/hkL+gzVeGIypu
         AAl3vAMMaC0WfHSH4rl1+sC8mz8UAHMf5nfqOxoBUQAJDwfzjWZ8JgjljowjfLkPBanx
         CNvMfbBXkLyKjVHe2KZqjYfkl2WmmFs4yJdr+5tfOTutfoiJTUbdNnJ0MyPcjovsdNVe
         +g5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953772; x=1789558572;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7cy5kq8NLyuBLDyhds0rj5QIT86At3JxPMpPLWi50Ns=;
        b=Ynt7/aLS2bbMURs8zEhqYv4kr69mYtsdGLvHYRPALgOswNqIuVrHmRm67ohIxXjxWO
         n/G6IL3lHDPj6a6Pw1sps43C/64ybKQayzLuXklctnbpUnn0Hq72iufkbb+RwqPVaFpn
         F1sQ3Hnue245FwyItKdj75+npjWA6uEAGVoJt8eXhBtMiy9rKq9Da6cv9zsgwXnE7Eoh
         p65NMVBNzE/1hUfq3KcgL41zGpTiwZASbj0CIssJLLFzvX4yCPY6E8nrh2eqdwsA9uyK
         B01gV9me41GsJrkRvfwmGxWlwdvCWCFZ4Yuj5DKvCpH8NVMidyGPJSKLUl6/uQluARjM
         QPCQ==
X-Forwarded-Encrypted: i=1; AKwUvBww2ekOWcaD82Jt00OOuCxEUyOOi+YHFuft8kDMojv09dDRkiraBkhzQGDEYcZY/zIa5ziSGK65MVRaWh8=@vger.kernel.org
X-Gm-Message-State: AFuF++l2MP4tKttycs68iskSHmbvrhSKbHFEcR5qSG2w4WLaxGoeL6HE
	Dnk1aGAp7zH2DPhdujCYc2F+R8KzejtysYQGUDgQF7nKsQNn7ZGAiyor
X-Gm-Gg: AYBFou0Z9uJPKMNrF+8X3sFW3u/xnjILr5fvgF2EHQN2lYcN6k2C+Fq56T3AEtGbztl
	9GMfZU6GMhWXO09ZH//sPsBuSmOcXwvZ7qiTIHpd9SoCFFIo1ktMACkQb4DZK2VycbupE4KIgER
	ROKm3p0y7k0r3yK24m9ZiP1uhuudr1BWiCKhqTTb7La3eN0xW48ITb5SF2NgeFtvMf8gJ0y2tVD
	TOFQbWvKiKT7hzu4P6Dqy2bJ+Wr8rwqHd/g/8V+JIOFSI22rIaxhzCDU2HdMC1qNnPD16u917F2
	zhp5TA3OSno29cmtIv1NsuQ0dyQGj4aZGE7n0ttVPcyAJY821cQSTfUf7RBLdCo6e5UVwoGZ1SY
	SvwqilGeYINqbDPGgtZ8FpFfcOOAVWSxJeSkZ1oRfhebq+VDXwl5FpJVujFAvhL6Eagxxq2ufrI
	XDb/1LaTU4C+aWqqs8PrVDBDb3QYt+sisTXKOwhQZkxnmcePboFvHcYtvBTasQg4M9dy4=
X-Received: by 2002:a17:906:9fce:b0:c25:b597:60bc with SMTP id a640c23a62f3a-c260ca366eemr1395754166b.23.1788953771441;
        Wed, 09 Sep 2026 04:36:11 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa5acsm760598366b.12.2026.09.09.04.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:36:10 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:36:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: drivers/mtd/nand/raw/cadence-nand-controller.c:2956
 cadence_nand_init() warn: variable dereferenced before check
 'cdns_ctrl->dmac' (see line 2918)
Message-ID: <202609010758.3N8tYZdG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cee9395acd8043be0644b25c34bfa86623f2b935
commit: 5c56bf214af85ca042bf97f8584aab2151035840 mtd: rawnand: cadence: fix DMA device NULL pointer dereference
config: i386-randconfig-141-20260831 (https://download.01.org/0day-ci/archive/20260901/202609010758.3N8tYZdG-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5c56bf214af8 ("mtd: rawnand: cadence: fix DMA device NULL pointer dereference")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609010758.3N8tYZdG-lkp@intel.com/

smatch warnings:
drivers/mtd/nand/raw/cadence-nand-controller.c:2956 cadence_nand_init() warn: variable dereferenced before check 'cdns_ctrl->dmac' (see line 2918)

vim +2956 drivers/mtd/nand/raw/cadence-nand-controller.c

ec4ba01e894d31 Piotr Sroka         2019-09-26  2871  static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
ec4ba01e894d31 Piotr Sroka         2019-09-26  2872  {
ec4ba01e894d31 Piotr Sroka         2019-09-26  2873  	dma_cap_mask_t mask;
5c56bf214af85c Niravkumar L Rabara 2025-10-23  2874  	struct dma_device *dma_dev;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2875  	int ret;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2876  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2877  	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
ec4ba01e894d31 Piotr Sroka         2019-09-26  2878  						  sizeof(*cdns_ctrl->cdma_desc),
ec4ba01e894d31 Piotr Sroka         2019-09-26  2879  						  &cdns_ctrl->dma_cdma_desc,
ec4ba01e894d31 Piotr Sroka         2019-09-26  2880  						  GFP_KERNEL);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2881  	if (!cdns_ctrl->dma_cdma_desc)
ec4ba01e894d31 Piotr Sroka         2019-09-26  2882  		return -ENOMEM;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2883  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2884  	cdns_ctrl->buf_size = SZ_16K;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2885  	cdns_ctrl->buf = kmalloc(cdns_ctrl->buf_size, GFP_KERNEL);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2886  	if (!cdns_ctrl->buf) {
ec4ba01e894d31 Piotr Sroka         2019-09-26  2887  		ret = -ENOMEM;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2888  		goto free_buf_desc;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2889  	}
ec4ba01e894d31 Piotr Sroka         2019-09-26  2890  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2891  	if (devm_request_irq(cdns_ctrl->dev, cdns_ctrl->irq, cadence_nand_isr,
ec4ba01e894d31 Piotr Sroka         2019-09-26  2892  			     IRQF_SHARED, "cadence-nand-controller",
ec4ba01e894d31 Piotr Sroka         2019-09-26  2893  			     cdns_ctrl)) {
ec4ba01e894d31 Piotr Sroka         2019-09-26  2894  		dev_err(cdns_ctrl->dev, "Unable to allocate IRQ\n");
ec4ba01e894d31 Piotr Sroka         2019-09-26  2895  		ret = -ENODEV;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2896  		goto free_buf;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2897  	}
ec4ba01e894d31 Piotr Sroka         2019-09-26  2898  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2899  	spin_lock_init(&cdns_ctrl->irq_lock);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2900  	init_completion(&cdns_ctrl->complete);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2901  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2902  	ret = cadence_nand_hw_init(cdns_ctrl);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2903  	if (ret)
ec4ba01e894d31 Piotr Sroka         2019-09-26  2904  		goto disable_irq;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2905  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2906  	dma_cap_zero(mask);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2907  	dma_cap_set(DMA_MEMCPY, mask);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2908  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2909  	if (cdns_ctrl->caps1->has_dma) {

If cdns_ctrl->caps1->has_dma is false

2b9df00cded911 Niravkumar L Rabara 2025-02-10  2910  		cdns_ctrl->dmac = dma_request_chan_by_mask(&mask);
2b9df00cded911 Niravkumar L Rabara 2025-02-10  2911  		if (IS_ERR(cdns_ctrl->dmac)) {
2b9df00cded911 Niravkumar L Rabara 2025-02-10  2912  			ret = dev_err_probe(cdns_ctrl->dev, PTR_ERR(cdns_ctrl->dmac),
2b9df00cded911 Niravkumar L Rabara 2025-02-10  2913  					    "%d: Failed to get a DMA channel\n", ret);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2914  			goto disable_irq;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2915  		}
ec4ba01e894d31 Piotr Sroka         2019-09-26  2916  	}
ec4ba01e894d31 Piotr Sroka         2019-09-26  2917  
5c56bf214af85c Niravkumar L Rabara 2025-10-23 @2918  	dma_dev = cdns_ctrl->dmac->device;
                                                                  ^^^^^^^^^^^^^^^
Then this is a NULL dereference.  I reported this bug in March.

d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2919  	cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev->dev, cdns_ctrl->io.dma,
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2920  						  cdns_ctrl->io.size,
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2921  						  DMA_BIDIRECTIONAL, 0);
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2922  
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2923  	ret = dma_mapping_error(dma_dev->dev, cdns_ctrl->io.iova_dma);
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2924  	if (ret) {
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2925  		dev_err(cdns_ctrl->dev, "Failed to map I/O resource to DMA\n");
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2926  		goto dma_release_chnl;
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2927  	}
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2928  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2929  	nand_controller_init(&cdns_ctrl->controller);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2930  	INIT_LIST_HEAD(&cdns_ctrl->chips);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2931  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2932  	cdns_ctrl->controller.ops = &cadence_nand_controller_ops;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2933  	cdns_ctrl->curr_corr_str_idx = 0xFF;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2934  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2935  	ret = cadence_nand_chips_init(cdns_ctrl);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2936  	if (ret) {
ec4ba01e894d31 Piotr Sroka         2019-09-26  2937  		dev_err(cdns_ctrl->dev, "Failed to register MTD: %d\n",
ec4ba01e894d31 Piotr Sroka         2019-09-26  2938  			ret);
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2939  		goto unmap_dma_resource;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2940  	}
ec4ba01e894d31 Piotr Sroka         2019-09-26  2941  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2942  	kfree(cdns_ctrl->buf);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2943  	cdns_ctrl->buf = kzalloc(cdns_ctrl->buf_size, GFP_KERNEL);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2944  	if (!cdns_ctrl->buf) {
ec4ba01e894d31 Piotr Sroka         2019-09-26  2945  		ret = -ENOMEM;
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2946  		goto unmap_dma_resource;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2947  	}
ec4ba01e894d31 Piotr Sroka         2019-09-26  2948  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2949  	return 0;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2950  
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2951  unmap_dma_resource:
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2952  	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2953  			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2954  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2955  dma_release_chnl:
ec4ba01e894d31 Piotr Sroka         2019-09-26 @2956  	if (cdns_ctrl->dmac)
ec4ba01e894d31 Piotr Sroka         2019-09-26  2957  		dma_release_channel(cdns_ctrl->dmac);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2958  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2959  disable_irq:
ec4ba01e894d31 Piotr Sroka         2019-09-26  2960  	cadence_nand_irq_cleanup(cdns_ctrl->irq, cdns_ctrl);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2961  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2962  free_buf:
ec4ba01e894d31 Piotr Sroka         2019-09-26  2963  	kfree(cdns_ctrl->buf);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2964  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2965  free_buf_desc:
ec4ba01e894d31 Piotr Sroka         2019-09-26  2966  	dma_free_coherent(cdns_ctrl->dev, sizeof(struct cadence_nand_cdma_desc),
ec4ba01e894d31 Piotr Sroka         2019-09-26  2967  			  cdns_ctrl->cdma_desc, cdns_ctrl->dma_cdma_desc);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2968  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2969  	return ret;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2970  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

