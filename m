Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F385417BF9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179320; cv=none; b=B0FW23bsmtnNxiuUFVPRCzyBGwsVbNmhKG2YKqUcUbaKg9+vFEII5E8ijaUYpRiFBEBlwDEtqYR/rmHWrzuaqhETBSeRNvK72cxfYHaiwWCyyzq41XmKCVm+mIarjFw6OWM1wT7z04oi0tUZXut6LsAD/bPoYWW9wxcs4leRqgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179320; c=relaxed/simple;
	bh=Dzpg26Vur2DCvULsTE9E1JAC2Y7NSf6GVeoLlup85aI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S4tcAqbDkxOmwFhuebK5dfz1gSfX6CwpQzU2TUV0EUjoCp/dyqfgXQHM08kHn5pJe4lxx6bOzGPMLJ02Jn3TCVUdKlYOslqZ0nKqaLJ929QdswXNTtEas2m+hm6pwiIdapdhk+VlUfKHue1xa12kyZMp7cDjjpJlM9uu6VoGhGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lOIux38+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGhSq2wm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOIux38+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGhSq2wm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDL3U7177194
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=; b=lOIux38+Goiz9v+M
	HRVZtClTNGMpBXMJuFG+Cfto+7MLYOnaJJBQkEM+wb1aZXlIT5vXIAOstdTa6r2d
	o1h+JprGBfPA0UTT5p3uFBro5Uay6VsU82x0kGMm8UIOCGEeNfHQtCAIJlPu4GRS
	4ubq1t4C1EFWY5eD56AgfJlBkStGCj4eTD+kBBLkvb3gF7dW1Qbuh0/ngPND62zR
	hEo8n1HMNtyKA8cESz3Wyi7eiryQllCcDQA4HW0e5aJrxxUm6+tmsOXp5ThRELKe
	cbGlMpTvUCATQNGM3rtEgbpLC1E6c1BlK7m3q+xleU825ZzRDFjSg3c1FYqSn2Dn
	Q9vwwQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxrqyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:01:58 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bbd01d56ecso357352e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790179317; x=1790784117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=bGhSq2wm3mwdCkcpwCUEHK9/P/jqCQ0kpfqRRfSHMZifWb2GfezxxCarAPeTnv2kWj
         8m6T2sDSzZKF5IYzEmJs+nT0NASviQ7DtKEtTs9IOmovUZ7nSmXVmrz2Pph0VkUsEb1x
         XhPgJ3XbncHg1nkOEPGGoYJiOLsAHQG9cfTdOHf20PJJOkHJ9sZ1HhkiUFH/Lml5NS/h
         Dr1wbz26LtJhIU8FtoOxVw9iZjFR8SLV+/exjkXDlfkTnuwvgoA25CfuRmjPTz0DBg2O
         pR9ozyjYjpwAaRdQCWjZiOpC9lO8Dvl+hvAI3FtLSG9Pxtv+VIrmjkINsra0LgaEQuUL
         6KsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179317; x=1790784117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=T+zBcggKi9qqc4/0qowjtpzUsUOnObpQafOkZq0WYdAstLJgYMKta1huLZr1dOMHnM
         2JhbbVGniR1LuRdHupq4WWm9kwbdhmdHSMp+zkF+gIEAImc/8lzAHDnjB2qIJsO3ut0v
         TMH9+P9FNMVWs0/lAuJQ3uXBACuuwgNf2Xw4zudpo8Tij7rANoGMn/NU/ik4P2KzlLaS
         Xx+0aywfPf/ZPnUSVzxPhwpAwupHngq+yMpQLT9maV5naFdwkxwDUXVz2IrowVOBjWwn
         n3MHaPOJRnqZYAHbCzNycvOm2iJSR+Av6X+YF2P/xjg6Iyn5aXzd5OnsRYhYL0LLQ0P2
         i19g==
