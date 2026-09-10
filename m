Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70997388396
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082256; cv=none; b=VwkxcYKF78YffUDHUB297ETVDUkcSPnhCx/BH2FIh8TKZeJtvOz0NQBVz5BcdeSCc6EEEbZno79mcANAGKW1UFwHIjbAKUhHzZ/DDaKMHj+BI/aiBR2ukfm7/XSSeuDCBXOExYtc5MRB+4NryMB8dx+zCV6CrYiRwUwYWRokJy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082256; c=relaxed/simple;
	bh=3F7NPfQgsBWC+krUrJrikvhpia14WuZ4NzVUTU6mH/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bpANAvj4Q6nZ1FaFokokCJdSRSAQHOGnS8IKGVY4WpHiHcz/e3ob5yR+S/YJeb4pj3qCg632SnE7/H+Nac6mO1dOJh5+dKBXWYfOQnVhU8eyduT442X1qzC/PsJkkLlPijf8tNXXIJQJayVMd2k9MIIhU1U8VWUIdGjCacg0DwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWHk3mT/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CT4RsaD3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWHk3mT/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CT4RsaD3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALTeDY3280024
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k6OvTwdyvHS
	f5U38KS+OQbIGILOhNgbNFvOpojZjEKQ=; b=MWHk3mT/Stt9agPcJufyVA8+JYa
	tKAy12Ez7sb/PCD9YpcpYWxVjnSmoiNdlfMbHW0MnhQfOBoJqhKlqSwFmIEDrw8v
	YtZMsPt8aXXh6HFkHuIWMi+xwz7Mk7AOKzzb7DWBtkasJ0v/VBZMk4AHGvUqDs37
	tC8Je8e3+jC9nRUUdd7uvf8VV3iviU9ybhP50rGh9RNprDTN38udaHQIngzxEJbo
	ZjzPPS36gz4BcFojLduUW1eNflPpI9T0aCgG+UPw07SEV2yx4B4QrWMUxxDgfoI+
	ob+tzXMCg/llKHoWeHy7kF5p+OboEqz+8m323YlQXoEj15c7FwzidTMgkPQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxnva1dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:17:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6df0a1e18so4102105ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082254; x=1789687054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6OvTwdyvHSf5U38KS+OQbIGILOhNgbNFvOpojZjEKQ=;
        b=CT4RsaD3zRN6fjRyQn7FGkSOdq4+hokklMiIi0SeCK8ysYSVJuA0Mh4/ZqyRtHUemW
         vxF2W7sUh+z6BR9kEGaR1kt6tQEp+9/41ptFnqogklqjcZsbKinKe8lJ4n2OvqxfgkP4
         hj71rEN6Y/FfEbWkh0jjJ67n0sWphslLKG2lv3l87lTu0+WzMOoe3kotdgM2qD74wyQX
         NVwiqgn1tJIcd9549a2cLl3vKOwkp+5zKL6jo0eUBuPuxbvwm3GNkDM3Nhxs0a2BheVc
         4f8YXoslhOSX9lm95B27AX2ZtQGRaKKvfkzPaBOfH2f9EpSb5KuEcjs3vurhmtRRmq2L
         oSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082254; x=1789687054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6OvTwdyvHSf5U38KS+OQbIGILOhNgbNFvOpojZjEKQ=;
        b=oa8oMuCuSXki9bDbTrYOaw9iQ3wTRncQC/X5MphHp7xwrDyfb3/X+RNLit43SqegGq
         1M0/e+St7dcIy9HfaJgeRApYIuD9ZaTbuGwXtRnp/ta09U5lO6SIRBzivlXE0oTaMbvB
         ADuAnu3vIIwdk4qfEzqN8NNczksWJiH7OwjMCt1OLOPO4CfGwK58L2A/jVU5IbN2VLDB
         EKONQvT5lj6r80QpNcNxkXN45Q72rN2mX5cn1tBsFtP0gBbZ+HQ+W1mzULQKI+wbp98n
         gWCUw0xAoh//lfMBS1GuwGSNyKgujcicXKkwx4OXs9Bt++WeX2PDMAx9FlKa3f3pyslJ
         4rzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVoXJDhC/pb8miOP+HPRiwNuIANIMv/I0Rw6EhKgnIqAIMs2aqpTKIfx824s4S9kxB8OPLqAbVS9RvALo=@vger.kernel.org
