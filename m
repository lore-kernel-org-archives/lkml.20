Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8B13C3C14
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886469; cv=none; b=TkociIJk11jiJ6iOPBzOli5lfPcFou9T9aKjRgQiRO7zS877X2ZtA5Z+8vcIh8TAGcRIMtwlf3iFCR0sIPR41XRnu4s9QfGY2FDGxbRjjsTcHlO2gsCtmrjN4tAgF+jnoRRbnrITONyYbFL6TUD6NCoDnWFgtHtBglJ3LX/Afr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886469; c=relaxed/simple;
	bh=HDR9Lb1twM5YBUBpeOyAY7TBRw+6zlrqUpHT7xMWPeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMevMr68EZWKUfuFFmbGGuhp6Rt2NXZhBh6IfJIaqyJvk925XQaotf/JAnWgeevH9y3GwdxFdvlrOjLb+URQ3kBKAk78Tv3Juq99fMxfANEM7cdWxyUQ7qAPAFUDJ2aZHA8CTVJhNRGGi0Tw1BcMdcZP5f3c0gv7LrXooVjnKoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYrOUy3D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=epYQGqKQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYrOUy3D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="epYQGqKQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8LvYs3907375
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RzMSUN4MtsJQfcIEV4XC8uK1MlOC1kFO25lFfA858j0=; b=OYrOUy3DHgJy3496
	CX5zlHuVXIuL0QhmFlwsVv3Ye9GCp95CJILsQhGe21c8vkOjxniG+eoQ7OLn9I09
	RBET2XhiFmRbnercyQtoDA8z1ElUncW4bfv3bUm3Viy77MByKBb3O6J1SzvXsZv4
	qQuKKQiVfKMUqOEXmlA8d4tO96CwRsCqP/inAPO1LdoaKeahYSyXbiAELtX/35u9
	BPN9Ih8nUIjPIFGp2wMq1ieVD4z19OueNv+4I7/eyMBKIjISgqi94Vi+HUkOSTsZ
	E475rxhu3bPEYfTKc1Juz6p8iKKCESThCeZflMX5acpAhzfu8Dh0fEioi+rHpWbR
	Zxl+Yg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqu00n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:14:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e629c7b16so38625085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886466; x=1792491266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RzMSUN4MtsJQfcIEV4XC8uK1MlOC1kFO25lFfA858j0=;
        b=epYQGqKQD+RKHjd+162wdbW+NT1hYg7TNS35pQbvF/GcRDb6aOQbG6rh92JtFp+BDD
         X/1u76nW66wpEC00bmLLBvvwS7zOLrfHJpEvvNhhZ32aN0XRTrehrvs75r1AkhQCBB1e
         zapL43t211WGZq7jkBuE0oRqm15xsbuj9nmNE9HNnwbQZ1YCqzy7Sapof4Up0b0nj12m
         kupmtVlyCwCdATQ2ZUP/VaYQ/uisOt5mqgyti7oeAKjRZMcF62obM4qbssU/JnvqvEtE
         m9otp1LCQQ5wM5OMNQYkOuwz28FxsOCZYLStwdG6eKDIdXlElg8nv8c0x0rmvQmanU/T
         J58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886466; x=1792491266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzMSUN4MtsJQfcIEV4XC8uK1MlOC1kFO25lFfA858j0=;
        b=vSXs0AGKF3UTje+Og2qUd4gol2ekqsfZlPfuRU83E/akXSaq8KX/dJD64hvAZmmJ3h
         5J6nUun5gV8moVNCpEkCtOhWHZrPD4aIdFbSnFALa/o6a1pGtCZEf2AapEVl00KTN9Wc
         vOvGpkYKeKc8735EVNYojOS2b5cVeFYzWfG+qR4JHJ6YpczzeGiyQldFPEvVUllJmlKW
         4SIulLHiT0LEYAy5YrHo7+Q3C12xJjUeDfaSdiHqTdgjpFApli46Oxwzaf9eZXodKwcH
         XBqUdS6/vl1y+NUo7HX5Mwq1pWBaO7yUmrair3gubEORA/DyLDmd1YEghpZLdVLT81m6
         1y7w==
