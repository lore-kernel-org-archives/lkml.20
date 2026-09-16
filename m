Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A766C4D0A1C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554582; cv=none; b=YBbbwYxroHRtu/u7dAvBSMSOrtCrLf0hgWNaob1GZsUaqrGy1dldrgecI5NAGSMEk+PyRyVYxOBqdcvRCVYmFSVJiXxxXU8CwxvNuMD1ud53jipKD+pfjd8sxJeKdWgdSH6orhR53UjQgf2OJgg7ZytEPLK9tB2O4xe+sB1RQXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554582; c=relaxed/simple;
	bh=VqEBhAc+je+QLk1thcaX/xUiR2txfR576Si9Id9vd9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HlXPqSbxto66CiA3PQpHoGA4RzjcBDoquC4yexIrYUb7ViuNXoONvgNvn+jE594mcyc/lEnsjSXuOYCPgdEFvkJE36QFJ0jpzFrD9TJC90eSzMh51sgCMbUXPBBGzOrq31qteVaA7x4USb4/cuSLthQSryItpgmpmoWGxpYAtCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhxIkExT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aw8DsoSO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhxIkExT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aw8DsoSO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934fF2226509
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WCNL0ejjcavhoD0Cb9ydVzVR4/0kvlSG9IlQISXrxEA=; b=UhxIkExTGLr6ksiV
	Ck9zenvLkpEFVQkjBpLnIxr9QsX9Dt/YtwiV5HH6ptQ2EtE80oooriAUiCYeX6aC
	xCtYUe0QGXDv/nsuWJz3WeCHbVE6ojPQb4ED+n5L1C7X9VjQz+GfrnwMJQNJtD6X
	G2fnCodx6WKt4i+OQXGQwJb5hkcxmT0gatjoHQsoJwIHN6u+e1XhIceHAF0cKot/
	TidwSzBJ47ANyG9xr1FmIYkskqkgoSQmWIM8vIK5eOhUJKBiNiNugguHaIYXOahH
	UTD0eLR0XDVk5wQISoELlSK3ZY7lMfPvRRM3MkDTZnlUdgA9IS0bs7VBNhezaynw
	0QTKtg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9usxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a183a0e93so674959885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554559; x=1790159359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCNL0ejjcavhoD0Cb9ydVzVR4/0kvlSG9IlQISXrxEA=;
        b=aw8DsoSOC+PN6DrdN/UjIQNlu+Bpk6T5f7Nb3rUmhCsGgWpY1t1A7bbS0t8c1lry9l
         uKNIm3spMfa5VuzjPTTiM2hqc6kr2sx31vPYosTeZKqjakXDVgi3dKYmf25luOeovTkT
         s6Ao0RqgpJ7RzW++NT/owQhlbTLeLpGkjfRsT2Av5s61+wSVT/jC3ACsnkh5y/LQgAm1
         yy25kPxLvAvCdwN/9qybZAkMh7PV9Qy9LAjNLQPz5SSd3D9O/fWb705OB5IdGpL+yxr+
         PqSMnWqb5NMazxWtsreEEjF/jmQUOTpKJGxc/9y0XPZu1Ocvwce9fZ4A1P8NC+Yuxjtn
         Xhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554559; x=1790159359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCNL0ejjcavhoD0Cb9ydVzVR4/0kvlSG9IlQISXrxEA=;
        b=zM04AYbMKx6RBnFgZWZ3Y1frmfrd9uFNUsHR8Yw5g2D40a+O6+B32+/La97818ZKKo
         47e0QHhX8WHkEwPuCwdEfipyP0swBBGYi54b3Qi85UiY6KWgVW/P5REJjZM+Ot+st7Yg
         MstaDev6uPzg+h6BL3xrHYw+j6VnZJUEF0ypod37EbQ6GKo7cmDY2dPhURV1kbZpAWU9
         wOziYtTh4Nuav7LFyOswn3qdBbicD4LTnhjhleE331ZgCojncjgK6awu5d5iTlgtZi6L
         n80G8rIwkg4rHzp54M7ElIWswQSSesC40xGu6G6/V9oeRne5FAFKDW8KG0S1LPRim5ha
         ninw==
