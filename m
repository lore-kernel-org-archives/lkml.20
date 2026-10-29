Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793243851;
	b=oUjvENkUAFd713kW9YS+n7y2QOvotG0lIiD0bHoJqqLXZTzhMGuGE6baYwL7G5miwn16
	 x0s9jR8+xskeivVQLtz/vVHWmctP5FLdGdGtNeWKEnozAM/NFqNBGSXk3B+Q6kfsqpZI8
	 2ozSMnwBA2NeUse3l3d9ZaLUnHSu4smXg/WiohDlw9VzBk3vT3Ix43R8EUFHgb5ZzcyBb
	 +KPxiIyw9vqfHPlWRUzjITMC12h149F2Jlt08l+oFzbwy6e5ishb2JtiijC0PMM4fks8X
	 m29jHTEFO3Ngb1+Vc0n8oDCL7niQrBz59nfCVPB6maoXCubyQ1za7FcxlSAo67Qbe6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T2HnLVO9Ia1aLW0RavN7xDKo4uNGTSoh79eBgSOlAqg=;
	b=mwROGVS4Ke6Llos5atlwv3h9dZP02gUS6paMK/DMfNZGFDJ5fmO+SOVzoaCG7GYv/Aph
	 NZctCAZjtjtooJoSOqbD6ngEpJ6KZ308ZfrKP1yiX7cH8qrzAwg/ohPS6dJsiYvIuXYyZ
	 5Nw28CH1+KK9bz+T35bgQPaLgDDwWSPYN1HXv66T9TTJ12f/KN/D5jZjzLm7eetmcV7Nl
	 jxWDCvDJxpg05a+zTOX5/fVp5ONxQtaqxzbqbyehHs13dp9JDSIATIEGR3wkEnVhBpnpq
	 ZpqWxPTKeiPwD71WQgEvAsU2dwPZ8K5IB8KrNaV5Dwzoq1begVMv4tBXgsr3aFeZIJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=uAEPxiyG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1243606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1243606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=uAEPxiyG
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso11121545e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793243849; cv=none;
        d=google.com; s=arc-20260327;
        b=gsnaa0uKLSf/3NwwfjR202F/7xqlLvRY7tXxHHibA+Yvlj9BKoevjo+kFyNsQQIRvP
         cIhX1sg4lnKPwadJ4Xk7LSVGe1/BLonbsy3E1DPz3IVXJCVsHbzzbJhiaaNzFQ0u9IIK
         NriHDhTAg4UT7wBfTwbTslWHBZGkJIGqcBJpXaqo7nEpVzXYejNIFhOzme38GJ8MVAly
         C4arOe2KwSL5uEKjbv8WXaGDDGcqNpzYDPAYh34uBtXlpWHqnS9C5UD3zSommHi0uuqj
         yzaELt4Ur2sm0KgOkiJ6Vici2cxKq5gEmcHttRL5CYVkWRQaQC24sEME7VI9amy5SgKg
         82/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T2HnLVO9Ia1aLW0RavN7xDKo4uNGTSoh79eBgSOlAqg=;
        fh=Hzrkog+rrN8CHxGSOBhTOk6cO2gQ+AgKOvMySkVwfBI=;
        b=Y69nWblWGtewUs9QtnpwnbC4V3HnSnKvziKx8UxnNo8VMLGJmxvm8E+qPxZVC1oV78
         /z467C+yVMKVaFp+yIagvPymRzzuhTNHgLsPNL8vQ9XJpHaFiaUbclidMk1sR4cqWt/I
         B/SuFbvIlXDlCTMCcvpGUDxATRVhP2JhZ7StNW/zcIIu5dlhei6TcIAr5WspmJcjxeYu
         0IfwC+nKrlC1pxPFc8MdqSqJR9C6wMzn6jt+XxQF6i5/O1Vk2jeNKB03wgHAkfAslLwR
         1ZiDWolOcqQ2+REwC7otqASBoCnqBHFbedAwJhT7L2ZsG2tUNKf/fA+BW0oS65q+SqcC
         gm/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793243849; x=1793848649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T2HnLVO9Ia1aLW0RavN7xDKo4uNGTSoh79eBgSOlAqg=;
        b=uAEPxiyGlInTkE+Wmb5BaZ1pHuZp6REPd36Dg57wWZ4UVfl0fMJQPqa8Y4uG6d6lBf
         c9ufxPTbQthy0GpBCgqOrDbt3g/CyBlYJvzl0uNq7nIdKDIArZTJJA2sSRfGgzSM+XZe
         TBrD3ONoqr5J4c2Z8ai7bxRiibb0wTVPoo9eZfwISdO9M1MrpekBMVmRk2aSz4rjK+pU
         Jitq5kPI/m5o4XCjIYRAuhZc88oflH6JvUqwuNRDOwYkxPVDQOFdMiPk1bKAlj+laaSx
         swkFjm82uQp7jxr89pm8HnPGA8j/oPT6ri4h24NrOeNR+ZUhRe8uW3zu1ADZGKt+uZHl
         NYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793243849; x=1793848649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2HnLVO9Ia1aLW0RavN7xDKo4uNGTSoh79eBgSOlAqg=;
        b=ZZ3G5SwRfNNk04Wm8mMMO4ADG2R78TDmKC9Cv+bGM26QbuftllI171zUiGPw4OxT6G
         FrUBp9YxCL2jupg0TKu3rM3g4XGlK4wwqqgpdOn5xFQiRPuqe772JGoedi7vFg0EN4m1
         tMTg0ZSNaNViVhZ+heHhi0obi0Zpjd55GaBaqsfrbejh8V6kaAVnjAFf+25fN+TgToha
         /VzsDa82sd8+lsRuGtfNxmBlak0jYrQUzaiCaucy89rSHStm/ZJkVQkcHVKDmdG4/8Cp
         jNj3bF1pAnfhG5P9jYj974ayC3rxU7yP71bMz+g/RZYuDuveIvx3ZEurKrklltpQgixN
         rrJA==
