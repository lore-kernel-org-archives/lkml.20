Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B263B42E1
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629292; cv=none; b=Y6fxgxcEMgpGQ2ACzTiKcbSb8nPG8TuF77ezG0MsW9V9BgvxZG0lV0okD9J2QiCV7bl1toOcRXtin8IAQYFXZwDM1YbxH5WHwuOo//eiZgULkjsMovcR2wmE1R5TnQ53egVbFZqHadO2L5StZwrzzxtSqfk8OHfRqk+j/I5N/xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629292; c=relaxed/simple;
	bh=7NWvbpIQWi3qzTqFd0LyYidZnr4cu+18lgerSulajfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lePemRF2j7lBMoVJ9Gikx6UN/peldlKRPN9TAxHslqkhNhLSEgRMjOuaO6MEclpFJafqTefYyNuCIa/6cSg0/gjpSG3mBndTWLrj68bQQyon4FMZpavu6Wbxv/zNAnQvy6eDQeE97uSTqWP7PMEeuz11k/M8m+fDP1mshz0ZSeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gkq0qAVG; arc=none smtp.client-ip=74.125.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gkq0qAVG"
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-3535a54c09bso252161eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791629289; x=1792234089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QaSdzpcAMrjh6Y9ok04vrYGf1sEpZ5LikVoH84PMQAo=;
        b=Gkq0qAVG9jdFlPp7TqjDCp8trMnfWlUqemew9XTRovf7Mpvu43fTf0de6k3Bd+kYYU
         bxaaKq9h6LbydZIW35WrwcQJx1Bl9nXAgjvIQh1n0LxLfSRpK53GpHMM+CtMMtkLFgYZ
         rIrIrGg1L/KhoYlMoQH486tK9pyBCxc904A6G82m8md1XueAzgBLB/M1j3tV7TM3DYpT
         Y4ErGm0lsbYKdQFqu5y4QooIAAY2ZO9B9W771JxPhPYyz7xkM5rxYrF+C7u8SJPOhyTS
         59M4BCVCwsv7S6X9Sz7mZUrt4inYkbFG0Xlidl2ei3/471UQa7uYGlS4n1C/IqCaNgsr
         qojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629289; x=1792234089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QaSdzpcAMrjh6Y9ok04vrYGf1sEpZ5LikVoH84PMQAo=;
        b=qTfNfEkiOS65F9Fnh36vhh3y22YvynQ6/HqwKtRjui5NkPjGgp7q+C4S9nypyBYTFI
         g7U+823Ea5+BXuvUyXX2L9+MrazA+ZCEXloqG3yMqb2yfpQGVtPKEcZRo2EuH4lcX59K
         77a++iukyhywcw1jGoSukIc32ByW42KTwUZD9ZspTpZyopn3gEJTxE+Vkbi0QXq5rHu8
         8oA3+13uOqNO2qCDfs9eIzXl9Wb/EuwURHo+Ai29LOl7ZLI9aeemW/aWbgpHM5k4Mw2s
         kgVujSfNwbovjOi5HYb4btiWvlwkQY4y2FMPVwyyYDCOExZ+X5WXbapbwhUt2mYGCcH8
         xmiw==
X-Forwarded-Encrypted: i=1; AKwUvBytS7Jk6kg5t4BHyhsbGIOvnznfPdHduTa5s8UIi//32MNbZ4L5u71U9WVYWZzQ1uOi8gfrydl+67BXvzg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwgaFJdVpbXTZJ1K4wSyW8SPoFWzhQbY4nD/YebeQ3Si+pwf5C
	rTRFMo5ypxFDP2wcyhxYHKJLgrIgUa2VQz31nonHG8ixDQn3dYcrFZ39
X-Gm-Gg: AYBFou0asRkJzjucFLsBF2SACNmSnlB6Akt6g3gBgHTwmX/n7KOAHxBLcMZs5gm/YNA
	tTTCXtXWDjw6YNHL7vUgthgVlIJXSNZOFyoJ3jmm+ASBKIH/nTtVXnM0C4bPBlX97RJwBzNqaes
	TP5gsOUioVaN875nWyFPcpzPu34R7z+wGhjYhmWbhOgMyp3d0PSxDpCv8fD9baRqzAnDmfrPV7X
	9y4+3EsFliOQFWXB+sK0hi3ct/n8lBKbZwOeewHFhZoVr/OjB+koiiQeAAfKOdVz6hfKDdZjQbn
	oxp1oI5kugB8oVm1Vy0UDaEcbPa0pkslwoZNUyX0+PCE/BAt9k9bjp+YQl5f3eljnvZkluoJvmI
	6g4zueZMLK+0HTV724BIhsf7hTkCgBa8ArNl9fs6X856Mtb7S9TSMutigpp2l2D/L6I7OkKQNnd
	Of/qL9MgHapHfJLDZgFhTIsnpGXfo0Ar5KR4zrdOVxYlHX4n5kBkYq5yBuh0KbjYG5MD+lcvHiL
	ypgOFmY4U5w6s44avdMWLcpU7I=
X-Received: by 2002:a05:701b:4586:20b0:169:b1b1:1445 with SMTP id a92af1059eb24-16a5dbfe73dmr5319479c88.31.1791629289039;
        Sat, 10 Oct 2026 03:48:09 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567bd18sm13046184c88.21.2026.10.10.03.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:48:08 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	rtl8821cerfe2@gmail.com,
	straube.linux@gmail.com,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] wifi: rtw88: 8723b: avoid converting RX SNR twice
Date: Sat, 10 Oct 2026 10:47:53 +0000
Message-ID: <3c89d2ac770c659eacd532134c89b4725be9ab97.1791627615.git.dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw8723b_query_phy_status_ofdm() divides the SNR report by two when
filling pkt_stat->rx_snr, then shifts it again when updating
dm_info->rx_snr. This halves the SNR used for diagnostics and average
statistics.

Store the raw report in pkt_stat->rx_snr and convert it only when
updating dm_info->rx_snr, as the other chip drivers do.

Fixes: d726c70ce082 ("wifi: rtw88: 8723b: add the RTL8723B chip driver")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Store the raw SNR report in pkt_stat->rx_snr and keep the shift when
  updating dm_info->rx_snr.

 drivers/net/wireless/realtek/rtw88/rtw8723b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8723b.c b/drivers/net/wireless/realtek/rtw88/rtw8723b.c
index 8bb9c03d769c..18bd2b108ccb 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8723b.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8723b.c
@@ -1280,7 +1280,7 @@ static void rtw8723b_query_phy_status_ofdm(struct rtw_dev *rtwdev, void *phy_raw
 	pkt_stat->rx_power[RF_PATH_A] = (val_s8 * 2) - 110;
 
 	pkt_stat->rssi = rtw_phy_rf_power_2_rssi(pkt_stat->rx_power, 1);
-	pkt_stat->rx_snr[RF_PATH_A] = (s8)(phy_status->path_rxsnr[RF_PATH_A] / 2);
+	pkt_stat->rx_snr[RF_PATH_A] = phy_status->path_rxsnr[RF_PATH_A];
 
 	/* signal power reported by HW */
 	val_s8 = phy_status->cck_sig_qual_ofdm_pwdb_all >> 1;
