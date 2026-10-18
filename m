Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9908829ACC6
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792284748; cv=none; b=MsEVssWzv4zRJOujKFVAEqmE0FwnEK+3I8fJ5wuZpSY0UsHOnQUj7IDn4s+CcrpxlofmjyzviqBxc38bWFEnH+vd1bmK6PMwiX2pP05EEHOPL2AU1DrmD8+Iy9hqMIjvSWz93HwktXLgAThKErko8KTaX+FmnS4qJ6xaQCr2Fbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792284748; c=relaxed/simple;
	bh=ah13Vm6hJuN3cXWZju+dpXUkIv3aBCcDpzpa48LRO2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MyBAoGEl6dqu4JfjpRueZvPJLrKrVAfyeb9W3Wea7xvbS4UkafOXGkQdfMpLGYaDkIrQtvT45jIjaVJSNxxnnJgFfN0ZQRbp22gDk4PFXOTaKR/DtZHT3KEJwNx3VlXks1YT03Z8r5WTZOy0YdU4R3B9QeockTrebSiyrNlXRYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGjJx0Qg; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGjJx0Qg"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a05da1cc1fso109124b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792284747; x=1792889547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXX7xoGM3IbUcxsHLOmSjTE1gzsSPDLKJJL1mCpcc70=;
        b=NGjJx0QgvNwicysgOEKq1AS3iPd9sJXN056m+a8t0GRRK3gI7X7t+NUn6RAtgTXxmZ
         28HFYJmJ8RH9XU8m8OTz3hKldSPJ1ntOZrgaCpMIWn5ONff5FalurBEuhwxSwd09vCff
         iekRhHgf5otgkvTurlz+lNpZOONGxcqJ2fZS4cvzmY7PbwFu0vMqizGlqrVG6Q8JqGvI
         gDBhKz0X7N5KJaP/1OEmdk2aVLX1EfIW0p/iANGm/ULfZlCYIRtMmL4X7mXW6Jjy3Ptk
         mqfUKLTFQ1/ccdnzbez8/X2NSw/NNubcctebNMNrH6D2SeVVxtplinS7Ccn3UsgX9WM7
         XFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792284747; x=1792889547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXX7xoGM3IbUcxsHLOmSjTE1gzsSPDLKJJL1mCpcc70=;
        b=UhYAYD+xloTwKRsVWCT75hVBH4x/l6tt1fqJEGZuV0Ash1kP3fOyV42Ee+ub2fWQEz
         a+OV5P6OjwV/aiX2lrUO5O3WW7r//phTQGYG9+81hLOlWZ/sS3NiuJ2ZqD81Gkh/otcf
         rzeI5Gdq2Bglt2Bln0J8BnVebSJftJgIc3fONtX2HDQ0L0/KjZBwlyWIR6NL8tOUDbcq
         /eq8kIhNk3bIMTavmbzvjGpj7zXqo2pSgIy55tTEA16uhjhZ3OvdNsUcSF9c4uHU9oVd
         kGn6xAyma8i+Ig9UOO/ONFfw/kG+IETcreUlrK4R2ZVAoaC1olPs1ygwpaB09nxqzXK6
         1/Ng==
X-Forwarded-Encrypted: i=1; AKwUvBzqMfeN+irqMlGIkJ/VS3FsFqFrQV+9EQ4eJywviaDqGexTIxQIWbMMlDHKklsnIEBOz/I7F59S3wcv88M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJc+4lWHWVNv7rhFX1+32l4xJTplKM4e+1BzwKhiu8S4IWPjy9l
	R+syNv4tK+E5VAP1SbZaLb8+9Dv/P58a/VgrQDQoH2XXtfd4kq8oUPCa
X-Gm-Gg: AYBFou0qq4OX5BxpMlPq2NqFKddiw6Gcl5hr4gU5SfMR2Fa1ikm8XYwdHMRMyM0Ow8p
	be9kb44bqfREw1gslmWHOKMlPg5fkOeqX2ES/jHzqz7F1E7tzLGy84R8v9iBcu6ZXgq8vRmBrbe
	tL6qIsjcpIRGEyC4Y4KWagBuX7oMhjtqgphobBgz0Z8QAsvmnrar71tZ6+FPEf0pORfEQ0dm9jI
	kKrI2heQ4YJjkrRkBtokY6Q0942VBlAt3NCiVj6yCi3F0xCAD8bM8lf0vzD+GBtVi4bqA+in9Cz
	/2d6tegZS7DiYshuTeDguXAkzPS4BDCAocCqJ3BJalrCH/JHU/DYrKEFt2Rd6xDGUDtSQ1vKRI9
	KBc0v59eaCBVvmlXfGztAo7JoIm6E/nXojMupDTYqQQhc2aiM9zNUovDq2yeoStnbSvLAXZgGTm
	R+lYh5xpmWYBDLevzbBRAAvh2Gfh9feBhoJrGjtnMc72Dr7tKGXtwc3R+kVWrfZZrwWuv/TSQdI
	WF/8dBGcMHAoOk2YIHN+NorQX9egHuB7tvrw9Z/MvCf6IE/OzGmyFc=
X-Received: by 2002:a05:6a00:2788:b0:880:cb86:fce with SMTP id d2e1a72fcca58-8a04cb29417mr2958012b3a.54.1792284746805;
        Sat, 17 Oct 2026 17:52:26 -0700 (PDT)
