Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793764111;
	b=hFq+AuYcyNznaSfFfX6hJLrwJwCDzKDrBVZZzl7992yqX9Xxsh2nWd0nxx9106ltv8zi
	 IcLhuvuw6O3+DflHn9J2xzOIv/FV+zQrN/ob0w/XWhdxRSp4gdXF5dSTGI1n/f8PfkdL2
	 4R/UYgawp2EcB8g3RG0+Xf57UY3qBIyS+aXuk7Gqrfe1eXd/aW+lkz1+G/rBDuAUpv8mv
	 LfvQqCPj9FqujuUcIh6lz/x1WjxjQUQd/epZAPHPFUz71I618qvd28NmK3LPcRIaWzDxy
	 ZJFtjXZdYsecZ5V7YD7AWKgnfgv5Rp6aXw6/r1w+j4wOjU8P30cglT2MO7Y/80oSsfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793764111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aUeirx3i31936fQIuPQmzE4OuL+xRIGfpGiZkYr9/q4=;
	b=LcbZLdUWVjBgcJOi9OZLGcPf3haGHUp2ImrHEJnAeGui6WXCMFa/Nknxqw0QugntgJvw
	 m0MgIOUVFyfAwIhGUPP40sHv2CPjmmXjlYiYzjARr3P9f8lzvbc5jkM0VcrZhJ/i4TRDM
	 4YUuoXMXxBPZDC48Kn6D+Q7EgYYHdNSeeT2+4g9svXyoUW5CdPsrGgQFTgZR9bne1xfJr
	 lA3M71im4guqaIf+Q1J6aEoikLrwzS1Z7kpEch2akX1SqBhbTK+dozQpLGozxn56IlJyc
	 j/IBREh+N3S/oxZODEJcKEHNNncVGHd+X4m9ZgYQg2oH0MftfgjXyBMpXm9FpfqkK+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nk5k7LmW;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0233A606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0233A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nk5k7LmW
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3b092ea1afbso109690a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793764110; x=1794368910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUeirx3i31936fQIuPQmzE4OuL+xRIGfpGiZkYr9/q4=;
        b=nk5k7LmWzDwaBnhbGoTmgRM0iFvyEupNwgAGriyG/o0TunbdbFZbJwKFJOVFnJny8e
         Yn1RbuV3xKUsMfZy+zHWF/Oh07amD9eATAnRu+OVJakSIkxtJZhtSdz+4JorFvBiRIky
         fAzxvJ8+4SL1K/zh2b9i6xGRhCi863sr0825+luUyDjqE7ekP4Xxme1ytvNnkf+BJrCM
         U++IKulCpBXCo29TbxkK0XqgBysw5c8cIaC6RBPVA0fHk0JOSOzNd33yjVx6U1/fA56q
         UKzRgO2WT1zxusZVTfM7w+Zii4BhfJMqH+2CwTsP351OuqKJ2eOyVHHGu7kgfOLajBgk
         6hTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793764110; x=1794368910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUeirx3i31936fQIuPQmzE4OuL+xRIGfpGiZkYr9/q4=;
        b=NUa3OCpJysFL8XuDxxUNhT1RzMa4szUfd1xW7MoZRcLP+j+9SRiHCeH5ebzEi772K8
         Rrn8zDcCvvWPwG+wF2PQU/k0Nq3Hdr2Q/9AVIn1bfFJHJG8mopysjbwxMy1qNzabFNvy
         g56vnWhR99hLNfYWAkK9moy+Qf5ByjT8t8tT2cbYKdwwOafa5VgybhsCkW5aDrOcCzau
         KjJxmDrbb+uYz64Q4MWusCeKu04uFBXuXzHwzOuB9NZsnBJNbm05L2d2zWdew3vHs7Rj
         xXNeeYodcM9VE83GoaNIYhiTQUYzJC2kcnsETLOinUvzTdKoLaKvkIYSUZAuKJ508zLi
         JQPg==
