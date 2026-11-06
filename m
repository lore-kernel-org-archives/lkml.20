Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793982051;
	b=2ov6ifw6ZyJtZ8neIPHKdPVL49R42VZMe0ZDcYLlzyGh4i1eki8gaWgxcOy07xMULPvy
	 hMxvIAtCekbNyNe4Ag599kKuExkAEKr9lDGJ8hlBJElInC3AYyjQx4dsEJVuAq9jNmrtL
	 /IVsKxCkuAXSvohpDAN6bh8LWMfcIXBmlWIOPpnP8i3duG78DD1N5ae9jQLHkFfCp6PLJ
	 Xi7jxAhyYXth5zGr6wMtPAKd2zqNzXSMn9I1f9TgDy17mLSTCXw+JmrWFadlgTkZTV1F5
	 63/oP+1LfZY0qMy5jlsjoFaGo7ek6Ib+2BxtoTFcWovrR5VQh7183wf0GROMG0aL3mA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FOMXNC8nD2xemKf6gqby6O9Pz76l+PDCgCO/ntvf+XI=;
	b=xuMVSmJgLkl4G+ynp6Ztb6Gx36Q6PPO9vL8k9z6Tr7qj+mSES7twP9lvpJsYNe142l5M
	 5INz7+KsLt/GCMr80s+dDNy+rvOPw0zA2Z7uPEZa+0JsfmSE+v8knrNE8zRNSNQfMLFHI
	 wJj6dQBQ7jSvk9Y6slLj5d1jY9SXF6vyM1NQxT+ZJNfAYURomb4HZ+ObyX8szatmXc59D
	 MGVLaGaM0b23O+Avb3Zj6Jzu/AqX+orIJrWTPq6FRUX25BJmST5sFCOSnvwDfq41KXver
	 GLn/C/lIUhnpdJMCXNY4xS8vpxPbzOxkXm84Xqi8LUWGnNdjTlK6mMVAAJamBH1yqSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GUl8lkLb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C02606D805
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73C02606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GUl8lkLb
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-89d6bd67045so416046b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:20:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793982051; cv=none;
        d=google.com; s=arc-20260327;
        b=U5o6oSF2ZUYWlsNHcmqSlEUhf/D8MikxOi85wErkreb5m88MT+MwOxi8EK+51mdwa8
         aZ9e3ktiLgHdfTvt4tZS/gv0OAwf9nU3RszX6mK4Lh86redht9tEdiYddVxXOXTAG+4O
         rg64Eqq1lcRGmH06kT4DSOnqthKleXRbzIuSIemO8Qg9KwOU9B4qwQwSHsQJ8SoKgAHp
         AepYY/8Rk5B+oLNAKgS4Oy+/a5rFHUSEaFcmzlzLZe31ivVqWGzxnKx9SQPPUE//CTVw
         miyl75jNSewkDWRgomf2cky2UVyAWS7JdcUBVrbxxW3cZp9W3DcBmMTK7esRPSKHxG/d
         iMcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FOMXNC8nD2xemKf6gqby6O9Pz76l+PDCgCO/ntvf+XI=;
        fh=y6kZcjwyrM9YUyu+kx16VFO0SzoGx3hP/gMuvUDAtWg=;
        b=OMaOrfrKk8AwvKtee9PFc0OipBxPta3SVFGhhzroQNcriMcDynvJtepVpbIcIT3xpd
         gITd0OoV2YhZnrEYOqLXbC0qcN4Dplh0Vqbco2xtp6o9QDQ7rwwOpvewCDHKLDdAoW7v
         FjjP2oj6JYRB77BLE4rzkTzCP6cfmzAVpc8Pl3XCA4AfgNFByefbns1jGDSj9bry4HyE
         x1sGss+2vqUC1mvov1I0+xg7q8jjQ5X58rB/q1PX3rDc8ptSkJptDN55rDfV9BFdgSOY
         qwVm01EtgThnSuq3hX87wYWUrykt9n5iliMkyYqGyUEte8bwo5wRxqBwjG8HtN8QKs73
         4yhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982051; x=1794586851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FOMXNC8nD2xemKf6gqby6O9Pz76l+PDCgCO/ntvf+XI=;
        b=GUl8lkLb9T+Pzb6MJ5gKOvfhdiPR1h6u7MFhhijOYQa6vFZ6s0fsM2d+8RM7szLX2r
         0x4646A3e5ANNqMVuQzxEUTniFemQg/ocKuw2XIqXfnxgaIjEuhIvVtzcIhL+LDQrFWU
         EWxUKI1gqiWDdlUfCOEYo3iFwzv/ixM8ZkBFYlNRT9OU9EuBt1Vt5ZD7fXGd8WDt6neh
         AqaBwkbzurgr9pn2UACr+JYfqnp2MUEJo9rttrLpXrZqKwKKsi4EC/lXQMYNV/Xci99W
         8VW+9/QPlccNLgltM/dCTp0G3LKn6oOhukd2POX2WhyNKM33VGgEgKSyML0SstgqVgd/
         zIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982051; x=1794586851;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FOMXNC8nD2xemKf6gqby6O9Pz76l+PDCgCO/ntvf+XI=;
        b=EV2HwCkqBsMIvBXtFZA4/N7rSiCfsUgyzWoO4v+L4L9LWoj45Uh0mmsjFjExQJ6d3K
         332tQdJbEa6M37zDwaTQoZiPPOzLQAiyMpIh337IKvtHtXw8dBfDm+mKiWojBFbzepGk
         6+RWdTSBnGhiSpDDXs6uq8q4RQ0a4Zq8olfdWTV7wXQCHLQtVLPynDjdgMbppzmLm2sf
         m3zjkyhWmiW0ybXF/iev9CLHG3P0qljydatl/EFO3UFsKOzPaAwWavW2er6/pw5K+lYm
         Xe17IJksPu3dIetXi3A2DXNzuMwiuj3YMWceqKOYsqf3PGvVHpicfahCGfPo2GjTM87J
         w7Ww==
