Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413863264FD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354104; cv=pass; b=f/RzLxyVP9kGTccB+IrcWbt04QOIIwEjF3ps9Go0xBcT8+qwvCrEeVpQqGdj2AVOPqLFWXbt34P2OEfC8XX0bIkJxDMaqdEXClnmJrOEPsR62bsbfCam3IU37ZBczmIF4MqaEuw1PcDHxffuDdfZ39W5w2NV5TEf1AhcUVGayy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354104; c=relaxed/simple;
	bh=SqtSDl1Q6ZdFKhEVIWTLTCuTe73Pv6yPw/9YrDko77c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhiniUcbvmLMIm7BYbSYYOtWYR50tb2GGihuqS0lQO9z/UtKXvpOfAFjmJjT6CGUh4xgHhWZbknzmnJG0EEq5YKpqAjq7+YPYTf1S+DqsjuLgfxnvph1j+0DG2GtTw2qLLWOscP18Ov3csqrRITcD4BZYMxTeKQMvLzYgMSgR5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsaETlye; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsaETlye"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso28641945ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789354102; cv=none;
        d=google.com; s=arc-20260327;
        b=eKiiWIJafefcpEdquR0JweurOyx3bCRjbTC9jCe0N46r8eBb4y+YwwdVOGPThX8RkW
         Mib9wZxAFBqxEPN5t1iiq+jDvmPmJcalU1831R5D8jFB8sML1RDgxiXEztNbujOPcnI+
         T6rnnC8Lximh376gAvnzpDmvvRd5vL51AHDqWmpv02NvF1KXVgEvRjtsUKCiucwWCNQn
         7uKMjSyELCnMq19/HmRh8+w4RW/f6ahXRr3bVgOSA7iXfGzYug44fEwwVnOOK1kiGz+U
         TRl2TLoWlIV5shXcmHdh9KFYHg/Jk92hDadDbPwfs55l40Hs23QuqO5+0yIieDRV8foW
         uuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mlc3UItL87KlRfxbz8MzgjKczqV8lw7x9c6ySA+GhQc=;
        fh=awYtoKZ5KtOC2mJhFoqzxSaLk09PVBIr4Q5r7fsFqp8=;
        b=ePbCs6lIgdcU0wkJVu/gJGsmjF7nWzup+vQV1NYIUagtSQjW8Qu/Q/K0s5biB50r93
         DKrPym2LZogYfV9CTBbtQlGVCk5ISQ6UP8qhU0K6GAx8K4NkppY3UVAxzhuUiJhvx/uw
         oBAMOESV1nu4SHtUzbAiLAIOtZ46NW+ixUIOT52Lve4ffFOHUzi7wg+r3r6e4zMcLC0n
         rGhalVHAI0tsQeWbzU/x3U+7U5b85LDgTV9L3HedFIx6lh4w5lRluOhQ+CHTntLdPuul
         ZmNx5nO+8WJ8DFhTVT9ayUkRIuAKyiPnb5PlcbQLMiq4/NKpzG8kHneH6PU/vXZ0x62j
         9uUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354102; x=1789958902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mlc3UItL87KlRfxbz8MzgjKczqV8lw7x9c6ySA+GhQc=;
        b=IsaETlyeAOCwMWwJXQAYT1wT1oz6NRILU6SDAfO2WVNRTLKgES0+46WiuKeIg1zRAv
         VO3YnxYIck5/8uVMpMOvXA9TfCVh66/TsA7H/rqS08xHq8gev7yUT0AJCvbe0BEO2L1a
         L4gatPmYOwhTJhczawWUeZdkb+qHmVzy65khk2fzthUpQH1wo8WH+c8jLpZuVwOahq0M
         9PbkceeahPmpH22N+4lQ2HuZC0HWKmpMrpYt9vubz5rjXyi+3IgQiXS5tPdr1TMTUPqa
         5iaDfWKrT3Ip8sbN24XPwSKXmlnlwnwzHjr6pC8xnkQXygO62exnhhorhr/x0x+7TCH7
         tgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354102; x=1789958902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mlc3UItL87KlRfxbz8MzgjKczqV8lw7x9c6ySA+GhQc=;
        b=GsB0uqyQ/4mkzyTmMYiQM5tO41groz3jKhJd3JuaqmCk7I8uAO7JURDp4w6ZHjFlqc
         RCtfY3BUyNoYYZGFAzVnwx9iYQkaPiLqGeZQk4QWpbaUnn7EkvgVn9iTVybzr4G050rg
         PSm62N10/Zt1lQPb0cJI70VEkrHXWA1FYUUlZBJTEHlG6PftSZrTKT2Bvr5E/fqI25mQ
         TMH3zwMm8gV5ytrkVEPAAWPShiYLJcMXBTaWb99JoofPPaQuUHTYJJEQ5XV9lAEQtg7U
         OoCmCHpgdx7bLm3lq9K55Ff+61DqqoI4ph4MA9Dadea1lEqLCJbzSq7X63NbaVZRj5C7
         wF8A==
