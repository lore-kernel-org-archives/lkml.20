Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708230;
	b=laEkRIVfx99PFLYFPKpa4RVfgURstDJcvDOLQN2b2qppxDvmZgdynxVZsAfBAQ3ozF9v
	 qCv7WrrDgIjWtwkINYtMyMGxW1RdM034BWWBDzf0WF8czpM2GrNzTKFWVXe46WdIjCdGj
	 J//N1g4kL6OfqAbMMWBH9eparP4IZeyoDNF2Nn50+PTiZJxPOvaFmPkKwzJULrOWAEfk3
	 lzAjqGw60wcKKq61dCd24suLVWKjQGiJlS+oNleWypEhm1JsAtgM8lXDbYAQnuwxdujf2
	 ARDgT1b8KYG6O69B9NjD4IGUsC/PojbhVU1Kjoe6ZQ7RAFYsTRIm5rDNEym+Vmy7VJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Plu3+ssJmDtN7QABnZS/dzw7T36ZZ1uQzc5jvzqtel4=;
	b=oQCDgMdyTxfQuju/63rswSD7fc1rjFj8l34C4XHJsQUbeAjBUXRJ84Q8DFuf9IKBWyeu
	 o7h7j4PfzXisJWmNDKoQmcBzd77VBjIGnNut6XUZ06zVojLfBcb2X6UysR1BaTUPen/Cx
	 RypaH3XnmTrurhejwvHKkGVdvxNqYIimuvVz2KguI4b0iwhvYGAp63+BQBwrGjwmRzVhy
	 GJo4ZJWYoMhRc3tBGB/UZgWlcMru9OaUvFgAnl/pl4IjO9Q5cgaQt6zVhZQTp6fG/J4KZ
	 OBO2ua1734kAqUbA+wnlOdIgpIZDuExV4YIZdYamIij9Ww/0rhSzX4V3kcT7LbhvLRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Uv2k6mhP;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D28606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2D28606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Uv2k6mhP
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2074a66beso1862835e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792708223; x=1793313023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Plu3+ssJmDtN7QABnZS/dzw7T36ZZ1uQzc5jvzqtel4=;
        b=Uv2k6mhPiQeP5yU8YfvHZplpwjguFYEz748JwfgVSjcRTVTXls1RXkkkU7vmhjMK3C
         AsbW5zsii1/XLgDdhN5Sy0UxdR5x1+1gnOQgyFETh6ixT+ke46+wFjnRoD2OvPIKfXeU
         iiigB7kAqd7opuwEh5I7NJVlHaDHpVSKdf03bRsEUcFBtt6PoYAC4yGlIY/OFKeVFmAo
         vtxgcu2zfxhGyp8t8KWN936ptxg60d+1ET+JSGNHP8A/ODbEDpbL3rlo1gS8qIHDT7vx
         y4oHx6KBQw4ZMJMCh5LgkV/mPmthj9kjR/EtjJkaIPMvzsGz7cDDHgcBpqX5xKLzFILu
         lNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792708223; x=1793313023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Plu3+ssJmDtN7QABnZS/dzw7T36ZZ1uQzc5jvzqtel4=;
        b=j/KLl8nKSXI20VRWEHKfrqTLRjA5TcG+YeqpIwBEEMFAUK01r4L2Qw6HF7dE2UEz5c
         cPgVSZ1MXPkhmXljjulKsDaGhAwi19gHhTLQ0ujvB/T0TWjOLYtXPTbTHp9vfO7JC7El
         lP3yuI36JTS+XZ+81XjLZumWPtLsHzhLk90Py6W/+7r2gTixLYnk8O3JGq3OWvZqcBqT
         9ZuPulrbPXbh+25k6x2Vlwavj8n0vrxvJMIJc7q4kqpXh8Wmk2y88i2zjrTw52/CMTKZ
         g7fWW1+2ibLE0mjT32ylB2cAzVfO7N/euJWpxyPzycwDQfWXHkksyBpgWTzdWk82O2qN
         rw5g==
