Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794917999;
	b=24BAzoT7P/lbuG8B3iZOkcH8m28QtbPz+i9akRmX0FSJc8XZ0hzuv/IkLvl6RgXkRpuF
	 rrYZuslre5PCIjQr56KQRKOWJ+BWDSzcpaVX7zpUDA/V8u6k66E+GyN+yd8eIK1fytusM
	 avJ9W9UrMbrs8k0DqMRUI0z8dUPmj4YeANKJA4OsGAolCLmz4k82QHmO8DoIdekjf8/Qx
	 RG4Ev1TU68Hs/SLZY6I/zwSLGnwbGwkAiy2RZaSPAR0xv79gm25ckPuAA4ILrcuCwrSHx
	 9eLLY4a0FKGp6Xfcz27RD+81q5z/bAAI+XpLaS2HnUrFBkFvSQUFhNxmi58fNXU68BA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ZFVJi+i+sc9nYgluytKQGXSriWb6Sc1xPMl64Y6JsfM=;
	b=KhMVPZ12Tz+fGEM2iajAcE7pb5nrRcKzYEpjLEcqng9hpQ76K3HxnHUiUvBXOAVyd6tM
	 XTrHQBaD1B5Cd/6CAWoWucSQFCrpgjTKMUY+TxENOrAOmGvU/B/6I7jBOewgyZrv8qE0T
	 +RuinskjNxuKngLbZS3k4YvvAc1IsIXnpfKOddfdpBdMalhkKNimu+v98+rlHPFfJ8SOk
	 4ocFgc8ibor+p/y83WnK4F2Uyyo3X9yHG603GI9DrjLE/ki6zvLR5dh76q/6bTrcoaLEf
	 9ExE2Zsyp7WaDlpTp9OmH6XfzS+fA196shNZQSK2zk7SxYuMFhqTI5eFlzTQKT8SL2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oz3feJS1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D61606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0D61606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oz3feJS1
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so851450a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:19:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794917997; cv=none;
        d=google.com; s=arc-20260327;
        b=bmhw+HhbYqJ32Gv78uqhoehNFTmaQ6fhTKNrHmfriyy7f+PZLLbiSVYAXwPNXY6JiO
         R2+Rub9d7mCrl5kggH1Sg6i2r5NMtwL3qi1Qh/BX5dkKQn7RKL6DtHdg0/4u5L+Ziy6P
         fq7KNxEjkos25GjQE35INmNZLvJGp/y/IscQ3rARGT4YPJGvglRgh5eRo4VeqWN0iDRl
         doob6qlAzKlHytDyDmKSE8ersz4YNlBtQlAZRa2AHNOWjb/EvTTeU6zZHw1dpfpfXJLh
         AnMRH/mA+yS6M7nCfIyHt2Ht/m3J9wJItviadyG986r3WTMScRmq0pRJfAzpUfXj7WgN
         Jzng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZFVJi+i+sc9nYgluytKQGXSriWb6Sc1xPMl64Y6JsfM=;
        fh=EMq5y/TMRtsVvAJb4CcXijJ6l2Cpkj6jdvDywfO8Zek=;
        b=MK5bd7U6Kwg687A2YSqc04ciHmCN3W3sJ/2+p4DrA0Zr+U56yfo3B5bbLSlXPUA6uh
         3XrhneEyjJcFH9ESo5SDTu2the1KV/GcwGxzRADUnaK8MS6CTSwlHH51vOTRo3XAGfb/
         2/Vz9aPXa6PRMX6P0w5bJ9ty8cNQXiDI7JIKYQmJdU8Psh56TE1nRoUS6Ra67p/HhQrv
         pdtPdh8fTLK7jnAnHm5CYu+f0Gn1c6iWduCKzoMkOg0JgQanCeG2hpEkpRlhpOif27ZM
         gES4McY+qfhar9MJ3Q5Dy1CuNM0SlKNCg4sLsWM4yPZ1b9Z0Dk3Ge/urDCWe7b/o6yoB
         MGmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794917997; x=1795522797; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFVJi+i+sc9nYgluytKQGXSriWb6Sc1xPMl64Y6JsfM=;
        b=oz3feJS1iAIJQC7p7Mwm1JmwyC1qiU6R72jdHYTvotIELPBf9qMxlog1xtibjUkxgU
         3zG+MEu723WNTYbZ5YYZ8Df56Vtx50NLmAXa5i++s8nTZ2uAI4gVwwNpLP/o2CMOe4eg
         lF9+9E/74uoDjUdpcR1MCP2KgEwHgeOmiBdyGWB0q2UqyXLTtn4QTeLYg3nPdTtix8Qh
         DRZkorWs7NAj+2mcAE1YNat0DZsk868MZmh+EYRECG3mmX9gLw65JkdgO2RlO30SdaLL
         0D5aKyBpnYENo+0zdqGX4kjkEDJ3fKeUAVtbkK/FnkbcHPAiBvFkvzVrHIIKxVHXw2aq
         sd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917997; x=1795522797;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZFVJi+i+sc9nYgluytKQGXSriWb6Sc1xPMl64Y6JsfM=;
        b=HW4QJ+OqN8mX4AR9EgjXVt3W4ADwOX41XDklQb6Vq6jBbIk8tnhsHCXCYrdwlDJJqA
         qJtJnQAG1iOHna3PfoYV+SpSZMf3fVfEJas6fKCTjZr8rJNRLCM2+S0WEVqVvvvFMkif
         Fw1wpPLaE79AQGvexLMRqw0T8ku53+LK9ivjl/Wrel4lFfUv/6D0jbktbkVnPVTz58TM
         fUoeCzH0FO+5utLlxvQ11C9nWOIr2V0iH+9dtlsrBZvNjl/1OmiubIN03F8FBsGW8y0h
         czkyM1IrOgfuSZHv2lM+323vGvjyfW84d/ZOMrAs2LdpoRtEAJRvPqTopapZnqojMf3m
         PzGw==
