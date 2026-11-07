Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794078935;
	b=nVVPHiKkTTZwy4Mj1wZkWbhf/LUxcKEPsGqGNUa5KVYNFKwAE61LsK4aZDPmZeaUegcP
	 c1OP2AoRMv8iyxu+0m74mL0uluYNa1KsBRKs37HG94Y9/5nq20iVfE0+vKeOVoxTyX+Py
	 SBvZGw4DoqjrI9bv84fVZCVGt/yPpks/XPOg8VmQFb8QFk1+ok+ozMv5/giXS35cW9QSb
	 4hR00QmH9z1WkZtdcgZGqLUmpQ+IvhhGI7ZQ3pRfzTMafaWisdCNFO492SSCK1RhleNGk
	 kj8qb5NAC9KYd3N99AhSte+pYAQN1ZWFahkRR9ujmL5SaFxaKxQ7MtNPFLB/ncwttEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794078935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=mafEGEdrVUw8NHEcO8SJv6Z5WTJzza2tDmHJlOhN/14=;
	b=jFJAOypLequz3tFko7lACyNd6f5mH8g69hyK+fsXS9o47pUiTzJmRfjz9DcYSiNSn7Mh
	 MvXCFX1uR6fMcaqAbxM/M3yjLHim8Cf7+BF6OIq7FybM9lc3+BxPr2x/kuhUbuTehdhWc
	 oOJM8jXldugPhGokFBEgCYGV5F01ikhpcqtNVa7VvrxAIKvyn3FXLUEAFnA4BIbhrM9Xa
	 yiQtuoq8aSdLGoFwEGITHFePCEcoGMA9gR5kkJsQcwU+VqJ20k/o+rVdJU1bvuW8M7zNG
	 mXhwjXbsvr9G5Y5SR8GA7dBLvHWoxp1nbWOgvm6BeKBNyVfYvGGVMrrrudta5U3v8yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="dC6J/aT7";
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E7C606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83E7C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dC6J/aT7
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed1f955de7so10146865ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794078934; x=1794683734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mafEGEdrVUw8NHEcO8SJv6Z5WTJzza2tDmHJlOhN/14=;
        b=dC6J/aT7bfCHFAgBwL9fqX1e+XMB4+JBfvLSPEI8QMnQp2rB5ihlxHSZcZ4lG1siSt
         at8n0Fcu7d6uRniKJQJ6R60b0eUq+EL+T2S578q5VnXp2yUGL8wSDnrO4jvcj/c08q8D
         74EkV0l2nM3hyeCj16HmTGFs2gJ6fG0Sx1o2NzZwVtCkHSzSpTRt31QoQzMi10woPj2R
         sVshTgt+yHiuT3OYIAtd+hNBnscKhi7yyFEa0DJiWHLjPbaeiwbdKXtAcsYATXrUkrng
         uGqELtm8cv1gB+KeW64o7KjpCnL0U9avz5K4guIoqjIFrBb9VFiS+/62xlEirGpyGuOH
         VXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794078934; x=1794683734;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mafEGEdrVUw8NHEcO8SJv6Z5WTJzza2tDmHJlOhN/14=;
        b=R+duziTv2TT6+thGVgjNAGGrfi/LGyKYLlQnJj4CeY4xku9BK61xFEGhcAGpuPLmG/
         ZWppSfPOmQpGV00NjB2g13KE7HD46wdS08s4m2PbvqCSHkVIlvLkpMWs+L2fQ5ThbuvU
         7pkBA3xKeMjoPZSzfGqEN9lVkqtS0T0SYpnHivyy5SU3Vzotb3yAQbHcb+bA4r5qXCRt
         QGAbKzWt+hSvCYGbYRkVnFgEN8dUrQuKGca3J5eDCGQwA84jYGDIR6UPs3c1y2mmQbIb
         uuXAz3G07gFsvyU5qP1E/JQbS9vvlHO8LKRWRUwehAVk7qDBjRgASCdmdBVJdFLwB/1c
         7BFQ==
X-Forwarded-Encrypted: i=1; AL+hErHTYn9SZ/VL9L8yN3nX2AjVZdA2wUILyPr8VnGJjJu/ruQD4B45ZLbZLEKPDDU+bLqOL9jp6Mtop5Ehec8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TzUB5rsMWGQXqz/EaG+y8C2tfUXo9NsdysccZGznVekeCMApm
	JXa9HO45DZneSlSX5cjLsVIW4duYGWMaXvKZqfAiX+RRqdcp8T5CmuMWNSphh7J7rvl81qtVcpF
	CiHml1Q==
X-Received: from plsl4.prod.google.com ([2002:a17:903:2444:b0:2eb:6048:4647])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b28:b0:2ed:2e3a:1faf
 with SMTP id d9443c01a7336-2ed40c937e4mr67561865ad.47.1794078933562; Sat, 07
 Nov 2026 11:15:33 -0800 (PST)
Date: Sat, 7 Nov 2026 19:15:33 +0000
In-Reply-To: <CADVnQy=AHpy6UoiAFopRUmHLNv6Arw07PysXVijiR=qERuzeww@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com>
 <20261103-mtu-probing-series-v1-1-a2809e725aaa@gmail.com> <CADVnQy=AHpy6UoiAFopRUmHLNv6Arw07PysXVijiR=qERuzeww@mail.gmail.com>
