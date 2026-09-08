Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68141DB92C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836374; cv=none; b=Pi3Uz4AHdcsj9mUiMK9kGtCQMC3wR6tBsFgQmU0k/EzIFOyW4iY2ysroQ0sjkgbDba36YjasMQdkLN3PWgYs+btDyUpASuvlYm+KiLsELNke09MQHY9QCCTTvRqgErrmnfkZb36qzSB0YLrQIGQTakRBv3wexoVN05oV+N8CrTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836374; c=relaxed/simple;
	bh=d4VhQi0IhlP8cRh5iy3w5G2I3H5uRVsUekH/nTqxnUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hEBzbp1eriQXTrZjoUx2UEWiv0Gw9gKNRjQB33N3Os672FhSEKhwzUUcGbaEfXONnFt0OQNalfF9449Qt8mMIjRzi7qNK0TNtAfqSp6TrRJNlxSY4G6CuZb8rsmYSU29s+1jQGDaByKe3J0OK5yrqyIh3EtJxYExpIVAkCplCfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T34O28wG; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T34O28wG"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7ffe6893503so179083a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 19:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788836371; x=1789441171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OkNuvnXCM2QyPMbPPFTNTs8u+gFBP2mvRX7VIUqPIDo=;
        b=T34O28wGQXteL6KlWOPFMufi3mzgAhaTBcGVWMVbaIbvBWMA1pW0HvfKa2uybaotv3
         V0tMrBkKsmwlDk/9kTuaIUObwxknku1ATu91ghCNsH5OGaOH5dC/kUDccR8zxFOEBFmm
         WFvRFEC+bUkTbK++TEiC1/5GEDQFuzCekKA4pb5TTNo8D6k/t28Cph/uaO6mg+7d86RL
         mKfgYX4aGSXQad3mXLd0CZGfy/9X2Tfh52EsXUaig2pf5+2CRCSN/B/0PDxA5RbjeQD1
         hBoDZejG7n6DtnBR9QgOxla2WpDdtsea4OTVKJyL54KQp6JsrW5hs6wZPbuJfJv/oxjl
         xa1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788836371; x=1789441171;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OkNuvnXCM2QyPMbPPFTNTs8u+gFBP2mvRX7VIUqPIDo=;
        b=HolxJfauvouyEc1Ltr97d24TS64a/MdgyI5M9rsmt3gyX+AdoHwc+fTfbx6K+47dv8
         vp93Fsuy/WuZvi5NGa8HR50yrEMhwoRhzBapQDZJZaXgMOvBYwtx+aRwpYVPr8TnTmrD
         jnKske0qlGZPyv4qcbfy5es1aYvEwkIcyCP3VhoD5bKMVripRWIhA9OGeE1th2Y53ewt
         O7Srv+x4UGsz1jcVKEVnBw6nzvtAtPOTSta5PYdf9xsHvX4QtcbaOt8Zoi4sHbHee2Ro
         otIk6X7/twJHvE8XadK0DMTyOVnuWdl+rjcDDADaGh6yE1YbByWn2BlN37ZVoPFtupL0
         NDMg==
X-Forwarded-Encrypted: i=1; AKwUvByTMT3POFbGqbpm5TApCC13lq4b5ZQUaBIF/qg/04B/namcMTKc2kGVK4jRqQ46UxJiHQMFtsQj3vHSDHE=@vger.kernel.org
X-Gm-Message-State: AFuF++lL84AJV9ZlCqxJs6kpgZzSZxLPg50MaQe63wMqFrQF0YtR1n/u
	a4RLrzt7LnjHYSbYsmfKS/3JlGsOPqnDJPsdr+PBZwGVRYtPj5OpHBpT
X-Gm-Gg: AYBFou0nqd5hTmvdoX0y5FoY/tP8XQcmigHKSL2epMFRIHtdLyWQadpFDkBS5vOvANy
	Rp2uZzs9LBPXmQhGAO5fY1McD3UvaFDR5OUinGb5Ghybcrkr+LKMNrtKOCiZr/EQN3pC/aUJPlw
	2jkQLAUcC6Yqlu6q5DDVTjPhnf1u1ViIxdbtb57JCAm9HbSZAmXyXL15aChNR0hKMTbARKLhZwz
	DzclB4BXHiuopTrNGctewcvmr8HLoQCAGKxKCNVWzajH4YCLgH161KYE/Ux+gZGOq9gHxgfVcNr
	R+9uHvOjgn13KVvwdCcFpc3bptBPjy2/DdPPGIVVEAJ7M+b24eGL9rHgb4QwCn5pn+oUXpP8Hlp
	/qD/pyQm3ixvNOVLsJFJNjK0edkBhJ7mALbBJxmBKvVV7FtVd67x5YZVl44LZX2RrUYHqbSzziR
	MzWxqFY9oEAKWqreg9bf44/FzwxLeDRBv9J6LU2JoEOQev5btEnOc+ZOWzQ45AVcZk8a2R5wOrs
	RydMs/XX4f9lOq5dfclY2e2KZw=
