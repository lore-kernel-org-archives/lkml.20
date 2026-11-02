Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618904;
	b=KITzTcBFOHq+qmGA6fXz5AqAKlVX/zeBHDcpPdOMMgcieZG5ydvpGBVdZ8gd4qOLRoLV
	 WXELl6zuuoJWePchQDhsQvCINJNWF8DvK6i7yFsQVXcwlF5zUg1faAdhPAkHRQFjomKGD
	 KoM7mwar9fXFQA+5lvEvaP4jATiBvoeYuZR+3w5L3MWctV5/ngt/O09k+1VH0thFyAUJK
	 szpMH/5RuHoD38k7M1ISnscprJUsHv9KZKCXvQmYzPDJKGMa17elYCOA3btvVOcnv/Zn6
	 B2YqOcjfnxcDyXbo4yUwvD0N0ZR6j0+NnUwOJMZdQdGjkShQLWx/5njhT2EmVZl5Itg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CCGsR7LPvkczseIhGcwfOaLZHJqDI04VbeyNAiiWj6g=;
	b=kFvUzppAm+KXd9gV+xhzgIKCGXW+G3YvBmB/9+5g468UETR+oK1YhzFUeQnRThXU2Fl/
	 y3AljTFhfXcKvWwUSO79yjzKrdzLHRcVuguhgFg+xlHCVCFAqHGYRupTjZVEKKhXv0oO/
	 EixRH0EzU5PHMhspgy9rHVELeSfzKXwd50rl3A0J7dbN+7k0R1Xiy+gGGI8rqjnn0/iw3
	 FMdSiOR4FaqsXkO5ubgxDl/rspbwlfQ4YJqPOPve0FPtrI4HHGXWUnNSt08usYOuXGh77
	 UsmavqAe/gIz8pP84IR4eABOdBD5HA/tfWlgsUfBVcOb68ByYNhSZjFHkLQW8+kGnXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FGie+iy8;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0210260A263C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0210260A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FGie+iy8
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so18445015e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793618902; x=1794223702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCGsR7LPvkczseIhGcwfOaLZHJqDI04VbeyNAiiWj6g=;
        b=FGie+iy8XzXCHED6M7et8j+I7bdF3gCSWfq6WEBHz/sNtdWaX3sWQ4MTFa/B0ikztn
         wGvNuhAbPzucFxZ2Xyp9ZsNeMyWk1UCgUwcNkMpEwBr6As3t2v7HngwVudOKycHVBVKr
         SpWT0uQF0Iw8j+NkXMhwdHW8WtRXkSRhj54JpJpAxO74NnE06z2+BzaMf7xK3LNLraTC
         XuX/lWgoCaeeYYM+R9C9S00amfLt1G1ToQUZeXI+lCpztC5SQG178il+SX5Gn9/llnK7
         uLJucWJrrl+xT4Zb8/emi2ym+Rp4R51PR0rM6QhYx3OAuYbuBEFaN3zwN87xFp2gY509
         C7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618902; x=1794223702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CCGsR7LPvkczseIhGcwfOaLZHJqDI04VbeyNAiiWj6g=;
        b=Ftu1YGoFX1x0CEgLXApkwMJSonzFn+hhxGjQirfQlrA7ElohWLZPU/xHSepfcbOzOj
         xjFYb3erN4jwCc2J1Is7Wq7zwRTXK1+AIPUHkeWSeilp6Qom05WkktOYiCNxSMHU50XX
         9g2F8qRGkeJnaBenzM2XEwFVAZfRfcEuY4z77pnrfPHlJOMM6y+pPXeciazokSLQC9rl
         FzIM/3LcOo2nYQgnG7SfAbt3hiHnilZM/tCKzHasQml7+qivc9ftmsUwQtgzIbziNRs1
         EaOVkUC4ahX3Tf1fErxRR/Izx+zSDpce4kAOk0+qJZBBT9EfcBHk2iX5pC+bMlYRrHFS
         MM+w==
X-Forwarded-Encrypted: i=1; AKwUvByaM2qNKZkWIm7bNtuoeLwfkFFGI+IHzO+LXlg6Xtu4H0XPiTd3GwYvh1csjd1W+g7jt86XjfHS8y5BBnc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3oxNxpTAnbr3SblbecDpXqXeurtlDZlDvOMFjVyJJ4IJMen8J
	MTWiiAgO5LTt6YGwp6gq20du54uRnFFaJ2iBNfFxkR4G3bQQZ+WTLVnZ
X-Gm-Gg: AYBFou21iF7zkTmg1IQNa9L7lxHmToAWh12nDTQ96O0kH4sPibB5CeXbxmxal1VZVFR
	AFz38lO3l5ButZzEVj+CjFkArbt5ReXmTneUuyAucmyUVj32RndrCMwVwV5SVqo/kl1+tRklMAA
	0wG3uaEEdoxzsCIAdvfJWyhGg2iwrNVDGbBw83NlvGOJK+r63dcE/6zTdhHvTU9kcpyZVgOR/LP
	abEF37PzeRDQjNQZPZMSyXQwtS5teD8r3shh3GZk4i3NFUBZO2IUmmwN380rPPcCZxi4d8VlVOC
	6fOZ0WH8PPZ/KnCz7lUYeUTm+gFKODKWcdfftSTpthCUv7hp1XTTscCECa78MCmPDPNlEnfGbKO
	NtxsQ9Uxz1gqvwR0CPEtC7wqV6JXQfIj6B8bUbWYQvuGYk2f3BcEvE67Gu83sLmYrxJC8q/btwg
	sHthjTznK6K10tKs/pjkc54H6pHmY48xLBYniULYJGj/QtbjhYJInwRsob1+uSE2oU9t8akrhrE
	g+18v29/f1bzT97OZhfGgXJQIyDK8WYhqtZc/KLzWOAOC2I6MlVyNOsXHU61f8I4CqGdvrytTNC
	f4wqg1fVdoYLH4xwI2Z6r+LLzzZ5THbPe67w4geq9bdfgG7efPDdGQ/IMMK0v9/lsa0th4QXhY1
	Mzgq55it702PcBR/a2mWfxl4gYPdbGdVSZeAaA1kyDfPFX7+4jfnk0YhlU75CFTSTnkHt8smZDG
	15Tji/hXLGCuTeycuiriXLvyAymCj+m5JYlPgSZo6QSU9QunThGXFIhw==
X-Received: by 2002:a05:600c:8b2c:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4ac150b3dbfmr233776465e9.4.1793618902177;
        Mon, 02 Nov 2026 03:28:22 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-f91d-46ab-c9c7-94fc.ipv6.o2.cz. [2a00:1028:8388:a84e:f91d:46ab:c9c7:94fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm311382215e9.12.2026.11.02.03.28.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 03:28:21 -0800 (PST)
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
Subject: [PATCH net 2/3] net: mvneta: fix the removal of the mqprio offload
Date: Mon,  2 Nov 2026 12:28:15 +0100
Message-ID: <20261102112816.12322-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102112816.12322-1-pepe.schlehofer@gmail.com>
References: <20261102112816.12322-1-pepe.schlehofer@gmail.com>
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

