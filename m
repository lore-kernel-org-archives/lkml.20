Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F154A2A5D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642153; cv=none; b=AdegK010kWyYvxBxx5D4PWTXNEuAQDHThC/j8SaRIGgzF2e3pgizi3lK7b579eaZrY+ZAACN1Lr9rVKepe2wObXI2FSUOI+dD5lr8le79zJqWli7mF1OSgNTP/93S2A98Ih3cXx+GoGIZBXIQ1Q+jUW4k3jqpXqMFlUZij9NFcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642153; c=relaxed/simple;
	bh=eZ1R02TktGMoafWc3iB44QwiSvxM9+9cWgD0hJ/GFXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r2zi4CWmNI5w0ox2WcTSZNOhQ8J498VXsdGsxGlBg1HGmUMaynUEvOnhtnFeQXO0q8IeXyScqE+WIh/4OYUiMuQnZAC2HDlUGxv9/ghj8cgwu6QRJJ5xbSY0tUihyRZH3YbHKJy7jwdqzh6IzTQFX30hJXqxaDS4j6mkLEtbfRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0driMJ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNICaZmg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0driMJ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNICaZmg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Za3C746566
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tnso/dK39CPl4xYVq096jLstw/svSY24BOldvEqgn3s=; b=Y0driMJ1/qlH2QYJ
	6RSWPCsoXtE9kJVKN+DoJ3LKym8hkI36vPzB+1ZDeDFoiBP9rzv8gx+mkScpjvgj
	5ZuimtJ18KZdHIzdtG4ynDvgJqHvl73tUhSoIodZyLGuzOvxBKy+gemTJr2r8dlv
	XclVpA+T0dktZtz7Was6jrdAZHq2S4Y3RTK7aurVxg3R0FWP0U5x2xCsy8VONl3m
	e0mwbdVSXWl/wiN4z2ifvRuVj3GoVRxwAQ8O38XOZCJHNBCss5tIS9MNyTXBvaBA
	X5GWNoEa/7spXd+RRMJQ43PrTsBBzO2hBIH3k3LTdSDc1T0evBmD/zXlxYMelAOB
	Sw2j8w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra8j2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:48:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so762768a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789642137; x=1790246937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tnso/dK39CPl4xYVq096jLstw/svSY24BOldvEqgn3s=;
        b=WNICaZmg7pqv0sz8n7Us8UVBoqgC9uu9LaHnkQJI7VyVzgVNQgObf8J7hBmWDWo2zZ
         8g1PtkYyyCKJJJqbQPFV9049oxP9SCS29PKxp4QNGn52g26CMfAGcZHH5hj3d0NpdHoS
         NWL//Hu7DhOROpV74Q9n2hQPsRST4JGDyotG//j8BEwO1oPaUSbfz0rVbkdfPpSxsxbW
         Ixc8/7huenKKgLz+70xAZDvAR6LBygf39HZLIAGcJDpMBJr4a4byQUgSA5BOJGHIp8gW
         WXxvGmA0i6dMmSpEWkvSBmH2ZzLltn4evfAfZcG/8WU3Nue9MyLz1pdehE+y3xPQlyQS
         lO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642137; x=1790246937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnso/dK39CPl4xYVq096jLstw/svSY24BOldvEqgn3s=;
        b=eoAmdXcr7tJiY5NO6Las/pOV8X709NiRl3St4JyX+lu3TI5oIzcn3qoziUuxh9dOUF
         SMYi0FT8SaiNagLgN7vRMJF6ND3kjQ8QwkGFgZRGrrA1INw8PBrrS8+HGJVwgZMLdcAY
         BfrviD1t6rXJjTZn51vR4fdPNb+nK5z/wRG4RHu6v5e8PsSEorIv1Lefn2bhjnlSya7F
         JrX8bBsX73vlQ2GN+OtEjRGa4DV3GDic2ltVbnvr1yq6RJbP0LP9ovreztWasOLjb4k9
         jgBXAWyGldtNYN4sOhx55pZJS5Wlpn9wSkuqDrcmnKCW9Ge+YObxVkYNcIYchNQrNkHQ
         xoVA==
X-Forwarded-Encrypted: i=1; AKwUvByL/ZjXwjBLxiApHBsiwKNXgQXvtTi2sk02hjIX5kJPgdNweQuGZp7xxnB/Qsp44iIaqMhiuo4aa7ROK78=@vger.kernel.org
X-Gm-Message-State: AFuF++msPT6RW5YnQLr5nAh+sWf3RcnApQBEFBvEcSEy09gnQTQ0HP81
	CIz9mybXuIv0ZPD/eKr/QGK9Fc7q+zaO5RtE4yRvgnIIrIwJFkxX86PagFSdFWSdSF+EoF9ZGy1
	liET4V9IHHiOROZYUN25ddNDDVakbGjSFN6jFk/sczuN+Dz3b5Hv8zR6wQ9+dq9CNolykjNfp2g
	o=
