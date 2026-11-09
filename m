Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225720;
	b=APRwp1nvVKBpMfsL6xjt7fn8X52NtsnU8PGtnKDUOL4/a4wKHo990+Q3DKNRBM1BBe8w
	 e43AwAUZVmbgL1+npFV6b+/FTzMaN9v2TOhefaHqu9xmWaflSrNm+nhAK+KBFCr15nI7k
	 nkCh+RR0bClUKuCgxVmpSHtpM7Zks8aSd2p+p8hqY6x7/D66aNVVnKRAaxG4Aw2x/X4Mw
	 5/9UrQ6A+7fDRBu/EDdYzkFLvZt+QY9c85vSiFCmtR3eKlRarTjRJmLikG+7oSLhFt4LY
	 z12Vd+j3kTE0+MOLIlLDIcyrmVMu7cpGXKenagZ7hyFE3yiaBQfjnEFzJ8sIYpyq5+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=szgQb0dY5ZnhzHxi0dDY7s5APqPVFKBR+bd+pkS5brY=;
	b=ZLzaMcd361pg9s2gCxDnOJR+nnLardA/+VAtQIuG6vAomR6sHqrGjfOBa4jfAkpjzqi2
	 4j/pczSKrmz5PzUgUARFfF2TjjKL6fj7MS4E4j1n4zxZkDPosJPU99YBekXbZo/jOSI1a
	 zUDGiM13NFDm5GVJggXTWiHG7BIi5kHdH89i+5VqFsIViRILzSyAHG/n6lpztuKIUsP6I
	 QjRYCbhAWmW9Nk1xRin0BOQ9Ws/916twq2eaIPOtl0PbQv0W7RxVU+7iLHDwJptwzMyL0
	 wzhAEKrysT/ArB7Vw31fBnm/UM0PN38uPqJjOll2BjdOKhr4aoySyRoAUf2qBw+oo1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="mav/ns5O";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600D2606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 600D2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mav/ns5O
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso32195e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794225718; x=1794830518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=szgQb0dY5ZnhzHxi0dDY7s5APqPVFKBR+bd+pkS5brY=;
        b=mav/ns5Obke33gqupiqSr8Ht+NeycPkeOP7JGP9tVdqHzx8r0yjg4oBl9akAPIAkXv
         JM68ScW2fAVGk5MiYFIH3VVmmnLccEKXVRGonyVAobYpa0o2g9GoqM94o74M3WWRQKu8
         4D74tt82yoGRc0fxpLXZlCzNofGm1tUCNhR01u6s0gkq1fGntvUqaBffsuMM9z5BCzhO
         aajF2cWDh4po7whVy57cWkH73Wv0pDQcArs4hiAGMRNK+n7y/2ywxavs0GiaPQV1cyQM
         4yv4Mgur6hgP4S75oynbXaN3/274HargCdknHE6pHnEQV+FOpMm+88h7nDgpEUv4sBo0
         FHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794225718; x=1794830518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szgQb0dY5ZnhzHxi0dDY7s5APqPVFKBR+bd+pkS5brY=;
        b=s2GSLadNIj50q4TMH17dA1OBTOnLFzT0F8QphcZ5oDDGQnmiZGrcQpwDBwGkdU8LU8
         pG+EcSv+DNIYICIRtBnwj2xJ9sK2g0axQt/cIIqRew/Du3YPvhQnFMH3vX/R2xZAkBc/
         LMTMH4y8ynyoI/+0GZac+EYhzRZTDoFzcvZn+oymIDeMo63nsS5JL3ZIdw9g7+Jl+9Mu
         wbAA5ciOzqIloDKSEF51yIVjhtkc7TqeJO1RkKVnhb7Ppug5jp/U0BNe/eXqPrEuo1k9
         /dS56IC3YIapyJhaumC+44vbzP8Bp59KoNV6sismvw9G2vPVC7rldME1otkxK2xiccRO
         fPqA==
X-Forwarded-Encrypted: i=1; AL+hErGnWGrSgulOc17j7vz/K8A8gHs/dDdm+e1J3Q64XW5TRrOGd95RbiSEQgOubDmWhSKrPP3lxSS7jL+unuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wz2TaQSheG/WDe4FG+C6fscccWbM39btk7taExwO10cZWmn42
	7zdEFLQDZlRflFmMZYf50f63/aLV+wRIY5EtFXnX7OAaRZY8DUcq5yAIsJotI5z3xQ==
