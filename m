Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC4053FD55
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876118; cv=none; b=ctiACIISUgk1+Nwqw88MPSD1o9wTWRblRN9Eem0aOBUPo3qfWbfh8E7ekHLJMpG6Zrr8XRSOUSXjpJzy/kuaY4eHtpBD9MFjbl+Z/al8rtX0MGubdldit/3/6c9l5+Bwhx4pj9S8liqtuIJ9PoOdAgpVya0JNWvPLw24uXQ6yMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876118; c=relaxed/simple;
	bh=q3VVEORPnlb5ty+z8CrjPhA6J+DQ5z8caK/9hZZE4Fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sxlLNlAjvbRxZ9XLCb7YyiQPAEv2xapGO0iWx2RSmJXaRywfyDMsQiaga81IGwbNfxum2nbBuuEocz6wArQ6A0BoP2uVhzXIP2i2ogd6hUVMX3uCM06oV5bUpVsS+R+nqF4bevWGctk1RqofH+C6SfRUdY6dyGyhVQRCmO8wlxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fownFaJh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y7hAnVi/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fownFaJh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y7hAnVi/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CkjJl2343363
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 14:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amqkgHTiF36uk/48XKaaWRtXH0hd/9+8IKYGEUjY5nI=; b=fownFaJhS+Hn6CKK
	/FDzKMZzpM52x0aG+HE5wT7kn9B8rNLmZihFNWxLa1l/PeR34dOA4CSSjMbfIQ39
	Py6eKUlqmOIKKE+XyplEZlQjfbLaUrUcHAfRvbEiHvnjYF1EW13KuUyknqsuRwOC
	sLK4CapHJQIPjTl9vXU3xzyrNfYiyhXEXcO/SzduNkfnP8SXDc7XAjMOQObC5F4x
	PpsWCn/HcdAoyqlgcjemYP2qQ5UIF9f1vdgsy9NK25Pu1T1D5e8ZY8uOT9JE08B7
	+SoPlxdzM5d+l5N87RKXjf4oNFF0UsIxv2paxzRSlHFWa1cn9mDd79+rafrsNO64
	G2IU6A==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjjbv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:01:38 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b34ad165e3so2594484eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788876097; x=1789480897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amqkgHTiF36uk/48XKaaWRtXH0hd/9+8IKYGEUjY5nI=;
        b=Y7hAnVi/bJoWppYvujqUIKXDFHal5coFRUhlp5MBv/TLTCMWULdS6IiSh23bKUTRd6
         uEATZo3l+XIEviyvduseXw+r9esm+7+ZoC8r6JJKpKK6x8KuW+QVKf5zTjQrgv0NLQuP
         CSfjWqv+w1qa5rg2VOUSeOtAtHlKq7KvZ+5SNIRYPjzdcskhx+jH+Nu/bxjPjNxGljfb
         j7ufqYJK9/ODT5Ll9RHtUlbAZ/76G433/vIxeAev/KBxyLLlJ0vLAQdc+FM1gWTyDIan
         2gjX5Cb/Yd1eR26+O6892IXZ4lfXKM++ADNxfOS0SDIJktpAgFtbyz5bTGl15LOzm5YS
         uVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876097; x=1789480897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amqkgHTiF36uk/48XKaaWRtXH0hd/9+8IKYGEUjY5nI=;
        b=VTWZI0NCmGPYkS97Amt9J/rWfjHf0YnCo2DiqgrxVRZdEjmzCRYp9v4RnFLJW0g9zY
         7yEXl8jXO4OGn98mYazd0br9m9xkDfxsXrfd5kigEBGXFkuLoJWKeazyRqchIlOeIV/c
         Fw7TaezFJsa56VlmLRr9azIlwDA3WAhmXzWae3v+/w8RW0d7kr/VnLW7xAWq6H5/ZzWK
         uY8ANklCnn3YeWDFps2HfFLE7lKSNh2yfBOiaeP9sKXFAmLGEILrc8w7JvTdbi43Y2hL
         GyYQRMoX16PViaHjv9NYHhtofUdQfkbWFCWPt+kfDi29cnuOr36zdgXbe9pJiLkadw0J
         zFTg==
