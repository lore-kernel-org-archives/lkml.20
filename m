Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0D852122F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547881; cv=none; b=ryVZcopH2FjP3FOvg0UxktTDCM6RjseIJ9qnDIr74//mO1YPnLfdEyTJiiTEZfhg37cCXMALU6twCGCWp6KoEIZhijjqg937QDrYW6go0aAnojAoluaIebzbd/tenZdEjLMfvO7GX1yPjuyKGfvXo6RhLdtW3g2q6zn/6O+qATc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547881; c=relaxed/simple;
	bh=ANtqbgCd+Qn4OZkETZWDUVmcawqHc5YlKvgeXREa9l8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SDziVhHkg8rECCkv7KBuyhzIpoAqVvvw9cMpQlJmUu413b3q4HaWtoC/HjwdLt+cBTCmdX2uxrQ2K5WePg0dvO9vlWQORJql/SEYyWl5Xlv4+EXLs08jT27RwaPr8AAtMRhaC1TnCvOpKpp8YmmL2Vx7VQRdhM7/cVvYWqcFZwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cRL+Q45F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PnnIm/gc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cRL+Q45F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PnnIm/gc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HIG46016188
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 18:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pRKYnRDxm0qqvtNyh5/LTfsvz3GZJFe8P+VRq9eSgLc=; b=cRL+Q45FdSXEgPKc
	Wh1NUXiPTZI7Ik6+OR7rRy+MobUJYgM7+Q/GxuKN9QlclIC6pzph0vEyaJYd2yih
	oKtbxQ/tDh1moewieoHiBKksVXKF5vbw9b+snTgd9trPRuaBJxdz3RHrocqvejVH
	mEtKfJSkR1JAjIR/7MwXvnLLugU0o9YA5S/TLJGr260St3dpMlobBofWE8fRKWdI
	3/bwI0ywwp+2o9XWykssU6RYaheamwEZUfylpxMQR99KOgQ98am/ZJpvk/aPRFV4
	H6oEI1xgY6dY5Jk3ga/kBe6Y5FmATfg4RUb0uxsCNysoULqhqs5bQeKcExZQbZuA
	ckywHQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd3qwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:51:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d292eac1so2864531a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788547877; x=1789152677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRKYnRDxm0qqvtNyh5/LTfsvz3GZJFe8P+VRq9eSgLc=;
        b=PnnIm/gccZreBTFlO/b+HiW2jQ0RKxTJAjwMb5uQvzyEsrzLGHARgA7VlH01rAGmHM
         wEC60yGQT6qqUWiLl0UBzTsV/33N3DnhKN2VnOXrrxQ6GOibC2Z03Is2nhpcz3XfyY9K
         e6bufQnh7jw4tHWmh6Kjt68TPavMmQLjvHNRFiIBlnfxLSlt8bIEYTCV819KPpVbMr1B
         9/A2lFJs2TILjWgWomMZ4Rw5VFa7XUSbQH6/5+lpJIBgne2OqAQnTXiBGX1bgoN/FSdF
         ExZVBvk5UbJN0zq/+2i0ycYfSjYVoyI5xjNA0IMGZpcMNDfKYM1+/nFb5dZWrxGJOwmc
         qGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547877; x=1789152677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pRKYnRDxm0qqvtNyh5/LTfsvz3GZJFe8P+VRq9eSgLc=;
        b=HGQm7Zuz8Wv+MThA/rNO2/k5LgqmlGYDezQdNlgUjjCG6JLIaNpKdhYp1EMqSnWfHm
         LidDC/17jV64f5mYHvEKzKYh006bUAo+kP2qPSGXd2NfqinnnNa67SPBhJOHmF7/uOlc
         ly3ZHQclXaFiIPykyEZMClkvtr5LYe9ZkIbShQnwcNXmH9UUF19ubmyIoQjhQyfhLB01
         5xoFIbyOSJFnEiI+uuquAR2Lyrb9Cwj+nTVhNwFmpK62i8nSlWKdh2isHZ95vtPxC1+z
         3O5YSjpZNiiFh9unB8mGbWZihDcemmBoTIv/Y780ZAjNyPOa4YWRkIKCX/4Qluc99jJw
         YP1w==
X-Forwarded-Encrypted: i=1; AKwUvBy6uNjpDA6y1fGP4BrKfzLKq3Semo+PrbwoyL33T+Yn4BaYQSyP5yznfkwqiyef3ty3BipmdQLI53TOhH4=@vger.kernel.org
X-Gm-Message-State: AFuF++nrG5bHkFL63S0+MiXhb7vh2hdwrs8uXra16TRPqWPAYxbuA4at
	SiKZ6X927GAKuEQ2GRaLWEdsRvvIGilZPpRPAzJqttWsD5tMuVfbtCW/ANEyVXSQjyrawhdywZK
	11Cl/MM4EVV5dS+h3EtnBSCBu8dGU0iDHizX52jH+ynBuQsVy5sQ0Qhznoybwd8vMgV8=
