Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3852DB7B9
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790471866; cv=none; b=SZmHQk6CXqAZCFwTrP3lcYzM6sTG5ZuV7DwPFgmyul8OLVZwkC+tCBPy3k/KtOMVwoueQkyvC5EBrCWSFPBFPT+iwwuxQGFr4HwJbk3RN7nroINPK7DKnrA4AK9e8YfaahCOe509JckBScKYEDO6aw0d9AbkoQFO+g1NV8ie9ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790471866; c=relaxed/simple;
	bh=ojIfIYiLNwKGUCwfRMq+sJKc82ZrSHxoMcK5YvDm24Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ss0GayMvUBHlQdQqQ7yeSYBAadm4mvVdOHqrZQaV6/H2QqbZ72j29sjaqjXOA7s4RF324gdQhalfMdlzdThWRWZdCTY6i4TVt8v7yLUyLbgySQXhCI5hHpU+cPlk8Jf6Nn1MjgMQ41he76LihceWy+NKbk0iG79Loe9cZsS487k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gA455nbK; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gA455nbK"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-98531196e20so1203571241.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790471864; x=1791076664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxuHtglGUwNxO72nXrw7LQ7sLx6MsCcN08fhdwpG59E=;
        b=gA455nbK10ljD87MUBvLAqxfvCP9PlV6083fIttVj6d6qFzKEUNhThTkOWHiRFWHc/
         fVfAGHNfFMrxlbqrY4gf9c49HxDk+9jcCWNZv/tC4/kNsizejta3aQ0GD2EOS4wZHMg2
         ct47ZQkuhvzGFgk+jflv5BW1BPlZ5NoOVUSm1sLwXrhVBhuFp04KnIxWFVLzTBzw5uzV
         mbzoKwkZMso7w5UB4B+PfCtMgfhkKiLQdNrDDB2OnHHzYbEIGhVHBPWfweYflqCl1pW8
         C5eNmE/MYGxfrxK5W77Z8ysYwBejITayeQn7PnE62Rpye+3VGRODpPVPzjcd+qUfpt72
         sZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790471864; x=1791076664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IxuHtglGUwNxO72nXrw7LQ7sLx6MsCcN08fhdwpG59E=;
        b=ZmcmcmWeBp8fH7xpoblQZblO/qSn5280L9l+Y9Qvx2/yjVlXveTEtxzNfzG9/ICdk/
         NZDL85wcV1tE5R2eHmy8a26I1Jn96Hs+jm/JFF3RI4uh/BtV5+qFxRwmRtCjmKmZCiq8
         EV05QnGGZGitVhDKWc46DKMfB2dBD6Szb2qQfrrm7Nco1A2X2Wnp38AiWrSQ3MFe7L6R
         YJHim+kJtvL0GbcxLKRx5GHTR/1p26u5MX1IvJ3YaykCRfEJoGg4zx8QjTVJF1uqlhL8
         9G3JtZbH9Q8R6eAgGUcZIynS+YIP+UzSBP9FQeAu/vDqkD+kP2AezDvsw59QCpGl3uCY
         jseg==
X-Forwarded-Encrypted: i=1; AKwUvBwplDwZSWz+aZ51fRibfn32EbqM7mDu6BeHa9B/IUSm1bAGNop0embqnfdBNuq3UBFFE1/4lHksjgBCPyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR0ei5Azw9quKpyD55JQesOyVISZntPUcy5lMzcuTxxRa63E1Z
	sOsCaAmkQr2ovJgQzn8ZyZnigJNcHIxyW9MktExGvK2LgJK96kJcfpJD
