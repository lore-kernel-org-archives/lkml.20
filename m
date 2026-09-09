Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E224B52FE41
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997728; cv=none; b=gjZuGm3tlWiOFn3KnWtX4LYgvOMV8ROtuGxhTij5sOvXWH9EdP2fOIfYTm487Km/d5B9rjf8UKmdhp4v+JajvQGPkH1Q2Wewueu75MXZO6oSEPe4sZM0SzN7mQ+GIIflBSxCglP4n/q3KQcn2tL74b/xlM/Dpy0sJPXiHr3qHqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997728; c=relaxed/simple;
	bh=e8dMr4f1lftzqjuMaGOMoLD/h2xtn1XixeP1l8uWEvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tibsh/lX1sfSvhVqLejyM3AfN1ap1wgOZOUxYPTPE6Xm0p9n2oMQS+5sH54EKu4G5+voZFOcjbfEwUj1MTLR7UanXezPeOouz3QD+B+gTcU0y6kFAn5KOEXaU2sGkwuDFzv5rQiNm5IkWwnT1uHP9X8Fc+G/3UuZgUF4btM43Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRAbIhBB; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRAbIhBB"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b808456308so1215816e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997710; x=1789602510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BXMJykHKFWPZ0jyTho5hTbIzJ+mvaOVStcU57671ubI=;
        b=eRAbIhBBrPWDOG94y2ZrSZe5NGSbcho5be8tVbFbFraegQHYCOrxv1EbkHN+H2QPLT
         BmOa/WCiduCc0EnBpkGGfCmzsxxch3lGvKOSVWtJ0ePOsNrZtnvXanmL/JbO9KN6mrQK
         enOcWUoWmc00+ifCRlvYBcphKHCefuNQN43lB0/TcN1qO+wc4yTQXVH4BlJWQ+qG9oCY
         kuqREw5QVTBcZLYagIABZ6JxibJ96ak3H1Dmbza2RFV/JUic4BXRGm/Juq/wC0yJeHTt
         Td501/bDGDF5sJCw8ENChENa2GuYwKCtCD7lOhGQu8Mn3SEc7pJ95sNvg8yCXHPGtLpQ
         n4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997710; x=1789602510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXMJykHKFWPZ0jyTho5hTbIzJ+mvaOVStcU57671ubI=;
        b=ce1g1PSPbfkEASbjMtxB0Xx9bPlnzoKHUDEtcoC2c1Awl/7HTTlALZqAfHCiKHZODl
         EBc2bErw6E/VC53N8M1ul0Cb++MvvhlIp0EEs/ODCGianRDQAZ5ra/mEiiXRgTMxvLRY
         cJcxkzh/BFqocG8zitBzRtJy/LbPPyyHGdZvzr4Cyf9U6NK3999CyFF20mnnz/0FIDeW
         EFXe9HAzE98iCL0ED/l2a4Ochyx7qEZUlYTQ9lc644hwNU0j1GWPjDT94nzVBaZMR0VF
         BKtHkoLPqeNocHvhX5x9hs6ZCu8eJI4lEvYgWOC3V9bB4fOGO7qPMRioe2mHHeb/vIL0
         JgiQ==
X-Forwarded-Encrypted: i=1; AKwUvByROrA+ZCuLKbBD2w4TiBErmBFk/RhnUcivvVkrVBFC7ZQyjQd228Rf8Lb0W2q9q98pdbVLkGTGLmeuNyI=@vger.kernel.org
X-Gm-Message-State: AFuF++l7BztbVQYvlWxgYyRh+HRU0apYVb/9+7EhYlVVSwZH9o5bcjaZ
	+tMHKU7BR1h1va4FfDW1i0iGIbqb8hXIClVs5lQeS+qr+v9RxCIruyhu
X-Gm-Gg: AYBFou0S0Akv16O0QG5E4Q5nQKflE8M0/PER+4FZU7+rte8X9kkUmM0zJJ28DoLIp+Y
	7FI4d+pDGLZvDx/CrL4c+ILU+kACX3NbSyo/Wcn/3MoAGcr0qgSm3ihCkxepiv6PFeKL83p5zFr
	cQwk+AMNsWbAx5qxv4+0meFcBlNfdEwdFnyPBcNbcJJRDnF1lBX4RYw+VkafMBIRHMo4Z3w0U3A
	d18Hq+I4mZRN+c9GLs0GgWCJgK/AMgThSC2OG3c4fF+L2BHoxdjllwCMONQqqvtO/Va0IVdbxUY
	jfpapL6knEIrhQ1MsadlJkZN9orUTEiSUBk35q6LEZf/up2XCmyUTwNSKRG0aE8hyHpaQ9DKAPj
	SoYd20QbBwfuVllayfPQczL3cKzBnxD4aYe2oObGaRoOQF2BECNchRJmZIRcAzJh2E3jqnGI52i
	Bbk6nmSGGuuTNEF1TlefPVofstQo9mwDvn4UJE5Vr9u6zwWHgJguuO9aZVvZDEfZVtg6R4NHzca
	f0Ia/pxSDi5d1PSgLDPF4DavRmxjJ9JQ1ELfm4d
X-Received: by 2002:a05:6512:b8d:b0:5b6:1a7c:28 with SMTP id 2adb3069b0e04-5b61a7c0215mr6090288e87.43.1788997709683;
        Wed, 09 Sep 2026 16:48:29 -0700 (PDT)
Received: from notebook ([93.189.200.242])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed4cesm4153300e87.26.2026.09.09.16.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:48:28 -0700 (PDT)
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"Andrew F . Davis" <afd@ti.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: sdm845-oneplus: use generic fuel gauge compatible
Date: Thu, 10 Sep 2026 02:47:44 +0300
Message-ID: <20260909234744.1177153-4-rinat.muhamedgaliev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909234744.1177153-1-rinat.muhamedgaliev@gmail.com>
References: <20260829205258.26955-1-rinat.muhamedgaliev@gmail.com>
 <20260909234744.1177153-1-rinat.muhamedgaliev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OnePlus 6 and OnePlus 6T battery packs may contain either a TI
bq27411 or bq27541 fuel gauge. Use the generic ti,bq27xxx compatible
so the driver can select the register map from DeviceType at probe
time.

Tested on OnePlus 6T (fajita) with a bq27541 (DeviceType 0x0541):
after booting the new kernel, the battery reported 4.360 V, 100% state
of charge, 27.8 C, and Full status.

Fixes: 12dfb002ca01 ("arm64: dts: qcom: sdm845-oneplus-*: add fuel gauge")

Signed-off-by: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 4 ++--
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 948a0dd..8c5cd94 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -790,8 +790,8 @@ &i2c10 {
 	status = "okay";
 	clock-frequency = <100000>;
 
-	bq27441_fg: bq27441-battery@55 {
-		compatible = "ti,bq27411";
+	bq27xxx_fg: fuel-gauge@55 {
+		compatible = "ti,bq27xxx";
 		status = "okay";
 		reg = <0x55>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index 5f01115..cf40842 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -44,7 +44,7 @@ main_cam_ois: main-cam-ois-regulator {
 	};
 };
 
-&bq27441_fg {
+&bq27xxx_fg {
 	monitored-battery = <&battery>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 7ffcad2..9436027 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -67,7 +67,7 @@ tfa9894_codec: tfa9894@34 {
 
 };
 
-&bq27441_fg {
+&bq27xxx_fg {
 	monitored-battery = <&battery>;
 };
 
-- 
2.55.0

