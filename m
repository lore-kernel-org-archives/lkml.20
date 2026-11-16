Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794856226;
	b=Wive8xIrkCV44qn8rhLJp2eqMOM/y/Xg3ReIlh+p9dhWvH7OnH0211pJL5viu0WWWxzJ
	 RvibphdY4HtmOcfycck9z4hFYb5mW8EYfmUMb3GL+mUBwXiVfz4bWSxUfiyUiRsCwsYEQ
	 YFBuqQSjSfJVDMguz2NDdDAR3ziWPGrr6kEW6tem6WklHOpKn1IBp/VHDeu+fRvxqXQLw
	 RcmGg3maoHsIm2Ons2zeNt619C2kDUJr1Y14z4OHLke262SFgu0WChGxCxaq6fcHluK81
	 6bIapNcTafu/aEpbXn6sG2FI5MG5OKEfsaezwCViu9bOigS3J/d1FQo2ZQ95RUpGqgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Y/GkL4r6ak/xaxe1sQB/4Z5Stga1ZmlArTHziFQUcSQ=;
	b=vrbjlHvCgFPnrcf46BsCnCOZMUIm4yWwsCAk9XgKBhvx30kxgrSYmsQWG+DSvOPCT9qY
	 8CPzdLK5tdLgcHhUcst/4vZFqLRLPvl81ntQXAyz6wLmMYsmEwljdsMQHpihhPiHE6e83
	 /HBEc1cu4zaHvrU2KT3LM64kWbxkWMNpbVwpZx9paFn4fiHy2sL1d9R4vQbuxbhAVKnuC
	 Q0ctxZ4LorLLfSHeBxeZJURk5r30qFxjyuCiu9dkC+VANDuj4x7Tf3Yu4BwE3KaK6eSXq
	 CS4Fy/Wj7/ik7BnSWA4FzT8444gvs4Z31VUkt7Y7j6d5q6Xiktd6yRdYiTUKhTNMlzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=eQZjVCWq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AA660A3816;
	Mon, 16 Nov 2026 19:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3AA660A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=eQZjVCWq
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 09C4C205A35;
	Mon, 16 Nov 2026 20:10:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/GkL4r6ak/xaxe1sQB/4Z5Stga1ZmlArTHziFQUcSQ=;
	b=eQZjVCWqPuBauiStQPxwDa7cJX0pvm3OS0YYh+AwDN7XV9l/j9tcBTe7O8WEm7OVg61mtD
	86eusFiRe+/tdqhTRbQAJkcXIDkHLv0+P+ACFNA2sSi+ioErBOjPE8sMXfPa66+2RW9tSL
	nKNrQUi/tA7gMtWzmPy8gLVX/AaZRmPwAw14VVuXbr9fbVZRZIJiU27TgUd5ETPxW98xUq
	gHxnyQt9dA+11MTna/UoJ+23s3HwAY3P4rRWStLRPtzMnQLhOlIssn/qOLbVYVJqVCJSbb
	nz9EGJAXBPWMlSRwrVUOjCwQoz23sapQ4L/I7VCdMOvqdz8wgLTaUikv/y6HFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/GkL4r6ak/xaxe1sQB/4Z5Stga1ZmlArTHziFQUcSQ=;
	b=Ab7O90l5ZIe5+aCmxYPUuHpIT8OzLfuYsiZ+mUGbZ86Cy9hPurPN6Q5j1sRjoUe7vHeaLm
	7NTRUWuxsKa0X9msQxsoDhPUWcO62X9Xe0up4twOk5CTF6t3F3IhwqnYTGdePLX0wFEd53
	OXg/lo5ehgyWKPM5M1AtlRai3eqhm2soAEJGTgMYurXVl2slipV//UxyZUs0w/CoxNUXjx
	Oj51lYACeBxuVL//HJTWCyvz7cjwRpiq4N8mg7Tq4xL+3pTduF83uvYiYjmtJ9RlAoE18a
	9XGwTvkvPSI6SqYb2a05gvIO+vX4RbRwRgZxfrZY55Fhbx6GyiF/bHX3Ty7TbA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794856220; a=rsa-sha256;
	cv=none;
	b=QL6kfZtHqrbcyV5X0RrKvUGSYqIO2fYD7oifjBtLVSeBD0YskeyUm5hshk1s0GYNPOQA74
	sPWQ2YEDj8eVh+u+CdbEcWbQmJtltaZdAxPrUzVHKQ5e8gJhLhLxLR0wWW6DiVG4D/AEZx
	/qwxrJJrA7HT7+U0+zlu8XQbraJfDKfkrdy2rnnvzqUi9ZDit9ZOOhRh1cyvq8O4MHTeJZ
	ULoFfGsMTowFz+FkuTuavmWUCaLVTNU/VVTPSRoE2H35cT9wbO0XY66cw4ODuO2OKPP9iT
	AI/lHaACRtHzwKerQ0vE97P18NW72oj0fLKjiHmiRjlwf6c2FDgzRS97WnNJgg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id B481C381D1F; Mon, 16 Nov 2026 20:10:15 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Mon, 16 Nov 2026 20:10:17 +0100
