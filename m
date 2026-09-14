Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C866361668
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789362315; cv=pass; b=d6ALYML0GAxps0RDk0ArzgN7HJQWIDC81N9c6hFt06ZmB4jhqBfZi6rj6N6yLuGAmFl9SsoOKhd6tL642iLJn31SznfKNTrD1bONX728/+0Ls9pjVhKRJuhd0K+r8scFGiAse+BbRCSB0S3uARvzZQsVy25qipsqJFpEO98NkoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789362315; c=relaxed/simple;
	bh=3/NGhGUhliQp1YZrkIH7Rm4z6KPJQjJZGZasUOJhwDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJv2Ts47NEFZ9uv7JbZnxUWISj2Mb+PENO3mt8xex+1TnjH4SR+5uSlcr/0Fk4tjcEph2UQfjn7CN5K5eg7Jz/j9J9UgjYo6dOde75FYBNDqXcjEVoB5ddp04TZfMbPOmPHr1HLEmyr6VZvcGm2QOG7mhFHU8QYmW3YA99sZvqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=Wg9JnYZ+; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="Wg9JnYZ+"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd80so567717f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789362311; cv=none;
        d=google.com; s=arc-20260327;
        b=ATsiFBp0yrNIDBVI2pNUMhz1cNiFFvsTUBrj3LS98gYv1TaxiyrSt4H+cx+kmbTdDS
         KU7IxNqgGHs0fV/oFcugj9HUrCA29wRV4IXDq0zqaydCYqBb28F+QSjhJhbwGLBq7u6p
         u3excNke94sheC6zLRihi+r0efnrvkqrHtn5tD52dw3+9D3Mo0+yZn9eMyD3/A5K98ef
         Zc+kCIQOwzxae7EqK/X7vF9wQvrdRjJGKgedH87vNHQA0pRl0klKQNdIrxDdn6dyUJBp
         OonyL7cHONi0RDStHVeNbGqR900QQgAXmXBLVp7tFPUvMjhMj83gtGnpYEaveCTYV7HX
         O42w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2lFbqmyGf2+vEHGBSIgu/0dJXwPUBsUwy+yR+CvMM8g=;
        fh=y5LkfNpSLUFcr6tzm4fMtgVm9RTzepCj36UY9VRFmO8=;
        b=PQ5tCiyBBstDikBvPtE6PkgmlleBC3kzP/g05ujk4hGmPUWWQfU71FFLvSYPMFGt0s
         jZ+uxlcDy4BHmND31/Eb5YBlAeDb8HiVs38DKZ7Vkb4K0yfCQWwzL4gzM4O5IjrAsneq
         roVEEhG4s2lpEiOQac+dH/nNhYvmIqqjlyymzWe1i31P4MUQA9o4wSHQqI7KFcsFLcgs
         xasEhZD/vIdV2l3WzaXoj9Isoy/T9IQI6q+0tjDcFdYuE+VqOYd4AiLSUxBqkfmMAcVE
         Zk4frIYniX8GyaARanKvP4iihJT00Dv9xkuA6QOlnzKMQC6uoQYxo4v/tyKwPdvJbh8I
         qElw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789362311; x=1789967111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2lFbqmyGf2+vEHGBSIgu/0dJXwPUBsUwy+yR+CvMM8g=;
        b=Wg9JnYZ+Ep+njDyjBhs2LCy/x2FnoqgIBuORrgzV01Rul7hBESWyGCCkQCFJk+mzck
         jIrjP5nQEhl5o95O0QwMxZ0vc9ONgXpqvIx3o2YKkczgbrJLgYi5o7+EVlelR/INpKD9
         qeZoC3a2zEd60XAsw6WxWSP0Vt2gXsG9B5SPkxE6AHgdNauvS5uTEGrTqd6mZWTjvhXd
         ByUbygPNwf6W4yK274A2CXi93kTLPgmcKmMB6zwW8DOZubRltDK7Pr0ZESMZk4II9WBR
         oSRB4MwsqsK1h4WFM1YFwGA08WBaD4tObTWP2fgO6Lwuv1ocqSxo3PLsfMUsNBo61nG4
         Wyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789362311; x=1789967111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2lFbqmyGf2+vEHGBSIgu/0dJXwPUBsUwy+yR+CvMM8g=;
        b=LuqAaZRIyqyL4M5kJQHXbimrMXmoupIChi63MBKK75Y7XDGrYPsOw3J85O7jT99RHd
         yXVo2Laaue/IG0jkUTpeWOQFBXJQRleVmM9YTIl/Ld0t7nY42o8SNmo5SgT5CcAhaVUW
         6fXvkyF7V9L1k79Xa02FEFyVJbJfP7KyGQQSDvT7K3lkoyLwLH//bDP2AK7wSNUI8Y0r
         JjznUTsv6Yq2TwPuT9KK6P8WzbkvxDOQLr7PeE3BfD1kF6DGKgVjxs5QEDRSFXdlkGLc
         cG2VPSJR1ubd9YaaKzkhtzkdloUUMghoFNnAFITCCzJY7fU2p2Uw1UoC/9C02DwzTE9C
         ohQA==
