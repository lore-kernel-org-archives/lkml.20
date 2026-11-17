Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897293;
	b=E3Vy8PO8dEUBmi/DLUbBrD9LfigJhDs8BLK5gmihyoU7PX7Fj3yUFf2QXC9dBPlvC3Hb
	 nPOg/zxNz3MtchdcKdOnhCSosWEexKyaMLmNWzQqhPaMvh4geC6//lBrUWf4AHq3QlQLK
	 S6QAQJhcPyFrLvrLy5EZw+4PmZ2l2ekscHAFR0oM//KQko+oK6M9LMyA5TE3Ru8zuvOt8
	 SDi/laUxO+Z1poeVk7cHO/EPcjCtjeAbxHer5bgxwF8RtuaY+4cQCxQTkJw4FUVtQBlG2
	 JezV5nJXw3JWVTiTvneUMuoEZa99d0eiKntlNbTHkQgimTjOsqnIWsbl9nBO6xkZL3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AI2GRKz7Yv9WAlYECN+gWlj9BFMyJ5aDuyLddx1B2XU=;
	b=E9SIjJRgOe7meDssmbaAdQ6RqtUM+QbcnVs52qupOFJnKc9N5lB+fc9U9A7luh2BZ8lX
	 AcZhL0JKGInFnPnvMUoCVtR9yJGBwZt4NulTN51dUOwQB+x6ZcOfm/N8mCJxuYZP76Vx5
	 YKChlj6YhJSoJUsaAoaRsu/watJpbmCu7IBVgm5IlCk6O091ses26vliz6ATrjCrKEKna
	 8Q/ae10T6Q4bIIM8U8HalgmUFCV7SLIJvUzeDncGkAjAu4r/4L6sVUCQpE+ESEzp4qhql
	 gvfZ7k7Hi3fPpF91yFpHiw6yOnOJAE/rpCtsHDl9lbEFiqcC3S4BnHn6ysWyYLqt0NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VA25vg0k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBX+YZHb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0136C606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0136C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VA25vg0k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBX+YZHb
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH55nud3350408
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AI2GRKz7Yv9WAlYECN+gWlj9BFMyJ5aDuyLddx1B2XU=; b=VA25vg0k3YoUptSe
	S8x8WTXBJnwEzBta/nVvRNqbWEjq+EimeyA/UMXaed+smIcbBOS+ib4rWfgEiIFD
	GLKKbF3nNlavgXqIS7RxpAsqIjzDKqMDk638qbTH51CldOByuE85/T2BDAxVR6Ae
	BQLcJAt5cuy82EoNORnVw19Cwg+3wtv/S6M2XWTWCgaeLyP6wP66vs2JT7na8FTR
	bTuIxSTZAh3nX7i15eDpsROJWWaE+E0HaCI64im2rzAQV1CiRl4BgxK20de3f4If
	NtVCnHU5kWbiEz8+cZGj7W/K+7x8WbfEKj64V4Hbf+5X5Cg5x0jVmp//ygKPoLwI
	U/PSKw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr09gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:34:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb8c46e240so2418481a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897291; x=1795502091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AI2GRKz7Yv9WAlYECN+gWlj9BFMyJ5aDuyLddx1B2XU=;
        b=GBX+YZHbJId62Ee9is3txR9l2+hZz/KtFervLJtDs0LQ0Qne+pHVRx+YCFHwqViv/L
         854cZR8+wc3ZT0jaDGuWfOQSHeBkJxOQR4e+5kc4qZ+kOj04Nfl5Uh7lYAWselRoLfKG
         W39QarjLaNtZDCSbgPQrJU/A/86dGewXftUmtBTdjK6M7LhyGrv095bhtaijkzSWFSAv
         KJzHJdF6kIKvtyRcio6y6HD2ZM6KBz+/ijM8fOfmcz0mFvhP/HjT83XMHoYi/gj7BwQR
         rM+V/i2pTfZlQSl+pA4vmABgmwWr8ZodI2cNSIZqTXqXLTmOl/Q4oupZCxAtf9Zmtoir
         SYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897291; x=1795502091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AI2GRKz7Yv9WAlYECN+gWlj9BFMyJ5aDuyLddx1B2XU=;
        b=SSldMrZoMN5h/fJfS/4I/D8hmjfcbiuNZVeLEgrLBO9nb9E581BFqdRCnxRvdsV9j6
         YyRBwO0Gsc+NM+A0w59FXkmNi/9PpgzETp6p+9DBEixuPtD6o9HuB+MrcRwNLACBGelD
         w01HLtnjj8asSvnuRwzofkRGETVdDtkEwEAOAc8z4HzHdSmzghniAF81Y4XqvLJqr72X
         Yw47PD91Jaxwhzsj6css7IxIV6KcSiXeC+1MvYSX0TQbI8XmJG2B5mVyqjfEae1xeRlx
         bO2OHG3AlbiV0bAMSUaVkQ89/6TmCNhZX62s9/TgMml4F4m+DY2tUiBSCGgt5494fmXq
         khNA==