X-Forwarded-Encrypted: i=1; AKwUvBzSEToqNlfEwQH1zIfuVyq8YWW6mqPGZYVar2CdCFr94oA96btInywJUQUMXihtrlPwCcK454JjRIYc7HM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgdi6ISLcNp4bpXlmrjTtPOSJlqb8c/oElTba4lpnGdOaMaAUy
	lrKs7/CZATfQrNtbGq4+Pltn8mDc6CigaQLkL78v2KzwQaanKI7hUnYrYxJkhXQGDX1vJ/2ONNE
	x2bNp404TULa1R+PzMg1ktcLgYUFTE9UDm3nsRX/Y9Q==
X-Gm-Gg: AYBFou216RmIiTA38C30gUn/8UZ6v5wVmD4tXF0YW4fg1Ld3y8CN7DISy2MqjvZMED6
	dE3kWf2+NdOqv0P5qU+h2t4VoKW39iADOGW7a5Hj09uyh4L2QyQ2MdSxlmDMvgz6oNhzo47e4hu
	UJ3dGxGAUlL6bRDFWz7+h7i7+8lJLwvMneLnQCDe2JLA2iMd0eR02aiPPXqt67JRz4KVYfuxgXg
	W+A50c3EI6EwTVG1746Z0PS5+gQ9OfE97Lr3evQsbHuaOfBbb2CYCaNVvAZDg37xBZFhHPT2AVr
	CTdul0YCg22sz9t4Uq1D4EGzkslg5mm6GUz4voI23RUr1r//5PE7FbLb2eYgjhkqAOz7AmUcQcr
	p0YpzNRjV9U2M5usDAZkrz32y1ZE5xb6F3xuc0+xch77NAiey9RPmF1DDVO9b8o7FcOzDo5Hik/
	n58ckMx3MaZrWq35ayQYLFVsGWJjH172f1+7wTDlr1Kblp4Oa7S9RXbQkWeFSsNoOuOznzn6rYG
	kdO
