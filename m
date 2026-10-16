Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFF13BED75
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181063; cv=none; b=AzSvTFvxHqFu9S8y0yN9CMCIDwUaGThB7dPebsq6B0B7M1tUm66AlobMEsCf4B9JEKQ6FKDW+fEX+sw8UnPxxMcl/XKBg0D0u8lgZmTeJzuvDPwVyuZ+Zs7/p8VRCYZOlKRb54q1JNBhcv5a7XyGnaRewV0m0iW+/HMCFntOF9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181063; c=relaxed/simple;
	bh=fitzAagKrAZQUPt7dKuVcVz3B2JZYLmWXElNChbTgaY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MJ+QPzeBJtnkLBuUHkbUf6OZG9A5buYAR118/g83A6JWKu9lqJJtMBaiEyZu0pyaR+UvApCDDaq32bPcM8Ma4qZPMtlUlxdWp+EHChYml2Ge0hQLUS4VqCcx1ynxWFxmAcu8y7ya5HnA5oydrTOnOSVXLHWn6sVm7q6pYL+oX+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=HLG46330; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="HLG46330"
DKIM-Signature: a=rsa-sha256; b=HLG46330w5EzmH4ZqUtRh4cQ6LcvcQ6WgDJY3Gk4CJKCl2gZP2yFUf0qIr0QHqV3OCPKScR0kKzdkwkDg6DTjpAAVgm3DVsU6Imw5VydzVW45ZLK6g/XaIjeZr8UDhHAv/tbajsSHgeJ5nSGRWkjT3rtZbbdT1TKD3QJ2bgvk5WHctSwo9hxAY6EgeB2QWN8jWzmIjZcyMJSgJKaIS62B/XU/6jQP6MF/Zfz4JuvqQQs0lPDt6tul5yvezHszAVocePyPDBXGX5KXSIgOM7Knux5Mb2W+dx3+4zrH8c9tqeS2/XvgY2XJgf3U0cp9rZylKw+YylBFXAHbgOr8SNh5A==; s=purelymail3; d=purelymail.com; v=1; bh=fitzAagKrAZQUPt7dKuVcVz3B2JZYLmWXElNChbTgaY=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1585118032;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 16 Oct 2026 20:03:58 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/2] arm64: dts: qcom: Add support for the Xiaomi 17 Ultra
 series of devices
Date: Fri, 16 Oct 2026 22:03:51 +0200
Message-Id: <20261016-nezha-v1-0-a39900dfaadd@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0Mz3bzUqoxEXQODVMskS2NTI8M0IyWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQBkTW2GaQAAAA==
X-Change-ID: 20261016-nezha-00e9b93521f2
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181036; l=1166;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=fitzAagKrAZQUPt7dKuVcVz3B2JZYLmWXElNChbTgaY=;
 b=H90POiifn0eCqa/cWymRHbo5qD/kZ8c/Vb5OZej5CkpbVYYrHpoRwg4Boc0LO/jQPz96JjUg6
 U7u9rswmWEADnWiZ0BNLSOy2YCkPYOEQ3/RhX/RW7BtYUd5t5nz1WlD
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=i9++1bbnBwoyc3uhTaetGXS1TbBJoS0mcxT59GrpYh0=

Hi,

This series adds support for the Xiaomi 17 Ultra series of devices,
consisting of the Chinese domestic region version of the device as well
as the EEA version. The only real difference in the devices is the 
battery capacity.

Currently only basic devicetree support is added, with driver support
for the display panel as well as other hardware blocks to be added in
future patch series.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (2):
      dt-bindings: arm: qcom: Document Xiaomi 17 Ultra devices
      arm64: dts: qcom: Add support for Xiaomi 17 Ultra phones

 Documentation/devicetree/bindings/arm/qcom.yaml    |   9 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/kaanapali-xiaomi-nezha-cn.dts    |  20 +
 .../dts/qcom/kaanapali-xiaomi-nezha-common.dtsi    | 899 +++++++++++++++++++++
 .../boot/dts/qcom/kaanapali-xiaomi-nezha-eea.dts   |  20 +
 5 files changed, 949 insertions(+)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261016-nezha-00e9b93521f2

Best regards,
--  
Igor Belwon <igor.belwon@mentallysanemainliners.org>

