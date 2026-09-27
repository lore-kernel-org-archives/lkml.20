Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com [74.125.226.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BAE2DB7BF
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790471870; cv=none; b=KHFDpffhjIeCe/fFcmvmShB0Frh+7GthkmKC+edLIAxcgQDMkMsu5tCyLnrN1XkgsrN6iysUMHskHtzD8YUdc0POBotOH78aj/F6pZfPXoNoI7btl8nL3oRv3WyL5uo0lRh4aV9RHpYALQRP1JjS1SCg6jDlXl2jDnO71oDWJ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790471870; c=relaxed/simple;
	bh=N6271wcUxP5BDK/+dDmxvzUtyqOKTcvOanJ4DEE+wZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XUcf6D3Uo5kuLorxWsv9PQ3NKcRkFFRoZYIxDLU3tKSN7XF3oITNWWfmuwLDKHjuIXyk7oF1SWOuId+BVilA7daTEVLmpoMnH07Zgr91v4TYkFANwB7ePDmML/xtnU9enH7Zm2er+bvLIHEGq0j3rYKsRF2RX7GEiLv64G1p3Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pXVrVPUH; arc=none smtp.client-ip=74.125.226.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pXVrVPUH"
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-9863292a2e9so616346241.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790471868; x=1791076668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYVl5EqQ3p/o2mPal8Kno9pZP083cJ868GdALquLAvM=;
        b=pXVrVPUHpoFpcGlv/C0TGuinJ6tAyFwMq6zo75mg0gbJ78dDJDhx9zumJUa4h7RVlp
         6xA8c2s1j8jH5lQ8Ywtl6uofIeZlEA31IAJNNxQ+mgU/kXWVnctBBF6ysVIxpE1tfVD/
         HAvs+qJ8ya2Ca5XugLekff+QLKqN2NCK9V0q2qnBSdD3M7xO7g4aeT5TAd9SOqRJglxh
         JtmwMOfZYGzupGEXwjCJV7ieDyCwyccG2e1IXBzDzOgk4QMetchPyd7347GPxR1LPxV3
         tdiGjEXx9NqyYAWQ/hQTVwUIJIY9rh3DVAojE03J55eZa30JQ7hNxSb2DYH4XMVP6WIC
         48Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790471868; x=1791076668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYVl5EqQ3p/o2mPal8Kno9pZP083cJ868GdALquLAvM=;
        b=K6unX9nO0DkmE3Y0IF/EOKte2U4kxuv6E6jHZyIZDUQmtiZJYBhpqRKLndhD0Vyr70
         A1n/l9CppAwkcLAcGdDA0VDGovuywCPdUCr4ZB7AcpGGF7MbXFnwYcKoFClng+8QLCyd
         hyUw9rpMTAeST7gO7mtcD0WLJxXzT960KF12Bkngm6CLh9C/3dU0neoEDXgA8eteCr9d
         ihLwbRPBm5LtO/WmgduBNDIj80OUv5VRl5sV43joEpZP1rAJuOWbQ4/W++2BGWFUD/4q
         kOrOMUsNxIHpp0fubZxh5/eeFiVE+Pskjf3YywywPPJ3dAFdg+rQFZEhtqnpl/8iyiPk
         0TMg==
X-Forwarded-Encrypted: i=1; AKwUvBymfgQ7nlGWU1kHGJeUhuZwxupStloOECZgnneDtnVkKo5Sbw7BFYXoOrohURssUSz2HXMnPMB3kRQGG44=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpH+JBhz7lxtL+egy7CTUze269uZpB7/1jDjZHA6LDSR/pRiVe
	HltgU8RBBv1b3cPTw/sHlm1ykEAW7sOpPAIlJvRFoQeFPTi6FzlpzMyB
X-Gm-Gg: AYBFou2dRAl9PxifkuxY2xDfscSFJczu0fqWXRONPe/BP+DBi9q/hPNhTaqHjg8UIxe
	qPERIa9jJpxj8lywj2WiGPtMnVlAPvF1j0bKIshlzyT6I/Wf+DtAUm4vkhvXpAvfdIsXoBPKUbS
	zvtIhke4JKK8+35ERGeL0K+B1jHQ2SctdO+asDDTz+4yGfjhc1lykAO1sjqH42eBedzQskMQVZv
	kBTQeFnuA/BaMd5oFBSuM0lx/rToTNtjWq8w0PkzXS4QfkZ4NI86+sv1hzidauikqmQPX5ieCtk
	ZSxsI56DHe+S7s4NwqosIOIAtZRrl+L+vLmXBBAHlFMdI2q09/NfLFv7YR7EVfKoSCQuurQvy0k
	78nPfrrmQ9xMcy5GhjeHBIzck5KGnVJMana/7eJCJszvTYosJ0YA7Hf+dHcNNEDAmtLGYEmoND9
	evrDKlPgjQWFh/T147CpF2SjCcU+6haZ0ots3/GTkSmyHj2zmlriUNiS0=
X-Received: by 2002:a05:6102:549e:b0:7b3:3b4e:e4 with SMTP id ada2fe7eead31-7b33b4e251emr1157245137.2.1790471867803;
        Sat, 26 Sep 2026 18:17:47 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:78b3:5cda::1002])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b1d413asm820433241.10.2026.09.26.18.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:17:46 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Sat, 26 Sep 2026 22:12:25 -0300
