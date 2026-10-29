Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793245238;
	b=r81nbQhO/Jma9ZkgG0mZ0Nb7EzhycCTcvSE2/rKuJytxt2oHf0Y9CR7eZ6p5QmXxw975
	 XquRGcmE7qB3msec6KlCfY9Zd7mWeI1BjaAXyrIGBP0iqmJq69FeXTs+aChYdlMsj+yFQ
	 mc1P0sRdiJYawL5ewpvfhKG4vDdz+ykQb1XoJ029KJBjtj3orHZ/hmGBGie139Rko63NX
	 k7U+rZPPJf1phwQueZPcEIeI9qF6gFEWl/pDXWBpZZCSbIYgTeSKdbIDA7NG/wiPjrurs
	 X7y7Yuvke2AhzXwfC9PFimdAu+3H6AcROZA2Mc/4IFCooyAdx3/3ZKsPD2W2HYs/s8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Original-From:From:User-Agent:Mime-Version:References:
	 In-Reply-To:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=m9kpCROtj4+oMCA1t2d29m32pyjhCLnRU2codU4EShc=;
	b=2Z/36O85HkVWxicH5KaVTIDZFv5fjdFpzklrqiPqw9LDh/0qMqR36woM7zgmhRLrm9JN
	 svywZteBpXVTMl7nAv08BbDKN44DKoUFYR2qRr90f/Za3KO/VVEhpllNFaH/m8243JiJB
	 eHbmnJo5+NlMYXz/U7XyIipPIFhwYxEs+Q4TNylVXRKk1wapOHQPcJDCCQ5u2Hx+U/av9
	 vXtOfuJIbnEI/80vkHbX4tP5hm7eLw6Ex8FHXiaffbxRHPEZ+B6vG2nUCC7BDiwHKwfud
	 U2lDTWDw2DNr7LCnclTQCHYSTLjeUVRC4JP8Et8j56fuAWA5RZlTyOOD57pWcLuIdfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="kyEj/xtI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96179606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96179606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=kyEj/xtI
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be4fea434bso264201e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793245236; cv=none;
        d=google.com; s=arc-20260327;
        b=erhg3s67SdsD+wbX7n1j7UaU3lraFmme+SmHQs/hIaZUwM9uXIDdi0ELh11tcPuy0T
         KXkE7m+MeehrHQUOLzN8KFEMB9pQ/KOLhbf/O0fh+7//shKbRxQUtkGWdh6HZZnALNiF
         VwzEgyWpHEtIPjRPEEQz0o924YCk9uidxvQorJQpdBhwR8iRg+jgmMYdjWO7NZn6l+ee
         ejkXZMjyE4gFuyOMaA16e0OrOiNsWUOCQ1ZgdVTGEedk/ABdbMxQ6W9vCA/v3ZO9EHuC
         yomu3RfCaRZVG7D6cxXlxWXyHMMKSw8cfRw3pxuBiz2X62a2ELY+LQE3uT9KyunxOsFw
         /9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:user-agent:from:dkim-signature;
        bh=m9kpCROtj4+oMCA1t2d29m32pyjhCLnRU2codU4EShc=;
        fh=ul6IBCo26/niPwSvZ91J25BGFH4qSjOEUoAd5ORv1ZU=;
        b=l0q6808OJn/sdSYRw+nxLYTHkBmlt82xfgEDteBRj/L9g9V99ijSWz2ZoHl182mrDt
         lKegRNvnjGqyU/hONlwabRdHPvj3T8y8ZtA5gRQR314450GzenJd+xGTk1/uQSbD3MTI
         jLlIEJ/B6626Jd+bwa8SBIqC1GEPuOlgMt1OGeYal6Ye2sc2QCXYUpdgXRDiVV+6ZEub
         wAtOWpwvuW6A8/myDmmTbkk6Ew93X6tIXzrtX/u/dvHaxOWpC+2yY5aHd7Lc+2p+IwC7
         iPGWhVAwmNlUaD3ltfoNK5z49ieFbvp0lfj3FS8nMUwbjVd5ndxphCOH1UEWqYyTuq2g
         kwMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793245236; x=1793850036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:references:mime-version:user-agent:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m9kpCROtj4+oMCA1t2d29m32pyjhCLnRU2codU4EShc=;
        b=kyEj/xtIfG1psDrutwEjeBnQE+zyFD2DaTTga09yoiHeGT32/X6hjSuC/PkGQYy4AN
         jxbm+XcIUg9rbPD5CmsU8sKB/161+m5yz53nivZT1jDhRJUVIf3LW5jLFebOjRPE/7d2
         2ek2z4aMTQ/VvXgiLPGKoLZo3iMFnjLV/5nrI/1aadQkVsOd6UnQX8Iq/tpil76gJLC8
         eYKBS+OTM9cmsD+w+h52sPAK3q/JBFg8lnKIw9RC80ow8+xtY0n9XWnPI7srxOFfqG5x
         lxN7/Ixn+7z/vG5AT661jRaOMyMxmm2Pfu8XVebUs0Wkim+Jj4o23KryJnWdfqNV78/R
         RirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245236; x=1793850036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:references:mime-version:user-agent:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m9kpCROtj4+oMCA1t2d29m32pyjhCLnRU2codU4EShc=;
        b=Dx6OP922J6CCUifnXyDiZHbZ9jsXtty9bnfVLXeZvGPahZqa4fD2pnX89HMpF6jcKp
         YOjQwv/v+H/cYbQj7OX4bPlvRUVcd7XA5jdrEZHDRkB/vnQbMiLzHY2prJ6rgzgzIOTi
         qa4zPtMrUw/zFjFN5tm3XJmMe1HwW+GfO/9opew4QsU/jg5hrhHp7l8r9SkIPw2WFf90
         rNQ4jp5I2XBW5g5bkB40l0mXHJthy5eJ/fnQAPy4d00lU4XgajRwbm8Pj7K/PFa7dPSs
         OCJe4rmNF8Qg382NKAWPLjLBSzgxQXxHBH6FhTXO2x5tZFxM7++XZwI7dYmD+H6r2SKD
         rLVA==
