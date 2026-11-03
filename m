Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710236;
	b=vVFcBXPZsPzadmoAEqnQIfI7O1S+VHPnXp6ABo8qlXdkJCbGHC4FHo4/jaSmMqD+BeEb
	 N2qdnTf6yiyLcaQg2w3baQLL4ivx4IDaBGK2/lkGzVpkHObl6cE4Vm8xoTvjXksL3s1uD
	 VKhOHYxQkDlvoIHX9e1tr8U08sj+cw8c9fQGxCK+ggEm+GXQ6vziyhDdyaxM0XLsQR0ql
	 EST0AVrtSYEQXnOrPJBWmPYcL7PvVzkOtWnNF1Yg3Xq9JuawyPlmh623xvOcyhTzVaCwW
	 HZyAgoO2n6yKWvH+BB77giTW55i3CC/VQDo/CLb77Y45O/XYuyccv50escMnZhEPvcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H+cfFyacKnvXXbKM76/KTfUCfiKdR1kh7jxYi4VJtCA=;
	b=WbK/lbglzFEzMtxtGPDF9EfC4yCmSVUkgEDOm1o653XUBs840V9TddFfdy/qr8LiJ1In
	 wxg2Wr4eoy5/fg8Ic+MtpuikjaBbfuisRQkb2ONG0twlYy+FvniaEzlT7AzBKPzm2BAor
	 5vfd1uU0DxC2CZlg50yskiGMcKQVnVfORDFLkICNY/85AnNd6z92G6sBQuK2G9Q01olrY
	 9ODTa7f4u25FzWPVJf2hG2pMUFWVPZ0jtNxGlhHUEd7sPiRLvHVHnnZEETk6YLU5diJhS
	 SFobVJ1QXVYHkxGAnMztojeX32JuyQR1uz41la1txr+FkTwjD3NiMTCXmU2nnPkK3tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q8KuSwzX;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3EC606D837
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E3EC606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q8KuSwzX
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so33344885e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710234; x=1794315034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+cfFyacKnvXXbKM76/KTfUCfiKdR1kh7jxYi4VJtCA=;
        b=Q8KuSwzXjouMwWmBnts/XWeS42L0Ik3LHP2QrFv2yM8q1JKFFjQLu2UwNIvjNDzVtG
         t0pHOzE5D8KOvc9FYZ6CwQwUDDWPxWVaWW5ScjmjVA/hTMrrZzY+yR/k8pxeQjdRD3kZ
         98yBEQUGuMBa/S88Y5mUjcsz2mtt8a15INdB5LqRpgNLFAwZdRQAq8GA959gfr9DpwFn
         LXYIwDQIWHbMwczAeV4L8yvEhn0HieTFxv5xxEzRw4Bl3vdiBbeRzbk7LxCiJ3j+ohZ0
         VN/IDffICXi25aLJcEvS5keKHnTUscx3vYy34UZ6/yFlfPVECyWSOMaSu5yvC+dHv4Tn
         UtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710234; x=1794315034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H+cfFyacKnvXXbKM76/KTfUCfiKdR1kh7jxYi4VJtCA=;
        b=fDi5wCq88k40gtjuysecVuDg3n89F2Lv2au4TskhNezusjkA19TJVbLpcGGzWXivDG
         MjL9VH5OWCQFtE0xFICyOOaTrkDeg7ria72fBfLNwlrYwEjVVddWGNBqG76bhUnRiSwA
         mfV6lJGj1sE8vnHD1eX7I/Vdwe49u3D8nq87braViyqp/SGi+N1gqOnJ8IJNlz24sMNC
         /VQJqT64Z87hAGGiRHsKW3yWZALw5U7OuZKpvn5qJuyxhsNqIZ52piK+alNIdGhbkg2K
         bxXtFsQlwY3Ed5y/xZmXvIhQ/tExFpstTCXmbFIzaoc0FSMkLJmW+FI9yD1GPaGei9eX
         rUeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUiFZOV6khJFurwk8qHI5KNC44GOq2tQ6U7/j+FRqBQEXU4oZSIU/pZYOueLhMrZN+6Del6VXM/ioagqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iGMnfxgRUuzkZj0186bg5bXfUoKBr1hp5btjaRwB6pvTf/wui
	obVpL4ih6yquNlI3UVhnQUOOS/GnK0DKDeIpuiq4KIOHVfq3mxaUAP1Z
X-Gm-Gg: AYBFou06rYSU2Y+Vydzriov2weYPuQvtpQskyezQyenAiGIgimZgO5DVkxWHl7CNQ+4
	NabrPtvbvp1uTzAdLp2WxShh77yE8rHGcICIKt6FLVbfpqET5HMUWqbdxyXd5bBHmkWqSWhvszi
	FerviJ25pWL+9iVZxh0QIWfcmSolyCzLuaXreg38eiKR0yqYU96Wu+yHMZJvkpMRx2LiBHhuALh
	mfWO6sS6U5bi/5jiQaROfPlJP45ecz7gwzOPiJ4Qx0seq72lvi496KRN2oAih61xaqDBiHM4t8a
	hAQ+EavtzbmFZYR7U6kgxjTnEljKSBuzAT9mhLTUF+AtL0VncSnnHvWmFjcgzP+a9mdMF2YhW5S
	q/LQv3/N3OPtERzO5KexNGIe4NnNnY1bxda/Nf/cKC/Xqmi5ciSom7xLTHMvdnrcC8fEdmS0xbW
	hVC7965neB4D1G17n8J9SicbvOLwZM7UBZ0YhnrDGLtFcJLjAgwtHhqZYCbWqtrNnVSRa5V2jxs
	YgZwX+h+sPDIVcXZAgzG3sZV/fqZxRWbGy/jas7uiJZ+XkMO0xkUASEoDcKjISq90TBGqcydHkN
	JaYNMA5hKRbdTELHdAhHQlsh+Ze1rKEjjAyOIZcGS27OhdoGbEWGiFhnP+VKYqX1Ak6L0j3FysK
	Hq4CKvBih5f5VHs12aCLIxTlI2zoprqJKs97ls/IN7YFi15AU/18SE7/v02WCgoGva4m2zPcvTy
	xHwdF+4E8=
X-Received: by 2002:a05:600c:a49:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4ac17ffb2ffmr301644235e9.9.1793710234379;
        Tue, 03 Nov 2026 04:50:34 -0800 (PST)
Received: from localhost.localdomain ([2a00:102a:403b:96a2:e8a9:f4a7:ed37:36a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a5372d8bsm61406425e9.0.2026.11.03.04.50.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 04:50:33 -0800 (PST)
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
Subject: [PATCH net v2 3/5] net: mvneta: serve the TX queues in weighted round robin
Date: Tue,  3 Nov 2026 13:50:19 +0100
Message-ID: <20261103125021.70845-4-pepe.schlehofer@gmail.com>
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

