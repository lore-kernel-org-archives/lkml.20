Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B154D2EE0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071687; cv=none; b=AASxyDKkPuQQCLN4gq3IknWBzx8jua9Jy3lOkzRFYCoEuFSwzT+GXgOLiVLAX3ZgxXbKDrfpIHnWOIBy//FOiFOG8Bsf120qLlBQpSUgrBus8K6gRlNNIh5G1Q/mWmNrJFP8crh/tRqr5Wlnqa1Qd2yASNr4p1tlwKg+GgWj4NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071687; c=relaxed/simple;
	bh=xXOEzEv06Ls76/PP4JvjGDE55uMN7SJIEW5z14KBSgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkSvuDOyxIuzM8/Cu4ZCOhoGeJIGRsjpnT/kqb+3z0n8+jwS0BSa1lPC1SYiQpW7XiLqHRepzmX7zNLmHuj4Of5QuIelQfrkvnIA1KBpbLBsHvCoQZ7bPz5jrlGaLRKq/R4uyt+hjpyRlvXV9N7q0q3RnwIq2GkKGIa4IbSD7sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sRiG7KHK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sRiG7KHK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso39933185e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790071683; x=1790676483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=noGYPtBF29ezg2BGUgsIlHi0D0r0wfEgpumvYvJTO6o=;
        b=sRiG7KHKxF1cHFRV8eLKeIlxUcdnaVf56rLt08EtuCp1BsTbz0latfsca4+b21Nvgn
         cWPPtFCin83dP9PWTSj7eQQ9rQqCIGNxZ+MZLrXyJ3lp61vClVkwUNsAiNabPQIWXDA2
         xheudPgVGJEohH1+pepEhk2rgj4Nj6FbNWnymScjSTnzAZgVqGCixtHtxMxDXTmAmEUL
         Vw4jIboznyk7i/ncczOZHd+kdWKEiQ4aFcWFP2CZ6htuixJrihCKlPuMk06X241mwrqZ
         WZOO0niQoyPKDawD0ZGGBiHtZty3GiI1mn4ElIOIcjdoYWUQMC7l1uRsQYZYVQgiQ3jU
         u+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071683; x=1790676483;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=noGYPtBF29ezg2BGUgsIlHi0D0r0wfEgpumvYvJTO6o=;
        b=swvwApkumYv9VUi5Ec0S0jTQNt1i2fkEZkD/poLypn5ON27guIrQjhDzetVQuxNS1B
         NUG88XpMTWI3Do6XyyNVhPzHLuZoz9aYmRYemn//xVgqBEalMMkkw5KPg8xdOh8SZ6oY
         tyPu/UAh2X9eEDN4I+xx6+21RHeUD9FTioJyaSzg9LKoEY43L+M8xVUZxx+UaVBMbKP5
         Zy9Uc8QA2y7w/a/JFx96O+8BtDPprJn2+YI28leNEBLsNXQUewdWQ6WxDqMo2rCMIDcO
         jJ26pFJIEfY4dO+t0MRxe7NU5VDS5kt+QhkZr66oP7O8gKg7Ymu753SSjwX6QhirF2SF
         k+zg==
X-Forwarded-Encrypted: i=1; AKwUvBydTThUGw7oijywYZ20IrXo5dOaiEhGsv3EklwJAQLZtu3MJNQFlkF7g7dFnt7iergkJ9X/c6GSvcN0V0U=@vger.kernel.org
X-Gm-Message-State: AFuF++kSEpZsfEI2W8I5/S1tVopF0vvhIdtmGvcHx8o7+UKSo2dg4GIt
	cqtNNbl84pk0EAhXqqYlhAZgqz6nLl5cn9mDDPy1garFyn4nUv/aP63Ct+bwmLhe0g==