X-Forwarded-Encrypted: i=1; AL+hErErujok/WT8Q0+sZErRlfBNz/deoG2ry28nWGrr0+RukQpLxVE365EkSxZjC/kt5iUgkkaMBQbA5evnHKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UnPL3FFEfbcwdrwkrTKU049NI4wLvnJYvecjpZCmSj1Xyrsp8
	/PbElNi66WU3DwKcFoNdKjAmaGG10Lq2vsa79ein41LlKF02IigtHf5MsF/EjIvVsAoYZa8rJMJ
	WfF619yUcU8/LhVs9mRqjRfIRkQi5cYazadoxRu60tl+433XRlMJe3BPzerhqOY+Bg10=
X-Gm-Gg: AZFdTZeW1mL6z92noHEfCKmA/noNZ5D60oMv60S7CYaxZ4Dn1BMfOMKudVJX3QQXYND
	zT7+7J8kMp+S7QHeuDM+U8Jze7qmDojwu9UjWV2bEUTAvjOt68Nf0iptnAkDFRUovqVMztNOzh0
	JY+GU3WSgfSLhtStuo+GsFd8DfCZG8aDWPg/zKJBzY17nljqJoItwoVRZ3Tivvwya+ezpnhKprl
	ZHHrOe6WDnBRN2zsNwHGou2W+DgGttMdDSnSovzKj8pElUOH8FrjWwLX2THyvsIHvXxxUytaM2f
	0OOWvv24lGaxt2eclsQMkEd0RRmI+Z/xdOh1EO48gGeo9TE6zr3hO2GPLahLJIM/GZbr3AIMFar
	jtpzjdnlgGxK6JqyRCmKnNcYsFq/UmU30DoR13lXWkDapknv7z8zJpc3RWMQJB5YcK/Hu/oSi8y
	DkttwKZbW36DooVTzuiqJwHWho1wVk2tmpvsnqkkMEsWfmPNDM
X-Received: by 2002:a17:90b:33cc:b0:3b1:2237:3c93 with SMTP id 98e67ed59e1d1-3b1b0a42bd2mr12201507a91.18.1794897290757;
        Mon, 16 Nov 2026 22:34:50 -0800 (PST)
X-Received: by 2002:a17:90b:33cc:b0:3b1:2237:3c93 with SMTP id 98e67ed59e1d1-3b1b0a42bd2mr12201474a91.18.1794897290024;
        Mon, 16 Nov 2026 22:34:50 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:34:49 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:34:31 +0800
