Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794847471;
	b=nsc44vfI7p94SXSutjEIszTDaYmtrH64rFI93nARM3tvEEUrBTKmAIgOPG0QkY9jxpX/
	 Ix0woSg4T1SzqHDVwVSFlccjEQJ0sqpwhjlpvnoIjhRJvZIlKs1gV7WuE0Xa5cyxdQLfw
	 i9iXUJEd8c/nrkfJ3+nhqi/agg7OZkllWTmmSlimnZQis5xtX4lGrTQIh0vIqXHUZDkNV
	 Ktf71Ov/bSf5FnZUffNNpaJcUgvCTWti3CGVDyOA/tzpp653yidvbf+H4hbXkl1PSLKJG
	 tf8ij3pa8L3ukzxrJSP/R3aaoDXj6bjxWb3vhk4VXt8DPicrLfbAfkabi7d/8VPdd2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847471;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=NuJNpyzWNAiJDac6VccZBImKZIpijp2CTpFH/1eZ/NY=;
	b=c3/ozK/HXWkgOG6QXAzxJWEfLFuGBWOyiwC9z8/sY2WtskmTfx+NaHP8dxPdDtAyp4Lh
	 tmc1qxANaaeYKOAhoa3HwyDIk5XmW92XOlOjnr75AMi8VdRmL73t8mwUzotMnAPN6HdnG
	 y4rzYkdPRML/J0Kj5elFWCxRuKZXjRexJlB2Ksfo0RoIpAf0bshVSbz3w3l2f/00emYRt
	 0HWgooLpfkXHFvCOreU5hgQt54lqEqKGb+6Z6C8eG+PM969+K3ZERZSufLsPBIF+awuhD
	 VhqXID6/A8xKewHAAOYCmiAx9cgd3prw+UIH4UCJGV1lwT27CuRVLMdmKMA2SELrQsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f6Xrs8iv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479DF606A32A;
	Mon, 16 Nov 2026 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f6Xrs8iv
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794847471;
	b=mx7u4P2IhTPvVuquB600Ja5NVej+h4cn97vo4Jvc0IDqeDYJ/8cG9ERr8o7rs1fizVc3
	 UJjfJHkzDGwbewbtSK6LpybDP7SGaVCDctTpgfjGxw+MQPUdSkDJ3GyuSufcbeAAx/7Yp
	 Mo8rMHt785bVjVoqm/q99FflOzP2HsmunpcwqdDnJ8FHd/LFcIBIwlaj2CDK4eV9agFzR
	 EwWu8vkeZNnUeMiFs/E1ENFKOMwHSFMKQBjNocCPkxz5iMg5bAGfSAE2h54ZKEsuvKHAw
	 pD3beOFMfc8Rh4px8TAVo3dmH8gKTKwcSN2tIai31HDq2l56nwdUF+WSBlRjo9qgMwQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794847471;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=NuJNpyzWNAiJDac6VccZBImKZIpijp2CTpFH/1eZ/NY=;
	b=PiJ8wb7q67UvVr6qZRp1+zPkiMb1r0x+eEzNNBHseC2otI8/UqheVUn6DW0bEqszjiqS
	 wV1lmRlmp5CJhc7L/bdFCD6f63s4A6rnwb64CUSio9DpcgaXWGdUxwvHM5OTLnuLhMvxY
	 iRlZDFkmWmdd7EOtdJ456VuOPGJYiP6F31V1vvA98ymApnjBZVZOYB9EaNSgYg93dCFb9
	 k6L9BDnf/Tjd3qno0oRtgvz/an2LQSrO7KsxZG+ZQ1jCPdTIkQPcWvs9ThG5bq71hRtH1
	 EfK9PlW93U35qTvBQjKwQ4NM13ktckoA0XDfTtwBH+LAht6plcUNw7N71AgefP10skg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8598D1F000C4;
	Mon, 16 Nov 2026 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794847471;
	bh=NuJNpyzWNAiJDac6VccZBImKZIpijp2CTpFH/1eZ/NY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=f6Xrs8iv1Z+KL4ovXkaQkd0O7evk5WPWdtkHhMSUhjHgOOEOIsoGRlR5DXxDH0Vnk
	 KE6KryS2KoZPv+4SByrmX5nRAXoyXkwIHW+aLH6o+8mxZMXdX6w7bGQuID6qB0dSdh
	 e7MonUbg8HDph6abKO1sfGa9VFNrnbS2uBMWFle1yfJE+TyROR4wu6vDNRkEp3zUGa
	 7z1GUbMOE6n/fIEY7nK37EmVwdy/bFZPI7ygkVdZPtpuSPSeGpTVMu8b6IcYrTNWwF
	 K14lAkyKaflPPWlrZavHusQPZNF763fZRyCbJ5BGuPqlJYD3Zd5lNAtw63r/naNQwo
	 soKO03dorvE5Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DA8C64A519;
	Mon, 16 Nov 2026 16:44:29 +0000 (UTC)
