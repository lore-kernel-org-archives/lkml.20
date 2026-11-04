Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793699;
	b=2Vo4NAac4OO1Wu6lpZ6U+sDGmKL0pWMbE0CwYyswJs4ShgnoMW2heIh/9PvA2J2VHkDT
	 PLxuNdj7K7vsIwChmd6fC6pqqf7BjkRoyUNXenwyVvrBx6u87nef0+nmXRkkBFuiDnLcf
	 xG2Yk39psZ6WhD2N64II7EFHeM1/mTB72yjX9eaypDG0iFHY21wJhJQGlFV15o0z+jUtH
	 LKuMbAsrrMRZqJ1ZwcZ9m1mkEd7tOgyw2I1xmDGxyBW/JuQKLJQV7cnEg59dQs2K4hAjv
	 zAsWXfv7NZx8HDHeAKTiWwE7O9WQl4NJCn1/QdOQZSZOtj1Y1cSJwqrYkXhr1VIcBOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pj46THSmK3XVIt6CZehlPvClpThRqk1tLW+1q1fbcIo=;
	b=caLeJSFkIV2bm/rjnFa/6Zb7UvEf3LlB+8lB4rQaHG0ieNJolk5wXNAf54RR7Niy+5y0
	 RLD3ZSzAA+FR8jNTaHHVDltgcxZngG1B/wsQBFpdcuWoWK1Cs7aAJCiGFMZhXxdzuX6ZY
	 2zacJFWmy+Jzjtkv/chbzvRlOxNaLRO/Hrl9/7dx7yooQy/wy30975vmhP1QIYVcGHBMU
	 oR8bWkoVTcAj2/mV5I9CiSzxm03etxxS9EPg/xizy7/YKa9doNXe+N98KI64+Ak2CZhio
	 oYxFqBfoxiU+AYSTBzeBlAh0/EvTpKj5cnSLlYLthPYgIZ/ajiX7KexBNvWmLoy7R6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jye49RJu;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA71606D81A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA71606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jye49RJu
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c445c95d553so84361466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793793698; x=1794398498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pj46THSmK3XVIt6CZehlPvClpThRqk1tLW+1q1fbcIo=;
        b=jye49RJuZocwZEAZ575Aa1gSX2ycDMU9/pFnLzHIlC1AVD33GD1Fk22NvqOFvRX5Aq
         afswAdJe4KwshMtCSq+GGqvPnTTVM81asFMVc0Jpw52fNYpncJolxpntPVdgtElrgwz9
         dIpLTotsSa33nGoVk3KNQTeNy5iZ6iUqZn63u8FAT7wwMcXL1SeEMJ6UbYv2cL4wMAiP
         SkbHbAfP8+9OBQ6jRMzSNb9rRsscDctjhBA3lR/lOxdGJbtHWajug7d4Ulj4yeV4mfUU
         +UAIkwv9crXFl6pa4H9YayIaJSBpC9fUyGqX5JwjL9hoBd6jppDLDW5W/sdECWPEuAGs
         SnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793793698; x=1794398498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pj46THSmK3XVIt6CZehlPvClpThRqk1tLW+1q1fbcIo=;
        b=LH/+zFBb9pDN9x0xuZl0OzAwTiRSMSxTkW/i8y2j1RiKIuI4GbrK3glcDao6yITaOf
         ELk1E6gaoZ/R8fR73AmyXLCq7/Xp0g8Iqa7KGgsAzucVZC4pe9x6oq/ja6zZieIfqjVQ
         g3Y1YSz7S/I72ZCg4l3i5rgkuQyPbllrO0GhTw2XbA2S9zR66wF633Tl1M8Eekqt0wyt
         DM0R7nyVSrDGcyG1kD5uPXW++vrJjNJJrCGNjWcnQDE/f1Iwhmebw7e7Dr1U9ICqh0PS
         PgInbEAjyMSx3mPjO2VsfnaINyoT2EGyJZmZmW1fKHt1sPqCBP1b/cTBU5LrVChIq4jG
         2t7Q==
X-Forwarded-Encrypted: i=1; AKwUvByKmvYLSp3/9por0QVIl4Q7YhQOFPzmrC51TbYAbClKViv/42gGqYDcDWLt2UhFRG5MXCSqnfvmfcrayjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z83F7WHtS2iUd8AjhjnxBmeLtU75lQ+/7sZwvHHIvucsnSuX2s9
	kE/Bm/EDvdmlG07Whroi6XBb0f9To66bk1r342i9+nSQxOtBU57H0g0r
