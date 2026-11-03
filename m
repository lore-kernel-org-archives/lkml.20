Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710233;
	b=MWUUdN1XkTPSBt3TE+mPDZ3M7QddkUsoUlQdIBDH1ADWODqmuPwgq3xANW+zS2FzKO8q
	 q1f3qEi2sgkYLBerVVstNj+vDVW5rmFRxHnuzL88K7EavJbDtsC6FBy1NzYgL80bB9mA9
	 cgnKX4PNgLcz1Q2qXaPWG2i/XZyBtyOut3HWNDE4UnFPSMLyHgSUndOHYNqMUXBNtBolF
	 Zn3XfCGnMXl9euWGvKcEIIzEln+ZpZmbIMngawVA2tJvoH0iRXEAUYbKBT4X+3VKkXD1y
	 uWZXMZuYTpOdbmtznQGVWQK9iL3ELbyAUUU9uPQGj5ieuJSfqwMjjc0RvKqJHKD1Ojg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1NAP4iF8tx2I40R8y1tQZkrx8jrdq8+wikbWsRrd7CI=;
	b=3D2QpatHFVT9bfMXvFIPII80y3GMSkFuIKh+QWA7lADqQ85jozkDeGj5JNAIVigQHvEW
	 bOn6cupBo1EwW4OMlICkiKp9y+u4xvFsB5XxAQjowGbDfWcbbOmLz92LLZxSTshtQJnAS
	 iiA1ntbVFIzHUBumrTo4lT1tqDa8DsQ5Oe4nVS+iUDapUTtglqQcGk2pUCyGRKhM1wE0a
	 65yazsvFwwrGVEQWswuYI7xUJ42TkjBSqe6L4fNkU2AD5sDDwdEBPZdrmhabwSWCFO+UB
	 VwSlvCXt/vt0KY7sAbj2yBZ5q0ytnVdkoJusKCNK222XtpZNhSYauQpKg53lxPcLFPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ja+WhYAh;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2D7606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA2D7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ja+WhYAh
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so35122315e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710231; x=1794315031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1NAP4iF8tx2I40R8y1tQZkrx8jrdq8+wikbWsRrd7CI=;
        b=ja+WhYAhQW6k/D+gXVKDFFRtoaFYUk99Q5tNtj7tmBlx0z4yzPVZKBctjj0MGU6ZRp
         kcCqdrRpUr9YaHJ1JfSrxmu1jne2YcHa28BGGRxot2w8BiCOJxkuqckkzYlKwx4wjvzl
         eGs68qp6hzI55kGGPv7WOgAVnerYTmbaWpdYcE7Mrv+UlUw1Bijg0RpDzyVosSn1ek4+
         SbS1GAUJKStqJ5v4n8NKuk4pJHM/uBkQpqpBns7DlQP0vej7V4BgJZ2rCEarmvcSfInB
         kU8muZhshpXLn6KDim8AfcN+V4/HQUSXNgxbAWUEvhHcHVFCJyd1+A26dMbUJBMZxeYB
         m2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710231; x=1794315031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1NAP4iF8tx2I40R8y1tQZkrx8jrdq8+wikbWsRrd7CI=;
        b=0RSbDguSWIsmbX0Gw7u+WLhQpKmhqmoNy1sE9hXWtVUHiEPJld5DudnBFx4zRzpe8I
         cKkcB/TLS68uWP1+lEDNznTSrO3X70rTGArylNZiWPhbJJOobN1cwuPVeuWtIsUPyjXQ
         kE3nu+MeIu0P6EePnXS62PU96tiLK9zR3L3Tv6mrujByty68srGGIernkDzDy6/zjmsH
         gKntsC2WLjD4sVQWyOfRekAVVtestYUQcQNjMkmRzEFMY8ksnWlntMhAlURvQOZ49gYq
         Yh1mGSnZKvXgdRhf/wFqDm+tSN7AAQ3nUZHCQAV3196OxI9NCq7MTu7xL6jUYz9WzhOr
         devA==
X-Forwarded-Encrypted: i=1; AKwUvBydT++1DCWhU9zv/ty/3RVixk3ZdjX1jg6UDAxYo3giBotBDcC92kfKoMPP3VkPjsJEc1diy8woU39ZU/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cBOwgAuew5TOI/LxQIfeqYdLUDEFsrl0K3cemkYT0fTGU/qZ+
	oh0QZHfNdgW1D5awCSxGWzddpuWU1tzJPSPks4habXDVQGve1cGQepS0
