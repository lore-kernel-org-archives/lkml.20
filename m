Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793208339;
	b=YgwUecK3vQW2LYF4aJ9XHRLY4uc4S5KFuUCWuLh0NkXLZ/6/1BugyzHK4ruG1cjvwylM
	 RiDwuw/mVML4ppN2NP0zNx//XFWCq1PTr9BFBBKoZpBU6wXGU2guc8ClQMpcJWenZTmPL
	 7aPvt+AItEboiVNK+gLnkwISEmUHgGiaEMHrirLgNNuRns9LZaI52Cipq0ChAoRS0HN0h
	 Y8HDSIrtp0lcGFdSWaTwrBejU6X497YXYsUyLjKcwhtUAs5HolG4/Rssh1XTrSJgwcJuG
	 3fA9TcQ6Px3ztHiFiF7GWPXDf9byzCm3kbkNI6LxvxSLFUPKA0JZVlEEYhRJ2S3VZ6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793208339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=XLYiEepDtnyQ6wJ1rlYe5RaJc/i8ARvs/UjwaNMVQRE=;
	b=SRs6GSUbUtUZHRC7ZtPNz+pYRnLJWZ2H6auJU/NN77Z9J3I6rRLK3hX5MQv7IBaioclE
	 O036dFe3e9rfMYFDOhRpwT1qxa/R2g6m9FtWyB5824HIwFbGP16fSm6B9KnNdtOy2/EwY
	 2bSLfZp3pS5udX3Qrl3Fci2dyK3XRAF7grUsUDSzhFidjllj34Z4TL1/FC9F0GzI5aZt2
	 T5tdTTYA5v9nH0hlvnnh7N4yC3nbAszNkDPwJ52TSQILHdBqHFhYJJsBf/JYBxbR1cy0u
	 veq4zr/yUwwLai0c+D1q9Oa1icU+9/IWNgOql4s/efCpq5OHxQzfXkfZffB2JtJuQGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Af7y52Ro;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3597606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3597606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Af7y52Ro
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc751eddf25so889821a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793208333; x=1793813133; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLYiEepDtnyQ6wJ1rlYe5RaJc/i8ARvs/UjwaNMVQRE=;
        b=Af7y52RoNQXZRESfNzlA5nWU7zYO0dfLPezS+5rNH3Tx4+4DsnOMyhABRaQvfQPhli
         WGDEJ6zWLk88idrS1IRmCJxUBASFuuPGGngNzQZZ7LzmANcSte3aAEFKuC2VjHtOK2z7
         yjKMj+n+y7innZ39T/IQMUNxUrOFGpd7ZgkibuW592Y5ybQz3HYIMsH9Gk9Vo/7F25Aa
         q36OaknOzdG878FRgHSj5M2t3J2VawgIYj7j4isik5KORWNcsNhJEboFyrcCLGCCUvS1
         gSvujDxwZjfi6G+bKCVFt8XzBT2Fk2cA1mp2Ztj8lzO/DQBvE/UHm9uoMPtJq1mQY/nw
         HIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793208333; x=1793813133;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLYiEepDtnyQ6wJ1rlYe5RaJc/i8ARvs/UjwaNMVQRE=;
        b=H4UDQWprAB1WZftdDUbOOUppyxWd/R0+5mN7xhzQGFwAWCaD7oKfU87jGf8N79PHzb
         LNQ00A5DJQtU7D0fVlaes51dCDI9MpJuaSQqrG3GKhcjf/ByKB7uN5Itaei0hvXNQvFo
         lBWTacwJ0AklesQxs3MRW+900dKIxUTBpLc9+YmcLr8ZWO7hPSMD8Q3LaaO6+ZlnsKPk
         2MVrqyWS6ZS/x+QiPoAlEBp4VPzKRLHzJYl4Dnzk8SOVHqhJLhC9LChuErdpOUFVPtrf
         JCBsu1gzS86lsYcYMRBrumynADv+MJjzCnWrHBVuBgqXGjKsi2bq+H7FGf2ndkNdepnv
         56jQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuYcVEPmQPvG1akFNgkZIcpLTzFwuypj88lSbXcFoxqz+FYfApz7y7qZ1Lh5WElKC9jpYbrCJJROaX+20=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJN5JgGtOIBiDwL5m62JyaA9sQ924Z51C225Lsk82whrblBUIL
	yyIgSyOSrVfhqTVNSbHN0UzLAZ/kjdg+OMn/wmqukwe+TfRMgMFU3dfR
