Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDA246A600
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390172; cv=none; b=cF0nt2EA0OdSqiln9PPN6kKKq5dWUVcpR2I1leqeijeWre2Kjq0W4h/HAxiCGxQ2Id4RcV7Apo6+T9EAyJCPn9BjjfCbx1yXH8WefkWblc2WFBMOByQhPKgtHuDDTaV4IEb2/1iEhuvt0T7YqflmvK81ALVEnFyEctD+J++68mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390172; c=relaxed/simple;
	bh=RKTcHR/Qtw0lFOQ3ChK2zcv6mZQFx+uSPSNHFSpPRWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAhFPzrCRLvY/IchmesGipqDmeKEFwzDMf7R2IYk/Il3RgpHENiyq/+aKgvBdydplmjDDgDzhyOA1QkBThqZ/0JG9bU74zYGijct2fZyETwC1qsMsGpAf7uORCE2MAl/bda/oKsU1M580zkHiIcn8q0LajzrSU57MHWM5iKAOSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVcg7cK5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IG8+T/6e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVcg7cK5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IG8+T/6e"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwcI3860394
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d7kBfS3bzIpFi8ACAc/5+K+/BJvfkbhYCC7kKNkjlTI=; b=eVcg7cK5r7KTGckP
	Ui5R2X8T2Q/bX1NKUc5gPk7MJCZq9ACdTz93soqqk3ZljEY/1nKBa1lIQ+E+DhSH
	tJyxkbtBTvSUVTEf+n3o75BWMfGrRXqsBskYh8D8IyP1kIgp8ObfDxcuh8qhLp4D
	FD9thFrIftfDcrLvTakABuO4Ln8eh0rPzhpVmFe/fcGLq1fKQNi9uzqGaM5Kejas
	QTGL4cQOFCfCXungmqpMhetgoivQsy8d6Y+01g9gG3sB+lZCmvrggF52OAofsfbV
	mtzpW2zKl9T68/Op02Nd5qHcegFvdfsWk5UrcU24+h6j1ymTwwyP7ugohGABwhz+
	de+TVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f11er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0312937eso208042085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390168; x=1789994968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7kBfS3bzIpFi8ACAc/5+K+/BJvfkbhYCC7kKNkjlTI=;
        b=IG8+T/6e6hoyAgExTHH3y3oEvEkK1oA0jRpri1yxD5u8z+eeOE0ZAVa4nPCyGxQVjU
         9C5Bc1hOI6FRzGWh3pkPXptkdFmeoUnBGZtFT8hQL5fFGV7awBLTnu3UJ0M9qCbBs4IF
         7sLkP7NK3RLlS79GE3a2/SnBR75io6MsQmDpCYtlxOvp/72tUEX34qgML0271RWFgHD6
         UXweb8T452gZmAfSgnnLrq3XacDqRNS0bR1z3tV8y5vv/L6DHSiVLo/q7ucJQeCUJ+TN
         ZlG/qhSDau2dPpr6ljEc9vpILAvMK4byWYZ4snElNPgwys73Ghk3kcKk7gjZxaNFbsjZ
         o+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390168; x=1789994968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7kBfS3bzIpFi8ACAc/5+K+/BJvfkbhYCC7kKNkjlTI=;
        b=P2ox1Uq43CzVYH3DRHXWFJ8wwV5swOr/dIxVKOIvfVfnwsZdWu4kkS0bTRr87vfNjb
         eBEIqG2iTPoaKX3NaSerDmC1757gAln/OwAPxzRrstHannt2DExQTb79PXPuEBnuzAPW
         H7MyWOXnKrbVX6+uxt5sYGLc5Qkf4rigAzLjaVs8ZVyOJJHCe/m2O+cepKw9fwkaUwDX
         hIsZcm/y+KM2L310eTbxY23sKMM2WMLKj4mi1dd9JWB55APN3mmWvRIL2KAaVAs/9hSe
         Okc6DY4GWBKy+psy3zXFgjXGEdwP9KQFiuc5f17QSgtRCWIpntR8PZeV8sfCYPqJ+5Xa
         LPAw==
X-Forwarded-Encrypted: i=1; AKwUvBz/JtHXVDlhwHuJKMknaoHbdE65TrTSaEVdAja09bXNW1Ija5OgBCCBnxicp74Cl4O0pPGCQJgVwDLy3Yg=@vger.kernel.org
X-Gm-Message-State: AFuF++ktan6ez17T6423N+1/9RJg6ZCVfH6kZ9tK3SjWwMD/53mB2Bfw
	nhcbN1qPxrObHItX3axYpmCQyJ57RakbN5c/96Fde1SLjRjDs6W1AWl1H+1cm+QVgyB0zuxijET
	uJq5KmnRpkM8oddOYSH8HbhGgBj+RQTOvubXPRyvx0RFfEliDe2brjcqqahdia022rm0=
