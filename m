Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794654548;
	b=OZWwLd4uwCwna4yuN8OKlZVQ8QA+TG0aKgpFfUNFExzKNEQvisf1v7o4VuZxdH511eW1
	 metYqiBteng08kstW70x0sthJ3h10uNhQqHpr/fijni032JlJOLhMi0uR6RYPU2MbQc98
	 +QbdoVKPJl8nzVkZYS7vdGeXdY7XM8UGTAsYZ0m9lApbMzegpgYVie+/4SBt7m7AF3QuV
	 yGZRHjrFw/8KxqIdr08JTTog2gpQnP7IaFcU7nPxco3COKGRNhT3JLmYNX38a4TwA1szf
	 FdTCxy/qt9t5CErwm73/7egGZOVLXL72g1K8kN6QdKV58mI0N/sN9VG3k7SjAWfdtbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794654548;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=yKa/SJsZoy3L77tACjfE73Ev0l/hJb0jpU91mGNVzAk=;
	b=m79TxLp65d/EtMqjmj6maZHg6nYBD7+K4yyELC1R64aeBigjy8fGaXwa+sR/v38GtC7A
	 FKE7ZJsJc/oOMLazySMz4H2QmuOk8Nzwffv+DfwAO0dvjpfTjHOLB89CmcHzRusC2qQ7K
	 Tp3m/2KTBS6yAx2tnYIKoPQN+Z0MYwr5II/0fkByDr5WtQZMv/Cr2p87go0wn2ZJB4jJJ
	 R2DIrCymkOYwj+dkHjh/Su9g4eUTecsa2Ht4QO05Tye5CbSrhFbNwE0xrR5msejr1JEKs
	 wJ4zQqmlKip/F9atNBwJQbZAoKnAyHruWYNK338M4FB27ME6hknRZvzLfuFfqz9CB0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D479D606A332;
	Sat, 14 Nov 2026 11:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D479D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSBct-000000003wW-0j3P;
	Sat, 14 Nov 2026 11:08:55 +0000
Date: Sat, 14 Nov 2026 11:08:51 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, Marc Zyngier <maz@kernel.org>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] media: rockchip: rkvdec: add support for the VDPU346
 variant
Message-ID: <cover.1794654074.git.daniel@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This series adds the VDPU346 decoder of the RK3566 and RK3568 to the
rkvdec driver, for H.264 and HEVC. It continues Christian Hewitt's v3
[1], whose three patches are carried unchanged; in the v2 cover letter
he offered to pass the series on. Patches 3, 4, 6 and 7 are new and
come out of a comparison of the driver with the vendor kernel driver
(rockchip-linux/kernel develop-6.6, drivers/video/rockchip/mpp) and
the Rockchip MPP library, followed by conformance runs on hardware.

Fluster on a NanoPi R5C (RK3568B2), GStreamer 1.28.7 v4l2sl decoders:

  JCT-VC-HEVC_V1   142/147
  JVT-AVC_V1       129/135
  JVT-FR-EXT        65/69

HEVC failures: PICSIZE_A/B/C/D_Bossen_1 are coded at up to 8440 luma
samples in one dimension, beyond the 4096x2304 limit of the decoder.
TSUNEQBD_A_MAIN10_Technicolor_2 has unequal luma and chroma bit depth,
which the driver rejects for every variant.

H.264 failures: CVFC1_Sony_C, FM1_BT_B, FM1_FT_E, SP1_BT_A, sp2_bt_b
and FM2_SVA_C fail in JVT-AVC_V1; the Hantro G1 of the same board
fails the same six with the same GStreamer. In JVT-FR-EXT
Hi422FREXT17_SONY_A, Hi422FREXT19_SONY_A, HPCAMOLQ_BRCM_B and
HPCVMOLQ_BRCM_B fail; the two BRCM vectors fail on the Hantro G1 as
well, the two Hi422 intra profile vectors are not understood yet.

