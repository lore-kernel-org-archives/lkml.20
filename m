Received: from mail-oo2-f4.google.com (mail-oo2-f4.google.com [74.125.231.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2196C33C502
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788311615; cv=none; b=H6RL+PwS2ZYwIdyaB0UKxuJvkj8tC8XuPMsQkk1jf6nQCa0bkN7e4XEbG37ycKSUO2/M/ZObEo0hyvTHcUYE58kqCuunonk4i8sd3oLlck754wTEKgJmTLSrtcokRhtwXOz+2vDBaWodfzQky7AKvyeg0X7dQT6F6UHGxUMOFXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788311615; c=relaxed/simple;
	bh=mthsAuvC5kxwl9HoC2silixWp9Aei1Pp/kO4Vu2EIZk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hvW/gOM11SvfXdnydyuQPnSzXL4kpv06aWDPjQVgnrhHQhZdn+1IaS3SiXKNPH6VQdR4my9BD0M/eS0zrhRPZDvC52OrnsMR+p+Bk5w0QNA85o2QgbsBcVr+U1TL08/RPMmYgUA6dWHKq3+60x7qM/wo4WFI+7Q6+w9mYr3OLSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHvh+gyz; arc=none smtp.client-ip=74.125.231.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHvh+gyz"
Received: by mail-oo2-f4.google.com with SMTP id 46e09a7af769-7f4e9ec63a7so85493a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788311609; x=1788916409; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mqO5MLc175YVYlL4+Bawb4s5pN8s4dKpvKfmlQW7U1I=;
        b=FHvh+gyzwbb4MZVbfK/4AUjtIi3Az9Sp9fYyuWAJN0exymtGB8Y7OabApqI8WHpjdA
         SnTR3GlH4z96oxHr6b1T1qyEL2jzflqehvWnIzF7bMH8VTxVOyVDX8U4KqOu6m3lt4Mr
         Erfva5aWYlbrPw8hufbde4SwSSvQwTMV2+yGnrAsw0C21Nqt3RPDHaioQ7ubQUWlITS/
         wA4O7dX1g9ntSP2sFkLCYc1hbNn/C13LyZjdP8MPlDMX2/Mo7DuFGSRS8nFWwOqir8x7
         7XbtL/emtjWHluNGVSAHLcjuh0E+iE00OcXyvV54q6DIxVEuboFvhmIZWwNzde6V8NFT
         tAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788311609; x=1788916409;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqO5MLc175YVYlL4+Bawb4s5pN8s4dKpvKfmlQW7U1I=;
        b=oaEy48Y1iWMlSY4OVuB+m+117f3qZFY7k0jTsJscZRnq2yoAE++JlKypezmNNVSJ1C
         nlPpvnLxhrA/zuLfb9z7ZccyUPoV5ouWtDElcA4dTdbCWi6wvg9nDKXvmyLPPPeK957C
         MpKeeuutjfQbUo5Ta4a3gFdLWsb9yLoXJLGWpgWfnc2E+0/Xs7W9k3jspvmnSFh2fKQQ
         QCLJBpwytkISthaZM566FqxSJYITLcWnkjH9hDl+ltucVyZjTEKXK934PNrlFP1RfI5B
         aBORlwe1X+BNu1tWkk+nYFnO4iKR947FSa223PqSYL5ft3vH/3+xWfAsCq9J23CggS8H
         QsJg==
X-Forwarded-Encrypted: i=1; AHgh+RoN4qjvRVGTnJacX+5Psq8OHvT/+g5Fknc5JKKcrHcn9ToNGSrA2U307I0L7ZqqS+pEgWbYKjxk1i9RwtU=@vger.kernel.org
X-Gm-Message-State: AFuF++leV2y1vghQcVENgDM3WSdBmTtsJ17xE/qrIzqKaeDF1YqwBc/R
	itDyZwLu6XL2/uagKq5EYIQmjeJFfekH3C4PBdCb9Ezi3ZIct04lskLe
X-Gm-Gg: AR+sD12fUaX+lgR0xd0GMRmrpFSSOgC1sRWEjCWmPCzlJKQ2rUcUBDsWdO/R1mRKFDm
	MuLaOin35gtz61d7texIDr2DAH/i4H1MsidsZKVuRStweWn8+9XteSNxSd0165apwduhXvZRCZK
	lobBeZ6PZus2a4Ih3YlOAyUVfmkqL9/GmQJGp3pm0SZEJbvcLflvCNr1Ogh9sWzFdKJuJ0NyvKg
	KSo+ntc6mELDn7zpV61kM2daPpnu/zBNKgpNhnsU1s9psrIks9J7g3pfdlK7Uu9twhaXmm2g0JD
	5qar1Me19TqksDJuslht9+EItQzlRlA2iTRK97ePj6TTtV7uKtPgAmI/lvoaqXFhrG1cdWJxLax
	nMOSBruzfCihzrKW1L4kLPZwr82F4a0cMGztbGb7IRcxcXG2JQIC847derwI4H9QYUyHRxIZJsA
	rNSXJ3sFD/COnugkdcbNsFxCZwWUKwDvXQ6eOm2xUP7hKz4uhAxBet/WEt3OJIB8NBtw2s6DhUJ
	hb3kPVkqxvBWNC2GFmG8204CeAhHfvESGcCti2003ugoFLSqUGCSc53vZwCRW1QwttOfktXWiRJ
	sdWSJCg=
X-Received: by 2002:a4a:ec46:0:b0:6b1:4e37:41c0 with SMTP id 006d021491bc7-6b48103a707mr855739eaf.19.1788311608778;
        Tue, 01 Sep 2026 18:13:28 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:40::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f74f9ec644sm1036500a34.24.2026.09.01.18.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 18:13:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 03:13:26 +0200
Message-Id: <DL4FK2P8LMEQ.216J5ZMX9B7VC@gmail.com>
Cc: <loongarch@lists.linux.dev>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf v1 RESEND] bpf: Fix timer_lockup deadlock using
 atomic_fetch_inc()
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>
X-Mailer: aerc 0.22.0
References: <20260902005106.22187-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260902005106.22187-1-yangtiezhu@loongson.cn>

On Wed Sep 2, 2026 at 2:51 AM CEST, Tiezhu Yang wrote:
> When testing the BPF selftest "sudo ./test_progs -t timer_lockup", there
> is a kernel lockup and panic on LoongArch:
>
>   watchdog: BUG: soft lockup - CPU#1 stuck for 8s! [test_progs:39601]
>   Kernel panic - not syncing: softlockup: hung tasks
>   ...
>   Call Trace:
>   ...
>   [<9000000000c40e98>] panic+0x44/0x48
>   [<9000000000e8b000>] watchdog_timer_fn+0x500/0x520
>   [<9000000000dfd9a4>] __hrtimer_run_queues+0xc4/0x530
>   [<9000000000dffe90>] hrtimer_interrupt+0x140/0x320
>   ...
>   [<9000000002ad9e4c>] _raw_spin_unlock_irqrestore+0x8c/0xc0
>   [<9000000000dfe9e0>] hrtimer_try_to_cancel.part.0+0x70/0x350
>   [<9000000000dfed58>] hrtimer_cancel+0x38/0x80
>   [<9000000000f6d944>] bpf_timer_cancel+0x94/0x1e0
>   [<ffff80000200fad0>] bpf_prog_108ab87b32f22e44_timer_cb1+0xb0/0xfc
>   [<9000000000f6b838>] bpf_timer_cb+0x98/0x170
>   [<9000000000dfdaac>] __hrtimer_run_queues+0x1cc/0x530
>   [<9000000000dfde94>] hrtimer_run_softirq+0x84/0xd0
>   ...
>   [<900000000271d9e0>] bpf_test_run+0x1c0/0x5c0
>   [<900000000271f548>] bpf_prog_test_run_skb+0x6e8/0xe20
>   [<9000000000f39940>] __sys_bpf+0x1690/0x2c50
>   [<9000000000f3af28>] sys_bpf+0x28/0x40
>   [<9000000002ac2d68>] do_syscall+0x108/0x5e0
>   [<9000000000c6a850>] handle_syscall+0xd0/0x170
>
> In bpf_timer_cancel() of kernel/bpf/helpers.c, it explicitly notes that
> "Need full barrier after relaxed atomic_inc" to ensure global visibility
> of the cancelling state before performing the lockless dependency checks.
>
> However, on weakly-ordered architectures such as LoongArch, the current
> combination of a relaxed atomic_inc() followed by smp_mb__after_atomic()
> fails to guarantee the physical store-load ordering because the latter
> currently expands to an empty compiler barrier rather than a hardware
> data barrier on LoongArch.
>
> This allows a subsequent read to bypass the prior write due to store-load
> reordering, enabling concurrent CPUs to simultaneously bypass the softwar=
e
> deadlock detection, enter hrtimer_cancel(), and then trigger a severe ABB=
A
> deadlock in the hrtimer core.
>
> Instead of relying on arch-specific macro implementations which may vary
> in strictness, fix this issue directly in the BPF core helper by replacin=
g
> atomic_inc() and smp_mb__after_atomic() with a single atomic_fetch_inc()
> to provide full ordering natively.

This paragraph is completely bogus. LoongArch's smp_mb__after_atomic() had =
a
bug. The specification in LKMM for smp_mb__after_atomic() is that it should=
 be a
full barrier, which can be relaxed if the prior atomic operation already
provides the necessary ordering.

As I already said, there is no point in changing or "optimizing" this atomi=
c
inc. Just let it be. You will see no measurable difference for this functio=
n.

Just accept that it was a bug, and fix the lowering for your arch. Plenty o=
f
other logic in the kernel uses this primitive, so I think you folks were ju=
st
lucky this wasn't hit before by something else.

> [...]
