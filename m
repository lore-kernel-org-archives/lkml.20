Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495021;
	b=1VEPkCbhDbedICezPvG+XuchUj0xglxTS0uXS0AzsCAVF/dLuySjQf8cYNHZ21m1ZkNp
	 huIwwdxDNlQdRf8zdL0YA6ADb2TEaeL5+HRT1fB/8RYvA5Ct7czIfylLCesKjB1albY6O
	 OVfLWUh0RSO7J6gSHg8pV7aHu1v201fXhYsxYYFjrcdbXLW6dr1xUlkZEI7tXN472KZ3Y
	 bxy3r6MJWTJlot/G/8wDdtebd0nEV0qUbaZBtFppV7PxvUdYVyOt7cefR6xHCkKnwAleN
	 iNvl1Zl3d9gAe2a5uq9loDXUTxf8VHO93iREaFG48PBaFjGAtGSOQieRuIxwNULNntg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=bVNQzZPkVhaJesZfY8LQ/WfX4unos7POmP6IgKPN9ZE=;
	b=t6zZt1/CdN3EQegJsZcwwEMWi6WNn9dYSkGbDy6W4KtD9OfiRbVIlN6IfjTqWin2yeJ0
	 rq9QAszH2MvxSLXGAj7YY4SqvgVuVbcgXHaC4uSlSvCDhh0H4XQ4QhaF/zQkZs8Dr9APZ
	 erNeaR4rKo2VsbknVM+6KPJ/Nux0X53pBlLHqiTbcZsFT0o0fM9XKkGwuRzaC9VqTVqEo
	 z7bRwOY7tyxr6DEhl5mSV1ZMtTReBH59ksfK3bhFktyCqsemAHWG1KcizaKCZaKidELvz
	 +G8mrwmuq9WB2/ETyl8jC+25AyFS5M4yEz9Y8rjGe5AV0DBnySA+LUl2JMs3CkSLANQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=iKiQI0YZ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B2B606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B2B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=iKiQI0YZ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1d2ec9aadso41155e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792495020; x=1793099820; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bVNQzZPkVhaJesZfY8LQ/WfX4unos7POmP6IgKPN9ZE=;
        b=iKiQI0YZCWITQAbPXullO3qjXuhOR285XcVYT1QqdOKcjgtOzM4f4AcZ2nExQg2KC7
         5ATbzBgIf+GKUBp5ZmoUucVxHxS5PpCZ5EHTzkoUgCmuwDYqPgjS4orvn6OSovaYQqD2
         9vaeM6qBHCZcsBYlFS10WJ6AUmgD4UD7ier3Q3rza48K9Fz0sO6nl5jhk3sWSsMjHdED
         VhTxIPwqhet0Hx2yY4LC5tpEMlQzuYag9u+YwCcMW7auYGP0s9dhilow5FDYP2SDQuie
         WLivaTceW5p+aQhihbvt61DAg+RnPFNI14uoiPCfi2vcxN6+QoaqhgbzXCS03gs/k1cK
         iKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792495020; x=1793099820;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bVNQzZPkVhaJesZfY8LQ/WfX4unos7POmP6IgKPN9ZE=;
        b=an03MQO6mXB+K2L9dmoVrV05mS2hp0+Hi8xknA/b3GvcCadHaJAOMcvN2jMiM7wlj5
         LJw9nUovxa0kcguCucQQgHBd3b4k3Z40tP234Dw0cI808jyX3fD1kc4fLLqIu/YuJo2B
         iN4s6aGmx1959iailU8CuOEj1BZaMZmJPrQCA8G1gqiZsiv3uKhakitL2U0PxQ9LGQP4
         uJFns1NjvVNNCMmYei513aJ1XfjHTTTWbBhWhAVXQVg28pfXx8gmPjOdkrWndpxtyXFg
         Iw8qcY3GybFDhjnKQ2pWZazhJW8nCvIEVDGGlgWvXGSfknodAKHSZimrEDLEiRLYq5Tf
         oPkw==
X-Forwarded-Encrypted: i=1; AKwUvBye67UwZpeu1Se1eC7BaqaxP19oVg+nyGkVE6qqpvR8TUU/pTGwcxn7NZYtDs6HcqiOh0Lgp+3bR721pFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMopezOnvZOPamPbNRpmDrjGGx+/hKhIhdV0HJ/sfbGj6XRk/r
	S4x1q0Xetpmi/cfNNalgSNk1uSNSfS9rQ38j5/UmALhFPaxf5V44gFoE9kHBr5KdmA==
