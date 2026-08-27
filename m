Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFD4496914
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851203; cv=none; b=BD24nT2yjIhY4RO2W/nZZNuyMr6/WLBT6Q1m5OrShUtH0CDyMCrGIzJkQfJ8opH8OczB9Mks4MO9/BOJzk01gzWZ5r7BjKd31gKAwGoBmDikIXCiZozTqv63ihXu+m72NGZfmMinWD+iMeXQaEjvqpZxAyAsBHWJkzBB4DKr4Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851203; c=relaxed/simple;
	bh=sarQEdrSbBSoaCcKumeb7DKx9O4YVpY+WCIk3ge9e4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EYdB6MTn5JJ5Zc6Qf4hOwlSX+cdsaAa4y1heVkuNJp6TvJwrSnEuEmrH7E7azHUladwAhjisvaJfmcxPA2WLLem43BqPuS3cxfPpOlCHnOntyYBFZUs44tSlR+sGyAwxyAYCfHIlLKISEGxvxYrUNLlcFyCsXiyK4RR0szpyS2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tEps2p9e; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tEps2p9e"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495590dde14so121485e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851199; x=1788455999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QF2zBpTs1xbQ8vVeDBrFP8mtx1WkUete3RSSn/zfKZ4=;
        b=tEps2p9e7u6LtM/r7j+mxS7RQVGVczPGAZqMWu3/0e5WIi60MLN/cbsY5sMq/zmTKA
         OepblmJnA1Nk5Hbe8HBM0uvzkH4vlY+S9sUgK/HsogUzzVt3C3iPxhi7cIulS9yDUjkA
         93kRClvP1yj3NIM06fNQkDBMQgeMRklqllV/AKuG6L2HZqMtWvu/VvhsGouGUoOApXqk
         1cZeqLWngayNaGavonG4NhReCmS5Q81IEKUm6SfKSYueWEaUHAaa+y33D4gyakgU8DIZ
         8bT7S2+uqnPNDM5y0/JBGREFFYhMoP+/P6rzpHvaev0ccS5kuD0g8+VRgUqoT/rC7sM5
         gYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851199; x=1788455999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QF2zBpTs1xbQ8vVeDBrFP8mtx1WkUete3RSSn/zfKZ4=;
        b=X/mfQScvb36ZmYqii34KSDaMbxNvn73Qubz//LdxmWiAo5iUcSm/tzy4Ok69wZruxB
         UGLC8/Z8dRlQBMKziHKodoyfQhHlDGk8EGSJSGQM/4amgcwUDKIU5KAa5GJCmprM4Rve
         5abnk4+cv9S/g4h5JQ/NQl7kQhX0AMljDGGa35/t1XE56yRTYRgNhdsnB+MvGYkSm6gZ
         KWrtlv0TQU1Fs+HQWdefP69tzFeYoFuS1SCQePZ3mCLNMZSAg6uybinUqlIx9QhCpgoq
         zs22EeXXQNvWcohesEoXU/52eGO5ps2ohi7mB7Kf5C2MU2EDCGmTjVyBP5qjW7b4cOpo
         F4sg==
X-Forwarded-Encrypted: i=1; AHgh+RruvhVBqMy2hF6XoxTHthmxH212r+rzYc8sQ0+0WDAoC59opccnHuSVvaAOavtFuNI6wtmC+ks+3JT5HnQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n8WEtw0GLbbGq2oTy3V9UCbkt11bPAQ8Zi9x7yt8MxknEOqcDu
	mmRtJ1Li/CnhOUAuLvpCzAO9ufIDUCH4x/8Ypz/4hqOOV4KXhxgTdH84
X-Gm-Gg: AR+sD13pl9O+WY2kNgP/3TjuFBX6DOMOdg1MQWYq3E4vXVYrviuX+UQuJAa4+OOdgD6
	ICo+wekC1Afvhgat2KDOEFYinytS8WXGJGvqB3+snmjnQUhf0Ce05E9xGdcwGY0El+gxKAsANDY
	QveKDzJJArhE/hV1peorRgCM4fdc3d2Siq9Njih2PcUCIG8l2EB4iRX6d7zu0Vb8JMBLNvPria4
	4LyCnn8bRRqEXna6sqMDFLwPV5hG5XksIvJ7u0JO6xdCUF8+6hXjCYp0lp8oRxDJZxkQJAjDkyX
	3+Uz1KXHg1hq64bgp/3j1q8cXyO0DtlqStBV+lpK63b65gVjoUC7O9R0W3FfLkq81u2vcLAuePC
	RO32mMahbmXgmH9TygNQ6BPIKmlgmREyaeWcUDnIJGqGbRRw9GKo/DGqL+/sBYzTKwSycDK9Qe1
	R8ihM3lvvTcnre9TpgxhnWioE8a3SYXsEnJdRukEDBxKHb0VWK3NNt/k9anAV5WzSyhfZ6t/Wpo
	0nPu6Znw3i59QDG+b1dHZuwXnEYfy39OKPF0dJvKwsSPEjyfGWg2P/1TC5CpfOr
X-Received: by 2002:a05:600c:c493:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49b91c20914mr7700005e9.3.1787851199182;
        Thu, 27 Aug 2026 10:19:59 -0700 (PDT)
Received: from localhost.localdomain ([85.118.83.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4ad16262sm54259995e9.11.2026.08.27.10.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:19:58 -0700 (PDT)
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
Subject: [PATCH v8 3/3] ARM: dts: armada: WRT3200ACM: add marvell,invalid-reg-hint-in-rom
Date: Thu, 27 Aug 2026 20:19:37 +0300
Message-ID: <20260827171937.28878-3-gvalkov@gmail.com>
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

Add node wifi@1 with a flag marvell,invalid-reg-hint-in-rom to the
WRT3200ACM device-tree, which signals mwifiex that its regulatory
hint from ROM conflicts with the platform and should be ignored, so the
platform regulatory domain can be used. This does not allow the user to
change the regulatory config of any radio. It only allows phy0 to start
and operate according to its certified configuration. All radios in
WRT3200ACM/WRT32x are locked to the hard-coded configuration for which
they are certified.

On WRT3200ACM, the platform configuration is stored on the devinfo mtd3
partition, which is read-only: cert_region=EU modelNumber=WRT3200ACM-EU

The Linux kernel sources do not have support for WRT32x. An equivalent
patch for these routers has to be sent to OpenWrt.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
index 4ab45f294de2..2bf29981a031 100644
--- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
@@ -165,6 +165,15 @@ &sdhci {
 	wp-inverted;
 	bus-width = <8>;
 	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wifi@1 {
+		compatible = "marvell,sd8897";
+		reg = <1>;
+		marvell,invalid-reg-hint-in-rom;
+	};
 };
 
 &usb3_1_vbus {
-- 
2.55.0

