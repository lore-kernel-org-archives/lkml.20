Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794343378;
	b=G3lXt05+AzxhDjTUgoZaGhxkcK+iLq+R4JOMiLlCDxV5Qtxy9gsWvRokFS7CXMABUSN3
	 0JfqmbNwMq1cmSIkOigOcAqcYHBhznP6nMAohgU70UX5Gk1pmuQ485G6lxxHtEMkKloWq
	 wJ0yQAT4cJbzTNuzaTBhhRtSpkq/AReoa9CjgpMXiA/6G0Qtyvu17GywOunyYhIFjq7EU
	 zzYIJc9BqeKDyKDGr4rslKtJe6++TppCHuCOXeLHSg/Xk4C9xvlJsrKCPC/Mob7AhLhHv
	 3OHO7WBags3gOz9qmJgd3Ii0GGfPwq1tyiw54tcEsUUc69UnCosVQjxRMzS0MXvwcZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=6JIpC5xmZmVh3gHvpm6TlSXy64wN88S92afzeHcQ6Bk=;
	b=aOujnrh/JZvdIEJJLTUBaglDpBH5UwAt++XF9vI3J+6xlsyWZpca5W/Y3A0VMeoOT8EX
	 m4wvvBXn9T4SCqFw8xkno9Yu+MJKfDaiCFxXgGpLxwBeJCnHe4UxV98lj4ICOK8tCe5ti
	 zvhW8Uen1wPYR07JtbBa6SUW+WTMd8KG0icTkSZXYam+p9MdOtZJIqXiEYSQOFfG9kaMF
	 U46cUslqEM+Zz9HUquveiFZgmBtb9t3vwT3j3NhGJHH9IjK5ZimyUYzbbGoAsqae4ytJk
	 fSE4MfhLA+k8gBBf1fTUn9EXWbO/KLTXvXiyROHEHMJ7Fgy8fS/ysaXVslfbu/4gxQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=T7WJ2m7V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDE8606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DDE8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=T7WJ2m7V
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ad47c246f8so288960a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:42:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794343378; cv=none;
        d=google.com; s=arc-20260327;
        b=fNGDwkMYAgWsGPuTq68x+mu8KST2Y6Ah6WKcenX+ga2JFoW+fsuNPcG3+HNNOiIncS
         Ee341gPFd0cItfYYqpxzCz8aBhfWSPoGhDlHeFY0WxrFG0wNQAON9zJS+6l85AsPwD1w
         imaTIX+jzqfkygc1qa2fUJ1e4wp1KR7uBPwhveElm/kHoD4+qirGhih6mkdRP0AOv/8/
         yDggDvuBlp0SITwfikQULuIkwiWDPHpS++9OQpdMWoakdcvUq40mPjlVTy2XBLViPbJm
         IKycmt6hODNkW86CwK8gNp9xkjXqt/UO88J+ZMXnYpXDgZ+IC9x+rLlawxmcEVGiegOA
         hMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6JIpC5xmZmVh3gHvpm6TlSXy64wN88S92afzeHcQ6Bk=;
        fh=xwtksFqn2PmvYJEl/CPPGy8FoYmnzRjj+bHEu8bXoiM=;
        b=GGQnx0LxTf9ahm2SLf5hdNblbSA018n6BqHj8muNWh5GrjE1omcnuyW/Y9xXkICTHB
         DMWCLrKNzNe4ETMT+Z4YW0HVCnXFWhNYcg4ym7p5XYwKJBEOlNbwubSkGLMYm/jtbanP
         VtcLGRb5psKJcumVEMg6EqKpk+0PBQR8/+YV742DbzpLd30DxvrLbdmpPyg3k1QKbk5u
         upl6rTVFYxWk2+C9+WQ57e+AvCFRYNPkT1rl5qZuYcRv1Z6Ki5Q1dKVoy0wm2B2Vx2gF
         FGB/b6BplBKRqDb5z8EgL2NFRp6LdS/GTUMYfSUKd2ye8iwsemwTtm9rNmplcBnIqn7l
         N2hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1794343378; x=1794948178; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JIpC5xmZmVh3gHvpm6TlSXy64wN88S92afzeHcQ6Bk=;
        b=T7WJ2m7VaHaycPzp1L93t6PmpJvwEL9FGoWohbAGj1iYUX1CR6XarTtPYB/bBhk8Um
         LagqSEloR0bYPA2eaZJCwoc5tx9yoBWZ65R5HeA6oQH9apVJjYjqqnSh1ljb5VFU9Gl6
         NbwsSzQiLhhrZuA6CDGs9QDbbaYYfaaFk5ILNynREdHh2ADNMPytwApQIZJ1oVgAnVik
         s0pq9xPj915qRulK8eO1jUOHMmpS42aY2+sbf9lsXghSR0ZkYkdX9jMqIYUUjNCr/jrO
         8YBlLaaB1t3It0i1HS7ZzhcG0MSmxetrUsQ6tvxJ51rOjwYqSAapwF73A+TQBejnGLyi
         f7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343378; x=1794948178;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6JIpC5xmZmVh3gHvpm6TlSXy64wN88S92afzeHcQ6Bk=;
        b=isUDvjbrxEjcQULL4qIM9fr62RhwsjsXAeaxs9WUdLbGyPCBUNuFmvmVzKV/UzauRm
         PUODWWDsz1PJfMCsS5yjjqUxCl1H5zbAsUIqON9QB2sdv+ZOYjU3XP1jO8HfrgsKjHYj
         zZX5MoNvAkgwHPaufYI7sH2mavFjuvf7E+W0TV8ca4MJ4os95VT11QGfU+60Vzjzhm0y
         TwXQ/OYjuKgiudO6aJB3YMQP1WdJHqxweoTb2tkxvadDqYrkquVxd9L/iuaUn+CJrZdL
         QWU9RtWYcNSQ5q3yhvhBjnmgrbO+QvXjEN8e3ENOVZmYNWRrCDBM+8PEJX38dErbaR7Z
         B04w==
