Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421602;
	b=Ne7MfwXOxPZhhqSvczd7Kn/GgSVZl/bRSLNnxFEKlpoyADsOdlNeYAMEGcmhwIWkY0HY
	 6h8l/aL4XFWIb1temXlXIESMuxBTlNfRfNnMfjj8XbrhI6Dk44kyfeLAnC6L/kF+LXnal
	 QRxc9nLXp+tK4ynFbvgQkmxqxNZ0NLuIdExrRQEnhT0kODZA830+v3LMST61P/hsaCkQk
	 vEhm8glKTcagPD7G5Uyy6/6an1Xi7M5WETab4ug+h2suSjnkWQMLz8VbFuMYJV76C+8eh
	 /R4qhUdpfkpMF0L/1xo6ZGZn/TcJvh7MHO7ldCM0QVO/uIHzVtlb25vTktLR1hComIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421602;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=;
	b=MCH4WhB1ZClCv9u+RUhL+ptRxsHIqB26F3FlUMV7LhyqQehuPvJtc3gpenzTSrg9v8Ps
	 zNPDeWRHhtkHBAMmiT6OhWxFLkjh23Z9Bw/EIQS55U9zHcrutXuP4a4aTNjJcnn1B8CTy
	 EPDWZc7fVzFrtkH5mQBEKDLsoHZ0iGtgfMlWPhMLvLp/raetQrjM2MuuptNMVlLHt5b2Z
	 ik47FGkD2ga9LEMD5aI+Y/HV4qlmuH1pUjLwnusk85fXKf5In6WqjxgTMX7X00HiZvRNv
	 lMG/S1f7F0fDniWT1EVF0fYMCTkWbZGFl6eKx5aSoHsN1B2ubfNH9NCamQu3ekyTADg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="cXYZb/nZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmOih3o2;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF32606AAE8
	for <linux-kernel.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cXYZb/nZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmOih3o2
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8C74C8481
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421602; cv=none; b=Jmihnshg3agl5HOpbRG1OKIsXjQmp57kGtZfK0z9rwkHVCGaGurYdLqAxu2mNe5NhQJT1A/jdkOo55vJo0Pt3AyhER6E8qf4Fr/OrSFVXyOAEu7ZST+VpaICnfF0aCVcBiN55MVdZ6J+si3WEMaoAQ352Ee2bHWH4JvRAq8OdSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421602; c=relaxed/simple;
	bh=VUJcuiGWrc/VTOU1ddPCEZGdzHccyfbVYcukszE+EZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9480tZxR66ofjIEMA/H5t2joNyM2e3pAapWQsom2Xi/lxgdOr1gWHP8AxR0XkypqK/SPrtzTsHHg7Fz6kRDWwf4k460q3XRpKSWUiHbWSF+NJRNMZ7b7jKR7NHmvR1DoWmE/X/2W+Bzj/EtOIdHrB6DKnmH9f5yvAwyI0IXB5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXYZb/nZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmOih3o2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0T1A2774393
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=; b=cXYZb/nZKZ0bU1h6
	1XNLExxGiATo/yC39BDOred/ABS9YYZHO1ffkSyZ+l6NBFihi0Iyqpfjrd/o4ukv
	l9NZGKcGfgemARpS0sBG0RSt/fiH93EBBbHgu0i5HTF1k+4zhEIh823EfZvSL98r
	vEHbp3rpO+JIyykJ7xNI94k1tfmDCV6THP9EqkzNR1KWiwN6VBNuc/AiAtjLy4gJ
	2VXpD5PI+f2pD0JcUR3mCHACkmj6y5if5C0AccwZAQjpYUsQ+c75QjP98ex+2059
	ylZoB4Lg214OTqW0gsodXtUQ/dQOBcAYcJ9LaO/8sX5TKMp0bzo7hPRj4wlgqexv
	ZjzYEg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur3be8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:53:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f1f2ecfso75451985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421598; x=1793026398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=;
        b=gmOih3o2PLdm/Uq+N7qG5bWkoV6Vs9V0M5Uuo8jqwAYAUglDOH8A2E53ZcBua/Joaq
         TKgd74IeGWH7s8+tPZCaSc85m9M45RtCcuOFZoprDblGeIw/tWp7SJ67uoUDjAG9lUxb
         sWecb/snIon9tikOEY3vBXL691Xlgy8q0FCIzvDS2HVYX++ksRj9W2myxJNIlH4vdv14
         UrJk8RAiHr1C7k2bA/4wgXG+Xv1jTfgV4NNLwm/4gK5lbzNQCvtbpR9W9NZCB/jElV9A
         PPiqAmT89uZBQJRjgXV/f56B+rtrlTPWD3oPM9GKS1H1sl0eutJSftcYMEfvROScQSSw
         +wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421598; x=1793026398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=;
        b=t/Ij2oDye+gs3Pfwcd2uD3AuyzsnuHC9qWUN8+ITUbEZgy9TdoaDlwBl3lV0QlA1d1
         NbKqB9RLKoQlzX8EtvEJGqAeZy2xceTbfR6aMHk0QK9gENCx6xrnUWRgDGXNW30GMJ9F
         b2FQ67igQ4QRSRwAs7rk2pifC9A/sG1WWzmECPLag5hSh0yo/zBguNdE61fEIWFzhUn1
         y02sdg15fustaTJ05Pe7Oh88Gn85zsuf+Vd0/Dk+QAqMykSlsGFeGqPw/Kjan1UMlsXm
         P3EiSF9WDp6dDa9mQyjMPCZ/ZFhsW7yYNW7QvuyO4IkOWqtEJ7+e0JTikNh62xMfGEuJ
         dEgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUSAAVagnqbR6uVA3IhUNu3HL/wxwv2jD1IoEcsEjfnV1dbGzEFzvm3r753ATvXIaByjU6jm0dVZyPdfM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ31CxOMfDavNO2obCYti6W/cx//vlEM6tu2kOzdx8sz/gF0xag
	KvYqHxOD5nV2bX2ySF+wJZSQLJqXOPQcPLhV5ivxQVppneME+d+8x8/TboPKK1ExSt7LmC3dulC
	fJRGyaVDz+0Ivi9nEuSz7k2O9KE33Kj4doZmqcFkKNDAWYqh1t+UvqZbjZECaO93/8Lw=
