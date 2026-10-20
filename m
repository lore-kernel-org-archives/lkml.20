Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504677;
	b=lhh06UDBubtXuDYPN22qu9HVejL4Q4OeKO2S1vgg3pIxD/sf1nghpynmpSptxwY+hveS
	 oVcJ6k9sCrvvHiEEsqsRS/K9E1fBL1fPyhvG7UY0qS71hf+J8u7G3oSA6qHu0D3wjGPSZ
	 /PfPNdFyKlq8eGrjBAjkED4zY73s9/ZD8t+Ten+AKvKmyFjtunhFOMNUfmDBYNUmZ6/HA
	 WGe2lam47HuSU+Sg1MzOkdhZlzBa1zXijcpPikh3wUP1blziZOaNbixzdfVt3V9BSDpB1
	 BbEkvEL99FSFYyFgPRPMzBg+mnMF/Chk6UHK0+oKhA5chXXx+2AqTGRtoNBlT9CMZYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504677;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HRpptwxP00vKcnqPDfRG8atA60JwuaQEIZY7Gn5bGx0=;
	b=31JkDYBH6OPrcIUcqg6k0xYDvBrzYwTQsiyMfNNLdY0jdMXOUzp8XSOuNMChuo/CFdj9
	 bPp7w1EMARKeFiJWgQIkhBM17OqRIo18XcJ7n/4cAZv0sRm/74pfkUraaJuAgMjvx85pB
	 R39CE6C3jrTVeHdntYFkXV+4ZoQ4JshibAEEx5r3vu/Lp7cUn1/CESVOYEPJiGryNlY8r
	 eiUSd+2Ab4WkB/Y3butsyJp2+3z3gqujr47vnf1SfyEoiCLB3ysCrD3FLXPsv9L66qV+x
	 T/JrdVfPJ//LobraEfTn90Rg9hOc3Hb1wsx3UNcGwc4a6XSnxwMVjNZMHUmHH6/n63w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OCqur4cz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fT0F+xNf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2E7606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B2E7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OCqur4cz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fT0F+xNf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA12n1209236
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HRpptwxP00vKcnqPDfRG8atA60JwuaQEIZY7Gn5bGx0=; b=OCqur4cz4ubjmA8w
	+41iJPhJIEgZYmoE3Uy6GJXEMEo85yC73Op892DT/BvvNib/hma0n1shks8GJhRs
	Fqg5l3MoNf8FY/65UqUxvEgeO907Vg1jJ4CsHocBVJyERluZszAipQhSvu9hkVls
	0mSEiG54/UmuQEjYOI4Jtaem/mEU1JQZhoTBpZOUb8l5pN35iVfQwFaftcT368pq
	40F/RCr02Rm28vdR/EYLDcjv+r6+mC8hqaW1aWh9xLVt+42BFMSoU5m5Fk0tlEAH
	6TtcSIQ8PravgzbLTesKuZQgwAIamFbAaD7quKzB2W1gdkwPJ7DmlFbfN2nN+PaE
	Zxgtnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pas8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:57:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so55691785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504675; x=1793109475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRpptwxP00vKcnqPDfRG8atA60JwuaQEIZY7Gn5bGx0=;
        b=fT0F+xNf23pA1+yxowZian5AyWet3pSZS1TXxb1rszdB4bP4dRbhTWzNz2lGivCHNI
         ERzRX8gmFS5FE86mKM+EDoQVsy61Yr7E3Tmm9XTklos0hEDdJMSwailJ0FG2WhB6PtAu
         kicZiZjpIdwhymLSE6I9yAcjQrGJIhrEPsmCbtiTVPG4fBuwfhHf5A4q1PQIZN5HIZZd
         OKa66tihrrlX8xJwAIIhmWqWR9SlJqIE9RFffb4S1d+EuTLTYXpH5RpCB15v58EHxqVf
         JgwQQT2VriiNN8Nwn1paU0ZCo6EtlIRUCAo3w+MLg2WWDokGZU33QjHhD3NVyajB4bWp
         XlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504675; x=1793109475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRpptwxP00vKcnqPDfRG8atA60JwuaQEIZY7Gn5bGx0=;
        b=ec7MUO85lR7dL8kbBZz7JJLnshAxhgX0TfSbIU8rc3ZE8gW24KPmzdY77f5OeLz1YD
         yvYY9G4VerdPCXpGycypVw9vfKnsDdow6wW5U7CUf9cqozdhUULpbpllNzPKmJgCImrz
         k0ieGwpZ+azvXyZy3ZzPEz+MV8JIcZ6t54Mj76vRWGah4wedDxn/+kKo9jRWKbirDxap
         teL2dhhkbZR6U/EMKsPHNE5J0/aQsaYfEyWHETCKJssWLaazEj1jdkusNlAdPfnq92gW
         vyNDnGfmApkarcOPvI7ah1LgTH2swb/fQ6wD1muKTgR7NuwHmt0V4vpjkftmum/GMH/+
         0B9g==
