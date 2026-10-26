Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008821;
	b=YKUWx2wihlgT85xcmnpPJBCnkJcDHaBDitQkwjKsOettuWCaHF06v5oK7+TmshWkmGEQ
	 6nA22oWSdaBwaZi6KYV1qBwQTWyiKKasIzY8f2ipuME8iTAqolqU4kIpFX1ZALsonRg+b
	 9eckReJjqwiL14Zb6IREUrzX+tD6kNfG5x+K5Qw1LiLbXKiV23j+74RGFf+l4lpPsHZMe
	 nASlo+ta9zHyKtOPk2TzCEclddiJ+okZAxB/pcHUI9jzIjY9/w6DSuRKfPQEXFajJ8y5D
	 WeYBz/0P9+SzwegR20xx3TFoEwZmcF6AbDtrNvCtASq6h0hf65ZX3vgdTfjcEQthn0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qwsz26b0tZjqhoYLPK/FZwU2WFoITBl0s4nEjxKpcLo=;
	b=akUHUVGrZQExj2f/1xVRwT8grZnQ5qqPhF8uHQstuPh3ldq8aSgdVz1N/sforvhCz5Iw
	 WE1jHGQVrpPlSRC6MFVQDZT0X2G+ADhTCKrphFJo7XiTfLGuH/QaxzzlfqxT7ioeclg/s
	 OPqZDgw6K3f3ppwV5iWlmTwNh9RW8t2kdaYqIHIlILCRUpLmdXqKHOsIskcdT2OWQ1I85
	 /Hp2qo2uilsQ0T+depfGXIWLMk/wf2f2i6PG770kmYU08GLvhvj6RNgNXe3vaB//vBwZy
	 DQsD3Y1JbltVdlQb0g3NCdfv+s+o+gXIZPZN/n4/nfvN0JV6qa8T569+tYf5pBcX9Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jP14w2rA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="itopHW/t";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F01606B47E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F01606B47E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jP14w2rA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=itopHW/t
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4arU53303594
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qwsz26b0tZjqhoYLPK/FZwU2WFoITBl0s4nEjxKpcLo=; b=jP14w2rApGTMbMf6
	l+QzyozzoWyE1HyH1ji7tFA5QK90VUOBhExRB2YXAGIexXP9mlbaebp7txRuz1TZ
	ZywYN9s51uiwKDXUAAiZCukYdSI5Xk6JzHwJSKNuuHaoRGHitl64iqHCfmwcJLhg
	APLqVHkxmFHUhMN3PaiQxmN7ucGmwOYwDxqUIZt2LDyWxYWQtmRxuYVmxwWsVZxA
	gbJKpXXYUimEQVk/e2+8RDn1D2qS38xfDwAKAp0Dsl2LI3Wxz/RF1evukLr4P3tl
	2sfoN5c3bcc9szj1Do3b7BdklkFZG1env3abowSbnJ8BWeoMHeHygEWoL4DWnUGo
	hbRVzQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkmsdw4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:00:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536708d1a3eso11990931cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008819; x=1793613619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwsz26b0tZjqhoYLPK/FZwU2WFoITBl0s4nEjxKpcLo=;
        b=itopHW/tIgtLD54QjqF+F1fhH71t03r1aenaEdt2s8NJKNp8wTwUbVgp2yws3ifuIr
         l9Z9h5DHBJOtf75ZxmRf2SQqjVlQGpC2hMtLbmY0MoVePWJs9AZOMX0+NRc7Ord6Fcjp
         ksTrNgj0jv/palJGOfpbr6i18dQkuzaEr903JoeF1O3oS209/GQrOlCXSgl2yX917GMy
         jflGWcEDF3oLKoWP2e+0N53qUh7/otdy+1yG53TGKccVkG3yNdmSI9VJqYKD9PnDllZi
         0vlHFSkXCMyMKPkFqMVW9uPPutJBgiVqtkf9Zji21GVBeA7OnXRj/FKy/zEqa/NWjQmX
         noxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008819; x=1793613619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwsz26b0tZjqhoYLPK/FZwU2WFoITBl0s4nEjxKpcLo=;
        b=m9Yeka3LjJ6+8d7e4yJiwjWTMy3b0u+ZByL+T4OotERPbusJeOxMnIgQofekseqUK9
         EUsjo7odXvizrDyqpTzJKQTZqpZr3cq0r+Ghubs7XpU//UoKm7kC2v6A2DiY6mTAV6tf
         PnQ/kdn9JWIaMsRHJOHzbFMlBRwdPTQjXWBfTDLopohWe3wyWcAojzt6ePDhREuTP54O
         mih+XOiS2YQykgXijlc1l1ZdE1S48Q/0R/lyg34bE42i1zZv3aLA8Th1HqNMMNryuzl9
         gDlkE2ninDRQ+/0FMKudZH11bKmReg6TiEWt6CKeoHpEq9oTY7m4sM5l+YWIAIp8Vfxr
         bMxQ==
