Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371177;
	b=PUCyxVSm7V5xs0WSKAn38Y4na4J3A6XISYqb9+FbDJ3aCFP4u4+u/FOZt9T4mU3ec5Vn
	 DoijAFujznmLMpJL5As+XaqR6beOXIbhen68yBjllg8QArNEu5DFXpETlQWb3LqzZvSuW
	 PKTxWJTuwz6UZnrNo8Uxfdds4DTrxcvvcqDBVK0zYO8SsXzY96E3OWm0Ww/eTFLQyoKuQ
	 yXj4lNrzr11QSMH4c/uzXrpW4TjyW5XhcTVULHgAodypFkE9IGOPYS63SE7w0G7sC5U+3
	 c8NORMjZ9bpW/VaCVqMCjma/yjNVhEaMpzCKbEv/Qtkf0buiLFGSEJ/XdS91UD0buZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5fVFyYp3e9+uqEfX9h8TpIz4lzT5VdcXQx7G7TjI+E4=;
	b=DjRlFQx3oV2UBHc9k2CQXqBK5/edliP5WzpWgueJf9Wh/fd2hr4cLeTamlqdpsS+TL7F
	 v5AgcpHiTcHCBg1MFPXwFX7nI6wPWTTqOXLdcF9c1UW2GhwZWwfNIfIfYk2yraZFUWfq0
	 /j6EBPlvuf8ytHP/k+rNGIm4cQU4c/WDLp2mPKJPnKKxLg2MwS6gUCAhTdtXjjiz09LuH
	 /dxzT1u6OKUdf01KiXjI4n+i8J54oAN9QfmzZ1kZ71Gd7cMahGs9jjXOFayYZmo7gmc/y
	 J62kflqgNAOc7UUHpQElYkN6XQwy/zpGdAkweoTTQ/E4ypkUK7NELr/9TTtdhoG/srw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1KPIeC1;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4347A60A3818
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4347A60A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1KPIeC1
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1594830a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371176; x=1794975976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fVFyYp3e9+uqEfX9h8TpIz4lzT5VdcXQx7G7TjI+E4=;
        b=c1KPIeC13Tdd2tYSxW6i5zgkQI/DV0auPMR6gJdC0jN4iDiD6lknFhSo10bdQZjVfD
         zjtjXKQvObuOBVG0MK0sm827wJY+MLyfhojFxvhJ8zJgkCBvibSfO5pom0xX1Ncjkdjw
         /SX+IIQTuZ6qhPh1nZvERnUnFLZQoDYnBKIkpCRNhkbkatcc6Yd7oJEnD2v8JS7BGfCE
         KTuPw/qUKnNA3TQTNXSEWR0DhlRWe2RagVw5k/VAXZjBD4twZk2NMyuJeK6obuQnzV5y
         Uku8uUWOsN49NfGNZtE683f32ROIzMVMV9gIY/sviJKuSwzmE23Mr/4N1YOtyJcteM33
         C6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371176; x=1794975976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5fVFyYp3e9+uqEfX9h8TpIz4lzT5VdcXQx7G7TjI+E4=;
        b=O6DQkqPsUFP/faiLX7+1YF5bSgry1GHD2nGKwx8i5sObZYuz+v7hw6hnPDuXiooV4I
         oREo8QKE62VCfVy7WXH1P+r50PFv9s7yRnWLET47QcNK17nXwLVioRpn0xPYOAZBhn2l
         OBu1kFGYTwZNnkY4fO3iJ2nxpCbtpxEFuEZZUNwywwmdMvnIHcGlIIh3dMaM9W9wKqNg
         3EDozes58ODUJn4HwmpbwVO97uwQyRYq0EdsUcxlPENdRTBUaw1pdxCE5fhSz/19W8KE
         oZyFt0cDgnEm2/EW2jt4yB7PIr+QeZudwm8ElQIyJlsZfJjVvwbXyGRcJJ9ZfWZvEfBX
         raRw==
X-Forwarded-Encrypted: i=1; AL+hErELR7pcaUStczJ5bBMAC3qnA2mUhAv0UO/LrvUlnj8V+hewKDn+dFa0nnhxcjLNqw4VmRX7l5jPTg5kPzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+So4ZIEmMvthz/Q2LSjBRAC2tGvWPZih6Dcv8auGlyAnu4usi7
	h5cvlkcMuA09W4aDPLwfgqDfrfjt3PkR67T2USFUEumiTUvlk5RZz5cO
