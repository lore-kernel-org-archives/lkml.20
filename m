Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E41F528433
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070839; cv=none; b=FEYerhYnTPo5TIjVcAtcNpbfa1JaUOsG22UWbHZJPy+LlbsW44p/n6PkWzujvIKEKgOHa1yU/s84TrkhWiOIi00mKSrYWs7dT5iGDCOBXB9wVhLDMZbMh3WjDc2JOgFHoWItxnFQ4SBAatAuhn4tIP1YxWBBgUzoj7zXsc3sqX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070839; c=relaxed/simple;
	bh=43d/IfQVGd0ktFWwh2ih4+KRV9k/SSk0R5GiuclYlrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Retvmp9Jr8Ns8y8KXaFSkHu45nxTlj6xUgtEibcof/MugxCc05FkaCTXVNFVwC7CJJZcCme3YMhk4hCI513pCBULWxmFbgAXLjHyDhvtX7I8YjlKdM8PHoIqv1BYC1u1ySU8pFjhtUl0mBTp92IsMjw2r7c+yzxGHxe3JSgbSEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URXVUZpM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZgIKgIv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="URXVUZpM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZgIKgIv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jT862809323
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gGSmw4Qk0kQC5B4pGDw36PFQPUykZhpZLLcEgaeZJKQ=; b=URXVUZpMb+iTSGzd
	FhgdBR8fbYC6wbxrWrKX7KR1VfZMaEJdfTOFw9nmcbnlJobC1ZnlHKevcBO7MAr8
	Rl/YGxro7eMc9g/P4VENTjqF1PZrrMx1BjAoHm6MIafJcGHfmt+ywfPpwS9rMZvk
	YIEByCDRszRmsYJanSDKpQnDRea9Mi0DD1N3ZV0cVR2mOFvwUwOzbhBWaf6ZjSYc
	W3flCtHYVQ9AHTVz+0bGWF/rqI0y//P6eciFqZscOOOQl6tDNk0KgFpDmvKX+L9e
	ubyPHUoG//9i8SGDiAVw9MCqS14/I9rGm34ugmLvZdimuarYLkU1Hqx11bjFSZnd
	Rb36Cg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54tsrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:27:13 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5e97167fb2eso58412e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792070832; x=1792675632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGSmw4Qk0kQC5B4pGDw36PFQPUykZhpZLLcEgaeZJKQ=;
        b=JZgIKgIvSvYC/HpnvE5baG4AziXZ03ooZLYjEOova+oaa4m8sL8amdcnyszXQB0DxU
         kwJulSznKq/kYDfs05Z6vfOLYaB65F7VfOKrLOYEadytqB7jW+oTlSac8rF96dRJWw1s
         xehYASqQkSRpsOvqciuktHsW1NfNarTOnPbtlLILq9MjUnkRHIB9vdc5pWknSvQxYbyn
         IYFwctjZ1iTyRrru5/+rhL+O6j80xMR/eaM6M016XHTDWdB1NcwITGBt3oBhAbC8vvVF
         JTEqjuiRNdUNHhL5uAg7p0ulZXbBz/LhG6uwoTZobc+aiLGT0lqt0Uu/0i0+IOx5ne1c
         x93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070832; x=1792675632;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGSmw4Qk0kQC5B4pGDw36PFQPUykZhpZLLcEgaeZJKQ=;
        b=HwNKl2ucIhEtkMAAMebtC9RAMofe3WTtzPlLCbUG7WN8sNp9w5b1dccvyyptETtSrA
         0TooKpkOQUifR38fPYJeTmOKQnGj8AHCc/ENs3MdkXP5YyOFE5E7ZOuRF1a1MXvrOCJq
         rrql9m8zvaLi8GM5u6/A0Qe/rPL9jS0++Z7rzJP7wEK0olf3XfUH88bDHhYP7D9ZioPw
         gpRVH04Nkobf9rKpyoH7YwNs64IFekJHQpvoCB0GnzdA8zYPiyKsY+dq3BZ8qM6TTGE2
         /0rtQToLlRDlu/EmqKG1za43iYucPvIgy2fwX6mWvFW/Z3CCoKa+T8gD5SQFNuWAIDmt
         rxWA==