X-Received: by 2002:a05:6820:1787:b0:6b1:3270:23ac with SMTP id 006d021491bc7-6b6fdfbfa51mr25245605eaf.17.1788836370454;
        Mon, 07 Sep 2026 19:59:30 -0700 (PDT)
Received: from david-hassan-Inspiron-15-3567 ([69.162.230.54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4791a0ffb4dsm4173078fac.16.2026.09.07.19.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 19:59:29 -0700 (PDT)
From: Fahmy Hassan <fahmymohammed@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fahmy Hassan <fahmymohammed@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix coding style in HalBtc8723b2Ant.c
Date: Mon,  7 Sep 2026 20:57:57 -0600
Message-ID: <20260908025910.155625-1-fahmymohammed@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Address checkpatch.pl warnings listed in the driver's TODO file:
remove braces around single-statement if/else arms, wrap function
calls that exceed the 100 column limit, and move trailing comments
that pushed lines over the limit onto their own line above the
statement they document.

Also translate the handful of Chinese vendor comments left in
halbtc8723b2ant_TdmaDurationAdjust() to English, keeping the
original text alongside the translation for reference.

No functional change. Build-tested with
`make M=drivers/staging/rtl8723bs`; checkpatch.pl -f now reports
0 errors, 0 warnings for this file.

Signed-off-by: Fahmy Hassan <fahmymohammed@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   | 328 +++++++++++-------
 1 file changed, 198 insertions(+), 130 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index 0220bacee181..e031ac8758b3 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -35,49 +35,43 @@ static u8 halbtc8723b2ant_BtRssiState(
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				btRssiState = BTC_RSSI_STATE_HIGH;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else {
-			if (btRssi < rssiThresh) {
+			if (btRssi < rssiThresh)
 				btRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	} else if (levelNum == 3) {
-		if (rssiThresh > rssiThresh1) {
+		if (rssiThresh > rssiThresh1)
 			return pCoexSta->preBtRssiState;
-		}
 
 		if (
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				btRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else if (
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_MEDIUM) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_MEDIUM)
 		) {
-			if (btRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (btRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				btRssiState = BTC_RSSI_STATE_HIGH;
-			} else if (btRssi < rssiThresh) {
+			else if (btRssi < rssiThresh)
 				btRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_MEDIUM;
-			}
 		} else {
-			if (btRssi < rssiThresh1) {
+			if (btRssi < rssiThresh1)
 				btRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	}
 
@@ -104,49 +98,43 @@ static u8 halbtc8723b2ant_WifiRssiState(
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				wifiRssiState = BTC_RSSI_STATE_HIGH;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else {
-			if (wifiRssi < rssiThresh) {
+			if (wifiRssi < rssiThresh)
 				wifiRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	} else if (levelNum == 3) {
-		if (rssiThresh > rssiThresh1) {
+		if (rssiThresh > rssiThresh1)
 			return pCoexSta->preWifiRssiState[index];
-		}
 
 		if (
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				wifiRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else if (
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_MEDIUM) ||
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_MEDIUM)
 		) {
-			if (wifiRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (wifiRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				wifiRssiState = BTC_RSSI_STATE_HIGH;
-			} else if (wifiRssi < rssiThresh) {
+			else if (wifiRssi < rssiThresh)
 				wifiRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_MEDIUM;
-			}
 		} else {
-			if (wifiRssi < rssiThresh1) {
+			if (wifiRssi < rssiThresh1)
 				wifiRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	}
 
@@ -318,11 +306,10 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 			} else if (pBtLinkInfo->bA2dpExist) {
 				algorithm = BT_8723B_2ANT_COEX_ALGO_A2DP;
 			} else if (pBtLinkInfo->bPanExist) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANHS;
-				} else {
+				else
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR;
-				}
 			}
 		}
 	} else if (numOfDiffProfile == 2) {
@@ -332,11 +319,10 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 			} else if (pBtLinkInfo->bA2dpExist) {
 				algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
 			} else if (pBtLinkInfo->bPanExist) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_2ANT_COEX_ALGO_SCO;
-				} else {
+				else
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
-				}
 			}
 		} else {
 			if (
@@ -348,20 +334,18 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 				pBtLinkInfo->bHidExist &&
 				pBtLinkInfo->bPanExist
 			) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_2ANT_COEX_ALGO_HID;
-				} else {
+				else
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
-				}
 			} else if (
 				pBtLinkInfo->bPanExist &&
 				pBtLinkInfo->bA2dpExist
 			) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_2ANT_COEX_ALGO_A2DP_PANHS;
-				} else {
+				else
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_A2DP;
-				}
 			}
 		}
 	} else if (numOfDiffProfile == 3) {
@@ -388,11 +372,10 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 				pBtLinkInfo->bPanExist &&
 				pBtLinkInfo->bA2dpExist
 			) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_2ANT_COEX_ALGO_HID_A2DP;
