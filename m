Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C177C3890E1
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792272653; cv=none; b=W0qBXFCxI7ZUOwXUF6P8RXH4e8JPbfsCuPJswlP9W57I9NyOhpJiry+9jS8ReJ7ttygloiDJzxpEVQ8V0yv6tRa+m/LLkO/KkiYVaOqIARRQmQsZNduU84370GieT0Dq5ZGQSpN4k5ftATDbKln8KxWJbSkIqeh7p8P/IMR3Eog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792272653; c=relaxed/simple;
	bh=5qhJN09YPyNt7EZtN1s5WGSWuaIkBGhCn6fyXrrantY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KsFVzzPoyh92KkpzcQApYW14cqVS++TEknbLU6dFN8M1oNgGnXyxKbkcdO4SOAPbTvoPTqMHTjj/rcjNFH9efW/tNrdxkrdrcXXOXq5kk0EBxyWNfVLK8O8dBYrw9PVPUZ84O8vMB/Tlf2VTf3/xdm/R6UfI7ymOWum/N8RL//Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEuvMRao; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEuvMRao"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e60f9af6e6so6483495ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792272652; x=1792877452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FiD6sMCpVV/13PjivmVbngyELUrVKdk1SGBNZwIKdms=;
        b=SEuvMRaoDnR70YxfH2R0kxKYCNctK3PbgeWEbr2METrXbf8L46/HGQ8KzMM9lOZlDq
         8/rTsz6ruJ56bVGshg8wAXbe1crTU26AOVym9d/Jk03HMue+MLEfqaWm81Ui6y4tJ+Pa
         0/MZSp7ZEk7f/TpxMTDg9qizaTPSkh1auObPVzoA6Ek+IoOj+GjZfdXrmHjgIKDIKNX8
         FJ+wmuPmg4JefDQ2IdLuZHBfzqLzwNr8w3ROBVkidUTbakDmKvh5twTy2x88TPcBmH6i
         Dhz+IQ3iyIvkLNHhOqOo8rHK/9im9zE55thOIljs6NolBzf2Gj0M+IeobH2N0MqJeOPa
         DtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792272652; x=1792877452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiD6sMCpVV/13PjivmVbngyELUrVKdk1SGBNZwIKdms=;
        b=eswD6oY8qffBIbxFh9zLy21xYwep31F4adNG4HB0uqvL1r2qbC645zWaV5sKgbgI5W
         p5YRryop8edG8SjTB8UYdcMwqK/H0xke7TKtzTMhIF9N+y3rFzhbiAj6f1H4apazzr6F
         Mbwxi0LmOfN5h/YQJY5isWtzEDycVNypN5wlJbqwls02RY7iw/lxB/wA4bZZ06wfDs2N
         SzOc/LtcPS4DwgHKSwP5PbonAvV55I/6aBT6duxI2ElplTzbUpjakRXQGQmzcSTs2WHg
         yI0WZMhTgiM1P1nmntbcJ6i97IQK9qYGJsrmFIDTV8qYA4ZsPtlf+JouDk2VoadYZaiH
         GLvw==
X-Forwarded-Encrypted: i=1; AKwUvBzlC3epQ511DyBstiPRj/Q9Ozyf2Tm0Lqdk+mwipNoRy79zfUMbaINw9HZBkWN1dohwIQKlBUcqEyrBIuY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjQX2/6i+mDkxx0REagqhxgHeTQamhTTmNPxm3YQaBLpzyw98D
	CFAnvN3j+dHieYAN61X/TOKQ0YxvFEuMIHsyux/9Y1fYA+Er9ng5pEIQ
