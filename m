Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792977329;
	b=nw8bZbKMQIZODNnjMo5h1K60xzqfhdIfQQNpfwpSee/YvQq6ErQzApqBJLGIWP5yu5te
	 vK8XxFJOWSKOc/RiiAZS7F/47bmpfZVHd6FIZxjFdYW5OK1xhgR4kFSJEhNIEYFe/hfoF
	 IM3LgKlJwxz7F0KTsJwkKoVZsWm7p2BygkvKXkD5cWJJRVNqilf1Edk02LOCV9EYdpJwJ
	 RIAIa/+TQjtIgUIkBjbQrZ9Z+5W1RWFShy1gOVUvpPgUDri4db0d36BDxBPOcA4fACS8E
	 DxNa4LZuROdpmRHJQHJ1u/8ccMhWA7EEIsZt+6tpODU+5b5AgKSbbj3q9w5nfDiz0kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792977329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kcIt4AlDwKcuyi2teHhI3jaIBhx2e8Mks+B/iXDVZME=;
	b=G34YdSV5w87Xkf/bVAbTsIR4TlVPo6nkx+Xebv/HJHntUQSvPUzYn8hDsReJVNgTqwLe
	 5C6ufGSaQ4yNFLycGPK73L+Jjuztb8V22oYYGYOx2xG1ePkfzUh/NDXeZvu4J5EVOjdD3
	 d0MCW8mk7FDAjX6R33Swfq6+SN5mh/BUUp8G2uWpoPxgxIV62LNfIlleQbIaehJMGrl+r
	 8meEELmr3bKIVHessRWZJuX3fipkS1xl5T/+6Q7oG+saJ81dG3A87egchyf3QUAd+aAt4
	 frOMto2G1c09HPmFD8A5+hCADK0hjgU4AL/9sNHPlrKTPmfMlqKrPhl1U1MU5DtF4lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BfKsuv+T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A74606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A74606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BfKsuv+T
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53cd0c8614eso1594641cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792977328; cv=none;
        d=google.com; s=arc-20260327;
        b=RJvuu9t07Q2iGWvAeB1Rwtird4aTMEIMgubLNp2d2+r+Em+inTqxIzZ3JgmE8lsgfA
         C0TjOVDcCBYMRWIVhxU3H+agJfloE+hQGaSOxsdO8HEjciuLbRHDexB2fE9SgSA8NCai
         XFilfIVaawE5Lbddlteb2o1tNdbrZCX2SOucQIQXWBObwg0vY0fnRNhyNgc5q3Z1o0g1
         Vnqk9Mi9MTmFBSzJoEHhUGrazsK+8bw2BZML592al3JKMYhHYTpG6KfP9HHTT4xAw93j
         46Ymw7nvJphPc2rb7J/XWssBsnMdmwq5osFNYfp6oV+YkWebYjS5z3tMwunCMBMsyvqf
         9t2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kcIt4AlDwKcuyi2teHhI3jaIBhx2e8Mks+B/iXDVZME=;
        fh=8fhEgkAW+AfNSYZDp0C40iTm99eUCrYVLGhRH5c+CaM=;
        b=SSp65blpiJkT7K5Uv2xUupqp9xEhbthal33KXb3E4aPRRDDjDFvhESW9K56dLPJPxk
         7Oeopc7OGRGO0dixCV1qC1xtx10qysSdftVWLO7pLH9uCl+UY6kaFCGjAg6iJiz82I2Z
         XrpFEVIlqsMVcTn6BGdbULu+ez7M1qMNd7/1LUMDnCLuwsiJ/OFrHLmd8N+93KiDbSGY
         104Uwgtznr7Q7htCmxO2x9ogZMqvRVrmJt3F13A1gm8VoI6+F2EiHDZ/Dnwh93K6huSC
         gFCZQ4zC9BOuQzw5MhAvkr1/crpDVayThMxzzladcAw6SxklbEYBQGq0eQvBDtsjaNLa
         kMaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792977328; x=1793582128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kcIt4AlDwKcuyi2teHhI3jaIBhx2e8Mks+B/iXDVZME=;
        b=BfKsuv+TH5yW60OVPKqz4MZzmZXeIUfeI052jiXuzPygcs71qCUTcTjI0qhRLbk86s
         2Fcrqq/G3zOxcgF7cXkYjS6gOvvgf0VLqjLj9K4yNkFkS+5SDRUu13q2sG9i8SGqXFof
         J9hlhc2Igie4SairlkUIL3uXHc31gETqu7s9zaQ6BeSJYUnmTDBccEOPZiRHRVK5HFLf
         ADc9OUAdetNRiEH0rntOKlHPQ/ZC2w5UsfEgUnBbIMOdVXqBUF3COOJEEdlpEjo+dprC
         AcQL+jqrXBJv2IDOGK4ghFbvtF/YKkwSwjcJk53ccqLW+2PFM/TfHk9CFVWdKYtEdVmL
         1HLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792977328; x=1793582128;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcIt4AlDwKcuyi2teHhI3jaIBhx2e8Mks+B/iXDVZME=;
        b=VDaXyh6xpyOc6NFLZvV06WJfLVb584Qz0+OIEF1+awSIYfIIo65WsvGtjy7sRWPUit
         lqlkDzMjEdF6JZGYHhnn+js+Vdy8jyCvfhGCtGM9RgTw0VsnHepSjEFUGmsEttnqFlIt
         YFmrNfYztriKNUBfLxkYP2tVT0zqM0cOqmbq4kJ/ylNVyiU74Y354w+I0ecaIjZDIdt2
         pIpmHd3yif1tA0sMOpw7RdDlQzFQs76tGX5BAYM8dyd5GzyfyA1JHmKd12YnTQGqataU
         An32ZKxOs6PNNcPElsczHpGlz2ttnDmmJPFgMcUrdLbnOat5LUFgUecMsf7a9oDxB8f1
         1nyA==
