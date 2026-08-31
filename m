Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCE94A262E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194237; cv=none; b=MUosTn06lKNohkrkNCBbmAKvdt550Wgf201bLD2LuhHou1V0AtLxVY22ll5O+jqvGmdtGhpnW0vrPr6rX9SvfzUEMrxwQ0OeX8DuWXJTY7VmEd3FFg5mS7YwGvFhVmgpMhH4wg12OZ7iAU8ZfDHQqNf/z+ixf5VYqfsBiOW5YRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194237; c=relaxed/simple;
	bh=PMsDMFWhEV7pctXWXtEMNGVU2nxw9yeGWELxyBTu8YY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k6OLedVlLYOQ/SPYWdaxIQvy/hTJUohFKgmfBeINWlpTHz/EnSP9XGXXe8jQWCDdAFfCdex5sDPLDki4vci5iL3pb3zMVP8HiTjCQFfEtfj4hR4WVD2m1apIylqiSvf6qFUt8wyDDfxcJ1/mQMAN5EDeTGiIR6nlMUNjkvhG8iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oeLKCJX2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RH+7NRkB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oeLKCJX2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RH+7NRkB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFrQOg3891205
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkOzXmv1woFoeQJtIpxPXxYwsR0W1dreX8GPkYWvKdU=; b=oeLKCJX2IWEAz85m
	uG1dKtptaCjTthoJ04PWVxyhFfstlQhOqXXSQ2qnsXmp9lUiI9Mlp2K77Rh/z0UH
	VnnAV5VTw6xw3Mv2TvhLQsNjAs5y6IvG/LONYJO9IdJw21hiP6sBB1fi+xPuu5fK
	OgmomtYR9ppQQB+x6ZHf/aeyWpQ4LGjItVST8h/N8mPAprzVj8VpBR8KCU6p8Kii
	EeJAneoi0Ux2pqfcC7u40feK3V6Q2kHljRvQX5Zs0dPSXxZCLDVEh/SGBfRe9kU0
	ULBWZ90U0c+BNnp2qfG1JKTPSXB32llp/yXRm5wy8lxTWglAJz/MrIKaoXTC+MSa
	ETs9iQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yasvk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:37:14 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c39b4f3229so91078e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788194233; x=1788799033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkOzXmv1woFoeQJtIpxPXxYwsR0W1dreX8GPkYWvKdU=;
        b=RH+7NRkB7Hgj87n+cgbMizoMIfEu83lw0mslw205E9Duc0vGJIM0w+8jH+Wdu9kkqp
         m3m43Pl/NCQV3E1C6vSnwe6J9e3nVfkY1kPDcYWaGMFCmnPLKO/6qi9RVZ2VQ5BPqJIz
         kDkFAOnDn13Y/tYo/uWFWmN3FNiuYZI7CHUWWoLEktG2Jr2OhL6haLSvgOwLP7stgURR
         Y/YzjCQyBkCs2lKQJ7sUcU2mJCSgibZ/76VP/S43u7ODnzoOHhrWvCWsla2nALc9Lm2X
         DYLcWw9MRfI2FMg3w51eH91Ud3SKhGDKFEWVWTWNYFXJLAHoBqM2XCO87CwTfHhSSqjS
         Zn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788194233; x=1788799033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkOzXmv1woFoeQJtIpxPXxYwsR0W1dreX8GPkYWvKdU=;
        b=rRttpjNXnFxrWeANOe6qFRLV7aN7wKbXYyRbBp5AUHA6cSJ1m9sX4ZyC+ioQql5XaA
         5BVscdAPWrTgHNrYbXMczXast6UQsgkMcnw1IFyQDvfgIQloeOEWAltDARO8ar4CB0NU
         6xpLArIwGp24NK0rNgcmrg+W42kyrvPMDyfz7NBrQtp1HPmsb0jtZSIwfoErhDK6tPyR
         txvovmMy7sY7f6zEmiAo+/ZdorMC4KWn5ugM1Wq1mdY18osEvGcH3F7h3ZdMOpp5HTcs
         h6DOBlZIhdGpNR2UxNBtj4jymeb0Qs/SgzuydpLwM218kUsYnmyWZHT5sZyG/js40wQT
         Ansg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9PbKqoiIEhT33UxeOGfojzcDzswLAXgFYt6T14EPtcMEUI0ZcB9nkbFo1kNjLo2NPHi2275niAg+Q84s=@vger.kernel.org