X-Gm-Gg: AYBFou3RLEP/3Hft+c5VETqRkjZQAYAzeL7gLqTyraHrjXxwwZwe1BW4yajZaOu2Wkk
	ucdmFiwBQzUhzfSzM8r3vRIt7Lwu595Z/QMW1Wxl/YdB05e52INApMjOVGvAqiVh0DQJrzJzDMi
	w/M7AbpreMfc0sMSXiRpT8YCXDjyM38j8faVH6rLz5w+hCz1yte00FnZ3lMmmiOrYvKpMJ4ZZId
	LKCfgGnXLxuAG/NL7LJru2KXuySlXvDY+2h8BdUE/MlCGI5uMpZjVIkQzzcxuZAi83Jp815uoiY
	gvj5sXnf0a96o6HN2wF6GiI41/ZILn1Pe7PxLbtRijhn+D0glHXxxQFmJ7o2ihYYmDKBW45P8R9
	XJzId2xCTcNV374phFueb4RTWmo02ioDiDjKxc+7xHKckj7CfSyXO4GZjylMqS0M3rHfusPRT3U
	8yRw54w39IHD43XNiYXHk3lBRkaOLVRpdw/zniyRTeWHKZxPksVxjHkdfDT5VkkfJa7UG+p8pTy
	BehIECe5aSEzuRP+XlzKukOVvh1Ly+h7LhfP535t98=
X-Received: by 2002:a05:600c:1f87:b0:49d:99:1d98 with SMTP id 5b1f17b1804b1-49fc56ae924mr201756285e9.9.1790071683091;
        Tue, 22 Sep 2026 03:08:03 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8ccd0e1sm67777805e9.6.2026.09.22.03.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:08:02 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:07:59 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Snehal Koukuntla <snehalreddy@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Support FFA_FN64_MEM_RECLAIM2 in host
 handler
Message-ID: <arJTf9C-dr3eMnsW@google.com>
References: <20260921164748.2958578-1-snehalreddy@google.com>
 <20260921164748.2958578-3-snehalreddy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921164748.2958578-3-snehalreddy@google.com>