X-Forwarded-Encrypted: i=1; AKwUvBzG1DcDJMDvB2YmGn/B2B2AKgkb5jMFzxn9q6MPZP3Un8Yrq/yRnCuvZl+m90Qr003ui/oTsnJTZfKMa9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzqjY3LKKJsj0reMagivSAW5T2+frD2GRZfD10I9MjRpbI46A7
	fESEM8DYmLqaejp3Y8vZfl604FsOZ3cyjKknvo2Tz8+X4dH8eX9Fi+Sm1CyUTWtypqpHBCN8oXO
	gwcdGJuMCVT4Hx3hNUAGpkHVwM/8cbmI=
X-Gm-Gg: AYBFou3qJ0XwIpJskjJPVOMZ55sKOMEV5G7qUxvGKewRAEENRdYgXVux5zjLgynffwa
	t4N3JEhX8lJ6lEkWW/8icRZgkrsvQTpT5cQ2UH1vVS9cPZM5RMPRWoxLEHbaFcaRKbeUwSJWEZ4
	uFVFwaegaUPApQxdQFELm3rHwGDMZg+ye9HpuBOI675qvYJ+p+aspuuKX30fAN7X3561ZHaR4Ma
	ufryYKG/0CaMkYpemmx1j8pYTydLPDSLV362QvZA9ZaF2dfoeXab5ZvfYccCNIzwR62aFivu7JP
	UhRFCCx8PDQOr9ZoElmUUKljV0eJlNfyIHDO9zhThhUa1r84BFc1L0SVZwmlX4qw70a4QaRNS2U
	h/YwpY/3ub2NWlbv2H5Uz5V0nXnhyLqOvCMFv04x5qJab7r5gvz49j5lKzYSSD3XVcVW8GtBx8R
	H3IAYzAM0NCEW3fECGEx+XcG9qo4fsTXMUgHBUR+5XpG7AehSUhm6Va2NkbG/qmz8K7p88Y/h23
	KuiNCTYJzDhAmSDX/IoU/1a4IlhVV/pT9TtGhkC+hWFMPflcFxAs6/jwhTMddbFtYOtyp5kN0LJ
	8XlsBaoA1kM=
X-Received: by 2002:a05:622a:8842:b0:535:ed1:cdb0 with SMTP id
 d75a77b69052e-5383b38f236mr81537211cf.4.1792977327813; Sun, 25 Oct 2026
 18:15:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021155715.30094-1-jain.sm@gmail.com> <20261021155715.30094-2-jain.sm@gmail.com>
 <20261021135110.785bb935@kernel.org>
