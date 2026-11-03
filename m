Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710238;
	b=I+KBI5CvsNJRe0v54D6V0dFGQYiRy99RxBAzj/cC47Gqipy5bexgjpw5ZP3EL+yDZGod
	 8eLpdRf7wLshH2ZqKy9n0sUBCxFBvCJgPEuYUCRTflDRv7OoD4/I+BBInHLBYqa1AgeTp
	 54qbYBryYNiA6XYVKlIEvJMR0v7F2XFJlR2DZmckT57rHjH7wBUrJgy4pIwsh4RYuYMKy
	 4UK9/uR3B4F8pX3eP4yXvf9vIs24kmoX9RRnGjL9EYI0yQbMpB3GLZ4Ui41PVnpMPYrwS
	 nviXFl+iAEjysyYN9ZL9u88PUZstDC9BTSKtKrDktLIT2F13TvPxj2KoOGZrSlY0siA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=79De+S9WzRf5YfczRDZE5oZIz38sSlm2evkJ8x0rH2U=;
	b=IhPwyCNeV/JEilBuZlJb7xd+QQnk8hieZuqAgouOZiGonTh3uxUy5Lall0IkIvYertHQ
	 2zAPGDB8o8HO7T0MA57ytswhW5NAnYw9jOtNyxCM4eyzgGWkgweMZdVhj32yCt/MhjNIJ
	 qZ3ZuRxBirSBQ6kgDBkfUCeKP1pSrGvxojSWjKR1lzqaiFV0M0DzZdUUD/qxH3RnpDs+z
	 1eyfMBs0MIl6inu/pwEf5Mik6gPACEpvrQT0DiVoyzfLQznmcNqsZqYmPjuQZSh6Usdzz
	 k0vEwN5qDAielEtvCnc4vKswewk29+aOEeV+GTGywd7lYn+FsuzPQgmMO2TChW4/beg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVDdcLmR;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8471606EE82
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8471606EE82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVDdcLmR
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c45111bebso1820714f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710236; x=1794315036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79De+S9WzRf5YfczRDZE5oZIz38sSlm2evkJ8x0rH2U=;
        b=gVDdcLmRviauunLxj4vvUm7iZXJvIRwhnqTv0OCN1KRF/if7ZfSA2g+Zskn6sToJPF
         moZCb/bqtFvll1Gth49VU/yH6jxj57qO75uOX/5cIrLJlkcBYMXx3yiDKqqHOmk+dMlp
         ela5tg5C9TUez6tQwcPoRTokfNuNt+9Xzd9VD3dPpDE5HFJPIiRhtAeke+kbPYSvk2R2
         xZ/mRPlTuqamRnas+kxMdO1Ir2KiEFeFtuZDkhYEOdInS3KCDdMumr6GvZeez8GM3Rwn
         WbgJwx84scqz6MOxit9OizCMkNYIy27XYSjdG+Dt1GUtmLqYwjl0h937tdR3jZ/QGxxM
         AttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710236; x=1794315036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=79De+S9WzRf5YfczRDZE5oZIz38sSlm2evkJ8x0rH2U=;
        b=S9WRWi9sN3lSIXGqi1W6oh4rg3Qx10DV3mdakWg12wIevnGk8ks4/N0bWO8YKENV+b
         kDU4zjAmKkDbl+JOyJopfEmVrXrQV47xJw/kW0+3p0ssSiEwkwtS9mUxmtvIz/BnZPE4
         n2QI4LB83YimfgVwo8DNNQ4KCtRpo+hUWdHuPXZFJmYmb/vYUhMGSYr0ScCgTNIZTz+d
         Z8kRsJfrFF53Do/Wiz2hz+XNPEjZkWG0wGbc9jTT2DGgJ2MtdY6e7boHwj1K6spWXKt9
         e7CpaMexv+63a7j/KmEd1afgCVmQ3tq9oAEBEIADfMoNo+0bFW75uXkmt9jyMaGAWA/I
         aRuA==
X-Forwarded-Encrypted: i=1; AKwUvBxQcilktzs8BuF1cYWL2SWfBKXS/9yUx+hTbIMKwBqxD2Yg8uVTvtWsIFgcy80JAN6OM9WzAmdNmU3ct2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JPFwvj4EN/y3wf5FwwIw6Jgem9PyrRYw5O03Omg1d/U5SI3AI
	2Cmg6TGOx+A7+YA5ihddiOl8fy2DCipxkR9mk7GqG1YCxM8bOgSy9YrX
