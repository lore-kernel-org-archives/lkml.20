Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793683809;
	b=uzpgEzRvQjy7DhDc23TUPZOfcu5xFogtXS2pJ3r8LBKDYmvn61mPHkWN1Yh0M0gJ6KRG
	 qFMl3tXmOde+n73AGfmZ+Nbgp7ZnGYG7fGtxblQpf3fLfHlqLsVz6org9KIxIFCpfI+Rb
	 qS0Teggk0W5VRyvqsyj70YdFSOHNFDPydArtpYRHmuc29oqnCwnEaVBgWBsdoKYWO1atk
	 Mhtz83+0PGk4JdSBWd+xUz978HNqAfBqp10m2NfCYtpQozT4/7EluO7OcRwryOgXm4xpu
	 Vlf3LApYGWrCeKA6fO306Kf71ugS2Y9VFlveiYztp37hqg23VDLDaYuccCFCg66VfOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793683809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=UfcfWDapD1eN1wGqKknnJPLrQVp/4XjcdHnVO04qcqw=;
	b=pjmqsNBcJqNi+icGO8tE5IV/BocTsEY++YNndPi1R+M46HZXBnFWNVEYQ/riLWOCr9DS
	 rPgeNpC+fK//1I89A4JXV/WbblGDgqDQBp/+j8cenrzMihf1WSJsJi/ZnET+bMPW8WYre
	 lZd5hr1Gs5DtFrw+Dxh04OeiH9wwKkuqpeXwMJ1MhjAqySvF2uexQGMNxX2pc9ErE/7Z3
	 Y7BQjD8+VoRKG+BNPqRwxc9mQISXxhXjLdoVWqeO7Cmsqsc3sffntLqk39R3qbH1Alnqo
	 v9sWFY4wuHwSg1qknJ8SRtNNr/7ICCNCgTIyxo95+ku7TvuE/AL8E6iBk2dEmGzcoGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NYg9ND0r;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858A1606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 858A1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NYg9ND0r
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a064f294cbso2413133b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 21:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793683809; x=1794288609; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfcfWDapD1eN1wGqKknnJPLrQVp/4XjcdHnVO04qcqw=;
        b=NYg9ND0rl6ZVUxd59X/M8JLqm2JZfoIYNgR1YP5jub2+BFtBLeQ6XsXn365c4VONP2
         H+A7iCzlCy34ecM7sWmkKX4CSlv1q7BWbKmykJVVpdv820G3ICM2QOeyzNOY8+O3CE5e
         DQ+yMogBox/+L3KwUSPWxA+8MN1cRLV4q5o608j9isVxzd50uLOBM7UfTq0Ye+OIuxU3
         KFtw68WwivnN/Wy08dWnqskChfVLU/uQmhuiR04knfq0kNLrYAaMxg6h2pYF7e26XK3e
         Bt1/Fg8TaIWyajMiBondOsiZi9OpQw5aaLWOmDklwFSswSlWUnwHA7brg9sziDRAaLTI
         5Jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683809; x=1794288609;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfcfWDapD1eN1wGqKknnJPLrQVp/4XjcdHnVO04qcqw=;
        b=WBPeZFcssvqYDogBb6UaTO91XOVzyHDzQhX9FEbuuwLpMiFCagQmGv7l9dj5oBzQfE
         YkX/ziuQBUFoIldzZmcFsfpLZtIZAJ34/bKgM7D5HHH36u3IBR/dhyu0g9Iuv1syDNb2
         UdC5elLC2XZCgbPunlUm7zn/OEkYl/cxfgwe3L+U9qN2HkUhgYC/+QdG/TQre8PQ+3wJ
         EO+r1aMv1QahcB7ZMVH5nRHTIgMkUvz8M1YBoPoHB+jscTOURwNMgkTAVIM1XeFd6qXr
         uUPGug/AS7NMImGpUbJBLFN7e7HpSOYvC4M+VzZ79G9EeWV/VRvZPvyPnjAygDqkx7Pe
         nPRg==
