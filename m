Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873536;
	b=x4LZ0VGRN3YriFQ0aSG6Vokawi632jBEr9CHtHNb83vuxjLlJzaUtdmp+DZrviYQ+OQf
	 ZXFKIBK/NOw8v4/WYOHJesMxIsicQaTinStUncDFrhitwxfAh5DIKDoO3ZDQVu3PVyZp1
	 rTF4TbOomWAmH/mof4rKfs4q294J9M8rOoPjiG5Lu3LxvL7ZXbExYqkKsHnwjxNg8MtB5
	 Mx5YHGz80NMCPGGbb0nOfRciHjUfZ27Qi571z93WXRz64zSH7raw2aGRlX01e79coPo4Z
	 NHTnuK4fCE4ux5Hma9QMvwepuKKk1UxstfdJHvmR3Yyb1mZoP6ZwTjXAdg4mWZL51wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0GrnMJRzACYCklZlFDtoRd4bXmLKZhxYbzdI1CXifVA=;
	b=k9KeHctFHK6tXlTJ92ezm0UjvZ3DFiVQJZbaM0eIvskWJUMSFh+A8IB2zsNL+N9hTKTN
	 Hod5SPxdkQTLZ6VqcIlje0dxACHD4Vjb/pBcEWHikDxNH10HaDqyue+l1qDe/xUbKtV+S
	 pX5FmMd4UnRwpA03PiP648bF8hXtLXrFal4cJYoHm1KIIb8yEk4969gX9hD4+wCSAOZUA
	 a87RR2AdvYOHhfAOXrvmnfoQLGC3Q81c9TH0orbOOGyZragnQhVtPSBV4ts6NokgGkg3b
	 DWaS/BAviAlZmRnfGq80umsgmnT7I6HwyDaPNf+xzNEywxmU49ZVdmAD8s/dbnIPUyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7iCT2kR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Dcfl/tLy";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B592606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B592606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7iCT2kR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dcfl/tLy
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OIU26L2287025
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0GrnMJRzACYCklZlFDtoRd4b
	XmLKZhxYbzdI1CXifVA=; b=F7iCT2kRM5ZF41/tHo0p+tbPbqg47B+3st2B/dlB
	CW6wFZQh+eFbke4/gZNevc0uusY5ql7Mgc+7vWSjvREeMAAcYQZz84G1wyahOJGK
	d0ojNS88rrVix8E2fvwnCw/HGGfgO9k36dxXTcYjIJuzEC6NQrEtqmio3EUhT691
	OZ2RTXfZsQ4MXWRGNLxhj4Wll/OLKRvljg4yO5pAjck6C6eiYvlqvPOWQwVVJWtk
	3KfTi/UxB9zX5AeY0sUXI14r+mY7whAulNHdJRmuYKqPyEq8l/VMfDilDO9OfXpm
	XrFnvsvvdCeCjeBJJz/sTH4GTzbWXDxmykTdS8Vl+R83vQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmruhqhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:25:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso444269685a.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873534; x=1793478334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0GrnMJRzACYCklZlFDtoRd4bXmLKZhxYbzdI1CXifVA=;
        b=Dcfl/tLyEiNjZqp/0+XlqUbhaoCkyg2uinLu+FUAPddT4yj7na7s4AF0QAyd4xoTAU
         6HmxgNyHlV7PsSip9ZD8MS9OAfkAGd9w7i7w0EsBpN3Lgjx4is4cXDaL+hgGewtRMh2J
         P9tFoYewMbnYPRAf6UIfsXa7PUJGBEjt9QmmsRnpenNHp+ra1g0o1FtYYOn2nU9ufiw0
         epENCsyJ5hFKCXqzsfWMbadsHAUNRb/EoDIkbN8p6rTRJE3NLAxbkZKPtl8dC9TAPgpm
         I1AMepy2e0Q8bDQxP7zhRNM3A//xjb9b7vT0ZCq7bJOIBV4W/8ybN4oJ9suHdVpa+CZb
         b6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873534; x=1793478334;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GrnMJRzACYCklZlFDtoRd4bXmLKZhxYbzdI1CXifVA=;
        b=vTMEzlEeVJAtq2OEsp8p55qSMcyw9KUCYWCfPbgIkiW4cpNcRvkHVtDs+kQ+6qgeri
         O8QN1mpDIhyx/+qIO/aQ1SPMmDoqUT8XFDTKQV9Lre+qOyu2F1bvULkJVaejPGrZPnEl
         sPcgBzHdjLrMX7cS8KknJBGNgLM7kXBvtROm6b58SJyoVu3GVDoy8NgaMy1B9QpAHniV
         08nfL+chnvoE48umZjX5n82N3BPmDoRF4FaP3tROs/1+14cbMZ7WDdm3reAxXZBG/EFV
         ZsV2KK5w+p8ga1v4TPQm3U8N2Svzm4Q+/LyqpFrOP2BNZ54VQg/kvjTk/MxQXbVKhIrC
         6xgw==
