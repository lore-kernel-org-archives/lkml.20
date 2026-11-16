Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835111;
	b=bf5g4q9LJdhrgkr31iWJjWnPfYTITXw2wDfa/MhWCWmT66BKl4bDnLwA3ZjKBmhqa6DR
	 MSrd3gZ1Xn1d2mcYquKMecrX0LChfAl1/rXOPlmTXMMYe4+NijbUWUPB5mG3TXMdCD0tZ
	 6ptvsNf24xNb/1kr2Fr6X7U967mE2Ueycj6jealBa+9K4qGU7rTFyYCn917YEYlKZxnOq
	 WCruP/8txA8QoE6crwETPUEc2LbbT8ExUG4LGhfYCrk4WZkzTV+medG0BbqUrKCLOlfSe
	 iYPhmWTankYr4hlyKPKOl8O+ntNZ95S/dwXXkchwmxOE4m1yG+dBlH7pkNT0tZm0XJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t2gbUgDpflbrc/m4hWyeER2/DcJMobhjIE5yYWx4KBs=;
	b=bLNQl5toKYR8hNt+zMj3RMozcB2mqV/9ffnnYfKZISYn5eQi/7aNs0tCntVUwkYmU1o9
	 0va3ROEaPEg2SQfOyLgOU5NeLYiD3uxAcBewmzeGQhg4snhL64wsX9tn1WrvXUSvgXSVM
	 L3aV0g66ac4oAvjlspe3vtyz3+/sFFX84vmJavt6AEvDrztDEQ+RLi+gAodABSKHfopG/
	 Vm/1/3z9td3RI35SdzS1hcpCA48bKO32/DRyC5tMF8bYqDORISSHT93lPwRuhwqxoca3A
	 o7wVBE2i9Hm9XHR3IK8OF5VGCP7PHw3YJENQV3TkzTnq9IELRptm2LauTAdp5g7qgNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EPpDFUWO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMsVHxkP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28922606A334
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28922606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EPpDFUWO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMsVHxkP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1ME81004669
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2gbUgDpflbrc/m4hWyeER2/DcJMobhjIE5yYWx4KBs=; b=EPpDFUWOkZ5L4D/K
	1BoTCAv07el9Qc7jt/26GUGF8ENgjQm4+R8ZyEaaSr/8vYF8ZDeaOicnrIYrZijA
	mZxTD3sfs/yujgTaHQQuIdEViZg+c3h7lCJqSFOeYe24TNs75A+Ag8Vzf6PeyReI
	1TS7u2A9ovivRK+q01qw6aTF9/zU48VVUF+K6H0sLqidRhRCoSe6aEpNY1Yo26ed
	oBmaBXmmSrwNB+vDlUpJb1Me9Ch7vzcaAbxhNtMOcBWfhm8q9xJB/sfVhGae62XK
	hp7v75ikoc5Udb5UQWxNXyVp05vfEibNk+euURuqhvI2f/nvrcZn9IX28SvW7lLI
	UOYqxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g0m5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:18:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-947a607ec40so320154685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835109; x=1795439909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2gbUgDpflbrc/m4hWyeER2/DcJMobhjIE5yYWx4KBs=;
        b=aMsVHxkPWNPUoSpLOMAwhp1R1cTmc4RXNDBiIOrKaH32H+bn5RmbX9ND0Iry48a0s9
         kf1voZaggG3oBvPH2WPX/mPBs8KqCJQwG+xS7KYF5IPNZvfOdMtCemL92254XsmhoJIm
         yAehyh19iis+qkkKobzNm/9cdhOwJdaRAl+2aGIjt43Hk2yrmnvJjWSbCSFJCUUEVV7w
         jcjrL1U7Uy/HALuYtFnv2MTnTQsvkw2qUfj/rkcBRAJ0AVsum9tY9wTa2U1TGhml8Nvt
         5rbfaJaCneqb8S+2s0CfB1g+48QjSbFk7jXNrQffoQbvAVwgldwXDn1pBRsI+J1qMvwO
         FAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835109; x=1795439909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2gbUgDpflbrc/m4hWyeER2/DcJMobhjIE5yYWx4KBs=;
        b=vhCucWfHSExqLnEPopw4F++mbG5MzKM/d7Hd0NZNcJlcjUga029rnx9YlrdIj7COZH
         SV8zkXjtNRoCi8JPBTvbA/ztawO6WBV/YxRdNKZd8ahewO6il6RusvV68YyWu6gM6ajT
         P/R0RSYI2z7SyHHWegHFoZZDC5C3GKw0ZOI46lfzsgT25YYRDoRkIK+VxapPYm8g59T5
         PqsT7fsQr+wfCGkZ4zY6ryO8GtNfSs4dww/RqjcCfItjcRr2w5vjhC0LphkQRDoPuPey
         7Z2bJiQj0yo4AAd/MLYyz+qYYEXdS05GQb6rOd5OtKgB9ZyZfGMPS1KFtoN3Gik7JS3P
         DxaA==
