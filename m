Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795187;
	b=oMIipzskskqsm0xqVAYshqAbujWHfAY/3ftC7hbsm6rOZy8LYFXwq0ldlk5ktBljsSR8
	 dTP5y7V0Wt+57xHUGZwMfW5BnE14Suu+y481cF/XK5DwcxPepYfKLLuMTBL4xRmaxR1q5
	 gDb3S9XF+zLMJxyaRrlhN645nAQo7RRzDlU/52wElecpgUNGwPNXnUKaCe1mO51BuA4h6
	 PRXCIcUutc9pR84D/IHSIueonHVbsujEIxiI09+cZnGFkNX087toH4whQxm0rC/2EskJ6
	 uC/uWlkKNufAJf72e1awt9lLCxnIu+SAP7vq6JYMHijLbkW2U/FX1YzMDZs83BxC3Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VK2mF29MPTHHe+f3apHM/eGxl2KHbCALcUXSoRbY3qE=;
	b=ZIoR7mXp0todyCYgQs+HOpLdduREceXRY7LZhIMTqADDvr4+qZ+BsjoQ359jeJ7DYUZb
	 fUvkBa2HcQQ+bd19XPjjKp7bMvJarH24ttU4ey/ejhRMePMPu1V84c5TEW8G6z65CIsl+
	 1NSrkAmwouupeEk3WsUAuqLOdamUYi9bADEwHLuxZGzKqYanibIiuMcgEEz7oBNujo10P
	 kg4TAC+86FOGQ0md3ZM0S4inxlfaibLy+xGxEhKiU673u0Tj6gaRgMq3WE+Ex51m+08hK
	 L/Y3l26tE50AG5wlZ/dXKutCDzkUWSRrmFhii186MnazSrLtRDfOLVT3JU1/dBvsCJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx+t21J6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HyQRJ2iB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5D7606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB5D7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx+t21J6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HyQRJ2iB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZtfN608380
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 12:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VK2mF29MPTHHe+f3apHM/eGxl2KHbCALcUXSoRbY3qE=; b=Fx+t21J6rHyUMJMb
	GZNednuJA+XbxTEdcMhD+WABGRodwzN8hXZt7g4lHDsSYSKoEglW8g24cxWZcFug
	nVcgFlz7tvADFxgvXDFICY8tiEQyZwnmoDYt8l3NIDRGearB/MJ/12xRTojwXS8R
	jDIh/wYZGnKeY5sr4BKV2/sEalWuUmjWJV2aaLo0jMtZUBOKYkaBy9ky6caOb0g3
	mtDIDX/csZvbhvSnG3ZILY8FxI/X1gsn6LhTpMZdKecop0qGxm/pAABNNzxnIfUE
	f/wg8FBCbYnzLV4tEkfw02jzmwq8l3DRA0USuwTQ5Cnf1UQmqUspE2koHjjUbvfp
	M7jCNQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r807yk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:26:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so1014640a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795180; x=1794399980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VK2mF29MPTHHe+f3apHM/eGxl2KHbCALcUXSoRbY3qE=;
        b=HyQRJ2iBX2PwwVOPnUnanJC9zGDofhaa3aQZgwvVeEvbZBfFDoAop+RD4dcg3hq/2b
         ikEwSbKZsPvktv62Lw91CVKlqJ5L3va7K2M7hq4atmWGGu+Zq2SQ/Ziqf3zTMyZgboRo
         EZk/VvQozGxOwIAEBaEWf8sEBvzJw4to9X/DSCAlzyVAcmHMDUrIl5nm6KtAu9oNpjx4
         sEijJc/qBcYfTorcUfNhKjgu3vSBsqldHlQ4otb2xv37PqJ1TL2H0dmKta6/E5b6AFV1
         xRymKmKxey5qvx0i/9nyF+AJke3CnGqic5xVsSF6sN3EVyroFLVFdw8shZNS4EAfOElW
         oBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795180; x=1794399980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VK2mF29MPTHHe+f3apHM/eGxl2KHbCALcUXSoRbY3qE=;
        b=WF124AD45bn546Cq/Nodl7YZTPyoIaLtghfSVu9J1z+P0i/Dc4CYJSR2o6LMFQue8u
         wxGWxfCQTiA0/oZuDRTTuL2dzC0jo68Xfz2kbRfghztgQMBC8+175eacfmsaa5jNxRZp
         Z2UM4B+MQ1+BMzes/MFVxZ5os/lqDKJj3bI7rRT+4w3do8ZTXibO+UBCoAbk59hVazLH
         nT/ntusCeghSLwLZLbiW5SY4TrKexoqlqt5WVfyRIwZLO0KhNOhTTV6tlFkjgX7vzGJz
         MVvPBtPRq1YXVSZRX+7IflFQ4liVrD5LbiumA/3GmeYGWggISGAi99iPmvKzHzyRfVmF
         Qi5w==
