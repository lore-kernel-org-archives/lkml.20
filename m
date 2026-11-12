Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501977;
	b=gHPyjwCIHyH76brmWK9S9/Mm2a4O9/ixBQu2CGg/tThCr6vhBiCRhqedoZhXgiM6xVZl
	 CVMZwAyWFnzkjjH5ohQV6L47klvSzD32MPcH3tONit+QHbl03spYirVAq5sm+yLkz+Ima
	 xY+A335o2qekUYdBRFxSjni7A8QYZ/R5b8dMH+yB1ouplaCANIjwxgZiYGHdlDZb1rcTv
	 bM4c26qDRdW1L+qdIbQCgvGE1XWSzSvWZ8V7WmRmV8NraALeudQhSeTuRUDPoLZFiBTHI
	 jRNXzCbw+s5XddoA70iuOBqFpkCI27bmgsQzvgspIuTSwjciGA0DoN01VN8x0Fopx5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vjquRUStcAkxhtcMG98uyTm8S+FU38EvYx9GS3qKCBo=;
	b=T3yM1JfUcTqpd1C5BCcAPyOSzSQNRpe8NYdlF5sXj74wPUUEBCMrEqmWEPMHinmW6lSd
	 6ap1o+XHx6uZeurY4hrGDbq8qd6K6LxwKIXRXhT6nI+rUgjh0vtHEFSevZru88Vr0iCuS
	 pnCnSJDOTgrd9u9Pqb06cgrArqj56+A2REtr3xxf/jsgioZbSbHM67w0sdDvJ1QvxriEJ
	 a9ba8iF0zWIh3hU4CXLPwdpYuZue34DyhTrH3/Nxjf3AsDOq9+EZZfh9dymHCHiFoPzI1
	 321QcUVyrMjke7HK85GtohDiiAlexyTlxHcB1h+yr1ASgB3qzpk9mWHl6yD1OJiDPpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHJGo6Ft;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8A9606A8A7
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E8A9606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHJGo6Ft
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15dd124bbe7so7293047c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501976; x=1795106776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjquRUStcAkxhtcMG98uyTm8S+FU38EvYx9GS3qKCBo=;
        b=vHJGo6FtygGgQvmAC+B6SrUGtWT9A6nHzMZjN966gxygIC2z9CFUZR7gDyjuni3EjG
         GPMUhtn0d4LvE0zR4M63N3KXcwnAYFmQQV3wS0UM51F4+hJ9k8llxzsmJYFo6cVCAx10
         Lc5FZzRdlU136uvCWrA78/K3ZK3furCPMVkTimO0qBehA3/hfmXG0cZ8BU5cHWFpd4va
         ZJAlRnE36bsW4++NAKBD8/LybgefewN5VxgaogjrUba5S7hfTrINRCuY4/dBSm9BUOD8
         PF8CesdNVbastLFuxvi+wMd2+GU+qKTQxZ+yb3KqtVsJeQn9nITlBXk76nY16AEipR6v
         jJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501976; x=1795106776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjquRUStcAkxhtcMG98uyTm8S+FU38EvYx9GS3qKCBo=;
        b=ERlcYuf1xRlcw/HspF5Dv8GtgM5AiDi4atN1CnoINbJKcL0LNBOmnCox0XZ6FsOxuD
         Ph0GV1n7o6QQC0ZCLJYHcMnwHFMQ59FbibDj0eb++prDQX15/Ujw+WnfEIkcpdag0ls+
         SZ+KTgmeB/fYTokCtm6Z8zHc5qr7oL88Xgnx0PIQArK2KA4cYO6diwB64tbXl+JcXnkS
         FqsMlfaq14T8g8paPpN1ZbkpUUVTbx7aykQCFezOK7vaVIjr/maF5HbAKjEb1pdCRB0t
         2/GpcfF9ZAznw//EuSuqBX/7VnnvYIZ4iLnRO9/EAczkS6+TkrxLbEPxhejKFayRvV3D
         BxhA==
X-Forwarded-Encrypted: i=1; AL+hErEAhfUWFGIQcLZigCJ1MUc2bS5YTK8BQ0qBMPbcl/vijFQJx5ButFEc3SeuS/kFP3StjkYXo16SAI8ipMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dttU1IPIGhGPuYnqLaPxZXyTy+JP1HPInJB4SJa+G0lh0u2cH
	jbppZpMG5dS4deYiNPHvOUC36vREtjbzpdBSDh9OTMLjW4TiMPpgJ0fLrVgb8Twt
X-Gm-Gg: AYBFou0RUOkRRvpBiKrqEnzxrhFIngrk70sqf/jjeqjNFF12XY9GzQdDWlvP2WGYwyx
	iMlAlW7tl17qJ5LKnwmsVwqgTZQSBY8X84n7QSnuiZDfnf+1rdYBfnDaZXxHgY9vSQcXH4cL+JK
	Dc1zdIYZBqKDsEN/DqvsPwuk2y2XKleIyfRJ0tVdbM5ZLvE5q4Hlu7v7lMeFPVEtVqJ25UpliMI
	P5i4mcJSFycodjfW+HZHvWgN01FgEf6IM2ESwLXO4tr5PBm1Exg2QuiDYZCSV9Kb9YSJThgOwZA
	at88pbzRQLKzk+PYTlM5RlZKwrwNtAnO2NTw1afks0VSxuojaIyRVGAQBSjZpaRfMIN6IKRdTCW
	meFg2V7GT1AO8IIIcCJD+Sba1r8maE2HWuFrSD+6p1i066Iz/2z6B4RT4apWEq0PiiE2mQPNC0/
	bJHmsb+t9RIR0jzbZtSiZq58hBl8aj6dKbv+UJhVBKi3RrkfTH6c38k5qSCzpKqDtKvO9Mai3tI
	R93gUMlmIvtQkUAyX+lyT0lqYUlHl4QjBN1KNrTkfI/skgo454lGlkRLgawp26Cu3Qh/rlCuuhz
	g5+xf3p4bthp32IhGcraleYNbcB1Ni7xte7Fwxd/VaBp6n1Yykuv5wcgq7clanKicDRzjL4uNy1
	JT7FhqEbg5Rc2KYn01WnzpjE+YZTf0l7AqUUagK4BYsqU
