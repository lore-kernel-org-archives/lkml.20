Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832333;
	b=zr+8JV9dVOp3qr41kriWjEjA8VKTbwZ58tjXOUy35jjJF90xyd2TJjRCpiP/BWqBP4kW
	 KMJaim0tVNTb+4bW2xOHfo4I6VRE7AIVsdqYwumV0fPADenPNuJzFZ7ytWI5UoGZHV6ZH
	 1p5ry5Z/bxF6T2Lg9MLYUBHLds77XnpZAJE3XsqKlBFSBOhwY0tKmXeRyk+yVpr4wNVW8
	 Wn/glY0+a5b/cN7+XtsXpdBLRnTRWrmiJD4yG5ZzsS8oJTqQ22qEJ4z6QS2TUZm1I5FBd
	 XghICdMXPXMZV/MOJgmENUcWSx2QCypSAB2xOijOZAwByIGSSPU4FYJbhm6zHJBE2MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S0a7JUmy4AvbgykS/Hz0bWF1VilwqGhBj0gOSIQfwU0=;
	b=fDza7ZkKGE9afKIs3Xvp0PxRidTIrNlPe9UhRDeOnE/zbFjTFWMEp5qzFhOC8SMIADgA
	 NKAaeaaXdckKHp9lLrs0s2wkTyo5aC0KEcj20zd4XZeVsIROj7yWWEPJjZF4QO2V0yGq5
	 nUbUGt5IjKAkDt4hX0qjj2XRrSADuW7d/0UeN+4qFHsdn9Ev9tNjNomJdEEEnUBk2lmmH
	 qgPEUm0v5aFmFacZEFo4epiTJnEBy+XIJ+jiCVgmjYx/Ev+WE1KaHb03Sb9VMkr4JPpoW
	 DMMoxVz3LjzDLpu7Q9EnYNJGMBesQ0maJ4qmIY1/2sD+YCmUH41/i4gGewjeWOtmypA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G8Qfn668;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D4E606EE88
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0D4E606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G8Qfn668
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so9841025e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793832331; x=1794437131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0a7JUmy4AvbgykS/Hz0bWF1VilwqGhBj0gOSIQfwU0=;
        b=G8Qfn668CBS2MyL4pw3nUfTfknfq3yc9BJl1tbDFYuGO14xzuW3rAF843iyvZfFk5e
         oR6y6Shlo4qs9tFY2RKEcFtezKmUfjF0dvxLIOUCBaq5gKP/XyDMzxjKdWL03E/EIspV
         842wKylTb7WseEsQh3/E2sJcAKTqQtS+hEHkOb/TVyqAHi0fZAvhH76cjO3Z1PnAM7hm
         Bmfjhh0FWx2d334982SeE5ZkzNmObp4+zCVRkIWklg3FAf+RrD/viRH016kbZ8r+E6yu
         6ykDlIGfUBCRSyv+DtZ+m2TfDYNR4lvG9eHQIwObqwNrYODPO3SE0PVVqC8tmq8P1yni
         a4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832331; x=1794437131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S0a7JUmy4AvbgykS/Hz0bWF1VilwqGhBj0gOSIQfwU0=;
        b=dLmJbvFmq54p55FYkb8zEgCkKR/kpdK/sDVCVa27Eh8F3XRsjQPi5maR8/T4GTWLdu
         kyzHsvUzxjPLFxxw7oXuFBDPMA36c0XTuGAsCJsGryeHWdR5bYB8KS4PTdSi1Oa/QejR
         Ts9fJqiLz3fG0ODOSf58+bWH9wIcRG7c1lb0CMkb2MvVWwCXsOhzSE6HKgnctGK6xfU3
         HorcUYEBqT/V2H3iw3DmycBnwi7UfuO/hijeEs7v/OmuigscAfGnKDOePilrTipc1oVS
         KgdkPfCe/P3i2+nKCZejeP0kSt3YdseSDjetQRFRfwgkQ59JFapDWfEudLL9O7Cvyw+p
         vFVw==
