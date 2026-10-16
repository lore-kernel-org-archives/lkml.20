Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7377057F726;
	Fri, 16 Oct 2026 18:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175898; cv=none; b=pxKqqgIrd93rna0Hf2wk6AE6Wf5ubSUWmvgZ/ARpr2dZl3a6c3tIaJGchbjcGX5KkT6UyblsoCbVbfcOuy4HRVKpjj4KhITD25YT/gmJhfr6b1zuK2QsyI0lHeC84Wm4bE2w/RRGcy7T1Rwpc3Hy5KkjUUotAnfTJjITiRQSc7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175898; c=relaxed/simple;
	bh=8jLj3MjalKPCPoO+nVLLlIVoLjQ01kBztc/rv/ngHOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MVPlOFLmt5P79DI+yFeR687CBIBa16HUsd6S5SKJNfsL+W4xo9D5fW2iVwzrZb4vz576N7BodZVNb8DPFW5tFow4MCYfBcrZHtvxRp2HcLpu/ciu8TwY7hPKOr19uk+OpY5bii8y0/rn1X3/dc71bw0yyC+vTN4ANbOGYvNe+RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8cGYYMR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8cGYYMR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC25CC2BCF4;
	Fri, 16 Oct 2026 18:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792175897;
	bh=8jLj3MjalKPCPoO+nVLLlIVoLjQ01kBztc/rv/ngHOs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=G8cGYYMRA4Zquo+LjLMrt9hEkK8wZCTP7nJY5KeJVCGNXll6/k8WzSBG7Asf0645r
	 zZBX7uO6Fmm1JuKJyuxpEDj9s8D1DKVr+2yITACea2UZjZayWO21EQrlxVEuqiITH5
	 BSodY7uHR2DTgRLVXyB0mx0Z5GIeoTCSiXmNn/QB8SNVIS49SYDK3umyD2rJqUkEft
	 DUx21qT6GyjOae6JTtkhtIjwVcMu4jWkjkfXS8JX9Aig+BcedIUhhxISFPJmaebWiZ
	 4bO2jq0WRopeeQizrOz0g4OCAbMVqBuJwvjeEw+QvNDx0X+rQdqdogVQahDJpvaAJR
	 md9kGvVyBkzEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9955CCF2C3;
	Fri, 16 Oct 2026 18:38:17 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 16 Oct 2026 20:38:16 +0200
Subject: [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable gpi_dma0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-beryllium-gpi-dma-v1-1-76ade615c571@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwqDMBRG4a3IHfdCIhjbbkU6SOKvvcUXSS2Ku
 HejHX6DczaKCIJIz2yjgJ9EGYcEfcvIv+3QgqVOplzlRitt2CGsXSdzz+0kXPeWH7YovcHdKQ1
 K3RTQyHI9q9ffcXYf+O85on0/AF7rWE51AAAA
X-Change-ID: 20261016-beryllium-gpi-dma-9a57c6e8b01e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=HwH4YI5IKv6HnqqoFZ+3iahgGI8sqyxwXnRYzgF5iiY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq0m8Yqwi4x9Ve+naf3Pt1RbroBqr8zonoesFqM
 odcYr4RzyeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCatJvGAAKCRBgAj/E00kg
 ckbaD/4z/PP20vvbcLvEyVP2FPG2WKBaFADCf5oHxa1AKfASVIQiF5cJOetGhJ3ZLI2AdOwLi0N
 Cy/fQAR6Zh9taCPsKNNYqjsav4Qyhd+/pjdBE9wP3lbejTAmdRYofrXW9u839FmfOsQcgK1pvLo
 UTSQPxPNYSa+eY8nnj32WjLdw8qkw2msNTpmtLP+C661zU7cEoe1kbd0AhOeHziJBkDzkzCNTtt
 udtVe70OVJBYpwXB7d7YCewVQkCTKMClIcC8EhNuzYSSN64+AgT26uyyxT+hEAkeBfns6Ami//r
 EH1q0XLdA76RdbvbWOWEiwTSUH+jNecnR5dlktwKQAtGbLokFywuJG5lc8XuYhlrFB2IALhcoYX
 GYwNuH1rnBrp+RPfA2vQQtvsF+wd8yQbD+x79x+2MOt1Q+o+PpcNs2dSGPmlFspMugrSbxhMBM/
 4DIUoVGVa+N3GvaVnsDsNGuCm1dCkQ2tzyRBWwcgYZNH855EQn62mFvxa1zmOGnNoUzGrueH3OP
 IKytaLOq/yy6kPjLjFs/YJZYAN9mXxg8gWv+O8Du6dTV3aA13u/34XYC80N0uWfLDFaNekGfgeH
 rmqv1UbOLiXa2yIHhkN+jk4g0wQmEsdh8NNwSBnCLNwjFk+kQVfFay3uYQoPgXim9clghNUj6bk
 /3gw0jPmqjH9Hxg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Used by not yet introduced tas2559 codec connected to the i2c5.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
We don't have upstream tas2559 driver which would use it yet,
but the gpi_dma0 is confirmed to be used, thus let's enable it.
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 35babe8c5f757..d57851b0b9419 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -264,16 +264,20 @@ &cdsp_pas {
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
 			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 			   <GCC_LPASS_Q6_AXI_CLK>,
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
 &gpi_dma1 {
 	status = "okay";
 };
 
 &gpu {
 	status = "okay";
 };
 

---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261016-beryllium-gpi-dma-9a57c6e8b01e

Best regards,
--  
David Heidelberg <david@ixit.cz>


