Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486582;
	b=f7yd0PQU5vOmELEp4XLspKYwFJreRaD9/+P8LBsWlp4bnuns/qd/JqT9ahd4sluOlUFy
	 HkDF72qGtcVyU9TI9fDPRBDD8LEp8zcfdgoBCndIAnQAwuTmk9/vX7Mv7wqF6SoVBLdwC
	 qPaxJbrrtlo7UbTcJYJxHF4sZDnVrOnOg2P0H2RdAiLFDVH7qFDKB/gdIQNvPLQRaYMZ5
	 f85hV519MNg3Zp8qROQMJ9NP897/vF14vBPGf10ZvndrdTflOJLKV1gockaFwQkehJ5oj
	 pCXw2Ok6nDTHdRHQbWLfgOxKRbMHnBx0y5AxjtcjPMMwr1uWfEL7e5vt1fbHriaxyBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486582;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BvkHiyeYubNkphK+3iSkbkxhjPqzznaVKMsZvin5s6Q=;
	b=aToJRDZKdryU7MtRtaoop9jTYBA/t7FbUllmWtThoCPKhrJYKy8cQp10Po2NjhBKBgyf
	 9u4eQZx+Kv99+lVAYW0R2Wbua1MawX4u0hA19RlIKfjEXZTZqwpci2eGzcSD48r2m6mvF
	 LE91oILkbvILRBw+w8q5Zd7ShagQVABUXCVTFmvyRicf6nnRpwD42Lz6tp6zQ6SaE+LTe
	 JEWQxSJw3rFzBV0uzPnXuiQVJa9NWPjbXBcY8wOydeGGm0/37F2Kg1AOTaTqj1CB4t4Lh
	 aJ6JpW9bDpWy25J1Lor37Fcy07uap9m4RKfRR/t33dOESf+oSRdCHhSAxnehV21PuCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TuebpQC0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXmvX+wn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A2B60A2600
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A2B60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TuebpQC0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXmvX+wn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8eVOY1253890
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvkHiyeYubNkphK+3iSkbkxhjPqzznaVKMsZvin5s6Q=; b=TuebpQC0U0UNIRHD
	1V8mdIu6HgSxSNEgjIATRpxUJPiK5MhPlXTYyCjuZU6XR15wFj5mIVhp1XXm8f0y
	ZX9twAhdIxIPlADfQ3wgu/EsVVaoxQQrL91jYadcqBbFTxxA1qXI/uv+vz8UTb/2
	8wEMXlwL0tMdyVyGHSS//CA5PVCIyzfzxU9N80eU34Z7zJiSANjYY+aZpTqVQeGI
	Oj6Aa6RwqPKGmZGpe2p/GrEhrsJI/0dbCyexSOBkqcKkYAoaG0/ZbMSe77yiuFTT
	VDp6wJ2IYFNyhGSUJfzEhdiBL5itTbWTysEmmRSJWF/yeh+hlIt7PrQr2FKLaeSL
	+mRb/w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n9q6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:56:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b89618384so3972376d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792486580; x=1793091380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BvkHiyeYubNkphK+3iSkbkxhjPqzznaVKMsZvin5s6Q=;
        b=dXmvX+wnTKv0X8+VSWcrlbxSEGDFon0yb8iiXko8kYTefbE8eh5xBfw1/rRFRIDIfm
         YBTjAkAAuk99gcSuAribX/zweewRKH/a1kFELZ1taBX4ZZHsVMdSs0Xg4m+cAY1otPDh
         I9xHMo7mXwiSih7gbfUZ9ugI/IR4fUkTozuZQDVtW9rmBljAdI/3DfzH1yOahYQ5/lPm
         G/fCGkMZX9rJRuYSRxx25xyPxSz8Z7U47C4SkD70OE7P4fcZJtW4pCl+d4lhqWrOWFDy
         EeKc+DU6kbRI/0uflls+dCwTDx/Pi2A8GdJNFlaCg5Ttgwag+xv66vMgnd1JaV1fOfqC
         hZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486580; x=1793091380;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvkHiyeYubNkphK+3iSkbkxhjPqzznaVKMsZvin5s6Q=;
        b=mQet/IC+qYcOGqlGR6pbjASG/cxihjG+c1WkWzPLXLvfJDv/eYMcjF9Nt5KNBOVv/L
         wfmT937tFmIeqz/zHkZw3L5b/cRDM98YOwMjHFfWfKf1UZbw1Gb+l6BSEYMxY7yXc9ZB
         +atmY5qIO9gzizHIyzU2ZsNrryKfzrPw96CAuZSELa3ezSj4ZiPGAjadz5lvPiN74Fnn
         S2Tqcrxu2GKIzrEVZomDIUJ1hriR3a4wjNMkQjIJXR3lMaq6/1bZXKmjWfK5Qg06RyAo
         yPmyhOlJLzwN6172vWDVRkL4bFy7wDPQY7kPsL0bsHwggjfss/X2239A1TpIiLlPqcqj
         eRyg==