Subject: [PATCH v3 2/5] media: iris: Add support for Eliza
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
Message-Id: <20261117-add_iris_for_eliza-v3-2-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
In-Reply-To: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=4891;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=lQP3CRUQYrnJxA/r+Wb5Mk4D+GCuhW/fdH6ujAAKVxU=;
 b=/AxlZ0UyBdyqb4BGTVCBmBFu86q2syu87MWGpKSr1wcvrRQC1bCkzVIUjFdOTdqsSYfRXFtAO
 widnJN0klymBEVvGibbhf8Tg3ket7I/RCTzjRvKSU7XGPGkVJ2M1/fS
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afbf58c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=keAPckw3ocdkVcR2fkAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: vQXYgR-x-XfqIuOGivqhi8xcBnxC2aQJ
X-Proofpoint-ORIG-GUID: vQXYgR-x-XfqIuOGivqhi8xcBnxC2aQJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX5qUd6bUXjP04
 vrZO+DUtXfvr2Fl97HtYZyRPkKzcF9oqvD7IjOIqhvVFzpLt6ns89M5Vcj8gUThvoUZjxbj5WZa
 KqbCRHV1j6MEGpvSLAd2lIhfV2w06vRR8M09YlYSBH95Z4dPAUmBOWRp8wlMPxuvklFu2SvSf9K
 BD8ivEg+DQopYt72XQWFgptYZ2HS+Snt7yAvvWpFgwj9j3L96ZPuVc4QcGE8imX+IoN4Glx/t/p
 egNVIB3dkiyes8XeRkJpLBB4fh5DgjDIR6r3l6dzAPMgNVIQt3zaxZfhqzhiSlZ4IbKD/RSl3l/
 SQMlHw8xrQuuoOjQ/5vHDDwM6v5aytLjVhXwVpCGdWjAuPjdNEiuhJe0R4Lpg0PlYBzlU78Dwha
 DmeAtQYX0L1EGLoylqBMMxaL7Gugpm5JNjIM+40h+k8ODA3X3OHrqBMw0j96i1kHHd6NiT8J1Fv
 dV6ChUiPYdoGYVWkvGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfXxmYpc+B7cgtv
 XKUIr7mLPgCj2sZhUoNm+4tOTdIGmIA9N9uyq7+1XK3lnMiIerUw2Jyo3XTL1W/Gv988qGhsaXA
 yadTSfpzMjlsPMRigEmyzyddCsQcDU4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170025

Add support for the Eliza Iris video codec. Eliza uses the VPU3.3 hardware
with a dedicated vpu33_p2_s7 firmware variant and SM8650-compatible
clock/reset tables. Key differences from SM8550:

- firmware_desc_gen2: vpu33_p2_s7 (SM8550 uses vpu30_p4)
- vpu_ops: iris_vpu33_ops
- clk_rst_tbl: sm8650_clk_reset_table
- controller_rst_tbl: sm8650_controller_reset_table
- inst_caps: platform_inst_cap_qcs8300 (4K capable, 2 VPP pipes)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 45 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 3 files changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375abc6f803f98272619ecde8ea7873..dbfb4d2cb7c38a0fd12804b519ba579692916e19 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -62,6 +62,7 @@ extern const struct iris_firmware_data iris_hfi_gen2_ar50lt_data;
 extern const struct platform_inst_slice_caps iris_vpu2_vpu3x_slice_caps;
 extern const struct platform_inst_slice_caps iris_ar50lt_slice_caps;
 
+extern const struct iris_platform_data eliza_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcm2290_data;
 extern const struct iris_platform_data qcs8300_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index e963cb116313f8e7619dc0686257801c09c7925d..f16f94a2dacc6f63d5ec40a8f2cba909a0d04e0a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -44,6 +44,12 @@ static const struct iris_firmware_desc iris_vpu33_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu33_p2_s7_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu33_p2_s7.mbn",
+};
+
 static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
@@ -87,6 +93,45 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
 	},
 };
 
+/*
+ * Shares most of SM8550 data except:
+ * - firmware_desc_gen2 to iris_vpu33_p2_s7_gen2_desc
+ * - vpu_ops to iris_vpu33_ops
+ * - clk_rst_tbl to sm8650_clk_reset_table
+ * - controller_rst_tbl to sm8650_controller_reset_table
+ * - inst_caps to platform_inst_cap_qcs8300 (4K capable, 2 VPP pipes)
+ */
+const struct iris_platform_data eliza_data = {
+	.firmware_desc_gen2 = &iris_vpu33_p2_s7_gen2_desc,
+	.vpu_ops = &iris_vpu33_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = sm8650_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
+	.controller_rst_tbl = sm8650_controller_reset_table,
+	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.clk_tbl = sm8550_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_qcs8300,
+	.tz_cp_config_data = tz_cp_config_vpu3,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_4K * 2,
+	.max_core_mbps = NUM_MBS_4K * 60,
+};
+
 /*
  * Shares most of SM8550 data except:
  * - inst_caps to platform_inst_cap_qcs8300
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 343e44c6b9c46190a4fb3a0055ba012b16011235..6bf6b2886f151036c34645aa2c6daf3f85f53908 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -418,6 +418,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,eliza-iris",
+		.data = &eliza_data,
+	},
 	{
 		.compatible = "qcom,milos-iris",
 		.data = &milos_data,

-- 
2.43.0

