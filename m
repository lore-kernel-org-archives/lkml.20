Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957372;
	b=RNIDtcl5E7T69rd8C5RTfPfO4SHEt0Fd3mDK+15YI/V3cnOwIKHxavpUXB/8IVcLLiLS
	 H0kqNtzasvJF7oDZPx2t0933DE5Qu7IYlwvIumFgJzD1wYm12ZjVnS/DJLPgJOnDXT3uY
	 WriOKgcYJSBQWF4LzwhbAnu38GLrbUdybu1rsMPA9nHXPuHnfSK3eyInFDl6FVooN0wdp
	 J/gpzYKNBwtfQePNzl2D/j/eMtHipAGKXJiegjU97q3r61W7E01vR3ppa8s8mmYkklMf2
	 7am1BPhvoLjH198nfnZad8Yi6C69uYYmzgAHEjlPdlaWLgan4aosAhDKv+5kElbDorQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957372;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3Dq07FV1HroS5WYRMt1qdpgUt3SgR7XzFnAxpat9KS4=;
	b=kE3GlYJzbWT55WNxcJgt0Xt2IZyMAYTPa61tsQRCMmD7pTqzpMimhc0g/A47bORnyW0O
	 HwceDGdz9a/kjz/GOOh2Qiye7ae+nfKQRYWZBpDzlvuvUVgIcjLkAb1daECi3AgWIl4ZQ
	 LCnqlaGzKX4kXRpxyskZCPD3R1mmHHS09tz3YzjFyDfr/IJw0fvB90UOdJ4CDCnF98+tV
	 rJVu0cV/eeEjVHoXO9gS/YofUEJdIJgkqnj5ai4IVrju5HtuOlyGs+YGP3S5lDp32SUtH
	 2cLLvSJFgBfoO8TBjl944BlHOfu1P0nzeVNXEZWEj5QRz35VQqf0VLQAfQJ/noOe3kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FYpFytz2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFF9606A326;
	Fri,  6 Nov 2026 09:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FYpFytz2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C531F008A6;
	Fri,  6 Nov 2026 09:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957371;
	bh=3Dq07FV1HroS5WYRMt1qdpgUt3SgR7XzFnAxpat9KS4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FYpFytz29pik9b2J/CUkpH4Q/z+15r+hvp0lwhEJbxTQKKauf5WOY/7OUW2i2ztPJ
	 DWUcY5rDtbdaK57VZV+zVLJjSVgvgxBfXVPF8HStFPq1JOgLBnzWeyJmoFyT4JZnqI
	 YMvA1JIesWQh7YoxJvTeK0Uv7M1jD6IqMF3jmMtkviyd+f/kc3rD45fm7mifUfwe6c
	 fSg4BXOAOKnioQ82lUXgYN+/UQSo/GXeknZ8bSSm4W67VbqKv9yxYFvCePeBZZgrRh
	 RQS3JuD1C7QhAdehT4YjHY/qKeTfkCOtP8xbtQSAFfOR9OJiHCQlsdRQO/Z6KgS/AX
	 KvHpygeQMR4+Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 06 Nov 2026 10:29:05 +0100
Subject: [PATCH v3 4/8] arm64: dts: qcom: glymur-crd: Fix L8B0 voltage
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
Message-Id: <20261106-topic-sip_cob-v3-4-52cd3826ab49@oss.qualcomm.com>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
In-Reply-To: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>, 
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
 Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793957347; l=953;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=a2yGY4MCZaNvpG4ozdVVht6m9kAX8f3yOA9kV9DFAMk=;
 b=7HgjuGyl8+zxoWvp0Pn+tOwkRf8IOmjUMeKOx9KYlfX79L8DRW7lZpwzhOfaUzDeO1bYP+cNS
 8UROImQB2Q+DeGpcp904fg2+Aej86J6JvHi5l0XJyWxrA8HTuCYzYlg
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

L8B0 supplies the 3.3 V rail of the PTN3222 eUSB2 repeaters, but is
configured to 1.504 V. Set it to the right range.

Fixes: 9314c6ecace1 ("arm64: dts: qcom: glymur: Enable Glymur CRD board support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 422b3778c22a..aa63ae968bae 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -362,8 +362,8 @@ vreg_l2b0: ldo2 {
 
 	vreg_l8b0: ldo8 {
 		regulator-name = "vreg_l8b0";
-		regulator-min-microvolt = <1504000>;
-		regulator-max-microvolt = <1504000>;
+		regulator-min-microvolt = <3304000>;
+		regulator-max-microvolt = <3304000>;
 		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 

-- 
2.56.0

