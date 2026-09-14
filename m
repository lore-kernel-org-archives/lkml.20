Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF3D412BF1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376048; cv=none; b=VK+fi1kAlyNCTQNcuSolLHSSlQJhzlvSrSiNiO9f1qtu+Ertrdrwfk6OnVFuQfzeSj3FuQqpm5Y6lHCvXx7cTXyKETTj4peQr5jgJVKj+j80vRld26y85PptwE3VgC5kPVIPiajQ2tCBoo1Jn5dH8drhsyZwGdo6x7dc0sWKwCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376048; c=relaxed/simple;
	bh=ANcMsf1hv9itPpj5HQUY4c4I9lP2MSHII9NGez4uWHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obOK7b4fvGM1y7Rjnqw2i11sWtwsGVt2N1p9Pgm8yUYMcKxPN0Hi0gWFFS76k+AalO2RV7g3ZUglFJoqUfrwzAcWsZX699Qaa1rNEsXCLp84F2pkRjihO2o9l+UMotUI9thj3qjM1OQt1igss1VaSKTEEl2Hg76BcyrYRh0BBc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkT0Mt/A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Us/dsg9r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkT0Mt/A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Us/dsg9r"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8ScSm594663
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xib6kAdN7wXOhJ3RTthmWZd1RIgwYetUlCX6bJwfoUY=; b=QkT0Mt/A5F+4dzdI
	DM4YwnHgp2KeGHEh2ZkFw4epOnczOKAKhZNl4GITHVn++RAWBA2IZdKFjfc2AmoS
	Sv6/VF3XKzxSK6Z2sJX5+lRgWXBUG01QggitDKyR38TqtqiffF7k7FLYQGGH3jGf
	hwJ0gOUPuxYIP+7zXxZd7D5qLKt1DK5VdP0mHOhjjHTzY6+s7LCetMPJLdugBBec
	L4uePynHxzeEejEWPviSd82A2j8vtQUQy+z+bGifSlGyqCHqQQMx8+a8qwG8GJtf
	8ZUEsrr4xQzuz7vYPh8JsjiU5QlNRkozGeZEK1IuxYozUBm7oJOx3ASSP7n6ZCae
	NzRUoA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevr2vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:53:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f4002c1aso36490585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376034; x=1789980834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xib6kAdN7wXOhJ3RTthmWZd1RIgwYetUlCX6bJwfoUY=;
        b=Us/dsg9rsl2kq8cpTUIfd7BVbEm1CVmCsDAKY4BEgzhO3PjngfZbTS9nDhbcZuMjLx
         892yAUZ5jCxIM3fHrP7sA+GWUZ62ODStP67JG+X25UlSMdXiQldbhOjakMP4FCDcULWh
         w3MuQv91X+OonqhOQ8pJe96vv/AWiEgVsDpkCQHg2Q1UC6BQsbfujHWgnnNas9qss7s0
         L0GGeX1Y+YZUeB9/GodEk8rEsHUNxxONKKuNqbFA+BLKxX/cuCtmGhnv05XECUQBKFwA
         S6nnJ2YadUuQFq85mbxWQ3+nAfI8lTcVWDUj6ujZc8+etzGKAAGqN53FKPsze6oIBR1z
         RU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376034; x=1789980834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xib6kAdN7wXOhJ3RTthmWZd1RIgwYetUlCX6bJwfoUY=;
        b=bcpxjGta4UYg2/IsyOaKnrNAYs7dCddYM6Sq04gJkMPvvGZ+lbt8QZRuuIFxGwVsl5
         Gk/03CIIU4Pcnb+V6STPo953BI1QmUEFQmnIhgzhqScdGvHCBvQVe/fETn/CvwSjTeVL
         71H3PV19uRFH+5zq+cgDnixZlCmSO1mDkPSnEHre7fMbbjO+sOYQFgFYChe4blB8C+JN
         mO8XsVlcunuL+3THqACQrz/chuffAiGBfunulwobhD4xeiSmVGRcbp0ELfKxYIsPuokd
         giKGPhbiP4/Ptxhgf/Bae+7ftm1nRrm5dyCd9Lvk8VCFjB9jwuQZBz24npTsyqe1n0w9
         SSAw==
X-Forwarded-Encrypted: i=1; AKwUvBz8iU9TrHA0/iWnTzcu4uFSbYPo89vqSCNGhZrrW/whyQEg4jSDyKkGFzY/D48/yz1WUi+9tHKP9QA0Tqc=@vger.kernel.org
X-Gm-Message-State: AFuF++k+kZs2DSZNn7I2Y3poKHYdQTAG4scmgLc6RwuNZj3hdO6ndGON
	XId2fMJFT+3BJvnRn2q95uBWX/7S7vhvYw4eZyTfxC8bacU/ele1Ko/E5DTJJi5GU3QB5v6VfYz
	6BB4ZmTsOQvQX8SBZr6qvV2/OTcdPLEJAHFJlir2TTsgsktm/o0zLvTtKZvONcrKyzP0=