X-Gm-Gg: AYBFou2OjoZSJdOPLjM4PyNSrIysXPViftLQEzT4VOxK/FADM7Ngyy+SE+iHsavJPzf
	muxOkt5yaELBqMuMepT0r0gpxhLWo+HaxTuTX7jQfMafuS/Hg5LqvzqGAq67uPR/5V5Onc+2cee
	dIbsWHmOJB022Vu4T9iv2Su4KC8e2PHgKgRldpRJM6Y+3FzeDhaBTv54vcIElN8fJjpEQHZbKyq
	hqlPfxEu9EL3raKKgW8DWbJuMEL/zGqQB8qgyvzG5j+1dp3s+lNFnEaXsOY7OBN13+6u91zhN2k
	BB7tyTE++w+oUh2xyDSU1tosaSKHU2nQPl2NK7PGgIPu7maSr8ZCQyFy9gRYYnmRX2fkOHw/1F3
	ubJzUoghaa77PQLuT2rMk4eK9lEz43e7ZwB5iWw2iWca/12A67qvZiVsWbEQBbUOLM+rDxWcK/m
	v0vJ6+3EshWmU1Lr/DzhiSz4P3ek2TcgPJIhCfcoKkFWI3+zutVbv+WssrK3xt7bJ4mLhKg9WNP
	TED68lDud+UkHkJ7H0LgYB8Qezo9Xc/HoTPGtofDtabjuwECzh/RFKV7/CwoJ8HFDHRjySkY/54
	0JYOwmCxH/Ci2GpcThF6FyJ+VuZKijp6xOEdANp7NTvkKNoTYI4W2ajHInuacUWUgmT84BI+J2j
	PZHFIPHtF76x5TmzNywye1yRtVkBuBYk1IQ==
X-Received: by 2002:a17:90b:3a46:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3ae581b7b3fmr2290113a91.10.1793208333116;
        Wed, 28 Oct 2026 10:25:33 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9583c1sm397200a91.10.2026.10.28.10.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 10:25:32 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Oct 2026 17:25:31 +0000
Message-Id: <DMGNAV67LK3F.2FNLTD5NVHDEA@gmail.com>
Subject: Re: [PATCH RFC 0/8] vsock: add datagram support to virtio and vhost
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Sergio Lopez" <slp@redhat.com>, "Stefano Garzarella"
 <sgarzare@redhat.com>, "Bobby Eshleman" <bobbyeshleman@meta.com>, "David S.
 Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Bryan Tan" <bryan-bt.tan@broadcom.com>,
 "Vishnu Dasa" <vishnu.dasa@broadcom.com>, "Broadcom internal kernel review
 list" <bcm-kernel-feedback-list@broadcom.com>, "Stefan Hajnoczi"
 <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, "Jason Wang"
 <jasowangio@gmail.com>, =?utf-8?q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, "Xuan Zhuo" <xuanzhuo@linux.alibaba.com>, "Haiyang
 Zhang" <haiyangz@microsoft.com>, "Wei Liu" <wei.liu@kernel.org>, "Dexuan
 Cui" <decui@microsoft.com>
Cc: <virtualization@lists.linux.dev>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-hyperv@vger.kernel.org>
In-Reply-To: <20261028-vsock-dgram-support-v1-0-e457cf7cee78@sinrega.org>
References: <20261028-vsock-dgram-support-v1-0-e457cf7cee78@sinrega.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Oct 28, 2026 at 09:04 AM Sergio Lopez <slp@redhat.com> wrote:
> This series implements SOCK_DGRAM support for virtio-vsock and
> vhost-vsock, allowing applications to exchange connectionless messages
> through the existing AF_VSOCK datagram API.

The cover doesn't say who needs it.

Bobby and Amery took the same feature to v6:
https://lore.kernel.org/all/20240710212555.1617795-1-amery.hung@bytedance.com/
Stefano said there that it can work well and that the virtio spec change
is the next step. The last mails of the thread have Amery's v7 WIP and a
short list of what is left.
The cover doesn't mention it. The spec change is still missing.

Why not finish v7 instead ?

This RFC goes the other way in these places:

  what               v6                        this RFC
  -----------------  ------------------------  ----------------------------
  (cid, port) space  own bind table for dgram  shared with stream. The 2nd
                                               bind() gets EADDRINUSE
  vsk->transport     empty until connect(),    g2h or h2g, picked in
                     lookup per packet         socket(). -ENODEV with
                                               vsock_loopback only
  routing            one helper for stream     2nd copy of the chain in
                     and dgram                 vsock_assign_transport()
  recvmsg()          in af_vsock.c,            dgram_dequeue() stays,
                     no dgram_dequeue()        dgram_payload_len() is new
  VMCI               fallback                  first. No virtio dgram when
                                               its module is loaded
  dgram > RX buffer  drop, EHOSTUNREACH in     every RX buffer is 64K
                     the error queue

> Datagrams use destination-based routing across guest-to-host,
> host-to-guest and loopback transports while retaining the socket's
> transport state. VMCI keeps priority as the dedicated datagram

A dgram socket uses two members of struct virtio_vsock_sock: tx_lock and
bytes_unsent. They serve SIOCOUTQ only.
virtio_transport_alloc_skb() does skb_set_owner_w() already.
udp_ioctl() returns sk_wmem_alloc_get() for SIOCOUTQ.

Without them a dgram socket has no transport state, like in v6.
Then no need for the owner transport, dgram_transport_match(),
fallback_transport, tx_accounted, the skb destructor, etc.

> transport.  Guest RX buffers accommodate complete messages when
> datagrams are negotiated, preserving message boundaries.

That's 64K per RX buffer instead of 4K, for stream and seqpacket too.
It undoes commit 03a92f036a04 ("vsock/virtio: Resize receive buffers so
that each SKB fits in a 4K page").

pskb_trim_unique() doesn't reduce skb->truesize. So a datagram of 1 byte
charges more than 64K to sk_rmem_alloc of the guest socket.
The default sk_rcvbuf is about 208K on x86-64. The 5th datagram in the
queue is dropped.
