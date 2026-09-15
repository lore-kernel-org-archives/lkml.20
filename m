Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BC0474255
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464293; cv=none; b=XHZxrvCQ2bZ+pZRXdsbb6PJd8ui+YlYcedDKe15Vm6O16BCyuUKKEkDOXjxS06lKpM6uykg9FB0F12Z2vxy4p5sOU1cwYKscC+cjTBBM7sy9r6Y918goQnNCo02of/bdHYvCeS50Bu+mn41N/AGkFE8hEyOK09SPo/x7xzFZWK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464293; c=relaxed/simple;
	bh=qg3NBK8u+1F0WZmTIldEJuKzcYBTL/HhVtkSXxJJ3mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJO/FN2b2iaWDy5X+MjTaZpUrqsLo8tRhcZBAHl+z8Nsxhw9KlNdgKhcQyTKPBCwsNiGuN4hV2H3i4Z1DNK2+rB/vBw5ptMZPFlxwx1tYwEr+1Wkaxy1Li07yRupsWD3ntqJWQBk/q2/7/UTCiOsoaNymmUjiXykMNOIP1F+CPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s4JmPltm; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s4JmPltm"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so1422442f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789464287; x=1790069087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CWWWXqBxdZQwhQ7CkoKnQwmEOD4rQL0kmNBKNRws0Ls=;
        b=s4JmPltm2kY7g0R938XBIs/St9VmGdwwhb3PaYBWhTH9zeWoflNos5OkWpVQCSyqME
         lyNLDxbNAghusHzabk2RC+yN9KgjZgaQZUBCO6ZaOS/qi9Za259nSKp7cb0BnXdXTs2E
         D6Sx0dOeIn8zCgzbJWfHcWdQ0Wsp907vClLDgCuKnyPaBZnyu9NqDCr8JXYaDW91fF3n
         owYFomXQIZJvL3kmu0XstYrilyIjiyt7kBd8EcHKrAWVUthMRuJmp31om7JXjBXzpCHm
         n+8MxTDaTTdeKemt/jr43b1j2y9yBNLaMbQDCuJ4ieYC+ucXwlPHJS+jerL2v+AabhEq
         adpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464287; x=1790069087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWWWXqBxdZQwhQ7CkoKnQwmEOD4rQL0kmNBKNRws0Ls=;
        b=NDsOCs+ZZE2Ja0x9Pa1UZR3Gl46m2vaizriRlLBpaTt+obLPre+hkNMAW0HhWzI4mz
         ir64K1CZvuhaNqXOGApDcKbBZb0WVMIb3R6z3stzpvY/fX2Zm4ehhHwiQMQRUsFeQ7gp
         Nellsd4IP53+mtLtlaiJsKNxNqnXCAv/Rhlt61sDoc9ph0gTT7hKIHD4VE5fZxs/qS89
         SpOKDwF2yM5tK2sJJd7z640SWbNwYxPEf7yACOfINpX5efN8GmJPcjle8US7wYh/KKex
         t0YkIyVBhWOy584OBv160oZMqfBRtsELadYTkDERFHGHYxrMQ+N4R7/sfzObXYmuVx6w
         Mw5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzWoNi2KOiKmTXWBaj4Pev0bR2KSMCXaD70rzDhqzZpEi3ZiwWviYIjiFyaqzXDQUkurxgU1sN1hTqtBEY=@vger.kernel.org
X-Gm-Message-State: AFuF++lKCyskmtYv4tsuCl8CYgPg18Qr0h2hdn1y6+zNyYZJl8pFEVUU
	bV3RnkWlmReYNLzLbq9JxmwkAeyb7K6LqhPa+WnFosV6vPRyrZuonR7Hx52FARYl7A==
