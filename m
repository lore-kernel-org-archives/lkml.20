Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB6A476040
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246506; cv=none; b=mvwtaJgimbn5HBCttekJB7GqQds6Rm1m6fKvIvF1Y4WX4y0984TFp90QHD65vVo7oIIJsDtiOSYZhZvXuClNAI2+WA6Wg08rVNA/g5f1fH6HCNH42IHSPcH6j5GAmrrybFzGsQhbniS32j0TxWg061j/srHK/5fxsMDigjG8DRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246506; c=relaxed/simple;
	bh=p3n0vkGj1UgvhrXgJJZcBSedsJb1DlcOzeAG/9UG2H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OwvADrNHTr23WSC+uFTwZs6HLEhepQBLZiRdfGUng9bgvzpoNcY5Vd0w4yT9CMztjgot9s3ISeMp9HMm3B9MQvTxcatU5/bnU4J8KxxamQREmlC9TT9Gbjpr1l3gjz/D+2VBjOYSfesUB6DWZBHsvHIiyl2zlP9Q+wNZgYD/KZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msnL7tJg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7TcgpNa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msnL7tJg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7TcgpNa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA5Liu1175629
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pwHR77Ikl6CgHJ9i+7qXtKNMboGDr8DqEUo42XmSYD8=; b=msnL7tJgJjUVpVC2
	CS60395Sl1F/4FlEB+p3KQKPgGER34v2ivaz7ghWBdcVElX9uzV69hhlTWIIfJQb
	w7Wkv1A7kOmM7merw2C6DkGsznacYNsdp1G6PAGH2gEFnAwGFIXXGmxXKO726W8X
	xU7xz99OTokTsWZzM6YEDOsLhOXjo9vGR1NYO3zBufp0Ggyqc8DUapI0+IKWqV/j
	d5bG2qst0TLBDn3m5N8gL9ZmTCzv8rCpp4Ww8JcOQ04id9RcEPD1LA4dSJ2XUbil
	mjkFzhArbw5XysQbypp0W7Z6mvtkonk9ptlPXbgWHWJyZKbUMIUBV5MSoqvgx4DM
	iPgZbQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7r480-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so340803685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246502; x=1790851302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwHR77Ikl6CgHJ9i+7qXtKNMboGDr8DqEUo42XmSYD8=;
        b=M7TcgpNalPqIqHn/OWr2y9tLoaEZjf1O2myO7XqfyjzX9D1GJNKauYcnR7fISE8vZh
         fdVeekR0z5UFdYWSgYwV3vDq17rpcZPRxOjE5ewIoJsC2LsOXFJgxj+821QCDu6fnLX1
         Tu4yKPdBcYf7pts/zhHSpjB0kI1AE6MFdYYP+frFt8Zjhk7hkAfkqldTpBynwCsmQ8Lg
         87tK/6ggqXcz7UddlmwI3rH/JtLLvSJFiQ6g5DMGcP0pQEQZjsPLwvyB+j7IpecOf+hf
         8oQI0OqlzmEab4UL33DGiVTqau6aQFQPQarmNCqb+1T2Kwe97XpeUWuFH9vqDUb5h3WR
         ra7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246502; x=1790851302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwHR77Ikl6CgHJ9i+7qXtKNMboGDr8DqEUo42XmSYD8=;
        b=v9Jy7oY4CXWyM0LM7hgJTWiU6uczgmzrmvWrtDsU1cM8az85CCkZu6tTcsxv7PssgD
         sv6z397BjveIrahg2iGDR4qFWWjQNrqL2FYrzSt2mr7HqGbbmqWhduCNel1mFVhv0lYo
         CZ1n2BWJ7SP11yqX9ErVF/Qdud7mb19sZbbJykGhskRfNVCXo94ZJ3zKhKx0zPxOECga
         NevuVEeGwoJYqTrcAzUpnSlpEAM8yxS4woQMrmCf3UCw0S5vHarZt8Z33KHZIHAPwK1b
         YIYyBXzUhlzNr9fBFNBh3TPJhoQlCUf6PsLYu8Zon3h8lApTebowos5p/X8VixRmDFAk
         3RBg==
X-Forwarded-Encrypted: i=1; AKwUvBzFo1aWcEs+ilT/6LQPh4JD6PIFxbzamdfL0bQ1pzm4GeVhbbi1q0QGMbLT5/p87zqlbdBU92GRPDvLzm0=@vger.kernel.org
X-Gm-Message-State: AFuF++mXwCo4iBX5E4KD89dHWLGwpfDYYvwtC1UYJq8Lu2dL/kX7EIJ7
	YAWzFJbFYF/R3KkMCVJ1pSzfh74XSpR2qsuXOqHr2AwdZQlkwsUT18SF/liaRuTuqOgirrFRDwB
	eiDklg1o1cX48CkgCn/0g8l2QcfrlSczVa/9/QVCkvAF3zphgaAO7OvmZ8iaYck/RREc=
