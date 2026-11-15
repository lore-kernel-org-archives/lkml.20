Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794786654;
	b=jk2nElMGKL8BctMR4vJv+r02aswZXwG6oqz/BoUUBLO5cnt03o2Mje43fNJ90UuaB/uo
	 oxNs5kKHIZJ//LqasHAcxgSuIJk9UeXgI065uDW20+CvWM70brItU1NszVrFzBw5DX26X
	 AMqZMoMg5/kGxgoFji6EUKbusNT8PZciToNQg0QcIeyA3r/47H2t1GRpYkSLsBi0tBVOV
	 KVMbxDuQteeURs914AoBC71D4BHL+o5b7TX1+UTFvPE4xrhctf6YC7363EeF1jNrs2PoZ
	 qLpqfubsbWDqMdX154QBN7UTOgzRl8pvdgWuoGejuBY5QmsewFAnVcdct0PwU038GqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794786654;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=KDQG0e8nVhyMO/da5AFDd/LdB0OiOkRMe2l13ro4UUw=;
	b=v65h1+455Mg38Bf/UtD/PgE2UZFV8BvvPF82WTLKl8hJtPZIM2KfsnqgkINpSG64RQG0
	 p1fecWnQclsRXlSAfbpvSKLuOBEb8nJF8EJTyT7yMO7BGgv0k+6QRexjJWJuwXbM61U35
	 L3iGiqTXeOd48awGFiE19nN4CJBrCRFRIdUIgL7TIUFBndDGQ+WyENNjqkKx8SanGZyXd
	 hRLmBw31ZrHN5zAMNFL9wkNg7PKmqqkXkf6+I2ztrAnxgDckra4ZoMw6MR5P+mM4MwTV4
	 4f7hMIiRXRu64+Z5uWehLUhQ2+ZaSg3TyyCy3plYM8yUx8gdnqmq1MTB9EFOMtaWDOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iOJ8j4gP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A410C606A329;
	Sun, 15 Nov 2026 23:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iOJ8j4gP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794786654;
	b=0IelYe+nY5ScizVdmtjyWDxAfPNpN7p1fXcJuraddP2nCbypDYWNE9wT9jV+p2Hseyjb
	 8jm+/Z0H2ErNHfbB/WcGqvS1wRR2ZrL574P640uutvHGVg4fUvyWtV2yqyvSIMc+4h6rn
	 SACqojIi1BmzyvIQOto/mZBPxHjfoN03tNdVP+1SweaZf5pH8aKvehbpLKe6IobM+U/Sx
	 I4ew/b72G798dhTUmyU+7PF0K5zj0Q3PllZyrkNv/CN82mcqmMQmfUYhfFAYhBhLDRjna
	 ZhaVmR3kBytS+WRS/y2bIIWjEB1RYpxH4ZR+QnbrP/1wvuGDZ0zKs6Ri/aazBRQWF6g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794786654;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=KDQG0e8nVhyMO/da5AFDd/LdB0OiOkRMe2l13ro4UUw=;
	b=sXxVabZz6WZ+orZh2f8PXjTJ1kF37mjU9vZE538LEGqqkuafksnGfvXQV9dT9LDf3BQP
	 JZJ59rYHosVPRvScq7B1i7H5csK/5FmuUn7wJ00yzST927N3/1QzdXBidPnwb2u5xmuCV
	 peHAl7aGgYVp2EbwdtjCL/UgceoJU9YxnhiuTLz8yOI6tCfbnemnSNFz5nDd7U6+tueKG
	 G+zqmvAxf7MxfrbRFSic6dTWOtUeR6UdnDsy8j3+XTBSx5/WX7v5Umxx2ZepE7QFS8U4J
	 Uu/s4KUm1pyDg3Bec1P5xcn7488EAd6HAqJeMjPvZEvM6fVV8GaBL35v7MSTbSgWnCQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F7A11F000C4;
	Sun, 15 Nov 2026 23:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794786654;
	bh=KDQG0e8nVhyMO/da5AFDd/LdB0OiOkRMe2l13ro4UUw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=iOJ8j4gPljH84EKoDyUntcbgYQ3CHOh407G42F0J83Yqyhruv8xvUrYBgNE5lJCpZ
	 SMPsLDDDT56iaO8it4HQm+4N2lHZ/FTB29L3FqL3p9M2TECCMp9/g/KVaxwW7IIoF0
	 y0nvaT+Prky06vb9jWXF4+KZv8Qe7iTXlOPcdJLPRcZmanhFrAaHganzXl8IW1TVH3
	 I8Nebp9xoYSIocMKJ0G5Sv4l82yMK8fhfQffPPA59R7brYo48pHhOYrIAp+BJGSGtr
	 ZNAulC6+t0tKW3DPrLzTicUuQ4s/km61jjHw/JZU2pDl9fFzGqUeGIijrJLd1YXpIU
	 BfmyvU/Uxh4ag==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BEDD94A27C;
	Sun, 15 Nov 2026 23:50:52 +0000 (UTC)