-				} else {
+				else
 					algorithm = BT_8723B_2ANT_COEX_ALGO_HID_A2DP_PANEDR;
-				}
 			}
 		}
 	} else if (numOfDiffProfile >= 3) {
@@ -402,10 +385,10 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 				pBtLinkInfo->bPanExist &&
 				pBtLinkInfo->bA2dpExist
 			) {
-				if (bBtHsOn) {
-				} else {
+				if (bBtHsOn)
+					;
+				else
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
-				}
 			}
 		}
 	}
@@ -479,9 +462,11 @@ static void halbtc8723b2ant_SetSwRfRxLpfCorner(
 	} else {
 		/* Resume RF Rx LPF corner */
 		/*  After initialized, we can use pCoexDm->btRf0x1eBackup */
-		if (pBtCoexist->bInitilized) {
-			pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1e, 0xfffff, pCoexDm->btRf0x1eBackup);
-		}
+		if (pBtCoexist->bInitilized)
+			pBtCoexist->fBtcSetRfReg(
+				pBtCoexist, BTC_RF_A, 0x1e, 0xfffff,
+				pCoexDm->btRf0x1eBackup
+			);
 	}
 }
 
@@ -564,7 +549,7 @@ static void halbtc8723b2ant_DacSwing(
 
 	if (!bForceExec) {
 		if ((pCoexDm->bPreDacSwingOn == pCoexDm->bCurDacSwingOn) &&
-			(pCoexDm->preDacSwingLvl == pCoexDm->curDacSwingLvl))
+		    (pCoexDm->preDacSwingLvl == pCoexDm->curDacSwingLvl))
 			return;
 	}
 	mdelay(30);
