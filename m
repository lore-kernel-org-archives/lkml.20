Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA9848F848
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390202; cv=none; b=cxdoWwY1ZEYyceFLSydLpOqkj1H04itfccF40mDomqDNXnSa2yZ/xw1Gr//CB4iyY9h4xzmsu5sBRn3KMmQ/sCNBx/M3uCbCfcZ4FCyNCMhwLQYphjHIU0Tk5EEGtmz1LsmfbB6g2h0dQYtGJ19drOjwM1X9kmghuA9xPRmRVwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390202; c=relaxed/simple;
	bh=p3n0vkGj1UgvhrXgJJZcBSedsJb1DlcOzeAG/9UG2H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FVYFr2Dax/96wPCJ6SI8Xj8gArx3kkAflBESzcVKp64hTu0LgpfUux7cesF3FR88quqq/3J9yUuCT7kMNgry3WSH16YctLYaS/OVX9NyKvmJW/6i52SfKRHQebEqkox/V3vtouA9QPkR4KZa/sTicSaspCcr3CAK+T7+y62cvDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dag7g+8b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OH/21/Nh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dag7g+8b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OH/21/Nh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm18L727665
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pwHR77Ikl6CgHJ9i+7qXtKNMboGDr8DqEUo42XmSYD8=; b=Dag7g+8bZgC2bOJA
	N0fof+o/TdSTtP6iRlDHcF7V9zwazvd500GP+QNcJlXae+IySwKeAHDiOOqdHIkI
	Y4F6NEs4IWpck5TKWBHF7K6zjpWzwOT0ovFdnVViqcqeKYTPJUaXdx2bz1hJl1/m
	89bBn54i++WTeGr+a/2FcZ3FT1TypQBK5SHFaaf1/qyLi6lUstH8H6DP9LVP5L1F
	gWOlvdTvLuWdQ0JQ6ZY17UX/nWFU947qnAKrQMqIHz5C7JXgIqlGSwuxesEPU0Ns
	tvOJQQAAXfJFPhAr1g9ZmCzWuUq0PlBRY/LVUNOEh9kbe/cbagQxELUQ1c/YRNG0
	UswR7g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5ry6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so675553185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390197; x=1789994997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwHR77Ikl6CgHJ9i+7qXtKNMboGDr8DqEUo42XmSYD8=;
        b=OH/21/NhfQdyyuxfi0Douxq3PE0M4YYQKjVON1M/sNvpvUPKVaD/46sVWQhCzkcsEe
         rRTMkhsdhE7/IzqNiu4fvMvnhnJz5/nEAewqYzrmPAKe7oThFt4IU9CkNuCY0BNEbfph
         A+17n1kIKTnrzGI3/9XI8HlYYJHySACUVHWS7Uy0osdrWMb9FCKr0RDGx6/wz4eer8u6
         3a1YlJ7XxwlG99t3Ztrd3W5GOdqT43wpyZY8JZp94Nos+qcRwbXC293a8L+8+u91mh4g
         stM7A8mHJitNeC+BZ1D7UmV/v4misybBktVwHUsmyQP0+hMLf9IknmBYaJ8C4EKc3i6P
         Mkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390197; x=1789994997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwHR77Ikl6CgHJ9i+7qXtKNMboGDr8DqEUo42XmSYD8=;
        b=Po7wuwt6eZRJmKUltiADKuHF2fJEawO02PRxDSrWKcQwFydDTB7ndOtZ1zunnvPlj1
         ohYIPq1p2GlPu5WaiybszUlhuXUmWsVKtPqF2EZtdqbxWywNCVvZo1Pckky8dAuA7iNV
         dmsMa9VJe5Q41fHnesL2RpVR+zxkKKze4DKhLV/wIRjYWNJlrIbRqtkPPgP94BoP16GJ
         LJLcS49OBDolaj9nHh6vj7HM2e+M/49xJYwgHTj9wz4B/DjtvwphKfcro4lVSS/cZO2u
         aQ/EWv2n9N0zqUftMLmxuKnlVgGrNknfmDwQNN2vJyoaq4DtafOy60g530stp/UPLLhk
         pVQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEOtfbDVMXGy2wRXIset1CQ1Y19c91HcAEwPE27N0aCIy/yguIiYrtJHim9RHcJ94hAYlDm1VjTYx56oI=@vger.kernel.org
X-Gm-Message-State: AFuF++lQZpc7i5o8iJMfyDV742pWPnQVlrbpmv9hGWtmS+7d72U9zA3B
	XYOH/xX5OSMNuA2PmyFneWMnhtFjkpa6c9B9oimIwFbzUOCn+/0bcIqqLLUCSORehQ4/Oos7KXU
	wjk9VLmH8hhZQuxkFuIWFcvG+V/WrGw/9XBV6bJo7ZcA1t5ZC1ryzxFVM5szB8BkCqlE=
