Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792578249;
	b=C778fFZSVgpxwR4IDGukFJF60JjfbwqVRgs2y8RImPsz64PZhnZSwlEp9FPriMTOYu58
	 Koh+SmV300LjqvOMRjJSExTg5qkx0hQxwfvmYi3uXkSW8g9PQMCmNmHtm25IxPOYcsFwV
	 Y3LFegDa23zZGqaqa2HIRnVBxmy63P0t8TEwMHRLMVY+XNv1L5pXPy5aJ1RseHKExovri
	 J9p0Drr6rmwwXkH6/np7MIGJeXEdr52a4dmQxI0efXbYd3t98vDDwxxfD7dHtC7tNyKpp
	 txwRhQS3XmpSq3MBkSkj7l884rL2ZPuSRFAYMLw5ZgsamjRcHBjpMbJ9SmKTu5+Z+zA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VOMZZkZ47LzRUwWzSV4zQRcKDwW70Ygvq3uLyPdNJ8I=;
	b=HaSwTSiJ3TXPIqh8kPnhQT8J/sk6cQayFQZLrN7WB4kWOQcdDZa9zmjSlfONY7fb8iMz
	 GqmgzRvjueJVofOlVsl1FhtpUpXcdvnStoTAketUG+1HipheI66ZllhKut5b0b3vOnkkm
	 A7GvbEL8RmS/AV1cd0qMPguKtoT8/b657R5BD30j4IkmF28KynakT5BCLXpEjhVlm8dBv
	 AX+MdN5c94gKlOSv1ahsv2VvMXUeSiWxpybrFJT7SidxzpWOPZ9NjadMacAEHYITGoh35
	 xWFd4pE7DT+xV+xPWmuNqfsoDSsu84BAv6EtRCgJCKoeNHdzrs6p4JrJ8u30/kSaKgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CWkfdWGz;
	arc=fail smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A97606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7A97606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CWkfdWGz
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so830741a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792578247; cv=none;
        d=google.com; s=arc-20260327;
        b=HyD2hYcGvVA6ysGzK974Lm3AYbvE0qdFjqOyLcndgn6yF1eoBFItmfVVfhVkE4D42c
         SqFXYqa0FbAKdnP5MbcirQVGr9Eggr3S7h2pfUqyV4tnNaIdC2vxY8bSmU0aqqoRaYKw
         i84G3OPw2Ty7dhtDmvoFg8yBDnaRZ1axteEoqHnG73NBbGSshMYnlqsQEy6Q/XlFMVH0
         FFGu6s3+XnERAPLuBAsQuaOYrfJUp3PVIcnDsdJHwmMcxSnqnCDhEKl0crWLyR/f6C8d
         TASFVDDUpQY9z9R3p3Erl5an8svc3E85HqSfWzEgvNZ9d2EP7c5NYFa+sV+hnTm4WvNB
         h8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VOMZZkZ47LzRUwWzSV4zQRcKDwW70Ygvq3uLyPdNJ8I=;
        fh=g5/j4myBVkqP2Ho86zpRuDzN3wEZbRa3tuS/IKgXi3w=;
        b=iEnvil5Ns9SGA3ObQc9x+i9+CR2f2uvqgDQIrVKQnRwZn2tlk7EB9SVWc9SVl/BSqA
         x2QmcV+9fq8OpeieAUWJ0wokjwcCSM+pI/V2/tFVZksRPSm6SYvCac74ngbcxhyYbDUo
         wXGpLffhRUSvfDUOPuvSIQMuTcFyoeFEIvB18G4IoQHlZE9Mm2toWyCbAb44D+72qe51
         LTpm8EF1eWyUi95x3LJbqa1XVvc0C2eVMiUNZnGSE5cUYNXG2shbINFedEfIgHB25DU/
         ObVahdqSM8ooYdi5VUP3wsfrpNL/pDA1t61ywGbv21ABs6KyDOFM1zF4nAxNNioKsrKY
         ww5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792578247; x=1793183047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VOMZZkZ47LzRUwWzSV4zQRcKDwW70Ygvq3uLyPdNJ8I=;
        b=CWkfdWGzhYCkALaAxkWEy92J/p5bnsgNKnuhCsSudXjcKntuPfHyyYSbdMiAVUKF/D
         xXmU1nBAbvfTJZuKjeIep9ay8c36eyvAy5288F0ylX2jbnivSGoEeB6Xl41GbrodtbVh
         dJgr46KGTgeDgDiyAHtdLbSgURMpkHbSq2THqIpwTD1yhABfVr57voRbKx+aB+dEB3IL
         igF/ieRVXdgTCwos1/PbzzDinCSBGqBlGqtZp/gJfYCHa3Q5LlbJ74e4xSueFSZ9LRbh
         Swtg/9gs84xNb5ww1o1XtR/Aauz5GMcnZEEbSlK9rMzwJrWjI0u0AjKe6m0QD+EYEKj9
         zFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578247; x=1793183047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOMZZkZ47LzRUwWzSV4zQRcKDwW70Ygvq3uLyPdNJ8I=;
        b=urjPntesp2m0+qfzOaZjY+OpXcOPIqRYh+IdunQ9X9n5i5USeXwmkEyYsi4Y0OPMy3
         MW3uQwZlM82HOiLVbk8pFFq2m0VKWpVUednJ9AXjDpu6yPYatUSjlENPo+QQNQN9MbJJ
         xUpjlhFnEpegTdJEyj1JFMc+oAdKzMwP22o6lNOUiI6P1UXB7OJIuxmhSdmXJ3UFRqyQ
         QEPOLb5sGezEb4HAJOz/ESxmcNXQFNXw6VhlXa0kbkpc+TIHsfw+1giN5FomiXakFAGO
         IjiSI8oSOIktvHvbkQI0l719qmCUQDAiw7arQiMLMu8xswHpkd4ThW37TMogsqPVDq6t
         0fCw==
