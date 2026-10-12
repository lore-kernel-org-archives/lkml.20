Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE434AB1A6;
	Mon, 12 Oct 2026 15:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820286; cv=none; b=ugtcjA2Vo0u7Uq4eR9WI0sujP76BnvnY5vPsqrWAQyexk/VhixUvlfgKOk1wbVxfYWLPmWy7pvfhchzYQHWkmKpU4qAwTaL0hFJjK44stpYG8qxCoLvq3aZ4moB3cQbTzFrR1QO5SJxc3ult9bC47IdV7nMGEu9Ic4ilwSL6Tn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820286; c=relaxed/simple;
	bh=Dc4aQNXppOOh2naGbZKstydte45eJS70tXAApukP9gc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJh7ikNeuj6zdNG82Aqze7LIzUYmCOuDSFaLs6eq/qu0+fJdcWTGrvrqf2bQ+l5ALe1f/G/vHw/vUDIatj+tHjvrRmnBatR6zPO87fIqUwRuJWc4TxHFX/YGi6pFTjzxRbBTjbckeX4GuoKTdxwccfb8Ix11ydE7twIBkHv6/Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QT7qIHNw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QT7qIHNw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E367C2BCFD;
	Mon, 12 Oct 2026 15:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791820286;
	bh=Dc4aQNXppOOh2naGbZKstydte45eJS70tXAApukP9gc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QT7qIHNwC8/qrbmWB4NvgdjZc4Mu1yP4ylFeZdmcushPViuq+ehgXVmqXbx69auKj
	 iftToUWcLtlUOZcrb5wL7Vs6+kLfJq0Wbt5INUXkUq5IYlnPPwFU1S7q1bp95aZdN1
	 QIeVOcFcvI9NUhwlFGQwpgeX8izfrAsoD1zNv1AxEwJFt/ffVGOuF6UPqeTXLRMIb9
	 SDTjl4AnJW6gLzr1LPEADnSsxKQUj1Nv3Z3J7wB5NNlkz2b9eq/gt5LDtLNh0Bpmby
	 lwy2mUabnvasq/YGXrnRs87DfgPKgBwQvguhdOxAkU3hCIcBOdd9qyH8MteSrWRX7Q
	 skRzgiHLTh7Rw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B765CA9ED1;
	Mon, 12 Oct 2026 15:51:26 +0000 (UTC)
From: Juerg Haefliger via B4 Relay <devnull+juerg.haefliger.canonical.com@kernel.org>
Date: Mon, 12 Oct 2026 17:50:58 +0200
Subject: [PATCH v2 1/2] arm64: dts: qcom: x1-hp-omnibook-x14: Consolidate
 pmics and chassis
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-dts-qcom-hp-omnibook-x14-cleanup-v2-1-c859ac395b81@canonical.com>
References: <20261012-dts-qcom-hp-omnibook-x14-cleanup-v2-0-c859ac395b81@canonical.com>
In-Reply-To: <20261012-dts-qcom-hp-omnibook-x14-cleanup-v2-0-c859ac395b81@canonical.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Juerg Haefliger <juerg.haefliger@canonical.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295;
 i=juerg.haefliger@canonical.com; s=F9F8B48C; h=from:subject:message-id;
 bh=qnNk8lBIZZu+ycGCBRLG3YFrQOAuUw/bFF0S3K4QKy8=;
 b=owEBbQKS/ZANAwAKAQ/TiwkLpkK3AcsmYgBqzQH8MBTQ+LILxL/CoDc8DblfYmhq3E24TLSGE
 yK3ZEvJPiOJAjMEAAEKAB0WIQSFl9T3oi6mu+It14sP04sJC6ZCtwUCas0B/AAKCRAP04sJC6ZC
 t/YTD/9YmBloQMDobaXd45qo/+AbH+33b25IDZfqrNapTsTUkhWe7Ou9xJ1NNPOF9jC6M/u3gew
 nV2NSXCzmpe09Y0Pge2rLGVgsLvmpmFW9/pXyMFYNd2xu3d47QgF+6+fUtxLobIdJbi2G2DJH1m
 xpNAW7JxZ7FOn0cet3vgb0K2K2DG7HMLj4AC4+nfM7GcOpyZXLBrV/6svV1gaAF2+2siilnlDvT
 UZfGaVCpjgn3d9hhNVHpYKQayOb6XmROypAGUMYRGrbOqQi6SrFAsgK+qRuMmBIs5CXZQ61wd/d
 8gDB4YSiU0IvJrGAkf96Gqj2djzf1WRj1Encm1BX0KmuX7IZWM2GGgzjhXscc3bRZKdJK99IvuC
 PNN/8XlIiK+MYJ0Jb4ilTs/wXOMkRc1vgMepzaNoTj2ddgAgQBtjMUyLvSM6AIa8HqO7kBeZcvN
 iHYODU8IUqOrNwKCdE/dgmjnsUer4NV2sQLs/9ZY63POcpyAh+N9LaXr6XdilR9LuZXSu9KATar
 WJNZtxmmuXnY/j/lr+bd/ehaOF9EP+f3NcSEgn9njLHQeVDnvblxygNxOs/JHoVQ8avXrsiee3L
 72x5g4ZLYk7IQPohJ1fMdor/pBIuj6MEe9YuAglkJEyB5gvu3WbhN789+7AK5S8KVui1ss+yK7u
 q1/+NmNns8y6C5w==
X-Developer-Key: i=juerg.haefliger@canonical.com; a=openpgp;
 fpr=52B5BDD2A6EDC76A0FE0AB4A754C3A96F9F8B48C
X-Endpoint-Received: by B4 Relay for juerg.haefliger@canonical.com/F9F8B48C
 with auth_id=1135
X-Original-From: Juerg Haefliger <juerg.haefliger@canonical.com>
Reply-To: juerg.haefliger@canonical.com

From: Juerg Haefliger <juerg.haefliger@canonical.com>

hamoa-pmics.dtsi and chassis-type are identical across the HP Omnibook X14
boards that include this shared dtsi, so move them there.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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


