Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779A148424C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390175; cv=none; b=s+HYufRc5K8HPjvblJRNfCCpKPnYcw9rMPWHaU605dnJngdMqrEMDcD8/dTpnizPeSSgki1Z2CFdDQT9CHM59yDs4EWxNAfOto0nsQKA0YICAmZE6rDQeu9iLDhrHRLjujVPLSOYXmU6y06sEHqaYGhpJk65pM//pHFCzdB4hAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390175; c=relaxed/simple;
	bh=8unvUEpP9STiQNoF1CREMz34B7ZPBMJvLglEkBYOewM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EcjM8tHCtO3pHEF3t308BRoUtyXdMf0m2T7EN0/XYQIpfImUlGjiHdqKWSHko2PoTCVlLitj7Z9Q35HBDQXqi+Z7+2wo6/z8JtngrC3NpDAr7hEVm98qcPuP6ZzvQ4DwIVSsSdbRqZK5uIRtiT7S2vDsDZuc2k9cbKl6dnESaXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MY87Q0AC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6MPm/ww; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MY87Q0AC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6MPm/ww"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm4bM1216187
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BS8xI7KTU1nTf1SesfJE9zQsO8Grh9MUHlF+za6AxDg=; b=MY87Q0ACcqUs3OFL
	CyNz0b80TTk7vaynmsdRltqmTToi9F3IBMchagaWmI8+0LVPO/bEnkt2iYJfmYwr
	015O9RI2mdkHGpy7/d08Uzd4vYyBS1gFx6wLQv5+qZGW7mR/L/6VhqOuMJN334EE
	pOzQ6KscggQiKK3pcU99tPRiadxpXWQ+SJl/6BGyesrUN1l1Lj5YXaVhZLW9jjsF
	X9llEpcGQouEqMbVXNd3Ap9Yj+Gv7hED3RRtpm54ad50IC76sbDsu6q+sJpg3s64
	uYef9WDWpyF2pYIyCJybqti2bvelbeTwufsKG0KbzK7rhuZRkcOk9Qo7zuZJpVIz
	uDSk4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0ahtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939c30aa9a0so291206585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390171; x=1789994971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BS8xI7KTU1nTf1SesfJE9zQsO8Grh9MUHlF+za6AxDg=;
        b=H6MPm/wwSgnQSImeBhL0w4Lwxngc+ne+CF23WyhyuS4ZbWVnZyTepIoSpAGVlQcp5U
         meMyjdsKPfUME8N+kIXDpcUdQJYHE7sz5QzYshF56XKWlWrOlc9hTe0xTLydxpYiXID/
         I30zFL3XnlykH3oVJBBHjj6fdtKFmmI/AGWasAP/v1pFZhqTFiNucMzUJJWDVwEeag1V
         U7+EATn54ZXfkMkn8qodY/OO3TnM+rt7GtqNoOq3EA75Z3N1JWpOC1TP2YGh94aB1o81
         xl6Tj4Xjqs7QoDjc0FmY3EteBhPaL1LwkGxmufaBqcfuCs0gtHFfmc4y/ju68zvC6qtW
         voGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390171; x=1789994971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BS8xI7KTU1nTf1SesfJE9zQsO8Grh9MUHlF+za6AxDg=;
        b=KefzgHxwQLhu9cfYzY7tdF0Gad//wPmtSa+7xsoc2oGVs0sYuO7i6MzFeBaynYzGKB
         tlXxfmG+PKGXLDt+sgRmhxiQOY52/NBPTCbmITzxPep4V777kpgrl5152HDgxaGvg/SU
         ZwsAgSwDjW3ROkpuKPh/AFSJJYMS+V/ke0W7AipKznfCSU/b3aTCSo457CaYYjwTR/Y5
         KkghkVYalQAhVkNWIG24sDiK7jIL+4AnSpEU1YdVTJjMAo/sGhChsL5ULF6eOJ1u17Wc
         u/CDrZMyDsiZTLmcOTI5KsS3rP8Mw9R48IOMOFrOCZaj42Wdwcv9MK8n9Yn4TfmuH4OZ
         oZag==
X-Forwarded-Encrypted: i=1; AKwUvBzufwuemPSr14UPXay+yaBtZ4jPoueA4wu71cxYkaPYhmBs0qVzpDlxyaLWDe1ssEd0HfNGvHmEhV5GFyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kywxW47dlkifrL871VKH10/3Ldq54lQoKYOATbIlYX0eYsO7M+
	GPvOf3h3lqw8AHXo4QYrFTkRE4yoe7KRts0WprxqOWVUvK8Q59BzoVFE0Wp5AWmrX7uFnYJPaum
	a5Ddi+wQ2sRjC7bDgFpSrm9TKFvFpy4tlqfln00k8TgrMjwUBklCO9iPP0vDirrSP+7M=
