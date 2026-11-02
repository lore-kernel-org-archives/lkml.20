Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618905;
	b=hBUIYtB38yHDaaUKhvEy8vKZv0FohUmQAJqvW0EsR3c3VOBh8YE2DvkVmcqd0IGWRE4z
	 74FKAUOPVSUJ4q9ajjAcVyhl4z5idUWwrAPJvf0+7+1+nFZhux+5/xtvT492xt1iSCTCd
	 9tSyeoS5SM+y8lrvhQ4SFrzaD9aTTxfEwsTn7njuikH4iwMh7qLAl5/abHGeJxCjar7bC
	 io1ND+8hS/g4gUOTfsGIBhYlRkECsJ7d4MP8A6CxClzxlaoo1qRqZf5Rqj3hAIGpofU4L
	 0U4uZqWVwXhIIhw3jGhHP4wlZogq8J9maB7ggafiYnkzuPgRS5Q8hwXIocNZh8w9PJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FzucKFRc/0FsGEtKvweQO1wEmVDqjPM+A+iwpDIaZJQ=;
	b=gE3M1GLz7Llqe74yBJ/2trGxLZVl7nSf8sZnxqi1U8d2NEZyL42g0Q5mAqYmJSvoYNgk
	 RfSymG/9sGTwXuOjhKfbEQJveCPScBR+HSGlW8D4qL3hQYvXKLZ253Q4m1Hn+3vqsj5fE
	 dZeNRaw23Th5RBt/wrAYzAZuECqOoJbC052g3RrpFJyPyS/33w0z0jB+b/JZcYslW97PF
	 epanD/6JGJlQjoXpFbAiVcRVHDW9iT3asWim7xIVifJ7p227Q9VfPTUiz9sHk1H0AJ4bl
	 +ZkTei2mYEeVMaRUkk/lQ2lyIhexwFjHwOgVz6DcxcyiSKR4nsVdkAq9LJXbgFGkqug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vFkFVvXH;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98B560A3813
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C98B560A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vFkFVvXH
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so23660945e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793618903; x=1794223703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FzucKFRc/0FsGEtKvweQO1wEmVDqjPM+A+iwpDIaZJQ=;
        b=vFkFVvXHi0NlYuN6jVG30IWszK9gUAmUNh0/1hALC1T/quF1SbmqrGtCxB7YyixTOf
         u291iALbYmhcwvQpFkAd3TSDdhLdu4ySRK3/wjwHQNT6SKdAMKppB/XlCeEwfePdVvUI
         YQvNSf+5Wv+nINeL//seMqGlM5+iBQM49hQniBWAmKhKTBp8FiQJuo6I1Zt2CVLEYe3a
         IxmSeiY5ZzUbu1v+B7TvxmAyA7exBSdjmr0metJIrqlWwufqs2lKBAU52PDM6d8IUjDh
         ZKdVFsWH5+4aHp5touEE+HPj9Xi/dVR0dp+BSPF7O1ya0wvLVHK/qX2CdzSB4f9vnLVA
         6xEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618903; x=1794223703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FzucKFRc/0FsGEtKvweQO1wEmVDqjPM+A+iwpDIaZJQ=;
        b=TKEjQUIMnxRZtqXQTzBZweKDon8EAfsUIux6/fcVBGcJYBEfXp9SQe+yIYIB7BQ6GG
         u3PNlKNCX133+bLXO6qxEdFnHQWvIyMfEASsGCj46kXDN4QSHGVtC3sCvWiUmSyR1DLd
         0uCOWPxejYvi5fG8kpYlTCTzmvucYwna4Pom9TPlZZhvpyhl1P5ABxteNDWFRr39pJRv
         blMfu/1kgZ0hbowxuk4yyJZ2Zyt2s82CkPxgX7pfIs2zE3Xq1LkpMazKeDfDCrv7acRX
         q5FP7yYwzhJQiWXP+hPIbOgdn+f5o9YDFHld/igiJ0pLtT9sH30Ctcdg/FSSiT7MIcMv
         zPqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIhJ/xlh//Utg9NxyLG27wCv/uwLhFyTYbgq6ABOEwbi9aLvRu9KDYnHQ1fwkJkUDDiRGPnFaNUEqcD+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8ClnrmmO5kqlYMbjTMeBabT7wCafFoHFU96XQPbRhqR3eOk+R
	LSInKf9m7pO6omb35MCkCXgEev2egZeC8uZd1nIGMxRd6dOZkd3NCFBX
X-Gm-Gg: AYBFou1UMuwI1sElvOW5dOMw1m1hyrB68vSYYmcfPI2WqXkDU14PZWF99axRnx/Oxtj
	XOu/ik0XeBH+kGlBuHUJwunQoFvyThZzch2Rq1vpvtyF1YPNggHxTta4/0XXgmSF+MIgwwgl3hE
	f/3YnFoc/B3Zwy8sItMCEW1Dg1XqDBn6+khkzUnPSSCr8cE6Azg/takM/UlwBIebi91Ct8Z83Ib
	jgyA2vBOXUmj+NjKleNQ+psJmJGm8xJ9nqYOwsSdrgkSW3Er5akTKIP8bGNzKb+z0VJW/vnqF8Y
	tlRE8EjBcyMc32Xdo9i7IMcYHMFvfdArFhcyZmGZfV8rYCmvpl28GRZB+GTxnHq3cqMGdO+qpcr
	Dgk0YZp0C2ysI8MdxWPPBqiGDD9+yHaR7N1ht4/ItlGdORH0dgP2Xxg/pmW+POiHMWb7cAiih4F
	gjTsLfdabf5fHV1B00NEa0LDq1H5OhL6Eg6cg1cYa1id9BKQOAxXaOt13gCtohXcqoxoy5C8ifD
	vJTT0Rof7FBDAsCrvjD+ufypBcgi+S6HPyb8Mh3WXqR6/5R04V8sJ35Un/qGTVYf8FkCRA3BSen
	18UTpnYNCOF3/n2shZF2JyF4d0RmP01+2WIz4l4llF/tLNOtUqWgQbM3mSyzDIh9hVE8wbLp+Fo
	RClxaQFDxyrWUoO4iN3v/PFjgJxnkWggCpJZgo/emL7H4k0MiPl5o7dAfYzpImNV7d7Sxn1kDU4
	n0pxWuZByXFRKeLQ1y4VK1qcbvTV5jMcG0xdgKaW4B8afh+Nv5huEq3w==