X-Gm-Gg: AYBFou0pF+xmIxkiiawjA9OiUpR+hu2QeyjCCnDKLdCPcAogHihBeb1RCGyvlRWpJAX
	zJ2xDTTrMsrE14BHwXC5Kwqyq3B+rT3UoV8S2xCk0rPy1rHy2S9GztT37yiH1CNQY8mCe52zikO
	0sUa9karCQ1hE9vfM+6ajLmwO3Mtyc4A6OAVsQZOeotw2CIfmP3Bz9FYa3fU1Nsv+esSsVQhKyv
	wW5JZ3NM+ynsMRrKJRqBjnSrGMVMLuFqXU8QLHM6JXkmKHqFPJIUihOCqsmilAvutqxQjqUF35B
	RcAF0yt3QIOitzIVIEjd8vbP27mo/9uLFtAwuZILnb9c5iOq12FHocx7GJzduIli5yrEABLyziH
	OWQnr3NAw7T2UVQzx0UPEmMGdBTHNi6q08Pg=
X-Received: by 2002:a17:90b:3f0d:b0:39e:2c5c:a689 with SMTP id 98e67ed59e1d1-39e361ab7dbmr4771635a91.30.1789642136564;
        Thu, 17 Sep 2026 03:48:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3f0d:b0:39e:2c5c:a689 with SMTP id 98e67ed59e1d1-39e361ab7dbmr4771594a91.30.1789642136132;
        Thu, 17 Sep 2026 03:48:56 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.137.165])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4a48fsm12639770c88.10.2026.09.17.03.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 03:48:55 -0700 (PDT)
Message-ID: <2beedbc2-f47b-4eb1-9191-597c360c70d8@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 16:18:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/19] media: iris: Add AR50LT core support and enable
 Agatti platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE0OSBTYWx0ZWRfX6q1DXDjEAP1x
 4xSbtkKsTq2gTQmgpKU4xuY4lkO8KSY5+t7CrtxZid2SPQosW0PvGS8lRihrWehaQBtX1enwGIZ
 f6gHULZrtQSHppN2FfwlvlildHIJgNM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE0OSBTYWx0ZWRfXzGhLnyeR0zm/
 8ArpCCt9hMwTWH8HfBNtbTvC8OEiJFGtNZMNzcfxzWemF2+PKD5Cw6ZX5erkw3jV02xOWFsnCyS
 G+/jSsZj/wTAXEA+Rku/OfVVFlNdPzHU1aHg2MMzfXh390aErzBHDkOZ0zferZJypncrSz+Nu4J
 Mko1CaS6uJW/P0EC5fdu2z66OMWYSCAPjR/ZWj95w/svGIJbl8S+SOw60BZPSmUY0fiqOMdNmH9
 dZnbfVTFU3WkRVqT3TjEQB3L67tUDcAmuqyrwQ0Zcoz4jccRpIkNqDUYBPQGDzQbdKso+TDmOAW
 h0AJQ3yISGNwiJ3lAE1ldfiFMPE8nJx4/VVeqZLnMxUKbc5pXMV+vby2TAgy6pJkyQKQs9HztcJ
 ry7vNYnsEzcTxb2cdraq+YMqQHtvXUghMiWWOOoX7yCyJG9t/ZbQCRE0nI1sdCXVeOM6ydxL/O2
 VuFvyF6F5KcYQ4l2R/A==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabc599 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=/MhRiX8TZM4BB34AAREmLw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VEuCN2dkXrGIZYAknfoA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: d4VJkzPhw1qZZa-Arh8MbB0XBvqI97FR
X-Proofpoint-ORIG-GUID: d4VJkzPhw1qZZa-Arh8MbB0XBvqI97FR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170149


On 7/31/2026 5:18 AM, Dmitry Baryshkov wrote:
> This series adds support for the AR50Lt VPU core to the iris driver and
> enables the Agatti SoC to use Gen2 firmware and HFI.
> 
> AR50Lt introduces a few platform-specific requirements that need to be
> handled in the iris core and VPU abstraction layer. To accommodate
> this, the series adds minimal hooks and updates needed to allow the
> firmware to operate correctly on AR50Lt without impacting existing
> supported platforms.
> 
> Additionally, the series wires up Agatti to use the Gen2 firmware and
> HFI path, aligning it with newer generations of supported Qualcomm
> video hardware.
> 

<snip>

> 
> ---
> Dikshita Agarwal (11):
>        media: iris: Add Gen2 firmware autodetect and fallback
>        media: iris: Skip UBWC configuration when not supported
>        media: iris: Filter UBWC raw formats based on hardware capabilities
>        media: iris: Introduce set_preset_register as a vpu_op
>        media: iris: Introduce interrupt_init as a vpu_op
>        media: iris: add vpu op hook to disable ARP buffer
>        media: iris: Add platform data field for watchdog interrupt mask
>        media: iris: Add platform flag for instantaneous bandwidth voting
>        media: iris: Add framework support for AR50_LITE video core
>        media: iris: Introduce buffer size calculations for AR50LT
>        media: iris: add Gen2 firmware support on the Agatti platform
> 
> Dmitry Baryshkov (8):
>        Revert "media: iris: Add Gen2 firmware autodetect and fallback"
>        media: iris: drop IRIS_FMT_foo enumeration
>        media: iris: skip PIPE if it is not supported by the platform
>        media: iris: add minimal GET_PROPERTY implementation
>        media: iris: update buffer requirements based on received info
>        media: iris: implement support for the Agatti platform
>        media: venus: skip QCM2290 if Iris driver is enabled
>        media: iris: constify inst_fw_cap_sm8250_dec
> 
Hi Bryan,

When do you plan to apply this series ? Is anything pending to apply this ?

Regards,
Vikash
