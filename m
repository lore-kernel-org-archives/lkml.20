Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5951F4FECF1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788463888; cv=none; b=EPwAbQVCyTKnED5+zsvII4Q+Lzv3cUBtzZCxEyY3hokL4U+tkRX+cI/XQlwe6HjuU/8zuvSgjsUfew7PS2FLGjzwnXmKROwDdjuIWsx8NRF4k+a4XeVOy8R8JNoweALH3ikAyc/vTOS3fK2ivkccIZsLA5rFRfIScMVPUXFMZxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788463888; c=relaxed/simple;
	bh=LRIB+Ien8LNhu1QGXr1xo2szN3dRaFD/6agQW0q8qxs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F9xBXPUFBnKiyEpUhTrVGOVkgblGyPUE6BqjKje4mE/cFcmWLkJLBTEqv825wVTLxbR8D3lXuiQynXAud5UkKxEo8YebiGTuEBIUk77kJFJz0KuT+Ira5Ks3AGB5MeWlbIl2XIPiyYkxHo0/GOXRztlcF41RRtm4OuMNwNqcRzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rwdqi28I; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rwdqi28I"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cace91f112so2068335ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788463872; x=1789068672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yIetKXnfU6qQx5OfRzSQNhmvwvEsmpVmmGdbC2BbsE=;
        b=Rwdqi28IC2n6hedfuQzzuOvAxUHwIrsve3Gvv5hDjjOH8/BdTlPKNocnWSsZ9iHz24
         Cf+BJGD6z+rNWWJZ5WlUG9TeDcubItwYFJro72JonhFc1nnLyjJ/F9dSmhevIr6UQnIA
         wJshvg0BFGbf+Y5fSBSkZgfoHksoPLpFYdAYUWKh6V88P39NLoeLhRb+8kJiBMm3cEXr
         8q/hpredYakkLfqPSedRw2qfHjPHFjAAkwid8sfU4XUlCpGtOl5Fh/FcBVsVcoHPOEET
         bAuvGHb7GsC34+irRuoncZwGEQ5dvd4T206H1kllv9+yTopMbixMwhS5d+WNqOhPsrOb
         uhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788463872; x=1789068672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4yIetKXnfU6qQx5OfRzSQNhmvwvEsmpVmmGdbC2BbsE=;
        b=C2JlkhAMaUU3Xen4TrpPm8IY3qKE4eQsaC7JpjxPiY1yUdTPbD/aIgJYwg8IoMg5Yp
         3FHwSJSbafpOjBlZflEkpxC6anychKvpiAX7YOKX6bjGeOvMmkUCZ1YyKTR984V004z+
         oJV/M6ySKkWOx8tJWXdI9JDJaGNhIcpMBvxzgXyWtUTLtAgUAIsIACZ4L7uiZ0FiuHYV
         k/EN3yMMy4m0DztBo92E2NqYsgEIpGFnh6CKYgNqlSynXG2FqCES0Qm6k7oCBpZrWvfY
         7qv1KN5+QMnW85Yc8Uack5XMTGyJiJosFZ9rN0aXpc/qyxPxvVhJhkw0duRd/Vfa0tKF
         TczA==
X-Forwarded-Encrypted: i=1; AKwUvBz9RDmkMA6YGA5YhdbxmCTBHkIdlMz7/H7AYginueb/DfEpFJHYiJPrB5lSQRk4ZPp5vgTfvzfF+u35dwU=@vger.kernel.org
X-Gm-Message-State: AFuF++nYgb2aETHCf/BCxh4mFS9tlPYAgQPJMICiNCLq+P8yvd8JjvOb
	D14ZGMJAa7Tcf9S8bciBe26hlKsVoXXNdsrRzRAVfGHZtB2QkaCAWP6e
