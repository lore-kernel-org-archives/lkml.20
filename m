Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371179;
	b=hUCOF/M8KYNatlk/74FKzkJvQa+HWGkW60aVvQdEPGGrkcEClD1U+gBDkDmuu/stjAW7
	 m+yGNI7aBGvCxKY1hO6qX+VUxuRW/A8A+tEPF0UXWtvbvxPYMWocfCUmGzj26UY3IuzQX
	 mqm9pOBxRByCP0zMh9xkP+8/gSgW6eROXCateuhM6DUQ/sK/2PZn7NJiFJkcOYlffr9W+
	 GJOUyu00nmEMufQjkwZJS6fuz9ZOmVJfN6W/0O3Ksg5x1wglJzvMGtTaOZ2zFnuujqVsp
	 nLxLqUFrY7tdCkO31NZWyjyGlZLxxk18BYD29p5ayKWjBq9WotdcLVaB4YmMMhQEk7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w9+enRz9+49Kj6aoYhV9lhezB7kfDVt/RIXg+q85+po=;
	b=cUnbsyiLZV/1vlDN5ltGTTvKbbOI6hYor8Rx+dabDXNu1b45/0ZO2T4NAPMVrIeH5I3f
	 /1eUXtzWL9F0Kc54Yd+G6SDBKAcxls7b4YdGWJMIE1FmaqaZFaIeh3gK6gWS4h0XvBvCU
	 7xMD7Hpgu1XNbZ+IC8mMFnS5zUxN4G+k39r4ZGRN/c7QVNe4ai9wMwqASqNd1ddaeq1xe
	 3pGKaFkvT5Zmfmz3zy6I+7Dey6bDrn2W6MzxkbnEF9UZk3fEueFvqmcP6a2/NpMNoQH3Y
	 nt1FyUg2ectR65tYGcU92wNh/of5RDkTVoqFsyiQVDe42f6vhvtn4MK+njSHC1TOvxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pNEtn/VP";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C026060A382C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C026060A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pNEtn/VP
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so1747782a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371178; x=1794975978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9+enRz9+49Kj6aoYhV9lhezB7kfDVt/RIXg+q85+po=;
        b=pNEtn/VPs/gPgU5UwEwcL5lWla3PTU98T4FxNoJMYT0yZl8UlFQ10uIZzuh56zhbnf
         g9EQDHYF3lxzOKcIxKR93UCgHZMv0czCDXFs7pNhDCU42E/17eynBwJKVelSvdPas84P
         AIbeqq4Nf2KrimggLf+uKChWPmGAMamU8SxgNzcCpLKy4zpVbH6dKXHXVVrgsJaSkcph
         TgKK5O53NfupYv1MXq81N0qoT2WapKulQzbvFzyaSXIi39acCCWNdmg4lQqKCNzqZ+Lh
         cytOyHXFdzPzu0ouQu1TonbTizWyzisXfRHVxmlzU1FQodvzHHrarvGY5fj+/vNMOkxG
         tqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371178; x=1794975978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9+enRz9+49Kj6aoYhV9lhezB7kfDVt/RIXg+q85+po=;
        b=GJgu9FUu1mo8pIBZq669tYam7slB3pZ/lDECmtowNYnWsXrsE9sFRMP2WlJ90KgJzf
         +dcpfbbW6PRw9VephdEAbKwv6rKE5kvR7VH3tab+1pVoEG0o8E/1iByyQjY5VtNMW3Co
         xCJppGGTlavoUQAeQqfrs2FVlJnAiDcpGQtHfazzVPYCxrPo9qHa4PYtiEN+Nog/mdaP
         jB/IH/b4K5dKqhG/hTcgwFXIgR30uIPvHfmY5IWkJGC5xPum52I4bFY+PMqmDV24hpJ9
         L/aGo2FEI9RdzmJZGdMc6UH7dN7+QeU/B499ZNDczEusaX1j3d8FQ4CTBsKMFXXBWSsr
         141w==
