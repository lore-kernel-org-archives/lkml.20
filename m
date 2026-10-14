Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A3B3C5DA1;
	Wed, 14 Oct 2026 21:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013526; cv=none; b=f9yHuZzOMhaW5D5eCJTbVtTQ4DH8uJp5lo+u1fzS1Z4qQkpTjKQckzOt9VuhrjLF2en43tGXMQUp3oIcXwJeiI2ryP96I4rGyHMSJVlv7FkFmcdZDEZ6WafJ6L0qa0+oRF6omwYlU7nyue5GvxKIohuyuzB7izo2ZE11Czp3L/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013526; c=relaxed/simple;
	bh=JmZlfOt95AfVIJpkDoCQKkLubEz0gppqpCoLy0/at74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nfqe+s53+Sv4kmwCsWF4EEsiWUQeIwKrnUrp/RFWSKvMeDVPvOMOalgQKjY6T4pZjhBI0aIellfNbrufaVhRAlmNSS/y0Y3Oj7BnIh4BvGFW+NPN5IhaDhQ004aH0nC6GY2NiSKd9fPIxb0zghOe8szJ6BFY/74YoCG+e05bMM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gg7xzYci; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gg7xzYci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6631F000C5;
	Wed, 14 Oct 2026 21:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792013524;
	bh=vli4XWkCGgE+k+Bp7PajRgTaGj17Lg4tJrd8O22L1MA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Gg7xzYci6dE6NvCUlsdbYHcGCbGqLqtFTrvhHjOuK7pyPaPRKmpl9s9Bpp+UeDvaW
	 5FitQOsLJYiWtr53spW33Le//5yhjGEtC3SNHTDtOpKaAgb9gaVtzdTB1/utlX0Zcf
	 IAHH6FaUAarKp20UCKaSy+YcV/wuQDXPq25ZzUbXkjD6alFBC7vk6GOH9upCUYL7Cq
	 NXj1z1NRNGpopMkuj6nnYit1vIl3H6d2yQinSlf8Y7W1n9u32iA1pbWbTgxiJVFNuL
	 /K1lWWsG43I1UO/6jSckokidTe75ULeLibFVxVTGKiqFehHKUsafdBwt2FpW/UWjZj
	 5AG5PrOVtwKqQ==
Received: by venus (Postfix, from userid 1000)
	id 70E1D181256; Wed, 14 Oct 2026 23:32:02 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Wed, 14 Oct 2026 23:31:52 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: Use DP AltMode defines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dp-altmode-dt-defines-v1-4-b657c9b6e4c3@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1760;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=FNkZ2ecgtAZu035MahbG+CkbV9GSNyIveV9yT//RHgc=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBqz/TSLz4dULI0PmDmsCpwfPt9dmMUXuu4VNKi1
 ulOIwVMoiuJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCas/00gAKCRDY7tfzyDv6
 mnawD/9EjsxdoO7IEhSYuKYaie84j6N16zaWLa9H0gBWVY+CCxKFYRn1xjEdpDuXBTa5GNl3mfT
 mCECi7BHbshUeyq5N5E5pC/deRzsTtKtx8z/rFyshkkQCBtBxoJLODxCzlWAnmrsXxPR8YKmP6Q
 w0Y1llhNLcGvmusQbCXmlqBUhbp5VomfmOKOQwiZpxAOT0JL6dHkyuxukXa/ERq1MPQNFdRFr2r
 M0tc9HKZAMXg6r6d8ykD3pa/mSspMqrHM+e2nCVmQ3LD1k0sTkPYj8GYt4s6azirHD5/4+lxar2
 qgMKXi5VqjILPW3nvE08jfNVW4MMx3rVfppw3Fj9EnxOIKlSInFBSPLxwtc2fo6tEwuFEXAXRjq
 U6xiOv4/cEDgwWPAuWFQyioXuMGnug64m1zvM6dE7+yp3DvPQ8+Wp70yj/F7yrxd7xKFA3V0PBD
 s93VikuMLVySm/qwR5DKE/s+hHz4FtBN8fLeD8om94C1Bl2LaKDS2YQ7rUSLt858qq1cM1RMa0k
 anld6cdvFw8/abiG+EiLep7sQIG3sYGuNZp/sthe9XmY7j3Ej5sbxFCC9e41XZzQSwXddAw3JNT
 umhQXh9+bmTpkzTCRlktme1yZQkq/uJ/WTBk85BGqeXQvzz/VTpHjIzQBHCFPX7FjRtajCJpIB6
 1LN+8eUqwjMQgTQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Use the new USB-C DP AltMode defines for the SVID and the capabilities
VDO to make the DTs more readable.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++++--
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts  | 9 +++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index d6af679abe1a..d21b94e872ce 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1508,8 +1508,12 @@ PDO_FIXED_USB_COMM |
 
 		altmodes {
 			displayport {
-				svid = /bits/ 16 <0xff01>;
-				vdo = <0x00001c46>;
+				svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+				vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+					      DP_CAP_UHBR_13_5_UNSUPPORTED,
+					      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+					      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+					      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index cdced5c848d3..3d83dd305954 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -581,8 +581,13 @@ PDO_FIXED_USB_COMM |
 
 		altmodes {
 			displayport {
-				svid = /bits/ 16 <0xff01>;
-				vdo = <0x00001c46>;
+				svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+				vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+					      DP_CAP_UHBR_13_5_UNSUPPORTED,
+					      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+					      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+					      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
+
 			};
 		};
 

-- 
2.53.0