X-Received: by 2002:a05:600d:e:b0:4ad:181a:4350 with SMTP id 5b1f17b1804b1-4ad181a44a0mr141947245e9.21.1793618903221;
        Mon, 02 Nov 2026 03:28:23 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-f91d-46ab-c9c7-94fc.ipv6.o2.cz. [2a00:1028:8388:a84e:f91d:46ab:c9c7:94fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm311382215e9.12.2026.11.02.03.28.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 03:28:22 -0800 (PST)
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
Subject: [PATCH net 3/3] net: mvneta: serve the TX queues in weighted round robin
Date: Mon,  2 Nov 2026 12:28:16 +0100
Message-ID: <20261102112816.12322-4-pepe.schlehofer@gmail.com>
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

Under load, some TX queues get no service at all. With four TCP streams
on a 100 Mbit/s link, up to three streams sent nothing for 20 seconds.

The TX queue arbiter is left at its reset default, which serves all
queues in fixed priority. The stack spreads the flows over the queues,
so a busy queue starves the others.

Give the TX queues the same WRR weight and clear the fixed priority.
Like the Marvell reference driver, use the smallest weight that is
larger than the largest packet.
The mqprio offload never configured the TX scheduling, so its traffic
classes lose the fixed priority of the reset default as well.

Tested on a Turris Omnia (Armada 385). With this patch each busy TX
queue gets an equal share of the link and no stream stalls.

Fixes: ee40a116ebf1 ("net: mvneta: fix improper tx queue usage in mvneta_tx()")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/net/ethernet/marvell/mvneta.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 79711a117c39..75d46349df37 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -253,6 +253,7 @@
 #define MVNETA_TXQ_CMD1_REG			 0x3e00
 #define      MVNETA_TXQ_CMD1_BW_LIM_SEL_V1	 BIT(3)
 #define      MVNETA_TXQ_CMD1_BW_LIM_EN		 BIT(0)
+#define MVNETA_TXQ_FIXED_PRIO_REG		 0x3e04
 #define MVNETA_REFILL_NUM_CLK_REG		 0x3e08
 #define      MVNETA_REFILL_MAX_NUM_CLK		 0x0000ffff
 #define MVNETA_TX_MTU                            0x3e0c
@@ -264,6 +265,8 @@
 #define      MVNETA_TXQ_BUCKET_REFILL_VALUE_MAX	 0x0007ffff
 #define MVNETA_TXQ_TOKEN_SIZE_REG(q)             (0x3e40 + ((q) << 2))
 #define      MVNETA_TXQ_TOKEN_SIZE_MAX           0x7fffffff
+#define MVNETA_TXQ_WRR_ARB_REG(q)		 (0x3e80 + ((q) << 2))
+#define      MVNETA_TXQ_WRR_WEIGHT_MASK		 0xff
 
 /* The values of the bucket refill base period and refill period are taken from
  * the reference manual, and adds up to a base resolution of 10Kbps. This allows
@@ -1629,6 +1632,24 @@ static void mvneta_txq_max_tx_size_set(struct mvneta_port *pp, int max_tx_size)
 	}
 }
 
+/* With the default fixed priority, a busy queue starves the others */
+static void mvneta_txq_wrr_set(struct mvneta_port *pp, int max_tx_size)
+{
+	/* In units of 256 bytes, must exceed the largest packet */
+	u32 weight = max_tx_size / 256 + 1;
+	int queue;
+	u32 val;
+
+	for (queue = 0; queue < txq_number; queue++) {
+		val = mvreg_read(pp, MVNETA_TXQ_WRR_ARB_REG(queue));
+		val &= ~MVNETA_TXQ_WRR_WEIGHT_MASK;
+		val |= weight;
+		mvreg_write(pp, MVNETA_TXQ_WRR_ARB_REG(queue), val);
+	}
+
+	mvreg_write(pp, MVNETA_TXQ_FIXED_PRIO_REG, 0);
+}
+
 /* Set unicast address */
 static void mvneta_set_ucast_addr(struct mvneta_port *pp, u8 last_nibble,
 				  int queue)
@@ -3760,6 +3781,7 @@ static void mvneta_start_dev(struct mvneta_port *pp)
 
 	mvneta_max_rx_size_set(pp, pp->pkt_size);
 	mvneta_txq_max_tx_size_set(pp, pp->pkt_size);
+	mvneta_txq_wrr_set(pp, pp->pkt_size);
 
 	/* start the Rx/Tx activity */
 	mvneta_port_enable(pp);
-- 
2.54.0 (Apple Git-157)

