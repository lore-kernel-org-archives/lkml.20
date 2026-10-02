Received: from mail-dy2-f16.google.com (mail-dy2-f16.google.com [74.125.229.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C38F3546C0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914107; cv=none; b=XRMwSvrpbkcqdE9xZchCkxYau8ija1vXm8YjVxKhQwzOmcepKmOYPoCevB732UJp04k2mTygp11FBDvNK2Er1fvRtyAEjgrdHXh6wi7OKkI6QyBhAmnxw0wD+Eu2iGIgenH/WTCuO9Gi4Pst5qkAkTy2ua/048qWK4VyO9Aqr8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914107; c=relaxed/simple;
	bh=RnKDGOqODAugQKMkCaEvlJp6/vxQ/Fqn7Yn4NMt9Nz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogawgQvlVudaV7ZTL2C0kvRNEYS+623OCdkNFTnyVFbXyAzOXuZeeF524IVu3IvLrENhD7CYg/UvEULjhfke/jIb6uX343NR2KvXwb6+wO24vVHPwRn4Hpf3biXKGp55kIqYIbofp91XwvqyO5YpjrCZCll6O5EAX4JveBIyznY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p9/bOnGu; arc=none smtp.client-ip=74.125.229.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9/bOnGu"
Received: by mail-dy2-f16.google.com with SMTP id 5a478bee46e88-34b3a9cd8edso1889524eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790914105; x=1791518905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LWvIO3AizqbrrdgnJOfJkn7/+8Sva1Iqh/L+0OPK4g=;
        b=p9/bOnGuxTqQswLwrMlEAC97LbT3dnwqRIsC9Ce7iMbFDEgDB/wl2SDwjq3INXchQe
         ulKIS+XDzhDzFHleQhBdDuWWlFjcCYXbX3/yyhypmyVZDhkGlnmdDhM97XJNc7F2aqqM
         Cnc0BASL1ai5p9nNLNl2aBqK25Yphfw4byzpdGkGaw0Av51thvvJggj0nDSZb+LQMWxm
         tiEy6y7Ptpfpfl+NjLkpq7m5MlmombtVXkmRSIvdnWxdAx1yPceutf84m3eUofmO9xAU
         siBJJu4411tyCTz7/nrc/06wRn1pUHMRfqDw453asrukZfmabq0+CWiR0fVs/s1FQ2mD
         etzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790914105; x=1791518905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LWvIO3AizqbrrdgnJOfJkn7/+8Sva1Iqh/L+0OPK4g=;
        b=o9sgDdXSyys1cFAXWiIEwaPZdH1MuTrp+vQVdlWZNyao6shhXI+6szorQv9QFbDl9D
         6i31sD5ZbOJ75Nl2nipDZnzzgDTtS9cUVL89RFAa6DeoiOHaimFoYYE975ObKaPLgGBF
         X9jfR9fx6cjed7zwYxvlaSpbRcLBpTJSNxWYTJv2bTnj4lS1A2edpn8JAss69T1jE04e
         ioKFW0al9MXUpp2ImRRTzI/QM7rL8U5Ybi5bFsMQ40HhcLrvu6NNJ84ixiq+n4nlfGOx
         02L/R4jJu7CWne02vYjRw3+0V7641Udc8jfo9Mu5M7kOmTATQEAsqsvwRtHT5tFcXyCe
         eC2g==
X-Forwarded-Encrypted: i=1; AKwUvBwbRjpywHoNHYl21p6HAQTMqYwO3C/zWuLKwXEmv/4sqrRtJzhWCH3hbdeHb62q8f5ieiWKSVZr+RKnwWo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9Izo4rpryQLlFqOgA4vhHJ5gMDzxI/E0IBVJOUBywp/JvS0MR
	YaoYMMp70xfY1WQ7dHOq49pg4pi496BgaTLHfBZCb1/sYXgKNwzRRQT0f4Gi/Q==
X-Gm-Gg: AYBFou0gI8MXMbifSROlbmrXULaGlYU55f5tU6cl4fnQoG+czd4lTfxyiGZBV/6U3aR
	KoL++ejEZxn+ZiGoWZFkL8cEldmvJAJQuNISRYi5kv1f3E5RQ0x7MVDcvLzlV6dUQZ6PtQZUF7p
	1WqgE8ZD8lKWO3HwHCI+VBwfR9mwTTPj3dwLDLq+Ae6rPeSfGOklWUZ619qnz1zTzLdI/JJhrZR
	bFjHZCcsLdb8lxBVbDvxD7oNR+2zozM4ok/wTvXa3qjO+tD/8JJELrBW3IPua54XUmereopPm+y
	N91ezjH7B7/iywKlJIA7dD7GjlM76nVK83VfnhvtX4N2O4Q0AZ7fKuBdxT3B/O1qO2E7kFRFYKz
	TmXnEjT+wzGfPlB8vtvfqCzWov7QNmfEC0w1NsUzjPd0z00L2NlSvkdUVZyPFw1rf48mrQ0klQD
	jiIhMi92av34x7QpH3xyEbOrC90XoMz0CUGY6pBSo4tip+6JQoR+j0zLisp7rXJv4cwDrIUEIVH
	ojmC1h27Ibl
X-Received: by 2002:a05:693c:65c5:b0:33c:43c:f3dd with SMTP id 5a478bee46e88-34f2196cd67mr1349349eec.11.1790914104367;
        Thu, 01 Oct 2026 21:08:24 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:27b5:8987:8e28:81fb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35105dd1dfasm492558eec.8.2026.10.01.21.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:08:24 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Fri, 02 Oct 2026 01:07:35 -0300
Subject: [PATCH v2 1/3] staging: rtl8723bs: rename local vars in
 phy_tx_power_limit_to_index()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-rtl8723bs-tx-pwr-limit-v2-1-48b180fb6f7f@gmail.com>
References: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
In-Reply-To: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790914100; l=3665;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=RnKDGOqODAugQKMkCaEvlJp6/vxQ/Fqn7Yn4NMt9Nz8=;
 b=/ecZ9ztqcDLdyxmXm1dSvl/C3wDfcEI7nQFl+4BqigBdzsfDdou01x8nH5vQks+/qd3oCcI9b
 CPC3LqbDNNyAT1rqCdY/oRJlrzm/PjuF2Vgrj2jGDnOyv97ZPk3J+Tl
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

In phy_tx_power_limit_to_index(), there are many mixed-case local
variables, rename them to adhere to the linux kernel coding style.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
Renamed Variables:
	pHalData -> hal_data
	Adapter -> adapter
	BW40PwrBasedBm2_4G -> pwr_base
	rateSection -> rs
	tempValue -> tmp
	tempPwrLmt -> tmp_pwr_lmt
	rfPath -> path

Changes in v2:
- Dropped these two name changes:
	regulation -> reg
	channel -> ch
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 44 +++++++++++++-------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 3712b38cd37d5d5a923f54cdeb6675223549f740..e98e8a936630cbb6c336ad923234781e718b5c10 100644
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
+	u8 regulation, bw, channel, rs;
+	s8 tmp = 0, tmp_pwr_lmt = 0;
+	u8 path = 0;
 
 	for (regulation = 0; regulation < MAX_REGULATION_NUM; ++regulation) {
 		for (bw = 0; bw < MAX_2_4G_BANDWIDTH_NUM; ++bw) {
 			for (channel = 0; channel < CHANNEL_MAX_NUMBER_2G; ++channel) {
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
+				for (rs = 0; rs < MAX_RATE_SECTION_NUM; ++rs) {
+					tmp_pwr_lmt = hal_data->TxPwrLimit_2_4G[regulation][bw][rs][channel][RF_PATH_A];
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
+							hal_data->TxPwrLimit_2_4G[regulation][bw][rs][channel][path] = tmp;
 						}
 					}
 				}

-- 
2.47.3