X-Gm-Gg: AYBFou30c4iE1tJXXnE3pZKP5N3b3bAnaAj3eto17fZ9uU/KN8j44qPrlEIgsIfhNab
	jFrNYYvJOtZ1Ch+weRXOiH0mqOBT4pK6WVq4cYy8rOAG//NIZgfzi0E/2QgSU96v/8ezcDBrviI
	POV9rJf/qxYU2Q5dapHaLABjdx48n5k9PH/JZi+rBZkuNdHfk4LL8EA5YC0A7uXfkQT8cft/KQk
	OFYctO4+YdO16brzT/yM8y6/RmuDyYcvdLcxKTNL3tn0L8g2NTGqfz4K17wTVW+ugkktuD9A79J
	91SFcLBVVsz1GCJxgKX3qMogsnfovIqlj01zJRLVoJemLTL+kS4qswI5mQYHsJsn3CY6LOTfrqr
	rPxmD4Kqfv+abYBPtLELX4V5x9QGZd37b3zp8zKhU23jR//Gkudy02we7efysOM+Zm/QbVLhvVP
	2yP9MixZuhcJzxmi8v8JoPPVhHKqsmZqDQZtlxg29vyKPfJpAR0O0+NA6Pd9sYKnb/WdnmcWBPL
	qW1aKR58Uv/uoQr5YJMd4OrmTdR91j5p0pS49OFXsXpmtsNUwDcvmR2kWqIfZCFau40ulfYXVm4
	+04vIHyC3YhPJOCCvxP6JBYOcljyOPNbsrQgTC5k54vc+7xoUaEKKpy10gIKHnDCFe92AFcbZpa
	++pahQ+4XV164Ybrv7QOiB92CoP0k+SIfWK6B07GbfF/yQ2o0yF3lhIIbAKaCnn0/oDIahTqFc+
	VANFU=
X-Received: by 2002:a17:90a:da83:b0:3ac:860e:1af9 with SMTP id 98e67ed59e1d1-3b182fb013fmr942201a91.41.1794371176404;
        Tue, 10 Nov 2026 20:26:16 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:15 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 4/7] wifi: brcmsmac: embed default_bss in brcms_c_info
Date: Tue, 10 Nov 2026 20:25:51 -0800
Message-ID: <20261111042554.232998-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111042554.232998-1-rosenp@gmail.com>
References: <20261111042554.232998-1-rosenp@gmail.com>
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

Replace the separately allocated default_bss pointer with a
directly embedded struct brcms_bss_info in brcms_c_info,
removing one kzalloc()/kfree() pair and its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/ampdu.c       |  2 +-
 .../broadcom/brcm80211/brcmsmac/main.c        | 35 ++++++++-----------
 .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
 3 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
index fc7a5dd2e5d8..b40761e571c2 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
@@ -862,7 +862,7 @@ brcms_c_ampdu_dotxstatus_complete(struct ampdu_info *ampdu, struct scb *scb,
 				brcms_dbg_ht(wlc->hw->d11core,
 					  "%s: Pkt tx suppressed, illegal channel possibly %d\n",
 					  __func__, CHSPEC_CHANNEL(
-					  wlc->default_bss->chanspec));
+					  wlc->default_bss.chanspec));
 			} else {
 				if (supr_status != TX_STATUS_SUPR_FRAG)
 					brcms_err(wlc->hw->d11core,
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index d000e2a70870..2140feb86964 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -420,7 +420,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 
 	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
-	kfree(wlc->default_bss);
 	kfree(wlc->protection);
 	kfree(wlc->stf);
 	kfree(wlc->corestate);
@@ -461,12 +460,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 	}
 	wlc->hw->wlc = wlc;
 
-	wlc->default_bss = kzalloc_obj(*wlc->default_bss, GFP_ATOMIC);
-	if (wlc->default_bss == NULL) {
-		*err = 1010;
-		goto fail;
-	}
-
 	wlc->bsscfg = kzalloc_obj(*wlc->bsscfg, GFP_ATOMIC);
 	if (wlc->bsscfg == NULL) {
 		*err = 1011;
@@ -822,7 +815,7 @@ brcms_c_dotxstatus(struct brcms_c_info *wlc, struct tx_status *txs)
 		brcms_dbg_tx(wlc->hw->d11core,
 			     "Pkt tx suppressed, dest chan %u, current %d\n",
 			     (xfts >> XFTS_CHANNEL_SHIFT) & 0xff,
-			     CHSPEC_CHANNEL(wlc->default_bss->chanspec));
+			     CHSPEC_CHANNEL(wlc->default_bss.chanspec));
 	}
 
 	tx_frame_count =
@@ -3311,7 +3304,7 @@ brcms_default_rateset(struct brcms_c_info *wlc, struct brcms_c_rateset *rs)
 	brcms_c_rateset_default(rs, NULL, wlc->band->phytype,
 		wlc->band->bandtype, false, BRCMS_RATE_MASK_FULL,
 		(bool) (wlc->pub->_n_enab & SUPPORT_11N),
-		brcms_chspec_bw(wlc->default_bss->chanspec),
+		brcms_chspec_bw(wlc->default_bss.chanspec),
 		wlc->stf->txstreams);
 }
 
