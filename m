Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956878;
	b=ISSESM7cl5wgWMKpBEeDcQdvNSt+odMOPCpYSc5hvM+lh/zpgsWuq0nOKUVWQpy6o9zo
	 G3clT7KOqYoiGwaLRzK9xbFsgGNnZMmDUGA9vyOqdc8wXh9CASwrYpGB8KmvHnGzmsJBo
	 pcVzEw5b7mAB9PlGYPkCp3U6xWtqqJTKaIzDEoKZikvC4k+CJ0lxWUA8J4z2jSBi1y9HV
	 rvB7nbpJ4D47Qv632CEAGYG4PxAe3pFgZ6oez9ZSsiqYX0z4TMdmAU9Q2I5CroNj2DCe4
	 P0uJ5BuLx2HedYFBx2E0c+8l5fzx8HlaZacYah6ITja2DiUFUZa+G67JwDmz0gPZysg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956878;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GvZBAEU8dxyAwu/EctxNWLT4xXzkZ6n1H29EGANwqog=;
	b=1oDwvFHzh0xLHfBceoqadYlOkKYsQzBn+uourU7M8jCLu2QLnw0br/TXmfOQEhC36Fwk
	 V72BpQQSylsHzSalyq0InAtiBijXR1SC1HjJLgaQ8SF4H5ojQPflsdUiG7TirhJLC9AWc
	 flTE9jusWdooePK7irwOSqEw/pqMiPivN4+P6ayWZBRdzdVwUJ+KWhtHPr0i9OvYhoTzh
	 BoD3LOkYmKlYF1pdhia1MxaJ3NZCwjE3etBIBwn/9sd6PCLXJxW37RKlJ80GE6BMthOGq
	 4WMnmuLKAe4WQ2qOgFIqO2ZStmKgGlzqUIxIBIb1XIHBiVgzXyyLF02mpqOxlHu5C9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foxmail.com;
	spf=pass smtp.mailfrom=foxmail.com;
	dkim=pass header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=Q3pU2m0z;
	arc=none smtp.remote-ip=162.62.57.210
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26140606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26140606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=Q3pU2m0z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1793956867;
	bh=GvZBAEU8dxyAwu/EctxNWLT4xXzkZ6n1H29EGANwqog=;
	h=From:To:Cc:Subject:Date;
	b=Q3pU2m0zVs2GZcAwN99ypsUbtIDQ7t8CZmoHzrovDoqsfl3GcejxUgoNO/r03bh6N
	 DVFnTHYjlcC+FAFIqiQ0B7mt4M1y62HeyQCHf3b8SIkldwumAUsc6A/mKCMyPeEKjd
	 wxSU6gLlci/Y5+W3IgQuq8+zcXknCepVcrqD04/E=
