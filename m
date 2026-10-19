Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792451296;
	b=2ATfeHeMbePrGjizwvns1ucttGJhP9MtOXnFXPqDcJghjDZYZBa04zzTK/a9+jBlvZVb
	 0B6eD7MAKH4fk3YxfWOsKSSy9vs4NeyUN0H/XB3FtyAM1xAKpi7++NVY+SSs7ECW53b3b
	 pWWeTpsPZriKuZ0Bt2tWmSzyTpLzm6/fSnAdV1oX6Zo+FFVazZDAWcBSAGQpW9rLCwUtf
	 HpE8WxS7F2GI3BCamFCJlWa0sfIjHpZm51MuY1SYrkogodvg3f14PM4IAX1Fe2UlImoGx
	 4jrCUHXZzqpYsMoM7bYSUqWQkKxY/wq7Nf4V9Mk3wm/qKLPvWBBQHlAB/WLV0FzPb+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792451296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+PtAsIRbau25qBKYDkRQgKy/IsvMiPdbk5+WMW7RL5M=;
	b=ei4UBryU92RR0e4PlQmf2JX69xVa/EMnxVuWLwrNSu+vgcNpZS4yXkowcOs/SfpRWurE
	 59v+v6H763Ea54XtX9RPEekTsqCmYL6BS2i5qv9VhkaZC3wRHJr9ZugerYkRQ+WZVN3W3
	 zhk/nDwHc/HstvRsIzYm9lT5RLzKp+3F4X0v9Kxhei4ICVLgoie8h5inYbkXLrdiJ8kNN
	 w77NPab1FAtz02AAAEe261RoO3h9r0xNIyvUQPqMUb3fRY5HGVBWDHFF40gc62SHJI8dE
	 SBXvMzjrA1kuoCmxNVzgRHSMRj1HwMACGKHq+x7YnKcvjuSZdv5rgTwvCDyJigul3xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--joshdon.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=CHsdIqTf;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE68A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE68A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joshdon.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=CHsdIqTf
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so7236064eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792451295; x=1793056095; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+PtAsIRbau25qBKYDkRQgKy/IsvMiPdbk5+WMW7RL5M=;
        b=CHsdIqTfH9k2/oPDg2BvKrKDQRc5i9Sw21tVz1mW9yNtzIKEJ4/uDLs/HOKIexcUS2
         6LPHoEjjfJIZjCCHdrK+v2/vIC/Ys8dVPhZZTz677a2bLk850+eBUcxcBFBUby2mRdvK
         Z7TujMxJUTRs8conMmmlQYokjWSjYw+KA7hC0yjYobBPccV4XDAVT2YKfUg5m3kWDglv
         rJWu7i4RuLLYxneA/KxlwJ+UsZ+s5AUhUiBNBKOHu7nE0PUZPW9lk8X5QzID9Duxv7nF
         U0h3k55bE34Fejwb7b6IvsQf+s3mMDzTbiIwsY0xTtswHhomn6x4hy+m5KMlOm02NKIy
         UfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792451295; x=1793056095;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PtAsIRbau25qBKYDkRQgKy/IsvMiPdbk5+WMW7RL5M=;
        b=b40VnmhEA8e2tHW4kpJdVdDS9+lpSP42UpFYxNz27LrjBHPyPUMSnoULFdkOB0ymSP
         A3iDCr8dYDcP6Rd3bTefozhp60s1xHt1lWdWVzzCFLPg8vSqUsPoxEE9ybMKk9PJSkLe
         wEuxYsk3IdDQ1W3cNXEnmMeNg2OAZCSw5aZ9I0ozGile7uPG4mGPwILOAThLoJ4YCid8
         RkacclNjCrHkHux/dKG2bckGh+ePgEHnawhTDFQUTtidt4e8fvKgGfm+JstrhRKG02iq
         71IMrYl5t+9bgBk/u4S+vcdDb+8XvVIDAgSqfkeM9JsZceqcapfEMTJn9B5toCGvtq8x
         H9ow==
X-Forwarded-Encrypted: i=1; AKwUvBxvvUcRUegSwFoGbIsXEo/dpaKoHt/3lF9chJqyTrfnonWIx5VSBoLUU9hK4Wb9dSEUHTPNcCx72HAOx48=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxgB/ZjgG1pLf4GuOKICk2K3+GcCezFFowzitZZfI3dbwPFT71
	qjD9bb9WgJvqfPy20RHry+zxpnyap8mbemGaqP0u4Rabu3BPp8jyF6nyRF2i79U03MtoVm1GbDJ
	0SGPNV/rpNQ==
X-Received: from dybmw16.prod.google.com ([2002:a05:7300:cd90:b0:358:1869:85c7])
 (user=joshdon job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:fd82:b0:35f:f0:8edf
 with SMTP id 5a478bee46e88-361a126b111mr12745955eec.13.1792451294318; Mon, 19
 Oct 2026 16:08:14 -0700 (PDT)
Date: Mon, 19 Oct 2026 23:07:58 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261019230758.2960779-1-joshdon@google.com>
Subject: [PATCH] udp: Add noinline_for_tracing annotation for udp{,_v6}_send_skb()
From: Josh Don <joshdon@google.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Josh Don <joshdon@google.com>
Content-Type: text/plain; charset="UTF-8"

We hook udp_send_skb() and udp_v6_send_skb() using BPF fentry programs
to monitor UDP transmits. Both functions are static and have two
callers: udp{,v6}_sendmsg() and udp{,_v6}_push_pending_frames().

After an FDO profile update, udp_v6_send_skb() is now inlined into
udpv6_sendmsg(), while an out-of-line copy remains for
udp_v6_push_pending_frames(). The fentry program still attaches
successfully, but it is silently bypassed for all uncorked sends.

To address this, make both functions noinline explicitly for tracing,
as was done for tcp_drop_reason() in commit dbd5e2e79ed8 ("net: tcp:
Add noinline_for_tracing annotation for tcp_drop_reason()").

Assisted-by: LLM
Signed-off-by: Josh Don <joshdon@google.com>
---
 net/ipv4/udp.c | 4 ++--
 net/ipv6/udp.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index b090bd1f59e86..487c8cc8ab206 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -1110,8 +1110,8 @@ void udp_set_csum(bool nocheck, struct sk_buff *skb,
 }
 EXPORT_SYMBOL(udp_set_csum);
 
-static int udp_send_skb(struct sk_buff *skb, struct flowi4 *fl4,
-			struct inet_cork *cork)
+noinline_for_tracing static int
+udp_send_skb(struct sk_buff *skb, struct flowi4 *fl4, struct inet_cork *cork)
 {
 	struct sock *sk = skb->sk;
 	int offset, len, datalen;
diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
index 93478d1ad5769..fe92538835176 100644
--- a/net/ipv6/udp.c
+++ b/net/ipv6/udp.c
@@ -1366,8 +1366,8 @@ static void udp6_hwcsum_outgoing(struct sock *sk, struct sk_buff *skb,
  *	Sending
  */
 
-static int udp_v6_send_skb(struct sk_buff *skb, struct flowi6 *fl6,
-			   struct inet_cork *cork)
+noinline_for_tracing static int
+udp_v6_send_skb(struct sk_buff *skb, struct flowi6 *fl6, struct inet_cork *cork)
 {
 	struct sock *sk = skb->sk;
 	int offset, len, datalen;
-- 
2.56.0.212.g129ede20d9-goog