X-Forwarded-Encrypted: i=1; AKwUvBwhNdgMjjiC2dOWsKKTqcKjBD9XiMK5+pMuqkS1VDJ6xuJVwj4gAQYUxNfX4i7is9kQIM2BfRo0Y9Z8CCQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPV/XNZkk8oia+4wAMAvwmVShw67NnzUjtEqwerl/e3sB3mdUJ
	gm67jG4HB4/1djXN0WiEP2OPdfc1xb1NNaCF1KKxCMcU2P3SmVnhfBVltjZk5qi4vRPOnK5U1GA
	vTOP7pVYpHxiVkyXZAnUG0EDm6OW3Hfuy+ej81ia14LXrzAbRR7uYp4x/CQRQ1uRfQFE=
X-Gm-Gg: AYBFou3vHfB/9kw1acykWDLsW/dw4xePTdrZnqqnkEX9w+1LHJ4J4NYdJcgNiuZUJZy
	99HEF68UJZyV7tKCV1sg9I6ZE42+j9MaQDrKj2hzBwDH0DqMTEPTMa8Wzu13PcF95j3PC2uaG+S
	MRTDD0vahcUAXNBjVNzrPm/U3tghRYOh0d/cR8Euyn4x9qhf1KMjgfdObT8l33LhDNgZixrAJTI
	emKnyx16ykuhdc4k/zcwVf4WSRLl8MKcmK1gakBNnvXmwiTLu4YMTcA2tK3OqbLEogY+q1YsKC4
	jZC9+5dRIRi2hZ/efy4Y0cMqJ380Y+1zjWVJ17CIc+zfcNSj6JV0DkmnTgBiRl47c8vgdF8PEZf
	IDnCfEoxjNHu38IUbotC5Rw==
X-Received: by 2002:a05:6123:5c4:10b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5e91f52a44bmr3913994e0c.5.1792070832457;
        Thu, 15 Oct 2026 06:27:12 -0700 (PDT)
X-Received: by 2002:a05:6123:5c4:10b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5e91f52a44bmr3913981e0c.5.1792070831845;
        Thu, 15 Oct 2026 06:27:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda62768fsm125977266b.73.2026.10.15.06.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:27:10 -0700 (PDT)
Message-ID: <d3a67d47-9072-4094-85a0-7e1b75e08314@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:27:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] power: supply: qcom_battmgr: do not report power_now on
 SM8750
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-pm@vger.kernel.org,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013002124.332111-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013002124.332111-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0d4b1 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=AUfae7s1ju6HdZB4z7sA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX7AzZIhF0KcYj
 cLj4+pKgvvMVn1SawMRJJ7PHY6FGKn8afEckg2VOeOmvVHrGm+dDZ2/aF2KNsfUzW+bI5LSQlyF
 bbNdI0InboZo3eSfwxVjlpsarB/Tkl4inJVNdqRyoKPiaCQX6y0fVz957P4hXHHTyQhrtI+jHr5
 kD0WU4pQYVukSesC/UjZNCun2OupQpyy3immv7yAhBzc3+mEEBU2DmyCKI9+0vURQ65gaHmv8gR
 lRMEvPcKCkIa9cAbuQzM5yCvhO4WBvBBfO5SHUJSXBoKgT8y1H9hTtSz2jM1DtNBdd/kr7GjFIz
 cfufYRkKfhFC1CE95yCS8LGBLo3cGKEVsIy6pS/aJpYuYPCDPA2Riaz+uEfDmd/PBIxrCtoOYO/
 IeX/OpiAou/gWTrn0jOoB8Q+atsUpQaKzFzncLcl4VehQkvpQJoRaON0Etbc4/+5uHHc3HDeUzU
 57aDCRpA7+P5pcI4ePw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX80xCyFccgYgD
 3e/qaDZdwxRqWdeNjMDzzm3nzhJ8YD4L7ZsYPqM7227GTEomv0yNZeKo9UWE5DlUvXpkTuw6kQ1
 1g9mwaatJOmlHBX0T/3mEo0iQdcbXlo=
X-Proofpoint-GUID: 71ER5oBFMu1lXGzWTs_BRT8MPoM2prwb
X-Proofpoint-ORIG-GUID: 71ER5oBFMu1lXGzWTs_BRT8MPoM2prwb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150053

