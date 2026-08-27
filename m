Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424094B04A3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853575; cv=none; b=HbrOmwU6fKaq8ZXLTvxUxn8OtcZiEQbP89OldZTc1z6SWKg9M//Ew/YndDWOhk+spGawaSCTyzVkOcuASnhoYp3yn+/yR/qWbFYSVhxRiFTgDBnaQgfIpZtpepnhTKY/2zI/61aLlRpyIAEHTRh+9E7MmWPF+q5T7lKclQ4NjZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853575; c=relaxed/simple;
	bh=KmjZVLDRFmwIO+/PB7Lg2YlmWzNd/QpPcrq536d1rZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fGeyiLbBvPfVn+G88et9o1/9i+4x4ZuEef8NM7flJQov5sNvN5Gm3tMKbxsYBSmnEV4Nprxj8C4VoZyjbujWcInkG2Qn1VnqbxcpNq6DBXNbkPC/sOMpsXOK7CMoTv1s0+c9XaAWyKC/cjTmc5TsKZXv9OswFqUe1VgXjzkBz+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zb0xplqg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zb0xplqg"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47db714766aso973088f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787853572; x=1788458372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yDAFIIvoVKf4kVeSrPAjhgGoxZ9yQ0YMJMc17NgMdM=;
        b=Zb0xplqgldqHdAwINA+Xyz888HbfBDmjgwIRppuFlI/WwHu8b78j9yusI9gw8Krfki
         9ObIbKNAHfol4HX9652WKcSQ5BFpH0T8+DJl5x4pacABR4Z6aAMBND2uksJ8odldeyzG
         PwtDZRTb8rW2Hs9XSbGiBGP/85m8yo4NYEkTtLCm0NksHo47CdqqFFieu9Mw1r2MUmrP
         bf5nSvVz4mloT+USKByoYV+VDIOK3JJrt2LyEni7n67kL+RHKaP1yNEws+D8ea2ORxdw
         u6MhpXVOxExxpEeFmwXEKG9WPld10OLHUZj8a+Od1TvtVxVfporsKDc5/v+EkEAd//nE
         4IQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853572; x=1788458372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0yDAFIIvoVKf4kVeSrPAjhgGoxZ9yQ0YMJMc17NgMdM=;
        b=UU+O+mz5Y1UY7wyVBLQ5d/V6lAAaQcHskxzjOAvhUVpVLPutkkTUs7ZXNQ1WQkZ87V
         v0ti5jM+asSxhIAtSlfH3/NX9N1WhrZg/lsqy0LYa7mf+3e+lESm0geTz6k+B4xhkY8M
         tAYlpur1P7hnezPm+rU27G3QBRQ5UadLQLYHwngyZHTLrMZTXcqljpxi7bwINhpzqXrl
         Xu0xxan/sUn4sQ5fGo9ZQ7bwRxBxTZzyeKB0u7bmSxp42CjQjRNWU3Ony5UeFSG0bCHx
         x7SzGo2d3ALYg0LyvgbSfZh3PZAXzP0DFz9cslIzyb3ArzQSP5isqParrdI38OA0lDFS
         1xrA==
X-Forwarded-Encrypted: i=1; AHgh+RoR/Mthyk9aRMZoWqUPAgwm91b+BSdeh2YYrZwidmm1562A+p/GB+Y0FcbUC15eRBgrjxhhUqxhVsBEeLE=@vger.kernel.org
X-Gm-Message-State: AFuF++nUFW0HIeLmjBgouwl5SfcOxczHsQ29gLi9av0awiEmyrNwmuDK
	1ohvY9zkMEeJwFpDqMphEPD//t1AfB5DQAc4Z3isNQedeNBeWFF0XF12