X-Gm-Gg: AYBFou21C6tw6ty2rm57MaJgg0MllDYuXyhXpSr9jnHCRr+4Ul/Jlt0U7JcNFYOhW59
	ZwIvyUvVFGUTYIPxpJGmVc+ClTn4d/qNPlodkY/oZYCv8P6wUHhOWsDpnmPqy2g2rfHjQ9L9FrZ
	m5XSS70vwUy4OuStIQjH8Apfn0RDKtAKTxnlOs+VvVdDjOEg7saf/aNn27ZTiz1nBXqdL5b3871
	k6yeJusXAYZTq0Gq0Hox/wZ9XcwiEtAuqWjY3QSmXHDXB4K9055KqHuAKTwXs4gzvc2BfqB+gik
	3tPc1EgeIL/9suWmwsgZgQic9L/924Et9vsDIdl0gjwnOnxWSs9e/+zT4diXCV9n50s5C5PKfgS
	G6npzU55U
X-Received: by 2002:a05:620a:31a2:b0:939:8f2e:a0cc with SMTP id af79cd13be357-93a299eaa8cmr317618585a.30.1789390170493;
        Mon, 14 Sep 2026 05:49:30 -0700 (PDT)
X-Received: by 2002:a05:620a:31a2:b0:939:8f2e:a0cc with SMTP id af79cd13be357-93a299eaa8cmr317612885a.30.1789390169886;
        Mon, 14 Sep 2026 05:49:29 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:32 +0300
Subject: [PATCH v4 33/52] clk: qcom: gcc-sm8550: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-33-9d5a606ada33@oss.qualcomm.com>
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
 bh=8unvUEpP9STiQNoF1CREMz34B7ZPBMJvLglEkBYOewM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zr8ZZbsgQFGJcw0YXyNwtv5CeJfAJFldSIj
 opSd7Hp8SGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs6wAKCRAbX0TJAJUV
 VvDOEACdiSsorjb9lqVUr8uCCAh3SVvKslzA1pNJz434UyGoTnfaGE/M+5sxx6MeqZYbVBfYrfz
 kTtXWDE/Yc5Gt6KnPnZtol944tvuNWjsIjunY20vtwReq/6b77fPRW9/ieviyqf/TftHM4r+/pT
 hdKLgEHJHm+I/t1xjnHt2NlDURAB20p2aeXVMNBP8m/TCe4guIGyMB1IYIrR9qYj/tmiK1nRwh8
 pN1cH+b/S1x0LB/N5z4zCG81AGYTRrQovwTSl85ix3iRUt7ofqEq3G2sQ+L8ija2Bm95aCLVOmp
 MBOwSc1kTY7X9560AwqvI1mDQZZLT4bihprHF6IEjxLg7A/Tp5cKzakyi6pJj+x2XgyWsZ3KZwV
 q/qiQcFSyMMeL9akKfSMRXIMz7zTSktDDrGFiQQXmJT47jLFPTuE1LGZaiT0trh1gF7/LY2IfF+
 S1aiQTRwb7dr2r7G1UMp0yuCNH4wHW7nCkC20uaQssr7Mqfv/z6xK+aApTBJZMf5q4n/sSKOjlX
 rRyNS7DijYE68Ueoi2uz3wD1+t3njTLqsv4kqqEk8ZhFfeaJJzP8rJPpBywIIhV3S4SCe6TWdIP
 pxSsg55LgYu9itg/01Rq8bxE3WQDOaVaVFh7D9eyzt+asuZAoQJjFgbSpMuIRmzMJdlJdmAawdS
 4NrQTtwPAQuHoBQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX73eFJaFidbJo
 GVFgRU8lEbWkW4tXN/z8AmlU/L6wa/B40ZqfVcCt0/wx6sfMSCy2igekfqfXfFb5JArOsXNku64
 J91G6eMoLSKn7NxZ0aVzLk/3oMWeFuk=
X-Proofpoint-GUID: jIWZglPD2u-PPqsj_hfw2nRwKLliTSr-
X-Proofpoint-ORIG-GUID: jIWZglPD2u-PPqsj_hfw2nRwKLliTSr-
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7ed5b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX2nf/z8nD62F/
 u1D9LA5fetIdDheYYGfC9Nhocrm1HhfmuZJfd85GH5mAxlaefICBCsNiHBoM9lRZZ8sekSummpW
 amnHsX45+fok4oiljSGpimxFKROEiaEuPAtoeKNyFQSHmvbs+mtG6/3et3d0Q2cgLtFS0/IW+1z
 wTMlgLaXANQinpZ4hfccts1eA4NLQsvnkXcFZuLjdkL4Q8NTk6KFA0LH952duhw95Em3oK7oDrd
 bCuC494C48zn4iOwRS+qO9Lqcl3TzCPss+djEDO1LOI4ocXCEoy/Zj6gJUqk23utGUZwSUTB7wy
 B9U2umWaqhggpca+MkPJkGhz87OxiqYmjP5yF0O2KoUy2Mmn/oThPlVh1uJMp3kTl4qIpT/ZSDe
 5+ycrlQrdEBkf8oyMqDuFW63WysIQGKRomKhujLlq/2aCh10Eh0YPvC/QsTa0GUaV0BzduCpzrl
 adCH9r7LANXUthtrNyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8550.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 36a5b7de5b55..4d6db0e59bee 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3327,6 +3327,7 @@ static const struct qcom_cc_desc gcc_sm8550_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8550_resets),
 	.gdscs = gcc_sm8550_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8550_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8550_match_table[] = {

-- 
2.54.0

