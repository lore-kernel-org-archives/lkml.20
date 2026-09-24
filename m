Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660B447A0C2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246490; cv=none; b=a6uqAhHYzQO0Ui46Jsd/cKQujGjDNcpgDIeYDCcfiAFVwE8WHMRjI+GRzmI1kpEC6x7BkVndQaF2PO7qwgYmCJBuypvx8RTe36jxTD5avndln7D34lgJ6X0nETF5eG28BqE5DmDm0ErdivGczt6/rC2Wpj4G9lcFs/gBis5iGpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246490; c=relaxed/simple;
	bh=DUk1Bj8mORtyNB9lrL/6HeW0IjUJt9z7LRSgKsZGugI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lYsuAM1L1WEvzGWVbRauBwuHyR5d5UEFSHM31jKpJD3wVlffwl0JMyl6zwwqYTbJ7YgWQ0iB2SC2arUU8iV3dN38tEII/PrEfhTSuMeHMa/6v5q6z7oJtI6w8JwDTkYwVNKYPx4IZ5D8iXACClkdJ81C53KdM9AGxcZMT9V+3Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f/WKL20q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XnOOn29C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f/WKL20q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XnOOn29C"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1Owx2857954
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IIa2vLn6i9ni0v5Q8UV+dkRToxwnACMVg3gG54ixKx0=; b=f/WKL20qG+wZ6CAZ
	HaNvLEoM4kkRXGnOujF/qhMyL+M3Q6oFmBkBcUDEK1YM0CJIQzPtjeH1xbd2xtGO
	kuzd9oRMzdWRSX6PzWHahODBrP/ibubnNObLkQV9ECVnogSP9ziGo5vLJS1veJR6
	x5w9nOl4ngnDwXoq6Z0kmSCFujGAuTIo4DSmKy8fb7pw15g1e5MM6A9wdGnDSdQU
	M6z7DBLtnFeRivuvjFdV4VbOPi/xBod+785slwk6LMFrsvezLWpoBFUWASOYNQEx
	8IpEPYHA91syo+ixP3sX5y2Lhba5tZedT3YSxrQs8NsqRgg/k2JZb+pudIaUBii0
	QbQ1Hg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag5a2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e98e74535so31727486d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246487; x=1790851287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IIa2vLn6i9ni0v5Q8UV+dkRToxwnACMVg3gG54ixKx0=;
        b=XnOOn29CtuKiCQZDQ1uJwPuFz+IxfVZ0zjxKmgVviIBNlx5LexiKXTA456wUCCr6i0
         HHnY8mGywT2EIEihiQzqnw0If+sZ+oZaHoWaQiTJ74hwOrDRsJKEV+Vwi89R/WQ730Z8
         G327rBs2AximL8oTBBr9A1E/nEgy5XsjXVpZXHOaMaH0h+ITaylX9hG07J30sp1xfdTJ
         z48tpssq/ZJmYFeRC9kl2xiI6sQh4/CbSZLXvu280cpZ3M9ACN/FszRY2WLKBcOqKGc6
         ZD0Y/YPcaNfHBO/7fTUyN4Mp0clJ0z4WCwhrn0St6mQnltcWnjRyroSuqnWSav7D5Luo
         ODsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246487; x=1790851287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIa2vLn6i9ni0v5Q8UV+dkRToxwnACMVg3gG54ixKx0=;
        b=JSmcF3DAheYvKhxBuGdCRKhIFeM5bv/Kj0i8ALqGQraS0c/whsiHv17DWVyJCY61mN
         UHMOgxam8qBK0E+G1UZpYLd9q2FFC/OAAts+IA6svHwNCzwU4KTxN1d0B9XVwurVYgdp
         FikRZuPKT+sODCVEHEiUIazW3yQpPglnnNuq7bZ5xtNwCVTzaeSzbw26WN9ej4ZvcSWY
         90sb3qIjr2tkqgsGd5O57+Q1nZrwBpjeNkaVMdqfg+ZMmVi9HYohnsTFmyUJX/DaaZnG
         ps9mfuItzPQwYn12KEsk34bor338uXSispE2tqp84wwwmjvJk4jbEhoc/PkADfjjZDWX
         nAcw==
X-Forwarded-Encrypted: i=1; AKwUvBwiP3i1+KpFI4ctIqg6Aa1t/uE+0HSk3V7YtAwnhtvLoydFjSszgChASX4phkYQXUabEYMc2tmgNt1vCgE=@vger.kernel.org
X-Gm-Message-State: AFuF++nPY62SUS1WhC8v8TYw33cJ4sPWbbU+oK3UQebPr1nZh59Jt79b
	53JBpVRYii0PR3MblYt5iUe93RPHF5ZeVgqttdBxBIVLZaE0PwhtQ4U0d36Z+oYd1XaE1Pe9ZQT
	uSQgT3ey/gTfAgnwALK9fX0v76tK9QDbHe6TQUv50Qo/BBfSv7zdJuiBoFI1CJqRxJMw=