X-Forwarded-Encrypted: i=1; AL+hErFT5fOc+5W/m0w+kzJxknBIJU8yqIVEIXaMJ9BNvsfRvZTqDCxSwBtK/l2MCnvOilZUJHazIgPrnmMinR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ixx77UgF3IvfT8Douv8rjoFUixqJ8Yh/FkP/lHBhok0PKMsA0
	CMciFXnpSOjNQRF6pniPbWV7Vo7DQSZGnjY8t4erygpcESecu7W1gBtA4KXPwYtiIvCOkYuyHqs
	X66nmkAmqtF0s4kPC1Q1AxjHpkpByegCQP2dx8C2KZg==
X-Gm-Gg: AYBFou1AsxN+fgJ4CN4jmmkspTZwZM+qgMTRjlphU6Hfv30dd8HvNtQ/R4sr/ym70y6
	CYyGwHXMJO2JnsEBF4pmzpH3d8Rxdx4kUQ1lCMK44lnmnw4SOI2eq0SKeSI6Upj6Lm9kjGwqTm4
	YKJ5NU2Dn6hIbukSmg3oqsCxezZCFT/GKZPpboSVPdEEAmwjk4remYRjqYNvuVDzUUDWEPmvTxW
	fXwT1Elt014O4mUTBVwEENsUzzzzTYxO0tG2vqWPAxWpqaezxesLJ+UuH9ZnoISe50OVPgM9gm9
	5exrJFFhJVr4egqyoH6gfGfVCOEP6mHGamOS14XWel5z+UMbBMzX1mX9P8Gam0uE3oDHySaBnBI
	UDm0vbWPlSfDTSoMXwr1qcsr1rFiwOdmD1H36qe79KMOePslBwRtl4WNs
X-Received: by 2002:a17:90b:540b:b0:3b0:975b:2256 with SMTP id
 98e67ed59e1d1-3b182f9b9d4mr203359a91.4.1794343377444; Tue, 10 Nov 2026
 12:42:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <e3f63654-0f7c-462b-b58d-05f3164fe340@linux.dev>
 <DMM2G9OX9ACV.231CHJEPK0OHU@gmail.com> <CAPnbwjpQBR-KHwOMG2bo1uhdp22ZW_O5sUj3=vjazVu=Rdnb7A@mail.gmail.com>
 <DMN0RC27TJRM.3KUSPS9QTBV4G@gmail.com> <CAPnbwjrX-ywbcgNQSZKE2jiggEOSVCRVw9OLfaksihiVSCoqvw@mail.gmail.com>
 <CAEf4Bza0XDMTxxZeukwRXjvoOOruY49q66xBXnYnuncbeo_Oiw@mail.gmail.com> <95e07cae-85ee-4f14-b5f3-070803ee567e@linux.dev>
In-Reply-To: <95e07cae-85ee-4f14-b5f3-070803ee567e@linux.dev>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Tue, 10 Nov 2026 22:43:02 +0200
X-Gm-Features: AclHuK-KEMNOlfWD0UWl6ryn4dajINfOogjLWWr7jApapLp0YR3rK8ycXvkFphk
Message-ID: <CAPnbwjqw=uxd8UyhEgNjSrpK1DhbB+dex0mGVW=dwuoygqgRHA@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: "JP Kobryn (CrowdStrike)" <jp.kobryn@linux.dev>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	martin.kelly@crowdstrike.com, andrey.grodzovsky@crowdstrike.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 9, 2026 at 4:12 PM JP Kobryn wrote:
> Before moving away from an in-kernel solution, can we consider the
> direction this patch below takes?

I haven't proposed moving away from an in-kernel solution. Your patch
is the same design I proposed earlier in this thread ("This is what I
have in mind for v2") with Andrii's bpf_ctx suggestion folded in, and
it's what I've been putting together for v2 (unless someone comes up
with a better direction), which is nearly ready to
post, so let's avoid duplicating the work.

beyond trampoline progs, v2 also covers raw_tp, tp_btf, syscall
tracepoints, and BPF_PROG_TEST_RUN, and disables the per-CPU private
stack for preemptible tracing progs since two tasks can now run the
same prog concurrently on one CPU.

a couple of notes on your patch:

- Passing prog to bpf_set_run_ctx() churns all callers that don't do
  recursion checks, and doesn't fit bpf_prog_run_array_sleepable(),
  which reuses one bpf_run_ctx across all progs in the array. In v2,
  bpf_set_run_ctx() keeps its signature and initializes prog to NULL,
  and bpf_prog_enter_recur_ctx() sets it after the walk succeeds.
- bpf_io_uring_submit_sqes() calls bpf_set_run_ctx(NULL), so
  dereferencing new_ctx unconditionally will NULL-deref there.
- Cross-task synchronization isn't needed: a task only ever walks its
  own current->bpf_ctx chain (and any IRQ/NMI on top of it runs on the
  same CPU and walks the same chain), so compiler barriers around
  linking and unlinking the frame are sufficient.

I'll Cc you on v2 once I post it (probably by tomorrow evening UTC).
testing and review there would be appreciated.

Mike