X-Received: by 2002:a05:7022:3c01:b0:1b2:48db:23dd with SMTP id a92af1059eb24-1b50314c097mr94688c88.16.1794501976193;
        Thu, 12 Nov 2026 08:46:16 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm287090c88.0.2026.11.12.08.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:46:15 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH wireless-next v3 3/7] wifi: rt2800: make MCS 16 fall back to MCS 8 on devices with 3 TX chains
Date: Fri, 13 Nov 2026 00:45:37 +0800
Message-ID: <20261112164544.3176458-4-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112164544.3176458-1-hjf3108@gmail.com>
References: <20261112164544.3176458-1-hjf3108@gmail.com>
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

MCS 15 has worse reliability than MCS 16, since 16 and above
are 3 stream rates, and 15 is the top of the 2 stream rates.
Falling back from MCS 16 to MCS 15 does not make sense, so
make the fallback to MCS 8 on all devices with 3 TX chains,
like the Ralink driver does.

The retry chain is now MCS 16 to MCS 8, skipping 7 MCS rates
in between. Reflect that in the retry calculation code. This
also fixes the retry count on RT3883, which already used this
fallback.

Test results:
   before after
TX 28.2   29.1
RX 70.4   70.2

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2800lib.c | 10 +++++++++-
 drivers/net/wireless/ralink/rt2x00/rt2x00.h    |  5 +++++
 drivers/net/wireless/ralink/rt2x00/rt2x00dev.c | 14 ++++++++++++--
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
index 371b293bac..3be4f4cbde 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
@@ -1096,6 +1096,14 @@ void rt2800_txdone_entry(struct queue_entry *entry, u32 status, __le32 *txwi,
 		 */
 		__set_bit(TXDONE_SUCCESS, &txdesc.flags);
 		txdesc.retry = ((mcs > real_mcs) ? mcs - real_mcs : 0);
+
+		/*
+		 * On devices with 3 TX chains MCS16 falls back to MCS8, so a
+		 * frame that was sent below MCS16 after a three stream rate
+		 * skipped MCS9 to MCS15.
+		 */
+		if (rt2x00_is_3t(rt2x00dev) && mcs >= 16 && real_mcs <= 8)
+			txdesc.retry -= 7;
 	} else {
 		/*
 		 * Transmission failed. The number of retries is
@@ -6280,7 +6288,7 @@ static int rt2800_init_registers(struct rt2x00_dev *rt2x00dev)
 	reg = rt2x00_rt(rt2x00dev, RT5592) ? 0x00000082 : 0x00000002;
 	rt2800_register_write(rt2x00dev, TXOP_HLDR_ET, reg);
 
-	if (rt2x00_rt(rt2x00dev, RT3883)) {
+	if (rt2x00_is_3t(rt2x00dev)) {
 		rt2800_register_write(rt2x00dev, TX_FBK_CFG_3S_0, 0x12111008);
 		rt2800_register_write(rt2x00dev, TX_FBK_CFG_3S_1, 0x16151413);
 	}
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00.h b/drivers/net/wireless/ralink/rt2x00/rt2x00.h
index 415ff253cb..ace06ba73d 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00.h
@@ -1200,6 +1200,11 @@ static inline bool rt2x00_is_soc(struct rt2x00_dev *rt2x00dev)
 	return rt2x00_intf(rt2x00dev, RT2X00_CHIP_INTF_SOC);
 }
 
+static inline bool rt2x00_is_3t(struct rt2x00_dev *rt2x00dev)
+{
+	return rt2x00dev->default_ant.tx_chain_num == 3;
+}
+
 /* Helpers for capability flags */
 
 static inline bool
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
index 7b23da0678..7c03fd07bc 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
@@ -329,10 +329,10 @@ static void rt2x00lib_fill_tx_status(struct rt2x00_dev *rt2x00dev,
 	 * lowest rate was used.
 	 */
 	for (i = 0; i < retry_rates && i < IEEE80211_TX_MAX_RATES; i++) {
-		tx_info->status.rates[i].idx = rate_idx - i;
+		tx_info->status.rates[i].idx = rate_idx;
 		tx_info->status.rates[i].flags = rate_flags;
 
-		if (rate_idx - i == 0) {
+		if (rate_idx == 0) {
 			/*
 			 * The lowest rate (index 0) was used until the
 			 * number of max retries was reached.
@@ -340,8 +340,18 @@ static void rt2x00lib_fill_tx_status(struct rt2x00_dev *rt2x00dev,
 			tx_info->status.rates[i].count = retry_rates - i;
 			i++;
 			break;
+		} else if (rate_idx == 16) {
+			/*
+			 * TX_FBK_CFG_3S_0 makes MCS16 fall back to MCS8 on
+			 * devices with 3 TX chains, the decrement below shifts
+			 * it back to 8.
+			 */
+			if (rt2x00_is_3t(rt2x00dev) &&
+			    (rate_flags & IEEE80211_TX_RC_MCS))
+				rate_idx = 9;
 		}
 		tx_info->status.rates[i].count = 1;
+		rate_idx--;
 	}
 	if (i < (IEEE80211_TX_MAX_RATES - 1))
 		tx_info->status.rates[i].idx = -1; /* terminate */
-- 
2.53.0

