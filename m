Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793253178;
	b=uXCuxnKpXqt6dpR88o/EqxVfkN5MZOCL9SfPanLUUES5mOuPusiGLnxHK5gogvJMEgEX
	 XabHSor4u2on4IXzcIr2hYqD0vvzxQcnMN9HO6O44j/46a7hnweUE20Nmp1rSoShz5emF
	 kXepxLahPtsJL2vnNt1+tzSyphhiyWU1zNa6ICVIUcEtGR+r3hV5QW7T9ZLWt5cSlCzo+
	 dFvlHalBK5E217soZzTY033mFZxlo+7yWEE1QdnJVaCt1NQJqkciR9ZogGQecnN/fxOKJ
	 JWHn1wMNTdRIns1CFFsFbRxE8HmpYJD1XbEQnW9PMHyPhkL2PCaSKSv/f233q/EMVGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M8bCmThDt0YJFHXDpul2iss+Vx2FuxVtz2FwcpBia2k=;
	b=WC1MJxaUzOiVqECLOU7+Pj6+0ULglf+BDCLnb1Xu8MW+Y5Nr0v3ypoyb0djwGZyTAVDB
	 drt0Tbf0b9M7ihv0P5vEBIJMQo0dde4U5ZalxHcobItjEBPzt9+KWQfY51YJEDe2ZpwLc
	 xRcYE7zB1uwlgPgY1FJ4sB4GSJV4xm1kPWAuLnF0qqaZ2zhNZxo3tOh6LAKx51VXLc+MY
	 F7ODj9bGI51h8Qc678wxcIePgVBXj5mNL3cWWRHx9vyzMG8Y0jb6oEb9khRmJ0kGrqvHi
	 943KuwWLswQxrzzo61D95ITEz/tX8G9qfz4RI2urnaK2zv5VoeA7uP2QvKShrxK+j6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sypdpnbf;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ADA606A338
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83ADA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sypdpnbf
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1100619a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793253178; x=1793857978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8bCmThDt0YJFHXDpul2iss+Vx2FuxVtz2FwcpBia2k=;
        b=Sypdpnbfmr9IshLjrviK+HWbHU5ZWjp27KamLdhvZ31Itwh/VFpma19KQQmM32nUCS
         QsrWBtSzAwKFIni3hrdBtxQIx8EOOorWIgKtfh376z0iR2lKHkyq41lk8NSbbB2X9zSy
         qQCLP3FewE2BN06Wl5RXJ+Iqlzb07uThZnUStmabsKCKj2MLzARsolWeyOpJN4xnV2SU
         CQ0nR9fJOpmwIBv4SEeR/c/AW8yD3KkmiIxFPgU1K390T2xufNjaSdP9tR3m4n+86Dgs
         Hz6WK2yTesvbOlINTtA64bYmsnzasGVLNGdwGvZ0FChtW4gbj8OnZefOYPHwpW8/9U8m
         Rd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793253178; x=1793857978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M8bCmThDt0YJFHXDpul2iss+Vx2FuxVtz2FwcpBia2k=;
        b=Zhr7yskpoPm+mdqcseYsjgnQUq3LXMOqiVxSq88omTyrzKc5qIJcJFv+OYl2bxjrPI
         0mMEt8sqI+5rNUMSVCc6OWAArTD1eYULJTKeL/KYDveLuqNlS65i6Z/2mylY7FrAAdFD
         fish/fIMjtFpq+FNg3Hz9TF1cmn+ZKGKUD38DNMoq1ma2PcswwahsNEHxR9I4EzrmHUo
         jK8oB3koeRk6JdbQuEmCIYKXbx+ZLYDzx82WYVvwP16aerVrxXVQ5IiF0tstMbXXD9XE
         3HGRcVYSGlFMuMIlcTvHd1VsjMZS5fQJk1pIkxbZkxXQyq41AEy/9etLGm23kR7GR60k
         YfzA==
X-Forwarded-Encrypted: i=1; AKwUvBzyDjaXhk7RUwPLWLXxlzhStr5HioXPlVFrHSMHV+6iZk0ZxkeISHLkqwABsBeCAkFwOpsgEXK/cCFiRNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOyqAvUFSU/S4gMmwuBShMrDm6QgqaTY9SWkZgJeAyPHkacenA
	ZXSaU2C5JjNgyu7gJT6F+LzEEIo4FFbI4AaeaQO1biCd41tNfxtk9xhcmsIjuXCB
X-Gm-Gg: AYBFou0F03u27V8DJlKssjQkvcK1NawhiXGnSyou2fOEzBL7WnvAsNB0eggStbL10zQ
	K3NFGagtckBUEHms964O1/lDHfJTTrMurVavdjUNNl/zMMisFvpFP1fUvrvnnp5ey1OlEut6RQW
	E3x4x+Hii8cORkkRJ/ouk0+MBgLfG9VxcHrzvaBEQ8xdOcjk6PxngJuHKrnkA+y2Ra7WoSlGavG
	nXG3O4iL8DY+Psgn+5nt9TUhsHfIQjbJgaNDix3v1YbSiW/NIdnJwT6Ai3lO6fpQZCeXzvkqLSj
	W6DOmbjQoOESqEaHXE898DMbTTe5MLVVUdmvrMjhMIR567zcC0gF2jnLJFlRkU2dmPZ1zTI/7BK
	QZ4sCHJJ1rAmfkRA/QaiHUmjfgrMguthQm/ooXe8fJHcadjCGEor7wPEq1c53rDE7tkymIDkYv5
	wScFJd1M+jLisD7ESUTrP4DHMU/KJ/F9BgbbJr2NY4Fi4GSxDmnUsVULlMW6gsASyU0QczQND5q
	/cNGoRhksyVxRNn64R+fwzWB4ou89StY8Gn6BwrPPYrJYrDcFxL54brqq/i5vtqwGHEOFD42S/6
	G7OKSgZozoz+l8wcJsXWMwf87H+tojQCIWc1wo0IwcWugZkDqhP98sy9vsLf9tethWs7uXFEYmT
	Ou4IG
X-Received: by 2002:a17:90b:1e42:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3ae580a9d74mr3463593a91.19.1793253177827;
        Wed, 28 Oct 2026 22:52:57 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm2523531a91.0.2026.10.28.22.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:52:57 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] wifi: rtw88: 8812a, 8821a: respect peer A-MPDU size limits
Date: Thu, 29 Oct 2026 13:52:08 +0800
Message-ID: <20261029055212.84711-7-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029055212.84711-1-hjf3108@gmail.com>
References: <20261029055212.84711-1-hjf3108@gmail.com>
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
index d93c4776e0303..a3b5fae5608e0 100644
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
index f7391f6aa3039..f597edec290f6 100644
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

