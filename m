Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222376;
	b=U/z1pPN1tHKprMA2/eOM8heFQJ6LO56p81RBL1DwW0aRFEE8WaiRSPVaKrdxqDpEAqEd
	 POSONMAd8H3uUjNkAx4nPC67LcHEGm0AN+pbGTSd5BZpeAsrA/eTbAzveepKM2Ci5oTP2
	 8edfSvIBQIlk61GyflJONlK4pGUES3kBzccyUVrsCqqSIN+c2fHbbtUm32cBzNFUIMdOW
	 +3fUPvZgSKs1iRFRz8o1oZKZBky1W2gRQiRmYghXSNAUjBoJJ0v8v37naPjXt4nzg+BIf
	 4ZAwJedF8MG/yABbqw2ptSW1PPPmD/7VZGQju3RNiSB97LzBlaNItBBJQrwdA+A151A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=d8vRIIYl392fLQltvVGdYCiU5psYi3L4CF/tseUFWuI=;
	b=1KcYN8UHvTwXCtBg4yhmCV/q7uo4pJFN6FXvSFhYez7EQQIQCQycp6G8Egzdsm7H96B6
	 7Gdm5qp06iDs4nAteIXvb8cl5bkWcZ6Thx5gWnXN7r7Oe9KeqUxBwWTBZpZWFWQQDER/q
	 VqJVnbyC/KeHe63mwSTX9mtIFzkjn+MOw8MnlDIDbN/th7/IiyMVIF76//2QVL/ELYC6c
	 ob6r9AInBbCNOB+UcX+EHw5e0usjZzC9tJHYiQddvv7UrhZhdPAXUIrGE7dI4rkbHkxwQ
	 LLHp5hNHj57Q5t8LOYRcjwg9xgUES9e7zjKQAPNcgKr4ZpaTbqjhlSO0p9sJQ1Lh/Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NQBER74O;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AA0606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74AA0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NQBER74O
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a018493d57so23965e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794222375; x=1794827175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d8vRIIYl392fLQltvVGdYCiU5psYi3L4CF/tseUFWuI=;
        b=NQBER74OU5U3ZNxkP7QM3WDEqDaLQG+IRNaj6Lfu7gFSHjIosHZG30KG910/k1aXjn
         EG3e6n/soxDFjNqohoSRC23OY6LHQxkMLyjJEcWh+1AdV1vmt4+GNAXhUgSTL2Y5ym9I
         OTe0ZZcrC6PgOkQv7+Bu9lbHQBLDFm0qeCgSgL0CUkc9iJ5ooKvUNQfiiprvb9KMJiGM
         a0ZjY6h9QnN85gTUMwHti0AukhF4NRX5r0gxPon2zMdefhVagjkuaRaiSkF1Nfj6AQzK
         EXaN0e3vFENLurgoTCsM2c5zcCG1co1M91QG8MSDPy5pFG0P156WXKajxSclcizr48vg
         GHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222375; x=1794827175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8vRIIYl392fLQltvVGdYCiU5psYi3L4CF/tseUFWuI=;
        b=Sn5JnV+4XDCvTDeIlJWpkwdiHuE9O4zk0w4sl9eFADfpLZR2QIuxele9HY2Yczd3Wj
         Ncnj8UCM46ov7oziG9i42Fv2h52A2VGKKOTste0wGD4ug1N5F3wI59Qmpgw6iw7AG1br
         kL8vVkYLf1pZ6ItXJSJfUyuDATBg+pF4UKfhW/S+NpKScARR2K2t1QbD+ufJT3CxbVIL
         ftDVoqT9xy2ZlHxFkg/qI3Yp456orq1/E2+8NlfRo41BJb9y5xA9TL32FU6ZsIuOBLLb
         rAn4LUyCmSV2jWt8Tp8Vlif3OTNOsK10yZiCTYqV1Ns6PJfTZidnIPSXrVsGFAsqoJyQ
         bs3g==
