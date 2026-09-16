Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB584A8A16
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554634; cv=none; b=A3d1kkI+agU3jXgZe6B3WVaWLFHTPA7N2NfSyNKgFU9tz4AztJ3/9bZTf4Ev73XmR3izP0wdTJWJVyCdYAacL2k/6hT2fE1v1h058e07T8h7Eq+zDo4/7bwYyt5km7BparHGiinxZEj+o3anrFahBwbzMwdLIl3jLcGPJepAa+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554634; c=relaxed/simple;
	bh=iXUNYaH4A1wy07zs/nnJgB8Uf+MSyhMYIfjrKnWdaUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UEVkrqc0evQsmjePEwPOUKhslmIaygmEVM8x4/cnMi2ETjSjGueDBsKbHI3VLzgpMPszPvgOrBv8QU7DmTE4Hd6ijOtLsuLu3mWtCs7vYEpupkkSQiYT0IAvirietiT09GpDGrD6CTGoqjQuQnXXGC1QXzY46bjgLYl8qR72RMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eE1YX2FG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kun6Tk+/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eE1YX2FG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kun6Tk+/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93AMc2658311
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTctgnsk+7+DKp13Yn5I3XzOkNFK4BQpKT9A6LCQGQE=; b=eE1YX2FGLQEW+594
	yxtfQMNy274bTYynCJODx9VnptHd4/PkGXlWvRhf0KJRVVHQM4pj7uaI3u7KrWml
	0V41qNJ4CGNbtiV6o4hTrdFTLBM7MmsXF8OWGU/HpHuDQLcz6oJWLLb8PB6xOFjU
	grakThKaMnz4NkgCH3Ava5wJnqx6xylghZapsvSneuLAOuVsarJMeJ5gZ+t1pM4J
	Bn5vnewgcY75PDcJ0qSS5+O+smBIxbZ/vDk4VTdT+QIhE+rAqpV0CR0vc6GivcMO
	c2trmUcX4my0fWL/cJrZ9mwVk/mSMs2J25uxEGEuu02UCCBfVPpt9//r67ebDX2q
	ucjYJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftujape-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a2d361e1aso18771785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554589; x=1790159389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTctgnsk+7+DKp13Yn5I3XzOkNFK4BQpKT9A6LCQGQE=;
        b=kun6Tk+//vWtZQvObDFhYs0AqJfHVNfdq3gn2eoNaClALZp8xVP5LDpQfGUq5+3G1g
         uiggELYVYKa/EEC+gSDA7pXv7uU6b8lfFCO8fqqBrg1HLjagdI6XOB8uTCO5h4I4+BBC
         So0wegoF2PvjObACwjkD5aBSJXqcCBEsn65htqAE1A7OgdPSAdr2ht6Gy9n+/X7/Io/n
         bQpLYRf+7qGMfIldx2dXjwP02ClEPWauQrXkw72DyBcYnqJxJPApW7C/gX3gqm828x6I
         FadyGARPt0etiQr6AyrR5qITBFVtBIYYGDvr+GKiNCPfKj1kf9fU8uJz0StiATB3o9OJ
         L67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554589; x=1790159389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTctgnsk+7+DKp13Yn5I3XzOkNFK4BQpKT9A6LCQGQE=;
        b=ag2yCLUqiemQnOJyQBLYV8FE/7VPtLRzfY1iUwER8d60AWrsN8+ZC+MGDQ8QAX+l7A
         FQGDraIM5vGeqBe1OIxXj7a0h8ihv7KeQW2/d4jqerXRgvplQZzYaoJjQuqVfu+eSEvm
         41UBO31rVksxloxj4FYUlTNDgNdjCe+GG3Pw3DXkSjMSOnPhVhtAycD4euV5VySIXUW4
         QpDmfJXJVKNm9zobgpswYgpeC9difBi3oS7KmSPEgisEGGA+EnW1D0QGV/Z1VCj7Isyw
         PpWgnWk8GgMUHH3w/Qk2dB3ny9ks+LyYWiayK8cs5ps8Tqq0AvSHaTBru5T4dzHYrVFz
         fD3A==
