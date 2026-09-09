Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935E93E315F;
	Wed,  9 Sep 2026 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966833; cv=none; b=gvCKLIJxrUOlh6Jjj3gus/HpLhfqoTr6zesPAnlJCsOIdb0jDdxlgM3ouNzUhF9yr7kd+aG1RQxkOmq2uFSmrHSD/7ZWT9bNNpxVUjLjYnWDfaYQhdUVluTnm6ux+4ZXz1jUbabEC1WLE47fcrdDSfG8HCBlVRkHJ1BMMLrvdWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966833; c=relaxed/simple;
	bh=HQ3SoXdr1MfOnxZvo6D1nkjndkMLbUqUXZ0aIbN6qYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NiS+qTJMJNORFieT2zWXUq/0uqYkET/guJr5/V8N1ebZIW3TmndOjFpqCbUVvqASGC4xPOKtVnIYMtq7vMARoqvu6ZMKGrJzVySh6ZZQR5G8KqBXGNWRUpmsHjIKN5CX1ws1eSQOM/s1UM+PUzNk3Dow5JqPMrB6niRPj4g3TbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Gav6f28F; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=R8qONZ/T; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Gav6f28F";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="R8qONZ/T"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hg48F01nqz8sdx;
	Wed, 09 Sep 2026 17:13:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788966829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l+Zr7ZH/3uj/Y31eE4ONXsO32kJg+iEv0h43imtrhVA=;
	b=Gav6f28FwdptAziLY82ADN0vdmsrkDPYlFlviD/5ei6lMPSfzczQY3CMTBcEY6NSVW2oFm
	letVWebuREF7RlBxMTaTNSO4H/t7dhtXtaGQ0JmajSI+F67S5sXEeH0S4WKajgL5yOn0/l
	7vu03VvXbrwtr8YQN7R25zOaXocBfqi8PNDX/e7DwdjFru3vq7btQqXMgKL2s3NxjOYOIm
	4qqgthWXEE3DjFXQ5HZTB5TljW3SYSGqum5OnKOG9Nouy53OPtiCHOYf7/tMNLR8RfGUzt
	Vv5o3EkFJcvJDRxJQr6I72Kv9r8JrJ2M8Sh71+PD5CKIxEFTWmusYrbrCBMrRg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788966826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l+Zr7ZH/3uj/Y31eE4ONXsO32kJg+iEv0h43imtrhVA=;
	b=R8qONZ/TD7rKNF3I+ETMBdQGOXlb1p/XfJrzoAj+9MAe0DQ7PjPbpZlfIC0Mw13HxyRDIQ
	AWMgzezBif9hb2da9UpPG/7HPzutfiaCjd7yPAlyCYzjUYP60LG0SmnCkbuhI+WH4/jLc0
	2P1AznxCL+IuSolQ6tS6qFyO6wfDEAbWJqIzhtcO0sTcj1Lhql+nr0jsij8Ksq1ax973qs
	y3Je7fRtz7rQpk2MjwFmbfvrRkRfgjtImH9O2NJCy8tm+txQKlUl7GNv0K2OLi+fHMfJi1
	8bNvDMiupFbo266FtQ0pqyI5tFZA68n6phk8e1e5XBFwZOc8pHklkYd0Q9k8EA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: sparrow-hawk: Align MSIOF1 PFC node name with label
Date: Wed,  9 Sep 2026 17:13:12 +0200
Message-ID: <20260909151341.28322-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: y1izspzudz5mcjqp53uq1e7u5ezqy9hj
X-MBO-RS-ID: 950bc9a4690d73fbaa9

Align MSIOF1 PFC node name with label to improve consistency.
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index a6294fd32daee..c6848a364098e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -700,6 +700,12 @@ irq4_pins: irq4 {
 		function = "intc_ex";
 	};
 
+	/* Page 30 / Audio_Codec */
+	msiof1_pins: msiof1 {
+		groups = "msiof1_clk", "msiof1_sync", "msiof1_txd", "msiof1_rxd";
+		function = "msiof1";
+	};
+
 	/* Page 31 / FAN */
 	pwm0_pins: pwm0 {
 		groups = "pwm0";
@@ -751,12 +757,6 @@ sd_uhs_pins: sd-uhs {
 		power-source = <1800>;
 	};
 
-	/* Page 30 / Audio_Codec */
-	msiof1_pins: sound {
-		groups = "msiof1_clk", "msiof1_sync", "msiof1_txd", "msiof1_rxd";
-		function = "msiof1";
-	};
-
 	/* Page 30 / Audio_Codec */
 	sound_clk_pins: sound-clk {
 		groups = "audio_clkin", "audio_clkout";
-- 
2.53.0

