Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33E04FD278
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792107477; cv=pass; b=kHM1sZx5WBIC4XTqsYI+D6wudzjN88FIn3uN0vCWq3nVHYPFec9DyfwfSNRTXc3Tj8nM6P5qPyyhse5aSeO3waZJJrq/QgYf7nbqL50YvRUaM/E2geXv63TjvpASiPO5bDDXiT4VwNb+xDXXlfQoyRvAe0o9sRPuHcid5AeTU18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792107477; c=relaxed/simple;
	bh=xIFoMaaNswqnpXgTLUDVougpBQuDS+FqH832wyMXIgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZeEOW7orkf7uNOgs7yrK/SmrkBRhnXBMpZf+bZhO8mrlWdVK9wXXGyKx2cK0vGfecdpq3nKTpNYfFPC1IMr0LUGmeQona3m0AMwAzLfs3FknIrNY+RiT2FOmm3rKEGs96WGbtuZcapKf0vJMwPCHDBb7ylXSn8lzdNqkd0rCgRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LAFsp3l/; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LAFsp3l/"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so4813a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792107472; cv=none;
        d=google.com; s=arc-20260327;
        b=m4LJ9AghO6akk/0d2lsjRmBRNKRsrnF9RF2NKhpiD63NDAqTb3mZyc1OK6HoZmg5dm
         3zCy8Oo+C7kzRTUfFUnmOb5+BQ8OcAbnb2TsLfCjwJxijVo8IqJd8yliZA6dsOnH7I75
         tceDssUCRuJZP97L6Eoc1K8ympq8MS+Jm02yacMhAT0itJ+D+HRXkIxSvc8fqjll8no2
         5T5QyBptZbfXKdgvCqGcyUguFv7n9C1jX4+aNMtNPuVG7/bKzfiFdkR+21n9KfYcMCli
         eauw/M8RHXW2XHBBPig3ZHD649YL0Cqaw1VtAOqf6bj1jYTHy88KOkiioCgQqKK6SrPe
         n8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qup/0fTJuqrpqVHOUf96Jn9uaZoh3joUToRTUOcNqDk=;
        fh=cnPvuaKYa9I8gBNbPaVOugowtlj0TW7pHzDbARO87+Y=;
        b=kHyg/mc00Vpv3JMs99rxnAUV2doz2ZgSvzCEoHBXXOAPbqc/5HUSbaAew4jXDyJoRu
         4uhk87nByQ6gWz1M22yYQ87VsLZkvikGlfAQBWaRr6z3TLJmZXCfQF7vSc2DIVZCgILB
         UT/G5iqYx+/PmWvt5QdMmAcvv4LqKUQseWlyuctO1Z61h7BRrSUaqY4rWebvgQuxNJLq
         J6tqhXd4dJ3RrYNFsKOCdkPoAq/phihnWKWWZmPlMcLoQyeYjazH947F6oMTc0pTzy6l
         /Omdu+DfX5OYM5B/yolGOyVEcklUsGA50KKcNgv/J1gBCDexG+b6uNqvpprXdGt7og7O
         Qvbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792107472; x=1792712272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qup/0fTJuqrpqVHOUf96Jn9uaZoh3joUToRTUOcNqDk=;
        b=LAFsp3l/d5qiEhbZ6Rrw53SM7RMxjuJ0UVchSLUa0uso9lyW8h4uET2rNsS/llYOoH
         P61DaKs3qx6HOBSMLF16WoaYj41v0iGzJwrw7+HEslkqtZZ5MNuQ3jtmXHPShCr665jV
         IEP2GA/zVk/rl+jA4s+k5JY4XO6nuY9K2AMql2c/rTGzgzx0vPeM5AOFdnVOFn2pHurd
         oCiNa5QHMKBntkv/Mc2rQqgeYeP+ZOlEW2WP4HOAra0WYQab6lR9LMQCQde/o2cDEx9n
         rQAe3dNx6xSmg+b85MdFD/+Ex/XARNryZQRAAL6McP+e/sWnxnJq2wWUdtPQxIld5gpq
         V1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792107472; x=1792712272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qup/0fTJuqrpqVHOUf96Jn9uaZoh3joUToRTUOcNqDk=;
        b=xKYjRs94E5T3UjBw45T/XgERPNgvK1j+mGcEdI8NzmSTT80UvDxxcR9W3gWjbOLkgO
         uw7szX7CXA7ko90xOB165DbOHBM5AQmfXrJvBEmWdjTBQXWAtRDb+J4pcR4cEcAGDS+6
         XpQn9GR2NK23SGkGxgsDVwW5K0SpoFKtROCO37oGJ5KY94wA3t2D30foYPlJM7E5r5Ha
         XeL3fCtijqkJ9znFn6Y53aQ+8PlVRp1xI4gYOyLRcm50hyG0MCupEIQKKAbESowLUuOT
         vem+z07OITJ4NYhajLqGZGkG9qGxLU51bOMeMHauHVHrLyI/orE6HckT5PgBUlyjC/MH
         cz2w==
