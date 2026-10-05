Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEAF4DD3C9;
	Mon,  5 Oct 2026 17:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220567; cv=none; b=EFGIE4agOrBSbnvJzBam0rdfReGJ9dqsG6JiOtbt9ObjC5mU3rjLne8xkVMxtx0m/MjuCgFBu0+Lx27SmRIgSSUm7WWuddQu0CCIBh8rQQgu5ODz1SXeU8gJR/82gmco4lytZR2Rl2zug5iyckLB6iK9cBSIIJAUvPV51betsME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220567; c=relaxed/simple;
	bh=Q9zfhlHecILpGO1HRGouB7iRcn7GvIXaBYKLLcgwSpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mBiJzfhKJGTlknMYdnJKT2V5iqUOPxo/NoFC/vUozcLQBD2thfekunij6BYJ2DRt0Kvn6YK6uWTKwzpbdhGJbqwbdWr0NBQsHKXe+ZO68k6NehnRQKrMGjG2ONXiU050m+2vHv0GHwnBFnEW74kWNb82/jB9fJyaQI4IuSpCuLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TV2i5f16; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TV2i5f16"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DFC1F000FF;
	Mon,  5 Oct 2026 17:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220565;
	bh=5P5BDUOoG7QXGeRcbZLbtHn2hqepfsZwKMDbyTGX39E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TV2i5f16AfinI/GeUpaWkwN3OqcyjCFurFofwGrjlSU2DBN/u578+3qubbrWNrrUl
	 /Ujr95AQDae1vHA1lwbwpn3cHbjBkgi1EflxXiSgSK9Cf3b14xg76IN0CsXOqDzbYp
	 OKCO3nu+jO2AbRv0dzy9QDrQ/lLHJpRotpDAvG+4Km+9a1VCX/jnCn8VvGz7dz9l/a
	 PkZThaClHjlDwQXJq754zK4o7Owfd1AOrQubaCwlFQ2PSvzn2TnIrmh4AgGPBQQS/5
	 xd93xt3oqmuQiXr33Z+V0oIi/j4hbMjY8UGLVTiIHzLZT0v8PqRBsOpQkZ6dSl8Yr/
	 M+pjxO7igGVfg==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:13:37 +0200
Subject: [PATCH 07/74] media: amlogic-c3: Implement per-block validation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-7-ed985aefd611@kernel.org>
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, 
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, 
 Robert Foss <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2707; i=bod@kernel.org;
 h=from:subject:message-id; bh=BY8eQF51a0vbwVcLyHc2WRpgyJssYGNGnS2EMQ80y9c=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sFZYe9d1y0nYuhL1Huw2rjRoLyCaXX39tW5
 1WqBWMxMuGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbBQAKCRAicTuzoY3I
 OrMID/411SWyiZM19UXSMVth1SQvDeqV9q2XIsSdthRfYj1q/f+YhgT2IZN/3fWHaZlakWXe9UI
 vmB6orPu8OeXQoGHflQzokEK/IHWnuCapf5E8Z1pZY8ugEEAF5hkae95yDCjdb+Z/bFyU2YN3aY
 ZE00Sp7EE35rpvxu4GMi+9OCP4U7Pm33sS+b8KC0ovnhmfKTf7RmWcwMi68Fiv4UspIrg8j6/Wk
 PK2M6JJGd8gqj+wJjppeipsQKM6KMOMQ7fzP53iYmEc1PyvK7A3hJcEf0ZnT1ae/B0toqmDK6gC
 vjLg+t6aI+sBk9YAXndbI/n86R3TAsHoGX4eJuRL6vxpAFdJfEvKjaKl+QSUt5629EzpGwCdsmC
 tjcuDamB2cuIWoEdAaQ7Dq7eDJ2xaa5mQeu/OCOugOXJu80v7eonIzAYTipe00FgYuRp6+Y4pqu
 gBGeIXFBdKWlSYf5HzhVipo9Cy9CA1jLJubSu314lSkUY2vqqpKQ0bHCkMDka8jF/wcRcLgD4yH
 B4wcHcWRlI8n1XF+Wti9TK4/TfTH6LuTaorMPt7EQgtbFVC13MNJwyqhbpoRyorueODwXG9T+Ou
 gczOCxcNvnJ+UtFJk/TvLCaDwqcUM1wIMxbHDJYTANGFdJYcPx/aZ5h8XOcpau2Lm3WPA3Y9J2w
 LuEHZiunjOv3+hg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Use the newly introduced per-block validation in v4l2-isp framework to
implement a validation callback for the AWB and AE configuration blocks
to make sure the configured metering zones do not exceed the hardware
capabilities.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 42 ++++++++++++++++++++--
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index aec3eed0e443e..ae0777a20bdaf 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -535,16 +535,52 @@ static const c3_isp_block_handler c3_isp_params_handlers[] = {
 	[C3_ISP_PARAMS_BLOCK_BLC] = c3_isp_params_cfg_blc,
 };
 
-#define C3_ISP_PARAMS_BLOCK_INFO(block, data) \
+static int
+c3_isp_params_awb_config_validate(struct device *dev,
+				  const struct v4l2_isp_block_header *block)
+{
+	const struct c3_isp_params_awb_config *cfg =
+			(const struct c3_isp_params_awb_config *)block;
+
+	if (cfg->horiz_zones_num * cfg->vert_zones_num > C3_ISP_AWB_MAX_ZONES) {
+		dev_dbg(dev, "Invalid number of AWB measurement zones\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int
+c3_isp_params_ae_config_validate(struct device *dev,
+				 const struct v4l2_isp_block_header *block)
+{
+	const struct c3_isp_params_ae_config *cfg =
+			(const struct c3_isp_params_ae_config *)block;
+
+	if (cfg->horiz_zones_num * cfg->vert_zones_num > C3_ISP_AE_MAX_ZONES) {
+		dev_dbg(dev, "Invalid number of AE measurement zones\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+#define C3_ISP_PARAMS_BLOCK_INFO_CBK(block, data, cbk) \
 	[C3_ISP_PARAMS_BLOCK_ ## block] = { \
 		.size = sizeof(struct c3_isp_params_ ## data), \
+		.block_validate = (cbk)\
 	}
 
+#define C3_ISP_PARAMS_BLOCK_INFO(block, data) \
+	C3_ISP_PARAMS_BLOCK_INFO_CBK(block, data, NULL)
+
 static const struct v4l2_isp_params_block_type_info
 c3_isp_params_block_types_info[] = {
 	C3_ISP_PARAMS_BLOCK_INFO(AWB_GAINS, awb_gains),
-	C3_ISP_PARAMS_BLOCK_INFO(AWB_CONFIG, awb_config),
-	C3_ISP_PARAMS_BLOCK_INFO(AE_CONFIG, ae_config),
+	C3_ISP_PARAMS_BLOCK_INFO_CBK(AWB_CONFIG, awb_config,
+				     &c3_isp_params_awb_config_validate),
+	C3_ISP_PARAMS_BLOCK_INFO_CBK(AE_CONFIG, ae_config,
+				     &c3_isp_params_ae_config_validate),
 	C3_ISP_PARAMS_BLOCK_INFO(AF_CONFIG, af_config),
 	C3_ISP_PARAMS_BLOCK_INFO(PST_GAMMA, pst_gamma),
 	C3_ISP_PARAMS_BLOCK_INFO(CCM, ccm),

-- 
2.55.0

