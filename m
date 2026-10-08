Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7947A4BD7B2;
	Thu,  8 Oct 2026 18:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791484608; cv=none; b=GWV2ajARC5Lmy/sjOOdT/Wupy7qm31OzpOph89t9w3mL58mHyAEYuWbJ2tPjTNCIBs1XdSAlOKY28ioyumOSirdHHQ700Jrqviq/szXPa18Mkde2vo0SFK2/D8sHXWtedi+aOvvBRr7q/+03R/94bP4+aiTpa8zQGcw2aRpQboQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791484608; c=relaxed/simple;
	bh=40LWTlLolUSyJ4TZDApTbTs1TqDcHlH99VDMOLRVNjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=px8GLXbBrqAgiI+TCtZ2tdKaJJ38BYniYqOjTDWrXXd6ptCoS6jV2Y8IK++LsbAcjdceIQ+EKCr1MRpURt/i6qfsS+BuX5gdskWEemZJabYUYh+02N2Q29rwB8jWqQjw0OGlNlW5Y1aCaa9YJdKZ3Xrj4pocNTlcYiehRCYXUls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IUQwgffK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IUQwgffK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1790FC2BCFC;
	Thu,  8 Oct 2026 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791484608;
	bh=40LWTlLolUSyJ4TZDApTbTs1TqDcHlH99VDMOLRVNjU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IUQwgffKz9oQkPOeAGVDX3otBlMCngnOfHzR60BgBd8+w/lZuf46QusSZDfFkkVXo
	 fr8nPMTWYXSMEHtEcv9HxXO4s1p7/Kfp4hneb8Eq0pj2jiYcqzLVTkyUVmk7ougRnc
	 zo+cGDO00Wc5/w/nk+AdillpS2Bm2iT3bzB7VpuoHXvzQeWbujPdSenDY43kIxXiqk
	 4VziKIRZgDWAq2Y4G4QBahpkiqljlelzomYE+yEJFtzK6fnUquSwaCDfw7iUCNtZs2
	 lw3H9x8cNkqoF7oKtV0dwk2zmTrYB+AFoBI40c7yGMXK+ibnxmeRjadVzIbNkbWxSP
	 37akaVmPOrG0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F7ACA6014;
	Thu,  8 Oct 2026 18:36:47 +0000 (UTC)
From: Juerg Haefliger via B4 Relay <devnull+juerg.haefliger.canonical.com@kernel.org>
Date: Thu, 08 Oct 2026 20:34:46 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: hp-elitebook-ultra-g1q: Drop
 omnibook-x14.dts include
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-2-9702f7c6f9a0@canonical.com>
References: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-0-9702f7c6f9a0@canonical.com>
In-Reply-To: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-0-9702f7c6f9a0@canonical.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Juerg Haefliger <juerg.haefliger@canonical.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1423;
 i=juerg.haefliger@canonical.com; s=F9F8B48C; h=from:subject:message-id;
 bh=36Xroda5BgwIhkZde/g7EP2PrCQr/TI7HkISUfuROf4=;
 b=owEBbQKS/ZANAwAKAQ/TiwkLpkK3AcsmYgBqx+K+XCdXfVAjulej4V6gmwDfwDUz7sI6Woj0u
 3iC0/3asQ+JAjMEAAEKAB0WIQSFl9T3oi6mu+It14sP04sJC6ZCtwUCasfivgAKCRAP04sJC6ZC
 t5GWD/9LFkLKo+6BEYan3hqibByPRyQD/xaLIjARQXfDcQGm/Rvj+bOSiO1k8mWJaEo1EahCGDq
 KVhS9q7em4FxXGBUTSQFoVVprEywK5noURAU5hu3zFntZxlsADveQFbJi2c/Uh3+H7WfWHUCUGr
 bp1vubWGpULCeeHjyWUPSL3AItljrZO367le+6+oV6mJrNQXw+cyOYx3qdxkVGsozTVQWgR2a7Y
 hNfOa5C/80pVYvsWrMb1uFHUN0GRQ0PoHDHpPWz9UUIJPhwMCZnUNUlxaa4GaL4wYL36lzbI8/1
 O6dWQYiqf6NKTKmQ72Dfw3JDBnK/LgG3PFWCSsc6MoWVhEb9LGAhgWSLaqcicgNI2+sH5bvswm7
 rWioLzAh1WdbQpTVOm93ce6FaI046TvMAaWs0KvOYcO6mW7QbvtFMxdF0ZHzMDRTurZwMsdV5NZ
 BGqjDGBCEAOekkYUnGCGmg0T2O3Uqrcsh/e0KBt1XI286lZvu6gLW/xAld9ki72SqGlfbde8WOx
 6PoUwe6V3RK/TRecx+9FkegJXL5kb7IbP/pH3hZ0NwyZAtHBpZFN60+K+mWplIpYQNCDLqquxgo
 GwRLwK53ZRXYdiPkUoVNPj8NW09q8GYG+ZYzsrm8pMDs63pgToT/Yqcohyji4ojODstTSFFwnKo
 d8eTK11o/vj+5pA==
X-Developer-Key: i=juerg.haefliger@canonical.com; a=openpgp;
 fpr=52B5BDD2A6EDC76A0FE0AB4A754C3A96F9F8B48C
X-Endpoint-Received: by B4 Relay for juerg.haefliger@canonical.com/F9F8B48C
 with auth_id=1135
X-Original-From: Juerg Haefliger <juerg.haefliger@canonical.com>
Reply-To: juerg.haefliger@canonical.com

From: Juerg Haefliger <juerg.haefliger@canonical.com>

The EliteBook Ultra G1q is a different product from the OmniBook X14 that
happens to reuse the same mainboard, not a variant of it. As such, it
should not be a child of x1e80100-hp-omnibook-x14 but rather a sibling.
Include the shared base platform dtsi to match the other OmniBook X14s.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
index 0b3b6cb23e1a..9327eaa16b92 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
@@ -2,7 +2,8 @@
 
 /dts-v1/;
 
-#include "x1e80100-hp-omnibook-x14.dts"
+#include "hamoa.dtsi"
+#include "x1-hp-omnibook-x14.dtsi"
 
 / {
 	model = "HP EliteBook Ultra G1q";
@@ -16,11 +17,15 @@ &gpu_zap_shader {
 &remoteproc_adsp {
 	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcadsp8380.mbn",
 			"qcom/x1e80100/hp/elitebook-ultra-g1q/adsp_dtbs.elf";
+
+	status = "okay";
 };
 
 &remoteproc_cdsp {
 	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qccdsp8380.mbn",
 			"qcom/x1e80100/hp/elitebook-ultra-g1q/cdsp_dtbs.elf";
+
+	status = "okay";
 };
 
 &sound {

-- 
2.53.0


