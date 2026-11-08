Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162575;
	b=wH//cxNP+r2CZTiGeDZa3zHP52H3/mMVVkp0pxrS3hVjaQbzg1tLMmlwkbfZD0whdBUI
	 gUzd01Dp8O6SrjrK5dgl2k2ll48Ofe6C4dsSoJVuyrMPDD8ueBY6Wze/OoLDIYv2rWpeF
	 rfA7ldslg9quLF5cNbBQwzwOV4s/lD1TlMmOxG7VzZ+6oO0bRag/NeHtVwWyaPZ3THKKu
	 DjKpsLXPWULEdaeyjIhpHPMyKVmUMiyDdv9lTdISH/FX8rlo4usKRTNN1huTG+0ZA02ZB
	 Mt/yqvRMjvCGZnrx9P9O2YqmpFU7IlJ7dpOY06bVlMniyVOHWmLzf2XGvMVhknmSarg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MdEqkKSdZF8rNouTB1DOceTxdJHEgpqHYMARfNT3BWE=;
	b=INM/FGeBremseYt3bkm5InDwv/USd8UkPSxHj15IQmiUNgDkiWX2NvOosFe6l09jANHR
	 ThCRbTTeJfHFTqZrN71hs+CWmNZ9EzyP2082//LYsw087layFIPQmW3QcwiE91kpzUbWi
	 qZQq41K1qumXpq1BGkEPP8kRfNS4Elx9ozUlxHnUhXydNrvTj/0e3lKxfoTa8eSRSYyao
	 0hIMydRBUiCyKSRq5SdYVa0agqupcP9lk+7ngh/NecXQrcxMKhW2cdY2u+yiG4nSg6fjW
	 PlQ5un/pt1J9oUi3AM43bViXyz2yaVtaWzcy7iMgVfA5h3QszJ0eIa8aRLzrjR5WxVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ttbBnHyp;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855B7606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855B7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ttbBnHyp
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so64134b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162575; x=1794767375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdEqkKSdZF8rNouTB1DOceTxdJHEgpqHYMARfNT3BWE=;
        b=ttbBnHypf5CxMR05XVMr6MYTSiXBM/zngM2uF1jVCCFwHmqcBFpMYOYVLeCpFhX+4N
         T9KMzxyotCkf1KMDz/0HAp1JyaK6iJJ7U1fx+3ekaEn4ree9rUcjT7bDlJB4YzjWPHuK
         mmsZFozCLJHk3GdMvNRCcyyDOY3NHHoObh24IsOWvfGn2F7c3umz0IPUOWIRYZeBJDTe
         Zvq2GU6ofLQ26YKg9dcDUGNDQyLV07151SaQhL89N3zwXc3bf1cqgjYuLdak4jRG0AP6
         A//zdDvmamLxIw5qsS6hclYiOCV3L1lvELNDWFDaAenKP2XQqdo2HtX2IChi6IgsHaHz
         UiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162575; x=1794767375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MdEqkKSdZF8rNouTB1DOceTxdJHEgpqHYMARfNT3BWE=;
        b=ocwEcSrZxnX9juoe31SHtFpbcqBdKCGk1HIa+ho/HX+m1v0kqV7U8L3zyJ+XrDRFLL
         ZPgwV0mAUmmyoQ35dK7r63MrnfYM4b+ptl0eHL1sIits6UGYn6DOvpg1XVKFQ5tr4rJS
         EF6JydxtTyILGo8LcHz04yq796RgK9e2YaSpxcFf5AgxxSTWl2z0ujj39ZZDAZ7956ea
         AulkcaUfsUet7hlFLEFIm3EpCLBGh5DwSbqqO7raBdaqRwSuKqGAYTLiANeu+a74S0xe
         Jj5/AEjVB+xoiwdGlT+f08vjTZUmS21AK9+OI3wY1XKvVde2qofNrCFnVY6AGAacrSbe
         PUtA==
X-Gm-Message-State: APuU4Z9/4ztbZPNcDo94awsGv6xeJKAsHE6Tm/MfAzKnj1dyyoLX8731
	DHH61mN42uMARUe+MRDGWoGYfIrWG50ZQahEmZQLa1eiOltvDkYBzerk
