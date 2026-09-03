Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB47E34DB6D;
	Thu,  3 Sep 2026 05:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412973; cv=none; b=iU1+hkwHLRS8PwR80UbCZQ/IWWFgT0dvxj6BDqWeDxo2dDc7su4JNHDeLq8z0g93xG8YNZS/bTyxWuVs6L80tYuUHtAQHc90iapDpxvfXYTTAeOG/pucE2LeziIDIMS1F897k3EIp9s00jYXRE68NPF1bXt19PzDEgcCq3KyyBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412973; c=relaxed/simple;
	bh=O6vuoKCQoHoG2GbnoVIEO+PufAG+OYfaUyXLJ2wdgLk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n1EXWuWQoTPj49lKRLnocoDc1WgZkvRlFE68OIhC/1vZbp6FukuQaaQrfvscjjbMeTISyOWE2u6CRETK4RURK6nh0qRrI0v0CiFZi21+TOHxa26TarO/PYvb3KDzmsOC6BXkw4GqA+0bCCkSu5e36yZaAwojgaOVgazPLt0xb+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpO8MuWw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpO8MuWw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 626D2C2BCB8;
	Thu,  3 Sep 2026 05:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788412973;
	bh=O6vuoKCQoHoG2GbnoVIEO+PufAG+OYfaUyXLJ2wdgLk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DpO8MuWw2IvvfecBbQi6GXgQdmz5tBwa3Ti+2m2ENff9zEdS1TO692juiIL1ryiBz
	 fZqqZk+sexvsMzGh3FQscBTGAAokKEoNG5qsqmQ6wsPdBeWB7EH7kZuRyqZpQbuXJ7
	 2yPPYg9y1HLX/C9Aeitx4lkQxMWJ+M9rPPk8Z+6qHtWNhOu6ZnUsIXF7gSnLGe/RdZ
	 9FQ+H7yfbyWbt5b+gwwk5CYhi8ABkJUdsTpAEVv0iHqNrI7zVaLsDkEtT0fsBAVsHg
	 +vQTyBIP8bIjm0MwZhz6dhQpnCaeImgKAQKSjc+lSG9ApqZ+naA+N83uXsqYQDW3Gg
	 FTEniLLsc0nYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2A0C624D4;
	Thu,  3 Sep 2026 05:22:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/2] ir: support IR for Amlogic A9 SoC
Date: Thu, 03 Sep 2026 05:22:43 +0000
Message-Id: <20260903-a9-ir-v3-0-cd471c667c15@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACMEmWoC/12MwQrCMBAFf6Xs2UiyrUnryf8QDzFN2gXbSCJBK
 f13k4KgHufxZhaINpCNcKwWCDZRJD9nqHcVmFHPg2XUZwbkKLnikumOUWD1oXFX7JRVQkL+3oN
 19Nw650vmkeLDh9eWTaKs/4UkGGeN4y0a3WrtxElPNz+Q2Rs/QWkk/Pa6j4fFQ4OiV1o6Z369d
 V3fqVH4+9QAAAA=
X-Change-ID: 20260706-a9-ir-354fb297e716
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788412970; l=1103;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=O6vuoKCQoHoG2GbnoVIEO+PufAG+OYfaUyXLJ2wdgLk=;
 b=ek1RQor0splhjxeQQVFAs1R0OdVSOoTglk2DuhmtTqu//HDjzRs9I1bYUYA00XWTiRCM1e3ES
 Q5CSKHqRZAsDT08TVSsVam3GyxlUonGeEaf0rdbbyoyunzbKgPuMgcU
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Document the Amlogic A9 IR controller compatible string and
add the IR controller node for the Amlogic A9 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v3:
- Align the node of group-remote-input-ao-pins.
- Link to v2: https://lore.kernel.org/r/20260709-a9-ir-v2-0-42c21d7a6ffc@amlogic.com

Changes in v2:
- Rename the IR input pinctrl group and its phandle from remote_pins to remote_input_ao_pins.
- Link to v1: https://lore.kernel.org/r/20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com

---
Xianwei Zhao (2):
      dt-bindings: media: meson6-ir: Add Amlogic A9 IR compatible
      arm64: dts: amlogic: a9: Add IR controller support

 .../devicetree/bindings/media/amlogic,meson6-ir.yaml       |  4 ++++
 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts    |  6 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi                | 14 ++++++++++++++
 3 files changed, 24 insertions(+)
---
base-commit: 4336e970ec6890fbd424128c352564a9c1dd514a
change-id: 20260706-a9-ir-354fb297e716

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