X-Forwarded-Encrypted: i=1; AKwUvBxXgRsJgUmLxN3QCoKI0xD+wyX4V43M3vcD7CwfgOoIuIkhfSk2wbnWDmBuIldy+BjpLseUaOi/NxB7fcM=@vger.kernel.org
X-Gm-Message-State: AFuF++lm9vi/GjeNABAXGVfxFryHxGc88w0OSMLn8+prT6W6fZuNuppH
	NLNGcxPf8P1MyEqufV4yMxBkrMzbeI6vZ/f0Zv8v6B4OzTWEiQPwjCS7tm/ZMYpnMjsrTaOXiGi
	om7YjTBbx4uy/H4DTsvtq5sAbNEmC2rPDZZqvHasO1CVlsm4HKBLl4djGaatIKijVWQw=
X-Gm-Gg: AYBFou0oqC/TuVeBJcX3sPaDQIMELA40JLmhqGTJQ3ssxHzzm/+Xaxf+iw9Coiwdgi6
	tiFAZ+ecZ5mVmrtzFSkR6XDhMeKT9Xh0j/ol2LrCbpXtJkMsO0eJPsNHtKK/2ffUOqmB3tAo/hG
	Yifl82g8P0oLVfiA/XGjZZAcsFVSgn8C8EEUhTwTO9XRovG8lrlsADihzw8FRD3aedmUmj2YYnI
	AZjU54QFoRkxKBilpYAMKN83CxyMURCDl+E/zPiSWFVYKU1WAyCd4M9u6blK1qLL3vEIkEFuIUZ
	pm7hUndF/3E3SgKGP8uGVhzGrx9x5duyojXStbsqMbhkTMpH8ldoowMwTgNTZHGJYyvMKfJ6+UM
	wFL/EFfw=
X-Received: by 2002:a05:620a:648d:b0:92e:45e4:c6e with SMTP id af79cd13be357-93bb774e0c1mr329148585a.22.1789554589520;
        Wed, 16 Sep 2026 03:29:49 -0700 (PDT)
X-Received: by 2002:a05:620a:648d:b0:92e:45e4:c6e with SMTP id af79cd13be357-93bb774e0c1mr329143985a.22.1789554589028;
        Wed, 16 Sep 2026 03:29:49 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:33 +0300
