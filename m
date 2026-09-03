Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FB34B270D;
	Thu,  3 Sep 2026 14:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445579; cv=none; b=eoSPm3BT7Lhoim5ovLEoYJBYPZk599W8jqDiCmGrCWKt8zkjYDIR063L/7VyQKiKrhKuaCL/wqyNI+MHrc5qS4aVkxS5nbz2EaQW8MookLxbDyjEyfMEF7BZRk5Y5+BBAuMedpz7MxBSoFbt53oX/qPCxwuAO3gGUI5pLH4f7Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445579; c=relaxed/simple;
	bh=3yZpO0T8cOfYv2xOGD/vlS/y9Cv6KbnA9HwbljP7vFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B1ClygXCYHNB28m1J7dG7nRKZraiNtBZ4sMssTx6HxaOjzHYAEnCAiiWbCakyK7Eg9fW7jowI8q6A/FNsRDs/47qB0JZjVeLj0yRyZFhwlEV7qXVlynBkY4GILNdpCobZvwQD7vVs/oksYBxSCb/Uoql7pG2Y7NXDdxProC3sik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuJtjeEE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuJtjeEE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FE31F00A3E;
	Thu,  3 Sep 2026 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788445563;
	bh=szTE7oxjGO1q0rDmbrRjqpRbvKMsDFT7DQcrAnd6QNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KuJtjeEEOlzYTgPSKVUD9cITXoLC/kHOzgDmFXLtvgFC9kqXJTgUnRozc/P6q3GrC
	 cMVosR6V4RiqibwbpJKw1Xyogh24VDSFb8UlWPb6G1L6tkKCF/JaBEuxSwD69WKxsV
	 L0W369drdGWfsd82xBlJXvDYgRLTZy72bR8nE/YQ22ulCDNLky5z1KMSjRX6ZFFGcy
	 xvkw7u3JZU1bJOUKRnQz89JTC0eR5eBt6pxH7JMDQQ5rANoo4/rvgBiGQerHE0524N
	 pVT1Fm8Lcv5sU2lM5CV1M8ulrbsIB15XdgLXVnDEP/sMQy0BPK4MX6fHmcK/VtkVMb
	 wOlv71hY5r1ow==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 03 Sep 2026 16:25:29 +0200
Subject: [PATCH v2 2/5] phy: qcom-qusb2: Fix SM6115 init sequence
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-8996_61x5_qusb2phy-v2-2-4c3f980a4560@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788445548; l=1555;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=oMc/6LTLND3zy+WxNttgbZvp9ei0vRh1b3QcNq5NL/c=;
 b=4ZFXEsoiNSU0xzEQW8oLZXSeyApctJcdq0Crakry0Yte6twMCFztCYYtIGfyD497Aj8lJylrb
 VBQGvqJBhKXAkSD0WjT05dJCIcJ00kGpF1gwGJMuGpeGq2U3HOQ8yKd
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I don't know where the existing one came from, but it's apparently
wrong, according to both docs and a downstream DT [1]. Fix it up.

The updated values also happen to match SM6125, which will allow us
to fix that platform too.

[1] https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-usb.dtsi#145

Fixes: 7756f1d6369e ("phy: qcom-qusb2: Add configuration for SM4250 and SM6115")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 2e5fdb620cb2..aac36ed994b1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -233,9 +233,9 @@ static const struct qusb2_phy_init_tbl msm8998_init_tbl[] = {
 
 static const struct qusb2_phy_init_tbl sm6115_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xf8),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0x53),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0xb3),
 	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE3, 0x81),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0x17),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0xc0),
 
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),

-- 
2.55.0

