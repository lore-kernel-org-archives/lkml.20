Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793253161;
	b=lKivkczzRIlIb5gho7UoSV1saGZYs3VeSXEkC8xWEvThHXRcvtq6KRUkckANqA7wjm1/
	 qbZlN1LbrOosWtxGwoPj4QcA6Moipv2TRoQKxXshAyrPzbTZF4fw+Er2B4J7MwgeM35Dr
	 tC5duMCyVmcxH+ocJBuKE+hdwbeljcgyQ9AOO4FwPMWrMwyJ+uMU/YgGjuOEpraoZutIx
	 beaxpqe82ebuOrt8UGl+geb9EB6tNVZX3Ro6eDCV103/U48JQgq9yWNCUlY95k6FrvvY6
	 Z4k51JwYFVeFumSMeQFTSjeKDY1bXybUsSJ5cMHqsYZPCkXMj/HyEN2bUSRt3Mhschw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xr1LjWVaWfr7wmZpwhIZF79+9c7ND1pbwxs/kLwML6I=;
	b=ZAL/kkLYCdR49mI7z+T4i0DoMZpuPOarmZHXcuowmTFGhGv4HCKOrQaU6SXt2/9VQmS4
	 FtWgbOs7E7wY+tMmMXx1iw87tS5P2OaupGzCPcGw2Wa07QgVQZEsJNEQ3mVmJ4qfmwPCi
	 dNts68NIZXXyal3Q1/YxYfE9urJyUeCjJjkuE2/TD1uJQYM2/UhK7S8zinWrB45Kh1myg
	 uXDWORH7oFgMxROGgb6GI5WGbSC8b4c8N1OnpSZq4uwYHE3lUNOicvNq+WrPU99UZs2I5
	 /fEUeq7WRePnrq7lnZI1pIzNewCHEMJ9ARl/EbIhZ3RvE96/HU6/vLgSV5MtIZ3su6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sJ/U7brZ";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B78606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B78606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJ/U7brZ
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1253197a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793253160; x=1793857960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xr1LjWVaWfr7wmZpwhIZF79+9c7ND1pbwxs/kLwML6I=;
        b=sJ/U7brZlauFjsSJ/D4pFbzU7Yppcgxs2LUxksBK4eWLfoaqWrhMriDavinEXCKnYd
         nC5/VOl7FxVpi6ttKM/R3LVZBKeRDXBbrYB3lTi7mAFJ4gqYyIfgF2ic5xi6dc1ro6Li
         e4IeZ2I5vRRlSnjI5nS6xv1vY6+lghQSKTj+6zK92EZC1FY8mCsPM2ym8G3SS/TZ8Das
         C5+kz0DSa19Hxc6Z9kJQqUEpxGUuigugCrKBv3tqADut9u+xaR9hm6RYqBoENWxKEnPr
         Py9bo0vYTWpgj/cK3y3vf9ycGAuPMJuhPWm78jciahfA4xVh3xY+3AvUOBpM4V1zwzL5
         +Uiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793253160; x=1793857960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xr1LjWVaWfr7wmZpwhIZF79+9c7ND1pbwxs/kLwML6I=;
        b=Mp8PomeWrrwlzMIwZtHCIqml1nsm+EqylmZJP2WA/SDHCTiyNnEuAsflJ13gg50X3z
         cS+1euZ6TYh6W2VRKceAMoID33hQBKp+CH5SiBnWynTIzUJancMT6TSUruMfvNfEC0H4
         xXQfQUIlCAETHfPtDSi5vs3MenyX6HsfE6vu5jq1AulNzBpbAQna4dQen3KK7Vv70s9S
         d8IOTkfX/yqIFhdkYvS+qoJ4oqbF6u7YPBfVRJcFnLiQJpCnZ/+qyDmrcuqgW4GI0k1d
         4u346ZnQLT9OwWB8VRvbCyK2VlmnzoBbyzciUm8GVNw2UjPEW69+lVTtgrVcuuji0MRP
         7K1w==
X-Forwarded-Encrypted: i=1; AKwUvBz77tvB3I3LLgUQ8D19B4/PWutO0IVib1uiF6yQjsbwC7UpaUG1D9YTHQgA5OMcf6nsnCJ4tceZxxk3PsA=@vger.kernel.org
X-Gm-Message-State: AFq9FYITUigWdUr4rklJa4MvUpeSe3qOkrbNWzHR05AlUsoQVz9zpgf9
	A5FygEsZ/J1RLZSqI6NfZfxDR/ApkUD5hG11N7LJZHYBIF1OPKOODZV7
