Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322709;
	b=fv7B9nVuu9JN6WGqbSC5Qy1AaFwwUplBzumGPzT3BvbiGcDteWNwS11Qytts95NcVDJ+
	 E/NmX2qvz2S5Ip2UgTEkqwJOWSB9ba6KSTdb44+5XFzu45zD7IRob/eJvIrgiZ7+pN5ea
	 ojT/89Db5CldBOkdLHvRU1qOR8HZ3s6npkt2CZI2mJP5wRbFnH1dw0tHGZl2JchC/dPTV
	 3rFtcV1Ye07ScpTbHR8SE9T6gBJCg0GIh7dh0dDb4NLkam1beH2SMR4iUvYBJHCEMXg8e
	 Qv+k40UuU/jgQwW7WA7lRFqwFzC0iUCtru19FdrxAt0b0TDo14Bo7VzeWpSLVyKEZ/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ilFrMbP1l4Dqble5vGUZCzOuHvz/JIBo8vMR2z18T1Y=;
	b=NgUohhqfLCGH/U3KFMqRsvEKDtFNGWgCWmLcx8c7p4UmFvtaT5wM0sqfN+DVmB4jlUMr
	 CFs1YhtPsLJytqVDUWXbkQD9JMAGBiFYJBTrH2eazIgqfaIpE5NAy8ED46D/2AMEHgwjj
	 PmBHkdVrJMR7nuvyiijCYpmdSwnjsaQ9kM7j773YnYO39Q3sQnokUNfDwEnzyA1Vx/gWC
	 w7ofyyLlTc38ryios+SU9EPewKUtrcs85XbpFRN/u/pSrFlb2igMZSaO9HPVbGtKkS3e8
	 eMiSXYmNZIKRXOfW+qPISan52dQQ6Jr1WiM9jM2vlodjr9o51hmZsAAibs/ZM7z5dig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Qy0ty+v/";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF70606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF70606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qy0ty+v/
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a018493d57so44955e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794322707; x=1794927507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ilFrMbP1l4Dqble5vGUZCzOuHvz/JIBo8vMR2z18T1Y=;
        b=Qy0ty+v/yR5Juk8fvjBfF3PMoq5URjoKYIYLwzHnvwQDOAxXuzAQy38Ay94d2Jkmxp
         Tn5GVql0GsYjQr/Pa/qSfj+26bZrTc/D1r4JzticwH+2iEoOX+NqNCmNoRdPIt9cWY6E
         xY3mn9RM7AjZxbdJIJYmCRYsjhU+J+tZz4LVMnFNg0W3ux9/1WnyP4DyCTTWW/L2sdkj
         hsUu8FcQejRPpVBW5dHoB1uuhgDHYtMmdZsJqahszpE3Iu52vTg8XcBXR9bozRtSkfy3
         fzHlQEdasIif7fU2lkGEBsIx8UU8NtgFOhzI2Jr4HVuXPec+IdjTltR6LkoaoE0zJ1lZ
         90Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322707; x=1794927507;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilFrMbP1l4Dqble5vGUZCzOuHvz/JIBo8vMR2z18T1Y=;
        b=FW9F6f9/yKplLyVvBGlzEk2oRraON2RlGwnnxBebWYnNKqhXbeJxlze0Q3oT3axd6s
         M/UkpG7Z7NW1CnMeKhUA59shPsOn2yXY6zWoEFuWEqdlFJvoeQ6uO9DhpSS7Is2D9QqC
         ptZBoDLSmvFOMaezq7+mi26q9ymONNcVhRWxO8b/sRgMTfv1Oecnaub3IM6t0oodo4ZC
         96Fah0ZrBMPhZMmnGunWjsFgFC83Q4m9URmrrHxde9dq0NJlJ75ogJ0Jjmtpwrjdg2dD
         zYAy4ft+Te+hadYUIvmDjNtAWYjm3X6pE0AWxuWEJSEhA3nGbFTbAWFlXOLnHyCnJ8dd
         d8Aw==
