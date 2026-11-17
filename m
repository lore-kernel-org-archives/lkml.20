Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.245.251.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913127;
	b=10hiBmAZj5a8ZCzjDwKeB2FykVnx2KsBi4i1Ocrrs09tQHpDwMUvoTB3tr+cKaSL9Sul
	 M/L+5ImBykVLjjzFmDb6YivtB1cphe0FJpm7uPU6IHefVTg2CL/mGkb5aefV9p+0z4+mM
	 u8XHhZCM711WoBRTtmBEXOON+dqCzx6lcjAw2DXJL2ks7PjisgOvQ6vzdffz7Kz56XDHY
	 3BN+6d7ujapUhZNjpJ6tqzPwnCYXmIwXsasg3avaIpE0RSAxFTLqpnOVoyMko6Z6kbxBR
	 ZVqBchh0a4lIjXShl8qS1i5X1bOuOnY5C3E/njICb8PYxZBZzFbTI0RDLDnpSfB9gMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913127;
	h=DMARC-Filter:From:DKIM-Signature:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=d+PRipflEpaEsqBSmY/caAlN4OujSnpMTEriwxnEaHo=;
	b=omrfiwLWR/x/nT+PKyb0iPWqsBFAxwNYoX/xtm7VNkaYr8gKZmywto67rP1pwJe6NY8v
	 ttdKqyI55VRz1iLwIJDoRMzWvYWeYvzHp2RhUYYiR+TqsgRiDG9BkGKNPOeY0/jBNR0+m
	 JqkVxl01Sx1H8F5RHKha9d7P1QZboKRYhYRSa8dIeTO8h9yY1eU9Oh9ARIaJxfivmIuC3
	 5Sr8JuK27G8YNM/ZqedZlqo4/ZMFP7ilqsaADc7Ii74bMM6S4qbbdPUv5DCh5Zp2EFUEr
	 VJnIuRlGAV9wH1m3LXKaaD9818gr4mFXPqP79EHSGAnslg9C8WRPu0Iep6NAlt2Ka6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fhannenheim.net;
	spf=pass smtp.mailfrom=fhannenheim.net;
	dkim=pass header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=rC++PVuQ;
	arc=none smtp.remote-ip=188.245.251.181
Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E60606A31C;
	Tue, 17 Nov 2026 10:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E60606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=rC++PVuQ
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1794913113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d+PRipflEpaEsqBSmY/caAlN4OujSnpMTEriwxnEaHo=;
	b=rC++PVuQUpMUwnH+hp0jhnlDTZjDSNf4QIVIbXHJnNH/l/YEGMgDR1iiECzAm3l6cgg0Ja
	u2vKqoNfAVtea1p77VMIbKJRJBgUpPJEv/t+rX69XdVhaExT1n2+YMnORelJN6j83nP1Zi
	mzsbq4SLrjW7suy/FpwHL7ufN/e5lSg=
Subject: [PATCH v5 0/3] Add OnePlus 8T
Date: Tue, 17 Nov 2026 11:57:55 +0100
Message-Id: <20261117-kebab_dts-v5-0-bdee1c9fe351@fhannenheim.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOQQ6CMBAF0KuYrq1hWlrAlfcwxrRlRqqxGopEY
 7i7BTck4vIn//2ZN4vYeoxsu3qzFnsf/S2koNYr5hoTTsh9nTITmdCQgeIXtMYe6y5yAkmV1go
 rciz17y2Sf05b+8M3x4c9o+vGgbHR+Njd2td0rIext7TbA884ECKILDdQ2h2lTwKGBv11E7Bj4
 3ov/nqRPBalzLW0RLVc9nLui7mXySty0hkljCz/+Hzuq7nPk7dW17YsiEDRrx+G4QOaqYWiegE
 AAA==
X-Change-ID: 20261015-kebab_dts-f13f9665e9fc
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>, 
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frieder Hannenheim <git@fhannenheim.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2505; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=f1wykwnp5BMJXrwwQTr4cHy4fu5BKyNX7amyi35WYIU=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDFl/jO0kY/bMk41WMWI3WS360fZoy5oVYdtEc/ucQ5kiM
 mKeHLXsKGVhEONikBVTZHGeLvnDvlJYRz/8nyLMHFYmkCEMXJwCMJHrlxj+h6WcOBIiXdc+Q0bu
 5YznGXOctP+e/JLmc+b1gqmfp8x/3crwz+y8zc+H3Gdf37aqrgtaER1W+4HHZLfRnJl5bq4nVl3
 UYwMA
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
Changes in v5:
- add Acked-By to dt-binding commit
- drop pon_resin node as it doesn't trigger keypresses (David)
- drop smpc6-regulator (sashiko)
- pm8008: use interrupts-extended (Konrad)
- remove vreg_f from -common as it's not used on all devices (Konrad)

- Link to v4: https://patch.msgid.link/20261019-kebab_dts-v4-0-bb6db87ff15f@fhannenheim.net

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
 .../arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi | 525 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts  | 125 +++++
 4 files changed, 652 insertions(+)
---
base-commit: 330fcc4f3d0bd303fbd9e2461dfc10ba893768fc
change-id: 20261015-kebab_dts-f13f9665e9fc

Best regards,
--  
Frieder Hannenheim <git@fhannenheim.net>

