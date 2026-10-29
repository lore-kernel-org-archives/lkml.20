Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793243207;
	b=y++epnt7dWEpmXLu3ZjZDmc34e04AS6Qa5iDRoySXKxXQ3St/8LEEcOQcmM0bzn78XCu
	 IMeEjiVLhS/RL6+boHbitpzHLnxV/IJ8cT5iBAO1kmaRIYY/KS0qaw7V3LmQWy7MFePfg
	 X8PNS00bxqEPoTeus6VnzcrwG3KWmkWAFghce3MnTLy9lhLSTAMvgyrVhKo6oKOnkge9X
	 9YVy2fw2C6Oyx9z4x3a3iAX+O3ilIQzzscMH5YO8Ehfpn+bSqPQDyq64q3y+/jz8ek0Ol
	 Z83Fibj6CIMxRT8KbW8vxL1zmDLqguTQhd4vqip1Y/ZPPlS/lnIN/1U7JC/WH+hxWVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:User-Agent:X-Original-From:References:From:Mime-Version:
	 In-Reply-To:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=21fFFSCtjvZ+BnQkCcGT5s2MmdQCNwbulDZga2Yp1YU=;
	b=iBIDiSbOTyyjlvOU8D50yHZxt55Omydx0PAt/6u1eYAP9D57aXdJ54LSCJQPbPpWmR76
	 K6S+jfXLNMSbDr3kbL2sbvm+Qo9dmO0hRJK/IszYUPYNNMLK4/Pt0MobZCUdw3bSQjhtX
	 zj5CBx89dsLSYaYt9jsAPLO9aFFBCjhj6APZhMlMlspbr/X32pCb3NKtq/VtGhLXC8mhD
	 VR2QYRqId3443aK6sw40etSwwgO/CyI/S2bJI26QLUmh7fh76KwYWe45N5+RTT6cgfaxp
	 SuFWJCcWLwX/y90MawoPHmToN490szBQOpfsG3bQwltayPVyKFqH2KCvIK4NGTZVMDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=h6ziHXdx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D8D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16D8D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=h6ziHXdx
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so1675259e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793243205; cv=none;
        d=google.com; s=arc-20260327;
        b=pYyctCfpHHmrlpm9gQcW5S/pm2lPdm0c4cOzkMG64Iktlj58zpZGXUULv51xLJ61fI
         3jZUSQoKRzVQdHrhREU6OTa0UuuJfwLLWf0Z3qUXv/CsWkx1HMcACia+GXmNsPTiGpnJ
         GYJRB3rl23w1posg/GS32/D/xCiRDp7SA6AJ72setG/WDtOlY41aPmXOxbT74BIE6EUP
         paynitKvr7o+ASHwU5YsJwpcGsrBQ0ZfDGdt5BROeogQE3hh5MXCrjBkJ9IggaNrPbp0
         5Kg7W5K4fBL5wIBvXODtvVhd6NFLql/IMqIJR74c+inh6M2ZyhtDeLjGSwga0zPkcxtH
         nSlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:from
         :references:user-agent:dkim-signature;
        bh=21fFFSCtjvZ+BnQkCcGT5s2MmdQCNwbulDZga2Yp1YU=;
        fh=xXnjb7Mx+bfSa+Pbcd842aneRohsoI+6WS/4L5KFGoI=;
        b=krYICRBni5xrNNLAXbQWNyydXesKAICz9JmLBY4GNi4cxhM6o7ht/bDu+GLdCP3TjM
         ty3+R52KEpIki5Q5RwjIqD7pg4I6GtX4brrUTO0ll+bKiZvKk2nQNR9Rp2iEr8R2Iea7
         nOKvLnftMC27JKI43AFfr3TUvM9tVKBhU0VTjDG1tBCqi5bxAsoJbeqbKSsNc4P9aqkI
         JnJ3JLbA6hxvTDKDOovQlClmx55ydd7/Ntg6K1tK6/7C7uieaFIISLklw4S5yslIwa71
         DqBr2Fna+pHkjxiLCyk2jUys4qaEXAMlS4/s8MZhtZvu8YUB/rT3nb0SDhTuA8KiJMfe
         Je5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793243205; x=1793848005; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :from:references:user-agent:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=21fFFSCtjvZ+BnQkCcGT5s2MmdQCNwbulDZga2Yp1YU=;
        b=h6ziHXdxperKw0FMhtwDYC/nSyqfN66VH9iz1mtw8jkUEvdOawkjO1VfElLR2jSpP+
         jqqjO8GakTohp8gam+tBwY1/eCqNz745YmdHtDmysTJhQXVQk1KHkqHBuCjAG80VMoKr
         UsPvcHWdqdCDP6IdasdeBSbB9R/wSwCgEerazu4r+/iYkH4qZfT3rDsaZKzZ4RWfMayf
         CQDQBq60IHafmR+XVjCAYc9Aa0nv2+nvmQ2rc7Vfblp0ZCQcn3mnB361DJv5d9I8chlY
         w+bLmgtYklxeK9Yg/5NDZrStW1Ky6qVVfdEvSOpUq9D9p/9XftRnMGkcVdvm01gl2an0
         OvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793243205; x=1793848005;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :from:references:user-agent:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=21fFFSCtjvZ+BnQkCcGT5s2MmdQCNwbulDZga2Yp1YU=;
        b=YOqibBsr7Ibdp6o2cHrnHqTprnwsXZLegIibMAylLvtXMGTC+2TubxQ1GE8Oxjb+0A
         CNPMOksF1cbJrRvkQUtVnZ/RH7DifMF1p6I/YQJK1EbaR7ZgXK10R+VdkxqEInD2reRG
         y4G4urA5F/5Pq59JCdPbLTEy/g50MvdQsHfVKiNjMKX7CU1lhaKnrHk6ULr586d3t5YU
         2MkNqhyI7502M1oC6BMEqGzsWYE8aqrT/blntuW6vz9aNY4P/P+KwZ1wJoUyIaomnGI9
         wgOHK8dMBM2qj3j0Xawfuc1MDDasa/ML6zII8dBer7IlTkJCMQXwDqw3OEoN/sLLVhEU
         Q2Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzytpHdezaJXTTAxli7PepnFnF1Zuz0GiNU6VS1v28n1tiNJz9dqx/dD0pfryfTbmW3JDX5X8k6Rn2mzaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5LIEhpFzODC6GXm5FL3gWAvvHqjxLJ9nqwbPSNe3YY8FzyudY
	lT25jjs78KPzGYscpMrdp9NKqqE5wwApuxXRUA9D1n4X/tZUe/BeAsy1Q+bGHzWL6moZ/jAdxCm
	Hu/XdaVSpKRiJaaAqdxMT4MkTUzzP00KlKDVvfY9jCw==
