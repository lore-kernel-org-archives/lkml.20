Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743797;
	b=Ei+gK5MOTGc8oQ3nxWju7bJ4oUbJml6Sj21QwlAcd78982WL3i/QQWVD6sPN3nbC5Tzu
	 5n6Tm1n7ElxN6N+Z6X35935NzUcPXOWcFYAEwPGZV+JQbgocY7F+rJnW7Fo7RaulG4gxs
	 NRJbbpkj9Ot8CPojKIA4dcbn97+AgyD2FswlSFefWcFTajY8/dbv+s13LpOhsOXbBx9P1
	 asWf+ygrlhRseOREhjv2QbhAXlXK3b0P90bfOqBhZUAvSQ5/7LcVhmkxAEurDLeFOczUz
	 bxs5RNre18bgb5GmAl5Lg/TxdzvtAiPamy/3udJP3NcFI6NQMn4Ond5I2Cs+7CYAdrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s2xIIXIn9ZMfAOFx41C7Rxwc3LX9/CGKf6rN28Tp9l4=;
	b=EHbTHEeH1pQLWpfn3i5NezbpUhKYChTFvE7Ov2SQv+x3T/ZGfkQK8Cg7CtStGes1LJm9
	 DHgx3hwQwKUeb2e4L8kVVNHUtwScqa/tJrTsYEw1mZc5wWKlKG9IfmYHK2focLy+oEMNB
	 gzmlBap8dYUtxMyqsW8p9qlmCLsmk+436eIg4jYtHTO7RgI8IN9JpNh30DZhciYZP2Vfm
	 I8Va3vq3iCeHU8BgiTTsLhZidDfcUx1QWhn6TNsy9T00vlCk+fxotOEDIvD5/JSPIkCli
	 XNzCVCb2oNP6C/c/La+4Ga0zYWRo8is+YcUHdwlvRXOiAMjmKWN03lHKJ3esj/+N83Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="y7R3p/T+";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E2D606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51E2D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y7R3p/T+
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso1226656a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743796; x=1795348596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2xIIXIn9ZMfAOFx41C7Rxwc3LX9/CGKf6rN28Tp9l4=;
        b=y7R3p/T+cH55CCZbH83enIUNAXJFg5KoEU0Nqkl5d2kPB2fLJahZjBK0bKF1Kkt/PJ
         uZLQl0zsV8RFr3OHUleGRTe4Odg3i/meww5rK8K/ImFOAWkhPrLtqatoZ5UZjYLV3gCm
         LzgCMilGr6nPdYaRgCf7iHNUiQzH0CKclAFS/41gso2NXswtgq75YOoHBjKN8wsguZiF
         NVXFhlgzVFGha2198xoy3EOXqahQhHBrD2NpnW0NrcLXYLVc296KpJM4SQLMnxSlh5RX
         J0kTld/oI67+jOGsageib7dIPK/dLOw/Jg9PS6iAyrCWnpQ3MamHXKTzYhw+jxSTGv+o
         JizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743796; x=1795348596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2xIIXIn9ZMfAOFx41C7Rxwc3LX9/CGKf6rN28Tp9l4=;
        b=Wk1xx/Va507vVONRK8ONADPfoWvgqM1QlYpB08TahQPOYselqjfJVALVDge4MJCAcK
         2vGouysblY+M44Lw3pTbRdQvVniO0AzwoLV9UWXwlZfs5MCRFaMqvcYlPi5nyNHtKzDS
         EMHNX7ot5XF+2e+f+sjgYbrUjz03r3oEUN/ivpzQF3vIJAu0A2OFA7nnvqcfg8oQMjxh
         E03mVR6IXdJuVcG1tANRwByXygUWJ85mU6q+Ljx1KpC82u9avpeDyXw41fAxBcduEcKI
         yoZqTuCwJ70lQOQmLJaQ0XP/5ZrfXd9qtsuAo3+U5gBLNInAaB1yNiWLZ+iXLjr1dz/Z
         +mmA==
X-Forwarded-Encrypted: i=1; AL+hErEtvuq+SqNcJRmYQ/XqST2SAeGRgErr5RjbMB3ZRs0Hc5bajNyOHdKnnmGz1A/7PSbpSHsz3sJTXt+/esk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1AzTiwVc+EIBGJIqG9V0jbP2BV3DwKDCtN4j+ean+1PJfU3nq
	r+ZikBH+4DHszGrbHkN5QJq/mpOYeQtSOT5Oiox/04uPj4jz9CEVEnDg