On Mon, Sep 21, 2026 at 04:47:48PM +0000, Snehal Koukuntla wrote:
> FF-A v1.3 ALP5 (DEN0140 rev J) adds the FFA_MEM_RECLAIM2 interface,
> allowing an Owner to reclaim a subset of pages from a shared or lent
> memory region by populating constituent memory region descriptors in
> its TX buffer along with a starting descriptor byte offset and initial
> page index. Upon completion, the Relayer returns the number of 4K pages
> reclaimed in x3.
> 
> Support FFA_FN64_MEM_RECLAIM2 in the host FF-A proxy handler. Validate
> the register arguments, descriptor bounds, and initial page index
> against the host TX buffer before forwarding the SMC call to the SPMD,
> and unshare the reclaimed page ranges in the host stage-2 page tables.
> 
> Link: https://support.arm.com/documentation/den0140/j
> Signed-off-by: Snehal Koukuntla <snehalreddy@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 117 ++++++++++++++++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 5ad74ab265b5..e0fba07a67bc 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -232,6 +232,19 @@ static void ffa_mem_reclaim(struct arm_smccc_1_2_regs *res, u32 handle_lo,
>  	}, res);
>  }
>  
> +static void ffa_mem_reclaim2(struct arm_smccc_1_2_regs *res, u64 handle,
> +			     u64 flags, u64 x3, u64 x4, u64 x5)
> +{
> +	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
> +		.a0 = FFA_FN64_MEM_RECLAIM2,
> +		.a1 = handle,
> +		.a2 = flags,
> +		.a3 = x3,
> +		.a4 = x4,
> +		.a5 = x5,
> +	}, res);
> +}
> +
>  static void ffa_retrieve_req(struct arm_smccc_1_2_regs *res, u32 len)
>  {
>  	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
> @@ -611,6 +624,107 @@ static void __do_ffa_mem_xfer(const u64 func_id,
>  		__do_ffa_mem_xfer((fid), (res), (ctxt));	\
>  	} while (0);
>  
> +static void do_ffa_mem_reclaim2(struct arm_smccc_1_2_regs *res,
> +				struct kvm_cpu_context *ctxt)
> +{
> +	DECLARE_REG(u64, handle, ctxt, 1);
> +	DECLARE_REG(u64, flags, ctxt, 2);
> +	DECLARE_REG(u64, x3, ctxt, 3);
> +	DECLARE_REG(u64, x4, ctxt, 4);
> +	DECLARE_REG(u64, x5, ctxt, 5);
> +	u32 req_desc_cnt = (u32)(x3 >> 32);
> +	u32 total_pages = (u32)x3;
> +	u32 desc_size = (u32)x4;
> +	u32 offset = (u32)x5;
> +	u32 page_index = (u32)(x5 >> 32);
> +	struct ffa_mem_region_addr_range *range;
> +	u32 reclaimed_pages;
> +	u32 reclaimed_count = 0;
> +	u32 in_idx;
> +	int ret = 0;
> +
> +	if (ffa_check_unused_args_sbz(ctxt, 6) || (flags & ~1ULL) || (x4 >> 32)) {

nit: (flags > 1) ?

> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if (!req_desc_cnt || !total_pages) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if (desc_size != sizeof(struct ffa_mem_region_addr_range)) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if ((u64)req_desc_cnt * desc_size > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if (offset % desc_size != 0) {

nit: 

if (offset % desc_size) is enough

> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if (offset >= (u64)req_desc_cnt * desc_size) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}

Not sure I understand what Sashiko means here offset can not be bigger than the
number of constituents we have...

> +
> +	hyp_spin_lock(&host_buffers.lock);
> +	if (!host_buffers.tx) {
> +		ret = FFA_RET_INVALID_PARAMETERS;
> +		goto out_unlock;
> +	}
> +
> +	memcpy(hyp_buffers.tx, host_buffers.tx, (u64)req_desc_cnt * desc_size);

Either I or Sashiko is confused here. The invocation will not do more than
req_desc_cnt will it?

> +
> +	range = (void *)hyp_buffers.tx + offset;
> +	if (page_index >= range->pg_cnt) {
> +		ret = FFA_RET_INVALID_PARAMETERS;
> +		goto out_unlock;
> +	}

Should we also verify total_pages here?

> +
> +	ffa_mem_reclaim2(res, handle, flags, x3, x4, x5);
> +	if (res->a0 != FFA_SUCCESS)
> +		goto out_unlock;
> +
> +	reclaimed_pages = res->a3;
> +
> +	for (in_idx = offset / desc_size; in_idx < req_desc_cnt; in_idx++) {
> +		struct ffa_mem_region_addr_range temp;
> +		u32 pg_cnt, to_reclaim;
> +
> +		if (reclaimed_count >= reclaimed_pages)
> +			break;
> +
> +		range = (void *)hyp_buffers.tx + in_idx * desc_size;
> +		if (!range->pg_cnt)
> +			continue;
> +
> +		pg_cnt = range->pg_cnt - page_index;
> +		to_reclaim = min(pg_cnt, reclaimed_pages - reclaimed_count);
> +
> +		temp = (struct ffa_mem_region_addr_range) {
> +			.address = range->address + (u64)page_index * FFA_PAGE_SIZE,
> +			.pg_cnt = to_reclaim,
> +		};
> +
> +		WARN_ON(ffa_host_unshare_ranges(&temp, 1));
> +
> +		reclaimed_count += to_reclaim;
> +		page_index = 0;
> +	}
> +
> +out_unlock:
> +	hyp_spin_unlock(&host_buffers.lock);
> +
> +	if (ret)
> +		ffa_to_smccc_res(res, ret);
> +}
> +
>  static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
>  			       struct kvm_cpu_context *ctxt)
>  {
> @@ -1107,6 +1221,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  	case FFA_MEM_RECLAIM:
>  		do_ffa_mem_reclaim(&res, host_ctxt);
>  		goto out_handled;
> +	case FFA_FN64_MEM_RECLAIM2:
> +		do_ffa_mem_reclaim2(&res, host_ctxt);
> +		goto out_handled;
>  	case FFA_MEM_LEND:
>  	case FFA_FN64_MEM_LEND:
>  		do_ffa_mem_xfer(FFA_FN64_MEM_LEND, &res, host_ctxt);
> -- 
> 2.55.0.1082.g2b9226bbc0-goog
> 

-- 
Vincent