X-Forwarded-Encrypted: i=1; AKwUvBxBHFlu3yRdoyMwGU2exO6rfZWEwKXTqfpsP/QK1me+sA/Him3oq6vu5ywpTguxdL9hVEWJ9s1AdvK3j14=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fwCK9q/atM4xbPPTyIaTy6FNjpLGb9tMRgRwMni5KxjRhDGxN
	SDpGA+j1sXaSRJ4Nvb9QeNssprxirukXujr0YP3Uk1eoe7T56N5K0F6qANE2pQ9xgXrgwC5uJjy
	t6hawrVL3SvTjr6xaojZ9YYQY6F6VDfikka+z2rRYYX0SK0KOhCEHUSc+kmls+wZnKl8=
X-Gm-Gg: AYBFou1kNVQTVLBSZMrmuG9Cz9wY6dKHsYf0Gc2iiHoIt3R2jIB+6OtCXxyeRG4HuDK
	1YC9mOotBA7l1nIMyHWWOuYKkGiroxHCNw6ykLmyqAUOmW2RT4OUwGTnbNJpV3D/i3a/Sv/I69N
	jeQad5wiBXQjvFBpswOdVtR5iOCo2hOxy5hMBMB6K208HoS7g5vfAnNjmK4KEsHt1y21A/h1Sin
	f/lxGHJqAylW+ckdjQeO538qKu3JYUXk4uvk6RkqBMxE3UH30bnQRUJr+QpwhYXrMIWuDOSTRg0
	hT7V0IJslTpVV3d3ht8nZoDj8Dv4tG5PKVs4vjObj4L1yKXAmyQr6RkNuPnBulWVsnxo80ImwDw
	DUEEObwl/ODJrX9wdNT7krS2FYeFLAjX9ITNSferMO6AqC/RvvDKlok9SqbMTPHrew7OOOtNGhb
	zccvchWQ==
X-Received: by 2002:a17:90b:53ce:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3ae89835706mr12958242a91.50.1793795179561;
        Wed, 04 Nov 2026 04:26:19 -0800 (PST)
X-Received: by 2002:a17:90b:53ce:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3ae89835706mr12958197a91.50.1793795178953;
        Wed, 04 Nov 2026 04:26:18 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm3924074a91.1.2026.11.04.04.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:26:17 -0800 (PST)
