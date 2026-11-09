Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224227;
	b=YReuTmZZGtpstHTgi9jjh5UuYovLc5oMoJrZuWDvZiE7iab+zgxuuSkWRc9ReA7rXd7o
	 toYFC/pZE7tGLfKj11IVme7zfqI/iz1o0QmZHrR6dZeTP4kprD56nokShXfylH+XLrPqa
	 g4rrrrBtE2kbueeXRuU8wioJYWZ0YUd6nCTsTrjbB89601lD2ULPWmQJJ2q4uRtKaWS8U
	 6uqvYpI/hmPTBqfJjL9fCVTcrlAl3Qnl4sYEQfDDiilOOaP0S8ATdLpINbqVxYzEOpLN0
	 Mc52AzAnuGVpGSlaZQOyd2qHiJu+j2+k9Q5eXsaoJutQw4pZxBe44/geqn9QwM26ANg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=udQqDn88X0b3LP4L0/q7EU+GGttEjcPesqMGbO00iBE=;
	b=fQiNgYIBYnmdL04S12TUCF99ie/C6Ow398c5Nyquk4f+xS70dKw9Xjb/4bDjojgEJZhf
	 L6ITwSh3k8R/wt3qQt59hh3VIdHLGxB+Zfxx0ArlivHDAcu4ytcAQJ/Q3sXTYvv/vWs7G
	 2EVagLrXoZiGbUThokiH0n3KInccgG0h6k3H2PJXJQ7/hu/2STicLxPqi3JeZmJSeP3SM
	 UU7tbmUiqbyUk9RQIetE2QQyVL9Oud7jmNKD/Y035A0I3ItlEgwCgw8fMAzP+zB28YT6q
	 jeTitLjX+Wpz8dHH9NsD2XSWQwFLmMuiAF/jrj8zJWdLd0c6XHPKblhN8IqgccMpKkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="kAgKG5I/";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEDB606A338
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DEDB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kAgKG5I/
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso30795e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794224226; x=1794829026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=udQqDn88X0b3LP4L0/q7EU+GGttEjcPesqMGbO00iBE=;
        b=kAgKG5I/eAQdIde3D4elxpA99cON4NO5EcZZtOEyfT8t9UeNhN24/aa6CcgTDHhEHa
         ZapIrBPxSxc3Q7Gqe5X337TlfhiINTfKcikx7vYKb2I6QLIO8x72tubWBL/uGYgEvqSd
         eS9kM1B5gBodonkhKeFFtjhCeo1/IQMIrbGDPxIXoV5KbaD7WQl1Rpu2zqweBQrJnEbr
         +jMBny+aqd1P/u5CimmixGJl9pi0kuzThMPwiPJMA7PzqHgCCl1hLh7Dp+YU17lzKMMI
         4lLEZ9nKpz86nqJF5P7SNEr8d+PEqHMqoERzDe3/2nOH8NVikPdzfipzWKfQDPdCFLr3
         BoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794224226; x=1794829026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=udQqDn88X0b3LP4L0/q7EU+GGttEjcPesqMGbO00iBE=;
        b=O+yGCQ3AZ8eSCVnexcOhjcsQsr3ZWiyw+oP5wjioF89/iK14fYXEySm6umeli6s2Oh
         pVSQ4ZPxJEurcTzcxZtYWZq3Gp4B02GyE6jSuSGGm4Qi+6hb46ILj643BFQb2UbwkWZi
         az+08aLvHazE0Eoa4HaeTHjm00rIqAnHsx+At+DXcgD/+cf7naxStiXxJ6uypwfT0R42
         uz9LxqTlrM+dvbxDz9OBCsdQ6PJphzXhL8qPeakovnh0feUe9KG8VlyeGG5PUv96gBJU
         W9KAt1hAAu79jmpJK4JyhvZommJL4Ht5uW6jELX0h2jNC1/ShMiFV3iESV8D0l/0YeUW
         RWlw==
