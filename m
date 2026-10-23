Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792782565;
	b=AZtaIzTtfhAfGZBZox/E1WxtQrpNHaPj8Qh/c+PVlDnM2gbfozk492F3KlUBDAZx/rF+
	 r4kH7vTs+pC5yBqAVFuZofEAEioYuIVHY+Q4aHXf+4pK5KB+g+hM2HHUmNpWBX+cZN/t1
	 ROuCDVtCgv/QaT7JYOtuwSD/Gwihw3U43cK3K0Kq7S7K0Fje0MBrkrDb2V0asVuc5nJ2X
	 45czQDJ1SNKgEVKbOQ0CtzKLZ97jTdAj4WvCof/BXHTSTd0tfWK7bDdpSKjkJQxb9JdlS
	 oJmJHywFQpwPCz25IdSI2q21wTTt0BIoQoWp9vloUnn7iBOjv+Lr9bfaIyG53S1laYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792782565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N2r7UOrv8eZqrgzadXu3xwusx/htufx1GM5LO5xd2W0=;
	b=AIvDLxkHLMdisU1w8Cb9RgIrrll4KJtoo98CC3AZ3E4li8e3ISQEY4IZm/m1JSRaLhCo
	 VyA9d/CMD6b9F3HDVYaX02UH5eqlgFlUxBwAVM7aRGHHlnTdPslC5tC4RY5ospTauMkWp
	 UFmPqWQlZRH/enVOJBTo03jPrffjC4MYz0e8gze+k95U8gB2Co25lYmAill0nmma3EOh+
	 Ou5NZaZvCeqB6PhwxrR9mbriSYQpADPc2ZjVAP3X6mXLWswo9XFPeHMqsHevYDC7m+Ykg
	 fCC8iNVAJm7owaJV2AChn5iCJQeVkH+3K5/gtIXtnZsmY8GCNxwyiIzAjrHArHY62gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="TzN/0HUN";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ADD606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9ADD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TzN/0HUN
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so1193313eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792782564; x=1793387364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N2r7UOrv8eZqrgzadXu3xwusx/htufx1GM5LO5xd2W0=;
        b=TzN/0HUNV9zJoXbeF2BOnY4MY4lm1jv4x56xwpa16+sKN6uyLXR4EpwPXiZPU6vVCC
         EdtXepzELVhCk5RE+u3TI9udHmj0QW3cnrMllzGd5KjaAtOwu3/3MCC8FFzcw5BaR4MX
         cxw+CX5ATckoV/1a9XQZYZf3eMGzE1xtH33SxaaBJfwKRpoJSCuUi1OArrc+nSD/DQ27
         9+QhLLFbqqluvQO657S/+aT6a2CmvUGDVF58SjiunSlY2kWtEP2b1uGthsLo7YZ1JA1+
         v0VnmtFdEtnVXWqMGYvF/EV4qh9FcfJWEO/RDwrwkhD6Ke8t0v5uTiCqFyjmpEITBSrz
         vRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792782564; x=1793387364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2r7UOrv8eZqrgzadXu3xwusx/htufx1GM5LO5xd2W0=;
        b=Qqx+bYme5jSW/D+xHF4MaLoyROslpXP08vlGoDK4IGq6gvhi8p+4bbNSvHIClP68kB
         WhUqY7V3h6i3I5TWjRJRMX+p5M6ERzR5VyEBm776bfPaRPxSxyDYWdz+eRg9pbb/+ujM
         OBFKLz1FvNEor13YP8h9F9wrpeVV/twvdUzZRHFQJalnXJb0OEGPoHHRugWrLWgiazuK
         coC2e1MKQy6UvAVTIaHIkMT81MSfkeWa5aNc4qkQALeBigUuyhX73CnAVZ5L2VGWXw7s
         R8uDw/j7UM0O0NeTfji1oh3XRtEMUoUNy4yxr1WgDyvJBizo85XRUvSaf5/7ClO2C1NF
         YX0A==
X-Forwarded-Encrypted: i=1; AKwUvBw1Ve+maKwhQEFZK2tOIpfkbuIsFOabeidssLnVTg0FmOU0JxjKRLoplakAB+GgQ5fmOyKIiAEzIXbKrS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu8b4AY1zK/Psfe1P4rVI5ApcHebwfR3mJ8WgXmXavyqxCCt/h
	70onpyoHXVIkI+I25GfNdSpd8uljw7Rkq+8ln3AAbqvGxYFbYoI1+SWy