Received: from LAPTOP-TKBJAGN4.localdomain ([27.38.177.45])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 542216C5; Fri, 06 Nov 2026 17:21:02 +0800
X-QQ-mid: xmsmtpt1793956862t3gymxzx9
Message-ID: <tencent_D0E2628A4AA62FB8B265B2A28BBFA9566B07@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9X0IZDcDm4iVakmb6joYjsPsfTRE7OaZgQkREcxV9ZjKTDK00Hnm
	 hUBgYvwsAcqgahNYVoGUN5rrbpBNdmeqUM3FTNkDBi2KC7N5km64977NdtCmPILdqWc6nooP6btY
	 CivS+6lSDtGK9ezJIziIjfwiZSpXX9S+b8fQ+7YfAbvRQ5M0nYArCxdN2Wo79dl3rmtFRCRFY/j+
	 tfY98g1CIi7L0E34fO8jh11ByxLJPFNAR6DE3Ufq9IWKXEbYlHoxx+ALZiZhGUoOoSHMqHXJ4FRg
	 Pc5hk7UjXtvWdbdXa/f585Tq92Zh5BkdVg6QcjaUHqQsInior5KSRALTlfb0KCf6DSI0TditDp+S
	 lMrOookH7OKE7MNBHSk8BwgTYv1tOqE+exqyyq6JN5m8Lglk8gGITK2vuFoDwRfuXoUwwjutz3D6
	 vg+arRzZpQfNfQPHcRHRtUk1Nsu4szO44f9+qxozisg+2DKO5GkP2ecyJ6cqZLI1MXP+w8gv9S1C
	 7TlyMcPGoUTjFFvGoPGrxQQ77YFkpamLJKHDIyuKTmUcIcAhof1r8XQoq9aBjCZyJUhgmG4yCfTt
	 hPfMA/g3pySbH/i/tpadJaJkYZYcbbnOhDWlVY3Ae5yEE8Epe7L4jmuO1GwkU/k5IP4g2XcM97Kk
	 kDWcy1OBhmISosN/cZsFTMieZIyUFT8ZXE1O7uFaZ7KYNxfLDH5DznVdpOAMSrAvjp/IYxIhzNWo
	 TI2nnc6dou2jxm1ouL/T/dJP34qXMiOKopYh7Feyw1XUqm5DN9iw5XDP8l0LLs4ZnWiDE06EdqvC
	 GWrEiesFuITSgFHbw4YhFTPJ3uzT26ZbkTxKLAbeGGDiQYvwnkU2avYA3SE/EI6d0GeuKFnbJ6mR
	 WR7sOZ5iO+EHsmH/8kS6L2Hsr+UJxsRVB+0H5V6UxVDExjZmzpwExf2BDUoXbyBiyBuY1D3RNFio
	 ivUkIkotXXd6/MVIlVs8LQr1FQAqM0ARvaicO762Z7GaMw8NWmX/zn0AYq48tjPgSCB0cNI2bnf6
	 NOFgCeEIj+pW2wQ1NoaXJzvakC9qwDnSQ9XA2QLjpLkr1bD+O+1dGxKPwG3GI=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Haobin Jiang <lemonoutput@foxmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-i2c@vger.kernel.org
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Carlos Song <carlos.song@oss.nxp.com>,
	Vincent Jardin <vjardin@free.fr>,
	dillon.minfei@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haobin Jiang <lemonoutput@foxmail.com>
Subject: [PATCH v6] i2c: imx: honour I2C_M_IGNORE_NAK
Date: Fri,  6 Nov 2026 17:20:36 +0800
X-OQ-MSGID: <20261106092036.4509-1-lemonoutput@foxmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

The driver rejects I2C_M_IGNORE_NAK with -EOPNOTSUPP, preventing
NAK-tolerant wake-token and SCCB transfers. Honour the flag in PIO
ACK checks and force flagged messages to PIO to avoid DMA stalls.

Restore acceptance of I2C_M_STOP for ov2659/SCCB compatibility [1],
without implementing STOP between messages.

Following Sashiko's report [2], reject flagged zero-length reads before
START with -EOPNOTSUPP to avoid an existing receive-path overrun.
Unflagged zero-length reads are unchanged.

Tested on ALIENTEK i.MX6ULL mini with this patch on f7813d226107,
using /dev/i2c-0 at 100 kHz and unpopulated address 0x60. The test
kernel reports 7.3.0-gf7813d226107-dirty (patch applied but not
committed). Logic analyzer CH0=SCL, CH1=SDA, sampled at 2 MHz.

On the same patched kernel, an unflagged 3-byte write returns -ENXIO
after the address NAK (9 clocks); with the flag it completes (36
clocks). A flagged 4-byte read returns ff ff ff ff (45 clocks), and a
flagged zero-length read returns -EOPNOTSUPP before START. Captures
and serial logs are in [3].

AI assistance: GLM 5.3 assisted with driver code from the author's
problem description; GPT-6.1Sol/Codex assisted with the test harness
from my test plan and polished the submission text. I have reviewed
the content.

Link: https://lore.kernel.org/linux-i2c/392c76a6-1ba5-4bc1-bfba-524025359042@oss.nxp.com/ # [1]
Link: https://lore.kernel.org/imx/sashiko-outbox-187010@kernel.org/ # [2]
Link: https://github.com/JHB11Hinson/i2c-imx-ignore-nak-test # [3]