X-Gm-Gg: AYBFou100UdzTBrrBtNdV6h2deIcTITascQ4sgyzfJZIVRJHbDxQDKQM5zxJgRhDc2I
	HR6dp0yx6f/qJUOYZpk/L2duxDLdocn12n4EmFCqmpCX5kNcm56ZEttHQ8Q+PLA1XDXVN2pkhQf
	sksFFL0J6xH8hlgCbs29Vy1xPddM8L4PAtICQvlWYdyeiKbLVnP5LZLabOfTyFTySw8PvYLpC7T
	e1apcViN9RtZpLk+vwtS4/Vpf4RrUPd44AOFq26ZzLTGxD3weT7D8SveBe0YfOPEEQzzJoksgCR
	LP3CILpZc3rRkVgwGaScFrgApmgAzP30Itb3dCZP932ZxXWnnBJOtdV5diiaqSD57F9cfIw2Un6
	lMd8fmMKRqZcVvKzIUY6FyMg3T7bMdwkufC5X7qYReDFb22TgCqk/UQAfKI0GJsP2BTz7BIWfxC
	EogkvnSmP3+fD6Fe1CSD8d7jhE7Rw0kkhZ+mrHFGRIp25bArYW9STbQXLVziGqwXTENHiCvoC4/
	9x5ZgfHo2DajS70eDRuC8vQwKjOSirk/uT1yt9wS8WUPQ==
X-Received: by 2002:a17:903:1670:b0:2d9:438e:b70d with SMTP id d9443c01a7336-2db1232c88emr19260755ad.1.1788463872345;
        Thu, 03 Sep 2026 12:31:12 -0700 (PDT)
Received: from lza-virtual-machine.localdomain ([223.160.226.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae53ddsm396985ad.78.2026.09.03.12.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:31:12 -0700 (PDT)
From: Zhian Liang <liangzhan5dev@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhian Liang <liangzhan5dev@gmail.com>
Subject: [PATCH 2/2] Input: tca8418_keypad - fix race condition in interrupt handler
Date: Fri,  4 Sep 2026 03:29:42 +0800
Message-Id: <20260903192942.21906-2-liangzhan5dev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903192942.21906-1-liangzhan5dev@gmail.com>
References: <20260903192942.21906-1-liangzhan5dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a race condition in tca8418_irq_handler() where a new key event
can be lost if it arrives after the FIFO is drained but before the
interrupt status register is cleared.

Fix this by re-reading INT_STAT after draining the FIFO and repeating
the process if K_INT is still asserted. This ensures the FIFO is truly
empty before clearing interrupts.

The FIFO depth is 10 events, so a loop limit of 16 provides sufficient
margin while preventing infinite loops in case of hardware misbehavior.

Signed-off-by: Zhian Liang <liangzhan5dev@gmail.com>
---
 drivers/input/keyboard/tca8418_keypad.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/tca8418_keypad.c b/drivers/input/keyboard/tca8418_keypad.c
index 9f0aace6bd21..0952370c0636 100644
--- a/drivers/input/keyboard/tca8418_keypad.c
+++ b/drivers/input/keyboard/tca8418_keypad.c
@@ -212,6 +212,7 @@ static irqreturn_t tca8418_irq_handler(int irq, void *dev_id)
 	struct tca8418_keypad *keypad_data = dev_id;
 	u8 reg;
 	int error;
+	int max_loops = 16;
 
 	error = tca8418_read_byte(keypad_data, REG_INT_STAT, &reg);
 	if (error) {
@@ -225,9 +226,19 @@ static irqreturn_t tca8418_irq_handler(int irq, void *dev_id)
 
 	if (reg & INT_STAT_OVR_FLOW_INT)
 		dev_warn(&keypad_data->client->dev, "overflow occurred\n");
+	do {
+		if (reg & INT_STAT_K_INT)
+			tca8418_read_keypad(keypad_data);
+
+		/* Re-read interrupt status to check for new events */
+		error = tca8418_read_byte(keypad_data, REG_INT_STAT, &reg);
+		if (error) {
+			dev_err(&keypad_data->client->dev,
+				"unable to re-read REG_INT_STAT\n");
+			return IRQ_HANDLED;
+		}
 
-	if (reg & INT_STAT_K_INT)
-		tca8418_read_keypad(keypad_data);
+	} while ((reg & INT_STAT_K_INT) && --max_loops);
 
 	/* Clear all interrupts, even IRQs we didn't check (GPI, CAD, LCK) */
 	reg = 0xff;
-- 
2.34.1

