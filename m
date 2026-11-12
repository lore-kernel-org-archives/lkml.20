Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515213;
	b=gQSTP/RIvIR4imRnIFgKTa4Rvm/GWO7vq3tqZ/yanfvuFj+T9UqxsnjcDdt+038Pxq2j
	 5wuI9+/9uIEqrDiWL1cgiaLDTXQZRc16HtZINmkBspCTO8QHtEbVH2hRUpSw9dsHPVw8+
	 l9aCE1k1JEhpHtDcgvhf5fUEFdCiJGGYgHPCbemE9w26zyzd7OzhMJjkgxQMKO8AHfXsr
	 BMXaao33Sd6v6FGTb6E67pGCplSGGQHFlOJCbJF5b8u77S1989BKS7dC3VlHBMK9z8osz
	 hasw5MYSnB2o93gc4ZysToBCQASeZOj621D/JRu8GrGH7UQ0JsOL+O+VZAOb1QyeSbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515213;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=h52PbRLs3BhHWhaWn3yt701jVm/FG9nSnjuZD0Gdqg4=;
	b=rvvgN7UsKSnOjA1UHw9OaltPgufR3ltLETuFR9fAk3nevNjuj1NUW0JGvWERDiNv9UBT
	 mhmC86NwaUMlgKKa+RgNIGo+kaUEL4pfdGS7lFsSHxzxJj1veb1MU4WWP/8S9KK49uX6u
	 2vwgLTC0L0bxUSL8SIc/edQ4hn15l0ukMSqOXUMatRyxrqIfcf4ryP0ytZ9TiBjjhC19o
	 EzUa7jKVAoWTZ//u9qvFsbX/zgk7Yxx6TYQRsAyFJ6EW7fHNTOu7xQKYWiOmVJBW5LESu
	 IjAN4B+let+RxiKeN2Y1l3r537VNimKgECFTNkiOwJkL6UWhPmbYUhDOERf7n0Hy2Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BRjXeQNv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FCB606A88D;
	Thu, 12 Nov 2026 20:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BRjXeQNv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A131F000CB;
	Thu, 12 Nov 2026 20:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794515212;
	bh=h52PbRLs3BhHWhaWn3yt701jVm/FG9nSnjuZD0Gdqg4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BRjXeQNvaEQxzOwQwSI+pRxy3ZR2EGQyhC5EaYaeyAkf96CK/fr1TgwFY0oR7ck+a
	 LB/qveDWi+//v8nDIhd8mscM2Pfy9COoZflv7ElcD8KtEKLnqfU3GxLKsWn2w6Wt91
	 4u8SJxZ5hofZkp6CHwaVKA95BPL5kBJUknLuU8g8rnkGLDnB6R/LMoCifNgAO+7peH
	 u6CcvFA7bMIvLvQ8N94VuuFnt1xBZCLWu0mKMagP5wblZo1DKNjTDKUby2rrTGL5/D
	 lZm4RiQcnrphb52X3RlYGCQQTII2SDIvJy+FgDjn9v5Pb+XTpvKAJsVIjMyTm2KHgu
	 K2DT+JglQ/9/Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 12 Nov 2026 14:26:40 -0600
Subject: [PATCH 2/2] arm64: dts: qcom: Add MSM8996 SAW3 syscon compatible
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
Message-Id: <20261112-dtbs-qcom-v1-2-1978370c7cad@kernel.org>
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
In-Reply-To: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.16-dev

'syscon' nodes are required to have specific compatibles. Add
"qcom,msm8996-saw3" compatible to the MSM8996 SAW3 syscon block.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 1267c56d586b..4e8eb82420e2 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3793,7 +3793,7 @@ frame@98c0000 {
 		};
 
 		saw3: syscon@9a10000 {
-			compatible = "syscon";
+			compatible = "qcom,msm8996-saw3", "syscon";
 			reg = <0x09a10000 0x1000>;
 		};
 

-- 
2.53.0

