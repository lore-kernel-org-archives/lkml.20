Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918FB41F5E6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425410; cv=none; b=psrwrZTi8xjNLnKo1vpdBd4O1QbwyYV6HCM0IKgPHvy4uzaTTR+5dEOxeHuRMkPWr3BEJXSVWaOLkI3Mh1Js29mfPf7coVe5Lljw8M42oCkjJkwzc9jXTAxSrpV2cbzV98yOKlHZZLwdxz6avcj9Yr7SaUGkAJJxu6DwPVJsmrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425410; c=relaxed/simple;
	bh=w8bpwp5JplGsPMmyl3ZfVaSO5T+S+y2Xy8qZEQhm5mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m8hDiC3OrugY9MIqPi11Tc6IsTBiMwzNOZeiJORR9p0wabvpT10t1HJ80iFMle5RIUE08XNADougTmbRi+KRkOdeZYtX641KBQ5gTjs44ePDdBRsk8tbc0dKQQ05IJAUaMfeq++ytEyowmEM6GhlmVCPvFzsbkrN7HS5flJmTV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0cv/3X0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGD1BUXc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0cv/3X0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGD1BUXc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68382R5A3549486
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 08:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ai92hBBfiGHl+Ml8jGc+xQY8x9IldMLSuh3vIkXnwmo=; b=U0cv/3X0wX4hnYLL
	YkCNlFieViraQLMAJdbfTInhP5YCVRC21a/xQeEy9BkNu8F4vTXHb2tU4iVESRta
	r46lm4MhCzcuB4WdH17gTsXdvyYQqz40Wz5SrpVN2U+aLKqgJdVBA99UqpSsN9ke
	WcbVrFymtA9mIXAx/YXbFeccTaMzhUGHexuTxoNq86k2Z5zTCqEvyv6X4Pud29sf
	DGV/0hhIW297uJU46kg7aUuG2xqf+fMCvVqAQxcGrmt4PR/OkLNWZrOSyDCHZT6V
	q/1ry+ZlJU2fWmsEnCoPCpe//mpJ8sXrpkZooYxAPkLcDuqw20K83/rGL88rMRyB
	UuwgRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m069b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:50:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93102454272so48054685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788425406; x=1789030206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ai92hBBfiGHl+Ml8jGc+xQY8x9IldMLSuh3vIkXnwmo=;
        b=cGD1BUXcinCs1k/8WUEq1Y6tQmQuvg+GiagG5S/at9kgpx+JJUpWWMEXJF1COgjytH
         ODvEjtOPnBG6gtAAOu4q0gjf99OtgSbQ7QCfJZc3SGkwY6UdnYbP6FAdBtvRPVzW8Zmg
         20Hx7X76A0acww22I9f4ekHaxbpEc/a4RjKiYHatL15yY1H/Hlxp1R1otqrIaw6BDRwG
         957slP6XWY+1+cFUg0DwZ0PVT74sVoEMtxQYO8zvnSsFH+MsOyox6osNvfo2bPlX0MQE
         f73vCa4yg2FbUw8TeDWtHx14cxoMny8ieGMq1sZFcseOROlBJ379HO5SRYwk1xZ68dNi
         1hWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425406; x=1789030206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ai92hBBfiGHl+Ml8jGc+xQY8x9IldMLSuh3vIkXnwmo=;
        b=R8y2Pj8PWgyyTSvGn0tZmM1EAGy2+r0UZb8e7Wj2O3g7A/tibSMIb2lrgCmqdx3s3T
         djCbT7IZM+/ZaFsuCRID9V6YO5uy+tKpipk17aJJ8Hhzw4I5fsXePdPfgkEuTFknKuc7
         hIB1FFRFiQT4HVaNt2ifg0JlDCTvgGagOyZGgC/gEZnwLzYVx3CS7Jko1VZcH6/lEUFB
         pHhR7Ngm7w6Hgb35KhPwySZ+IGlegYnSUId/cvcGgTui2/jSop+/dyaOnkRvfh2CDCUq
         U0xBGGOo/K9wyPM+LK6wrjTeXYG+GpcUJPIkF7z1yKDsiPKFHL1phEMBBohV3vgnKZiD
         JFtw==
X-Forwarded-Encrypted: i=1; AKwUvBzERa46Mo11T+cmDcF8NbQ6PZEdo6SlGz9d/aTWtexqlZKCW55OYcNy46LiS+za0h3yaPjww+D4NW1ETNI=@vger.kernel.org
X-Gm-Message-State: AFuF++lEhj9iGowWpzGoGbrkcTIpfyzRnpgVHKcAc2Un7WLCJ307hegR
	f5+vHrmJ3/K3oDphijIL3VY02RoA/LmA8Q6LOqxYdj3D6eJbMbnsBw8daUhV7sTs0WWhY+T2Ihm
	EpN1xyUnhleFYiUuL1nI/E8nyvRQauI9A8kC7PbajbPVyGYZE6epJEmzskXworylOlnA=