X-Gm-Gg: AYBFou3StaDSy0mDJnaasc88cX0ZtcoHoSF7jQytHmNj8GXYe7Ks0Jl6V4ZCF7CWzRJ
	mX30Fixvc878IG2kONOt4wgzwT+xP51kbG/gL9rrtBieXjJyE6OY02fIYONi/yiOh8Ac4ZBxOcJ
	mNkMHFvV3kZjGgUlO/20yQdjVzdOkrRK9ia33b3GAE+DbhP48xR3fhRRJAmDgm5QelXcPyiF2S7
	yC3pZu1QyX+kVkIG3E0CYnPEi3kEgmwZeAMj5futhdavgMHoOkW50IGsDDA38ja1vO9zGsh6pvm
	7l+MwTN9KXIrWl6SbHAcbuBryIam3s7JCLUYp28FEEk5q3Ut/Qe5PTmUjenCQGun+VDkPVCb9eu
	5lXRXGtG89HGjSPIscxgMaw8dIAJgJIyhx7UqsdCJl8ZR36Y3yptK3MjXg1X1VKDdxAJU1SciB1
	KA/xmGaP+XUtQmjBQtFw4dSlcLGVf27U+HpMSoThK/3LbGmNF8DWSYq3SQk5IFBbuVzjVj4+Iyx
	X4DPUD7KMddd9oEp6nx8jbaKg==
X-Received: by 2002:a05:600c:a3a5:b0:4a1:a48c:17eb with SMTP id 5b1f17b1804b1-4a1f59a5836mr572995e9.11.1792495019224;
        Tue, 20 Oct 2026 04:16:59 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82fe82sm5139903f8f.51.2026.10.20.04.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:16:58 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:16:54 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com,
	praan@google.com, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org,
	Cristian Prundeanu <cpru@amazon.com>,
	Breno Leitao <leitao@kernel.org>
Subject: Re: [PATCH v11 04/11] iommu/arm-smmu-v3: Add ARM_SMMU_FEAT_EVTQ for
 the event queue
Message-ID: <atdNpl732M7D4dXz@google.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <250a57bbdd232bbb1e3511b7768a1c9ae3d204e6.1791226953.git.nicolinc@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <250a57bbdd232bbb1e3511b7768a1c9ae3d204e6.1791226953.git.nicolinc@nvidia.com>

On Mon, Oct 05, 2026 at 12:30:47PM -0700, Nicolin Chen wrote:
> The driver programs and enables the event queue unconditionally, while the
> PRI queue has an ARM_SMMU_FEAT_PRI gating each of its touch points. Yet a
> kdump kernel wants to leave both of the queues alone, which would take an
> is_kdump_kernel() test at every one of those places.
> 
> Add an ARM_SMMU_FEAT_EVTQ that the probe always sets, as the event queue is
> architecturally mandatory, and gate the queue's allocation, its interrupt,
> its MSI vector, and its CR0 and IRQ_CTRL enables on it. A subsequent change
> will turn the queue off in a single place.
> 
> No functional change intended.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Breno Leitao <leitao@kernel.org>
> Tested-by: Cristian Prundeanu <cpru@amazon.com>
> Assisted-by: LLM
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

There is a nit below though.