X-Forwarded-Encrypted: i=1; AKwUvBzxc2bXTzPa29Xo6weuIaeLfFHw2uDPXAKfP5SWVGGfgfZwHq/1oRQEV71wVX0RvfR9wFg0LhXFRfH6oZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bPPQa6Ct5WnIKKBPOxFUucoff5Mjj0a28P5ujyh7FriVkDiCs
	k8R+7JiIxOXVi0gtIZ0njKNn4UTuyJsZDpLrVHZR45jO2ZZtHeIsQJPf/T5i8J2wbqlGlKIR6tB
	smCOXI4rY2vhIdyQJT/zJcBkY7vEz5a0=
X-Gm-Gg: AYBFou1wLMV2YM2fnj5uUR3Kyqx7wrJhh6SG7asBXyS8pH6KOyEhn3CvanDWNs/3Twy
	B87V2K07ssAmd797Rab08Nmzz+IRt4ZPjQqlFYkZmbHmm4fkuC4AXOsOFloPmD52bnyawijyMS/
	lxM3dw+ML9Q3rFDjoWggcRBJvUABtg9ImIcnwuwQHca/0g6gNvOnNSvw8Q2UIbObMXdIlycqfVV
	9+ADSS7sp17txhrYX7SmXSyQ8/wcFTbtUzXF+rMPF3ztOniUNy/+pwquQmXsKkPGYf4AILOVy0t
	1OJzHJEkhIXDYbKqDEmvOAj8WhruM3vWXCmSopuD9Ef0L64mb0aCxHydq1Kup4tv0BvTBTVJ+KQ
	+PrM4aYzb7HKunvHo55qVA2bnbUMufQZkbpfe9cLGQez/R5hjLVvqLGgTBRcDvY/AR2llJpmV47
	yeq5XnnoKgyZO5LObgWzS8XsLAETQ6NYVNLQU=
X-Received: by 2002:a05:6a00:9298:b0:898:a77f:2833 with SMTP id
 d2e1a72fcca58-8b37bc5f939mr2052745b3a.21.1793982050713; Fri, 06 Nov 2026
 08:20:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106091938.112942-1-18983559317@163.com>