X-Gm-Gg: AYBFou2FBOAu8uhz/dpmwrqsayjWRhlWGHr0dNlIycBzuUASge2O6LMitKq5qcMyGeh
	tYF9B13hqvSLUh2b51EVikvUh4Ufqv8iUKmEE+9Q5HSu0HPrnsr8qJGpra+Cw0yyKUFB2FBhvPA
	asuSsz3V+aDkzh5qpMgmi8utwE2dJayYTY2v/+CoF4/4+z+h1m5fUmkBShDI+RePPPo68NYRKB8
	c9Mi3OZUkOSbuferFaMGFQrlwL5vsVokuswzzEJ5KabM/xK/Sho/yyCgbBMT8s7FGwhIg3Ih7l2
	jSP8F/9HNC5HqhzrOD//fRvk92Lt79KDEom9n9Ry3X3xgBKQlVPTAFST8CEjYculHVd7vwehYB8
	/W/GRpF42P4+hvBNpQGQJLLoobhe3g/EUdYlCd0TOaj9VjKUXy8UDfboPO9b943vDL4We12zDsH
	ldoXNUO2LFJAZgTnQFluZ2JXJsdF9kk4j/3bx/TkVDcw+igpmPy0mLHBP/SKwF1dGzf5cHFYVL7
	u5lW9a0OddyTkpzkUReyNdtLp2wRu6oNqoIWoqbWBPcAcAc1KYA917cfuCmZGeFc62kHEi29ci5
	3U1Em7nImE/RpRMi4u7zTgVGCTkGnuuYJgGSsIsXDEh2db+Ne8fqTBDyzqH6G55FtuVN/TYtZmC
	4JhbEMGJHURx8VgcgU86NAhVi5+Ja
X-Received: by 2002:a05:7300:80ca:b0:369:e918:3c95 with SMTP id 5a478bee46e88-369e9184604mr68042eec.4.1792782563590;
        Fri, 23 Oct 2026 12:09:23 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daa3a8sm159990eec.16.2026.10.23.12.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:09:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: b43-dev@lists.infradead.org (open list:B43 WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH wireless] wifi: b43: apply the TX power limit set on the interface
Date: Fri, 23 Oct 2026 12:09:21 -0700
Message-ID: <20261023190921.73237-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

A TX power limit set with "iw dev <dev> set txpower" never reaches the
hardware. mac80211 keeps such a limit per interface and only passes it
to the driver as BSS_CHANGED_TXPOWER. The power level of the hardware
configuration, which b43_op_config() turns into the desired TX power,
is only recalculated for a limit set on the whole wiphy, or when the
channel changes.

Take the TX power of the interface on BSS_CHANGED_TXPOWER as the
desired TX power, and recheck the TX power right away, as
b43_op_config() does.

Fixes: 1ea6f9c0d48b ("mac80211: handle TX power per virtual interface")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/broadcom/b43/main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/broadcom/b43/main.c b/drivers/net/wireless/broadcom/b43/main.c
index 3825b6ad9f4f..01e3e80b43a5 100644
--- a/drivers/net/wireless/broadcom/b43/main.c
+++ b/drivers/net/wireless/broadcom/b43/main.c
@@ -4161,6 +4161,17 @@ static void b43_op_bss_info_changed(struct ieee80211_hw *hw,
 	}
 
 	b43_mac_enable(dev);
+
+	/*
+	 * mac80211 passes a TX power limit set on the interface only here,
+	 * not in the power level of the hardware configuration.
+	 */
+	if (changed & BSS_CHANGED_TXPOWER && conf->txpower > 0 &&
+	    conf->txpower != dev->phy.desired_txpower) {
+		dev->phy.desired_txpower = conf->txpower;
+		b43_phy_txpower_check(dev, B43_TXPWR_IGNORE_TIME |
+					   B43_TXPWR_IGNORE_TSSI);
+	}
 out_unlock_mutex:
 	mutex_unlock(&wl->mutex);
 }
-- 
2.56.0