X-Gm-Message-State: AFuF++kUivtjI3u4HPkBk9zl+TqBE8DO4N7m68kb1go26u/j+kuOxo5j
	HMm40E6+b3fY1crrpK+51ID7S//PyZylCrb5fG2hHortSIeMKHZAATC+OQ7DFTOTQvaAaeDabsM
	GMkJzt5niwDtQgXljDEwQD1S8snadKgNm6vej6WwAI+UpHrmTOvFk0ddm6c3XlzOCZIs=
X-Gm-Gg: AYBFou2XtXk63O+5PkgGWRZWIdeR2E8Qc5IqxCI6u/DRI9h1APmBEyoqtlP/Kxp1Daq
	4sQFUuYEzkDLWMMsn4dCh9YlivRfleObtqAjkoA0FGoeFX7/DXzx7SN6U7T1SOFLqNzSDDNbAUB
	KnCuaXiD+5Rd2hurR/+nSS/7sYpEwqIxxLX2IvSxoiTPwlqu9vWMjbBKsIvD8QGP1KAya2GsmUC
	woU0Z6G9dc4jKB+bJ2/7NP7+hmXeSz7n9t36ZSyyCC/THIRJm6tJ2cP0yJ/Ur8UlS5adbUkhYxp
	yK/pcYuG1ahXeZb8PyFlARQq2Wv7l5cDx80/QS8hcwu3zuBhG6/Zk22Moy+Hc/Apa22i80eguVw
	X0lhhYtykUNvUNhGJdwKo0ih7Pjjz4fUT62y0
X-Received: by 2002:a17:903:1508:b0:2d8:d4cc:be62 with SMTP id d9443c01a7336-2dd2a35aa10mr35020015ad.15.1789082254235;
        Thu, 10 Sep 2026 16:17:34 -0700 (PDT)
X-Received: by 2002:a17:903:1508:b0:2d8:d4cc:be62 with SMTP id d9443c01a7336-2dd2a35aa10mr35019515ad.15.1789082253829;
        Thu, 10 Sep 2026 16:17:33 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:17:33 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] arm64: defconfig: Enable Qualcomm PM4125 and WSA885X drivers
Date: Fri, 11 Sep 2026 04:46:42 +0530
Message-Id: <20260910231642.1794948-10-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX4Kl+09kJxwje
 Lx4pqRilSHtP6B2HmM4QHKlpTcnvpCofWy7Ysx+oXzm85DblpwOdT/q6ach5Z9efiUEefCDP0U+
 6kdQgzwEF2X/BrTKDVS5Q9wTuVvwZ/DieGvWTMEZbcvF7F6dRDm4UYQ7DD8RHtnm4d/YwWdQcwo
 3yQxH/eYh7d6a2NeRbOvr7LWWFZtTI2sDEk9HrGWzMgE71SQH2jwsmOhBl2hudV3HGo4MMmMzcD
 Quu9NGUSHFw2HdaOBOVwNomuqx2btAH0dAm9tQrPAAB1lLFxliw3ckbLuFpHTH7mZW2f6FrsNop
 2B2vtgNur9ylQFtOLATXjoO4OeJNuqlsBnYmazdxiadLdZCkWH0cTwT3VkM0/kznUpb8DjvauiV
 OY2CO32yjOaMYYBsx5/sRiGcur9ju2eNlWZXCrHwG02zTPySM41u8Ig8W9T6HskH/ZJ5AyFL0YB
 8eJ8Cy0zpO0lnFyj9LA==
X-Authority-Analysis: v=2.4 cv=RsxQvymK c=1 sm=1 tr=0 ts=6aa33a8e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=rO3wVDe-YCVyVCuK1RsA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: p4BykYlUVVjT8RB6I_ToZnhDfzNMeAO9
X-Proofpoint-ORIG-GUID: p4BykYlUVVjT8RB6I_ToZnhDfzNMeAO9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX4WsDQeiOipm9
 b7Y0KDIEr9A3RBffNMvc6f/0sTgXUc+n+e2SGAwex9ARE51/PzXAxsay214rtA2ClcTqxlyKLZR
 CqN4NnBaFLAreCPOddanY4sbJFtw2D8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100293

Enable the PM4125 and WSA885X I2C codec as modules in
arm64 defconfig.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f0947c8176a1..e8883d1c8b17 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1163,6 +1163,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
@@ -1185,6 +1186,7 @@ CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SOC_WSA883X=m
 CONFIG_SND_SOC_WSA884X=m
+CONFIG_SND_SOC_WSA885X=m
 CONFIG_SND_SOC_NAU8822=m
 CONFIG_SND_SOC_LPASS_WSA_MACRO=m
 CONFIG_SND_SOC_LPASS_VA_MACRO=m
-- 
2.34.1

