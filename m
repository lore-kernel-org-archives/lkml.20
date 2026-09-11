Received: from mta0.migadu.com (out-122.mta0.migadu.com [91.218.175.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EAB448CEC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109814; cv=none; b=hZoY/HGk5oQxiFxL60kzbLki0uTr4jyTF+nlqBbZA5APPKRyaJqA2OmuFGAywgytFDzOIPPrLaRag/0gFkd3nbYVjvpiOzhZzkY5Hq5heH4ejoPX1dJ0SgQ0h31fhgFE3wrJvpR+sC4+mtV8pwDkebOkr+Ccq26f6/mgQeAWJbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109814; c=relaxed/simple;
	bh=n/zW6ua6iRxPfzI3xP333LOtc/IcOKkvTFV9pMi3dFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6jEvK5o64NxcS6dm5Q17v0T4vEAr3Xds9r4HQhIzOn8mkIN9pNwGPHkp9xl0bPX2IWG4JW7SIb7/1CWaXxU963IKDU+PE/V91/t4BSkksC1Pw8kiHUCeuJbTJaOqRNVQlXtSH105RzqR6ZPannbPy93tVYE+TMkMWJAagpVL6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mcyNhqAd; arc=none smtp.client-ip=91.218.175.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mcyNhqAd"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n/zW6ua6iRxPfzI3xP333LOtc/IcOKkvTFV9pMi3dFM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789109801; v=1; x=1789714601;
 b=mcyNhqAdVazt7z8m4t2fP8QzEcqw7qXDn2F7BsymW92if8T1BN1RCyVX1Kk1u1SCCcXTmnFC
 h9SBtdaLqGFpSrG+87UvpcV+CJ7PJk/mI6Pnet/GhnhxVQ/jVeWmQq3q1P5b0HEeGauAxDV0bS3
 3iRdYu+RpMvYIANGX1CKJX5k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b172ed87fb67e3c1;
	Fri, 11 Sep 2026 06:56:41 +0000
X-Mizu-Trace-ID: b172ed87fb67e3c1
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so2494e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:56:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzSnDAQzGdePT5AKUDjLF0lJg4QxmLkRIgBwcE6XZJodL2c5YPawtYkxOUILIIDwAtV1a8UtdEtisik4XQ=@vger.kernel.org
X-Gm-Message-State: AFuF++moIegLrTaOjAo6LyR8THmo2FJThDFkp+VIlXk9U6h6svAi1eSu
	xWvVpcDtv9/cSEtBcphcC8kXVoy3CAR/LuWOX3FgNS1YB57jHoOHWNC+w2ZQOVk1p1cKgjYkKnz
	fjED1e3w4HGoWke+9KcuzGW92SPLnavJqA+HiT5UQ
X-Received: by 2002:a05:6512:2507:b0:5b8:9e63:dfb4 with SMTP id
 2adb3069b0e04-5b8a06787b3mr101329e87.14.1789109800794; Thu, 10 Sep 2026
 23:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909063156.89636-1-kmehltretter@gmail.com>
 <CA+EHjTx3fmj_fkD_ybPANyTrEApMUyBscfP4JtP-F_MRL-L=2w@mail.gmail.com> <20260910190528.4483-1-kmehltretter@gmail.com>
In-Reply-To: <20260910190528.4483-1-kmehltretter@gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 11 Sep 2026 07:56:04 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw5-7688CEkUXNZ5rxQ=JPVdedTZwnx-ivdAoQefuc+fA@mail.gmail.com>
X-Gm-Features: AcwNN1V9j7elh0f_x24Ka1uap6RiGRbBErx8XKNzFJ08kBvwcJMrIK8GbJ0IEdU
Message-ID: <CA+EHjTw5-7688CEkUXNZ5rxQ=JPVdedTZwnx-ivdAoQefuc+fA@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Fix kvm_get_vtcr() kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Quentin Perret <qperret@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 20:05, Karl Mehltretter <kmehltretter@gmail.com> wrote:
>
> kvm_get_vtcr() takes a parameter named phys_shift, but its kernel-doc
> describes phys_shfit. This leaves the real parameter undescribed and
> adds an excess parameter description to the generated documentation.
>
> Correct the spelling and describe phys_shift as the IPA size in bits.
> The value written to VTCR_EL2.T0SZ is 64 - phys_shift, rather than
> phys_shift itself.
>
> Fixes: bcb25a2b86b4 ("KVM: arm64: Refactor kvm_arm_setup_stage2()")
> Suggested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
> ---
> Changes in v2:
> - Describe phys_shift as the IPA size in bits (Fuad).
>
>  arch/arm64/include/asm/kvm_pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 41a8687938eb..20d12da3d28e 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -532,7 +532,7 @@ u64 kvm_pgtable_hyp_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
>   * kvm_get_vtcr() - Helper to construct VTCR_EL2
>   * @mmfr0:     Sanitized value of SYS_ID_AA64MMFR0_EL1 register.
>   * @mmfr1:     Sanitized value of SYS_ID_AA64MMFR1_EL1 register.
> - * @phys_shfit:        Value to set in VTCR_EL2.T0SZ.
> + * @phys_shift:        IPA size, in bits.
>   *
>   * The VTCR value is common across all the physical CPUs on the system.
>   * We use system wide sanitised values to fill in different fields,
>
> base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
> --
> 2.53.0
