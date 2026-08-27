Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168C123C4F3;
	Thu, 27 Aug 2026 07:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817179; cv=none; b=crzHVhXerFITYjQmWjh9nXIifJWjNaPtN/L/mzvdFTyuWHLvM/g60Pe/iYtdrCRPYdUzAnWv7o7DaasVtp8i8Xa8ao5NED877Esa9ykZ5keULTGupJLENomQeOcieuXnLEhk4YBhOObQKi/uzeT/IkP9f6MZOPRHwCnNpn/SVP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817179; c=relaxed/simple;
	bh=czaIkm9My4qu3m7D0K+YXXqWDvJDpKy+28PXMNqdjas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hsDS17pYCQRSS8OTMYNm9gl0SLpDoMRtuzJmcCAa8I8peTJhOzOkRQ40onxnhffWAxF5jxw/8qXXJk2fRKFahcZiBJI9iEMWD9BFl6Vg1Qr9zoUlknR7yfMSY6Kk2MJ5iENqZZ0vXh/t+757qdf2vz8UBvIhO6vLrSOSVlIcrSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1H0GKM7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1H0GKM7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFF35C2BCF6;
	Thu, 27 Aug 2026 07:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787817178;
	bh=czaIkm9My4qu3m7D0K+YXXqWDvJDpKy+28PXMNqdjas=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K1H0GKM72A+wdoHn+GCwq7IuNqmQXXndOk8Pp21PiAiMqnEnr3mf4NOLidHoBSsVO
	 eA7SL+hXzgJpOXnO46UXvUnXr01o4qVSDVC0w9KLdcJg4TRMsCtipnhjpgbpL0R2YB
	 Vg+dK8/gzEGUlyF2IV0z+5efp4gPHP0jtV0qxTYykEuuZfVMPWcDuqYL93h3gfQGZB
	 vQKUGSO3YW2ccq8AewRq9+AMCAkeYxsFhuwZSPZdljWKne9Fl2Wl68Gg2Z9oFp1vHJ
	 yMuCTyNWssTJyAaDr+pbhVFKqoYb1Mk6MlOaY14gC4VnEAdoDXS2rFzkSuFid2NOEb
	 uefk0iGF10zoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB998C61DC2;
	Thu, 27 Aug 2026 07:52:58 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 27 Aug 2026 09:52:48 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sc8280xp-x13s: Enable HBR3 on
 external DPs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-x13s-dpaudio-v1-1-da73414c6ab5@oldschoolsolutions.biz>
References: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
In-Reply-To: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787817176; l=1164;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=IjBkXSfkK+lfRJ3mvGyWB4aKyDDuLURHFzJheJeLHog=;
 b=vxag/gwVTrklX/tl1jGbdMUmGtDbY+AOpYRu6dZ9PpoLXvyvbMPGdLUuuBljYwN/tMPYmniNM
 DhXpEv96bnSDIr4Z8L0iWdPom5rUbc31j6E4vnfFc1ATHhGz/pr4jtg
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

When no link frequencies are set, the msm/dp driver defaults to HBR2.
Explicitly list the supported rates including HBR3 (8.1 Gbps) on both
USB-C DisplayPort endpoints so high-resolution docks and monitors can
train above 5.4 Gbps.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 218573a97785b..467e14ca21e56 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -734,6 +734,7 @@ &mdss0_dp0 {
 
 &mdss0_dp0_out {
 	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 	remote-endpoint = <&usb_0_qmpphy_dp_in>;
 };
 
@@ -743,6 +744,7 @@ &mdss0_dp1 {
 
 &mdss0_dp1_out {
 	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 	remote-endpoint = <&usb_1_qmpphy_dp_in>;
 };
 

-- 
2.53.0