X-Forwarded-Encrypted: i=1; AL+hErHG/e28vmTsGD1R1RXF4IwX2+GjtN6HetoxhClyi5Ett83ox9A3ijIO52OJkJ4S+JuphWkn6daQ4Ujw0dQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XNiUKeHyQ3g2f1mvT0APfZteJJexxj8PudjWK03u8Caxzzo22
	2Z2WLIJ/9trj8mrEsm+mWxrHHcmG+JdIU/nOUKVzfSfNbif4KIvWXAj/Leda0FCklQ==
X-Gm-Gg: AYBFou11C3lrJK/gdeTpZsuedahFavX256q31tioaRsXJ+w1G8xEAxlwKLeRKjgz8Fb
	S+aHWI66YisM7FHqDjCr2dP7atFi4vL2xKQ94VVU7nhugRxB0x4pHaIUkWKmgwBDnvKxzP+fZs9
	3vVux8vRBv7arqgC0GeT2cZyVwYX00IhpPZlqQcqOyTCyKemGWfC0L8HKJHDFVMz8rkxhFe3rPa
	HLloXTwgbW/9d4+ZAFjvH5kEO5Ov7NbFVmmBYTr8uG7AUkuQ+xVQ8d0a5QG2OHUwro/kv1eNW99
	AidZ3bgPazHoK07FEB/2rgIotA0+doOZ22SzsNu1b6KIqaiUGTAgup0x8W6Or6mytxIPlzlkWYh
	RBWQYgfmmyonRO+gbeAtYiwBa291L9GASt2/NYkQ4htmfGvzQ2cK1V0qldMVTbdkkM/2inKnotA
	3WDtHv0RnuQ5bmFrIo6k1GukQo3pTuNwQsBlGgTB23ENOXnUd91TwTQnvw3/oawI1wJ7szUwaug
	hUzZK6mhRZqpQppIcsHfR7cjVu8K7bmr/GF+AXHgmpRLEEaalMVwPW3Wa5XBE62ral3dL8/ugbb
	l8nuf5+wjXL++eYHP2Kg+IkNCjjJYIrRpTThVEjYQfpJptKvH5Z9341t3USmPLNzAZ3uww==
X-Received: by 2002:a05:600d:640f:10b0:4a2:1912:6687 with SMTP id 5b1f17b1804b1-4b8aec1d290mr1382195e9.2.1794222374432;
        Mon, 09 Nov 2026 03:06:14 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-496c89d8630sm4422045f8f.15.2026.11.09.03.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:06:13 -0800 (PST)
Date: Mon, 9 Nov 2026 11:06:09 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 13/25] iommu/arm-smmu-v3-kvm: Add MMIO emulation
Message-ID: <avGpIXoiLzncL29t@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-14-smostafa@google.com>
 <au4w8nvPQ3xv7igC@nvidia.com>
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
In-Reply-To: <au4w8nvPQ3xv7igC@nvidia.com>

On Fri, Nov 06, 2026 at 11:56:34AM -0800, Nicolin Chen wrote:
> On Thu, Oct 15, 2026 at 08:08:44PM +0000, Mostafa Saleh wrote:
> > +static bool smmu_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr)
> > +{
> > +	struct hyp_arm_smmu_v3_device *smmu;
> > +	bool ret;
> > +
> > +	for_each_smmu(smmu) {
> > +		if (addr < smmu->mmio_addr || addr >= smmu->mmio_addr + smmu->mmio_size)
> > +			continue;
> > +		hyp_spin_lock(&smmu->lock);
> > +		ret = smmu_dabt_device(smmu, regs, esr, addr - smmu->mmio_addr);
> 
> Going through the followup patches, I found this smmu_dabt_device
> gets really too big. Perhaps it can be bisect to read and write at
> least? Something like:
> 
> static bool smmu_mmio_handler(smmu, regs, esr, off)
> {
>         /* decode ESR: len, rd, xzr; width check */
>         if (is_write)
>                 return smmu_mmio_write_handler(smmu, off, len, val);
>         val = smmu_mmio_read_handler(smmu, off, len);
>         if (!is_xzr)
>                 regs->regs[rd] = val;
>         return true;
> }

Yes, I was wondering about the size of the dabt handler also.
I will try this, but that will propably won't cut the size in half.

Thanks,
Mostafa

> 
> Nicolin