X-Forwarded-Encrypted: i=1; AKwUvBwwcqP+CHlQDkB9Ln3U0gbTm6he/6d6dB/i13VALaLocASjPhB643mlB0xJtj/P+Iv5LxPnD8RtPbzsXZw=@vger.kernel.org
X-Gm-Message-State: AFuF++k8xi3eR1dkMh3o7bpZzo/1JeAl62NtxEgmW9/lUG8XtRD78ups
	vMc2Z7XPfA+WZLqPDpCUSEx+L/YtZi9JUuyaJerQHKRr9WDQ+oJCee4BJGpSFVXaRnw8k7+531U
	h14ohCKfgnOejr60DUK4Eaqb++JtzFd2jjSsTsRbip2hAEMjHT5oAeQUlgasogdlmXgw=
X-Gm-Gg: AYBFou1DLtIuZrfWGel7nwwald8gP6Eq2rxOLN11W5qP25s0HtnacBAgTkLEQjUn8NI
	zAcEqqJkFM6b4D/8OfnoVafGX4UMsz9xTmrJcvmqypUNl6skgaXkMAXcH9D8tgF+Tj+6kX3JjqO
	SqhlWCIKREYTdYFI/KRK2VFNJbP3fusiuHwGxfWhh70+qWPhClhUmMV5znFAIuapDLyxsi9canI
	Vgt8FisK9Qea3p+/3gWTn3Cb/1d7IcRkRG+WXYTHkcrEUDLPqAHQuJpZrSVopjplwTXtkaI1NQ1
	YsRPFegiTkuDU+Y8MPUIN3mIfV4PdWksvLMfpBy59m/zUXMAKVRhBvD9Qj9Quxtd6vwPnaJ2B5i
	hI8zkeGdnWL3iRtramCTw6riaaTw=
X-Received: by 2002:a05:6820:4c86:b0:6b7:8396:f3d9 with SMTP id 006d021491bc7-6b78396f8c4mr12804753eaf.59.1788876097287;
        Tue, 08 Sep 2026 07:01:37 -0700 (PDT)
X-Received: by 2002:a05:6820:4c86:b0:6b7:8396:f3d9 with SMTP id 006d021491bc7-6b78396f8c4mr12804696eaf.59.1788876096755;
        Tue, 08 Sep 2026 07:01:36 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm57506667eec.16.2026.09.08.07.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:01:36 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 19:30:58 +0530
Subject: [PATCH v4 5/9] phy: qualcomm: qmp-combo: Add v8 PCS-level drive
 level tables for Glymur
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-phy-v3-v4-5-ff22e5150538@oss.qualcomm.com>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
In-Reply-To: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788876071; l=3229;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=SZqWfqI8Uaq9Fsg26hs+0rHvzfccTqoPLnB7y5gCqGA=;
 b=pEsSqjkrPwFXoNyHe/+ypMPJijCo6Djb2nbX/7fw8WkLsEDtHXnelec5lf0WYJF3YUKtNebC8
 z6zowx16VRmDnqQ3I62ZnlgwkJClTYgawKitc2YWPeFiCi5410GBnb6
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX0yv7QQm5dB1Q
 5B1atiolh8pyHjMB8XwrSDJAOGt82kYfcwuRcXhi4TY9IMsbG0jtpQQTojRshiWVHvHIQIKOGHR
 dmkwgSGwhzHsk9yuLoeMh0/3losfB4Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX5EIhj/+h8yxK
 DEzFnHVRB1rDR7HnF5t+pfCHcRs9u58Y4DO2hrcmSZ38fF/RaXtoiUXGOM6c/06dFjayuDZ1xEX
 mUp7Dm9pGTNvJ/1nTB4Z6FjIoWTw8fRU8w6m6B2Y8qVSdStDdlsV67kOQzwsRp6UAb6vC4zyokM
 cjGgeWLCQ2aCst21GgoUk6/hmIHf0UqQu+a3n1k7PBlpr2ZeeSF1uIXLd3bibyjn09PXK4GTy40
 Kokf08GbeCD0WiOna0+mo3iuww7XyXyp1mEhoUNvIRj3i4tGqDZyLcyC2yY9rimqbpuzXP0JtGg
 NgDI7Sfb0n7vUm9V0/QjsuJF6nJPKi+jVaAMNAttyvF7wYfEbEXlmzHkOJzeMmCjOvljmkcg/cZ
 /W/KBg1hXFvEvXusbJlGqbHLOZb1BmCftbdJ42Qb9zblj26vr8CeUcAGxrQl8j4SQLpF92CXwQb
 z85ru02wj/t0twa28/g==
