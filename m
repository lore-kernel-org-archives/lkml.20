Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8063C109A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895635; cv=none; b=iEVPkOKDHkVPA6RQTeBHsYcQgnD4HCOK1BLYuz0ZTcivK3XIBgfKnuwCK05ikUmK+UauH2/UA50lP0+X5GtgNokBiZR/szK3fUnjyOJ6aZZ8oohpnq67Z63o7FpaUweDtoBRDi2m5RHG5nYZokM7K8FWDlmoqxU7xHNPKetaMh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895635; c=relaxed/simple;
	bh=J7WWIorQALvl1TB/piLk+5x36QCOVw2Ew4N4qt78e6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pInjiQRRcc7CpvPP6Q18g4pJKGWJb7/Ux8URusLDN5wu/ydhkrmOW36YzrHcpBDtjYhkF/UzS8iNc+MP0RI3+kYK0Aa/KvTEg8TdFS2HZ+EVB+m5Wb9Tl0lTZyBkt7SsQb2uWqJpmmHRD2iG2vRyk0P0pk1PHUPjakMQRCpIi/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qN9XEaZr; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qN9XEaZr"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so618757e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787895631; x=1788500431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mTp5tt6o5viHIfZHu8ddHYkmMFpAt4nOgEqLQ0bcKso=;
        b=qN9XEaZr918s1Lm6OD3BWnYKekJX3w6tjeMQvBnW2Pw6tu8Nzi4tbai4pYrouCQflC
         W4DBWC4C6yiTNYd+0SX1WRGo4h/q3g3wOIawknHJ7yeOLwzKKjAZY+Bco0hjoImCw+V2
         dhWjLKPr2mZ5lovi7niYYZV0Izurq5eUsSUkj+quk4m3+P4+H8au0iqXjzclcM0+y0D+
         NfX6J1APKnZLTFvZlwCjjag201z/v/hrN3O/9Q99pHQTxz16BDx0QFc78z357G4RLpj5
         lFBpeZrXXzTxetN3QHGCL8i8ifSGzY2nL18ncgSnVIsiLExJ5hpCnWj1Foh3S6aLzuFm
         isWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895631; x=1788500431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mTp5tt6o5viHIfZHu8ddHYkmMFpAt4nOgEqLQ0bcKso=;
        b=Snrc7j4kGx/viRemhKmrzcu2OVciw22OddiiDWot2USr32J7E1TDZaWpJHlg8yZClw
         spXxJAeCfHqYK4XVInqrZ3jej90kE4pMBgQB6r+Xjg6jQv/A6ZnuHxUmBLy6QEMpdL2i
         sjde94ODLOtmONxdQZ5pwq4x10glgBDdCj1iMOOVMKu8FpdDUJ26Pei0Mf8NFW8zxgAo
         f71NEA6em88Vw3XXB/+v8E8ejQDMLfHLvDmjeUaYy/5VfzthF3GS4E/kHZUIOSp/yz4U
         LPZPFQmsw0k4WYC+xQ4Pb3UutyBdrYc0//TS5jJfuP+T0YL6zpg6RzN3eu6HZfPylh+C
         MTKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgMDzWJYtK7JhYbVdKbvwBAdABAUwY3Q1zQ922URJqEZhj3qODGwc3WycFE8aZRZCrNz0ZvKl1y3Pe6YA=@vger.kernel.org
X-Gm-Message-State: AFuF++k75bNPYhs6mOBzqgw0pD0osPFVuk5HILoyfGS4ETaSrDv75iyM
	qiE25aPHYbV2GXy2sZoFklEk+D/8ptjo10OfsSoz7ThfEFgUKrwXL9g2
X-Gm-Gg: AR+sD13/QNmX5AcPQoQfZ+i6FxH3o6zmfK6048aHdUUAR9Q0n853zmUylzCDuE6dbnJ
	6z+vEJPHgmM2qRjCzwkj6tSkw6/ZKNbI0PyhRcdbstdroei+4K7kG6jbjRlAQCZuA2pQDg6fK/2
	KLGUFeLq6jVA6Ymkl+4q3irlFL1rL061ZSHBK2ENUQtgsAyi5HMptYd1NcuwPVvQJeXnfM+XpsD
	riWn7k0xZMC2Cper5Grr8klXTYlfoqBpztAy81runK7ERcZ5rLxmoPPdv+Z2/ohc2U5meD/K+pu
	39By/UZlnp3yC5xtELCeHfVudJbYS2dYolJLmikxlwkW9P69Db2PjN8FqPPS/HbJsfledOeLRUC
	pZGmj1UBzzX41zxBd/5nNz/GHmxKQIQqQ6ZZok5+ZE2PvOTgYzFiJAnFIgMtxsgkx/yGpgD3wLp
	tFPuENi4uom/zW3svuRPsWXVOMDIwSnNFHEKW0xmAUu9rE75UEyK0uwWKJzN7GR3RmGT4d/Obi/
	t3LAmHLnek7pq1XQf4jD72uTG6a6MznzUgcCu0UmvRKrgD5vk4WXPAUX+t+Mg==
