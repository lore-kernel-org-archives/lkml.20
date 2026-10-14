Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059A93C1D7E;
	Wed, 14 Oct 2026 21:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013526; cv=none; b=hzlJf7d0r+5Ed4pa4B36hZDXlj44FEd6L/HI4tqOiSSQoQZVa/tNRsg9XG1XWGaFU/oVNHjRTloXxTz2Uk38u4unz9+lPFdrss2ulhN4U9q9k1Z2dC+FLYWU59gP5KIsZbn1a5io85hhOhry3z/oRnJIoci7X2GlbJAnnN9Z7lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013526; c=relaxed/simple;
	bh=kaFm05gyrKCEKs60MS7f7Kly1pytVOhKwVT7y0KRpzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h2QzTOBHcEYOPkoKc0g9mwqyggQHMa6WEEYypRl3wiTrNLej5XpGUGonmz+CCCL3wUpwO+YRUK7Hg2pbBIbNWb4ABy29Lp/8itbfO7nfMo8na9TAmfeovFCp2rwj2qgU5PB8qI8oJndUj1Mai29yBvM+szZEl37C4hzCyujs2e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4M5hJEB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4M5hJEB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF6A1F000C4;
	Wed, 14 Oct 2026 21:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792013524;
	bh=8ciCY2A88SYR2CM75Mx7Nj/WCo5wz1n2MA1VbEnrH3c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D4M5hJEB78IP8JqO+BOpPD0CRCX/LISBnMa5tXS65Grt6Ze7KoCoaiHMWrvejJHJ2
	 CBSLkayv+C30UrrClXPexK2MxEEuMT9EWvNemrm0Dz+jSyhX2+9jVs9NXIH6gHb33D
	 6BeL5saVc13dK2fxqSn+Cxm2/iGYoatt9IcQkBKf1WosSNjTKxuriQ4b5rBk1dhQNd
	 yIJhFucaXtirNOQkCmoe5b2PYBQV1jFcH64tAQFmLyrcHfGzkXCQok3CclXSJanW5A
	 IuV0bs27kKHQ358nFv31UaMA5GLAMMIKxw8l6p0ziy+IoaS5VkbcDHvORVCeqRblQK
	 ST78YbM9Fnzow==
Received: by venus (Postfix, from userid 1000)
	id 69F1E1804C7; Wed, 14 Oct 2026 23:32:02 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Wed, 14 Oct 2026 23:31:49 +0200
Subject: [PATCH 1/4] dt-bindings: connector: Add DP AltMode VDO definitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dp-altmode-dt-defines-v1-1-b657c9b6e4c3@collabora.com>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3019;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=3DNpBRf6NQYwnHQxzmDmr4mio6Ob3qWU/dTm9LpEHl0=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBqz/TQSsWLBKOLObM4EqmAVmFY2kzRbt9LfnGBN
 86eL6pD8haJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCas/00AAKCRDY7tfzyDv6
 mrtbD/4h82QyYA/iAhpmTGtT/QpPrOEBk9fiSiiSH+1FwwfO9zPb3CFUCqTLMx3W28UTbRePRVT
 dZ52TbY8klUtlTD7AyoV9m0msJK+HATfBoHpjx7RFoRDWCBlNt/v3R85GKj0Eb+ngqoxgAreCP7
 BDmavivDpwNH/n9tvwpCMjzMR9ERcOWwflYC9zN2M5pF3S/MPd2qTMNzrP6nZOxQHthhX4RvxvQ
 JfCR3sQjGFXe3nwDsPucEYufmy+n/dOVodL+vT3Bc6/m90Ftt3kXKf6wzOFq74vhyuDsjDALrIX
 A1JdTvhJARLih0Rvu9hm+AbYv7Y6ZCeuTg2OLxgyb15ZizzV/POhtx2H53pN57feeTQ2ZDJS0fH
 +uM7TJ3nFLl2Q1GQRByoCDEsDHGs4Ua/uREp1mlqBrBgS019i9EXvxwpBlnhmxgnbKh5dhkEi/K
 IWLsA+qRVKYVO3pSBYa72hbYScMYEgf2hlBXXX82Iad4Be7zrDG4zG9n9x4hNpTHMTiTyMg1HOx
 xA8VgkebQhrT/Xm9rEae9wN9tqTGm+KXVEzpaY89tZXyRfISWwRlvh2wF0x8dTTSEtrEQ0Pn79F
 /HJH34SdWfitqWkxdYrSPE+qOJG988S1wOzPKeXnYjnmRLelpd4Pa0MNVfoek/nFCVr7JkkLq9N
 pZq6cQ91aWcpaqg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Sebastian Reichel <sebastian.reichel@collabora.com>

