Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E3535676B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914110; cv=none; b=SBx0ao03E0eamI0t/6opzUO9+xvkC5XCu34pQO13nRzFNPusI7WHPIHbk9czdk6uX9zp7ujpa1c+iHphUMD+xwhWPpJgXKPvsTUsByiagFPn/O3hpd99lDQiPqmvlzC2B+qtyMMMrb1iZVD7SEyUedH56ODBfsZVRbyxtWErSrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914110; c=relaxed/simple;
	bh=XxuR4V6flJexrudr1v4kOBAI37rC+/aNdKk/vImQRnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TylOGEhd3aJLaeGR29PaXeu9FxPP4nq00Xs/O7QoAJPPFjsl6XUv6NZ3VCqbuEEx0XFUsSU7+nPsWRUxsiyFeIqsTZMPip39AC8KvYBpTdq/r23XSmUvuLsPj/Rnu0jSAigwpNPJRyMI9pdYIT3RYH76Gt8hzN0tyw+X/QTr92E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y83VFH1z; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y83VFH1z"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so6737345eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790914109; x=1791518909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ub6XH25lfLy++mrqdvv7EIfPuPzxSLopDfg1ndI1Os=;
        b=Y83VFH1zlkFZ/mwAFwcM2D7Fi0TqpiSNHVa20dJmX5hobq9lLpzXh0llK7sDVDEsvQ
         4Wh1YMm+W4+C8XHs3NLcqjRX5DjeLAGqHunc238+E940Sma+ahIvTwYqAtoZoclvfI3R
         KisNJwENcR4+yjm/XhpBaBpt0Miw7PB3mH9L1cglM96mRVP3aXdM4aIbMvbI15iYWjaz
         L3tryjO8gT5QPdc95aKE1ctR1LLNXgCvBo5RPzgQtEf8QGHZZ+ju88TN2IKWcbSpunHr
         WLLJoUUNZDaCdM5v6fcN589MDQu074JTU2B3c+7NP80pOlL2p17ZoMDED8OF48YS6Q7j
         ys0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790914109; x=1791518909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Ub6XH25lfLy++mrqdvv7EIfPuPzxSLopDfg1ndI1Os=;
        b=jBTDiklbANBJjshMriPqmm0ZFfCqbcyINELEDKQWaKMtH7KKE0o9uftMqR5tXtU7cJ
         NGPXIPdyCPoF1ym6ucrlSBWhebs/CrkMAN2ZNgmhN2raA6WTi6Nz+PxfX2xnddIiWw9U
         +epMK+ZUgCqKfL3VF1ornJEQUYyvo17l1vye7DbXrFvYrxaJSGxA8+X53NRZWyHD7clQ
         QsnJk6Rg9ODODNpbrB+88OYO6l0qVSUWrOTeLPF9luFMHOx6hTrrzTecO4kE4sW2wtWr
         1PfBdVyEA5H3ihClaFsI04/bNpXcLcjlaFscT9ySFvYSveHkkeZk9D0Od/EQBxO9gu3f
         pUNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwpjAjQN2rZaU1XqwtDzWJ7pafIOHZg7VHukNRr4k+nUID4lpvhaPounZtp6sFQd0AoYeYTtndr+aQzO8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/3XEp2Ci+iYHg6MTorg8smiNdVbQo6eQVSmFiIFliPgdCfSK5
	MFD5wsVAh6xDR3iETL/xN7Z644fZAu6kKIEPoKRV1HnwIs/5Uu038ApVkBOkoA==
X-Gm-Gg: AYBFou1HkM5OoTEwAuDrDuRhbobsyzKXg9Ert9mdG98+6dbaICiU0kROxcqLqqxbu94
	saawSvDq9mPbQEQycWO8DEgivwMZ3UCHnorh/XwUD4KBlcAIvVMsmdkq8NSHeiLHNVsUEK/rzOp
	p8FhYtc13bihMh/dVPdxyZvqhTP1BYb1jPKY6OZSRZvCgDEb86gGXRRC/AgNqpqRJ0pTvP7E/UQ
	m+8F/t8Nmctt2O0XcE3PP9lNBNzQ/7omtCiI7nQjIugSOzo51uVq5r6o2Ix89tS2H4Z9DtkRBTT
	c+kskUToSfbim3jd24Se09pzLqcn87CdyoNEvFPGZfstQDCLIyty92kG7+aNZXNw5jQhUqzsCs8
	fySzpfcj7YyAnt1UyjGvllgeqHL5b64XXeGkx/CqQx5qwLgFvp1r8lARpsYUbJ2YRNg946R7ozx
	lq4ckqkzJK5vfMNWaUe4seolLxHSMfrhDUQT2xTUuojjiZy0kjNYIV9GYjAfU0ep1ZWAHaJ5crg
	v+jAoNuwd0gBw==