From: Cristian Filipescu via B4 Relay <devnull+filipescu.cristian.gmail.com@kernel.org>
Subject: [PATCH v5 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS
Date: Mon, 16 Nov 2026 16:44:29 +0000
Message-Id: <20261116-sunxi-orangepi-3-lts-v5-0-979cf5474913@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAO0y+2oC/4XOzY6CMBAH8FcxPTsbGAZoPfkexkNbioxBMC0Qj
 OHdt3UPazYxe/zPx2/mKYLz7II47J7Cu4UDj0MM5X4nbKeHiwNuYhaYYZVniBDmYWUYferdGQr
 opwBUGIVIlZauEXH17l3L64s9nX9ymM3V2SlZacLo4MBExXap1PMwr5CKqdlxmEb/eD21YEL+u
 b8gZFBnRiqFJdpKHy83zf2XHW8i3V+Kd6T6gBQRUbJ1LbV1mUv6i9AvkuflB4TSJzUpQyQ1Nc0
 7sm3bN+CxQalxAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794847469; l=4684;
 i=filipescu.cristian@gmail.com; s=uboot-20261021;
 h=from:subject:message-id;
 bh=yvbbvDA0lpxvYsV9tvrk9UhEBzJNM75uNkRtwsHky1E=;
 b=pEXRpO2C8ZUCd2NuLcdZ/mwWYqmMVp+vidTtr7CVR3gtCg23IbQ8bt05ZXB51N35XDQaDV3ZZ
 n94jCQShLKhA/scD/5Y/WrM1SEQ6Ey5v5l2zjhp1nIJDFtaD8b5kZck
X-Developer-Key: i=filipescu.cristian@gmail.com; a=ed25519;
 pk=o7Ui0tU3x+X/6Pq6PZHmd2KFtOdPWttoPuNFOvdD8t0=
X-Endpoint-Received: by B4 Relay for
 filipescu.cristian@gmail.com/uboot-20261021 with auth_id=1255
X-Original-From: Cristian Filipescu <filipescu.cristian@gmail.com>
Reply-To: filipescu.cristian@gmail.com

Continue Jernej Skrabec's April 2025 series, adding the board compatible
and device tree for the Allwinner H6-based Orange Pi 3 LTS.

Use the common Orange Pi H6 include and describe the LTS differences.
Follow the schematic's LED roles, remove unused USB ID detection, and
use generic PHY discovery with bus-level reset. The binding patch is
unchanged apart from rebasing.

Rebase onto sunxi/dt-for-7.5 at 098728144545. Inherit the common CPU/GPU
OPP tables, CPU0 supply, regulator ramp delays and CPU maximum voltage.
Remove the LTS CPU0-CPU3 supply blocks and redundant regulator overrides;
retain the LTS CPU minimum of 800 mV. The resolved OPP tables, voltage
limits and ramp delays match the tested v4 description. The new base
also carries the H6 video-codec SRAM/IOMMU changes.

Hardware results reported for v4 remain historical: LED names/defaults
and drive strength 10, shared cpufreq policy, BLDO2 enabled at 1.8 V,
768 MiB of matching eMMC HS200 reads at 150 MHz/8-bit/1.8 V with zero
reported MMC errors, and generic PHY discovery passing five interface
cycles and three MAC rebinds both with and without PHY-ID logging.
Each Ethernet run obtained eight DHCP leases and 24/24 ping replies at
1 Gbps/full duplex with PHY ID and 125 MHz clock configuration read back.
The rebased v5 description has not been boot-tested.

Following review, Cristian measured 1.8 V directly at U60/AW859A pin 22
(VDDIO) relative to board ground. The earlier connection trace was from
the schematic; the module-pin result is separate from the earlier RW1
reading. It is consistent with retaining BLDO3 as the I/O supply.
Functional onboard Wi-Fi support is not claimed.

The LTS, Orange Pi 3, Lite2 and One Plus DTBs build with W=1 and pass
validation against freshly generated schemas. The board binding and
strict patch checks pass. Diagnostic kernel instrumentation is outside
the patch series.

Codex assisted with DTS updates, review analysis and build checks;
Cristian performed the v4 board tests and the direct VDDIO measurement.

---
Changes in v5:
- Rebase onto the latest sunxi/dt-for-7.5 (098728144545).
- Inherit CPU/GPU OPP tables and CPU supply from the common include;
  remove the board-local CPU0-CPU3 supply declarations.
- Inherit regulator ramp delays and the CPU maximum voltage; retain
  the existing LTS CPU minimum of 800 mV.
- Keep any shared all-core CPU-supply cleanup outside this board addition.
- Report the requested direct U60 pin-22 VDDIO measurement of 1.8 V;
  retain the existing BLDO3 assignment.
- Distinguish v4 board results from v5 static validation.
- Link to v4: https://lore.kernel.org/all/20261115-sunxi-orangepi-3-lts-v4-0-7749b448a4dd@gmail.com/

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
 .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 164 +++++++++++++++++++++
 3 files changed, 170 insertions(+)
---
base-commit: 09872814454580dad9f04fb194a7befe0fd6e94f
change-id: 20261022-sunxi-orangepi-3-lts-43b92246a8ed

Best regards,
--  
Cristian Filipescu <filipescu.cristian@gmail.com>


