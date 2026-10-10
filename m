Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC6F37F73A
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791657416; cv=none; b=mWEPhxld6739KM5BTw0OCPgWamydAMTL1dm6rX8/L4x9aox0ZX/laDlBsO2vR0r8HiRCWNW42Lx4yeXbxv1hZqYaXKBS095ovVIBX/ZP36bMhlPoor2Lk4XQRzC0qvShMjxL2xIwtkeCnr2TBI/zcTFgbl6gFGAuBTTv9KGcmn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791657416; c=relaxed/simple;
	bh=zMHZJK+Lil5rgpQc8tSNIk8/tNDjLLOyL9TYlu0EuFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RckRf7lbpo3QPz477dBH/i0dPAfjocxIofPuNtJMTiMR5yh/hCBMpdUBYEQOhG5MFuHhLBi2xm5ZC5OiZzFyiKw9F1aBFnkZY1YCRrFBR0Z34r18RhCUkzu7NMz4RmFC1DWjin6w0mJW705BnBHDNEDTbUw59Djo4Nh3OpZFxck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FS2mTucy; arc=none smtp.client-ip=74.125.229.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FS2mTucy"
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-139b659a45eso229018c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791657409; x=1792262209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hW1Or0lp9arcI5QuX436/2y3ET8mHo78jKw5Up39hXs=;
        b=FS2mTucyt+7hDVduTy5Y1l4QeP1clnIx/+zeRV+vETS2JU9NqbzNBFMrk0xCuNYLpZ
         gYZtyJveLv9X5W+TPPtOeYX1tLLWcZ/JmT+ye0KkbbNTzPmlOHSjHf7qPGhqU+NSzeWk
         p2jqcjPveUNo4yAW5gA+D0EKuntQt6dh2ry3747Cbshmb3c7tgy6+sj8yCFwfJpBHeYY
         wQBVAxZ7jzTy1Vdzg8RmnaowPpMd3wCPfM2dYBgPl2kfot/w5TXjJHZWSyDdY182ynwF
         T9M8JHC0zh2+idHdyz9HIW3S6IeNdYAjC1I7t1RmYG8T4kmjosYzlM3DUlWbVlSO7uC1
         0S+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791657409; x=1792262209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hW1Or0lp9arcI5QuX436/2y3ET8mHo78jKw5Up39hXs=;
        b=uQfCPyXF4kPUSJhh8EtZO1ry3esZ5tILrzRvWgqpYwb8tYHTrOd0jMgjvzD2G0Ims5
         q7lPHb/xtweWwLT5ePgOLURMWFRp7RbZArVpvg+bZiSVDTv+eJV8C+G6RQP+0OoOReZS
         hbKqUZod1YSqqwRUe1nec6lrOIOJVB73N8YEjRH7hPcO/DK57y4E0w8z1QPn9Z8sSrCw
         tjRv/GHl5nTi2d887E8fegq9YvxflK2DBh0Jya3QxWmpoEXKH+d5r7RR8d3yT4p/dkxS
         HOkLDyqGbJ6PjgNdg2XkyQ39uhPjMzSWJ0j0PvuuPCWFLVdCupB0Qs2fHtdE7yzCqlxL
         s2tA==
X-Forwarded-Encrypted: i=1; AKwUvByINFPeoRVSTgXptg4VzxwzAtIdEbUymKeeCYCsszTLVJ3HGCS64X0kmHcaohsgF2OAFvM6aWUcp/c33Hk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0bQrRtd0ZMlXrP7XHqO7hhsr/7mDs/dOCMf2NiMpkYmNcoAxv
	HNm9BH1P5evNwAuO1RffN+EjqvOgigQ+2lhI1b9ckQTFPTrKFsk46Uod
X-Gm-Gg: AYBFou11q0Kx95mv+HJwldDUW36LocvGSUaRoYRT/9XSM4PM1DhkF9PLpk6KU5GpbZP
	/JxjjPgLH7utulBbX1m/ltQe6DFhNpFib8/YEdeq0AOG6lOkXA6MnP+6cd+qJ3wl+Hf/pmheP9h
	au5bgcyi8edos2OLjZ6e1jlZyWKS5ZK9kzLYOYtBz3GsJcRlhj6lsiGohdd6yAuf4scBBAQVICq
	eafoyfvc/oOX7M/IpKzQYBgQm91l5Ap7SycR92j4kXnqPG9VU+km2JT9GB7eE7jgh8qw450fEBN
	0kBD629tx3XiGhHlG0g/BfX0vrG8ED97PZIJocun3/sLVWwFvdNe/wTpDW/Em+tZvjXI8As/lHn
	CChiOZnhaDdusVjcOglA4x2BWyqDq7m4sshgfpx60PoTyVV/nArEEKzKYvlV/JbGpl9C4VIksXJ
	jjT0VfwvOGOOsZaagUnUWaBAWEwswzj3Uh7i9pGx0QCeujJWq7dPJJSlQEISV974/15SjgJPwAz
	Q9mj9SNshUF5Yf0WhSE4SRzxuA=
X-Received: by 2002:a05:7022:1584:b0:143:4d12:396d with SMTP id a92af1059eb24-16a61a6def5mr10483700c88.26.1791657408704;
        Sat, 10 Oct 2026 11:36:48 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm16217110c88.15.2026.10.10.11.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:36:47 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	fiona.klute@gmx.de,
	kvalo@kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] wifi: rtw88: 8703b: avoid converting RX SNR twice
Date: Sat, 10 Oct 2026 18:36:29 +0000
Message-ID: <20261010183629.39748-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

query_phy_status_ofdm() divides the SNR report by two when filling
pkt_stat->rx_snr, then shifts it again when updating dm_info->rx_snr.
This halves the SNR used for diagnostics and average statistics.

Store the raw report in pkt_stat->rx_snr and convert it only when
updating dm_info->rx_snr, as the other chip drivers do.

Fixes: 61a486bcd782 ("wifi: rtw88: Add rtw8703b.c")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/rtw8703b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8703b.c b/drivers/net/wireless/realtek/rtw88/rtw8703b.c
index 25456f0367b2..1920277d626f 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8703b.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8703b.c
@@ -959,7 +959,7 @@ static void query_phy_status_ofdm(struct rtw_dev *rtwdev, u8 *phy_raw,
 	val_s8 = phy_status->path_agc[RF_PATH_A].gain & 0x3F;
 	pkt_stat->rx_power[RF_PATH_A] = (val_s8 * 2) - 110;
 	pkt_stat->rssi = rtw_phy_rf_power_2_rssi(pkt_stat->rx_power, 1);
-	pkt_stat->rx_snr[RF_PATH_A] = (s8)(phy_status->path_rxsnr[RF_PATH_A] / 2);
+	pkt_stat->rx_snr[RF_PATH_A] = phy_status->path_rxsnr[RF_PATH_A];
 
 	/* signal power reported by HW */
 	val_s8 = phy_status->cck_sig_qual_ofdm_pwdb_all >> 1;