X-Gm-Gg: AYBFou3o1/XSrq6ysrbYQ6LHSVZnXaD1k0WDCgiaga6lPm3rqivzB3978u7j0I8kOud
	+U/RSyuiXuT4hgJOU6VLQSlnLC5TKm7yaLOwxjU2W6bpmNcQKgXCIaC7WeJC/uvDREcXrWURq9c
	SPSnlC1h5JnUq90zr7Xw9EvhUKOKNNPMgtg91xJpeRarh5+0YP3MxZXS5zWAW+KDukNxv0CR6Ru
	/6MmwtvO59sHmDI8vGos2eAr7CAy11uiJWhOGgLl9EgaIZIH1hdyaQwpjhp/gQ9VwS5Bvo/QZhp
	QDNdy3ahCQnu0DNE62nbI5vHZovX7o+r1WTjvGPxTiVGqWcOO6Khajx+YacTEENx5bb6NotPNcX
	jGRFzH53vvTOX3BR9rt1PaBCXKmZ/YdRfVAKcAdmXLh6mtO86/0M7nPI47zg3Wv4u8JI2A5bdDx
	N+D8cH+6XiUbgJIME1CyVdanaWD2hnyuCZiNBN4wesURZQlEMak/Y1r2a7vtrQCAiTDWsGxYf7O
	eopSza57x0bT08B1B43vZYqksp6OZwHXZkrIKzX+IiZjtRwR4+b67jciag/VrRRdojQnrAc5XD9
	mE27MIV0U58+NV/J7YTpjRdLz6gDWydEc8iHRV0k51PIfJ4vhOUn/wj3ZMawxc8/IgzdzA==
X-Received: by 2002:a05:600c:c055:b0:4a2:bd1:a80a with SMTP id 5b1f17b1804b1-4b811e398ffmr1476265e9.2.1794225717416;
        Mon, 09 Nov 2026 04:01:57 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4967003fefbsm5468334f8f.13.2026.11.09.04.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:01:55 -0800 (PST)
Date: Mon, 9 Nov 2026 12:01:48 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 17/25] iommu/arm-smmu-v3-kvm: Shadow stream table
Message-ID: <avG2LCJVZIyhWQSG@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-18-smostafa@google.com>
 <au4uTxliZFv12Bqn@nvidia.com>
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
In-Reply-To: <au4uTxliZFv12Bqn@nvidia.com>

On Fri, Nov 06, 2026 at 11:45:19AM -0800, Nicolin Chen wrote:
> On Thu, Oct 15, 2026 at 08:08:48PM +0000, Mostafa Saleh wrote:
> > @@ -538,6 +655,7 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> >  
> >  		if (is_write) {
> >  			bool last_cmdq_en = is_cmdq_enabled(smmu);
> > +			bool last_smmu_en = is_smmu_enabled(smmu);
> 
> It'd read better with smmu_was_enabled and smmu_is_enabled.
> 

Sure, will update them.

> > diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
> > index 3903ae358555..31ab7a0335a8 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
> > @@ -27,6 +27,12 @@
> >   * @cmdq_host:		Host view of the CMDQ, only q_base, base_dma and llq used
> >   * @cmdq_max_shift:	Max shift for the CMDQ probed from HW
> >   * @cr0:		Last value of CR0
> > + * @host_ste_cfg:	Host stream table config
> > + * @host_ste_base:	Host stream table base
> > + * @strtab_cfg:		Stream table config as seen by HW
> > + * @strtab_dma:		Physical address of the shadow stream table
> > + * @strtab_size:	Size of the shadow stream table
> > + *
> >   * @mmio_addr, @mmio_size and ARM_SMMU_FEAT_COHERENCY are filled by the host
> >   * before de-privilege, the rest by the hypervisor driver.
> >   */
> > @@ -50,6 +56,11 @@ struct hyp_arm_smmu_v3_device {
> >  	struct arm_smmu_queue	cmdq_host;
> >  	u32			cmdq_max_shift;
> >  	u32			cr0;
> > +	dma_addr_t		strtab_dma;
> > +	size_t			strtab_size;
> > +	u64			host_ste_cfg;
> > +	u64			host_ste_base;
> > +	struct arm_smmu_strtab_cfg strtab_cfg;
> 
> The order is different here than the kdocs.
> 
> Also, it might be cleaner to group host/shadow/hw stuff separately:
> 
> struct hyp_arm_smmu_v3_device {
> 	...
> 	struct hyp_arm_smmu_v3_device_host host;
> 	struct hyp_arm_smmu_v3_device_shadow shadow;
> 	struct hyp_arm_smmu_v3_device_hw hw;
> 	// Or
> 	struct {
> 		...
> 	} shadow;
> 	struct {
> 		...
> 	} host;
> 	struct {
> 		...
> 	} hw;
> 	...
> };

That looks better, thanks! I will try it in the next version.

Thanks,
Mostafa

> 
> Nicolin
