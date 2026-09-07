Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098EB19B5A3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 22:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788819099; cv=none; b=D5K1UIJHaGoZmHEaEs3UdgXzZ0qHYl95/oLthpDQTDR2m1bqDRq2zo4iH6PI0WsCJKmkXaPzw2Mdtj+9ZQ7HZ+X9iTGL47yrIS0TOywDGADlFkKmZtmnyqO/yBPIADXBdVU9uQNCwpEoNXCffX7SrXQFomq7cNpNKLLEwuufla8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788819099; c=relaxed/simple;
	bh=s8CG/rKmrzwFoT7OIz9OwHu93C/iJy6pMMJqKDUml9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UiikVxFGscczc9Q+yc30C6BYWwxcA8mFdX/3WBFIWYJ8EwNMhVyuOBfsOAqZCZDiUusj8gH/W9rG76QI0xSdx1So1+PfvK/UlQS4LznXMxUrC2Lg588tHrce3W920Vvx50fEfUcfXVS7ccRRCqsywUFZ3yM/9FuXhR55owzYPrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tEHNQr4r; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tEHNQr4r"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cff3b3b92so59985e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 15:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788819096; x=1789423896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vVAV4q5RsC1I3cS9H3YvLbhVTR17aU6evNpkAhl7Z5I=;
        b=tEHNQr4rgp/1BpsaD78xN5+MnTAzWPIVpg2z4BF9FeB2Og/y6vWGEVVxvu4/t7X2pa
         QReLE+McVMcATuFnSrtfVom9XefOrTVFTlTOe5qbIYUFEGu2gTWJIFIeJCYNr87qt6M0
         7A8Bu/rlKxlBySYBw+IDAZKt9YtI03TDBBaJWWtPTOB9lPDog79ccRpkrwY1+Acg+Iju
         D5IgAFwunwUyiuw4+YV6X26t05wSSfIS2KtTqcXzgBoH7KuxkD5EFNYJzdEkObSA1UoU
         XybZSv40G2vC4c3prnpNyIN3AWh7M/jq3nAlI9q8QRQ8zAFTBIZz+OcrMkMcxiYImIhl
         yI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788819096; x=1789423896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVAV4q5RsC1I3cS9H3YvLbhVTR17aU6evNpkAhl7Z5I=;
        b=AluYRhTOG9qFfPV6/f6wUA8HLRRPZjHmCiRdkJBuGwQnBjT5uAlO7aQExMRRU15P5p
         CvgPg1O7cyyJ7VGKFcLnhxqBQKg82ZZLlhF/gxYV/Ioj2DnqigCmOJUEg0LtoQ1BOf1d
         P3pJHS42wRwiv+BJ8APVxZ1EKntFv/rtqUbIcKWr3t8qMoZX9u8UFCj2CO938T+V1VyR
         cqUU3ZmzEAfajjpbQSlSuK6lIF97YGAFTIplW1TKPmaCcnBWZyCaqcbphBhoKpiZvcP/
         +wj9SWgkqxxlrJOG2N5Ftbo2Bq5sWLWmFF/I6NwtclRXRBa2sgQE6CwnWUTTcrA5nGxU
         UWsQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/+4OmFIfbWW+OY2m7hhA61hKZ2GUIuodPtaZo4WEh3pIpakL/hmTpi/Bucd8DcMVcDS1YR7JbcA/4El0=@vger.kernel.org
X-Gm-Message-State: AFuF++mS26inohVblQcv+BZCwM9k1kHk1kKaw3Nko8fVlSbYul51eqeN
	AtQIBleBgjdFdyxWQLixR9UFUoHMslOttZRC4z7uNexDuz5+NNuXUI8i+CmnKH5HX3WDZC7htdS
	YkFlHtA==
