Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E76733F5BC
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791704685; cv=none; b=PIOlgYwsqwYueuD2i+IhXbEXkqMT4xB1/sSGoCzXjSab9tZsGu/m0jucwBV3C5JWb7lGs5dhcurXwSs4TblAWnPa4949iCS1twGEV6vAXL/mHr3IwksxMlvhrxE1L5J7eRYmZmGbDuLid18XDRX30XTIMoElYw4v0n+QHWy4OIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791704685; c=relaxed/simple;
	bh=rGMbyhib4zZcg3k4zdkgCRV8ZgOgMOEaU/d0FumPSQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n8yDc6C/NEdW88Acmgu6RIiQ+IeVWB3unwNNE2UA/IVVFtrBNa5v9+cRiV1vhTMgFvvxf72OnSk6m4sJ9uwhCLDCro2p9A4tI7UgoXR6IEUN5xKshzGFQAdLiUlkz77IbrfQxjMWWZFF+JZkn+TmVqlJrLnLul80sBdbBW2rtLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJzyLD7A; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJzyLD7A"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so1445205e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791704682; x=1792309482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xEpLIief8ocWMfrgYIPs7JbK9l0pcCQt5z82oKv+qFc=;
        b=VJzyLD7AGHCkW4mUPuNXfGmJ6B6CkOdQKonl0VVjZP457cyFHZEwn5bBXXAdGYK/In
         wc9gF9xVwhlquB2zIsg1/jStc7QcF3KVuf31Rtjxa9XAh0ww/CP14lVPYeQKMFv10kry
         yiN/DSDayLqc3YfJWz2y+a1p8qiqu1Iq4l4qOs+Z0YKPeJ0VwSo4vR1qmIQ/BwEd/NXV
         GWBxLIZKl683SBrKTfoeqPJ6aXlNw915JDnl2hy7Cc8qyJnSwXeyE+AR4AbITKJAGwTh
         QeC9V7ttjsSFRBMtlPguidziWhR1NJK7nRPxdL1KcAwmarWWRTCbY7rsYLnIleeT0ZN6
         z6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791704682; x=1792309482;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xEpLIief8ocWMfrgYIPs7JbK9l0pcCQt5z82oKv+qFc=;
        b=JI/Gb9UlAan9CxHBhzXIt9ZxvzregICt1zFZALynzrWhno88Te7xFlqBS2RtMihTr9
         Sb4biIAKQ1E4C4m+cs5HA8wmi0W7QGxF7malaM+qRv70M6MAApr9HKEMGwLytJebc5Q9
         rbRFPLXx7z4pRcwe0vFOoC3LqqoRU3KsiK07hrzmgcX5TB1V2oM8qNNSCE1Z9CR6nqi/
         ZQfBrI5R0fWVkcPuOWXqDOlFje/UIpiyyCwfJw9pELgfxgcsJbXLhCfyH9QoQNJPr6yD
         NsQ0Vcz+Q3zPtymnj8+GxcQiTzYMPnouKVs8h54k5Mpv7GbTPMAc7C0wDpoVWKJg8C82
         O8ZA==
X-Forwarded-Encrypted: i=1; AKwUvBz4RBdIJ/NpsJcCaDWiAcqlq+YIrhldJ/PmA4907S6HEFNYeQAmZidNEM2ob7ClcRegQw4TZS7xDZLqBak=@vger.kernel.org
X-Gm-Message-State: AFq9FYK72w9Lr0XqtJZRWKT9bbbjq5MKJESIkgaCSF6XUN0DVjlLYKZC
	yN54o6g4+rBWgUjbjrWBJ0pQm9lfeLd0R2Zss9fRzy/TWsxBi7MtpGA+
X-Gm-Gg: AYBFou1pwNjbUi6CPkxPQyAkav3l9BbH+yS8AVh9PD59twigTXpRLw795LM3x5A3C/Z
	J+B5YzQIIBebgWEZVWq3D+1TXpJXzzowS+CQYJYbrPkXe4tEBdy0xSodi2tHXMax+SXoZqhTAnY
	VHdBowuJM70PgbbCvnKolq7IklidOERFDo5gd7LYlSpwkVSgmdeCvJvyNlhQxUE2s2QS7+JgF/P
	P4inS5/vxG/dN1qvGo4kBU+z26FBU8985QxFZQrGZO2XxcwjB41tWaPhRo9x7vcva7SmtFhOOo9
	of9/teIhSWHx6/ssmLNNOrwEhP7QsDm9CBkssrHb+6OY7mU+WyI9QxrpTsq3S5uMQJ6wG36JWh0
	hC5JihSwzN8wDJleIv5XxEqit34F9Xm9n1kLrjlfy87M7JMF9Q/akTrmgIi0A/9/vMZ7o4vP+fb
	T/DAJjSQMXHM6aNTvqZ92AUkkLGMkiCjME11zDtf7PT/OLyH6ZDxxlB7dPz78hgnDNnimF8ebJs
	8+F0WRd06FFbaR8Ee2ApA==
