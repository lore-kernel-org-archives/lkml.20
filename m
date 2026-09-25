Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C8E472777
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326027; cv=none; b=XlISTMMildZh2hsgHG1uVjm0mEp4gJyGjhoKxtuM3f/kf5lLR7xDFUIknGqoPyMQShb9kugy2dx12GHrzeLmHy4RMg/SpPTy1M0gA/dnWsptDqZBj/PeYZMXrzieJ2+lysAt36/rbvEI8fHvdKQIsnPn674o4R3QX4a8nUlf3Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326027; c=relaxed/simple;
	bh=qZl1Q5bwQ58gN3uKiNg4+tTdTPKtZZZ4CCEo6LH3/Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gDLMsBpgHn6vsSv0czr7SD0FY5kM4PD50INGKvv1eD0ra/TezOP1MqtsLMvi4b3C0VfMcE7kcSwA03Cykz3i3tfK9IRDH9A27RAi0EMGHb6s9Pw7gQDuow35JO4WJ89j9uTtNRWcYBUXOGilvn85+6ghsux3UPWP0dO6rnF3DG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaEl7h57; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYQtZV0Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FaEl7h57";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYQtZV0Y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YqxH1194213
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DP27l+sS5LI
	NTYJODTJG92GSpYoj0hoQF9DkzSOwtAo=; b=FaEl7h57P63nm3L1ZHNi49+sycY
	tGd28w+8kMZQzDj6Qhcu5B6GP+ppY9sdPLfR8bheQY5jp0OBv1mL+iTqu3Q7Ople
	zThS6PUX6HXE8lAXNRif0re+QGHIWscMMTXR0i3YRtRpGPkl1ZDBjNC/Zb+sV4AW
	qSMRvh8TCjWgHR6WLPXl8AA4tknDs0wTtqGVmn7dvB1iIBIBoKV5DQhu4TcMGXja
	OEPU+d1xJWHFTupDOU6g1buNMYmX8/uzfj6H3zQhEzx84EDFcyLpszqFb1YzBx3Y
	Dq59IWFUg6EuR8FTzA6+BcxW9RjEDuiiO6Yenc6fdROkCj/PO6mkFxjQvbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874jq36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:46:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390a2c895bso186893485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326013; x=1790930813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DP27l+sS5LINTYJODTJG92GSpYoj0hoQF9DkzSOwtAo=;
        b=XYQtZV0YrxuFd0AhrmwAoBb6CZZaTOTywS5W2DnX40nrFmKIzueNlyspYs48SO/9L9
         Yd3v2tcVUw/mDIgiU1Il4oELJbAvsBA4LkOqs56cxr9EqACKykbfUBUsxVxhFBEWq1zN
         WhVRG7F7DLShhLaQIWGhwse6xTRu9Vm8HPg/Eq2FSU6EkPVWgawpvV4ecRYxsMgFOtWE
         A65cS2PoPBfX2tMdOjIXjXdN0OMvVTi4IcTgUB949lwZo3YSwx9EvcY8U7Vz19EOoImI
         kVFFtd65nn4xgm1MY2LzYszIw/QR4patRScC9IH5VPJlSQe48exo4CDMSlCOX/PQeF8F
         sHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326013; x=1790930813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DP27l+sS5LINTYJODTJG92GSpYoj0hoQF9DkzSOwtAo=;
        b=EZXddSQJmqnmtlMsFK0YP/Zb5cVF35mOuzSjxV0RwJaLoNIBCR2pgdw52maAtIWKDB
         sqqyIRwRpCvJgHQ6NBdvSbORZkHwJOFJXkITKs5ECRzOb3tI47wTfEqG3pSQuHeW323g
         FG2q6McxYsEo0nNviAkrBV0hGkyuaB6w9srtE6axRcYzCLODYGyy+ZdvhsoBrjX3Ttlm
         77/dEbnobMpMDS1EQR8TDhgJXBZgMEPSQcREG0sXAJXZzMrHqc8GhHlDt2yJY6C9Qh4n
         Q0U9FYUPWHqu+dKqKSwswsMjoRN0ZSTuktCJEO61JjpoW54hSsgaTmpRKvZ+c10f2VOv
         PJlw==
X-Forwarded-Encrypted: i=1; AKwUvBy2AkoCruyT2S7WXMJjAwTfMdlIektPt2hRJjt+ou6pNu4T0zK5iwzieMY2C4mi1jRTRrfHwWSS/UBTvpY=@vger.kernel.org
X-Gm-Message-State: AFuF++kQBWvcIlYtv0+bMkl1b2x59y40mCtb45fwxlbQlUXcl5gGdkhr
	8BI7JIoAWnpfMYReCqZDM5qhh8oHgMp9AB+sbTsbhCNa+Teqmyn0l/bFFCY8kE7Lg6q2HIo1Ye0
	dAooE2SfFG3XoSK3OaYbsRy11bfDpVULjfzFYdidLdj2r4Mqige41A8K/8C3aGH4cjeA=