X-Forwarded-Encrypted: i=1; AKwUvBwBoF+Zd851ZM0n2oeAFNU40D/i1aTmT+HldTZ39LEMapYsLOTya/cIHEYHISfaJbjSdXQ9DNPQboEfpKs=@vger.kernel.org
X-Gm-Message-State: AFuF++mDUji8viC9eab54TqsWogybnCRp6Z3EqxNOFhqo5mJkJiZD1gZ
	1pdViuLbHeT3jmyTW9x5QU260I/8s4wAfve6qRWlU1VpDZ3WoPwQNBAqpm+JQoBuCFSRV3VxXE6
	HkTTtFeGvLw6UYbKANnVFXbHSa5HwhiYXZdOQQtoi+8yVKGIqo+BRSmzVSc65vZi0ENE=
X-Gm-Gg: AYBFou2aQ+1jhxDxLzT9RlPeWoPHJUpkegeLYwYUyV/PPGNp5/Sv+Ne4e1dvPjNQtuk
	IxSAWP8YR3bBSze1HWWba+4yM5NACTUWgMlp1izPKTsQZF6EsnCrpBjhbvd7ULXNF575c1RAVJ2
	iNicIk5sB3z53LhbxFfhGSFOIUCRnDrNEOBkXQ3ZkgIYo+CfnLlamElxAhSIO2SjI+rGnfQsMsc
	gLRgoLKqjibQjEPHp/5Y41EWu/REfJ43Jxh5XfvneKiGoafXRci+adIfibtKjdIAqLhxnVybt9d
	ob+FnClaeuSJgEG0gZIQ8Atqahx8EBMRjhXdYmbrDBzb65qYyOKvGHFl6a57lKKpAZmFHXi+1X4
	ObSXwBKMH+PUYGacItN2trSjSt/iCDjC3VFOr/9MMLGV9J9jdj31cw5sD7kKdAoJeQx5l2bos6Z
	Oo+M2EN6qFwzx6WjfqEbveAR0j2FpR0n7ClOgDXrSkMbvVidIXnDU=
X-Received: by 2002:a05:6122:310a:b0:5c9:a618:bbf7 with SMTP id 71dfb90a1353d-5c9f16c5f3amr3635718e0c.23.1790179283411;
        Wed, 23 Sep 2026 09:01:23 -0700 (PDT)
X-Received: by 2002:a05:6122:310a:b0:5c9:a618:bbf7 with SMTP id 71dfb90a1353d-5c9f16c5f3amr3630868e0c.23.1790179246535;
        Wed, 23 Sep 2026 09:00:46 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde197466sm80739325e9.7.2026.09.23.09.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:00:45 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:00:30 +0200
Subject: [PATCH v9 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-camss-isp-ope-v9-9-86a75dc18b83@oss.qualcomm.com>
References: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
In-Reply-To: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: vyjqOlQMccLLjNR0jvTBKHjKg38v92Gm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX6XxeiHSXWRy9
 ybZNJ0jsKFMlOLGTdl9kuve7oNZVuk7vuCuD5VV9vhO/pLyIsE1EtVh7QtsP18YNP2q/Da5Lw68
 g4ShnjHbrL3DTP2d49jW0e3VMMxKC33z+hFdaNS/ZFvB9Xx9W8cBHrplaxiq0q/fq9ldg2QCFHc
 2qKTt292lzk2npayMKiotwQQRbtxEQAFPgNxjiF07UfBVW2ElUcrc6yt4SgTg8Os0DKynLUEkli
 nnIOq7j2llKxtIKnQme7jbno4cJqc7KJjcyj1SXlpmrTSzEWmx24AnWC7IPVBi1aBki0o88UGP+
 oqBuxu0VPV5HOjcPGkWuQMEWqmFpc3Nyvte8DrzAKjhDjfx/phmNb4j1ieOT8ITLej2AbpfjiDQ
 G82ghuJc7XIvCjij5emHucDCDOoiS23CM9OUjc7jl1vTBIANBguH1FVynzv9tcFNdI0Qc+6Zqs+
 Pb7LMoEPoIgKnB88NPA==
X-Proofpoint-GUID: vyjqOlQMccLLjNR0jvTBKHjKg38v92Gm
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab3f7f6 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX1VQ5clixyDtg
 CoYGmAqlDjgWy9L0EVM6r+LoVDnknVHx9T/QeoxJB68XMah86iZqQ7C4nnce/DDGP4jlgN/rX7e
 fV2HPBP1L6QU46Ys4HmbAES6DxT9eOs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230063

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..604a0d58521dd6a1df8718ea3fce28cc727a08a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