Received: from yangguouaideMBP.lan (1-162-28-193.dynamic-ip.hinet.net. [1.162.28.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58208cc3sm2588891b3a.52.2026.10.17.17.52.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 17 Oct 2026 17:52:26 -0700 (PDT)
From: Guoshuai Yang <yangguoshuai@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sabrina Dubroca <sd@queasysnail.net>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Guoshuai Yang <yangguoshuai@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH ipsec] xfrm: esp: reset outer TCP GSO metadata on espintcp input
Date: Sun, 18 Oct 2026 08:52:18 +0800
Message-ID: <20261018005218.53267-1-yangguoshuai@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When ESP packets are received over TCP (RFC 8229 espintcp), strparser
slices individual length-prefixed ESP records from the outer TCP stream by
cloning the incoming TCP skb(s) in __strp_recv().

If the outer TCP skb was GRO-coalesced before reaching strparser, its
skb_shinfo carries the outer TCP stream's GSO metadata (gso_size, gso_segs,
and gso_type). When an ESP record spans two outer TCP segments, strparser
chains the spillover clone onto skb_shinfo(head)->frag_list.

Subsequently in esp_input() and esp6_input(), skb_cow_data() unshares the
head skb via pskb_expand_head() (preserving the outer TCP gso_size and
gso_type in the new private skb_shinfo) and calls skb_copy() on the cloned
frag_list member, producing a linear frag_list child skb allocated from
slab with head_frag == 0.

After ESP decryption and header removal, the resulting single inner packet
still has skb_is_gso(skb) == true with the stale outer TCP gso_size, while
skb_headlen(head_skb) is now smaller than that gso_size due to stripping
the outer framing and ESP header. When this packet passes through
gro_cells_receive() (which flushes frag_list packets via GRO_NORMAL
without resetting gso_size) and is forwarded, validate_xmit_skb() invokes
tcp_gso_segment() -> skb_segment(). Because head_skb is shorter than the
stale gso_size and SKB_GSO_DODGY is not set, skb_segment() attempts to map
the slab-backed frag_list member as a scatter-gather page fragment and hits
BUG_ON(!list_skb->head_frag):

  Internal error: Oops - undefined instruction: 0 [#1] SMP ARM
  PC is at skb_segment+0x574/0xd20
  LR is at skb_segment+0x884/0xd20
  Call trace:
   skb_segment from tcp_gso_segment
   tcp_gso_segment from inet_gso_segment
   inet_gso_segment from skb_mac_gso_segment
   skb_mac_gso_segment from __skb_gso_segment
   __skb_gso_segment from validate_xmit_skb
   validate_xmit_skb from __dev_queue_xmit
   __dev_queue_xmit from ip_finish_output2
   ip_finish_output2 from ip_output
   ip_output from ip_sublist_rcv_finish
   ip_sublist_rcv_finish from ip_sublist_rcv
   ip_sublist_rcv from ip_list_rcv
   ip_list_rcv from __netif_receive_skb_list_core
   __netif_receive_skb_list_core from __netif_receive_skb_list
   __netif_receive_skb_list from gro_normal_list
   gro_normal_list from gro_cell_poll

Even when an ESP record does not have a frag_list, leaving the stale outer
TCP gso_size on the decrypted inner skb prevents dev_gro_receive() from
initializing gso_size to the inner packet's skb_gro_len().

We cannot reset GSO state earlier in espintcp_rcv() / handle_esp() because
the skb is still a clone sharing skb_shinfo with the outer TCP skb held by
strparser. Instead, call skb_gso_reset(skb) at skip_cow in esp_input() and
esp6_input(), where the skb is guaranteed to be uncloned and its
skb_shinfo is private.

Fixes: e27cca96cd68 ("xfrm: add espintcp (RFC 8229)")
Cc: stable@vger.kernel.org
Signed-off-by: Guoshuai Yang <yangguoshuai@gmail.com>
---
 net/ipv4/esp4.c | 3 +++
 net/ipv6/esp6.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/net/ipv4/esp4.c b/net/ipv4/esp4.c
index e76db58..416638c 100644
--- a/net/ipv4/esp4.c
+++ b/net/ipv4/esp4.c
@@ -900,6 +900,9 @@ static int esp_input(struct xfrm_state *x, struct sk_buff *skb)
 	nfrags = err;
 
 skip_cow:
+	if (x->encap && x->encap->encap_type == TCP_ENCAP_ESPINTCP)
+		skb_gso_reset(skb);
+
 	err = -ENOMEM;
 	tmp = esp_alloc_tmp(aead, nfrags, seqhilen);
 	if (!tmp)
diff --git a/net/ipv6/esp6.c b/net/ipv6/esp6.c
index b1c9b36..02cfc85 100644
--- a/net/ipv6/esp6.c
+++ b/net/ipv6/esp6.c
@@ -943,6 +943,9 @@ static int esp6_input(struct xfrm_state *x, struct sk_buff *skb)
 	}
 
 skip_cow:
+	if (x->encap && x->encap->encap_type == TCP_ENCAP_ESPINTCP)
+		skb_gso_reset(skb);
+
 	ret = -ENOMEM;
 	tmp = esp_alloc_tmp(aead, nfrags, seqhilen);
 	if (!tmp)
-- 
2.54.0 (Apple Git-157)