Subject: [PATCH 2/4] staging: rtl8723bs: rename local vars in
 phy_tx_power_limit_to_index()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-rtl8723bs-tx-pwr-limit-v1-2-989dcbc113fd@gmail.com>
References: <20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com>
In-Reply-To: <20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790471854; l=3820;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=N6271wcUxP5BDK/+dDmxvzUtyqOKTcvOanJ4DEE+wZk=;
 b=K1p2fmh+1sCg4n+Ib2KyJH25agNDWOOZVEK/doy/nhwOqxFK5FeLfB1bJUFJV3/eb6YGoBne3
 oVgm6OSh2KwAafLasYkaLV+sRxN4CI1jNTRm66pkZs15WKiKg3r/zwc
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

In phy_tx_power_limit_to_index(), there are many mixed-case names and
needlessly verbose names (such as the iterators, in other realtek
drivers they are shortened like in this patch, by renaming them,
accessing the TxPwrLimit_2_4G table takes less space), rename them.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
Renamed Variables:
	pHalData -> hal_data
	Adapter -> adapter
	BW40PwrBasedBm2_4G -> pwr_base
	regulation -> reg
	channel -> ch
	rateSection -> rs
	tempValue -> tmp
	tempPwrLmt -> tmp_pwr_lmt
	rfPath -> path
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 48 +++++++++++++-------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 1228be0cbc839041384f3e434d22b4f039d69986..6d8e3b26da6d29863bd0f4f43fba6abcdbdf5c9c 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -739,35 +739,35 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 	return pwr_lmt;
 }
 
-void phy_tx_power_limit_to_index(struct adapter *Adapter)
+void phy_tx_power_limit_to_index(struct adapter *adapter)
 {
-	struct hal_com_data	*pHalData = GET_HAL_DATA(Adapter);
-	struct registry_priv *r = &Adapter->registrypriv;
-	u8 BW40PwrBasedBm2_4G = 0x2E;
-	u8 regulation, bw, channel, rateSection;
-	s8 tempValue = 0, tempPwrLmt = 0;
-	u8 rfPath = 0;
+	struct hal_com_data *hal_data = GET_HAL_DATA(adapter);
+	struct registry_priv *r = &adapter->registrypriv;
+	u8 pwr_base = 0x2E;
+	u8 reg, bw, ch, rs;
+	s8 tmp = 0, tmp_pwr_lmt = 0;
+	u8 path = 0;
 
-	for (regulation = 0; regulation < MAX_REGULATION_NUM; ++regulation) {
+	for (reg = 0; reg < MAX_REGULATION_NUM; ++reg) {
 		for (bw = 0; bw < MAX_2_4G_BANDWIDTH_NUM; ++bw) {
-			for (channel = 0; channel < CHANNEL_MAX_NUMBER_2G; ++channel) {
-				for (rateSection = 0; rateSection < MAX_RATE_SECTION_NUM; ++rateSection) {
-					tempPwrLmt = pHalData->TxPwrLimit_2_4G[regulation][bw][rateSection][channel][RF_PATH_A];
-
-					for (rfPath = RF_PATH_A; rfPath < MAX_RF_PATH_NUM; ++rfPath) {
-						if (pHalData->odmpriv.PhyRegPgValueType == PHY_REG_PG_EXACT_VALUE) {
-							if (rateSection == 2) /*  HT 1T */
-								BW40PwrBasedBm2_4G = PHY_GetTxPowerByRateBase(Adapter, rfPath, HT_MCS0_MCS7);
-							else if (rateSection == 1) /*  OFDM */
-								BW40PwrBasedBm2_4G = PHY_GetTxPowerByRateBase(Adapter, rfPath, OFDM);
-							else if (rateSection == 0) /*  CCK */
-								BW40PwrBasedBm2_4G = PHY_GetTxPowerByRateBase(Adapter, rfPath, CCK);
+			for (ch = 0; ch < CHANNEL_MAX_NUMBER_2G; ++ch) {
+				for (rs = 0; rs < MAX_RATE_SECTION_NUM; ++rs) {
+					tmp_pwr_lmt = hal_data->TxPwrLimit_2_4G[reg][bw][rs][ch][RF_PATH_A];
+
+					for (path = RF_PATH_A; path < MAX_RF_PATH_NUM; ++path) {
+						if (hal_data->odmpriv.PhyRegPgValueType == PHY_REG_PG_EXACT_VALUE) {
+							if (rs == 2) /*  HT 1T */
+								pwr_base = PHY_GetTxPowerByRateBase(adapter, path, HT_MCS0_MCS7);
+							else if (rs == 1) /*  OFDM */
+								pwr_base = PHY_GetTxPowerByRateBase(adapter, path, OFDM);
+							else if (rs == 0) /*  CCK */
+								pwr_base = PHY_GetTxPowerByRateBase(adapter, path, CCK);
 						} else
-							BW40PwrBasedBm2_4G = r->reg_power_base * 2;
+							pwr_base = r->reg_power_base * 2;
 
-						if (tempPwrLmt != MAX_POWER_INDEX) {
-							tempValue = tempPwrLmt - BW40PwrBasedBm2_4G;
-							pHalData->TxPwrLimit_2_4G[regulation][bw][rateSection][channel][rfPath] = tempValue;
+						if (tmp_pwr_lmt != MAX_POWER_INDEX) {
+							tmp = tmp_pwr_lmt - pwr_base;
+							hal_data->TxPwrLimit_2_4G[reg][bw][rs][ch][path] = tmp;
 						}
 					}
 				}

-- 
2.47.3

