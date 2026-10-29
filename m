Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281713;
	b=0E9ibmXQ5a97C5f35KspjV57/NoFCPuFADymEifTTdoBH+7e4hghIvuYOUFVMkNNfJt1
	 3ryjDjk7e2/EAMRH6fHDRcn3FtRpATB1l81m1K0aWz85z22Kmkwpe06BEqLj8C+1AyHkP
	 zMuf+mWD6pJLRGFUtHVOMxWGZq2N2n8pC2m7CRAzXVEssrOKXWGJYSUGOprKb9jxsU2I8
	 GikyhCELVCeKcw9mxeTwFutZ1mKbAvggaJfV/uOXao9wRi1XiiwSfiGRyNGsHaRCdENFg
	 0BgFbX8xO3wok+juZ2NcHsJGgkWSi9/r41kSzyk5zeXYMggN8wv2k2h304UHBvYZ3gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LiWyaPQMeEQ4XuFw6vwkxxT8nw4alPycyzQAHN0Qa8Y=;
	b=BZHTHQSWyH3PLDd1hhIVU6v7GF0ZSxYbVffngcRdPPbVFefN7t5oqpitzC5Sc7sHdMD3
	 NM2z1OLiiRGXhjh2mWvrzUDcoU4JFqsdQCOk5O80UXQQHsHpZw/Xq+G2ppfmdXeRDcyMv
	 i9V0E6Ki7bfbmM+AoIIDajICKg0yDjQfK+ABIWew9C7gvZMIJ+T5yxIWSENeoEfMgwCL/
	 di5Mk5MiGzo/nx153n+IwZ1d2uGid6hGM4o1SVnCgatnLeP5k6yc7Susx+UkjzMkE8GFk
	 g7TTDPwahuxQWxv1lDzOe2OslcU9b4sTsbOjF8Hea1T8BdfxyLx3zvPW7Vo8IlyEemw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucaIss8u;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF562606A334
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF562606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucaIss8u
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-886e61fa30fso1061701b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281712; x=1793886512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiWyaPQMeEQ4XuFw6vwkxxT8nw4alPycyzQAHN0Qa8Y=;
        b=ucaIss8uAhSqyxJ1oyO6Fbwqn4gPEaTwQUUCLODXCd0h0GEV6R1GiPxY4d6oewxZbL
         SXp65Np1YIhe5Je7NEcq6j41GKhaEHlk+V4BNXV05aZUjzfjJz0IxuJfhSoXhUPaMSiN
         rHwjJ63qAxu1wWpHcjJeoW9v+WtzSC8RvMufuOvgMgC3DLtgHdZLoUtvHz9g6WE/uEjm
         JAf6g+L7qM0dYwlNJdKJ7hS/BizSCoUwWwiw2VlgYnj9Jn2bsukUm1Hkl6IC++wxNA9g
         5IrOb2IA1nVGbU8Mu0vGnoorqbpB2utYwDuKAf7SutX5HTgNIWxyDX/txKp18hNeiRg9
         MNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281712; x=1793886512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LiWyaPQMeEQ4XuFw6vwkxxT8nw4alPycyzQAHN0Qa8Y=;
        b=rAhgT0YOiqAs4zxEy9VEixLtXmGW44FWSUdVCCP8e1q/+fdsQTJ1mVHLhGw+W7wfZ+
         +60+7hBlgSvv0O/78FpOWbQGRCRIycZXy8VAYguEwqa5IkxLCjm3CR/1XKISU0ky+rv4
         6sp+YRuE9hojSNIzz811yHNud9R1IsM6845TjRIZtTv14sQdkp1Y+jktwnUeE+kx7rVS
         8Tdv20s78huacOYy0qo1aTupu+h+JMVrn+P/ZOrxVYzZtMbcgoGwPLuK04AcUEN61lOb
         BgeNLe0kw4eWVxBAwS6ZGlLvDPlBWMRGeM1+kMPdberA0/EKfoThOmZIaBK3P59yFzke
         gNvw==
X-Forwarded-Encrypted: i=1; AKwUvByIhntaGt7EnTRZS5Ghb3sUgTpB4UlLZ8DKvBX5/XoCxhgb2JbcFw94I82myJY+lNM7E1p5Tmz5vQlCgzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOjEAS6E1X9eCmv+7FgtKrNu8n9FlTWZb5pz82yBGWyh/7E0l2
	fFa6j1xqQ6RcmaiFRr2xVcLmqtxOYcDPcDEZBej8V1F7lHIs8vg1YKHiBRjWhT3a
