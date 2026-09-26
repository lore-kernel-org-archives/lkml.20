Received: from mail-wr2-f22.google.com (mail-wr2-f22.google.com [74.125.225.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A773E49E2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790433484; cv=none; b=fFr+gPsaDVL540bmDAxDZM6oVvVCis2LuxGIy3NACOV304DJteSPjCLI/4IUkHUql0tszopre64MbTTJ97+8ILxrn2r0BcWEbeVR0/MMUKB2oKUSXjm2zNAG/EBo+YpXh9/87t08uanKdV3fdavbO3R66/2s+TKLA6kOjUrHqSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790433484; c=relaxed/simple;
	bh=NtdMJkvpRXEnSa/4Oit1L1q9EKbg2wA93OXP5lY0r1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhpRXmDjIJkRRbLy4jsbGyb8k9I8YRWTPZOVSnGXldjOMhia3GxNgwi1E5k388rbTzHEmm/8AsyEt0d/lkGmxyZHF9/REzF/nhLR4OHFExlij/tGCRCKQjGdw8cO3fPIkNwjxQoPUDwgK/D+IRuFwUlR39keFgutpZYbNVKL1Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eweI3OCk; arc=none smtp.client-ip=74.125.225.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eweI3OCk"
Received: by mail-wr2-f22.google.com with SMTP id ffacd0b85a97d-4887d06c669so1307162f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790433481; x=1791038281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BoThG4thxlXrTbw7oMamnALAxxBbKFMtz3aQO6xHoEQ=;
        b=eweI3OCkW76Yrwqm+MqqjT05T8WaZHjbvwjv04dYuLGw3+loydhLv98XaGQK2rAFZf
         okKvD7SKS7H57aHVMdYf8Md9LoKlsk4uE0IX3KQzSmK/AgIIlgLENCMvPo4CYSZtzwWq
         X5yARuZEfyvR1y6V4NhQwmqNK3IB4JfJzissdA+2CT4FkylBGUl9o2qaioISEYPWrX0W
         K30ZfkaJVUSs3zHkEcg1w/qVqsozSBAw0MC3wTYRgnrk2mj5C4L6t4gNkTJZQhYdJK7Z
         67dA46DAhwSoSOC0fIHodgzq96vinFIe+ZkARPc5tstwoWy6Snv2riT4l+DFeoTxCwhW
         Tfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790433481; x=1791038281;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BoThG4thxlXrTbw7oMamnALAxxBbKFMtz3aQO6xHoEQ=;
        b=qMkWStyekJXRoDTZW/qeUO5GNIa5bUlqDbINbjVBWFP7jOZStn1Bgr1ecQA9Uc/8+M
         Coj+E4b/O3DlbT4hw3keLW/1DjZUJzk+z8FPmvcl4Yk7Nxut+qaEG9hQ+LyoDMw9kR2H
         RXniDXBms/Wn8j13UNV9oqwVX/veTSnD5hvuvRWpUnlBCMEBae+Az6bsSKNfRlCkhS4i
         8kxhwL0rYSY/r/2XyQSJX/BDcb6vjXKgNTLwiwFSRL7q5xS2wIEbV/cqjRBKBWPPG3Ij
         rK8DVb5nmQqn/8keztz/n27PDqVzapG74zrSkZpSILFPWhzZLaM5nwHl6XPXgWAk7yO9
         opSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRysvD3FmfRzIFGA92ytrVF/nY5NRCYsA5RG2NJ+0o9N/l+nVXmwxiHsstWJVjWNEvWyZ31bkbmxCUlI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYISNJC2mNFYhAJTRL4yelzROQo2yM4B/fI/Anb0GZZghdGr2baR
	jiGBgd2XJ1o1uhwdSx4d+eF2lF3h6b8uiosGAygrDcJXlVuOzqSSOENi
X-Gm-Gg: AYBFou3A5H+Em9xAyFcPTBMp2TlXdazpX7CoxTTBxZoUP5enllX1MSB3tfZs72HXHwU
	JIrbCvONHlosq7Ogv0Mk82aIfr4myJg9ft0GbFc8kxIqHBM3lX21vG7XH7B5dnVRiEjV+Ub1T/E
	8DzyFo3nWEv0V8Ta7p31h+Hb4JYamMib3x1J9ZwGetI7vNprTuSd7944xAHgxlF/kEIbUqQNh3i
	Z47jGi4N46bwUHYTQ3vCqS4g1c9uFrUDJKAcpAAdZh8KVtiyD9NaDbOPwaQdq5t5lQeLnQGnm7J
	4h37fsHpKL0cExT0oQFmiBeZp8V9MbtN4WiZSscVJtAngDSeJtCl/EyHMtpKzujJYK1wxrBEyS8
	bmkahJ6Il/qohecABmipblEh00RzeXupAYxzrQNG6M6gLeSQ3j7p7Y6AoNRbpEj+2jZmKje74R6
	tkiBPb0IsfuduFUMA2QTL7H1WVUFXzCC6wFq+QloWQ7Sn3BXx3piiV1kqsNbDCBVNL/vTeGJSWp
	4TM4g==
X-Received: by 2002:a05:6000:25f7:b0:488:54ff:67c9 with SMTP id ffacd0b85a97d-48872ac7587mr14732310f8f.46.1790433480936;
        Sat, 26 Sep 2026 07:38:00 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349a0esm20798420f8f.10.2026.09.26.07.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 07:38:00 -0700 (PDT)
Date: Sat, 26 Sep 2026 17:37:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: shengjiu.wang@gmail.com, xiubo.lee@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	festevam@gmail.com, nicoleotsuka@gmail.com,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsl_asrc: check the second front-end DMA channel
Message-ID: <arfYxD95RJRcKCbZ@stanley.mountain>
References: <20260913125147.109920-1-bolin.liu@seu.edu.cn>
 <arfGajXmMUeew0fr@stanley.mountain>
 <20260926141011.451552-1-bolin.liu@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926141011.451552-1-bolin.liu@seu.edu.cn>

On Sat, Sep 26, 2026 at 10:10:11PM +0800, Slavin Liu wrote:
> Hi Dan,
> 
> On Sat, Sep 26, 2026 at 04:19:38PM +0300, Dan Carpenter wrote:
> > The ->get_dma_channel() function pointer returns error pointers not
> > NULL.
> >
> >     sound/soc/fsl/fsl_asrc_dma.c:254 fsl_asrc_dma_hw_params()
> >     warn: 'tmp_chan' is an error pointer or valid
> >
> > sound/soc/fsl/fsl_easrc.c | (struct fsl_asrc)->get_dma_channel | fsl_easrc_get_dma_channel | 1
> > sound/soc/fsl/fsl_asrc.c | (struct fsl_asrc)->get_dma_channel | fsl_asrc_get_dma_channel | 1
> 
> Is this a false positive?: both implementations return
> dma_request_slave_channel().

Ah, you're looking at old code.  It changed from NULL to error pointers
last week.  The dma_request_slave_channel() function was deleted entirely
since there are no more callers in the kernel.

https://lore.kernel.org/all/20260918113727.1898998-6-andriy.shevchenko@linux.intel.com/

regards,
dan carpenter