@@ -696,43 +681,69 @@ static void halbtc8723b2ant_CoexTableWithType(
 {
 	switch (type) {
 	case 0:
-		halbtc8723b2ant_CoexTable(pBtCoexist, bForceExec, 0x55555555, 0x55555555, 0xffff, 0x3);
+		halbtc8723b2ant_CoexTable(
+			pBtCoexist, bForceExec, 0x55555555, 0x55555555, 0xffff, 0x3
+		);
 		break;
 	case 1:
-		halbtc8723b2ant_CoexTable(pBtCoexist, bForceExec, 0x55555555, 0x5afa5afa, 0xffff, 0x3);
+		halbtc8723b2ant_CoexTable(
+			pBtCoexist, bForceExec, 0x55555555, 0x5afa5afa, 0xffff, 0x3
+		);
 		break;
 	case 2:
-		halbtc8723b2ant_CoexTable(pBtCoexist, bForceExec, 0x5a5a5a5a, 0x5a5a5a5a, 0xffff, 0x3);
+		halbtc8723b2ant_CoexTable(
+			pBtCoexist, bForceExec, 0x5a5a5a5a, 0x5a5a5a5a, 0xffff, 0x3
+		);
 		break;
 	case 3:
-		halbtc8723b2ant_CoexTable(pBtCoexist, bForceExec, 0xaaaaaaaa, 0xaaaaaaaa, 0xffff, 0x3);
+		halbtc8723b2ant_CoexTable(
+			pBtCoexist, bForceExec, 0xaaaaaaaa, 0xaaaaaaaa, 0xffff, 0x3
+		);
 		break;
 	case 4:
-		halbtc8723b2ant_CoexTable(pBtCoexist, bForceExec, 0xffffffff, 0xffffffff, 0xffff, 0x3);
+		halbtc8723b2ant_CoexTable(
+			pBtCoexist, bForceExec, 0xffffffff, 0xffffffff, 0xffff, 0x3
+		);
 		break;
 	case 5:
-		halbtc8723b2ant_CoexTable(pBtCoexist, bForceExec, 0x5fff5fff, 0x5fff5fff, 0xffff, 0x3);
+		halbtc8723b2ant_CoexTable(
+			pBtCoexist, bForceExec, 0x5fff5fff, 0x5fff5fff, 0xffff, 0x3
+		);
 		break;
 	case 6:
-		halbtc8723b2ant_CoexTable(pBtCoexist, bForceExec, 0x55ff55ff, 0x5a5a5a5a, 0xffff, 0x3);
+		halbtc8723b2ant_CoexTable(
+			pBtCoexist, bForceExec, 0x55ff55ff, 0x5a5a5a5a, 0xffff, 0x3
+		);
 		break;
 	case 7:
-		halbtc8723b2ant_CoexTable(pBtCoexist, bForceExec, 0x55ff55ff, 0xfafafafa, 0xffff, 0x3);
+		halbtc8723b2ant_CoexTable(
+			pBtCoexist, bForceExec, 0x55ff55ff, 0xfafafafa, 0xffff, 0x3
+		);
 		break;
 	case 8:
-		halbtc8723b2ant_CoexTable(pBtCoexist, bForceExec, 0x5aea5aea, 0x5aea5aea, 0xffff, 0x3);
+		halbtc8723b2ant_CoexTable(
+			pBtCoexist, bForceExec, 0x5aea5aea, 0x5aea5aea, 0xffff, 0x3
+		);
 		break;
 	case 9:
-		halbtc8723b2ant_CoexTable(pBtCoexist, bForceExec, 0x55ff55ff, 0x5aea5aea, 0xffff, 0x3);
+		halbtc8723b2ant_CoexTable(
+			pBtCoexist, bForceExec, 0x55ff55ff, 0x5aea5aea, 0xffff, 0x3
+		);
 		break;
 	case 10:
-		halbtc8723b2ant_CoexTable(pBtCoexist, bForceExec, 0x55ff55ff, 0x5aff5aff, 0xffff, 0x3);
+		halbtc8723b2ant_CoexTable(
+			pBtCoexist, bForceExec, 0x55ff55ff, 0x5aff5aff, 0xffff, 0x3
+		);
 		break;
 	case 11:
-		halbtc8723b2ant_CoexTable(pBtCoexist, bForceExec, 0x55ff55ff, 0x5a5f5a5f, 0xffff, 0x3);
+		halbtc8723b2ant_CoexTable(
+			pBtCoexist, bForceExec, 0x55ff55ff, 0x5a5f5a5f, 0xffff, 0x3
+		);
 		break;
 	case 12:
-		halbtc8723b2ant_CoexTable(pBtCoexist, bForceExec, 0x55ff55ff, 0x5f5f5f5f, 0xffff, 0x3);
+		halbtc8723b2ant_CoexTable(
+			pBtCoexist, bForceExec, 0x55ff55ff, 0x5f5f5f5f, 0xffff, 0x3
+		);
 		break;
 	default:
 		break;
@@ -827,7 +838,8 @@ static void halbtc8723b2ant_SetAntPath(
 	u8	H2C_Parameter[2] = {0};
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_EXT_SWITCH, &bPgExtSwitch);
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);	/*  [31:16]=fw ver, [15:0]=fw sub ver */
+	/*  [31:16]=fw ver, [15:0]=fw sub ver */
+	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);
 
 	if ((fwVer > 0 && fwVer < 0xc0000) || bPgExtSwitch)
 		bUseExtSwitch = true;
@@ -849,8 +861,10 @@ static void halbtc8723b2ant_SetAntPath(
 
 		pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x0);
 
-		pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1, 0xfffff, 0x0); /* WiFi TRx Mask off */
-		pBtCoexist->fBtcSetBtReg(pBtCoexist, BTC_BT_REG_RF, 0x3c, 0x01); /* BT TRx Mask off */
+		/* WiFi TRx Mask off */
+		pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1, 0xfffff, 0x0);
+		/* BT TRx Mask off */
+		pBtCoexist->fBtcSetBtReg(pBtCoexist, BTC_BT_REG_RF, 0x3c, 0x01);
 
 		if (pBoardInfo->btdmAntPos == BTC_ANTENNA_AT_MAIN_PORT) {
 			/* tell firmware "no antenna inverse" */
@@ -880,13 +894,16 @@ static void halbtc8723b2ant_SetAntPath(
 			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x4c, u4Tmp);
 		}
 