In-Reply-To: <20261106091938.112942-1-18983559317@163.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 6 Nov 2026 11:20:38 -0500
X-Gm-Features: AclHuK-yIHMUp58UeoDDDdnzrU0Ccta1sECn_2m1xLJeYcw_aDI-1ekYnwksz88
Message-ID: <CADvbK_c2A18x7H6jgFqdQjFO8h7OS=WFYCtoFN715LJXLtmB6g@mail.gmail.com>
Subject: Re: [PATCH v1] sctp: fix race between addr_wq timer handler and
 backlog draining
To: Binbin Deng <18983559317@163.com>
Cc: marcelo.leitner@gmail.com, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 4:20=E2=80=AFAM Binbin Deng <18983559317@163.com> wr=
ote:
>
> sctp_addr_wq_timeout_handler() walks net->sctp.auto_asconf_splist and,
> holding only bh_lock_sock(), calls sctp_asconf_mgmt() on every
> auto-asconf socket. Unlike every other asynchronous SCTP entry point
> (sctp_rcv() queuing packets to the backlog, and the timer handlers in
> sctp_sm_side_effect()), it does not check sock_owned_by_user() to defer
> its work while a user context owns the socket.
>
> While a user thread owns the socket (e.g. recvmsg() blocked in a copy
> to user, or release_sock() draining the backlog), sk_lock.owned is set
> but the socket spinlock has been dropped, so bh_lock_sock() succeeds
> and the timer enters
>
>     sctp_asconf_mgmt() -> sctp_send_asconf_add/del_ip() -> sctp_do_sm()
>
> concurrently with the backlog drain path
>
>     release_sock() -> __release_sock() -> sk_backlog_rcv()
>       -> sctp_assoc_bh_rcv() -> sctp_do_sm()
>
> Two state machines then run on the same association with no common
> serialization and mutate shared state concurrently: the outqueue
> control chunk list, transport->packet.chunk_list and packet->auth, and
> the transport/dst lifetime.
>
> The bug was found by code review of this timer entry point against the
> sock_owned_by_user() avoidance used by all other SCTP asynchronous
> entries, and confirmed with a reproducer that races an RTM_DELADDR
> address event against a user-owned auto-asconf socket. It triggers the
> following, observed with KASAN and refcount debugging:
>
>   - rcuref "imbalanced put()" from dst_release() in
>     sctp_transport_route() racing the timer's transport routing,
>   - a GPF in sctp_packet_transmit() dereferencing a chunk pointer
>     corrupted by concurrent packet/chunk list use, and
>   - associations dying silently (ETIMEDOUT, GET_PEER_ADDRS failure).
>
> Defer the work like the other entries do: if the socket is owned by
> the user, drop both locks, leave the addr_waitq entry queued and
> re-arm addr_wq_timer to retry after SCTP_ADDRESS_TICK_DELAY. Sockets
> processed earlier for the same address event will see a duplicate
> ASCONF on retry; the peer reports that in an ASCONF-ACK error
> indication, which the association tolerates.
>
> Fixes: 9f7d653b67ae ("sctp: Add Auto-ASCONF support (core).")
> Signed-off-by: Binbin Deng <18983559317@163.com>
> ---
>  net/sctp/protocol.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/net/sctp/protocol.c b/net/sctp/protocol.c
> index 27c26e12f95d..7528a40a87f5 100644
> --- a/net/sctp/protocol.c
> +++ b/net/sctp/protocol.c
> @@ -645,6 +645,14 @@ static void sctp_addr_wq_timeout_handler(struct time=
r_list *t)
>                         if (!sctp_is_ep_boundall(sk))
>                                 continue;
>                         bh_lock_sock(sk);
> +                       if (sock_owned_by_user(sk)) {
> +                               bh_unlock_sock(sk);
> +                               spin_unlock_bh(&net->sctp.addr_wq_lock);
> +                               /* Try again later. */
> +                               mod_timer(&net->sctp.addr_wq_timer,
> +                                       jiffies + msecs_to_jiffies(SCTP_A=
DDRESS_TICK_DELAY));
> +                               return;
> +                       }

Can you merge these two mod_timer(), and move it out of the loops? like:

...
+
+       if (retry)
+               mod_timer(&net->sctp.addr_wq_timer,
+                         jiffies + msecs_to_jiffies(SCTP_ADDRESS_TICK_DELA=
Y));
+
        spin_unlock_bh(&net->sctp.addr_wq_lock);

Thanks.
