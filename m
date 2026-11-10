Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316720;
	b=eU+uVaDSop1UIuTiIeYgOXPUHqy3l9zyUiCZ4MoloS0XK4vHOChQXRMMOuiDn1/d7cEn
	 ndMxCiATW5K9l7i6cxYGMc2dxedoJz4Qdid2x0Q4ID62n6pVyKsAS6FoHDYvobLtl6up7
	 X6xfvlhXNAF7LdrUtAgCB0enkYWJcCNsoVlr+yOmxfm1nTyOHQTXRN96S+LURS5K/8CHW
	 08mrti/BtXt9UR8OLEFxJufbh5cpsOwEvEeExfvBGRihcEV8xmbVnsdL3NUdM9K/rxLp+
	 geQ6V4z2dpMQetoHkunKW9NtvsxyaMjs9iGvwtsjBUoVJ35wM7GoArzJgtjngnoLSEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=x/m8qN0MPpjVIYc6xoOnMVMeEe7+lRfm54ryIioSZqI=;
	b=zuFsCb5kr/XeFAhwRXJ6A0cbnfyYVSJvSdfQvm+melNM7siMfQDqJwU1bnt7721CDI8d
	 /wQi0/CAlhL1OOOb9dYXMupwP4B09AKij6EEkvhnHpNgEi0uRDFpx3cHukD8t4YeNBDRV
	 unBDUmumyB4VREGkSWop/jwC7Svb0zqnTBufik7Cr327gmU/htH7N5esMiCkYMbpUJDWo
	 kbHXn0/VLj30u+HdJCcbnkU7pFFmfbdNukOVRirQxzx3mbasvOiVGUDjXVsN1Uus7nbHP
	 Ng9pw8m+Y4N+6C4lkEebZJKMSOO6uXPPsUtS0Eto/emq+mABwGABxVh5pvs8Xctocvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XTPfigwt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRqAAsPs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A081606B6FD
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A081606B6FD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XTPfigwt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRqAAsPs
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA9Eo2124823
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x/m8qN0MPpjVIYc6xoOnMVMeEe7+lRfm54ryIioSZqI=; b=XTPfigwtgTvljF3i
	86m27RQrIcd+j5CVW8XsaTKNOo52BhyHmfJqrM3rLjEEC7UZBLagA+73oAuX/x2N
	A1o74BHkFVwZPfJM7w54UBMMV2lFDporMuo4nOecBtOkNv3VYLXhnrV8afoUdzzn
	W8Us1XxdQpXwiAOj5nfcJlTYsLU7OlK/QkDzJI2fKrLzdyoDBUvhur2EcsXlaGbP
	A/eH4fAitC++hP5d0tdXiceO457XGdI92TSBYYc+x/9k6qugFXNGNzQ5KpO/He9R
	9PbCkxFwPeRI5+4HnjjaPHOfqFEmXgojcBtA1f8eYrOhR9a4DJccQLqIDNua+Or6
	aB4Asg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkk9jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:18:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91256a7b7b3so31889166d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794316718; x=1794921518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x/m8qN0MPpjVIYc6xoOnMVMeEe7+lRfm54ryIioSZqI=;
        b=JRqAAsPsdx5yoGq5bEodeAg7/13dkNr3QGrCbZZoraPGDDWRXCVg8V4Dt0nLett8VD
         gYX7RhBDNCORBGMwEAsc/SnOM2QSWyys28r2RRjeyOcStMdCprmMnSCAfZGyVPTkHbdi
         vf0S6KDAr6NylZSdTiozxDLa9lNrAoi8jenwAxhMlVm2LJ6KtZ4QQj/QS8f3NPY4YZEv
         MP6JRps9c9GD8VL0VPJRb/BkUxnK/abzIRSA0HRqkKBVVI2qV4HCk2dGl1Ryhl2GSTaI
         EVuG1hYXVV25fJb/x97WckRa8CNLm4w1TySHHWD0kuaV+FHMomkq0leC64Mc+V20BBwl
         tcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316718; x=1794921518;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/m8qN0MPpjVIYc6xoOnMVMeEe7+lRfm54ryIioSZqI=;
        b=RU0tPpMhSB/qgXtockrzUhdcbqWit9bgflvhxDfZc1cDnyiyqAiWQva0vpmyJ02RbG
         Xr9HH4vfuvfeZ9mCHxUWBJLM82NjvGrpUNSV0LDpmgm/mPGW/L1SEZBcaZemA1cr4ktc
         cvJwG1lVE4nx39ew/zN8zr4TtPdbDamxOhdiVG7u6RSFOFO7+9mbxN+aT9lWKbKr5qak
         +HIbNprFJNNqCW0FTYYaetLcyIQD9bucJlQyleAHK4eppdmRX9O95HP2PqkYSfnGNdSo
         /DhbMj/+HS9VvIl3F86aw6I5uXCd9Hw68VCGCoRSanpnvReiBHZMD0xPqHiSkVxyNPH/
         Wu8Q==