X-Gm-Gg: AYBFou3JEXMbHylBrkz9YKrJnow4OYwMjAO1+QnvEaCBcosvRwtaQl4mRnk/osZ3adV
	AUZYNOhkOGuAKqobmaRLGk7ivXKlkRmaMLZT12DfgoXt6Jyxg/qJdh3eRT1CSBMPiLTdHuYmGGF
	+zqdeaOypiUuGblgL/H4mM3hlwHJBMaJ9GiIohO/PIabdvzA3QpJCeYWO9nUBtOZaAzoez/2Wff
	LG+gKl/t0JHEHty6dSso9b6157Kj+msZOhNIuzXadDnD6WbMzPReuwKg4BaIs0GWWIH0hUrDslJ
	0u6WbPttuZPWTa+RuFzZwMYBht1rUAazxPyiEjyheJw+X8rnUSmttx5AYJKM2/dho95CJ3JoLB2
	dB+R8fXmVWboHIFFhHh30kte4nkurtuKyOUa/auzkbBx2yp5rWI8YVU+VaYJqiW+08Og2XWJLK9
	I4CktfUpKwGvXpWCBMVY+BBuXxpghDAd/uC55uv+MGpgg1tpC+/4h+pzc=
X-Received: by 2002:a05:6102:41a0:b0:7b2:c1b1:1d0 with SMTP id ada2fe7eead31-7b2c1b10440mr1622109137.11.1790471863919;
        Sat, 26 Sep 2026 18:17:43 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:78b3:5cda::1002])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b1d413asm820433241.10.2026.09.26.18.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:17:42 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Sat, 26 Sep 2026 22:12:24 -0300
Subject: [PATCH 1/4] staging: rtl8723bs: rename
 PHY_ConvertTxPowerLimitToPowerIndex()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-rtl8723bs-tx-pwr-limit-v1-1-989dcbc113fd@gmail.com>
References: <20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com>
In-Reply-To: <20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790471854; l=2525;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=ojIfIYiLNwKGUCwfRMq+sJKc82ZrSHxoMcK5YvDm24Q=;
 b=dDBZ6vmrra7dribg0vNPtu7/3sUET5kLgWL2zGvqlQkVMVase5+g7aWBc4iSHpL/BW9jaFV1Y
 Fu61sdux+itBXJHe5D5hblv4LCXCrZN8syi3CS4iZ5oVAVKcUVZRUKW
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

Rename function PHY_ConvertTxPowerLimitToPowerIndex() to
phy_tx_power_limit_to_index().

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c     | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c    | 2 +-
 drivers/staging/rtl8723bs/include/hal_com_phycfg.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index df0eaff4c84114eb583c9b91ca7babdafe6a28da..1228be0cbc839041384f3e434d22b4f039d69986 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -739,7 +739,7 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 	return pwr_lmt;
 }
 
-void PHY_ConvertTxPowerLimitToPowerIndex(struct adapter *Adapter)
+void phy_tx_power_limit_to_index(struct adapter *Adapter)
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(Adapter);
 	struct registry_priv *r = &Adapter->registrypriv;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 737e2a818c18d7708df8d743f4947b86461cd0f3..44b4dd69af3a03b21abf4307a515c639863efb42 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -352,7 +352,7 @@ static int phy_BB8723b_Config_ParaFile(struct adapter *Adapter)
 		if (Adapter->registrypriv.reg_enable_tx_power_limit == 1 ||
 		    (Adapter->registrypriv.reg_enable_tx_power_limit == 2 &&
 		   pHalData->EEPROMRegulatory == 1))
-			PHY_ConvertTxPowerLimitToPowerIndex(Adapter);
+			phy_tx_power_limit_to_index(Adapter);
 	}
 
 	/*  */
diff --git a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
index cb7c7ed74146844032add0736eb7dc41b4b4a6d9..a20b4c233de8128fe20e41dee2b303a4662f4de4 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
@@ -97,7 +97,7 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 RegPwrTblSel,
 void PHY_SetTxPowerLimit(struct adapter *Adapter, u8 *Regulation, u8 *Bandwidth,
 			 u8 *RateSection, u8 *RfPath, u8 *Channel, u8 *PowerLimit);
 
-void PHY_ConvertTxPowerLimitToPowerIndex(struct adapter *Adapter);
+void phy_tx_power_limit_to_index(struct adapter *Adapter);
 
 void PHY_InitTxPowerLimit(struct adapter *Adapter);
 

-- 
2.47.3