X-Gm-Gg: AYBFou1xIY5fyUtJRUY4SMrWpn3bqqamxCEzaOik5DnVx8rEru+CV0sNTLz3XvLRN62
	v/C6rwa0qn6N0h8P3EeQCmnns9ihtKY8XKdQmilqDbOVk7jJwqJsAVDMRYRWidCk9bg9LqdsKZg
	dpZ89I6x5g+xaigdvKZhs8LBgUe75FxchnyoeW+nebAKNuHnisokEHZd1rSwa6D3DMRI6mkcKhF
	cvdAWa9RMc73jMu5Pn/F2Lb5ZmTh70KXrIkATlO4rU+DNf3l9bhijRPUf2vuw/oPeIZpVz+Ogif
	HaPccI/7e1nYLaO4qdqXTsXob0ImCdhm2dJguiw8OU7VgQNflPwhy1LJo4JN+D3sNCqP4R16jsU
	9uKEfFXiNHqvBc5etxQeFlUldPSS8Jjg=
X-Received: by 2002:a17:90b:51c7:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39b2609f34bmr13448771a91.1.1788547877006;
        Fri, 04 Sep 2026 11:51:17 -0700 (PDT)
X-Received: by 2002:a17:90b:51c7:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39b2609f34bmr13448702a91.1.1788547876563;
        Fri, 04 Sep 2026 11:51:16 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm8682644eec.24.2026.09.04.11.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:51:16 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 00:20:45 +0530
Subject: [PATCH 4/4] clk: qcom: gcc-glymur: use shared ops for GCC UFS RCGs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: qGrdCD6758LXxxy52nlkENOAP9V7632Q
X-Proofpoint-ORIG-GUID: qGrdCD6758LXxxy52nlkENOAP9V7632Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX4UDHxG+mob80
 z+2zueURqJd2r1h1bKWYUfIOpbjXDFLxx9E1+cKMl2eTIZeVhrDtNzVRDaR1OZL4IEaBmhFxTZ0
 4EMqvZm2rpbKRRies8Lt2qTAmQjGegI=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9b1326 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bkzknT1l8MNr9lhMUYwA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfXwuSUrYNGQR4p
 59aG7I/GstpBGHbEk/9HAyYIo3eeMv6r6P26Agdj3Nq+rrSByPclgxXDPbFyQq6Tp9SJafAYtrY
 pSxT6n71pbTwI/6S8AuCmjtf2M0OTAolyspD30GF46ZMzsYk6iWOX9xvH7a9sR3ZCMgDtyvk9yr
 Kbw9da9l1XBVOo4kyvuQiOD6MkjDvBwk3Jij8gtlUIryj4E/+6OZW3RTpHY42+FC5FcMxJ612hy
 8sXnlX5Wpz8VnAU6YrmLCQIjhABpscfmqgw/7coh/TrXMVyi40ZnKwc8zdQqYimnv3378EdIJ8o
 3qCfAhfkyQgITERJGpizgxE0S75Lqjirxk4ILCY16/uacAKx5BPUyx0n4xzu2nmwWgEHEIj6Ugb
 iuNPcXemVbnNyoBA8k+a6uExoCdkB4Z7BRtcPaYcR+3CYYQ2g59JXUBY0jtoJ4ozOn1xCroq83h
 9kLD8aNUwg63Bc2JivQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040172

Switch GCC UFS RCGs to shared ops so that they are safely parked at XO
during clk registration.

This ensures the RCGs are connected to a valid running source clk before
the UFS GDSC is enabled, which is a requirement for the UFS GDSC power-on
sequence.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index a47a2c6b961ba01edc69be91e299a190f4662c3e..1957c847568afe3769ebf00a8cfeecc8b0a88bac 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -2327,7 +2327,7 @@ static struct clk_rcg2 gcc_ufs_phy_axi_clk_src = {
 		.parent_data = gcc_parent_data_6,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -2349,7 +2349,7 @@ static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src = {
 		.parent_data = gcc_parent_data_6,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -2364,7 +2364,7 @@ static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src = {
 		.parent_data = gcc_parent_data_5,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -2379,7 +2379,7 @@ static struct clk_rcg2 gcc_ufs_phy_unipro_core_clk_src = {
 		.parent_data = gcc_parent_data_6,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1

