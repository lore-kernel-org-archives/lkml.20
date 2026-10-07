Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D57438494
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 22:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791413382; cv=pass; b=Y2RJz4kgUKyLGVg8GM/jz42H9vU0OX5VLuDl24qLNYKGjx9qlj+x77kIwasFAIuCOr22O44nuG+m+7UL8cV5100frs4m/NPfbYKoJqI1tkZg+AUyE+PhHOtbUpjCm8sA/GSqUWpIKiBnW+b3QysAk05EkkkKqvIvwykcf7tRzYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791413382; c=relaxed/simple;
	bh=ueCAdNXKfuApdpHhwX8s1J3H4MHF9wnTt+I0E6rVefA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BhI2lzA6NAqn5+ibKbhH8xTLMCoQy1cy3JFd/TvNMkZCWnzBjadR9TthAKRN5odGnZxXJKHtlOP5A6XFHw8L8F3u5qH4FS7ybd1s2vrh8A6QqNhufA8wagJVTRkSAhS/ClczV6AbbKIar4XBi3Y6LSYcbSQ5PoLWmaI9T0aegFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TJwb2LLC; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TJwb2LLC"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a021c28046so8435e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 15:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791413377; cv=none;
        d=google.com; s=arc-20260327;
        b=l00VIAnrFTggjhYX+ITsNIDgw4Bg2NMiaiS97hjqgUF6S2ocBQEW4VJpHGJM1EVWzo
         /ADi+paA/k7nzP2f+2v5nr02vfu3q9Ni4ngjcrC6BDhE/X1NBwX8mkC6I+u5iwu6N6kd
         Qfi0BoVkKLfk/j++jtklRmJZV4zr/Eo9DNn8tnPc/WRU9oCtlCOsRt3um7/SZHti50mH
         jXIS6DKb/1K3LOSqr7th/KND3olZt34VcnLHbvBASEJza+VKT8/Dr3zpz4fbJKbc5u23
         4C7d1pFfnwUFRW2pZCQbFKgGYzKD0VtJKuK8vna0yCTDPSGjNWF8w+HWkYTxB+G3j8YL
         oNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U16op2Ui0JYvgEISwYX/iyuFKgIG9pLc1vhaX2SV2us=;
        fh=H/uDYimaUtc3prAF+VekHsIMRyn96mOmzwT4+9kZJJg=;
        b=hcbYz9D6nEu5lJFkf7EwEbHke7myxe08zc4dm1f/8x4vYTgeTgqwF00IZi8wDhsDGd
         wV3i1LFsjLBOMdIlMwVzBKxAocqxVpW1lgX+/ylQ0JZ/d1xMa+nQhp1nuX4vKjSjaEtg
         Y4wd/NlNd3SDaeHT/nAUk1JwQU355DvSkM4PwXnR64vQzWyYRKZOmroICzuKUnhecOHa
         /wv6p5+voRqdMJ4JPKluCShhrmZ29CeCkwLFkHPCAh7r2wPac5NhsRACqm9arXH33IGE
         Kkn5aJ2U8TS4yVb7R7zTRu220yGcOMewOCt3/KS0cnB5njl23BJw4a42ppizz9aNwn2a
         areg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791413377; x=1792018177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U16op2Ui0JYvgEISwYX/iyuFKgIG9pLc1vhaX2SV2us=;
        b=TJwb2LLCpCpayGPJIWk69Jbnt6FTIdrcTTjq1SVBhAefZ05nq7NU6FIclCHxoWt0XG
         TTPoV5di/HXCOme+XWgC6+FbwptRbT9uLwNssyOzVyXiEZ3bmFwahdxl/hLITqiS6sBr
         KdfMMTuitA6GO1eCyq3kxqX8Z3vAYg0eyAZ0VHVcJc/xh+v9KOYoipYeFNi+If+7Pqyl
         Wfp1h9+RCkdBDnWKUsQJGLXsnmN3mTSWNuhjW1YQI+yeDeX/Eb8xqNQdhB0TJrD5dPGW
         YHQZk1TBLSBxaxbMUSvA6vLJ5MRXiMAdsHuq1Vk0JZ3Is2VSYCYeIVepg+lRoAqz4bfC
         4pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791413377; x=1792018177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U16op2Ui0JYvgEISwYX/iyuFKgIG9pLc1vhaX2SV2us=;
        b=GEBFPvhU0J9zmp9Qx61vRdxjpm4ESIk+FcGtswkpuJ81oFWUw5WigVg5skb0AoJ5kB
         eNQ3UMZBloybR3EWsBPZmE9u0uCdS/s4cZYUlseIMR/xxMUAbr62a9XGhG8vJPAtS2ss
         /j9egdglBd0c+Uo75EZiP571Znd70slBiy8SPudfCnqREHFBlnSqFZlulA7+EfOhOI+v
         rGW/5p+8mfV279tplzVNTm3sAgED01HtGhxaGQvqKbtVPEI4vJNhM4N8rWS3/RVKoePZ
         zT5BcNGMF/mrOWOtd8dXy2KTAGKYKM7Et+VwZheaOHEqm6RcNwd9XFp5Pocobnk4//4J
         8fiA==
