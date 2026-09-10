Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7B339656D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011610; cv=none; b=Iy402KKoV7t/lyH0w9iP7uN/ynPd+G/BWuEabsbiBibuWP7DoUB1onfIwcRkg2HAw6bNCpD8LaPqAsk4jSY4RWlkQoR1XqX+nHDvqW3jgZPV1D2RzgoEFLHu5Ryc62dlJ2i/R7kfYQx8o1FkDbfyPA+Ham5Ytmy52HoaArrWEGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011610; c=relaxed/simple;
	bh=MYC3xNfD+YSfcsRaI0KtZmCIgrfUNCSXFcjulNKq+b0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H3ipkPdKJpgQ/CFMo1krhUs6/XQtVNBDIjW4lzGibYyr/WlY/HB132wtu2cStvT2EeOAlrfjhHh1Jgan/q8/Nsg9ESuZcvZbmh9yfiuEiD6OrATI6KxAuKK7jK++PYOa8ttjS1i6NWUox8O0Q0wtL5bKm8eTuPwknpaDHMRzY74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=EbiYueAB; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="EbiYueAB"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1068448a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1789011608; x=1789616408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lps2PcX6rctm/ghGucB1Y2c/dEcXRtrtImT6mc9AsLM=;
        b=EbiYueAB02cQpY7NFppggYCfVMQYhka6LxKu4ZQQ09v4PBO7GtDYF6Mxst6VkvVrek
         pF6mMLCMHdy3jyy9yvGx0QOd++/cvYPMnOKZqtydr4KsgyR/NrmUBBP5KCzhWh8v91Fz
         R2IdAVTQ1sfeEv2NvBeupXAy6dGCah6mMUrZq4CBZ7QjUNHwCbGkbo7P9PAaRKBcyCW9
         JRxWLmR34vxQAnhiCRnBuGLZxgksIFu+uV82ulR7dRMNqv1PDt0N3YsqKSxArExpHah4
         3dZa375hShQManE5DV/Y2A8YoFZG2M33dYhuLlm6S8yN05tVI6oHu+yajIzo5ChbQl3+
         yMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011608; x=1789616408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lps2PcX6rctm/ghGucB1Y2c/dEcXRtrtImT6mc9AsLM=;
        b=hUVASQcOo8kLIitIrZCu/2cMQQe1eVgW+0GcZygSnWu6R/RI8ggO4zpJlSudhfopTh
         9daFE39tyvWH87jhREaXGSPngjtL89bxF9czSdiPUzpmmpHINeTIyrHzZrIzxZvlDtcf
         eDPl0y/d0auTX0ZI7CVv9slgvwouQpdLPE7CXoCiL3RB4cKi6lQrwI5UtrMxYQVpC9c/
         miWBxOfz6/QFOcTo9Pb2TfLC+9sDI0j+sLmIw89u4QuMg/JFBERHb1THF8upLF7lfcF2
         5/8gnL/z+ONiexR/rIQzF7GXy6hxvKAJnX/l2K5o6plwwSPGrv+UtPFsJPLaG8vG8rzA
         IAzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpHGvaSqYZPj/p2m9H9Uf7YKao/sOeHonL7iHOfZMaeTFfMPmBEpcM9oBwjlO9DLXIL3OvcoHUvdlvxYA=@vger.kernel.org
X-Gm-Message-State: AFuF++kgGXWraKorgMduqXbfPqQY0x0ReTdmpBpqb9Fu8cZeaKJrdLIT
	gbtvJBIUcLfE5oQJ22C8e+aT0G4h1T5Xc0/hewdA6Yl+5jBRkdB9tmjXIGtYXW2uZ0rcNkyTnZS
	wlM0EKlg=
X-Gm-Gg: AYBFou3DXpACS5gLQj8vAVB9gIF9oA1kqymLzNsPws+VjyKqrKpAZOJlHkuG7vpNumB
	v7sMMce1HeDyhzY1FOuX1jJLExOyLfbyZrGr2J3vW8r9P6zNIx05QcaFvR3FTgAu/I6Jmz3TCXA
	iy5OEunZLz1X2PufT9q1i4Fo9U7c9FdaMhHxXjLv/bged/dLDXQ0ud7DLoUPTuKMqzDVM6srFCB
	Nd/RPYlwiTAB4n5FPfB+OswUhvwKVMke56otTmvFpg6Q7avwtvHSbD58IARXn+/1/My+yfyM9fB
	ldxFddHia6Kqd5vXfda2+ats/Fwk8BTbUUlxTOgqfh9TSb6GNr0TKTvHaCuaGuy1RDq4lyE3fVZ
	K2HDUdNGnvOSmR/9Zyd1nz75uKuqezF8ZZcdCudcYfCmJ2bU/EsTBpEBAb6Xtc6SOrkQiaQFCen
	NcUyLCPfcAwCfTbh2GPcZOVqFuxze7491e3aSqgbZ4MzMlXC7C21AvFuQpGfrOL3/+3wGnF4qg9
	A==
X-Received: by 2002:a17:90b:498b:b0:398:ba56:b926 with SMTP id 98e67ed59e1d1-39d70c55164mr7843926a91.25.1789011607677;
        Wed, 09 Sep 2026 20:40:07 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58294850c88.5.2026.09.09.20.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 20:40:07 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 09 Sep 2026 20:40:03 -0700
Subject: [PATCH v4 1/3] i2c: xiic: preserve PEC byte length in SMBus block
 read setup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-i2c-xiic-v4-1-218df31e9d3b@nexthop.ai>
