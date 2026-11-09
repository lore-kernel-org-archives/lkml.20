Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235775;
	b=ERSgjgLIEmskMR9qGf5W58lNCrwgOZYfbEkrPuK8JRICiHzttAhgA3X/QtxdJ13cYL+O
	 yoYo3fFC7l/Exz5Vtzz5BZ44BgVM6MiBydYW6yJiYTiruUweMEg1Lmabj4Q232kUd1EP1
	 BAdBHPeb/G0Nwy7BLQzW5K0LfjlOpG94SRdI9CT4hR4CuqxqJzKUFBAnnLvJpi2QsD/r3
	 ki5mvLfedQGp1GYmyBVGh/XstDT4ZvCmt/HZ9Rt8NXmuewLkLCBEm3yRPQLMQdEeg9Rf3
	 6gOqUw46zPgrPH0yLNoVQxQtEwaa+8MpgF7rg51Z1mQ3v6RDF3VDOfq9u1RVCay5vrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=IrVeQKBGEQiIhXPASB7aO1B/hnuopAlb12g77nEvd+E=;
	b=QFI6Z2nGG973ZxzpWKTsBOGR4rUpBk9hZHYmcwZ5bHrUfWdKi1L8z4GTjfHh+KMxiooE
	 lTVGoYZ+EF0ey790lNLask/NK3YENJJIDOSQ/m+vUanfmRiGPtjwszNVFQpYyR2C9lmQS
	 kGcyV+ZHdeimyIfGR55WMyH51IztSNgdfrxKhesPyjy/rBk2axugwEcxOtSV2d/qKHaks
	 qEecVFSAxka6R1+NybMzIuQcRJoW2lAqnmhGYAIxrVcPPwuhUuWU/0HQKhyImRrQD/JYz
	 w8WgcpJMlrCN7BRFkkWIBiAJ0QwwfDg2aeggj+wFTPyxCiLcxvYmVpIkSzZr1l5gSEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qSn5tCrS;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16388606EE91
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16388606EE91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qSn5tCrS
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0a2a44a0cso540194a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794235774; x=1794840574; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrVeQKBGEQiIhXPASB7aO1B/hnuopAlb12g77nEvd+E=;
        b=qSn5tCrS/iALUW2o29JpfVBSC/w/fuTlQyt/hQx5xjXyDT44VJzAaYeyiRe/6E13sV
         t/qlPhC87Um1dLFpG5KpIWiucLgomJuohWRGOypg0smWoG0t381yvGx+URJcaEX1XHdk
         kU05gVVRPg+aY1gnXsaOEJU4GylzKYcD9Ji2q/79g1AxgBbhW2ePpEhgvcwv0OwZmEPx
         JPM3A/U5YDvoU1ozBWcDBptNRytaOQbMJyeYyQFGo+SbyuFgSHdiZPORt/oRysZKvU4G
         YSXBWIQFBiS9bwlRZ5c0Rqmnbc9yb+dQG1h6v62selmhfmVcoywKT48t5H+ck2eXNHMK
         uLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235774; x=1794840574;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IrVeQKBGEQiIhXPASB7aO1B/hnuopAlb12g77nEvd+E=;
        b=D/S+fAY1YMJWg7rIptHumWlCMxUUAbfiWzg1HIG7pOGpxiCWEE6LG1mxqI+WCFSmjG
         XvwN/UKdrx+tZCCEddGC88SwDiphLwxfwvYR224lYswICKKOnoEpy9cciICgVhwkCV9U
         O2uobkP5f0g0+SZmjxFXsvCyCLVK/fu5wciJGZpmf1RlknqKFak507ZILv3XV6NfwORU
         coWQ+CP41ouYAGo5ygEmQZ6vJHxpKF1LrH063mjN5jBees0dtJc5O3PcXkbbYekAtDw4
         8vQs9T3iw0Z2AiABpf7A4O0VPEwi046gTtcgZF8G6phJ9lPxXurHyS1k4KrxZzgUb1Gp
         wZ6Q==
X-Forwarded-Encrypted: i=1; AL+hErEGRRvfC9OLdr2Ri3BYgC7fMvLdKquukV5HScHAeSjt2Snz/bPzcmw9EDicgnpGahA0ZTRv5saiSVUUXJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ThGwHEZeDAdH25YxZABA/WLPjKVLrZ7CH3Xda97cbhOcHHywx
	w+P6vjXr9X2MKx1x5BcloHXZRhFuA1L2kbgTl7+qGncS7qmGOlksnq0FjyAeMKeR0m4=