X-Gm-Gg: AYBFou1M+wVyFYYh7Q3wTCuoWbCTGhyQeU/ckhho8i/Eg3lqgCTI1QGTqjtePJdrdJg
	mgmf7iKV21ID5AKntqs78YugTC618b/HdZ755u2xgTRCw3SjN/Tr0XQef1XLABLR3gLu9BdhDnt
	slSQzQAUjaszamSuHeU1+BY0TXTpCiebtTLcjNcT91uGmQzL9UOI0dw0IckAcmoYBnYD/wRKoNP
	cqFmipoFOkHO7FGuAprfvb6xJjK1SpRZk3bIgaqg+qLT4kLhC9W3Lug3hdYBovG5+308LQiQlae
	KA4xJjWrJajj+Ak8ODZPJToaK80FeAsPs7lZWxKuCkhR7ULDBlae59g72etwavtkRRzQGobHKCg
	y/rXGie4XNgBwTG8jBI5Np1i1E5M7VnDMvSEiOfdLJbWFywRgIpWFUpUA/ZfWU/dtqYgze+/ike
	tjvIhTUILcBMS8jdnnfZ2k8V7KGhv43uyL7iG46/8x61xawN4HKNlrXvrXg6zLr4vjUfvtlHYE9
	eT24Ifr5F2dduMo2qHEfieFBGYStgocc+IKOasZKolzhfRNegWjEp+K3eWaH3zvuqIVWG7c4B05
	mzB2lBQP5BLaOxVTIZ4a755fihODb0xW5bV65EWFVlOn58qU9yy2Mxa2DyIN3phScvu7z6GLiYN
	OtRm6tfeYjjXbETIIhUfjMh3D2RpxW+651AVxJtVOnFc=
X-Received: by 2002:a17:90b:1d46:b0:3ac:7613:1ec3 with SMTP id 98e67ed59e1d1-3b1b0a3eaaemr6651022a91.37.1794743795811;
        Sun, 15 Nov 2026 03:56:35 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:5ade:5fb:5602:326b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3ac294bsm5853901a91.2.2026.11.15.03.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:56:35 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v4 7/7] wifi: rtw88: 8812a, 8821a: respect peer A-MPDU size limits
Date: Sun, 15 Nov 2026 19:43:33 +0800
Message-ID: <20261115114336.1739863-8-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115114336.1739863-1-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com>
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
 drivers/net/wireless/realtek/rtw88/rtw8812a.c | 11 ++++++++++-
 drivers/net/wireless/realtek/rtw88/rtw8821a.c | 11 ++++++++++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
index c8008cf43d..7e3c86160f 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
@@ -78,6 +78,15 @@ static void rtw8812a_cfg_ldo25(struct rtw_dev *rtwdev, bool enable)
 {
 }
 
+static void rtw8812a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 factor)
+{
+	factor = min_t(u8, factor, IEEE80211_VHT_MAX_AMPDU_128K);
+
+	/* the vendor driver sets the undocumented BIT(31) */
+	rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH,
+		    ((8192 << factor) - 1) | BIT(31));
+}
+
 static void rtw8812a_do_lck(struct rtw_dev *rtwdev)
 {
 	u32 cont_tx, lc_cal, i;
@@ -926,7 +935,7 @@ static const struct rtw_chip_ops rtw8812a_ops = {
 	.set_tx_power_index	= rtw88xxa_set_tx_power_index,
 	.cfg_ldo25		= rtw8812a_cfg_ldo25,
 	.efuse_grant		= rtw88xxa_efuse_grant,
-	.set_ampdu_factor	= NULL,
+	.set_ampdu_factor	= rtw8812a_set_ampdu_factor,
 	.false_alarm_statistics	= rtw88xxa_false_alarm_statistics,
 	.phy_calibration	= rtw8812a_phy_calibration,
 	.cck_pd_set		= rtw_phy_cck_pd_set,
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8821a.c b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
index 17d3677ca4..408b5ecdc5 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8821a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
@@ -49,6 +49,15 @@ static void rtw8821a_cfg_ldo25(struct rtw_dev *rtwdev, bool enable)
 {
 }
 
+static void rtw8821a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 factor)
+{
+	factor = min_t(u8, factor, IEEE80211_VHT_MAX_AMPDU_64K);
+
+	/* the vendor driver sets the undocumented BIT(31) */
+	rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH,
+		    ((8192 << factor) - 1) | BIT(31));
+}
+
 #define CAL_NUM_8821A 3
 #define MACBB_REG_NUM_8821A 8
 #define AFE_REG_NUM_8821A 4
@@ -872,7 +881,7 @@ static const struct rtw_chip_ops rtw8821a_ops = {
 	.set_tx_power_index	= rtw88xxa_set_tx_power_index,
 	.cfg_ldo25		= rtw8821a_cfg_ldo25,
 	.efuse_grant		= rtw88xxa_efuse_grant,
-	.set_ampdu_factor	= NULL,
+	.set_ampdu_factor	= rtw8821a_set_ampdu_factor,
 	.false_alarm_statistics	= rtw88xxa_false_alarm_statistics,
 	.phy_calibration	= rtw8821a_phy_calibration,
 	.cck_pd_set		= rtw_phy_cck_pd_set,
-- 
2.53.0