Thanks,
Mostafa

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 89 ++++++++++++++-------
>  2 files changed, 61 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 8f2c0b1cc4a8d..559bfa8cbc5e0 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -972,6 +972,7 @@ struct arm_smmu_device {
>  #define ARM_SMMU_FEAT_BBML2		(1 << 24)
>  #define ARM_SMMU_FEAT_HAFT		(1 << 25)
>  #define ARM_SMMU_FEAT_DS		(1 << 26)
> +#define ARM_SMMU_FEAT_EVTQ		(1 << 27)
>  	u32				features;
>  
>  #define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 6ff61565f7583..756825e004774 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2381,7 +2381,8 @@ static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
>  {
>  	struct arm_smmu_device *smmu = dev;
>  
> -	arm_smmu_evtq_thread(irq, dev);
> +	if (smmu->features & ARM_SMMU_FEAT_EVTQ)
> +		arm_smmu_evtq_thread(irq, dev);
>  	if (smmu->features & ARM_SMMU_FEAT_PRI)
>  		arm_smmu_priq_thread(irq, dev);
>  
> @@ -2390,7 +2391,12 @@ static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
>  
>  static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
>  {
> -	arm_smmu_gerror_handler(irq, dev);
> +	struct arm_smmu_device *smmu = dev;
> +	irqreturn_t ret = arm_smmu_gerror_handler(irq, dev);
> +
> +	/* Without either queue, the thread would have nothing to drain */
> +	if (!(smmu->features & (ARM_SMMU_FEAT_EVTQ | ARM_SMMU_FEAT_PRI)))
> +		return ret;
>  	return IRQ_WAKE_THREAD;
>  }
>  
> @@ -4763,11 +4769,14 @@ static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
>  		return ret;
>  
>  	/* evtq */
> -	ret = arm_smmu_init_one_queue(smmu, &smmu->evtq.q, smmu->page1,
> -				      ARM_SMMU_EVTQ_PROD, ARM_SMMU_EVTQ_CONS,
> -				      EVTQ_ENT_DWORDS, "evtq");
> -	if (ret)
> -		return ret;
> +	if (smmu->features & ARM_SMMU_FEAT_EVTQ) {
> +		ret = arm_smmu_init_one_queue(smmu, &smmu->evtq.q, smmu->page1,
> +					      ARM_SMMU_EVTQ_PROD,
> +					      ARM_SMMU_EVTQ_CONS,
> +					      EVTQ_ENT_DWORDS, "evtq");
> +		if (ret)
> +			return ret;
> +	}
>  
>  	if ((smmu->features & ARM_SMMU_FEAT_SVA) &&
>  	    (smmu->features & ARM_SMMU_FEAT_STALLS)) {
> @@ -4950,7 +4959,15 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
>  
>  	/* Clear the MSI address regs */
>  	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
> -	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
> +
> +	/* PRIQ's vector needs EVTQ's to be kept */
> +	WARN_ON_ONCE(!(smmu->features & ARM_SMMU_FEAT_EVTQ) &&
> +		     (smmu->features & ARM_SMMU_FEAT_PRI));
> +

I can't see how we can end up in this case, I’d suggest dropping it
if I am not missing something.


> +	if (smmu->features & ARM_SMMU_FEAT_EVTQ)
> +		writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
> +	else
> +		nvec--;
>  
>  	if (smmu->features & ARM_SMMU_FEAT_PRI)
>  		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
> @@ -4987,16 +5004,20 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>  	arm_smmu_setup_msis(smmu);
>  
>  	/* Request interrupt lines */
> -	irq = smmu->evtq.q.irq;
> -	if (irq) {
> -		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
> -						arm_smmu_evtq_thread,
> -						IRQF_ONESHOT,
> -						"arm-smmu-v3-evtq", smmu);
> -		if (ret < 0)
> -			dev_warn(smmu->dev, "failed to enable evtq irq\n");
> -	} else {
> -		dev_warn(smmu->dev, "no evtq irq - events will not be reported!\n");
> +	if (smmu->features & ARM_SMMU_FEAT_EVTQ) {
> +		irq = smmu->evtq.q.irq;
> +		if (irq) {
> +			ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
> +							arm_smmu_evtq_thread,
> +							IRQF_ONESHOT,
> +							"arm-smmu-v3-evtq", smmu);
> +			if (ret < 0)
> +				dev_warn(smmu->dev,
> +					 "failed to enable evtq irq\n");
> +		} else {
> +			dev_warn(smmu->dev,
> +				 "no evtq irq - events will not be reported!\n");
> +		}
>  	}
>  
>  	irq = smmu->gerr_irq;
> @@ -5029,7 +5050,7 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>  static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
>  {
>  	int ret, irq;
> -	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
> +	u32 irqen_flags = IRQ_CTRL_GERROR_IRQEN;
>  
>  	/* Disable IRQs first */
>  	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> @@ -5055,6 +5076,8 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
>  	} else
>  		arm_smmu_setup_unique_irqs(smmu);
>  
> +	if (smmu->features & ARM_SMMU_FEAT_EVTQ)
> +		irqen_flags |= IRQ_CTRL_EVTQ_IRQEN;
>  	if (smmu->features & ARM_SMMU_FEAT_PRI)
>  		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
>  
> @@ -5173,16 +5196,21 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  		smmu, arm_smmu_make_cmd_op(CMDQ_OP_TLBI_NSNH_ALL));
>  
>  	/* Event queue */
> -	writeq_relaxed(smmu->evtq.q.q_base, smmu->base + ARM_SMMU_EVTQ_BASE);
> -	writel_relaxed(smmu->evtq.q.llq.prod, smmu->page1 + ARM_SMMU_EVTQ_PROD);
> -	writel_relaxed(smmu->evtq.q.llq.cons, smmu->page1 + ARM_SMMU_EVTQ_CONS);
> -
> -	enables |= CR0_EVTQEN;
> -	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> -				      ARM_SMMU_CR0ACK);
> -	if (ret) {
> -		dev_err(smmu->dev, "failed to enable event queue\n");
> -		return ret;
> +	if (smmu->features & ARM_SMMU_FEAT_EVTQ) {
> +		writeq_relaxed(smmu->evtq.q.q_base,
> +			       smmu->base + ARM_SMMU_EVTQ_BASE);
> +		writel_relaxed(smmu->evtq.q.llq.prod,
> +			       smmu->page1 + ARM_SMMU_EVTQ_PROD);
> +		writel_relaxed(smmu->evtq.q.llq.cons,
> +			       smmu->page1 + ARM_SMMU_EVTQ_CONS);
> +
> +		enables |= CR0_EVTQEN;
> +		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> +					      ARM_SMMU_CR0ACK);
> +		if (ret) {
> +			dev_err(smmu->dev, "failed to enable event queue\n");
> +			return ret;
> +		}
>  	}
>  
>  	/* PRI queue */
> @@ -5330,6 +5358,9 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	u32 reg;
>  	bool coherent = smmu->features & ARM_SMMU_FEAT_COHERENCY;
>  
> +	/* The event queue is architecturally mandatory, unlike the PRI queue */
> +	smmu->features |= ARM_SMMU_FEAT_EVTQ;
> +
>  	/* IDR0 */
>  	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR0);
>  
> -- 
> 2.43.0
> 
