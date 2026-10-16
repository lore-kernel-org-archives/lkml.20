Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871C3446BEA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141829; cv=none; b=rotQXkC26YYjRIFX2HTpoBLuHcEBJo0yUGQJEVGAMm4Fql02HZUoBYTYmQYSESLZbLQ40Dz3Ne+Q18xkOeLJhTs3nrZ2YXXzfjfpSVk33HqD/4T0YEfc2YA5FpkieTl7v9TJHTkeImi6dDnGbY2DQHIz5TDC/41Wt6ZcgMWis4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141829; c=relaxed/simple;
	bh=FknUXR2V50SRgDJQCdH6IzolRKWGlrnF1TNNVowTK5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIKUJ9PSKn5aPyhDZS3uaI4iaKLGJVV14cTOg14GGJead+U7OtXyEEnhGyZ9WGOSZBGPrUhic7Tq2iYVQ2QmkdqU6S5ClTVVk0cFcVWf1rJK1xvVfM6ZcvDjo3gzwrtu13APv75eRq4i+te5rTaMePVYs70VyeNhFehXDPgiwpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mRoFUeIg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4POjRTn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mRoFUeIg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4POjRTn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lJJ7303532
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qdw1IMSJPlaVw9V5/5RUUe24WWrftggVUgg+EtKpg0A=; b=mRoFUeIghvPRrNcW
	M1dseKIVbsc6Zw7kDzvhwk/T6GanfkjAQPcFxTlvBmyc3lXlUWl9DFyn/OwIVrdI
	t0xvlXFxbO0f0Wr8+YQsf2C3miZXKmQvUYPEpEuDX6nEGuLnJcEwmQ4l6bMzvHVO
	VoSY6UUOKqQK99xlofpB9GUFgnIGSMg3RyXWw1QSR6qnI8A8zcADcHmiLLc3wqyo
	QKy5o4RGcKWBwN4h72+sm1xxIiK7b+g77n0O5ZFkKzGHiFTjGg10LuCwDH/6VNlG
	K0nAoUIxzhalXSvBCbZUG/SFZddQGeYs11p/g0NE1ccSIfuDitTw30F3hoYJ+xPw
	mOzvEg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt939j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:10:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5362ce9df1eso1098411cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141827; x=1792746627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qdw1IMSJPlaVw9V5/5RUUe24WWrftggVUgg+EtKpg0A=;
        b=S4POjRTnt0uFhrPPAzKgqqjhBSQY3w3Cp2+R7fkjllzwqyvfkkt/hSlyyHZ9irJEQh
         NtJIrpfcwl12tgasI6d9i9zHqEx+hGRUMf1la56FFDDBPXDIUvQrRXlmQPqZbpWyXgwo
         GXlgbJxSJgnrJcEAE9nuURiJr82wFdp0BqbnpEELWsAAz7Z5rBF6+qTfMyR1wm1P0Unk
         eAGyucQ+D2jg6RztU4muTPKaKu9byaINbIS2G9foVX30AEHudMwBlaJYQQ6KRnVM7Nkm
         zkUqg4cwXBzFwrhkzsxLiDq1FSV14demsvaT+lswkuEgg58fBiKbQAqFF6JxFkJpmNkW
         olSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141827; x=1792746627;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qdw1IMSJPlaVw9V5/5RUUe24WWrftggVUgg+EtKpg0A=;
        b=cP7o+4+W06zDqiZD/tnQx6K1EICrri34DasLbW/Yyb0TUlLW1j30RvddgUWQM5cz7q
         meRSNNWBZ5aFNVDsJcI7E0q2Z/ZREISiRvYZ8nftnY7wb00A3oT9k0gNcVlOHR+gE0VY
         R/6qyHYkdijBb0BGr+ToXeusaU1udd+HQH3wCBUXro1VvxAv15Xnm4fGa/XXSovoJMwA
         ovM1dCiy7bOxrLxnBwrAFx7Exr46O2gIMSWM3BpotLzDqO1Cx1pqGC76/QQqSuI8qfQC
         lq4mDpZjfrQUH5GRbW9qzxFFKupMyBE+NMois/3UEv8QPAEnJsnFFcRpalbtLfkC+Xrn
         Z0VA==
