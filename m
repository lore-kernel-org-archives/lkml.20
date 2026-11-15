Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743766;
	b=LeSsBZGSVKHIc7UTj287TNi8iLTfbFEUYYeOYuJdI8EJcE7gtr9dl1lb7lVf8bAfDGgS
	 BZyYChLFVcBPOICo5KGw0bL4TqknXc0iy/Q8J4sEbQDa6CUHIijTMcy9eWBq4AQfBHtT8
	 q2cp0G48uDdIxPWR7KMOXqAOeUx1fmm1IGgaQl0lY8mABWATfRDQCymbExMsp1/cSiq0x
	 9iIHKARKLRyrXU0qY3bblhv82u2oEcasESHhsX2l24+5dy1c7SrE3y8jN2dbwMDNZJePR
	 fj2+owFS/m1y0rPrMtUW/GHrILpaZH7vlylS+u0ImsG79EYTJ+33MnZ+a5pWyb7/T4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EeqUuX0V3kGoSLHtwDlP1qmk6zbbxt2+ixci+5837q0=;
	b=YJsUdRHqcC5FCQ70W9jLPlRKkVlwTG1QdhjYhYAGKCOmmFUO6FEjSmvcvajw3wW+Yu9U
	 s5jrBbJsl6hhKyZ4XGqWNgIcCZHqPTheu7Xw4PMSbEZIZlu2jtjWc/R09UT4DcR4eCxVN
	 8j+ZAUmtY5wGDkSMGsHmqBL9XabXd16xzw7O9ScSmVtSIVVhnEhwj3/n+fk2vhSZ2w8hy
	 +aVDPAIcPOesAhH/2G+lAIAe09KjaM0SAnHM8b5CHZ/56Ye0WJDrMfG1ORqfr2j0btr9x
	 P4FYZdAjbLKaOWvTa2ywAYMOq2B7b5TRueAlbSTCXdyKXbBrpiB1BeqYbDiTWeXq//w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tmiZqoby;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85AC606A885
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C85AC606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tmiZqoby
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so930273a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743765; x=1795348565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EeqUuX0V3kGoSLHtwDlP1qmk6zbbxt2+ixci+5837q0=;
        b=tmiZqobyR6FuOYPWa84w29ws5Ob4xPl/e95wT0aw8or4Qzknz9VTft1BYo7DzD8MJk
         kaqZftuLrBDL31kXq/ovwK6L2kgvefEBDsnDzJORGRpTPZO4MrXfgrthfOTtI/SnIpuZ
         gdLfwJE9Degeg1S4hfnhInBYNFoNh7fL8z+sk8RZJsN7TBPgGyLLHRA6yxDs4ejuimBb
         yVdYl184YE0k+X4Nwlm9pC0h5yEK7cwHKm+cuy+CmlL4lEcHEh/jA2809TfT1mYSsIhX
         dDAuk30pNUE4Hb8UpKmntOh4T7gVCr95/+SINf4C07uJK6+Nzz1IfJ2F7+nSQBE836NF
         qXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743765; x=1795348565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EeqUuX0V3kGoSLHtwDlP1qmk6zbbxt2+ixci+5837q0=;
        b=RO4mPSXvxJFASXIRp/V+Xnq9bvYrw5hWeAbMR3eOFGIn+jVXF5BsM9j3Rbh5rFOioa
         AhA6Mdl8dBiP1y4zi7CXLcskbYI1f8UF/W39apNAQTEgmJiUKpubKwDQsabwte+SpEIR
         P/LcG1ulKKPInLei14DRB4YNnjiOFelr//XXB4BMe5LdfKECGB0YnzdorUfYIL0cwLeo
         2KBw+thFg9Xb1LBmcz4fhtVdtHWIus3rm1cNle6/ve1qfVvp6Z9MasXsBRGssFQurXIG
         Ig1b/75UGvz/J0DgmLeFuoG0DvpF1tmJKvd9OX4Kg/IC1f0Fsvxcp2dWKQvlfNLwrZF2
         d0JQ==