Subject: [PATCH 17/48] clk: qcom: gcc-qcs8300: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-17-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3169;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=iXUNYaH4A1wy07zs/nnJgB8Uf+MSyhMYIfjrKnWdaUg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9bHdyf1pQUsGFGKbe1NTNuuW3GVZnsugBB7
 RZUqtuQoSCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvWwAKCRAbX0TJAJUV
 VnRFD/9aAyvenpt39gBdAL77al9ea8VCCnd3ONwZM5yjLEym2+QbuiTgYvTjXA8YOfecjxrxkBY
 /1hQuii2CfuX+PAshuqvOiYyCKVt3kpwvUG5GWmymi2rdHBuZsm+SES1WsGmV/3bzC+cheXt6bd
 psvfnHAKjct2pg4PfSQpn12iW4oUtBydRdfk4SymVimdcmYXx6mxz9ApdVDyHIsDgV5bjv83DJh
 VBd4f7/wLQH+vcVpnbfiCQ/UESNmRVwlVrEECvtnWsbDMDCGEXup05HeIp1/oWJzecnqUHe4ayC
 kw0ZEps6TcoWtKpvONdoEBfNePeO8kcXPh23wBKb/22pzaIjCOycRgEjfBM1g+S7Qn0Uu4Xy3p8
 bWbzOW98DgsCrln4CBewz4N8D+zAf2644yaO2Qfo91KiKiJ5RORhjMk0mUSIYojZbvatvaIALz6
 uiG40LvQDbYdpg3qATh2tEA/A10SuRP+uh6i6sd+/YPI81Sbdke5XLNqRzTvhr5hPOdqyu6pZP8
 30wiI2aCq+uWagX0xpObGZ+mGwUOeILUz119yHn7dv5mddruJC8+WjUbjIucW1oMNaKG3F3CMoM
 WujGWdQiXYmvcKS2aLrZ2sjcq2ie2A+CClFNf0dqBf7FkrmsubsRIVGkwqVCZdhGPauZxqsCPjq
 A1Z/BvjKFpjtRsg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXylL0wWVIq2ZI
 3WTi2I3xkzR7iJf6PI6wtPMmtdjSsDFZvrG/urrKurvZ3myCvNjFUXUGdTpuA2S7kTisPPmZxIP
 FTFvgDUIsyy0RE1C3dBq5mcRbdzgIfON6xy48LObGah9bCL2mNvbUSdz+KSp+uaM3qLlU1VOGXZ
 rM9CAOgFK9xzjp44xhOCUlGjYKfs9EgFwZsP8Jgb9Q/HHBiBNBwvYLaxnNBmaRHTG9UrIkPXwyO
 AY5y3thX0OgVKDLn44Ovro30j4feOW2QsYOlmIj8hZMmK2zvgTm+YQ4vWQuymshGWcsUx6U7BE3
 jNfkVKI/913xu3Y7J+3bCgSgxwM1WU7kIz8Y2HmyCTWmb+EwonHD/qwJ6aE8XrX5zQfiFEKbDbJ
 F5xS57ePfeOKH+stV+oxmJHPYvvoPCGc/zdNSWaHHC5wG4qqCjrVLjIBsgxRQ7O50IhvaXORwPa
 NUFyelQRXjGJq/swRHw==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa6f9e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RW22A4phRzxp-fsVvwcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX6U18mMtdWSP3
 DqJOTpbm/M6FdKfKwixi2rWHfzAVFuRJaKQYUikwo7aGPbzdUw5pxNO1qsr6GpC5qMgg/qcfjI5
 fkJLXSgBEyPQZGlNPBf43muNcdQAx14=
X-Proofpoint-GUID: RqIUXajlp8RxH-55yNgDyGMhkFdocJ_e
X-Proofpoint-ORIG-GUID: RqIUXajlp8RxH-55yNgDyGMhkFdocJ_e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs8300.c | 51 +++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 146b3b5dfead..1d2976aedc51 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -3673,7 +3673,32 @@ static const struct regmap_config gcc_qcs8300_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_qcs8300_critical_cbcrs[] = {
+	0x32004, /* GCC_CAMERA_AHB_CLK */
+	0x32020, /* GCC_CAMERA_XO_CLK */
+	0x33004, /* GCC_DISP_AHB_CLK */
+	0x33018, /* GCC_DISP_XO_CLK */
+	0x7d004, /* GCC_GPU_CFG_AHB_CLK */
+	0x34004, /* GCC_VIDEO_AHB_CLK */
+	0x34024, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_qcs8300_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+}
+
+static const struct qcom_cc_driver_data gcc_qcs8300_driver_data = {
+	.clk_cbcrs = gcc_qcs8300_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_qcs8300_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_qcs8300_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_qcs8300_desc = {
+	.driver_data = &gcc_qcs8300_driver_data,
 	.config = &gcc_qcs8300_regmap_config,
 	.clks = gcc_qcs8300_clocks,
 	.num_clks = ARRAY_SIZE(gcc_qcs8300_clocks),
@@ -3691,31 +3716,7 @@ MODULE_DEVICE_TABLE(of, gcc_qcs8300_match_table);
 
 static int gcc_qcs8300_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_qcs8300_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32020); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x33004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x33018); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x7d004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x34004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x34024); /* GCC_VIDEO_XO_CLK */
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_qcs8300_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_qcs8300_desc);
 }
 
 static struct platform_driver gcc_qcs8300_driver = {

-- 
2.54.0

