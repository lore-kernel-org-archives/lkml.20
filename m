Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D563B995E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474083; cv=none; b=QFYnihKSUwHwq0l9Ju8MmO1IpLKCf3SfpKVti0nAGeOvgu66U8R09t8WCNKEk9I7FJOt1xAfsgK/WgKi74nJAr1AXA5I9QQ6fDj0DmuzW7D8ox7KVmS7yHZpv5I7EkXULmA0ORdg/p6vAt6X1guOg2AHZ26kMIpe/vwFa8HXuvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474083; c=relaxed/simple;
	bh=q41Fzq4Slq5rEpTdIlv6qzewx5wVm5FY7Q13iS5rtK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJSUHbj/WbetGNBqrpY4eAIRI5j1QviB0qAssGuAqFOknm21E8MTLda5uCWxUPYxYitxeuwzL9TUHecEemVeVem3fMAavSu0cAtBXAgkL50MlApt2eh5/HcsqDjxWcpkFDcwdu2eBLzW9/6U5kGtMP8xifioKDoN1vLVPtOMJ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRj5/8Ej; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjEUzILJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRj5/8Ej";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjEUzILJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hDE1064567
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0tblK1aCJWf2NuMWTd4qfL8+zHkiZDE8bJsRN6uqNKU=; b=YRj5/8Ej6fnslHtl
	S3QC9mBvfF6cjZMIpu3XSaG5URUR+SNXNoNh5pfivx2IX7h1Pwnt2pt6lPEzIJmC
	BbRf4azVLQW7p44W6UI3RP+ltXkd/9jjpt29xv3P4AwrYkQS6vP9BzWPABHlAWH9
	ApIoFaDzsE9qlVbXtH4WLeLclAXzRN4XY6IOZcvpA2AkQ0bduRH0tO6cBn11jdxw
	kzFdgxNQt+dx/2Nh/2OKh5GUQpFE1tg6b97+NhmA6BQnykHx/oKKYoC9aVp1Ucbq
	FWoBbrQea2dbOPM8ydwakvGRi4m3nYV5Ev661xmoxVH5f5Ayq+6WqtiFXIJ3H6yo
	HKW44A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41veyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:08:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso8169365a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789474080; x=1790078880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tblK1aCJWf2NuMWTd4qfL8+zHkiZDE8bJsRN6uqNKU=;
        b=RjEUzILJcuOeLFiJ4ULacZW/87iBg9dmsydDSbU31IECkHD2m3HvbMJVWl+VZ8eANJ
         pZ+xNPXxnuj5aChAu0jFtBKKsA+jAcmZxcfiohKmiIBTR9/DDTYhOXkUCW9eEWIl5JaP
         GHjExmHxAdnXGYK/YA7T8nFBPY7l6tyguGhpdKaMm/QMrCuJTHASdMXVOBwOdcu6rNgd
         Z2FggXUHVTwElqq7x8rRW0gB9deejHtQAY1bHTsjd0MzmK0+VvHFxTtbjDqxaNQy6Fg2
         P4nLEbMuLe4E7nz4NTScRVh2XdgKJugqgb3TA+gqRVa9R52ApQxptp0zN1p3GzLui0/p
         tc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789474080; x=1790078880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tblK1aCJWf2NuMWTd4qfL8+zHkiZDE8bJsRN6uqNKU=;
        b=xYet/lFEGOZNKzjLkGJVELgjCjGDeMWj7DCnl0DJ8NogcudbQnp1MQXGFKf01Q/mzu
         UG2W/QE5zAabWyTjxHcjuG0md2a00R43MC7vnvQoaQ5kXkLJlI4wjvt+YnelAlkhEvt9
         dj1Cv74WwPmmXqyBOc7KLxeqguiXGeKAmFoO/1Z9sjtu7HVG+UIeicywPCF1J4WTrhPu
         joQIVgQcCODH3ZQlPcZdxnVko61mBIlTLKcR3PxWPKTQFrqyoNdvicOJa7NVp8P62lvw
         1j/uUMNcxpqLWpHs/V6CgXvLUqXOiUBfZQ3yZNylNVZl2xUoZECecx6pgeCL5/LR05Lj
         GmYQ==