X-Gm-Gg: AYBFou33pe+YpMJQgdhySfdYKb9VUThbnnd8xRao5lLQVm5tHCWisFtc4f/SGN38Ndm
	mnhssoBz5RiWwn3Yml4ur0T4vP2ITFwjNgy7v6VhliKpUMgEa18H/SA4ZXV/ERegM4XaR91mJYr
	Sd8XcMxORsZ8fr/vSckFMpViVuWHXsyPv+bYTWbMyMy6W/tyibLzMf+hTOoCMdCCb3jkdDbN+IV
	bOk2dOQhhINIVeD8xtPg6YmrP3dbLJNRn0rGv3JnXFlw05D+kaK3zPfSIfPAwlXhxZQIdkPfwoU
	dABSRFpUrIwdVyLPet2gsRQ4j0HveekhBOQNdg+sN52HkQ1fK02C0jAZuLx2KUGo/mCapXZv12f
	ghtZ5KUWH+vNJ+qPrIycsBg==
X-Received: by 2002:a05:620a:2b46:b0:939:288a:8a30 with SMTP id af79cd13be357-939610cf0bcmr834720385a.6.1788425406581;
        Thu, 03 Sep 2026 01:50:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2b46:b0:939:288a:8a30 with SMTP id af79cd13be357-939610cf0bcmr834689685a.6.1788425401360;
        Thu, 03 Sep 2026 01:50:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f9565bfsm2029048a12.30.2026.09.03.01.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:50:00 -0700 (PDT)
Message-ID: <52c023c0-a61f-4116-851f-ed19de4d23f2@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:49:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: glymur: Add ADC support for Glymur
 CRD
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
 <20260731-pmic5_gen4_adc-v1-6-9c49b2eea6f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-pmic5_gen4_adc-v1-6-9c49b2eea6f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Z0hmPdtbhZESjDSby91HTpdCTNbP0FPi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NSBTYWx0ZWRfX8mNzeriv1Qfm
 M2EAT8F8DDGvd3RbZ/LhJV9mqyDlgrNm0P+XBkNMiuhmYzVgYxndtfDSW0NtMpsKt1Dz9YBX9LI
 N2bQTVxDhLxsWlcPYti2LhhOoyrx9p/MhupsY+mc7HGAUTRezOJqlcrLvwZ3HSdQjicgdp7RpDb
 JmggzWaLfhA+bBoEADX4YWb597keayrPDJaQFtyjrka69Y/mBq0+J7dJGdD8BvCNNt0NRllgdF7
 J1iDNSfomr0h3HETIKbZpmk/55uuZwognotmV0kPova5jz3jiBYTvw2o6uVvpSkob7sZxSzwzeu
 2q1ymxrvQwySVetEfcw//XkfNI38XCfikQfJPlkAFfQxyz6VmsvzOQUvA/kW4drCxBG6ZLkgjaB
 26bApYxOLgTSJ6lfOiKu/b0xp2bLLKARYAlseQVu6dO3gQPPXmwzkYDLzf0LWkGnOoz+NMGjgmK
 EScnlaGpL0H6+LGhu1Q==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a9934bf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=R0Ww1y4TKyaFJa1J-xIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NSBTYWx0ZWRfX+0ScN1Ml2yH4
 x5ye8DG9BuJZx3AG6ME9+rFlGyQUCc/gix7C2HI7C2yORV0g0iZtj6nqqSZbA/LFN76L/8lJq3M
 A8fcDXKiFQJ8BnofDlW/rfYVQOe7d+8=
X-Proofpoint-ORIG-GUID: Z0hmPdtbhZESjDSby91HTpdCTNbP0FPi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030075

On 7/31/26 8:06 PM, Jishnu Prakash wrote:
> Add the ADC channels under the PMK8850 ADC node for the
> other PMICS on the board with ADC peripherals. This includes
> die temperature and VPH power channels per PMIC.

[...]

> +	thermal-zones {
> +		sys-0-thermal {

Please name it xo-therm or something similar to make the connection
more obvious

[...]

> +&pmcx0102_c_e0_temp_alarm {
> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(0, 2)>;
> +	io-channel-names = "thermal";
> +};
> +
> +&pmcx0102_c_e1_temp_alarm {
> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(1, 2)>;
> +	io-channel-names = "thermal";
> +};
> +
> +&pmcx0102_d_e0_temp_alarm {
> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(0, 3)>;
> +	io-channel-names = "thermal";
> +};
> +
> +&pmcx0102_d_e1_temp_alarm {
> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(1, 3)>;
> +	io-channel-names = "thermal";
> +};

Are these going to be always wired up this way on all Glymur boards?

Konrad
