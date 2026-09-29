Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E945390CAB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665318; cv=none; b=Rs5jwRh9PMLCLStw/aO8PolZ8UwWQHr0gVTKw6Ns5TfYJDSDKcF7oZ8Z1Xq2+wDfDPmxTVlEjCKUBuNErN+V1B9to1lbsrrpsKXhgeUoNqpR2SVoNIU+e0IIHb9T/nX7xg6UlpA90fkXnrg0oPpvbPtDfIGPAHZiXzpqQgRdV9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665318; c=relaxed/simple;
	bh=ug6onJikPynoPb1/wMm1p7ik/T9fv6Wx/1wYkf2VHzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MGGG9+BodnqhWjP4CSkLVft2PnFB7Y4oIRZ/pXszlw/X5z4LSsLXRhkFBU3L9yvvh93XpQRSm4n789s3eYRxAghxlLE3FOK6m8QhZ22NDkqbqpBg8kxTbQYS9nt2pcMXkY7gXuxCFafcqI4pPifJwxhpkOruW/U6v7VTly1H0Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irY5eqh8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TiVKQ6Wl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irY5eqh8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TiVKQ6Wl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47LSA2127187
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	svb+m8PamlTqsmvxTmKIajGp/QN753GcXO7TLKvbr4U=; b=irY5eqh8LFds3Wrn
	LL7dGqkqTzzsHl2HervKA/a8JLkEb0VPNMlnc7eUuIuk4w4O1Q1cezHOM3cyBZD1
	qyfkiJT05aunzs3UNulukqZfg7QYbjZJ9e0MdcWidmqrdWLbk7R+EWvLgOv3TLIY
	0ofVs73zKfZhLJjDQST2GqWiTP3g5SwO9K/v8dllOkgq6XP3BmjeEON+RN4az/Gn
	n9hfy9SZd2cQZ9950ILuVsWrpoAN2IyRYYjzp76vg3eHJZmXWMt9jGMGjo6jdNO+
	9TU/b+LW38jcOf8x8TAY2lpcK1xA/rgPDkVETvxrI2y76vgm70Y0cVuuO/jY/3Dl
	uBkZKQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mn99t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:01:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e3f521346so4223802a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790665316; x=1791270116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svb+m8PamlTqsmvxTmKIajGp/QN753GcXO7TLKvbr4U=;
        b=TiVKQ6WlLm05Hr5WoUT4k/jfY5pi/dKNHoOlDG1Np6rsaVn+inmBvckCaVLUK7ka5E
         Bx5qVQA5IJ0rPMNE98/wBrdIib5JETVU3S//uJgWmkD8re7iSfFD7Q9zLS+zr61TBhED
         PgUM7zKi3mYPcVDyxcl+qlMwfjONbuS5TTjmWkG28jhdNf/uEcMDX+Zz4dfpfgTqfAQw
         4Yq28uG0eaDT42iTDFOVG8gSTZqFmIwwjdV098W15GCE2ytgi82CWZ4la8H5BHxOHVYt
         gtfbR6e8rcFebMgCOfdouVp7Cgd56SiQqrN9DkuPx6jxbJiKAxOvl1nmLNjL7rAX11d7
         LBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665316; x=1791270116;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svb+m8PamlTqsmvxTmKIajGp/QN753GcXO7TLKvbr4U=;
        b=HD7aQsuXOjN6XwH9yDv6/1jBJMMYF5hbys5DL4X7r7+T4LmM9vfVwASNvWje84PSzK
         7y2IHAPxHO2j4/fLdLCGDyT3W7CCiGEA+hIwIv9J/m0UYmBZZlqL7ORjY4xV4Tq54AX+
         u2eCTtnA2ztD/PQ0A8r33lK0jdcQ469SSfJMAsgL3nBQ1F9dqeH0E/ZsGI18hNICi2LM
         rOhUiCLcGF6BCmQiL4MQ0cbWRSTGu7zSEJ/ATh3K7rU/hONH1qKM+0aGfrNZ1+0j/cK6
         V5k+zCMRPn58VLezQuyOFKbtAzG2hyVhIGurwkkDtQlE3J1Rw3/KQpE9fn8ApZHDmFf8
         5RVQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2aFrQgAyQ7ymilNCkc56m8FwLsQMgNHYet2LDuU+jgeSuor0vxjIG14izErxT8l1qn2Oe3nM1ZOIiDcc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL/p8cdw1yi7hFgbSw15/XR72qgMVjr0WcBgyvsSN5dvsJAh/X
	Fzl1qMgQ8LDfoFtoLP1L5j0lGJQjHliiDI030yNHMsqcagHm3SmjsvVTkEOcgZhT31rMdgvTagD
	YSWJ3qKtVmnKEC+4OgReq2pfJe+6y2RHYKyfurdVTTjDSEuJeyo8rh2tPew1tTETv9tE=
