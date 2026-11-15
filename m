Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703209;
	b=EfT5QV1zUFnt0NVbpNBT++QTLG4NxoFp/KLRmaDa/SOKhSEOHNgGFconQ+OU1pHZGK+q
	 mmbY/Izs1vVvgexlIJ1xlcWfaUAZHaJBGjDMcXNkewugdLxO7/fMZxlsJLoGPc5cqzEhJ
	 +69i8S2h2MD8CHu5riydrQ2kT6AWZoI4Ktpp5zrgbqAGqPV9S/fzpeC+iOmR9XoMkYETR
	 o8dtgVsPdSNjfXi3ajb2jCqKUnpO459OcHMTOZAYqsfUrSogvX1nZCRFZR2AoryCEtO4f
	 EmLt2hiwxdSynT3cHwO/UKfDjdlUoBiKC1y0aXkS+/WT8XrtSy3ltzXdqpDHYxDj7vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=UgDDWaqaaS/aiO86WDODrYk/EL2uW+1mnI6To16WgSk=;
	b=ySDopuROuBfYDW//dSvPyrRCjoOuRlk51dKYRDaZoHEsk02aoUovpikgs0fCsQwm6owN
	 IZ/c9xHlXIs06+OdC1x3fqFrZ1zJLwyIhUkC+u7iMtV3CJowXgNgC8Kt7VqT0Pbxd8dA2
	 AnOdE91L+iVBV5F5P3FBuRGvASYO5lW19ZHJU+9M+fMp2acdf8PhQEja8LVXShjiNUOOD
	 gkI7CvGcv8Eni9kzjCYjw/aBAfyosKHXRwPuRN52ciKFTBVL0KtT0lryz4i4dznpzMa4t
	 IlH6nUTqe3vvcVY+xI46/u2+rxf4yne/n0EGo/KY1nN42b8p1VSow818w5+/vrDyxgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q+FuumOG;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97759606A334
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97759606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q+FuumOG
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b45597c7so5117135c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794703207; x=1795308007; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgDDWaqaaS/aiO86WDODrYk/EL2uW+1mnI6To16WgSk=;
        b=Q+FuumOGIxeLSmXWXt3zAZM3NE8DXetRicg3BZZ3uxe/rw4g9OMn//8ussnzJp+/l+
         sE7VLAThwrDIpmLp/nq219EUXCTbnbaaqii64Lz9dNwN9J6T0z26XFoM92WJP7dA577M
         ZqzyOHU1tkrF7OorCfu4L5I37Wv+8Fmejf2if1V21YnTRSCBygpt+ncZxIIn+NISB0dF
         OtZrYzXzAXGSH3aLp24hNzrGXCK0qxZBLcg01B9q9mYW2CUmOig2Lbng9UkLe0pK+Qzi
         dRGxGYfjNUChynNl/ze2JDFMU4dSwcStnKBBrdGa1M5IVdulEWsxCYu2GCC29IF6y1ZW
         Sn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794703207; x=1795308007;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgDDWaqaaS/aiO86WDODrYk/EL2uW+1mnI6To16WgSk=;
        b=qdIhUa99o7PWYXQCFC/DWHs3e+/KIqWfHw7QCxV4DcK38xi7tISqjOrd3JyIw67kg0
         quQoBsVQIPd6oVSsqKIrvGvqvO1vJNtE2E2VKCMdvijRtl5/tys0+My/lf1Kcm4OZZud
         zovdTsNOr2XOwwxou+qTMUcjdP+ktjjc7egksxduRoD+Vq9TuUP69s3p2hDMMFyW/h3/
         RcuvG1bab67SHmDs2O3dNfRNiXx2OgtFwJYnCMjM4uG2SCOf5Dm8Hiz3sNNkpu6eI4Vh
         yht3GQcPXsFdOwU71rUqCR4nPzFs4IxNCeG0hu5ELmHNm6PefY59lpNrQ7Tgm5gXdeYF
         cKHQ==
X-Forwarded-Encrypted: i=1; AL+hErGruPFaa/9JM/eow6TTzIOJ13uL8cKeMGTsVzbZjCucZ/ytUCxcWHCR5oepP4RbGA5s897o7jZfjXCzHp4=@vger.kernel.org
X-Gm-Message-State: APuU4Z86Sfv0n/B/AR0JLF1L11r69d54v7efEVD1MnkxYojvZ843oQy6
	0h6XNiqlusmqJIixuYAdlQUHn8ntQUjQrelaUhnkUYRpDb1iKNLFt85O/qu8rKdsQiA+eaHfdel
	0L70msgRy9PVDWE15EEOaooNULQ==
X-Received: from dlbsw4.prod.google.com ([2002:a05:7022:3a84:b0:1af:74c2:e2b])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2706:b0:1b5:126c:eb88 with SMTP id a92af1059eb24-1b5126cec12mr3641935c88.45.1794703207011;
 Sat, 14 Nov 2026 16:40:07 -0800 (PST)
Date: Sun, 15 Nov 2026 00:40:03 +0000
In-Reply-To: <20261115004003.3695475-1-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261115004003.3695475-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115004003.3695475-4-almasrymina@google.com>
Subject: [PATCH net-next v5 3/3] tcp: propagate skb_zcopy() uarg in tcp_mtu_probe()
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Pavel Begunkov <asml.silence@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"

tcp_clone_payload() takes references on source skb fragments when
building an MTU probe skb, but never attaches the source skb's zerocopy
ubuf_info (uarg) to the probe skb. When tcp_mtu_probe() subsequently
frees fully consumed source skbs via tcp_eat_one_skb(), skb_release_data()
drops their uarg references and can deliver the zerocopy completion to
userspace while the unacknowledged probe skb still references the user
buffers.

Additionally, tcp_can_coalesce_send_queue_head() only checks
skb_pure_zcopy_same() (which compares SKBFL_PURE_ZEROCOPY), allowing
adjacent zerocopy skbs with different uargs (or a mixed-zerocopy skb and
a non-zerocopy skb) to be coalesced into a single probe skb that can
only hold one destructor_arg.

Reject coalescing across different skb_zcopy() uargs in
tcp_can_coalesce_send_queue_head() and propagate the uarg to the probe
skb via skb_zcopy_set() in tcp_clone_payload().

This is a pre-existing issue found by manual code inspection and LLM
review; it was not triggered in production. Verified with the net_core
KUnit test suite; not tested on real hardware.

Fixes: 736013292e3c ("tcp: let tcp_mtu_probe() build headless packets")
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/ipv4/tcp_output.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 19059d03152e..bedf828cc0e0 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -2664,7 +2664,9 @@ static bool tcp_can_coalesce_send_queue_head(struct sock *sk, int len)
 		if (len <= skb->len)
 			break;
 
-		if (tcp_has_tx_tstamp(skb) || !tcp_skb_can_collapse(skb, next))
+		if (tcp_has_tx_tstamp(skb) ||
+		    !tcp_skb_can_collapse(skb, next) ||
+		    skb_zcopy(skb) != skb_zcopy(next))
 			return false;
 
 		len -= skb->len;
@@ -2718,6 +2720,7 @@ static int tcp_clone_payload(struct sock *sk, struct sk_buff *to,
 	WARN_ON_ONCE(len != probe_size);
 	for (i = 0; i < nr_frags; i++)
 		skb_frag_ref(to, i);
+	skb_zcopy_set(to, skb_zcopy(tcp_send_head(sk)), NULL);
 
 	skb_shinfo(to)->nr_frags = nr_frags;
 	to->truesize += probe_size;
-- 
2.56.0.611.g1030f0b940-goog

