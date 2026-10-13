Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E0B517BC7;
	Tue, 13 Oct 2026 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902477; cv=none; b=chG0LjUvjdCtvu4Bo+oEJEpBHfHfjddg4cj4UVV+YB1/RDDGMHA8t2AKBW3ImTlTppnkXc5Yr+HYnYdAz3Nmfd7xoT7aBrgngIwxl7ZWdgTWVrDQQS9bOwlQ/tSD8yi+yEBNd6xKLL4kJ1zk7rZISMMlTAeVyQOILmKGDGDE7nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902477; c=relaxed/simple;
	bh=GlHnK+4qKaDdo2A0sNEUCUKte5M3D8EeHi5/6oE29Hc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XwzPe8vUgwIK/d0QntTQAxoOE8JmH9XPoNN0cKV5NClL/05sva/1f1t2puUBnjmkPNRZNpCZYjEbvXRyMruG9RWALOrnA1HhwCIx3gsKq78XGoAAPehdM3i50mZsJKwQQjeolCVGCfWZufAwh3PExczV5ciO8JbyIPgEFL2NXdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxXh8lto; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxXh8lto"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FD40C2BCF4;
	Tue, 13 Oct 2026 14:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791902476;
	bh=GlHnK+4qKaDdo2A0sNEUCUKte5M3D8EeHi5/6oE29Hc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DxXh8ltoWkRxW0FB4owyyMzO88etR1YvIONgLivEsKIQD9yPFxPU4QFSH+/eS6Q44
	 ddOPlmnVrn0RmlufGEHO/mF8Il9TI8iXnYpw12vG34H3sA/pvUDIvGWnhZrVSvj6vK
	 iE6bu5U+KPPNuQ/nR7UuKaEnaDaCTpN+S2BAiUF8Ufi42yV/qEWugIISXfPOCvGwLi
	 oeUvSaz6kYrfede84a4jSHXHBrtEojUd8dyHuqAbOPFCt4HNCooXklMus4ZFORlCzb
	 mlHDdt0136NYTQigFJPLtkkLgI3T5ZQWW/2twiS41gNE4TKH8JstB3s1UbUcA9FFqG
	 tqE4/v9GDTsmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B169CC6B0F;
	Tue, 13 Oct 2026 14:41:16 +0000 (UTC)
From: Juerg Haefliger via B4 Relay <devnull+juerg.haefliger.canonical.com@kernel.org>
Subject: [PATCH 0/3] Add HP EliteBook 6 G1q support
Date: Tue, 13 Oct 2026 16:40:55 +0200
Message-Id: <20261013-add-elitebook-6-dts-v1-0-f22e67fc7f9d@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTuQVEnFq4iLJvOro9JIJhWh9
 O5GXX6L9xYyFIXRoVuo4KWmeWrwm47SdZwuYJVm6l0fvPOORxHGQytizncOLNV4vx12AwKiuES
 tfBac9f27Hk9/2xxvSPW7onX9ACOJbjZ3AAAA
X-Change-ID: 20261010-add-elitebook-6-dts-83747e6ebd0c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Juerg Haefliger <juerg.haefliger@canonical.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1529;
 i=juerg.haefliger@canonical.com; s=F9F8B48C; h=from:subject:message-id;
 bh=GlHnK+4qKaDdo2A0sNEUCUKte5M3D8EeHi5/6oE29Hc=;
 b=owEBbQKS/ZANAwAKAQ/TiwkLpkK3AcsmYgBqzkMJdjBH+e71xDFFZWeY2vRqWhkMlm1s5Fagh
 29aPPMoP6KJAjMEAAEKAB0WIQSFl9T3oi6mu+It14sP04sJC6ZCtwUCas5DCQAKCRAP04sJC6ZC
 tz0FEACrNr1YSn/J/2G+UoExKVjjXsMAyrJGqler8XGvHLlVP0ioLmK42DBcMVlKW8CpJYZBdK6
 jqV91fP3yl7EVD+qZU94OVOft32zdXuz6uXT8FIFfhSNKBdQNLFAoTEPXrp14LrJQZL8XfvBe5L
 ReTe+37cyGLoIHOjBq8fcOhHMd8nLMGTGiljCLJhZAtGpPq0DrVYfuXCquhstewNq/u3/lIkMiN
 4bd6DvxbmE5nCGKYonqT0PL8gfr1QqIpbIz7iPSvgKgL9sedNqbQjArgkOnF3kEutC02P4U3yT6
 XcwEr20AhanxBG+5qLJgQdn1JGH0t9lLPwbVCS46475xreviBuLhV+1x9mR/P5abgRloXjQzS0I
 iCUd7WU/0ql0KFGSi2zUtcZt/5ZnXUYUBzPMu7DOzrljek2W3g6QjvV+Im5+/zTbuqtVxw1T+Y6
 eMNYG8/v74WLFFmpMr5GKwBXuQnBSS+fTxyIdAT5A1A9gBeWHqO9vtdOIywBXe9eHhnq2Jk28y8
 27bFBKZX4/Vz9lOyqZYSnJauR7T7ilRDRmH9LC1lzXJ0FRK+WcAsr9IYqACVKb+RTUK0rOr8VrX
 ZJlp6wVg/EuepCoCUN2leW9DIsSZeEtHZmzUr1h3ZrrQQn7PaWIZvmdNvDOUP3oF3C1dvt127EG
 YeQC6mi4iw+HPdA==
X-Developer-Key: i=juerg.haefliger@canonical.com; a=openpgp;
 fpr=52B5BDD2A6EDC76A0FE0AB4A754C3A96F9F8B48C
X-Endpoint-Received: by B4 Relay for juerg.haefliger@canonical.com/F9F8B48C
 with auth_id=1135
X-Original-From: Juerg Haefliger <juerg.haefliger@canonical.com>
Reply-To: juerg.haefliger@canonical.com

This series adds initial support for the HP EliteBook 6 G1q laptop
(SKU B16TPAV, 32GB, WWAN), based on the Snapdragon X1P42100 SoC.

It's very similar to the existing HP OmniBook X14 but comes with an
additional built-in fingerprint reader and Ethernet port, so the DT is
largely a copy-paste from OmniBook.

Confirmed working on real hardware:
- Keyboard
- Touchpad
- Touchscreen
- USB A and C ports
- Ethernet NIC
- HDMI-A port
- Wifi
- Bluetooth
- Integrated Speakers and microphone
- Camera
- Fingerprint reader
- WWAN modem

There are two additional small patches required for the kernel to
recognize the eDP panel and the WWAN modems. I'll submit those
separately soon.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
Juerg Haefliger (3):
      dt-bindings: arm: qcom: Document HP EliteBook 6 G1q
      arm64: dts: qcom: Add dts for HP EliteBook 6 G1q
      firmware: qcom: scm: Allow QSEECOM for HP EliteBook 6 G1q

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    2 +
 .../arm64/boot/dts/qcom/x1-hp-elitebook-6-g1q.dtsi | 1568 ++++++++++++++++++++
 .../boot/dts/qcom/x1p42100-hp-elitebook-6-g1q.dts  |  246 +++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 5 files changed, 1818 insertions(+)
---
base-commit: 705529dab1fa872d8b53b09c95e1b03a95573376
change-id: 20261010-add-elitebook-6-dts-83747e6ebd0c

Best regards,
-- 
Juerg Haefliger <juerg.haefliger@canonical.com>