X-Gm-Gg: AYBFou06xBoGB8qb7IiDyiUn+ZvZnQPQ75Ws0bSwjv5NRTPRDEsGb7CZBD+DnigD89Z
	9syV0UDuLulLAsNLMs7rqAlq9zlsSqqeL02PYh4YRloGLii7X2eseAWxT8pRFP6wcWV5lGRLR6U
	Ou3TfMshjleOOAJa011k2LodD8BKADAIt0FgScbW7oKocaiji603QU06qkdu2KHpe/Tn3R3YxdY
	0IRmwSgYuelQZ9UkkgksKvJkqkdnAUkX0QlYjfdeJBsLbTPmJ9N8cbu8bhhRqrllZU3JFna6rz8
	LVDiGBzYJG7Sp9RzcDWmqPRt+oBObIpQ8kC04mpqqyInojJeEdCmanM5p1KTSO05GW0O9jiTF5t
	jjDIH/W7vZKKRIpqT19WbHawU1XwGXZsfD1nlqNAhYu4CNz4tqciPYJoeQByagnnuXAAATa9lfX
	P1KLZoebRbqv7N+AQaNclsJP6u/BZ1KAzugSLCZKl90vzuvxXetbkfH3ZYRnDv5rElq9o3tpMNB
	zh33HmNnPRDZyz9tjFTC+oH1WzajmbN
X-Received: by 2002:a05:600c:5904:b0:499:c5f8:6773 with SMTP id 5b1f17b1804b1-49d01dcd992mr1613115e9.1.1788819095720;
        Mon, 07 Sep 2026 15:11:35 -0700 (PDT)
