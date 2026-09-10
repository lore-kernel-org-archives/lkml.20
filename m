Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0F231A807
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011610; cv=none; b=c2mWNsR602/EFzk5fAfg24GcmAae3leEX/zh3tsLc1L4nL87FHODJoAHd/ZQtH7xEDkARDciZlRxaoTtI7dWBBwEjVx4FNtUEwEJns/jIt4G2USQo8hB1sxg7Ialw+FDGwEDAq3noPpxTdb90Vw/SNBWubVMyUgHLV6icEvWWJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011610; c=relaxed/simple;
	bh=SsGwNknHPcqNGwID9hfwaD2LQw8udi9KP0/bQeGBXOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=boekhd4nynVHbABwqUP5QWZEIwSxLj3zeSwFP8D6mMXxARyhfvmYKhW7f+scG/rIPCeKDtGNnuGxwSuWJYpzR+5S33aWDu8XgZSF4zfBurgtACLE9WBsUgwLf/fknH9xmA1fG94ERKYIcedPZsaeVLM5byun7+FNKyJS71Jtnmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=ZQMK2IGd; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="ZQMK2IGd"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so5565482a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1789011608; x=1789616408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVg0MO0Un+g3qkYJomirzbTYEjnQlfhIQ2YmOSwcrBo=;
        b=ZQMK2IGdjBB0vghjIHkml1cRAQLXD62ib46bQDZ3SRG1qgFo87OqPet/5v2m1XnK+z
         1TIvYw1JFYZeSHEQ+JFoZTXLvzBTHjgbtZzecqxPe6H3RlqFyGDr/LsEWz/KuMLqnwlS
         AZvzHoe6HZ37ZsAfzZFerav0iUptOGccSlJqhcBQt81SXJQgC3IrnNAj6cEiKuvHfLr5
         tiIT6OcNw956jsijXs5DH4xS5wN6p2x9BigJxPiCCPJKYZ2C8lWUopRJdlQNmPwKqUu8
         cwVjkd8EpMvsCpsEBw/PRlXmIMp5oHKyM4ZpqCSjxqDTbZAdLB8OLWGl3awdyK4AFFwo
         lYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011608; x=1789616408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVg0MO0Un+g3qkYJomirzbTYEjnQlfhIQ2YmOSwcrBo=;
        b=M6B1i+svh8dVZeMcP+js0xhBBIWpm+uHrFL5xSkr/VKa6PTl8a50Tv0GiP3ANMw8QO
         nBm+XilhVERAeTm7LFnrT5D2wET3PHATVIilL68xEBWNiZOb9X2CGxeUw6cuTHKNASUQ
         wqaLvbatFHwmiFfbOiBb+mBcLmo+yHGUKDe1Lj57fJM4CHL8CBL9YbAIQeVG+kfQ8DNa
         p6apcx9DAYjnk8wD7ccdeil9PCOuTiEEDiYlqIU9BwcGpfmMbjBonmQCA2SfcyZojcOZ
         SOrSUBGmdnYskfh/STc1L87iI9h/Kz5NUHkuZj9+wAA18Bownwcbh3Iv4pDfEXfy6m9o
         HfVQ==
X-Forwarded-Encrypted: i=1; AKwUvByCet87CI9a93FDVOuvg+K/BwjWAGTHbVXFAJY/xKGwO5WQHVQN3SHgI8QEpFuPB5Apoce/6AlzpHwp8Bw=@vger.kernel.org
X-Gm-Message-State: AFuF++kQyQSF66wyqrN7jj+elwP7Qw8AH/TMjhedRWtCgaetjiB2r24b
	KRVqvur1N7vtReMtitD9MzGcZheTN+PiulFxQ8Ta1RtwoSiQgSYUaxR+L1Pn6zxcHtbOO5+sYw5
	axYHR
