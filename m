Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794381591;
	b=T18h2kAlmKSvm6Bsq2hx0hs887rvT0JuD4iTDlXjErZUD1gaDPg4r3JdUbqIQrQlURuU
	 xhJzcVxjmj45VJUq6jGPtlD61CLqQGAglybVkC8jGXbDFjKSqBgQ/3wkbGKNTpHD1kZpg
	 9v5u6tdVKGVEWePvjSbyG/3AKHemNIPqoFOBcqjMY85vaEs0ZjRyQkOR8qhcBwqOGuBmt
	 fj+GzBbeRYhlmTMDfrNugdQK8pGPlJQYIvdLWrg6RFvPzwPFzixgpI5yV+FfV6ttiN/av
	 5DqjFVP9pr7euB4J7dSRTJe/HHbml/rcdyo2FKq/2Hu0hEx/GHs7FWkZSefD3r5FnGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381591;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ovE7yiffLIIhAIa4LY1tvnEiiCJ92mbc38eNtWd4DjM=;
	b=EQhNAfDsPfW0w5aN+Hvp5fMuf5si6+vmzNkaS2s+KzO74CDKw5VghgeKWc+FvQUSiQiE
	 ufELG+PS8UJ9yIqeUcK9lDGwaGz4C7ts7VMF8q/e3+wIPj+DOChZP4Ay3Tkud5tajAQIz
	 HJj59bC5VaOwkN6gOBvTMmzj1mAktPySEGuYqUZyejw0xHzohHBvMe5k+Y8EKCkjN3KFY
	 C0KbnFgJsijVc+eooj1PEBCBFl0TZly3As1iZkdmQZFsRiYArnKpeIWLJzIuzd9R4yiO/
	 8K2IAy0J6HAfLLYuDLw3eEYtDmHL/0DYPqo6ME3ZLBvlFcqXjcZ4JvoiBibTk9oQKfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jkz/8PfU";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24E8606A320;
	Wed, 11 Nov 2026 07:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jkz/8PfU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794381590;
	b=MskO5wm2d+unnpuCo1t2NtJ3i6dnhp7qyrrX0pvTy/9H4EBJRbWPsqPAYaVCAkJxwks2
	 VlUtiBJla+T8TZsRtb+fqB/5yrFyb2Beps9sWr642L4WIwg4bAgHnG7sikkv73ZebkKvU
	 tiWa/HiuqQ5I6CkdTvOftgOs/VmAEn5yUKronmOLPAwmQ5pTbYeI7OO99LyySHqquRGRN
	 3z4KfiXDEZodGxspTzY07YQBRN6bE2c/cQOCaZHPVyZOOiikbWWHGuB607Vb3mqfOjMs3
	 r2qXtSQgClr/Yg0dED0S8oI1VM/uS6WT3Z6z4uxknO7Nm9UP8Yx+hXyUNPJlvxr/Bkw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794381590;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ovE7yiffLIIhAIa4LY1tvnEiiCJ92mbc38eNtWd4DjM=;
	b=RsTc1DDPF84lFFC9hTnTllPdJPUhnryAXeh95QpvgKX5uyj4LuaXehRY/rnS0266kfJe
	 APAQ9XfRv4PIOqifAycdJSd3ZGugPIMZOBkXNiUMbvbQ5I134zBpqw1bwdyCDk1LAm25U
	 SesSi2jx21WX/xgaGX/IJxhxDktu8VgQ7L9uChsJQf1xSdrl2CGmnmWJO5vkv0xB6PDNZ
	 jKHiwCeuqffPSYFz7gDUEjP3AY5X/x7hFRVHfk2HQdmN8FfuvuT2GCs17D9Z5P1/56Gc+
	 GWObiUauevUxiRBh5UWeMpVOIbDA8tG28r0nHG2WpyC+BwhAEDQripG0S+dXMW0oaqw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A3B11F00A09;
	Wed, 11 Nov 2026 07:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794381590;
	bh=ovE7yiffLIIhAIa4LY1tvnEiiCJ92mbc38eNtWd4DjM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=jkz/8PfUgw1Xc8bVk8d26XbU64nM3X8cBelmRJC3sS23kr2ngurKcrMao+tjSDgGb
	 Ertv7NKLdKy9B3Ss3AoIdaYburJt72f6f9yW1do1O8ctfOo+ngmOXfKfvCmDYksx9C
	 RZZoAK1WsZoBHsxsQ+JDAvF6u41DUPxxgmauMQDhPiO5Ua0IM5tVzMqhHorWLHK7cK
	 zNXcsj5XjaSuLao1dat5PNvAZ/+Hr40kHXCdlrLc7K9u2/zT2iL6cZHY2zVcCbySrQ
	 y1jcHz0opTOVYncIxu/jGrGj6+bcvO1QnkUQ5pKFWMx3YLMVIFCj9Z992P2Kb89Ucy
	 k8NRhelU5fbgA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A0B6F48E45;
	Wed, 11 Nov 2026 07:19:49 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: rockchip: Orange Pi 5/5B ethernet, SPI
 NOR supply and USB-C DP
