Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA0E1C862F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790295043; cv=none; b=jgR0dgwN7kzDn3Vdu9Isp019x/n0EUiymnneFaH+vbNxVuYwQEVSoNz/2NixEIE7WWAaVgWqwOIOSxNQUUuqhKaqnXEAWgfQDNl3lG0ia51fRa5Tvtp9AwL+KQi/8FXOTP2IxPRp5xUuT0ECuE6G0vMXR33y4FUAkACC4UYAbaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790295043; c=relaxed/simple;
	bh=eTX02wyE5ouxkmqtS51Q5M+dSBWGkFgKNZs9s5Tgfw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yo7x++46DvO1+JIV4cUoyUgDbfJroj011H7cg0zFMVogatQM21qQJsYSn/FSYSEP0ns9pl4mu6eJjEl8C1fkx0QekhnA/DnUcVdMYgIIs31CfiVEv2Z+YtgPdd7Xsa6j+3DA3lZCT9S+EVyJ3XQwhGSArP2k7REtpyz7DNwtXkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=MVkZLOvi; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="MVkZLOvi"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33b9e805130so188775eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790295040; x=1790899840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwla+qYJcPM+0e9z6oZqkKd9MiKwlDQWnaoxKLv8300=;
        b=MVkZLOviCDRDKzGLjEqNeqeohJjejwY9fqje9rGhCqZBRXgoIlitAuTo4HphBJDPvO
         gGT7zGtSPWqu6CCHCRMnfMBW9sJIoOWhkH7uife9gDnLq3vdi+8YQckHKgs9//JWf21x
         m4igREIqZOKIPlClcj/j6X8/5M40cZsIvwpRs1aXYMbZeXJ+j8vRY2pvrnKChHPFRp60
         4d6WEAOBmDR34/BFhRk0qkN1oaiVEP3h3NSmsv7Lf07vtbD5pLiMM5GcduVIORaKetzp
         O0VaBiYRGTwZ0hUzo/iK7bhXUkOVyfb5TLi0QHAYTQ8py7DBkLqakHRcUFkNXFOOAjMW
         63wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790295040; x=1790899840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwla+qYJcPM+0e9z6oZqkKd9MiKwlDQWnaoxKLv8300=;
        b=a+jlYT5AwOtPm+0adCZGiuAbXKxDbGzYXF837+/aoLm9yyTxXqhR16fkVGmKeFlVdH
         Tg6eXlvtIC5ekc9ZoLiRQrjh+sBm8k+bs9MPWR/cyF9B2nJo8MuztU7ci5eQjxDTh0pl
         YpJRux1Usf7IwGMvt8eBORFt0gHVe6pmHa6X8WRERlg+c/hSKgNBXrfzkENbN9iE9grT
         CcU7XYV7u3nJUt8aYjmcDbX0Oxrx5Up+umG5Yad0i/KmS+Yb+K2WCl5wy+Q41OhQesh5
         rFXIJRTvHS1zmXn9mqPvdQOj3pN/LGwstkvyCv+h3rM9uZ9etuk502s8uoP3+qpZt5hD
         ye7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzBHgG71zpk/oLm/JlojdEPaaxUmO5E6TbAVlN0rOogSxpW7yVfsZMYDz4IX6bgxk/JWbD/7fxLqDkdFNM=@vger.kernel.org
X-Gm-Message-State: AFuF++miYgDMFp+njQPom81S0ERag24JBz3HptwVaAr3T95xsWhj3/E0
	gk/2WCMgRU6ptX8f48f+akuktuf9AKyWy0H0RYVU51D/UCRnbJd2BYQAgLpasZPE5BbHqexEEvp
	NwQbFmcs=
X-Gm-Gg: AYBFou3s8eVAcjVjYe6t3m6fiT/OzLZub3lcl7k5zKzkvW98ffWfQabYEdH4KmeKZik
	O6IXDe8bSVWNO15OWK0GjRez6iQJDvqUSD9ff0NeqXtWjXuYD/PPA9xPRInAjjeD5Of9CZp012G
	VVItCm6racR6Pb2EdxaZSYQRxM8gKZWlfM+tNcnYKRpGUF8QIMZrauphk4BXCkecTWaLUVm/7/f
	UlZhDQTOaMWZCbpW35uNvRN+Amn3IJ04wT7yHu+zPB+pnunurUaB4sjtdzNHB5+e4wqOHEnePue
	pFrb2WEU+4svznDXhJD10787blOrkg/N0WGrsXwVxlKxhTM08OVgSA3sG/PhJcpXR++HnKok5G3
	VeDWTpmb8oH0MiE/VZzaKQKdMt1ZbGygyihYaZh4d5koFFOSTYU8sOI3NThcWV3Wu7vZrG3Ex6U
	PVis1V5mh45+N1FLRrdsEkqPr8byif6sf/sekXXpZBKavjP6+D1oESfwGH1hOPeGYVL+XyvEEaV
	Q==