X-Forwarded-Encrypted: i=1; AKwUvBym5LZLEFAPRUEvQUv3mnaTvQ/mGZrRWmHn5JutfQepBdtkBuv9MTVpy9tDAxAyQIJE2GpUEl/2F2vVb2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IE0W9+RdEchj2zue+1Yp/ftcCxZk5vMuRBuQLqibUmHedd892
	pim3pk0Por9KtPBB8D70yaWW3FmIQje0K8DNfOBXKrGhx0UuRB1adyxl
X-Gm-Gg: AYBFou3qHdTFnfwnoHmNn5+3UEJu60JVy079DLbX2YspTLYAJp7Qw/VM1/R3xTGK77E
	vLrcGbm/O43m/AK0HXd7MwcC3+sv/qQjqt3H0At/mhDdZTUIxnRbKLncVH+yAXGPSDBtULd1RHU
	na04DJvMgs4aIRBncAMRiSv/qaj++q+rAimeC5AqUipRGrOxEBntdwLebvFybCOlFflHtxAMKro
	aFj3mu4s4uDxNzVJhQo3QSyUmOzlCEzgj0wO4vW3H0STTS0lAhDacYf4dS9p1cKKDyRKNuiPd/v
	mSSTkBDbGBq56xtpjBfBFrWgI72njebdNvS30C+/NPXZZ1rNpfZAqSlOVkjlQWIru0QpEwcpUoP
	5wT0dl0SKRdg9myvGiUueF3fWwMp8PkwJMHIXQlFY9QhjVpBLYacUpmLgfZbX8/9TmAUyepT//0
	Q+8DLYsuI0inBZ77ueRQVe683ylSYKeIp8hPfLU2O/pOzEEzrkrCFcfYTfdT87VGvo8p+zAvdIB
	xO4zOQEgaWMdsEsHtrkPiqoeOHr4iyaUCybb2zt/FTO5MMJtv30W2MNoT2YvnE3eZtkrklVXMS/
	aj2CBTEkTfdP3Tdurts8oxuoIKaVeTeStrV+qvKstPwbEPScptZblMBMiY7Dk4syZtHyGg/1s4i
	21McdUEOu3Fb1QlO1LJKcymD2a6jLMQDSDWLY7uFdiZ7/bWyEpVxS/jvOIDU6JHBFHYh+TcLuo/
	6d3F/Ar53GGcaOWdT3/3GxpoW41v8r3AR2fNyMZpB1fJgXGD0az9glgw==
