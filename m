Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20176481AA4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155166; cv=none; b=XRApV8PCLQ+s29IAAPdfcVsbKj0WW370TxUrX5er1jooFSkQ1sQKpmnQ/9OW3WWnqXqqmNWOoYtu1p8KkuYCaHVJv6+ZzBkx74/UR4udwTk25ycqwdLR7VFUOXtxdX3lta44xZ2DVm/moXUyJG3X55vxwsfD6qpUtuMBaU3UpOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155166; c=relaxed/simple;
	bh=B1VEVRlqikpPTMkVjpNttb8IvaJtjlL1JxMWlv+FinU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TrpVQj3pfnF65rIXz+KcRmv/GvOki2KLEoUvC/Cq9pOX2D8ZTZiCUg+ZRYsGwjfBNvemghNs4XiSrOnxCjHFYY1dfXVJp48Avqtmh3+Oy4StOcU18BqyC6cKBqKypWmDGwSKQSQkX3wmLDZp4MIbV9d1mYgqBIo8fIrLDqgs4D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5LdNN11; arc=none smtp.client-ip=74.125.228.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5LdNN11"
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c40ce98584aso9905866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155163; x=1792759963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdOHOeZUKsNxNoi/BkPDgmePe7PcCdsdpCL+vRvFalY=;
        b=j5LdNN11rjLwtpDyp3LeXExTmiGDfDKyv2DwfctVKW88VShDVO2c4hAsi2PVwhxwFe
         HMthaf7qXZJ5bz30TsaLEBM5fVaIp268fZbBo/8cvsK6znvmdnJSYKOfMxtFVP4UkT2v
         sAAUj0JzfFD/vS9JjeTb90xC2rxWGktRRE8e/iRuGQbgzbObVjB0kFic2430MOEtGbQG
         NovpUbrXxvoYT/TFmLVbW0c3B+Nn5pNLJi6CWqJxHsiNE0HPTpUJ45xyMm3G7VLja02m
         lQQI6FiOMbD201lHxvK3cG1sFGqHb2BUldQGPWsQvZ7s0J6stXvIlJUX2ksAoFHY2Ewh
         zLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155163; x=1792759963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdOHOeZUKsNxNoi/BkPDgmePe7PcCdsdpCL+vRvFalY=;
        b=bgSgGBNIa1ieZ4d1xr/d2Px/AJpTA4edMRXkTis2aZbqobF/H0Z+YgWckJYJLr/G3M
         t+7UubIzddGg1oWvzF2JXPRAzr/dJVZgqxhpD6oxZfHjg2I4excSBiQEqy9IW6NNlr0w
         4hOBuFRT7W5lvFqbno/9fcpskBOmD6cDvWR32haw2CZbptiPA+Cicl+Z18ADPEad2R15
         biJtGbP3GzW7ClljBbv2Sc0QPuTnALx/gsHNpR6mOI0ZsJ2rFwnYSbNATTnfJBLYkilw
         15deMYR8TfFrjvzu2ncZVVaci6Lsa+6iNTexfbMbCqnsZ6M5i+ncjbN+jf3yvvhkWsYI
         QWRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxcGvTBjMC/LcjNbubHy0KpSvHXhuKiBMamMHWrER9+QLnVnWuP7qlNbPYo8UF3DxHMkqsBH1QrDOfkR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkWbDQm5WgBIXYj46pN3nd/KarI0fSSNMtvXuvdLBGi/UxZKKY
	tdI1JFo5vFrXurhLBVCpHAew8njyxpzlv0GyNlOOTZgUdDwFimP8h76eqbUmVjHN
X-Gm-Gg: AYBFou2givmYmGGo2HKnAf20lIsnGQILD4k3SvwDSHgW/Kobx//Qtj3Ocr/XG796tia
	JqhgNAG8huBrXQBxjubrB4FdHlIEJG5luBEhC+LDGw0GjaKTvHCbKjO5BOYsambeJMgf4B4L3KT
	6YHbYgQBKSPki0dozl6CpjvEH68NEkYx3BNFEvFUjcRJnaU+6pjIfsTxc2DowafKpwlkaUnDtUb
	VG0nqpsTklB1bHt1+Xe2Vuan+8fFTziFgT8dPHQ3rFzoPzcX8zpF8Iud5HOsAE5xXiNGM+AHNVk
	xbXfyqnOq+WgVP6wWchHssRrthqODiOcSsdknL7BG3MWRpcWgCvxLf0mlXVXa7UfrnaeZIxmg9x
	IqDP0vkk4uAS24UE3by44D3/jFFpb5VyHNqMmnNUVWPGoEbhCdiN5Z2oIXYGR9tiX5C7iTJklVj
	5keqIi4GrF89OjpncmtIxdmfzn5Tb6Q/P7giPSRJxP1ZnoKLD5fVIUnlzRPCJfC9KYzm/mPWGF1
	pfo7CQtwe+bgLS3ZOQ4nCqV2iNkDltBEaVjEJ8lfmq2urhz1CeR+q13aSzTg5dpajeQbPIw0Jgl
	s8UDUYLoZA3DxkGNVrlLafePCg==
X-Received: by 2002:a17:907:97ce:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c40205fb322mr271162166b.18.1792155163197;
        Fri, 16 Oct 2026 05:52:43 -0700 (PDT)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32876asm69433966b.10.2026.10.16.05.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:52:42 -0700 (PDT)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v3 2/2] i2c: i2c-xiic: fix waiting/clearing while atomic
Date: Fri, 16 Oct 2026 14:52:29 +0200
Message-ID: <20261016125229.1798791-3-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016125229.1798791-1-thi.zirnstein@gmail.com>
References: <20261016125229.1798791-1-thi.zirnstein@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use non jiffies based waiting functions,
if in atomic context.

Suggested-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index e68e17bdf0ba..fc9a0628cb67 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -359,16 +359,28 @@ static inline void xiic_irq_clr_en(struct xiic_i2c *i2c, u32 mask)
 	xiic_irq_en(i2c, mask);
 }

+static int xiic_poll_rx_empty(struct xiic_i2c *i2c)
+{
+	if (xiic_getreg8(i2c, XIIC_SR_REG_OFFSET) &
+	    XIIC_SR_RX_FIFO_EMPTY_MASK)
+		return 1;
+
+	xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
+	return 0;
+}
+
 static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
 {
-	u8 sr;
+	int rx_empty;
 	unsigned long timeout;

+	if (i2c->atomic)
+		return read_poll_timeout_atomic(xiic_poll_rx_empty,
+				rx_empty, rx_empty, 10, XIIC_I2C_TIMEOUT,
+				0, i2c);
+
 	timeout = jiffies + XIIC_I2C_TIMEOUT;
-	for (sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET);
-		!(sr & XIIC_SR_RX_FIFO_EMPTY_MASK);
-		sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET)) {
-		xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
+	while (!xiic_poll_rx_empty(i2c)) {
 		if (time_after(jiffies, timeout)) {
 			dev_err(i2c->dev, "Failed to clear rx fifo\n");
 			return -ETIMEDOUT;
@@ -383,6 +395,12 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
 	u8 isr;
 	unsigned long timeout;

+	if (i2c->atomic)
+		return read_poll_timeout_atomic(xiic_getreg32, isr,
+				isr & XIIC_INTR_TX_EMPTY_MASK, 10,
+				XIIC_I2C_TIMEOUT, 0, i2c,
+				XIIC_IISR_OFFSET);
+
 	timeout = jiffies + XIIC_I2C_TIMEOUT;
 	for (isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET);
 		!(isr & XIIC_INTR_TX_EMPTY_MASK);
--
2.43.0