Subject: [PATCH net-next v3 06/10] net: dsa: realtek: rtl8365mb: store the
 egress queue count per chip
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261116-rtl8365mb-dcb-ingress-v3-6-657f5fdb4db7@pengutronix.de>
References: <20261116-rtl8365mb-dcb-ingress-v3-0-657f5fdb4db7@pengutronix.de>
In-Reply-To: <20261116-rtl8365mb-dcb-ingress-v3-0-657f5fdb4db7@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>
X-Mailer: b4 0.14.2

Store the number of egress queues in the per-chip info structure and
advertise it through ds->num_tx_queues, following the ksz driver
(struct ksz_chip_data.num_tx_queues).

The queue count is a per-chip hardware property, and this driver supports
several chips of the rtl8367c family. All currently supported chips expose
eight queues, but keeping the count in chip_info lets the QoS code that
follows program the priority-to-queue map via the ieee8021q helpers for
whatever queue count a chip carries, so the 802.1Q collapse is correct
rather than hard-coded to eight.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
Q: Linus: why is the queue count not in struct realtek_variant?
A: The count is per chip, while realtek_variant is per subdriver, and
rtl8365mb serves several chips. The QoS code added later in this series
reads ds->num_tx_queues, as Linus suggested in his v1 review, so
RTL8366RB can advertise its own count the same way.

Changes in v3:
- No changes.

Changes in v2:
- drop the num_tx_queues comment, which restated the assignment
- keep the Reviewed-by tags: v2 only drops a comment
---
 drivers/net/dsa/realtek/rtl8365mb_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index b57b306cbf5e931a36f52ab6b57de881b5dd94d8..7010e51d63fae7fd416bcde44e506b68f250ae50 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -711,6 +711,7 @@ struct rtl8365mb_extint {
  * @extints: available external interfaces
  * @jam_table: chip-specific initialization jam table
  * @jam_size: size of the chip's jam table
+ * @num_tx_queues: number of egress queues exposed by the chip
  *
  * These data are specific to a given chip in the family of switches supported
  * by this driver. When adding support for another chip in the family, a new
@@ -724,6 +725,7 @@ struct rtl8365mb_chip_info {
 	const struct rtl8365mb_extint extints[RTL8365MB_MAX_NUM_EXTINTS];
 	const struct rtl8365mb_jam_tbl_entry *jam_table;
 	size_t jam_size;
+	unsigned int num_tx_queues;
 };
 
 /* Chip info for each supported switch in the family */
@@ -747,6 +749,7 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 		},
 		.jam_table = rtl8365mb_init_jam_8365mb_vc,
 		.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
+		.num_tx_queues = 8,
 	},
 	{
 		.name = "RTL8367S",
@@ -760,6 +763,7 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 		},
 		.jam_table = rtl8365mb_init_jam_8365mb_vc,
 		.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
+		.num_tx_queues = 8,
 	},
 	{
 		.name = "RTL8367SB",
@@ -775,6 +779,7 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 		},
 		.jam_table = rtl8365mb_init_jam_8365mb_vc,
 		.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
+		.num_tx_queues = 8,
 	},
 	{
 		.name = "RTL8367RB-VB",
@@ -789,6 +794,7 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 		},
 		.jam_table = rtl8365mb_init_jam_8365mb_vc,
 		.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
+		.num_tx_queues = 8,
 	},
 };
 
@@ -3284,6 +3290,8 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
 		goto out_teardown_irq;
 	}
 
+	ds->num_tx_queues = mb->chip_info->num_tx_queues;
+
 	/* Start statistics counter polling */
 	ret = rtl8365mb_stats_setup(priv);
 	if (ret) {

-- 
2.47.3