X-Gm-Gg: AYBFou2h6i6tYciaznu3eahHEZGqCLWxAGDvH42fDZMq+o0q5oMB1/+qOemCifUhdIy
	/UcntlkTzvHk9YeKSqDzbmlWyCtM+hHPxIV9HcUpJTnZ2rjtwtWNsf/3QE2bHmSKhgBuYDOhLm1
	c2quPxB/dDZQpRleFAy8vLU8L031fh4cBCSCNqxOkneDym/GDAGBmk+kcj2Xf2dgEpWo03mNNiL
	ZqEoIWzvgIRqur1UFP+XOJzAg2menhu+XqHLWHddzj1mMhDJq7fX1avFkHGleqkZBmqAP8ZZdTB
	2hVmdm9urQkKmIN3euPM2rJ4vceUFJbXQYa3awL0Z2uhR2BEFZhV9YTlbGu7/CSdm458EYltuZh
	SAiij29l+2gwRnmpIc7vKCmsjMX1YEOrRjQD8SoE9JZgCIdry+1GRg7jSc8bikV+lqYU80CAaB2
	hwWPqjkPa6srp35V5gl9NS
X-Received: by 2002:a17:90b:53c3:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3a09896a5a5mr13031250a91.47.1790665315756;
        Tue, 29 Sep 2026 00:01:55 -0700 (PDT)
X-Received: by 2002:a17:90b:53c3:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3a09896a5a5mr13031218a91.47.1790665315274;
        Tue, 29 Sep 2026 00:01:55 -0700 (PDT)
Received: from [10.79.116.189] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497d9b117sm3763219a91.3.2026.09.29.00.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 00:01:54 -0700 (PDT)
Message-ID: <c29c1bd6-77b1-49e5-94b4-d8ec14346ce8@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:31:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
 <04faafd4-037d-40d2-a79d-6d128b194692@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <04faafd4-037d-40d2-a79d-6d128b194692@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abb6264 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PaPtSKYIirbzHVDMbN0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: H7TVS_bJWfxuz2HBXzIX8KqROI-xzlHt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX2Y/8EZgtfZXD
 gIqPzPChEF5T+W/6qrd/10hsgD0XxbDF7zAUFn7fMuIUNepH6enY6YHjJWcMeOJ/otHyap6C8A+
 YkCjFbiqqPAG9AZJqNt/JWBFbCmVRa0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX0cnuber8oVRl
 lATAUJWEyZEtwKYsaTKYj0UWmAcpsHDJpPi537tOaxwdGM+sPr0pkbwRJdqH5pTs1ccLIqUirY5
 XaQZNepqO0K1SmAKOJ6iWoz80tN+Fg9W12/DAH2DQEqLvJdRcQib/BVMFZimeyzs66SipYP9gNG
 s2hJOFCQf6rtT9MYYJL9HIKGUz4QcLpmAWScQZ9aZmwsLQ8B7hloudXMf8T/VVZblTmX0/mFWcM
 54iJIpT/oZk5heNFH1oE7njHGkneb8tZLTjJdQzHmmavwQGU5FRhAkaRUhXjUYIJrOWGbPXsIw1
 h/EXlsWBrOx3RgpIr4iJolBfQOO96iNK7JqatfS/CAQXzUB9VdOgzu4WFgm4q9n3CftXQd0IDHO
 vbv26Ym3CCO5aXcUc+Ewe3UXtAlyZNmdsAyTUKfrKqf7gclOo3uI+BAY7UZWuZPPda4FFxi0KK2
 G4ERLMnfDuFP+2/lK0Q==
X-Proofpoint-ORIG-GUID: H7TVS_bJWfxuz2HBXzIX8KqROI-xzlHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290027


On 9/3/2026 4:37 PM, Konrad Dybcio wrote:
> On 8/27/26 7:51 PM, Hardeep Sharma wrote:
>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
>>
>> Peripherals included in this initial set:
>>    - Single Cortex-A7 CPU with PSCI idle states
>>    - RPMh RSC with clock controller, power domains, and BCM voter
>>    - GCC (Global Clock Controller)
>>    - TLMM pin controller (110 GPIOs)
>>    - Interconnect (aggre-noc, cnoc-main)
>>    - GENI UART console (QUP SE3)
>>    - SMEM, hardware spinlocks (TCSR mutex)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
> [...]
>
> GPT found the following:
>
>> +		tlmm: pinctrl@f000000 {
>> +			compatible = "qcom,kuno-tlmm";
>> +			reg = <0x0f000000 0x400000>;
>> +			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			gpio-ranges = <&tlmm 0 0 110>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
> This needs wakeup-parent = <&pdc>;
>
> Konrad

Thanks Konrad for review.

fixed in v6 :
https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/

Best Wishes

Hardeep Sharma

