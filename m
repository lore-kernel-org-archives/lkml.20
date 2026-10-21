Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591605;
	b=kwAKeEWjH7IgRKuH6Ihy2ARbQGHkwHS500yuwcfVrT85i8Ru3hBvug/2RyUe1oCmHlOu
	 2bkg7HHLn/lg6EbwJtHSykvmOYU0DYp6Fdwho8ot62NO9So2cDh0c+52beTT3lmIt6Or1
	 cR5+gIw0GoVuuvUnLoz9pzPLFwUK0HeeCj0iUyMPi/+VwpLwCjUqdZPg+2ed1/YZrRnNf
	 Kx6piBVek+ldfKdgOyOOknjp3EWafJQrHRrL3CLs7kpURLhZAvLhaE6gwsOOyzZRFegTq
	 27Judm8+nDsz34Ul2Z1ceApP0PP2A+K6Saq0XTpFPZUi2zo8dqvxrJnMUC1HdyIh4dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591605;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cER6PZfE63ZfwyWNRlY05y67PyxrF7hthCCcku5wocM=;
	b=Ps/X7mOqKH11kXc2tc46Vo17PjkOTRn65FlIeXHUftjt1KjqttNLX3/SZ7Dcir9t4cfw
	 UatzjcqiFl56gB67sQiJTTi7pVKfS36McFKlPCscUMgNiL6QUs6RxnveIPaHu99688KA7
	 VRNRZiwtDjef6EL8RETmhkD5Zja3h/DrKuw/rZtZ/uQb64ch7GcuS8pQQjbv2rjfySspq
	 yjBrpXRJ6w+wsbuD7S7ZFR2iWXk5HpuLu/d2flbvj996nkA6Zj/yAI5fpaak6dAxQTGrQ
	 HRPzghtx8FOM9VnMw+N1sUQAqm0T3LSQQuV8O9p/75VRxI5qyEwkKpybdJUeFG4f68Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Adlyp3EL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UzWpeguv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FAC606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2FAC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Adlyp3EL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UzWpeguv
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg86M977423
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cER6PZfE63ZfwyWNRlY05y67PyxrF7hthCCcku5wocM=; b=Adlyp3ELYkFxysWG
	3RVFTj5LBb8w4ZBV7I2s2yUeBtlczF6YuA0iNy87MMGeGqalnyv/IbYCWMB1vmkl
	Z/eLhtrOTtq5oMOBsTiCOfUwObu4cU7SerYsgb07VQC2w3JpOHqpgXR0y97LLHrI
	3cgKS2PwO/OHcIUnd2H7WPGsTagh02hD5bID4/pM2VhqhFAt1e6QTlXRCWP4q016
	KXZ4Z5jfBgXQh1rFW9xTPwyvtH8BIPGWmufEetif451xR5ax5d/h2+4ObDTmWSXH
	DxPbQT0K0Y44R9oXurNEkhbmqOk64/2IgtmPp3gKb26SfA9Y21eObX9B8TYy4MSW
	K9zmBw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs03gku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:06:43 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988c723394dso19521241.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591603; x=1793196403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cER6PZfE63ZfwyWNRlY05y67PyxrF7hthCCcku5wocM=;
        b=UzWpeguv6FsfUh/0TnDvYebH1kzVmkID1zsEbawjqwJSvpcF+5h1dqSZmgKGfyOG7M
         j4mLmxhvDhxihQFfDcWFx7uWhluE/wxYQqWkTAdL7FbhRHw0s57vE/tZ7oiJDXRsyhop
         auichGK+GCAPCnEclqCip8gdpt+I4mar7UVxL83olscf3Oezn24S0oMyopQD1AGU6o3M
         ef3yS362X88I9Z/S3ieTnwBikKlz5cKbu0g2ufAbJH73vIRmJdHgPCROO+E5kLD10Non
         P3nq5BAOG5J0zZbE/a5xuTLc3j4Y44HuxcerJVn8DQOaO3fAdNWyEGloaQ7oYgUB2z75
         WZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591603; x=1793196403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cER6PZfE63ZfwyWNRlY05y67PyxrF7hthCCcku5wocM=;
        b=H4IFH2MADnhegbb2MTvZ+tssvairEfYwuldJ/zsNJz+EAVYchf93NIAly3Zt46TsDE
         lgFPM/6/6bL/8Cjkan4CjK2un6oUF50gJHHPJE2ZSRRB48i75ahdlf/KkKGz0uQJEYBt
         HKhEygfGC2VPE7EHc8k5QvSHZaRjFQmMSs7eVDRQyad/xMzaoJmaFYU1SW1iRDO/4RQg
         wEQ6RzM6A84RVJU1ec2I/u+HSeR3RiDY3U3k6ECgD1c2ZLKrGcGTsWlxQLP1W29LinwK
         AqAEIAjQ6mi7H7bl1izJJJLlouX0MGJRpV67qowF3dhMQ9/7JT4KPmGkZaWxGc/cmeTA
         jtsw==