X-Forwarded-Encrypted: i=1; AKwUvByBgt5sBiJ4cuapscO2Dwf0Y6UkfB2PrCg4WOzMTYipF2ERgE4NtWS/MrTJ8pt2S5F2du2EdLAp8i1s3Jo=@vger.kernel.org
X-Gm-Message-State: AFuF++mJjWTZIFVzou90J4EqNszq8z45i0DxhLcOSAgsR38EX/6Fou0U
	78NWzHmfYc/gkQmlmnMrZMeY9aB0AoEB4dENXNg73BSpSVOekCI8Yu5PekKHNzeLiHpf5KJOBnU
	TtporJ4RvShRZjp5Hc0ik9aVcwFl71BcS6RJxW5Cv3V8RepcEETrhhMXnLLSGQu1mL3k=
X-Gm-Gg: AYBFou0KXUmljOwTqBVEwc+t3OIxdHDA0P68QTGVN6PUNrS7uYT7xiRCObv+ljtEm2n
	B6J4Y2AR2uswoHmar/TWXAo60e0cvAu/iHSxSYHGrtc95hkgwFkw/VoK+vAmkP9K3ROm+/JXyi+
	cxEp55CozEq0+vWPMlQSr6H4ccCrPdUCe3YgapGA9rKAVCPAE0SUCfQG70xfVsNaWFx7OUBd05W
	aTotCkoLco+APRiOkwXQT0Uf6xifkftmVSDAMczfqd061Vi98PHNukOvkzAh4VcTzCAdgAGOqYz
	K3hbNn82aHQYMvlfDPIJpVRwZYSm1+ZAkhye5ZRZCJub9+fjkSAy3dOgf4YywdT+j21Edx9/uyF
	YkRUWXx18cUr82+foPpJu2wc4/NcW+qg=
X-Received: by 2002:a17:90b:2803:b0:39d:f253:5fc4 with SMTP id 98e67ed59e1d1-39df253b354mr12198276a91.17.1789474080420;
        Tue, 15 Sep 2026 05:08:00 -0700 (PDT)
X-Received: by 2002:a17:90b:2803:b0:39d:f253:5fc4 with SMTP id 98e67ed59e1d1-39df253b354mr12198210a91.17.1789474079962;
        Tue, 15 Sep 2026 05:07:59 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdcb618bsm4905004a91.5.2026.09.15.05.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:07:59 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:37:31 +0530
Subject: [PATCH v2 1/2] clk: qcom: rpmhcc: Add LNBB clocks support for
 Glymur
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NSBTYWx0ZWRfX9mQXSbFInx6e
 6jSuxgG1NUmaGS/N2iW/Hy6tFRTjic6rKxAa8ufZkwfk4lGAQKdpAuIpycZDBpHBrBh4rXj2HuC
 s0Ux2/iLHhx8qGUqmt4uMGt7+9LjprFWlMZ6Om4gf6jO2DlUL2mnMadIMfdgrEloXiMi7wzjd/7
 VE/NNZR9F6djcaJ+MI8vsXazjqR9ADQij0mxa6UQX7y+olqdCSb4gMygdHKhasJQUNEiLwjFs9W
 G8J9AIyPpyGq8jXUypntDOCW9aMMJDaBJbUPFffToHRlglFvBSu0XAIUi4O1MoIQHk/B4bpuaRw
 mO/brEFA4B0FOLApfR8HYTedR6LsmZIvyMDrpNKCbsSzzNSY6wBCBd2YbSElg3E4Fqv99Mz34Kc
 FxwVbRUtSLzMHkFJcrflmWUJG9wMqnn/OjLzyoPJF/fYoFn5L86zHWukOV90N8cjl6SK30g+EhZ
 tnoocq7WYZnae6YSWzw==
X-Proofpoint-GUID: U-zuzPxc9jXHFky928l_ZKRrMY9yBPPp
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa93521 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XYjrdpVuIsIQvarJBHYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: U-zuzPxc9jXHFky928l_ZKRrMY9yBPPp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NSBTYWx0ZWRfX9Rw3o9lOjnbf
 HyGl1SKlbbkszODIF1hq6eqoIwILUJRuvXWX19B0qO225MAlSXiE6v/SeKK65SAgrB8FOXrAIUf
 93RSPhj37vWNGCLnhcp/KQgeRAsbRp0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150175

Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
platform.

Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index ec8700b6186d8d6dd1911b7a33f086805770284a..3db81c709729b547f288eb10d4aa5dcf63d9e951 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -393,6 +393,7 @@ DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk3, _a1_e0, "C3A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk7, _a1_e0, "C7A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
 
 DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
@@ -902,6 +903,10 @@ static struct clk_hw *glymur_rpmh_clocks[] = {
 	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a1_e0_ao.hw,
 	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a1_e0.hw,
 	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a1_e0_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a1_e0.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a1_e0_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a1_e0.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a1_e0_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_glymur = {

-- 
2.34.1