X-Gm-Gg: AYBFou21I//CbUDqrFhF9+WzJyKwsQlHJFUDuszrab+UHkMQEHSnGwiaPyRQg0yBbMi
	yipYuIql7Y+93n0wSNKdLjjyVBNVikW9F6j/0Zwc3HGGaam5s+8cuwJWMFiQosiL+IZu4dCOSoZ
	59FoMjNVr/aR84SGU94QNJSniB2xdpitxWBZY+IWrc67BzE5UCC7mPIlBVJVY295SSFiruK7P7A
	/Kg2tybhtby4uJsgMvVNzICbrvmWYudCueZw7OVyJ8AKq1u5iBkO3o18taA/n+LYsmkAEqM6208
	3wNc4MUK74dbYPu+/CR+83l/zPn5UpJDrw/u/Ba/zK2djL242EU/DG6y9BkJu156Oj6AznRAM3H
	/tbwM+Oht0ySd/sv3EDwmu/Bg8dUs0eQBr8YS5w==
X-Received: by 2002:a05:6512:1250:b0:5b8:997b:c606 with SMTP id
 2adb3069b0e04-5bfcad9e1a6mr1490725e87.41.1793243205235; Wed, 28 Oct 2026
 20:06:45 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 22:06:44 -0500
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 22:06:44 -0500
User-Agent: Mozilla Thunderbird
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 22:06:44 -0500
X-Gm-Features: AclHuK_OONCiZpFhomM73vca1DSs-MUlsV-8C6gmVeQhDkNqE4BPqIm0xCP39ic
Message-ID: <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Anup Patel <anup.patel@oss.qualcomm.com>, Paul Walmsley <pjw@kernel.org>, 
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Yunhui Cui <cuiyunhui@bytedance.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atish.patra@linux.dev>, 
	Yuanzhu <yuanzhu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"

Hi Anup, Paul, Himanshu,

On 10/29/26 12:55 AM, Anup Patel wrote:

> [...]
>
> Changes in v11
> ==============
>
> Rebased on latest for-next branch of linux-riscv tree (commit a5ae1bf65cee).
> Also, tested PMU driver with both PMU irqs and PMU SSE events.
>

Thanks for rebasing and testing the series. I was a little surprised
to see v11 posted, as I am still working through Himanshu's v10 review
and validating the fixes on hardware. It would have been helpful to
coordinate before reposting so that those changes could be included.

I guess this follows Paul's request to rebase onto riscv/for-next.
However, there is one change beyond the rebase that I would like to
clarify: why does patch 4 remove the scoped_guard(preempt) sections
from the CPU hotplug paths? These were present in v10 RESEND, and
the local helpers still retain their preemption-disabled assertions.
Is there a reason this protection is no longer needed?

The changes discussed on the v10 threads are still outstanding in
this posting:

- Preserve TASK_TI_A0/A1/A2 across nested exceptions.
- Replace the temporary GUP-based perf user-stack copy with nofault
   uaccess, following the x86 approach.
- Address the per-CPU initialization/preemption concern.
- Split the MAINTAINERS updates into a separate patch.

Additional fixes from Sashiko review, the kernel test robot report,
and our follow-up debugging are also being consolidated:

- NMI-safe entry and lockdep irqflags tracking.
- The unused-function warning reported by the kernel test robot.
- RV32 vmalloc synchronization before nofault fixup.
- Faulting-PC validation in the kprobe single-step fault path.
- Per-counter STOP handling in SSE error paths.
- Ordinary IRQ CPU-PM notifier ordering and IRQ cleanup tracking.

In particular, Himanshu identified the missing preservation of
TASK_TI_A0/A1/A2 across nested exceptions [1]. Following his review,
I validated the fix with hardware A/B testing: removing it reproduced
corruption, while the fixed kernel completed the same test sequence.
This also gives us a solid basis for replacing the temporary GUP
workaround with nofault uaccess.

Paul, please hold off on taking this version into for-next until
these fixes are included. The rebase and PMU testing are useful, but
there are still outstanding correctness issues.

I will consolidate the changes and post v12 against riscv/for-next,
with an updated changelog and validation results. Let's coordinate
the next posting to keep everything together.

Thanks,
Zhanpeng

[1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/
