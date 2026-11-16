Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814818;
	b=yi7XKur7H2i2aWSc+BysoUMQ+hu7YOJtpSWF85ewVkkaVfUqtrJNogjHdwzQZD4H8p/w
	 VEfRXyi2pvtFTZB07oPpBKA+GqwJtOcKWUHQhY3K/KMj9VcLll0jmOI3JedMb6+KjFC8R
	 JveoTKkuy85fghZIfs2KtZNZumcb/iom3X6rxxOzNQGRItK7Bwx4g1lwZ91Wa6rlVd9e2
	 kHWTOoiRf7i7OmDR7yzMpGkT/kUFZAb9XI6MDVz6+O1/bJ+0Btq+g1F2yzzS38MvzSoLt
	 K9A657pqRe/sh7o8rZhbvLWnfH5rpc8JA+SnVowJlnpccDdrMm+GXesBMPGHkz7E6CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2wEQ6p+0nkuHO38MDrTEOQ8Mro1bcRt+pQMVL3kDrCs=;
	b=KGhBspjRKINbZwU4d9gS5PltQdUVG8q9VWAdJRI+domRs6RtKzwax+n/Gu/CD9tHeiF9
	 z2X8AHt5DzcyxFSg9FKTOG0vi17CHTJKsC8XPAqVM+6MqurkavzzCQd2ogE7ONUqMDbrl
	 UxU0lKmdhpzkY1LPkOjy8AeB920OOjHY9yiSY66LwnBOP3u8uoYoiQRyEzCUNsNWjfVB3
	 DadjsagHxTW4EVdQybQtdpBwNEnnx9mhXufKQFL5oyJxE7gIQ+InG1R+ys40bSdg71lsT
	 HGWtZADj+rQ1Z5+0Ed8p/UcFzl1IDWXjlbdxu6qQiVFuiFxmRiwn6V0zoAn+yEEE+nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ffroot.co.za;
	spf=pass smtp.mailfrom=ffroot.co.za;
	dkim=pass header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ilkK5NIL;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32EE606F1B8
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F32EE606F1B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ilkK5NIL
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1462820f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20260707.gappssmtp.com; s=20260707; t=1794814816; x=1795419616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wEQ6p+0nkuHO38MDrTEOQ8Mro1bcRt+pQMVL3kDrCs=;
        b=ilkK5NILBGSMJo+Z9Q1oPEkRO3cb23AYDG9j/QXAQY+Qygzn5CItslqQ3MozPQfs2T
         5WygLoaSEBZ+snuZC2c/9qLvSv8KzR7kf7KBZrin5FTzcXnJ+0tB4LzlLM8t+Y0jgju4
         RE/sCNBXRZW/oJadpSfi5s1ynVPDUPdLeCDeEmB6ttsb0zxgeNqinh5fxKeiPOt56WmY
         n6BphyhgMmiuLGcl3YblaxVu4YS6ODQ+od8bd3L6b/lNV+irtTJ4pxls0LLtdk5zQg23
         EXEm/wuKIgpKoU/b7Dw+bAllfkgZAqk/rvoojHXo9CnRD7pbfhyqUEHjAdgR5U/T5jkv
         fQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814816; x=1795419616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2wEQ6p+0nkuHO38MDrTEOQ8Mro1bcRt+pQMVL3kDrCs=;
        b=NWNpLCStRGrPO96tV8U2hgeAQ9pGfpudjNdrLW+rfqaqDnXU3PgcaHCmRy9XdatI5b
         V3Ky7PFifZth8FtadHpC/r+nCM1r2c0n8ji8FxLkDPxHB6Ijn4W+CJuBz7HOvrlFkk0F
         /DXyQWb5MgQ0P+lg8dcWbMuCGxmE4SXFqg32yA/iU9nefaUShdNJqCZMSmHOVvWXqCip
         IhFJrhBlJTmyJub+YHfs7+Jq+pQr2hqP9cKBdjzJpwx4y2EByu9f6lJ463KKgzlPXq8b
         0OzTkJI0t6l91VRvhPZ6Wt5o7mpQGcYpdbbppUwubJaD9znxZhc4Pab8sUDMoEsr8iuZ
         7Mcg==