X-Forwarded-Encrypted: i=1; AL+hErFcUaRFA7qcYYrdYoY4hSqokw2ZLZOW5PodpasIG8LZrEG7O3Zghcsz5xpWOm4mz6f6vUfD5P5eXWc8hk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FCXU1TP9ibX9njW8sJIn6Po+6Q1D5Cpb/b1QARFLDFSrubzpo
	GWCA/17ZsV8zSk535OlL+8p7l0TFXceoZb6OTCkWqFfNccEgvLnbuFYyjLoiQZJNOEGZR124JAp
	au3XEdeusPSnR6JVuuv/5mftO1ptAwbpEJpM+QkM5Sq4MPOtFMSMv+vjaPNwdVGL3IM4=
X-Gm-Gg: AYBFou0380gDDMP9aX/UomYZ+FafNnR3KrQb8ihwFwyRMhkKt5kuUMy5Q4NYiF2z/aF
	q6SaPUYFpD+SeMsY6gwNlVUjX8U+fFYsGF+QPrFmQK13BuW8XlIKKRfg5ACLJLgzLKpKsXJqFTK
	Cu+IM6HNutuw8VTh0BX0XdJFMKcb453c1b5VIcSAk4jo4a0tGp3aHp8s9ndBZD9T3Rov7p2rtlr
	rimsZ00/8g36SQtcapu0WwzdZv84Vlti0Ds7oomzVs5gaNweMtk9pmz9CPGhToTpkPHSOHZcglU
	HlARERECzgxV41svg2VbaYjr2aV21YXjb1i4RL6lC1AF+uC7Y839xINLm51KqLE3UlVCv2lbteK
	1ndULrTMYqNph1AaHC4VN46yGpX8wGQMqUp4vXwLIb3dD5s0EyjW0uwBE24i1UR2zFIaTYqjdPd
	9b
X-Received: by 2002:a05:620a:688b:b0:93a:2221:5460 with SMTP id af79cd13be357-9494bbe7d6bmr1466805585a.40.1794835109395;
        Mon, 16 Nov 2026 05:18:29 -0800 (PST)
X-Received: by 2002:a05:620a:688b:b0:93a:2221:5460 with SMTP id af79cd13be357-9494bbe7d6bmr1466801585a.40.1794835108814;
        Mon, 16 Nov 2026 05:18:28 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:18:28 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:47 +0530
Subject: [PATCH v3 08/11] drm/msm/dp: Add support for DP controllers on
 Nord
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-nord-drv-dt-v3-8-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=1225;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=XJxZ9JOwZTbboBKfrzjZDalKlNgV2kQ+8L218FILiig=;
 b=O6r8EyI2nMi9A+cCkAFWcnDMztGvOvMYd/RUd8W9f3dPKb4b957WRmfYDKWVO5OVbAESJTXGR
 faA/HpH0XxiBiH4DIZOdzsKAL8xx3dgfsxJjei+Z8ud1SGYMQYl8RGO
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX5srgr5uWS+Lu
 vP6rO2GZETf0+FHeZJlDl7nyfricpnIvNAFH4rl7r0dLj4XMWc/qw3nOkcpMQL6nVuQhl1+/4Wg
 qGrtFX051GvsxSP90WmrbCFxeciQk20IlolFTF0vSzUW49MMIQeHRIzgV9yoWUIKczSBR7uuDmF
 xplITHnnZQMfw4JMDPcDulfs50sD4C1pP5abEbRUSR67dnFLty/NlatxEf3SnfqDCyQuVlY6a48
 MKFrzjbIn6tvju5Hd3EKsNVX0alrFSwUWiP8gj0H+koLjQx7eaf5dye0oute9bzTliq+f99cTHo
 xFcaAiBgmN477eYOGUk8bnKUbNzHTQe2qlGjnGWogjojMTwxbCl02Ln9LOIrhKC69j9j+H2QrJY
 QK5nSxMAjH82bMM4WKxoF3B1+4taeltPzpN6X+OsaIqITDwLW8Kio1e8/1DuTxpnkcLmWPElClO
 Tg8NFVw17DmAkIS7oAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX/kTPWHDYtwDA
 xBjqYtZd9zzWJd53s/fB6RbSertb+9iukReBONMX5sfMmbccmbG0Q6wlce+zKvjp4HwvV5s8pg6
 4XffA+O2mL5WdMQ4F0vLlmD50KickKg=
X-Proofpoint-GUID: 3EH0ntXTJn8PmB75_UfwoSEq5KNzZr6x
X-Proofpoint-ORIG-GUID: 3EH0ntXTJn8PmB75_UfwoSEq5KNzZr6x
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afb02a6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tTS4mT6h1kkz99yYBxkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Nord has two MDSS instances, each with two DP controllers. The IO
start addresses for the first MDSS instance's DP controllers are
already covered by the existing SA8775P descriptor table. Add the
IO start addresses for the second MDSS instance's DP controller.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc646d172abe..8b1b01af11cf 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -108,6 +108,8 @@ static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x08d54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x08d5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{}
 };
 

-- 
2.34.1