X-Forwarded-Encrypted: i=1; AKwUvBxv4U+4ZO6v0qjSTkqphUzizMYxaR1be8m3JusNaV6fgB/3QFtUMXaiqBqfZZymS99m9okvjgTDpnHcqGs=@vger.kernel.org
X-Gm-Message-State: AFuF++m3J+o06wr5lryFiYCXJOLXwgDs0HYbcFFcvf72EwGwbqd2eanT
	9OnlogbREIMmRrAGVPFacsBXbeogk62xjYZDId6dJKZyQV92+w3RcVDNTmEifRCpMTByyz/AKOc
	TfgbKuGNjfASnfMMRkwHXAIueYCsHahdwWJPjTeOI
X-Gm-Gg: AYBFou1y3l8v8I51krg+j1twuIapnt6rFqWAx8LsYvZ394yreKK/g79GwHWphLN3G4j
	eLVRbnIXWY7cYqcpAd1N0K02owTImUgLA6KfYcDsAzKTWJcaLebbq/GZ9jZY903MtI/kHSP8rsH
	OhKxBHavmSIP1pM2rL2CY545C1yUoHHFkQoGrqIFXLax4CdyXatZubFcSuiiRQ2Az354ACWx6+t
	valRaAgH5A0NRdndBNa0CLL+67fEf/H8SxAiL8vqtk1cFQo/IuMhxtF4akuER54BViymN8A0kIz
	WAiv+Z5qTMkN38yUcCwLLR/bw61chwQCRlM8/NxOEa7jxuUxZ+A5
X-Received: by 2002:a05:600c:2154:b0:49c:ff18:79bd with SMTP id
 5b1f17b1804b1-4a18591a665mr105865e9.9.1791413376953; Wed, 07 Oct 2026
 15:49:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001135711.934152-1-guoziyi114@gmail.com>
In-Reply-To: <20261001135711.934152-1-guoziyi114@gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 7 Oct 2026 15:48:59 -0700
X-Gm-Features: AclHuK-OHjmAc40mDjPz8eYhHrh9Q8RxrfmmtdzMZsmdMbZL56s7kGmmUzZWIM8
Message-ID: <CABCJKuf=ExB_=Qwowtx-jtiKG_ZXyqPkxK09maGjReUZs6EP_w@mail.gmail.com>
Subject: Re: [PATCH] riscv: entry: gate shadow call stack reload on
 sstatus.SPP, not tp
To: Ziyi Guo <guoziyi114@gmail.com>
Cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	wangruikang@iscas.ac.cn, debug@rivosinc.com, conor.dooley@microchip.com, 
	namcao@linutronix.de, zong.li@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:57=E2=80=AFAM Ziyi Guo <guoziyi114@gmail.com> wrot=
e:
>
> Under CONFIG_SHADOW_CALL_STACK, handle_exception() reloads the kernel
> shadow call stack pointer (gp) only when the trap came from userspace.
> It made that decision with scs_load_current_if_task_changed, which
> compares the trap-time tp (read back from sscratch into s5) against the
> current tp:
>
>         beq     \prev, tp, _skip_scs
>         scs_load_current
> _skip_scs:
>
> tp is a user-writable register.  A user task that sets tp to the
> linear-map address of its own task_struct (&current) before trapping
> makes the comparison succeed (can achieve by brute force with KASLR
> enable under our test), so the kernel skips scs_load_current and
> keeps running with the gp that userspace left in place.  Under
> CONFIG_SHADOW_CALL_STACK gp is the shadow call stack pointer and
> load_global_pointer is a no-op, so the compiler-emitted
> "sd ra, -8(gp)" / "ld ra, -8(gp)" in every non-leaf function then write
> to, and return through, an attacker-controlled address -- an
> unprivileged kernel arbitrary-write and control-flow-hijack primitive.
> The poisoned gp is saved to task_struct.scs_sp on return, so the reload
> is skipped on every subsequent entry as well.
>
> Decide "came from userspace" from the hardware sstatus.SPP bit (already
> in s1 at this point) instead of from tp, mirroring the check that
> ret_from_exception already uses a few instructions later.  SPP is
> written by hardware on trap entry and cannot be forged from U-mode.
> Legitimate behaviour is unchanged: user entries (SPP=3D0) reload the task
> shadow call stack, nested kernel entries (SPP=3D1) skip it.
>
> Fixes: d1584d791a29 ("riscv: Implement Shadow Call Stack")
> Signed-off-by: Ziyi Guo <guoziyi114@gmail.com>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
