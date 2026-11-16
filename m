Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814804;
	b=gf6inc33rOwGaB/UcwbLICJibbumR+TR0WnG5RYS2LwhTK4/w2pXNlb+GMdOBsiynDYd
	 GeNDzInmw0G8EzHQDQjagDFND6hkTDJbz58uwJ4+5jJQtgEofQ8mE0vPZaCiLIxakyptS
	 Hofp+JzAvuof3YYFZRnoTUDRCLbMecGxi2/fGvBhFyBliV24a2SN47IM/0Z0Xh4CMBR5W
	 DMfKqiqOPQtApbyl5Sglqodrk7O18MM59utmWgXcGdx5liV+56oVx2N603fBRxiD+9kLx
	 rqeZYrabKLVQqkoyEHsLcnSfj0OGD7/4sE4l5QnyPE3EOypTSAwNi9ugTEgjDWUsXIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814804;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Av6zBgoTaQ4kzE50yOzGV0U3+7rGIC9YXFrl47jgk1k=;
	b=SY/ZG8NUPcitsm0mbFmlgEFolhbVNvilON3y+W6c63zT0wrggD7KGtWgjw1WF/jFcdKY
	 ZujZjLhpQJbMaFsch5/YU9W2/+Fkqsg6Vn2NgpwCiqg77Sxqk4CmxanozHGbwuEYvk0Q4
	 Lce1Yd1vtsxd5Pph6OtBd0jlMx8OhMnkvigGO5K8WtfnwVXk0GPn4Mppx7p/+GztffW61
	 rXD4ONIfiXO94UZT6+nHg/lARbYe7/iumxsfK5+XAkDOBpoMEOwSLeptWuWIn8fy65UAW
	 tBk+pLo7qy58WB6CdQgXO8h7Y0sz1VEGyMEoSn81a+b737/FFaE33RMkI3bfF6bpw8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qvuu+yf2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945CD60A2635;
	Mon, 16 Nov 2026 07:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qvuu+yf2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814804;
	b=RL2j11HyaPJqgz+uuwF9vEREAwWfriohmnFgmTsqUv/Hg+B7ShdN1T1WopDa92aaQRCU
	 Owdn5K5XAqVpFy4Ywc2QUp7fGWWMUh8IiGKEtY7ihORGUdk/lEou0TaH7+54Vo4UhMI0g
	 qds8qoXNbtYKrkhY9BmBtRXW9J97SoLmJM8KwAdYEHmOVciD8h2MoNr+xUbCu79M/Op56
	 rXVmsUm+2AF6a2P/2AAWJx8gUTwe3NUzuS9HY8FEUsU866eJw2nPLpaK/XS0YXQXuSnRe
	 3khJ3eE4sy8xe5TCoH6N3FWzq/o/VuiKRpjnmXnd9rFfl4XPejuOrpDgATqURb3Ug1w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814804;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Av6zBgoTaQ4kzE50yOzGV0U3+7rGIC9YXFrl47jgk1k=;
	b=CnchPVbXGTMjRn78t71WcFp6Ovs4yVg9j++w4pbXg371KywstUt9407QPyBpFa8+bfAk
	 aT9xBeNcQpqidSU0qJ8gY5jfER8hg6decTJ9KHEH5iZ4H8yVvG8WMILR7x37Ehqnzd3s2
	 T09ed7BD04j7FUsdwjuVm1wVIqrmGSAZssZFq4CiGg4jOJODvD6pvNEEmEuNxJj7YHO59
	 PGqSZmODYW5qBHDs1UKS3/mGnW98V8iigLHM2uKdHm8nQRkx0bb5iTbjqLjRwcNIPDohU
	 L83oksUkXpVTbFKpSBwopKh9ip2MN0JudyVw0nYvOvhVldIuqiAyMr4FNmSdf3agm+A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D4A11F000CD;
	Mon, 16 Nov 2026 07:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814804;
	bh=Av6zBgoTaQ4kzE50yOzGV0U3+7rGIC9YXFrl47jgk1k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Qvuu+yf25oNBkSK0mJAzwcr7RIiS4nPrHZG6Ekx4OKKJ7ESwNCGmoyaiavnZdrM63
	 35e89Of3cUEO9IVtg1SMcrCPYzVTmXsN+ahEhxTRSRu68/ZOsy1e+yEVnQLezJReix
	 MDk41Px3e9PBobki4dD9dZiC0PXTlxAM0BgZBTi+7yN1X+xEmtWVYrN6u0RRSgmZWz
	 9awykcDB2hY2wo/5o2d89+coYAvJDJu0ChPyClRMtkQlA3iE2otjvrKtfiYv/eQqNW
	 zWvl7twSifdtbeayslSjIHhZj7vYS0dRqU47rycHGvW2jJ9d6Yvy3a4AVtXc7+i1dU
	 H0xh9UCUaivvQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 051664A3BD;
	Mon, 16 Nov 2026 07:40:01 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 13:10:08 +0530
