Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504775;
	b=Os59gwukNpAclDsDXl3PgLNCxiXjC4DQHFd7M7BOT4b54Nf+v/avPtjeSHYIizpJ9DC8
	 n71p9EuP/zEnCnD3zPV2BJVuXtG9GkG6cSsv7p1SiuD2gysosDIyk+rTBsG+qRMRLp3CM
	 HK85TSPlHCHw/TG3PMVBpt/YVFSm+vAMagEA1oX4VDzC/EiTR4x43GHfhC8cb/wqY0KdY
	 UxiYAlDz5bxUjP6Lw1+VyOogg+s+XTc/2JJtMc9re65TaRJBgaijn58u2YLBjZW6FeXsB
	 22TApaa8O3Ss1yTaQIwgB7MLzzzKAYotQolKuNB232iwqKzJNzNH+xcggpjV3uMonyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sZa1vSArHC9E++/fr2qVRUW6TrWTM9JsZ4c6YTVfZ3c=;
	b=ZnKCnNmRGqWqvOrNBFxIOmxOakOqWpRn+8cNI0HqJYLWDqCZ33b4Mx+vNVL18gKdFEmL
	 1gqctmntw1UpObmyo/XMKQGJfCgxhM4LfJrvu+BI4pe12SUYDUUuREEE4QWekZ2XsSReR
	 AVBBTU9D75F1dmOXexl59tw8ykpZoZx6wLXlvtnRZW5ks65/l6mnDgNWXXKY3C4FyC9Hy
	 bufNjIRbNNezdBzeZTULnkYPIjOaJhA3crl50zk6S4rCYccIgLKcifzCWJ4MoSjjIwt1j
	 lwvY7oRZGJOuHFNMugC8TAa76eHeRVkCDLXqRK+YC2Wir6N2tbeeDK0KJdvK/k/Wk8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fe7TnP5Z;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655EA606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 655EA606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fe7TnP5Z
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso3866a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794504774; x=1795109574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sZa1vSArHC9E++/fr2qVRUW6TrWTM9JsZ4c6YTVfZ3c=;
        b=fe7TnP5ZxNDWglaP57PgZbIqpe7J8CdJci/DQpTyF4WJih3g8N9XqD1uIA361Gxn8m
         Mbo7KJAxM43PPdJgIS398qRVCDJ+tmxy5Wq0eZKWetbcs3pti5OfX2uze8AXJ1KzZYaE
         hJIRm0zcR//t9uxK4rXnhpQQl+3JbXkzDQRU4qI4Ts/KI9QkUTFrJ5/VQaTajcuLPOs9
         Xa8JRwf5IhIlrwk7crvvUIU9bDrmPdsob5GzJsW9wZbM3uOuceZ/+Erqig3WKj66QIPR
         apLkFaCdsRRuwxDSGPaGY+i9sMjbc+ps+N445lXsBwksBx6DInA9BnPkj6egiEgIeb7e
         r7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504774; x=1795109574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sZa1vSArHC9E++/fr2qVRUW6TrWTM9JsZ4c6YTVfZ3c=;
        b=rTomv4QUVbuuGxICFw+JuW3Ema+cCQWKwMcODS/C/t0YwS+/p16806SCpTGB+av6pW
         UNwzTiHyEhoyGQXlivQWfK+xhHh5I62UYfmBlQ7/LSeDHdiSdxT23h91WDqOrJ9+RuDY
         URtqGxDFcmLC0cMlp8Mc/+fak3V/wUsLVYMt4J2i0Y0tEN4jVjRpN6ajwuJKborVU92X
         HmXUsR7PPGQ9M4bnyeUy+cxcY5rE6NhzualUjS4yDs7LVVI6hK1Uw7hqudWbvQnYcMeB
         yhTcSShnGkSpLP/fcyvPPdXT9J4A6juSlBcxHVzin/6DBMTFUo+GH+tuA5qDpoPgq8Q8
         7goQ==
X-Forwarded-Encrypted: i=1; AL+hErGCSTqRJ7slf1krWpZ6OlCk+akdxYcXo3ENdYTA9atEaOY7CxF4zWedxhptJ1KYBRu7ndkC82t4CBihOaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BpirlFiR+O3udGbl3iRwij3uSLwGu4anKFg2dsXuENWdv9LD0
	woAB5jbOJKbbs0NG7cvZZdlP87YvAo4+6xksPJnwWEQyD2za90UT9DCQ