X-Gm-Gg: AYBFou3b/ZGDIWDTDbNTWPyr/C9o5BQOXIFUexcA8m+fe+S6eNXQ1188Tii665Ap258
	4fCx7iAro+5VJhOvCS3El8vKUyzjP0JWOLBpu38KHi3/qQ6mEo1OUAMICzQliVgskTmyIjmsV9L
	nOXMV4LCVBCHsxAqe9UvzR+UFZbMODD7bdN8kxtLCN0jsM4tUN+LDZyTKP5vAFjPr5XjOnNSrn1
	bLWK9l1xsskefuQUIJB+OiHKfiABi/+ptsC3xDR48SWHt4YhaXCFPcwYKJ972R2pT7SX+Tfa6vm
	dU3hAVoL8w0cBqDYYLcxt9XoKXjQDbDMxCnrYihJWTTfKoaE1YiIE4gSbpCQrNqCJrfAlgqG/x+
	zdyxeG44xkIlcfRRsE2X3Y43A7pz9edgHhSlxB1cWSGlcS8CY6q+bi3VEGXR3bu0z882CjDdwzO
	501rCvlBmypicg6UtpmDrJIAh1oY2+qcx2A/nUoJtOhgr4iX5CxibNqSzrVFns7iLXVW7wMqsOz
	uA9uRBQST9e9ohHrRkO/ASZEfm1kRTP1J53p/a21yH2aDi9vE4Zj5B0wOfqx+BjohKpjlerv39i
	CJv9j/KTMA97SjO/xT2iXwC7ORCCTVq/JsVzptduaoc9YaK2IODIs9lFpFlGi6mNn2cKbMcpfOi
	7THucwqb3u/4ve2hDk5CWadpNnJ/AgXZOd37WARe218mt8aVjTkaeXVCJLN8OXQ==
X-Received: by 2002:a05:600c:3b97:b0:4a3:5a91:5f64 with SMTP id 5b1f17b1804b1-4ac18e5dcbamr293862585e9.27.1793710231136;
        Tue, 03 Nov 2026 04:50:31 -0800 (PST)
Received: from localhost.localdomain ([2a00:102a:403b:96a2:e8a9:f4a7:ed37:36a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a5372d8bsm61406425e9.0.2026.11.03.04.50.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 04:50:30 -0800 (PST)
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
Subject: [PATCH net v2 2/5] net: mvneta: fix the removal of the mqprio offload
Date: Tue,  3 Nov 2026 13:50:18 +0100
Message-ID: <20261103125021.70845-3-pepe.schlehofer@gmail.com>
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

Deleting an offloaded mqprio qdisc leaves its traffic classes and
per-queue rate limits in place.

mqprio_disable_offload() passes an all-zero configuration, so qopt.hw
is 0 and mvneta_setup_mqprio() returns before it reaches the teardown
code.

Check qopt.hw only when traffic classes are set up.

A replacement qdisc is set up before the old one is torn down.
Replacing an offloaded mqprio qdisc with another mqprio under a new
handle therefore loses the new configuration, as with software mqprio.

Tested on a Turris Omnia (Armada 385) with 10 Mbit/s limits on a
100 Mbit/s link. After the qdisc was deleted, only TX queues 0-3 were
used and the link carried 19 Mbit/s. With this patch and the previous
one, the queues above 3 are used again and the link reaches 94 Mbit/s.

Fixes: e7ca75fe6662 ("net: mvneta: Don't force-set the offloading flag")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/net/ethernet/marvell/mvneta.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 9b9efac2846e..79711a117c39 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5251,11 +5251,12 @@ static int mvneta_setup_mqprio(struct net_device *dev,
 	int rxq, txq, tc, ret;
 	u8 num_tc;
 
-	if (mqprio->qopt.hw != TC_MQPRIO_HW_OFFLOAD_TCS)
-		return 0;
-
 	num_tc = mqprio->qopt.num_tc;
 
+	/* On removal the qdisc passes an all-zero qopt, with hw 0 */
+	if (num_tc && mqprio->qopt.hw != TC_MQPRIO_HW_OFFLOAD_TCS)
+		return 0;
+
 	if (num_tc > rxq_number)
 		return -EINVAL;
 
-- 
2.54.0 (Apple Git-157)