X-Gm-Gg: AYBFou0odbsxB/vA/4YzdfZ6QDz/bZlvombWmZfLNCFGX1pgG1pyTz3S86muEaxNIfM
	h09QWn2MhP2rYCeenhfSDG0dn0QGhQX01k21fkXOL3kEswh1h30sd1IZMQIITGQ7E0a0d2NPM5H
	+Hw2b3VSyGemX4cbYJyHniLci/zUxhG0gQMqrvxycqKMtQt4tPvF7ZknoZH3458rX7G84ls3ioK
	7eyl3FwNv5uRQYv9POteOh0WgFu76GfnYKPciG8l0UNA8G2/H9mFH1dmBL+rltmk+iJogRbiUDu
	2rpkw+jQijoLnoIYErhVqHIg5Ts74CxAOIIU7nErYLtzwi5g+ahqfeREf5jN8XPagflDWE0a6gw
	CZGcn0hXiOTUPXgFE4cedfw9uVAMGtumoxazwUZfIEax/IVs7DeNQ4atXqNYdFkMr6pbJM7WT60
	9EuXxXD3pwgrFz+GCUlpCjGJgaWCoPn6glb3cO2durCJysplAtTJZAjJgZDUVNvmFjAs9XtDpdP
	2qciodrWnVkSb2A2gd2whLOCCNaa+hOfSwRi+8JHOjbM1m+aZyEReaGt0eaTYjDfcZw8sY/iZSy
	VFcMm04GcVKtjmOy7uDl4vFmZ5mWkA==
X-Received: by 2002:a17:90b:384c:b0:3b0:9317:5849 with SMTP id 98e67ed59e1d1-3b12d1080d0mr4128385a91.1.1794235774376;
        Mon, 09 Nov 2026 06:49:34 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc27e829sm6647786a91.0.2026.11.09.06.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:49:33 -0800 (PST)
Date: Mon, 9 Nov 2026 08:49:31 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: sashiko-reviews@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <avHde2RgEUtQj846@p14s>
References: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
 <50647b7d731fa54fdc3e2869f02de2096acdcff2.1793879714.git.u.kleine-koenig@baylibre.com>
 <sashiko-outbox-198999@kernel.org>
 <auyGiW91Ir0JcuxG@monoceros>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auyGiW91Ir0JcuxG@monoceros>

On Thu, Nov 05, 2026 at 02:41:37PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Nov 05, 2026 at 12:10:05PM +0000, sashiko-bot@kernel.org wrote:
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index 00019b1895e6e..e750a127cbc4a 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -75,6 +75,7 @@ enum rsc_handling_status {
> > >   * @detach:	detach from a device, leaving it powered up
> > >   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
> > >   * @da_to_va:	optional platform hook to perform address translations
> > > + * @memcpy_tova:optional platform hook to copy data into remote memory range
> > >   * @parse_fw:	parse firmware to extract information (e.g. resource table)
> > >   * @handle_rsc:	optional platform hook to handle vendor resources. Should return
> > >   *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
> > > @@ -99,6 +100,9 @@ struct rproc_ops {
> > >  	int (*detach)(struct rproc *rproc);
> > >  	void (*kick)(struct rproc *rproc, int vqid);
> > >  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
> > > +	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
> > > +			   size_t filesz, size_t memsz);
> > 
> > [Severity: Low]
> > This isn't a bug, but is memcpy_tova the best name for this callback in
> > struct rproc_ops?
> > 
> > Across the remoteproc subsystem (such as in struct rproc_mem_entry and
> > ops->da_to_va), da denotes a remote processor device address while va denotes
> > a kernel virtual address. Since rproc_elf_load_segments() passes the
> > untranslated device address da directly to this callback (including for
> > devices where remote memory is not mapped into CPU virtual address space at
> > all), calling it memcpy_tova seems somewhat misleading.
> > 
> > In addition, when rproc->ops->memcpy_tova is provided,
> > rproc_elf_load_segments() skips both the filesz copy and the trailing
> > memsz - filesz zeroing step. Should the kernel-doc comment for @memcpy_tova in
> > include/linux/remoteproc.h document that implementations must copy filesz
> > bytes to da and zero-fill the remaining memsz - filesz bytes when
> > memsz > filesz?
> 
> That's a valid concern. Maybe `populate_segment` would be a better name?
> I considered being more verbose in the kdoc entry, but all the other
> entries are very sparse, too, so didn't want to add a 5 line comment for
> the new callback among all the one-liners. But I can if you tell me your
> preferences.
>

I would stick with ->memcpy_tova() to keey the mcmcpy() semantic already
rproc_elf_load_segments().  But yes, go ahead and add the 5 line comment.

 
> Best regards
> Uwe


