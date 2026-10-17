Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEB14CF494;
	Sat, 17 Oct 2026 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.251.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792249992; cv=none; b=QQ2dC6EuUHyfOChbc7DOz+7QZ5ERyKr3LOMrtKHXxDq4M2SujuUyIHG7pmEeQ4HS+bU8+YwMHjeq+d3XuxKOPs2CT6FKdhCza1dQnzUBkoR8wk44uv2kMsuDmWULcTFoLrBcyzAbkfwjY48xw9fOqA0z4gZvXfTGUyu0oerpRXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792249992; c=relaxed/simple;
	bh=JSNeOaQKXiIe8vupH6RjAUk9yYQ+XjlAkHGWzDIwtAQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o4D4e89RlroDYk+FwEdAyuJfhWOjO54Ofizq+g0p0Q1KU2SVzXz0q+l8mePc18wEYjO+7860HnxMVyWEfZd+QnOOXmB6/dnFGcBiXKAya2Ekw088hnSIdbp18VO0cluUoBknkllGw+Zc8s5I44/MBo8z1XyWJDJuzjkrjQJaa7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net; spf=pass smtp.mailfrom=fhannenheim.net; dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b=42DtV5Gw; arc=none smtp.client-ip=188.245.251.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b="42DtV5Gw"
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1792249988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uoFo/hNDqrRKck0lH7GUEcxK96J7iZti/tlzZ+VcH/M=;
	b=42DtV5GwXD7olX1vsqGR6Ur6V0v2eTFA3uYSNftBdRMES60zXlQiRLD1mJpzo+bwNxcJ4U
	sbGVOvgAKzfp25Hq6UvTX2d4zfZs0qZclFBVyj8as7WepkYzvM9DEGgJIdFhpsRNRO+KTI
	VjZpV/ybenkFU7DPNeNRN2myQsLcl7A=
Subject: [PATCH v3 0/3] Add OnePlus 8T
Date: Sat, 17 Oct 2026 17:12:33 +0200
Message-Id: <20261017-kebab_dts-v3-0-5fc3ca52a383@fhannenheim.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ7CIBBFr2JYi2Ggra0r72GMKe2MRSM1gETT9
 O5CXarLl/z3Zibm0Rn0bLeamMNovBltArVesW5o7Rm56RMzKWQFAkp+Rd3qUx88J1DUVFWJDXU
 s7e8OyTyX1uH4Yf/QF+xCDuTFYHwY3Ws5FiHvfnUjcMGBEEGKooVa7yl9YtEOaG4bi4HlepR/f
 Zl83NaqqJQm6tW3P8/zG65i8aL6AAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1962; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=JSNeOaQKXiIe8vupH6RjAUk9yYQ+XjlAkHGWzDIwtAQ=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDFmXJ2RnND94fv1lzVpz89Wn8w8ol0vauItciznau8390
 4X8iY95OkpZGMS4GGTFFFmcp0v+sK8U1tEP/6cIM4eVCWQIAxenAExk+iOG/74Tsvd0ruq5GZ+x
 4V2fdnfKjgeHnx1eKLThqK3hZu6KO9cZ/lf8+KK8/X7J5l2Tn11exK177Jm7/MrWkBDWrd8NNnM
 eTeMAAA==
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