X-Received: by 2002:a05:600c:354a:b0:4a2:74f:46c1 with SMTP id
 5b1f17b1804b1-4a96667c86dmr91055985e9.8.1793243848793; Wed, 28 Oct 2026
 20:17:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com> <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
In-Reply-To: <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Oct 2026 08:47:16 +0530
X-Gm-Features: AclHuK-lVk0iiJup6LpFGQOVP7LJYplmMO9EUMDts3fwzO894BeUhVnmdWTPpTA
Message-ID: <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Paul Walmsley <pjw@kernel.org>, 
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Yuanzhu <yuanzhu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 8:36=E2=80=AFAM Zhanpeng Zhang
<zhangzhanpeng.jasper@bytedance.com> wrote:
>
> Hi Anup, Paul, Himanshu,
>
> On 10/29/26 12:55 AM, Anup Patel wrote:
>
> > [...]
> >
> > Changes in v11
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Rebased on latest for-next branch of linux-riscv tree (commit a5ae1bf65=
cee).
> > Also, tested PMU driver with both PMU irqs and PMU SSE events.
> >
>
> Thanks for rebasing and testing the series. I was a little surprised
> to see v11 posted, as I am still working through Himanshu's v10 review
> and validating the fixes on hardware. It would have been helpful to
> coordinate before reposting so that those changes could be included.
>
> I guess this follows Paul's request to rebase onto riscv/for-next.
> However, there is one change beyond the rebase that I would like to
> clarify: why does patch 4 remove the scoped_guard(preempt) sections
> from the CPU hotplug paths? These were present in v10 RESEND, and
> the local helpers still retain their preemption-disabled assertions.
> Is there a reason this protection is no longer needed?

Yes, this is based on discussion with Paul yesterday.

This series is blocking the whole RAS ACPI support.

>
> The changes discussed on the v10 threads are still outstanding in
> this posting:
>
> - Preserve TASK_TI_A0/A1/A2 across nested exceptions.
> - Replace the temporary GUP-based perf user-stack copy with nofault
>    uaccess, following the x86 approach.
> - Address the per-CPU initialization/preemption concern.
> - Split the MAINTAINERS updates into a separate patch.

There is always going to be new updates since it will take
time to harden the SSE implementation. All these changes
can be done as separate follow-on patches.

>
> Additional fixes from Sashiko review, the kernel test robot report,
> and our follow-up debugging are also being consolidated:
>
> - NMI-safe entry and lockdep irqflags tracking.
> - The unused-function warning reported by the kernel test robot.
> - RV32 vmalloc synchronization before nofault fixup.
> - Faulting-PC validation in the kprobe single-step fault path.
> - Per-counter STOP handling in SSE error paths.
> - Ordinary IRQ CPU-PM notifier ordering and IRQ cleanup tracking.

Same comment as above, please do this as separate series.
No point in holding all other dependent work endlessly.

>
> In particular, Himanshu identified the missing preservation of
> TASK_TI_A0/A1/A2 across nested exceptions [1]. Following his review,
> I validated the fix with hardware A/B testing: removing it reproduced
> corruption, while the fixed kernel completed the same test sequence.
> This also gives us a solid basis for replacing the temporary GUP
> workaround with nofault uaccess.
>
> Paul, please hold off on taking this version into for-next until
> these fixes are included. The rebase and PMU testing are useful, but
> there are still outstanding correctness issues.
>
> I will consolidate the changes and post v12 against riscv/for-next,
> with an updated changelog and validation results. Let's coordinate
> the next posting to keep everything together.
>
> Thanks,
> Zhanpeng
>
> [1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.co=
m/

Regards,
Anup
