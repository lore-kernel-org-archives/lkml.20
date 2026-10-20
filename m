Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516253;
	b=4z0SIAYxrL/gxfPdCmS6Fgo19oLgHdmawuse71d1d3RwC2Wr1xvxh7roo+2wRPuRlgK3
	 3s26ckrmrr1rO4WLyJJpylZQQEDrWLzMHfR2sXzmFTg6othOko846LkHd+SxytIyTgb4j
	 TAqxDwFjABJG/ihYH3wj1e9i8x8jbiYTy/gJQh3feGYFq3MZJmKR1mOCiBzK0RleVqrgs
	 oH+PXBSu6Oo1uWMCTPMmnJRKqHalH8S10t0xUvos2524qyPiCO2JOI+RZTUE/sQLXI6ML
	 3ytFHwa2HPDEI/9k6K4ilZUQN6a3h4Jhkk+vkAcwqk8KtONcjdndJ/KqpBOuRwIu2MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516253;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:CC:Date:Message-ID:In-Reply-To:
	 References:User-Agent:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=VJqkIiPNVDYg99+7WtjqOTUKFy/SQG4E1Zt5xkilM1s=;
	b=qBJhY07fFZx5pclvqAgQ8dw20us43lPoCIU0PXu1fJ1s3OAmj9bxSlgeoZDbVftG9eBw
	 nnBtErRvKAtohZQMIqPwlr/Hs9iCE2l7wCM/0VkmbbA2FaodOBTW/QS2OgfpiBB0qWkYz
	 aw7hqTWzYnnK1X+AgFp7JK5yM5lVqvDZI49ctELte36IM/Xawbpcrca0RltMDSwTl9/Yc
	 b2nz7Qgc/owh7Sj2RDUARGtpNKgpmYArEEb6/XxtkfzRrYCFYyJJs4iuWBmlItTnvK+6d
	 DBudX4oOe5297V4P/cV/9NX4cSvY4G6YGKTav0iKMH2gaYo5Gws3mihBT6JcSLTDyxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FfFkyGYe;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F524606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F524606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FfFkyGYe
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso2258628a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792516252; x=1793121052;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJqkIiPNVDYg99+7WtjqOTUKFy/SQG4E1Zt5xkilM1s=;
        b=TCMXP7Iu/jnvii6xRUYlsTQ53bgf8v+K0MOVW8USVGghNZdKi/TYyuVCW+y7js3NKJ
         JndANxNG3kNV4aPLtrdPXsUvQ65i2Fe4erI2Cov3OXG97Yn2228GnlclqT8ymzzkhEeu
         ApPvfm8eHW9mmMuEdcV9maIQYinC95XrReeoCexSjh2bcgv0dbre2k7EByZobWU9/F+1
         qRoVAsce4uQXUFAaLbuYCGzW0YzqOrbkLVp4n647pmCnDU0yjJXFXkl0WGYBt/DnEHzJ
         n+L2PyOoQTb2BekC1KvcvtLIH8mIW/K1pT9sWM/sehGmXdItBFUFIzz3pboHHwENKe3q
         3iog==
X-Forwarded-Encrypted: i=1; AKwUvBxJV2nIP0Worn0J9FCSPSYdDKkuUOppHAdAfExS6vy426q6WQKLMbZMwtLMYzgnIwHgjhF6//FNOYcCZXw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdCSDoI85DJXXv9G68tQhQIaIu3WVZ1Qwg5nZCQvAeAyUprTyO
	QcS0klRhDbNH851q3Likjcbf4wol5BpjWxMDE0Tr7Q0FpKnXPPKg+rc0Kv2jEjnVS+GC2jp2Bxk
	kjhAkYRGwng0MbuxwUmsoe66XJBGkttOj0okIfRTfRd/h+9cwdRtxGRICFfOfUq7Y727eb010Ti
	S3QjwSWWc3F3So6fY9MiFhwnlON6q3lqAqKDIWvFi46bNsalvsvsUuKiymO3y/gDQfSlqdoaVHm
	iNnhi1rBJ9+Cztscv16x/E=
X-Gm-Gg: AYBFou1jYaqvyjgb1w0XXsgO/E08GBw2J1QAGOCeuqKYf4GlJL6aJ2HetMw6T/q3uUR
	1h1FxD+W8tposhuGYeqtC5LO69GPFI3AvZT5xG2sVth4cqFWCUWoPe63XY2kYjspBtCPeyid5L9
	g0kxpWeLiSp75XW6/4Zq2o0eSpNvA1uCZK03DG2HS9RIDowm48wumW2URHEOjgOTVgFSew2FSOu
	SdmYedzwksvZd8v8qIYrLWURc3GgvjOXw02VwlBlO+NgbAGXujgOvnCw5TJmjz7ExosGG2sJLA6
	IBP2sGCozB5t1kWsv4tN74pXgA0CWkVVN+wcfKTW5v3lTHP0kvRk125Ru+b/mRwffOI325o4jKy
	HWJjlTiIagtWK4kLGkCcWi1hTJIDCk1OjITqiBjwRL/pc2g+qrH13ulaWxz+M+XnFvhqDWx2ut8
	AAgo2mebL11iNssToZfclnmaamRE+wHlH47TZVEKw=