X-Gm-Gg: AYBFou2KpOP8+EyhIOGVuapg3998BQytpfmHJynwr4tRhBGUhtP7Mlavh/prWTHOe8b
	FgN/ShWonR5q67KWkv8mRShTN7ndS7SW7doPHfPpYyl5M6c+sU6C6zS9PDP+qxemGanq5UQM5zx
	8IAQ4FQQn/BGbZZEjZ8KIEKitUPOqQm/Y2YvrWqmADMN5WjqoA0axzUIYTOUBS2kbWRrOBXZX0N
	U3h0ipm8B3JZlovupDxsf1DsKP80R49FvtUatT10DOVhV7t40l7Gm1BNjLO6Hq67/g6HTGurffe
	8irhUSfI+e+0fezABrGJtcXIa9nZNSQ/gm6m4+iCB8FNWZ1T8+9eO8q8Z4Iw++dsrmB6P0EPvS2
	A8LDIYZxZ
X-Received: by 2002:a05:620a:1983:b0:939:fc18:4233 with SMTP id af79cd13be357-93a2989422amr305042985a.20.1789390167882;
        Mon, 14 Sep 2026 05:49:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1983:b0:939:fc18:4233 with SMTP id af79cd13be357-93a2989422amr305037185a.20.1789390167264;
        Mon, 14 Sep 2026 05:49:27 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:31 +0300
Subject: [PATCH v4 32/52] clk: qcom: gcc-sm8450: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-32-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RKTcHR/Qtw0lFOQ3ChK2zcv6mZQFx+uSPSNHFSpPRWY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zqCt1KWeXIIIY3Xor3BT7a7kZFYoObLrC+J
 oNaSv1G6bOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs6gAKCRAbX0TJAJUV
 Vh7QD/0ZndEc7VZe4h+QoU4l2KhhdYoqN3+zdbpvwZkpZlzrCpPvWuIvrtkJVphKuB33wyRWxEM
 9Ob8OJgyubBQr8OypIE+qJY1LebPFbt+lBWRwhlSDsczQ+YFDt7w9AmbKxCY1Ju5V8NQHF2SGBd
 xPeSPJpti4ANqtloW3hzKpCBCect/4WrMP+bmATm0kd8v7IlCZjnjm92jrOFH+eZC42YJwg0u92
 9zttVvNlGK+njhU9sAJ8zIGWOwPKKdfUKPwi1/ZLMBtysB71REpBAf1Q0RwPmHSjWMK6TkEqLNP
 A1UcN82ZMEsIZPxglVJGLh/O1wGLgoimEQRcXjM5+Zk90md8hrGdOoNMtNn16AAYIuCnFQFUqK/
 pja2o3zgmdcLIDQCFyDcG23GVRd0F/+Jjh1MSyKGMJ5vf2qXj0Pt+75x7QovnxGMPIi4KtihJ6/
 YZJJjNl7OLjjGohnIpgGWqEEaAeZcnhhO8RGoZ4S+8+DS5HePgEm29wcdQcBKiYBsRL9geId0J8
 X9RFJZkNpThFXu8d/GPcY3ueLitJ8J5Vqwl3tskz5hTdfRIo8iNrdvdD+4B6nkcsTC5zZOT2yiA
 wTaBHv9BDEBXUV1zdTq0umGpVUNgNouCZpaBBKU62pjY+5FIsBVxvTGpcyn5he38wlUpb412cZw
 JIbegl8r/AIeGJQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: P1fyItFYYu1SLlRZaZo9fo0iR8qgInHN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX0ceSrtKcSxfM
 Ihz8FdbUxot/uaIbDXS1ZFiLFStU9diX6L9Nr86Dsc4HEpRJq0NB3+MGAVJSSbFNK59jvZh8WKw
 JOJP/w6sihWhOi6WiZ6wgSrlN7KoeSM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX+ARNknkjf2wb
 5j8QWQDqBaeL3uCyiymnkxZRKzxxt+QwZmc6lHZ5MK9cM4DfyN7XTP+cBgzJmbtTlUgc5TScsIf
 JAkMZo2CaGL26dTeip018dXmsTiHulf8nMN55QYoLZkmD0EjZGZXQqIIT/Hv8VvgQaJ7mMkxpob
 roblvk0PWhcJbBVUnt9VcUlpGOzAv04CNj8hMfjEJ750XL4wdldND8HBx+zUPtl4woq/uX7Kbn0
 bVhZiYxVSYLSwK0+o9U7NxaRdFavB/bO2naMnTtsXczGqdwBfVItMOVNx0K8f9QZY0Q8H7gdN3M
 6jC/BqIeXD+U9xjJ2BRnDHNYgZmrYPMWhUyUqLSL8CJDr5wXWA+HbnG1JBGHx6hj6Zs9Y+yQozr
 f1lOgdVvyRiCY4JrQJ0WCYUFthZE1+z0Gb35ldLZg/lVP8AiwZ0ZcUYSvhhgLnR9UedzoPgbc5/
 nK4dm/QQZ4PcbNKZo1g==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7ed58 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: P1fyItFYYu1SLlRZaZo9fo0iR8qgInHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index b18bb34889ab..00ce241c9adb 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3400,6 +3400,7 @@ static const struct qcom_cc_desc gcc_sm8450_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8450_resets),
 	.gdscs = gcc_sm8450_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8450_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8450_match_table[] = {

-- 
2.54.0