X-Forwarded-Encrypted: i=1; AL+hErFNYuR94nMhEeVTAGXZHG6e7RXrzRPPG3LqIfCRW/kzAGzCJ9Eo/ulbNyOh7RI5VhgHjaU0zZFZgvtLYDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i05rHDW3EgBKUI93zXAf6kEHIn0Hh/NR0LVUY7MOra07/AA85
	3Oa+RHwOsjNjtZh/ZLrZavQMHCpR1d48sR+R3MAL7mN/4yt7g6V8UPzK60y7odrEiA==
X-Gm-Gg: AYBFou1/pyrqiGjiAK71zy/LabRkmEmvLKGWT8jGOKcF48M1Kt256oV5UyN/oSdm/hh
	lk5pkEwjvJ4nX5y5wOCUpDiCjCKW/htCEWeaBkSaDYDV/T1KVybcIxOfQxvTLOLlPSO3DagsKCP
	B7H72xWfe5KsUioTPCmOoVv6VPIZb+bGWcXHNVZ3dmUshuRk2dTvmwRcJ4G0ZywfBaVT0UHyMhv
	asUx5n7jwj4E5VEg7V9cQZ7NDDwwlqQCR6axKxkPG7Jhv0jzXkuMozeNnvJIwKDTVNoY8JaYhz1
	JEqgdc7wjfZyP7ngA8osCd99fL2KI/mIVLrOmc7glKjwLsL90UlnHH68+GxztQNdOPrdc2fAu95
	lsY8nm3cP39pG29sQC1Ew7GpOt+9j3z+nG6DxRtbJBU2vf215QtFDMKqTopEW1la84s0eFL5Pvl
	Q5T+AvIIWACiYS9LAu55h+EIU6X+k9PiUiwkQtefmMXZrDPV/F9Mdh90Gd69HX4tLZeiKgqmuOG
	MeIEWo8vLegJ8/Bs1ZvVT257QvNg70Nq1iEiNGldCkFZUU5WWJqtEZgDvxlz30pWwHHHCIcfftJ
	unTwqg0dhbxnV641ePhLiva1VcPzuuhuazuuqRr2IAu4FoBbpNsc+MjWjbE9NgM6dSPX68PWqWY
	YblVKOq7OjC5t830=
X-Received: by 2002:a05:600c:4c06:b0:4a1:eb02:37c with SMTP id 5b1f17b1804b1-4b82056727fmr1353855e9.6.1794224225622;
        Mon, 09 Nov 2026 03:37:05 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90619bbd2sm134824845e9.1.2026.11.09.03.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:37:04 -0800 (PST)
Date: Mon, 9 Nov 2026 11:37:00 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 14/25] iommu/arm-smmu-v3-kvm: Shadow the command queue
Message-ID: <avGwXHSlo3Zj6Fpz@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-15-smostafa@google.com>
 <au00hT6fsY10WJ9J@nvidia.com>
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
In-Reply-To: <au00hT6fsY10WJ9J@nvidia.com>

On Thu, Nov 05, 2026 at 05:59:33PM -0800, Nicolin Chen wrote:
> One more thing:
> 
> On Thu, Oct 15, 2026 at 08:08:45PM +0000, Mostafa Saleh wrote:
> > +/*
> > + * The kernel part of the driver allocates and zeroes the shadow cmdq. Take
> > + * ownership of it and program it into the hardware.
> > + */
> > +static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	size_t cmdq_nr_pages;
> > +	int ret;
> > +
> > +	smmu->cmdq.llq.max_n_shift = min(smmu->cmdq.llq.max_n_shift, smmu->cmdq_max_shift);
> 
> Given this is the cmdq used to run commands eventually..
> 
> > +static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	u32 shift = smmu->cmdq_host.q_base & Q_BASE_LOG2SIZE;
> > +
> > +	smmu->cmdq_host.llq.max_n_shift = min(shift, smmu->cmdq_max_shift);
> 
> .. should this be min(shift, smmu->cmdq.llq.max_n_shift)?
> 
> Otherwise, a buggy guest SW might setup a larger queue and number
> of commands?

Makes sense, as in patch#16, it caps the host view in the emulated IDR1:
			val = readl_relaxed(smmu->base + ARM_SMMU_IDR1);
			val &= ~IDR1_CMDQS;
			val |= FIELD_PREP(IDR1_CMDQS, smmu->cmdq.llq.max_n_shift);
Thanks,
Mostafa

> 
> Nicolin
