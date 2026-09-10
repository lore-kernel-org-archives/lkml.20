Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6847139A04D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048763; cv=pass; b=TxxZmkB0x0I/qlRe3OrAi/g1hRofHPmBft/V0LWh2RyFbQKDbVKdnUKXMsYstX3iQTt3sEvBF2mv6No+jLce74p64SV7XAl9XYVmeTRkp7ZXzmcYaLSKXXe0B4NM0ZEgAoC6MsVYm+TVi4ED/p9xe8wSvLMj8n8di6idJJZKxvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048763; c=relaxed/simple;
	bh=4FCRoa1ZFnGPclKdf7FZ3h4xxGbrom0G8s8bGT+RMtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ivu0OCcsJvhvbDNuBs0e8Tafwf1fVB+EawlCndZbYsvcBzu2ouVvT7SoWyDwufTIYSUcYRhKPCr6oOnCERe+Se49ZWd8p2uPohhBmUcx00MibUeimzCm07ZmV9WDDB4beUTuQ6GJzRiHKuvSFeRME9v8V/StRqa76GV9ykV9d6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=cezdMIZV; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="cezdMIZV"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47de0093c42so6582290f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789048759; cv=none;
        d=google.com; s=arc-20260327;
        b=KlQH8afxRLZVtIIF72d9mGBBfL+0yNLslwiuFisUSTQMyDm3+Nie/uk/qeb7TfwWKR
         Rbv6o6BEB7Tixf3871y0p1ewPMhdGPrP4x+8xo2JxaN0Sxjdm+4keNrQBUx0IGbb5FZ2
         Fn9VxKFdczIlNNSrfnG33+yo8UGiz9gQjSn8dmazyVTfRnRZ5KGiiGxR4dcNii7JT6e/
         HwghehbTzqQIEyjYYwK8/aFKnthunEbrUeln3ROZD2vBN4yPGqMZZaqFYr3sTEtUqH/D
         bWVmSEGebCVwSVbOpldMNzhPOjabxtWuMlByUx/xZsGt1PvwEsCjg7l5INh3wvYM5uu7
         DtbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a8PvUIr6sHE6mWd/xzRSFBh1HE+N0XSCwjCHHa9qZcw=;
        fh=VyCQgqzs7jthXWnFrI7TS+rPdk+WECxPlwwp5e8aDa4=;
        b=YsmHp7Aw7rZue4LHKwgw3pFfijAY66DiVJdHXrU2fkO+7woEMmtBqvuQGIXSlRJL4B
         gySFDrG3f0UIgETPTOb70TCbJV79d/zrH69yJPUjUabUthBuHtJ+oJ+lAx3vNNmdmDhV
         ZXrCp8wk1kMT/1++Re7cSMXWmxrD7ceWWFCx8eCgJ0bAkj1R8v8GG5yBm24uYDFggG1P
         6VuCfWhbWQYDCJVxUR9ChRh4NXlLkRnLVN2Sdn8KSe4zwFeVtuzTfl/Yk9Bo8V3FYoN2
         oYpnv+GrJK4cYUAV75F2kJGiC+bOXelvZN14z2caRWfYr2Gq/IRpQILvNUQYcOlG3tWW
         xQyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789048759; x=1789653559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a8PvUIr6sHE6mWd/xzRSFBh1HE+N0XSCwjCHHa9qZcw=;
        b=cezdMIZVSt/fPfjPM4Tz7FCdYVXwEhvQh4y1VNkoAE6iTTKKxoAwM2P6UpEay8aZRo
         xkeuPkPs1GKJxYdoFtai1dg31xay+5IogFF/e9TemeVV0ohMBYVMeMsoyqxARbg6vsey
         bqn4f9KdCZpO4bxWRqgA0LWYRCm0ddgKK2F6DCFGaeIy9oCc7H+Ovmzf2DKYinnjJAzS
         IoX198GgGsmkCnV/qgo25Cku/TF8djv4y+M+6RcRFn63TN+jTyd/yW/41hfqCRyaOw/4
         So4AA6wKwzBm7nODwEKHitRIcNBnT07F55ldEm1M/0U5dpiw/PSckrTOMpVVfeSX0+kS
         yZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048759; x=1789653559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8PvUIr6sHE6mWd/xzRSFBh1HE+N0XSCwjCHHa9qZcw=;
        b=LLb/SUW6JDEFA2Cg2BUkWSC6y44u3nYMcFNbTHRYO4mjY89c4KdEQCqFx2MhKUpibs
         y/rYaMb2T7Mag1nK/MBpRF9EAQWc/2i0NX2D3T+oZAvrki5hM8QXSvQhar+vdvHqIVd1
         vLtDauUC4H9+xMgqJidbl80qmYQUUNiYFQyYWdNGfWCj4TgnOMdr22eLRldWPSFwDhVH
         ZdvDr5ydlFqLHpcjgCsfByR4XBJe1aXQ5SeXYVyQowEVYWRR6DapZrt//Q8VSVK2nAxy
         WdqdWN6InTZYCseP91OzR3p7yLQIV+DE80KP4iz77ZK7Uj7zjRzZu7FcJH6B+Zi878GB
         RnzA==