X-Gm-Gg: AYBFou1SOO1SPGWJ8NZ5HM4IOGfyqL/aEas2Jy+z62PA1/3ijiH7uZBitIhsn+LA/X2
	kLco/XXuPRNEb6cdbfpTqYl10cFWeF9pNSrmNDj8Bm00Ux2Uxn5aUnSFQqirCDd7IyM68rvLtyu
	ah/altcB+d0ln30UEZH8+gXweJALh0ghEYz04ATkIheDrZdu7WVD9Z/jxMs5c6BANVqfnNE5Pnw
	5qpCveiUX6FO7M2WKwhOOGTyPNk2bLqLV6CfuyjQYVl6T9Im+MFx4hpjUfSoWVW/dpwqkqsPG+/
	sy5ZRd2kwBdA9lcmMJxQC2MVl+3httkSNiX0v128c09xbxu7ATnwMgkeqoZNbWgZLEjTVxt65kW
	VcxpEHd4gvEmvW4EvYQrZm+pu9UNCkvqE+m63xPPRKByOOHnrXrhjs6XD4itjPM9ZToh/CLlbbN
	q18nBSeA8Dz+snqA7OYdWjbmqOhAY20Ih5A1ITkdHhgKDGYiSJ4IXLpVkHFu8rpz3c0kMYvkTU3
	/yW0XNsjVnfNPd5jHb6i72YOGduO1Pp/4AgN6sbXOF6J+ugpHK5jMDbkCowjxn2fDgSVxsq1YE3
	KITERpHiBv4w0fCt5/onegvJqV+44l84tA54iykql/DkvdujZ8soB8ghckN011qqBjxYszUUqex
	uqSbKEz5wIAGDaRIujBs1xJbKBWp2
X-Received: by 2002:a05:6a00:339a:b0:8a0:1dab:fd50 with SMTP id d2e1a72fcca58-8b66c4017demr1724424b3a.20.1794162574625;
        Sun, 08 Nov 2026 10:29:34 -0800 (PST)
Received: from localhost.localdomain ([2401:f40:1397:9:5496:ab84:534b:ad67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b6498209a5sm692938b3a.36.2026.11.08.10.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:29:34 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH RESEND rtw-next v2 2/2] wifi: rtw88: 8822c: ignore nrx values without CCK PD registers
Date: Mon,  9 Nov 2026 00:28:37 +0600
Message-ID: <20261108182837.682661-3-zeshanahmednobin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108182837.682661-1-zeshanahmednobin@gmail.com>
References: <20261108182837.682661-1-zeshanahmednobin@gmail.com>
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

rtw8822c_phy_cck_pd_set() reads nrx, the number of CCK RX paths minus
one, from a 2-bit register field. The driver only ever sets it to 0 or
1, for one or two RX paths (see rtw8822c_config_cck_rx_path()), and
rtw8822c_cck_pd_reg[] only has registers for those two values; its
entries for nrx 2 and 3 are all zero.

A device that stops responding can return any value. On USB, a failed
read returns whatever an earlier read left in the buffer, so bw can be
0 or 1 while nrx is 2 or 3. When the level then changes,
rtw8822c_phy_cck_pd_set_reg() gets past its WARN_ON(), which only
checks nrx against RTW_RF_PATH_MAX, and calls rtw_read32_mask() and
rtw_write32_mask() on register 0x0 with a zero mask. Both compute
__ffs(0), which is undefined, and the write puts back whatever was read
from register 0x0.

Return early when rtw8822c_cck_pd_reg[] has no registers for nrx; bw
has already been checked at that point.

The fix and this message were drafted with an AI coding assistant
(Claude Opus 5.5 by Anthropic), then reviewed and tested by the
submitter.

Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/f6a7d3272fe7635c6a83698dfab5d85500437ca6@linux.dev/
Fixes: 479c4ee931a6 ("rtw88: add dynamic cck pd mechanism")
Signed-off-by: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
---

Notes:
    Testing, only on an RTL8822CE (PCIe). There a failed read gives all
    ones, so bw is 3 as well and patch 1 returns first. A debug-only change
    forced nrx to 2 on a working chip instead:
    - With this patch, in 12 s the function ran 6 times and returned early
      each time. rtw8822c_phy_cck_pd_set_reg() was never called with nrx 2,
      and there was no UBSAN report.
    - With the new check skipped, rtw8822c_phy_cck_pd_set_reg() ran with
      nrx 2, and UBSAN reported "shift exponent 64 is too large for 32-bit
      type 'unsigned int'" in rtw_read32_mask() and rtw_write32_mask().
    - Not tested on USB hardware.
    - Build-tested on rtw-next (dc16902cad9c) with W=1: no warnings.

 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
index 6343568285bc..acd192684bb1 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
@@ -4413,6 +4413,14 @@ static void rtw8822c_phy_cck_pd_set(struct rtw_dev *rtwdev, u8 new_lvl)
 	if (bw >= ARRAY_SIZE(dm_info->cck_pd_lv))
 		return;
 
+	/*
+	 * rtw8822c_cck_pd_reg[] only has registers for one and two RX paths
+	 * (nrx 0 and 1); its entries for nrx 2 and 3 are all zero. A device
+	 * that stops responding can still return those values.
+	 */
+	if (!rtw8822c_cck_pd_reg[bw][nrx].mask_pd)
+		return;
+
 	rtw_dbg(rtwdev, RTW_DBG_PHY, "lv: (%d) -> (%d) bw=%d nr=%d cck_fa_avg=%d\n",
 		dm_info->cck_pd_lv[bw][nrx], new_lvl, bw, nrx,
 		dm_info->cck_fa_avg);
-- 
2.43.0

