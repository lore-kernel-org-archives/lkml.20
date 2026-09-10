Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E727340911F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033659; cv=none; b=JYeUkCuv4uIQL9nGYZMkdtZXIrYHcVlJ6PFvtO0eaQaCSloSAuUL+wf0DM9YepjP1FM3ex0B7+DTBHfca1CONcsSfnW4oqbBlinBF34dISJ4znob7imL+9nBMSuH57NejUUbja3lNwrSTHxQMHBb61JcV2xz8s1G1IjII0PgzZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033659; c=relaxed/simple;
	bh=Z+K2Tn/r3FmA5PU/noBpAu14seALgosLzynY55zm9XY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ij9pXv2VatmxcnJKWOQbwK0ge45yWgUYdlfpC2ca2dVxy43fsXjh1I4G7JCY17eb9ulDVgrC9HfEjaAWFV9TsGcoD7EhvEuk4wNTSpM1VeoVBml2VLvWUl69iYyw8NSp/tK15KAJpTnywafvbfvz6+eUBYk4OQd1/Nm0/mxSYyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pLVZJLEO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGO7tmdF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLVZJLEO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGO7tmdF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pp5w1000594
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dtX6afBb6d38ZyJa/AlJzjQQ/zyOWjjfK7i9+QlvK6c=; b=pLVZJLEOMVRTdrPs
	KnwvGnqoc393uhgT01hnHzL0RmLx1vdYeOsIhYP+hcahVnI8eGG0idKU3T+3gRK4
	Cgh4FGr/YxUY6/mn1hKccHKMbDWm32UDp6H0A8NcyrgEwwzKIpReO/e9jFdhRlMa
	XZ1Ny2VM7yeXOOCpfCeGuFETvi7e+hBIpn0jAGUlXOknQR/iN6G9gi0Znbg3gKjx
	Dw7pT54OF3iMB4qTZPOwpcXbpuxnzfm5O5YrA++uanzMVPvr+kDJHnnJ/HobYWyl
	TtFCuxHAzljSmK78NoZfK9FahO0wdUBWjYmUr2ptlQGCc1d5lCrbwGrJUH++hcRG
	NtwpCA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvrn94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:47:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d02df2bf09so62048765ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789033655; x=1789638455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtX6afBb6d38ZyJa/AlJzjQQ/zyOWjjfK7i9+QlvK6c=;
        b=TGO7tmdFtiAdN7ONvc4Sk/BsiUxJ8boi13wj9dMz1QpGUleUvYehvL/WT4pV6U5VCz
         LVYAuQGRXa+R9lGtxvQ4hKhtibCK9xecr9xJ9KxdbzDA45cDwfOZFGTuU7A2Iemifdxo
         GMu1oaqGqllqWVFZu3AoqyiNXUaS3Ga3F8N+RV/1a2LhXGIYv1FcAmBRWeHIJ6XaC10O
         QRx2Y9oz4H1tIT2TKFUJ6LUZTwpAil47XK0p61VsvDalKnfyxNbJQhSbnPN/U9XixVev
         +yzS85ElItB5u+BAML1942IizFVlN1wh0OVXcu2Ynm4MsmhkoXDy1R+Wt8AWms78QQxn
         r66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033655; x=1789638455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dtX6afBb6d38ZyJa/AlJzjQQ/zyOWjjfK7i9+QlvK6c=;
        b=INa64Z2cwPoYP4I34vdi54hKkxSLXuHm9kbXbkslU6PYeJobsy7isxTL7rQKhnDjyc
         fbzsc4eRLfSv3IxEsakdI7Y8k3ygBWsSTiMbJqszYG4iMVkfQx8eKerufYh7MSzJS0S1
         Yp4V7MUUNaZHCrx0Os2q/JKPnEImOZfDdPUdMppB1gyqdAdBH7xvsADI0wU2Ar/BC45X
         +PRREiFjWvCO3P1ZGjOOLc4+Z4kSDqWuaDbXi0FeqeRtkwonf6bqR/yIn2YnUshneLs1
         2SvbI3dVUJ3nRvgc6vurNkeWfrS8N7DpfFwxgXPG08SzFFohMkGANi+wpb7TN/8hQv0f
         KWfA==
X-Forwarded-Encrypted: i=1; AKwUvBy32BOIVAX18AsXu+ztXOFUWXV/95W5v8ijxLl+sXwXZtXCgOPZJ2bpHQ5t6crOLizzwJSabmDY5cHX3Ik=@vger.kernel.org
X-Gm-Message-State: AFuF++nojLnZzcGziJaHTVpcWEa5PNcPvG+W3o6pwKDnxzswJLXbhWzw
	BDNSnB3M2Vweg8WPjppB7++xH9RX+BGcFlU0oU2itSVs9mIHAfpjw7PeqQKrVIISdtJJ7BBeEE9
	bFhacZsSL882+e06OeIEeTGZkP8bJWBZdgn+QZqbAtyUUCWLe7l4qLjOFp8i3CnJ/cxA=
