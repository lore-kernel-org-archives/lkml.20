Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F33C3C3F75
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882120; cv=none; b=GvTuVKqchyoqUJk0gUVDEdnDaNA+d5LFNWxGHoJfmorb9rk2zPzhH+Mu9/if2J2m4Hc7ATi9Toy4Cte84Ku9yEUFT7X5bPoG67+SAc81CWFJWCg5OchjIrtMLoBy9MtFFARnb27Zc1NDnKxYU6dLf4xJzkR9Hnxs1QOx4gX6GCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882120; c=relaxed/simple;
	bh=luoUG9srrZKbtMzxXNuzz20df8aeK/+qGfMnUT54RNs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VEqrbrHVjtj3j1AzfJs9LRh1qO+8GByNb1aa77CmGzShwZIENXlFO0GH02NpWB6J0zsAUjNJgzNCovrqtnI8TBAh1HZEEFaW382vTjoG/Cyg/094LRFGR21QEQ+WxPvkRj6S/RGxY/dAigsRlRLbAiVc554M8mg0rYFzToH0DzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AN19/U2T; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AN19/U2T"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so2161823a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791882119; x=1792486919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gfB66mjBSOtjbCxOwDv0Iq3MBG8MOvNQMiopIMKi1a0=;
        b=AN19/U2T1lXhfi2o9epVYam/MZZL/NdiriGyCS6FrWQT/Ln07YMOG3U5gnxlVVApSb
         KbwIvCYd3F7zPV8Jhht5cVxKZJ33Q/Me2HBw8C4o6BIjuG7r2ZiduoCljnZQN49P8/5p
         C6VFgc8nMIAGDLam046OTiusOuKPwgg0G2TtRFXdQkCDl5gq4XSoVn+5Ly/I0r/C2OXH
         n/08u3re07XtUkOS4eoxBjbw6mrLCiiLIQmMHhg7zahiJmR+2l6ZidYNrxINQjIvuoNO
         H8Mm939sbsHvXmzl/ndyf6js/CltccF0VVNoQEMUVodxVbZEju9rwrUSKQLQ/S8grsod
         AGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882119; x=1792486919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gfB66mjBSOtjbCxOwDv0Iq3MBG8MOvNQMiopIMKi1a0=;
        b=KPg4hu9nOAYBaBqh4GZZpDyJDe6UwoG9QWN9nVOUIUczcc1mpbKNRQGGI9l2AcAgmH
         l6XKySIGdl9BseKWwLgayph2iWnz0HLhlVOWiDYhe/pfwSseXhUsiwbN0fawe8z/qEJw
         bVea4rPLo7Zvpxp0rkj8jmyOpQqlp64G8v/NqWWxj+AHR9NyWZuplr/0bZaFTYZ6FazP
         GLLVoLdg8svlBK1/LgoHvDNqp5BT/KugHyDnwe/jL/+DiWbDEcIxsxwaIML0lQhD7iWS
         zmchgUjEvV2joa3O/9bkEBgp6W1ruCV+T9fTdNAQ68fYDczjuvWgdUVgWy3b+7H+mD7M
         CTAg==
X-Forwarded-Encrypted: i=1; AKwUvByv2M0pMKxGv7Z0RafHXF3+ZZ4FZZXOpDYmZy7pgE6Zghm3tptEqxX4HMHJqRXBxb6SO53hf0om3pK91jo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhicNJZY5ErFCLhtg1wyRtS28te83bD9ycEZyUl6SxPm2nOsdb
	2AS0Mow6dXodcPsIZ+y5nk7F0UkUSnc5PPik16LYNXmPhWFi7UR22yg=
X-Gm-Gg: AYBFou3drh0dbRjwwPN4XzUd3XX+sz8W1ksWx/pGZoUuj3ZWGWiQAv2UkSWfaM+Bp2b
	kb9g/Lu+y22U27kTVvzkmBXbolpgWkld9TFmI7jEVrF1+P6BT12czznVtoQn+1+FSu3cvBKyhH4
	zUS347rxn6bdhNff8ZqxPcBw5zE+0cwwAWZPmlVasvDGOJRewJU7fQvCa0ILPg+E0rBY/+loAL+
	BN+kIhCQuGo9scm6bpJ5OMvuLMb5kGDD4aIOwh9PJyht8E8Eb7+hqxGcPBrYBHn1bII3aqmYomf
	3v3ABHLvZxgEYuHWBTL6kXZbUvfU6wEtbKZv9IFkcQXunVlgfENf22C3jrs1ywbYZeTJuW1Ajm3
	Im1A/Oz8nXQVYK1gjYr4ngmWXxgpPA//wFQmWyNdaiwVjQLW2iDG161d4naR3DDmx921grwBFZ5
	ATGrSteZ81SxvGUj0pXRCGiB6Mhf4tuNKVc8Wv+KcVB7KHHlnii0zYlJiawffEkQowBWMqwPFiY
	QEU7D1D