X-Forwarded-Encrypted: i=1; AKwUvBzVH3CxvQeMzs5kE7oVHpLOljzQp68zLGAaz+EqJAqijFht+z7tg6SGa1sSeArImNKC7b3ThSuGp5hILXs=@vger.kernel.org
X-Gm-Message-State: AFq9FYICsHXbbcjLijOy+rXIlSQBkD1AmnO8i43mXPu5ihXjoQsvoUQ3
	wkpIcDyBzLU4shwre6t6tTIXWPZbQspyMOl7y+gXooka9bHwels9PI3B
X-Gm-Gg: AYBFou1D19Z9sR/c5FYgkNJietULtaM91pI0XmfP5NQbNXdLLdj0l/kQTNflkTAFjw9
	TN6RmRhupW30OW5L31AogPY99+e2TQcQnp4n4IC0bbxylr3v4RM2rtq4nsyPhmaYpSdNZRxvl2L
	C2KxYCiKN+YQ1r72dZbv6HmET44610UYZJWl3n++So6xQW2FgK4UuhVpPEobEcB/qXeUm1caUo6
	fZ4yEthLZSwsXH+hI2rXsHNoEQ/255SExX9Rbi8nz/SwQIbaqEIobVT5KaqtU7Y1HVf/5XCHPGW
	4N17tvInGqJ9nGGqrvt9hXT+G/jMTj+3x53AWHO0bj+h0VxtfaNXp5TpDmFxnKmKuSqEPV1KiFz
	iNY3C5xwwzFAhD4CNFjf7G0t1r7KLPvgjaUf+lLoudt0Ll3EGKuuiB9/ZUEHszWuNQhNdEG6AMe
	8Imr05rt4D79CjNI1vsEm5in8D6/rxJB7W3Tj6zzJOOVS346y4g1rrZy/Ui8IGayB5tpuPU/s32
	BXoRgIBu4MGC7NJIQ/XxvyF7JNq6sg7qL1TshigTILEFl8rabPV6tgkxRMEKHvbJKqMCseI0pTt
	wVNkZq16aQjKVKcVE2KwQgrgRTz3y7TRm6vS9iktsdaXymJiL4pCg9lNzkQo
X-Received: by 2002:a05:600c:e548:20b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4a2136426b5mr1430135e9.3.1792708223011;
        Thu, 22 Oct 2026 15:30:23 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a211be8f79sm11958795e9.14.2026.10.22.15.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:30:20 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 4/4] net: phy: as21xxx: handle odd firmware on loading
Date: Fri, 23 Oct 2026 00:29:54 +0200
Message-ID: <20261022222955.698722-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022222955.698722-1-ansuelsmth@gmail.com>
References: <20261022222955.698722-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even if firmware for AS21xxx should be always u16 aligned, we can't assume
this will be the same forever. Better address this by simply validate the
index before reading out of bound from the data buffer.

A zero padded buffer will be passed to the AS21xxx mailbox in such case.

Fixes: 830877d89edc ("net: phy: Add support for Aeonsemi AS21xxx PHYs")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Add this patch

 drivers/net/phy/as21xxx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/as21xxx.c b/drivers/net/phy/as21xxx.c
index e2988cb10c04..db1a7cd68cef 100644
--- a/drivers/net/phy/as21xxx.c
+++ b/drivers/net/phy/as21xxx.c
@@ -325,7 +325,9 @@ static int aeon_firmware_boot(struct phy_device *phydev, const u8 *data,
 
 	/* Firmware is always aligned to u16 */
 	for (i = 0; i < size; i += 2) {
-		val = data[i + 1] << 8 | data[i];
+		val = data[i];
+		if (i + 1 < size)
+			val |= data[i + 1] << 8;
 
 		ret = phy_write_mmd(phydev, MDIO_MMD_VEND1,
 				    VEND1_GLB_REG_MDIO_INDIRECT_LOAD, val);
-- 
2.55.0