X-Gm-Gg: AYBFou1AUucB/RSASIldkkPUMaM6U0QNTPoxbi8O/NyYY1HnMAu9d+TK2C0c7KcUhA7
	MQ7t/MW/xIO+6v6nHBUZ5PiHZC7adbCpXYuFfR/iiiptqACsU3qeILBNod+4egyuGGSSjy5cYTq
	CYV/jUwwlat7iXqonDn0XzKo15XjxpkCcc6EzM3J/PmUrrTnVSrorIh21ralkmhRtalLdT/WxdQ
	3qTlK+J+Le9tQvDqgfARWcy5u5LygxUOFaNQN6LoeEixkCA6XLE/8zY+WdD3PR8CNhNmGLTf3hz
	yUrAmg34421vsA6XxYu5k7G2jtMcaGgbtc+Dq/4lGZ1OAzzvHGqcKuFFhF011IxlcHtxyNHow1M
	tws9uSjB+r5IZVXP4U6VHDNjDiHBMZz/1MXsBg3hMS+m8wpbhSi7o7++OrlyMrfCMmYUvsKIDx2
	AUuyMX3BbfYh8DoH5ahLewfuIVQUKWIBtyIPtqzabLquc1q//Tanr5PU+bFjzNK99WiX5dEC3RE
	1rKc7MUPMY8
X-Received: by 2002:a17:90b:3a81:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39b2612eaa4mr55057766a91.10.1789011608488;
        Wed, 09 Sep 2026 20:40:08 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58294850c88.5.2026.09.09.20.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 20:40:08 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 09 Sep 2026 20:40:04 -0700
Subject: [PATCH v4 2/3] i2c: xiic: defer RX_FULL until all trailing bytes
 are in FIFO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-i2c-xiic-v4-2-218df31e9d3b@nexthop.ai>
References: <20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai>
In-Reply-To: <20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789011605; l=2897;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=SsGwNknHPcqNGwID9hfwaD2LQw8udi9KP0/bQeGBXOI=;
 b=ZMLTkRrLjU98sWvAMF47TCUN5q7vrtRydDMdFxpssYyUyf7hFw4d45S2V7ONp1Y6h8Rk7n/Dw
 9HEXBghnij2Bl/oBaTi0jcbsqgCx3I2SF1av+5KkZAqsm18bfJGiqFS
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

For the normal path of xiic_smbus_block_read_setup() (rxmsg_len less
than IIC_RX_FIFO_DEPTH), RFD was programmed to rxmsg_len - 2, which
fires the RX_FULL interrupt while the last payload byte is still in
flight. xiic_read_rx()'s bytes_rem == 1 branch then sets NACK on that
byte still on the wire, truncating the read in the PEC-enabled case.

Raise the threshold so RX_FULL fires only once every remaining byte
(payload plus optional PEC) is already buffered in the FIFO. That
routes the drain through xiic_read_rx()'s bytes_rem == 0 path, which
reads everything out and emits the stop cleanly. For the non-PEC path
the full payload is still read out through the same bytes_rem == 0
branch; the only user-visible change is that the controller waits one
extra byte-time before servicing the interrupt.

The deferred-fire formula is rxmsg_len + pec_len - 1, and the RFD
register at XIIC_RFD_REG_OFFSET is a 4-bit field. Widen the
chunk-vs-defer guard to (rxmsg_len + pec_len > IIC_RX_FIFO_DEPTH) so
the boundary case rxmsg_len == IIC_RX_FIFO_DEPTH with PEC enabled
cannot write 16 into that 4-bit register; it routes through the
chunked drain instead, which already caps RFD at IIC_RX_FIFO_DEPTH - 1.

Acked-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index d4308716d461..2bdba6c0931f 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -548,10 +548,11 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 		unsigned int pec_len = i2c->rx_msg->len - 1;
 
 		/* Set Receive fifo depth */
-		if (rxmsg_len > IIC_RX_FIFO_DEPTH) {
+		if (rxmsg_len + pec_len > IIC_RX_FIFO_DEPTH) {
 			/*
-			 * When Rx msg len greater than or equal to Rx fifo capacity
-			 * Receive fifo depth should set to Rx fifo capacity minus 1
+			 * Trailing payload (data + optional PEC) exceeds Rx FIFO
+			 * capacity; drain in chunks. Fire RX_FULL when the FIFO is
+			 * full and let the ISR re-arm for the remainder.
 			 */
 			rfd_set = IIC_RX_FIFO_DEPTH - 1;
 			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
@@ -572,11 +573,8 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 			i2c->rx_msg->len = SMBUS_BLOCK_READ_MIN_LEN;
 			i2c->smbus_actual_len = 1 + rxmsg_len + pec_len;
 		} else {
-			/*
-			 * When Rx msg len less than Rx fifo capacity
-			 * Receive fifo depth should set to Rx msg len minus 2
-			 */
-			rfd_set = rxmsg_len - 2;
+			/* Defer RX_FULL until all trailing bytes are in FIFO. */
+			rfd_set = rxmsg_len + pec_len - 1;
 			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
 		}
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);

-- 
2.54.0

