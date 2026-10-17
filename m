Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBF03CB911
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792219336; cv=none; b=fur9G3WSITP55cgNd5z6vjEwzYS5UN2IWdqTHP5q1yudTQcueQzXf3ayMCS62GTrTYXxZ5kjyCQu1q1H5l1IO+oIOldTi/tmLz5r0fUewElXnSwsGwBPEFJpRkJ4baugxzVZoMOTD/xInmsMKrRT4QDi+G1yjK9RSCqJsrcWtBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792219336; c=relaxed/simple;
	bh=kOhVvGuhCOm+fq6rvyuyO16suREfPEaEoGw5TUGqdu4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VCvJD/q6HiZuTCokuT0U8WrbwACgzM8/OnMzfO+GRbZgS1r2hoeeMkQBKl4HDCFz8nNKQDUIAbTjC/8nCOHNcUj+/11K7U07G9+tk0GGKrZ/zBYW1bloEqVOv0MrX8odkkcNfdDHw6MIr5jeI9yp2pMibaU8PwwtXVqg3PY/ijY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=Modww8Ny; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="Modww8Ny"
DKIM-Signature: a=rsa-sha256; b=Modww8NyLwcGqtDEgAp4yGMuq9Vn+EE/I6yVc5pP62vVN5sM3wgkX58mmPEXvzP1ufOmHzP6FdP359MMsYbylTt1uAAi3t4QHdZNjo1DTHglHjM+8qVttFSEK1w5uQVCkKMIqq7D3Z0m5gjMbgFtVQIo2a3pmWpdTSWeIENjZLvaXBrdEnecHj9D+vtyg5ZuY2BoxUYK8ujRvn7gVu/9C65j5dXVyz+itqgWedO3ircwYDtWOBnrgpmDgyM+b7XotNMAOjF7VCB907s4HOBnQSAyDcujTp95LGdvXeLFQenz563BSGVC0MaHcAIHfJJa35369xYUsIGOD3EY1645CA==; s=purelymail3; d=purelymail.com; v=1; bh=kOhVvGuhCOm+fq6rvyuyO16suREfPEaEoGw5TUGqdu4=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1782608291;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 17 Oct 2026 06:42:00 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add support for the Xiaomi 17
 Ultra series of devices
Date: Sat, 17 Oct 2026 08:41:54 +0200
Message-Id: <20261017-nezha-v2-0-44c95e1a9d6a@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NQQ6CMBBFr0JmbU1bIkldeQ/DYqADjIFiOpWIh
 LsLuHP5kvffX0AoMglcswUiTSw8hg3sKYO6w9CSYr8xWG0Lo02hAn06VFqTq1x+saaxsLnPSA2
 /j869/LG8qgfVaR/vRseSxjgfR5PZvf/mZJRWmDuntW8Qvb8NFBL2/SwYaEAOPQeKch5jC+W6r
 l80QgGPvQAAAA==
X-Change-ID: 20261016-nezha-00e9b93521f2
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792219319; l=1838;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=kOhVvGuhCOm+fq6rvyuyO16suREfPEaEoGw5TUGqdu4=;
 b=r5ZPyPlP7GQMygqJoMvo1fHen+PaJ+F1gAUuZKKqX8Eux2zgUXKz1xWZjnK7M9qKpyUyF3gi9
 HKyt2vH37ojBM59JFq5f9yvh2Qi2FNFQ3U4wmFkV9k79PLb6GCr2NBC
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

