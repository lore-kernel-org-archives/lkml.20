Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F964E2F12;
	Mon,  5 Oct 2026 17:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220672; cv=none; b=epaD+lVIOGcgerIPuJlT8PD2U+SqVhNvWZmBtOLwKa2HS1aYPaVb/FirROZfLSPugSDtfimU14cesq5yQHsXRFxrWbotW6iap6BvUSUoO+/zUk/k7ncNupmuZixORbXBGtntnGJBJ7CDPHMM0Uy2GSEa/NAC94DkTjbcd3w4HMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220672; c=relaxed/simple;
	bh=EK3NvoQUETF5/AQInjlFcTebBn9AM8Ap/sXLcnjOmqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lKbhk8CiYKzj54Vuf8B1sOCXfZ7T8ot3J+ATIQQlz4HUsKlwYNrvTwgkJG0BgL9IQKKuOoFmBxrNSYMzSK0KdYyY+reuSWIA+vA/3HQrIPYdGAG7qn9hcYPuDZ9LK9FSW7WcD8/kh8Zt1rcv8hvnWVEeLq3oQT+wlIu/yVtDMtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxoP+nHa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxoP+nHa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90151F000FF;
	Mon,  5 Oct 2026 17:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220670;
	bh=jstK2p4pMpjcxzWQJaz6p8Z1rKW5ByVtp5DmyLpp35k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gxoP+nHa20unNdvZ7YBiVm2btwDsuF3HygeVSZICZL9blkZ7K0YyJmzcICScfZvpp
	 iLk5TtLI2zsbeHCxKEKpHGBT9gfWQvYltmXLqIIWAfpaXXtLdMGveNmqg/MwttvruG
	 gD+DFcbTIOZLNymb5O+nraS5DumunXHg/ATDMgOXOcb/N9BeqaNSanly++3Hs9iJ/G
	 uWsllYvOmGRBr5QQA6CB6hFEquDln2dlO1xwswplV2boKDkLH12k1r8gpEj4HK5Tnc
	 1/8jlLOJqHvKfnXrgB81whkSqrdkdLl676nnJkfnsEKCA8Q2nF1/34JuBflmqDk7xb
	 2Td8tviZAmexA==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:06 +0200
Subject: [PATCH 36/74] media: qcom: camss: csid: Add helper function
 csid_ipp_bayer_pattern
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-36-ed985aefd611@kernel.org>
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
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2629; i=bod@kernel.org;
 h=from:subject:message-id; bh=8QDFT8nC8AU31HIKZPJQc54mteqFqQ9vXecZpF0P7qc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9saO7MpYbN1zYu8COpbOPD9nxIBCz0Tv753f
 ArXa3rUclKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbGgAKCRAicTuzoY3I
 OrOMEACUtei8/Mg4Aov3H0n6VI/fyqS1EElGN3SaMrLrSxpUQMW3oZHvtlB3W0vOMLg+lzpCIvd
 vvm6OBvU4F54efSIxfKnvATvau7Pg3gs4MB3oWwNTyhnGCaVNbNDa0603U/tSBawEVe+MJKUH0+
 zd95FpyScGt5TfmEpbZWr4fn3qukHnwmFU/pNxrUFTLnwB6Tzk8nOcAo4Ykg8MGReZ6uSWG4Iep
 zRTHCSQcijd79Cw4Fsy6psvKvdVZouWLEUDcG5r7NSgbnlYBjUP0kijyCp6n95pSHAKxEjwVn68
 dYtAb7oBYxxiCtA3lO9O6NbEcOWCQWipCl2qnZe6Y3Jq9YHGjy9RcdD6tOYt2rySXKCocANjAQy
 z2fv4erF5+8UaMS5Q/OkXJtJAXRXP6Fkrp29f5FxNWYw33W04OSJwvR//cT5uuNOdn41KKTsW5z
 mq3G/exCmbDQYVU0ymqz571mBHj9XwJA5A5o1tnCsi8E3hsBE0STRusxdYkGYlewCJuo6KrBy4j
 Zx+kbxcGAH30OGEFheaPAL1DLGZ7KKmvTXZ4a8vQWTj/qcDn5inVnQgvAgIhuNpNDTt/jwKf41l
 iF6oPGeZeNSv603CgHZRf2YxRSdrvxR1HJ78N/mlWLW3SuxDsTqr4zaMbPOeTBw4qstULgR8+bk
 ky2sQopytx5gypg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Simple helper function which translates a media bus format into the
appropriate CSID IPP pixel format.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 28 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h | 16 +++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 645e02ad6b9b1..abdd7195fa6c5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1437,3 +1437,31 @@ inline bool csid_is_lite(struct csid_device *csid)
 {
 	return csid->camss->res->csid_res[csid->id].csid.is_lite;
 }
+
+int csid_ipp_bayer_pattern(u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_SRGGB14_1X14:
+		return CSID_IPP_BAYER_RGGB;
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG14_1X14:
+		return CSID_IPP_BAYER_GRBG;
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SBGGR14_1X14:
+		return CSID_IPP_BAYER_BGGR;
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGBRG14_1X14:
+		return CSID_IPP_BAYER_GBRG;
+	default:
+		return -EINVAL;
+	}
+}
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 53f43ae7b9327..400995f35f0ef 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -44,6 +44,13 @@ enum csid_testgen_mode {
 	CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2 = 9, /* excluding disabled */
 };
 
+enum csid_ipp_bayer_pattern {
+	CSID_IPP_BAYER_RGGB = 0,
+	CSID_IPP_BAYER_GRBG,
+	CSID_IPP_BAYER_BGGR,
+	CSID_IPP_BAYER_GBRG,
+};
+
 struct csid_format_info {
 	u32 code;
 	u8 data_type;
@@ -247,4 +254,13 @@ u32 csid_hw_version(struct csid_device *csid);
 u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
 		      unsigned int match_format_idx, u32 match_code);
 
+/*
+ * csid_ipp_bayer_pattern - IPP Bayer pattern for media bus code
+ *
+ * code: the media_bus code
+ *
+ * Return: IPP bayer pattern constant for reg programming or -EINVAL
+ */
+int csid_ipp_bayer_pattern(u32 code);
+
 #endif /* QC_MSM_CAMSS_CSID_H */

-- 
2.55.0

