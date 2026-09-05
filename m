Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D0F1A6817;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788600558; cv=none; b=QofLpDDjAW+U2DKIsWDgdNV85QTpxtQ+MHpANmIenY1sLR5aYK2gwCD7xOy4rAzifTyPuTV6UpaFtZjytjHsw/xxkUt+abKcTVrLRfi+9rrNS5iS0F5PG8RmIKQvwDAI5ZbHPvZE6Zfih3GtKL5chruM3nDIrTfz8EEFBmp2v4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788600558; c=relaxed/simple;
	bh=C8pKWGOvvx4BxPBWZFyF0NHJeTobpB5pEqmBWcv7yd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ahy+c6mpkMwYrVET9oW05/fEzbU0Oo8Ud6qACERlzwwPy8JuEXLoYCaugapTevfZueJUs4ryfdA1hDOAQrfd5OgqG/gtMgLlUoWnnKGjnMeN81uHy5bYj0RD7KmIoxflhge0mZCmy7gYtQB7RYNGp/8iaNg04Rn1w95/E5J4OQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qo5FrhNX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qo5FrhNX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5210C2BD04;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788600557;
	bh=C8pKWGOvvx4BxPBWZFyF0NHJeTobpB5pEqmBWcv7yd8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Qo5FrhNXBDjtfM2XMId5Z1SXLoesGHEZbN41OF3a9rvEuzmRwadwpks8NNtGN6Skr
	 Tw8L6u05anNMsIYJAsuwg8cbUz2buPv2P+JH4/VKdM8tIscUhgzYptK/UWU7Tn3lk1
	 HOuUVITW3rKJBmcxlB2+34uhzD1MoFy20rTrBWohLqgyEjnSxsoGKV5Q9tmpncCnRO
	 cHhfiUHubiik49F6ZG22whGIr4Uk37CB9X6vpuA3wjLpQN/TKzjmtvWZ6VUc0j+Chd
	 PNaVjjyobYJLIaBf1yHUSASBdEOoH/HtYZDk8VJfskhXXSInKPhQ79TdDPOo5C79Aw
	 Otkpg3UgBM58g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA4FC79F90;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 05 Sep 2026 11:28:59 +0200
Subject: [PATCH 4/7] arm64: dts: qcom: ideacentre-mini: Build the Hamoa EL2
 DTB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-x1-ideacentre-mini-prettify-v1-4-9a87882973bb@oldschoolsolutions.biz>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788600555; l=1213;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=tNnFe+85llnft8rgSu+IZo3lIc8akq9ek2EYr0QF1pk=;
 b=3XODYihKzUjZdZ1FLd6wg6bzzmAqABNNt9UCALkf8pWcXz2ZKfUWGEiy0OnuV5XsTcmWJn7qZ
 7+tGnsrmERCAJHsW+Syo+uUq5ipVnA2TCVi1gAY/rp/D8rKL1w/wJ05
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Other Hamoa boards combine the board DTB with x1-el2.dtbo. Do the same
for the IdeaCentre Mini so the EL2 overlay is produced alongside the
normal image.

Assisted-by: Grok 4.5 (xAI)
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 arch/arm64/boot/dts/qcom/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e6105e5790954..0cfbf3018a7be 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -24,7 +24,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
+
+hamoa-lenovo-ideacentre-mini-01q8x10-el2-dtbs := hamoa-lenovo-ideacentre-mini-01q8x10.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb hamoa-lenovo-ideacentre-mini-01q8x10-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb

-- 
2.53.0