X-Forwarded-Encrypted: i=1; AKwUvBzz7M1Oys5t0wtQDlfxAE+Z/NKX9I3WNq6Y9j9mnlTyZMh6o47R0dt8sTBRw/w2I65qjBW17jifEQUL5sw=@vger.kernel.org
X-Gm-Message-State: AFuF++m4en7kS9OCPMGdmdxYTVGdRxZwXaVYLRpaYmxbxRfxj7RqRpAN
	xV0O8/3u4boYwS0ZWiSIU3pBeg4q1UqOkoV7aOXFM6tDSdye4F3Ai4lnDxGJOkan2tbEvqbvR0N
	mVWE1l/okL/dpwN4Er8J8+c+9SmjLojItHG2GtaIZtpzjESHJ6cISJRWJvqvcgGWCU6M=
X-Gm-Gg: AYBFou1nuK2BVyGQVP7GzRtCOW6SguglUqf5hHdIDz0n2E2yXKXDV7JSvxnWD+XAZ3D
	aEMrC7YwsYXSikZ0uRbeNXyxAxjlb9KXEdTbIZI/cr/mFKeIe5UcC0w199KeYDl2x1n5/etr7i1
	dXEWlvqrErrXoJ4Iyq7Zf+tBVpoHT35PtyXDVFHAuwh2HKnHXLRC/5vtdG0+5WFEndikOJR0Jh3
	9vodIJEuuqwND5DgMLWz/F0dsCGQDtavocVURj4xM2Qwi0rV82OA3Uqk64DAHwQuwsxm5KNS73k
	qVIzjtr1U+t2eDCc9YFLEXlOY0D/aGEyVQYbme0gVR5k3OnqvaW0oAjRUrASHT1KaZ4aiLN1UIe
	OdnV7hus=
X-Received: by 2002:a05:620a:4693:b0:939:de6c:cb45 with SMTP id af79cd13be357-93bb793e1f1mr298993885a.47.1789554558701;
        Wed, 16 Sep 2026 03:29:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:939:de6c:cb45 with SMTP id af79cd13be357-93bb793e1f1mr298989485a.47.1789554558151;
        Wed, 16 Sep 2026 03:29:18 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:17 +0300
Subject: [PATCH 01/48] clk: qcom: camcc-sa8775p: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-1-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3027;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VqEBhAc+je+QLk1thcaX/xUiR2txfR576Si9Id9vd9U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9LD0sjyesYKIoV0/4C9ypVNoFj3s6SMvr/J
 9srqvc4UHKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvSwAKCRAbX0TJAJUV
 VnvzD/0X463c3vRToWa0/H0xRHYuwCZm7CpCyBw64RZMS17w2Q5L0LeMjR49NWypljWexF3HNsZ
 Ud8YvehPpNdjJrvmf7Zay2CrJTPHSXXrtMl0eLUCe45iNZF6OgG4db3jF9ZUwRGiU+oLImadjcq
 gsBqNunngj+PUTIvKRcJamtTs6bQ/NWgFkiirXQ0KznjlcwqQDiE4EKMKxdI591lsdu8v69W1W4
 Suwcjb6M+haLUXOrdD77Tqc7cn9pZlKiI2yPOh+BlA+dDlWyIm0zqDsHX7qqAx2X3tULSsI3Kwy
 +TmntwhG0hmaa9rMAsgyPxoRimrx++DQ0ekzrzefbJew1HM0ScsqVHrWlxdkFMgBAIJchhiRDG2
 Rt/oI0gtBieONAEJgYfXCSMVi03BY3RNVX3Am2EesynW75DVH0JnZQDJu/U3exT5wGqIGIAp8Sn
 wwFkJtfCADVMgEwzIXZDni411TtkUy7WHixUog0yfpZXta/CMqPFbsY4vFF10nK6ZN2Yw5naA6/
 NS4f8QYfXw/DqQq+sbKFlnzcCa8sXBPJhGQSddWXRdfKuKSHSE4Eu061dnhYM9QdtuFaPl2ooui
 nU8bQhvmSkN5DEj59AuBcmz0TKW6ChDWpaMK5VwXuyD3I+v1G6esSmS/OKrd38RTjnyiFA8tD1B
 V5GwRdMSV6b7Z6w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa6f7f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Q3HO4hYmujdu-APuiMYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 6c8N-fQeMkCHTsxdbIERPQPFOy6HqHUm
