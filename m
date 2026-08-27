Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E258F3FC5BE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835850; cv=none; b=bLIGXlN/MfQT8azkmbJguBLrNLX5bLO06ho1qrUF1YADEF01fOwZ53E8OaucdYmyyzgiwwy+dOUUu60bFlfDGy4BC431OOUP/NZJaEvpUB2i5NZiM6bU8Cvs8PvkbnkwnYKg/3BPhDQZRt9bTY5AcSnoF9b1SILtmav26T0Y97I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835850; c=relaxed/simple;
	bh=MKz6TKDh/MzR6/ujqUMWkSFnSi9qZEpM9ovgfX/AxUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CIWmXvWiw+KWrgZQZlg59FhhZ8kFBSVSuaB5znCoaEplWsxzyC548AEg8o8cQrMaFn90v85Ex2vMFZm+U1GyS0tETKJgt3q35TSo3vcwSSfuZrsS4JDqh5djW0sc4Pl6IYlKF8CqJPyXEZ1oRAvrfjI/QR6a18Yd3Ch0AYtJjVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZJeuNoC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZJeuNoC"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso20992545e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787835835; x=1788440635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxPA/ygF05pMbAMW0vsuxfL/xhlpJsyjpYIxaZ1WIpc=;
        b=UZJeuNoC+bcEdra5Vus8a67yvyDUbIjhStmx7xfxz8VOY+WWW5VCVvF+SBnW70gcG7
         60i/Jn6sgyNPpyz9qG5KZvCG8lDHWwd/67QgdMnxY7MI+pbYrkjNsV53iZ1BkZpoqM99
         A0PkCnQ1gDT5k4JhjLg8/2I8IaGI9+/xPlcHhX6sPYVcBV07H5o4v+j8269NXE3j/K8c
         hNdTUN2YOQZZrkSbO07u6J+19dv2Pn4fJHupXH0lf8ddX1rm/z6lUevXH6T9jvOxKUvf
         CCDWF3af7dc320pXKRk3QA9HLKMpMmB9wDxbnIu0HLkv8px2G4OUPPVKjQcHMXUOiM+a
         a1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787835835; x=1788440635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DxPA/ygF05pMbAMW0vsuxfL/xhlpJsyjpYIxaZ1WIpc=;
        b=ovKgyApXGygcfNfm1F6QUbiSkjODJBqq91qrTJF4aPY4InJccNatSarXN5wBWiIN9q
         OQ7+qR5b2kGpk2MX61xVxklp5h+EMdmcjFXh6sfYYG3lhQxruq7tu/QcVYCNn4R3Um9t
         slKh6B2M1JZE11aK9J1/rlkj3/xT/d+tyq7tqHaouSQ/mBa0OHXDs1M3D3tArdxDyNsm
         w67EfLnWLmO2En9wqIuqMyR6TR423tkTtGlLrd2Y4CF0Vg0divgdyB3Ov5LpPIUueReJ
         0FrXh/TXkA7gU3HOAHnuQcbmwOyK5NiRNzAJdnO0w2Rd8ytht4MRmCLgttM1Nd1Ro0CD
         MDpQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNvZQctf8puUN9S/N7CkaXbSOKMdxevqJwZCb63CnANNbDYuebYhLy348aNnYn+ad5RBpTP++PYdgXKSg=@vger.kernel.org
X-Gm-Message-State: AFuF++ld0aTluluI7LTOdcJ7Vt4fgjDVX0m1/0DrFm8Fit9yqxVmNH1f
	N7gJHOVIVl0pcOHgvyT4RMrFKydQ8YtSnCUZJvR7hP2Sh9sHYzXP1iFc
X-Gm-Gg: AR+sD12YFbpY0P4eJZnwVuJNf7GVpqM+KqnqYsYDAgUkW9vUyZILL+LYl49o8aGtFYE
	Syep2hNsoKi3AiPQ1JAc63CONeVBVHPy7Tio992fvNukMi9ZJue4BBUbByYtzq4z8X5c16jTAbB
	9SKKXwW0KISSVv2gLXi+cJkl3kQ7JN6KNSiv5fQfNtGEZMzu5Mkr45UJ8Hhle8CFgi+sUOyE5rk
	mJ8p7hDAXogRA5OF3EVkGb+0RVYZq2HUWYT0x/1JGXW813f/p341k6xiUrHT1h3sbagjqsPDQwu
	tj5487s5XNNoD1GT5Wwm1N9AAUCjZmdx6jLhQPTxlGwatarcWqe390fvV+UqALLnKG3Q+DMKpOF
	F0I7rz4PkNdPmuE/jQAGbERz/QrlnKtKvWyhLMJyshkEGj29yBIeXWKnuwQQIo9Ge2yfHM8SPuz
	izTADSqslkeltQkWulU6R9eneyP7HUDo7xq+UDz3AISSmqoejzTa7OhAU4a35tfes4Tb/JmjN2I
	Alg91XzHuwFKSLwMhG8rs1j0ZmO0LPcsj1FQrsixD7EwZea4N7zCJAvForFL/OFdxq9pEXaNF8=
X-Received: by 2002:a05:600c:a418:b0:49a:2c4b:403f with SMTP id 5b1f17b1804b1-49a2c4b41dfmr127644185e9.13.1787835834813;
        Thu, 27 Aug 2026 06:03:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:5a8:737:d4a7:e53b:30a6:3c0f:1dad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49610170sm116081285e9.6.2026.08.27.06.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:03:54 -0700 (PDT)
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
Subject: [PATCH v7 2/3] wifi: mwifiex: add dt flag to avoid conflict with platform reg domain
Date: Thu, 27 Aug 2026 16:03:34 +0300
Message-ID: <20260827130335.6606-2-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827130335.6606-1-gvalkov@gmail.com>
References: <20260827130335.6606-1-gvalkov@gmail.com>
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

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Tested-on: WRT3200ACM, OpenWrt
iw reg get: no longer reports region for phy2

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

