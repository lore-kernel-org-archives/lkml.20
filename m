Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F485194C96
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727204; cv=none; b=A7US6ptEzbTMW+qxwvR4MrBegBhUKC6yKcPrxq3HTDqO+cEHKtell1W4FRzoZkvHkEN5DIowGf8G/9lQ3Jt/FYFtfz8iE1nGGm/jlasy11t7R678Od4BTh1GM6vXGMNZNyUW5NiDFCbAm6jYKIS5tllO6NZu9lzO3Kd13pFoEGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727204; c=relaxed/simple;
	bh=03oIVo7Mwx5/dyCToWlLUM6KJ0gWVtj9L4EMotVyIgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B7dCeukHARXxso9JWfh7OL1BYCBzbjYdNZzEyWKXwTzzzRvHAgoWdNVdztGSZ6+w2JI4fURMdyC+XkkVPARbp74rH6uuygCq+rtFTHycKzTo6ykKtAFs+StMB29cEUsvUTYnnaZ9VQplSHrSEDEtfOcK8k3+JCF9Hn4wNO4EIzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pEhg/oFx; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pEhg/oFx"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so3397208f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727197; x=1791331997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxnJMxigiIcSjCIhGGC3UJY5HM/ObSeIMc3ufp0EpQs=;
        b=pEhg/oFxkX+a0WR3vjlI3rea4s8gT30QGTwYAgwTPbc0/48MMlIrTmMjpp2YoJrXJY
         /h57zAgqkaH+Nt4fssR+1BrItXJ3gsIA447lVseKujY/oUrR4ItXw7qgZDd5bLXX39sH
         C3hxlPUeAJ6fG/R31GZWm9h3CEcbJUN+sbACfoxz3c1vI3SAIcxpvX9g8NAYH3NYTEOq
         aGKZjNa2HHdzyXyk9P6yK117z4/qLqSg7W8QujHOgQvOG4A/lJ0YFK8dOJWDKR6bxo/q
         mRHNWoSQpvNLw5oUd1n9mqPiWwmmBpzVBCw2Lh6jbuAD2vd6HzKT52mU5eFTO7/eLzYH
         agpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727197; x=1791331997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xxnJMxigiIcSjCIhGGC3UJY5HM/ObSeIMc3ufp0EpQs=;
        b=2SdaBMErG/rwF2cAvasYUNufKrFVQExACWEIngqzDfmF1HTGfaiXdfLLdlP+gRsmrU
         yUlkv2TbqpMxpKIeGLdsnmWHscIBjv9SfUBYwdCAs2hCe3lnI9qU8mpNtchNf11SjdpL
         4YmIyV9ElwSXhHM6hGJvIDpW7fCKntd6Ev6VdoGCVe/R4ifKhdX1MfnwSQXT0dncpAvB
         rlypY7O/XOm1pgv2RaO5IGWiW2r6Gbj50y8W0B0W1nQXL/kRbW8OFpss5+4Prb3y5ndo
         0+TZqqZrxkhljDNfTCAPGgvpBajQLV8QkyWGdRO9uSH0gR1ljX7dU4Hj95qWd4zVGGq1
         kWng==
X-Forwarded-Encrypted: i=1; AKwUvBwo+p5U5LhBXDYOWA0NBUBrVqpdKbAIQALY//iaeqykdPFJFUPo9IX85UL13mVREXpCspmltXwOKqV7FqE=@vger.kernel.org
X-Gm-Message-State: AFuF++n1nofun8Z1BiDGxIF/jFaCh6iZxnkRvKL9/B0A2TgQwDu8eH0s
	ei88RBX3+yweHaefwpa1OuuKvcw+EPDE7honpGvxgZKHmwX3TfxParHAsO8YD2ifmVs=
X-Gm-Gg: AYBFou3ExyVXviHFkOGpnTyPDw0frMjImEmIEJiDY6TvZPZ5a1+Wkzay5C6AszNhFhv
	TuT50rHEWo8IxHEdtuuF3mUEx0C9j7IMy50eK23Ejf+zv15x+SiEtpXw2Gc7oOuE3Z28gvuj1xd
	yBeTq+dINTlvC7/Xcr8gyv4i8gGakjrANwn+hERIYU9+4a9inpXn4XMBY6ZrWv+rgfKhGlFJ4aj
	B3FstNaGCRgreaOI1BoQGCWuF0fWLce8z8M0m2gXQWDmnw2u9V+Zeo/isyTB69pK+nXS6g6bhi8
	V8yhiT/rZbQYGd5TSiERKIHffs9GAXwHYUbpro+5seX5bY7Kdtt/JR5m7Ox6o0ByvXcHRGKX7rg
	5xXRTM/Bbp+kmPJ2VGW7nugmlGXAE3EpwBeczqnrqPMfP1XfRUNtBck81gH5I1k5MWP9b3nOeKM
	ygBGSrt6km0WW4UvGFJNbp3wZVPjRRJvPyhmKPujSnDdvfT0CV2V62G0MBOo0p+GB9iUtGdPWVZ
	heLoXxosdI5FmSiGaM7U3ESZoFSCzBE50hxFptgGmUAZv0fliqt8DeFrPWYCw==
X-Received: by 2002:a05:600c:8b4c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a01502b7b2mr11612155e9.19.1790727196898;
        Tue, 29 Sep 2026 17:13:16 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:15 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 01:13:01 +0100
Subject: [PATCH v7 6/6] arm64: dts: exynos850: add PMU interrupt generation
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos850-cpuhotplug-v7-6-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add pmu_intr_gen node for Exynos850. This hw block is required
for different power management routines like CPU hotplug and
different sleep and idle states.
Also reference this node from main PMU node.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 8a4771899a8e..803fc127d895 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -231,6 +231,7 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -248,6 +249,11 @@ reboot: syscon-reboot {
 			};
 		};
 
+		pmu_intr_gen: syscon@11870000 {
+			compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
+			reg = <0x11870000 0x10000>;
+		};
+
 		watchdog_cl0: watchdog@10050000 {
 			compatible = "samsung,exynos850-wdt";
 			reg = <0x10050000 0x100>;

-- 
2.51.0