X-Forwarded-Encrypted: i=1; AL+hErHMYUtSa+X3m+MvqoTnW63nfVV1yCH4lZrR5otzayN3nxWg+uaFziXi5g81ITalO1wPFZ4w0WODtLHd7z8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ck7fnBvx6C7EOw3Oe3gNMwu13y9L5CKWEj6W7Gc2fbrTcEGn5
	cdamu21Et5qK1XjEnlGcTVGwJTDoBrn0J0fdMErJot+rRRzk4s897Y73
X-Gm-Gg: AYBFou2sVJpAYsdGYrrGDoS1oSMtowVmqhcsZuDiGxU1nM99mzInEEXIp5ac3HjV0aQ
	R7X6+l/IlDY3AdW3seBSAFFHHDXu3IjmnfOEPApN1ZQee/h4/Xbdb09HZJwUEhk724bWpAJUb+x
	o1ulu594jn+R0t8Ig9MxF3Yku7LVtcO/5EXs0SX+W8syPVV7f+qvIkiha0H5xxHk1DDZPvEpwC4
	GKsY6/11BfhQXofObfG72nBYJvMNpEe3DJZQIfhU/atFFWeGqqHI55tc6n/J5idXofflt32QRO1
	tquTISeIULDG0B+R22V/K+WOG6K7Jy6Y33mWxdPTolhLrM5AwTtqhSZeoj8L6HlQ7+seAnmJX94
	n6rP1ia2KT4VXCao0mvtkSGr5RZej0A6tNpDVeVM7FRLGaJcNp76m+8F8KNuDKTaWigc1ng9KGB
	I9KTCZztULpKXEdLxtHvBsjkTiuUBbquGJ7MZZCQ0UNetuWagunhFGRNy09yFfrbKo18Ulc2USB
	iTfwr4kYMf3Og02UbrK1OFs87uuDonbhPJ554gSlYDq4rx7eDOsN/PR4BAwgx4scDRR2El3OO7H
	g8Sa9Gd87n7o9ULMuatRcypT6z9nhhiDGrpjY29FsT1s8Xrxsq7VuP07O6uB7gKe/Y5b4Rv7g5p
	rktanVBnmvXLMTCRq7aAOoIkdqBjSYf1VRo9kzLNNBBo=
X-Received: by 2002:a17:90b:510f:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3b1b07e84e2mr6756697a91.2.1794743765055;
        Sun, 15 Nov 2026 03:56:05 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:5ade:5fb:5602:326b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3ac294bsm5853901a91.2.2026.11.15.03.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:56:04 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v4 1/7] wifi: rtw88: 8812a, 8814a: enable STBC for HT transmissions
Date: Sun, 15 Nov 2026 19:43:27 +0800
Message-ID: <20261115114336.1739863-2-hjf3108@gmail.com>
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

8812a and 8814a support STBC, enable it.

8822c will lose reporting TX STBC capability if efuse reports
only 1 path, but this is correct, since in that case it doesn't
actually support STBC.

Tested on RTL8812AU, STBC packets were captured in monitor mode.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c     | 2 +-
 drivers/net/wireless/realtek/rtw88/rtw8812a.c | 1 +
 drivers/net/wireless/realtek/rtw88/rtw8814a.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7708ad17b..e243738809 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1583,7 +1583,7 @@ static void rtw_init_ht_cap(struct rtw_dev *rtwdev,
 
 	if (rtw_chip_has_rx_ldpc(rtwdev))
 		ht_cap->cap |= IEEE80211_HT_CAP_LDPC_CODING;
-	if (rtw_chip_has_tx_stbc(rtwdev))
+	if (rtw_chip_has_tx_stbc(rtwdev) && rtwdev->hal.rf_path_num > 1)
 		ht_cap->cap |= IEEE80211_HT_CAP_TX_STBC;
 
 	if (efuse->hw_cap.bw & BIT(RTW_CHANNEL_WIDTH_40))
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
index 781b66ccde..55f1d3d324 100644
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
index b6916d3dc6..e35c57c9d1 100644
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
2.53.0