X-Forwarded-Encrypted: i=1; AL+hErFsI66h1TaY9V2i4LzPyJ16Yi8Y32Mxci9GazDvamwiKR+5LYHTRrQbVKgvI2d3rqxqU1UTXADFXJzPynE=@vger.kernel.org
X-Gm-Message-State: APuU4Z94l14lbFVgwMDqWKTsrAyWnUbWNZYouc9j/6WH8+PNnJ1xUaUb
	jq1T9+IXQ0jabkwdgAzlFWSiRYSefGbvGS5sTxLthxTCq/4J6ObYfj71LqCu6Jy2aIvcpS25xyy
	cnzpqhc9kSc7HrE5kKldyrF9e80lQVJfJ2cIP/dKFlNJ1aS7A3268vtfnHe2Y36r9XvY=
X-Gm-Gg: AYBFou3FrfdKKrEMdha6RsHetiSI4i/eJ8bxe6tCnRJISivYJPamRTIlaEhpIVa5hYr
	2k2xVELdNohPBk7shFb1O/UwE9Qe4sHV8JUaP5kMiTE07DKmrIbk++K//okalZAf3nR0Oh6chR6
	HKVhLMuQr6hczTt1kgkBKcshxMWKyhiJfd29ysryZSV8FOWqkIdAHoZ+n+1lkYB51CcFBuHpCJy
	Eb11jwIVFpv7TEWECjEW2x+RPcr4x5ma1zePVPB+J7YaaGPYjp35pZa2DJs3EBxXg8sGOUJODIR
	4pMfXof4ObX7qpCO3HKfahDWGx9CX6Hj+pjTOp8s4+nUCWidpdrKOjWX24iUWJ5vng8NNMLu7Kh
	eTX9VM3E+pbM5uNgedOVuJ1Car5R2NZTku1WSzj3d3RufIZiQyn+Ir4NLo5q9NMoI1l5vtsnDOc
	s=
X-Received: by 2002:a05:620a:4152:b0:943:f4a1:7bb9 with SMTP id af79cd13be357-9479f3017e1mr423387785a.18.1794316718544;
        Tue, 10 Nov 2026 05:18:38 -0800 (PST)
X-Received: by 2002:a05:620a:4152:b0:943:f4a1:7bb9 with SMTP id af79cd13be357-9479f3017e1mr423383385a.18.1794316718090;
        Tue, 10 Nov 2026 05:18:38 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835f1772dsm4995698f8f.31.2026.11.10.05.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:18:37 -0800 (PST)
Message-ID: <7f052309-63b1-40d2-a4e4-29421e46d6c7@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:18:34 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: msm8916: Disable disconnected DSI
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan
 <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
 <20261110-display-msm-of-graph-v1-1-0f3106f817b4@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261110-display-msm-of-graph-v1-1-0f3106f817b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HgIxDpLo9a3MtztHskP1Pz_MZYC_tGzp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MiBTYWx0ZWRfX3LlHxBV5GCDm
 9K3JKLBJQPqp1SrMjLkYpmx8LpJanM7dRnDlJOGTT80DVMdr0zqoyHVfM14JeCD0rdpceMerd+n
 nKZkurXxW2rwzD+5sizSUnTMxmkdenk=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af319af cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=udFPpGrmtiWedX3Zxo8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: HgIxDpLo9a3MtztHskP1Pz_MZYC_tGzp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MiBTYWx0ZWRfX+qiTQrEmigOL
 XAvY3ryKzplIpU+X2OoF59ObRYU1Lmm2I9pYEbmeTHbZyPSQG0u5s//qcP7UevTzN8nUSVm7gFr
 +EDvtJNjH5rPJCxvHMU15hJeAxOsuudmolIf5zrOk7L4FDm498AcbdL37IOOP3q81p4OSjycLwz
 ObzbxCL28/3ulVREvTQoJyj70LsI7l+g0FBGN77YKGs+AyuaVxHMeZygv9ueu4vZQ7WtsTUw9/I
 2Jj4PU/eep6n9UaqaYUA+m3D9RVhlkFZ4UH+cC3pRtn3z/cUZtaCa8fJvuNpiYaCw9fzuumjgkt
 rNx0WiFsE6EuXTesLSg4ZCe2rt857GzB4pcgs/16zIBVrP3fM5wlJjlAPoPhYU1EBk5SHWzzx30
 GUmKRbTXZz1ftsdcdwOtiiyNl5DLz0CvK/NqWz+fWIIKQ70ugpWDJUuB9fLsQfqEy58XMa9L75X
 7ezAyLMiir+Ml9bpCmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100052

On 10/11/2026 13:57, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts   | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts     | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts      | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916.dtsi                  | 4 ++++
>  5 files changed, 28 insertions(+)
> 

Valid Sashiko feedback, I missed apq8016.

Best regards,
Krzysztof
