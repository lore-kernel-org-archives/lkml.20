Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793155843;
	b=qmklg9tsjnqHSLpjD/RbYLco6khhRi0gJRh2AHaoMU9Ihy8ecLwZ412LsnDU2bSTHV6E
	 EN1gqN2R0uFJvDxZkP/tk5wAORhOT1W8m5vNCMJPY6swNzhuwRdsMBmZeUCQ+PhHMvMOu
	 JW159sSIcn5hGqaczQQWRILUJr2iYqG42mCc0Chxe9MWeljeKrcld3opcPdzWt/cK8aAp
	 4Slqtpudf2axuJKBxJp+BYH6iacIHwLZrYFFce3r8OcE3Rf1h683FeA4Fk8wojtB9XFqc
	 D5cIKK5EF60USNMEs3cfAynASBJs7WlMrd+859YmescvZ/q70DG/p8o4R8QXDJUoS7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SIKkfA67UvQRqidJv7Hfli6cr7/y7nUfM2Bx1BgiLkE=;
	b=NEAZrVos603x1KYupKvXaqTtKwfl+TkaWum5MWGl5Fri3vTfuC2FttbtedQwmNHM78y7
	 ddr9rrh1YAzihWiZB+LoPrtJI9sbKK+UlHSxeF8QzlUdbFSU0e4xhLdQN2vIvyZHQDfKm
	 sUVVPG6aJAlVQ4iVPngFkhP1izzJrLbVhSF45ECTabU10BYwR+Pyb4ygxvRR/3y0AiQ2x
	 0MAHGRdFTg//uI929+8dect6K0YkpGIfnrc8EH8njfGB5R2DIbAFVZaPPqX/n+jLhmjv3
	 mWlUIXjDoGhjiRi6B/7HlSviBxR/u5Yo9g8jC5biV0uwPBnHxg1j0rB7O2gIN3VQkwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIxGQVuC;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C812A606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C812A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIxGQVuC
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2e61817b178so1441365ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793155842; x=1793760642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIKkfA67UvQRqidJv7Hfli6cr7/y7nUfM2Bx1BgiLkE=;
        b=sIxGQVuCcRBJM4Y9dM+uPj1MqVYGHELdrlvbHCe9zroN36ORPXLLIpUOw1Y6USdWW6
         7ef1iCd9EeBB9i4GBNCqUBO7kig/5+eAom4R2U2fo1nCFMDbzDqNlVamlytn9yhKL1GU
         RuSCEC78ZTuhxP0oIx1itKjzAX43wQXc4JJ2uFJUXQBy/kNfGdzUPitJ3+XEamRRz39h
         VElrB6cmCShWH9Ye/+8+MSZ1V5L/dOAjvzwjyMmk0TUqbDEsTAEobny4s4FEoWzyZZc/
         RLFqY/AlU62Pu+5gGGZv0DS5CwCRjKulSHKlzlLuts/4LH0iMOUeyGZ8+8jAxm2hsAbC
         ExLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793155842; x=1793760642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIKkfA67UvQRqidJv7Hfli6cr7/y7nUfM2Bx1BgiLkE=;
        b=J2OLi0gxhj8cnJ5tWf53da4qgkNnmMJ15tL6d9E4yyiQZ/PG9FMDkwlCrKcJGf7Zkp
         LO38qa9+qLpNchVMbNFKlhj6iepe98N3sRw5BdQvopRNeGp1JkC6MMGDYgJ8+3kU9pab
         ccLdYihx4SwJekYV6+/vRWgKaHx8XUGLErcZFiwIbgnBk3jmUJ+NL6i1jNSei1VBMar4
         ewl16hz7NNfbz497iiluun5MfoXc8ocqCIf4fiLSy+GlVkzUdpyRx36wXoXsjQvL60/M
         RiQsLAefzdf8RKuqGPTwk6VuNBnTnuwsYLvnm7yxU45OVv+ps7bEsO6j3SUYsvFSgJ8B
         AwMw==
X-Forwarded-Encrypted: i=1; AKwUvBywXuAQwrQH0Ha+/0N01eS5DaST5cK2fEAMZ4Xofs68ug5tQe9wCPzozH+nuwSbDmWXzZCosgtm0uqbkLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO+FxDpGYi24k+fyLUIK3Piy3GZ7GoRKVxmlnINnXsbwYO+Q2A
	ZB9tYxF9tWAdyhemw+/VAjQFSwmAa5l7Md0p1ZG0IvH+J1MxAYIoszTj
