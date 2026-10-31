Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793464292;
	b=rtLcc1Uw1V/a9cadtHOXRDq+fnzl8P4pwfeOGzogomDAY44KuJOt9BygIvn8vZINFouq
	 GFEJdGFmTFFxFfjzH51Luxtz9Dvmg45a0wuFQWQc/r+UR9NJ3nrJwXZd2pkYDdD7Mcguh
	 EH4+0SeFDjXrgZusu8JvFTl0EhuWV4anYjtZtHB5sPaNo/JbbXzTHl2JjBXZadSuW2zEM
	 shAcXlrvLivBHjlgUUxbLkjGJpr1Z3cWhnnCe7RMGcVVRX+pXgXgNOHpVwhY92aK+gkvK
	 OZyOUZfr1p5O9AfP1A54PN4Uw1ZtM4WxV5rZqfR93p3cwcB75cvj2X/sTeveu3u1LVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793464292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SCL+ExvyxTDNNteFin+VBl38Uc6A50cRx/B+LfB0KAg=;
	b=RsnTMvMlf3PD2eeZnZ5oyx8V6NUKIMrYB36U1vNwWZ3bp4griv4Ns2XB9XrcftYpXqwg
	 /+FHqc+rzi9TE35FijHDpX8LhAi7IhrxLhipaaljccX3HsN5dqn21vuGbW2jneyTjnPHZ
	 IFw5W6W1rrhUysKk3GkLLOh/lqFXclLgHswNzmNEfkUr2jcRJGhq1oshZLawtIdeSGvnL
	 4w1zWyimHhSkm97li4TvchlpBzrpiB5pEPIOp5ZwU/IaduvhYjGD97m7qb6ID/8KZ+45X
	 HI5vUbV/aZBsZrP3fzIG7ToLRbFvXJubJL0OggcX1FKNThGjfKacrJqXQdlg37Dwbuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kDQP3B5Z;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D3A606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6D3A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kDQP3B5Z
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so1091147241.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793464291; x=1794069091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SCL+ExvyxTDNNteFin+VBl38Uc6A50cRx/B+LfB0KAg=;
        b=kDQP3B5ZdkHbVHc6cJ2piQiKyFLHblfXj7KSJqwC8YL8J4kky6PeLNg3dynltGF/Zs
         FS4/iKuJZKgS8G0ZLy6KTasm84VTyVVn1p0tZ5yoC91ymmxTSBREnUhJpggntd7zRLZJ
         GQ9XTfoXJQhHy5O1eSFd6/tu5nIVlvZ9UgUJbHxUG+xbFn/6hIuB2m/nfw7R8gsGoMvn
         pF/N9+p1asVVP1vPdUU+osZPvseBPu2Gi41wQOtcZKfEzLyFRroXV5bXdFSUs3dGTYPp
         R0so57YAFz/ULjy9IYIGWuPOlPjpw41WwX9QDuxE2D7wTmK2URUMXmw+/W0hYmq1Chlb
         ms7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464291; x=1794069091;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCL+ExvyxTDNNteFin+VBl38Uc6A50cRx/B+LfB0KAg=;
        b=o5U1FfVonRqnbw5BA80ZvZL9LAELfQzWWwnAJosck/b6xwUbkuknwRhwQ/Uf5y8K6O
         PPvYDm1FrLtCctvMFiNBe+Vy04L0OFNrWzUWQt4HXp994/aANgM6qUYv+mT9LJa+AkoG
         IZ7geGvxcyPDg4g3X38OnDgxIUIxQw+vwqFKmiT1IVO2RZJ/QP1osgOZltlvQOhCwKFt
         dhvLuO7iE0quv//ZybKl2RHhw+1qhfa3YtqGYe8yIDKg69FK+1Us5J40niw/lM5Tj3WK
         OQobfg3lKBqs3XxyWdnZTb68E6MYIW3huONfC17xkyE2/J1zsEc2EP3h3sNfB6qGA8RA
         epQw==
X-Forwarded-Encrypted: i=1; AKwUvBzzwYcgngnLZS/R67TdlwNXwhBTn+pYow4qV2c00S2mHtL9M4Kmgqp61FENrnBRmy1iNi3R97U1AYJdbMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3WSi2ePqyw9eRBWF0N628Jjvjt5H1UJi8zZfma7ttK27lDjJ0
	VAiDiKGFFndQCSI0NJsbLuS5lWpBCqz8kDi1eOmNIRvoNK2MAcV+fAC5