X-Forwarded-Encrypted: i=1; AKwUvBykeDEcNiwFKk6G1ThGEjNkVFUMUSrVqm+GruPC8bjb1Peiu4xPR/5xYKfCycp9kX+3cAe5oRB/oejfPi8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKc25chcg8jzr6apDlJhqpZb0bIJiXcQAzn7BLYpmRGj9ITxGkw
	Ftu9CkaI1NUBPVL2wgf3iQHMhR3ZBIEROc2pmvNK1AQR01CcenuactbyOufXWmdfBSi1QZPAeWV
	idhTPqyqRQS3FKofVe2p4r3bxFRR6/19J+qciHGfRnNwsUeG9NrKIW0pmACDTZqXCxsQ=
X-Gm-Gg: AYBFou3ZZxBU6Ej/7M1UO3VzeJCdor34e9TRmeJ5G8APQPseDs2SVmoAfP7xY5XLo01
	Suo6T0cCO/feEwzV/Smh9TLRaXntCij3/tJhJ0w8c69sf9doh1q3FaIDlHv/3z4XAhsgq27ZCx/
	+oRiTQDhlA/bEz5+ZdTJT+j6zGVOKjU0V814CywQb5eGcWY+kd6K9YgMVHF4YAEh16VDr/1kMff
	KFWvSCbg7HAfK5yptQMqRL65l77t2fKPALQJ0aPxoXnRTdm2RLGJaxq6Wz6eY3sH4/LovOtbNQ3
	bt9Qo1hNRLEiOYD4Q78SBYxPaCEfCiDQ74PgQ+gEypUhOwrgTLTPobtPciFToLAwQuFQeef4Gjt
	Sqxqw9FNEnFP58LztSHs6sQ==
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr907962685a.3.1793008818828;
        Mon, 26 Oct 2026 03:00:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr907957185a.3.1793008818264;
        Mon, 26 Oct 2026 03:00:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm295380766b.81.2026.10.26.03.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:00:17 -0700 (PDT)
Message-ID: <0a36d49a-a1c8-4434-a9c9-36cb1ccfc097@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:00:14 +0100
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
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: Add
 PWM backlight
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
References: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tuv_q5d6b8QZq4tJ93HD_sau0qQ_gY5R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfXxoYBV6hKB5+J
 7vU9kVeJ7CPt6Tju2P02DgwvidDi8a+VD+7IxI02WOxwm31b+jtWifs2FPzS/4GUHt9NSwCpGnJ
 9fDxFK8al0wmf89xnAqZfei7Rmv5C0b5bS2NneHTVj9a3xq3X6RwFTfEEtiPzUzNVhhl2keURB0
 Byo7EnfCL2v/yxE8PQ3wSL433xdWCC9B5LaondMotZVkJ8DsYQ8ao2xm5PP7+AKc7U08Lj7Hu5E
 oVDBwxzDWNp/nMFmOF7czjK3Ry/4aDeg8G2nDumHkJlOlR1zeRujKZnFjBiGtN3/2hVS1fC+1i5
 kR0J1o+58BQsOHMIEucHa3Hs5UUN162SH9a+ObL2WxC9I+HLZDAhiX7TU1NsK4ANXyQumrEcObM
 DCgoABYmhxh6gfdrbdH0mDCudSzDE/LXo6EbkVVYeMIKEcbVvyAfY4DH7uq/FbjnRnO56/ZFIJI
 NsSUsJy5D1zwrpK5i2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX+/k3y1oOq2tE
 8Y3DlKXnYqM4Z3bmsQaaPN/28uixEMl1SlnPHa23BxzZo/Lp8Iynh0BBjYhFf6pL2lgeyJVyB2X
 MhPdiuUPHIdb/DTeDv/XZhTDSmngClE=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6adf24b4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=85Z2xdU_f4vHkJConSkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: tuv_q5d6b8QZq4tJ93HD_sau0qQ_gY5R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260039

On 10/25/26 8:51 AM, Sérgio Ferreira via B4 Relay wrote:
> From: Sérgio Ferreira <ferreira@se-rg.io>
> 
> The eDP panel (CSOT MNE007ZA3-2, IPS LCD) cannot have its brightness
> set over eDP AUX. With no backlight phandle on the panel, panel-edp
> falls back to the DP AUX backlight, which registers dp_aux_backlight
> with a maximum brightness of 0, so brightness control has no effect.
> 
> Brightness is driven by PWM instead. UEFI leaves PM8550 LPG channel 3
> running and the PWM output configured on PM8550 GPIO 8, and drives
> PMC8380_3 GPIO 4 high as the backlight enable:
> 
>   pm8550 gpio8 : out low func1 vin-0 no pull push-pull medium
>   pmc8380_3 gpio4 : out  high normal  vin-1 pull-down push-pull medium
> 
> The panel configuration in the Windows ACPI tables confirmed this.
> (PMIC-controlled PWM, PMIC 1, bank 3, 9-bit, 2 kHz).
> 
> Describe this with a pwm-backlight node: enable pm8550_pwm, add pinctrl
> states for the enable GPIO and for gpio8 func1, and attach the
> backlight to the panel.
> 
> Tested on a Medion SPRCHRGD 14 S1 (X1E78100): brightness control over
> the full range, brightness keys, suspend/resume and restore after
> reboot.
> 
> Assisted-by: LLM
> Signed-off-by: Sérgio Ferreira <ferreira@se-rg.io>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
