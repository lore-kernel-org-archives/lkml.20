Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5182499F07
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851200; cv=none; b=i5Ur9nUB32r10AmCWYVRhKgh3GckuRtoAJMWPu1b1WwBrGidW01gMhkM8kikgfn9GW2cMK8ldCYF136e+s5t4wZVtcQNAxdDr5GCzWtfOkE6gYeJUaQlO1EDBYtiKNUbJcIEEIKXfyQGfpgWx21+qFVyTq3F4blt0As0N2H5SrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851200; c=relaxed/simple;
	bh=Ps1FBD8oCCdztHPPWLN090lnS6KRUI6aLV+WAZWyKec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PinRCQ48M6m7jFsnGC/z5vvrh+usUkE/MWiD6j1X3bmoB23KHX1QeRJtLoxsbyS2Occ8URJP8Yj6kAVTcRkuioVy29Wv0B8JTR8nJl4GcbmZ7qE2Z11D+t91mNVbHfKvRyzrVB8yLQ3u27YRH/D8gmDgoo9YBZp93wKolyzL57U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkDQU2r4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkDQU2r4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so23584365e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851195; x=1788455995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAIY2PGMFfnt3WY5m1saKTe9r2TNIGK2InPmdbG9HB4=;
        b=VkDQU2r4GPhLwryHrlldeCIzIjSZcMpMuSHSEtMl8PoHUcRQYFuOVFZbl/3wegK1zd
         E7dJ6XHF/cQle1MaxQsP3WESsoAZn6rnPwtR5kSLi2iGTX5pyuNdddzwLJF2wtDWUOHw
         iSIWyH9mzYZ24Ch+7/5h44Kc3BrJZFy6afNCliu7lS92TiD+6eQz2wuFSvu8kYtrs4w+
         1+L/FnaeF0HjsgreQTgU39pQTasz4O4FerQ2NZqNL+UugdGzjE/8U19fEZhO2W/pkauq
         VmwQXtzbO4s6FPGTzntqlcNZ0hdeqjgMLEprOSTe+iTXckYrlKC18BL8cs5dZ4r7EQ+K
         w4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851195; x=1788455995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GAIY2PGMFfnt3WY5m1saKTe9r2TNIGK2InPmdbG9HB4=;
        b=pYbGBC5tXPaPj7K5vCtN4Cx0wrY3vDxwzUclBOvRxNPffcZrz13Ohst3VQ9OQN+HW4
         sP9D2b+s1DBf64DJETFgBaukB5rfhLlc7i90W86BVCJzAnclxfKIN1JjSmAlDoXYFIVW
         ktNbj9vCa1PNTrEvGTWnsMUXUh1DuWT4s1v0mgP/xxxYXPoa0ZXs3VLqwDjYSP8XF0kO
         NkBBjC/PJdgODdjZ12rXrqifom0zEAGJCZ5Ww4MYzBOBV4C0+5LGwrQg4Uu7PiF/1hWn
         yiWvbMM6FeOl7zoIHcL8UVXgZ18XYgMQjXQ2is+rMa/DWHKpa/fNorMteWPchD643egj
         Pa0g==
X-Forwarded-Encrypted: i=1; AHgh+RqPiOkVA4U+v9gLSsTL69zHuwzLeJdfksgzbksj0iRN9mqZkTEny0HMIonc8xwzMMJlsrycPMy3qee7FvM=@vger.kernel.org
X-Gm-Message-State: AFuF++lVrpQbxjL1pnKC46hUNEz3LUVrHr9QaCMqKHJWTmDZU/LbN2kQ
	masfLvyvyDkc/xTil2nbJFEim2eMHe7sTQLM4HzxuIBG0wzh1BzZH61h
X-Gm-Gg: AR+sD11o3QuIgl+9KpZLW6kzM3hOiSfKSDli1gIxTMR61WvPVXVcnFD5dICjXlcfuuk
	CjvhceoVzIgUweyze34Pz2yBC8rws6zJXCu9rGEGr3C4PhK9oBfwZkZKuDC8Az6FmYqI5gL87HR
	S3Ng5PpX6ksGoSK5lOraAAnFfXAUksms9mtNldyu+YGCmBV7/w+NzKePe5zfs8gblA5rAxBOsFC
	3JhQcGlmql5hm8EmKn2s3BXZlVLfnJEw0Es8Ecw6uKYQdmwlZmn3TRoQ31fOAZQJzfLMf4zaRhR
	CX1dCIMymwGfF1V48j+UcXItPmu3YJLxHopOe5GlLgy98n0eMKmM4jfJ6zBBsqYrIKBHjOKkVvk
	3fMZ6hZp/ql2uLYX7twLJgbQ2qU196b3mS2ZER5cEHiCu3udDHnuHf904JpkHUceYHHc8kVQqNG
	uE7TYJ04nSYpN/H8WJTPQ2r+G7b0+HrdRmZ0akPPEkHNqM/6EbSC+Z8RVHQA2DGlOR9ARZNcxHJ
	zehYZbnOXJHJAqNYfAixIYlMKjn6wX409yaWyCn5syldGaKi+dNSrXOfoA9OOUC
X-Received: by 2002:a05:600c:8b86:b0:499:8ff5:8ecc with SMTP id 5b1f17b1804b1-49b91c5446emr7604325e9.15.1787851194667;
        Thu, 27 Aug 2026 10:19:54 -0700 (PDT)
Received: from localhost.localdomain ([85.118.83.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4ad16262sm54259995e9.11.2026.08.27.10.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:19:54 -0700 (PDT)
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
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v8 2/3] wifi: mwifiex: add dt flag to avoid conflict with platform reg domain
Date: Thu, 27 Aug 2026 20:19:36 +0300
Message-ID: <20260827171937.28878-2-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827171937.28878-1-gvalkov@gmail.com>
References: <20260827171937.28878-1-gvalkov@gmail.com>
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

Cc: stable@vger.kernel.org
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