X-Forwarded-Encrypted: i=1; AL+hErHVbhx6X4c2tdJkhhG7Il6vgbxwy2eCXviJnXvB3O/JO/f1IZtJvTUxu9sX1CbhBkkCIz0O158Q2+AhSw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ULMzd4ujL+BcH3z/ncq8k6OFC9veUfAERfr/gbyw32p/DL1t6
	FXtsd4OJfqxmrw3sskvnNwuc+ZBl6aBtMZVdkjgPafCUHkNCWFSIfeiQgkTk9uCvrRgUfOzfzJj
	Ocx+SE2lf9w36xAIiR5Ov+IkuucMkjW3PYBn96IeaiQ==
X-Gm-Gg: AYBFou3T8vReGiNWlxD9mE1PBC8QItqhUdrCwm0N5iiz6vvG8AgMtZLkHRuz/rFZ3ll
	2LSl14imf9IWpWhOYk8XL4OGssmpD4ofF1RxwM9zcELCAdS7Ffgfle4QvLnt1oy9GrUBIB/Nxdp
	9O8GNiu/B+g7T1xnx8lTN0lwizg+zD95hvhh9Rjoev9ta4ONZHCyx9qCNnp3LWfRt3YLXh+Twp1
	DmD8eRpwzNFPllAWBqFxE5rwlIsmFR3YfwjOK8S+3z0iGa0WcOJFY7YqQFas8wh3/cdYmp3CovF
	V0yrWk5i5YaILPflb0C7T4nWIZIhSmjPGGJKSUcq3WahGrust7WRPQ7p/yfXM5cbmbSQSGjd4/s
	svDUuVFe+gqZjTZZnDJmLNl2vXI/qOymHiiDE7J+ctQkGqYODMLg6iwfV5OO9wliR0e9VHC28L3
	xPIOjqBOr4sfRIS9H9
X-Received: by 2002:a05:6402:1ed5:b0:6b7:e861:8f50 with SMTP id
 4fb4d7f45d1cf-6b7e8619543mr6865668a12.37.1794917996838; Tue, 17 Nov 2026
 04:19:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-b4-iommu-passthrough-devs-v1-1-dc5b493f7551@linaro.org> <20261116174238.GC2299285@ziepe.ca>
In-Reply-To: <20261116174238.GC2299285@ziepe.ca>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 17 Nov 2026 12:19:45 +0000
X-Gm-Features: AclHuK_ulY4P51VnkuhR_K0XogE5A7oe02gNjInWa6kLbfDjJ1Wh2QAX_5471Bc
Message-ID: <CADrjBPpyhKcvdH=jxiGSN46SZoFahaBdH4fAQ5KEzRvH_C3AJA@mail.gmail.com>
Subject: Re: [PATCH] iommu: Add iommu.passthrough_devs early command line parameter
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Mostafa Saleh <smostafa@google.com>, 
	Daniel Mentz <danielmentz@google.com>, Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

Thanks for the review feedback.

On Mon, 16 Nov 2026 at 17:42, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Mon, Nov 16, 2026 at 05:37:45PM +0000, Peter Griffin wrote:
>
> > Instead, I propose handling this in the generic IOMMU core via a
> > kernel command-line parameter. This makes it available uniformly
> > across both Device Tree and ACPI systems and across all IOMMU drivers.
>
> Something like this could be useful, but also Leon's series will allow
> userspace to do it from the initrd too. IDK if that is more/less
> interesting to Android.

Could you point me to the series you are referring to? I want to be
sure I'm looking at the right patches :)

>
> >  static unsigned int iommu_def_domain_type __read_mostly;
> >  static bool iommu_dma_strict __read_mostly = IS_ENABLED(CONFIG_IOMMU_DEFAULT_DMA_STRICT);
> >  static u32 iommu_cmd_line __read_mostly;
> > +static char iommu_passthrough_devs[IOMMU_PASSTHROUGH_DEVS_MAX_LEN] __read_mostly;
>
> We can allocate memory at this point.. No need for a fixed array.

Will fix.

Thanks,

Peter