SAODBLK_A/B_MainConcept_4 and FREH10-1/2 are counted as passes: they
decode correctly and exceed the default 60 s fluster timeout only
because the checksum is computed from an uncached mapping of the
capture buffers.

Patch 4 is what makes the score deterministic. With the read caches
left in their reset state, RAP_B_Bossen_2, WPP_D_ericsson_MAIN_2,
WPP_D_ericsson_MAIN10_2, WPP_E_ericsson_MAIN_2 (HEVC) and
CAPM3_Sony_D, MR8_BT_B, MR9_BT_B, NRF_MW_E (H.264) produce wrong
output in three runs out of three; with the patch they pass in three
out of three. This is likely the source of the artefacts reported
against v3. The function is shared with the VDPU381, where the cache
block is mapped by the binding already; the patch has been run on the
RK3568 only.

Decode rates with the series: HEVC Main 2160p 92 fps, Main10 2160p
77 fps, Main 1080p 380 fps, H.264 High 1080p 197 fps.

On the row and column buffer sizes raised in the v3 review [2]: the
MPP library uses one vdpu34x HAL with one set of size formulas for the
RK356x and the RK3588, so the variant keeps vdpu381_rcb_sizes.

Known limits, none of them introduced here:

- FFmpeg's v4l2-request hwaccel does not set the HEVC EXT_SPS_ST_RPS
  and EXT_SPS_LT_RPS controls, so HEVC through FFmpeg decodes wrongly
  on this decoder as on the VDPU381 ("Long and short term RPS not
  set").
- A decode error on such a stream ends in the IOMMU page faults and
  the oops reported against v3 [3]. The cause is in the error path
  shared by all variants: the interrupt handler restores the IOMMU
  while the watchdog is still armed, and the watchdog starts the next
  job while the IOMMU is detached. "media: rkvdec: Handle interrupts
  without a current context" [4] covers the oops; the remainder will
  be addressed separately.

Patches 3, 4, 6 and 7 were written with the help of an LLM coding
assistant, which also performed the comparison with the vendor
sources. It was asked to review the v3 series against the vendor
driver and to complete it; the conformance and A/B runs above were
done on the board with builds of this series on Linux 6.18.

Changes since v3:
- Add "media: rkvdec: vdpu346: Limit HEVC EXT SPS RPS dimensions"
- Add "media: rkvdec: vdpu381: Program the read caches"
- Add "arm64: dts: rockchip: rk356x: Order vdec regs by address"
- Add "arm64: dts: rockchip: rk356x: Clock the vdec at 400 MHz"
- Add fluster scores and failure analysis
- Add Tested-by from Diederik de Haas

v3: https://lore.kernel.org/r/20260110053727.2295260-1-christianshewitt@gmail.com
v2: https://lore.kernel.org/r/20251226113140.573759-1-christianshewitt@gmail.com

[1] https://lore.kernel.org/r/20260110053727.2295260-1-christianshewitt@gmail.com
[2] https://lore.kernel.org/r/DFL5TY0QQNMN.1RS04UM9D1V8S@cknow-tech.com
[3] https://lore.kernel.org/r/DFRU6ODDM71P.3NQGLRK8IVDUY@cknow-tech.com
[4] https://lore.kernel.org/r/20261026124808.642373-1-a.kazinsky@ideco.ru

Christian Hewitt (3):
  media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
  media: rkvdec: Add support for the VDPU346 variant
  arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X

Daniel Golle (4):
  media: rkvdec: vdpu346: Limit HEVC EXT SPS RPS dimensions
  media: rkvdec: vdpu381: Program the read caches
  arm64: dts: rockchip: rk356x: Order vdec regs by address
  arm64: dts: rockchip: rk356x: Clock the vdec at 400 MHz

 .../bindings/media/rockchip,vdec.yaml         |   2 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  49 +++++++
 .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     |   2 +
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |   2 +
 .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     |   9 ++
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 121 ++++++++++++++++++
 .../media/platform/rockchip/rkvdec/rkvdec.h   |   2 +
 7 files changed, 187 insertions(+)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0