Signed-off-by: Haobin Jiang <lemonoutput@foxmail.com>
---
Changes in v6:
- Clarify the I2C_M_STOP comment; no functional change from v5.
- Rebase onto f7813d226107; the base driver is unchanged from
  123cffeca4a3.
- Rework the commit message and review history following Carlos Song's
  feedback, and document AI assistance.
- Retest on an ALIENTEK i.MX6ULL mini board on the new base.
- Link to v5: https://lore.kernel.org/linux-i2c/tencent_E6D69775D91AD9FE45C994B3755CB1452506@qq.com/

Changes in v5:
- Reject zero-length reads carrying I2C_M_IGNORE_NAK before START,
  following Sashiko's review of v4.
- Link to v4: https://lore.kernel.org/linux-i2c/tencent_877C99956190215D644EB959DF1663542A0A@qq.com/

Changes in v4:
- Rebase onto i2c/i2c after Vincent Jardin's series was merged as
  c2867bb0fa1d ("i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART").
- No functional change from v3.
- Link to v3: https://lore.kernel.org/linux-i2c/tencent_342A87BFCECA70C9982E68A79AAD878B6909@qq.com/

Changes in v3:
- Rebase onto Vincent Jardin's I2C_M_REV_DIR_ADDR and I2C_M_NOSTART
  series; move flag checks to i2c_imx_check_msgs().
- Keep ignore_nak=false in the DMA write ACK check and leave
  I2C_M_STOP unhandled for compatibility, as agreed during review.
- Fix spacing, disclose AI assistance and record v6.6.44 backport tests.
- Link to v2: https://lore.kernel.org/linux-i2c/tencent_E6A52FBBB25132C90B8E296FEB96E2C8CA07@qq.com/

Changes in v2:
- Honour I2C_M_IGNORE_NAK on reads and force flagged messages to PIO.
- Reject I2C_M_NO_RD_ACK; leave I2C_M_STOP unhandled for ov2659/SCCB.
- Link to v1: https://lore.kernel.org/linux-i2c/tencent_0D2E46A782AC418BC52A1BBF04CA1AC98E09@qq.com/

 drivers/i2c/busses/i2c-imx.c | 37 +++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63..623503dda 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -612,9 +612,12 @@ static int i2c_imx_trx_complete(struct imx_i2c_struct *i2c_imx, bool atomic)
 	return 0;
 }
 
-static int i2c_imx_acked(struct imx_i2c_struct *i2c_imx)
+static int i2c_imx_acked(struct imx_i2c_struct *i2c_imx, bool ignore_nak)
 {
 	if (imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR) & I2SR_RXAK) {
+		if (ignore_nak)
+			return 0;
+
 		dev_dbg(&i2c_imx->adapter.dev, "<%s> No ACK\n", __func__);
 		return -ENXIO;  /* No ACK */
 	}
@@ -971,11 +974,15 @@ static int i2c_imx_unreg_slave(struct i2c_client *client)
 	return ret;
 }
 
