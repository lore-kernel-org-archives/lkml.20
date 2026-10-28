Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793172658;
	b=jAW+2/q+ep0VlBwKtoc+0MwDzUhsvDX6trklxkbaP9zHPhS2LqQnkaPZyhikNpeZ4OmT
	 XlpK6+oyt0izuQnRy0rXhNRHihv3sRfmFomuOpcw1AemDJwRKv3TAAd0poQyXMjG6l8zN
	 Cc/dA63jsqi2CBBQWtuT1Mup17XYgOLEWFxHorpSjf/cCy9kRZtW6QqLuNCXnerkQVCET
	 qXJgmSHKvrUnsEIlEYQBnaIb6X3ytJB0Lc19TxxS1Nl11o1bd7aNATb/+7ochfD5XO0uc
	 UXUpRI1TuCLMiwumVmEqyGQxp3iZHtkvBRGHaTbsDAt0TukKpJNasSymP2symYRhGJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=94kzz6GGJdMjFdi0mDx2nMqMBoR4dk5VY7WfJdM579Q=;
	b=1L0z0/dNOASU3/0MU4YdgrzeJCcVClYZpI69Cz7fQv6kak6VSK3IcgAcSjuO1tO++wzI
	 cdrzmgPM3zHsHs9IN1WzOldMKugD7n/c0tz+gAF/S7gQBeFlpz8Cd8Walmh/zvP/e7sQo
	 8mW8caxtS+tMV11L9heDw9YvEkJ9UD3q7WS/c2o6+BHqh/csawU2eowKEXUX6G7JrHy7Y
	 fEnfFhgo2dVHx27kEy1t02hZv+/o4K6Zsan385TRjCqsRuaEwim00WgBC31qiBen/K2tX
	 P/ilAp98sOhuee50c2wDDktlMgjqD6gsUwIyWi+e9v1Nkf4t5Njpy1tmvOrD3nSJ7VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qn64ej+2;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F49060A2613
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F49060A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qn64ej+2
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e0d1da913so495615f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793172657; x=1793777457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=94kzz6GGJdMjFdi0mDx2nMqMBoR4dk5VY7WfJdM579Q=;
        b=qn64ej+2M+61riqdcjD5N/QK/oFs/NsZoDPw+iP5hQ9phk9PxKq8YlrnLXqmJqw2ef
         a0ndLwje1iAA3GGuHNDcZPGzVvgxPPDM2EbJDR3F/GSrqElSKmKNb6841ewhPhSiAhLC
         uJoVPhNL301/nmPW3Uyarjy37FC9pVOAkrlNYrjz/2iakS8r2mn9hSS+iEToEToU+o3D
         qSqmQyMH5TrzEY4NCbBW+FVX/dTW7S+gIBDkpUMee+DOsG4SRzYC4/fOI5oYcc4aTLfj
         xqkQcXztTE5fEPTLmasFPYttp5yArgwQDdNsPpwidTZ92pRrKh1Bdw6fuf05TDj6Qira
         YonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172657; x=1793777457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=94kzz6GGJdMjFdi0mDx2nMqMBoR4dk5VY7WfJdM579Q=;
        b=rWwMLkweDxFQi77kacakl7erKurs3+AlAUF3Dq87so1RXMXwDk0aotFmj2B0+cUxDt
         46BtbU3fy7r4pIONI8e3ny0aEMoyBOVQBwE6ZsBe1eqM6w3OvZYJzJAs0EjlkFQgwuss
         OEIkiIMfXTSUjGEpK+Mm4ayzGMgbuQdvzG9Wb9n25PaJxOJDww6Pq20HPW2oZN6fsYrd
         6YfqqOtdLZFdsxq0zZIA+aEZaqihBRAL4BWOHzMhgrSUZel6e/IaXod9oqWY1e6HRhei
         g3c0a0vkILkZe9Jt/zYf550mLUyLVCUyqh2TdMuxGPnluCELce8b+rJCj2E2m8XSZGD7
         XVjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxNXPpYmLl2qhIZUIO5pJeEe7+QTUMwF/tgzEJFhEXhe8jPwh0683jikG3Z7ZUKU17FAJwJgdOjxmRhM0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3A8apXWtMA/b3jBZrrivATwBV6QHAt8V6F5SPjFM2VvjgXLy1
	Rjf5nk0aTWxytwMzLjs+Z1AhTXFe+x2Qh1jHbulIu/OyDG3nS8XZSOUI