Message-ID: <au9zxblIQx7OF_gx@google.com>
Subject: Re: [PATCH net-next 1/4] tcp: sync MSS after enabling MTU probing on
 passive connections
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Neal Cardwell <ncardwell@google.com>
Cc: echoowall@gmail.com, horms@kernel.org, edumazet@kernel.org, 
	kuba@kernel.org, shuah@kernel.org, davem@davemloft.net, pabeni@redhat.com, 
	netdev@vger.kernel.org, panweiping3@gmail.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 07 Nov 2026 12:53:36 -0500, Neal Cardwell wrote:
> On Tue, Nov 3, 2026 at 2:09=E2=80=AFAM Yongjian Wang via B4 Relay
> <devnull+echoowall.gmail.com@kernel.org> wrote:
> >
> > From: Yongjian Wang <echoowall@gmail.com>
> >
> > tcp_v4_syn_recv_sock() and tcp_v6_syn_recv_sock() call tcp_sync_mss()
> > before MTU probing is enabled, and tcp_init_transfer() enables it later
> > without syncing the MSS again.
> >
> > With net.ipv4.tcp_mtu_probing=3D2, a passive connection therefore start=
s
> > at the full MSS instead of tcp_base_mss as documented, while an active
> > connection starts at tcp_base_mss. This has two visible effects, shown
> > here with tcp_base_mss=3D1024:
> >
> >  - The MSS drops when the first probe is acknowledged, from 1460 to 124=
2,
> >    although that probe has just shown the path can carry more.
> >
> >  - On a black hole path the MSS never tries tcp_base_mss. It goes from
> >    1460 straight to 512, since MTU probing is already enabled when blac=
k
> >    hole detection triggers.
> >
> > Sync the MSS right after tcp_mtup_init(). tcp_sync_mss() only applies
> > search_low when MTU probing is enabled, so the other tcp_mtu_probing
> > values keep their behaviour.
> >
> > The Fixes commit kept tcp_mtup_init() in a single place on purpose, so
> > sync the MSS next to it instead of moving it back into the
> > syn_recv_sock() handlers.
> >
> > Fixes: 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
> > Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> > ---
> >  net/ipv4/tcp_input.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > index e1f2d9765..c13f005b2 100644
> > --- a/net/ipv4/tcp_input.c
> > +++ b/net/ipv4/tcp_input.c
> > @@ -6760,6 +6760,7 @@ void tcp_init_transfer(struct sock *sk, int bpf_o=
p, struct sk_buff *skb)
> >         struct tcp_sock *tp =3D tcp_sk(sk);
> >
> >         tcp_mtup_init(sk);
> > +       tcp_sync_mss(sk, icsk->icsk_pmtu_cookie);
> >         icsk->icsk_af_ops->rebuild_header(sk);
> >         tcp_init_metrics(sk);
> >
> >
> > --
>=20
> Functionally this seems correct. But I'm wondering about the
> performance impact, and whether there is a way to achieve this without
> adding this call to the code path for every connection establishment?
>=20
> Eric and Kuniyuki, WDYT?

Looking at history, initially it seems we properly called
tcp_mtup_init() right before tcp_sync_mss() in ->syn_recv_sock(),
but 4d83e1773031 removed them.

The dup tcp_mtup_init() mentioned in the commit is the one in
tcp_init_transfer() today.

Then, 27204aaa9dc6 moved only tcp_mtup_init() to tcp_init_transfer()
without tcp_sync_mss().

The dup exists in tcp_rcv_state_process() from day 0 (5d424d5a674f),
and 168a8f58059a copy-and-pasted the unnecessary tcp_mtup_init().

So, 4d83e1773031 removed the correct one.

Instead of restoring the 2nd set of calls, I think we should
revert 4d83e1773031 and remove tcp_mtup_init() in tcp_init_transfer().

---8<---
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index e1f2d9765f81..8d009c0d9359 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -6759,7 +6759,6 @@ void tcp_init_transfer(struct sock *sk, int bpf_op, s=
truct sk_buff *skb)
 	struct inet_connection_sock *icsk =3D inet_csk(sk);
 	struct tcp_sock *tp =3D tcp_sk(sk);
=20
-	tcp_mtup_init(sk);
 	icsk->icsk_af_ops->rebuild_header(sk);
 	tcp_init_metrics(sk);
=20
diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index a7f9242f1e42..579a88472abf 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -1740,6 +1740,7 @@ struct sock *tcp_v4_syn_recv_sock(const struct sock *=
sk, struct sk_buff *skb,
=20
 	tcp_ca_openreq_child(newsk, dst);
=20
+	tcp_mtup_init(newsk);
 	tcp_sync_mss(newsk, dst4_mtu(dst));
 	newtp->advmss =3D tcp_mss_clamp(tcp_sk(sk), tcp_dst_advmss(dst));
=20
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index e006a30360ea..c465fd97baec 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -1489,6 +1489,7 @@ static struct sock *tcp_v6_syn_recv_sock(const struct=
 sock *sk, struct sk_buff *
=20
 	tcp_ca_openreq_child(newsk, dst);
=20
+	tcp_mtup_init(newsk);
 	tcp_sync_mss(newsk, dst6_mtu(dst));
 	newtp->advmss =3D tcp_mss_clamp(tcp_sk(sk), tcp_dst_advmss(dst));
=20
---8<---