X-Forwarded-Encrypted: i=1; AL+hErHJhLboMXZgUcMZ4Kc0qnB7brZFr3WZURPDNcH3qH/lBri0mrw1ZF0zs71que+42t/eGr9z9u2t+SUwalw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LTlNQFX9t7TKapZ0Jhh2xlnc+Opj7eqiyFyneMiR5vXR+rh3z
	3iHwy2ZYXjEcw3hjS1xJ0nOWveULtPu9pLbyFNom1TjrZ8VRm0i2G2r5YZldqLWn1Xxnnn/7Qhn
	eMy29CQ==
X-Gm-Gg: AYBFou2k1ZYsOmXqXEFRZWcC7UgiIv1RPD2RyVMHsnYDq1zo7ELb7cZkauSmSpDpA8Z
	06ZoRntEAUhbZfSNIR/ynL3BaPABtPX5RsmPuK4FZhCKBUCOIF5/PXwchAXU/oYmVtJAAWXTvLL
	0L4f3O09nWXOK2+xRaS6VDXtzti1ICfMuMSEqJuUkxmcl0SZ3NOzi3OlArlLGk0Iu5ZQlfEO1/C
	iqVwjOOtmYkwTUhKrFd2rFAIH5pli0vHpLW4K/RKmePnDcSSbS0xQftHyJBkuJOCDB4OgKabQox
	u/mP6otd4JgvMVwmRnyJMq+LHEY4mJ/sFcc8FRAtisaJcJZwxwENt8Upm9zj3huchQFrcAfxH0f
	1bFPJe3G9mv5yAGnYWpKO9dfgEeutVlxBtw4bcHQQ4/5KTzHj7y4y1b+dFNQigeZqkmB8ggs/kY
	fVK4hNSvBrk30mBJGieLNx67hbwqVKRZ79xIVwZyNNXMqe06LT5EAnSJTY0q1wGhVfWOV576IL3
	G5MXMqb7RUxHlbIya2sbA9dtsgPMeelqh9p+F2o/4VmPkpwUHk+KpY5XuTXI+B7S/KrhRwH47Uf
	aHnaqelGnCfFfG2LLyHQDYsCd3rX06898hQ0oG/cwg+4INT0gEc2pP78ApQgFV7FQgc9LEk=
X-Received: by 2002:a05:600c:4301:b0:4b6:24ca:8848 with SMTP id 5b1f17b1804b1-4ba02bdf97bmr587755e9.11.1794322705998;
        Tue, 10 Nov 2026 06:58:25 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0223c41csm70632855e9.14.2026.11.10.06.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:58:25 -0800 (PST)
Date: Tue, 10 Nov 2026 14:58:21 +0000
From: Mostafa Saleh <smostafa@google.com>
To: xuheng@cs.columbia.edu
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Invalidate a new level-1 stream table
 descriptor
Message-ID: <avMxDbv6JE0dg93E@google.com>
References: <20261109-smmu-l1std-cfgi-v1-1-65e5203a6516@cs.columbia.edu>
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
In-Reply-To: <20261109-smmu-l1std-cfgi-v1-1-65e5203a6516@cs.columbia.edu>

On Mon, Nov 09, 2026 at 09:36:54PM +0000, Xuheng Li via B4 Relay wrote:
> From: Xuheng Li <xuheng@cs.columbia.edu>
> 
> arm_smmu_init_l2_strtab() allocates a level-2 stream table when the first
> master in its range is added, and makes the level-1 descriptor valid. It
> issues no invalidation, and the attach that follows sends only the leaf
> form of CMD_CFGI_STE.
> 
> IHI 0070 5.1.1 requires the non-leaf form of CMD_CFGI_STE when an L1STD
> changes, including when an inactive descriptor with Span == 0 becomes
> active. An SMMU that cached the inactive descriptor can keep terminating
> the master's transactions as if its StreamID were invalid.
> 

Looking at the spec it says:
	An STE or L1STD that is successfully fetched might be cached by the
	SMMU in any state, therefore any modification, commissioning or
	decommissioning of an STE must be followed by a CMD_CFGI_STE command.