X-Gm-Gg: AYBFou0KsF9hCrCBWFSQMo89kCSU4Cd7Ts0FgQ5PRGh4SLlu4QOd+NELgf+qAlIW8PL
	zVd+6irUaNa16xZ13JZ+uISCM8gdlWSmaey9Y7OWofC3Wg3EQv8hyTujDS4Dda4HRG1TLJAeBTb
	wxuYdcAz0FtAThapFeH3LSEb94cZl8yK6yzKfNJjfEQop5R4NXRsTuHKZAUR/JS6rex3eXXyW0g
	zC7VTNd0NyJslbm4lcwTHYKRJLYyKxZxMshUB8gjhCdYNzq76qbhGj8TbeQR/03gmVItu2xIgtH
	8kKWh5F5xUrP+ZMCpCTtY9F8YvE27N1+u27U9Xmj2svzmS+3rEEixC1XVQrazzGX9zCvURzli+G
	ElimTEwX03hkU2gqhhurOid5E9VbfGclsPB1QIP9+mkrhJisrVA+1ae4ccwTqYfdk5nynbJskVp
	5FekJnl2ngGy4Mm2cwR2LKb2+j1jxVuyKOCfiaj+17WgtuYo8skrFR841jE4Ji8GGGyZsT1XO3R
	a7NwCE43L5ramZqNhVEL69ieCjXkeF0WlOw8Q9l9qOcuhuZ1CMSIf9DbLNEd1cueu9ymA6Nzkdd
	CK71fvgHyFSFDu3pLoeNYlvbarVRFoXABI+o2mCxG+WUV5ga
X-Received: by 2002:a17:902:d2ca:b0:2dd:c100:3133 with SMTP id d9443c01a7336-2e9a6c208f0mr34763315ad.47.1792272651972;
        Sat, 17 Oct 2026 14:30:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8758efsm22848825ad.55.2026.10.17.14.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 14:30:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Kalle Valo <kvalo@kernel.org>,
	b43-dev@lists.infradead.org (open list:B43 WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH wireless] wifi: b43: encrypt robust management frames in software
Date: Sat, 17 Oct 2026 14:30:47 -0700
Message-ID: <20261017213047.1160219-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

b43 sets MFP_CAPABLE, and uploads CCMP keys to the hardware with only
IEEE80211_KEY_FLAG_GENERATE_IV. mac80211 then leaves the encryption of
robust management frames to the hardware as well. The hardware
encrypts every frame as a data frame, but the CCMP nonce and AAD of a
management frame are built differently, so the peer discards these
frames.

Under MFP, this hits the block ack action frames. On a BCM4331 with HT
enabled, associated to an access point that uses PMF, the access point
never gets the ADDBA response of the BCM4331. It waits about 100 ms
for it, sends its frames without aggregation, and asks again with the
next frames it has queued, so pings take 103 ms every few frames. The
TX block ack sessions of the BCM4331 never start either. A capture on
a second card shows the protected ADDBA exchange before every delayed
reply, and a new dialog each time.

Set IEEE80211_KEY_FLAG_SW_MGMT_TX on CCMP keys, so that mac80211
encrypts robust management frames in software. Data frames are still
encrypted in hardware.

With this, the block ack sessions start in both directions, ping times
go from 146 ms average and 918 ms maximum to 2.6 ms and 3.2 ms, and
iperf3 from 11 to 43 Mbit/s down and from 11 to 41 Mbit/s up on a
BCM94311CD.

Fixes: 75d057bda1fb ("b43: Fix connection problem with WPA3")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/broadcom/b43/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/broadcom/b43/main.c b/drivers/net/wireless/broadcom/b43/main.c
index 3825b6ad9f4f..6d7c81c98e43 100644
--- a/drivers/net/wireless/broadcom/b43/main.c
+++ b/drivers/net/wireless/broadcom/b43/main.c
@@ -4266,6 +4266,12 @@ static int b43_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV;
 		if (algorithm == B43_SEC_ALGO_TKIP)
 			key->flags |= IEEE80211_KEY_FLAG_GENERATE_MMIC;
+		/*
+		 * The hardware encrypts every frame as a data frame, which
+		 * is wrong for robust management frames under MFP.
+		 */
+		if (algorithm == B43_SEC_ALGO_AES)
+			key->flags |= IEEE80211_KEY_FLAG_SW_MGMT_TX;
 		break;
 	case DISABLE_KEY: {
 		err = b43_key_clear(dev, key->hw_key_idx);
-- 
2.56.0