-		pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x0); /*  fixed internal switch S1->WiFi, S0->BT */
+		/*  fixed internal switch S1->WiFi, S0->BT */
+		pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x0);
 		switch (antPosType) {
 		case BTC_ANT_WIFI_AT_MAIN:
-			pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x92c, 0x3, 0x1);	/*  ext switch main at wifi */
+			/*  ext switch main at wifi */
+			pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x92c, 0x3, 0x1);
 			break;
 		case BTC_ANT_WIFI_AT_AUX:
-			pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x92c, 0x3, 0x2);	/*  ext switch aux at wifi */
+			/*  ext switch aux at wifi */
+			pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x92c, 0x3, 0x2);
 			break;
 		}
 	} else { /*  internal switch */
@@ -898,13 +915,16 @@ static void halbtc8723b2ant_SetAntPath(
 			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x4c, u4Tmp);
 		}
 
-		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x64, 0x1, 0x0); /* fixed external switch S1->Main, S0->Aux */
+		/* fixed external switch S1->Main, S0->Aux */
+		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x64, 0x1, 0x0);
 		switch (antPosType) {
 		case BTC_ANT_WIFI_AT_MAIN:
-			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x0); /*  fixed internal switch S1->WiFi, S0->BT */
+			/*  fixed internal switch S1->WiFi, S0->BT */
+			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x0);
 			break;
 		case BTC_ANT_WIFI_AT_AUX:
-			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x280); /*  fixed internal switch S0->WiFi, S1->BT */
+			/*  fixed internal switch S0->WiFi, S1->BT */
+			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x280);
 			break;
 		}
 	}
@@ -1099,7 +1119,9 @@ static bool halbtc8723b2ant_IsCommonAction(struct btc_coexist *pBtCoexist)
 	} else {
 		if (pCoexDm->btStatus == BT_8723B_2ANT_BT_STATUS_NON_CONNECTED_IDLE) {
 			bLowPwrDisable = false;
-			pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_ACT_DISABLE_LOW_POWER, &bLowPwrDisable);
+			pBtCoexist->fBtcSet(
+				pBtCoexist, BTC_SET_ACT_DISABLE_LOW_POWER, &bLowPwrDisable
+			);
 			halbtc8723b2ant_LimitedRx(pBtCoexist, NORMAL_EXEC, false, false, 0x8);
 
 			pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1, 0xfffff, 0x0);
@@ -1114,7 +1136,9 @@ static bool halbtc8723b2ant_IsCommonAction(struct btc_coexist *pBtCoexist)
 			bCommon = true;
 		} else if (pCoexDm->btStatus == BT_8723B_2ANT_BT_STATUS_CONNECTED_IDLE) {
 			bLowPwrDisable = true;
-			pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_ACT_DISABLE_LOW_POWER, &bLowPwrDisable);
+			pBtCoexist->fBtcSet(
+				pBtCoexist, BTC_SET_ACT_DISABLE_LOW_POWER, &bLowPwrDisable
+			);
 
 			if (bBtHsOn)
 				return false;
@@ -1133,7 +1157,9 @@ static bool halbtc8723b2ant_IsCommonAction(struct btc_coexist *pBtCoexist)
 			bCommon = true;
 		} else {
 			bLowPwrDisable = true;
-			pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_ACT_DISABLE_LOW_POWER, &bLowPwrDisable);
+			pBtCoexist->fBtcSet(
+				pBtCoexist, BTC_SET_ACT_DISABLE_LOW_POWER, &bLowPwrDisable
+			);
 
 			if (bWifiBusy) {
 				bCommon = false;
@@ -1142,7 +1168,9 @@ static bool halbtc8723b2ant_IsCommonAction(struct btc_coexist *pBtCoexist)
 					return false;
 
 				btRssiState = halbtc8723b2ant_BtRssiState(2, 29, 0);
-				halbtc8723b2ant_LimitedRx(pBtCoexist, NORMAL_EXEC, false, false, 0x8);
+				halbtc8723b2ant_LimitedRx(
+					pBtCoexist, NORMAL_EXEC, false, false, 0x8
+				);
 
 				pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1, 0xfffff, 0x0);
 				halbtc8723b2ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 7);
@@ -1154,7 +1182,9 @@ static bool halbtc8723b2ant_IsCommonAction(struct btc_coexist *pBtCoexist)
 				else
 					halbtc8723b2ant_DecBtPwr(pBtCoexist, NORMAL_EXEC, 0);
 