The typical USB-C DisplayPort AltMode capabilities for a down facing
port (i.e. sending out video data) looks like this:

altmodes {
	displayport {
		svid = /bits/ 16 <0xff01>;
		vdo = <0x00001c46>;
	};
};

Improve the readability by adding defines for the numbers, so that
the above instead looks like this:

altmodes {
	displayport {
		svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
		vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
			      DP_CAP_UHBR_13_5_UNSUPPORTED,
			      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
			      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
			      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
	};
};

The generated DT binary will stay unchanged.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 include/dt-bindings/usb/pd.h | 58 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb/pd.h
index 1e64a1f563f9..6cea6165fc0f 100644
--- a/include/dt-bindings/usb/pd.h
+++ b/include/dt-bindings/usb/pd.h
@@ -483,6 +483,64 @@
 	 | ((vbm) & 0x3) << 15 | (curr) << 14 | ((vbi) & 0x3f) << 7	\
 	 | ((gi) & 0x3f) << 1 | (ct))
 
+/*
+ * Displayport AltMode VDO
+ * -----------------------
+ * <30>    :: DPAM version
+ * <29:28> :: Cable type
+ * <26>    :: UHBR 13.5 support
+ * <23:16> :: UFP Pin assignment
+ * <15:8>  :: DFP Pin assignment
+ * <7>     :: USB
+ * <6>     :: Receptacle
+ * <5:2>   :: Signalling
+ * <1:0>   :: Capabilities
+ */
+#define DP_CAP_UFP_D			1
+#define DP_CAP_DFP_D			2
+#define DP_CAP_DFP_D_AND_UFP_D		3
+
+#define DP_CAP_SIGNALLING_HBR3		1
+#define DP_CAP_SIGNALLING_UHBR10	2
+#define DP_CAP_SIGNALLING_UHBR20	3
+
+#define DP_CAP_PLUG			0
+#define DP_CAP_RECEPTACLE		1
+
+#define DP_CAP_USB2_USED		0
+#define DP_CAP_USB2_UNUSED		1
+
+#define DP_PIN_ASSIGN_A			0x01 /* Not supported after v1.0b */
+#define DP_PIN_ASSIGN_B			0x02 /* Not supported after v1.0b */
+#define DP_PIN_ASSIGN_C			0x04
+#define DP_PIN_ASSIGN_D			0x08
+#define DP_PIN_ASSIGN_E			0x10
+#define DP_PIN_ASSIGN_F			0x20 /* Not supported after v1.0b */
+
+#define DP_PIN_UFP_NONE		0x00
+#define DP_PIN_DFP_C_D_E	(DP_PIN_ASSIGN_C | \
+				DP_PIN_ASSIGN_D | \
+				DP_PIN_ASSIGN_E)
+
+#define DP_CAP_UHBR_13_5_UNSUPPORTED	0
+#define DP_CAP_UHBR_13_5_SUPPORTED	1
+
+#define DP_CAP_CABLE_TYPE_PASSIVE	0
+#define DP_CAP_CABLE_TYPE_RE_TIMER	1
+#define DP_CAP_CABLE_TYPE_RE_DRIVER	2
+#define DP_CAP_CABLE_TYPE_OPTICAL	3
+
+#define DP_CAP_DPAM_V2_0		0
+#define DP_CAP_DPAM_V2_1		1
+
+#define VDO_DP(dpam, cable, uhbr, ufp_pins, dfp_pins, usb, rcpt, sig, caps)	\
+	(((dpam) & 1) << 30 | ((cable) & 3) << 28 | ((uhbr) & 1) << 26		\
+	 | ((ufp_pins) & 0xff) << 16 | ((dfp_pins) & 0xff) << 8			\
+	 | ((usb) & 1) << 7 | ((rcpt) & 1) << 6 | ((sig) & 0xf) << 2		\
+	 | ((caps) & 3))
+
+#define USB_SVID_DP_ALTMODE		0xff01
+
 /*
  * Sink Load Characteristics
  * -------------------------

-- 
2.53.0

