Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793430637;
	b=HsQ2WfG/UiLS9sudZH2/B0W7sWZYmaoT89nIpEPFnnO6N3B2lLJCc/6I23kjrCJ9cJjI
	 jfYqwfyCowj+pkXsf47KUUtM8XBg92PqzNsqJrWpV21iWNDX6DDVFBTbgemLjjm3MI8eM
	 g0t3Zw9qMETFAhVtiiB/Uh/fdvaGpV++WvxQhfb+FABkg2dZmRh0HuCsq/eq1+TEWkDNc
	 BH5LJbKC9dkiKYHiPZ5jUyeVTI5uP7XatWL0sx7PyXIplFLW3q2Th1QRvvYFb/JeA/6Pu
	 f807WdX8VQT26CuqsJBYVyrgBoB2pPq8NkuUB7ZgXrAPrtDMULux1KGo7FJNhcIZa5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793430637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y8xZwpAPIkj52QCkHw47OM7dH0DdqJgMz048F4gTYBk=;
	b=jex1dthDG1DXXSa8GgauJ483flMdJ0un2uJwY0+sU/62Cvio9QHL+Y7Jn7ggWcyutn4j
	 vRXuJgblohIlHOcp5ZApU0j7JIhlF43yp4dJGp9jvRogqD4KIUm3RRdAXYuOdgYWg6zwC
	 xNoXDXXxuwnWjZH6zr5DXrM3quq2B2ykI9A4N0lp87hTEgX5Iks4OpiB0NSpU3qSFK9vb
	 DiqW/hrJe4ZkgV7/j7hkZoxgc1FA50v5LdE0chPLFpD1yJzasY1aAg/RM2/1cqyXHzwyK
	 Z5tVtc3mTysf77lnrD6WrEMLHASysWoyk5VGmqag0x4wVCShIFzHSDCEeabPdItM3iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QtfYv6GW;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7976F606A334
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7976F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QtfYv6GW
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so243354a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793430637; x=1794035437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8xZwpAPIkj52QCkHw47OM7dH0DdqJgMz048F4gTYBk=;
        b=QtfYv6GWXYdUe6LNRpXxuOsxAhGSyGk+PogkdC62+ZbVH9+Jqp/PTOsU9jeaiVBGtE
         b4a2b86DFjuV+WglyEBanCwhvoBzQjNPWNn0IdPGLvBWOULMyhA77sYr0PvorJ338aY+
         tkFDAlf7AeYij3WfFT/dAwg3ImEIydckWWqZ14kQJ6NLzw6YNgXQt7B24otQ6lkesTwu
         sY3YzDInJ84wd5+52tvtbznPFKiPJWAG7ScjwTBCqQZ0PaLpwjGBSaR3xbrCCBxftPJQ
         +ZEGV1/GzcYPsZMfj3ORVKMjgYNtaJ+wbJWzI32/kD9R0QzsaLlY9HPo151r+n3JA5VW
         ABUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793430637; x=1794035437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y8xZwpAPIkj52QCkHw47OM7dH0DdqJgMz048F4gTYBk=;
        b=dRnuUbT1bn1O5RNDF2KrruFsfdW53Npojr8wiN9hIaEUPhnvVUAPlSEqPImHDqz4WO
         rjF4xCE1LSEg0DnF9/A/nfE5h2pBJVEXqwvbnLeNTAX3cNudDB7BvFuSEuZz80BZpAQJ
         mg5REtmku453t2VMIloJsxYnRCiyAMZKTUS3rm35HQYkO7snXe1Y0bfT/TEXyNJAV9jZ
         LmCBBGEIOd6koLdffvMG6433U2vWtn8UFS2NYmcts/d5jFGc3XVRwxq8AICRruJcgQJS
         ypvPJZmWm6a/WVH9gm6vXo0mPVRvGsNnPGiyer1dqW/jSNtWLbJUDSMQkJxiQjFkdTDQ
         2MEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiKC8exH7uMjd4dypFirakXitxhfaWT3FSRYfFP4CzJ0XhGVSuKvgiQyRzBG/S6MFepd0di/q4uuuoDJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqA0CP5Vw3BzPjOtkYBGVQr00vHEP8u+62qdUxP5FDSIO9QLY9
	Z6vYjdI1WW+LwwbkZE5gwaKNuygGbIUl6hdObY14mWaC7pUxrU4SKyEi