-				halbtc8723b2ant_SwMechanism1(pBtCoexist, false, false, false, false);
+				halbtc8723b2ant_SwMechanism1(
+					pBtCoexist, false, false, false, false
+				);
 				halbtc8723b2ant_SwMechanism2(pBtCoexist, false, false, false, 0x18);
 				bCommon = true;
 			}
@@ -1229,7 +1259,12 @@ static void halbtc8723b2ant_TdmaDurationAdjust(
 			if (dn <= 0)
 				dn = 0;
 
-			if (up >= n) { /*  if 連續 n 個2秒 retry count為0, 則調寬WiFi duration */
+			/*
+			 * original: if 連續 n 個2秒 retry count為0, 則調寬WiFi duration
+			 * translated: if retry count stays 0 for n consecutive
+			 * 2-second periods, widen WiFi duration
+			 */
+			if (up >= n) {
 				WaitCount = 0;
 				n = 3;
 				up = 0;
@@ -1243,13 +1278,30 @@ static void halbtc8723b2ant_TdmaDurationAdjust(
 			if (up <= 0)
 				up = 0;
 
-			if (dn == 2) { /*  if 連續 2 個2秒 retry count< 3, 則調窄WiFi duration */
+			/*
+			 * original: if 連續 2 個2秒 retry count< 3, 則調窄WiFi duration
+			 * translated: if retry count stays <= 3 for 2 consecutive
+			 * 2-second periods, narrow WiFi duration
+			 */
+			if (dn == 2) {
 				if (WaitCount <= 2)
-					m++; /*  避免一直在兩個level中來回 */
+					/*
+					 * original: 避免一直在兩個level中來回
+					 * translated: avoid toggling back and
+					 * forth between two levels
+					 */
+					m++;
 				else
 					m = 1;
 
-				if (m >= 20) /* m 最大值 = 20 ' 最大120秒 recheck是否調整 WiFi duration. */
+				/*
+				 * original: m 最大值 = 20 ' 最大120秒
+				 * recheck是否調整 WiFi duration.
+				 * translated: m max value = 20 (i.e. max 120
+				 * seconds) before rechecking whether to adjust
+				 * WiFi duration.
+				 */
+				if (m >= 20)
 					m = 20;
 
 				n = 3 * m;
@@ -1258,13 +1310,30 @@ static void halbtc8723b2ant_TdmaDurationAdjust(
 				WaitCount = 0;
 				result = -1;
 			}
-		} else { /* retry count > 3, 只要1次 retry count > 3, 則調窄WiFi duration */
+		} else {
+			/*
+			 * original: retry count > 3, 只要1次 retry count > 3,
+			 * 則調窄WiFi duration
+			 * translated: retry count > 3: narrow WiFi duration as
+			 * soon as this happens once
+			 */
 			if (WaitCount == 1)
-				m++; /*  避免一直在兩個level中來回 */
+				/*
+				 * original: 避免一直在兩個level中來回
+				 * translated: avoid toggling back and forth
+				 * between two levels
+				 */
+				m++;
 			else
 				m = 1;
 
-			if (m >= 20) /* m 最大值 = 20 ' 最大120秒 recheck是否調整 WiFi duration. */
+			/*
+			 * original: m 最大值 = 20 ' 最大120秒
+			 * recheck是否調整 WiFi duration.
+			 * translated: m max value = 20 (i.e. max 120 seconds)
+			 * before rechecking whether to adjust WiFi duration.
+			 */
+			if (m >= 20)
 				m = 20;
 
 			n = 3 * m;
@@ -1575,8 +1644,9 @@ static void halbtc8723b2ant_TdmaDurationAdjust(
 		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_ROAM, &bRoam);
 
 		if (!bScan && !bLink && !bRoam)
-			halbtc8723b2ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, pCoexDm->psTdmaDuAdjType);
-
+			halbtc8723b2ant_PsTdma(
+				pBtCoexist, NORMAL_EXEC, true, pCoexDm->psTdmaDuAdjType
+			);
 	}
 }
 
@@ -2197,23 +2267,21 @@ static void halbtc8723b2ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 {
 	u8 algorithm = 0;
 
-	if (pBtCoexist->bManualControl) {
+	if (pBtCoexist->bManualControl)
 		return;
-	}
 
-	if (pCoexSta->bUnderIps) {
+	if (pCoexSta->bUnderIps)
 		return;
-	}
 
 	algorithm = halbtc8723b2ant_ActionAlgorithm(pBtCoexist);
 	if (pCoexSta->bC2hBtInquiryPage && (algorithm != BT_8723B_2ANT_COEX_ALGO_PANHS)) {
 		halbtc8723b2ant_ActionBtInquiry(pBtCoexist);
 		return;
-	} else {
-		if (pCoexDm->bNeedRecover0x948) {
-			pCoexDm->bNeedRecover0x948 = false;
-			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, pCoexDm->backup0x948);
-		}
+	}
+
+	if (pCoexDm->bNeedRecover0x948) {
+		pCoexDm->bNeedRecover0x948 = false;
+		pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, pCoexDm->backup0x948);
 	}
 
 	pCoexDm->curAlgorithm = algorithm;
@@ -2221,9 +2289,8 @@ static void halbtc8723b2ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 	if (halbtc8723b2ant_IsCommonAction(pBtCoexist)) {
 		pCoexDm->bAutoTdmaAdjust = false;
 	} else {
-		if (pCoexDm->curAlgorithm != pCoexDm->preAlgorithm) {
+		if (pCoexDm->curAlgorithm != pCoexDm->preAlgorithm)
 			pCoexDm->bAutoTdmaAdjust = false;
-		}
 
 		switch (pCoexDm->curAlgorithm) {
 		case BT_8723B_2ANT_COEX_ALGO_SCO:
@@ -2273,7 +2340,8 @@ static void halbtc8723b2ant_WifiOffHwCfg(struct btc_coexist *pBtCoexist)
 	/*  set wlan_act to low */
 	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0x4);
 
-	pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1, 0xfffff, 0x780); /* WiFi goto standby while GNT_BT 0-->1 */
+	/* WiFi goto standby while GNT_BT 0-->1 */
+	pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1, 0xfffff, 0x780);
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);
 	if (fwVer >= 0x180000) {
 		/* Use H2C to set GNT_BT to HIGH */
@@ -2284,9 +2352,11 @@ static void halbtc8723b2ant_WifiOffHwCfg(struct btc_coexist *pBtCoexist)
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_IS_IN_MP_MODE, &bIsInMpMode);
 	if (!bIsInMpMode)