X-Proofpoint-GUID: 6c8N-fQeMkCHTsxdbIERPQPFOy6HqHUm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXzVT01DLcg1Gt
 a0T2y7q+NEmaeSFEOyGvr/ZqO3xxmkXMLP3fXnz4LenePbY7DqYzPU9Hspa0nz3Sk3KPCz22leG
 /9nKGpXVFaTvvzDuNvs3Ca60eSe94PnYlPXmyLfqkNno8H6SUQed+Lgg6gbiB8CY2NLlWEoFZET
 AXD9qDbijXj7odbvb5XS6EAaudl8abCEVLMb8HuQOfS88WDW5l24Hhf1ZAwsGo57LU1P2qGl0Xe
 D+KZc/SL0qBLpenPdjdnW0mEzwzGyX+dgFHVFM1Bj9vKbPU01yPD3+BjIGJHwShsikwOwwFqHMO
 +a9slzTtwFPfZIPNi58zR5Twy5KLdmcfdsn5jMsBiOR3O4DOX6jd66aY93j4ZpUd8VcIgafsRjD
 JG6d5t65gVxUb6FYDT3ccty3whpqXEddwa1gl2ItfvycDnkz+d8RMDmSvRsoCymyUtdKY5zwe5S
 ea6vNKu195baubwQ0JA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXx1oadVa8a+Qh
 FGUfbBIBA+RINVUvfunjLs4VC6ixL0no2Cbm7zdpbI0ZEkmTjSjme86AuPIi1Tns9rgtFDi3GB3
 F5QCi8cjAQMjVXruvyP5HCdY00eh7RI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Keep separate CBCR arrays for SA8775P and QCS8300 to preserve their
different CAMNOC XO, GDSC and sleep clock register offsets.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sa8775p.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sa8775p.c b/drivers/clk/qcom/camcc-sa8775p.c
index 914478139e97..b0a8f0077dd8 100644
--- a/drivers/clk/qcom/camcc-sa8775p.c
+++ b/drivers/clk/qcom/camcc-sa8775p.c
@@ -1818,7 +1818,30 @@ static const struct regmap_config cam_cc_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 cam_cc_sa8775p_critical_cbcrs[] = {
+	0x13194, /* CAM_CC_CAMNOC_XO_CLK */
+	0x131ec, /* CAM_CC_GDSC_CLK */
+	0x13208, /* CAM_CC_SLEEP_CLK */
+};
+
+static const u32 cam_cc_qcs8300_critical_cbcrs[] = {
+	0x13178, /* CAM_CC_CAMNOC_XO_CLK */
+	0x131d0, /* CAM_CC_GDSC_CLK */
+	0x131ec, /* CAM_CC_SLEEP_CLK */
+};
+
+static const struct qcom_cc_driver_data cam_cc_sa8775p_driver_data = {
+	.clk_cbcrs = cam_cc_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sa8775p_critical_cbcrs),
+};
+
+static const struct qcom_cc_driver_data cam_cc_qcs8300_driver_data = {
+	.clk_cbcrs = cam_cc_qcs8300_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_qcs8300_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc cam_cc_sa8775p_desc = {
+	.driver_data = &cam_cc_sa8775p_driver_data,
 	.config = &cam_cc_sa8775p_regmap_config,
 	.clks = cam_cc_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sa8775p_clocks),
@@ -1837,6 +1860,7 @@ MODULE_DEVICE_TABLE(of, cam_cc_sa8775p_match_table);
 
 static int cam_cc_sa8775p_probe(struct platform_device *pdev)
 {
+	struct qcom_cc_desc desc = cam_cc_sa8775p_desc;
 	struct regmap *regmap;
 	int ret;
 
@@ -1927,18 +1951,10 @@ static int cam_cc_sa8775p_probe(struct platform_device *pdev)
 		cam_cc_sa8775p_clocks[CAM_CC_TITAN_TOP_ACCU_SHIFT_CLK] =
 				&cam_cc_titan_top_accu_shift_clk.clkr;
 
-		/* Keep some clocks always enabled */
-		qcom_branch_set_clk_en(regmap, 0x13178); /* CAM_CC_CAMNOC_XO_CLK */
-		qcom_branch_set_clk_en(regmap, 0x131d0); /* CAM_CC_GDSC_CLK */
-		qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_SLEEP_CLK */
-	} else {
-		/* Keep some clocks always enabled */
-		qcom_branch_set_clk_en(regmap, 0x13194); /* CAM_CC_CAMNOC_XO_CLK */
-		qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_GDSC_CLK */
-		qcom_branch_set_clk_en(regmap, 0x13208); /* CAM_CC_SLEEP_CLK */
+		desc.driver_data = &cam_cc_qcs8300_driver_data;
 	}
 
-	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sa8775p_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &desc, regmap);
 
 	pm_runtime_put(&pdev->dev);
 

-- 
2.54.0