X-Gm-Gg: AYBFou0hE3sempqD/GuYDObRtSk6yKKmeod7iWnc4PecKt4gSayLfhnEWsAhj+/shvy
	MZ9FRojTSfsiECGGgJIWkEIEpS9enoUktlXDpmB/47wPeoB7IOTCn2cBdGeKbBhlvLWI0qNdjoX
	V3OWw50a9hQtYqIU156yBBZI6cHNw0pTSNkVrJPDgNW3UsWF1bquQkrUkWACU6YpmBxTtSifUi9
	R+TPTXxxOSUV8PYWfczhqHSSthh2ALwsiQgk9KP9hot8CD9XnMcumPHTWZdmCv2A7VDarxuQJf+
	op8S/UcRHAexybkuWeiC1lmb+zvXH04RKl+5q/FYKVvJhnwAQo9b/43kNcGMlgjqpnztiWec7Zy
	fNNrxWZCS4hmR9hHWRx0MIAsSxeE39Be+TZkSXLkd9DA6KpD2GRt7PjFth6v0TEPMZximezfaBq
	pJeG5RzjcueSxyhSwWw9FfYkMr6aFOaVRWxgulH45ulad2xPaf9ocWUqh7P099KoDF4I3aTwJDM
	3XU/dJNJe+R3FUni6tB8yIBYBTfSaxfWKsEueLkt289ZyU8rLNHBGeY7bBcq4x9j14QrgObzbtE
	B/qzHYLRa7LCnb2xTL6MLHean1TJFko9vB8QGMsWstrGudqbjnwqtzTUg9vWj+sAU1ll6X8JHMW
	Uiq0jAp4/jG3x8sj/7kHdf6nK5Niniu9zcDRNe/no941H7Lq6tkOFos6y8Swhhg==
X-Received: by 2002:a05:600c:e558:10b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4b0a3074938mr95994905e9.10.1793710235976;
        Tue, 03 Nov 2026 04:50:35 -0800 (PST)
Received: from localhost.localdomain ([2a00:102a:403b:96a2:e8a9:f4a7:ed37:36a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a5372d8bsm61406425e9.0.2026.11.03.04.50.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 04:50:35 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 4/5] net: mvneta: unwind a failed mqprio setup
Date: Tue,  3 Nov 2026 13:50:20 +0100
Message-ID: <20261103125021.70845-5-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103125021.70845-1-pepe.schlehofer@gmail.com>
References: <20261103125021.70845-1-pepe.schlehofer@gmail.com>
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

A failed mqprio offload setup leaves part of its configuration in the
hardware. For example, when one max_rate is not a multiple of
10 kbit/s, the command fails but the TX queues set up before it stay
rate limited.

mvneta_setup_mqprio() returns on an invalid queue range or rate after
it has already mapped RX queues, switched the rate limit mode and set
the rates of some TX queues. The qdisc then fails to attach and the
driver is not called again, so nothing removes them.

Undo the RX queue mapping, the rate limits and the traffic classes
when the setup fails.

Tested on a Turris Omnia (Armada 385). After mqprio failed on a
max_rate of 10001kbit, TX queues 0-3 stayed limited to 10 Mbit/s and
the VLAN priority map stayed set. With this patch neither is left
behind.

Fixes: e9f7099d0730 ("net: mvneta: Allow having more than one queue per TC")
Fixes: 2551dc9e398c ("net: mvneta: Add TC traffic shaping offload")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/net/ethernet/marvell/mvneta.c | 28 +++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 75d46349df37..d3a6bf8f383e 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5299,8 +5299,10 @@ static int mvneta_setup_mqprio(struct net_device *dev,
 		for (rxq = mqprio->qopt.offset[tc];
 		     rxq < mqprio->qopt.count[tc] + mqprio->qopt.offset[tc];
 		     rxq++) {
-			if (rxq >= rxq_number)
-				return -EINVAL;
+			if (rxq >= rxq_number) {
+				ret = -EINVAL;
+				goto err;
+			}
 
 			mvneta_map_vlan_prio_to_rxq(pp, tc, rxq);
 		}
@@ -5311,29 +5313,39 @@ static int mvneta_setup_mqprio(struct net_device *dev,
 		return 0;
 	}
 
-	if (mqprio->qopt.num_tc > txq_number)
-		return -EINVAL;
+	if (mqprio->qopt.num_tc > txq_number) {
+		ret = -EINVAL;
+		goto err;
+	}
 
 	ret = mvneta_enable_per_queue_rate_limit(pp);
 	if (ret)
-		return ret;
+		goto err;
 
 	for (tc = 0; tc < mqprio->qopt.num_tc; tc++) {
 		for (txq = mqprio->qopt.offset[tc];
 		     txq < mqprio->qopt.count[tc] + mqprio->qopt.offset[tc];
 		     txq++) {
-			if (txq >= txq_number)
-				return -EINVAL;
+			if (txq >= txq_number) {
+				ret = -EINVAL;
+				goto err;
+			}
 
 			ret = mvneta_setup_queue_rates(pp, txq,
 						       mqprio->min_rate[tc],
 						       mqprio->max_rate[tc]);
 			if (ret)
-				return ret;
+				goto err;
 		}
 	}
 
 	return 0;
+
+err:
+	mvneta_clear_rx_prio_map(pp);
+	mvneta_disable_per_queue_rate_limit(pp);
+	netdev_reset_tc(dev);
+	return ret;
 }
 
 static int mvneta_setup_tc(struct net_device *dev, enum tc_setup_type type,
-- 
2.54.0 (Apple Git-157)

