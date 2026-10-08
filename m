Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4EA43E088
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493666; cv=none; b=tbtdvumLGbz1ups33nU7gNq7vHzZ+GGVt891J+C3tOYNuVqXoFYeqqmowX+gWwWUayRaTVrIOsWitkiD7p1GlCHqAw/c68r/02IsUupKbOsBEugI7g1K/dOjW5bIxVeZq+TAOb9KDtsWooeKB3ro6qAZT1ttnpLK0/8RzcjDQFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493666; c=relaxed/simple;
	bh=jDPKHpf4eEeWEyqyeomjCQ3Gv77cUfB3xMNeq2DZgQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwESr+VHx7i81HCsuxrcLPjUWA1ZZImyc/jkchp/We3T75SuUpKqdoxrpTgtv4CSqzC6dAYNDcppnhG3eewEQEDFAzy6OoF8M0vADD3At3GIfjw21A5qPNRhEGw3yuhZR6wz+QebusGPunOHjNqsCbQUHRoVgKCuG6bfrchX8AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXY+wF/D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2eHfhDa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXY+wF/D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2eHfhDa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L0L993996530
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 21:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWdjJJ/kiHobdaG6v+Jdrtw5OgD5o7Fqn+e268oN0wk=; b=QXY+wF/DDCNivfYD
	7mPAz9rH+3cWljzvOTvOCUKhgTYqCSzp3ieZe5YNw+86ZpkknXSaOGmYytPGWDKy
	vjzsAtDcDQYvfhVG9Y+wkAN7E0qdMkRGK35DRMOrnozawzwmH7ymnua7MnkS/RbL
	RfkerHBVPTOfC6r24ZmcJq7XiUsI8qNzLBjct4A+brSG3z8wCNyBaPbsNnKNVDTv
	zagUcc/K5c6OnbODN/4aCN7FsH9mAzdpjYUZUhnBcRUe2P2aoxduafcIUrWULHaN
	1X8TIDXKw0gcYc0zvZbaUkk4/V0J0lpV3RxWRBh/28LIceCgnQh40fDgjYKzzhoK
	aKexIQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj1uxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:07:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34ef5fd7934so15282408eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791493664; x=1792098464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWdjJJ/kiHobdaG6v+Jdrtw5OgD5o7Fqn+e268oN0wk=;
        b=f2eHfhDad9dJWetfQPdlwqd4OFfDFUsyg0EsJb+2zWkdu02T+kEyRmcSU/oqBiGSuC
         E5d2JAg7z1HqkKhOPP142xxEho4T2rwfwt3AJffPQeTf0alydBb1Blb9MKpqqO952xyO
         GRNrobfl3qBIqndqIM6qNeT+KWFZndgf/Zk83citE03szbkdyfzdJQBKZy2bvrsoV3od
         O/ljqYmpllZfq6PV4nIcJzEzlR+LfrEOSEuQABpDcMv4DGhw1/Rx0KigqoB9tKcs3b07
         QFzLU3U8+zucNSbPqzQaMHVHNVunrSaK0eivk7ceGvXalcBxzecILVnnzSFGpd8YdZWF
         L4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493664; x=1792098464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWdjJJ/kiHobdaG6v+Jdrtw5OgD5o7Fqn+e268oN0wk=;
        b=SfOjzMGhf6tqCxtlvi50oJo2FLmv3r3+NF7W0VbKARmG505H7Xa34H4wa+deJuVCCN
         TxyErKuMpWVCuQwx2ob9YU8Z0GfwWpBN6zx81jfOGcFF1Tkv70rXCSfp6R244QmJNgVa
         2u1QtVHVk4WDF3b8qER41gDuQSvnI6l2k8zIYkcccmgdmfbjx9/3615cSYQltblhvBYM
         11ZAkzk8f3avPd74o3zz81J60e+IenlMSnldt9jxt/aqN+d9o8eYYkXjo8UOp5YyARql
         gurbL6/9QJcpSdsFlip3EI4eh5zfJ8LDA7W162YI/uy49GK92O73GBDeWt1q6pcAqvJY
         NivQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAXJOfsHfTLd3hTaWrhtXNbIQuNPNkTmcmFjZJHt5Z+k/uusSZagRGY9hSPCV0Cal1eFez2XHUf4E1Ge0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuSesgRZ3A6VL3TuS5+F/W2Y7UPiT4+Y4PmmfXjV1yq4nzVzKa
	p4men5n4CTDGCeGgKEB1tD5EyCZqpXH5AxhjMl5SSGFQ16JnVn19mFaleZW1VTQamGMioUnOvSN
	IG5vtj9dbb6lK0kQj4waYn9bAAFau1eJ5vmHGWJNEJSK0hTsPH81K7MiarLvLPt3BhJM=
