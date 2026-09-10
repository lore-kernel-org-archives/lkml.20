Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F002339A7E0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011612; cv=none; b=U0Qrdz1l5LpNpgsiUNSrZQgvQo0jo0zCwV9G7obxA2RZNIpgNcZJFokyMSafIKzP3xHAdP1V1AFnsIdL5jAhi55jCQN8DZsH2I4od1IrpEY2zUUm98b0AhlIIZrUU5CvX4pZEFQUT7aiLPCkCD4b1xgbvde9VDqV3dTxKBPj8DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011612; c=relaxed/simple;
	bh=nou7d5wdvtm0ZSXFArEeFJh+YO34NwfkEsOlW1AJ7Ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AX7mZ/GIPx+rNpsVDMd8CvYiLMBmgFgbDR1fzFNPLM8efaasvna1ZXKrCaGfuenYTdSI+k9DdPHXS0KwK6ecmFZ1oC14Wy1ylpPXO+1sCEUErGaxB2Rw9q45JtZqHQG8C8alRMrkxmGee2gXZgMZ+NSKdzI5FxEYdh8n5DtTfqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=engzz1ea; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="engzz1ea"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c4so532504b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1789011609; x=1789616409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGGb1AqMqEgtlYCXRtEKduBwX2irzbcK3U23NUL459A=;
        b=engzz1ea6FIKE5Dh64kKiydIE+1BmBg0hhRUob7MYW3+h8HneJ4AlBq2dBhZNHsl0E
         6j/NZ2B1JKdXCTzb7NrmP48ATphR3NYrgQsAvCRXcntfUmNgfvQOxoKTSXhQIKJnL5bg
         A8AhlZTyXasyWP+dr5uqBPGnY3YHqSJaAtT5OqIIyVNC3cPNUZxfR7byz5gwWLASTzss
         QzryH5GTrjYguTDXdPa3ZuncTRLDxfK8ad0b/BZ+mBwvwQ4ZX+5BbL1JpLn3du2R35J7
         cYEXIKKUNmbJmck6O2mZSM7qKdBfi3NQgigk3jIQdo/+NnPOZmm53aA3HtSewqdME9zu
         b4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011609; x=1789616409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGGb1AqMqEgtlYCXRtEKduBwX2irzbcK3U23NUL459A=;
        b=ih3sk53OjIxDeuUIEmBJ+nAS2P8f4gZQi3bSjEy9IFSD1W08hEMRYGxvuvb6yzxEQu
         DjKjiAXZuRyeQuSQo47gFI7YIcMmG4EibhsPuuh0GyGz7LEZm81CWMB/GrktqJJTQyS8
         aUFeY4q5Ae75/ETxjuts+zuksUxuD7qD+i2N4X5V9FpwYntIiaRCpv2+DXq+2XE8AJCs
         5eGfwREFn5fhTgbGlxbN/xa87rW6BqdhimGmaIDZtJrbPS3nNQ9y3r5VcvGlkscgq/Cl
         K8Qjz2BelPiFIwG2nlLDtZFhm6YRkmaF3l3tIlIcEXEdW88e95YUZkPOvojShPSvwUda
         mmHA==
X-Forwarded-Encrypted: i=1; AKwUvBy1FEeYJZxp9iIAJWWVsJcKLxdoqObFa1QjTnzIQdYV7x/VC35TWXbKpBAOv1qK3JKZlOQxRQ0ZPQN0Zbk=@vger.kernel.org
X-Gm-Message-State: AFuF++mZ3IAQ5FBr14F0HkLxcXHDclaiBA1ghQOW8JtxeQhmejmIuXj3
	miYiJGtcZ/UXzc4NBc8ZwVQHuyqjMhWe71lgfAX2u1/BMQVU+FDGJ+sdZQIPjFyQjD/eC+WHDbY
	YKmdEmck=