X-Forwarded-Encrypted: i=1; AKwUvBzliGv12dhos5W5t1/DdH+GwfWuuvwyR22xVm7D+OU7RcWR3fLLbgNAXjDWvhr1DQd1RF3QCpCDjRWGEL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9a0g++iQysDZsm0c1/h7SK6fwJf2D5GBFS7sPxTyC8UV0T1wf
	gKFjTcLQtFICZRTHVU9ttCeCJBMfQPX4iP5ylKqBugueALQn7+c+VRNpYm2Acitnd0fPy5kTTYT
	MNwhmHE8rlPO1zco2VO/91aWKR+9eGURp0r7TW3JVE4f7apfF8uKaAyoArcDNNyKrDqU=
X-Gm-Gg: AYBFou26hIqVLvflOoJxfncW9SDrv/nCkPRQ5qcLmWVm3WsUeYG0mUeBGJkti4QV4wG
	fyvEDpGUFYIHC2W7+M1yc8HJPQBmesj070RrK9rLKUQkJ0SuAKVFWyUqFQLGrcbz4F/UpaHCL+M
	/ihdMTKI61wH9RI2GDbh0H+vB20J5x2oYUcZ+Z5CvSVtH270TFwm45MNghQrlj53JlvZ5RS1ZhJ
	W7oUbQPTDjsT/K1a8KyOgqtFRxiy5+sRNTEeg8nGyU+Dsh5ycGKSvRXdRHuw6jssfYodWRPfNlh
	cWNVBL1ROMz54he2bEJJDVm5SALg1qbcDEwbq4lYc6C4RlGf1DgggLyOwPhKteZV/+29pgB05Cv
	SH7o8RtmLa3Ts5lPxbYstuQ==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr2285715885a.5.1791886465789;
        Tue, 13 Oct 2026 03:14:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr2285712085a.5.1791886465258;
        Tue, 13 Oct 2026 03:14:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac924dsm580202266b.70.2026.10.13.03.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:14:24 -0700 (PDT)
Message-ID: <a936a22a-0abe-48df-86f6-a67fbc20b465@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:14:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: Add PWM
 backlight
To: ferreira@se-rg.io, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20261003-medion-sprchrgd-14-backlight-v1-1-e47da56acfa2@se-rg.io>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003-medion-sprchrgd-14-backlight-v1-1-e47da56acfa2@se-rg.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfXxvK9zff26z0j
 aAD9rmGWhvB+m+aO7c0t9JIx2DYNhw1FZRRVJqKCC8YK22AsOlQogB7TmAJ69hSHkrKcHWP8NI6
 mF40JiOLPIYFyUcsbEyM9R1EHqbcIbw0U0yQMlP0EKq+sgI37DXYI4Hs7plVRiMBTtryf+IewX7
 G7Ikfx8A71cZ4PZXoi00V6HHEeu19ZfRdRSglbeZei1RSFz6K0A6bv9SraqWUhrRUXEhgGtYr90
 W0rgdNFZJ8i1narUmh4iQxxHhRUyZ1Nedb/LJ3/73hrlkErkS95eHaNihjegs4UlASp1bOr2koO
 Kmyu9Bkhq8IKbQR8s4TBeHJg4vlppiJtePte7enUqd/9JGuflDrLWpqAnjmOebV7Yqh8zuGhTHE
 2faHHPEf5/g9lDHegEXSjcOAQ08VIzhLVfs5cmIAZ6pw4687uVN2nmseyn9TaWLmOEVcbATQzSb
 XLMb5XhpZhWj2vwst0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX9Tt8qybsK3dG
 GtsooWPo7aASgTuSuuTZDA2ayAZQT2d3gWt8JZD351pAiM7ySvJLMlJsaeOBbv0CsMmR9l/l8w6
 f0/Gj8LcqETHk3DRXjK9vL1sOoVnFjY=
X-Proofpoint-ORIG-GUID: 77YfO0uADHeHwmPif4WmfT7jgHAZCJi3
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace0483 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=dk3OJlvReTGvn84GIeMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 77YfO0uADHeHwmPif4WmfT7jgHAZCJi3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

On 10/3/26 2:00 PM, Sérgio Ferreira via B4 Relay wrote:
> From: Sérgio Ferreira <ferreira@se-rg.io>
> 
> The eDP panel (CSOT MNE007ZA3-2, IPS LCD) cannot have its brightness
> set over eDP AUX. With no backlight phandle on the panel, panel-edp
> falls back to the DP AUX backlight, which registers dp_aux_backlight
> with a maximum brightness of 0, so brightness control has no effect.

[...]

> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pm8550_pwm 3 500000>;
> +		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&edp_bl_pwm>;

Let's also add a pin state config for the enable GPIO (read back from
firmware is fine - I assume it'll be func=normal/power-source=1/
input-disable/output-enable)

Konrad