X-Gm-Gg: AYBFou2vD9zyEjnMnJgJYkQyA36pstdXbGs9EN/XkNMuhO2mqnL5Qtnr6YBAvWVvEvl
	n259KJAhUiDcGLx1MqA7SZ3h2H8Z9EybjYxwLmX5tyscWiOhfRt7LIaD/4eLAj2hANHVERGQu4I
	mwizOLe1GgWPQ3i6Lr1XJKZ/lC9rDrf6dC+68vz0Ngo2/U5K07g+TtWDgz16LWpXROZVAVpDiwN
	KfkwMTV52BRUgcRF6dRxfKrVE1GLvz9lsxxOPmVGmkDjacPwHLGnib68vwKHFe/E2vLC+bZ3ifk
	g/lRQFm+GIuyo+D0pMo12I9aZk0RQt0ijQIHkZtduS8kOcFdBXnUtWnLwYhQKUt5JI6SNNt6VsL
	Je2tRe/54z0XE
X-Received: by 2002:a05:620a:2843:b0:93b:d79f:d944 with SMTP id af79cd13be357-93c43e8a580mr309131385a.57.1790326013222;
        Fri, 25 Sep 2026 01:46:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2843:b0:93b:d79f:d944 with SMTP id af79cd13be357-93c43e8a580mr309129285a.57.1790326012853;
        Fri, 25 Sep 2026 01:46:52 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5281953f8f.32.2026.09.25.01.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:46:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/4] clk: qcom: Add lpass clock controller driver for Glymur
Date: Fri, 25 Sep 2026 09:46:35 +0100
Message-ID: <20260925084635.112399-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: F_w34P2XhGvUbrWuCPK6f7KogyjOvpDh
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab634fe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=9d4qlcpUcIswrQQTxZ8A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX8gihlWo3JYTB
 nqy+5Q9DcOySQ7Ss6qdY5EpdGxhq1SClRp3hYoQDH+HqBxDn75j61hvXVKDll3OE5JAUYfKwi7V
 dyM9FgvZSeIG0b2G6svD0kSePmbfWTY4QQeRqakKQNLNJvXWxh9Z61raFzQS+k4Bx8Bd9F254tG
 HLoVQJXhNcHVjZcf4QxR7GMg3dZrkmYCF1VL231Tr5DbEnPOYY4g6Ulao8y69AsfeyPVejMEc7h
 Ab9rA6PoMGHT2PamqXm6Bkm60Vm5jZt+GCTAhPijM4HVtDSjGqVuq2iz2hIqQTkF5R4HH+kUCTS
 Eb0jY0ay/2RtpbfzRR7x7wfz4CCzGbyACtk4Hf2bqwrv51xGasTIZObNI8gS4zo/toinzeEJFSB
 t+CuLykLAP2mBEngjCQtGRSVRNPzTPnBh90tBE7WLZRLScHHivKYtUeVYcImyKndGu+e/XT+Yx1
 Shyih4DcG2E252ZOZag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfXyU6RRjlSCzLW
 +enIiAUn2fKyQ2P5+TFzK8DXfQzf/JEjpITJ7Kp9eC5MRu0Be3s+9CaXEE2B5rLgRek4pDZOT0Q
 DmttxZ6xzaRgG1pwa1ER8Nx39Xmy8es=
X-Proofpoint-GUID: F_w34P2XhGvUbrWuCPK6f7KogyjOvpDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250034

Add support for the lpass clock controller found on Glymur based devices.
This would allow lpass peripheral loader drivers to control the clocks and
bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
index 356625dce99e..eda13686850c 100644
--- a/drivers/clk/qcom/lpasscc-glymur.c
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -37,10 +37,31 @@ static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
 	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
 };
 
+static const struct qcom_reset_map lpasscc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xa028, 1 },
+};
+
+static const struct regmap_config lpasscc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-tcsr",
+	.max_register = 0x12000,
+};
+
+static const struct qcom_cc_desc lpasscc_glymur_reset_desc = {
+	.config = &lpasscc_glymur_regmap_config,
+	.resets = lpasscc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpasscc_glymur_resets),
+};
+
 static const struct of_device_id lpasscc_glymur_match_table[] = {
 	{
 		.compatible = "qcom,glymur-lpassaudiocc",
 		.data = &lpass_audiocc_glymur_reset_desc,
+	}, {
+		.compatible = "qcom,glymur-lpasscc",
+		.data = &lpasscc_glymur_reset_desc,
 	},
 	{ }
 };
-- 
2.53.0