X-Forwarded-Encrypted: i=1; AKwUvByuhPDJNCwN36VYwSxp7nlGPSBNpC76Is1fNtb8gB4QLRsWtVLFFFw8z0WkxVTo4goCHOVOx8IRWpqbrXE=@vger.kernel.org
X-Gm-Message-State: AFuF++m4OkXosyWDs5iSXBSUzuziJ9D7TBTyLrLzfWyjN8fcj30CY4oe
	I654lseg6B/mAop6OApIIhDzGksyoS1wUGjQB+nKRpZlDhNx1GfLs3Juwu02lACw0Kha9dx4tc8
	9owN2B81z9v81j8JF7DFAcC5/Xf+S3Wl35gP/7QADqQ==
X-Gm-Gg: AYBFou0yuQyIqx1YRCau1S5XTdYJ8D18/ypooezRlsdrqIPeRiq/pRHtw6iKKbE7jdt
	1JKvj+r9VfEuyiskcnI2JfaOkwy8FgUCAeEXA8utXKmVSV3t3hKgKbWKxGgq2kiagRbtbTha/CZ
	M8TN5imvMlScjVZFK/J8EeO465KTvD0tdXt8I1kmbrQLgVdhoc89m2h2aQ1HyXiTFpsD1nGxf5p
	36sfwrMesoJjCfTY6Y8j59MhoohzM9MGP8chCBBcea5AGX+8F7gU4XXfjUMA24ow+/wFBvc22QT
	9RHNH+7mgkyxOgYUppCtUdobXSvIvha+eu1TrkWUQQaHhf98r5yr+c2iynqWRLYUafTv9FSfdUC
	RD6Hnl6D8kAWXgBRO0uBU4X3hSUC2HN+BZdrqH+vA/Y15CS8CzlfiPDkf4k82b8WkbsZXe0h4bg
	==
X-Received: by 2002:adf:e19e:0:b0:485:8c16:5eef with SMTP id
 ffacd0b85a97d-4858c166088mr39391128f8f.41.1789048759310; Thu, 10 Sep 2026
 06:59:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810051544.3953925-1-xb@ultrarisc.com> <20260810051544.3953925-3-xb@ultrarisc.com>
In-Reply-To: <20260810051544.3953925-3-xb@ultrarisc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Sep 2026 19:29:06 +0530
X-Gm-Features: AcwNN1W7Uqn-QGBR02QgV1a2VTJVT2tlA_caJMvDJlneztIk9EUK-XjvcF0ult4
Message-ID: <CAAhSdy2qxD9x-mvt=5yEKA+xoa8QJ9evnQkJot9n+rkxvOQukA@mail.gmail.com>
Subject: Re: [RESEND PATCH 2/2] RISC-V: KVM: Propagate interrupted G-stage faults
To: Xie Bo <xb@ultrarisc.com>
Cc: kvm-riscv@lists.infradead.org, Atish Patra <atish.patra@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 10:46=E2=80=AFAM Xie Bo <xb@ultrarisc.com> wrote:
>
> __kvm_faultin_pfn() reports an interrupted host page fault with
> KVM_PFN_ERR_SIGPENDING. RISC-V currently handles it as a generic error PF=
N
> and returns -EFAULT.
>
> Return -EINTR for the signal-pending sentinel so callers can distinguish
> an interrupted fault from an invalid userspace mapping. Do not log the
> expected interruption as a vCPU exit error.
>
> Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programmin=
g")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xie Bo <xb@ultrarisc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this as a fix for Linux-7.3-rcX

Thanks,
Anup


> ---
>  arch/riscv/kvm/mmu.c       | 2 ++
>  arch/riscv/kvm/vcpu_exit.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index d189fd5..3e955d8 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -708,6 +708,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct k=
vm_memory_slot *memslot,
>                                 vma_pageshift, current);
>                 return 0;
>         }
> +       if (is_sigpending_pfn(hfn))
> +               return -EINTR;
>         if (is_error_noslot_pfn(hfn))
>                 return -EFAULT;
>
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index 88e0c36..8d36eb8 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -283,7 +283,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct=
 kvm_run *run,
>         }
>
>         /* Print details in-case of error */
> -       if (ret < 0) {
> +       if (ret < 0 && ret !=3D -EINTR) {
>                 kvm_err("VCPU exit error %d\n", ret);
>                 kvm_err("SEPC=3D0x%lx SSTATUS=3D0x%lx HSTATUS=3D0x%lx\n",
>                         vcpu->arch.guest_context.sepc,
>
