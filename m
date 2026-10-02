Received: from mail-dy2-f40.google.com (mail-dy2-f40.google.com [74.125.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EED353A83
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914108; cv=none; b=Z4CIcECnOVFDOlauSPi099aeAY7vr/UZhee3xS+52arv4aNs14kZ2zUhfEv/X9vj9oCOPOEDyvQZAsIezZtrvzkHqoK5qHKvl24PIWf26TXwduZEUl6FNKYl/qdxyPJ01fLbJgxBeBud/xKPI/0k2TR5HRL2knkfIeDH+TWnP+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914108; c=relaxed/simple;
	bh=N8sGch0Nf+Dm8Nek/BGXbsoAWit4aCjDO2yiqlhfqvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XqgMQp45+33levouCob/uznb9tjnY8gXCPulGxPEVIJIgDFSzWIruijqu/+7Zu1ujatFrxeoyb4lt77NXTxCI6emM/87lkwVAcFXZe4qau5d3++keZ1b9wLTstIaeBeeF3wEc5aKxkwZoRPx7VRnDjH5NwKDz4db8LvhANEOVBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6CbATae; arc=none smtp.client-ip=74.125.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6CbATae"
Received: by mail-dy2-f40.google.com with SMTP id 5a478bee46e88-34ea9118159so1341982eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790914106; x=1791518906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gAPRUDowq8lkHYL7pRd5pXTPp/lU7IcVLhv/HnMOOd8=;
        b=F6CbATaeQObcF1N1C7DS2RtDwOXm3jtCu6qFtZieK6cN3rR4dn0sAANLPqyZIu+qx1
         PoGPy9yilI5T7HFNfFluhsj1VMvV/7UWrbbiQJPxL3Xi1heNFIsAvQEnJPT2AluEQ3GY
         0595K+nrc0dUjwg+fRvX5vmizNVZc9HRozAy8ir9RVx32Ux7KLekmOYK201Tk353VAOE
         oxnfohWFo3qOYdToy68W5mJYFXLJ46GcGCozYCihiO8egBGoGrsf4cRgs1pCOx5VFVLS
         rjSfPZ632RQiqj3hw3QQDDoSGcN7qbtSk1MEvIA5E/BUwkuyeZttLbyL7OoUSiVQrk0u
         PsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790914106; x=1791518906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gAPRUDowq8lkHYL7pRd5pXTPp/lU7IcVLhv/HnMOOd8=;
        b=RWydBTe7YzCLnOcvrbzS6s+il294ZzsT5MqoBymPeG540+0ApfFJfPVR+UuYiuh3T4
         05eMCBkRGD0rZvwmJ9nsofo14gKkSUPdRdCAN9NwSAv+6XLEF1CV7FhBGjsXiPseTkjO
         +kTO/5TLnfzp5sGo0L6Ws4Vw6+wIkRpX+M4l/EPqtSRXLqGYyY3imDVwmxOAZ4MdGkuI
         yG/VmN+2qaEQZB/6DdzERWVNflLFXpczOGIoEsVLZ0/nOxfZsFcJ3DUgs8FDdjaq2V6f
         XcXVvWdMqsok3nVQF4kg6LaRafwuVTVcgDPTdOZwTXoflcM6MdLn4t7ZglUESoFtt/9V
         qjmg==
X-Forwarded-Encrypted: i=1; AKwUvBzvrYeHrz/y28P6zjQO4OL3Q2DPRb2w4SaUvm1k1aWIYc03LYOOeblFXVa3dv3+B/uYZ0plvc9KM7cqhbc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1mEMwFOo4Sg9e0f4bTMYzEBMUBEoy/12oVL4gM38rS9pC1XH5
	CeCNZvgnAHNPWQY1qR5QDYXZbAGq5iuXgS9U2fwIY49f0QUjzOtJXfavCXPTaA==
X-Gm-Gg: AYBFou3srGGWg44qOTNsrPSumXOyNOqRW1aBbxoxMgiu6VRBGrfQxg7CYDw8v0a2IJC
	GkSPS25AmHCik+t9WgW6RcB9R3s+GcjiZmQPtPeDxrhG0d+MM+lbGLVgfug0GO8oiXbJcUZgT1m
	g4PJ5QCjHgnBm2KlHEG62PA2QBL6Rc00UWm4apNKZNbwOBA9Dhbea3ETuv5M+GagR4+oWgHCebp
	661RasqPQugGajkfTJq+xii+I91ITN4zI0xZiKTFjoMLe7pvpTlqubVXuft4JHatgw81FJYRijW
	lVUaNAUGUf+7hEnSNlBVCOwDR0t3TnZSp3jFSeL9gH5ao3xpmVCZKfQl6174hz39XrefOlO/IVh
	yn1bk+9B3P2iavF/CVSjQwrffmnUjtedICDFpSn4Y/20Fx//f29IXs+GAjZPKxb+FzPVQZCjHqY
	vwwcYo7tmvobV+d0pbXCCaBO5FPbezmF5Lih4iKQsgzN2KG0EPRebdBSVsNdta8cupCmOtkjEFM
	A==
X-Received: by 2002:a05:693c:3881:b0:33b:dfe3:250d with SMTP id 5a478bee46e88-34f150ecc8dmr1633324eec.23.1790914106334;
        Thu, 01 Oct 2026 21:08:26 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:27b5:8987:8e28:81fb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35105dd1dfasm492558eec.8.2026.10.01.21.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:08:26 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Fri, 02 Oct 2026 01:07:36 -0300
Subject: [PATCH v2 2/3] staging: rtl8723bs: access TxPowerByRateBase2_4G
 directly
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-rtl8723bs-tx-pwr-limit-v2-2-48b180fb6f7f@gmail.com>
References: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
In-Reply-To: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790914100; l=3479;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=N8sGch0Nf+Dm8Nek/BGXbsoAWit4aCjDO2yiqlhfqvQ=;
 b=b7gvrFWwNLEcpOg3VVpMAFo9rAs9GNc636B4zYQyf3Cx9jm1ELmv+A8SY67hngUV9QefhyHEI
 BwrR/usASSZCmHbpUURGuUqRBK7jRDX8wFf0QG0hjW2ewWTcR7/La0H
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

In phy_tx_power_limit_to_index(), pwr_base is acquired from
TxPowerByRateBase2_4G using rs, which itself is an iterator between
0 and 2, but it's accessed by using an if-else chain that then passes
the equivalent enum constant to PHY_GetTxPowerByRateBase(), which
checks RfPath against RF_PATH_MAX (which is already done by the loop),
then uses a switch-case statement on the enum to access
TxPowerByRateBase2_4G with the original value of rs.

Remove the redundant if-else, the call to PHY_GetTxPowerByRateBase() and
access it directly. Also remove PHY_GetTxPowerByRateBase() since those
were its only usages.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c     | 37 ++--------------------
 drivers/staging/rtl8723bs/include/hal_com_phycfg.h |  3 --
 2 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index e98e8a936630cbb6c336ad923234781e718b5c10..937441aa7dfee50857d37e0d0aa1415037b8cc60 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -10,32 +10,6 @@
 #include <linux/kernel.h>
 #include <linux/string.h>
 
-u8 PHY_GetTxPowerByRateBase(struct adapter *Adapter, u8 RfPath,
-			    enum rate_section RateSection)
-{
-	struct hal_com_data	*pHalData = GET_HAL_DATA(Adapter);
-	u8	value = 0;
-
-	if (RfPath >= RF_PATH_MAX)
-		return 0;
-
-	switch (RateSection) {
-	case CCK:
-		value = pHalData->TxPwrByRateBase2_4G[RfPath][0];
-		break;
-	case OFDM:
-		value = pHalData->TxPwrByRateBase2_4G[RfPath][1];
-		break;
-	case HT_MCS0_MCS7:
-		value = pHalData->TxPwrByRateBase2_4G[RfPath][2];
-		break;
-	default:
-		break;
-	}
-
-	return value;
-}
-
 static void
 phy_SetTxPowerByRateBase(struct adapter *Adapter, u8 RfPath,
 			 enum rate_section RateSection, u8 Value)
@@ -755,14 +729,9 @@ void phy_tx_power_limit_to_index(struct adapter *adapter)
 					tmp_pwr_lmt = hal_data->TxPwrLimit_2_4G[regulation][bw][rs][channel][RF_PATH_A];
 
 					for (path = RF_PATH_A; path < MAX_RF_PATH_NUM; ++path) {
-						if (hal_data->odmpriv.PhyRegPgValueType == PHY_REG_PG_EXACT_VALUE) {
-							if (rs == 2) /*  HT 1T */
-								pwr_base = PHY_GetTxPowerByRateBase(adapter, path, HT_MCS0_MCS7);
-							else if (rs == 1) /*  OFDM */
-								pwr_base = PHY_GetTxPowerByRateBase(adapter, path, OFDM);
-							else if (rs == 0) /*  CCK */
-								pwr_base = PHY_GetTxPowerByRateBase(adapter, path, CCK);
-						} else
+						if (hal_data->odmpriv.PhyRegPgValueType == PHY_REG_PG_EXACT_VALUE)
+							pwr_base = hal_data->TxPwrByRateBase2_4G[path][rs];
+						else
 							pwr_base = r->reg_power_base * 2;
 
 						if (tmp_pwr_lmt != MAX_POWER_INDEX) {
diff --git a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
index a20b4c233de8128fe20e41dee2b303a4662f4de4..ec17e093d8832460ada94878433600063a2b4eab 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
@@ -54,9 +54,6 @@ struct bb_register_def {
 
 };
 
-u8 PHY_GetTxPowerByRateBase(struct adapter *Adapter, u8 RfPath,
-			    enum rate_section RateSection);
-
 u8 PHY_GetRateSectionIndexOfTxPowerByRate(struct adapter *padapter, u32	RegAddr,
 					  u32 BitMask);
 

-- 
2.47.3