X-Gm-Gg: AYBFou2xYdRJvTUnZlqtcurvUWNxdiWh3zHUaw8genJMkbuYluahDB07z1KDlN0Zbuu
	NAgLvpokg5euyyFQEm8XGt7B0KEBEpGnqpRHhwHRAcjeKTNcBvqW55gEpHAvCmgKJQMX8/yz6wy
	8zsdOQTNuGp0pAZwLH/sJ9irg9LJNx0Yc41NxwwxYCyVeDBxnsLkLPDjuMST98Cvf+dF602loQn
	zdAACLD5+abWHjSSrrjJLlKnMkzjZ14LjOLF1/TCL6eoM+5gvIgpWqhnx7M3ZX/6Ve5MwRnn0GE
	oPypOjjfjYDCUhEHhUCR/GEYcu+zdNF1tbQHe6NyFAK4s1NLCxTLCIlRUQPuWBGyPKTN8V/oCqx
	So7fpFTOiN/OX+wqrmSsdt/LwPZTBZl4rKgUeAQWOis75D5l1Jd5Z6rN2CT4CyAcPfPeOYn2oP6
	rUCvmBEhng3tCVuKB0/MK6dOOyyCeT1+EbYQBb84bN3fR3y+1MaWfA6g8w/SZBq+SgBC+kce6aS
	zotliNQAzGaed0JOcOeMckZp9QsPxLbRmIe1KYQVCCDYLUi6hQmo0k8DQb3n8u9PJJ5LRh0dvc9
	dyGsqYLLknOPxaM5MxZPwCavUc1iJ2Me/0yTwKn9hbf4Je4mG/pRmhLQmEZcExny9OHZm1aObuY
	tcpYZIDkqdIYyB7Ilqd08rrTOIA==
X-Received: by 2002:a17:90b:2e51:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3ae8983f049mr3818814a91.47.1793430636804;
        Sat, 31 Oct 2026 00:10:36 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae845432e4sm6670459a91.3.2026.10.31.00.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:10:36 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2 7/7] wifi: rtw88: 8812a, 8821a: respect peer A-MPDU size limits
Date: Sat, 31 Oct 2026 15:09:47 +0800
Message-ID: <20261031070950.425176-8-hjf3108@gmail.com>
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

Honor the peer-advertised receive limit for transmitted A-MPDUs.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/rtw8812a.c | 9 ++++++++-
 drivers/net/wireless/realtek/rtw88/rtw8821a.c | 9 ++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
index d93c4776e0303f52273d92eaa75341ebbcfcb066..a3b5fae5608e0637b1badb7aff7986160c9668a1 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
@@ -78,6 +78,13 @@ static void rtw8812a_cfg_ldo25(struct rtw_dev *rtwdev, bool enable)
 {
 }
 
+static void rtw8812a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 factor)
+{
+	factor = min_t(u8, factor, IEEE80211_VHT_MAX_AMPDU_128K);
+
+	rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH, (8192 << factor) - 1);
+}
+
 static void rtw8812a_do_lck(struct rtw_dev *rtwdev)
 {
 	u32 cont_tx, lc_cal, i;
@@ -926,7 +933,7 @@ static const struct rtw_chip_ops rtw8812a_ops = {
 	.set_tx_power_index	= rtw88xxa_set_tx_power_index,
 	.cfg_ldo25		= rtw8812a_cfg_ldo25,
 	.efuse_grant		= rtw88xxa_efuse_grant,
-	.set_ampdu_factor	= NULL,
+	.set_ampdu_factor	= rtw8812a_set_ampdu_factor,
 	.false_alarm_statistics	= rtw88xxa_false_alarm_statistics,
 	.phy_calibration	= rtw8812a_phy_calibration,
 	.cck_pd_set		= rtw_phy_cck_pd_set,
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8821a.c b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
index f7391f6aa3039c7ba4d88249d968a5f1763ea866..f597edec290f64fda1c457812b240515360dc387 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8821a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
@@ -49,6 +49,13 @@ static void rtw8821a_cfg_ldo25(struct rtw_dev *rtwdev, bool enable)
 {
 }
 
+static void rtw8821a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 factor)
+{
+	factor = min_t(u8, factor, IEEE80211_HT_MAX_AMPDU_64K);
+
+	rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH, (8192 << factor) - 1);
+}
+
 #define CAL_NUM_8821A 3
 #define MACBB_REG_NUM_8821A 8
 #define AFE_REG_NUM_8821A 4
@@ -872,7 +879,7 @@ static const struct rtw_chip_ops rtw8821a_ops = {
 	.set_tx_power_index	= rtw88xxa_set_tx_power_index,
 	.cfg_ldo25		= rtw8821a_cfg_ldo25,
 	.efuse_grant		= rtw88xxa_efuse_grant,
-	.set_ampdu_factor	= NULL,
+	.set_ampdu_factor	= rtw8821a_set_ampdu_factor,
 	.false_alarm_statistics	= rtw88xxa_false_alarm_statistics,
 	.phy_calibration	= rtw8821a_phy_calibration,
 	.cck_pd_set		= rtw_phy_cck_pd_set,
-- 
2.55.0

