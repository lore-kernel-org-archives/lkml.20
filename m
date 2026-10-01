Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DC33B7747
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 03:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790824161; cv=none; b=CfFnSTwf78RIso3/R8oboV+X1iW+dvRScvK6g4mZFzuj/k8XyysZLbgDtoimVYV7TLJ51J/wOzhXJpxQF1mH8B/fL1K8+0BRHQmCwPp09o59a+ttbf7qBNv6eJTUXsxNmNx1wiYRoMmM+hba/Ehvr61EkbRqE3C8rKAdY5LKfsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790824161; c=relaxed/simple;
	bh=dbTIwyw4CqN37M37uVMpgDifOVLC5NdD0oVKwYz46zE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o3l25EzLIuf7b87oF33o6WRQMFrkpv0meJ3kWoSvafC0y+r10+D2CyCgwchee8CAZpJgYAxUuM0fR7mjV8bOxdCVjRXXI4ytcMBMfxwKJx7fP3FlAA8IGOxSVHQsF5KumLUm9EjXw7r5r3V5D1QF+JXr08NroxXIFSH+xD8nqiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B2ZlDqnG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2ZlDqnG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso39266175e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790824158; x=1791428958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXjuorbWXcBYyzyLsypUMy+M+Ccbc45oTf2VM31XR8w=;
        b=B2ZlDqnGyTATemKpXDAR2aiu1E5HapK+IPR/hkkZVHAHo4FxGYl+cdVNLwJ5dzwj7n
         fzSiKX4Fq0R86TZ+KrFCxSbTi6/V5g8JH31SJsJAvoIQC9BSooC9+nW2RBBJs7tPIQpZ
         MqqRDZVSR0p1f4z2OgIU0McLbeAlRqlx7oL7V7SXivrqV/osj+jnPp8Nm90B2VUSugGT
         lGj+wskFv3FGLEMqaEGJYT25dlfWKVH72hFy7wkySABPGnsamy8xlWRZNui0pfIUR1xK
         7lKuH9BAWShTHIT5xCBwA9nijBa3PVvMHYHaUAyYC+KEktruNJSbUFyZG2SvNaU2TKzB
         mZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790824158; x=1791428958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXjuorbWXcBYyzyLsypUMy+M+Ccbc45oTf2VM31XR8w=;
        b=raHUfEla6Zvr4avMUSpL0ay6b+pDvqIO23yat48ip/5w9PnLXVFcPxd9unIizw7QEP
         1p6tl96du80oCO1mJHr4wqkII87K9o/R2qzXSvwRVHDK9k/lz+xdtTO6lEmgXxiTwh+q
         g8MvZP0DdptM1V5nSPSesfGWiG12DEauDhP+NJYimvt2zxJHzU6CFy3JbrinoDoIE8/n
         Pnk6jNz8eEUEP12Vd6L40Dn+Nq6n0yp2en0YJYYTssYd5EDe3pHTZVaZWlbUrxfLRJca
         Nb9r8O0zNNU+UiWXnhaGOgHtjtn2glKM3YuQUv6wPDho3xI1bzrqZifQXpU9sjBhUFzS
         Gv/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzxQObyDesAfZ/J6of10WESj244RafLBX2qxMGzOpx2ZYQQU/m0pvFuNJ82c58zBr9wVm2YnyffYx52ItA=@vger.kernel.org
X-Gm-Message-State: AFuF++k3QxlMM0aDXt24Hi2gUN3SMo5oCqoON0QgxtMlK2jC9RKuvBLT
	vqnudsBOZGxBa2NsGkPrZBmcpVocD9YXGEbmFZWZlzoUsqcXblidK8N8v3kmAYrKZf4=
X-Gm-Gg: AYBFou1Jk/rD2GJw3B0X/vjIiKnBYv/NEEiFr0Ev5cCi4HwYr+nUv1mXpDIcwiTZ/Aw
	xqdHxZK7vMbVoS9bwHWrvTdaPJbQfcnHWdPRPhfBMaQDR4lIUTzAZ8LHYl2ayPDJtjXWQrGtBju
	S+qLtDMdgGEFgDAr5IbpqXPKBji2BbdG681H5X1Dz85JXeZCuW3LmA0sbTHVcdxJNe2TtnbAIB4
	fbBBGmwoKIUaJ8DR3xPseHu7RKoY4VN+UDdBDBNtquZtwQJqw+JHQvHjlCWkq47yoDHhGP7FMOO
	yh4BGZ7D7T+NLvwzpocK+O/Lngatekwjj2O4p0nCRr8eER0nkDF3+iQ5d0/F+q2UF2OKi3sAWR+
	OBmj7V7tqTeFB6SHxbXKGFFmise7x5wAZZuqQXOctRM+R58/s7eLHb7NxO51yRmkjymHJsLIVX8
	5FVUqgVbDC4dYjH6CQcuyRJrCbQKVkNgfPH3E1idlcemvAzi5iOtg0KStGjh5LprhDOCgzOuZiY
	/+20qdFjablluJs686777leWSLPZKP1vJGZG3I1LVJOC+o/vyOwSVX7HzWJXQ==
X-Received: by 2002:a05:600c:8b88:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a01ad98373mr52694045e9.4.1790824158363;
        Wed, 30 Sep 2026 20:09:18 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9145e6sm27091885e9.5.2026.09.30.20.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:09:17 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 01 Oct 2026 04:09:14 +0100
Subject: [PATCH 3/4] arm64: dts: exynos850: add ADC node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-exynos850_adc-v1-3-791b3516bb9d@linaro.org>
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Exynos850 SoC has the ADC controller within CMGP (common GPIO) block.
Add DT node that describes it.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 8a4771899a8e..eb87225a756b 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -355,6 +355,16 @@ cmu_cmgp: clock-controller@11c00000 {
 			clock-names = "oscclk", "gout_clkcmu_cmgp_bus";
 		};
 
+		exynos_adc: adc@11c40000 {
+			compatible = "samsung,exynos850-adc";
+			reg = <0x11c40000 0x100>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			#io-channel-cells = <1>;
+			clocks = <&cmu_cmgp CLK_GOUT_CMGP_ADC_S0_PCLK>;
+			clock-names = "adc";
+			status = "disabled";
+		};
+
 		cmu_core: clock-controller@12000000 {
 			compatible = "samsung,exynos850-cmu-core";
 			reg = <0x12000000 0x8000>;

-- 
2.51.0

