Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768C143B3F6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976526; cv=none; b=kBOHwubTu8BQ2EFyiKPZVJXEA5GQEAbI/LCrRzSh/xMdkxgYD/mq/aIH4M93xqgz6oS3H7Ax3JrJX3NDNBXaxlPR2N6qNbglASif551NYWC466boKxq9zZXCLJ3ql6xQmW2hkAG1G5adrlmQNF/JddrB99bE7kVhSqqEc/7sYwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976526; c=relaxed/simple;
	bh=qC+plKl4jaMAeMv9KFQI5KK5xUjHAIEAMcvOG4NG30k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QFFYWE8lUBXruu9Cq9Z91iKH/5UVW8SG+vef1PXvMd/G7era3zJz3p8hQoX7k1nGHy6Yrtz/GgvJY5xKR6BGB5E4QoG755gjCukQmngOeX+/XUsAfvd9kPsSTtm0m983AWu1baBLkpVrT5SlZHHVjD/DqjzjAhe4g8Pbj0wmlbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce1d50Q9; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce1d50Q9"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so2234116a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789976525; x=1790581325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7NI7dmw05ci1upj6wN18SfkuMFDavLQgdb5foGE0c0=;
        b=ce1d50Q9AfpHujUEdquNoKI6t0v7FvRD/V5yk+InTyQdtlDdyoZp0LJ5xepBSQzNnv
         uweDpswcar79ScXJRJ8V3hnY5QM1MUm2F8KS1mjOWqbEImRhuDPT7UDh19/3o7kGa1o7
         h3DEd/uidMyUrqYkjttopiSJrA5znJlHZFlVNqLHrQfMqLglIAJCCwGmnFpBuLEnzFhS
         ZtztnO091WKMAKdUkxcPBbN+HrU+5//JNx4YUdh03JF3BqkXc9AMyeVCdhyeBC8pD6t2
         JVt6R0yv6kDkNOTA5kMAxmpZv3Msp6uMRS1BMlaETFPvXtlbOzoxVxxcQavZPia4gN0u
         XnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976525; x=1790581325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7NI7dmw05ci1upj6wN18SfkuMFDavLQgdb5foGE0c0=;
        b=YSQ+68b8mkxrhgvB7zcTT5UTvehIeX+vDsQsTx04CJ2YqsYv3259xhhSs1xzR7w2g8
         tiI/LLZAHzX6myFYXu9oR9zE5eDDFJFbDyVdfwbybNQgK0+ECZIh5YIc077M7Qy3sk+X
         IdckgFq8K/P+ac3UGBuddfw91gZeAetX8m1nPV4L+zc9pRQfKX3kjdlLVgAVBCU7OW8k
         rGGM0L8lGA7oiBBhBYO0M7Q4wAbvVeA5DtVZ4AKLA8SzoKvBjbvAgZ8QkNZjxtvE5hnt
         CN80EdCfK9QaTH43IM7DLEH60187RKtwK7HYOtX/6qmM9nyJSBFg+syI72uXIVs5xSer
         XbXg==
X-Forwarded-Encrypted: i=1; AKwUvBzDpByjS1QGqLYRRFlVAsVvV1vg1qSPcj0hFw3LNjRD5WrPyBGoz+XyYlsilT+AkSLd5Noh9xQ/5Z00U3g=@vger.kernel.org
X-Gm-Message-State: AFuF++k663vK0o5CsehM9TMGUOYbn8Jfu5vsF2cTITnMjjX0act4uelA
	3BqncNTHPx2q5N7eLAn1KSg4RlivZVAJt1o1aehT3/y17PS7UFCtvXk0
