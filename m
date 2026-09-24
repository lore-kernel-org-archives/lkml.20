Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AAC49C4BA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251761; cv=none; b=NBR1qyzWZxaQLU8mJdo0M2wa1q7fwKCJn/cPtAF1Dg3dTz1bizRWzNL7pFBBOuBqWcAUgi7ntDVou29R1uNIperNUWwMnpFyGk/Qti9WnBaxikqzeFeWWeSNghqkE9YFg1SmXJCLVp0xsjZWeDRrxUHhM/O8zV4hJUDQAKL9pVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251761; c=relaxed/simple;
	bh=+UM0Iz72EwmjnHaCMh960dF5RvV27yJ/jffRcq438PM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mAjOGu1991TNYqlQ9GfT629aUOlkGCcJk5HNFPkYCdgD/X7QDOWY48aw4KKuujclE1UW8mhSn8eoBJIvYVZPx3qYz6DE69/Nxwx+7A6eaQ0zT6x572SsrY+gfGMdFc9X5SwJ+bSjnNg9+MgQw8n4YsD3Lrwn1s8erycPMT9Qsfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNiF4GSt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUUj+wUf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kNiF4GSt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUUj+wUf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4YoL2594174
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MevRHPZU6PeFsKVCB5vLjtUmc6J8ZAcrLv1nQ2mJKgs=; b=kNiF4GStAs+pUu4L
	pEq8YhqZCAkvCtftyGMc04snms2o8HpGuuhK4qaJcjPklFq9cLDnrwT+z8WvOTo0
	r2Y10IQrfdZOt14BO7QSNeFsCDU+LDUhpcOsFn9FN16Trqcs16zZ2RW03f/e63Rj
	fnwRD8BoFlKqTdoOW0Z6PG8HeKU8ssfuD20g4BEq4QTXOCuNpz6WTU169171RKXu
	8cYegTA4gWretinYnhQoyO0ocezUMc73sSqh5WWHX4GHkq5uBOWiLUOs+MHBg65h
	4Ovr4Ov8gh+7wuuHuXbzuE0T4tjdY1hQdw6WEaUhX3CzFmoYzArfBMeG1dCIvw/R
	/4UU/g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjgebu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78a58df134aso566588137.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251758; x=1790856558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MevRHPZU6PeFsKVCB5vLjtUmc6J8ZAcrLv1nQ2mJKgs=;
        b=YUUj+wUf8Bx4ZkfR5fiNXRym/jvQ6ELKQ2oJ/S+I4LnWg4L15TrzN/qlODedVieKKu
         324cjLxz2x297gJgh3PdpC6akIyYJJnpbDeQdOY1uiCLOhTMpTKhgAFR4FE0kkkcI9vu
         L5rTvFXbP47wCiVKXpiqyRpk+H9woQcNT1m4NhsiJz0cpq7ahspvbkgx1/akcy4R0Hid
         ERtOiJlnyEPvqbQW92Hk2h867iBNqe5eDuzWUxrWQ7SitLITZOi+fpuXV4l6zFrUEADw
         i+YmXLgaX39lu5ycv4rAhS/30c5C7RPLQern6OmnmFHgvWvruVGvbkAGV5WU9GjJH5+P
         ZvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251758; x=1790856558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MevRHPZU6PeFsKVCB5vLjtUmc6J8ZAcrLv1nQ2mJKgs=;
        b=1b5l8x/DclTy0klXpOvvlYKNOgOYwLG4fkrJnTzgOLwmRJ6JunZarNG6IkiJvoTVQN
         y4J9Za148eDutlIEqWCrsEW6Q+VUHFn6dM4Vjur7lLa2KTX6JKiHx46UjXwdntzbbANK
         8MAseitaJOtc7BfxDwiDkZqyk373+Im9jjmj/teHms9rWUAosWQ0yaNev70LFlD1S3E3
         OxmMRIng5yZKGkksFYIJwJIASbFFHuUs1tsMkV01NrO9zRYMFdiTf/JYyZ/vs10LdU89
         soik54dfnXnX+0eg3hC6nzdzXan5s8tSkJEHmXc2CpF42q5or4g3EDyfyKnfaHWOGl47
         d+qw==
X-Forwarded-Encrypted: i=1; AKwUvBwr3BTdnXHIplwSId40Av5MHAdTz8i+h/kN8auGv2duhujJt2GsjTPdQ3Vz/Kh0xrdb6PN4nMmeRhhy7L4=@vger.kernel.org
X-Gm-Message-State: AFuF++mtx9mGQnV4MH++h6nv0mvktM2ABiYHiJNwu6zV32osWZB8YB0y
	a14rSQ3Hu+baTggnZAHL8UuAnzL76BzKQjGPBJjw1dK4y8I79/Pxy2Z1iNV/dIzf9xes0+5ZqI0
	CoyG11ccY4PfJmHHeHWyJiXkK023uQq2qlIA9HwZyTI4sfML7uDxyVt6WXxBjMWGQgqE=
X-Gm-Gg: AYBFou0A416wexzQxtC/LaBFjH6zN+Rugp82DBo83Lx1HkcDVaW4XhHv1vhjaqJB0zE
	1jHySl0dX0e3UEfM5vb6tOKd5oRi6/1rBYDRTJ6v+9aBI1Ltp1om1v+ETrENUmYhgJdocaHwnZG
	ucV3CthaOtuFiba/aogTARPD74VTkQY1jX/7VA+3MXdU9PGq66G68+HlADJEfUfEl6dtRg9zq0t
	PgPRMEeaD98419nzYAc2Tv9Xp8aTkSJJiPyt4d5TjhUyL0Yl6y+QAxbPAXsay/FSroqlG/2mA+x
	9tLdFGAvQofJlGW7WWWfTRxT+BMgBJ5BP2yLcwldikCJ4AHIGjDtvzREkH3tm0r5awtUlLWxaet
	Kk/jy1eRq
