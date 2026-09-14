Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6A1472772
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390169; cv=none; b=njaKQQgx12ym9O+MNnZP0ZWkuIkMYFqCVx+DIKyWNdgh6TLO0WH5h87M/PN3au+fUVaV3Z03xSAhYoT3Hwzqdp7GVakuWd+Nex/NUpQJH05lcTHnDUjItYwA09U0qo8ihceJfYfT4BSfYjHHFBD9g1trzAXXklFsW+AZmFrXvnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390169; c=relaxed/simple;
	bh=GEl9Wsz08G8vYZkWRMFCpqdpxIKvSTnuFhcT+3Eyy7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPZlrZSieuwCJFOAVahCixtSARHoORdT1vMY9owEQzG75+evd2IolV6XOBR5LzSwyxx9EB5M2IgPHxZanbsv34NO/Cyi+NCpKMHn3boZt3TFD8DYMS4nlzF/u8BVbQ6nZXiytWeBAKITQzmsoZks8gBEcGSRxJ1xzziploOmwnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8ZvvfDK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZMZMN3S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8ZvvfDK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZMZMN3S"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm71k3291554
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MwPW0FaD3HqUy+2WbLqGBBnvV/Oh7LpxCMb1brml3KU=; b=F8ZvvfDKdjGvRzms
	RRHVGaUF4fZqNxqMOzhcrK9sq/wBVK/XyYKbSAobGyHUlWf0THOPAea3FFJk7Fzt
	vA2f219/q/o3HcXFHkHEOxrN4V+dFyURXrjHWlCtnDuwehXtUQ82ourLJQ/w5983
	C6FOBwhi9F3A98ANlcJKo7eduHBc0grP9OxHh9gRr1/c81xMA72q2XQmSNiCGqfE
	8Rz15sseQsgWacBSZy1fgQQLaVoxhDu+ZSM55C40zyxNNnRXOq9JlnVOeFUW2n0s
	zMSzfuSIVg2dH8roTAU1dNT9nlTsi/cRgkyH2jwACyPtddzkQcFC0oARldCVREUL
	qLOTyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8nk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9394ad7f64aso522070185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390165; x=1789994965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwPW0FaD3HqUy+2WbLqGBBnvV/Oh7LpxCMb1brml3KU=;
        b=MZMZMN3S01WdgOaNe4LSnNGYMwubquXYu1XhZ+3I45QKk37NuKYK7WNRogL6/M7YI6
         aUIbmM/F/XYD9ZQSPLswIodlCfz/c/bPxeqXEavGMvSXg/Wj9D5lC7/sY5y4JpeC8bdQ
         PNvWeh+8pz5FmcsFDTDz13dWBJ5jsBXa3hmugInt+vBpmA3L4mU3OLDSt7ppA58XMM5v
         Amoy0fmWrP3NsI8D5TRZTn8hXyxZT4y6SiiLk8AjqXWaLNseGiWbG+b+zStqy0lTHWqA
         1iUMAdwZ1ZGnefcJgz/R5bS826nAza0+SvGTOM0UY9U9VscAwDilnwBmEYx8blDER/v5
         Qa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390165; x=1789994965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MwPW0FaD3HqUy+2WbLqGBBnvV/Oh7LpxCMb1brml3KU=;
        b=hwp8V6KSG/Id38fyEyy9OR3BhpQ/Cg+lgg/8RjQOZ/auDDLdccDnJqx4LRXyWrCMSr
         iT56BaUFz0acNUh4C5ZXfLsPq1OrSSf32BvdS8o9vGLrYySny2cecuSX3SjMNysvJFcL
         OUGpilmhMwDd8VE9yx1wAo+guS7gVrpSid6Um8+RJmEuIYDfUHMp+eZtiLgd6YTgv9Wj
         p3pgqS32uNCHlet8wMNd3p6fhS7R0iODThc9+nXrmb77k5VTxJWsf1lcIHCCTM/wUubb
         1k0PmeWeWQ7+Bm+O8UPVKyE1MmTvSGKwprLuNQ6dX4yvFtYEAbyD2RFG4uT7hcfrxCab
         5Q8A==
X-Forwarded-Encrypted: i=1; AKwUvBxDgDVFs4cb28FgL7ljI4mxh3fMSMjCaAxiMB42Z4yZKei5eLU9oOdenmssWE5ZHuvBVSBc5mM0BJkHvEA=@vger.kernel.org
X-Gm-Message-State: AFuF++n729WeHBNpXVRxnjeVYh2LUPGZllxPFfcyczaajtqKlWWh1iFE
	i/GbFybzAgotnWbCN+KGopo6ntPeTlctXOfGRatSDLq/qLX1doiEHhNLlrSe06hHOKgEw4/zpRa
	oNqmZJzIZJKhxnYcTjOp9HUZm6W5h9A3bl/nY8RRRfAvAFbVUfi+8iQhQrr/tBgNGPFI=