X-Received: by 2002:a05:6512:3ba4:b0:5ad:5c4a:8221 with SMTP id 2adb3069b0e04-5b5e684b888mr974450e87.0.1787895631255;
        Thu, 27 Aug 2026 22:40:31 -0700 (PDT)
Received: from archlinux ([94.180.48.0])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a1a8edsm166172e87.79.2026.08.27.22.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:40:31 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arsenii Pashchenko <ulijg308@gmail.com>
Subject: [PATCH rtw-next v7 1/3] wifi: rtw88: rtw8822c: Use bitfield macros for DAC IQ sampling
Date: Fri, 28 Aug 2026 12:40:21 +0700
Message-ID: <e4c9ff204ce4d6901da97a83b11dce1bd42f6b21.1787895379.git.ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787895379.git.ulijg308@gmail.com>
References: <cover.1787895379.git.ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define proper GENMASK constants for the In-phase (I) and Quadrature
(Q) components of the DAC IQ data register in the header file.
Replace manual bit shifting, masking, and rtw_read32_mask() with
standard rtw_read32() and the FIELD_GET() macro to improve code
readability.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 18 +++++++++---------
 drivers/net/wireless/realtek/rtw88/rtw8822c.h |  3 +++
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
index 244c80264..137544649 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
@@ -291,9 +291,9 @@ static void rtw8822c_dac_cal_iq_sample(struct rtw_dev *rtwdev, u32 *iv, u32 *qv)
 
 	while (i < DACK_SN_8822C && cnt < 10000) {
 		cnt++;
-		temp = rtw_read32_mask(rtwdev, 0x2dbc, 0x3fffff);
-		iv[i] = (temp & 0x3ff000) >> 12;
-		qv[i] = temp & 0x3ff;
+		temp = rtw_read32(rtwdev, 0x2dbc);
+		iv[i] = FIELD_GET(RTW8822C_DAC_IV_MASK, temp);
+		qv[i] = FIELD_GET(RTW8822C_DAC_QV_MASK, temp);
 
 		if (rtw8822c_dac_iq_check(rtwdev, iv[i]) &&
 		    rtw8822c_dac_iq_check(rtwdev, qv[i]))
@@ -344,12 +344,12 @@ static void rtw8822c_dac_cal_iq_search(struct rtw_dev *rtwdev,
 		rtw8822c_dac_iq_sort(rtwdev, iv, qv);
 
 		if (i_delta > 5 || q_delta > 5) {
-			temp = rtw_read32_mask(rtwdev, 0x2dbc, 0x3fffff);
-			iv[0] = (temp & 0x3ff000) >> 12;
-			qv[0] = temp & 0x3ff;
-			temp = rtw_read32_mask(rtwdev, 0x2dbc, 0x3fffff);
-			iv[DACK_SN_8822C - 1] = (temp & 0x3ff000) >> 12;
-			qv[DACK_SN_8822C - 1] = temp & 0x3ff;
+			temp = rtw_read32(rtwdev, 0x2dbc);
+			iv[0] = FIELD_GET(RTW8822C_DAC_IV_MASK, temp);
+			qv[0] = FIELD_GET(RTW8822C_DAC_QV_MASK, temp);
+			temp = rtw_read32(rtwdev, 0x2dbc);
+			iv[DACK_SN_8822C - 1] = FIELD_GET(RTW8822C_DAC_IV_MASK, temp);
+			qv[DACK_SN_8822C - 1] = FIELD_GET(RTW8822C_DAC_QV_MASK, temp);
 		} else {
 			break;
 		}
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.h b/drivers/net/wireless/realtek/rtw88/rtw8822c.h
index fc62b67a1..7bea99614 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.h
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.h
@@ -141,6 +141,9 @@ const struct rtw_table name ## _tbl = {			\
 #define DACK_RF_8822C		1
 #define DACK_SN_8822C		100
 
+#define RTW8822C_DAC_IV_MASK GENMASK(21, 12)
+#define RTW8822C_DAC_QV_MASK GENMASK(9, 0)
+
 /* phy status page0 */
 #define GET_PHY_STAT_P0_PWDB_A(phy_stat)                                       \
 	le32_get_bits(*((__le32 *)(phy_stat) + 0x00), GENMASK(15, 8))
-- 
2.55.0