X-Gm-Gg: AYBFou3aM5xpLULDjHog80PDSuCDuR1mEER5vHZw13HMfzGyZpQ9QNNPmg+a09axhnY
	FsmwGgmSJ7cb5A/vH2yASWUFIDwhug9zQ63EAkNazCO8G0KYyEQruSL66mYEm8nwOROMZQg3VZL
	ZR+FN8Au4vJzgAUcpRla0C4JPgzN2fDWG6JGtviFEEtatmC06qnRNy6p/zaHcfNk0I4SkMq9G7U
	TYdtxdrN5he9B8/ggflgADdxvFlEwMt2jEpMF5N+zYSa+UUUynINaOW1CpOq6n8A+EP0OG8bBhv
	KyoV0NgeWuATmtgLrtmregcc/1CD7hpdPGf5knDybWzmxLJECm7UVD2D4bKWEPKUJNcb4tVsxlI
	sRuE/4wbNkGxqrp1wj7M3nPRKk2iTRRABsUlPzJX4UvoEQ5/ALpGJrDH32P80ynpLbvEqooFmyY
	/tj4wqOS4FxlVE+kYvWHa4TrqbiMAGtume51uSPRuT2HN6SuqygynTnMqwwd9aDnMn9m7MjgDs+
	6wsQtbXlUaCEg/5s3RMna+jEfsORGd6B8hqj0DCZ1R7UOWX37+GLknKOp7/RFsZqSixJJuBBBMI
	59xwqhUEU4tyDPf9Sf5jPyPWV05DHA9lewlQ89cHqlki38MsMbXFJcpECwK71vk=
X-Received: by 2002:a17:90b:280b:b0:3ac:7c52:faeb with SMTP id 98e67ed59e1d1-3ae580df868mr793396a91.41.1793155842143;
        Tue, 27 Oct 2026 19:50:42 -0700 (PDT)
Received: from localhost.localdomain ([240e:46d:1d00:2b84:48c6:402f:d1c5:644a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d64c0bsm812447a91.1.2026.10.27.19.50.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:50:41 -0700 (PDT)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: netdev@vger.kernel.org
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Stanislav Fomichev <sdf@google.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	stable@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rongzheng Wang <testwrzwrz@gmail.com>
Subject: [PATCH net v3 1/2] xsk: defer software checksum until the skb is complete
Date: Wed, 28 Oct 2026 10:50:25 +0800
Message-Id: <20261028025026.11401-2-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028025026.11401-1-testwrzwrz@gmail.com>
References: <20261028025026.11401-1-testwrzwrz@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When XDP_UMEM_TX_SW_CSUM is used with multi-buffer TX, xsk_skb_metadata()
calls skb_checksum_help() while only the first descriptor has been added to
the skb. The checksum therefore covers just the first fragment, and
skb_checksum_help() sets ip_summed to CHECKSUM_NONE, so the remaining
fragments are never included in the checksum.

Move the software checksum calculation to the point where the last
descriptor has been added to the skb.

On a checksum failure the packet is now dropped instead of being returned
to the application for a retry. This path is not reachable with the
existing metadata validation, but the behavior change is intentional.

Fixes: 11614723af26 ("xsk: Add option to calculate TX checksum in SW")
Cc: stable@vger.kernel.org
Signed-off-by: Rongzheng Wang <testwrzwrz@gmail.com>
---
 net/xdp/xsk.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 33475b180ea6..aa6b010192ad 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -1011,14 +1011,6 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
 		skb->csum_start = hr + csum_start;
 		skb->csum_offset = csum_offset;
 		skb->ip_summed = CHECKSUM_PARTIAL;
-
-		if (unlikely(pool->tx_sw_csum)) {
-			int err;
-
-			err = skb_checksum_help(skb);
-			if (err)
-				return err;
-		}
 	}
 
 	if (flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
@@ -1030,6 +1022,15 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
 	return 0;
 }
 
+static int xsk_skb_sw_csum(struct sk_buff *skb, struct xsk_buff_pool *pool)
+{
+	if (unlikely(pool->tx_sw_csum &&
+		     skb->ip_summed == CHECKSUM_PARTIAL))
+		return skb_checksum_help(skb);
+
+	return 0;
+}
+
 static struct sk_buff *xsk_build_skb_zerocopy(struct xdp_sock *xs,
 					      struct xdp_desc *desc)
 {
@@ -1275,6 +1276,12 @@ static int __xsk_generic_xmit(struct sock *sk)
 		if (xp_mb_desc(&desc)) {
 			xs->skb = skb;
 			continue;
+		} else {
+			err = xsk_skb_sw_csum(skb, xs->pool);
+			if (unlikely(err)) {
+				xsk_drop_skb(skb);
+				goto out;
+			}
 		}
 
 		err = __dev_direct_xmit(skb, xs->queue_id);
-- 
2.39.5 (Apple Git-154)

