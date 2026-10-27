Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117092;
	b=KyWRJpxEhniTPx+gaFWke1FZuDqcXFxEOsQsQ7AwW40HByOBqx7OXwSHsA9d/OiGSnaR
	 PEE41j+sdy7Y4bTbVGREG9NzB9rcszrg0Q7U4NLHs5Yw0rqVd0LAC6WreD1YTw+e/LohB
	 SSAsh18yGcz/TcQ+Thfi0hIDHikDDGGRdPAKfhN+FYpvPoiSSuP7hdfLiFU3fYLtPl2dC
	 pjFfv3Waedfy7f6RzwHVZKKpdIrIePPiSSiRcPZ25aFtiS5VGuaLIYsJZk0QkWEiqAR6x
	 vwgV6vgjLMSGtQ4oRdSYiHPan1JCVuNhFBQUnM3+jRNDIV6weNFHExtZoaEOdfhqSlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117092;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/21xtxZHjWCZgGFm+XZRzJ9IRJSlkOWE8jN8ms67c0Q=;
	b=koFPmK7ZwG4vaX47jS/l4oKHp26lrdm/Yev2j1WACcyjbrE+bL+clYcx61KrQYhxZ0Ay
	 hti/0Dpjverre5gsiRREIiHsLX0SRE/KplMWl+Nl2RhXy60+jhgqWSjQ+7J2qRMfUlDXo
	 OngGQwT+HyDi9R/Sy00ABr81me3gj7nn/wZn8rSYK0iCeS/vqKTHbPClAZtsdA1QBMuFu
	 ugUDMa3/ZgIKfwZ4GR+pavWMM8upkPENqpw890OAmFuNbxgvLWP0bEFzoLhAUHZ6O3exc
	 4s9OGxgueyH7Xkw5ydT8r/8HTbtcNrtK5CcUBiy23cRBSUMqmzvxmokPLhXql4JLaQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YyeF4GlW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422C960A2619
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YyeF4GlW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525191F031E3;
	Tue, 27 Oct 2026 16:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793117091;
	bh=/21xtxZHjWCZgGFm+XZRzJ9IRJSlkOWE8jN8ms67c0Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YyeF4GlWIZyjomazgqpFrr1GJzJSdjn5Ze/+cnASHxbA5yEjp+pShqxBk9EOpRo8h
	 MbQW2CmZOY7dp1voDvmpEzlLV97PtPEG8fxymURhnY6c9aZPCQQTtJDLbMNLWdTnQd
	 myAzR3liZZqDJ3JX6mK0q1LOSIKhWWn3QJ0r4u1s=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 17:04:36 +0100
Subject: [PATCH 3/9] w1: ds2482: set the strong pull-up with its byte
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-llm-char-misc-w1-v1-3-d2e6bfafb6a4@linuxfoundation.org>
References: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
In-Reply-To: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=3875;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=FP/KGqpnRHlHI2W3N0TUL0Hco1oHG4iT5kKch5GQaz8=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPTs84Omdx8ha1lT5ShUkL362sOip91GlPh51Ek/LDN
 0/Oy+Qd74hlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJJFUxLGgWVoguYHCfFOGv
 XhN2puv1h8drghkWrOh2ZLAofhbtO3/xzV3XGXUE/e6pAgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

The eight channels of a DS2482-800 are eight independent 1-wire masters
for the w1 core, but share one I2C device. Each bus operation consists of
several I2C transfers: select the channel, send the command, poll the
status, set the read pointer, read the result. access_lock keeps the
operations of the channels apart.

ds2482_w1_set_pullup() polls the status, writes the configuration and
polls again without the lock. Polling sets the read pointer of the device
to the status register. In the middle of a read on another channel, after
that one has set the pointer to the data register, this makes the read
return the status instead of the data. The cached copy of the pointer in
pdev->read_prt can go wrong as well.

The lock alone is not enough. The strong pull-up is a setting of the
whole chip which is used up by the next byte. If an operation of another
channel gets in before the byte it was meant for, that channel gets the
pull-up, and the sensor converts without power.

So only note the request in ds2482_w1_set_pullup(), and write the
configuration in ds2482_w1_write_byte(), under the lock and after the
channel has been selected. The w1 core calls the former right before the
latter, under the bus mutex of the channel.

Fixes: 9c95bb6f25ff ("w1: ds2482: Added 1-Wire pull-up support to the driver")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/w1/masters/ds2482.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/w1/masters/ds2482.c b/drivers/w1/masters/ds2482.c
index cbd11bc61274..5498bb04f7ce 100644
--- a/drivers/w1/masters/ds2482.c
+++ b/drivers/w1/masters/ds2482.c
@@ -103,6 +103,7 @@ struct ds2482_data;
 struct ds2482_w1_chan {
 	struct ds2482_data	*pdev;
 	u8			channel;
+	bool			spu;	/* strong pullup after the next byte */
 	struct w1_bus_master	w1_bm;
 };
 
@@ -336,6 +337,19 @@ static void ds2482_w1_write_byte(void *data, u8 byte)
 	if (pdev->w1_count > 1)
 		ds2482_set_channel(pdev, pchan->channel);
 
+	if (pchan->spu) {
+		pchan->spu = false;
+		/* the wait above and this one are crucial, otherwise devices
+		 * might not be powered long enough, causing e.g. a w1_therm
+		 * sensor to provide wrong conversion results
+		 */
+		/* note: it seems like both SPU and APU have to be set! */
+		ds2482_send_cmd_data(pdev, DS2482_CMD_WRITE_CONFIG,
+				     ds2482_calculate_config(DS2482_REG_CFG_SPU |
+							     DS2482_REG_CFG_APU));
+		ds2482_wait_1wire_idle(pdev);
+	}
+
 	/* Send the write byte command */
 	ds2482_send_cmd_data(pdev, DS2482_CMD_1WIRE_WRITE_BYTE, byte);
 
@@ -420,27 +434,19 @@ static u8 ds2482_w1_reset_bus(void *data)
 static u8 ds2482_w1_set_pullup(void *data, int delay)
 {
 	struct ds2482_w1_chan *pchan = data;
-	struct ds2482_data    *pdev = pchan->pdev;
-	u8 retval = 1;
 
 	/* if delay is non-zero activate the pullup,
 	 * the strong pullup will be automatically deactivated
 	 * by the master, so do not explicitly deactive it
+	 *
+	 * The setting is used up by the next byte on any channel of the chip:
+	 * ds2482_w1_write_byte() makes it, in one go with the byte.
 	 */
-	if (delay) {
-		/* both waits are crucial, otherwise devices might not be
-		 * powered long enough, causing e.g. a w1_therm sensor to
-		 * provide wrong conversion results
-		 */
-		ds2482_wait_1wire_idle(pdev);
-		/* note: it seems like both SPU and APU have to be set! */
-		retval = ds2482_send_cmd_data(pdev, DS2482_CMD_WRITE_CONFIG,
-			ds2482_calculate_config(DS2482_REG_CFG_SPU |
-						DS2482_REG_CFG_APU));
-		ds2482_wait_1wire_idle(pdev);
-	}
+	if (!delay)
+		return 1;
 
-	return retval;
+	pchan->spu = true;
+	return 0;
 }
 
 

-- 
2.56.0