On 10/13/26 2:21 AM, Qianhui Xu wrote:
> From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> 
> The SM8750 QBG firmware fills BATT_POWER_NOW via its maximum-load updater
> instead of an instantaneous measurement: the property getter indexes
> context + 0x6a8 + 4 * property, so property 22 (BATT_POWER_NOW) reads the
> offset written by the maximum-load path.  Exposing that as power_now makes
> userspace report e.g. 89 W while the battery is charging below 1 W, or
> above 100 W while discharging at about 4 W.
> 
> The SM8750 PMIC GLINK node is already described in DT
> ("qcom,sm8750-pmic-glink" in sm8750-mtp/qrd), but the driver has no entry
> for it, so it falls back to QCOM_BATTMGR_SM8350 and advertises POWER_NOW.
> 
> Add the SM8750 variant and a battery descriptor that reuses the SM8550
> properties without POWER_NOW.  The property array is reordered so that
> POWER_NOW is the last entry, which keeps the new descriptor a two-line
> addition; property ordering itself is not ABI.
> 
> Voltage, current, charge counters and the charge-control thresholds are
> retained.
> 
> Tested on Lenovo Legion Y700 Gen4 (TB322FC, SM8750P): charging and
> discharging, UPower state-of-charge and rate are unchanged and power_now
> is no longer exposed.
> 
> Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> ---

+Fenglin would we know if this is an issue on all SM8750 devices, or
perhaps something OEM-specific?

Konrad

>  drivers/power/supply/qcom_battmgr.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index 7716eb9e1a..dbc98ac8a7 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -24,6 +24,7 @@ enum qcom_battmgr_variant {
>  	QCOM_BATTMGR_SC8280XP,
>  	QCOM_BATTMGR_SM8350,
>  	QCOM_BATTMGR_SM8550,
> +	QCOM_BATTMGR_SM8750,
>  	QCOM_BATTMGR_X1E80100,
>  };
>  
> @@ -916,9 +917,13 @@ static const enum power_supply_property sm8550_bat_props[] = {
>  	POWER_SUPPLY_PROP_TIME_TO_EMPTY_AVG,
>  	POWER_SUPPLY_PROP_INTERNAL_RESISTANCE,
>  	POWER_SUPPLY_PROP_STATE_OF_HEALTH,
> -	POWER_SUPPLY_PROP_POWER_NOW,
>  	POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD,
>  	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> +	/*
> +	 * Kept last on purpose: SM8750 reuses this list without POWER_NOW,
> +	 * see sm8750_bat_psy_desc.
> +	 */
> +	POWER_SUPPLY_PROP_POWER_NOW,
>  };
>  
>  static const struct power_supply_desc sm8550_bat_psy_desc = {
> @@ -931,6 +936,23 @@ static const struct power_supply_desc sm8550_bat_psy_desc = {
>  	.property_is_writeable = qcom_battmgr_bat_is_writeable,
>  };
>  
> +/*
> + * The SM8750 QBG firmware fills BATT_POWER_NOW from its maximum-load updater
> + * instead of from an instantaneous measurement, so the published value is not
> + * a present power reading (it reports the maximum load, e.g. 89 W while the
> + * battery is actually charging below 1 W).  Do not advertise POWER_NOW on
> + * this platform.
> + */
> +static const struct power_supply_desc sm8750_bat_psy_desc = {
> +	.name = "qcom-battmgr-bat",
> +	.type = POWER_SUPPLY_TYPE_BATTERY,
> +	.properties = sm8550_bat_props,
> +	.num_properties = ARRAY_SIZE(sm8550_bat_props) - 1,
> +	.get_property = qcom_battmgr_bat_get_property,
> +	.set_property = qcom_battmgr_bat_set_property,
> +	.property_is_writeable = qcom_battmgr_bat_is_writeable,
> +};
> +
>  static int qcom_battmgr_ac_get_property(struct power_supply *psy,
>  					enum power_supply_property psp,
>  					union power_supply_propval *val)
> @@ -1617,6 +1639,7 @@ static const struct of_device_id qcom_battmgr_of_variants[] = {
>  	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>  	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>  	{ .compatible = "qcom,sm8550-pmic-glink", .data = (void *)QCOM_BATTMGR_SM8550 },
> +	{ .compatible = "qcom,sm8750-pmic-glink", .data = (void *)QCOM_BATTMGR_SM8750 },
>  	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_X1E80100 },
>  	/* Unmatched devices falls back to QCOM_BATTMGR_SM8350 */
>  	{}
> @@ -1690,7 +1713,9 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
>  			return dev_err_probe(dev, PTR_ERR(battmgr->wls_psy),
>  					     "failed to register wireless charing power supply\n");
>  	} else {
> -		if (battmgr->variant == QCOM_BATTMGR_SM8550)
> +		if (battmgr->variant == QCOM_BATTMGR_SM8750)
> +			psy_desc = &sm8750_bat_psy_desc;
> +		else if (battmgr->variant == QCOM_BATTMGR_SM8550)
>  			psy_desc = &sm8550_bat_psy_desc;
>  		else
>  			psy_desc = &sm8350_bat_psy_desc;