X-Gm-Gg: AYBFou2ClujihNxbIDQvTW7TWxs3/EX6527ICFdjVX4WaFj+eEFMtVV9PA49A4XjQfj
	iNo6twM9TqWBbOXSW6S9FgIsPngnUJtvxvKCLrItJeKwo9BhHboK/zMyZcQBvdiZgBi2xW8Jd1L
	61SqN9gLrPjk3kqEGvENrM9Rnk+lPGgpKRipoHoZ0GDrjcCS9AlDqHeGX6yUjB32bVkCDq9FxDa
	X8nRc+/Iso931EPziJw3ZTsPy3XkCgwJGtHlES3DkaG36F3fD2x4grJ+6u42bMdWjnc9aePfL5J
	WIzL3BCbYLj8yWMEkGmkk1cGnd97tJDPnl6F34Em2/J41wvR4GsnKBEyaB273xm+VYG57KvS005
	n8x2DptGNpBbtg7ETfgN/0puuLkDkBIiELQaV
X-Received: by 2002:a17:902:e745:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2dd07b9d86emr77149045ad.13.1789033654701;
        Thu, 10 Sep 2026 02:47:34 -0700 (PDT)
X-Received: by 2002:a17:902:e745:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2dd07b9d86emr77148695ad.13.1789033654324;
        Thu, 10 Sep 2026 02:47:34 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm11941129eec.20.2026.09.10.02.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:47:33 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:16:54 +0530
Subject: [PATCH v2 3/6] ASoC: qcom: lpass-macro-common: Add LPASS codec
 version 4.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-add_shikra_support-v2-3-fdd2129c696c@oss.qualcomm.com>
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
In-Reply-To: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789033635; l=1076;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=Z+K2Tn/r3FmA5PU/noBpAu14seALgosLzynY55zm9XY=;
 b=WxY5kLApr1v7jLEknbMkvfeRbdVrsd+paK0SlrBjOJIjeam4Jcf/3HiD4G2OR1QnycGSsOwUl
 YWtxq47zs5tBGZ4Sz7cjJNdRLJq6GoSNc1UWBhUundn9BMc2Iols9Mt
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa27cb7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XWf998z4RHaF4_Chx54A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX5ITAeohLH3Nq
 ZMnuhSWMBvzG05nrMq+npz2aAYq2/lKWKIPQvEQ9SKxEicL9vGUj7zMFDgvdITFTPrp4Yu/L7oO
 +m0I7TbqDJlQOSdMP/vpePumYPnwWIJGyi2+2/c5g+iGjlTlqjyMcCjlRor3O+IelhXw7h9nVMw
 bSFrcTrFPIpc9P9y8If/vB7WEosAiZLa9IrD8ptw1MUkzX56QV5e6VkvfjqjVGN2ZtFhN4VUY3L
 Dk8QZTMOaDpa1hH4/TqLQsSM0KilgYzHIZLR5GDDEYZoPkR+eGiKk1gdFoHScRlmrNHOVu0cZdk
 86E4IYtjExcZZM+eZb2jrQwx17Kzg/l4+vVSJ12fC6rQymgJW9Gzv4wfjBgxyX3McKK0B8L3UBv
 4obJjywRZB2Rxy24nLq4Hvhx5vu3Ezx3N65UOE/K+e+sQKIsR/NPXt4W8AubMWC6jXkDM7J4M+S
 e5jb1kKFzxMBbaUWIaA==
X-Proofpoint-ORIG-GUID: ft6g-5mgYT6tHzjgHxmStlwZrQqWvO6C
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfXwVU37lZ6A3h0
 ECWHOncigCfGqFtmuRgo1ZRy9A90tP+1XVdqfsrxePWNfLIt6iwo7ed5VJ7xQONPgpjUCrIpFCo
 MyAuJfJrQ/vHmAFSIo4+ttgBSGqJ+g8=
X-Proofpoint-GUID: ft6g-5mgYT6tHzjgHxmStlwZrQqWvO6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100111

Shikra integrates LPASS codec version 4.1. Add the new version to the
codec version enum and to the version string helper.

The enum stays ordered by version so that the existing '>=' comparisons
on enum lpass_codec_version keep working.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 573b2145e..b52665b11 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -30,6 +30,7 @@ enum lpass_codec_version {
 	LPASS_CODEC_VERSION_2_7,
 	LPASS_CODEC_VERSION_2_8,
 	LPASS_CODEC_VERSION_2_9,
+	LPASS_CODEC_VERSION_4_1,
 };
 
 struct lpass_macro {
@@ -70,6 +71,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.8";
 	case LPASS_CODEC_VERSION_2_9:
 		return "v2.9";
+	case LPASS_CODEC_VERSION_4_1:
+		return "v4.1";
 	default:
 		break;
 	}

-- 
2.34.1