X-Received: by 2002:a05:7301:4887:b0:344:7aad:8eb5 with SMTP id 5a478bee46e88-34f150ed00fmr1547768eec.23.1790914108463;
        Thu, 01 Oct 2026 21:08:28 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:27b5:8987:8e28:81fb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35105dd1dfasm492558eec.8.2026.10.01.21.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:08:28 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Fri, 02 Oct 2026 01:07:37 -0300
Subject: [PATCH v2 3/3] staging: rtl8723bs: extract inner loop in
 phy_tx_power_limit_to_index()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-rtl8723bs-tx-pwr-limit-v2-3-48b180fb6f7f@gmail.com>
References: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
In-Reply-To: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790914100; l=2909;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=XxuR4V6flJexrudr1v4kOBAI37rC+/aNdKk/vImQRnI=;
 b=8l/zHfRhbiFDJY0bEDe2wCN48tReEPfOHU7zPSk2USjZTqtiLPR0DgRB7Elr8Sqdhz8tJ6/Ee
 ir8Rc+qx0zEDSIvvDNwMKGhjoP5YGBNP7OFbYufHvG1LaLYZmqZDsRO
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

phy_tx_power_limit_to_index() iterates over an array with 5 indexes,
making the code deeply nested, move the inner loop into an auxiliary
static function to reduce nesting and improve readability.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 48 ++++++++++++++------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 937441aa7dfee50857d37e0d0aa1415037b8cc60..f9f79bead66dcf3df155b505156f2ff73ea5fbed 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -713,35 +713,39 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 	return pwr_lmt;
 }
 
+static void __phy_tx_power_limit_to_index(struct hal_com_data *hal_data, struct registry_priv *r,
+					  u8 regulation, u8 bw, u8 channel, u8 rs)
+{
+	s8 tmp_pwr_lmt = hal_data->TxPwrLimit_2_4G[regulation][bw][rs][channel][RF_PATH_A];
+	s8 tmp;
+	u8 path;
+	u8 pwr_base;
+
+	for (path = RF_PATH_A; path < MAX_RF_PATH_NUM; ++path) {
+		if (hal_data->odmpriv.PhyRegPgValueType == PHY_REG_PG_EXACT_VALUE)
+			pwr_base = hal_data->TxPwrByRateBase2_4G[path][rs];
+		else
+			pwr_base = r->reg_power_base * 2;
+
+		if (tmp_pwr_lmt != MAX_POWER_INDEX) {
+			tmp = tmp_pwr_lmt - pwr_base;
+			hal_data->TxPwrLimit_2_4G[regulation][bw][rs][channel][path] = tmp;
+		}
+	}
+}
+
 void phy_tx_power_limit_to_index(struct adapter *adapter)
 {
 	struct hal_com_data *hal_data = GET_HAL_DATA(adapter);
 	struct registry_priv *r = &adapter->registrypriv;
-	u8 pwr_base = 0x2E;
 	u8 regulation, bw, channel, rs;
-	s8 tmp = 0, tmp_pwr_lmt = 0;
-	u8 path = 0;
 
 	for (regulation = 0; regulation < MAX_REGULATION_NUM; ++regulation) {
-		for (bw = 0; bw < MAX_2_4G_BANDWIDTH_NUM; ++bw) {
-			for (channel = 0; channel < CHANNEL_MAX_NUMBER_2G; ++channel) {
-				for (rs = 0; rs < MAX_RATE_SECTION_NUM; ++rs) {
-					tmp_pwr_lmt = hal_data->TxPwrLimit_2_4G[regulation][bw][rs][channel][RF_PATH_A];
-
-					for (path = RF_PATH_A; path < MAX_RF_PATH_NUM; ++path) {
-						if (hal_data->odmpriv.PhyRegPgValueType == PHY_REG_PG_EXACT_VALUE)
-							pwr_base = hal_data->TxPwrByRateBase2_4G[path][rs];
-						else
-							pwr_base = r->reg_power_base * 2;
-
-						if (tmp_pwr_lmt != MAX_POWER_INDEX) {
-							tmp = tmp_pwr_lmt - pwr_base;
-							hal_data->TxPwrLimit_2_4G[regulation][bw][rs][channel][path] = tmp;
-						}
-					}
-				}
-			}
-		}
+		for (bw = 0; bw < MAX_2_4G_BANDWIDTH_NUM; ++bw)
+			for (channel = 0; channel < CHANNEL_MAX_NUMBER_2G; ++channel)
+				for (rs = 0; rs < MAX_RATE_SECTION_NUM; ++rs)
+					__phy_tx_power_limit_to_index(hal_data, r, regulation, bw,
+								      channel, rs);
 	}
 }
 

-- 
2.47.3