X-Gm-Gg: AYBFou1Id69/vOf2O7ZByfXYXssKydVWVKW+94hRkt/cWX51jhW3eE/vlUsU/KRoU8K
	vu+AxCrYDIgZfyZpXLM6ZMRfo+u88bfGgbgUFEtBS9NGWHfMVQTf7MGxwTK4yAJ/Pbq5L6wdaaH
	shs5ZyZVC0eXGEQHqIdjvIOaZn0zxVkbDzQldCvzUV7/m9T8+e6rCMfhukTPZz7uMHZnWCN7uq4
	aUL3LhiDG3v26oG79ks/A5/AN87Jz5Gqh9hTHk0RJ5lIEA3ntix4SH0YoLGeEPitEN5zAvpYMBK
	SmHpOUEsX85ZN59mrIn01XqCKTKzABtyRheF3y5ETZdv79Yhqfx0uuxu6kOoWbI9FULfrKAdyPa
	zakdOFW6CRNaAT8/SBv9FQboBlK8ZGAQ9UXY7+KjhDX6EoUv5IJxFbFNvQuNBeuUPDaHYW0+1Yi
	5ADScMYhFOVfy/UJvTT4fVGFF85DKW/r2zvRet0RGuPDLd6PkZXgZ+KkWptqHTPFQ+3yvvcsWh+
	A==
X-Received: by 2002:a05:6300:6702:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3dacbdba23dmr7846333637.12.1789011609291;
        Wed, 09 Sep 2026 20:40:09 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58294850c88.5.2026.09.09.20.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 20:40:08 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 09 Sep 2026 20:40:05 -0700
Subject: [PATCH v4 3/3] i2c: xiic: don't clobber msg->len to signal
 block-read completion
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-i2c-xiic-v4-3-218df31e9d3b@nexthop.ai>
References: <20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai>
In-Reply-To: <20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789011605; l=2277;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=nou7d5wdvtm0ZSXFArEeFJh+YO34NwfkEsOlW1AJ7Ho=;
 b=zv+8OaV48dE6a8fuYTEiejGziZBr2QFmPlye9Nl6XoHbC2dZdx4WPijhaETqjKQ9/VNI4nE18
 tUSgNHxdutHADv3R3C1iogVivH5Z5/TSY7eA8cMW0+VNletiLWn/LFe
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

At the end of a SMBus block read the BNB handler force-set
tx_msg->len = 1 to push xiic_tx_space() to zero so the STATE_DONE
branch would fire. Two problems:

1. tx_msg and rx_msg alias the same i2c_msg struct during a receive
   (see xiic_start_recv), so overwriting tx_msg->len also changes
   rx_msg->len. The i2c core's i2c_smbus_check_pec() then reads the
   PEC from the wrong offset -- buf[0] instead of buf[rxmsg_len + 1]
   -- and either mis-validates or returns -EBADMSG.

2. xiic_start_recv sets tx_pos = msg->len (typically 2 when PEC is
   enabled). xiic_tx_space() is unsigned msg->len - tx_pos, so
   setting msg->len = 1 with tx_pos = 2 underflows to 0xFFFFFFFF and
   xiic_tx_space() never compares equal to 0 -- the STATE_DONE check
   falls through to STATE_ERROR, giving -EIO.

Instead, advance tx_pos up to msg->len. That drives tx_space to 0
without touching msg->len, preserving the buffer length that
xiic_smbus_block_read_setup() already grew to cover the length byte,
the payload and the optional PEC byte.

Also clear smbus_actual_len here so a subsequent non-SMBus transfer
does not see a stale trim value from this completed block read.

Acked-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 2bdba6c0931f..8eaa411411c1 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -889,8 +889,17 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
 		if (i2c->tx_msg && i2c->smbus_block_read) {
 			i2c->smbus_block_read = false;
-			/* Set requested message len=1 to indicate STATE_DONE */
-			i2c->tx_msg->len = 1;
+			/*
+			 * Defensive: reset the per-transfer trim state in case
+			 * the rx phase completed via an error path that
+			 * skipped the trim site in the RX_FULL branch above.
+			 */
+			i2c->smbus_actual_len = 0;
+			/*
+			 * Drive xiic_tx_space() to 0 to signal STATE_DONE
+			 * without truncating the rx_msg length.
+			 */
+			i2c->tx_pos = i2c->tx_msg->len;
 		}
 
 		if (!i2c->tx_msg)

-- 
2.54.0

