Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302D5305688
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791941311; cv=none; b=tHfAky+WuUkF/rshryHkP+4qYKPS+mEggCi91S2n9yv26IwBnSbRtstXeuAV49vAiGqL5L0ugudi4fQIYAKgUWKYZyJ+vYUKSs4tMK5LGSw3pqN7h3/DwRGSbEaBiD46F27HKyJlfhkD94n4Jq5vm+4ze3nW/byxMD+P8ajBaR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791941311; c=relaxed/simple;
	bh=EB4FMaSj2Eq4BOT4nid6tbYps7Q08LHkZpWOLznh87w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPfnj5UjmKsSDzZ81e5j4GeIxn+bhje7a2OOXJrzhQSye7NZM0bU8iBQqQSzyasQR0uI4ZMlnRzKTrBAnn4DMH/Q+UKsX65Rxlz5LB89dbIBCqEUoxaBmWUiLd15JXmu8HrbF0dMmEd+jtZhVdEuDbXd1LIDzfD/PEyyha/Bel0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XNWQclOV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFnq7UUd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XNWQclOV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFnq7UUd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DJaE2U2222165
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rgFtdCHlFEmrliTYjBmLINo3
	xN9OuOGBDuGALfW3hI4=; b=XNWQclOVBusiQovhlnn14imiJCnV2m3g8y7uzv2X
	/X70p8bmyAIX5mZzx3ZdJvXSFRRcyEVl1t/LZ2cW906pSgsCefHcw+TeXToaKtAv
	1pIVXMqZVQX1/bGKmgPt+8NVRuMdAnHg2BFpHlciV6/ZMXzCCSijvizCNbpZ+uGE
	Cgj0ae/hkCOI6Jrxbst5enyJDk6otADWmHpf0csA4X+DqckkDZBbZFo8lYMeKEOH
	qVAEmma3csLl3hRLNy13fyLMgJv9/3Trto0S2zoZzwnG0Wo3NbUlcOpkwD/xoV6y
	5WjFEbcFG7P2gD0OkzClZGrMOUcJhDSeH2RlFNN6f8F8NA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txs94fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:28:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso739712985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791941308; x=1792546108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rgFtdCHlFEmrliTYjBmLINo3xN9OuOGBDuGALfW3hI4=;
        b=KFnq7UUdAUjWzYJuaF7S8qwUTCCPtnqmfHbl0/x8yIhsbpDKxJvauEGQTyIdem4JiO
         FlNxBzp5XRUiA5O0gPIaBy+8Nu/7PYotGISxm1fGus70otMgvRldUmlVLeemPpqBitDc
         4UofP+E85vvg7qxhKwVilDsBYEOobRNDwIRSwLbd08WVJY/cthxyTCRAT+dDX0Wf1/sK
         Z5ryYR+YUxmOdDbJVXgQZiij6qW8GDYwZADixqJZKaTl7q8PcQGxMpaeMZKsMzBxe8Ll
         AaciCmWoL/xtSKhFNlmNpzypmSySX5T+hpwjGQkc+Z/A0tm7CAAQVJSfuZdQ2/I6DVfG
         BeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791941308; x=1792546108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgFtdCHlFEmrliTYjBmLINo3xN9OuOGBDuGALfW3hI4=;
        b=il31N7h2IhYAvGmxuKBju5JGpGOR6rKi0mm5Ux4/hmuOJ0fX4G/OqRyvbt8oWcZ4Tt
         lryJlkBAkybaAkfhd4xJLCXM9RMpEOZ5BmqCREWqTeT23LSApOlX+0Ttsdf9d6DhKXgg
         yWh7E+kDUN+2TmAxe3pNbMbxwJ9fkvkZlznXb7J+eFSZaYaRzh+5h8WlnOPTSH23e9Dz
         NoE7C8uhLcDumBv0NKBF6sO2cVtLqJut77QRhifMIsyldslzUtVLFc6XRhPWfbr1p6lY
         RqO07DRZNRGdMUufDrRwgoc2x4gIcreNsI91wADs0dAutUuQWNKtLTxOZL3q3+RRKot8
         yA8w==
X-Forwarded-Encrypted: i=1; AKwUvByDe2UYROzLPDtWSnSDbIfw2NvtUkgu/mkIO7lQVdA1LrhkSh0rVHdUiKm4Vq+ZdVInlDINXHKxcdyxTtQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2k1m9V3gIfCu11BVcXs+4k9icjeG9MgSIEUfoExdfumnhu5K/
	o5MF24u1/RF2JJRMfxASvJ3WHGxpAO3DRd6KTzUcQ9VchA37TRuZyQGijoRPrrkcCIdmSsuUX8U
	EgeclBKj2nHrktCgz0aZ/Mq5b0LVjiWzgxuUoKol5kFGVrFWBpoMQk8bHeUrIvqefEao=
