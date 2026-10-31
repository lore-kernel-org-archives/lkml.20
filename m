Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793430626;
	b=Bdaa39RB/yg0Oc0yuSgJYCozA7G6B+fm152OvHXiNHcpfVati+8IzdJS8TgxbaDapucp
	 h7BHsdkg46mH+1sDOhTNFrJpV/jRtzRCrf1UkScB8XYNcKElvATmjKkcaLT78x97qh7U3
	 AyzlFqtyAHe1nwnXZ/p1t/HBTjmstHrDxffF07dEU2BElLfVbeVzC9HhiI5XypZZMCKGf
	 qN1I0vvd3PgvMX2czJAZCKngOe6L2H5DkWnE1ypEsQrFM8taaon2/gYB61eCVMY4jS6GC
	 n89mgzoVz9H9cIunbXYlpkvSh/xZ+2kh4B2wiKceX8gakq3PyaJjfLMgq8RbRBbYiag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793430626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ad2ia27EnAVG08wFvfZ7zlOUesKclGmPX+4LQPOn1N4=;
	b=yYr30HXjVrNsqv7LP50sQoBlzQvqfS/mOIG2vwnDcwOzVIfuZOK4OJ0rzpjYoRoXU67f
	 ChuU2YRw2p1XXbWyCdyNwY1FDdPHhUXThEuC1/uMPqFLScVOkZFG/dGl/C1dhYBsjBuUM
	 oVwLNcsIV3R5S63YMDz8tFMr922wzjEBpeIo8a8WyveGCwIpP2nzPZOpZIvkDceX0kW12
	 K0dDZHH6pAHmrRxF9llnOGbdUsHUyRG5rQcMeotxAXD3Arxxk8LgB1I1w42ir4yw+oc1n
	 AusgVFFHKoIiI8FqVu/AL5fXSXhJ5+tqTzdcbcF4QPvXfmKqAev+V1qt5hRp7G9STTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0E1HLUVN;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC77606A322
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DC77606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0E1HLUVN
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc502d509c0so574581a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793430625; x=1794035425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ad2ia27EnAVG08wFvfZ7zlOUesKclGmPX+4LQPOn1N4=;
        b=0E1HLUVN0wv3+o8ksP6Syby/QUd70/Oe4xjviWzhA/fd9IMNC6F9cgAqBsnIM8mbRu
         bn0spiTE4/5QHHRkaO2joPGM9+pUgkRmcUVJifFTUKfnRmFubB1B9f19n1IwR4IKqE5G
         6QxMsrAk7ArYB/QORoSlsehVYIkL0cyU+F7pjaFBq9bKuItIViI/nSHfM1OkeYlx8ZJz
         Me79KWh+boobkyqhTz5lWKGrQAPzYHEVXOJqP4vGvKDNIj/mrysl9nCS1Zb+CpsnLAyo
         YoJdcOhipYkYL91C1CJOrQ2SZimpHp3fYkR/94i22h//fNtIN4lCGZ4RUfYT5LDwB7DJ
         P9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793430625; x=1794035425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ad2ia27EnAVG08wFvfZ7zlOUesKclGmPX+4LQPOn1N4=;
        b=a0Zoqu3h5bjEPePh09tw6ygNncVWkNLyivL5JQhbZKVKOdhKpG/mcrFMLdzb2+QAut
         6lxNI2acvY8HN2cMy/gKTBZcmbs6DoqC//jM2JUs4/CVCcNgODWSx0si7EJXkyRunahZ
         W5lDveAqVlmlvq4VB7i88tHqP/dPdwYwoiVWf27CQJDCLz/4ISsc9jpyHAi/RBpbmbqO
         nfi4ukDwazQgxXMlXlgpZ35qclI1Qqgy+aOfNMrdE0rSG+gPYtf7ZG+KllYXzUUsO5Nn
         /M9bKMujlWY4Dh0UPal0wD2dbMObQnVQ0zNmpjXNHvaEAa6bKLrQkpfK+BMlY5h0RD7v
         YMPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKszdx6LLqDSQiP0PYZQqi9En9BYSmAwIORXe7gcN43R58Fcm48In/LrZyHxK+ivtGkO8FM0yJ8JY4rj0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmzZb8LXyvOQAE2FaM2paEPbwtQt7Ec8jYZPhSIxScwIZDoaVt
	jeQ0HPYF3tNPDj2QhgMc+HM8zoDj2CqyuPqN8gQlgIy9VR/ru1c2fpFRJ/dvUB97