X-Received: by 2002:a05:7300:ea06:b0:33b:ef1f:14b9 with SMTP id 5a478bee46e88-34004b8b691mr2871986eec.15.1790295040193;
        Thu, 24 Sep 2026 17:10:40 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145632298sm1787647eec.22.2026.09.24.17.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:10:39 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 24 Sep 2026 17:10:35 -0700
Subject: [PATCH v7 1/3] i2c: xiic: preserve PEC byte length in SMBus block
 read setup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-i2c-xiic-v7-1-df7e752332ef@nexthop.ai>
References: <20260924-i2c-xiic-v7-0-df7e752332ef@nexthop.ai>
In-Reply-To: <20260924-i2c-xiic-v7-0-df7e752332ef@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Raviteja Narayanam <raviteja.narayanam@xilinx.com>, 
 Wolfram Sang <wsa@kernel.org>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790295038; l=7659;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=eTX02wyE5ouxkmqtS51Q5M+dSBWGkFgKNZs9s5Tgfw8=;
 b=Q5/svQRlhuGQRMYEZeJJuOrRs5jygK4L1lcoVPD2tvjABzzrUIY8/KC5yrUKakTQcQjaI2VID
 ClMbLuhatI9BVSbA9jhvfZ7FQg6QAb+f9LCoK7/U+te4iDr5kg7J4dO
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

xiic_smbus_block_read_setup() recalculates i2c->rx_msg->len based on the
length byte returned by the device, but historically clobbered the PEC
byte expectation the SMBus core had baked into msg->len. That dropped
the PEC byte from the caller's buffer on the normal and chunked
receive-fifo branches.

Compute pec_len up-front as (i2c->rx_msg->len - 1) -- the trailing bytes
the caller has already accounted for beyond the length byte, 1 when the
SMBus core enabled PEC, and possibly more for an I2C_M_RECV_LEN request
coming from i2c-dev -- and add it to the new length in every branch:

  - chunked: the trailing bytes do not fit in the Rx FIFO, so drain in
    chunks. The guard becomes (rxmsg_len + pec_len > IIC_RX_FIFO_DEPTH)
    rather than rxmsg_len alone, both because pec_len bytes also have to
    fit and because it is what bounds rfd_set in the else branch below
    to the 4 bits of XIIC_RFD_REG_OFFSET.

  - padded (1 + rxmsg_len + pec_len < SMBUS_BLOCK_READ_MIN_LEN): the
    hardware needs at least 3 bytes on the bus to exit the read cleanly
    (the second byte is already being clocked in by the time the ISR
    reads the length byte and is too late to NACK), so we still pad
    rx_msg->len up to SMBUS_BLOCK_READ_MIN_LEN. The dummy trailing byte
    that gets drained must then be trimmed off before handing the
    message back to the SMBus core; otherwise i2c_smbus_check_pec()
    reads buf[len-1] (= dummy) instead of the real PEC byte at buf[1]
    and rejects every clean zero-length block read with -EBADMSG.

    Record the true valid byte count in a new field
    i2c->smbus_actual_len and trim rx_msg->len down to it in
    xiic_smbus_trim_len(), called from both completion sites that clear
    rx_msg: xiic_process()'s RX_FULL branch and xiic_recv_atomic(),
    which drains the FIFO with interrupts off.

    smbus_actual_len is per-receive state, so xiic_start_recv() clears
    it before every receive. Only the padded branch ever sets it, and a
    block read aborted by arbitration loss or a TX error never reaches
    the completion site, so without that clear a stale value would trim
    the length of an unrelated later read.

    The condition is expressed in total bytes rather than the old
    "(rxmsg_len == 1) || (rxmsg_len == 0)" so that a request carrying
    more than one trailing byte does not get padded: padding records a
    length the drain never reaches, which would hand the caller a byte
    that was never received.

  - normal: all trailing bytes fit in one FIFO fill. rfd_set gains
    pec_len for the same reason the length does. Because the padded
    branch above has already taken every case with fewer than
    SMBUS_BLOCK_READ_MIN_LEN total bytes, rxmsg_len + pec_len is at
    least 2 here and the subtraction cannot underflow the u8.