X-Forwarded-Encrypted: i=1; AKwUvBwrvh5a9iWRSGaRA93jNZAu8KNE8xJpMUADSZh9tQ6DCfMiHkuX5Pt+byUrLvQYpdyNbsYehqU/RiNmpPQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXSqjrFSCabRzO9K2FUOnhEpkAAtyOCblGLmRH0t3qRLSlmWeZ
	471Q52O10JWs7m5EN1TdhuL2TD4YMut6orc5wj8HrSygm83M/X7KAoyl/4BhuvR0bw+idHrD0lS
	LPVwvcc3rF/fvvrxvYtNngmB//dc9whzI7bFJCf1XxKZNf9x2j65aRD2CSJiAIVl1efSY56YcvT
	OPdmeA
X-Gm-Gg: AYBFou0SWFvSWvNuECBCfvI2AWp03YhLHffQhsFGvK+wRRzHtxSllb42KhBLr+Ogs73
	2RIOUyzhAGrmqyYqk45CoCiN9/ZIgASOF8cHjMpHbbuZUIiEuisc415i5Hs/QkxhG10omvjxORj
	UEZ0LRIrZUlZZBKOnGokGy2dWquIWoTmp6EQN19cmH2BG6x19uD55gmzMeYgq6+LUcWlKkW7FGn
	i9P1Oeec75X6vtH6JC+vrBw+NxhdDJIHZnEMKeAqjJz2QlPYD5e9aIIJXg0STq1BjaNMWspVPRm
	4bqN3mbfvnosf8BWHEW9/uq13oGQ3Ml+rDtCu+mLGoEIyuQll5yZCTKKQkVAxmq7zA2JADy3Uds
	zrWxVjYr7dgrUBmp5yiOFvg==
X-Received: by 2002:a05:6102:2d0d:b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7cc9244d5f4mr680886137.1.1792591602788;
        Wed, 21 Oct 2026 07:06:42 -0700 (PDT)
X-Received: by 2002:a05:6102:2d0d:b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7cc9244d5f4mr680854137.1.1792591602276;
        Wed, 21 Oct 2026 07:06:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59ac2csm7665066b.51.2026.10.21.07.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:06:41 -0700 (PDT)
Message-ID: <5d3de423-e5e0-41b6-be5e-c1a46e53d570@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:06:39 +0200
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur-crd: Describe the PCIe M.2
 Key B connector
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
 <20261021-pcie6_fix-v1-3-ad37134c35a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-pcie6_fix-v1-3-ad37134c35a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8c6f3 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=WydMKwGuG-e24Vm_Hi4A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfX2/jfzGZKN3pE
 F4AHEiDnNhgsds/Dv8icasiFsSzq8eLAMv+YCazWCk+LVW56dzNEu2Tiv2/MAlhsh97rCmNv5kC
 AxUTZo+OJjYks4Tplv+JaCI/gy+y+93OUE28sVW/nAza+Q8yQsZpjs8JBdLsk1R3cVJMIGxXjyn
 AKKHsKfpB4DU9lMbIOBhtflCCOGxvZkZCAC6XtSy4Ku9BHrF3iMimXiDoHG1lQggicqPHpNgsb6
 WQCAZiyeZchDVXJqXI6yLUBzr/pfEpl+itBeWfeCKChyLb+1y55mqzRE5mshC3GOEwvt/Sw6rxE
 bKKqDN2zJria8gn4Nvs6cmBQvFwgxTeWGZI255qibRWZPntwSl1pY8uCjJlQuTvSahAIheJc/BJ
 FDGjOnULNAd2oF1VQZWr3K7pRLiC8UXS/cFqd2imObRI9XaKq1DpFaIJhkparxV5hBySjlW1Y7a
 ti/jbtNP978OvGbrkzA==
X-Proofpoint-ORIG-GUID: TSnPtZpZqSZKJ1hGxmtpZd_nZi91T2fZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfX8R5vIYMXPyxh
 ip77cEfJhHQ2f1YbhXtq8ONrJlwCuYFGIUDeBAUMeBF5jLbCnKTf5JamhXww2rD2nJXVunu+Oms
 zAUnQ3ke80vo+Zeu4UJAJC6TL3BZi1Q=
X-Proofpoint-GUID: TSnPtZpZqSZKJ1hGxmtpZd_nZi91T2fZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210056

On 10/21/26 3:51 PM, Krishna Chaitanya Chundru wrote:
> The Glymur CRD has a WWAN M.2 slot connected to PCIe6. Currently the
> vreg_wwan supply is described directly on the PCIe6 host bridge. As a
> result, the supply follows the PCIe controller power state and is turned
> off when the controller is powered down, regardless of the requirements
> of the device connected to the slot.

[...]

>  &pcie6 {
> -	vddpe-3v3-supply = <&vreg_wwan>;
> -
>  	pinctrl-0 = <&pcie6_default>;
>  	pinctrl-names = "default";
>  
> @@ -828,6 +847,12 @@ &pcie6_phy {
>  &pcie6_port0 {
>  	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
>  	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> +
> +	port {
> +		pcie6_port0_ep: endpoint {
> +			remote-endpoint = <&wwan_m2_pcie_ep>;
> +		};
> +	};

This is already defined in glymur.dtsi, just reference it
directly as &pcie6_port0_ep {}

Konrad