X-Received: by 2002:a05:600c:1906:b0:4a1:71ab:63ba with SMTP id 5b1f17b1804b1-4a18e4e5c87mr117687715e9.29.1791704682296;
        Sun, 11 Oct 2026 00:44:42 -0700 (PDT)
Received: from FranzSP11.tail2d6612.ts.net ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a198c80cb3sm47912325e9.3.2026.10.11.00.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 00:44:41 -0700 (PDT)
From: =?UTF-8?q?Fran=C3=A7ois=20Roux?= <franzelfranzel@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath12k: set the regdomain before registering the wiphy
Date: Sun, 11 Oct 2026 09:44:33 +0200
Message-ID: <20261011074433.9187-1-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ath12k marks its wiphy as REGULATORY_WIPHY_SELF_MANAGED, but it applies
the regdomain received from the firmware only after
ieee80211_register_hw(). cfg80211 announces the new wiphy to userspace
during registration, so a GET_REG request sent in that window finds a
self-managed wiphy without a regdomain:

  WARNING: net/wireless/nl80211.c:10828 at nl80211_get_reg_do+0x1d0/0x1fc [cfg80211], CPU#5: iwd/721

iwd queries the regdomain of each new wiphy right away, so this shows up
at boot. On a Microsoft Surface Pro 11 (WCN7850) it happened in 3 of 4
boots.

Apply the boot-time regdomain before ieee80211_register_hw().
regulatory_set_wiphy_regd() only queues it. cfg80211 then applies it in
wiphy_regulatory_register(), which runs under the RTNL before
wiphy_register() returns. nl80211_get_reg_do() also takes the
RTNL, so userspace can no longer see the wiphy without a regdomain.

The regdomain update no longer needs to unregister the hw on failure,
so drop that error path.

Tested on a Surface Pro 11 (WCN7850 hw2.0, WLAN.HMT.1.1.c7-00108) with
next-20260929:
- without this patch, every driver unbind/bind triggers the warning
  (12 warnings over 6 cycles);
- with it, there is no warning over two boots, two module reloads and
  17 unbind/bind cycles, and Wi-Fi connects each time;
- with CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS and the user regdomain set
  to CH, the wiphy ends up with CH after each of 4 unbind/bind cycles,
  with or without this patch. The user hint handling added by commit
  906619a00967 ("wifi: ath12k: handle regulatory hints during mac
  registration") still works.

Link: https://lore.kernel.org/all/20261006161744.3804-1-franzelfranzel@gmail.com/
Assisted-by: LLM
Signed-off-by: François Roux <franzelfranzel@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 196b80721..1208c1698 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -15041,6 +15041,18 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	for_each_ar(ah, ar, i)
 		complete_all(&ar->regd_update_completed);
 
+	/* Apply the regd received during initialization before registering
+	 * the wiphy. It is self-managed, so userspace may ask for its regd as
+	 * soon as it shows up, and cfg80211 expects one to be there.
+	 */
+	for_each_ar(ah, ar, i) {
+		ret = ath12k_regd_update(ar, true);
+		if (ret) {
+			ath12k_err(ar->ab, "ath12k regd update failed: %d\n", ret);
+			goto err_cleanup_if_combs;
+		}
+	}
+
 	ret = ieee80211_register_hw(hw);
 	if (ret) {
 		ath12k_err(ab, "ieee80211 registration failed: %d\n", ret);
@@ -15058,13 +15070,6 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	for_each_ar(ah, ar, i) {
 		struct ath12k_base *this_ab = ar->ab;
 
-		/* Apply the regd received during initialization */
-		ret = ath12k_regd_update(ar, true);
-		if (ret) {
-			ath12k_err(this_ab, "ath12k regd update failed: %d\n", ret);
-			goto err_unregister_hw;
-		}
-
 		if (this_ab->hw_params->current_cc_support) {
 			struct wmi_set_current_country_arg current_cc = {};
 			struct ieee80211_regdomain *default_regd;
@@ -15105,12 +15110,6 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 
 	return 0;
 
-err_unregister_hw:
-	for_each_ar(ah, ar, i)
-		ath12k_debugfs_unregister(ar);
-
-	ieee80211_unregister_hw(hw);
-
 err_cleanup_if_combs:
 	ath12k_mac_cleanup_iface_combinations(ah);
 

base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
-- 
2.56.0