Fixes: e4c1ff772e1a ("i2c: xiic: Add smbus_block_read functionality")
Cc: stable@vger.kernel.org
Acked-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 54 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 3e7735e1dae0..0777de45bdf4 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -73,6 +73,9 @@ enum i2c_scl_freq {
  * @prev_msg_tx: Previous message is Tx
  * @quirks: To hold platform specific bug info
  * @smbus_block_read: Flag to handle block read
+ * @smbus_actual_len: Valid byte count (length + payload + optional PEC) of a
+ *	padded SMBus block read. msg->len is trimmed to this on completion.
+ *	Zero when no trimming is needed.
  * @input_clk: Input clock to I2C controller
  * @i2c_clk: I2C SCL frequency
  * @atomic: Mode of transfer
@@ -98,6 +101,7 @@ struct xiic_i2c {
 	bool prev_msg_tx;
 	u32 quirks;
 	bool smbus_block_read;
+	unsigned int smbus_actual_len;
 	unsigned long input_clk;
 	unsigned int i2c_clk;
 	bool atomic;
@@ -539,30 +543,38 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 
 	/* Check if received length is valid */
 	if (rxmsg_len <= I2C_SMBUS_BLOCK_MAX) {
+		unsigned int pec_len = i2c->rx_msg->len - 1;
+
 		/* Set Receive fifo depth */
-		if (rxmsg_len > IIC_RX_FIFO_DEPTH) {
+		if (rxmsg_len + pec_len > IIC_RX_FIFO_DEPTH) {
 			/*
-			 * When Rx msg len greater than or equal to Rx fifo capacity
-			 * Receive fifo depth should set to Rx fifo capacity minus 1
+			 * Trailing bytes (payload plus any PEC) exceed Rx FIFO
+			 * capacity, so drain in chunks. This also keeps the
+			 * else branch below from pushing rfd_set past the
+			 * 4-bit XIIC_RFD_REG_OFFSET field.
 			 */
 			rfd_set = IIC_RX_FIFO_DEPTH - 1;
-			i2c->rx_msg->len = rxmsg_len + 1;
-		} else if ((rxmsg_len == 1) ||
-			(rxmsg_len == 0)) {
+			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
+		} else if (1 + rxmsg_len + pec_len < SMBUS_BLOCK_READ_MIN_LEN) {
 			/*
-			 * Minimum of 3 bytes required to exit cleanly. 1 byte
-			 * already received, Second byte is being received. Have
-			 * to set NACK in read_rx before receiving the last byte
+			 * The HW needs SMBUS_BLOCK_READ_MIN_LEN bytes on the
+			 * bus to exit cleanly: by the time the ISR reads the
+			 * length byte the second byte is already being clocked
+			 * in, too late to NACK. Pad the drain target and record
+			 * the real length, trimmed back on completion so the
+			 * PEC check sees the right byte.
 			 */
 			rfd_set = 0;
 			i2c->rx_msg->len = SMBUS_BLOCK_READ_MIN_LEN;
+			i2c->smbus_actual_len = 1 + rxmsg_len + pec_len;
 		} else {
 			/*
-			 * When Rx msg len less than Rx fifo capacity
-			 * Receive fifo depth should set to Rx msg len minus 2
+			 * All trailing bytes fit in the Rx FIFO. The widened
+			 * condition above guarantees rxmsg_len + pec_len >= 2,
+			 * so this cannot underflow.
 			 */
-			rfd_set = rxmsg_len - 2;
-			i2c->rx_msg->len = rxmsg_len + 1;
+			rfd_set = rxmsg_len + pec_len - 2;
+			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
 		}
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);
 
@@ -575,6 +587,16 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 	dev_err(i2c->adap.dev.parent, "smbus_block_read Invalid msg length\n");
 }
 
+/*
+ * Undo the setup-time padding of a short SMBus block read before rx_msg is
+ * cleared, so the PEC check sees the right byte.
+ */
+static void xiic_smbus_trim_len(struct xiic_i2c *i2c)
+{
+	if (i2c->rx_msg && i2c->smbus_actual_len)
+		i2c->rx_msg->len = i2c->smbus_actual_len;
+}
+
 static void xiic_read_rx(struct xiic_i2c *i2c)
 {
 	u8 bytes_in_fifo, cr = 0, bytes_to_read = 0;
@@ -797,6 +819,8 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
 		xiic_read_rx(i2c);
 		if (xiic_rx_space(i2c) == 0) {
+			xiic_smbus_trim_len(i2c);
+
 			/* this is the last part of the message */
 			i2c->rx_msg = NULL;
 
@@ -938,6 +962,7 @@ static void xiic_recv_atomic(struct xiic_i2c *i2c)
 			return;
 	}
 
+	xiic_smbus_trim_len(i2c);
 	i2c->rx_msg = NULL;
 	xiic_irq_clr_en(i2c, XIIC_INTR_TX_ERROR_MASK);
 
@@ -955,6 +980,9 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 	u8 cr = 0, rfd_set = 0;
 	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
 
+	/* A stale value from an aborted block read would truncate this msg. */
+	i2c->smbus_actual_len = 0;
+
 	if (!i2c->atomic)
 		dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
 			__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),

-- 
2.54.0

