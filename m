Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993019;
	b=CuWk7PwlS1apt6Ub3FqL+RvgXyhiHHBfKywWxr8HkDTbL6+mg8dUxP8PmYkuSp0dV/r1
	 N3u8NnNJ0hWAHPYnY3a0ecJAUgTw3G+ne950vQcvMRp/WHAErwY4+/pgUDXg+Xd6MKTe2
	 tE5bqypvBlMIhlHpG++vh/uVJOMKAOnQ7PNROv6NBGwU/DxHOiLtkP7/xjplhXZLN8iYB
	 fUJVc7KTqzWwzplAYzvrRObrNU2JUKpP5HpcpiF5ExGP/bbAJNJUdbvtkYnoTCi1fCOiB
	 rXiwKqJsXQM4sgvU+NiE116GQJsgV/4sDzpWKPrkuRw0+rZHLuM+K7eaQJSQgXFs2OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8OuNNgHAOVhz+FAVwYZqTinDyQukbU2g3tn+Bgg72Xk=;
	b=4fvpV8m40YAPwGhVaY6QUo1aVPu/e9BCgx9OWaG7BOW8gke+2VB6OZz7kaZwZIS5sj6i
	 a3o8q4cnqhaG2CLzsvsbcEO7KVLHOj1Ge55/KHAvmRIQviSMMpOqrqczsFyn5ngHOSDu8
	 LF217DorEJyQXe2ja4dTaVdrWpJccDM4MEIz2McReMsWVUGGUsUvoMM3wziFhNg1y9Gpm
	 MeieCB68Y8aE4AXpjwCCDfFIddZJBJP6OEEi8hCjpzdUoAUwK9t7VP1AtxtUlt46iivk0
	 HMwD/5xAkPp0WqkbO/iaWNbq1KIaAltg/Np7EutTD1Q63w4FhLtOq6SlaxaPfNCbWVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="K/V4KxJq";
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B62606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B62606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K/V4KxJq
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a264b6a06bso979403b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993018; x=1793597818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OuNNgHAOVhz+FAVwYZqTinDyQukbU2g3tn+Bgg72Xk=;
        b=K/V4KxJqmVPd2yEjPPvvJnmfBjhvydkHb41gLzTN2YMDJXWrWN8g8ihSHYgcrDAeEq
         CZJh5Qg5ExRKMPCkkXOEcNveQjcfAW0dO4+TQ0MVpldCnTDn0ul3CZQG5eiHaETy2YZf
         zwJI+TcFjUp5I/tRJX2OwIG9WpIuMdicbia2QqluYC5D1kwlw6ooGwacsZ0TYdV78FZn
         49NqPH5xzj9exeFpjvucGv/7Dct1FyDYtNsjXE1UD2osBC6c5gSFyDWBQqYb6hXwr5SS
         nXx3q1qNm0uQ/DianS23Ge8DC2lh+BHW/4IDUJqBOCmFlJb3NCW4Mtf00xG9h3UDy/uI
         9AQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993018; x=1793597818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8OuNNgHAOVhz+FAVwYZqTinDyQukbU2g3tn+Bgg72Xk=;
        b=ecltsP/r6aeQa/5s04mI10Q6/48p/CLcW4dZ1aUhGn2hBWm3GpkxUk7bAhvTWHM728
         B7DWAQ877xjcpMqm8hz7JXxZN9SKqDTJFvw3ndP3TUcVF+AIOqgy3qebwASg6t56ayH1
         H5+1iCHrOntdSodrJKYJcrB0Kih+cBiPc8jVAiHnUVDB7He7B2HgWmU5oPayd/pMlybT
         VyNs4ZFVysYR6J3B4yg30dOnMYvuZUcukNKuHpwNhZnV8wmDCcz8PR1CUzACt/eZB109
         JbutEaQGQjBg4UWhhgaN0/QWuVrtqiY3s8nhf+Q+3yqn8F/I/mCxDLGl+SmVoCpNrJo3
         lWbw==
X-Forwarded-Encrypted: i=1; AKwUvBw7BPVTSOyDBT+JPZW9aTFg83dIAlexawmr2bmgWg4xIO7I7xCw3y95K9EgRi0vtAb6yszLuG9mEB7TVJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPo38709dR3KLpg5KuYJudvEWoMjgVDm35bXySB+rEt+GKNQRb
	2R5skA1V4lgZS9lHrAd0fr8BPESSEJ5Ft6AZEGOqgjAE+Ck9cWObRU6F
X-Gm-Gg: AYBFou0u7v2k4a6VgcHjF8z2yD4fZyrT9r+lt2eZxWjMNwcIRPKtmuhuM2tuBtzfxbZ
	fTqW8vucR/Vmt0+rJrno0qetI/s+0iMbdbTmCFODjM3kGMo3sdVuYFHCQtc6yVnT3AvP/1Ja5n+
	FLKDtzT/07MES/0/R4cDz4tYZSRd0je8Lv6o4lswtWQARf5nz2LpQPcQB+c0a4xCkn7K1xVIIIq
	QZoKswR6fGRKgaE2vHvqrjD1dHoV4cDWSXCPaZ4oeLcOzSt21oTnUJXTDOK7U9vrzu+wHJ3ud9J
	ojYSmnle5aYqG65G0UxsLqoG5q8uWGFbKh2RL1GznQL5di5THbFO7v3YdmOT432+QcZCfmguPcG
	4T05MZu1z/lBMW0gy/30mWslPNsGOJZs0jVtoP0NiLr4xQQ3Yo2TRWWhPhK7iv2pa5BCpOjj9K1
	bkivZb6kGyMlYVv1+28U77GeSj4j+A3+14/fF/UYqidHox3dE1fytj+nuDq81p5MB5RdWTQxi5k
	xS5Oni9lpfS0U3KpIfQSE7c5n3y9ZI8By8OwSDCJy5jPyOGl/WrtSl3Ey72tamv4FEhgWidbwVs
	bmk9