X-Forwarded-Encrypted: i=1; AKwUvBwsLQCsnk7fQ2vh7FEQ0BLqm6yTU4ZhvkFMvrbI7VWpPHEXHIF/2JTv32IEdncKV5jITRH9B8Euhzc0QCU=@vger.kernel.org
X-Gm-Message-State: AFuF++nQI9l5msFnEa0IfxIhGDWApZT0vkgQRaoKwoXZHzX+44Rj5tC8
	McMe6asnd5oze2EFp0zBHKS84YxGx9ieBt2pUhEpD90ls97QahcYBrkSH8p967j1+yhS7R1TuMR
	n0kLKB8fbW5BWXzjjsmYzCYmatNfe7lE=
X-Gm-Gg: AYBFou1mE/vSF52HCjjvvXNgVBm6PblTLdhzhobYoUDWEgkIQCPiorRDB9PR5ujWckf
	1hjfmx1gYuErA+h+Bz0YhAGeZr43AKKMI4qaXq+nd9saRIMMinAG+xwhFEdNe5v+Oa4o1+Ktams
	pplmKxvodbYdlUGgEwWbwk51eFS5U170W5K5SQKixM0/TjHlVidMf2wlFTfA9odFJd5ie5jOgcL
	PjEryOy6969TlFP+ilKu2U0rqHgVfqPxSg+GdgKtteAh+xS7jwreGGbni4PaC7dhGN+uNGNneBc
	YtlzR3721GnHPkNenGuOsF2Zj0k/dA+MOhKRtmrIpF5yFvLaRMZ3gxFvCJrA42KDgWV/W6bc1+G
	Y1e0OaxqRueC5G9H/v1Vx32zCx42sFDH1PVoInktiDevebBTbpZM=
X-Received: by 2002:a17:902:c409:b0:2c9:c952:6e9 with SMTP id
 d9443c01a7336-2dd6c5cc85amr14257695ad.2.1789354102405; Sun, 13 Sep 2026
 19:48:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905021139.4116529-1-pulehui@huaweicloud.com>
In-Reply-To: <20260905021139.4116529-1-pulehui@huaweicloud.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 13 Sep 2026 19:48:10 -0700
X-Gm-Features: AcwNN1WjLSzLcE_mJR0fp_rRBPZY3Y5mnlPKwAnUf9D8Yr6gIiQ87XIB69PE64Q
Message-ID: <CAADnVQJcF3=w4BXjWXuQ6Q7oYMVFDUy_iRaLygkORcc=_+FM0w@mail.gmail.com>
Subject: Re: [PATCH bpf v4] bpf: Fix UAF due to concurrent consumption of
 ttrace lists in alloc_bulk
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Hou Tao <houtao@huaweicloud.com>, 
	Leon Hwang <leon.hwang@linux.dev>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Yonghong Song <yonghong.song@linux.dev>, Song Liu <song@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Pu Lehui <pulehui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 7:06=E2=80=AFPM Pu Lehui <pulehui@huaweicloud.com> w=
rote:
>
> From: Pu Lehui <pulehui@huawei.com>
>
> Syzkaller repeatedly triggered UAF splats related to nodes in
> waiting_for_gp_ttrace within the bpf memalloc:
>
> BUG: KASAN: slab-use-after-free in llist_del_first+0x85/0x110 lib/llist.c=
:61
> Read of size 8 at addr ffff8881572cd080 by task syz.4.470/5112
>  ...
>  llist_del_first+0x85/0x110 lib/llist.c:61
>  alloc_bulk+0x193/0x460 kernel/bpf/memalloc.c:229
>  bpf_mem_refill+0x386/0x560 kernel/bpf/memalloc.c:436
>
> Freed by task 14:
>  ...
>  __free_rcu kernel/bpf/memalloc.c:281 [inline]
>  __free_rcu_tasks_trace+0x48/0xd0 kernel/bpf/memalloc.c:291
>  rcu_tasks_invoke_cbs+0x1ec/0x3e0 kernel/rcu/tasks.h:571
>  rcu_tasks_one_gp+0x13d/0x220 kernel/rcu/tasks.h:621
>  rcu_tasks_kthread+0xf3/0x120 kernel/rcu/tasks.h:651
>
> The reason is that the UAF occurs after the RCU Tasks Trace GP expires:
> when the __free_rcu() callback runs, there is no synchronization
> protecting llist_del_all() against concurrent alloc_bulk() operating on
> waiting_for_gp_ttrace, leading to the race condition below:
>
> CPU0                                           CPU1
>                                                __free_rcu (RCU Tasks Trac=
e callback)
> alloc_bulk
>   llist_del_first(&c->waiting_for_gp_ttrace)
>     entry =3D smp_load_acquire(&head->first);
>     do {
>       if (entry =3D=3D NULL)
>         return NULL;
>                                                free_all(llist_del_all(&c-=
>waiting_for_gp_ttrace))

Thank you both for the fix!
Took me some time to page-in all this tricky logic.

Applied.
