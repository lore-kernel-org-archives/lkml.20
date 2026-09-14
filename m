Received: from mail-ed2-f0.google.com (mail-ed2-f0.google.com [74.125.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1E7351C13
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789409837; cv=none; b=XA9aATZmAttvB/DuVLtBOHeDYW5qp/XKKhrYyPork7P+o3fW939STDyq2dafskaqJLVw1oDJYYXk49YvadVdl4Pb+XC5oCf3a+ztrPLYTnBdGNo5NvIuNvLx3qV7+xerkNbnAZpWlAD1yjV7rHduHUYHtYhpGLi29eDHOXAbxbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789409837; c=relaxed/simple;
	bh=Z6tnLZmfbZY9KJukSWtadBsrV3bxYzT97i5mms5gBBU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hho4vdf+lb5lk7/5ezeE56n6L5ky0d3wJW2SOxMvoN3t+WU3mO4AAgs6pY6kUcdyBFCnajS/0R6Ysmrh3dE+EUkhUSQP4XNHNMqV+osFzCiNzTuFICU3D8a58Qr4Q/wUpTVuM5pFYLfoM1w1t2W1lmMwAigTFc6Ifx/em8XCp5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljEN20HE; arc=none smtp.client-ip=74.125.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljEN20HE"
Received: by mail-ed2-f0.google.com with SMTP id 4fb4d7f45d1cf-6a8a84cf27eso2297409a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789409831; x=1790014631; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MhwZKQH3naP48pBWrsTvWrJs+Fp5fgGMTIobqvnavu8=;
        b=ljEN20HElxd9H8T1EKn4LuHkQus18lX3szBzvlm9slxRPtKIOPJ6rNRFfKffuaxnyU
         ybyDiR/1RIl6QqA1UbElBeVpnOLpYOwuH9yrBPJW6XbA/VUw8sa3ewplFAAqkZ0hLOpj
         eQpJPwQk2mikEFr5Oczfyd+l0sRywPHnFKqnN+4RjTiE48ARLt5oGtr/gkMdsfMVRfAg
         Q3FWQ0M9uSBaYcNUIV0xzMfJzECrpVQNz3ZrTtzDCcQnuWD63zeiXmrGAycM+9+QFVrv
         iPyXrlURabFvZxNgzVxQLMKF623pvmIaAsMZxbaobJlqKYikJfdKbiKTr0hfMSXBAa+m
         UlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789409831; x=1790014631;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MhwZKQH3naP48pBWrsTvWrJs+Fp5fgGMTIobqvnavu8=;
        b=d1VIFbuR9vWRBf6Zg7JcBktZUsc6AVOdQHGi9BwhE1+5Q3w/XQtRJkFr2l/LfFb282
         dr50wcuGRwtZb6kH/lDQUA8D2DwkKfk/XMb5ar/1VItwRlR7SGw83gRqKdVepX0UXvVc
         GICJYzaeOdCJiG8lfZuuu9diGsA7LrTemk5+SIN+8YV272/02lausPThqyqTSSP6hQVj
         H6DrekFwuxGUzPsql2XaBGa+yg1EcQQjVeOy7R64kDf6CGcT3S0EwjBcfjM23tfDbOxH
         x/UNIKMs5mwg4zyWyMZcvcdfIIPSQiwregO1ZDAbXGFAMJor1FMl1D3qz9idulFOAS/x
         l7pw==
X-Forwarded-Encrypted: i=1; AKwUvByE/+MD8YaHlnsAON5zue2sTgHHoXnQ/YtnQ9y6/ODIg5svnV17ZylyaG6yRnvd2caojVGoKJ7BfexkjPA=@vger.kernel.org
X-Gm-Message-State: AFuF++moyNifZZ6XKwp9bzYDU7DLKJeW7Yixe9U2CIa82XYED5b24QxG
	bRvuzsUkOcXh16CsvZ21ZWBRrDdeZNliCG5JIEBRUbkojxk3xOqS7lIe
X-Gm-Gg: AYBFou12EDbWvfe/CckVMo5gigt+UuAbwCa3a2FIxPeYTg95r9o7meRu/dPusQB7RZD
	VXyBDbiv0k4G7SjqK4DWS4tDV4RAslWqLPo1m0DTkIlvliv/QQ2t/uZOvw/dHbXnlxopWULJo+W
	g43fAeQDi51o38CnzlGSuMpFmhDuiH8/qrk2OMW1v3BZcxaBVZFo00NqqSk/xiTkBIgBfVgiKsh
	bidrdLrnZemZJ++fX4V/CTUBUnC6qPCWjtEs5NNQEoWiUvwptprTJwIWaZhak1g1IcvJBio+Igp
	ZNRkhV/YxKolbZXNaizKDBf4YKF9vjPM51vnW68GHX+cHmJXumcyIiwLMJ9jFulyt0Z/Y7QFgEe
	/mBAXAw/YXP74asSVRMor69CfdOcUiw0vi6t4QvzuBpa7LgFQ80LB/Jaxs0xsCPQBTmBDRtmYFU
	T2ruKL/nM016/vCRb/13BbJnOr0ZvSAGWGWOtjylFkrRZjBKUS3oWL5yKSQiUAHIjUAqPWsodcI
	higiNG3zvgP5ub2FkZHI9iTLhMIHi77Zwvcitjs8tCRtKehks77Hs2ArhAtz8vywLztOwX/leyh
	BzeueMx00xYpsuRb+3ZkxxXVrw1Od8Wkhfe6HA==
X-Received: by 2002:a05:6402:4149:b0:6a6:c4b:c92f with SMTP id 4fb4d7f45d1cf-6a9f6227feamr2295917a12.9.1789409830894;
        Mon, 14 Sep 2026 11:17:10 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9ba8f3ab9sm4370429a12.15.2026.09.14.11.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 11:17:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 20:17:09 +0200
Message-Id: <DLF8UFBL6NEL.MAD9F5418DIG@gmail.com>
Cc: "Hui Zhu" <zhuhui@kylinos.cn>
Subject: Re: [PATCH bpf-next v10 1/2] mm/bpf: Add bpf_proactive_reclaim
 kfunc
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Hui Zhu" <hui.zhu@linux.dev>, "Roman Gushchin"
 <roman.gushchin@linux.dev>, "JP Kobryn" <inwardvessel@gmail.com>, "Shakeel
 Butt" <shakeel.butt@linux.dev>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah
 Khan" <shuah@kernel.org>, "Barry Song" <baohua@kernel.org>, "Geliang Tang"
 <geliang@kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <cover.1789091855.git.zhuhui@kylinos.cn>
 <e00910f328c129fea716e9fd031dada328e60313.1789091855.git.zhuhui@kylinos.cn>
In-Reply-To: <e00910f328c129fea716e9fd031dada328e60313.1789091855.git.zhuhui@kylinos.cn>

On Fri Sep 11, 2026 at 4:20 AM CEST, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> BPF programs can observe memory pressure on a cgroup (e.g. refault
> stats via bpf_mem_cgroup_page_state()), but cannot act on it:
> triggering reclaim on a chosen cgroup requires writing to
> memory.reclaim, which BPF cannot do. Add bpf_proactive_reclaim(),
> a sleepable kfunc which performs one proactive reclaim pass on a
> given memory cgroup, similar to a write to memory.reclaim but
> without retrying until the target is reached, so that when and how
> hard to reclaim is BPF policy rather than hard-coded thresholds.
>
> Since some bpf program types may be invoked while holding fs locks,
> limit the kfunc to BPF_PROG_TYPE_SYSCALL only, to avoid deadlocking
> in filesystem shrinkers on the reclaim path. A SYSCALL program can
> invoke the kfunc directly, or asynchronously from its bpf_wq or
> task_work callbacks, which run in process context and keep the
> SYSCALL program type.
>
> The reclaim target of a single call is capped at MEMCG_CHARGE_BATCH,
> following the precedent of high_work_func(), the memory.high
> workqueue fallback. Note that only the reclaim target is capped: the
> actual scanning work and its duration are not bounded. Reclaiming more
> than one batch is left to the BPF program rather than enforced by the
> kfunc: with one call per bpf_wq callback and the same work item
> requeued for the next batch, the program can also stop submitting
> batches in between, e.g. once the target cgroup is dying.
>
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> ---
>  mm/bpf_memcontrol.c | 88 ++++++++++++++++++++++++++++++++++++++++++++-
>  mm/internal.h       | 10 +++---
>  2 files changed, 93 insertions(+), 5 deletions(-)
>
> diff --git a/mm/bpf_memcontrol.c b/mm/bpf_memcontrol.c
> index 716df49d7647..d8827bc388ef 100644
> --- a/mm/bpf_memcontrol.c
> +++ b/mm/bpf_memcontrol.c
> @@ -8,6 +8,8 @@
>  #include <linux/memcontrol.h>
>  #include <linux/bpf.h>
>
> +#include "internal.h"
> +
>  __bpf_kfunc_start_defs();
>
>  /**
> @@ -159,6 +161,74 @@ __bpf_kfunc void bpf_mem_cgroup_flush_stats(struct m=
em_cgroup *memcg)
>  	mem_cgroup_flush_stats(memcg);
>  }
>
> +/**
> + * bpf_proactive_reclaim - proactively reclaim memory from a memory
> + *                         cgroup
> + * @memcg: the target memory cgroup to reclaim from
> + * @size:  the amount of memory to reclaim, in bytes, clamped to
> + *         MEMCG_CHARGE_BATCH (64 pages)
> + * @swappiness: the reclaim swappiness, in the range
> + *         [MIN_SWAPPINESS, SWAPPINESS_ANON_ONLY], where
> + *         SWAPPINESS_ANON_ONLY means anon-only reclaim, or -1 to use
> + *         the memcg's own swappiness
> + *
> + * Trigger one proactive reclaim pass on @memcg, similar to a write to
> + * memory.reclaim, but without retrying until @size is reached.
> + *
> + * Only the reclaim target is capped: @size is clamped to
> + * MEMCG_CHARGE_BATCH, following the precedent of high_work_func(),
> + * the memory.high workqueue fallback, which bounds each reclaim
> + * request the same way. The actual scanning work and its duration
> + * are not bounded. To reclaim more, call this kfunc repeatedly
> + * instead of passing a larger @size.
> + *
> + * The kfunc can be called directly from a BPF_PROG_TYPE_SYSCALL
> + * program, synchronously in the context of the thread running the
> + * program, or from the bpf_wq and task_work callbacks of a SYSCALL
> + * program, which run in process context and keep the SYSCALL program
> + * type. It is registered for BPF_PROG_TYPE_SYSCALL only, because
> + * generic sleepable programs may run with filesystem locks held or
> + * in NOFS/NOIO contexts, where the reclaim path could deadlock on
> + * those locks via filesystem shrinkers.
> + *
> + * For asynchronous reclaim of more than one batch, driving the
> + * reclaim from a bpf_wq callback is recommended: call this kfunc
> + * once per callback and requeue the same work item for the next
> + * batch, instead of looping inside the callback and monopolizing a
> + * workqueue worker, and give each target memcg its own work item,
> + * as high_work_func() does with one work item per memcg. Whether
> + * to submit the next batch is up to the BPF program, which can stop
> + * at any point, e.g. once the target cgroup is dying.
> + *
> + * Return: The amount of memory reclaimed, in bytes, or 0 if @size is
> + * smaller than a page, or (unsigned long)-1 if @swappiness is out of
> + * range.
> + */
> +__bpf_kfunc unsigned long bpf_proactive_reclaim(struct mem_cgroup *memcg=
,
> +						unsigned long size,
> +						int swappiness)

I'm going to have to request one final change, sorry.

I think long is more meaningful as return value than unsigned long. It's al=
ready
restricted to MEMCG_CHARGE_BATCH. We return error for various arguments, we
should probably change to -EINVAL.

Apart from that it looks ok to me, but please, also wait for Shakeel to rev=
iew
the set before you respin v11.

> [...]
