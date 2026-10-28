Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217881;
	b=qwqCVBeeQViazcfbwJfzuIbpn1XQAP2doD9F8lkY7xn2pggUOoOgxnCVeQX5hOLP65aQ
	 roNZrnYC9JIL2uAcAB8gpWiULZniQIyG7zkKbcV6dKuDURRpd5aGcr4PiseL5ljXDP10Z
	 3XnEZIdBl4OtaQm67eQSQaqJBjE7iI62QSHAxdKzNrFhs5B3Mbo+AVyT9ghCPIfm86uak
	 u4zSHxk9Vwhj1AKIvB8zzrkiJCFEK+1nP6F4pPuAecOs8cbLGp7UXGJyJfVwa/dLX8uhd
	 vJ8fIRoqavn+K/WJNDkDIoeVe/OB8A3QQKNe5U5PYiohdztiYkbS0AuQMIdxmltcHJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217881;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Q3s3vyP8vBmAG+3+GRcBEUoLZCzAu/EWT8yfEdr3bGc=;
	b=AbSOsseYd4J/w3o3dFCtgZzYvQFyNg/MlR9GX6KMc3WHVEyM2Y7fKHHKWrCFHwd9pAlQ
	 Y8mDWpU6S43MblBRUkGzZtp1K8hM+eVkGNEhE86RUQV80gYJZZc/WI7PGbUnD7+x+d3Wz
	 sqYvImHeqQUjjaIAo3tF64gTSFwCnOWvxxOvDg1Zsgugqr9YIfgKKKlSoCEwKk6PjLxmV
	 89O5arIP/yQsnalJtaw22V3iF6xQYP7nbzDPmUJ2QnxryXLzoFu/QwqWbXDhWmJAD4p5L
	 Db0SuaEdYdCiys0dXemri9/7YjPiRGUNizgOGJHW2lcCbSUCDgHzmqqFdG4EpImZBZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gcx0sYUq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F5E60A2600;
	Wed, 28 Oct 2026 20:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gcx0sYUq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF9A1F031E7;
	Wed, 28 Oct 2026 20:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793217881;
	bh=Q3s3vyP8vBmAG+3+GRcBEUoLZCzAu/EWT8yfEdr3bGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gcx0sYUqCauiyOxmBrJ5H6SLHnrk5IP1FZ5lXunQ7FFEoY4uDORC7HS/9wQ6RaNVN
	 W7ZH6AHTmLQbv34bXymsb3ZYB2E+42MNBEfm4g+8fmg5docoFfIfoGSfq5jmvvhatj
	 PxePXGunU/gPScBsYhkwRlkyguAFfBeAqW+1SojkV/VNVAnmkzRXSaa7GPGn17krBY
	 cnCHEvD7lf4PM4Fxh6SAduNxOlViwwSeCTbyGpEJo3qQFcaBfQScyoFQIcHr7wiWU0
	 F2qRJ41GA1oWG3sOP6N0hTRwZgJjT0VizVkZfcOEFE4X3a4qjh7u3xyN2PpQl6LVBs
	 gnVLD3u0ldIfg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 28 Oct 2026 21:04:26 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: glymur-crd: Drop L4F0
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
Message-Id: <20261028-topic-sip_cob-v1-3-80ab6704aca3@oss.qualcomm.com>
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
In-Reply-To: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793217867; l=925;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=JS3FNFIi9esp7f9Kht/RpkwT9TfG46P50EzDHd7aBOM=;
 b=ToRXKjfFf8DVD9KInReylVfvl9nw9KqkOLb4XM9/qP8fQ4t3c8kVJ7BUuLbMrFUl0aq272IV1
 TNpInbTjxmvAsjm8ClbKD1wmUxg/7W09ejjYCkwHb5EviRFE8pLNC+d
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This is VDD_LPI_MX, already controlled by RPMH as an ARC/RPMHPD.
Drop it.

Fixes: a5ad8a8e473c ("arm64: dts: qcom: Commonize Glymur CRD DTSI")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 422ed0308147..422b3778c22a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -390,13 +390,6 @@ vreg_l17b0: ldo17 {
 };
 
 &rpmh_vregs_f_e0 {
-	vreg_l4f0: ldo4 {
-		regulator-name = "vreg_l4f0";
-		regulator-min-microvolt = <1080000>;
-		regulator-max-microvolt = <1200000>;
-		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-	};
-
 	vreg_s7f0: smps7 {
 		regulator-name = "vreg_s7f0";
 		regulator-min-microvolt = <1320000>;

-- 
2.56.0