X-Received: by 2002:a05:6a00:301e:b0:8a0:5d8f:6675 with SMTP id d2e1a72fcca58-8a369c1e10emr4233130b3a.58.1792993018446;
        Sun, 25 Oct 2026 22:36:58 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:673b:a930:e065:eca])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d867a0sm927851b3a.2.2026.10.25.22.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:36:58 -0700 (PDT)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH wireless-next 03/17] wifi: brcmsmac: look up OFDM rates in rate.c
Date: Mon, 26 Oct 2026 13:36:09 +0800
Message-ID: <20261026053633.361454-4-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026053633.361454-1-ragulbaby@gmail.com>
References: <20261026053633.361454-1-ragulbaby@gmail.com>
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

Move the OFDM rate table next to its only user, ofdm_phy2mac_rate(),
which leaves rate.c independent of the PHY code. No functional change.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/phy/phy_cmn.c | 17 -----------------
 .../broadcom/brcm80211/brcmsmac/phy/phy_hal.h |  2 --
 .../broadcom/brcm80211/brcmsmac/rate.c        | 19 +++++++++++++++++++
 .../broadcom/brcm80211/brcmsmac/rate.h        |  7 -------
 4 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
index 7eae73ef7..d519e950c 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
@@ -101,18 +101,6 @@ static const struct chan_info_basic chan_info_all[] = {
 	{216, 5080}
 };
 
-static const u8 ofdm_rate_lookup[] = {
-
-	BRCM_RATE_48M,
-	BRCM_RATE_24M,
-	BRCM_RATE_12M,
-	BRCM_RATE_6M,
-	BRCM_RATE_54M,
-	BRCM_RATE_36M,
-	BRCM_RATE_18M,
-	BRCM_RATE_9M
-};
-
 #define PHY_WREG_LIMIT  24
 
 void wlc_phyreg_enter(struct brcms_phy_pub *pih)
@@ -2486,11 +2474,6 @@ u8 wlc_phy_stf_chain_active_get(struct brcms_phy_pub *pih)
 	return active_bitmap;
 }
 
-const u8 *wlc_phy_get_ofdm_rate_lookup(void)
-{
-	return ofdm_rate_lookup;
-}
-
 void wlc_phy_ldpc_override_set(struct brcms_phy_pub *ppi, bool ldpc)
 {
 	return;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
index 7ffff7f51..c5aaaec43 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
@@ -234,8 +234,6 @@ void wlc_phy_ofdm_rateset_war(struct brcms_phy_pub *pih, bool war);
 void wlc_phy_bf_preempt_enable(struct brcms_phy_pub *pih, bool bf_preempt);
 void wlc_phy_machwcap_set(struct brcms_phy_pub *ppi, u32 machwcap);
 
-const u8 *wlc_phy_get_ofdm_rate_lookup(void);
-
 s8 wlc_phy_get_tx_power_offset_by_mcs(struct brcms_phy_pub *ppi,
 				      u8 mcs_offset);
 s8 wlc_phy_get_tx_power_offset(struct brcms_phy_pub *ppi, u8 tbl_offset);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
index 6841bc005..ac577c8e8 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
@@ -266,6 +266,25 @@ const struct brcms_c_rateset cck_rates = {
 	  0x00, 0x00, 0x00, 0x00, 0x00}
 };
 
+static const u8 ofdm_rate_lookup[] = {
+
+	BRCM_RATE_48M,
+	BRCM_RATE_24M,
+	BRCM_RATE_12M,
+	BRCM_RATE_6M,
+	BRCM_RATE_54M,
+	BRCM_RATE_36M,
+	BRCM_RATE_18M,
+	BRCM_RATE_9M
+};
+
+/* Convert encoded rate value in plcp header to numerical rates in 500 KHz
+ * increments */
+static inline u8 ofdm_phy2mac_rate(u8 rlpt)
+{
+	return ofdm_rate_lookup[rlpt & 0x7];
+}
+
 /* check if rateset is valid.
  * if check_brate is true, rateset without a basic rate is considered NOT valid.
  */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
index e178b1a0e..7c1d43323 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
@@ -198,13 +198,6 @@ static inline u8 cck_rspec(u8 cck)
 	return cck & RSPEC_RATE_MASK;
 }
 
-/* Convert encoded rate value in plcp header to numerical rates in 500 KHz
- * increments */
-static inline u8 ofdm_phy2mac_rate(u8 rlpt)
-{
-	return wlc_phy_get_ofdm_rate_lookup()[rlpt & 0x7];
-}
-
 static inline u8 cck_phy2mac_rate(u8 signal)
 {
 	return signal/5;
-- 
2.53.0