X-Gm-Gg: AYBFou36BRAox/XbbCY22vE9m3mHajGVo2Yq0bAsSx2usigy3B/RwxPCYTGgmDyr8u8
	dpICKw4KLgrWEjt1U6o38rGYm4p1IKakXpl7HPb3pPy5llnZwiCbtUAq/7rHjnniRKIukKSNbKB
	RJPu9EmSTNmmqZ84W/eZevdzbK5SlRW8+Waf5mvRV5bIUj4fvlhoUSG1/giHWDwGxmYWZVUamrS
	6PoPUIl6duOfKSGQodLaKHj/8mpYfK56GzHGt22OhSLU67rc9AnnqASxKhRwEMUPBgkRAgEzDsw
	W4+WwQsV1EAbWwuSp6i513BGUsCh/6sQtErSuLrrqeI99Jj5aacloSlotSvpPOf27pfPZytcaxT
	LSSLrcv/n
X-Received: by 2002:a05:620a:2a04:b0:939:d762:e2d8 with SMTP id af79cd13be357-93c36413afcmr200153685a.31.1790246487395;
        Thu, 24 Sep 2026 03:41:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2a04:b0:939:d762:e2d8 with SMTP id af79cd13be357-93c36413afcmr200148085a.31.1790246486717;
        Thu, 24 Sep 2026 03:41:26 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:43 +0300
Subject: [PATCH v5 27/42] clk: qcom: gcc-x1e80100: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-27-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=DUk1Bj8mORtyNB9lrL/6HeW0IjUJt9z7LRSgKsZGugI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP30Ke9RkBPdPsP+HJGyH5LkPtlfYjttmaneh
 QZqWCMTKb6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT99AAKCRAbX0TJAJUV
 VvqgD/99nRQ+CwVCDB9luyU5grj+7nSNMdejtCto0gKKrO96OGaGiQOuJbJkVeKbq9q20JtALaI
 fDS615KHjsZUGFRkzm6Hn6/LOx9OjDX9k6IA0i3z/G5OyRy2nrnbc5wuAtovKUn29/XBCkFRgrv
 qS6RHueeDajrJLKKXL5Lh6tQskqvJ0FAfDluAmdFG7wjyKDi6s/lJ5s5ckwYkpTp7Qa8byVQMCY
 pGcuF4zPX6KTXkJEvQYurANwUkqIZLTtqTNo+38IOeiNPbwIvChjGC29H6AYVN9OhXQcqPA2ET4
 Fe670Pn/eyoAJwkPEqK+jA2wivTkfLOhawF/SL8/V/pYtqBODD24ZmeD1h5jOTqQaHTvmaBZZQX
 /yGv0G0NG/r9V7vF6LsMhn6VCPrbGwkTauOGceQTm4oxi5NhSWHsyJ4ss/TZDNOu/R0JXr7feTL
 F71+/GRzSDzRhE1onWMfYJwqhCs55BV92fvc9SnuAcVczi7SSFrmzdDobHjAwon59xX59bqPykC
 S3YCd47hjtLsPMhsssO0F3cYIVDHOm0gsLluX/TM3GfbcSGsiwZEdhc7LhBAo918CJZPqSlRQ3Z
 6I5masVaIlS/sNvcJ0895hW3oki75krsiHHW2km8hCMX6wvu50esgy24ndShBGcM0shTTNNPRT0
 7NXCBSsLt4VjNow==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX8m0NDQAS3EXL
 pCX+mmKy+vXmshyX4qQKYxsTJGQqY1THOMsCOi7oKMyWNG3jiI0kfQahmyxsq4aJpf2ORojWVyq
 nDiN8nRq/eg+zRxe8UWnKLq3eTlrCeuyFqJU86Sk16WwQMNqYx2Pm4Ncyzqt/pvYXUzQBgpPHfO
 J5JV0VydRIKSagasok7kF81AVLn9GCAD1ZBD5D++vRVGW38pdtKJHhINkCeCzlSktX/Z3kLy9o4
 FmAI3wqLX6KQ4+qKT34eX2dBwHZFmT+rdYHTb3LSekMHPzjzsOb4HAObLJmrHZ/JpIF98JIcqvO
 FAeguTrwfB845bBqzhbjps+htVx3AZYfqsN0SYGmkjd1BWPem+/Pz8lx9hPX+CAML2UPMhcH5Hu
 sjBGfy30AAs4Y4G2S152/j2vqS4naSwEKmsCEDW5eXzdvNEcY0SkmEaSLkE4Ez9mbA5dUewEM2i
 bae7TvYNVJ+mSj0pQgQ==
X-Proofpoint-ORIG-GUID: skA0Bgg478q-omSRBvpKtFopPPoQBcsx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX1qunGdBAfMY7
 nPLdQO+O9b0ebypKAhFpQ0fGlrEia6tSzGjfi5tGdw/c6dMV8Os6fbX+jXKuvb9jcfHAvmdBfWm
 88pjUy5AMFXeYChHO5MMja8dujCdbVY=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab4fe58 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: skA0Bgg478q-omSRBvpKtFopPPoQBcsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 9402fd7fddb8..b979b7415377 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -7449,6 +7449,7 @@ static const struct qcom_cc_desc gcc_x1e80100_desc = {
 	.num_resets = ARRAY_SIZE(gcc_x1e80100_resets),
 	.gdscs = gcc_x1e80100_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_x1e80100_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_x1e80100_match_table[] = {

-- 
2.54.0