X-Gm-Gg: AYBFou3xKAVfos9Zhqgi1xoLV8dxyXwEiedjpiVOwJJcG42U7Fqu0T5zenx/Afv/UNo
	2DCtX2saMQxyyP+jU/PYkjmXEmcajjyEGOUVXeD8UvBPf9SBnlbC0FJoLvvoST/gJkNOjguZ5Xd
	thEKTV0zmCceYThgAing05TMfqcVuKkW2qpr8YByRjgXiTODkDpxbMTVP4U8kgozSQcHR2uPiek
	Ppi3mb4mLRM2es6L1K48e2kcweY0UXt6zZw2ZBks1ElkOY2gRLiLDqVWiQxP4hYovltXBE4ZE3H
	IZygLod8vDy/IuzA+IQ9kzXqyz2YCXNVNO/nDAnRgOThRwBngdMsxap9SS+huMvtDwddKmtXpIb
	EWCI4MZEE
X-Received: by 2002:a05:620a:3913:b0:939:f188:6d97 with SMTP id af79cd13be357-93c363febacmr208437685a.48.1790246502000;
        Thu, 24 Sep 2026 03:41:42 -0700 (PDT)
X-Received: by 2002:a05:620a:3913:b0:939:f188:6d97 with SMTP id af79cd13be357-93c363febacmr208433285a.48.1790246501415;
        Thu, 24 Sep 2026 03:41:41 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:49 +0300
Subject: [PATCH v5 33/42] arm64: dts: qcom: sm4450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-33-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=953;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=p3n0vkGj1UgvhrXgJJZcBSedsJb1DlcOzeAG/9UG2H8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP36rsI6Vk0qlvrs3AnGXi9AGUflFqHLjE8wZ
 G3XJCrELkqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9+gAKCRAbX0TJAJUV
 VlzsD/wNXN8OuhKqNm7fOxIdx9WVRUvSf1b4ElIXw+s3tWJTQfxPOfx0K9BTdmH+n+mWK+PSkAh
 VtBgEvWA0akzgdT1oM6RL8vfDzBGDwwwOwVULKyPposlNHxGaVeoMZfneCGm3PP1HcEu8hXWTog
 SxR2duLIBJQzAp3VsnrI3CEhYzSl9zz5fNSR8x/bmlhBPuADDyZJgKd7DULKcEvEP7IBspw9OWT
 86JqsG8Y5dNv1TP43NmruNqh0pOeKk5ZU62yGxsG2RAqKqwdkIWYkwiqh74t4NpymsnUgvN8BwR
 U5LqzEylDWNEXAmqeYlszfJzvVrxyVILc5MsEBLqpkaFKk0tBb5tD5souZ4rmTa83uT+EgVw/Bn
 mFeP4WkR+1D/yjJvQkTo8awT8GYZUT26+OlnQkzq5joXhcue7UlNRf6XLPK5b2oY+XZ5nJKBFay
 kvnVyMBf3WKFqXi0KHXeIux2Ri3wjMgHjNihV6b1iQlyQKzNVllS7XcPrsEJzWarH555BW0aUXe
 s3jJBbByJHd2umo+YWV4s/FX2nW1+k8mkZAwCefDhMjucZdM8Vpueq0IpeIWa051UjyFWmDI8vE
 1nBkuoUlLlVGdW06EOnTJYqMvloFhG0gs/FTUggAn53Rr376ynUzIiJ1Ore/KNhhG0fQbgAILYa
 yk3wOjOH9W2Zdxw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: KaE4KGDIYf4LJgY5TkOThLQcsZl4xFb9
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab4fe66 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX4cw3hty+EjzC
 cqfqiQTnpQA2b1UnVT+sXmyPi5Zl9qQos0yoZqkUS9Mv1txlR1ktlMTzr1OiBmsAtCGnyzBAFcX
 LpJAhjypTdDLMKdYSllu1naALIYLX7cd22qEUlApmpfvH7/DT3AT4F16pK16ENXf/H9XGRsCky4
 YmRcka4jTWIiis2FfWZ7VA5NBox5qy/XXdvIMSj4UCK8qQd3Th4FhbjJVdhzZ7ieBcKRjz0QdiB
 rmTZgr0qFmuwPLGr3XpgYy1FfeH84aWzRru2lYB3MxH2rDYOL4nbtwX4D+tSR3DPPfV/cOuP4Bu
 n35ECJG9Fe3vMvyn/WAJzvQ0UuSPIPZpCRkKIxwH7csw1rUyA1lF3i3GaX0UQ6tXKvwJpqk2KSg
 MhbeHeJJ1UXrnS6i/aj7fs+ZguiK9IAg11hvAf4n6VG8BH7A5vhYlz6WZ6P2ua3ojwXK40pj70K
 NyIiQvKYHV4VnvL7nAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX2rFACu9zcHIC
 PdxiXngodVQQYOuL2OPwegBLhGNTwDvzES5jlG5vGce6KwpA6PUQk9FPNpzGp1ApDVlegtTQnvZ
 mr6urd4FKTCRIeWzm/Um6urtOJj6aUw=
X-Proofpoint-ORIG-GUID: KaE4KGDIYf4LJgY5TkOThLQcsZl4xFb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on SM4450 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm4450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
index bc9c788b92b1..11ab6ed4f655 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -389,6 +389,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <0>,

-- 
2.54.0

