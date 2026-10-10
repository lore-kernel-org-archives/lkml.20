Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB09285061
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596000; cv=none; b=NzmgMvYdrcC7x/RDK6YBMpTJ69dgNmYFtzO9Akf/tDxk8MiLtaJRXUXE85xwysPmyIWPi5BgsQ0wcvs1W70AJRsgavOKoX5UCI2BSEMtSX+4Zas8co7p0Z7hTBTOqQOpEJP19gXLlf7U3gSJDJCJFC3wlODc4i1fAuwo024iFtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596000; c=relaxed/simple;
	bh=W8LFsO+2HedS9IfAqqR7pCD+65AjPcztGCfVSkM3S44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o2fSs7/mMQk0LOjsSlaomDAjHQ8hAMBxIkWb3c2bYzvAEHgcqa+epC8X3+wgi/+/0vjPq3MwF4PQPoTxYiulx7MS82cKBVF9/Q0ROcRZIlddFIIlmqvnRbrqLn8qG9/HFpHIM1VRlavCNfvV0Gc/pak0NNFxWzCTNDByqOXbPZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0Q2k4JE; arc=none smtp.client-ip=74.125.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0Q2k4JE"
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3514b7a0a23so250915eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791595998; x=1792200798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TYNJORrDxBHQtMPkA1zUuM38UvfAYRpfyykn+oo1wjI=;
        b=A0Q2k4JEPJHf0jfeJ1uVpQauY5Gx3u2pi6WAJne08Rb1CzRGmSCqvU+O4A8lAzoTFS
         GIK/yLdh80FcVtdY1mZUOL6rm7PSj929LmJFIJbQEm9ja8jqD2TzxjzWnoCfeptiTDc1
         Sj6blMlb1ns96VZrQT/W/C3feOHBOvRO44j3XAcu/E9OI0ch219MjZT+4ZfVQdP8Q6kT
         HvR19cvLqW6iGeFHi/B59tc4LJFWVd8oUnkHA6nCgXU/UzmyLuEXE7RuoAcT8WJRCojr
         mH+pBxS0YbFEPVa4r6ZnyjDI9fB7Tjqqlkh59SqE5MR02oIIzrkEe7Zgk/EeZtUKknDH
         Xr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791595998; x=1792200798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYNJORrDxBHQtMPkA1zUuM38UvfAYRpfyykn+oo1wjI=;
        b=aIWNLLakh+AbYFid9BNbL824k5EarhTpijpe+90YJhBsn1TgloqVLIjqndzyFheGw/
         VG+i5TpaXi4+9UGhLDy5wC4nMA667TSSy2ldfyDxVQHaNkkOovOU7dFKRth0jpm2/Sdo
         WsD2VK4pyPj+u0hLMmul0oDTAH9MhmB97pxWaRAVj7eIXppU4BiBc4nUP7hvPxQ2tI16
         Hr0Upk7HG6QxDOJZhjPwEhJfnHSz/R5VVupjCes0mww2zYd2ssmN+xqg1bC8Tu0jkVGK
         JycolGKx0HWMBVUcRhRZ64PkOnAozJGILG24H/zz19pLoofiif1LF/s4Pa8mM7WG81V2
         +4Xg==
X-Forwarded-Encrypted: i=1; AKwUvBzijqD4yL6isOkAmhJi3s9DGgel0o+WdiELytHiuiUQwrxIyyJ48L7lofIckt0Ewu1HZVwjdaTvfPvs6oM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfQyqMNfaCURf7Lexw+SLWbFSKsci3bVabDIQ7ji0zhxToV1kG
	funx/TU9OpjnfKw+z0Fy6uoDmUVUL21rSz9EuG2H0wnHrJPouTTzRet8mg65A8mh
X-Gm-Gg: AYBFou1oHcnJdaP1byRmelitFSre68TAx1KH2Ffha5p80F0d9yCcj06/B4+0GudDMlJ
	g0sdL0N/TJLkLn7A1bHxXsZYJIghv2vmxY5iayQc4Zkz77g+gUbNyFu15KixyCuVH2EC9ST2oUo
	Ahfo1SIxYwpiWnAOYlZsM/5bsyvVZnXnClgRp6hriwwRQbc5HyzoKboVawqiZLaq0QvVntyYgtu
	3W6+sLhANdidAgEyddeXZ1QMx3w2y99p+J8ImBiZ1N94kTRIsJO4eWFhgXgM0zsVx7FsscGEAAr
	MUVdn7TXctwgwgI5CjP8tjYRfhPvoTgbhSEKjFiIIcYYSewkMO0cMDT8eTlUkkWhFIzfUQ66IQQ
	oiyeA01dAfUBcImCC3+YPItaulP9Y4KJjEMayck/ld7XFy8KDHe0IjIDSOeWX2k0tQvfLDSHJBw
	5Da6YVEbZ6y5oVikcRMDCJp3ppJmorGSA9EWzB1w0FAc4qO0iZnqdnyFdEWURd1Qs+fe/Fyjvqm
	lJRGNOvZHKJW3/ZjSi0QiI2HVGKbqjyjfgmiw==
X-Received: by 2002:a05:693c:2504:b0:343:f1fc:9006 with SMTP id 5a478bee46e88-3537e039619mr4628702eec.30.1791595998211;
        Fri, 09 Oct 2026 18:33:18 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1d6e6sm9820634eec.24.2026.10.09.18.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 18:33:17 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	rtl8821cerfe2@gmail.com,
	straube.linux@gmail.com,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] wifi: rtw88: 8723b: avoid converting RX SNR twice
Date: Sat, 10 Oct 2026 01:32:48 +0000
Message-ID: <20261010013249.35584-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw8723b_query_phy_status_ofdm() already divides the PHY SNR report by
two when filling pkt_stat->rx_snr. Shifting it again when copying it to
dm_info->rx_snr halves the value shown in diagnostics and used for the
average SNR.

Copy the converted value directly.

Fixes: d726c70ce082 ("wifi: rtw88: 8723b: add the RTL8723B chip driver")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/rtw8723b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8723b.c b/drivers/net/wireless/realtek/rtw88/rtw8723b.c
index 8bb9c03d769c..197add7cc110 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8723b.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8723b.c
@@ -1291,7 +1291,7 @@ static void rtw8723b_query_phy_status_ofdm(struct rtw_dev *rtwdev, void *phy_raw
 
 	dm_info->curr_rx_rate = pkt_stat->rate;
 	dm_info->rssi[RF_PATH_A] = pkt_stat->rssi;
-	dm_info->rx_snr[RF_PATH_A] = pkt_stat->rx_snr[RF_PATH_A] >> 1;
+	dm_info->rx_snr[RF_PATH_A] = pkt_stat->rx_snr[RF_PATH_A];
 	dm_info->cfo_tail[RF_PATH_A] = (pkt_stat->cfo_tail[RF_PATH_A] * 5) >> 1;
 
 	val_s8 = (s8)pkt_stat->rx_evm[RF_PATH_A];
