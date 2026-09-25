Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA0443BDC0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315363; cv=none; b=VK74FVlIIU0ZJejEt7XLPhqDLSZRap7dffyqCQuLKhtPKNXLkWXk7/AXbximu9wV1sjNjwdujj6hy7GHXOhQxKnPMQQUnFZg35m+16nP/ohru+oadXzRygkYY+h6pkINu9UhjjL03nGRrOV6R+s65HF6KdSBPVqSvYuYEZt3ntU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315363; c=relaxed/simple;
	bh=QLwU7fKegSZgo7lckFiKBtN1ZL2aPp2XYB5oMQOrME8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iuy9+M5/hbQT8po6HO2Cq+d8akE0ROCxR0Y085IEtEz2mggCM1eDc6ksTc92nJuobGmYaQUy1CxnmfaX2LN9dwpcrtceYD43lNvY8kpwo9pUHKbETlKSGOTQf/cPfpVyIj6v+PhntA2qC1e/JWiIgD8SiQPXAoxZ3yX6wM2Cuqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGTfyAbE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gC7eu1Mj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGTfyAbE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gC7eu1Mj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J4ku756781
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oss9++ljyuGbbaBIi8aA3J+tr+vbQN/DpaXOHs8TZi8=; b=eGTfyAbELFWnKAfB
	xt+GAruKXEPtJTQFZX/PIVtmQgtWvq3H3twCVe7TRXsKkZ7OEssHRWR7Fpr0454B
	OCpfsfIF8WS+HXgHanD+P/V+sQYlZlv2lft7d3kloC9jV8koQJTTKLmMFunDm+ur
	ehLDFd8YdAq7FSjJ3KuCUK4GyfNBySPaJhJPYEv7ewuu6d4anJqKPnlbuZgZC1lW
	AnLoj75lg9KwkmzSUtvYjzsc5r8mez0NsaJkwy2Ab6DiEUNCUWaAt09avcXUMyaN
	ihJX/yNEFryAZd6+FPipPbkKOt/PsxfmyAWwHjXZkhThGePcRz82UBXJJRUscZk7
	HAbx1w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq082r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:49:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3284bbaa89dso2098414eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790315359; x=1790920159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oss9++ljyuGbbaBIi8aA3J+tr+vbQN/DpaXOHs8TZi8=;
        b=gC7eu1Mjw149zKF8u5DALqP0RuZCgOyonugIeX+CsIvSCodV8drv4wdks07CBXzm4g
         6qKmTDnHsve4gNpDKDvmE0fVqhgHdOS4aGwXg2NspU9cXOdu57keDjkBvEGJ+s0Ma8LG
         4i1HsKvMjwEQlHqsDaZXB6NKEo2UkmMj+8QvTFn82GRNcV6OZjKEcFV8SMgYwHA9AjrS
         wXA8tSVRKgWXC2KLC+6BrZM05NLsbaukQu62xjjN6Zoqm+UkcIHrsOlWuJNEqHLE6dys
         FOau1P5OVs7QYn2d5w6J6cZ+47+BkD0ALuWwGL/UymfHYOZc5hBhpT4MmttzoWbAHCsW
         ZQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315359; x=1790920159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oss9++ljyuGbbaBIi8aA3J+tr+vbQN/DpaXOHs8TZi8=;
        b=2qiYpQPutyMHxCZPx2aRyuMEfT8qpJ8pv3zh81t1hCLaU0ru8lZnnS9/8075N2GLah
         rz5t5QOuA5ay6XhA75NmDKJYW9bzLTYAFsQT6GfqRcGjkycP7SnIskWg7qR+HUeYcJPi
         0ACvQm0oBy7suq+dLLz9f16EIVZD9+BchkHVN/UjtpGCw6jTc6JcZc1s/BZlnGn0/JC4
         FTlIiKgCgK+CFWR506Qp2nml2VQ6tFajwlKqKL7Tab7xQctEToADCfpPHWcRPQdqyb6B
         YSQ9MFgndTL2ymJpJm99CMEhsbb/5nTzp3dcVITdHZPlOO+Kb1n0pJmDD2eS/KM2NJiP
         duQw==
X-Forwarded-Encrypted: i=1; AKwUvBweCEYD6I14o8FimrRp5iEwSJ26G3UAeQ8C8H0WqRxAg6ipDTDLNQX08to1RExH6Ve0I1wnAUtbcTtwua8=@vger.kernel.org
X-Gm-Message-State: AFuF++l2k64QUK6OfQ04tpd1tIdDPaba8y9y7XtNbuRzqIYORQAL5RTD
	SxVn65BT71RdS/uFNltMxjKttFmavP/slnpdXK4dbwaqG1JZTNIHAG4t+UH1O4EMr/WifZCq3WU
	HAx6wOWRTbX3zJ3N89uEpvBOUGh9O18bBz7EHUw/lTu8vsgowLwVV/ye36BEvWO73Y4c=
