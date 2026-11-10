Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340380;
	b=WfZ209IxuXoh55tLMzDbw99DG4nbmh04EJdmCOxC8fNRsmsey6lI77p7m2VoDELNJziv
	 bnOQ2gAOVwfBJvzvikRFTIcG40485h1XJ9MpUNzkWJXbDCV3PLkuRUBcSwqrAvzNS0tTL
	 kd0Faegk175B7BO+ZWyqiVq4D/kfALNa5G7oG9P/QMEgKs+aXCaFZaeSBwT03bjYUY73k
	 K7u23IPr2PhLI45cZpEEw1bUeI4x9xytjeZa0eY8zpmSu4k9vwt+jpnXYyaUbQVld33MW
	 UjvB2mD9Jdy8A9sg+DBICIbtuanyUfyzBpRIEybBGpELjQ3dtSSoc1/PXfjC8pt/3pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mBu26pyTeT9bETEg9HiE5XJ66rAa9mCFfqD+c+2OSIU=;
	b=RvFfR+gBDIfMlGTcqlcRfj/0X08H/CuiS6R9M67EPIeEwCRu4QIYoa2sIxPN0g6SbE5v
	 RZQy6Y0TMFKgKPyiKqzGYfRs82aMI4f4kcBSU4kB6pjUdOJB3hVDP5EEmWNgaViFZzSAx
	 gYzUHrystumSQ4oGsjSGAcujxOFCFlbli3xMPn3RRLAKvFvvvePkRgaiVzlqSyo4hxPy0
	 7nwhczEXEqnEVr6nhOvhyyBVmO6pT41vJDaIqnWfo4vNKGDstTKSdvRv13xijuwbI+oZm
	 Pp7AvLDf1rKXQ3S6XsjryuDJoz+K+lGQcdl6+5OStG685B92LGeOh1bpx0UzzViJUsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yxf+eg6a;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F23606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F23606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yxf+eg6a
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36ecc11bd26so287093eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340379; x=1794945179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBu26pyTeT9bETEg9HiE5XJ66rAa9mCFfqD+c+2OSIU=;
        b=Yxf+eg6aCLVazkjeYAnLQAXiYKmoPEjlCBy7GqXizgRVvQRUN0Eh8hG8APhTHMXCpv
         fJPUdCCeVndvWT+k4iCNgAW25nB8CBI8bdCXA53n5knpT5XTXtwsAMkt2Glyuc5os2ve
         fbOmCa2YNQtFN4ZJhAPfEBmPHPHxkP1jcdNloq4HOPRHaChvQwQsbUHANZcTel3xcqVv
         cCS//yS7yzSEoylTqmCxV5pD3JAWtdfduOoR/IndH55U8k1Xj1LwOa2/KLuzOJLuStcZ
         ivG9tJSpThpW+FnTz80UqzYnqvW9OI3qzMSZSrFa+B0pfGNdv5n/IaMF/Kn7hzexcixJ
         dNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340379; x=1794945179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBu26pyTeT9bETEg9HiE5XJ66rAa9mCFfqD+c+2OSIU=;
        b=1uAiaRC8TGZMBiCoVa1lLuv537WAcJ+BF4+mJRef7jXVGeAULtBzyrzsAOziwt4oXt
         3lQIkJO2dD0qywbEyf7xQjoIJXYs3dqfuoCq6jUAJ3mG6Seei90FMxSZADQsNBdVQOOe
         hirgBj1T19po/KXZ2ql1SOVhI77MnHsIdHkiI/gGOecCaee06aLTgGCv59Ri3oXIonam
         Yd+G2V+YgdM2d52Z3w/kf+dUf8QnIcrQ3atoUFJ7PMZqLVpyUj3qbRd6O5ca854RwLje
         fkH+Qrl5t6Bw+PANkGwrRhf/vBnE3C9cedYsnU1v8VKQRkqd+a6OJ6xvy+E9292dBK7y
         x3yw==
X-Forwarded-Encrypted: i=1; AL+hErHS+bWwHpQsT+yvG7S9hH+bDgckXohcJo11wSGD6HPCLs6XmMKiQw5VJDHU8Fs89sLPbI++DpB5biW79YY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iaX8O4jh2Lbjq4Ra5uU5P8QRurhctSabKQzcxYBOzoipBRrP5
	G7i3mRI3j4tXOYXIw58cTa5YiydPzcH3JoFzQc+5dTDjJbK+GlH0mM9d
