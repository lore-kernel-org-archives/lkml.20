Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF751348C6D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792315098; cv=none; b=DfUPltLJ05Sz++BMemSN+aTJTBS7OE7Zu3EfMed0dKEIp/gXGMsWGHjruzg+EYYwKqFGEFx9ijgb6GtLNVqyhg5lgacYT8ptFem6aiSKxPFO7YFazSIn3l7M3iCrRQqgC1WVhRz99GESmVbV1R0Ew+IB0E9t/WNql+ROfAzduRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792315098; c=relaxed/simple;
	bh=0tZn4Mec2OvIe81Hd24jrS+MDdaRi3GMpoOY2OQRzSE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hbYoQh0lhP4mQr3N1jqlxk++auqsgnuIXaV+wJnfj7QRTD5j+CZnG96Il8EGyMa5oLyKmLPJdcDxQsSLgu1IBRZ5aGyqAViQ8wdy+8O0tewt0SrrKJ6soGqaXYjr86kXrhQ3sO0xVHeqVHtCMoDuh7zx7JYvx/SIP9lpGw8/Rpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=hhjVhP5V; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="hhjVhP5V"
DKIM-Signature: a=rsa-sha256; b=hhjVhP5VJs67wyb1XQIeaNX+VFdSyX3l/0tZvdX9mzCUKAouyEvEbNMZQnIrt9CLp8PryPjrwnqrojjYJAHcyGsNCYmLebol91WIJAWG830KoZbSGfgZpelJGaAmb2jSYxkLNR7l9SoFMm/2+6km/ptiEIx73+IEboj+36vzjMZkcdwD7KvWPTUd5SXtvmcCHDMdDQk/6z4kKWnPgQTZRi0SZ2gUPza0Rf8O/IUImLbhpmy961X30LpxDsAuGF8EtOiiG2OEQ0W+QxyV5bD6aJgP/cyUjXoAcv4c7eebl5WXw2T5z1HJIfZzxgTKPdhKk3SuYz/DOmwVEFqI/+9YIw==; s=purelymail3; d=purelymail.com; v=1; bh=0tZn4Mec2OvIe81Hd24jrS+MDdaRi3GMpoOY2OQRzSE=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 799555268;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 18 Oct 2026 09:18:01 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v3 0/2] arm64: dts: qcom: Add support for the Xiaomi 17
 Ultra series of devices
Date: Sun, 18 Oct 2026 11:17:55 +0200
Message-Id: <20261018-nezha-v3-0-7e8c63903290@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf4V0bU1bHqau/A/jYqADjIFiWiQi4
 d9tMSbGhcuTnHvuwjw6Qs+OycIcTuRpsAHSXcKqFmyDnExgpoQqpJAFt/hsgQuButRprmStWHB
 vDmt6bJ3z5c3+Xl6xGuM4Gi35cXDzdjTJ6P02J8kFh1RrIUwNYMypRztC180eLPZAtiOLzu8H1
 7B4MqnvzOGTUSGTZZXOUYI2BfzNrOv6AvM+uHcEAQAA
X-Change-ID: 20261016-nezha-00e9b93521f2
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792315080; l=2048;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=0tZn4Mec2OvIe81Hd24jrS+MDdaRi3GMpoOY2OQRzSE=;
 b=RnkmdiKvXibMoiKQooM9nyclMKVMmWb5DIkZsWqqdcN0MwUKik+0rh3Usr3ywN8HSr/FjlyYA
 2SWxTRXZy8aBlJRnF5ikQgBX6xXBmyKAESxJvnUAvkBq4YIo1G2iXtF
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
Changes in v3:
- Fixed two mishaps that occured because of me not saving the correct file. [both sashiko]
- Link to v2: https://patch.msgid.link/20261017-nezha-v2-0-44c95e1a9d6a@mentallysanemainliners.org

Changes in v2:
- Fixed a duplicate compatible match [sashiko]
- Fixed firmware names [sashiko]
- Removed synaptics dep nodes whilst the driver is not merged [sashiko]
- Fixed unit-address-matching-reg [sashiko]
- Link to v1: https://patch.msgid.link/20261016-nezha-v1-0-a39900dfaadd@mentallysanemainliners.org

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Igor Belwon (2):
      dt-bindings: arm: qcom: Document Xiaomi 17 Ultra devices
      arm64: dts: qcom: Add support for Xiaomi 17 Ultra phones

 Documentation/devicetree/bindings/arm/qcom.yaml    |   8 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/kaanapali-xiaomi-nezha-cn.dts    |  20 +
 .../dts/qcom/kaanapali-xiaomi-nezha-common.dtsi    | 883 +++++++++++++++++++++
 .../boot/dts/qcom/kaanapali-xiaomi-nezha-eea.dts   |  20 +
 5 files changed, 932 insertions(+)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261016-nezha-00e9b93521f2

Best regards,
--  
Igor Belwon <igor.belwon@mentallysanemainliners.org>