X-Gm-Gg: AYBFou1VbAgJ8YR9J9f91UZ2JQrWQfhEbrfz/PKBicyobc7uU2qG16rRNtpX0C3mbRR
	oslXXZ/96GeRYTJ8vTuozx7t7GTfFqroDce95REgqf0nuwS3w+ct/a3PxnO+0ALyFRfeoP+xK0p
	y+BsScTu8PyoaeYRJ3XhRMnTXxnWQzS4XTLl14UZyIEctkG/sQrVEqvbICVX8pOlo3XG3ET7qWd
	v9blDCiaoK0OCZTUp9WUcjAXDHZKf9HBblAerj2k9bjOLggkJE9o30cniZ9v73s1TYJ7vIY27eQ
	jiw0FERRE2/fjRPwOIFfCg9HLy8DFy11fUAKKJilRd/z8otNeFtxOaqs0pM00DL5z1Kbp+poddE
	rFw5yXuJS+HJ1QBd9I50qQA==
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr177828285a.5.1789376033670;
        Mon, 14 Sep 2026 01:53:53 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr177825785a.5.1789376033280;
        Mon, 14 Sep 2026 01:53:53 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660219d0sm389755466b.18.2026.09.14.01.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:53:52 -0700 (PDT)
Message-ID: <e59619ce-8ae4-4aae-b617-f0f51c339094@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:53:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: nord-rrd: Enable USB ports
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911142040.100263-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KXrcvWGgmvcC48H-0AfNOO30_DLLesGg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyNSBTYWx0ZWRfX1UErnM3J/8Yr
 dMrv/s8FKjNtY2Iacz2jhxWeBi0H4ZM3gLPlGHPWdY2JOZ5s2fSDimvwoyXqSDqTX6puE+QaBXF
 umGiDOwYs6I7NFKZu/dMM1XHxNGCywY=
X-Proofpoint-GUID: KXrcvWGgmvcC48H-0AfNOO30_DLLesGg
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7b622 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ReQrK21VLLPqOcHKNgQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyNSBTYWx0ZWRfX+rw2iRgcrZeW
 GJvgMWeeAwMrbelB3E1zA6bt8ZQvLfZnw6KpStvBRa0bjTE+VJVXRSEE+3u6IIJAvcE0HSMpX4y
 mBQoP/GWQKeOsLe9PoslmYP1NMrY6Zlut9c7xXqElKfMMq3NV412DAtZcSbfxkeLyDTm5GcbNh4
 AgpMGUCO4f/NphSf536TAprl8kN/bc3TyHt93QPujgHB44uwZvHapi6NVhLMnA/L2A4mOh7l9kx
 3t1aPaohmzAxwaa4mBFIaOAtjNrsjNEH9zV4gyCmhcqIvmFwyMhnuKtc8taJEvms4JjBZxDmvWv
 grvhrAO8IMhyOu9p8NWnko8ZXD67zqFoJpQskzYMaxZkNHWB8QWEtEincoK+reE1Fmc/n9arGYT
 ZR+cUUlOpffbcv2537ukX5dL9mUAXhutDVaTwnHJ9xD1iCsPadC/Dl14o023z0Tap/4UGLTucZR
 BkIkPGoVW+Eeu6jNnkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140125

On 9/11/26 4:20 PM, Shawn Guo wrote:
> Describe the RRD USB topology. Enable i2c9 and add the two NXP PTN3222
> eUSB2 repeaters for USB_0 and USB_1, supplied from vreg_l3l_1p8 and a new
> fixed 3.3 V pre-regulator, and reset through pmau0102_i GPIOs 9 and 10.
> 
> Add the onsemi FUSB15201 Type-C controller at 0x50 with its interrupt and
> pinctrl state on pmau0102_i gpio8. Unlike RIDE, only port A of
> the controller is wired on this board, to USB_0, so a single
> usb-c-connector is described and port B is left out. USB_0 is configured
> for OTG with usb-role-switch and its HS and SS endpoints are linked to
> the dwc3 HS endpoint and the QMP combo PHY SS output.
> 
> USB_1 is a fixed host port feeding an on-board Genesys Logic GL3590 USB
> 3.1 hub. Add the HS and SS hub pair as children of USB_1, linked with
> peer-hub, with the HS half reset via TLMM GPIO 170 and the SS half
> additionally supplied by a fixed 1.2 V rail.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +&usb_0 {
> +	dr_mode = "otg";

This is the default

> +	usb-role-switch;

And this is a property of the controller, please move it there

Konrad