-		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x0); /* BT select s0/s1 is controlled by BT */
+		/* BT select s0/s1 is controlled by BT */
+		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x0);
 	else
-		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1); /* BT select s0/s1 is controlled by WiFi */
+		/* BT select s0/s1 is controlled by WiFi */
+		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1);
 }
 
 static void halbtc8723b2ant_InitHwConfig(struct btc_coexist *pBtCoexist, bool bBackUp)
@@ -2310,7 +2380,8 @@ static void halbtc8723b2ant_InitHwConfig(struct btc_coexist *pBtCoexist, bool bB
 	halbtc8723b2ant_CoexTableWithType(pBtCoexist, FORCE_EXEC, 0);
 
 	/*  Enable counter statistics */
-	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0xc); /* 0x76e[3] = 1, WLAN_Act control by PTA */
+	/* 0x76e[3] = 1, WLAN_Act control by PTA */
+	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0xc);
 	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x778, 0x3);
 	pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x40, 0x20, 0x1);
 }
@@ -2339,7 +2410,8 @@ void EXhalbtc8723b2ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
 	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0x4);
 
 	/*  */
-	/*  S0 or S1 setting and Local register setting(By the setting fw can get ant number, S0/S1, ... info) */
+	/*  S0 or S1 setting and Local register setting(By the setting fw can */
+	/*  get ant number, S0/S1, ... info) */
 	/*  Local setting bit define */
 	/*	BIT0: "0" for no antenna inverse; "1" for antenna inverse */
 	/*	BIT1: "0" for internal switch; "1" for external switch */
@@ -2400,25 +2472,18 @@ void EXhalbtc8723b2ant_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 
 void EXhalbtc8723b2ant_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 {
-	if (type == BTC_LPS_ENABLE) {
+	if (type == BTC_LPS_ENABLE)
 		pCoexSta->bUnderLps = true;
-	} else if (type == BTC_LPS_DISABLE) {
+	else if (type == BTC_LPS_DISABLE)
 		pCoexSta->bUnderLps = false;
-	}
 }
 
 void EXhalbtc8723b2ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
 {
-	if (type == BTC_SCAN_START) {
-	} else if (type == BTC_SCAN_FINISH) {
-	}
 }
 
 void EXhalbtc8723b2ant_ConnectNotify(struct btc_coexist *pBtCoexist, u8 type)
 {
-	if (type == BTC_ASSOCIATE_START) {
-	} else if (type == BTC_ASSOCIATE_FINISH) {
-	}
 }
 
 void EXhalbtc8723b2ant_MediaStatusNotify(struct btc_coexist *pBtCoexist, u8 type)
