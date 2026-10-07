Received: from mail-wr2-f8.google.com (mail-wr2-f8.google.com [74.125.225.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A684488234
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364116; cv=none; b=FmQPrMx4N0N6+wOnvo7Mvm6kgm6SWMN2C9hjVW+MVWMVkBS9zoiZkYAHV8DkAmC+Jay+G8aOqyUFKdq1ZnrHR1UFDqYKWkq6O172ach49dir5PXNK8VtCzEEI62uGaogaNxDb+z9K7IUmljXuFdJEZTk2YZjPQjI5sqmD0XRHeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364116; c=relaxed/simple;
	bh=Iml1QbnlqCsImldvUItgITZM4aMLyofyPCEAET/GTHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kbg+UgXRi6CdNdmyOirzDS5Q2bSNNQ29s8q95C9uWRXmUCiP92sOAYEk2TCt5ZwMS/16+Kkin9axuAFTIVJIsxON150EVdlkBvB8xBATth02cQESwBVt3VW3WBOOY1fDRgdnhCynRCUHzzMbhxSfX8HmS8vyp+2UNNINmIsz5b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0FihyFR; arc=none smtp.client-ip=74.125.225.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0FihyFR"
Received: by mail-wr2-f8.google.com with SMTP id ffacd0b85a97d-48b0241a47eso1183027f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364082; x=1791968882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21GOvkqxxTWxzFp+iVaOLS/XH826C/MhWojUk88acI4=;
        b=C0FihyFR1Qg0RfvKSRdtFa1K4apM8T2385PrXTxXed5JV3uEDPZDIpBOR1IOmEXkRP
         twkTVetknOtRn/EYXdVGWNAbhYqPZDwJIxFe9tiIDijNY457v6GFpcwWvzfLY288ZB8B
         NOVOwk7vNMzIEfaSd/C+7oYD8tkYYiPiVYiObiHUeiO9MaMI/VQphzc9+sgYje11NBsg
         9WeOZrLJX1TpT+yBYr1JJFAOrRUZKqgzVFj5pzuUl5oGLvbfspdFe/Jr/R7ziHWrqsMP
         2pv80lefXSILqXOpTvs9q5rFKw2CSdZckR5LB41r2Cdt9XG3Un8IiqEJD8Lagxp+mSO9
         8JCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364082; x=1791968882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=21GOvkqxxTWxzFp+iVaOLS/XH826C/MhWojUk88acI4=;
        b=v9ucts9OOUsejqlJgBG1Ow7FVXucXG7C8aLoMes1khPRFAku+xg8kUlf8sik1UW/wA
         XV6bLi8UP4Dl7oXqLHri13pu7Istj2QeLxuJ2EDrcrxyaA+nCX6tiu8lgVKw7A87NaJv
         wCEFpAU16Ta4rTB7K/bM+6BL8Bm8E3ZfMZjJNeSoGxc35v8cgNhHAh5JZje556ICDTR0
         lD17B+kFc/MsJjIleOqxJ1jlR3h9DNgURNCACos9GLONdp1+V5awJZwnjx/UFQROc/ir
         Hc0wba1j+sVVhzRUSE23Cgo/xSwwUqcssJkbuLx6QTTMJfh8EtF+bU1rdcU2VZPoti4K
         Q2UQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhQhoqm3XpAXMeIwtWM1oqYV35rbrK8rWUSQGEamjQjufsquMl4KBoiqbia88J23I2uB8ISmOVVCCvV7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN5yP7FFsKa2MOf5ZLsA0ygXsDrawV/WSJ8uecOwObnN2C8yge
	6Lvmqu1WXU8T46OuyKnagzWZfXbC3uIqDfyBINU/MBVWifcwR8nHFc2A
X-Gm-Gg: AYBFou1HRwvsOMpVHxM+2VTWWmCnFrnRRfY397XTViUNooa3nasJR9o+Utgm9SOoGj2
	rKf5J7228W7Nv16G6qO3TSOgEcx8c6PCoJx9RFVLH5ocqVdqvk7iopIifaVI9/NKC3TxAQmH5bD
	fo/4BnFsixVbLL4a/oZWsGWs7uYpZCvrYwRqnxXSkmGl73WNOfYl8i19NMx1MOl5QH3TmPo7jkz
	4JcS4ybqxcJ1kFDElQ/wAFGlwwxX1vCBWNqbkrLeiXPGFF3zc4evO/5CI6noLW4pvXKrUZO50mO
	JwiwbU1M7BiTQ3Wa+7kJJMRmoO4CMzbAi7Kl4hhw/2+7AGpe2ME+KbHM8l5uVv5/WDbVihJPfZO
	r13PyWcLiWZGd1Pu6vO6Y0fPtJDEWEIu2L1JQ2c5Wl5agrGwRk42sIsuZiiOS5HPsgvv8i0K2ki
	SEjIY3k7Bi+JKDLwIfkHGeDQbX5mLHkFM7Uc8RiwS024bF3LjBaJbk/E2VlwHDRFB8EWAA3ll8
X-Received: by 2002:adf:e19d:0:b0:48b:e50:715a with SMTP id ffacd0b85a97d-48c7277813fmr3024868f8f.34.1791364081889;
        Wed, 07 Oct 2026 02:08:01 -0700 (PDT)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm3975319f8f.33.2026.10.07.02.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:08:01 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH v4 1/2] staging: rtl8723bs: rename struct phy_status_rpt_8192cd_t to rtl8723bs_phy_status_rpt.
Date: Wed,  7 Oct 2026 11:07:35 +0200
Message-ID: <20261007090736.277636-2-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007090736.277636-1-timo.joannin@gmail.com>
References: <20261007090736.277636-1-timo.joannin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct identifier references the 8192CD chip while being in a
rtl8723bs codebase. Additionally, the identifier uses the _t suffix,
while being generally reserved for typedef identifiers.

Rename the struct to rtl8723bs_phy_status_rpt
across the rtl8723bs codebase to accurately
reflect the driver and clean up the naming.

Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 3 ++-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 34b0369a7936..bf2479c01873 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -105,7 +105,8 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 	bool is_cck_rate = false;
 	u8 rf_rx_num = 0;
 	u8 lna_idx, vga_idx;
-	struct phy_status_rpt_8192cd_t *phy_sta_rpt = (struct phy_status_rpt_8192cd_t *)phy_status;
+	struct rtl8723bs_phy_status_rpt *phy_sta_rpt =
+		(struct rtl8723bs_phy_status_rpt *)phy_status;
 
 	is_cck_rate = pkt_info->data_rate <= DESC_RATE11M;
 	phy_info->rx_mimo_signal_quality[RF_PATH_A] = -1;
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
index ca3380328a72..ae010cae9dd7 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
@@ -18,7 +18,7 @@ struct phy_rx_agc_info_t {
 	#endif
 };
 
-struct phy_status_rpt_8192cd_t {
+struct rtl8723bs_phy_status_rpt {
 	struct phy_rx_agc_info_t path_agc[2];
 	u8 ch_corr[2];
 	u8 cck_sig_qual_ofdm_pwdb_all;
-- 
2.55.0