X-Forwarded-Encrypted: i=1; AKwUvBz8MweIul25s9mSn8AWcRns/CcQovLeH0UGr4/OnxMa+/hfPnngYi45DV9PZm7vEkIAA/2gWslSKGMAaU0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sTkyHLo/bszZS6GYDOVLv0d1cK2we6gNdTOB+zqwD8Vw6MeG6
	et3FmxYThmWgIeINBDcojztdePPhP6b/mEgORP20Itu1vQ/kpwxsV+MsyQPDmyg7lO+go7+hfvU
	xGjahhA==
X-Received: from pfba5.prod.google.com ([2002:a05:6a00:ac05:b0:899:3459:82f2])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:e85:b0:886:3a6c:a9da
 with SMTP id d2e1a72fcca58-8a9beb6139dmr9360293b3a.26.1793683808642; Mon, 02
 Nov 2026 21:30:08 -0800 (PST)
Date: Tue, 3 Nov 2026 05:30:08 +0000
In-Reply-To: <20261101061331.286404-6-jiayuan.chen@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261101061331.286404-1-jiayuan.chen@linux.dev> <20261101061331.286404-6-jiayuan.chen@linux.dev>
Message-ID: <aulxWKGoq0ed__Rr@google.com>
Subject: Re: [PATCH net v3 5/5] net: restrict message_cost and message_burst
 to non-negative values
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, 
	Joel Granados <joel.granados@kernel.org>, Fernando Fernandez Mancera <fmancera@suse.de>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Thomas Gleixner <tglx@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Maoyi Xie <maoyi.xie@ntu.edu.sg>, Zhan Xusheng <zhanxusheng1024@gmail.com>, 
	Oleg Nesterov <oleg@redhat.com>, Neal Cardwell <ncardwell@google.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Yung Chih Su <yuuchihsu@gmail.com>, 
	Wyatt Feng <bronzed_45_vested@icloud.com>, 
	Hannes Frederic Sowa <hannes@stressinduktion.org>, Flavio Leitner <fbl@redhat.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sun, 01 Nov 2026 14:12:03 +0800, Jiayuan Chen wrote:
> net.core.message_cost and net.core.message_burst feed the interval and
> burst of net_ratelimit_state, but neither rejects negative values:
> message_burst uses plain proc_dointvec, and message_cost uses
> proc_dointvec_jiffies, which happily stores -1 second as -HZ jiffies.
> 
> Since commit a940d145cc38 ("ratelimit: Warn if ->interval or ->burst are
> negative"), ___ratelimit() splats on such values, so the next
> net_ratelimit() caller warns, e.g. a martian source log:
> 
>   Negative interval (-250) or burst (10): Uninitialized ratelimit_state structure?
>   WARNING: lib/ratelimit.c:43 at ___ratelimit+0x56e/0x960, CPU#1: ping/3218
>   RIP: 0010:___ratelimit+0x578/0x960
>   Call Trace:
>    <IRQ>
>    net_ratelimit+0x1c/0x30
>    ip_handle_martian_source+0x1bb/0x340
>    ip_route_input_slow+0x1057/0x3650
>    ip_route_input_noref+0x104/0x260
>    arp_process+0x109b/0x2510
>    arp_rcv+0x381/0x460
>    __netif_receive_skb_one_core+0x173/0x1c0
>    __netif_receive_skb+0x21/0x150
>    process_backlog+0x37e/0x1200
>    __napi_poll.constprop.0+0xa5/0x5e0
>    net_rx_action+0x4c0/0xf70
>    handle_softirqs+0x204/0x9b0
>    __do_softirq+0x10/0x18
>    do_softirq.part.0+0x49/0xd0
>    </IRQ>
> 
> Negative values never meant anything here: 0 already expresses both
> "no limit" (interval) and "suppress everything" (burst).
> 
> Reject them at write time. message_burst can simply use
> proc_dointvec_minmax with extra1 = 0. proc_dointvec_jiffies has no
> minmax variant, so add proc_dointvec_jiffies_minmax(), mirroring
> proc_dointvec_ms_jiffies_minmax(), and use it for message_cost with
> extra1 = 0. Note that like the ms variant, extra1/extra2 are compared
> against the converted jiffies value.
> 
> Fixes: a940d145cc38 ("ratelimit: Warn if ->interval or ->burst are negative")
> Cc: stable@vger.kernel.org
> Suggested-by: Joel Granados <joel.granados@kernel.org>
> Reviewed-by: Fernando Fernandez Mancera <fmancera@suse.de>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