Subject: [PATCH v2 10/11] arm64: dts: qcom: molokai: Describe the Adreno
 829 GPU
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
Message-Id: <20261116-molokai-soc-v2-10-9dc4dddc4e96@yahoo.com>
References: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814798; l=4118;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=2HkDl1+9itKBIsKaFYMNX6gN+5ciNOiOA4CxVzbOQLU=;
 b=SZS8Tw5lYWqw0RjAYLAnmBnhn8eficsy4G9sRmMD81LlpbUPjeYHtkRcTpcHxHmJ9aBiN5NHf
 aQXJ1CUp0jjCoKSFRCxB+juJGYR90QyoVl/l/XoE57MbtK1qecUl+kT
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

The Molokai GPU is an Adreno 829 instead of the Kaanapali Adreno 840. It
has no speed bin fuse and its own set of operating points.

Assisted-by: LLM
Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 arch/arm64/boot/dts/qcom/molokai.dtsi | 123 ++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/molokai.dtsi b/arch/arm64/boot/dts/qcom/molokai.dtsi
index 82fd31bda1d9..3b9772edd68f 100644
--- a/arch/arm64/boot/dts/qcom/molokai.dtsi
+++ b/arch/arm64/boot/dts/qcom/molokai.dtsi
@@ -12,6 +12,7 @@
 #include "kaanapali.dtsi"
 
 /delete-node/ &gpi_dma4;
+/delete-node/ &gpu_opp_table;
 /delete-node/ &i2c_master_hub;
 /delete-node/ &qupv3_4;
 /delete-node/ &uart18;
@@ -37,6 +38,128 @@
 /delete-node/ &sdc2_default;
 /delete-node/ &sdc2_sleep;
 
+&gmu {
+	compatible = "qcom,adreno-gmu-829.0", "qcom,adreno-gmu";
+};
+
+&gpu {
+	compatible = "qcom,adreno-44030a00", "qcom,adreno";
+
+	/* No GPU speed bin fuse */
+	/delete-property/ nvmem-cells;
+	/delete-property/ nvmem-cell-names;
+
+	gpu_opp_table: opp-table {
+		compatible = "operating-points-v2-adreno",
+			     "operating-points-v2";
+
+		opp-195000000 {
+			opp-hz = /bits/ 64 <195000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+			opp-peak-kBps = <2136718>;
+			qcom,opp-acd-level = <0xc82f5ffd>;
+		};
+
+		opp-301000000 {
+			opp-hz = /bits/ 64 <301000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+			opp-peak-kBps = <5285156>;
+			qcom,opp-acd-level = <0xc82f5ffd>;
+		};
+
+		opp-403000000 {
+			opp-hz = /bits/ 64 <403000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+			opp-peak-kBps = <5285156>;
+			qcom,opp-acd-level = <0xc8295ffd>;
+		};
+
+		opp-496000000 {
+			opp-hz = /bits/ 64 <496000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+			opp-peak-kBps = <5285156>;
+			qcom,opp-acd-level = <0xc8295ffd>;
+		};
+
+		opp-589000000 {
+			opp-hz = /bits/ 64 <589000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+			opp-peak-kBps = <6074218>;
+			qcom,opp-acd-level = <0xc02b5ffd>;
+		};
+
+		opp-660000000 {
+			opp-hz = /bits/ 64 <660000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+			opp-peak-kBps = <6074218>;
+			qcom,opp-acd-level = <0x882f5ffd>;
+		};
+
+		opp-714000000 {
+			opp-hz = /bits/ 64 <714000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+			opp-peak-kBps = <6074218>;
+			qcom,opp-acd-level = <0x882f5ffd>;
+		};
+
+		opp-732000000 {
+			opp-hz = /bits/ 64 <732000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+			opp-peak-kBps = <8171875>;
+			qcom,opp-acd-level = <0x882e5ffd>;
+		};
+
+		opp-795000000 {
+			opp-hz = /bits/ 64 <795000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+			opp-peak-kBps = <12449218>;
+			qcom,opp-acd-level = <0x882d5ffd>;
+		};
+
+		opp-891000000 {
+			opp-hz = /bits/ 64 <891000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+			opp-peak-kBps = <12449218>;
+			qcom,opp-acd-level = <0xa82b5ffd>;
+		};
+
+		opp-975000000 {
+			opp-hz = /bits/ 64 <975000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+			opp-peak-kBps = <14398437>;
+			qcom,opp-acd-level = <0x882b5ffd>;
+		};
+
+		opp-1025000000 {
+			opp-hz = /bits/ 64 <1025000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L0>;
+			opp-peak-kBps = <14398437>;
+			qcom,opp-acd-level = <0xa82a5ffd>;
+		};
+
+		opp-1075000000 {
+			opp-hz = /bits/ 64 <1075000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+			opp-peak-kBps = <14398437>;
+			qcom,opp-acd-level = <0x882a5ffd>;
+		};
+
+		opp-1150000000 {
+			opp-hz = /bits/ 64 <1150000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
+			opp-peak-kBps = <18671875>;
+			qcom,opp-acd-level = <0xa8295ffd>;
+		};
+
+		opp-1225000000 {
+			opp-hz = /bits/ 64 <1225000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+			opp-peak-kBps = <18671875>;
+			qcom,opp-acd-level = <0x88295ffd>;
+		};
+	};
+};
+
 &gpucc {
 	compatible = "qcom,molokai-gpucc";
 };

-- 
2.56.1


