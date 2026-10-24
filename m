Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792851133;
	b=elwzGauAo08b27deQdlpW5lGXmeMYT/75LEifZac0a3yUx1JNFPGcIwWVmVX6ROz0mgH
	 WPj37wa06Z2tIcntLK7DmLU3Izd2/LuMv1OcKlkrHw8FUGtogiEq/HtbMUmq04bD/uCEG
	 wC3ckZkaLwoan83m+aYXZwa7fAW6lNLzdGQumF1RpkWKd6WKXrDrhx5t6aEusxrhT6opN
	 rF+fSaOLgUZE4Y04CSscFKQ/KuoKjqdpQwQ1mbKTq21MAsy6/zXETF6m//7UREyIG57y7
	 kh0R4IsLi8jpxavG5uYRf2U9XVXKv0Beqx55LnMdmomPvKDycrdAUxfuuevA4zvkfEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792851133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fekl11tBwawdd/BmEQbPpvlBnrXS8QII5cBTf8ZjO9g=;
	b=4XR6yUC7Q2OxGX0ztJcVOZqflCRkE+HS6a3klP5BIzbTNM0T1qxARRvQu3eAdoteeQaP
	 V7Bamlx7owae8wLiu+1TQn2hfPkUP3j7J/pf7eBDYEwyWMPyeHDxFahv4bPfmwbJJTBU1
	 Hb2UiaYb/b+hvSe2uiq50SP+LF8c4ExoM3xqfe4i83juivUYfJCGlurmu+tbnlDBD/fJX
	 idsHtyjZO0l7F6x6ezwvoSeHZ/OJqxs4TY9XTKDJUbtEcqXO8HJ4yoN77DEkW+m1URzM6
	 al7VgXaLGcP6/kWibqiYuelibwczbvEc/L48j2BYCkm6qjZdFgEuK8utsF699KV4xOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CbMAjeUv;
	arc=none smtp.remote-ip=74.125.229.139
