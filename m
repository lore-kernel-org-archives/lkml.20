Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693727;
	b=Rt/BJGgYJCCvznQFeu1GKn3zXRb8DqRRjiia6etUUqIw2VKegjJrau6791sUa1WPN9aE
	 Tb4RwYWflAjPrHBYRjv4q+5Q07KCHKuf+HkMGz1VRHGkbxbytO3UJPhRftgpX5NCiNuPg
	 In/YQPWNtmtJ6wz7XP7m6h6poEEdXNkn1vUMHD0UN8FyjwE+eHFhntOeV+TfrlIuXdV1z
	 13Ia5dJc0E4KFJihLYNaMlA3nrSdDle++BdLPr1O45HK5iqkgcLxDrjdQs8fMCV/4bzON
	 Pc8W6XgJS0yK/zr7+L7W11+quZ/NWjszUOBHsdCLgvWbgkvwEDaVkqXbFmrUeDMz0+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8G9f2sj7l3e7G5lnQu4Rk/LClqYHjpBN2zxkfvmpRHA=;
	b=Q/ctWmmNsg/Cwv9/yjZvp3OhBn9eZS5I5uy48VTRUGdCLn8pkp4uMEicZJ5brmd9BAuz
	 Ls4o9k8PEOH7WYK0zDaMfwL56TzRebuDEDDmjijCxAgnQb4NyKY11Swq9yrLYCtbIoQxU
	 MwC07UlG+bI4eIZpF9goVg1q+hfb9XQdwmjOUX89TrmHYdLW+CXYgPwJF9c3JqFKkWRCa
	 Db+AH7aj95CQAdSO4L3TvmHDfkO4Hbh/MDJ0icv8zpstzmteRZr1jk90bGwSfg+z/GihY
	 GiIr0NSGp/GdJa645WpBQcmMAW3r6DLffZdygBdy5XyEnJLseZK6+0+dRP+TWuea1jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l92fzV10;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8540B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8540B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l92fzV10
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3ada2f39f30so31627a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792693726; x=1793298526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8G9f2sj7l3e7G5lnQu4Rk/LClqYHjpBN2zxkfvmpRHA=;
        b=l92fzV10KlIkb0cr7Ubm74f9+Kq4xHT9XI5iy3Y3+jmKil+EUWHxjrstd9x+6/r587
         QIXkkGMxZgi9vD3oTXgT3fq27Op+NlD6zspidLjmK5RR/r23seKPba5jvTzHFrLC50SM
         1cs5RAnzK5LYj3idkPr+ZtEgEfYhtUP/h4POsvtSYtfIAi37mZjvy8hB2N6smSuWZnI1
         O91VMeruxHSBJNZi+AU75lm6j612fdTR/9PgF+ral/TjdT2IYnZnVaSZKPgkM07c/2Hc
         MfYL9//j5CfVqXWQdJPJauXdg4mI0zV4UUrMBy1yI8QX/XCr3Z3RrHJIxrm3Jl4WinaL
         8kzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693726; x=1793298526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8G9f2sj7l3e7G5lnQu4Rk/LClqYHjpBN2zxkfvmpRHA=;
        b=evxm/KSrj2nuP8qAYNvxIktx7yd5662f/qgWRDdQHfIWorT79u4P/G0l3kwCbEBWho
         LbV2B9D6pMCeYBos/L3frk1GsahPw6A5o5iQ6cqZVbG/GXIHPPYoJ0hqj9wrjlCLFm/p
         YM4Qfq4azErEGguXQKFRsKHhyb5vnVCvPYAIxSYnCkeFVZmZfO2SIFYnxmoqgZMSVRck
         suRULigbOIabioZORyYUSJaanQZ0m7pcoP9oK4r9wP3YqU9d031RAwd5ySrS2RfkGJji
         AecaIFGXP91BmckiK39ZGzAnyR0Ebbwk5efFBWCK53704UBl/8f4xATvZTlivnxsNFkt
         crHQ==
X-Forwarded-Encrypted: i=1; AKwUvByfBC5z2yj7s3jzH0xpbpn3jxdRS2M2ij8xfvZY+sxTgfBExKgI+a+LIKPc12WqtEU78iZkbstJ6DlckWA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkH/SQzA1lAWlTWpk5q1cpAmREvyHPNfyRDmqhaXx8EfIqrW3e
	sPK/Cz8XA51oAfWUmzToRlRUOZv7DWec3YABPZKl7LbMnbtTeySQ8oeX
