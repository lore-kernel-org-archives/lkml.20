Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F8048FF74
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364425; cv=none; b=LCUIEvN4mI7NGmSi68ADehMDkE/zcHgckKiMhq61cSdr+UTvrx6OXf6QI9WMJQF1nR7WC11HrkVrgI2w16Fg1visJZeIdmFU1qs+phk9VXs49demMPmjFExMZw/CWLzbd5X/XDRjSeJl4runQTlkoMeHR1On8ciYHGP2oZhGJpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364425; c=relaxed/simple;
	bh=lfNflwzFfakNFUXco0CxnkEJv+qPMaoLJV1qXuNxC5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CWEjvWxkkNWUA2XGDS0m2lw5HscOFZCHua1JnfX0SdU/zkFdDOhePo7a9rN1Xj7ePhXZdupWFR79FlbQ7+8kUDM5FkCsJE1C50FOcPKfJ7Jue6HVCYshXIobzcpZXw905AlpdgRMj85GmI5cpvSlruFFRg45lF4wW1NFG1HPAu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMzEhM0w; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMzEhM0w"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2258505f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364383; x=1791969183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4fuPFDm1xmkCV8BFlsKZyWcKHGIk1OaytXvHyZfAPA=;
        b=JMzEhM0wHZAUwEBJihUBaA4bGt36II+Lxv/AsLO2ElNl+/Ugo/H2/lDj6LsyqHTcsu
         UtD9gCoNrQmxxcbZHNp+wkzQYTLbc43TYku91uej748+Uov7Am8yl8APVZIEiUv96dO2
         df9PiKt7DDfSx6MqpJZSRtdxwnpLJuQpDkqSEkzlK8OGUCpsR8RJW38vFCzIADWZmxxs
         aql2T8XpJHUtZffPEtNBlRCqm53t+zuuchjSt7QYD8D3IyBBLLnifkkNSlb5FjW34pEN
         yDYOBtH0J7VrpKG+Lcngugxa5vi66AK24ko6XcJqHMGtqbr4isKb6uM9+us8NtsMEDsw
         Y7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364383; x=1791969183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4fuPFDm1xmkCV8BFlsKZyWcKHGIk1OaytXvHyZfAPA=;
        b=KzdkseBYsXUedT07OGJ3XGqoCS8X286m/SHuGzCdaSNyL4yfBMOLQt5TOhhCG8jnc3
         oqf9MJjt7Vaa8PewHXmpf6vANh5dlqoBMXsg18D6wafy60hC4Ulr2p1FRq5xTOSNqi5R
         qVWln4NKKDlwLmPCaDomVJ9r7bcI3G5CNE7gqNJQlYDIJleVylv+2l95OPmOgTmTIcR5
         miHm4PEe4nLs4GUQYCL1SXUe8xJ5IUdNLDFpWBAV79H6u+2hzXVFYfkao+uzMWkv9dT8
         rfzhHZWSnBCRbiP+llaqh28awwCjL3m3GsQA3Dlx7bG79MGz66AAhul3VuT7XuOnPkof
         lVrg==
X-Forwarded-Encrypted: i=1; AKwUvBxApRlcSiJB2NOCDy9vNZ7hIsQv2wm7OvBvK2pHchhSjARG9g8RsMTUOy958/2cCCF6uJuycPO8yGlIyDo=@vger.kernel.org
X-Gm-Message-State: AFuF++kv1tDMLd7MBqoEKZojMxW+I/P/LizFPADtaquljRyx3Oy++b0O
	ug0gN6MN4dT4A0MddiIzpMNP3dXdTwBAj+wWfrnXynQ3AfSqnN8/WjOk
X-Gm-Gg: AYBFou1YKoyWSPsSrFusywIc4oEyRXV/K3SU0dLbScpVy6S4htJj40RIqx5/jAoBszX
	ovCk2JnSTv1/ZT224iiRBo+PEHCQSabccFUV2QaOPbeHhGOtkD360peqEvVE7o9MrCIE3MyMP8H
	9zDGQ6LPEvf97NSvXMO7qmz2qphwwm11mKAYTtNFJdYpnR6F4yL1AnCBG7XTLHLqC1UI4JsQZg/
	IbGaL+uzFUGyhF6aw/cc8FFbLJOGrZrW7ykTd5nPZcjOrbM8APdObNNc/68PYSmAYAN0qYqNRbR
	CMILrtQgsZnwti/aB624mQkRzjKvSZa7oQcLUrPBi/PRTygYTTsLS+NW3GrVoMTOZlAMWd0oUlV
	5tJ40tUAsijy2cnx3cSQVn5tn7lXA+KEpIJTZ4mwK3f1HjI+re1NnVdACpJkchwl49qeKdRdWej
	JqYo+SgYoc40d3i0kz9TTlUPc9hpPxYi7qtP2cCFMCM2y21l0yHpd02h/Q/123iVTaeEgXNeuff
	jEBxUNESQ+ZRQ==
X-Received: by 2002:a05:600c:4694:b0:4a1:7108:c2b6 with SMTP id 5b1f17b1804b1-4a18045a9b3mr26832395e9.31.1791364382544;
        Wed, 07 Oct 2026 02:13:02 -0700 (PDT)
Received: from PC ([176.229.9.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1822af9d5sm17617555e9.15.2026.10.07.02.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:12:51 -0700 (PDT)
From: Jeremy Fareau <jeremy.fareau@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Jeremy Fareau <jeremy.fareau@gmail.com>
Subject: [PATCH wireless 1/2] wifi: rtw88: program the channel when the device is started
Date: Wed,  7 Oct 2026 12:12:24 +0300
Message-ID: <20261007091225.413-2-jeremy.fareau@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
In-Reply-To: <20261007091225.413-1-jeremy.fareau@gmail.com>
References: <20261007091225.413-1-jeremy.fareau@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The chip is reset by power_off()/power_on(), but mac80211 only calls
ieee80211_ops::config() when its own channel state changes.  After a
stop/start cycle, such as

    ip link set <dev> down
    ip link set <dev> up

the channel is unchanged from mac80211's point of view, so the radio is
never reprogrammed.  The device then listens on whatever channel the
hardware came up on while iw reports the configured one, and receives
almost nothing.

Observed with an RTL8814AU (ALFA AWUS1900) in monitor mode on an
aarch64 host.  A 25 s capture on channel 6 after a down/up cycle yields
3 frames, and 431 frames as soon as any real channel change is
requested.  An RTL8812AU (Linksys WUSB6300) on the same host, the same
channel and the same second yields 2438 frames.

Program the channel in rtw_ops_start(), like rtw_ips_pwr_up() already
does when leaving IPS.

Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
Assisted-by: LLM
Signed-off-by: Jeremy Fareau <jeremy.fareau@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/mac80211.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index b01b98d24b0a..827f38390969 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -57,6 +57,17 @@ static int rtw_ops_start(struct ieee80211_hw *hw)
 
 	mutex_lock(&rtwdev->mutex);
 	ret = rtw_core_start(rtwdev);
+
+	/* The chip is reset by power_off()/power_on(), but mac80211 only calls
+	 * ieee80211_ops::config() when its own channel state changes. After a
+	 * stop/start cycle the channel is unchanged from mac80211's point of
+	 * view, so the radio would never be reprogrammed and the device would
+	 * receive nothing. Program it here, like rtw_ips_pwr_up() already does
+	 * when leaving IPS.
+	 */
+	if (!ret && hw->conf.chandef.chan)
+		rtw_set_channel(rtwdev);
+
 	mutex_unlock(&rtwdev->mutex);
 
 	return ret;
-- 
2.43.0