References: <20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai>
In-Reply-To: <20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789011605; l=5641;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=MYC3xNfD+YSfcsRaI0KtZmCIgrfUNCSXFcjulNKq+b0=;
 b=rh42/85Gl/frBlCHHRWSu4X0kI6vDh01a6lIPJBKwfpO30JarflveioDF49oQXSr4iN6Bkcc6
 wd50t3nYZ8UAHZYY8ycBwZtoq94QJSd53r6YivZsvBkB3Dnr0k+Pqss
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

xiic_smbus_block_read_setup() recalculates i2c->rx_msg->len based on the
length byte returned by the device, but historically clobbered the PEC
byte expectation the SMBus core had baked into msg->len. That dropped
the PEC byte from the caller's buffer on the normal and chunked
receive-fifo branches.

Compute pec_len up-front as (i2c->rx_msg->len - 1) and add it to the
new length in every branch:

  - chunked (rxmsg_len + pec_len > IIC_RX_FIFO_DEPTH): set the drain
    target to rxmsg_len + 1 + pec_len.

  - deferred (small enough to drain in one fill but >= MIN_LEN total):
    same.

  - padded (1 + rxmsg_len + pec_len < SMBUS_BLOCK_READ_MIN_LEN): the
    hardware needs at least 3 bytes on the bus to exit the read
    cleanly (the second byte is already being clocked in by the time
    the ISR reads the length byte and is too late to NACK), so we
    still pad rx_msg->len up to SMBUS_BLOCK_READ_MIN_LEN. The dummy
    trailing byte that gets drained must then be trimmed off before
    handing the message back to the SMBus core; otherwise
    i2c_smbus_check_pec() reads buf[len-1] (= dummy) instead of the
    real PEC byte at buf[1] and rejects every clean zero-length block
    read with -EBADMSG.

    Record the true valid byte count in a new field
    i2c->smbus_actual_len and have xiic_process()'s RX_FULL completion
    site trim rx_msg->len down to it before clearing rx_msg.

    Widen the branch condition from the old "(rxmsg_len == 1) ||
    (rxmsg_len == 0)" to "(1 + rxmsg_len + pec_len) < MIN_LEN" so that
    user requests with multi-byte trailing bytes (e.g. pec_len == 2 on
    a zero-length block) flow through the deferred branch instead of
    getting truncated to MIN_LEN here.

Acked-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 40 +++++++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 3e7735e1dae0..d4308716d461 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -73,6 +73,11 @@ enum i2c_scl_freq {
  * @prev_msg_tx: Previous message is Tx
  * @quirks: To hold platform specific bug info
  * @smbus_block_read: Flag to handle block read
+ * @smbus_actual_len: For SMBus block reads padded to SMBUS_BLOCK_READ_MIN_LEN,
+ *	the number of bytes that are actually valid (length byte + payload +
+ *	optional PEC). msg->len gets trimmed to this on transfer completion so
+ *	the SMBus core sees the real PEC byte and not the trailing dummy.
+ *	Zero when no trimming is needed.
  * @input_clk: Input clock to I2C controller
  * @i2c_clk: I2C SCL frequency
  * @atomic: Mode of transfer
@@ -98,6 +103,7 @@ struct xiic_i2c {
 	bool prev_msg_tx;
 	u32 quirks;
 	bool smbus_block_read;
+	unsigned int smbus_actual_len;
 	unsigned long input_clk;
 	unsigned int i2c_clk;
 	bool atomic;
@@ -539,6 +545,8 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 
 	/* Check if received length is valid */
 	if (rxmsg_len <= I2C_SMBUS_BLOCK_MAX) {
+		unsigned int pec_len = i2c->rx_msg->len - 1;
+
 		/* Set Receive fifo depth */
 		if (rxmsg_len > IIC_RX_FIFO_DEPTH) {
 			/*
@@ -546,23 +554,30 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 			 * Receive fifo depth should set to Rx fifo capacity minus 1
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
+			 * Hardware requires at least SMBUS_BLOCK_READ_MIN_LEN
+			 * bytes on the bus to exit the read cleanly: by the
+			 * time the ISR pulls the length byte from the FIFO,
+			 * the second byte is already being clocked in and
+			 * cannot be NACKed in time. Pad the drain target so
+			 * the HW reaches the minimum, but remember the true
+			 * valid byte count and trim msg->len back on transfer
+			 * completion -- otherwise the SMBus core's PEC check
+			 * reads the trailing dummy byte instead of the real
+			 * PEC byte and rejects clean transfers with -EBADMSG.
 			 */
 			rfd_set = 0;
 			i2c->rx_msg->len = SMBUS_BLOCK_READ_MIN_LEN;
+			i2c->smbus_actual_len = 1 + rxmsg_len + pec_len;
 		} else {
 			/*
 			 * When Rx msg len less than Rx fifo capacity
 			 * Receive fifo depth should set to Rx msg len minus 2
 			 */
 			rfd_set = rxmsg_len - 2;
-			i2c->rx_msg->len = rxmsg_len + 1;
+			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
 		}
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);
 
@@ -797,6 +812,17 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
 		xiic_read_rx(i2c);
 		if (xiic_rx_space(i2c) == 0) {
+			/*
+			 * If the setup path padded a short SMBus block read up
+			 * to SMBUS_BLOCK_READ_MIN_LEN for the HW exit
+			 * workaround, trim rx_msg->len back to the number of
+			 * bytes that are actually valid so the SMBus core's
+			 * PEC check reads the right index. Must happen before
+			 * the rx_msg = NULL below.
+			 */
+			if (i2c->rx_msg && i2c->smbus_actual_len)
+				i2c->rx_msg->len = i2c->smbus_actual_len;
+
 			/* this is the last part of the message */
 			i2c->rx_msg = NULL;
 

-- 
2.54.0