Date: Wed, 11 Nov 2026 07:19:48 +0000
Message-Id: <20261111-opi5-dts-v2-0-821f666418a6@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBAFf4Xs2Zq2lIKc/A/DgZYV1gglbSUaw
 r9L8epxknnzVgjoCQPU2QoeFwrkph3kKQM7tFOPjLqdQXKphRCcuZkK1sXAlKlydRFWl1zDrs8
 e7/Q+Urfmx+FlHmhj2idjoBCd/xxfi0jen+wiGGdFJY3OO14qg9d+bOl5tm6EZtu2L2ThTmOyA
 AAA
X-Change-ID: 20261110-opi5-dts-4b83491c6706
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794381589; l=2877;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=415eeljqGNLq4ZK/3uBjgk+J8UfR3jvxbnBfmkS6B8c=;
 b=X9l+smzA8X4BIIIaehsCojbXz6seaLG1tWy8KFhT27mk89+u17gqsRsneWwk08F7iAOv0OXJA
 xSXciD+gSVCCB+X5NTwnXJ8RyC41Cla3+TmrNOqHj7orVD3Y/0Z5+yF
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

Three device tree changes for the Orange Pi 5 and 5B:

1. The YT8531C PHY on gmac1 is described as "rgmii-rxid" with a MAC TX
   delay copied from the vendor kernel; the PCB adds no delay, so the
   correct description is "rgmii-id" (as the Orange Pi CM5 already
   uses), with both delays in the PHY.
2. The SPI NOR flash gets its real 1.8 V supply instead of a dummy
   regulator.
3. The USB-C port gets DP Alt Mode: the FUSB302 connector advertises
   the DisplayPort alternate mode and the graph links the connector,
   the USBDP PHY and the DP0 controller. It uses only bindings already
   in mainline.

Tested on an Orange Pi 5 (RK3588S, PCB v1.2): with "rgmii-id" the link
comes up at 1000/Full and receives at 940 Mbit/s with no errors (with
"net: stmmac: dwmac-rk: only read the delays the MAC applies", sent
separately, the "Can not read property" warnings are gone too); the
regulator summary lists the flash supply under vcc_1v8_s3 and the dummy
regulator message is gone. With patch 3, a USB-C dock (DP-to-HDMI
converter, USB3 hub) enters DP Alt Mode in pin assignment D (2 lanes
HBR2) and its monitor runs at 3840x2160@30 next to HDMI at 4K60, pin
assignment D -> C -> D switches work, 100 of 100 attach cycles
configured DP Alt Mode, and the dock's USB3 devices keep working. The
driver stack used for that test carried the pending "USBDP PHY cleanup
part 3" and dw-dp HPD/Alt Mode patches; the description itself does
not depend on them. CHECK_DTBS is clean for both boards. The Orange
Pi 5B was not tested (no board at hand); it shares the changed .dtsi.

This series was developed with Claude (Anthropic) as a coding assistant:
it wrote the code and the commit messages, and I reviewed and tested
every change as described above.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Changes in v2:
- Patch 2: put vcc-supply on the existing flash@0 node in
  rk3588s-orangepi-5.dtsi instead of splitting the node across the .dtsi
  and the Orange Pi 5 .dts (found by the Sashiko AI review). The Orange
  Pi 5 DTB is unchanged from v1; on the 5B and 5 Pro the controller stays
  disabled.
- Patches 1 and 3 are unchanged.
- Link to v1: https://patch.msgid.link/20261110-opi5-dts-v1-0-582b63d074be@gmail.com

---
Arun Iyengar (3):
      arm64: dts: rockchip: use rgmii-id for the Orange Pi 5/5B ethernet PHY
      arm64: dts: rockchip: add the SPI NOR flash supply on Orange Pi 5
      arm64: dts: rockchip: Add USB-C DP AltMode for Orange Pi 5/5B

 .../boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 92 +++++++++++++++++++---
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi      |  1 +
 2 files changed, 80 insertions(+), 13 deletions(-)
---
base-commit: c3baae5f1a15645cddadcb2b9abddef5df291f59
change-id: 20261110-opi5-dts-4b83491c6706

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


