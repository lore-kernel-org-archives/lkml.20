Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E36A419FC5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137195; cv=none; b=fjeTNXe+y3u+Ht8OaoFlDT6kHx0BSxOR3Izz1NxC1ayKfBfcorTn1NC7eosXrkxFjQvyoKGnRNoxUTbEw1z+1o57SxkML/eLPRVVxoSbx/dAR8kCmObqm3QmY4noJmqoTDNR5ApxNo6gl9ju5yz7E5UH7H3mBykvUWZOSptlPf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137195; c=relaxed/simple;
	bh=RkQa2rwd6kpRSbwwN11dZQPlOLf/pA03xbAsLQIV+pw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FosJummbRQO21EcbFDxlXbxRnn3FizaXCdb1BueiuXred6VbaaNDUfFAksJmiMrAB+8Tv7HmSAaVKJ7Dtzg7kHeK8H7Ry8xeYG9dbCUo85/qhtXruQgBY8LF7UUBzepTsV00QkLy19alRnpXVEnlhYhAt9k9FQAtWaiOg3IPfCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XWQIWM3X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XWQIWM3X"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AB3D1E4;
	Fri, 16 Oct 2026 09:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792137061;
	bh=RkQa2rwd6kpRSbwwN11dZQPlOLf/pA03xbAsLQIV+pw=;
	h=From:Date:Subject:To:Cc:From;
	b=XWQIWM3XZ+Xc/fIjcErk6jQJWAIEZY2SHRAXNZxA1wnP0Ttecjall8+2WLWiu9lWb
	 3KqYU0ueYMtJSIVtHHApS8csllZj/I3qfzPItaPtPhEfVIjPYXxcfjzYveRaKvweSe
	 BZJFzHOdUaIj2dRGwu9Pb4DqkJakMNvv4C99Zt9o=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 16 Oct 2026 10:52:43 +0300
Subject: [PATCH] regulator: rpi-panel-attiny: Fix probe failure after a
 host cold boot
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-attiny-probe-fix-v1-1-96337ba58dfa@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAMrX0WoC/yXMQQ5AMBCF4avIrE3SVkO4ilhQg7EoaUuIuLti+
 b3k/Rd4ckwequQCRzt7XmyETBMwU2tHQu6jQQmVSyFzbENge+Lqlo5w4AOFJq2LTBVmKCHeVkd
 x/pJ189tv3UwmvB247wdtOgiRdAAAAA==
X-Change-ID: 20261016-attiny-probe-fix-04e447327cf9
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Marek Vasut <marex@denx.de>
Cc: Devarsh Thakkar <devarsht@ti.com>, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1942;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=RkQa2rwd6kpRSbwwN11dZQPlOLf/pA03xbAsLQIV+pw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq0dfaZ0x7ropWYJZzoPlEdU1vP5ExjlwAFN3I3
 cc6q5MbBkyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCatHX2gAKCRD6PaqMvJYe
 9ej/D/9s+TzEuyKHV79leyCQzEr8Mr+kiQApm7HSH/g71zVhSRQfPBZNK8zwt4lcg+fmEJuDWP1
 H4BLZOTeFqxLHaKg1lvQTCtsQqMPaV6X8mFitqDSMw12VmL7b8khY3fxMBNiCXzMUSe86QKUCN+
 bn/BBahusG+Pj04aVu/hyNxvwBAG5FP5XBKnh+0ndRl5IJVl2uTWludsUEu12+vK3RVb+JNYnZN
 ZNuABzVgssGJUjLGZL54pRKqVrmmeUVN4KPULQ6uhikf4qeP7s8Sdn9H6LibuMepl0d+QCxfZta
 jxx7IcgFUEN21Qd3BH+dJF7ajpk5rkHus/pL/25h3RokUbLnw8NAXwRY0gn6NGd+282Psb82I36
 RhBCY/SRqwj4lv36gK+7iaQ1vKSYDISI4k4fRGtP2g9AhHq7zGIMVG8u9C+sBb+7xu40JvQrc6v
 Dw74ULTIvnfDfCV/8MHFYuQ6gh5vC7Iajt0i9e1IKqKQDBF9W8kcg1p4KiWShPjynGnjMDIvsjy
 xIrhCHZfXHOJOYRjtQ1yHMq5bs1tOYq+/145nAVk+LLjHkXJBLRxNFf8OnVweW7nircnvAZe+J+
 gJ9yFV2AH7556sa6e2mxrWeHXEGsjl/EpsxgDlByK/Yz33lHd/2KrU1XHI8eMhDYCOL0YeIxaOP
 ago68jP8ADYib5A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

attiny_i2c_probe() reads REG_ID with attiny_i2c_read(), a function added
in commit e4a7e3f741f7 ("regulator/rpi-panel-attiny: Use two
transactions for I2C read") specifically for fixing REG_ID read failures
at probe.

On TI's BeagleY-AI (but also on other TI boards tested) with the
Raspberry Pi 7-inch touchscreen, the first I2C transfer to the attiny
after a cold boot of the board usually fails, so the probe fails.
Retrying the transfer once fixes the problem.

It is unclear why this happens, but as the earlier commit adding
attiny_i2c_read() shows, attiny seems to have i2c issues. It is not out
of the question that the issue could be on the TI i2c side, but as the
other i2c peripherals (like sensors) work fine, adding this workaround
to attiny driver feels sensible.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/regulator/rpi-panel-attiny-regulator.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/regulator/rpi-panel-attiny-regulator.c b/drivers/regulator/rpi-panel-attiny-regulator.c
index 3020839b9ef1..77da916852e1 100644
--- a/drivers/regulator/rpi-panel-attiny-regulator.c
+++ b/drivers/regulator/rpi-panel-attiny-regulator.c
@@ -249,7 +249,13 @@ static int attiny_i2c_read(struct i2c_client *client, u8 reg, unsigned int *buf)
 	msgs[0].len = ARRAY_SIZE(addr_buf);
 	msgs[0].buf = addr_buf;
 
+	/*
+	 * The first transfer after a power-up of the host usually fails on
+	 * (at least) some TI boards, so retry the transfer on failure.
+	 */
 	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (ret != ARRAY_SIZE(msgs))
+		ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
 	if (ret != ARRAY_SIZE(msgs))
 		return -EIO;
 

---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261016-attiny-probe-fix-04e447327cf9

Best regards,
--  
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

