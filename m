Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2046355C30F;
	Fri, 16 Oct 2026 17:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171014; cv=none; b=l4DwKKVNmMWUgyeqwzj7jaljvZ6Xnog+mJs7Ht6i3NN/Snf/kmx1uRcPaeX6Jw51LPjkX5PA9RSV5xzGAoItPozjnHbwcXNu7sHLVB5St62d/VofO03OWJv+PFDlj3sgay/tJElrJQidax2RAtXBdL6JO7UuQtk5xic/TMVodZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171014; c=relaxed/simple;
	bh=kQZA6RQBnFlVuvXUdChzKc/fj05CNydeCaEx309sHac=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ao1Keg2s5ovjbhdzriFbjEfF5djzusHh3wpQksqP2IMowNlh4K+5/7MxDv1+fIicDGPUV9jMqXjD/Qf/7vgEdoqE+9QEVDikOuD72u6iP9U8e8EJQQBwb1tGeH/ZC+bA/J/8IsIwIwFXDTqtino51kf7X3gi81JY2evGLNkVtXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESn5QEwU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESn5QEwU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0938C2BCF4;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792171013;
	bh=kQZA6RQBnFlVuvXUdChzKc/fj05CNydeCaEx309sHac=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ESn5QEwURtvO0A6eGoD/yG+799ZsIyBFbQusAIAL4KL8gMdOGDwvKVtaXHxOH/nmC
	 wKAJmSrlYWzrNAQdOYuhcIEmZ/RpBANj0fBumuJ+xi0VTb1fXL2K9EDSq+pmrhTadF
	 qyecn2jyX8OChVZ3XunD/HzE7VucNhY6gqxZX3X5kz7ow6S1NbKy5P4oxCAmyvlfIA
	 Vbl7XeWTQh2ZXPLI8mGS5BoKe+sRpQcfoELPTKV7zlzh4sFo/F54fT2XX0bZpe9mO0
	 V0Kq7/vGyX2zHPMGZ2K3v3JsLi5ZRyBOK23Zu+N0CmoKSiolXNB7N8nGfn6FhM/dLo
	 I/yVb+C0IfnsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB97CC6B38;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH v7 0/4] arm64: amlogic: T7 thermal support
Date: Fri, 16 Oct 2026 19:16:06 +0200
Message-Id: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33Q22qEMBAG4FeRXDdlJgez7lXfo/QiJmMNeGhjK
 lsW373RhSJie/kH/m8mc2cTxUATuxZ3FmkOUxiHHMxTwVxrh3fiwefMBIgSFAK33vPUUuxtx5P
 hc+gVByBtsLbeOWS5+RGpCbdNfX175EifXxlPj0dW24m4G/s+pGsx0C3xdQACKrYW2jClMX5vW
 824Nf5dYEYOHKtG1BdvjfLmxXaBuucmbtws9oQ8J8RKAAhfgYUSxIGQO0LgOSEzYQUZgZo8gDw
 Qak/8sUU+JvfKoRYXr0GpA6H3hDondCYqUOCsLG1Dx4+Uv0Q+tz4nykxI49FVWskK3I5YluUH5
 Y3AmjUCAAA=
X-Change-ID: 20260410-add-thermal-t7-vim4-00e571badcc1
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3708;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=kQZA6RQBnFlVuvXUdChzKc/fj05CNydeCaEx309sHac=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9al6A9pp+x2B5wKqwgMuLz34XJlw4nsHevzjmlEdpvN7
 9Fk3Lm1o5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZiIRg4jw6PiQwlrQ+u97jZ5
 TNmU8abyRRXfr63HS406bQ9c3BrOZs/wP8+4lM86UHhyN2/c8mjnpBOTQ6yXMMWc8vzgu9zpymN
 lZgA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr

This series adds thermal monitoring support for the Amlogic T7 SoC,
used on the Khadas VIM4 board.

The T7 exposes six thermal sensors (a53, a73, gpu, nna, vpu, hevc),
each accessible through the secure monitor firmware interface rather
than a directly mapped eFuse register as on older SoCs.

The series is organized as follows:

- Patch 1 extends the amlogic,t7-thermal DT binding to describe the
  new amlogic,secure-monitor property.
- Patches 2-3 extend the Meson secure monitor driver to expose a
  thermal calibration read command (SMC ID 0x82000047).
- Patch 4 adds the secure monitor readout path to the amlogic thermal
  driver and introduces the amlogic,t7-thermal compatible.
- Patches 5-7 wire up the T7 DTSI with CPU cooling cells, sensor
  nodes, and thermal zones.
- Patch 8 extends the Khadas VIM4 DTS to map all thermal zones to the
  on-board MCU fan controller (states 30–100, corresponding to the
  FAN_CTRL register range 0x1E–0x64).

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v7:
- PATCH 3: Fix four hot thermal zone trip points declared as passive type instead of hot type.
- Link to v6: https://lore.kernel.org/r/20261015-add-thermal-t7-vim4-v6-0-37d1c954390c@aliel.fr

Changes in v6:
- Rebased on next-20261014 (patches 1/8 to 4/8 already applied, dropped from this series).
- PATCH 2: Add bus clocks and clock-names to all thermal sensor nodes.
- PATCH 4: Change cooling device map min and max values from 30-100 to 1-5.
           The driver maps (0,1,2,3,4,5) to (0,30,40,55,75,100)
- Link to v5: https://lore.kernel.org/r/20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr

Changes in v5:
- PATCH 4: Remove unnecessary variable and coding style alignment
           according to Neil's feedback.
- Link to v4: https://lore.kernel.org/r/20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr

Changes in v4:
- PATCH 4: Extract SM and syscon setup into amlogic_thermal_probe_sm() and
           amlogic_thermal_probe_syscon() removing amlogic_thermal_initialize()
           from Daniel's feedback.
           Also fix pre-existing bug: move calibration readout before
           devm_thermal_of_zone_register() to avoid reading uninitialized
           trim_info, according to Daniel's feedback.
- Link to v3: https://lore.kernel.org/r/20260421-add-thermal-t7-vim4-v3-0-a2e7215ed003@aliel.fr

Changes in v3:
- PATCH 1: Replace second if check by an else statement.
  Remove unnecessary label in example according to Conor's feedback
- Link to v2: https://lore.kernel.org/r/20260413-add-thermal-t7-vim4-v2-0-1002d90a0602@aliel.fr

Changes in v2:
- PATCH 1: change two const entries to enum, explain why sensor index is needed
  reorder conditional compatible for required, and fallback only according to
  Krzysztof's feedback.
- PATCH 3: Add kerneldoc for meson_sm_get_thermal_calib exported function
  according to Krzysztof's feedback.
- Link to v1: https://lore.kernel.org/r/20260410-add-thermal-t7-vim4-v1-0-19f2b8da74d7@aliel.fr

---
Ronald Claveau (4):
      arm64: dts: amlogic: t7: Add cooling cells to all CPUs
      arm64: dts: amlogic: t7: Add thermal sensor nodes
      arm64: dts: amlogic: t7: Add thermal zones
      arm64: dts: amlogic: t7: khadas-vim4: Add fan cooling to thermal zones

 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 102 +++++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 253 +++++++++++++++++++++
 2 files changed, 355 insertions(+)
---
base-commit: ab8eada9868faeee95f25d81d3d6fed0d1c98b78
change-id: 20260410-add-thermal-t7-vim4-00e571badcc1

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>