X-Gm-Gg: AYBFou2fbqAchpUUwWyYS7W7zHYhYzF897PjQF2cG+7FfFF5XqncRbxZQlQ4WAOCRcv
	8W37HSWqZ/Ajjwfz+yLMjYwcv/Pq54ee3e1tyZXqy7APFtX9ewA0lTlqeSjseNqwGVc1KhnEuKp
	7K1Xvj2F4vNVexYB4alJFJMscmbQU80+kSVw1J1EM6efDWZ2rHjiDmZDIWA1QkL9iq0x7pbg9wb
	hVctsR6ufp8PDuzT1RuZANGlJSK8tghi6lc2/PvUs8Tvh8zaYuHvNSZuxfsZgKmglOffwB/cma3
	TJ4ds6eY83c+4gEmTnhD4+5AhHWI2lBSiQfD+VJA8Pi6KSEiWB0ruF79uGbNQs+Paa9leo7OWeZ
	mbkuF+lOgq6wOOwYzv9s6oko=
X-Received: by 2002:a05:7301:460f:b0:34c:bc38:e2ee with SMTP id 5a478bee46e88-3537e01ea2amr102931eec.8.1791493663723;
        Thu, 08 Oct 2026 14:07:43 -0700 (PDT)
X-Received: by 2002:a05:7301:460f:b0:34c:bc38:e2ee with SMTP id 5a478bee46e88-3537e01ea2amr102908eec.8.1791493663192;
        Thu, 08 Oct 2026 14:07:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm634773eec.17.2026.10.08.14.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:07:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 02:36:39 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: nord-rrd: Enable Adreno 753 GPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-nord-gpu1-v1-5-a06a6c57bde7@oss.qualcomm.com>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
In-Reply-To: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791493618; l=768;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=hOU8TrSd+zHm12j8RPbYrqhepq7ttnj/qRjqmRqUawk=;
 b=IevTAqvF/aAxKWWdXsBJ9C5sJVLEsZZLhXmZdLDXZsg5/UNdxJ1OAbXaq4Jld07pbnowfhYTL
 r0WNdB3ClwACaFIZxqTMlRTcmzFFM959U6yZaFkW97FD7iLo70fks0U
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfXwp/s7EK657Hl
 Hatl6Oe26k4R/5xGPCEY+3t93OTI1ITW7ZNEzoTJgU+TO2I3BKLSlgLJRzC2BmUQmzdWT14zoJs
 UVXH3bX+636evpmYQ8xA4RtWpN3C1he+vHXH+7TqRO/qRbfGmPj7i0HF3tz0h5xXf2o4R9cFToe
 pLjfqDfvSWJ/YehpW5Ois7vUQrRVV34iqskXT+CsgWNC403ltuOv71sM1ZwHI1q7MoM0drVkugR
 FU5P4PMs86YYKEz7yoT0D1Ih3ckLyxnN8evbzYJqrqH/oxPkNsMfIPnXcHhytWvV4QIB29+Z0Q0
 75PPwBQZ0w6X3RxPuwLTQcjgqxhKel4wLTX1nP/W9OaFB1L7GmC+IiA7nikghD+40gMRWODeXUc
 AKfccCC3PayxLeAn0g9QheNnYuQHYIPBLlb6bKM3NJGesISBuHRtT/0GwdgPzAucSk2SztvTkvS
 Bzalu1wT+Lxm4DM791w==
X-Proofpoint-GUID: xSpgx0ajFLLBbzBqW465vGCoUgswaJZ8
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac80620 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: xSpgx0ajFLLBbzBqW465vGCoUgswaJZ8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfX7of+FdyVbb4m
 PiSkNkrAsb1h8We6gJWwZFF4KHfSLhaPiuo1TPc7Bmto55jVa9rOvMD62t1JRsqhklWBXtph3c0
 MMubvsyMkrBgLtXp083ruKn5YCZ9VBU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080084

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Enable the Adreno 753 GPU on the Nord RRD board and provide the
firmware path for its zap shader.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 3673003c8b21..8f215bd04fff 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -364,6 +364,14 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&gpu_0 {
+	status = "okay";
+};
+
+&gpu_0_zap_shader {
+	firmware-name = "qcom/nord/gen71300_zap.mbn";
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 

-- 
2.55.0

