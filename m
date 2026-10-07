Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132483BE645
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358024; cv=none; b=L+3UwRlsVIkyG/KZW1I+C5omA3FEiEzraVfjj+u5DktzGHCYfb/6WVwVLJ8bgNhG6efIfYUtmlI58sYPfs1ey+L3M5I6iSzpahHg6REQvnPURSCDY8nWeO/Uwu3o1gqj+9n22frQii2+jmFyINBRh1Ku5oTLrbeX95O1xFNF8jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358024; c=relaxed/simple;
	bh=2yjPX6fzpJbC7tPLZg7fc2fugKPof4O3hf+Ew/c2fd0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zb/9oBTRnasg98KJ84Tf2qAep6Kec7PwsN9WONPDoa43HqBKSMiZPDJR6IV+l4ZDcP76PflT9qGWhQv3qzHvBTpiwvu1kQ8/SJVFOFaRVmkui3LUf/xRYiSVJBUd2RaHc3Pe/EiXgloV7Nyy2tmIfM0nvLxmGtdPe5ZfB/lDQok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5VOcB93; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5VOcB93"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a020e65269so11239865e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358021; x=1791962821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N93zwtvuEjpeUV4U8V8Lc96gQHGtAXTfWSzXg5QBVvo=;
        b=M5VOcB93tL5yhXpPyM9BTllrg6Xbh3x/Iqwb/XDfoAS6Sr7KAuQd60D1tf63mySiIt
         DmqxJ9R/Sf7y8hxeDyO8+nHfAHwL2+hDYsdpUfpCS7cCqwJp/WxARQ1Or33pl5xApyt5
         H6lugRFyuBQzpzBX5Cp5OhW5MSTDXy8qlPWMXRxMmH9QafTjRoqxvX+AXoQXYVW7ggGR
         upNKgAOb7MhmjApc1kLzl3T+Hk7m7M/iI7XmzSeWImEQcb/SBjZFwPkpNYCTnYtGmygn
         vBLjEnAEXM7zUJZFnIYoWSXfg+oCH8Mo7AHCns2LBOnUwMnPB30+Wxzt8mO0LU6uEsPQ
         ByIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358021; x=1791962821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N93zwtvuEjpeUV4U8V8Lc96gQHGtAXTfWSzXg5QBVvo=;
        b=XvY0pm2nTthtiehWrSmYMt6gynWoazK4mundHL9txrVZDxAIgXSAnryDXWOVFxJtqD
         ROZWBw1gCYVBOBRbyql/flNQrr5nLn+0xMzPfUIFj8F6ppaXQh/T6ljIbwvlW+1QJi7o
         UEfDkP/1XOzViTYXILtcecvrIb4CBRvhzzb6xNTqTXc9EEJE4SGZHIo/oNh7iL00KlpC
         DRvdU8USPguuew7JAqKlApdKEJVkDico7ifyiu7VTR7ixf0EaRksTkqEnSeFpOLFlMrE
         gJruzzEda3/lF2XmVrszgO3d3fhDCnpY1lupS0yCwj6pjDUJp2ST9naRz557/MnKtTKM
         gQUw==
X-Forwarded-Encrypted: i=1; AKwUvBxXtjHxAabrRdBWq5bIiZMJQWtjL6+Y8n4/it5vOiAXGBuf+zOQPr2SMVhHGx/P3W19Ls/XG369GEC4HMc=@vger.kernel.org
X-Gm-Message-State: AFuF++nNqTzg4aBVTZob8W07HVJ0JR7XDeQhGY8nX+lgkhqDFC2xr3Q+
	KuRRlDmdwhR5FOhP5WyV5opEvQGDYJa/uF47vdhjnZ1H2222OQnLdYrA
X-Gm-Gg: AYBFou3hugdt97DYwfmG2i7Obg50zNlBYyWBOGH/2H3VTWYugZVfv7T6A7vzFsGU1aR
	QMiVakEb+1ZbG6yzvO0YOj7aHfgiSAtMhEK7UlKjl3dUKOUAWLhp/YByJMB91vCKIEkhRBGVCCE
	eIvcrfRAy/L4Vqmj4RGDPAQsfySL/mYEtUhl1cXrey0gFN9rQX8rk2z+IWtpG3wFXt0WgN5QlIK
	Hlu97gGCE51uV2WKqplmV/anWhAga3cqUG+XjBNqJ2Gi4LJnw+ZyYQG057LfnML0uNWok/3IS96
	6XolINOX4ju5MztzJtAVbubps3DQY8baRj8xIfcEriguXT/p7w5wHbuBaGL6ZM8svvpG9uP+7zM
	NAk10RkkFppLlURn2+dF87HsNokCrqpN+loCTi8hgVIfop3KsiqUqwGDK65B0mR9HFyTpfaGZ8N
	dg8Ne/ZAEyR0y3lXvdUJaKV00YiHW0JIu5te7pb7hQTyNM/sCaRhytuC6ZRsi5IMsxsPBbjb2eF
	avzn6puew==
X-Received: by 2002:a05:600c:4fcb:b0:4a0:eae0:b30e with SMTP id 5b1f17b1804b1-4a180455c5fmr16716805e9.22.1791358021033;
        Wed, 07 Oct 2026 00:27:01 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm29912955e9.4.2026.10.07.00.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:27:00 -0700 (PDT)
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
Subject: [PATCH RESEND v10 5/6] arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
Date: Wed,  7 Oct 2026 10:26:44 +0300
Message-Id: <20261007072645.1618147-6-tmaimon77@gmail.com>
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

Reorder the pre-existing NPCM845 EVB DTS properties so the base board
file follows strict dt-check-style canonical ordering.

Keep this cleanup separate from the peripheral enablement changes so
the functional EVB additions remain focused.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 5edf5d1..2dc1a4f 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -5,8 +5,8 @@
 #include "nuvoton-npcm845.dtsi"
 
 / {
-	model = "Nuvoton npcm845 Development Board (Device Tree)";
 	compatible = "nuvoton,npcm845-evb", "nuvoton,npcm845";
+	model = "Nuvoton npcm845 Development Board (Device Tree)";
 
 	aliases {
 		serial0 = &serial0;
@@ -17,14 +17,14 @@
 	};
 
 	memory@0 {
-		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
+		device_type = "memory";
 	};
 
 	refclk: refclk-25mhz {
 		compatible = "fixed-clock";
-		clock-frequency = <25000000>;
 		#clock-cells = <0>;
+		clock-frequency = <25000000>;
 	};
 };
 
-- 
2.34.1

