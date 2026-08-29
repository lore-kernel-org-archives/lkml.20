Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDA979CD;
	Sat, 29 Aug 2026 19:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032142; cv=none; b=eV/h73+r+QKBfVTH1lDBKsmL0rNTpLBCBOX+Rhs5yiUzcZ2UHFx5w95IQmEvYS2+yACGjrzcIyfRZ1cYbgsiADULEp/wSfzgwOz9IM2wpywn9DnU/nrUbb0Cezxd/oRvGeaKrpC3rnAqCwdJBZgMCudNg90kL26s85Ml7CPHulc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032142; c=relaxed/simple;
	bh=K8swZAGgof7VWw4iTiXBhaHNf2yTnB5IW5DZ4tGyzE0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Sp7c2GPAgfiWN/rYXheSxJCanA84RHcqGcKOfrPiYs3Xootm3ta6D6ZEiWhSWyTgohti2Shqdms5tygo3jvbmOrRRKEuPvMi3wZqLiC+9z2YaNBW9cAC3L/ZqDXDmmtMfduCe09T2m2vdbuoxvB5zBPk7c81J2P8QRtBsCtM3Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATUonFs7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATUonFs7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBF7CC2BCB9;
	Sat, 29 Aug 2026 19:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788032142;
	bh=K8swZAGgof7VWw4iTiXBhaHNf2yTnB5IW5DZ4tGyzE0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ATUonFs7Hx7i8362OLjqVh7CvI/sz7/pZ1v2LOpxNzpgcw6l9IJFuB8h49ZzwdZXq
	 eyo+eCI48KdMVA0esgJhNupsF3bVCab0zYuAIiJeKV/1nZvhauxeaQvBMwJo4ZhCiH
	 RWUuqjX6oG3nZ6L1NaT6wM4W1gowY//CituatTp6VU3CLa8QZu3YfeJkB0PQfuK8EC
	 cgqKpF/OYBluIfWdEhm3lKqIXA5bT0zThDJcbcuuZhO94EhZkwY5UTHc/z5PWeppwt
	 S4QvqUWRrMXxf/lDuKlT/TTzlb+nb3eCPzJmWaL5OV8Nf4Hm4zlesE8/f4Ri6uNCje
	 ixx1WATEtgQBA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28BDC61DD9;
	Sat, 29 Aug 2026 19:35:41 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v3 0/4] arm64: dts: qcom: Support Retroid Pocket QCS8550
 Devices
Date: Sat, 29 Aug 2026 14:35:30 -0500
Message-Id: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22PwWrDMBBEf8XoXBV5Za1kn/IfpQd5vU4EtZ1Ir
 mgI/vcqDrQN9DgD7w1zE4lj4CS66iYi55DCMpegXypBJz8fWYahZAEKUDnlZDzLCyVnjJLOkGs
 sqhFHLQpwjjyGr1329v7IkS+fxbk+yl9lV+1CqK301/nHWCMp26MeGLDL7V3a+8SSlmkKa1exV
 gjoQPtGoQVDDG1P1lDvmBq0g+aaNaC4z59CWpd43a/let//70WupZLeeI2m93ogczhOPny8ls1
 dk+EPCuoJhYIODbF1I7faPaHbtn0DwT2z2F4BAAA=
X-Change-ID: 20260808-rp-qcs8550-85c84760f6f3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788032140; l=2596;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=K8swZAGgof7VWw4iTiXBhaHNf2yTnB5IW5DZ4tGyzE0=;
 b=DeVh/Jkm068lVypf2P71HRF15JwgChjPUAe1eNak/KKJco1CxELHMJDUvNxtd+IGG3zD+WX2m
 zmk6+xtzVPpA4r5ujPi5nYJzI768Af01m4aN5x+LdHvIgrD/rir+HEu
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This specifically includes:
* Nova
* RP6

Retroid Pocket is effectively a sister company/brand to AYN. They are
both under Moorechip and all hardware designs are handled by Moorechip.
Thus the electrical designs are largely shared within a SoC generation.
Hence these include the AYN QCS8550 common dtsi. As such, this series
depends on the AYN QCS8550 series [0].

These two devices are almost electrically identical. The only notable
difference is the panels.

Definitions for parts of the hardware that are not yet supported by
mainline are not included. Such as:

* Panels
* All rgb leds
* The built-in uart gamepad

[0] https://lore.kernel.org/linux-arm-msm/20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com/

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v3:
- In patches 3 and 4, drop unnecessary status on backlight nodes
- Link to v2: https://lore.kernel.org/r/20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com

Changes in v2:
- In patch 1, consolidate the new devices to the existing qcs8550 list
- In patches 2 and 3, make regulator naming consistent
- In patches 2 and 3, move the mdss_dsi1 node to the correct
  alphabetical location
- In patches 2 and 3, fix some style issues with pinctrl references
- Link to v1: https://lore.kernel.org/r/20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com

---
Aaron Kling (4):
      dt-bindings: vendor-prefixes: Add Retroid Pocket
      dt-bindings: arm: qcom: Add Retroid Pocket QCS8550 Devices
      arm64: dts: qcom: Add Retroid Pocket 6
      arm64: dts: qcom: Add Retroid Pocket Nova

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../boot/dts/qcom/qcs8550-retroidpocket-nova.dts   | 116 ++++++++++++++++++++
 .../boot/dts/qcom/qcs8550-retroidpocket-rp6.dts    | 120 +++++++++++++++++++++
 5 files changed, 242 insertions(+)
---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260808-rp-qcs8550-85c84760f6f3
prerequisite-change-id: 20260217-ayn-qcs8550-16c07b63de26:v9
prerequisite-patch-id: 17ba304f7a8a08cc78f98e198db9c51f4786a22c
prerequisite-patch-id: 21873631f5dcdb9bbbdb5c20c3f5e9816cc405f9
prerequisite-patch-id: bf7b5dea0097cbbdf04929a4246d1fc65c607ea8
prerequisite-patch-id: d7f546eddc96a4f31a1e681abddbc96bd68abb32
prerequisite-patch-id: d40d784ad8efbb1204c024408be2067725a06cf2
prerequisite-patch-id: 25bbd55199a8250a912ef542b31f43dd5ccdbc90

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