From: Cristian Filipescu via B4 Relay <devnull+filipescu.cristian.gmail.com@kernel.org>
Subject: [PATCH v4 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS
Date: Sun, 15 Nov 2026 23:50:52 +0000
Message-Id: <20261115-sunxi-orangepi-3-lts-v4-0-7749b448a4dd@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAFxF+moC/4XOzQ6CMAwH8FcxO1uDZSB48j2Mh20UqEEgGxAM4
 d3d8MLFePz349cuwpFlcuJ6WISliR13rQ/yeBCmVm1FwIXPAiNMzxEiuLGdGTobej1DDM3gQMY
 6R5SpyqgQfrW3VPK8sffHN7tRP8kMwQoTWjkC7RVTh1LD7ThDKIZmzW7o7Ht7asKA/Lk/IURwi
 XSW55igSdWteiluTqZ7iXB/ivdI+gOJPZJnJZWyvCTnTO6RdV0/GibFPiwBAAA=
X-Change-ID: 20261022-sunxi-orangepi-3-lts-43b92246a8ed
To: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, 
 Cristian Filipescu <filipescu.cristian@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794786652; l=3513;
 i=filipescu.cristian@gmail.com; s=uboot-20261021;
 h=from:subject:message-id;
 bh=WV5vutgoFlQy6uYyONZ4XLW0FK70zltboXYWtatPJRY=;
 b=5SiuciC0S2s4eefcUNmzApMh/+Q35Y9p1hRymZ6jmEhMCsQ5jQ10FkFkLaQuya5+CXcsOiHEq
 d5RPcl0ddTKDcmHFStR0KLQc7QvxVnGozYZp7nx1cyKLi9wjrgAtSOn
X-Developer-Key: i=filipescu.cristian@gmail.com; a=ed25519;
 pk=o7Ui0tU3x+X/6Pq6PZHmd2KFtOdPWttoPuNFOvdD8t0=
X-Endpoint-Received: by B4 Relay for
 filipescu.cristian@gmail.com/uboot-20261021 with auth_id=1255
X-Original-From: Cristian Filipescu <filipescu.cristian@gmail.com>
Reply-To: filipescu.cristian@gmail.com

Continue Jernej Skrabec's April 2025 series, adding the board compatible
and device tree for the Allwinner H6-based Orange Pi 3 LTS.

Use the common Orange Pi H6 include and describe the LTS differences.
Follow the schematic's LED roles, describe the shared CPU supply on all
four cores, remove unused USB ID detection, and use generic PHY discovery
with bus-level reset. The binding patch is unchanged.

Board testing on the current v4 description verified LED names/defaults
and drive strength 10, all four CPU supply references and the shared
cpufreq policy, and BLDO2 enabled at 1.8 V. eMMC negotiated 8-bit HS200
at an actual 150 MHz with 1.8 V signaling; 768 MiB of sampled direct reads
matched across three passes, with unchanged settings and zero reported
MMC error counters. Generic PHY discovery passed five interface cycles
and three MAC rebinds both with and without temporary PHY-ID logging.
Each run obtained eight DHCP leases and 24/24 ping replies at 1 Gbps/full
duplex, with physical PHY ID and 125 MHz clock configuration read back.

The schematic trace and a 1.8 V measurement at RW1 relative to board
ground support retaining BLDO3 as the Wi-Fi I/O supply. This does not
claim functional onboard Wi-Fi support. DTB build, schema validation and
strict patch checks pass. The submitted DTS matches the tested generic
variant; diagnostic kernel instrumentation is outside the patch series.

Codex assisted with DTS updates, review analysis and build checks;
Cristian performed the board tests and voltage measurement.

---
Changes in v4:
- Base the LTS description on sun50i-h6-orangepi.dtsi.
- Inherit red PL4 as power/on and green PL7 as status/off, keeping the
  existing H6 labels and drive strength 10.
- Describe the shared CPU supply on all four cores.
- Delete inherited USB ID detection for the fixed host-mode controller.
- Drop the explicit PHY ID after generic discovery passes interface and
  MAC rebind tests with and without temporary PHY-ID logging.
- Inherit BLDO2's common always-on policy.
- Keep common regulator/clock names; defer naming cleanups.
- Update the validation results and explanations in the review replies.
- Link to v3: https://lore.kernel.org/all/20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com/

Changes in v3:
- Keep green as power and red as status, matching Armbian LTS roles;
  default green on and red off without a boot-stage sequence.
- Select drive strength 10 on PL4 and PL7 with per-LED pinctrl states.
- Move PHY reset to the MDIO bus, before discovery and outside detach.
- Specify the YT8531C PHY ID; MAC rebind fails with early autodetection.
- Enable 1.8 V eMMC DDR52 and HS200 after board testing; retain the
  existing H6 maximum frequency of 150 MHz.
- Shorten the descriptions and update validation status.
- Link to v2: https://lore.kernel.org/all/20261022-sunxi-orangepi-3-lts-v2-0-70b899252c6a@gmail.com/

---
Jernej Skrabec (2):
      dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
      arm64: dts: allwinner: h6: Add Orange Pi 3 LTS

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 188 +++++++++++++++++++++
 3 files changed, 194 insertions(+)
---
base-commit: 4403278e4ea2f654f8130a5c03eb8b4516a0f201
change-id: 20261022-sunxi-orangepi-3-lts-43b92246a8ed

Best regards,
--  
Cristian Filipescu <filipescu.cristian@gmail.com>