X-Received: by 2002:a05:6102:5801:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-7af1c99cf51mr930680137.6.1790251757546;
        Thu, 24 Sep 2026 05:09:17 -0700 (PDT)
X-Received: by 2002:a05:6102:5801:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-7af1c99cf51mr930666137.6.1790251756901;
        Thu, 24 Sep 2026 05:09:16 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:56 +0300
Subject: [PATCH v2 44/48] clk: qcom: videocc-sa8775p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-44-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+UM0Iz72EwmjnHaCMh960dF5RvV27yJ/jffRcq438PM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJs00KJnymJqUgjbfq3B9kSnPRA8ZXa8JR9y
 Z7kcCWUWj2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSbAAKCRAbX0TJAJUV
 Vn/fD/9WqZnc/DGIvl3QIZrDXWIMjJlDbe6zgSMfHWK5xhRsz1mpow0+rkSX7hqGD6XQVvjZENO
 uCwzHkCCe+4l2RciSvqM6Kl76wQc7w6fj/II9gjMuWelv22gz7eJpVg+553cuYsXl827n3sOReN
 WpzWEDsejgi2peuHv4W27Kbr9c1pAFz+VlbFhs1esYb/94tNYIVi0XOi9K1oNbFrkGZiRcQlY6t
 2Qm+/2rPiNxkitB7nP9VGg5G2PV1uJelPaJ/ddp7Qfvkc5y6Y8WaZ6EZktf+rcIbXuwLhxpItAI
 U75ERYXbMGql1GZBGOhEfyEIXAwQvVKWAg7Taax5OWC/tNvpLzknguCymz0aTYbuyhL+nHrBn+Z
 eaW2tPR8ANPgTeu9aZ82SiaQsLTORPFK0wOYZAZePnxMb2mIZgftfjrj4xqj4ntlbLzbuokAACw
 wXfbAHf8t2sLRNEqwDpDDtFRysLxT4SSPdYNZch4tRaBjJJyXsT0GyE8Z99YM3f0n02Z6PNpm/m
 sBVo95/DJahp1L1F/X34Y/ETtIQ/La+7T1U7TxOWBqhPymWbssEYJKeM/TD8EkSRIfQsXLUvzKA
 5NHHTmbUdCkbBfu243I47y+/DeQ11cOYCixd8yLNDcYnYB2BSrHkl/jZ/JM8eBd8VdH8Ivo3i6e
 KIuPKjcMoPU0FCA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: R8xpzw0aNd2OmvAT9vs-6geAROPRcayc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXw1pjSfUrFff5
 44/K8JVo83HE1sAAV7FZPJqMcuou2eWfxwh8oO0HbqQBdz+loHd+QfX0WzGAkD1AWmuQsR6swii
 ppwccSmhi2E3X/kEZ4s+Kl8PAsMSWX5DWvgJJPoHLSAhib+9Bh87sUV/0U8E3/jnJfz8KYtXudQ
 Px70VSmSCIcDRzxCqbHQpyfvVR6u/vf3+U3+c9q/6fjKEKcJw3+Eid7YqI+ntYhgj31ZBX7OAdy
 DIx2q+/o05AVLs755Ado2wWoE7Fr8aU92TQeVrQnIyJnJdoTi7M8bO+HRv9FmAr/a4f6mf0nKnu
 /XGt1Xv8l5R5cBgwX9VixXpKe3Le3gADB6jQvQC4DfQGEDJdN+x/HO4i4mPPoq9etliNrRocb5r
 6CD7EuTF3FZ/7xgTKzKjYHPDr9jPHQbk/yW66F7VBBKF8f9OGOib2Gl/KurW0cn/9hE62uy4REq
 O6neoZDEFFUUNlMkQ2A==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab512ee cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=i-6CURGfGzB18q9V7KIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: R8xpzw0aNd2OmvAT9vs-6geAROPRcayc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXx4lo/RCUHJJg
 XCPSeoeC7R7BYdcqfEMicv25sj/h7XnmXnazJVeiRS885nyd99Mg5tENDcyJIFW9KKD3kENrExi
 s8sg0tQ7wAVHoIOQ/Tlbp16W6ac9ZRk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/videocc-sa8775p.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sa8775p.c b/drivers/clk/qcom/videocc-sa8775p.c
index 65a2d5bafea6..2ca78af8c20c 100644
--- a/drivers/clk/qcom/videocc-sa8775p.c
+++ b/drivers/clk/qcom/videocc-sa8775p.c
@@ -511,7 +511,19 @@ static const struct regmap_config video_cc_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 video_cc_sa8775p_critical_cbcrs[] = {
+	0x80ec, /* VIDEO_CC_AHB_CLK */
+	0x8144, /* VIDEO_CC_SLEEP_CLK */
+	0x8128, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data video_cc_sa8775p_driver_data = {
+	.clk_cbcrs = video_cc_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sa8775p_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc video_cc_sa8775p_desc = {
+	.driver_data = &video_cc_sa8775p_driver_data,
 	.config = &video_cc_sa8775p_regmap_config,
 	.clks = video_cc_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sa8775p_clocks),
@@ -557,11 +569,6 @@ static int video_cc_sa8775p_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-videocc"))
 		regmap_write(regmap, video_cc_mvs0c_div2_div_clk_src.reg, 2);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x80ec); /* VIDEO_CC_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x8144); /* VIDEO_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0x8128); /* VIDEO_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sa8775p_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