X-Gm-Gg: AYBFou2qmG1dPL+z0zuTxWeJvc1oz6ljhtE2IsaO4tlubu8R0ZCwLmOPRTzRZrsFI5W
	qtPuEebMCy6I7kSV+ElZ/MfSjtXU1T4y0eqUHQV24neB32Uta/QnbXzLQju88XctB2eyMsPn6Ov
	mlvWb7xQaluy2BcW9m9VkXpnxt/Jfg9Dz5LpzNimvzKbRPt0jYwn/tePIp9F4Ir9MY4Ey2gTnA4
	s0I5MF6XNSDZo4iBNDnPaj8pUanXPTejuaEaOfaY+0bOZ0XoRnbFAf8n6646jy7eHiJEHX/KLp6
	AC7CZtjudt4IbsUKRcnF0RRG55orVH0tHU6g1u/4atzutq+EYBb6vtZK4O8RgukJW4ReHwI8lNI
	o7pPF4izfWM9iox0SRjinbsa7mcO5YciOXsCiBtzsiRGR2XKPc1O9CX0fHV78hx3Vrddo1p5VZj
	ri/Dvr17xE4FHGOKDkoo8ngT5/QV+qesjuiCWhqQslrQH6Xr8t9yGd6LucJb3ILtR0BsMc/re4c
	b3ZThixVXqATKosxJ2Vu5nqKZz5ruE6XI2o1Q5qsRiNj37yQMTiFz1GONzx3D1+I87DYVeI+JKu
	KBpN0G0wf1xLD0kGjdMozrkIsgGS9i3QN6tcEOQ2rCJgtQkrOY6Mk8vfrHTOlOybtoUxYI2zdzB
	OhRW8RHEGY3vbNr+vLM3HSFKlSrN7ZVIWAzQTnqATqZDAxHMLdzqa4ysH
X-Received: by 2002:a17:907:60c8:b0:c49:a4b1:9cb1 with SMTP id a640c23a62f3a-c4ca795fa50mr1804960966b.3.1793793697694;
        Wed, 04 Nov 2026 04:01:37 -0800 (PST)
Received: from CCM-PC (83-233-221-133.cust.bredband2.com. [83.233.221.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e424f94sm60940966b.24.2026.11.04.04.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:01:37 -0800 (PST)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>,
	Stanislaw Pal <kuncy7@gmail.com>
Subject: [PATCH net-next v8 1/2] net: dsa: qca8k: let regmap serialize register access
Date: Wed,  4 Nov 2026 13:01:28 +0100
Message-ID: <20261104120130.48455-2-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261104120130.48455-1-yongzhao.derek@gmail.com>
References: <20261104120130.48455-1-yongzhao.derek@gmail.com>
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

From: Stanislaw Pal <kuncy7@gmail.com>

The regmap is created with .disable_locking, on the ground that the
qca8k read and write callbacks do their own locking. They only lock the
bus transaction, though. Since the driver moved to the regmap
read/write API, regmap formats the register and parses the value in the
map's shared work_buf, outside of the callbacks, so two concurrent
users can swap or corrupt each other's register and value.

Most register access runs under rtnl, but not all of it: phylink's
resolve work (mac_link_up/down) and the LED class callbacks do not, so
a link change can race with an ethtool or LED access and write the
wrong switch register or read back the wrong value.

Let regmap take its own lock. Every user of the map can already sleep,
on the MDIO bus or on the management frame round trip.

Fixes: c766e077d927 ("net: dsa: qca8k: convert to regmap read/write API")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
Signed-off-by: Yongzhao Chen <yongzhao.derek@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 07227ae8b..1e4f83e9e 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -579,7 +579,6 @@ static const struct regmap_config qca8k_regmap_config = {
 	.write = qca8k_bulk_write,
 	.reg_update_bits = qca8k_regmap_update_bits,
 	.rd_table = &qca8k_readable_table,
-	.disable_locking = true, /* Locking is handled by qca8k read/write */
 	.cache_type = REGCACHE_NONE, /* Explicitly disable CACHE */
 	.max_raw_read = 32, /* mgmt eth can read up to 8 registers at time */
 	/* ATU regs suffer from a bug where some data are not correctly
-- 
2.43.0