X-Forwarded-Encrypted: i=1; AKwUvBxEECg69eLS+71JXrrJhv80M1HMbxgeLX/I3K+vAoCUNyWiXEJdngEh0RLux8JwAYjtD/TlPSfBofdxBX8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqCHkRUKHtorkpd06OMi3zBLisdc/Q/oihVKxLs2bi71a42Zbd
	AjUw71LUJiOuLOdBUY6SYhscp6484B/znnWRuC9GwW8Omri0Co1hAGMndDqyQLjIMXfQfuGlOPP
	JSQasLp60VUQdzdJZsA1Hd7NWy6w/T+c=
X-Gm-Gg: AYBFou3d5uGea4YBSvknuZcBVq3GQAVBw2kC6vkGnDnE7Bk9jwwguUWUGfmVJYut+d4
	FRclnx525oHn3/JCpUCU7JZsT0J3RwxIVqifovccvvNkzKk2jHK1oHHMG1j2fv2JNi2QgRHbjd+
	ROpLpu9f+GU5kkb1ggY9K0aY94NNnXlstJSrGLHEWBhIPAMj4SVqs3MyHPDd99BOAmSxUcuOO6M
	KTPMv1uVA+YeiJ4ZJ1BDht7VIeA+8dtE67EDb2T5gTb0WXED0nHyTQzlo+b06jP4IOlM8vCvXNu
	cOTvSwU07wCWh2OSL6DdDREDYEpSNP9oeZtuizCefatpjjJghyDcatjywb1dDEqZ8x/Tl7H5dhW
	teUTVaAh589PGe9Rbc2rra2/qfFQIaBRE2+tZSGd5zSdkgsUGVzMmqtM8vY3Ox5XLrQ==
X-Received: by 2002:a05:6402:1952:b0:6b3:8018:7643 with SMTP id
 4fb4d7f45d1cf-6b408f17a21mr1001907a12.45.1792578246850; Wed, 21 Oct 2026
 03:24:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-alpha-perf_reg_validate-v1-1-a8e8cc23ea7a@linutronix.de>
In-Reply-To: <20261021-alpha-perf_reg_validate-v1-1-a8e8cc23ea7a@linutronix.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 21 Oct 2026 12:23:55 +0200
X-Gm-Features: AclHuK_782kZK0_bPAJNGl8tM-pgq0N_Fyf-GVnQvK6PjIgABFx_7x0aoqI_f2E
Message-ID: <CA+=Fv5QWoVZqOR1uHTaE20XWBkXoVqbjTE6bF2iDvvJn6j5hfA@mail.gmail.com>
Subject: Re: [PATCH] alpha: add simd_enabled argument to perf_reg_validate()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Wed, Oct 21, 2026 at 10:18=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> Align the alpha function with the generic function signature.
> The alpha function was added in commit 9280e99d87dd ("alpha: add
> HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support") while the
> generic function signature was changed in commit a2c64c74c029 ("perf:
> Enhance perf_reg_validate() with simd_enabled argument").
>
> After both commits landed in Linus' tree the signatures now differ,
> resulting in a build error:
>
> arch/alpha/kernel/perf_regs.c:46:5: error: conflicting types for 'perf_re=
g_validate'; have 'int(u64)' {aka 'int(long long unsigned int)'}
>    46 | int perf_reg_validate(u64 mask)
>       |     ^~~~~~~~~~~~~~~~~
> In file included from include/linux/perf_event.h:50,
>                  from arch/alpha/kernel/perf_regs.c:4:
> include/linux/perf_regs.h:13:5: note: previous declaration of 'perf_reg_v=
alidate' with type 'int(u64,  bool)' {aka 'int(long long unsigned int,  _Bo=
ol)'}
>    13 | int perf_reg_validate(u64 mask, bool simd_enabled);
>       |     ^~~~~~~~~~~~~~~~~
>
> Add the missing argument.
>
> Fixes: 742f62b63904 ("Merge tag 'alpha-for-v7.4-tag' of git://git.kernel.=
org/pub/scm/linux/kernel/git/lindholm/alpha")
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/alpha/kernel/perf_regs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/perf_regs.c b/arch/alpha/kernel/perf_regs.=
c
> index 33ea2e831ba0..c5a55bfa15a5 100644
> --- a/arch/alpha/kernel/perf_regs.c
> +++ b/arch/alpha/kernel/perf_regs.c
> @@ -43,7 +43,7 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
>         return *(unsigned long *)((void *)regs + pt_regs_offset[idx]);
>  }
>
> -int perf_reg_validate(u64 mask)
> +int perf_reg_validate(u64 mask, bool simd_enabled)
>  {
>         if (!mask || mask & REG_RESERVED)
>                 return -EINVAL;
>
> ---
> base-commit: 2c455ddca7827ad8fa3a64fdbf5a60efb928b46a
> change-id: 20261021-alpha-perf_reg_validate-c9b0a144fd3c
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>

Thanks for catching this. I reproduced the build failure on current
mainline and confirmed your fix with GENERIC SMP and DP264 UP builds.
Both also passed perf register validation and sampling tests in QEMU.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

If you have a route for this patch upstream, please go ahead and take it,
unless Linus would prefer to pick it up directly.


Thanks,
Magnus