X-Gm-Gg: AYBFou2PvUVFYGJm8MPUSSlZwO11yDIThMvi5CFDz1hSvcMJEIfRWjk81psNHhPjbbQ
	YmIzxW7NUzgOpFN2h1orbmz3WbDouNkiaOjE1rDGyOx2Zix0V0FAABK1KBMYyKLRTRB5lzhRDRN
	KriY9TlBS+GB5qlihtNCBKc//0FoMJg+YkF1itCaZ9IO5tMWF2rU+AVtNDyfrKbqbtT64OwFPdZ
	OXAEQT+EbfA6Gx7sL2aHpNyTs8T17ULhDfYKHKUcrGOXaYhUGVJYG6FZPb+MSDUQzam6I2rkWq8
	BeLSEl8xYUgdvK06BHeK0gP1UPIjh1q1nibb3yaadSDHrZLIh1v+lXWbt54GB5/U75gyOlk9qoe
	axM7hnhyoBbGBxJlmWKH9yvwPud3I5vs/J8MZAeV4ENsGbk7wK5ypY57gxG2dVAJCUAECOSotR/
	/IIwJ0kdTX2cO1c2o42LdW/ypGGkEuI97c4/K+4c6ea/dPtgalahlLRdvI0XYIDwU9Et+47nuCv
	U7Gd5G1GgghUWW1UXl2cH+h7501peDRZnjDIrgtpmb6oTnLg8WK+g==
X-Received: by 2002:a05:6000:1785:b0:485:8a46:b3c4 with SMTP id ffacd0b85a97d-48702b5e64bmr7485672f8f.44.1789464286268;
        Tue, 15 Sep 2026 02:24:46 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33e020sm34764203f8f.18.2026.09.15.02.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:24:45 -0700 (PDT)
Date: Tue, 15 Sep 2026 10:24:41 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
	Ben Horgan <ben.horgan@arm.com>, Oliver Upton <oupton@kernel.org>,
	Sebastien Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v7 2/3] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in
 host handler
Message-ID: <aqkO2eVkF4bdS41U@google.com>
References: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com>
 <20260830-host-direct-messages-v7-2-45f6e6db72c2@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-host-direct-messages-v7-2-45f6e6db72c2@google.com>

On Sun, Aug 30, 2026 at 11:08:14PM +0000, Per Larsen via B4 Relay wrote:
> From: Sebastian Ene <sebastianene@google.com>
> 
> Allow direct messages to be forwarded from the host. The host should
> not be sending framework messages so they are filtered out.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 27 +++++++++++++++++++++++++++
>  include/linux/arm_ffa.h       |  2 ++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 9e8bb95e8845..96cf6be969de 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -880,6 +880,29 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>  	hyp_spin_unlock(&host_buffers.lock);
>  }
>  
> +static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
> +			      struct kvm_cpu_context *ctxt)
> +{
> +	DECLARE_REG(u64, endp, ctxt, 1);
> +	DECLARE_REG(u64, flags, ctxt, 2);
> +
> +	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];


For a next version, ffa_check_unused_args_sbz() has just been merged. [1]

[1] https://lore.kernel.org/all/20260907171930.4037166-8-sebastianene@google.com/

-- 
Vincent

> +
> +	if (upper_32_bits(endp) ||
> +	    FIELD_GET(FFA_SRC_ENDPOINT_MASK, endp) != HOST_FFA_ID) {
> +		ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	/* filter out framework messages and validate SBZ/MBZ bits */
> +	if (flags) {
> +		ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	hyp_smccc_1_2_smc(args, res);
> +}
> +
>  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  {
>  	struct arm_smccc_1_2_regs res = {0};
> @@ -938,6 +961,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  	case FFA_PARTITION_INFO_GET:
>  		do_ffa_part_get(&res, host_ctxt);
>  		goto out_handled;
> +	case FFA_MSG_SEND_DIRECT_REQ:
> +	case FFA_FN64_MSG_SEND_DIRECT_REQ:
> +		do_ffa_direct_msg(&res, host_ctxt);
> +		goto out_handled;
>  	}
>  
>  	if (ffa_call_supported(func_id))
> diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> index e71d83ee0aef..a3f44e7c08de 100644
> --- a/include/linux/arm_ffa.h
> +++ b/include/linux/arm_ffa.h
> @@ -269,6 +269,8 @@ bool ffa_partition_check_property(struct ffa_device *dev, u32 property)
>  	(ffa_partition_check_property(dev, FFA_PARTITION_DIRECT_REQ2_RECV) && \
>  	 !dev->mode_32bit)
>  
> +#define FFA_SRC_ENDPOINT_MASK	GENMASK(31, 16)
> +
>  /* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via registers */
>  struct ffa_send_direct_data {
>  	unsigned long data0; /* w3/x3 */
> 
> -- 
> 2.55.0.897.gb25b4bd76c-goog
> 
> 
> 