X-Gm-Gg: AYBFou2Xgnf1TkPNCSBB7N3c10idLu7k/tSGQSz2WFjm+X4Ht+PkO6TIG1ht2m2iXi2
	HvfPJSzBWwqv/Ywp4eiy+a2WhiSpICKdm+KioUx9gduUkBn1vVspoZev/khlTJUcHhivUU7UUMx
	U33ttmLCJjMkk7tVw2tkI1cYDm9g1HpkZ0cHA3o3TkDElvow4+XP5Pcaw+nLxrVeBjqHzzNMEkx
	zqsqjrFt4Ycq21Ccemp1yMXkI9C1e4u7StWVHdv9PT/Q/CbS5YhvWUSQd2I2rQqijF/CJzT6ni6
	6icbQ1LlovGOCI7W9Q3NRrN4HDLTbReTScGafjzkgb04eKdcPk7cBLcl+va4brCg7AzhtGFfGl1
	wCs4nJzFL
X-Received: by 2002:a05:620a:170b:b0:936:df48:d507 with SMTP id af79cd13be357-93a297e903cmr340040185a.18.1789390165089;
        Mon, 14 Sep 2026 05:49:25 -0700 (PDT)
X-Received: by 2002:a05:620a:170b:b0:936:df48:d507 with SMTP id af79cd13be357-93a297e903cmr340034085a.18.1789390164538;
        Mon, 14 Sep 2026 05:49:24 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:30 +0300
Subject: [PATCH v4 31/52] clk: qcom: gcc-sm8350: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-31-9d5a606ada33@oss.qualcomm.com>
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
 bh=GEl9Wsz08G8vYZkWRMFCpqdpxIKvSTnuFhcT+3Eyy7k=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zpv3ckJ/OepIlrV9VGZn4/JnKT9WgjdobLn
 Y7IDV77iOiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs6QAKCRAbX0TJAJUV
 VpCCD/9wwAwgdfQaR7FiBzyAuc3ubUN6No5Qu9VSZ2ks+wBAc7i+kadOhnQSzXBn/JPMOWjW7Iz
 +9GRAPHdxRBn7JpnJNXSnF0RzBp//6CPzEnDsfozR7YH/WqZfwmRy3ZFj99CeEroPpsf3M5jxcP
 XKiIHueuCU7L974znv/Wkj3XWfswwoyPgAdxQcndVmBCenV6TN19FB0mAl5efIzV+LuK2bwy1UX
 g3RailILV0irW4w6Dsp0bcLzlvR4Mxi2nlfFnnqMaZmFF85+hh8jpOElEjgL30QBCCpdD48UaM6
 ULM7brEJIjcgv/gjrCf5nWtUObNwntdHZtx/HcXazyQpJ+lOjuCljkM7gzzmbXPllTO5uNVJMR2
 t3jx7eyboC9sFynktnRDoMJNO8g5cZF4gl2zXen98oV3MKdljJwElAzj+Hv7FZLg29Ds043EceL
 srdReyXpYVBlJnERfW9wqWcZ/zK3LeNUq2/7Xu8nQ+TlVauLvAdZa7faiarT2mAdQF9mJJ9ZJtY
 5CPkIGuDOm9rzzwjCJlag/j317lsDDs6NwIEHLO5L2+6Q/HZZIey5kv8WkNzTaMkEQjHA1Pz45M
 Tj5yEYrVCVzV4qda3xYGM+m8QD21TFhbkiwKq29mRnlYCngtSkbcnN56jBbGVCavtCobT/K56KW
 kz/celynst/Wz/Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7ed56 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: dW86yssy2q3L3na77nT2SWI23o6qH9Nv
X-Proofpoint-ORIG-GUID: dW86yssy2q3L3na77nT2SWI23o6qH9Nv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX/eNQBAYnqSCd
 umkVZM0gbwHRAHMNLX1PmohqLaYgdvsIXW0ztP3QB+iTU+hgMPOut8IWMuuuToAoW9ddBYFutwJ
 uX+cO8ApWXf8y/4FG3kCm0KtpSTfcVhOHNSR2C2Pc02r9r3XYFTcfsG+bFjgbA38I/0bPLYdEM4
 rAgcYa0OOatEzYEsPl0BJ6sfCQT8JY60maC+8f8LlVUopMWtFNLS5I4H/YAofDTSfLpPcoGvC+H
 5WZgXntQaXK3y/Sm9sEnyycZKXC1eB/pzPh+pZXa4lSROTHgX3U7bn5znISfIPWbTIJlYf79KWb
 wfkOikZlAakrh/YObfEporfoXpVSIgY5QJfwG1eNDmzJhUA53jVfpxfiZ2QgBV9LInvMiHeUZNA
 vcUPUErH1vsw9oy+6c7w/A+/UYZib0WfyLLabaQsZr/AJ1dQoMZuCa779aBsFrMSVy2EaHY2lgM
 LWH0EPmWsM5dgUY6q8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX0tIUKsA2UpY0
 8BRKYtdDEcmfolVmEgoTQ9nrQ4UaWJ235ffiyVXaV/Ln4zBjy53P97jtwrSAALUOenLOPj5L/jl
 ITLto/VrkO0ymlJDWWFPMqSdubGXGhA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8350.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index 2d94f3046b71..69350fa4c914 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -3787,6 +3787,7 @@ static const struct qcom_cc_desc gcc_sm8350_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8350_resets),
 	.gdscs = gcc_sm8350_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8350_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8350_match_table[] = {

-- 
2.54.0