X-Gm-Message-State: AFuF++m5WL/fz6bSQNJMiXNT+1RT+N/VlewYD0dAFKz1529PMaulH+DE
	+9+nZrlvA+YuDb4U8t7+nFrh53heL7msZKHlRZ1bkabqJRkGpOZxNgeQw5Dxkm+/BctKsgbbZWi
	xgMphR791f6bRZm8h7dPecBVGN7CoNei/gODokcyWO1UMJpemGDopdroWbmzyyUGT+xU=
X-Gm-Gg: AR+sD13kMwPM2Z331Ht/DwRDyt2ZRIhfL0aNXZaUGNKp6v/z/cTGcVz5jYtNkRQUe5n
	HDkCq5I1AqEVOm86tgcabj4iqK0X7zg1aRW2z4ty9WDCHvaA9u7Ek8VIGynkR7ru/tjQlJgKETe
	uPXN+iFPwgYmDPBkbAH/3rrQlJ1SxSvI9YRba/qyKD1lzbuvfnoP6QgxX7g4SJ5J4v1xYdH7mnd
	XDGoSRPVTbjcfbwO26sHjn06Kn24Y2m2AMMHLsNzSQzBt5ugvRqzehLp0nYFbuo8Zz5JxRswnv3
	6TeRyZ5bubbCAbNyHlqFJdCL3DJMC756Jh+xo1lIT5dQtj3ZjKwVJB6RI9cuddp/Aj5NmG0/OmW
	N0npYEMH+j3avYQHUwJZ9QA==
X-Received: by 2002:a05:6122:6b0f:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c68096658emr4135473e0c.0.1788194233605;
        Mon, 31 Aug 2026 09:37:13 -0700 (PDT)
X-Received: by 2002:a05:6122:6b0f:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c68096658emr4135459e0c.0.1788194233165;
        Mon, 31 Aug 2026 09:37:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a0ce53sm2391683e87.59.2026.08.31.09.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:37:12 -0700 (PDT)
Message-ID: <4741e7a7-b6c3-4e5f-af03-d0121dc228a1@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:37:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 04/12] dt-bindings: display/msm: hdmi:
 Correct name of disallowed supplies
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-phy@lists.infradead.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-4-67843277de17@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-4-67843277de17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0MyBTYWx0ZWRfX848S5gBz3gm5
 6DIhdbPUlTYH/4hJsj7MYhgIFNteKDiVRiqWs5MKVZS3dIxZRhIFoIg+nOmVa39UCziSlOTfVQw
 npVmus8z5MrSPdUERUfGGrkUYYRLqTE=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a95adba cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JLRh7K5kIuGMceoZOjoA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0MyBTYWx0ZWRfXxRLODAWK/Hug
 XaLEZEkmkUlrEHn2/C19NwzBKf7PoBRDA/suMcvcOzrzutSDr+qK1Gq62LXz1XsSAs8burLqId9
 l7aF27bCBom5hkT70vak1wdl5/i2NsooA6f9gdIWG5BLPAm+dRtIgfKqZv7lbUfutMrUZFBkjvA
 Q57/L77E3TsbpHfpg2stGofQZAgasNQtgIkkqQIEPVPwgeznnZ64wR/xCqBID3LOX1aOg45PnM1
 0GEFsBkROZnABog9Z6AVXEZmQ2vnPXw7exQybYqbMg3xsVDsxC0vRlp3GPhEWTi2nj9PvVjxORv
 diY6hg1bfiD0znwVL9+91OwVD0yMKtK8XkUqkR6GKtO7LLYCf8LH3l2VwXwzxzc6c21egGIYj8u
 O0UJUVq16YvQqqGP+h7GuE7N3McsGRzkiKuPF0uvV41voVsRvmea4G9hbxmJOpcWO0C4UU+dHPb
 Hv+outVmdSRXmsrmU0A==
X-Proofpoint-ORIG-GUID: -28SkEfy9tkKXCmolyzMMF3CSAQO3Xwk
X-Proofpoint-GUID: -28SkEfy9tkKXCmolyzMMF3CSAQO3Xwk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310143

On 8/28/26 4:05 PM, Krzysztof Kozlowski wrote:
> There are no properties in DTS or Linux drivers called
> "core-vcc-supplies" or "hdmi-mux-supplies", so the binding probably
> wanted "-supply" properties instead.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

FWIW downstream only seems to have the PHY/PLL supplies for 8998
(or VDDIO and VCCA for 96). I don't know if the TX block needs any
power other than the on-SoC power domains

Konrad