X-Gm-Gg: AYBFou2gbVJnqMMapjDhW3C1tHLC3I+ReDy6f13gHr/dGJXm9Z7TsP6YIoZ6PJvlR1U
	ftAQ4knK/MCdnrgszg0nI0C7Ne3GUy7MsZXDQ8VsBQkrclFqLzF83elqTf7FQXhlD234R5ozzZO
	DjHc8ZE1d6aJdziIAFLf2U/ytGIhN8KQUF9y5o9GLCG3kRghrixYHT6QaaBU/wJwxQojXFpFDi2
	bQVJDRQvGt1fjxpFzreAhIbHI6CyZJ5x0968B70RSH9okk+ECyhiqDgpszKml14qyBKQAFY2433
	V8Tb9YQ0IH2jXOlFVrU1fkzoHt2VQ712LLC0PDGAum6zzKZfTSqEc8ifuMPdAhDRuoR2EznqVwW
	GAUVW/EMY6+ewdEE59U6r4uNsyI4O3FJW2Jnu2ryTTepAnsxU6zy4V/IL1TLlPZIj4xehg/87pj
	sTdsz8aYhO5cZKXb23u6CTTNzo5834A4b/ELGevdSzxMtn26ESF/u/LJ5bDJggz8gj3HhPMrh5o
	vuaXbHmjczMi3dLyJPUbQhXpVq4M4Jvx7p40dSF4pm3ogMnHsB3yCzNi9/C1vZsj1hsAWfwfths
	P5fHepyW6Q==
X-Received: by 2002:a17:90b:37cb:b0:39e:6c69:9b9a with SMTP id 98e67ed59e1d1-39e6c69b2eamr10004502a91.63.1789976524658;
        Mon, 21 Sep 2026 00:42:04 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm12396602a91.0.2026.09.21.00.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:42:04 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Alexander Aring <alex.aring@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>
Cc: linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 1/2] mac802154: rx: fix skb leak in beacon and mac_cmd rx paths
Date: Mon, 21 Sep 2026 07:42:01 +0000
Message-ID: <20260921074202.2289040-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260919213636.3316565-1-benquike@gmail.com>
References: <20260919213636.3316565-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In __ieee802154_rx_handle_packet(), skb_clone() already creates a new
skb with an initial reference count of 1 before passing it to
ieee802154_subif_frame(). When handling IEEE802154_FC_TYPE_BEACON and
IEEE802154_FC_TYPE_MAC_CMD frames, ieee802154_subif_frame() calls
skb_get(skb) to increment the reference count to 2 before queueing the
work item, and then returns NET_RX_SUCCESS without freeing the skb.
When mac802154_rx_beacon_worker() or mac802154_rx_mac_cmd_worker()
eventually calls kfree_skb(), the reference count only drops to 1,
leaking the cloned skb on every beacon and MAC command frame received.

Remove the redundant skb_get(skb) calls so the worker consumes the
reference from skb_clone().

Tested in QEMU with mac802154_hwsim by transmitting 2000 IEEE 802.15.4
beacon and MAC command frames across two linked hwsim virtual radios,
reducing the SUnreclaim slab delta from +680 kB on the unfixed kernel
to -80 kB (0 leaked skbs) on the fixed kernel.

Fixes: 57588c71177f ("mac802154: Handle passive scanning")
Fixes: d021d218f6d9 ("mac802154: Handle received BEACON_REQ")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Split the beacon/mac_cmd skb leak fix and the IEEE802154_HW_RX_OMIT_CKSUM
  tailroom expansion into a two-patch series as suggested by Miquel Raynal.

 net/mac802154/rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/mac802154/rx.c b/net/mac802154/rx.c
index 19b5382..ad602d2 100644
--- a/net/mac802154/rx.c
+++ b/net/mac802154/rx.c
@@ -287,7 +287,7 @@ ieee802154_subif_frame(struct ieee802154_sub_if_data *sdata,
 		if (!mac_pkt)
 			goto fail;
 
-		mac_pkt->skb = skb_get(skb);
+		mac_pkt->skb = skb;
 		mac_pkt->sdata = sdata;
 		mac_pkt->page = sdata->local->scan_page;
 		mac_pkt->channel = sdata->local->scan_channel;
@@ -304,7 +304,7 @@ ieee802154_subif_frame(struct ieee802154_sub_if_data *sdata,
 		if (!mac_pkt)
 			goto fail;
 
-		mac_pkt->skb = skb_get(skb);
+		mac_pkt->skb = skb;
 		mac_pkt->sdata = sdata;
 		netdev_hold(sdata->dev, &mac_pkt->dev_tracker, GFP_ATOMIC);
 		spin_lock(&sdata->local->rx_lock);
-- 
2.47.3
