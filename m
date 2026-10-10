Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBA13603D5
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620364; cv=none; b=dritVGf79AW/6DACuJc3TsihTRt5lcqwzjISd7bq7AKAUNi9+sWiU1bgmWLOZV2Ops9jH0O2dAK12nLHYWzWitFiD63fSZfbtpXosMb5nsbq9CHkapUKEsZajvy23FsMuLpNdpVgdvOOjFldUZVp2UXv9lPDXU26KT3nHyzqALQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620364; c=relaxed/simple;
	bh=0nIngpZp+inShOASYSj886fWfbkUeZYjBtrsY8Usq7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B+MdyITMLPQHAQ0cALWorD1/df9c4vjoNDbpWm/799TXWuFiFjz7s0CIjd2OXU9F160ZeCrYdVZGBNDr+ea7g6O4Re9TibN+1Va6U1IsPRJyTmk/UZAC9hnqYAZHbS2VhSAzgss97fzquGCfVd3GyWDAjMzwYd4bVrYHrME1BSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bV3Fr2PU; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bV3Fr2PU"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso93745a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791620356; x=1792225156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6k52INFfuvMm/tjJwSTAbKQML/NWkmAz6TpJUNRMaqY=;
        b=bV3Fr2PUmixZ6BhEY/znWdntjnSZwEiZUWaANPbSpvmnMg6VsG73BKTq1kk5H9itjN
         CmJtUY+B1BDalspG0GEuxmZMu16ZMU4bdpVALzlKWHoiW3K8WQ/PAb20PmMZed/Z9OMb
         hRjtDkOYHj/sWkNK2wqJFEAOsp5J5fHzYmhMaQuEioMwQloTmbmog2TrL8ti1K/k4TET
         3BfZa/FmjevvI182MCgrjFXqUYkWJrl55Lao5vtEJSeinORdKqAzTSVjjPDprb/2otR+
         dpXcyMbDi4irc+Ji9WniOItPigCuNphXGa98HfBPADPCzb1/nMVkQcOcHqJYqotoHE5f
         lp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791620356; x=1792225156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6k52INFfuvMm/tjJwSTAbKQML/NWkmAz6TpJUNRMaqY=;
        b=wPZzF4WJB9u5mcev6fvq7tLfFf51AMZqZY5qwZ1AIfFFYCzoIzbBYETzdLNMJWdGKR
         Mk8eAiHfXkfQCR9LjHIMSqIP2L6BUG/JT9NSbVhFkUShzjAdFRSdLmJd/RiesMmbVAbB
         ue8wG2vI0ZGPVDTO6GExnIjep/reRlQXR4E48BcD8aKMOwXOauVpgYP+3KHYPZHjks0g
         kTgDDWFZUB+CAwq0XNgwzJcd1bZE1WlBupBCeeCQmVkwzkZEr22aUsMBMQRvYHs117Sh
         2YfrmuLpJaVk3oXhqG+kBUOfjvPeYEKo/buTCz8DjF5BgEgg8Wfy643kAIj0DfUl0o3h
         Q6tg==
X-Forwarded-Encrypted: i=1; AKwUvBxlDfjyCCjxlyOVTXkAxH4k7CM/xOdfRkv2Z2FFYhPBGkTCl6Fq0+/zdL/i2oxB6hYtpkajQ2xsJg4pwN4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZPDo2cKJ1adQV500fxai6J1qTGvzMXAmDXgh+ESFkc/C6cmLf
	vUweIpCtVjbDi/6RhJKCN2nyOhKuanhwfE5p+jQahez71AQ4cvWXoXnW
X-Gm-Gg: AYBFou28cemZcZTeMEu5Ra2DJYX7pPI0TXyjD1yiCXZVAX80Q/q4QfcATDK06J4yBNK
	tERZntsc1fN4Et9mBOoSjTCWGskYQIjcTV8/8YmvZRdMDyC+IFEtK9BniAbM7HjBsc9qV9yEeSd
	QDz28ol+IFC/CVuvsaZG+H1OP9Trr8E6Dd8fAr9KwAuUgDOJqZZjlhBvLKjjV34wMwgP9HeLoeW
	ua5GvaEGAzJiJlrrHaWj57a1uHPHABartKuT8wtwbVWNNVOhRnu04bSb8C44npvYGdw2iKRZXpj
	bcO//0kWOGnZDP2SB22b4n01MfS8W7jqMaTtbgA1oMW/bufpSgtlFQWlSP26chMO8Q2iSq4G0xj
	ySHi0mMbCxhm6S1k467YmqOJMfL1LOohQWrhba9ZrQa2lPhRhH37QO4/v4MAbmUfL5aT6p6DhV0
	nNum4+8U7dK3RUe2/YxO3mXAUTEY4Gor3WnEKaLogX+j0cV3XjWFyS1aPpaxL0Ltsd8HVTUsI9y
	3uEI5c=
X-Received: by 2002:a17:90b:2886:b0:3a6:fec5:c186 with SMTP id 98e67ed59e1d1-3ab3acf7535mr3661751a91.46.1791620355561;
        Sat, 10 Oct 2026 01:19:15 -0700 (PDT)
Received: from arch.localdomain ([161.33.202.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed0332sm7744574a91.3.2026.10.10.01.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 01:19:15 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Auchter <michael.auchter@ni.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: extcon: tusb320: add SGM7220 fallback compatible
Date: Sat, 10 Oct 2026 16:19:06 +0800
Message-ID: <20261010081907.479226-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SGM7220 is register-compatible with the TI TUSB320, even reporting
the same device ID, so it can be described in a device tree using
ti,tusb320 as the fallback compatible string.

Link: https://www.sg-micro.com/rect/assets/bec47c84-84b4-4015-8d61-9433e0d76583/SGM7220.pdf
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/extcon/extcon-usbc-tusb320.yaml           | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-usbc-tusb320.yaml b/Documentation/devicetree/bindings/extcon/extcon-usbc-tusb320.yaml
index 126107dd57b1..f88486c2fb09 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-usbc-tusb320.yaml
+++ b/Documentation/devicetree/bindings/extcon/extcon-usbc-tusb320.yaml
@@ -11,9 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - ti,tusb320
-      - ti,tusb320l
+    oneOf:
+      - enum:
+          - ti,tusb320
+          - ti,tusb320l
+      - items:
+          - const: sgmicro,sgm7220
+          - const: ti,tusb320
 
   reg:
     maxItems: 1
-- 
2.56.0