@@ -4639,7 +4632,7 @@ static void brcms_c_bss_default_init(struct brcms_c_info *wlc)
 {
 	u16 chanspec;
 	struct brcms_band *band;
-	struct brcms_bss_info *bi = wlc->default_bss;
+	struct brcms_bss_info *bi = &wlc->default_bss;
 
 	/* init default and target BSS with some sane initial values */
 	memset(bi, 0, sizeof(*bi));
@@ -5198,9 +5191,9 @@ int brcms_c_set_gmode(struct brcms_c_info *wlc, u8 gmode, bool config)
 	}
 
 	/* Set default bss rateset */
-	wlc->default_bss->rateset.count = rs.count;
-	memcpy(wlc->default_bss->rateset.rates, rs.rates,
-	       sizeof(wlc->default_bss->rateset.rates));
+	wlc->default_bss.rateset.count = rs.count;
+	memcpy(wlc->default_bss.rateset.rates, rs.rates,
+	       sizeof(wlc->default_bss.rateset.rates));
 
 	return ret;
 }
@@ -5221,13 +5214,13 @@ int brcms_c_set_nmode(struct brcms_c_info *wlc)
 		wlc->pub->_n_enab = SUPPORT_HT;
 	else
 		wlc->pub->_n_enab = SUPPORT_11N;
-	wlc->default_bss->flags |= BRCMS_BSS_HT;
+	wlc->default_bss.flags |= BRCMS_BSS_HT;
 	/* add the mcs rates to the default and hw ratesets */
-	brcms_c_rateset_mcs_build(&wlc->default_bss->rateset,
+	brcms_c_rateset_mcs_build(&wlc->default_bss.rateset,
 			      wlc->stf->txstreams);
 	for (i = 0; i < wlc->pub->_nbands; i++)
 		memcpy(wlc->bandstate[i].hw_rateset.mcs,
-		       wlc->default_bss->rateset.mcs, MCSSET_LEN);
+		       wlc->default_bss.rateset.mcs, MCSSET_LEN);
 
 	return 0;
 }
@@ -5269,7 +5262,7 @@ brcms_c_set_internal_rateset(struct brcms_c_info *wlc,
 
  good:
 	/* apply new rateset */
-	memcpy(&wlc->default_bss->rateset, &new,
+	memcpy(&wlc->default_bss.rateset, &new,
 	       sizeof(struct brcms_c_rateset));
 	memcpy(&wlc->bandstate[bandunit].defrateset, &new,
 	       sizeof(struct brcms_c_rateset));
@@ -5299,7 +5292,7 @@ int brcms_c_set_channel(struct brcms_c_info *wlc, u16 channel)
 			wlc->bandinit_pending = false;
 	}
 
-	wlc->default_bss->chanspec = chspec;
+	wlc->default_bss.chanspec = chspec;
 	/* brcms_c_BSSinit() will sanitize the rateset before
 	 * using it.. */
 	if (wlc->pub->up && (wlc_phy_chanspec_get(wlc->band->pi) != chspec)) {
@@ -5343,7 +5336,7 @@ void brcms_c_get_current_rateset(struct brcms_c_info *wlc,
 	if (wlc->pub->associated)
 		rs = &wlc->bsscfg->current_bss.rateset;
 	else
-		rs = &wlc->default_bss->rateset;
+		rs = &wlc->default_bss.rateset;
 
 	/* Copy only legacy rateset section */
 	currs->count = rs->count;
@@ -5370,7 +5363,7 @@ int brcms_c_set_rateset(struct brcms_c_info *wlc, struct brcm_rateset *rs)
 		if (wlc->pub->associated)
 			mcsset_bss = &wlc->bsscfg->current_bss;
 		else
-			mcsset_bss = wlc->default_bss;
+			mcsset_bss = &wlc->default_bss;
 		memcpy(internal_rs.mcs, &mcsset_bss->rateset.mcs[0],
 		       MCSSET_LEN);
 	}
@@ -5403,7 +5396,7 @@ int brcms_c_set_beacon_period(struct brcms_c_info *wlc, u16 period)
 	if (period == 0)
 		return -EINVAL;
 
-	wlc->default_bss->beacon_period = period;
+	wlc->default_bss.beacon_period = period;
 
 	bcnint_us = period << 10;
 	brcms_c_time_lock(wlc);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 0e6a5edc74c8..94966418b069 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -524,7 +524,7 @@ struct brcms_c_info {
 	s8 ofdm_40txbw;
 	s8 mimo_40txbw;
 
-	struct brcms_bss_info *default_bss;
+	struct brcms_bss_info default_bss;
 
 	u16 mc_fid_counter;
 
-- 
2.56.0