X-Gm-Gg: AYBFou1T6D5l3cKi+EJ0cTiED2QMzp1gX9ZMoGyp/JlhCJyAUUs3dEzXdvPW6HpU/UD
	c8/L6pAt+RNceEyIOlZ64rGPRFsTByub24ZAudERTySxV7UMIIuMbYLWXN+O7dTArVe/ya6zB42
	fY2AxQi4OxuqTzaxamwtQSQVNtJzMCFgUFe5PYKvR7Pc6c5ycmcDIpi/TC7YSEXYDlMTsA0tNuH
	64GIFHhZW1fenv0OWPLkuNduMOtpYbLgpR8K+A6m7fMZrOEEbOwtDIshtIVTrY+4NMowxJhOTxR
	q1zh+fU32qkGObpRxnE0/hlp4QgwbU7RQ/9GM8wRXas3QPZtakobxQa7ByjSQYrLOeQzvWdsbuk
	6b7VK+lqfw7C3CFTDXg5RjFvR+tJog386Zo4x4eDn2z6NeQ/5qHvYmKDpLQzfdQMfBqSZmFErgK
	WQpY1m1ksyo4Sr3/t1S831Vv8ZWszsUECDSlHAWatweFY36rZON8sdGGgkTZ9pcjFkhdc3zDUFz
	f2JN0TAREy/SILkI/Enmhh1ynXlaJq/Vh3IwiTgJ5sis+lutauxCtpUTXDx0jAHhr30Gp82yToD
	Hb59rtUHfDHqYQfcNc0xhm8E7AEV5Ax9Vb+xTYbebC0nmuYTDiiVlXQeTtyyTN+8U++Cz6boD5g
	uIMwK+wbEKDQuCHODUhrAoceEOzxFIq7WZP3zImFcsUfO
X-Received: by 2002:a17:90b:2fcc:b0:3ab:f38:2b41 with SMTP id 98e67ed59e1d1-3b182f20049mr6375619a91.39.1794504774518;
        Thu, 12 Nov 2026 09:32:54 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae8be5adsm383532a91.0.2026.11.12.09.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:32:54 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v3 0/5] wifi: rtw88: extend 88xxA support
Date: Fri, 13 Nov 2026 01:32:39 +0800
Message-ID: <20261112173246.3201729-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series enables HT STBC transmission, VHT SU beamformed reception
and carrier-frequency-offset correction on supported 88xxA devices.

Tested on RTL8812AU:
TX went from 136.0 to 144.2.
RX went from 215.5 to 249.2.

Changelog v3:
- Remove EDCCA commits since it causes problems in some situations
- Beamformee: gate on spatial streams instead of the RX antennas,
  in case an antenna is disabled
- Beamformee: writes RTL8814A use rtw_write32_mask() instead of
  an unaligned 16-bit write
- Beamformee: drop the chip ID from the debug message, style fixes
- CFO: add RTW_XCAP_MASK to phy.h
- CFO: use 0x20 as the RTL8814A crystal cap when the efuse is empty,
  following the vendor driver
- CFO: add comment on why min(...,2) is needed for rtl8814
- A-MPDU: set BIT(31) of REG_AMPDU_MAX_LENGTH, like the vendor driver
- A-MPDU: limit RTL8821A with IEEE80211_VHT_MAX_AMPDU_64K

Changelog v2:
- Split correcting beamform caps into its own commit
- Adjust EDCCA threshold on scan to avoid high latency

Ho Jie Feng (5):
  wifi: rtw88: 8812a, 8814a: enable STBC for HT transmissions
  wifi: rtw88: 88xxa: receive VHT SU beamformed transmissions
  wifi: rtw88: prepare frequency-offset correction for more chips
  wifi: rtw88: 88xxa: correct carrier-frequency offset
  wifi: rtw88: 8812a, 8821a: respect peer A-MPDU size limits

 drivers/net/wireless/realtek/rtw88/bf.h       |   2 +
 drivers/net/wireless/realtek/rtw88/main.c     |  14 ++-
 drivers/net/wireless/realtek/rtw88/phy.c      | 110 +++++++++++++++++-
 drivers/net/wireless/realtek/rtw88/phy.h      |   5 +
 drivers/net/wireless/realtek/rtw88/reg.h      |   1 +
 drivers/net/wireless/realtek/rtw88/rtw8812a.c |  16 ++-
 drivers/net/wireless/realtek/rtw88/rtw8814a.c |  70 +++++++++--
 drivers/net/wireless/realtek/rtw88/rtw8821a.c |  15 ++-
 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 100 +---------------
 drivers/net/wireless/realtek/rtw88/rtw8822c.h |   3 -
 drivers/net/wireless/realtek/rtw88/rtw88xxa.c | 108 +++++++++++++++--
 drivers/net/wireless/realtek/rtw88/rtw88xxa.h |   3 +
 12 files changed, 324 insertions(+), 123 deletions(-)


base-commit: 61a5eb87b2d9b4d5e353780b781cf691f39ba9e1
-- 
2.53.0