@@ -2477,12 +2542,10 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 		pCoexSta->btInfoC2h[rspSource][i] = tmpBuf[i];
 		if (i == 1)
 			btInfo = tmpBuf[i];
-
 	}
 
-	if (pBtCoexist->bManualControl) {
+	if (pBtCoexist->bManualControl)
 		return;
-	}
 
 	if (rspSource != BT_INFO_SRC_8723B_2ANT_WIFI_FW) {
 		pCoexSta->btRetryCnt = pCoexSta->btInfoC2h[rspSource][2] & 0xf; /* [3:0] */
@@ -2494,7 +2557,10 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 		pCoexSta->bBtTxRxMask = (pCoexSta->btInfoC2h[rspSource][2] & 0x40);
 		pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_BL_BT_TX_RX_MASK, &pCoexSta->bBtTxRxMask);
 		if (pCoexSta->bBtTxRxMask) {
-			/* BT into is responded by BT FW and BT RF REG 0x3C != 0x01 => Need to switch BT TRx Mask */
+			/*
+			 * BT into is responded by BT FW and BT RF REG 0x3C != 0x01
+			 * => Need to switch BT TRx Mask
+			 */
 			pBtCoexist->fBtcSetBtReg(pBtCoexist, BTC_BT_REG_RF, 0x3c, 0x01);
 		}
 
@@ -2506,14 +2572,14 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 			if (bWifiConnected)
 				EXhalbtc8723b2ant_MediaStatusNotify(pBtCoexist, BTC_MEDIA_CONNECT);
 			else
-				EXhalbtc8723b2ant_MediaStatusNotify(pBtCoexist, BTC_MEDIA_DISCONNECT);
+				EXhalbtc8723b2ant_MediaStatusNotify(
+					pBtCoexist, BTC_MEDIA_DISCONNECT
+				);
 		}
 
-		if ((pCoexSta->btInfoExt & BIT(3))) {
+		if ((pCoexSta->btInfoExt & BIT(3)))
 			halbtc8723b2ant_IgnoreWlanAct(pBtCoexist, FORCE_EXEC, false);
-		} else {
-			/*  BT already NOT ignore Wlan active, do nothing here. */
-		}
+		/*  else, BT already NOT ignore Wlan active, do nothing here. */
 	}
 
 	/*  check BIT2 first ==> check if bt is under inquiry or page scan */
@@ -2553,7 +2619,8 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 
 	if (!(btInfo & BT_INFO_8723B_2ANT_B_CONNECTION)) {
 		pCoexDm->btStatus = BT_8723B_2ANT_BT_STATUS_NON_CONNECTED_IDLE;
-	} else if (btInfo == BT_INFO_8723B_2ANT_B_CONNECTION)	{ /*  connection exists but no busy */
+	} else if (btInfo == BT_INFO_8723B_2ANT_B_CONNECTION) {
+		/*  connection exists but no busy */
 		pCoexDm->btStatus = BT_8723B_2ANT_BT_STATUS_CONNECTED_IDLE;
 	} else if (
 		(btInfo & BT_INFO_8723B_2ANT_B_SCO_ESCO) ||
@@ -2589,7 +2656,8 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 void EXhalbtc8723b2ant_HaltNotify(struct btc_coexist *pBtCoexist)
 {
 	halbtc8723b2ant_WifiOffHwCfg(pBtCoexist);
-	pBtCoexist->fBtcSetBtReg(pBtCoexist, BTC_BT_REG_RF, 0x3c, 0x15); /* BT goto standby while GNT_BT 1-->0 */
+	/* BT goto standby while GNT_BT 1-->0 */
+	pBtCoexist->fBtcSetBtReg(pBtCoexist, BTC_BT_REG_RF, 0x3c, 0x15);
 	halbtc8723b2ant_IgnoreWlanAct(pBtCoexist, FORCE_EXEC, true);
 
 	EXhalbtc8723b2ant_MediaStatusNotify(pBtCoexist, BTC_MEDIA_DISCONNECT);

base-commit: 28924df2a08f440c73991b83028032c901de2ae4
-- 
2.53.0

