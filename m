Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1E937E5D9;
	Fri, 16 Oct 2026 06:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792130478; cv=none; b=FOhQvGasu1jkwtRO0O7+0Ovt0WH4wm/OU6jA3FQdvZvX9EPl+Gc/+AYhGGKf46glDADi/7minYj+aLrefBrKLXTBZRjU9pyXc5vKmu/GRzlGsLt1qsGsZMZL2Yc2nGZ7rx+q9vO3VtuwIwie0bWhWuFX3l5qiQe0xroJ3lVSTqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792130478; c=relaxed/simple;
	bh=5fB2HqNCtzyKCGUpXAsE9izKpk3jD6ks3XPSg5kz/2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lASHtGj3Oz+RJ+hmygGRm9NKrsYOFEtkIRk+odSYHCQpHr+pOpt7hDq80y+mBCniDz3I5bV1uALND/KBcdvAcrZNLkqmXUGigproD8EYwjeyTSh7Pejw6HuG3c/TejKXjv0Y2N6UGuDx+wNoYFb9EcRRbGrVvZRWD5bkUnaEpiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mibMCPad; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mibMCPad"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B02EC2BCFC;
	Fri, 16 Oct 2026 06:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792130478;
	bh=5fB2HqNCtzyKCGUpXAsE9izKpk3jD6ks3XPSg5kz/2o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mibMCPadpp8t0vKALclh5vumzjKsEAkKFp3RjQR4FoR15hdaJJnERcNlOXVUVSoc9
	 vDjOS08y++ZuXL+KNj6eJPK3bbeytAqHZcEqIMeruULkx5Js2qwwRnJM7sU9QtPbbV
	 77Msc8YZIWREhqcmWzTifygNX+FT2bnsC5gzjzQpcU8jDzd+yDNISZbscuxencLKq9
	 8DA0dzy0h+x6xSoFzR4frO8RHOiIkapg00s63ib9FTkFJkHzP2pFFysNYV+qUFKLaW
	 TwB0TOjB64eqNoLM7/rb0c51kud+K8qX1BDDtxzf2wmDRsS00ZKqII6PvzTyHJ3GuQ
	 3j2e2Sw0EBRHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B49CCC6B38;
	Fri, 16 Oct 2026 06:01:18 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Fri, 16 Oct 2026 06:01:15 +0000
Subject: [PATCH 1/2] arm64: dts: qcom: sm8350: Add the EPSS L3 provider
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-sm8350-cpu-bw-v1-1-044ac6dc9565@fromdisposition.org>
References: <20261016-sm8350-cpu-bw-v1-0-044ac6dc9565@fromdisposition.org>
In-Reply-To: <20261016-sm8350-cpu-bw-v1-0-044ac6dc9565@fromdisposition.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Demeter Barna <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792130480; l=1532;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=/8vPgqfKiT1bODMQ7BHGvpeDWEcW7hqSYkyAN5jFK/E=;
 b=AwMtaTQ/0Ajx9T0j+KWWd4rdW+6qKGq0XlAzX6tCYmM0Jl241K6p0jinn9ygJBvI1/uM7B/K8
 +6wVBeM1rihDnQQcEw/nRwcdSkr3buxcTehOkSEd5R7GUfhqWIs0sc1
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org

From: Demeter Barna <me@fromdisposition.org>

Add the EPSS L3 block, already documented as qcom,sm8350-epss-l3, so
that the CPUs can vote for the L3 frequency.

Unlike on SM8250, the L3 is voted through the L3_VOTE register, as the
downstream driver for this SoC does. The generic qcom,epss-l3 fallback
selects that, so no driver change is needed.

Assisted-by: LLM
Signed-off-by: Demeter Barna <me@fromdisposition.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 55b32050c..52e8c2963 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8350.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
@@ -3798,6 +3799,16 @@ apps_bcm_voter: bcm-voter {
 			};
 		};
 
+		epss_l3: interconnect@18590000 {
+			compatible = "qcom,sm8350-epss-l3", "qcom,epss-l3";
+			reg = <0 0x18590000 0 0x1000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#interconnect-cells = <1>;
+		};
+
 		cpufreq_hw: cpufreq@18591000 {
 			compatible = "qcom,sm8350-cpufreq-epss", "qcom,cpufreq-epss";
 			reg = <0 0x18591000 0 0x1000>,

-- 
2.53.0


