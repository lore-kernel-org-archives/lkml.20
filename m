Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17CF3DB314
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651468; cv=none; b=Dz2rfAxleXdqx72KlRFAfxeJuw5h7kQhu+ZMVmvDUC+qKN8PfhTXr+K8pmWxKjX506VpqjWUP8TS6iEKhMrfwsqsEP7pEYdzQ1uMMbRDDH8zdxtFw88qaOPOGewNp00MmeK4KpOQobIp0sGmDn1BSzEjEtlvKgdmg/IubsRjgLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651468; c=relaxed/simple;
	bh=Hgfr5cIDes5lF6RJSfHTZiD9fCb8BoSIwwoCRMm+R4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d2asn41onIaXnEwG7rgNlHw5i957FiXgD74ny1tx589FVgz/vlKNWQSPJ4LpLzMYXqoHCkwVrolzZYkAo2Xgqo9aSL/LNWpJ7C+uK/RPCxT2hOG+A/iTo9xJ6Pu2hjY2bNAZHeJZ4eEzbQ3g8kT9P8xFYyEWoAL1phMYGYOGvy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bdMjPXn+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bdMjPXn+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso14380215e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790651460; x=1791256260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Tmkp/C41+VRZ67CctHDbpVV8IlGaj/VN6M2tb1CRsw=;
        b=bdMjPXn+VnYNgb3V/Hd80lVGYJkoyRqXGiXDBYr/7sfLWq8TVW4Cbn9BWjFjRWKtR1
         fnHR+5TD+EVwxhnQNGalH0tsmASfKQRNJDYTBINtxIWPwLuR2VNPdCFzEnWvb0tswotE
         OSR8gPBD/bznRPgS48FrVo0kIM1PM+m07jIdOteOQzEh5YRAXKnSH3SBapep5Kqn+ViH
         sOtXmByXA0JETiNyfLznUsSssDm03cFPG3JHfJeSkbYunR3Y3u+v6gHQDtSunJpPOjsF
         j3Lz7JWegoTZl9zfnXCmXGZDVl0SfYeM1HY9ATvYn5lFJDJ7VzPI0ksjjY+w7ySNhaeT
         f/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651460; x=1791256260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Tmkp/C41+VRZ67CctHDbpVV8IlGaj/VN6M2tb1CRsw=;
        b=HMsTTlWMs6wj5dMDii6Kqj/GWWAI2IhVVhlp1F4YNaFVw/UX/Emg2A2grEB/lLlUdY
         B4f/3qnC9F47ipJCkcnjw3x8mrhakDl4+Y49vnVi/Vgq/cs06ulXwyYzRhpKKmBcCTNn
         N5PBe78SkVVVzWd5VwceoW+esSjkhPsSDPYnRoy9sFjq/mxO7kNSNVcCYYKYKDtT88dL
         Tzs33X/zHJYYZZ0dVPcrcjiQIAte2I486f3/x+5U2GtqKaRJZbODMJXg0f6vETB/4KQo
         xFuOm3hGBHOaw0mi2ez5kZUYkXhYeVxaiuo3RKnw1GwxpikwFHGaWbEpnMg44eOKiYtj
         Z1sg==
X-Forwarded-Encrypted: i=1; AKwUvBwYyLriFFbF6raskpfhkTzTRjSPbok8Tt2/jzoq5aPujbghbqKcIqA5OQktXw2GrnbRso5qXLWTaHtAg8A=@vger.kernel.org
X-Gm-Message-State: AFuF++kqTLinD313U/3qxfdTRFa1I4/3C+59szkHrqdtOF6aM3/0y47O
	ApYMuUNPu+Gm98d8Pi34JKw7K7o4WTLW0UMHshGDuMIG2YqsarIIu8Zny12n9yRgyXQ=
X-Gm-Gg: AYBFou3dlYD0mIXnnuxnaFU2CCfzdDOlX+EmpjHcISvrPFvtSWOb36bPtv3qsHQ0lBZ
	Q2YAlSPEfpHHj3yMP6tfjOVfeaR9kL6zjLJFiQbcmTqVqtz7LTBYAlW7hxQTxTUxB6gIf6MtYlW
	F+oL9JXiVMk4d4mIhjmXJD35it6fa392y/i+c0vCBC6Bz7UMqPJ+BE7Y1aSG89TWGbhrTbWExyY
	+P4cNyYMhBT4C80dTSTuwaiX4UUhlb77WzK4u1n+LlzqpHP4otN0MZAaVqg05CwyuYCMMxCbzEN
	fLRdw3nB8/hnyQVkG/l0pkVCmjCYcyp6cD7ju1ClS8Is3SYBqIuFprILuLFhdPRR4h7c1/a0lAp
	Fz70Hneo6etDfVytqey7mp42NW9qWkTO6rjBrwAk7tN4IF/oDCgUNvvf7rm0NspnKVyegT93Y+O
	XZW0ANocle51Au3mlLQOJjJDUjrjDOa84ai2gITOljn/xA4LXEtoEf+qvlETgNRHfaV+iWgCztZ
	6dmP6mNeKlLpzTRA4T0HCAMfGCWVsRuDDGBFQQJxld3QojZzaP//A/HzNVK9xg=
X-Received: by 2002:a05:600c:8b6c:b0:49f:ffd0:9a9a with SMTP id 5b1f17b1804b1-49fffd09b09mr108686475e9.25.1790651460523;
        Mon, 28 Sep 2026 20:11:00 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfa66e5sm46706265e9.11.2026.09.28.20.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:11:00 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 29 Sep 2026 04:10:47 +0100
Subject: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Thomas Turner <tturner@lineageos.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmware
protocol provides interface for all client drivers to actually use
features exposed by the APM co-processor.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 8a4771899a8e..91c6cee8f483 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -11,6 +11,7 @@
  */
 
 #include <dt-bindings/clock/exynos850.h>
+#include <dt-bindings/clock/samsung,exynos850-acpm.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/samsung,exynos-usi.h>
 
@@ -170,6 +171,18 @@ timer: timer {
 		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	firmware {
+		acpm_ipc: power-management {
+			compatible = "samsung,exynos850-acpm-ipc";
+			mboxes = <&ap2apm_mailbox>;
+			shmem = <&apm_sram>;
+			clocks = <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
+				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
+			clock-names = "cpucl0", "cpucl1";
+			#clock-cells = <1>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.51.0