X-Gm-Gg: AYBFou3G1D4MLCEGaHx0VaCPnGHZI5GhYJmdy0eAuPxQJUVVM2QXfsD6tIvoOr1mUEN
	2bdrGkqTSlj48IohMqywd4sKl1BAAyIO/3vcTBkE3pLJo/8IYMdrOPJQSRljR50TOTVUIF5DI5p
	XA4XZ8urZlPwtw7Q7ya7RhI8/FzEGEg/VbImfr6UV06hkL6tUUcKfENyf95ANdw6I2s4gweQhpX
	hqBhV1J0Zv0+/6RMxWzGSlKhInNrVD4HgzOqakq9CPbxZ8EqsN/AzVhQ209hupN5Au5dIxRIbx0
	vZ/JSQuu5A3xz3QF8jCqChedzGft+K2+k+sZbA/FtOxTqQxBczX5cP+2JVx62AIFM0PCxPEZzdL
	8jU77+WB+XPfmHGy7CAxJOPFuZbpjgKDOBxZypOG5LZGOa1cauFIz4fqQXRdHOLiqWv3ivqTrwr
	EuYNcwcwKP2MJisiaGJ85+aXm4JVeeXxx13DiZCmfLqFjoSHgTDQPFFbYm3XebHLiWgxXHIOYf9
	5CuNX+6pkg0/2TTdWf+PXzEgNcuypRai1sVwrBw5KupepL9TVHaCiCgY3O1x/e0qYKmzzeeAAk+
	DLlQvSZz7+c1EIsEIsBFBly38yBT9jyy+ZMXPfOikxrqE0EXkujFkyRAcqF8/ghBQEwfnTl1oXC
	8lvS0EPVzHDo08lHQKGkW1kiyly4nwZZg2Q==
X-Received: by 2002:a05:6000:1081:b0:48d:f5c1:dc24 with SMTP id ffacd0b85a97d-48e55a377d4mr9182155f8f.6.1793172652133;
        Wed, 28 Oct 2026 00:30:52 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm12083088f8f.13.2026.10.28.00.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:30:51 -0700 (PDT)
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
Subject: [PATCH net v3 4/4] net: phy: as21xxx: handle odd firmware on loading
Date: Wed, 28 Oct 2026 08:30:22 +0100
Message-ID: <20261028073024.25175-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028073024.25175-1-ansuelsmth@gmail.com>
References: <20261028073024.25175-1-ansuelsmth@gmail.com>
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
 drivers/net/phy/as21xxx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/as21xxx.c b/drivers/net/phy/as21xxx.c
index 81e9827873bf..655127a656c4 100644
--- a/drivers/net/phy/as21xxx.c
+++ b/drivers/net/phy/as21xxx.c
@@ -323,9 +323,11 @@ static int aeon_firmware_boot(struct phy_device *phydev, const u8 *data,
 		return -EINVAL;
 	}
 
-	/* Firmware is always aligned to u16 */
+	/* Firmware should be u16 aligned, zero-pad a trailing odd byte */
 	for (i = 0; i < size; i += 2) {
-		val = data[i + 1] << 8 | data[i];
+		val = data[i];
+		if (i + 1 < size)
+			val |= data[i + 1] << 8;
 
 		ret = phy_write_mmd(phydev, MDIO_MMD_VEND1,
 				    VEND1_GLB_REG_MDIO_INDIRECT_LOAD, val);
-- 
2.55.0