X-Forwarded-Encrypted: i=1; AL+hErF27EmlgrgSFHvYkGdIj38kwFhvHLOHjcbnMqYY4TfUU3i5V4ilQPX33Iz/gCk/HQ7wJMfVQmio5tEkn5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rjdIuTlvZT103SXol0lu8XZ0mt6GYrOSubTQFzo72xhDv6j6N
	o1kFlsOY8KZO54JUp7+FPLbrD2LqkXypqzTsatH2li13LjyuuhxNi/QiMOvgG0w3woQ=
X-Gm-Gg: AYBFou2zbHIAFKi1E/yChu+YWOH9FdHzF37xNQviRxIYixGl2C/9S7HWPbMCGBEdIt4
	k4YgqFj2lb16A0SzI++D7oZqNPnM5kWii0nEoFzHObHd3NW8KYR0rcCcNEopz6fPBTCXgzLTnC1
	TfLhZ8CLuOkeW+YaV/CbeJcUNzqE/TVkRmNYH6OlN8lGQktOuzLW4McsZabI0OBUqOYjDNvBalW
	LZNpQQpUhvArET7c3xJPyGsF2t90ql9Scn7Dp5haPwnMVuuiAOQ4ZEcwjL/hK5CvDHCrCyfIB8L
	tZiK8VO3rY0cUteyg4q7qafFaFc4Iw6swy3MErUAB8ljQcYfxjRbc642XuOEmJZO2QEDy8/93ey
	jF7JhmBaWElvvPoq7mnLDb+eCIXCgC5sEpyAw1BcEHKf/v1AQS5yqMzuexqCXdKwNd7cGVpoMbL
	R/d2Wcu2uLOA6EO/Ntw1hv7H3KdG6utKhnCG61WzNJ0TN0QWN4GCDugF5EqoP+jW0dJ+QUkUK5a
	HUp4Frc4dXzZNm9S5ZlGvTd8dVYc9SQovQH+OmSXTVkQOXxH6PZJXQH2+PtxvICzr6YRF0ruH+Z
	tHEeqSslEDWsXIDNq+vsvzhS54yhcM9hTEvpaoi1GKpJ/RVwgfyxNS44k58OSUo9YOzsiKlJ7Q=
	=
X-Received: by 2002:a05:6000:29c9:b0:49c:192f:cf34 with SMTP id ffacd0b85a97d-49c740bcf38mr14158063f8f.41.1794814816003;
        Sun, 15 Nov 2026 23:40:16 -0800 (PST)
Received: from localhost ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e4a2asm20106374f8f.39.2026.11.15.23.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:40:15 -0800 (PST)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Vinod Koul <vkoul@kernel.org>,
	Vincent Shih <vincent.sunplus@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] phy: sunplus: free the disc_vol buffer in update_disc_vol()
Date: Mon, 16 Nov 2026 09:40:06 +0200
Message-ID: <20261116074006.20357-2-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116074006.20357-1-ag@ffroot.co.za>
References: <20261116074006.20357-1-ag@ffroot.co.za>
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

nvmem_cell_read() returns a buffer that the caller must free.
update_disc_vol() never frees it, so every PHY initialisation leaks
it: at boot, and again each time the EHCI or OHCI driver is unbound
and bound.

Free the buffer after taking the disconnect-voltage level from it.

Tested on a Tibbo LTPP3G2 board.

Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 drivers/phy/sunplus/phy-sunplus-usb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
index 52d80a06abdc..043feeb6e267 100644
--- a/drivers/phy/sunplus/phy-sunplus-usb2.c
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -20,6 +20,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
+#include <linux/slab.h>
 
 #define HIGH_MASK_BITS				GENMASK(31, 16)
 #define LOW_MASK_BITS				GENMASK(15, 0)
@@ -97,6 +98,7 @@ static int update_disc_vol(struct sp_usbphy *usbphy)
 		set = *(otp_v + 1);
 		set = (set << (sizeof(char) * 8)) | *otp_v;
 		set = (set >> usbphy->disc_vol_addr_off) & J_DISC;
+		kfree(otp_v);
 	}
 
 	if (IS_ERR(otp_v) || set == 0)
-- 
2.53.0

