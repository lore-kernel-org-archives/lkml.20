Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745827;
	b=Qi+CLIWFWPWdftnqlIuKuVMUVpZL73fCtoh36MrHLXXcGREyC1nfB5Ncx/rX8qMIPK82
	 DIDuCIlAWYASY8C32qFW1/V+GzWD2ulHPv/A0b+iKbJGURYCaoi7QdBGwY5jY9wZuxetp
	 FGOI8Ucd+Gn+zJwdLNLwfYtwICCgahlDz7xhVtzKRBOiiSj1TaKNuOaJjvW7HNncfxBRZ
	 jtbPXyGeJBojSWHvD/LzHB0OcZigepTUbGMAyFnfHT0Gx05mhG83Eh6uMcrPQJwknEsEr
	 Em85sHE1Hf0/1O6foPIy3TetviLdcTEInUY2DJL6dRr/HdbBhVrUu0a1U+ugBcp+l4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745827;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UG7NvrV/j+jdLAG/hgObHV4CXv6zbCTDuQ8yftS2s1I=;
	b=tvbjw8vX0/WwRX1jhaaHOsL9EewOusa7Wfrq0lhwncuoKWsxgH48VjvoCwDQoZrsLdNX
	 lSM5mcAXZuaOdfYYjixJYDp+l16AuAiiagyqf7qzBq338qpfQblBWaiaN+48sdfLMvUxK
	 gB4mfpdVjNIoJwjMnbwkOU4+EgO8VWidtqk3Hnbfwro6rJh/MMnq62bsTMxqg0srWaB4z
	 9lYxIFkKO6wc3ifF/VYeDlaFZ7uOy6i5shlB9A+RAcit73kJV9szXD/LpdHqqnAcDa/8W
	 8e1mlvzjpkBLqBhkp8dPK+q+domOiB6C63mVNgCAFCLOv04Crn2g54iJZTjV91VZNHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YgyWyXcg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7EA606D806;
	Tue,  3 Nov 2026 22:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YgyWyXcg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02A11F00A02;
	Tue,  3 Nov 2026 22:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793745827;
	bh=UG7NvrV/j+jdLAG/hgObHV4CXv6zbCTDuQ8yftS2s1I=;
	h=From:To:Cc:Subject:Date;
	b=YgyWyXcgSFnznJKlJS+P1qqvOmX+vHwE0p+Ab/DtcqcTHjJTntbmKbvqbc3Knsos6
	 89wLZZF7z9/ArCi9vl2JF0A+S1PxwMMdfafff2yEJ0W5q2dsrz7GT9+98Tz0PB6P3L
	 Hayz0j4WAbJvVFJ0CH8th/1Dz55dWEfSk7W9c2wdWB+7vd6GxqfoXWTHcfKW+kgNKW
	 azHOsr8DUhf49I0Sd9ZPFGq2SthkT/4vEVI0OLmC9n9d1l9UqpRAz6ElL8PQdosB9F
	 SG1pASC99s/y3feYGK3GDx9GN9cMXmL3y/OHVh2NxkCOSf/1JP021p9aZZIDxj2AOY
	 7fGOw8gRPxhTg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: sprd: Add SC2731 FGU calibration resistance
Date: Tue,  3 Nov 2026 16:43:21 -0600
Message-ID: <20261103224322.858881-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
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

The SC27XX fuel-gauge schema driver both require
'sprd,calib-resistance-micro-ohms' property. The SC2731 PMIC binding
example documents the coulomb-counter resistance as 21500 micro-ohms, so
use that.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/sprd/sc2731.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/sprd/sc2731.dtsi b/arch/arm64/boot/dts/sprd/sc2731.dtsi
index 458685b82462..5868b98113d5 100644
--- a/arch/arm64/boot/dts/sprd/sc2731.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc2731.dtsi
@@ -102,6 +102,7 @@ pmic_fgu: fuel-gauge@a00 {
 			io-channel-names = "bat-temp", "charge-vol";
 			nvmem-cell-names = "fgu_calib";
 			nvmem-cells = <&fgu_calib>;
+			sprd,calib-resistance-micro-ohms = <21500>;
 			interrupt-parent = <&sc2731_pmic>;
 			interrupts = <4>;
 			status = "disabled";
-- 
2.53.0

