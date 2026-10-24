Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792838059;
	b=F2ruSRPlseeRdHdsAJmdpN52W/nS0rL1esVQTTeoWUvpMyPS4vrsyzd3wH+e/OsnAX7t
	 wFUKODN2El4PR6CJnuNP9R0ZAF2Jm5SlO8rFHPAS8jE8jJdXggEYN/GX78I7UEvmuVeGK
	 FEEFeAOwMgaQjhq4sa574CYOCvPbppeBl20ifABk1QWxJVsZUetejlhRgH4ysWHToU91A
	 25P0Jed7fUti+dgReK9E1r451Empsk+kp2sarNfbHohizk6+YjSsQu0De+km53cex2t32
	 u8iO7TbEMqR8GtaVbobP+GAmCemEskSNT7nfx3i0r0lNa/F4/CrUpVvzdohiJ6YAK6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hCXXvkDREgXehAsGvMm5K0+I2Qb1ZrSjqYAiJ+UTLTc=;
	b=u60XRYchQq8ggCz60hZzJMS07lIsUwYaA6AnqYWjzqxePFc3Avuk6HetorA57LqVmkqw
	 QoZhqifwN1UvHU//vOfivwOLIoxBgzDbipLD15YXEjyeVUg0rvidSK5P1saDnex15VIg7
	 sJ8y4f/vl6fVnNXH8SyFsAj9RgV4Wrh1KAgunrUTgG8dRQSN9MJJKVUY5E1pNtwwz8tAu
	 xPXCrGv5UwVsr/oJROh8i1vFaMSOOl4x2TfeReRO+bIIonEWrrcjNG2SLrRMafc3VJKwn
	 BoaMiI9crs/7jdLrURgR2b/EoaTZRAWoXlp5d3Wx/Sb+tci8mlNj4ri9XOUR2XAbfsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YKgowXyL;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3139A606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3139A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YKgowXyL
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so932898f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792838051; x=1793442851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hCXXvkDREgXehAsGvMm5K0+I2Qb1ZrSjqYAiJ+UTLTc=;
        b=YKgowXyLWBwrg7I++LDP8W180Q8ZiqniVMWkvWW4/5iaBMr2iDr91+cTkh1b3/m4Sv
         Lea1ql+KOC7EtGE/uJDarJSmpxelzCuHTBIVoce3HLGWesCapXCXBPK9wSsP4E9oE/KW
         um9D8prowuOKuB8EHFlLI02pStgKNsLQlt8oLKhxZaLgwHA23puRZtrvnWuj4ryDGqBW
         /K7w/9mWlK8LlfeKJwraHbK5ByzlQAUDD8SUCv0eVS0kEIfuyUEm3uF1LnCMQ7em7eJM
         vYoWLjhE3IDHpIyjKzsBeLYQawgqgrYl48ympnOHRm4P5/xSLaN4WpJWZpdvcR04WiXf
         8VOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792838051; x=1793442851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCXXvkDREgXehAsGvMm5K0+I2Qb1ZrSjqYAiJ+UTLTc=;
        b=ikHKB5huPjIMzyxqEhbo2rhZ1GUYX6DHW91f3vJKtv0e1y54ZrHdBRXosVkxXYY3U9
         cUQ0NbRcwaFStgkatbNz0vCWuEYOTrkOHXbQCeMRykLvaPp5mK8ZoDa09kO9Sor/900Q
         fT//0b9kM8k3LH0LpgppElPa7NSywMIatwgJTAODkoZlwnMWR7VDMaGBTh9hCYpc1o7N
         t4DKT8jca2ROcaW1lFX+Wq8kYmOTyqX9UMN1bnsUsqOz44Lk877KlTHmbqvmwGilu2mE
         kLTbUcomldMfbTxhtc0pkTAUwpGBc53tXV9H9vVZW0twUQIYlPeHiX/B4MsT1bOD//Pm
         gIEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwl70hGmcebFrQubN036U7wE/ZzbfsmqIXGT1yyG+RXzLxbbcVvyTTWgDIFt7was3CEs/0gAgebptzKlD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0F9paCAp+1cWU3Lyvu/sugCxc00nQqmcWXTOhbzrQOH3KUQFc
	v+9j0OxpLTCHPKMT+rcYvriM1ilZW4kB3DvB8y2alIv5yLzG6cUNBF2M
X-Gm-Gg: AYBFou0LowsqCWksjC//0Zx10HF3dw2Yk0H/HruYOgCgn6AToyRNuS4qJBj8FpZjx19
	5CyaKd1GgQUarrl8IXDHFF4AEOorDFKyFzXqRnIk8mdJDoLhe1wU94tMaOChqNFkX+/K6cbNVBM
	aNESRfKJdYCwS+iLDDcDE+g0N4WXQWSCRz4/B5sOOcH+nPkdP+MYbxhCT7PXxzOEB8eGd1SE8Q9
	ryUWlSpePj4r5aNnX4G+3GrKDLlC7Lnz2k7+Q1f8V6e1W16CZ54AYJIfl/nwct98r/9DSEGrmVJ
	fq2ORS+xs4/pxlB/rTPV0xpF2IJ5p3ZE83ZzFaAzYlbD//AMLxyYTdPLqoyEKlGVcn5vmKVgnuu
	XrGTopjDs20g1YJYI5Bc7wctI65qIeMgwiFl/0gP8gIX2AbkOA6qdq6/xhvTHvEhgCClmlikSpN
	2cB53m8MaQ4qsFrR7qWMEVkTY1S3cKeJlCGe+b55lFI+CwCAebXTPLdR1Gje318RZfXZDEu4KNa
	xB1YxoMjmyM7c9lyG787+rUPGv0Z3+zidoKIkmGYTCw1X1dA7TTJfrOzc5KpJMZYNNHEUIT9TWV
	KXN9fs4g1Gpu/E0s0URipPfCh2c1iEZ1gJ8SwCkEz4syrqQt+dGpJB9pi4SQddNSqlqdShLbgrE
	LAe/GvV0=
X-Received: by 2002:a05:6000:2312:b0:48e:e98:8b64 with SMTP id ffacd0b85a97d-48e3eb8b45bmr2346024f8f.19.1792838051352;
        Sat, 24 Oct 2026 03:34:11 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-024.globalnet.hr. [213.149.37.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm3544825f8f.39.2026.10.24.03.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:34:10 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH 1/2] dt-bindings: clocks: qcom,gcc-ipq8074: allow CMN PLL bias clocks
Date: Sat, 24 Oct 2026 12:33:09 +0200
Message-ID: <20261024103401.761125-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
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

CMN PLL in IPQ8074 provides 2 fixed clocks to the GCC clock controller.
In order to describe this in DTS, allow passing them as the inputs to GCC.

This has a benefit that it avoids doing a global matching by name.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
index 00d7df75b3d6..d489c6332e6c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
@@ -29,6 +29,8 @@ properties:
       - description: sleep clock
       - description: Gen3 QMP PCIe PHY PIPE clock
       - description: Gen2 QMP PCIe PHY PIPE clock
+      - description: 300 MHz bias clock from CMN PLL
+      - description: 416.5 MHz NSS NoC bias clock from CMN PLL
 
   clock-names:
     items:
@@ -36,6 +38,8 @@ properties:
       - const: sleep_clk
       - const: pcie0_pipe
       - const: pcie1_pipe
+      - const: bias_pll_cc_clk
+      - const: bias_pll_nss_noc_clk
 
 required:
   - compatible
-- 
2.56.0