In-Reply-To: <20261021135110.785bb935@kernel.org>
From: shashank Jain <jain.sm@gmail.com>
Date: Mon, 26 Oct 2026 06:45:15 +0530
X-Gm-Features: AclHuK9v5p6YHrm7XmZkFrhbkAZsWSlrZYFgeH9innXsC4CRHCe412MlSRwf478
Message-ID: <CA+FWx==2+3kc493w2bqxO+UuJfMP4CbC+Fa57r37x=HBiaqnsA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/2] tcp: keep the route window metric when
 SO_RCVBUF is set before connect
To: Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> [Medium] tcp: unordered lockless reads of window_clamp in tcp_req_window_=
clamp()

Right, nothing orders the two loads against the two stores in
setsockopt(TCP_WINDOW_CLAMP) or tcp_disconnect(). The case that matters
is the one where window_clamp reads 0: the request then gets no clamp at
all. Any other stale value is a clamp the listener had just before, the
same as a SYN that arrives just before the setsockopt(). And a
setsockopt() between the SYN-ACK and the cookie ACK changes the clamp
whatever the ordering.

So in v5 tcp_req_window_clamp() falls back to the user's clamp when
window_clamp reads 0, without barriers:

u32 user_clamp =3D READ_ONCE(tp->window_clamp_user);

if (!user_clamp)
return dst_metric(dst, RTAX_WINDOW);
return READ_ONCE(tp->window_clamp) ? : user_clamp;

I kept window_clamp rather than the stored user value, because a listener's
window_clamp can legitimately differ from it: SO_RCVBUF lowers it, and
SO_RCVLOWAT raises it so that the window can hold rcvlowat bytes. Capping
that at the user's clamp could leave a reader waiting for data the window
does not let in. The plain store in tcp_disconnect() becomes WRITE_ONCE(),
and the changelog no longer says that READ_ONCE()/WRITE_ONCE() make this
path safe.

> [Low] The changelog says: "Without an RTAX_WINDOW metric and without
> TCP_WINDOW_CLAMP nothing changes".

Correct for MPTCP subflows. mptcp_set_rcvlowat() writes the subflow's
window_clamp without setting window_clamp_user, so tcp_connect_init() now
replaces it with the route metric, as for plain TCP, where
tcp_set_rcvlowat() only raises a clamp that is already non-zero. v5 says
this in the changelog and Cc's the MPTCP maintainers.

> Pre-existing issues:
> - [Medium] The patch adds tp->window_clamp_user and comments that
>   window_clamp "never goes above a clamp the user set with...

Agreed, the comment and the changelog claim more than the patch does.
Only tcp_set_rcvbuf() is capped. tcp_measure_rcv_mss(), tcp_rcvbuf_grow()
and SO_RCVLOWAT still set window_clamp without looking at the user's
clamp, as before this patch. v5 rewords both to cover only the SO_RCVBUF
path. Whether autotuning should respect TCP_WINDOW_CLAMP is a separate
question that this patch doesn't change. I can look at it as a follow-up
once window_clamp_user is in.

v5 will go out when net-next reopens, without the Fixes: tag as Jakub
asked.

pw-bot: cr

On Thu, Oct 22, 2026 at 2:21=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 21 Oct 2026 21:27:14 +0530 Shashank Mohan Jain wrote:
> > The problem was found by code inspection, assisted by an LLM (Claude
> > Code, Claude Opus 5.5), while reviewing the commit above. It was
> > confirmed with a reproducer in a qemu guest (two netns joined by a veth
> > pair, "ip route ... window 4096", tcpdump of the SYN and SYN-ACK, and
> > TCP_INFO of both ends, including a SYN cookie case), and with the
> > packetdrill tests added by the next patch, which fail without this
> > patch and pass with it.
>
> Sounds like a genuine net-next material. Please drop the Fixes tag
> completely, and repost after net-next reopens
>
> If someone disagrees please speak up.
>
>
> ## Form letter - net-next-closed
>
> The merge window for Linux v7.4 has begun, and the net-next
> tree is now closed for new drivers, features, code refactoring
> and optimizations. We are currently accepting bug fixes only.
>
> Please repost when net-next reopens. There is some uncertainty
> about how long this merge window will last, so please check
> https://netdev.bots.linux.dev/net-next.html
> before reposting. net-next _may_ reopen on Nov 2nd.
>
> See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#=
development-cycle
> --
> pw-bot: defer