X-Gm-Gg: AYBFou0DgUkkq0PWOvS+OuYgSLfdPnnNEvYAhjD4Gw2ZXCcmi7fkZHgt6Ye6NsHjE3v
	w9/fSnJBlc2G+R9IN5ma9K1aZeV7c1eRaLHe6ZWMQQdqtlk08Vb8i0aW7h0OrpqWYyOnXaOYmDb
	n/Ji2R+Q1YQrsbFMoLSRsuRw8Tu0ikOebyR8uEn4LIHPKMqODrX2X5WAteAA/zOUldeYOntC/IN
	tH9KO7yYf6MxMq8oB+IgIp/cb7EikeP1msXzNow3LefXZ8FhT5LQivEskDQa0oX7pRniUmJucZE
	pBrn2Ys7cecIZ4xLZc1sswT/HH59Ni7XZJeTfSs0xiDqMJKD5KNvMwRe1UNr1h11RJLFg/a1jyb
	G70mPE9Ay
X-Received: by 2002:a05:620a:440e:b0:939:1b82:47c4 with SMTP id af79cd13be357-93a29a07c1amr339261785a.37.1789390196897;
        Mon, 14 Sep 2026 05:49:56 -0700 (PDT)
X-Received: by 2002:a05:620a:440e:b0:939:1b82:47c4 with SMTP id af79cd13be357-93a29a07c1amr339257285a.37.1789390196331;
        Mon, 14 Sep 2026 05:49:56 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:42 +0300
Subject: [PATCH v4 43/52] arm64: dts: qcom: sm4450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-43-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=953;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=p3n0vkGj1UgvhrXgJJZcBSedsJb1DlcOzeAG/9UG2H8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z1Cc8eRWGwfR7ynK0q/naAyx7n5+Lc1/vjz
 tRonU5EJs6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs9QAKCRAbX0TJAJUV
 VpGeD/4+Lbmd77Y46HqMEqLIbLxhM4xen2gJnPN/S7xLiWb8HF1ysHTd+CCqTaQ/+ZnA9jA5TN4
 VDd6jwly8E5FocLlxDUsNg4/hlzi3nj7+UsKIaGRj600TiBMeIe18ZR184FOO3QEBPPqVNXxf30
 MKPaeV4bHYJ0pzMqSP7c8Jhi+4eBH2kRQRXgEDZ4fG+L28b0HmUqYdSN+Oz/rM3dZIpTILIDOC5
 RKyCU3yv9Ge6rhfeTxuDRXx+D9e4JHXkXc1Qedcxm0S8QPmDOSKiP0agDqCjbIC92peJy0KdbJp
 nuPqWAhW3Czr5Bovayf/uptaCcTAEbhZs7UfM2z4RM6AA4ecGxerSLdyHEQgd94ilJ5VEE7JY3i
 aFGIsia5uOskUEg01vyPMT+20lMOEwYp+S3G0JttSrzWjJcUjTu2ThR9PcBMTAlKLrTpAOmVERg
 vB+8d6d/dQYesBldrYkKnKZ85qaJMIFQriSosCsY4V0AFL1/bmtzXroXeiqDFa1hU38JP2Rj+IF
 U15cAA8fUlpFcTffEWsEEvw3qkMySPUqMD+cPF0WP8JNuUvmoPM7nDMahVidsqJVm/cQ9e0r1+o
 Z9OKlAtv/A0rTsFZ/ZyxhRAZUCw69IKpRVeDcn22YhInejKsEI++yS81TxNkHeepkt1T063Qzst
 Ki/bX4xXP7t09uQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX1RlIOqLbYkTf
 YFfFvppe6zXoo0y6xq7Axk1Y+UqWGXVqngB6xIsDSBs9TPVR4YFJTJLd2kD4ULZBVlTemauaGdl
 itE0EOzOOV1+njx6hWlIiI+bLQMoARE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX4LHBch2+b3Rb
 N9sii3f4G+f0Od9nAhtuxpykZiQH+lL+Mee3H+frwJM3gMc5OL4x2tgWIQLlS6Fyps7RCEBukxD
 3HQZkIjeRxK6SsoFB3bje1tVo8D3PRS+QB8I6V2CbJC0g7+UqBCizp3vp470cdfx41io5vFnsDJ
 qu5h1v52L5EknzDIEH+90L8HaSzY3R1ioP1oFQV7EpBET1SnQJyUi/4Rzqhnd1kA/yu1S/rn6ED
 p62tIhmoXdIa6V0NrLTcUMftbXktpOAFM+YYzfYNrOVemG7FUeZZCHj+grdVCFuDsnoNoinlvbV
 O+xaPT8wGT41gAyMpL9AeS46mb2MOy/2yvfRHd8qQL5P/5epYo2W7yc/oQsucGba77qjBJlRZii
 K6yCTMDDTZhHkQJxEftXrr6U9lgt24fYuDPizaRAQtHOpc254VojcE3RnFqYHdePrheF96QtvIV
 apj3WejHiKPzLIY/s5w==
X-Proofpoint-GUID: FVwsQn5GVEnL-s0cothq9yPTZWXAAW94
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7ed75 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: FVwsQn5GVEnL-s0cothq9yPTZWXAAW94
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

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