X-Gm-Gg: AYBFou1fcyOL2w6JkkMiv8rfD2/82eweTHr6Mi3wZLg8OETacS5LLt2MZUC2Em6zYx8
	4ZoJ4Fkm3VK1IyGfvJRQ4J0O9KGvIalZPViSqTdYcDPOTuT1a1CY37tKruUSD02fKmegWKPa+XB
	dsmVLMrCYf7bOHRAzC7wUA+g01Ze1xYR4R4SEe6XmClmH1prwlbGbqAo7ft9Lplen4v+0M5dh9T
	VTnffYi1wF3d4oehhCSx1Z9YRrILhpZuUEy0pG5Yj/51nbZd7+XTCysomivvDQVpoyfTrFi9O4K
	ztbbusTDJ9Vp9fNnKyNFP6oGcd6TFg1xtp/ICf5115gj4zaaJwVgBdYZXW5K6syZ2JaKzQNwA5M
	/5Qb9+aK8Wqfc0a8XELoZLxp+SC57u5F/67+wDkEQvH0iCO+OM9iClqSCD18F4VuEFdhncmHsQo
	bOSHdtblrSP8UY9DYoma9Fy85RWoLxqzN71INV68a2ZzAY+uqHXOPLN+QBrb9ps2dnGFpGkxFtW
	l8PQOxbMu7HvSn2wclR00RIx3wRQjoiIphwB5O22IGvDjUbT1FPPRBSrBTd/Ahkox9ym6tur/3+
	5bWp49c/S2iSGVJT7KpVCrgOJH0qd6DSEiQPqRhbg/Ow6OpXT062I8VOLZJKcyCeIPSqA51LhMM
	yPWjsHclqfDChHL6R1etnywJJFTXZ5HVjFElNWd9Bb5egzjHZbBsM+oB7TQ==
X-Received: by 2002:a17:90b:164c:b0:3ab:b39f:41cd with SMTP id 98e67ed59e1d1-3ad86cc64d2mr5437501a91.60.1792693725903;
        Thu, 22 Oct 2026 11:28:45 -0700 (PDT)
Received: from wang0.shina-lab.internal ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490d4bfsm6115262a91.10.2026.10.22.11.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:28:45 -0700 (PDT)
From: Lianjie Wang <karin0.zst@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Lianjie Wang <karin0.zst@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	netdev@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net] virtio_net: reject stats replies for queues outside the request
Date: Fri, 23 Oct 2026 03:26:58 +0900
Message-ID: <20261022182710.2055771-1-karin0.zst@gmail.com>
X-Mailer: git-send-email 2.56.0
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

__virtnet_get_hw_stats() passes the vq_index of each record in the
device's statistics reply to virtnet_fill_stats() without checking it,
so the device decides where the driver writes the counters.

For ethtool -S, virtnet_fill_stats() uses vq_index as an offset into the
output array, which the ethtool core sized for curr_queue_pairs. A
record with the vq_index of a higher queue makes the driver write past
the end of the array.

For the per-queue netlink stats, the queue type also comes from
vq_index. A receive record in reply to a request for a transmit queue
makes the driver fill the struct netdev_queue_stats_tx on the stack as
if it were a struct netdev_queue_stats_rx. If the device offers
VIRTIO_NET_STATS_TYPE_RX_SPEED, this writes one counter to the eight
bytes after the tx struct.

Fix this by rejecting the reply when the vq_index of a record lies
outside the range of queues the request asked about.

Claude Opus 5.5 was used to review the driver code and draft this patch.
To reproduce, the virtio-net device in QEMU was modified to answer an
ethtool -S request on a one-pair device with a record for a receive
queue the device does not have. On an unmodified kernel, KASAN then
reports a write past the ethtool -S output array. With this patch, the
driver rejects the same reply with "Failed to get hw stats.", a
well-formed reply fills the statistics as before, and the
drivers/net/stats.py selftest passes.

Fixes: 941168f8b40e ("virtio_net: support device stats")
Fixes: d888f04c09bb ("virtio-net: support queue stat")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <karin0.zst@gmail.com>
---
 drivers/net/virtio_net.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index daab43ac92ce4..0473fa9947858 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -4955,7 +4955,8 @@ static void virtnet_fill_stats(struct virtnet_info *vi, u32 qid,
 static int __virtnet_get_hw_stats(struct virtnet_info *vi,
 				  struct virtnet_stats_ctx *ctx,
 				  struct virtio_net_ctrl_queue_stats *req,
-				  int req_size, void *reply, int res_size)
+				  int req_size, void *reply, int res_size,
+				  int first_vq, int last_vq, bool enable_cvq)
 {
 	struct virtio_net_stats_reply_hdr *hdr;
 	struct scatterlist sgs_in, sgs_out;
@@ -4976,6 +4977,10 @@ static int __virtnet_get_hw_stats(struct virtnet_info *vi,
 	for (p = reply; p - reply < res_size; p += le16_to_cpu(hdr->size)) {
 		hdr = p;
 		qid = le16_to_cpu(hdr->vq_index);
+		if ((qid < first_vq || qid > last_vq) &&
+		    !(enable_cvq && qid == vi->max_queue_pairs * 2))
+			return -EINVAL;
+
 		virtnet_fill_stats(vi, qid, ctx, p, false, hdr->type);
 	}
 
@@ -5055,7 +5060,8 @@ static int virtnet_get_hw_stats(struct virtnet_info *vi,
 	if (enable_cvq)
 		virtnet_make_stat_req(vi, ctx, req, vi->max_queue_pairs * 2, &j);
 
-	ok = __virtnet_get_hw_stats(vi, ctx, req, sizeof(*req) * j, reply, res_size);
+	ok = __virtnet_get_hw_stats(vi, ctx, req, sizeof(*req) * j, reply, res_size,
+				    first_vq, last_vq, enable_cvq);
 
 	kfree(req);
 	kfree(reply);

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0

