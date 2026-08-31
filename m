Received: from mta0.migadu.com (out-44.mta0.migadu.com [91.218.175.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1CA4AA563
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184010; cv=none; b=QZ1gdaRUii576ogsjDoZ+G7+RFLoXJwBy/FyChIAO/5sKhb/aXJ9rpWOKeKt1wYyauJ7haHnv/n2fmYwluQ+9ZAETQ7HsaEYaONzIB1vy9A81vMP0gmBvOlonfW62gDLeghPcctOD8sQS/HTf8yJUKFrJo1CZoi38uH7aEo4T8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184010; c=relaxed/simple;
	bh=aJYTFNqOScKS85O+yLyZiMcEgXXBbLJv3BwXF//J3gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eRYtoQemtyA1DROv7pVqukScCFdChj1tle0VNWz9mWj9EiJYhJ5Ldy5v16wZXfJH5v+W8PHMcRD32yPLRlWlbe39CKkBDF7z8a1fqTTfmdjB1vUjI/w0b00XJWqT4tSuv05tzhLqPINQmRwiSPyoxMJ7WVTiOuQmOXndyaUfYec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wkw1Xlg/; arc=none smtp.client-ip=91.218.175.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wkw1Xlg/"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aJYTFNqOScKS85O+yLyZiMcEgXXBbLJv3BwXF//J3gg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788184003; v=1; x=1788788803;
 b=wkw1Xlg/XtPK6VPF4HGjbH9EXB2dlRdMfpK+tdrrbPxeYVhRLnqI3K4oUBKfv3gRp1T7RMpG
 YXX4jwSE7Eh8ux5SBw35SQcRTMyisrmPMYE03PlCnXs1G1Y6c9y88RxlQ5gFJt9406YJaMvbT6g
 jDv3s0RzSQVPYYMYd679YQa4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d27796f85925d44a;
	Mon, 31 Aug 2026 13:46:43 +0000
X-Mizu-Trace-ID: d27796f85925d44a
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 31 Aug 2026 21:45:40 +0800
Subject: [PATCH v4 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ctl2301-v4-6-b335d52a0570@linux.dev>
References: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
In-Reply-To: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1042;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=aJYTFNqOScKS85O+yLyZiMcEgXXBbLJv3BwXF//J3gg=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlTW+cHvn14YJr6/o8nOM9mRPr3F0xu/VT9b8Wls12TX
 +2bOFnEo6OUhUGMi0FWTJGl+wHPtgKfKNsCgUJfmDmsTCBDGLg4BWAiS80Z/qf6nZt0KO3/lMKS
 S3Nf/7Kra2+e0bRpsf+D0skfL8m+WFTC8D88YqFc9b0UC8cQM9N3Bg9/XFdWVQs9u/nJiZV2ghI
 OF1kB
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

Enable I2C6 on the K3 CoM260 module and describe the Sensylink
CTF2301 temperature sensor and fan controller at address 0x4c.

Override the I2C6 pin power source at board level because the IO rail
voltage is board-specific.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 37627963a649..92dea8639779 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -58,6 +58,23 @@ serial-number {
 	};
 };
 
+&i2c6_1_cfg {
+	i2c6-1-pins {
+		power-source = <3300>;
+	};
+};
+
+&i2c6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c6_1_cfg>;
+	status = "okay";
+
+	temperature-sensor@4c {
+		compatible = "sensylink,ctf2301";
+		reg = <0x4c>;
+	};
+};
+
 &i2c8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;

-- 
2.55.0

