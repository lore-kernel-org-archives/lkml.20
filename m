Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AADD4B5CCA;
	Thu,  3 Sep 2026 14:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445590; cv=none; b=nChaF2If6qmtQjTTthDrtKBdS112K0bqUdJ0cG4mgE7XcPlw0vE1WAWE+hxuyg+G/M6bMPgQ17mgQ3TjCXNPuLlBYO3bQNCrJVK2sO7dAUpdmQa+f1aB+KNkyDHpIfh7Mjl+0trXeXTSvHVbSnQgCzYQImTLfZIvBUV8/ZWXbzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445590; c=relaxed/simple;
	bh=1r+JWHC1J/gPYYwKcFPcywEldZ1Ud6j9XctpcZ8DSFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PmxHDWzjnxCCTzWvizJzWQh2NpJbMhMM6DhvLb0UZ3dguLYf1tbL5tkS8bKD5T6vc+RiKmjXWm386GwuGRt5bHIczcwiHT9ibiv9JXoWEQX5dFrtW3GDMjZOtxWYfBwNStCrrj2GvCtoOgbCBBpuMCfjWBs6vPbq2/rRfr79GaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Igrm45ig; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Igrm45ig"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4FA1F00ADF;
	Thu,  3 Sep 2026 14:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788445577;
	bh=WaygIGESxbkqBOc3vwWakkpss1b75a3X5N+49445PGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Igrm45igkHdOGMPvO4+OaTjfVAV6sYEI3bFjeTP8n2nQB9s87DyYSsSB4iPBQmdQ/
	 jInV9d6gkrYappk6N9GrMasFY+W2E3cV2+0EsRlfgMfSL6BPnc9sKXpupLCTwgDCcQ
	 FbLX0Xompj6MpkAyROMIPcA5p/7gAnmeYbwOXyLVRU7KyG6l94din6xMK+x0ryjQwM
	 oq9tSXkedx7zGVzwO72n8pPvmgEt61wTqL4SnhTh7tDcTAmfiRDe7zs+InQjpGxA/o
	 +4UKhBxkIIFaxR56sEF2AmTukHnp7OzlCdAElvuBMb6z+LGVaS2Dr2WKBzjwlhWnfs
	 V7Hjsu6pFTUgw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 03 Sep 2026 16:25:32 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: sm6125: Fix QUSB2 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-8996_61x5_qusb2phy-v2-5-4c3f980a4560@oss.qualcomm.com>
References: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
In-Reply-To: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Iskren Chernev <me@iskren.info>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788445548; l=1140;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ZCbvOOQuRVtifrOost8g3n2ZptQcKycIEt21/KqkJts=;
 b=SXKmiPw4PJvvw8KxbJ+LgXfaAa0M8GpfuiFjEkcKHd4p4UqYtfFQsPyOK0bNVXdsgqocLGU/y
 mkLkinr1pbFAOyL8N0BzltRUCZzsn22f+23InN4/e7wQJlHKOU/rcYg
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

There are a couple issues with the current description:

1) The msm8996 compatible is wholly reused, without a SM6125-specific
   primary compatible
2) MSM8996 has a different power setup (VDD powered through a RPMPD
   power-domain vs a regulator)
3) MSM8996 uses a different init sequence

As part of fixing all of them, use a SM6125-specific compatible with a
SM6115 fallback.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 86de1560bdef..1b2de5a01a6e 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -682,7 +682,8 @@ gcc: clock-controller@1400000 {
 		};
 
 		hsusb_phy1: phy@1613000 {
-			compatible = "qcom,msm8996-qusb2-phy";
+			compatible = "qcom,sm6125-qusb2-phy",
+				     "qcom,sm6115-qusb2-phy";
 			reg = <0x0 0x01613000 0x0 0x180>;
 			#phy-cells = <0>;
 

-- 
2.55.0