X-Forwarded-Encrypted: i=1; AKwUvBxm0ZjPltmxlNI1JeSx/Syr9Ek17i29CyiEFuUpyv3zDF5loLmkxfRNgfyxQemRFkLRoaJb0mlJxtgzhGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKB77CYxECPV1nJn0dkVmgIeYTJ4FnIgWZUfs8dz/VyJfTRxw5e
	hBHsnYxtb/+F2xsKm+hyLvoJSWJtp21ZpgiFAO9HWwFlzQtpjtF/Ag18uAxWI3NJiJKWefkSKzk
	I0ZbLxKACfDFl6UP8kGKEm5KUon4K5Mw0Z3604E2s
X-Gm-Gg: AYBFou3he7uRHjigZWYqj02a+SOkXdaSC3kHjw0+qDJh/QkcEezY4iC4S+j8ynp/4qk
	xDfzajlIG94LENv8bPJghNJKWE+Gn+py1D6vmfHdxulDoi+lyfBYofi/XR7HYAhrQnpboleFAbX
	IMsQQHPBo5Uj+pe5E9/ZJCmOlSN9/jfb3SObhacvfVAtuubKxlu10cBcS+fxnXUM3XohDO76Zoc
	EG6I1nQgcDx0ScfRZ6EfaVfUgZj2xXFDhk5UEZVGwraeSF+8YMuPuxQLcCUQ/tbthD9g3dB9EtG
	tkBdEEfdt7N0OHii6Jh/fWgRkW4X3uneLRornH95/8h5keJTu0Egtdg=
X-Received: by 2002:a05:6402:c2c6:b0:6ac:bdfe:116 with SMTP id
 4fb4d7f45d1cf-6b38cb93ca2mr15455a12.16.1792107471458; Thu, 15 Oct 2026
 16:37:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-25-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-25-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 16:37:38 -0700
X-Gm-Features: AclHuK86u5zcGsIApnIwF4pcu-XWk7tXnz1x_tVliVjHmElNhctYwMRE1ok5HnU
Message-ID: <CALMp9eRb3ExsQ0g24YQyo85sV1fnHZadh33hBChUY=ZGUaT7jA@mail.gmail.com>
Subject: Re: [PATCH v3 24/27] KVM: nSVM: Flush L2's ASID when emulating INVLPGA
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> KVM currently handles INVLPGA in the same way as INVLPG, flushing L1's
> own ASID. This is currently correct because L1 and L2 share an ASID, but
> it doesn't work once they have separate ASIDs.
>
> If L1 is flushing a different L2 ASID than the one KVM is tracking, do
> nothing, as KVM will flush L2's ASID in hardware (and sync the MMU if
> needed) when L1 switches to the target ASID.
>
> If L1 is flushing the tracked L2 ASID, flush the L2 ASID in hardware
> using INVLPGA if running on the same CPU as L2. If not, fallback to a
> VMCB-based ASID flush. Note that if L2 then runs on a different CPU KVM
> will flush the ASID anyway.
>
> If NPT is disabled, also free L2's roots, as they may have stale
> translations for the flushed address. Do not try to sync the mappings
> for the flushed address as it involves walking L2's shadow page tables
> with L1's MMU context. This is similar to INVVPID handling in with nVMX.

Nit: s/in with/with/

>
> Note: If L1 is flushing its own ASID, it remains handled the same way as
> INVLPG. Additionally, if INVLPGA is executed by L2 (and not intercepted
> by L1), also handle it like INVLPG. Technically, L2 could be flushing an
> untracked ASID, in which case KVM doesn't need to do anything. However,
> kvm_mmu_free_guest_mode_roots() does not handle being invoked in guest
> mode, so using kvm_mmu_invlpg() in guest mode side-steps this, and
> should not happen with a well-behaved L1 anyway.
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> ---
>  arch/x86/kvm/svm/svm.c | 48 ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 46 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 8f2542357e78d..436d13f106369 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -2468,17 +2468,61 @@ static int clgi_interception(struct kvm_vcpu *vcp=
u)
>
>  static int invlpga_interception(struct kvm_vcpu *vcpu)
>  {
> +       struct vcpu_svm *svm =3D to_svm(vcpu);
>         /* FIXME: Handle an address size prefix. */
>         gva_t gva =3D kvm_rax_read(vcpu);
>         u32 asid =3D kvm_ecx_read(vcpu);
> +       int cpu;
>
>         if (nested_svm_check_permissions(vcpu))
>                 return 1;
>
>         trace_kvm_invlpga(to_svm(vcpu)->vmcb->save.rip, asid, gva);
>
> -       /* Let's treat INVLPGA the same as INVLPG (can be optimized!) */
> -       kvm_mmu_invlpg(vcpu, gva);
> +       /*
> +        * INVLPG on a non-canonical address is a NOP according to the SD=
M,
> +        * assume the same behavior from INVLPGA since the APM doesn't sp=
ecify.
> +        */
> +       if (is_noncanonical_invlpg_address(gva, vcpu))
> +               return kvm_skip_emulated_instruction(vcpu);

If L1 is in 32-bit mode with junk in RAX[63:32] (e.g. bits left over
from long mode), the full 64-bit value may not be canonical. Should
the kvm_rax_read(vcpu) above be kvm_register_read(vcpu,
VCPU_REGS_RAX)?