-static inline int i2c_imx_isr_acked(struct imx_i2c_struct *i2c_imx)
+static inline int i2c_imx_isr_acked(struct imx_i2c_struct *i2c_imx,
+				    bool ignore_nak)
 {
 	i2c_imx->isr_result = 0;
 
 	if (imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR) & I2SR_RXAK) {
+		if (ignore_nak)
+			return 0;
+
 		i2c_imx->state = IMX_I2C_STATE_FAILED;
 		i2c_imx->isr_result = -ENXIO;
 		wake_up(&i2c_imx->queue);
@@ -988,7 +995,7 @@ static inline int i2c_imx_isr_write(struct imx_i2c_struct *i2c_imx)
 {
 	int result;
 
-	result = i2c_imx_isr_acked(i2c_imx);
+	result = i2c_imx_isr_acked(i2c_imx, i2c_imx->msg->flags & I2C_M_IGNORE_NAK);
 	if (result)
 		return result;
 
@@ -1017,7 +1024,7 @@ static inline int i2c_imx_isr_read(struct imx_i2c_struct *i2c_imx)
 {
 	int result;
 
-	result = i2c_imx_isr_acked(i2c_imx);
+	result = i2c_imx_isr_acked(i2c_imx, i2c_imx->msg->flags & I2C_M_IGNORE_NAK);
 	if (result)
 		return result;
 
@@ -1249,7 +1256,8 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 	if (result)
 		return result;
 
-	return i2c_imx_acked(i2c_imx);
+	/* I2C_M_IGNORE_NAK messages never take the DMA path. */
+	return i2c_imx_acked(i2c_imx, false);
 }
 
 static int i2c_imx_prepare_read(struct imx_i2c_struct *i2c_imx,
@@ -1268,7 +1276,7 @@ static int i2c_imx_prepare_read(struct imx_i2c_struct *i2c_imx,
 		result = i2c_imx_trx_complete(i2c_imx, !use_dma);
 		if (result)
 			return result;
-		result = i2c_imx_acked(i2c_imx);
+		result = i2c_imx_acked(i2c_imx, msgs->flags & I2C_M_IGNORE_NAK);
 		if (result)
 			return result;
 	}
@@ -1401,7 +1409,7 @@ static int i2c_imx_atomic_write(struct imx_i2c_struct *i2c_imx,
 		result = i2c_imx_trx_complete(i2c_imx, true);
 		if (result)
 			return result;
-		result = i2c_imx_acked(i2c_imx);
+		result = i2c_imx_acked(i2c_imx, msgs->flags & I2C_M_IGNORE_NAK);
 		if (result)
 			return result;
 	}
@@ -1416,7 +1424,7 @@ static int i2c_imx_atomic_write(struct imx_i2c_struct *i2c_imx,
 		result = i2c_imx_trx_complete(i2c_imx, true);
 		if (result)
 			return result;
-		result = i2c_imx_acked(i2c_imx);
+		result = i2c_imx_acked(i2c_imx, msgs->flags & I2C_M_IGNORE_NAK);
 		if (result)
 			return result;
 	}
@@ -1613,8 +1621,9 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 	return ret;
 }
 
+/* I2C_M_STOP is not implemented between messages; leave it unhandled. */
 #define I2C_IMX_UNSUPPORTED_PROTOCOL_MANGLING_FLAGS \
-	(I2C_M_IGNORE_NAK | I2C_M_NO_RD_ACK | I2C_M_STOP)
+	I2C_M_NO_RD_ACK
 
 static int i2c_imx_check_msgs(struct i2c_msg *msgs, int num)
 {
@@ -1625,6 +1634,12 @@ static int i2c_imx_check_msgs(struct i2c_msg *msgs, int num)
 		if (msgs[i].flags & I2C_IMX_UNSUPPORTED_PROTOCOL_MANGLING_FLAGS)
 			return -EOPNOTSUPP;
 
+		/* The receive path cannot handle zero-length reads. */
+		if ((msgs[i].flags & I2C_M_RD) &&
+		    (msgs[i].flags & I2C_M_IGNORE_NAK) &&
+		    msgs[i].len == 0)
+			return -EOPNOTSUPP;
+
 		if (msgs[i].flags & I2C_M_NOSTART) {
 			/*
 			 * NOSTART continues an already open frame. The first
@@ -1712,6 +1727,10 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 		use_dma = i2c_imx->dma && msgs[i].len >= DMA_THRESHOLD &&
 			msgs[i].flags & I2C_M_DMA_SAFE &&
 			!(msgs[i].flags & I2C_M_NOSTART);
+
+		/* A NAK'd byte may not generate a further DMA request. */
+		if (msgs[i].flags & I2C_M_IGNORE_NAK)
+			use_dma = false;
 		if (msgs[i].flags & I2C_M_RD) {
 			int block_data = msgs->flags & I2C_M_RECV_LEN;
 

base-commit: f7813d226107618bac34f311bd613b658215f2c6
-- 
2.34.1