X-Gm-Gg: AYBFou035q6dMh4cIvUWiP1h3gWhldmaWJxthyUnb4S5G+jXAc1HELlc6sb3wrNto5p
	cGsQN0l0H35Fc/MgMfch6127sNnvkjXR8Gm0DECYPTwhF4DxIqlWP6i31v2l9dJACCvfikoQ4ip
	oZ5aLVtP+W0+o+W8lfp+OO2z2hjy26s85cn7OGdggJULCPNvXSIXAuMwq7/+W14y8cHg5zeVacS
	LgJBJeuUmZbzW5Zk0z8vOSkyBm1WsUfSBlWl17ZkqhuTMzJxBDxZGOXuCPDe0z4cWKymT4D44jI
	3b2rqNMMRozDPdAbu0eQWHm2IVAZAQMtzu92y6GLj93AOXb60nfCcsNAan7Pwrp4eYWhwqLvLcr
	8i24wt5C5cePcMJ01QeilUA==
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1480030385a.4.1792421597817;
        Mon, 19 Oct 2026 07:53:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1480025385a.4.1792421597304;
        Mon, 19 Oct 2026 07:53:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:16 -0700 (PDT)
Message-ID: <78fcb970-250a-4852-b514-8d3eabe535c0@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:14 +0200
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
Subject: Re: [PATCH v4 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-8-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-8-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXxRysW3e9Jyy9
 lo27OuV7JfrN089cvFfLz2ptFrUSk4x/J2eTv7r99Q+HctR0NvriRSmr8RNuDglHlV8vk2Be/7s
 wsZBkZIVpj3lfrcy2Bt4B4cyGSh5d7I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXzEA6I1gTY55w
 JoGVHILuCIa03jPvJVQe15y6pT4+tWf1VEy5YI8ZCEdki87HMiPW3pIiXGtUQkQARVxzy/vpvlU
 CHP25XzZbXuqBRDdG22047xcsGi2y9pEdkjcWfl/CTi8o3x+NjcNIl8ZNSHvvCdYxaTd3pIqzHL
 nv4joGFc/Bc2QPlqe7jdTzPk08z4xBEW/9GjqzCvFacVJ5WN7A3XCHuCCuwAQZLC4q4xhT8K6q+
 KoeAagsx1obuPPP1I/0TLGIvojlAAiUFHO+0OQy4/2UERqGbrjP8T7RNHQnt93zhqNxcsWBJ4SM
 QjnK6uxidBTkcy2ZarLCTnx6y2XpqTfiUlClIdhCP0/v6vAAGHQAfIZoAX0pfqs4vMiHVLLy0/J
 Nwz1KWlRwbddtb7T3AwiETKYKucs0bSBtkx4yX1jsDYNGFre1hXtGzY4/4n0DWqD1oCHPIV3sAL
 ihboabhRYe0ANuA/Jiw==
X-Proofpoint-ORIG-GUID: Okkgcw8PBh-lzSOlbWr7EzeFsOM_bvqu
X-Proofpoint-GUID: Okkgcw8PBh-lzSOlbWr7EzeFsOM_bvqu
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad62ede cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=X6Y4kDKz15hUnpVYhMEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8550
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