Which checks out. However, I am curious why this was not seen for
over 10 years with the current behaviour as I doubt any existing
implementation will do negative caching. Is that something that was
observed or found by inspection?

Interestingly, that is not the case for L1CD:
	/* An invalid L1CD can be cached */
	arm_smmu_sync_cd(master, ssid, false);

> Issue a non-leaf CMD_CFGI_STE after writing the descriptor. The RMR path
> runs before the stream table is programmed into the SMMU, and
> arm_smmu_device_reset() then issues CMD_CFGI_ALL, so it needs none.
> 
> Fixes: 48ec83bcbcf5 ("iommu/arm-smmu: Add initial driver support for ARM SMMUv3 devices")

With the few nits below:
Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> Signed-off-by: Xuheng Li <xuheng@cs.columbia.edu>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 6d4520c47..f61cc6d86 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2030,7 +2030,8 @@ static void arm_smmu_init_initial_stes(struct arm_smmu_ste *strtab,
>  	}
>  }
>  
> -static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
> +static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid,
> +				   bool live)
>  {
>  	dma_addr_t l2ptr_dma;
>  	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
> @@ -2053,6 +2054,14 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
>  				   ARRAY_SIZE((*l2table)->stes));
>  	arm_smmu_write_strtab_l1_desc(&cfg->l2.l1tab[arm_smmu_strtab_l1_idx(sid)],
>  				      l2ptr_dma);
> +
> +	/*
> +	 * The SMMU may have cached the old, invalid L1 descriptor. Making it
> +	 * valid needs the non-leaf form of CMD_CFGI_STE (IHI 0070 5.1.1).
> +	 */

A similar comment to the CD case is enough.

> +	if (live)
> +		arm_smmu_cmdq_issue_cmd_with_sync(smmu,
> +						  arm_smmu_make_cmd_cfgi_ste(sid, false));
>  	return 0;
>  }
>  
> @@ -4261,7 +4270,8 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
>  	return sid < smmu->strtab_cfg.linear.num_ents;
>  }
>  
> -static int arm_smmu_init_sid_strtab(struct arm_smmu_device *smmu, u32 sid)
> +static int arm_smmu_init_sid_strtab(struct arm_smmu_device *smmu, u32 sid,
> +				    bool live)
>  {
>  	/* Check the SIDs are in range of the SMMU and our stream table */
>  	if (!arm_smmu_sid_in_range(smmu, sid))
> @@ -4269,7 +4279,7 @@ static int arm_smmu_init_sid_strtab(struct arm_smmu_device *smmu, u32 sid)
>  
>  	/* Ensure l2 strtab is initialised */
>  	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
> -		return arm_smmu_init_l2_strtab(smmu, sid);
> +		return arm_smmu_init_l2_strtab(smmu, sid, live);
>  
>  	return 0;
>  }
> @@ -4333,7 +4343,7 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
>  		struct rb_node *existing;
>  		u32 sid = new_stream->id;
>  
> -		ret = arm_smmu_init_sid_strtab(smmu, sid);
> +		ret = arm_smmu_init_sid_strtab(smmu, sid, true);
>  		if (ret)
>  			break;
>  
> @@ -5713,7 +5723,8 @@ static void arm_smmu_rmr_install_bypass_ste(struct arm_smmu_device *smmu)
>  
>  		rmr = container_of(e, struct iommu_iort_rmr_data, rr);
>  		for (i = 0; i < rmr->num_sids; i++) {
> -			ret = arm_smmu_init_sid_strtab(smmu, rmr->sids[i]);
> +			/* The stream table is not programmed into the SMMU yet */

I don't think this comment is adding anything, there is another one a
couple of line below.

> +			ret = arm_smmu_init_sid_strtab(smmu, rmr->sids[i], false);
>  			if (ret) {
>  				dev_err(smmu->dev, "RMR SID(0x%x) bypass failed\n",
>  					rmr->sids[i]);
> 
> ---
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> change-id: 20261109-smmu-l1std-cfgi-c194b2aafea4
> 
> Best regards,
> -- 
> Xuheng Li <xuheng@cs.columbia.edu>
> 
> 