X-Gm-Gg: AYBFou0h+S1ujj/FsEDZ24Yc6IPEj8OipGKChwPE2rTiO5ziqJAZt9ivDsCLfy8uiDh
	1FJkLb5Nfqt1iMayRHzf2UxnOwONr6C9m3p1wNg6UlXHbzv0xXuhAfdR+lekJm2YAM27QQ2oEJR
	onF/Dqe8W6RodtKMOehgOaeMyxDVUH34/M3HOxED/mfXg9jckwejgQSdnL+enCxUsmterY2nN70
	U/uYzWdtHzLkXAzlYSJ/q78dVUKbeF8VGz0YY/uYePpga5bBPMqrYUh/b2WddxeXxkuIH3YNNhm
	jQPwXkjUIqUeshrYPXPAzfpe4f4z3hNBdqJkxmcTwrvUr/qTEK+Pfxj5bzcx7vzlu94HWqnQOpT
	YpNbvZ5TFw7x0L32YdBJ5FZI+wZG1CY4Y/8klVEKJZy2LnqkJVEpHqdsmdCaJRSuhbhaYnGUd3b
	zRVAuqin4VEuLl8uicwILVx3hsyvZ8GfDlSVtFPLpldIGLXDuVDHxsYjW6OS5UrI1Omc7uBGyLx
	JzU2t4+t+gE1CAaNZDJ4HpAHzL05WSzJ4agKa1JoFM4O7r6PcB/J/zl3i58pGV8SNXnXPIetlV8
	0bJC506VBGcD2gep9AGfqAbNknoD9MhX4K92XEM=
X-Received: by 2002:a05:7300:7f01:b0:36c:a1bc:6114 with SMTP id 5a478bee46e88-3768076e52bmr664865eec.0.1794340378880;
        Tue, 10 Nov 2026 11:52:58 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881f:d9bc:11f3:620a:3333:518d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm8834225eec.11.2026.11.10.11.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:52:58 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 11 Nov 2026 01:22:33 +0530
Subject: [PATCH 3/7] dt-bindings: arm: omap: document BeagleBone family
 board compatibles
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-ti-omap-dts-fix-v1-3-19022d1ff4b4@gmail.com>
References: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
In-Reply-To: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Mark Jackson <mpfj@newflow.co.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794340358; l=2011;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=HFD7yxMISHUSRTOxRHCJ1DZNRBnsW4DxRdCeVpvA1IA=;
 b=KibNFDfdnzCmfgogghjKl7j+PawBFGlgfn5VQEmbtrmRm7DHebL62iSv+m8SOCRuWuKBHnKyR
 Z1WMw60HA2JCIUmp8yPwla4WC/hU1dvfp+/XhdSuMiyZBthF+Hk+4k7
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Several AM335x boards derive from the original BeagleBone or BeagleBone
Black and chain multiple board compatibles before "ti,am33xx", causing
dtbs_check warnings against omap.yaml.

Document BeagleBone family boards (BeagleBone Black, PocketBeagle, Bosch
SHC), BeagleBone Black variants (OSD3358-SM-RED, SanCloud BeagleBone
Enhanced, BeagleBone Black Wireless, BeagleBone Green), and BeagleBone
Green Wireless.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index c97eb4953ed25..e0af554388669 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -159,6 +159,34 @@ properties:
           - const: grinn,am335x-chilisom
           - const: ti,am33xx
 
+      - description: BeagleBone family boards
+        items:
+          - enum:
+              - ti,am335x-bone-black
+              - ti,am335x-pocketbeagle
+              - ti,am335x-shc
+          - const: ti,am335x-bone
+          - const: ti,am33xx
+
+      - description: BeagleBone Black based boards
+        items:
+          - enum:
+              - oct,osd3358-sm-refdesign
+              - sancloud,am335x-boneenhanced
+              - ti,am335x-bone-black-wireless
+              - ti,am335x-bone-green
+          - const: ti,am335x-bone-black
+          - const: ti,am335x-bone
+          - const: ti,am33xx
+
+      - description: BeagleBone Green Wireless
+        items:
+          - const: ti,am335x-bone-green-wireless
+          - const: ti,am335x-bone-green
+          - const: ti,am335x-bone-black
+          - const: ti,am335x-bone
+          - const: ti,am33xx
+
       - description: TI OMAP4430 SoC based platforms
         items:
           - enum:

-- 
2.56.0