X-Gm-Gg: AYBFou2qnwiW/UasrZETPR/v4Pec6dji0LkysKkZbzPp9dabzGX6jyIpaS6Av00ULLS
	R08r9ltgRSkM8yTuGRGkW0WsgKzwlHD1dN5+sp3PgNZETVue9CfyzEX6wGhG3opP85vM3BA1H/O
	XpCNZRTwRMxL1R7f2P1GSIJvhr0K3jRxrANds7XJqu5bqZSoRHjDHrmmkXWRrDMGfp1si6XNMDh
	J8HRExnBRHa1JbwwoVBI76dHvS6tqByGv4Z5Z0i1rJnde+DPJ3Rh1wycIY7E1emd/WVT/NxNfsO
	Z8/YMgGvbIE/5azsaK9xPjw4jUsQIV15Q16C5qGul1NFy+aCJjIPK6rWpa2UFW9VYJ+vf1s8hTP
	iqqE9xGj8+T8BB3uKAgeNuhd/iUImfGGyzD4MjxQSVz1vO7sK4SX1G2qLWNB8WSKTS2VArwV4fO
	6LPMcp8XjDAHjYZp4jNk3MFbvDZlZou88ee3e6pCEv5R8mDtWCz+0McEtygfj6dLGi6g1wlLdSf
	zgk9qYVGmARm7AwqF2Ru/yhNOR0np+afZDpSVUcDBAJq5ZD/yaJUpw0olpyPMtL2+Fge92Eg3du
	C9uj6m7FyEkwVTCil9QTKDxkCv+eQe2qqfrdt2oEd6NSR6Z6B3Z0knPgrf6qC42EbBaAT3SK3yG
	Zk1wav8W6
X-Received: by 2002:a05:6a00:1d99:b0:886:ead5:6d3b with SMTP id d2e1a72fcca58-8a6e81b6fe8mr4515322b3a.53.1793281711917;
        Thu, 29 Oct 2026 06:48:31 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:ab4c:c3be:c4b6:67cd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a3d5baf4sm2455023b3a.1.2026.10.29.06.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:48:31 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 4/8] wifi: rt2800: report the MCS16 to MCS8 fallback of RT3593 in TX status
Date: Thu, 29 Oct 2026 21:47:45 +0800
Message-ID: <20261029134752.1299130-5-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029134752.1299130-1-hjf3108@gmail.com>
References: <20261029134752.1299130-1-hjf3108@gmail.com>
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

The RT3593 retry chain is now MCS 16 to MCS 8, skipping 7 MCS
rates in between. Reflect that in the retry calculation code.

Test results:
   before after
TX 27.0   29.4
RX 70.0   70.0

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2800lib.c |  8 ++++++++
 drivers/net/wireless/ralink/rt2x00/rt2x00dev.c | 13 +++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
index 9d88ee698b854..de234bcc7a065 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
@@ -1116,6 +1116,14 @@ void rt2800_txdone_entry(struct queue_entry *entry, u32 status, __le32 *txwi,
 		 */
 		__set_bit(TXDONE_SUCCESS, &txdesc.flags);
 		txdesc.retry = ((mcs > real_mcs) ? mcs - real_mcs : 0);
+
+		/*
+		 * On RT3593 MCS16 falls back to MCS8, so a frame that was
+		 * sent below MCS16 after a three stream rate skipped MCS9
+		 * to MCS15.
+		 */
+		if (rt2x00_rt(rt2x00dev, RT3593) && mcs >= 16 && real_mcs < 16)
+			txdesc.retry -= 7;
 	} else {
 		/*
 		 * Transmission failed. The number of retries is
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
index 4d94b7062f440..823785088a308 100644
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
@@ -340,8 +340,17 @@ static void rt2x00lib_fill_tx_status(struct rt2x00_dev *rt2x00dev,
 			tx_info->status.rates[i].count = retry_rates - i;
 			i++;
 			break;
+		} else if (rate_idx == 16) {
+			/*
+			 * TX_FBK_CFG_3S_0 makes MCS16 fall back to MCS8 on
+			 * RT3593, the decrement below shifts it back to 8.
+			 */
+			if (rt2x00_rt(rt2x00dev, RT3593) &&
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

