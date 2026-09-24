Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26D4399CEC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214346; cv=none; b=areT09glewZMSGIyOeqqyr8O+CDImyGmY2Y2rBrO17p6dNLLx+xqCMk//9+p9AFIrkoUfUFbhjyZidG13dzbPzRLCaI+LE1fLdWF/MdCv7KyUwgs6lCuVQyZcuMEWJnqQCOXxixS2ZgtAcn+vRkrwO/Fzmkz5sbVzp0C9ydBg/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214346; c=relaxed/simple;
	bh=hjh/huwNpHT4R0O30TFZo10JCsexhfogEIYuCqGs5hs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=koHqBkbl9/wog2cayhYkkQiG5rJlZELRtxo+063Mqq578DYQ20M51cLW6OD1MgFI+RYXJpmIjy2BCDbXhV1yw+s+K9JklOr8qID8fzeSwo1ielobJWjoRutWP/MR0dwoW0Tx4z4Ax5GUfcWJuTlLQm0w8YHuQWj6imutQUsGhFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=LKsI4lil; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="LKsI4lil"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd05d97cso2289761c88.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790214344; x=1790819144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFtQiwO6/6BJ7wa+vqmBzThl4fhyokGeBbXcNwOcE/A=;
        b=LKsI4lilf4ixk3TVig9cknJOZ5niwi2Bwx7MxGrbdjGfi9agK74Qkjo6qHboWsW+I3
         Zjf0J5IB1Xj766OtPsWdBI7QSXuj6+j4RhSiuQzSGGh1wuZ7V/e9X/ON9TQECH8S+k7z
         q6Ht8o/7tYXDI9KaOSmIFveva/ckOvaKOKKWfqngsMl33z2OKwoYRHPwVPIhpVqq20Jg
         ikeHEPRuE2Lp0pXPlz+xTifd2JWMh//Cx1sfQ24TPJ6haDyIcX/Yb9GHsn2868h8/s+B
         QAWQebrQ5GrJE/UyGwekyQWqcOwRzPdpoiaZZj+81TrTygB9+MjcokC2Q4ElLBTv6PWk
         iE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790214344; x=1790819144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFtQiwO6/6BJ7wa+vqmBzThl4fhyokGeBbXcNwOcE/A=;
        b=oXSsEkblcwi2B7qZGLZLhdq7a7C+w+/qljgw48mRhS2Ke6pFDec5dEMCKQqrg2YGC4
         cS6nyvwEWgjmiOwie3EEZwsleVeWs9BzPRSynhYG/hVz4ejBomHub6Z8+m3xspMMMhrr
         FJbNNVPAjON17lJu+fC38sqQKIVt6II/Oow/ns84TKIFpfCqQY0c1rDcFrv39DWqBvwo
         l742mJuKu9jrrfVmZc+5GM60h/GGn0MZh64M1OTwx+/BCu80G162jITHRSlIwzICLVeX
         ZO2UcHPI6H3xNVUJrMsHcKmhZZN66A5Ywxenfux4+I7dxIw7h6yu0XlTssZBsAFfE6C8
         i9YQ==
X-Forwarded-Encrypted: i=1; AKwUvByU/mJSwGY8klH/bVpBkctWM3CBvpBbXePzmSgGzOl19hhnfICloh2tFT5wNh+5b1HstTYoWT2D7oKfk4Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mSG+gRORIrxNd1KyGlZnFVxpBlo6STh64d1Cuy3i6VlP5PUjQl
	Uz0hhcHDrZfvCW6NEKYhZW2zDyvsL7JzNcuZyjl5QtVufBuGjdeoOYfyrl3yZqcNUyVSG7X1/sX
	fiUO5fHA=
X-Gm-Gg: AYBFou0HN4XFW4QaG4kGf6UP+Il3HlAWsW3v/9unhLvgBkcWEg9g7SMwJa0NDorHZtT
	/NMERHSq7E+VB9FYnCV710laVu9A5TdjUyCbU8kwim1oU4zDy4CnCZXF4zBsTo539F5xOsaFMJu
	yDd57jF/nEhFybyyX18HsN70WOkmFmmbK3AS011P+1m75RR8hFNthYnXzQeK3DzoSRqxv5X/P1Q
	q/yUaioJCkdC48bNwSAkkH5deMmDmlO6Sz4YgS8EwZZZBUV8UuMQheAbmqDjc63hecVA9d2SUER
	SkwiCMCgj9DbcUKyyYhUIymtqJ5AikTPnfLRbkA36iMNwcmcTgZjSQoPDADK4fEj+AKgVi2gaOF
	R9VRwrOYG8Wqt8zPgHQDYIEuAd/rmHlii7gkzsU0EMzDJ4uxU1SSMsl6ZVCClHMuBsnlRjovEnD
	2MtP0eJKs8b0zNj5zxJD//TDO+YQOSw3bo0037DRCsq0eGQMbBlQwXxw0EroOxzqZiUR2OeH4Ec
	A==
X-Received: by 2002:a05:701b:4292:20b0:143:89a6:9ea9 with SMTP id a92af1059eb24-14503f9735emr748692c88.19.1790214343219;
        Wed, 23 Sep 2026 18:45:43 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14501794269sm2927598c88.8.2026.09.23.18.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:45:42 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 23 Sep 2026 18:45:37 -0700
Subject: [PATCH v6 2/3] i2c: xiic: defer RX_FULL until all trailing bytes
 are in FIFO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-i2c-xiic-v6-2-3a15b6397f5a@nexthop.ai>
References: <20260923-i2c-xiic-v6-0-3a15b6397f5a@nexthop.ai>
In-Reply-To: <20260923-i2c-xiic-v6-0-3a15b6397f5a@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790214340; l=2996;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=hjh/huwNpHT4R0O30TFZo10JCsexhfogEIYuCqGs5hs=;
 b=ESsvAdfXRm0tlYcUbq3pUgtyTWOnDdmGWS56m6a/HeF5Da0WAGiwNahnaVp2p7ITa0+jdFYf/
 c8mhvMhlJF/Dy6plYKFa+nUrdBkJh84xQiUAqmZ5J7Qt0jGOh/jwkQx
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

Fixes: e4c1ff772e1a ("i2c: xiic: Add smbus_block_read functionality")
Cc: stable@vger.kernel.org
Acked-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 6cb264cbc366..b4177d655cce 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -546,10 +546,11 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
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
@@ -566,11 +567,8 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
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