X-Forwarded-Encrypted: i=1; AL+hErHQ2vdtauA9cAu+TBN1kujJ56/CQx4j8oooLVymCzv4QzJB28r2SLS2zF/c41W2/shFrC5ulrvBFzvNNE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BZ8mVwBzyA97s3QMvgd+diDBSySTxsfy14FSkeh3Xv6G4wb/V
	fQ21kN6Xi4RwFQNJBB1ZTVij0hoiEm0D8XlTorTeRY/JbwzfKOXpn7CXJ1BHTovF
X-Gm-Gg: AYBFou3s3vsfWFYp5h0NvXyyBUXvUwDqn3nL3Tn9NF+3oib2lgUknjGgfZWX8jHa1o4
	NQdcjlF4o6b/y0Mlvk4gzGoBp0/F0gycPxHj+g/dxUH1BMrhDsqNnTbxz5tYlMjADKwKwkUWL5c
	Jj6cgZUXbx1IfdT7JfNG4yt/1k2cIdKS1Crj6wlhATDdxmccSS68C19NoEYFN74knozltBWkayW
	lxYSaBSft0LBiZ1hyh/W7GBppWUadwv4uWhG1jEA+JwOjmudmyKF7UW7TgYEe2JQOKYWpL7zHW2
	fTeoDN1JH+imskwhTLAZo6r7bjztsMlej687QOPp+eKMetrrT+MRECIeE70Lpcp9D5aXpBzSaFL
	cLPFai3scXfiSLil/di+X54A4SpJgtShncpJx9qS/1LxhWJZd8xesgJYf9YqC4KpXHD6/woqx10
	nFv7G6OhK5ien0Al1uiAavHGIi7Qt4lh7YIyFmEik2Be0/Q1CFAyRlV/xTbN5BoEg/hQS/yYU0Z
	s11GEKPPudEf9BGByXh5yC4TPmi8FLmSmIQ7EOqfCYLiZ5qIlUwfbFUX0nnTTpxcOYON5FgWh1r
	CcjPkh8sozHV51qgwhEptxblBlN0FBnBrx1iWfJAJxsy+FaWHCMmm+OyJniHkESJrrBfhCyi+vX
	EUlZiiKxejh5Kbrard9Uhjd+sCCGqQH+xw15wKvn9OjO55ewYUQZMjPvkTvKqvwLDa5Av8q5OpQ
	MczkOF/TGSWPv+8nEmKCLsFEI=
X-Received: by 2002:a17:90b:2e83:b0:3b0:9941:8d42 with SMTP id 98e67ed59e1d1-3b182f26e45mr1260122a91.33.1794371177905;
        Tue, 10 Nov 2026 20:26:17 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:17 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 5/7] wifi: brcmsmac: embed brcms_protection in brcms_c_info
Date: Tue, 10 Nov 2026 20:25:52 -0800
Message-ID: <20261111042554.232998-6-rosenp@gmail.com>
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

The protection settings (struct brcms_protection) have the same
lifetime as struct brcms_c_info. Embed them directly instead of
allocating them separately, removing one kzalloc()/kfree() pair and
its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/channel.c     |  6 ++--
 .../broadcom/brcm80211/brcmsmac/main.c        | 31 +++++++------------
 .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
 3 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c
index a5c1c4d45683..b4c575f8c0f6 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c
@@ -312,13 +312,13 @@ brcms_c_set_country(struct brcms_cm_info *wlc_cm,
 	struct brcms_c_info *wlc = wlc_cm->wlc;
 
 	if ((wlc->pub->_n_enab & SUPPORT_11N) !=
-	    wlc->protection->nmode_user)
+	    wlc->protection.nmode_user)
 		brcms_c_set_nmode(wlc);
 
 	brcms_c_stf_ss_update(wlc, &wlc->bandstate[BAND_2G_INDEX]);
 	brcms_c_stf_ss_update(wlc, &wlc->bandstate[BAND_5G_INDEX]);
 
-	brcms_c_set_gmode(wlc, wlc->protection->gmode_user, false);
+	brcms_c_set_gmode(wlc, wlc->protection.gmode_user, false);
 
 	return;
 }