X-Gm-Gg: AYBFou1afyYe08Bl9nuJGwqASM3Cz1luc4TK8usPkhnYHJxVeeWUROHZwEKJsKb2PJ0
	FSOohhUy2XW6anWj5XC5jmw3+AaoVoNtKkvgccY4GEgeo41uE37jsu4v2GV+eN4LCxu12R1RFRn
	gqmjFF7QjfboyAlbGHiwoqN2VAnFgpMlSSX1JUQPbSQ88IisiE0xdutz9HhMyHLmMsTvgwoP4hR
	jWTyJaL5cw8ZfpWl6PcijLteCKPDoiLIYhSmOxSY8bYo3Ho8dtKjn5fwsh+sd6uisdNEEMSPwma
	LxVKNF/jx6x8yp0+0KySmM18Vs7NXudV0OPSnMjvOqCCf0ZnLjiLcSFAUGcZc0fsuqH5fzk3npa
	BN9cu+RjFg62yqFXSTxpXi4eJKRLUhrM=
X-Received: by 2002:a05:7300:8427:b0:334:2f5c:7c71 with SMTP id 5a478bee46e88-34003ea90bdmr4212621eec.33.1790315359290;
        Thu, 24 Sep 2026 22:49:19 -0700 (PDT)
X-Received: by 2002:a05:7300:8427:b0:334:2f5c:7c71 with SMTP id 5a478bee46e88-34003ea90bdmr4212565eec.33.1790315358318;
        Thu, 24 Sep 2026 22:49:18 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757747sm4033640eec.13.2026.09.24.22.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:49:18 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:18:47 +0530
Subject: [PATCH v4 3/3] media: qcom: camss: Add Glymur compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
In-Reply-To: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790315331; l=1214;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=QLwU7fKegSZgo7lckFiKBtN1ZL2aPp2XYB5oMQOrME8=;
 b=GmEpPaANJX5Rbq9h6qVoKL1Y9Z5DqvP0yTw3ry0S3pNLIgkkBoGmp1DvnWKweEA8hq9eRoF4i
 MGN5D6ID16RAFcN7R0Nuax6bTwsuplBO+rOdSFi/QbrQDiRqc+R6FbV
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyMyBTYWx0ZWRfX552PUNPfbAtu
 RG0DXntAWDSCfiteKVAiH63ELCqeOGnss545pnwX20kjuTnZjBDGDEpWqTT8ddHScvg0v0462Xh
 s5F3ZXYOOOTN/vU9IKabgCFc8KiE6xY=
X-Proofpoint-GUID: Z3_ddR72YpZk_LLTVMJcGefH9GCo6QWf
X-Proofpoint-ORIG-GUID: Z3_ddR72YpZk_LLTVMJcGefH9GCo6QWf
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab60b60 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=xYyVevvQUQiUFKtwU9sA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyMyBTYWx0ZWRfX2k+ATOKe3JbV
 YtNPP4or88u0O+163wESF5q7rDS5AHjQHtoh0vo5w0HCi1n2+dddIeZwIAPXzcW0GwwmZb+RqSe
 H9W45TxnH5zl2NNJE6+a9JwdMCt6tnYXF4/uTL6zvt7a+qK8HqND7w3j2YwQGs8n6EDwtiP9rk3
 znGtTdHde2kwVmojThxsdt0COml1Lx3taK6O7SyeKWsgYQrd3p7P4BmrM5hjJuDXpu94jdXCyB2
 J0gmdBjBDlp1eqlkWIUn6akjz2vAJJy3bHqrBpRw7pS0vy2R4noXwy2DAttNNe6YHDErXkZeyqv
 0wOqrdYA8BA96trOj8GV9IVIx/k5F/EUX5zlGgCWLv22xlbFXj3NH5/1ZOito1aoD0SKYOP26Jg
 bLBZc88IkfLucxLa1ylCWm+QQPGjsIKzQ/h3kjqiCJFLtu4FESoph3ay//eeqY9/zRwcUpKiKSB
 PjQvoBrZICU72aQVZkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250023

Glymur's camera subsystem hardware is a functional subset of X1E80100.
TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
three CSIPHY instances versus X1E80100's four.

qcom,x1e80100-camss is not used as a fallback compatible since it is
already claimed by its own binding schema, causing a duplicate
compatible warning in the DT schema checker.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 23f3cc30a15a5e098162bea98ba69fa636abdefb..9954a99981004590d34c722337bb6510fe759699 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5751,6 +5751,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1