X-Forwarded-Encrypted: i=1; AKwUvBykOND+yXdl2IKU/8leAcDPkaDmG1EZCFHS39EhhRs6qfH9n8Y/A/sxD7jDMPzA2HY3SJsqf4fn+CHayHI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJap0GK027m/45UhUDPNbwHuNjvQfsweT/jt/dl2leGhgTJ146n
	2qsKONvto0teeD49eBlqNJkqi9R4EI4xzP2dwRbNE+3zhzGQJTdWTXGiLR1rOa1A4Vso5oYQ3qX
	KlP2WyIyMHcDX4StYTt3iX0Xtw76WPvGMEMbGqzERNt6v085Q++vr3dqpLp1Pku/sECg=
X-Gm-Gg: AYBFou0TKZ/zS4GE31F43eRqPerRQ9BHxNDN6XJHruQ6plkXamDjjZkMLnPZ4XjPe5Y
	p3CVLmS7uJGL31h3PtJpTGrnl23lrIMeQTg4yQ8mBQLwGk9wKLJpd5vv7Pwky/H9ybPxiC04+b+
	M0yHIXOf54JW9zpH5kTOruEMlB+Ulhty3pCnmP4XxADzuSczP2LLkp3GZT0N5sDAk6J3L3+XxGf
	K+u8tiR3N6ueZsnEmCzBlRPyOAGHt146tW4Hbh9UBSiGOirKlmIseDwckjuA8JKMijuKA/A2521
	dgUZuvHOO+23kPpFMWKN6vnL/vOJXl4xXuFiIQoGr1kSPLMl6winLVH85lmdBSpydouZK2JsG8e
	6e1Hs3AycWCjOqUTAfSoSiQ==
X-Received: by 2002:ac8:540c:0:b0:534:f411:a5ab with SMTP id d75a77b69052e-53645ff6457mr128003691cf.4.1792486579634;
        Tue, 20 Oct 2026 01:56:19 -0700 (PDT)
X-Received: by 2002:ac8:540c:0:b0:534:f411:a5ab with SMTP id d75a77b69052e-53645ff6457mr128003561cf.4.1792486579189;
        Tue, 20 Oct 2026 01:56:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32bc33sm462325466b.5.2026.10.20.01.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:56:18 -0700 (PDT)
Message-ID: <0975b38c-381d-47e6-8894-0493e0daf613@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:56:15 +0200
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
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sda660-inforce-ifc6560: fix
 ADV7535 interrupt pin
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
 <20261020-ifc6560-adv-v3-2-5da1a33fdcbd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-ifc6560-adv-v3-2-5da1a33fdcbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: N-Zt6Mdx2cB_qT1PIf0WA1VPv0TzaYie
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX0sRuV5sEDPZS
 wnRNH0rCfhLU5x61yvAwCiP5ahMqs+tPbpjkyc+3Rqr5/DUTW7JEW1iGu0QTGnc+G8ldq17FM2/
 vX7kZFUstkSQobiUS3OfiB8sjEprtGQmGOglH6nf7MHTZ0H7idHJBJMmCySKd+5PdccTWmhHxOw
 pisb7IYy5qx4PsnUoUm0ysvBkAx6BG81f6AynZiPHAacwdKosMewJ8Det0pf8e4MShd1GIasGFH
 1O9CPiyJFjbQu+ph4Bb8yqxq9RT7eMgYtu3lkeMT9Oherf6/YIbbQGLuUzvd4H9STF+ftdfr5mA
 h/MEqduxAWZCy9wFn02dC46RJgjHaNLOKjVJQI5iqmCm37+QwWzzZVVVO5hkBQIljjvnI3lG7lB
 lRjFHe3xCN3U2p0YH8ElO0O/CJYn4SrGcics2EGRXmXti/YBcB5BsCX2MaCRBEeqfX9GdFbEEFA
 lXB4XNhbusY5uBwclKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfXz9RsU+8JYy1b
 MotGsrY7+Oceu+FNF9DiGX3lvHJ2yo9099eeK50RsGifOxeP+BVJiJNAx1kZlCO+y3pw3Em7zjc
 f9lr52zIZ8l7hCiFywujf39wOVz8QzM=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad72cb4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rjRgt0PbdpDDpmAIlJIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: N-Zt6Mdx2cB_qT1PIf0WA1VPv0TzaYie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200035

On 10/20/26 10:44 AM, Dmitry Baryshkov wrote:
> The board never configures the PM660 GPIO11 pad carrying the ADV7535
> interrupt and relies on the state left by the bootloader: an input with
> the internal 10 uA pull-down enabled, working against the pull-up which
> the board has on that open-drain line.
> 
> Add a default pinctrl state switching the pad to a digital input with the
> output buffer and the internal bias disabled, applied by
> pinctrl_bind_pins() before the driver requests the interrupt.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