X-Received: by 2002:a17:90b:5408:b0:3ab:d45c:59e2 with SMTP id 98e67ed59e1d1-3acef59e499mr10369608a91.55.1792516252306;
        Tue, 20 Oct 2026 10:10:52 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ad830182f4sm24820a91.2.2026.10.20.10.10.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 10:10:52 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179a556c43so77358016d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792516251; x=1793121051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJqkIiPNVDYg99+7WtjqOTUKFy/SQG4E1Zt5xkilM1s=;
        b=FfFkyGYeNh8NDOWMMRF9OUdYUtWCgjUEcWhgzyFl245kBo+btyXy5DuI8hZEb/Aj4k
         STM9cYu0+QfGMKNdIZBWKgsDFCNdIk20k95rLQbCGr0Kha9xyNPmzsyq+SlnEIWnQEqS
         A2Yt6pn6Sor+SHAlhSW7sYixaTWsBB3p3M4E8=
X-Forwarded-Encrypted: i=1; AKwUvBymMVyifnG2O/Z/83qWxVqpcEuMdqxd3IYGnYTwRZs9+CbsUemIQIhm2KEcmk4QzzdFzbeppqEAtUhJ2PI=@vger.kernel.org
X-Received: by 2002:a05:6214:250d:b0:914:51b1:6161 with SMTP id 6a1803df08f44-91bdf0df624mr198193746d6.30.1792516250833;
        Tue, 20 Oct 2026 10:10:50 -0700 (PDT)
X-Received: by 2002:a05:6214:250d:b0:914:51b1:6161 with SMTP id 6a1803df08f44-91bdf0df624mr198193046d6.30.1792516250202;
        Tue, 20 Oct 2026 10:10:50 -0700 (PDT)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10c48c49sm2815656d6.41.2026.10.20.10.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 10:10:49 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jason Perlow <jperlow@gmail.com>, <aditya.garg@linux.dev>, <baolu.lu@linux.intel.com>, <dwmw2@infradead.org>
CC: <iommu@lists.linux.dev>, <bhelgaas@google.com>, <linux-pci@vger.kernel.org>, <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>, <regressions@leemhuis.info>
Date: Tue, 20 Oct 2026 19:10:46 +0200
Message-ID: <1a15a4b49f0.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <D0E6473C-3234-4367-83E7-B85C022B0F1A@gmail.com>
References: <D0E6473C-3234-4367-83E7-B85C022B0F1A@gmail.com>
User-Agent: AquaMail/2.7.0 (build: 200700061)
Subject: Re: [REGRESSION] intel-iommu/brcmfmac DMAR fault on Broadcom PCIe wifi, v7.3-rc7 -> v7.3 final -- candidate mechanism and proposed fix path
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 20 oktober 2026 18:02:30 schreef Jason Perlow <jperlow@gmail.com>:

> NOTE: an earlier report on this bug from us bounced off one of these lists 
> due to HTML/multipart formatting from the mail client used -- apologies, 
> switching clients. This mail includes the full original report plus a 
> follow-up, merged into one self-contained report since the original never 
> reached anyone.
>
> === ORIGINAL REPORT ===
>
> Hardware: Intel CoffeeLake-H platforms, various. The affected device is a 
> Broadcom BCM4364 802.11ac PCIe wifi adapter (14e4:4464) at 0000:05:00.0 on 
> an Apple MacBookPro16,1 (T2 Mac). Aditya, including you directly since this 
> is T2 hardware; copying iommu/pci/wireless because the fault signature and 
> the fact that it reproduces on only one of five tested machines (at the 
> time of the original report -- see follow-up below, that has since changed) 
> looked like it needed eyes on the core IOMMU/PCI path, not the driver.

[...]

> THE ONE ANOMALY WE CAN'T YET EXPLAIN
>
> Despite the last two items above being unchanged, the actual generated 
> .config has CONFIG_INTEL_IOMMU_DEFAULT_ON unset after make olddefconfig 
> against the rc7 source tree, but =y after the same process against the 
> final source tree, even though our template explicitly answers "# 
> CONFIG_INTEL_IOMMU_DEFAULT_ON is not set" in both cases. Our working theory 
> is that some other symbol started selecting/implying INTEL_IOMMU_DEFAULT_ON 
> between rc7 and final -- which would override an explicitly-seeded "not 
> set" answer during olddefconfig resolution -- but we have not identified 
> which one yet.

Simply run make menuconfig and it should be able to tell you how it is 
selected.

Regards,
Arend>


