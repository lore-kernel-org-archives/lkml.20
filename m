Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627982;
	b=ISxwdsuRgMpOGln0Mkq1Y7pJLz399DIQdlPMYgJG6KwCRhWoOkbC++69fo5287MPO4NO
	 ik1AXMeK7/cCMeH49zvR+3HF7V8R/vavq3DCYthSVNdyH/ImCHk0D9f1UFSQuDgkmsQnw
	 vrs3ir+Pxed2y+Purlep8uO93Z/bZBQVqO3WYU4BLe/q3GQt0uSt7spYMcvtk5fVqaMKr
	 MhRfDbs6x8eEvmzkdzc9tFcvhUu1fGCC7Klt/V3wqpJDlbIHxb+Tjrjc9+Bus+Sxl85dQ
	 wiOjsJeCQf/UHWIGXclyNR9dOQfqTcH9yZfuilBeTPNrMuEua2movdeoLLIsVbaEE+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627982;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=s2SEqKfMwj/eJrBfK5943BFoWBT1hjDKhKlE5YtTfLU=;
	b=dR2bQRks9MOShN1B5e4dEXL+sVrB8XvbQvVsl4uaTKlD/XMxcFyoCwcwjdYfuOwP8uio
	 VrKdmKDxOuVJYwT7OQZFqim4aqQCuhY4CxGwgX2hOXLTz8Dvs8bMP0YUxq7vZW3GwiRMN
	 0Q+L7BcmF76cN25on9/H8K7i1gAJlbFEiMKkLVlld+clpIBmsPfWzQcsHUHKfDt0G34np
	 Jz3U0myF7psf8ZKP32T9ufcAMolP0au7f3rcDn7RjL1Ev9pxGB0CFgFftv1oC5/84DHTy
	 9JFWrQWEY4uzClMQJcoWwZZdPzke1yxs4ew9M5ZhoM0dtBsZeP5Xss1/tzGKi1jnsWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1bDDCTB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00F260A5BE8;
	Mon,  2 Nov 2026 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1bDDCTB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4794E1F00A18;
	Mon,  2 Nov 2026 13:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627981;
	bh=s2SEqKfMwj/eJrBfK5943BFoWBT1hjDKhKlE5YtTfLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H1bDDCTBSaagvEKieiyLl0ycCd0zotTLAIm1n4Y3o4yQYdPeIkZqHXN5ob9mX1RgM
	 rs+JgfVxiAR/9ew+t+ztTDzPBg9Y4jLY7x4sw94Ez8CHaFH1WmAJSrT2pQD7beACEJ
	 eqNlj6XdyRro3JShpdL/yQyTsopo8NGob4vJui6WSoFVmRnWZjywHVftuPb/L+fWIB
	 KAHrmIsef7zZDnROu1D8v7Ez0Z2VVKoeDgQVWJuF/m0x39/OFh8EoMg1ZmshxQZ5Pn
	 knFNPR69aMf05SY9fAY3uEo3MU+QmM8a2FI7Qyj7PFyqwQwnE9hNBN4FbwmD7i7ZVa
	 rnuHV5LCJBsNg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Nov 2026 14:59:34 +0100
Subject: [PATCH 3/3] phy: qcom: qmp-combo: Use V6 offsets for PCS-AON
 clamps
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
Message-Id: <20261102-topic-qmp_aon_clamp-v1-3-141c2cb6cdf6@oss.qualcomm.com>
References: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
In-Reply-To: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793627973; l=2026;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=mDJHSwdTtjjsej/30s7NiBPFSWOzYIFb8f7eLcF6NWo=;
 b=dm/CydIW7rCy9Md1dOuy/b6Nqbly8kGBr1qFcAfYfZW5JFFK+jk3tFM6hf4oLvxO9GkRu459i
 s06GkcGpwe8CkUUqX+TP1iFofYYo9GOA5Y0jFaTYYrLuYyPV9MbGIo8
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

These V6 combo PHYs were configured with the V3 resource-offset table,
which omits their PCS-AON window. Autonomous-mode suspend therefore
cannot reach the HPG-required clamp register.

Select the existing V6 offsets for SAR2130P, SM8475, SM8550, and
SM8650.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 84b9d6f3969c..f9ab503c81ac 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2793,7 +2793,7 @@ static const struct qmp_combo_offsets qmp_combo_usb43dp_offsets_v8 = {
 };
 
 static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
-	.offsets		= &qmp_combo_offsets_v3,
+	.offsets		= &qmp_combo_offsets_v6,
 
 	.serdes_tbl		= sar2130p_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sar2130p_usb3_serdes_tbl),
@@ -3224,7 +3224,7 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sm8475_usb3dpphy_cfg = {
-	.offsets		= &qmp_combo_offsets_v3,
+	.offsets		= &qmp_combo_offsets_v6,
 
 	.serdes_tbl		= sar2130p_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sar2130p_usb3_serdes_tbl),
@@ -3269,7 +3269,7 @@ static const struct qmp_phy_cfg sm8475_usb3dpphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
-	.offsets		= &qmp_combo_offsets_v3,
+	.offsets		= &qmp_combo_offsets_v6,
 
 	.serdes_tbl		= sm8550_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8550_usb3_serdes_tbl),
@@ -3314,7 +3314,7 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sm8650_usb3dpphy_cfg = {
-	.offsets		= &qmp_combo_offsets_v3,
+	.offsets		= &qmp_combo_offsets_v6,
 
 	.serdes_tbl		= sm8550_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8550_usb3_serdes_tbl),

-- 
2.56.0