X-Received: by 2002:a17:90b:1c08:b0:3a4:f75d:d1a3 with SMTP id 98e67ed59e1d1-3ab3ab29dcbmr10519513a91.32.1791882118844;
        Tue, 13 Oct 2026 02:01:58 -0700 (PDT)
Received: from localhost.localdomain ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21097667a91.2.2026.10.13.02.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:01:58 -0700 (PDT)
From: Wang Yibo <szwyb123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Guo <guojy.bj@gmail.com>,
	=?UTF-8?q?Michael=20Steinm=C3=B6tzger?= <m.steinmoetzger@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused defines in HalBtcOutSrc.h
Date: Tue, 13 Oct 2026 17:01:47 +0800
Message-Id: <20261013090147.374461-1-szwyb123@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HalBtcOutSrc.h still defines a number of constants that no code in the
driver ever references.  They either describe hardware variants the
RTL8723BS does not support - extra RF paths, dual-MAC/dual-PHY chips,
MIMO power save modes, coupler antennas - or were simply never wired up:

  BTC_RF_OFF, BTC_RF_ON, BTC_RF_B, BTC_RF_C, BTC_RF_D
  BTC_DMDP, BTC_DMSP, BTC_MP_UNKNOWN
  BTC_MIMO_PS_STATIC, BTC_MIMO_PS_DYNAMIC
  BTC_RATE_DISABLE, BTC_RATE_ENABLE
  BTC_ANT_WIFI_AT_CPL_MAIN, BTC_ANT_WIFI_AT_CPL_AUX
  WIFI_HS_CONNECTED, BTC_RSSI_LOW

Only BTC_RF_A is actually used, as the RF path argument of
fBtcSetRfReg().  The "coupler Antenna definition" comment is removed
together with the two defines it documented.

No functional change intended.

Signed-off-by: Wang Yibo <szwyb123@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index c2ac06812bff..12ec83758e4b 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -10,29 +10,14 @@
 #define NORMAL_EXEC		false
 #define FORCE_EXEC		true
 
-#define BTC_RF_OFF		0x0
-#define BTC_RF_ON		0x1
-
 #define BTC_RF_A		0x0
-#define BTC_RF_B		0x1
-#define BTC_RF_C		0x2
-#define BTC_RF_D		0x3
 
 #define BTC_SMSP		SINGLEMAC_SINGLEPHY
-#define BTC_DMDP		DUALMAC_DUALPHY
-#define BTC_DMSP		DUALMAC_SINGLEPHY
-#define BTC_MP_UNKNOWN		0xff
 
 #define BT_COEX_ANT_TYPE_PG	0
 #define BT_COEX_ANT_TYPE_ANTDIV		1
 #define BT_COEX_ANT_TYPE_DETECTED	2
 
-#define BTC_MIMO_PS_STATIC	0	/*  1ss */
-#define BTC_MIMO_PS_DYNAMIC	1	/*  2ss */
-
-#define BTC_RATE_DISABLE	0
-#define BTC_RATE_ENABLE		1
-
 /*  single Antenna definition */
 #define BTC_ANT_PATH_WIFI	0
 #define BTC_ANT_PATH_BT		1
@@ -40,9 +25,6 @@
 /*  dual Antenna definition */
 #define BTC_ANT_WIFI_AT_MAIN	0
 #define BTC_ANT_WIFI_AT_AUX	1
-/*  coupler Antenna definition */
-#define BTC_ANT_WIFI_AT_CPL_MAIN	0
-#define BTC_ANT_WIFI_AT_CPL_AUX		1
 
 enum {
 	BTC_PS_WIFI_NATIVE	= 0,	/*  wifi original power save behavior */
@@ -71,7 +53,6 @@ enum btc_chip_interface {
 /*  following is for wifi link status */
 #define WIFI_STA_CONNECTED				BIT(0)
 #define WIFI_AP_CONNECTED				BIT(1)
-#define WIFI_HS_CONNECTED				BIT(2)
 #define WIFI_P2P_GO_CONNECTED			BIT(3)
 #define WIFI_P2P_GC_CONNECTED			BIT(4)
 
@@ -94,7 +75,6 @@ enum {
 };
 #define BTC_RSSI_HIGH(_rssi_)	((_rssi_ == BTC_RSSI_STATE_HIGH || _rssi_ == BTC_RSSI_STATE_STAY_HIGH) ? true : false)
 #define BTC_RSSI_MEDIUM(_rssi_)	((_rssi_ == BTC_RSSI_STATE_MEDIUM || _rssi_ == BTC_RSSI_STATE_STAY_MEDIUM) ? true : false)
-#define BTC_RSSI_LOW(_rssi_)	((_rssi_ == BTC_RSSI_STATE_LOW || _rssi_ == BTC_RSSI_STATE_STAY_LOW) ? true : false)
 
 enum {
 	BTC_WIFI_BW_LEGACY			= 0x0,
-- 
2.25.1

