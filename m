Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE544EFFDD;
	Thu,  8 Oct 2026 18:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791484608; cv=none; b=YfaFD/5oINreE2mHFArZXdiUF20fCq1PVIs5hkUXDqhRcyi3X5Z68wvyhtMWC3RxXUp7UT3RQDPo+ETsZ9j80JyNl0XCZ0mUsUtfwF0Ky9TpAWQXYwxrF7ob+cz76MdpvJ5+dD317e1BWin6CcyT9ASS3AOZ5s8LZFgZUkwjr5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791484608; c=relaxed/simple;
	bh=Wnj54q8YUgvlpsEvWnXl3VYDgMrDTSqTXzx0TYVY7V4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZfIxAHWIl8jKyl1dhvjAOhQFltErkvhzP2A1HCp28xMDnKEz8yHjNbZjEs2O8B7AA8zoGgUMYiWXkkSEE+IOMDMK71E05wlAEM32BFACaQYMhpZNM5lGos7nC8V0PL0mTmbIerZamaPg50Rst7nlZzDXn2paQkX3lyGao9wiwFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRbMa3oY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRbMa3oY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 055E2C2BCFA;
	Thu,  8 Oct 2026 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791484608;
	bh=Wnj54q8YUgvlpsEvWnXl3VYDgMrDTSqTXzx0TYVY7V4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bRbMa3oYhT2iwf/7AGcrh6N5b/PB8QWTYAqED9i6hmmpVY7S3bdD1r/Uqpaz/zgEs
	 yxs1ptYLx6Yz1tW8HtSk4nQ1/mivXXLLUBW2n9gKLB6QvhGT2ZyV8Ve+NKcCAMxRIr
	 JHJcSbU/o3Qwogd7iActm684jQG0M0xYiKAJLW6+HOd1o0UY1NYa2b6utpHZqzvS2X
	 RZGn2rHxDnonlyjyTlG23i1hVFkUzEY8Yn2ysOqh5hpc3LyjoWzRX2wC2bflfz9wGl
	 BgdQl7rYF3gnIziXXteHonMn9Shj5SKl9IIX3fYwsg/dm2qi2TEDT1Pdnrgh6GjR8l
	 A2P61LXVcia8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67EBCA600D;
	Thu,  8 Oct 2026 18:36:47 +0000 (UTC)
From: Juerg Haefliger via B4 Relay <devnull+juerg.haefliger.canonical.com@kernel.org>
Date: Thu, 08 Oct 2026 20:34:45 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: x1-hp-omnibook-x14: Consolidate
 pmics and chassis
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-1-9702f7c6f9a0@canonical.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2242;
 i=juerg.haefliger@canonical.com; s=F9F8B48C; h=from:subject:message-id;
 bh=j7pMf26hX8bJSWnw8uEGTbwJEDfsrIEGVVZIkhhh8uo=;
 b=owEBbQKS/ZANAwAKAQ/TiwkLpkK3AcsmYgBqx+K+R2lBpLey6me2EmAd3V4hxEyjkr0eM9VQ+
 itHGCEL1HSJAjMEAAEKAB0WIQSFl9T3oi6mu+It14sP04sJC6ZCtwUCasfivgAKCRAP04sJC6ZC
 t5U5EACcu6My0DQzXypIkBrRF7Eu9omv95F5oCCZPyDcjlKsu1x3XxyAwZEGvt3CVGHV+6VztTp
 nPgSsr7+AOgZO1Bq6LVDwnx8CACex01PJRhwK76Hd/omQkaXefrLjCwhhkbt8WP1/5lCScZYi9+
 4w6j8fHMBFg2yEvBBy4fSxWUIOITdbQV2FXzVniby08xpPAu/LjeJnUTHHNwju8tLA8x/ayb4vt
 w/voxcwjYMER8jFwG1jrFWKCejfxehD+pcDZhrOYgMZ6TC+fYdC+9zAm0Oi+HS5Nezth7KKXg6B
 jgGUqhZ5Z7/LToQlZHmY5oYXCpW5qIUP6Pm4JfD3VbxAjtZtxxTfI7dj6Hg0JgeOlq80YyQq1El
 znom09+M2Osqki+uRRegZaIHHd43DXzS4iTayIh7dNffEcM+DsxUuUlN2TMszegzkVZC3Qm8R/y
 /XDTk78ThM3yo33zvdqAuHJPua2DJEkIRHX4R2uAGAtIYu7PdYuzSE4EXThsatxvVVG+SNV7Ght
 868ALpKYXGXIVBaW5pVua5k98eom9Snm44yeUa3h+Nw+YmgsI3wFt4G+z6N3Bp2k7iYMr4JAAb2
 803Arp04y6LfDjXZ2rLsfC8cOmb3kkEArxr3fPGH37nlL9OaWnpv0F6DX4bYkdCswAoX5XElcdZ
 34TX8/a7AM/PqFw==
X-Developer-Key: i=juerg.haefliger@canonical.com; a=openpgp;
 fpr=52B5BDD2A6EDC76A0FE0AB4A754C3A96F9F8B48C
X-Endpoint-Received: by B4 Relay for juerg.haefliger@canonical.com/F9F8B48C
 with auth_id=1135
X-Original-From: Juerg Haefliger <juerg.haefliger@canonical.com>
Reply-To: juerg.haefliger@canonical.com

From: Juerg Haefliger <juerg.haefliger@canonical.com>

hamoa-pmics.dtsi and chassis-type are identical across the HP Omnibook X14
boards that include this shared dtsi, so move them there.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi      | 4 ++++
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 2 --
 arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts | 3 +--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
index 443901a09d4c..1ae68a71bb3e 100644
--- a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
@@ -10,7 +10,11 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
+#include "hamoa-pmics.dtsi"
+
 / {
+	chassis-type = "laptop";
+
 	aliases {
 		serial0 = &uart21;
 		serial1 = &uart14;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index b79e59e1c413..5630ed1181ca 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -7,13 +7,11 @@
 /dts-v1/;
 
 #include "hamoa.dtsi"
-#include "hamoa-pmics.dtsi"
 #include "x1-hp-omnibook-x14.dtsi"
 
 / {
 	model = "HP Omnibook X 14-fe0";
 	compatible = "hp,omnibook-x14", "qcom,x1e80100";
-	chassis-type = "laptop";
 };
 
 &gpu_zap_shader {
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
index 0e4dfb0f0a2a..53a3ede856f0 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
@@ -3,8 +3,8 @@
 /dts-v1/;
 
 #include "purwa.dtsi"
-#include "hamoa-pmics.dtsi"
 #include "x1-hp-omnibook-x14.dtsi"
+
 /delete-node/ &pmc8380_6;
 /delete-node/ &pmc8380_6_thermal;
 /delete-node/ &pmc8380_6_die_temp;
@@ -12,7 +12,6 @@
 / {
 	model = "HP Omnibook X 14-fe1";
 	compatible = "hp,omnibook-x14-fe1", "qcom,x1p42100";
-	chassis-type = "laptop";
 };
 
 &gpu_zap_shader {

-- 
2.53.0


