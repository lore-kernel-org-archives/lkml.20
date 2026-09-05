Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F653D5236;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788600558; cv=none; b=deAKdBRGjknsTNUiawKOp9BDoE/QnJcb+ZClyBJMKFisec1YAa/j2oNLfgEwjHfNPXFi7a7Zpr4uw26SzjNZDX4D5froWSo1ZsHV9YqEU9eyaiU6FyJolE6KZ35BhiJttzoHSdkbBZqIDl/S/XJxC3DBkQ/lW5NQ4BQ9Sz53IYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788600558; c=relaxed/simple;
	bh=002QRWWTWJ51HFztLj3s0HXrMVYjCFS25RWD/f77lTI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F0GkK7tl3nRgtKIjo+HWiKUKkpmCnqPEcag1D0OhLabX4Ls0Upq7tA4qCI+MlkAw4rw3Q9DXByKO6X0Shsxh9WJpjL07cJTEe7mvvYBc/HkL0funlTSxwChVfIFjjbZqVD+9KQMLo4ej1+u5DlOYEmR/PevXxrROoXETVntgeP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMX2lQcn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMX2lQcn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BD77C2BCB3;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788600557;
	bh=002QRWWTWJ51HFztLj3s0HXrMVYjCFS25RWD/f77lTI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QMX2lQcnvIWuTBpRFXvPwCZ8HqjamFrluK3YiDQR8sj2BpRNlLBTsLPGZpLHvfAeQ
	 aNLDB+mJck3pijzsmi+r8BIgk4spkYNQmhd6BIHm0p1rLU1dJMK4ZPDu9EPrEFycNS
	 Km/4XMaxJrJazn6858E/IEU8d4ZXT8yIfYcW9GpWulwr4zwfl+DBIUUpV1PeFDi9mP
	 KUTuwqMyCW8prq4HXwcQUQ98IxG9btyhRP/37DuzcmhEkFdtY++x0cia5+4CaDx/Bi
	 pFItMwvWSlrq3B5zJ5yvh1iMv46rRto2DafJqAleaf2Mf70YeCKTZEmvhcvFo1OS21
	 b84UGTmSikn9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F990C624D3;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
Date: Sat, 05 Sep 2026 11:28:55 +0200
Message-Id: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MywqAIBAAfyX23II9jOxXooPkWnvIQiWK6N9bO
 s4MzAOJIlOCoXgg0smJ9yBQlQXMqw0LITthqFXdKaM0XpUYsjOFHAk3DoxHpJzZ32i1a1rjeqN
 bD3KQ4Pn67+P0vh/JascCbQAAAA==
X-Change-ID: 20260905-x1-ideacentre-mini-prettify-a5d349d8954f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788600555; l=2740;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=002QRWWTWJ51HFztLj3s0HXrMVYjCFS25RWD/f77lTI=;
 b=6E4nAPWSta2QpvQ90KLyGjveyG1YSHrs4M96Z4uUf/2yXPTL4Xm5hi0ANfax+NNFuDw3iB+6T
 VZqDZPi1BE7DG9jsyyWYYcH056Gri39Ir6MT1n6Hhc3/3KkI7/YOytV
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

The IdeaCentre Mini 01Q8X10 (board 91B6) ships with two SoCs: Hamoa
(X1E80100), already upstream, and Purwa (X1P42100 / X1-26-100). Same
chassis, different silicon. Stubble and the DTB loader need distinct
compatibles.

This series splits the board description into
x1-lenovo-ideacentre-mini-01q8x10.dtsi and adds thin leaves. Each SKU
keeps lenovo,ideacentre-mini-01q8x10 as fallback:

  lenovo,hamoa-ideacentre-mini-01q8x10, lenovo,ideacentre-mini-01q8x10,
  qcom,x1e80100

  lenovo,purwa-ideacentre-mini-01q8x10, lenovo,ideacentre-mini-01q8x10,
  qcom,x1p42100

No qcom_scm change; the fallback is already on the allowlist.

The remaining patches fix the common DTSI for both boxes:

- Build the Hamoa EL2 DTB like the other Hamoa boards.
- Second M.2 3V3 is PMC8380_3 GPIO5, not TLMM18. A 2 s startup delay
  is required or pcie3 fails to probe. always-on is a hack until there
  is a real M.2 power sequencer.
- sound-name-prefix on the three DP ports. Enable lpass_vamacro: no
  onboard mics, but it provides fsgen for tx_macro and rx_macro.
- usb_mp port 1 is not populated (no PTN3222 @ 0x4f). USB-C is
  usb_1_ss0; rear Type-A is usb_mp port 0 behind a Genesys hub.

The Genesys hub is left undescribed.

UCM [1] and AudioReach [2] topology for these devices are online, too.

Tested on:
- IdeaCentre Mini 01Q8X10, Purwa (X1-26-100), 91B6
- Hamoa: compile-tested only

[1]: https://github.com/alsa-project/alsa-ucm-conf/pull/843
[2]: https://github.com/linux-msm/audioreach-topology/pull/74

Assisted-by: Grok 4.5 (xAI)
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Jens Glathe (7):
      dt-bindings: arm: qcom: Distinguish IdeaCentre Mini 01Q8X10 SKUs
      arm64: dts: qcom: Split IdeaCentre Mini into a common DTSI
      arm64: dts: qcom: Add Purwa IdeaCentre Mini 01Q8X10
      arm64: dts: qcom: ideacentre-mini: Build the Hamoa EL2 DTB
      arm64: dts: qcom: ideacentre-mini: Fix the second M.2 3V3 rail
      arm64: dts: qcom: ideacentre-mini: Wire up DP sound names and VA macro
      arm64: dts: qcom: ideacentre-mini: Drop the unused USB MP port

 Documentation/devicetree/bindings/arm/qcom.yaml    |   11 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    8 +-
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  | 1188 +-------------------
 .../qcom/purwa-lenovo-ideacentre-mini-01q8x10.dts  |   42 +
 .../qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi    | 1185 +++++++++++++++++++
 5 files changed, 1246 insertions(+), 1188 deletions(-)
---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260905-x1-ideacentre-mini-prettify-a5d349d8954f

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>