X-Forwarded-Encrypted: i=1; AKwUvBwv6f2KICnv+XzG05mI4S+kuQ4voN/XFFk9csrnLsLJOfB+xEo2UZzJethB1dvpNWeu97aUaw3sQF4ncP0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt4cL6rhX2MeN6ipqjbtVpm8q9w3kcHTMc8ltvoHgsyGZP0NmX
	EWOAeC+FJUht/y1v+AWHSZBG8cJF9ym7dMS884MG5liYqNJenP5VIcqt0xDYXxW35ItOujfzN3B
	EtPlf15gqZpvjU1pRGTXIq8iKj2vD6AdUGSMOJ8A8Yw==
X-Gm-Gg: AYBFou03AAIIh0C/s97I6cMpeq/UnpRl9kM9AD0bZWFjhVLKZ80mOI17fGAKE1Z6EhW
	6Dkm4nKBK8BwqRn6d4P+JBwcdxbFt8qkMwgJjpV4Yftvu+YiBI0Z7EeTdMGXxBOdQ0f/MF9BQXD
	hCm9MDh0R6dWjbHPF9oCZmVOhh2PYRzBPIprFC8/sODgkjEWPrTZCp68yIbkwtRkkIvbe0EfV3Z
	Xur89HNYQlX47hI2rjXROUbuNckaBaoa/+WzbAmv+CTGdk1qnb4rXhKlpKdedHrdAzuoYLkfwyU
	fEHZjJz2jOuQExNf/LpHt3FNfR405N+GpVjvgHxCHj3awM5F5wb+i+qd8RQAHqT8IxD7pDAFNO5
	WhD2EPblU+iqjIHbAUmB8P19uD5+YFy7sFjictQ==
X-Received: by 2002:a05:6512:10cd:b0:5bf:b6f6:e81a with SMTP id
 2adb3069b0e04-5bfd11b6e58mr399145e87.19.1793245235608; Wed, 28 Oct 2026
 20:40:35 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 20:40:34 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 20:40:34 -0700
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
 <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com> <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