X-Forwarded-Encrypted: i=1; AKwUvBw5bwALFpTcnSL7XHgD0FB1ZxPdCWhSmU0FluRMah5eAd28ExUsA7XW8dZjQK/8W5Kar+Ie9S/WPqEsznU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaKE+JlYSLNv3kGECNR/9f6MZLh+wLLaAIGTPqUT3eQzJKv6FC
	/Sab620VvoGWPv6wGM+i3gTlhgkoHWMF7vPhRDUA3G0P/F9QXZ4YEvoC24SUUWiyYjlxR0LfJk7
	QRZE92UUnWXqglsxAX+Y0dA8HtFW/IITF2KN3Cjf0TexyvLuU9Hdz+8qSLgde6INf1Dk=
X-Gm-Gg: AYBFou1yJW2hv8hGCPtbq8NIhJMUVH4Q7TyJBauYDsat9wtxJ1GD5o3pX4mcFVFT8fb
	kttjVcjZbMSBw8CM7DttQKF85aSuZhw/kl6bCK0AZHKw2k6DBB9CwhGLuHDEErNe2nEHvKgSE8Z
	6DYrt9Glnln8Wo5QTtoiDyY33dyithqZECd+KNoZfNA6qLE6R9y7ZZCyNJSs7eyLKjTm04tnZmf
	c5ZjhVosPUP5xl8Q0S7z6JHoLUymXdbuUkZgQwy2Nk/M+/rsRseGs8jI4cBQX9FH7atYWmQkP1E
	iPJO64zAgXEEn8Hbb+PhDfSHWHZG+z1J5kbBbzBZ3rLZZe1a5xj5gjVIi6+CkeTLgDV3bZrLD+s
	wtwAjZvUayuEuGFb9
X-Received: by 2002:a05:620a:271d:b0:93e:c35b:2332 with SMTP id af79cd13be357-940ef9504b7mr366123385a.73.1792873534275;
        Sat, 24 Oct 2026 13:25:34 -0700 (PDT)
X-Received: by 2002:a05:620a:271d:b0:93e:c35b:2332 with SMTP id af79cd13be357-940ef9504b7mr366121485a.73.1792873533656;
        Sat, 24 Oct 2026 13:25:33 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a06da5fsm50361415e9.3.2026.10.24.13.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:25:33 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:25:31 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sm8550-qrd: add DisplayPort audio
 playback support
Message-ID: <m4nlly2xic2gdicw633adqd5zwouw7qprvaobc5ilvzttaxpqu@dzx3shnwidkk>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-3-8a189c71938c@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-3-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX7VM390GY1tgK
 oMCi7K1DAnH7repbDbiW/ouF3U3tltHphTYLAwn3E8bI0JP34G0rdlQ3rhRF523Mb0Y7QZSCT7R
 SgKF9g2fm+jJIyqDBYh0dNM70mhUryakewDoAKFYwJmqBBEh4WF+cQzzhSQQoDi8/so9YV/9kiw
 r3xOJXa8DIumO69QUu7utXhLv5IwrqcyZ9chjnnVpxCor7lZOPQfS8CSNmdxEWoR/v6S3mPPnbO
 MhCMBlEEyUstOvf8rhd1OFry33G04XMmz/zL2FW8XNwrhRbFE8Gx/nEbo66d6dI05UgF6VEJl9k
 CSt71OW1gWWB6IvTBcvt8lCxiEnlxuJDL55TaP4bdCH8RXNLMj5T++rSGk36OvaHrtUwIfVW73V
 zuO8/7wJ4Cey8bqGlG6/pW/RbtFvMFTSJPCi3ZC8QFjoFm9Md7JWS6nkFo3J+3z281Vd7V0TqhA
 f/J095wHqvASuHT6u/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX3/NERRgc2UZD
 1DS1ir4G3Vum5ZKxwfJQG/RQTzjgvH5/bc0ZUVHQ6jHlGcBIP4xgmJVcMkPl2RP1NC71f5++doa
 6WFJ4ghoSbHd+d2H9jMf1CDhEE60LcA=
X-Proofpoint-ORIG-GUID: 2FctuiJjve4GwmaCk3mI1Vj5NeNFaZXm
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6add143f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2FctuiJjve4GwmaCk3mI1Vj5NeNFaZXm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240081

On 26-10-22 11:36:23, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