X-Gm-Gg: AYBFou0PK3TWT4c+u4AiL2nBOY8Law1lZClgL97MEs2qe/S+5boIqvp6z5FOZYwXqlA
	H18xOAfqrUTaWqboM/d49zEhxx3cpivm3uMycjimFqwkIo9vjgC4FRknFDAb7MEPRIG3KSu4dmX
	OqoNSS+oohg4FzIwNR6Fuly+Oh18MPCemlZYP6+zAswJ93Ri9J4QG+v8HAJmMvX4y3u+762X1cU
	lMTiBSFmOUayrDuBNkogxHguEOt527auCNlCGnVrDGs3OzRNecmrXLECCsuKYf1WrmVQUYk4q3o
	EZ9nP+XbpkwqauSUUxasuNe3TgdHtwVkWUuA5YNMVQ2ZvngWcjJE7hjz49Zaln8mUZD9qICAm4/
	COMeWrrEXnMem9nB+Ng56IN9uWa77wcOznpThwUg5b0AvbENWxmlva6f868b84990NSO1J70r0I
	XuVQLhNqEgNk/izGbZwoC43GVoONGHl6f561hbzzOGdS3XXuw1jXRhOCobDIQqgVb9S5r+dTuCz
	Z+s89jCpW/qO7Wng3YdNSUCYDmJTkgxU41jK0B1XMKf8/6RnAl46+JiEdnl/vqixc3q3jgRb+3L
	LWhGsuzCJ55Ew2m3R42hHhdyVSuY9KJgFD3T42ITI3W48yYxdk1LPRo46ArG2EDXMz3x4LHEGCb
	xGi0h0X9Hoq6f6JI7q1L8bqd+dc3NA6IV/iaUUzwhxm3Msj6q2OlIypPg5QYknv715irM
X-Received: by 2002:a05:6102:3706:b0:7bb:c382:2ff4 with SMTP id ada2fe7eead31-7d0726ca2femr2413661137.20.1793464290850;
        Sat, 31 Oct 2026 09:31:30 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee41f108sm7037066241.7.2026.10.31.09.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:31:29 -0700 (PDT)
Date: Sat, 31 Oct 2026 12:31:29 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jingxuan Xie <jingxuanxie@deeproute.ai>, 
 netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Message-ID: <willemdebruijn.kernel.54d115047658@gmail.com>
In-Reply-To: <20261030081704.251652-3-jingxuanxie@deeproute.ai>
References: <20261030081704.251652-1-jingxuanxie@deeproute.ai>
 <20261030081704.251652-3-jingxuanxie@deeproute.ai>
Subject: Re: [RFC net v2 2/2] af_packet: retire TPACKET_V3 blocks without
 waiting for copiers
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jingxuan Xie wrote:
> From: jingxuanxie <jingxuanxie@deeproute.ai>
> 
> TPACKET_V3 waits for a ring-wide read lock while holding the receive
> queue lock before retiring a block. On PREEMPT_RT a preempted copier
> can delay another packet path or the retirement timer until it runs
> again. This was investigated after an approximately 355 ms retirement
> wait in a PREEMPT_RT deployment.
> 
> Keep copy accounting in each block's existing private pgv descriptor.
> Seal a full or expired block and advance to the next block without
> waiting. Retain the original descriptor across copying and release its
> copy reference after all packet data and headers have been written.
> Publish sealed blocks in order when an acquire read observes no copies.
> 
> Publication runs under the existing receive queue lock in packet
> allocation and timer paths. Completion does not reacquire that lock.
> No worker or publication budget is needed. When traffic stops, completed
> blocks may remain unpublished until the next timer callback; this does
> not promise a hard capture delivery deadline. Ring exhaustion can still
> drop capture copies.
> 
> Use each retired block's saved last packet and its own cache-flush range,
> and exclude sealed blocks from allocation and fanout space checks. Poll
> uses the publication cursor instead of the producer cursor. Widen the
> producer index to cover the same block count as the publication index.
> Allow an exactly fitting record so a maximum-size first record cannot
> cause an empty block to be reopened instead of advancing publication.
> 
> Reproduction uses a QEMU ARM64 SMP PREEMPT_RT kernel with validation-only
> instrumentation delaying an outgoing copier after frame reservation.
> The instrumentation is excluded from these patches.
> 
> Fixes: 632ca50f2cbd ("af_packet: TPACKET_V3: replace busy-wait loop")
> Assisted-by: LLM
> Signed-off-by: Jingxuan Xie <jingxuanxie@deeproute.ai>
> ---
>  net/packet/af_packet.c | 140 ++++++++++++++++++++---------------------
>  net/packet/internal.h  |   9 ++-
>  2 files changed, 76 insertions(+), 73 deletions(-)

This is still a very large change across many chunks, for a fairly
small well defined problem.

Let's try to a find a smaller solution to this problem.

For instance, switch to a non-blocking write_trylock for block
retirement. If it fails, it will retry in 8ms.

Or, if spillover to the next block is really needed (explain why),
at least simplify. Do not allow running N blocks ahead.

There are also bugs introduced in this patch, which is to be expected
given its complexity. Instead of focusing on those, let's try to move
to a much simpler fix.
