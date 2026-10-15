Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C24B23A99F;
	Thu, 15 Oct 2026 12:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.251.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067604; cv=none; b=h0yYWJsiRcYQw8r7gqc98K/IveaxrvkaCCdaa/fBXuby/bYbf7uiJ/3xbCY+bOQctrgxW1ROfP3UZ+94NmQMaVBESeQrv0Niw/T5XRoemmX4rFqr7C4YO3HUX0asUtH5bkrDvpUZoz/OhDyEzdIIFqX2K7x8kgDGqZHFLSDSe7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067604; c=relaxed/simple;
	bh=SQY5MLGxapxEK8L5QUAko4BpcbdYTY91OPGHni5NZ98=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fw4gFOaiKS42A0U2Q1RZHNCi6+RvyHv/m3WPhjVz7Zun+Sp9iXDwNcX068U5B9POtEdRrnLSe3dx+0QVZMAY3NLSPlN9buM8Vmw125n15VbdeWFNaVSNSE0hpowhTS+ts9Siq7skfp7CB9qhtUst5A4fPaf905CMwc050GZvZnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net; spf=pass smtp.mailfrom=fhannenheim.net; dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b=jO8iwxa5; arc=none smtp.client-ip=188.245.251.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b="jO8iwxa5"
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1792067600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vwIT12ykn6h/tw5Ey5S5UFdXazl/iayW8Kx4qav2cxo=;
	b=jO8iwxa5ZjGjibQHGeesuw32/NhQZawaM+9SVgCwFraGbQaUhMoxgBgD5PspbZ5RBOCcuo
	if6J+lxx8P4c5TDHQguZdlhb7Y0CW2srRd60DrZoDQk+HOZDPHZmKvpdhW9yyN5uxsLt4e
	heFwcfjP6Juf9aFsyQVfPynHp3dRXZY=
Subject: [PATCH v2 0/2] Add OnePlus 8T
Date: Thu, 15 Oct 2026 14:32:35 +0200
Message-Id: <20261015-kebab_dts-v2-0-e783463bffd3@fhannenheim.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OQQrCMBBFr1JmbSQTbbGuvIcUSdqJGcVUkliU0
 rub1K3LB4/3/wyRAlOEYzVDoIkjjz6D2lTQO+2vJHjIDEqqBiXW4k5Gm8uQorC4s23T1NTaHrL
 /DGT5vbbO3Y/jy9yoTyVQDMcxjeGzjk1YvH/dCYUUaIlQyb3GgznZ/MSTd8SPracE3bIsX5mfP
 3C6AAAA
X-Change-ID: 20261015-kebab_dts-f13f9665e9fc
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>, 
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frieder Hannenheim <git@fhannenheim.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=SQY5MLGxapxEK8L5QUAko4BpcbdYTY91OPGHni5NZ98=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDFkXjr+ZU3Z2j9juH+q/OXwXPOGzEr/FIerv7Zo4nXfeB
 Un/dWJhHaUsDGJcDLJiiizO0yV/2FcK6+iH/1OEmcPKBDKEgYtTACay8hwjw7bdidd/KhevbfhZ
 y1UW4aB29Xm6nmz6J6eILHO+u72uvIwMl06fuDJ91ax9HmYhHdYbfvvpR97l+CG6Zn3AiQ6ZxnJ
 jfgA=
X-Developer-Key: i=git@fhannenheim.net; a=openpgp;
 fpr=439719F83F79132C2F57FE216C0173C8B7931E53

Adds a basic device tree for the OnePlus 8T (kebab). Common
values for OnePlus devices using the sm8250 SOC are defined in
sm8250-oneplus-common.

This basic device tree brings up a framebuffer, UFS, battery monitoring,
volume keys and UART. Further functionality will be brought up in
subsequent patch sets.

Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
---
Changes in v2:
- Add dt-binding for oneplus,kebab
- rename power button gpios to match sm8250-samsung-common
- remove unnecessary qup_i2c7_default and qup_i2c7_default nodes
- remove qcom,kona from top-level compatible
- enable i2c2 and add pinctrl to pm8008
- remove unused pinctrl node in pm8008
- Link to v1: https://patch.msgid.link/20261015-kebab_dts-v1-0-1fee1204a18b@fhannenheim.net

---
Frieder Hannenheim (2):
      arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
      arm64: dts: qcom: oneplus-kebab: new device

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi | 609 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts  | 129 +++++
 4 files changed, 740 insertions(+)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20261015-kebab_dts-f13f9665e9fc

Best regards,
--  
Frieder Hannenheim <git@fhannenheim.net>

