Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F117118D62A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790471875; cv=none; b=XC9YH2/ndznCfW24watSJ0EzUUhPlBF+VAcFFHjokEB8rWrUDJUbje9xpgd9bN94M6Vql8wjjaromgdGTq5+9tUNgA1V1kHe90moS63sHyfduGXl3dqE/H6EZTv1wqTVOmLpiyhTsRd8BskK1rBdp91cZaATRbrGaAFCYLOnRpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790471875; c=relaxed/simple;
	bh=VnvRZh4BtdtZgCdjM5QaKZJBg/IBO25qpfEZ1SNMpNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ie+6Qek6rNObWjb4ZSYtM6pyhCCxcW79SbA1N9f2zzGlrdsvru6Xf04KGoBEUj+mRw8FeCHjwz/y7Bcze8AzQ1qRmnpOD92/CpQEhO1amlbvQRtGdprmydDTsY0KkrlU/DSDkIprJgqwjPbDPBEZ2+p+iwB2+3xangW7F2fE6wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPlxaBFP; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPlxaBFP"
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b3acd24099so503334137.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790471873; x=1791076673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6O/s0kwHR6tRuJpwgNWsIcZqiKHvSv/FHdqO6VkYnA=;
        b=DPlxaBFPvyG3Fw5XFXeLF9EMiscxsn4LDqJLRp934j9TwuhQQeP8bW2VaA+wC9R8Ak
         msB3RUSQVmAO3s58bU/vjScO6qgl8N/8BN84Ew5V9v6hmUsXt9OXtX0N/Z9sndJ6lZlX
         MdL16TT5RPd8yy/kgHuWvrwSTnmmD5P8vaZwvWJeqOAXfanIIuzcJjybBuxWtc/ZB/q1
         PE/EsLYg3HaqhCoB0wwWTyV7CVbEp73oOlzAQL/DSkOuFto7nfDKOZeNCIQY3iq1KJrF
         L23n+oj/vTeKoq5yUU5qbWRaVRGDyy2O29cJnCdDi2lfJQzLwTS37xalcow4GBGfyt5z
         584Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790471873; x=1791076673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H6O/s0kwHR6tRuJpwgNWsIcZqiKHvSv/FHdqO6VkYnA=;
        b=TDwIvfIby98S6Fq3UpMJeeqOA7B9Ak3OvZaZcddq/97r6DLtF2GkzGd4mQ24cTgIq5
         mXXDugkwXvFDW+C3El9TcradHpOlivSAB0G2/Zm2ZdrBa/zion2pwXygi76jgroqW328
         /8Z/QZ5zKBkZxw4F/B2lSaCYwKIImev78NltjjW9stI0IIy0PAbKzBFbP29TXgy1C6xF
         I22kex91lOlC3S2SE6jXxNBvGXKc9QcIedASlnmPVtEUvJbHWdUUpkWYrrmaHTs/WxQN
         g95fg98LiE7wVHmvSdZgDspdj1ZaW7Qd4Rkf/l+XRGdoklD1rvSegJ7E4Ngf17LU8vyd
         RsuQ==
X-Forwarded-Encrypted: i=1; AKwUvByRiKirU31o+c0ytUgIuPI6JWWLjK2p7/rzWsWRt9PBDhi60we4n3CaWnTL9re3w6/O63Ugm1KVQ3GqcQQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ54lav5/KlS0Jw8C0XKlCx3/SDwQKVMGMEgIpkjGW692C5ENHu
	JEUkjL7LDeZId/hb+8nmB+L6FIX0clFeUZPfl45vTubNil6hDHjbZFlZ
X-Gm-Gg: AYBFou3fVpyorbjYYKkS25B6e7XGuwpH/aFeqbyeS1hiZGkQRD/tntZt9lTxUP0X+fY
	0Ul30xhYZl3ecWvu2ZpPGHyDp5koKS0NndQgpdzxj2UyDRqMBnYk2ztasLgoSIgnuqeyEMGOihC
	Haz92d4+zzWwVpFnsYZeQb3JwHMjSs3bb4Rh26OEJtEUA+YCi0yhNo+DwGNjq1n2LmTbs2RQXp+
	D7CvFLx8CifyuVlV/BPg6oFXjuaqki9vQN1Wy/aKexwk5ldAoMA71Y0LZGabiVHT3wqhWHhxtzJ
	SawCFlBJe/cN8fdBEPecM8ZmSk/xGVuYoT8wkQlwVnfTb7oKjOjpi0xEtQb1sQhWn5Rkf0SvhyQ
	Sa28EUsCi+BYWQtFdwfIm7De9d6cM27uCoFfJI/NzCFo8YYeiplaVWLhUQhdl6mmu/qvy870hjc
	A2HLvgfbYcpZKABD4pJjhUduMnUzKjqsG5TOFOQD7P79iVo8rrwTd0Lhk=
X-Received: by 2002:a67:e703:0:b0:7a1:f7c3:3a42 with SMTP id ada2fe7eead31-7af1c17fd4amr4060035137.15.1790471872895;
        Sat, 26 Sep 2026 18:17:52 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:78b3:5cda::1002])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b1d413asm820433241.10.2026.09.26.18.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:17:50 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Sat, 26 Sep 2026 22:12:26 -0300
Subject: [PATCH 3/4] staging: rtl8723bs: access TxPowerByRateBase2_4G
 directly
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-rtl8723bs-tx-pwr-limit-v1-3-989dcbc113fd@gmail.com>
References: <20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com>
In-Reply-To: <20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790471854; l=3467;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=VnvRZh4BtdtZgCdjM5QaKZJBg/IBO25qpfEZ1SNMpNc=;
 b=WQjiTs13o5mzl49fZd3ISc4SzqNGZahLZ3FAeVRYfEFCt3JJbVq6KRH1rjXX16dn6rT0uebKW
 SX6yDYN7xNoCyV6qCzJYfUsd1tW2oa1pkpyOyF+Ne6AUPi8/otIJNDn
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
index 6d8e3b26da6d29863bd0f4f43fba6abcdbdf5c9c..46402ab07d757b2aba69d6fb7fec127681c9d012 100644
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
 					tmp_pwr_lmt = hal_data->TxPwrLimit_2_4G[reg][bw][rs][ch][RF_PATH_A];
 
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