X-Received: by 2002:a05:600c:c09b:b0:4b0:c1ae:829 with SMTP id 5b1f17b1804b1-4b0c1ae0ad5mr196626745e9.30.1793832331231;
        Wed, 04 Nov 2026 14:45:31 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-947d-5f15-1dc3-a8b4.ipv6.o2.cz. [2a00:1028:8388:a84e:947d:5f15:1dc3:a8b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4320efc7csm36604235e9.2.2026.11.04.14.45.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 14:45:30 -0800 (PST)
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
Subject: [PATCH net v3 5/5] net: mvneta: serve the TX queues in weighted round robin
Date: Wed,  4 Nov 2026 23:45:18 +0100
Message-ID: <20261104224518.66487-6-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104224518.66487-1-pepe.schlehofer@gmail.com>
References: <20261104224518.66487-1-pepe.schlehofer@gmail.com>
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
Use the smallest weight that is larger than the largest packet.

Keep the fixed priority while an mqprio offload is set up, as its
traffic classes may rely on it. Clear it when the offload is removed or
its setup fails. Starting the port sets the mode again. The fixed
priority is set per queue, so the queues of one traffic class still
starve each other.

Tested on a Turris Omnia (Armada 385). With this patch each busy TX
queue gets an equal share of the link and no stream stalls. With an
mqprio offload, a higher queue still has priority over a lower one.

Fixes: ee40a116ebf1 ("net: mvneta: fix improper tx queue usage in mvneta_tx()")
Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/net/ethernet/marvell/mvneta.c | 41 ++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 2f8c134a921e..6fff17a3e4de 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -253,6 +253,8 @@
 #define MVNETA_TXQ_CMD1_REG			 0x3e00
 #define      MVNETA_TXQ_CMD1_BW_LIM_SEL_V1	 BIT(3)
 #define      MVNETA_TXQ_CMD1_BW_LIM_EN		 BIT(0)
+#define MVNETA_TXQ_FIXED_PRIO_REG		 0x3e04
+#define      MVNETA_TXQ_FIXED_PRIO_ALL		 0xff
 #define MVNETA_REFILL_NUM_CLK_REG		 0x3e08
 #define      MVNETA_REFILL_MAX_NUM_CLK		 0x0000ffff
 #define MVNETA_TX_MTU                            0x3e0c
@@ -264,6 +266,8 @@
 #define      MVNETA_TXQ_BUCKET_REFILL_VALUE_MAX	 0x0007ffff
 #define MVNETA_TXQ_TOKEN_SIZE_REG(q)             (0x3e40 + ((q) << 2))
 #define      MVNETA_TXQ_TOKEN_SIZE_MAX           0x7fffffff
+#define MVNETA_TXQ_WRR_ARB_REG(q)		 (0x3e80 + ((q) << 2))
+#define      MVNETA_TXQ_WRR_WEIGHT_MASK		 0xff
 
 /* The values of the bucket refill base period and refill period are taken from
  * the reference manual, and adds up to a base resolution of 10Kbps. This allows
@@ -518,6 +522,8 @@ struct mvneta_port {
 	 */
 	spinlock_t lock;
 	bool is_stopped;
+	/* An mqprio offload keeps the TX queues in fixed priority */
+	bool txq_fixed_prio;
 
 	u32 cause_rx_tx;
 	struct napi_struct napi;
@@ -1632,6 +1638,29 @@ static void mvneta_txq_max_tx_size_set(struct mvneta_port *pp, int max_tx_size)
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
+}
+
+/* Only the traffic classes of an mqprio offload keep the fixed priority */
+static void mvneta_txq_fixed_prio_set(struct mvneta_port *pp)
+{
+	mvreg_write(pp, MVNETA_TXQ_FIXED_PRIO_REG,
+		    pp->txq_fixed_prio ? MVNETA_TXQ_FIXED_PRIO_ALL : 0);
+}
+
 /* Set unicast address */
 static void mvneta_set_ucast_addr(struct mvneta_port *pp, u8 last_nibble,
 				  int queue)
@@ -3765,6 +3794,8 @@ static void mvneta_start_dev(struct mvneta_port *pp)
 
 	mvneta_max_rx_size_set(pp, pp->pkt_size);
 	mvneta_txq_max_tx_size_set(pp, pp->pkt_size);
+	mvneta_txq_wrr_set(pp, pp->pkt_size);
+	mvneta_txq_fixed_prio_set(pp);
 	mvneta_restore_per_queue_rate_limit(pp);
 
 	/* start the Rx/Tx activity */
@@ -5358,9 +5389,17 @@ err:
 static int mvneta_setup_tc(struct net_device *dev, enum tc_setup_type type,
 			   void *type_data)
 {
+	struct mvneta_port *pp = netdev_priv(dev);
+	struct tc_mqprio_qopt_offload *mqprio;
+	int ret;
+
 	switch (type) {
 	case TC_SETUP_QDISC_MQPRIO:
-		return mvneta_setup_mqprio(dev, type_data);
+		mqprio = type_data;
+		ret = mvneta_setup_mqprio(dev, mqprio);
+		pp->txq_fixed_prio = !ret && mqprio->qopt.num_tc;
+		mvneta_txq_fixed_prio_set(pp);
+		return ret;
 	default:
 		return -EOPNOTSUPP;
 	}
-- 
2.54.0 (Apple Git-157)