X-Gm-Gg: AR+sD10RHcn9/cbacivawsee4fqrqft6G3FRGjBWDyZ7DgmC4e6Lf6dz9USgj9L5ule
	wlrXwnTW5l3ffAkEFPHubkXeq34lgJWXxAsWfPvAU5mUfrhjGxUxbM4WxHASZHW46smwlAuweV2
	XNf24WsQhyIb6DgBX4HaawmXTgwtbRuqdT3IE5avF+4IKTqiFAIYiP5lzrM/ZSJBhh+I+/rTRs8
	DbgE74DYlkB19oeRGSp4C10TKRBT8mOM5VeUTMx0PLNO79npgHNl49jEpmhMQZE5hNpy4AY7ck1
	n+VU7kbY/5xYa9/oAp3koM4qsOAF+yALrtwJ55H+wTi8Sw5Bpkaa25l/cTG4swSJo7TKwXKa0ba
	Syng/VjK3TWXrJqJuTUTGiFtUf2G2po0ho/5JuG9usND0hU5Q1KboKaOwtEAefgEdOvj02i6gYq
	V8N/vQrTymLjGxRUdvIDhadewPxqBP+NBMQp3CWZ+Fiq47jMldVaU7frh9qZVZ6y5qtNi3srdP5
	/HqrAmBfHivPVDvrF/leMvRTBdd3HDxBbc0r7emO2Sp/d4sC9k7fULx9x3EI5IByUYNHPocegk=
X-Received: by 2002:a05:600c:198c:b0:49b:8eb6:5700 with SMTP id 5b1f17b1804b1-49b8eb65823mr75948305e9.6.1787853572313;
        Thu, 27 Aug 2026 10:59:32 -0700 (PDT)
Received: from localhost.localdomain ([85.118.83.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27a9945sm10272342f8f.9.2026.08.27.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:59:31 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch,
	krzk+dt@kernel.org
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
	rongqianfeng@vivo.com,
	wenst@chromium.org,
	rafael.beims@toradex.com,
	avraham.stern@intel.com,
	error27@gmail.com,
	s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	chunfan.chen@gmail.com,
	arend.vanspriel@broadcom.com,
	peddolla.reddy@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v9 2/3] wifi: mwifiex: add dt flag to avoid conflict with platform reg domain
Date: Thu, 27 Aug 2026 20:58:49 +0300
Message-ID: <20260827175850.89395-2-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827175850.89395-1-gvalkov@gmail.com>
References: <20260827175850.89395-1-gvalkov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
from the mwifiex ROM, which conflicts with the platform regulatory
configuration on units sold outside the US market. For example:
- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US

When the system boots, it detects a conflict between the user selected
region and the radios, e.g. BG FR US, and applies extreme restrictions,
preventing phy0 from starting on any DFS channel. phy2 works.

Add a device-tree flag, which allows affected devices, where the radio
conflicts with the platform to ignore the incorrect regulatory hint in
the ROM of the radio, so the platform regulatory domain can be used.
This does not allow the user to change the regulatory configuration of
any radio. It only allows phy0 to start and operate according to its
certified configuration.

The change affects only platforms which explicitly define this flag, and
helps overcome the incorrect behaviour of proprietary radio firmware.

The change has been tested on OpenWrt and fixes the issue where
phy0 does not start on WRT3200ACM-EU when a DFS channel is used

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
 drivers/net/wireless/marvell/mwifiex/cfg80211.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/cfg80211.c b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
index 7a1ba32f1fb3..293876397b67 100644
--- a/drivers/net/wireless/marvell/mwifiex/cfg80211.c
+++ b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
@@ -4897,7 +4897,14 @@ int mwifiex_register_cfg80211(struct mwifiex_adapter *adapter)
 				country_code =
 					mwifiex_11d_code_2_region(
 						adapter->region_code);
+
+				/* If the reg hint in ROM conflicts with platform
+				 * configuration, it should be ignored, so the
+				 * platform regulatory domain can be used.
+				 */
 				if (country_code &&
+				    !device_property_read_bool(adapter->dev,
+							       "marvell,invalid-reg-hint-in-rom") &&
 				    regulatory_hint(wiphy, country_code))
 					mwifiex_dbg(priv->adapter, ERROR,
 						    "regulatory_hint() failed\n");
-- 
2.55.0