X-Gm-Gg: AYBFou3BsX4GlZnTQmOqumvf1S9YP1keijc9UkkezCSuDk+VOjbuUkRI1t2AiVBhQKh
	4feQzjp9rqgmAtDCCZXCo46gxRIDhY0ovzadROAyadVmhhP2Q5sGzsE8gxFbDx1eiiNQtf+aWXi
	i3bm9XTa1Nb7LYwW+S2M51UN/csn5Vi0rMRakI7RyNdAK23OLJpoueZ/Fvd+jTUveVvg/r34SDu
	fqHPDEjAjehr+nFUOngURNVtUu0+ot6/+IJ2TSNDpltjSKJWtJGLV+i3VSOQ9JS/yF44OkFS717
	Ko7SdGJA2I+oq2MSX/+VuCf8/LqnOuvggVzeynXHV3JBGGNMiXS7Ju/WgbEQsedwB4S3lCVaxMq
	43Pb0awXH13+iZaDBKrucH/QNb1j1wzxOlRO80ab94fOmIyeLH8A56cXWLPowl/2NRq9zZgH7u9
	VshT9FZ42ARTiWLZlyInefJnpBqVTbe9mEVO2yhFBdnfFrRhEFID+B345nNz8SqLMZINv62oE45
	j4coDsh9/ZcFV+2YHU+wqwF7/1qr6pRiqDwatr4+7B02JNbcyPHkQ3wgwVH7sE27Mex8rM2xBN5
	g40Ajb5fku7zJW+WP25/laiGXm9/Xn61/PJHWDjYzZzynCH/KAipP/ZCScVN22EuG5lGTMANpIc
	FVYbp
X-Received: by 2002:a17:90b:53c5:b0:3ac:a11a:7c7f with SMTP id 98e67ed59e1d1-3ae581006c1mr3078857a91.23.1793253160214;
        Wed, 28 Oct 2026 22:52:40 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm2523531a91.0.2026.10.28.22.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:52:39 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] wifi: rtw88: 8812a, 8814a: enable STBC for HT transmissions
Date: Thu, 29 Oct 2026 13:52:03 +0800
Message-ID: <20261029055212.84711-2-hjf3108@gmail.com>
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

8812a and 8814a support STBC, enable it.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c     | 2 +-
 drivers/net/wireless/realtek/rtw88/rtw8812a.c | 1 +
 drivers/net/wireless/realtek/rtw88/rtw8814a.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 0f23498b5c96e..f7d7b66844862 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1585,7 +1585,7 @@ static void rtw_init_ht_cap(struct rtw_dev *rtwdev,
 
 	if (rtw_chip_has_rx_ldpc(rtwdev))
 		ht_cap->cap |= IEEE80211_HT_CAP_LDPC_CODING;
-	if (rtw_chip_has_tx_stbc(rtwdev))
+	if (rtw_chip_has_tx_stbc(rtwdev) && rtwdev->hal.rf_path_num > 1)
 		ht_cap->cap |= IEEE80211_HT_CAP_TX_STBC;
 
 	if (efuse->hw_cap.bw & BIT(RTW_CHANNEL_WIDTH_40))
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
index 781b66ccde675..55f1d3d3240be 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
@@ -1077,6 +1077,7 @@ const struct rtw_chip_info rtw8812a_hw_spec = {
 	.rfe_defs = rtw8812a_rfe_defs,
 	.rfe_defs_size = ARRAY_SIZE(rtw8812a_rfe_defs),
 	.rx_ldpc = false,
+	.tx_stbc = true,
 	.amsdu_in_ampdu = true,
 	.hw_feature_report = false,
 	.c2h_ra_report_size = 4,
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8814a.c b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
index fa02aa299b5e9..5bb55606f14a1 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8814a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
@@ -2200,6 +2200,7 @@ const struct rtw_chip_info rtw8814a_hw_spec = {
 	.txgi_factor = 1,
 	.is_pwr_by_rate_dec = true,
 	.rx_ldpc = true,
+	.tx_stbc = true,
 	.max_power_index = 0x3f,
 	.ampdu_density = IEEE80211_HT_MPDU_DENSITY_2,
 	.amsdu_in_ampdu = false, /* RX speed is better without AMSDU */
-- 
2.55.0