X-Forwarded-Encrypted: i=1; AKwUvBzz0Cs+bCHZXjnPclU0KAxh4bDxGyn3RlDztgAcMA/I9rmLS6fHLtTKu6b+EZKEtsAqbTCFJ9DUhRHjQb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Fr+vNnciKB9B47Ph+iDx4YvSuTcfeiAwRZXVqOUUhPHZIGVc+
	ZAzrSL12FsNSSNZyfeNNN0LjJjCh0pjoz0UmoQ7yrcr1cnkYLzmVwUK0
X-Gm-Gg: AYBFou0iPxQ9p78syJBxc1ivdEkhG3+YWI7Z8dPUujhimQin8qCdv2aBGV1hWNWOhrd
	5L0Bmw2qZkgrXmV8Ouh63LZnktzlhW7Ub74PmHwYVDhfnGSlUQC+ew7D/5U4fzaY2itapWFrrTv
	a1uKU4TXyqSNbhiBaMEx61UdZjGF4RPx92VN95LcUez3IwlA/MIIorPcv9DeYrL8NTHqaCYA4c0
	zhSqrgD5hJzdCosYmUCPd0KOf1QN6T9uhrldNH2xvMWXkSkfwBZNa2Molj7Lky1Ju+we/iy3zmi
	TT/OaFMyetJlLshMHrSjMVZMD/r1jcLm85SU8fGRmHctNVnribGSUraWkHOsB3M9Imrp0Q3W/Ta
	3V7gpLWJbK3Z8QNd9IXZV/+Lb3edD45BmolPsyNYeXd1Um6+APBo5ayWH72gA7ILHwwuPQkzNJy
	h7iN3d5f1El2Wcv8EUAAAsMM20OKaUCWHa0KFGf527mB6H9WnvTXo9pj4LdtJb37uzUphCl69rz
	r43IMVW1mLNDTMaLUfs7EXO2Q3YjdwRY8EdCzaUTuhO8G/ZCm9uae/SrVtxnBSIoyXZw5HO2vy7
	57Ig5RYfervDj2oCz4pnuw8gn1QoHfs/WJF62rPitjepxFVGNASHM2aWaSuIyqMSUczs
X-Received: by 2002:a17:90b:588d:b0:3ab:9c73:147 with SMTP id 98e67ed59e1d1-3ae8970ef58mr12252667a91.14.1793764110336;
        Tue, 03 Nov 2026 19:48:30 -0800 (PST)
Received: from localhost.localdomain ([240e:46e:1a00:3fd3:e1be:ed6b:40ce:8dab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944a0ff7sm1705472a91.10.2026.11.03.19.48.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 19:48:30 -0800 (PST)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: netdev@vger.kernel.org
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	stable@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rongzheng Wang <testwrzwrz@gmail.com>
Subject: [PATCH net v5 1/2] xsk: defer software checksum until the skb is complete
Date: Wed,  4 Nov 2026 11:48:08 +0800
Message-Id: <20261104034809.24545-2-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261104034809.24545-1-testwrzwrz@gmail.com>
References: <20261104034809.24545-1-testwrzwrz@gmail.com>
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
Reviewed-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>
Signed-off-by: Rongzheng Wang <testwrzwrz@gmail.com>
---
 net/xdp/xsk.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 33475b180ea6..27ec1d931fe8 100644
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
@@ -1277,6 +1278,12 @@ static int __xsk_generic_xmit(struct sock *sk)
 			continue;
 		}
 
+		err = xsk_skb_sw_csum(skb, xs->pool);
+		if (unlikely(err)) {
+			xsk_drop_skb(skb);
+			goto out;
+		}
+
 		err = __dev_direct_xmit(skb, xs->queue_id);
 		if  (err == NETDEV_TX_BUSY) {
 			/* Tell user-space to retry the send */
-- 
2.39.5 (Apple Git-154)