X-Gm-Gg: AYBFou3nWCQ60OGheKkz+0kinwBqP6LugiGv0EYKiDjpS0h1RUOuuAMUVhGAW35mpco
	g4Kk1q6MsSRNyi5PRZE4U07Lgiw2YmHxJDeENWyoNJUNW0efRn8QNuCBmZL2HglvTR32B/aaDOy
	B1hCk31xI8gPuP8TWJw3KNMb9qwO0zg7ajWnSlWRObAR1huO7tRFaFR6l8ZeVqe8+7dtyQDXO6Y
	JkxLJYqXfPPTE559gKBbAHwzqm0EWn1mbtqgBs2RmB+LJ9r2coxCsYsWCZmNTe4CH+4IExU+t7H
	3J5OzMo7akjTKmZZgoasjbWv/OV2FllVHM7wAXKMeVAHSycvX80czxfNI1BrVsGet6Yi2QNrvi7
	sYwm55vhr6TTNVds+uztNEWHQsghjeBjkAwn1PeKzqyqLsC1wM1c9QapJHs1/2cNw2G8T1dLCVR
	Ue4A/n1TVpqeXU
X-Received: by 2002:a05:620a:3187:b0:93e:c12c:9b73 with SMTP id af79cd13be357-93ec12c9f14mr2216298085a.78.1791941308292;
        Tue, 13 Oct 2026 18:28:28 -0700 (PDT)
X-Received: by 2002:a05:620a:3187:b0:93e:c12c:9b73 with SMTP id af79cd13be357-93ec12c9f14mr2216295485a.78.1791941307752;
        Tue, 13 Oct 2026 18:28:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3c9b104sm42828181fa.11.2026.10.13.18.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 18:28:26 -0700 (PDT)
Date: Wed, 14 Oct 2026 04:28:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jasper Korten <jja2000@gmail.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Luca Weiss <luca@lucaweiss.eu>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
Message-ID: <emdm463llmoi6vsv3zmfjddqrfaf2iubdnydsqye2n6ui56oae@frsvj6el3zvq>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAwNSBTYWx0ZWRfXx10o1MlrhKZ/
 0dhaQqdvPy4dqc2RwA7Vg5oK53P3EWAeI/e/L39p5mKH3bmI4Ium51t+rV793n4d+jMDbOZn2ld
 lDDskgGL7ymTag9IuZKQQTS3+xj1NtxEO4poWw9ruLFgAlELjz6wO8IZ4GL6qLZnNf/N9huxHAN
 FuGX95YFU2Uts7d4O4GCyJMmGgt7nC2mLHSyPIRmKE9H2z2XbwV40NIWmuhFMs9Z23S6wU83/id
 FZPVhjBiIAW2Rvo38boU/YEYzsAoYSjK3G9aJMjK0y8XVUeM0GskzK/NEW1eep4ta5aB+8P63VY
 cu3DxZ7W9SEkkfM2m4FI1ULv4kO3OcNe2emtJcZ6mLZ0PaT+fnjcY2/nu3AlEO8HPF+/rbINYOR
 23Ipj2vlp06ubhRJ3CElzAeqmAm5QQ0UQopDxCG6TtWbDjBoe2Wz8rjlurJCVYrXPwId9hYRTEi
 B/hH20Ui98ATApxkALg==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acedabd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=dlmhaOwlAAAA:8 a=6H0WHjuAAAAA:8 a=s7BF4lges1HAnKHfQr0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=y4cfut4LVr_MrANMpYTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAwNSBTYWx0ZWRfX/6xpDyAX9we9
 KZr5ZpssxnC3eGTELfzCi1bTAydXNVJ7XYcE/5kYoBn9GiR4vcONPShjZVdZwqAqwzMZYLg43NB
 ejsBgdjUvfq10tr0Wd5RLEYYlMOJBqs=
X-Proofpoint-ORIG-GUID: pG7XgOWkWTXfU6IHmMrU3oYFU5U3SqhY
X-Proofpoint-GUID: pG7XgOWkWTXfU6IHmMrU3oYFU5U3SqhY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140005

On Tue, Oct 13, 2026 at 12:17:05PM +0200, Luca Weiss wrote:
> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
> > On 10/12/26 8:11 PM, Luca Weiss wrote:
> >> From: Jasper Korten <jja2000@gmail.com>
> >
> > [...]
> >
> >> Signed-off-by: Jasper Korten <jja2000@gmail.com>
> >> Co-developed-by: Federico Amedeo Izzo <federico@izzo.pro>
> >> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
> >> Co-developed-by: Luca Weiss <luca@lucaweiss.eu>
> >> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >
> > Good to see the Lucas are in agreement ;)
> 
> :)
> 
> >
> > [...]
> >
> >> +&usb_1 {
> >> +	dr_mode = "host";
> >
> > Does OTG not "just work"?
> 
> Is this a feature one would want on a laptop? On a phone for sure, but I
> don't quite see the use case for the laptop to be a peripheral? But I
> didn't try it, the USB basic setup was done by Jasper

Why not? It's more or less the same set of usecases: USB gadget device
(which can be a networking gadget, serial, etc).

> 
> >
> > I'm assuming there's no pmic-glink on this device?
> 
> I'm not quite sure yet how the USB stuff works. For sure from
> observation, USB-C only works when stuff was plugged-in at boot time
> (UEFI?), and charger also only supplies any power (but not actually
> charging) when plugged in at boot time.

This means that something is not 100% correct, for example, missing EC
support.

-- 
With best wishes
Dmitry