X-Forwarded-Encrypted: i=1; AKwUvBy7kmsgi/CPQFyY28BT0g4lN6qguUcHtpAOsD8xKiv1NxoEJlMV4H/e12wiZYU5QJ8RDSCiq8kN2OWHiAw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzx+tTYHwIFfz1yVeVS8YiCNlhPgg2MgxXO6fFnrEs3dUHdRNf
	k2SUV1EKZGFnx3yMeWWr2GSMgdkg6g2eqtvYpv/R8oURSv6gvKSg+FYNnjikwf7spfjc6SZcuqa
	y47Dkj8MA/+0qzwRKM+OJ6KYbOiU39aLND2GtoD7jQMAEX/FMeDOEeO6+3RsBF9FX7ZY=
X-Gm-Gg: AYBFou0bjySkeI4RN5k6Gu1u/zz+Fo4+i0EEigAHT3CsVGtepEsBByMhfslRYO0277z
	K22Zyq0pRXr0rmkjSNUxZZeAbDeoFHufXgdW0ZWPUwDIMJT67aFU1Yrw04K3aaxC6Bpj3SsIa29
	z3sksiLGYG5/tjp+nlndw9OaZpqsuP9tpuWPAVj2YrmCPqIM4bIx+z/L6YXlDSnrm48GRmVPXW7
	rCR6Sh8rbosPLjjmahWbkRS+RDAqrhkoFNQ79nNU2hyTVOX+gDPlsan5gczHZnBYKtaSMTeMhb+
	OjSKdxGnpJtbzyDn80JSgDW7smuJSdkv43R+035Mdle5/YUjCeA1t24ZIeGIaQv1G/asSPCfx9I
	2rfDgbg3oiqjjGcbOtG7nPA==
X-Received: by 2002:a05:620a:a43:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f211f7e97mr73036285a.5.1792141826669;
        Fri, 16 Oct 2026 02:10:26 -0700 (PDT)
X-Received: by 2002:a05:620a:a43:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f211f7e97mr73032885a.5.1792141826093;
        Fri, 16 Oct 2026 02:10:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c409239b3a1sm52586266b.85.2026.10.16.02.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:10:25 -0700 (PDT)
Message-ID: <3866c346-ddeb-4c9d-9f4d-3e09e3854bbb@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:10:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: kaanapali-mtp: Enable USB
 headset and Type-C accessory mode
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
 <20261015-kaanapali_dp-v2-4-c15cb83d9140@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-kaanapali_dp-v2-4-c15cb83d9140@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX9xlg4FOM5g2G
 tljP3wUYqinqnebGYIWmDYARlLI/7YG1ZaJ/K4JUf9kJFCHRnojcIXdhW6jZJ6fv+vV28fZ4Uzt
 RcqnXCiPOaQ7ELqV2wYJ7YJH1tQorMlTs7xFr5NyZbU2JA0jwfcCD4aLqrPQg+JfBdkfPpLxbRE
 goflFJCM70bMde5GJxr6eIyN2PXIkFpVC0O5davHMohX7Zjxi2+PJa1gHZsvAW9BMJ9ErGmFKEC
 3EqCEIn9cdvGBkaj01MBln+IPu6EEHUUPevXZxaPHtYXXV14vsS2i8iUc7yX7bVCvsmUthEp9OK
 5jodlO6IxPOL+D7P44R4RBD4aNGQWj+UHibmvArPXBXvPPbtftEr7XA8Cv9Ec5A+jGtEa40ozxW
 yaBoMcX53LRl01eo1Z921eh+rnmSink+hWmFuWRP7WXL6SgFdQmhqi5gmz6/x0tm1bKWETN/iHw
 vNkDSqSBvWuFzSwKHdg==
X-Proofpoint-ORIG-GUID: E6u2p99HzL6kpeHPTtHY1FfXrpgh-rJQ
X-Proofpoint-GUID: E6u2p99HzL6kpeHPTtHY1FfXrpgh-rJQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX3pS4mJBTeH8l
 Oq9H+AJVv2t96IUh1xelSlBwRPw85ruMbk5T4TGHjrhk5hGY4/fgFXRxuL5OqO+zZLpJ39AVF7b
 aEumC0m6oqVcOulQx9Fki4nyMWqjbuM=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad1ea03 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ENyogFyUuOtWwiBkGF8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160036

On 10/15/26 11:54 AM, Balaji Kalkonda wrote:
> MTP does not have audio jack connected and relies on USB mux (WCD9395).
> Add necessary nodes for proper audio headset support along with USB
> Type-C accessory mode and orientation.
> 
> Set the I2C bus clock frequency to 100 kHz for the WCD9395 USBSS mux.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