X-Forwarded-Encrypted: i=1; AKwUvBzfHCvPJrHXqqoBInXbQzq4X9VbWJHfgDWm8fU+C1XRgOnr/ieqlfqqt8uzsKaU9VowncWzQRxP+ESeWIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOvMTtBE4gZTXRy2NxQhYNgtwtczQLVW7U3J1U7uDkeGxA9JbD
	VelXrqbN/pJGsyatid6bLBVyDRpgS0lyHb8AENKLPXc9aynDe1w5cenHeX6udFkkEVZMozBYBnm
	3b276W5IPOVFZT2jkjmzsvHE2hYp0YNoAo6awRLPgo+jQ01Y4964XkSjLBTaLc77ShNs=
X-Gm-Gg: AYBFou3Ko+BpXMzskL8Xalneo4Knr0/YGuD0+HOa3oCMY+Nuo1++SGMoTbsRX/YNqfK
	msRFBT/rubODuG1K2utTNHrc9aRU35N5BOcnJJ0MOgK5k0NZMiCp13bSQwq0ZD+V7uJApdZW7+F
	dobdLRhUT1pHzsbO8N6XpriQ4U+gAN+avfEIVZve3VeKvTWMXNf2UKCbIkPoi9FP6dUWIpR9pDj
	DWUuH7ax2SY763YcgirCf0xaguHPTSeBIiJKz3GnS/uhnlZv7WS33AAXbYgEQrXdkaZwYT9xFJ4
	IvFxuJyV3tgXWdsZaR62pOpQh0wxoloNZoQT7kYx74ZJrnBcl9xJQoUkoglQ0KPKKWbyZtI+fLa
	b/bgYe0YTGVMMV4vC2zsqLA==
X-Received: by 2002:a05:620a:701c:b0:939:8148:1e3d with SMTP id af79cd13be357-93f29bbec19mr2022153085a.2.1792504675363;
        Tue, 20 Oct 2026 06:57:55 -0700 (PDT)
X-Received: by 2002:a05:620a:701c:b0:939:8148:1e3d with SMTP id af79cd13be357-93f29bbec19mr2022149085a.2.1792504674838;
        Tue, 20 Oct 2026 06:57:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb1c55sm490932266b.74.2026.10.20.06.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:57:54 -0700 (PDT)
Message-ID: <e4501d93-7781-405d-b7e3-99d21358d707@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:57:52 +0200
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
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add support for Xiaomi 17 Ultra
 phones
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261019-nezha-v4-0-19c1e31eb255@mentallysanemainliners.org>
 <20261019-nezha-v4-2-19c1e31eb255@mentallysanemainliners.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-nezha-v4-2-19c1e31eb255@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VWVtpBuICIVt8Ox0OVkv5uMNtyTuOFTp
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad77364 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7urghiclZBF5WMYhkxgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX5Q6pPyjgv2N0
 dIQotkQzFgzw9dPBgn910RepFpL635JxXLaEb97vR1EX144nBut0Q0ZcFWKXAK88Ka9EcRClPRZ
 9jCzYh1Ivgovibhyc51AB/yGTik4QLYpjfLd+2x/a/oSeNwBQGfB6iaRmIOZJ3MNcHtvjKNO7kI
 FUxkOy79kjl0iXAIdOy28KTk/gifgFm8HdETgmrhk4K2284HgeP7EM9lbVPw65fPbEVNxZx/+MP
 93zRnAKmvAq0tPWIGWhY4dnjQr3kdW6KZtazdgPOgFX9BWrWpCxQfr5l4/wdlhyApHhshn7WOBD
 IAvb4IgXegxlEyvJqaFdckRA1ZGNes1geM31hXEPkRAnhcw260vqUb4lnxyCyPvUiEpFtC63kRg
 J0s4N272b4YW2TfCHIAPQRw+3byG0x5J+rjn0/Nnlw8J6ZJmIid3SwrgQh8+y8y3nmtjQxFX+O1
 kZ27o0N+FGHyUYIe83Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX82IJ5H0vlei3
 AHhXe6vGqBi2k25tOKoJhgVv2WTGRoiZ6tJD0zuEodHdSczasq6YfRvd7gWIlGEWqMKhF+5aM7s
 1mBECC6dg68+CUoTKFO8roHKLP7F2wU=
X-Proofpoint-ORIG-GUID: VWVtpBuICIVt8Ox0OVkv5uMNtyTuOFTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055

On 10/19/26 5:47 PM, Igor Belwon wrote:
> The Xiaomi 17 Ultra device, codenamed 'nezha', is a flagship mobile
> phone released by Xiaomi in 2025 (China)/2026 (EEA). It uses the
> Qualcomm Kaanapali SoC.

Nice!

[...]

> +	reserved-memory {
> +		/*
> +		 * If we do not have this exact region with this exact name
> +		 * present, the bootloader disables the display panel and
> +		 * for some reason it cannot be re-enabled.
> +		 */
> +		splash_region@fc800000 {
> +			reg = <0x0 0xfc800000 0x0 0x2b00000>;
> +			no-map;
> +		};
> +
> +		/delete-node/ pdp@81300000;
> +		pdp_mem: pdp@81200000 {
> +			reg = <0x0 0x81200000 0x0 0x200000>;
> +			no-map;
> +		};

Please check if your firmware automatically carves out
0x81200000-0x812fffff

If not, insetad add a cpucp@81200000 node to the DTSI that's
0x100000-long

Konrad
