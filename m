Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B488B4C225E;
	Mon, 19 Oct 2026 10:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.251.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405128; cv=none; b=QVIh+CBII8EfVivlOCHfiCnsCkOPH4RSWEFFFRr8oPli/7VpYRa9rMLe4anvq71GXDrpg1V+98EnsgVRzZD6Pk5QyJWBhbtA1b0LJQifgAaEA70GMBP20++nMMpCw7T9gCFUZvWly2cBS3JEpRwzc7x5a0mgvcYOLhQd0Vgrvnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405128; c=relaxed/simple;
	bh=rameIw9UocWOEckAgB2MG8CqEoybR8fcV4dQGucyqys=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b2/SCjILiPjHV/KBKMpOILkrL4aQc8KjhYY3TjD+TGNQ6IfzvgzWiSlZxXhc2Rd5AUROUmNVACsxCV5kXcCSXQOm8QBkBDenHdyRJs3XxjOPQNCuBQU0j8ectVVZPGLVArVLu0dG7jyMuE+GtU8dmuKTUhp9c2dKHQ3VQSXr9G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net; spf=pass smtp.mailfrom=fhannenheim.net; dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b=fXaXfDMb; arc=none smtp.client-ip=188.245.251.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b="fXaXfDMb"
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1792405118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X75DNg0rsQ2ANxp98qFMpZAF0ElET3c7IRQbUpeDI+U=;
	b=fXaXfDMbW5hmxRLo/siFETG4QB81VuxX6jcPD8e5pkKrnk6dE+oaehdRmL4s4uAf0Mis/h
	+Jp5L1wWbgsA+qEBgMXnkz2296Sj23OqHW64jugvc5ZzQRCgCZWPtfSnqYNhkoLEC8z/Ak
	jqAwVHgElkkads9zAnVsI6iXejuMw8o=
Subject: [PATCH v4 0/3] Add OnePlus 8T
Date: Mon, 19 Oct 2026 12:18:07 +0200
Message-Id: <20261019-kebab_dts-v4-0-bb6db87ff15f@fhannenheim.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOyw6CMBBFf4V0bU0fPF35H8aYtsxINRbTYqMh/
 LsFNyxweZNzzsxIAngLgRyykXiINtjepZHvMmI65a5AbZs2EUyUnPGC3kErfWmHQJFLbMqygAY
 NSfzTA9r30jqdfzu89A3MMAdmorNh6P1nORb5zG11I6eMcgTgguWK1/qI6RMHrgP72DsYyFyP4
 q8vkg9VLfNSasRWbvty7VdrXya/QCONKoSS9YY/TdMXxSUhkzoBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=rameIw9UocWOEckAgB2MG8CqEoybR8fcV4dQGucyqys=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDFlX36XM9l05bUWw2uZ1BmpRWv+P/QwXDneckdBaZDTx6
 7KCl5e2dZSyMIhxMciKKbI4T5f8YV8prKMf/k8RZg4rE8gQBi5OAZjIpzRGhra6QwueGUh4PspW
 SOC/MIVNp4ppic+jYL6v5359fhWi+ZrhJyOjxUdOu62JEksNBZ7nVG0UNpOr45VfcOoO54+9TKm
 L2AA=
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
Changes in v4:
- Order my signoff last in commits
- correct sorting of dt-binding
- Link to v3: https://patch.msgid.link/20261017-kebab_dts-v3-0-5fc3ca52a383@fhannenheim.net

Changes in v3:
- create a new commit for dt-binding addition
- reorder /delete-node/s in sm8250-oneplus-common.dtsi
- remove prototype revision msm id
- remove zero-value board id
- reorder pinctrl properies with name at the end
- alphabetically order volume button nodes
- rename vol-down-n -> vol-down-l
- remove zero ecc size in ramoops
- add comments describing reserved gpio ranges
- correct pm8008 pinctrl
- Link to v2: https://patch.msgid.link/20261015-kebab_dts-v2-0-e783463bffd3@fhannenheim.net

Changes in v2:
- Add dt-binding for oneplus,kebab
- rename power button gpios to match sm8250-samsung-common
- remove unnecessary qup_i2c7_default and qup_i2c7_default nodes
- remove qcom,kona from top-level compatible
- enable i2c2 and add pinctrl to pm8008
- remove unused pinctrl node in pm8008
- Link to v1: https://patch.msgid.link/20261015-kebab_dts-v1-0-1fee1204a18b@fhannenheim.net

---
Frieder Hannenheim (3):
      dt-bindings: arm: qcom: Document OnePlus 8T
      arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
      arm64: dts: qcom: oneplus-kebab: new device

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi | 607 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts  | 130 +++++
 4 files changed, 739 insertions(+)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20261015-kebab_dts-f13f9665e9fc

Best regards,
--  
Frieder Hannenheim <git@fhannenheim.net>