X-Forwarded-Encrypted: i=1; AKwUvBxiWC5e0uGODSnH8FGlWLsXXtHTMhBIdIwqWI2DfkR2QOfrjiQxXCPRSTg/ExOiPaK9M6cT1+2J8ClscVs=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ6oBYP6XrW75YTZ0MWaiB3+238pxUt20jMe4tCVIMZYmN5uuI
	ch8gBKPonCoD5HGiOCm6Z/XyCeh5qg2kAm1b4Oy2RoOi/hCEcvx7noxgQP8NHoWDdNqgtjZeXwE
	Tikm5Zo6Z9+qUqn35QcijZ+ELu4PB6ETUGs1ZGeEaTA==
X-Gm-Gg: AYBFou2JIjoykwRSOyfMcWV8n8bDjJtqrLwLt3meZYFYPfGJd5Jki09I2KxPgpzmK3i
	wyTvxIlmRXPZgzu/NB03JA0hiCxw309N2src4bOt6iAhmHqCqEPOk329vwaA0w06p8eUIf+xEix
	levdeBFJpKJjL60gWLeE55p9OnzazZYWnxqmzX2GW6HsXyE3ug4sSc76HZ8fgZxZbk5tVzdEZsP
	95d20Vcvs8dzGed1xnvsbm2SnbUirwl/lXuUOKH5HaNoTWMR3+9uIn2PWU2V0dOMtLoeOb9hZb1
	TuWglIryq/vLbDP9jvX+NXYB+pRn7zuEjiZsWvAGHD7ZfPOXGW+jjyynzdq7SPD6R4fByYmPDTK
	yEGZdx56NN8PcbITF8Vc0aYQvdpBJYEm96hf7YVUpuXOw5fkn0HsQp8wXn9nrRtImnZG7VDkTzg
	==
X-Received: by 2002:a05:6000:2891:b0:487:212:a412 with SMTP id
 ffacd0b85a97d-48702ae4de6mr759634f8f.9.1789362311187; Sun, 13 Sep 2026
 22:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825083719.643970-1-suunj1331@gmail.com>
In-Reply-To: <20260825083719.643970-1-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Sep 2026 10:34:59 +0530
X-Gm-Features: AcwNN1UE_9mObcL_0yUCsop8W1hIdGl2EPgpfLQFtwqx2oRTCfP20KwRbzdJA5Y
Message-ID: <CAAhSdy33LqjYrozd0X7c6kLGz=bHgOuPAk+r6Je2R9a5Nh_-VA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] RISC-V: KVM: Fix PMU counter handling issues
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel-mentees@lists.linux.dev, me@brighamcampbell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 2:07=E2=80=AFPM SeungJu Cheon <suunj1331@gmail.com>=
 wrote:
>
> This series fixes three issues in the KVM RISC-V PMU implementation:
>
> - preserve firmware counter values across stop/start;
> - report failures when writing snapshot data to guest memory; and
> - fix perf-backed counter accounting across read and stop.
>
> The changes were tested with the existing KVM RISC-V SBI PMU selftests
> and additional tests covering the affected stop/start, snapshot failure,
> and repeated read paths.
>
> SeungJu Cheon (3):
>   RISC-V: KVM: Preserve firmware counter value across stop/start
>   RISC-V: KVM: Report snapshot write failure to the guest
>   RISC-V: KVM: Fix perf-backed counter accounting across stop and read
>
>  arch/riscv/kvm/vcpu_pmu.c | 33 +++++++++++++++++----------------
>  1 file changed, 17 insertions(+), 16 deletions(-)
>
>
> base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
> --
> 2.52.0
>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued these patches as fixes for Linux-7.3-rcX

Thanks,
Anup