@@ -387,7 +387,7 @@ brcms_c_channel_set_chanspec(struct brcms_cm_info *wlc_cm, u16 chanspec,
 	if (ch->flags & IEEE80211_CHAN_NO_OFDM)
 		brcms_c_set_gmode(wlc, GMODE_LEGACY_B, false);
 	else
-		brcms_c_set_gmode(wlc, wlc->protection->gmode_user, false);
+		brcms_c_set_gmode(wlc, wlc->protection.gmode_user, false);
 
 	brcms_b_set_chanspec(wlc->hw, chanspec,
 			      !!(ch->flags & IEEE80211_CHAN_NO_IR),
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 2140feb86964..bd1880e3738f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -420,7 +420,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 
 	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
-	kfree(wlc->protection);
 	kfree(wlc->stf);
 	kfree(wlc->corestate);
 	kfree(wlc->hw);
@@ -466,12 +465,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 		goto fail;
 	}
 
-	wlc->protection = kzalloc_obj(*wlc->protection, GFP_ATOMIC);
-	if (wlc->protection == NULL) {
-		*err = 1016;
-		goto fail;
-	}
-
 	wlc->stf = kzalloc_obj(*wlc->stf, GFP_ATOMIC);
 	if (wlc->stf == NULL) {
 		*err = 1017;
@@ -3878,37 +3871,37 @@ void brcms_c_protection_upd(struct brcms_c_info *wlc, uint idx, int val)
 
 	switch (idx) {
 	case BRCMS_PROT_G_SPEC:
-		wlc->protection->_g = (bool) val;
+		wlc->protection._g = (bool) val;
 		break;
 	case BRCMS_PROT_G_OVR:
-		wlc->protection->g_override = (s8) val;
+		wlc->protection.g_override = (s8) val;
 		break;
 	case BRCMS_PROT_G_USER:
-		wlc->protection->gmode_user = (u8) val;
+		wlc->protection.gmode_user = (u8) val;
 		break;
 	case BRCMS_PROT_OVERLAP:
-		wlc->protection->overlap = (s8) val;
+		wlc->protection.overlap = (s8) val;
 		break;
 	case BRCMS_PROT_N_USER:
-		wlc->protection->nmode_user = (s8) val;
+		wlc->protection.nmode_user = (s8) val;
 		break;
 	case BRCMS_PROT_N_CFG:
-		wlc->protection->n_cfg = (s8) val;
+		wlc->protection.n_cfg = (s8) val;
 		break;
 	case BRCMS_PROT_N_CFG_OVR:
-		wlc->protection->n_cfg_override = (s8) val;
+		wlc->protection.n_cfg_override = (s8) val;
 		break;
 	case BRCMS_PROT_N_NONGF:
-		wlc->protection->nongf = (bool) val;
+		wlc->protection.nongf = (bool) val;
 		break;
 	case BRCMS_PROT_N_NONGF_OVR:
-		wlc->protection->nongf_override = (s8) val;
+		wlc->protection.nongf_override = (s8) val;
 		break;
 	case BRCMS_PROT_N_PAM_OVR:
-		wlc->protection->n_pam_override = (s8) val;
+		wlc->protection.n_pam_override = (s8) val;
 		break;
 	case BRCMS_PROT_N_OBSS:
-		wlc->protection->n_obss = (bool) val;
+		wlc->protection.n_obss = (bool) val;
 		break;
 
 	default:
@@ -6800,7 +6793,7 @@ brcms_c_rspec_to_rts_rspec(struct brcms_c_info *wlc, u32 rspec,
 	if (use_rspec)
 		/* use frame rate as rts rate */
 		rts_rspec = rspec;
-	else if (wlc->band->gmode && wlc->protection->_g && !is_cck_rate(rspec))
+	else if (wlc->band->gmode && wlc->protection._g && !is_cck_rate(rspec))
 		/* Use 11Mbps as the g protection RTS target rate and fallback.
 		 * Use the brcms_basic_rate() lookup to find the best basic rate
 		 * under the target in case 11 Mbps is not Basic.
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 94966418b069..266fe7825042 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -549,7 +549,7 @@ struct brcms_c_info {
 	s8 shortslot_override;
 	bool include_legacy_erp;
 
-	struct brcms_protection *protection;
+	struct brcms_protection protection;
 	s8 PLCPHdr_override;
 
 	struct brcms_stf *stf;
-- 
2.56.0