X-Gm-Gg: AYBFou3DlF2WKL4htlE56vG+BJ8Hc4hwZPYGQ882mhwuPFlryMSohtzTkhKj3fJKYjS
	K7xxrzye191lCFUrYcUDEpixT3ATCnR0PNIRpkMcrvCZUMI0TwhwrRF8s5YnehIhcf4cIrUx89W
	ex2nfqWqa2aEnV9NFlTPkO2A81/QXBLl13P7irgsN4eCrByJc8Nl0ZdSCGPn5zMgrD2KSo7vdzN
	w9pbmDUVcjsjxmI1vXW9V/1Z3wpefHyo4GDaD3YITMlM64EwVCoLZh/5TMI/MXsvb0n8S3zw8B1
	lgVHYFwWa99y1I9O6sVaUhci9OJaGTprPvm5U5Z/5V+eaG34zWbkA1zDV+zk8J0GqObVqQYWmmL
	ssuADiGwoSu4LD8dWo+2X3DexF/FP5czoVvTlnra1hvG+rhAxjKWAvTjVLt8eYCuMZzMNP+HTE6
	kRGrcDHhpoU1ezmTCN0Ledp+9Lzqm2kh0O7wEy82Lj5VZmNlIP74ZYTkpNKcN7b4/jbm90qaySQ
	cVHEM2UCGR4kXujeLZjBlU/xKT08IJ1yrkOXJWI5LGIW7aAxR8Ib14VoU+1aLFYVMp0BL3Qsq/y
	I8+NMli4Y48GOob7+ayMXZt5ty8UGYVYNOV2c7gSdvss8fGBDiQN3OhCMdHm3n4RAVB2x6O+AKL
	SbMfo/Q==
X-Received: by 2002:a17:90b:51cf:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3ae898394c0mr3544591a91.56.1793430625556;
        Sat, 31 Oct 2026 00:10:25 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae845432e4sm6670459a91.3.2026.10.31.00.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:10:25 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2 3/7] wifi: rtw88: correctly expose beamformee capabilities
Date: Sat, 31 Oct 2026 15:09:43 +0800
Message-ID: <20261031070950.425176-4-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031070950.425176-1-hjf3108@gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com>
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

From: Jie Feng <hjf3108@gmail.com>

Make MU and SU capability flags each depend on the chip declared
maximum instead of setting both flags together.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7d7b66844862ff01533b8b640ed35738169673d..0a1b5575b729981b34e0fa9c37a4f8380987afa4 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1605,6 +1605,7 @@ static void rtw_init_ht_cap(struct rtw_dev *rtwdev,
 static void rtw_init_vht_cap(struct rtw_dev *rtwdev,
 			     struct ieee80211_sta_vht_cap *vht_cap)
 {
+	const struct rtw_chip_info *chip = rtwdev->chip;
 	struct rtw_efuse *efuse = &rtwdev->efuse;
 	u16 mcs_map = 0;
 	__le16 highest;
@@ -1623,10 +1624,13 @@ static void rtw_init_vht_cap(struct rtw_dev *rtwdev,
 		       0;
 	if (rtwdev->hal.rf_path_num > 1)
 		vht_cap->cap |= IEEE80211_VHT_CAP_TXSTBC;
-	vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
-			IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
-	vht_cap->cap |= (rtwdev->hal.bfee_sts_cap <<
-			IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
+	if (rtw_bf_support && chip->bfer_su_max_num) {
+		vht_cap->cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
+		vht_cap->cap |= rtwdev->hal.bfee_sts_cap <<
+				IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
+	}
+	if (rtw_bf_support && chip->bfer_mu_max_num)
+		vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
 
 	if (rtw_chip_has_rx_ldpc(rtwdev))
 		vht_cap->cap |= IEEE80211_VHT_CAP_RXLDPC;
-- 
2.55.0

