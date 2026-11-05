Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.245.251.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910159;
	b=h5pLAn5KwjfvPzoqXBAgT/xQkcBj9Qa+/wCzZ2hxPZbIuNLx8XS67Rtwa8rso8XTef9d
	 JZ0iLTz30D6XEylqiyoxBrzohpndtZaNXGtbAI8//P9pxj8h3c0MMB2tlgRI7dzfMrUOu
	 WUs9eISCSjWTFeiArXwKWGNVCYaDEADUcVj7+fQQLdyLdAz2jKXxDJrq1kDKQ4yh7kKDQ
	 AFNEwGHY4zYOkXDGFc2j+Si/8tf2ToaJ7Rw2DPSu0gFHSF7gXOcd71ThhhQuYNk5V8lDB
	 2IC5vJgv9KTDR73B8eSUVKpGGjMeOd0x017ptqTaLNgCpa+oVmtwEYgA7/p2VimOxWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910159;
	h=DMARC-Filter:From:DKIM-Signature:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc:
	 X-Developer-Signature:X-Developer-Key;
	bh=8KU9VBlCsvNAm+/QyNZkHl253tw2+cQljJ+6DtR2vJM=;
	b=zpnRedFkHoEswBTtpfGtaxWMtTCTfm0SEb38Jrcp3jyCulXAOiSgfrdMi8/oZDwE8w6B
	 R7Q9qRVeHU5VXZohAX4Levl3pG99PvmupiUBRybixbZTevTcKW0cC+dLBi06qnhu5/svB
	 tl93R/D4XzYwJrlalBCgMsB18r3dTcaZLIbPBigFn4g5f9amA83hCRFARZ/Ue4EafGsTs
	 GgVQinEoyYR7SgQsaExJlGMF+YmBUC8jPk8yeEUS+9y4Dn5MghRA4c9eCn3wOdfIz3jaO
	 Ohe8OJC5qzLF/Y4ZqEHKUnWsunsQcB+3wS6G5qi/ifJC5KAfFs62rtCtm944gagv/Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fhannenheim.net;
	spf=pass smtp.mailfrom=fhannenheim.net;
	dkim=pass header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=Txf8t3Ul;
	arc=none smtp.remote-ip=188.245.251.181
Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B1F606A326;
	Thu,  5 Nov 2026 20:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B1F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=Txf8t3Ul
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1793910143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8KU9VBlCsvNAm+/QyNZkHl253tw2+cQljJ+6DtR2vJM=;
	b=Txf8t3UlLgeHlaWECpylZ9qjhKQAZQzmfawDMjFwmfKyZ+Lbic3AjNO/fkECUw+GEK/NEf
	Wn1vmbDy7P3SpIZifKdku4Ajfx86vpXIg1tbcw4T90dyfIXXIGWA1XImPaWgecVcgA8Yf8
	9u6bv0UWPbzf5UL7mxA4eTndSVBBvZI=
Subject: [PATCH RESEND v4 0/3] Add OnePlus 8T
Date: Thu, 05 Nov 2026 21:20:00 +0100
Message-Id: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
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
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>, 
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frieder Hannenheim <git@fhannenheim.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2187; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=/E0vGSITPd4LMa8OW7kOh4TcQjh9SDcCd6ZjfaN4N14=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDFlvnqor1p76HPFoRWK55iZOP7n/P/c+nfLHrdyB9+rD3
 slXz8uUdpSyMIhxMciKKbI4T5f8YV8prKMf/k8RZg4rE8gQBi5OAZiIvjfD/0AtnsUJshO2StrG
 6FwxvhpkIhXEu2LWUo8VZ/88Unblt2NkuNqb8o91qerB1U1zrbea/b1Yydi1ukYlKlqT4eIZzZx
 2dgA=
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
-- 
Frieder Hannenheim <git@fhannenheim.net>