Received: from mail-dl2-f11.google.com (mail-dl2-f11.google.com [74.125.229.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12A4606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E12A4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CbMAjeUv
Received: by mail-dl2-f11.google.com with SMTP id a92af1059eb24-149f2b3f25dso435515c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792851132; x=1793455932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fekl11tBwawdd/BmEQbPpvlBnrXS8QII5cBTf8ZjO9g=;
        b=CbMAjeUv8mLxRWlFV3E81UbgTZC/jPRqfKMSb6jhRfex2aBdmTAqRLEADWP61n12tf
         P082awDR5IZxWNfJAPPof3lxgpl10HTNo8IKj4IbXk2fj0J0Hiq/e9Vy1huFiFyB+dqH
         vOiaO0StoX6zqsY4SuDSS03YH1oWl//uORRTSVpNu9bF+qMdG+VNt5a9yeXXADklvCxq
         wJY0xTx/ShXmoVz62NNJeKhpqEsENC2naa74MKxm20zXGdZ6tb9JlCFV6u4tYMcZ+XlZ
         bwXWUBAoqejzLvln4pbXSQVNdS0Ju6Jo66ZebS4M3TZSwNgmRKt6qGTQ88iQo7IRgFuM
         HGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792851132; x=1793455932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fekl11tBwawdd/BmEQbPpvlBnrXS8QII5cBTf8ZjO9g=;
        b=AR54XvEelJqJdngyJQZTGt8AtMVs0OskLJvXq5dcQR4XC9bD7nNGMhWt4TdZhul/dO
         2kox39rUPxmSGVj1guzzW3Uuz2GArJLGSoPQj6SjLFSsptCvRiPgaOWKHTkZ+p1dhEpM
         yLgnhrhwpuJE19e2ruPmKHcaxD255R+Zp2k8CEf4nmMyRKPSqpW24grQWG6QGpaCpPER
         MIdH0Mk9XtX79l/ugd4re72Uma2vFBD2xzQhhxdQCrMh1+EpxJxWl/C2x+QhEnq4q0jp
         vKlWwEpR8wDfSMQ9LEbfnErV6J3f/Xsgt1RdFjI9f/iDhjfb6znrSRy4CtXQZhSQS0Ht
         NpRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGlLHnmJHodSLfb0cwDX69UQsypt8tVKB1qLWTNNsADyA9DP2WvEQqBvQqqBd174v2dngXMGZwMiwmRC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDtDL9a5Q0SehprUKrEOWnRLltrWzMp8+qLAAIsf/WeH4U5o3a
	1r5YaXxcSBB0+D/RXAbksKRXJ+yIGt4PHasw3Ij1oZ9Yx1x1ydj0GFX6
X-Gm-Gg: AYBFou3OKeILNDPztHD499PvC/OFPV2QCUSKgjmwt0Lwj5ez+jXq6fR1FJs/z8Kd7xC
	tPNPdSX6kUrQVCnds2lbRB1cWZPYZngN3H/W9P2G67W9tQDaRZV5+K6sfGOpqH9SGStkijrd+SM
	Zm1PIYrIvYY2sk5pn5xJtiJLsXUDzU8I82W0I6AO6Zm/Wxz00qNtn5eqvRj0v1wVjaxX87FDnlx
	lnjRo67RdvNVNaG0Soif9zNNKoMJbzocqEgpypJJO5LGlWYNX34SU/ym6yqxdO0KCNEXCNSfeae
	/H/ywjCZsRybkJIxfp0PUakE1zsAs5BDpx8mUL8vvonaU8EpsBHwH2AkY/Epphror+OhBRld3WS
	FuCqG7ZgjNlPOl/xqakt5XO2M833A+kbnZPDOWWPQ9h45kK6LMwdf/UCB9OzwoX841Go+iG+nNP
	WprseBA2Xy67IgGYRBR5FlE/ICgRIey7R366jO9RAtWdVsBKTimvsvjBZeTJXAXHCzQX3kz0ClE
	C8IlcdfJB/IqWZkkYLHkLc2gqKqeh24oXowWPvKiKlP74g7WNfdtdPKdxtCK7H/sVEQwXdqC+WL
	E8v056Tm8Vjp3eGUZ3Ht7HiJ
X-Received: by 2002:a05:701b:2419:b0:163:c5eb:d42f with SMTP id a92af1059eb24-199291058eemr2330907c88.5.1792851131840;
        Sat, 24 Oct 2026 07:12:11 -0700 (PDT)
Received: from 192.168.1.7 ([2409:8a1e:2330:4ef0:6887:87ec:7e6f:2a79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19a3736d16fsm6366905c88.12.2026.10.24.07.12.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 07:12:11 -0700 (PDT)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Jason Xing <kerneljasonxing@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	stable@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rongzheng Wang <testwrzwrz@gmail.com>
Subject: [PATCH net v2 1/2] xsk: defer software checksum until the skb is complete
Date: Sat, 24 Oct 2026 22:11:56 +0800
Message-Id: <20261024141157.59301-2-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261024141157.59301-1-testwrzwrz@gmail.com>
References: <20261024091256.17918-1-testwrzwrz@gmail.com>
 <20261024141157.59301-1-testwrzwrz@gmail.com>
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
 net/xdp/xsk.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 33475b180ea6..65be2a368325 100644
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
@@ -1030,6 +1022,14 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
 	return 0;
 }
 
+static int xsk_skb_sw_csum(struct sk_buff *skb, struct xsk_buff_pool *pool)
+{
+	if (!pool->tx_sw_csum || skb->ip_summed != CHECKSUM_PARTIAL)
+		return 0;
+
+	return skb_checksum_help(skb);
+}
+
 static struct sk_buff *xsk_build_skb_zerocopy(struct xdp_sock *xs,
 					      struct xdp_desc *desc)
 {
@@ -1275,6 +1275,12 @@ static int __xsk_generic_xmit(struct sock *sk)
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

