Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EF640F73B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358019; cv=none; b=SOpi2uXkx6E6zFUU3KDWap24fXYLyzLVnxJVqritp1Gp61YabueGnZdTt4i2dR4qQIBchcijSPZNMJKrtx5yBKzXPb4UFLjoqC2MsXEDzoZZZpPUO9eddrpXPWfbaeo5ZhSYbeJFQFmfxV6F2dEpHfqchQu9sil325rYZro6YIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358019; c=relaxed/simple;
	bh=DXStapEraLOmGWAMAjcOUlN1MfJftHIHR/FhyYDyQjc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f0dWuFr79TVdSKtyPfw65wYswCqr3eB0O5u4ttqnYJseb39c8u1wGnQd3CTuEOmTQTXhtebtsjZsfYqD1NT779R1Q6jcM8DqX+dofT3+0i1VakyJpi7uyL5B2y81wPMHMIjRw9W1lx5pJ4TtQQvDUnpvTWvwK1vzpQqtDNO5jrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkseLG30; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkseLG30"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso35760535e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358016; x=1791962816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYhBBjceMtpyI2573/JFlRc3Cnsa/4jGbMr6umzIX/k=;
        b=gkseLG300dcwevru4jPgok1FSzWT3fGfFgUvXfqCxHlSzEAUWrGiyI1VRAObVLK5V6
         4PUv6Lam3BUnqFplNs/m/vKxTlafOY4JSmvLUNRKGwmgS9MHnfLMxJcpCZvONL/t1zJu
         QNvg1VCKcX2Wp8ae4ePLle2rH9TDsf9qT3joFbB7EDskNIXzzmWeK9qVWi3jr/gWVynt
         rANWaB1shJ+hwwSRA+shrHMCjkGifptpTC3uR1Vo6MqV3tCCyzl9UjAJMOHU+PkC+bf5
         bxIphYbqFWDn8/23oQTPupaAQ5bgYCrruioYjK+3ELmW6iWgVJGu3eLXaiJRa9Q0ofm0
         iHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358016; x=1791962816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYhBBjceMtpyI2573/JFlRc3Cnsa/4jGbMr6umzIX/k=;
        b=eDtXQCX4JUJ/oD2ocYko/qxSI8DDg5inlrQpwmKKN7WXGs/Ic5xVVomoZBNtX11kui
         Osb10l4AmzuSC+vifAnRRjcU+BkLXgs5UPdiM98xrcleaHqYlnDBrR667SK3seUDFxJL
         EeqmKni8K7WZQWhe6tgk1j09WOaAynjlU1vyfgUf9ZyrC0b7a8KLdZIup1NRziPyG2VG
         PSMTQZg4ldxeKkxMuFwEVxiLp6cTDbIB0K+Y0sHI89I3BcX2jumqIj3J+c1YkrJxF693
         klLlj1NTZWfkERqlreUWRaEKBC6xrPAVuzMbCrxtME4YseTdCaLB6RbcTu/RWG8DfZs4
         /Z8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwR29jPr4T3t0SBQugNAb1raYSyB+DdKFVZbdWdMVJotJF5DuOwle/BA1UNAcU+lWJdMLXK0fB27/A2bk4=@vger.kernel.org
X-Gm-Message-State: AFuF++nGqjkvlTbsMrWUNuQ5GDsn+xEaLIU4ui10U+fxglZ4td9FSJ4K
	WStffoZJgV6LMVCje/GzfCUpIatF+2GTK6r/wRUuLqIOzqsAgxnGlmLb
X-Gm-Gg: AYBFou25jataa+fWD8ieF9qDMm3RgMLodHmCsHL6s+RjOlpA+wwjDbch9l9Wqqq6jrm
	eiW/6l6UfDA+UQbzvrT+HkRUqHnczhfQMuoaXYAXvUJwsGHTyqLSnVA6hRxAsJN45KJAFtN0+/F
	RdX2IFK0xmxgZaMMDcOU2xvH1uaADt6qnKfo+IyJCsLCJt4/gdlorpZZlYvLJ34+SfoH+9qDxk6
	kbg9/YJJoqs3KgqWGqfKzAcup0y1jyvFbkHB0dQPUBzb1ieSYQBcwvNyxf2wL30VTRUNcEw91th
	QVRA3vo2Y8oS3yvMXzrjAyLvCQGiZswPtXliZsc7noZ4hJmYbv1ts90WPD6PdCHIPFIKs3zSI+Q
	FxjLaUyMCgk/LrwoSGPS84yxA2YC5hmfRQDcyQFgn2vcIZu9rlNdOZSGC7nekugjR4dVry1o1DV
	4aWVNLOqO0DUIWpgoohnVQknhIGF3t6XkTcxH6gcDC10TviXQ2bgUlrG2rSujzC6wmoG9791LtX
	F/ZB0S3lwCBCDijkzA=
X-Received: by 2002:a05:600c:4687:b0:4a1:688d:a41c with SMTP id 5b1f17b1804b1-4a18065e235mr18138445e9.25.1791358016421;
        Wed, 07 Oct 2026 00:26:56 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm29912955e9.4.2026.10.07.00.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:26:55 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH RESEND v10 2/6] arm64: dts: nuvoton: npcm845: Split APB address ranges
Date: Wed,  7 Oct 2026 10:26:41 +0300
Message-Id: <20261007072645.1618147-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007072645.1618147-1-tmaimon77@gmail.com>
References: <20261007072645.1618147-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the F0000000 and FFF00000 APB windows as separate bus
nodes. This lets each bus use child unit addresses relative to its
own range.

Keep this structural APB update before the peripheral additions so
nodes can be added directly under the correct bus.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi     | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index ab8a01c..a92fbd3 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -51,13 +51,12 @@
 			reg = <0x0 0xf0800000 0x0 0x1000>;
 		};
 
-		apb {
+		apb@f0000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-bus";
 			interrupt-parent = <&gic>;
-			ranges = <0x0 0x0 0xf0000000 0x00300000>,
-				<0xfff00000 0x0 0xfff00000 0x00016000>;
+			ranges = <0x0 0x0 0xf0000000 0x00300000>;
 
 			peci: peci-controller@100000 {
 				compatible = "nuvoton,npcm845-peci";
@@ -164,6 +163,13 @@
 
 		};
 
+		apb@fff00000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "simple-bus";
+			interrupt-parent = <&gic>;
+			ranges = <0xfff00000 0x0 0xfff00000 0x00016000>;
+		};
 	};
 
 	pinctrl: pinctrl@f0010000 {
-- 
2.34.1