In-Reply-To: <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
Date: Wed, 28 Oct 2026 20:40:34 -0700
X-Gm-Features: AclHuK8WQ6e-ALzK5a1gaSR322umexfJNu7ra0n_GcOfKrsqQ5w5YBowqgksE4o
Message-ID: <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
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

Hi all,

On 10/29/26 11:17 AM, Anup Patel wrote:
> On Thu, Oct 29, 2026 at 8:36=E2=80=AFAM Zhanpeng Zhang
> <zhangzhanpeng.jasper@bytedance.com> wrote:
>>
>> Hi Anup, Paul, Himanshu,
>>
>> On 10/29/26 12:55 AM, Anup Patel wrote:
>>
>>> [...]
>>>
>>> Changes in v11
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> Rebased on latest for-next branch of linux-riscv tree (commit a5ae1bf65=
cee).
>>> Also, tested PMU driver with both PMU irqs and PMU SSE events.
>>>
>>
>> Thanks for rebasing and testing the series. I was a little surprised
>> to see v11 posted, as I am still working through Himanshu's v10 review
>> and validating the fixes on hardware. It would have been helpful to
>> coordinate before reposting so that those changes could be included.
>>
>> I guess this follows Paul's request to rebase onto riscv/for-next.
>> However, there is one change beyond the rebase that I would like to
>> clarify: why does patch 4 remove the scoped_guard(preempt) sections
>> from the CPU hotplug paths? These were present in v10 RESEND, and
>> the local helpers still retain their preemption-disabled assertions.
>> Is there a reason this protection is no longer needed?
>
> Yes, this is based on discussion with Paul yesterday.
>
> This series is blocking the whole RAS ACPI support.
>
>>
>> The changes discussed on the v10 threads are still outstanding in
>> this posting:
>>
>> - Preserve TASK_TI_A0/A1/A2 across nested exceptions.
>> - Replace the temporary GUP-based perf user-stack copy with nofault
>>     uaccess, following the x86 approach.
>> - Address the per-CPU initialization/preemption concern.
>> - Split the MAINTAINERS updates into a separate patch.
>
> There is always going to be new updates since it will take
> time to harden the SSE implementation. All these changes
> can be done as separate follow-on patches.
>
>>
>> Additional fixes from Sashiko review, the kernel test robot report,
>> and our follow-up debugging are also being consolidated:
>>
>> - NMI-safe entry and lockdep irqflags tracking.
>> - The unused-function warning reported by the kernel test robot.
>> - RV32 vmalloc synchronization before nofault fixup.
>> - Faulting-PC validation in the kprobe single-step fault path.
>> - Per-counter STOP handling in SSE error paths.
>> - Ordinary IRQ CPU-PM notifier ordering and IRQ cleanup tracking.
>
> Same comment as above, please do this as separate series.
> No point in holding all other dependent work endlessly.
>

I agree that we should unblock the dependent work. However, I would
not characterize addressing a known, reproduced issue as holding things
up endlessly.

>>
>> In particular, Himanshu identified the missing preservation of
>> TASK_TI_A0/A1/A2 across nested exceptions [1]. Following his review,
>> I validated the fix with hardware A/B testing: removing it reproduced
>> corruption, while the fixed kernel completed the same test sequence.
>> This also gives us a solid basis for replacing the temporary GUP
>> workaround with nofault uaccess.
>>
>> Paul, please hold off on taking this version into for-next until
>> these fixes are included. The rebase and PMU testing are useful, but
>> there are still outstanding correctness issues.
>>
>> I will consolidate the changes and post v12 against riscv/for-next,
>> with an updated changelog and validation results. Let's coordinate
>> the next posting to keep everything together.
>>
>> Thanks,
>> Zhanpeng
>>
>> [1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.c=
om/
>
> Regards,
> Anup

I'll post a focused v12 before this weekend with the immediate
correctness fixes. Further improvements can follow separately.

Thanks,
Zhanpeng