X-Proofpoint-ORIG-GUID: ZCs3G2dljpX8jBSgpQOLobxX8DoPFjsK
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6aa01542 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pJ9Jp-POzqCVGtXzzgwA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: ZCs3G2dljpX8jBSgpQOLobxX8DoPFjsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080151

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add PCS-level drive level tables for the Glymur (V8) DP PHY:
- qmp_dp_v8_ln_drv_lvl_hbr3_hbr2: LN0/LN1_DRV_LVL settings for HBR3/HBR2
- qmp_dp_v8_ln_drv_lvl_hbr_rbr: LN0/LN1_DRV_LVL settings for HBR/RBR
- qmp_dp_v8_pre_emphasis_hbr_rbr: updated TX_EMP_POST1_LVL values for
 HBR/RBR

Add ln_drv_lvl_hbr_rbr and ln_drv_lvl_hbr3_hbr2 pointer fields to
qmp_phy_cfg to allow per-platform PCS drive level table selection.

Wire the new tables into glymur_usb3dpphy_cfg, replacing the previously
used qmp_dp_v6_pre_emphasis_hbr_rbr with the corrected v8 table.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 33 ++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 53fc1d1e8494..0ec382aebe2b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2456,6 +2456,30 @@ static const u8 qmp_dp_v6_pre_emphasis_hbr_rbr[4][4] = {
 	{ 0x22, 0xff, 0xff, 0xff }
 };
 
+/* HBR3 & HBR2: DP2_LN0/LN1_DRV_LVL swing settings (PCS level) */
+static const u8 qmp_dp_v8_ln_drv_lvl_hbr3_hbr2[4][4] = {
+	{ 0x02, 0x12, 0x16, 0x1a },
+	{ 0x09, 0x19, 0x1f, 0xff },
+	{ 0x10, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
+/* HBR & RBR: DP2_LN0/LN1_DRV_LVL swing settings (PCS level) */
+static const u8 qmp_dp_v8_ln_drv_lvl_hbr_rbr[4][4] = {
+	{ 0x07, 0x0f, 0x16, 0x1f },
+	{ 0x11, 0x1e, 0x1f, 0xff },
+	{ 0x16, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
+/* HBR & RBR: TX_EMP_POST1_LVL emphasis settings */
+static const u8 qmp_dp_v8_pre_emphasis_hbr_rbr[4][4] = {
+	{ 0x20, 0x2d, 0x34, 0x3b },
+	{ 0x20, 0x2e, 0x35, 0xff },
+	{ 0x20, 0x2e, 0xff, 0xff },
+	{ 0x22, 0xff, 0xff, 0xff }
+};
+
 struct qmp_combo_lane_mapping {
 	unsigned int lanes_count;
 	enum typec_orientation orientation;
@@ -2542,6 +2566,10 @@ struct qmp_phy_cfg {
 	const u8 (*pre_emphasis_hbr_rbr)[4][4];
 	const u8 (*pre_emphasis_hbr3_hbr2)[4][4];
 
+	/* PCS-level drive level tables (v8 / Glymur) */
+	const u8 (*ln_drv_lvl_hbr_rbr)[4][4];
+	const u8 (*ln_drv_lvl_hbr3_hbr2)[4][4];
+
 	/* DP PHY callbacks */
 	int (*configure_dp_clocks)(struct qmp_combo *qmp);
 	int (*configure_dp_phy)(struct qmp_combo *qmp);
@@ -3420,10 +3448,13 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v8_dp_serdes_tbl_hbr3),
 
 	.swing_hbr_rbr		= &qmp_dp_v6_voltage_swing_hbr_rbr,
-	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
+	.pre_emphasis_hbr_rbr	= &qmp_dp_v8_pre_emphasis_hbr_rbr,
 	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
 	.pre_emphasis_hbr3_hbr2	= &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
 
+	.ln_drv_lvl_hbr_rbr	= &qmp_dp_v8_ln_drv_lvl_hbr_rbr,
+	.ln_drv_lvl_hbr3_hbr2	= &qmp_dp_v8_ln_drv_lvl_hbr3_hbr2,
+
 	.dp_aux_init		= qmp_v8_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,

-- 
2.34.1