Received: from google.com (63.235.189.35.bc.googleusercontent.com. [35.189.235.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm240747305e9.0.2026.09.07.15.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 15:11:35 -0700 (PDT)
Date: Mon, 7 Sep 2026 22:11:31 +0000
From: Sebastian Ene <sebastianene@google.com>
To: mankyum.kim@samsung.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Andrew Walbran <qwandor@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Honour the SPMC FF-A RX/TX buffer size
 limits
Message-ID: <ap82k7OUGiwaHJCJ@google.com>
References: <20260825-master-v2-1-f8af766d1f34@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-master-v2-1-f8af766d1f34@samsung.com>

On Tue, Aug 25, 2026 at 02:10:17PM +0900, Kim Mankyum via B4 Relay wrote:

Hello Kim,

> From: Kim Mankyum <mankyum.kim@samsung.com>
> 
> pKVM currently sizes its FF-A RX/TX buffers according to PAGE_SIZE:
> do_ffa_rxtx_map() rejects any FFA_RXTX_MAP request from the host whose
> page count does not match the hyp buffers' full PAGE_SIZE capacity,
> and FFA_FEATURES for FFA_RXTX_MAP never tells the host otherwise.
> hyp_ffa_post_init() already queries the SPMC's minimum RX/TX buffer
> size, but only for a feasibility check.
> 
> This breaks when PAGE_SIZE is larger than the RX/TX buffer size the
> SPMC actually supports. For example, an FF-A 1.2 SPMC advertising both
> a minimum and a maximum RX/TX buffer size of 4K rejects the 16K
> FFA_RXTX_MAP request that pKVM consequently forwards to the SPMC on a
> 16K kernel.
> 
> Compute the RX/TX buffer size pKVM and the SPMC both support in
> hyp_ffa_post_init(), from the SPMC's advertised minimum and (FF-A 1.2
> onwards) maximum sizes, capped at the hyp buffers' capacity; below
> FF-A 1.2 the maximum field is undefined, so fall back to the minimum.
> Store it in hyp_ffa_rxtx_sz, report it to the host via
> FFA_FEATURES(FFA_RXTX_MAP), and require the host's FFA_RXTX_MAP
> request to match it exactly, as before. The other buffer-size bound
> checks in this file are updated to use hyp_ffa_rxtx_sz too, since that
> is the amount of the hyp buffers actually visible to the SPMC once it
> is smaller than PAGE_SIZE.
> 
> Host page ownership remains PAGE_SIZE-granular: do_ffa_rxtx_map()
> still shares and pins the entire host page backing each RX/TX buffer.
> Such pages leave the plain PKVM_PAGE_OWNED state, so any subsequent
> host FF-A share/lend on any part of them is rejected by
> __pkvm_host_share_ffa(). The part of a page not visible to the SPMC
> therefore stays pinned but is never exposed to it.
> 
> Fixes: 9d0c6a9af9e3 ("KVM: arm64: Handle FFA_RXTX_MAP and FFA_RXTX_UNMAP calls from the host")
> Suggested-by: Sebastian Ene <sebastianene@google.com>
> Signed-off-by: Kim Mankyum <mankyum.kim@samsung.com>
> ---
> Changes in v2:
> - Rework the fix to negotiate the RX/TX buffer size with the SPMC
>   instead of relaxing the FFA_RXTX_MAP page-count validation.
> - Account for the maximum RX/TX buffer size advertised since FF-A 1.2.
> - Handle FFA_FEATURES(FFA_RXTX_MAP) in pKVM so the host discovers the
>   negotiated size.
> - Use the negotiated size for the SPMC-facing buffer bounds.
> - Keep host page sharing and pinning PAGE_SIZE-granular, addressing the
>   partial-page sharing concern raised in v1.
> 
> Link to v1: https://patch.msgid.link/20260820-master-v1-1-ea602b6d3860@samsung.com
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 62 ++++++++++++++++++++++++++++++++++++++-----
>  include/linux/arm_ffa.h       |  7 +++++
>  2 files changed, 62 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index a327c2bbb6b6..c3379d1e8fd7 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -71,6 +71,15 @@ static u32 hyp_ffa_version;
>  static bool has_version_negotiated;
>  static hyp_spinlock_t version_lock;
>  
> +/*
> + * Size, in bytes, of the RX/TX buffers used by the pKVM FF-A proxy: the
> + * portion of the (fixed, KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) hyp buffers
> + * that is actually mapped into the SPMC. Negotiated with the SPMC in
> + * hyp_ffa_post_init() and, since it is what the host must in turn provide,
> + * also reported to the host via FFA_FEATURES.
> + */
> +static size_t hyp_ffa_rxtx_sz;
> +
>  static void ffa_to_smccc_error(struct arm_smccc_1_2_regs *res, u64 ffa_errno)
>  {
>  	*res = (struct arm_smccc_1_2_regs) {
> @@ -239,7 +248,7 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
>  	int ret = 0;
>  	void *rx_virt, *tx_virt;
>  
> -	if (npages != (KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) / FFA_PAGE_SIZE) {
> +	if (npages != hyp_ffa_rxtx_sz / FFA_PAGE_SIZE) {
>  		ret = FFA_RET_INVALID_PARAMETERS;
>  		goto out;

This change is not enough by itself, because now you have multipple
pages that can assemble the mailbox buffer which have to be shared with
the hypervisor but you only share one page atm.

>  	}
> @@ -421,7 +430,7 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
>  	int ret = FFA_RET_INVALID_PARAMETERS;
>  	u32 nr_ranges;
>  
> -	if (fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)
> +	if (fraglen > hyp_ffa_rxtx_sz)
>  		goto out;
>  
>  	if (fraglen % sizeof(*buf))
> @@ -484,7 +493,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
>  	size_t mem_region_len = FFA_MEM_REGION_SZ(hyp_ffa_version);
>  
>  	if (addr_mbz || npages_mbz || fraglen > len ||
> -	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> +	    fraglen > hyp_ffa_rxtx_sz) {
>  		ret = FFA_RET_INVALID_PARAMETERS;
>  		goto out;
>  	}
> @@ -619,7 +628,7 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
>  	 * bogus.
>  	 */
>  	if (offset + CONSTITUENTS_OFFSET(0) > len ||
> -	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> +	    fraglen > hyp_ffa_rxtx_sz) {
>  		ret = FFA_RET_ABORTED;
>  		ffa_rx_release(res);
>  		goto out_unlock;
> @@ -723,6 +732,26 @@ static bool do_ffa_features(struct arm_smccc_1_2_regs *res,
>  	}
>  
>  	switch (id) {
> +	case FFA_RXTX_MAP:
> +	case FFA_FN64_RXTX_MAP:
> +		switch (hyp_ffa_rxtx_sz) {
> +		case SZ_4K:
> +			prop = FFA_FEAT_RXTX_MIN_SZ_4K;
> +			break;
> +		case SZ_16K:
> +			prop = FFA_FEAT_RXTX_MIN_SZ_16K;
> +			break;
> +		case SZ_64K:
> +			prop = FFA_FEAT_RXTX_MIN_SZ_64K;
> +			break;
> +		default:
> +			ret = FFA_RET_NOT_SUPPORTED;
> +		}
> +
> +		if (!ret && hyp_ffa_version >= FFA_VERSION_1_2)
> +			prop |= FIELD_PREP(FFA_FEAT_RXTX_MAX_SZ_MASK,
> +					    hyp_ffa_rxtx_sz / FFA_PAGE_SIZE);
> +		goto out_handled;
>  	case FFA_MEM_SHARE:
>  	case FFA_FN64_MEM_SHARE:
>  	case FFA_MEM_LEND:
> @@ -741,7 +770,8 @@ static bool do_ffa_features(struct arm_smccc_1_2_regs *res,
>  
>  static int hyp_ffa_post_init(void)
>  {
> -	size_t min_rxtx_sz;
> +	size_t min_rxtx_sz, max_rxtx_sz = 0;
> +	size_t capacity = KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE;

Small nit, should we keep capacity in a macro ?

>  	struct arm_smccc_1_2_regs res;
>  
>  	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs){
> @@ -774,9 +804,27 @@ static int hyp_ffa_post_init(void)
>  		return -EINVAL;
>  	}
>  
> -	if (min_rxtx_sz > PAGE_SIZE)
> +	if (min_rxtx_sz > capacity)
>  		return -EOPNOTSUPP;
>  
> +	/*
> +	 * The maximum RX/TX buffer size was only added to FFA_FEATURES in
> +	 * FF-A 1.2; the field is undefined on earlier versions, so treat it
> +	 * as unavailable there and settle for the (guaranteed supported)
> +	 * minimum size instead of guessing.
> +	 */
> +	if (hyp_ffa_version < FFA_VERSION_1_2) {
> +		hyp_ffa_rxtx_sz = min_rxtx_sz;
> +		return 0;
> +	}
> +
> +	max_rxtx_sz = FIELD_GET(FFA_FEAT_RXTX_MAX_SZ_MASK, res.a2) * FFA_PAGE_SIZE;
> +	if (max_rxtx_sz && max_rxtx_sz < min_rxtx_sz)
> +		max_rxtx_sz = min_rxtx_sz;

This is not defined in the spec, it should either be MBZ or a max
value. If it's non zero and smaller than the min value then TZ is broken.
In this case we should return an error.

If max is zero then hyp_ffa_rxtx_sz would become 'capacity'.

> +
> +	/* A maximum of 0 means the SPMC does not enforce an upper bound. */
> +	hyp_ffa_rxtx_sz = min(max_rxtx_sz ?: capacity, capacity);
> +
>  	return 0;
>  }
>  
> @@ -868,7 +916,7 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>  	}
>  
>  	copy_sz = partition_sz * count;
> -	if (copy_sz > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> +	if (copy_sz > hyp_ffa_rxtx_sz) {
>  		ffa_to_smccc_res(res, FFA_RET_ABORTED);
>  		goto out_unlock;
>  	}
> diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> index e71d83ee0aef..a70d087174af 100644
> --- a/include/linux/arm_ffa.h
> +++ b/include/linux/arm_ffa.h
> @@ -130,6 +130,13 @@
>  #define FFA_FEAT_RXTX_MIN_SZ_16K	2
>  #define FFA_FEAT_RXTX_MIN_SZ_MASK	GENMASK(1, 0)
>  
> +/*
> + * Maximum buffer size supported by the callee, expressed in units of
> + * FFA_PAGE_SIZE, as returned by an FFA_FEATURES query for FFA_RXTX_MAP.
> + * A value of 0 means no maximum size is enforced.
> + */
> +#define FFA_FEAT_RXTX_MAX_SZ_MASK	GENMASK(31, 16)
> +
>  /* FFA Bus/Device/Driver related */
>  struct ffa_device {
>  	u32 id;
> 
> ---
> base-commit: cb8a75eec0877810b50aa1c5a833f929525cd2ee
> change-id: 20260820-master-572418a358ab
> 
> Best regards,
> --  
> Kim Mankyum <mankyum.kim@samsung.com>
> 
>

Thanks,
Sebastian