Message-ID: <f51b9be2-acbe-4d4f-9f81-bf5b289eab0c@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 17:56:07 +0530
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
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
 <b7bc5c82-6812-4df6-9820-122a4c957036@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <b7bc5c82-6812-4df6-9820-122a4c957036@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Goiz3v_nNXwpS4f-8iNnvYTlIe-8Lmk5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX4PnZwAIrlu0Q
 EhlSRHQHc1Dsu6g4WC7MgYaqq8XwUTA/Qn3SZLPwnsO9CQMmTqHudBxi0ZBp08kBg/xaHtaBR/T
 aJWIaYm953uqSr5mn9/dDYI2Eji8caAnI2llww9tKvT11DewKCdHU4IfiulIeIYsh+hYADrgTuc
 fW5rI/nVcJXrZSs5HCrjIgft+gtSq0F9fY3X/83u3WCsSSI4IytFSnNlza6JPIjgYdtcTberiTY
 LkBmTumU0Lb5wDW7TWCYlIJlmGcA5Q4Fem7SJ5mEqrrHfSTzJYPy506lYnPvx6O+BN0uyTluRNR
 w0KMxXx5MTVqFCjShGT3olBKAqcPYhO01xoTp5bsHjW+4Vu0IN0f3sonGWUe1/p0XOjqsyBLou6
 LYB8/vczkcOrx0urr4bnv48F66BkZVUp9UwHV4mCSW1zirXAwI5KUFJhSxv70c3yI5MRbg7pm+7
 lxnr636VQ97Oh/N1LHA==
X-Proofpoint-GUID: Goiz3v_nNXwpS4f-8iNnvYTlIe-8Lmk5
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aeb246c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=6zRx56OMOPonLltcXX4A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX2cKfCNFl0lKd
 tQIpZXGOZhAFfniMDd6T2GETYLOPFgVl5ZUfKZ+DMpWGdr04o4nUdKujIiydNaltMnbgzcpC4Rj
 oSCwmmEJVofQFQyGbKeDLZO38kx3dUU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040049

Hi Konrad,


On 10/12/2026 4:59 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
>> hardware monitor. The driver exposes battery voltage and current
>> monitoring through hwmon interface.
> 
> [...]
> 
>> +static int bcl_in_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
>> +{
> 
> [...]
> 
>> +static int bcl_curr_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
> 
> these two and bcl_in/curr_thresh_read can be unified, then some
> helpers can be collapsed inline as they become single-use

ACK

> 
> [...]
> 
>> +static unsigned int bcl_get_version_major(const struct bcl_device *bcl)
>> +{
>> +	u32 raw_val = 0;
>> +
>> +	regmap_field_read(bcl->fields[F_V_MAJOR], &raw_val);
>> +
>> +	return raw_val;
>> +}
> 
> This is single-use and trivial, inline it into the call site

ACK

> 
>> +
>> +static unsigned int bcl_get_version_minor(const struct bcl_device *bcl)
>> +{
>> +	u32 raw_val = 0;
>> +
>> +	regmap_field_read(bcl->fields[F_V_MINOR], &raw_val);
>> +
>> +	return raw_val;
>> +}
> 
> Likewise

ACK

> 
> [...]
> 
>> +static int bcl_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>> +			   u32 attr, int channel, long val)
> 
> Do we expect userland to program these, or are the default limits
> sensible?

There are some usecases where userspace needs to modify these settings
like in different ambient condition.


> 
> [...]
> 
>> +	/*
>> +	 * Map register value to battery configuration.
>> +	 * As per hardware documentation:
>> +	 * 0 -> 2S, 1 -> 3S, 2 -> 4S (unsupported)
> 
> Would it be hard to support?

As per hardware description, upto 3S is enabled, will remove 4S part 
from documentation.

> 
> [...]
> 
>> +	/* Check if battery detection is supported */
>> +	if (desc->battery_config_field.reg == 0) {
> 
> This is slightly sketchy, but SPMI peripherals always have some ID
> registers at address zero, so okay..
> 
> [...]
> 
>> +static const struct of_device_id bcl_match[] = {
>> +	{
>> +		.compatible = "qcom,pm7250b-bcl",
>> +		.data = &pm7250b_data,
>> +	}, {
>> +		.compatible = "qcom,pm7550-bcl",
>> +		.data = &pm8550_data,
> 
> Are they exactly identical? If so, please use a fallback compatible

ACK

Thanks,
Manaf

> 
> Konrad

