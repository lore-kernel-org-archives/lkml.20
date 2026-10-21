Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574512;
	b=s+iRArfKdqyBWNXO/4XMI5jKgxYBSFCoJRBileMd8aT7swRbg4JPi5CkITfMjrKTM+nQ
	 ExWYnddTnqUIm78bggsiKmlk0MZumTBzkxGMalWKBuMjcGBHG7wZHMwB+Ik8f7HCNTM1C
	 5ojCBWjzgc8g8lY0bPnfJj2hx6MNI3wDnzzt7FApbx1MA/TQAMOXWtoNvRROmoot8R5vQ
	 C8w7R2mSi3njbxKIs8j2w83yRFWb8tRzSftRQSB6kuTCKUT8S4vdhr+1xbImTvQbGRGIZ
	 M0wltgSiw3L3CydvF/hlgwEIgHdDerF1QY9LcRkQ5JWTxWhBlrAGzn5/CYAQFV2T9VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
	b=AXpxC7Z9qk24D86el71P0yE3P+IbTuUW1rlCJ2GA4XD3gpXOoBgjNCDJviZaB3nWifX5
	 uWL4zXs8CLWIP0BaTBA+ii3847WY4OBPsg9Y5V69OlIeQ1bGvN/2gz8ozjTw1kzqqh+1k
	 SJXYh8TWlm4ajNWmoRAczkhuBLAUnPZ1eOIZvCkdZvienp04gFwvL4lXpMNQS+upaJlRT
	 TMO7a1YRUJ7MtvnSeRHYDggXqHXeXfBaSIDKdI7LIFWb3PwD4qtt/DjR/TWkhPYxDpBXD
	 4oy3uqIbDVQQEBawsWagHfuJncsLVtYy63eko3MksRuVPQNEDOVRCX+Xu/4gw5u4vEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=cF8NpgNO;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC639606A330
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC639606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=cF8NpgNO
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so5459735e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792574510; x=1793179310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=cF8NpgNOidXypFF8nAeez+ilEW+mTTKvGgDjDA8NK7eTvc5HanumcYt8s5/RYUCJCT
         1F309TmqcALHdI9ZP0u3G9uOWqrWL/xudfE5Rpi+N2iiSqs3wewR5bZlrqxzvk7khWbN
         cpvhdLL6xVLxnh2sshUTMd840ZGKuN1N8YClE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574510; x=1793179310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=ACIKHkB3xxr6h8sAPlxa7VXmAmdV1cPUdov+XOMrGca/8IeFgpbr67niEkxQtVqFxq
         DzjwtrrApb5zrdxkC8pzCu5Jd5E67QoyYrxXtEv7GBdOL2iuFW2i09ayl1duVh0SzbLZ
         fbwRy+Uv0nmXHVvB7FSSjbKf2omYCE7FR3JpEfXjc1TZ/LoyxzvAuyS6MnLkv54POSHV
         Ke98f/MArxunsy8RonSLOGqS1QnKBevxtjk7QKHarqle2Ew3XWfuqveMWr8GvvbHxHUt
         wHfOuUaprPvr4qRnxjsI9j57sSI4zaPwS/7+4/rcaX2lOdM8C8omtQG3nhmZ737oJtNC
         9b5w==
X-Gm-Message-State: AFq9FYI4gdqU+VKs2nBb7yAXLTS259iVh74eBAj2/hUaxL7D/zeQ42XT
	WI1I3tRPxKOwgRxlx0tQSZNT3TzbUV1u82zp8yXX1icaFC/sx5GeFA0oL8N3FCc7GwCZccdjdsK
	MnrqFUkg=
X-Gm-Gg: AYBFou17uye2BcA7aEcW9viIuFTYmkv7Ri0bulomVOvtsS6oN5JHUVZORoPdfMbJQHr
	Uzuy43vCql5T3lRzsDc/w9eA+ww9PrCSDH+pyA2ifhTqOH5CqOh9unOruMoL+YSzjkrtKTYY7xG
	jKIwGnp5hq3C+fo8GGWrETHfVHOZ5qmo8vjhFwSnlQwkJRlAajRvPMMTP+CTAhPo+XM+pDm0nHH
	7dQOCnVWNpNtDWLanfEMANAIpCzeuFekPvyxjmtZuHk0Fo1hcnH/SX7Jo3dm1uH/k2GD+DxklBV
	LS/k6fO9x0nnufpsQWnOX5M52SM1oM1t4VLfJ5YLyU9Q75LDz873tdNRFVkOorlNGjq+e0WPs7G
	oIgvrVzhSpwmNPvyzAdwkz1Vg+PeksxZnxTFtNW10ti4gwN50lZlIcYgWtii28c28HcF0oXigSC
	p/4Cm9g52HobaE0iug3OvP2/uFKzlSn4/Tj72JutkfQVThBs7P8RG5uiaELOBgHQaO42VnCBZ8F
	cQQg1UEXyZMUHVgKEhd7JcASlH+c0+L9/HZERdUnI8zbqowo2sGpazTu3ckPXWZgbaGrVYiNj0Q
	82ic4XMuYsUrmEXgtQ==
X-Received: by 2002:a05:600c:540f:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a1fd8cb92cmr29337195e9.2.1792574509972;
        Wed, 21 Oct 2026 02:21:49 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm16130845e9.11.2026.10.21.02.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:21:49 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Wed, 21 Oct 2026 12:21:37 +0300
Message-ID: <20261021092140.4142493-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021092140.4142493-1-petko.manolov@konsulko.com>
References: <20261021092140.4142493-1-petko.manolov@konsulko.com>
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

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

The imx6 parts that are used in M48 are imx6q and imx6dl, hence the
two bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..8f3a04228780 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -260,6 +260,7 @@ properties:
               - boundary,imx6q-nitrogen6x
               - compulab,cm-fx6           # CompuLab CM-FX6
               - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
+              - draeger,imx6q-m48         # Draeger imx6q variant of M48
               - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
               - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
@@ -458,6 +459,7 @@ properties:
               - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
               - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
               - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
+              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
               - eckelmann,imx6dl-ci4x10
               - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
2.47.3

