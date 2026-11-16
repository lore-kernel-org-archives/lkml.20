Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814803;
	b=qT1PvLiLvqkUvX6OQjxX9o0x97zAWv1y86B9bl53xa66O3S604a/zEVE1Pf1+43we0wl
	 uOB6OwvhlrmrHC1CVT2t6YwN+16QX8+axgsc2+XDdAEcwdDnSCblH/hznkgR7P5VKIImd
	 7/+cmQAPCdUjBDL9kUxKUYQlC+/ixWaR5DnAE0NGB9BR4IucGfl6o0Mj/Y76u3X2iutIp
	 H6+qcXw7Uet/LC1VediRDOczlZulweY1rndEb+SzqrcXcdiQnX1sEnszXD9LnFuZNFs2D
	 BE71hhkFj9Jh04TKo6KZ0XR/pH3Tl70ylBUMOV8GblY9nDD0NJm2xHDSUuwspV2ybOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814803;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XxCfuw6OMzW/t+j7T37adrUC61bKBYB9ozA2bNUrmEc=;
	b=LELs4RqyR2x4psKxnvwf9aMRHF6iPa0PMd2+0sdnDddrGf9XAIn6kDnKhmnol9IKbf/a
	 79eblIiPF8p5khmCTN8Lc/UMDgnx4x/Pbkkxm/YTP4Hl8yn3q4wpByuGqusgTCPr2M8m0
	 92R4daVeuxmPgPUOCXyugAKv8BGJ/GHut8Jh2cRG1C/0JHPA7SZNJ0D2IWyqivOHZ/KQi
	 3hKMIoDSlKcxBCDT9AibznTfoHzEwigEsxaSAXv1AadnK8E95KIGsqAJX2EruBrmzX4Kv
	 G5yue8k1MHjmMXhEocTDDjUWPd7QiaeqaWsnCswY3y4BPlgGl5b/xiHYi1Ic7ydSAOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ih4KhFQ7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A08606A8B2;
	Mon, 16 Nov 2026 07:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ih4KhFQ7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814803;
	b=w4i5nmcbboR+dRo9VLutU5rq4wh8x4jfy3uZfT8ryHgH4+VZK6mgo9pCDYuFpzDb4XG1
	 xyLmGwH27Wy85nq+U29Mu9TI9dffaN399yKt05bN+qaae+ubenVaS7iKvQmDT6+j0IMpk
	 9TJmOwOfT+8+BoB1x6wQI0qjF+lBrFbxIMEpb29PR/NmC8v7SZfl3oischDqHk1egS5ka
	 YFNngZCggl/gkw+SXU/9IcJWXJN42v/fm6BB3x+XE70+B/tBrTqD5CUrkYzB6ADWgnEmr
	 uOfwK6NFabRuTXaMgLwbmiBSH9Ybufk1jBud+iSiH5BTZiadtNwohoPphCKTJ9qmiWQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814803;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XxCfuw6OMzW/t+j7T37adrUC61bKBYB9ozA2bNUrmEc=;
	b=wTLPVv5yjTlJoQodaexkgDBALkb5y8eryJo9yLWnFaImG+jgb9aIS2iWsb975svGwxXJ
	 42GGkh2lAJbscnuJA09PDf546gwGJVFzMktGU/6oEwdHPSqPFlMmetf9KW/gPCLa3VWZ9
	 35+2jLLlWG45QtwiUKHI0MWCyb/R9q4yiq2l8IRiyj+UYxDJ76/q573HV5JtKyJEBsIz8
	 OHEMR/dapiZ76joMv9/VAqkqxVERveBneM1jXStS4sg79mrY1PxvvYXh4RyYdWEuZby++
	 xFNkuBDQMMQhB3/NiTDFYAOmuI5AdhM6IZ0Gg6vsxqanFGS13FVRgz2ZhUb4MnX1i0w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3560D1F00931;
	Mon, 16 Nov 2026 07:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814803;
	bh=XxCfuw6OMzW/t+j7T37adrUC61bKBYB9ozA2bNUrmEc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ih4KhFQ7tKj8KJF7GDg5Oa9F92DGcckvi9WEa0AZCmJf4y30eQpHmO2OJoFJfG5Pa
	 P/p6UAIF/0n7HHaVVLWV1NrMr+8av+6nCXHyTr9HFGcp7JbTlIbIxxerTkwrHNuv8G
	 ib7nqKQG6RUQe65yWizafnp4dbelx1BlrkZDXwZjFz5LtI64STlqxELWB8kIRndiQL
	 jHNPOnUmUVndJGybozjjeLkpGVytca1O/v19F9LZbdE/1xL0uqubrjA6ULnLdf/bhW
	 fUNiAEJmfiW9YuspVbRikUJCInwPAW9q8LtFQZqqgQ02HL0u92P9IFbX3ezFemxVVL
	 FSGBlZ/jxwQmw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B1C2E4A3B1;
	Mon, 16 Nov 2026 07:40:00 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 13:10:05 +0530
Subject: [PATCH v2 07/11] dt-bindings: arm: qcom: Document Molokai and the
 Motorola Signature
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
Message-Id: <20261116-molokai-soc-v2-7-9dc4dddc4e96@yahoo.com>
References: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814798; l=885;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=T0sNm4IgONm52cDD8QJ8viLeyitHpK6Rzl15J5PGvw4=;
 b=grXvih7aeok16bZl4qKRiFyjuzsg06AZQ+joNT3IMoVf8+W9xiRzPOR+TpVNaE2rRixia5J1z
 HgqrkuTx865BHXuPA3yqPOZA6fKb2+j/rBKDOK2yOc+wymJN9WAfTmW
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Document the Qualcomm Molokai (SM8845) SoC and the Motorola Signature
(vantage) phone based on it.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..6993bbffef9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -241,6 +241,11 @@ properties:
               - nothing,asteroids
           - const: qcom,milos
 
+      - items:
+          - enum:
+              - motorola,vantage
+          - const: qcom,molokai
+
       - items:
           - enum:
               - microsoft,dempsey

-- 
2.56.1


