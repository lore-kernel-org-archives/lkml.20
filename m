Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874F64E36CB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065890; cv=none; b=MoTglOzHdiPrxDMuZlgcGyuiPP4zkHWuTkYpVrPDj/Gdwa7rynyQ8+mdgPCdhxHONQyh8Y7FblmjcmCbQaHThJc6eLy/32PS+shXIYdpP7fq3eDZ0Da9uAVTvYG2f4JKhlXUINdDFbMTnZXReKgvAx3AuWdiXJ9948a6jmH7j2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065890; c=relaxed/simple;
	bh=AFxw+K7lzv7pYrWZ/G3VFcRCcPRi94Zq+V199RBe5fE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTuJPMCe1h1t0U8jZ9YAceiBd1CvSbU4u21bkYqi7dtTtkB0h6Ppl7g42A++tPKLHj0bWkqKtJSkHRum9bFQR6L4l1fUMdE89HMXWk2wPHiPcvoOjeCnDdo6+g7NBeOdsMxJrotdJWjnUh6/4m49xG/iSP8Auts9USAXSn0j44U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdhsciG4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mwzwbw8q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdhsciG4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mwzwbw8q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOH92114144
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySfCv8TU3dePxZNOzz5almNTjV7i8r2fPPb3Gn4l2cs=; b=RdhsciG4knO9l7ia
	jweiEwa03+Qzns6n8esY3/FnDnmrEWVztibX2tkDzrEbw/K7OBeqE153klWlGiDc
	RI8wjrxuMOp+xhmQTdmgJmHuGE2tGvM1mNRvJNlcvbsOOICL70yGcZJ3KrT0M32B
	hcz/vXbl5va1CsSLJ/9FbDMMhotYeDGZ9JbPZQMfA0gQYNGjP7BAoviczgeUf/ht
	wlmoxayeSjlgkzUTCZfUOGF1L/eEz2a9ai1ndStQjM/5XolR+iP4GQl+nBCBtbzr
	0qaxcf3vwamlFI+IFj2mGUPq/M2AWQgim34OtCQb2+Q8J0MHvJpk7rifmOuK/iEf
	E3GJAg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyax68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:04:46 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e97167fb2eso53621e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065886; x=1792670686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ySfCv8TU3dePxZNOzz5almNTjV7i8r2fPPb3Gn4l2cs=;
        b=Mwzwbw8qS0jSM7DmgXPg1/fdydoOljUSmNr99vb2NCgYD8MMtBsxAyM6xnyOXXTj8D
         wXHKnP3A9xgT5B3/8xAr2y+9dDCiRQta9wm9uyKydgorfzc8a+1nWCmZijaDUWwT4MQ0
         p0rz+f/zkrV/bZWHKgC0pQHJihofdw3NbJ4bfEOqjBFja4tZ8wS/TKUMuk8mplGgVNdY
         xJenA/mmAcQg4VuswXPbmQ99lGZWyAwtkp0sigUjwhvcsa6ScdcdqqZqW6iX0M5kw3K9
         OMvyiDb5i+TDdPdRHgoZrmZPnDyD1lPHHfiI4sJ0p4u4L2kI2/XYCvobVMz0BOqNV/AW
         KJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065886; x=1792670686;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySfCv8TU3dePxZNOzz5almNTjV7i8r2fPPb3Gn4l2cs=;
        b=BwQFvb3Wd5MvcRSXVGbWkSe5u5PxeZRwhTsgFsLO9MFtrT0aLYaz+1J/LZ1zqnxQ+Q
         Zg2Lf6VAnYg2QcnIcjJn+74t7VeASgZssZe/bIW2I0qyv4hc8i5Bu04HFIlX5zX4D8HQ
         PpOe57DYuvZ/tQlrqDihrQcUp7Zg/MjRspTLmbS+ZW4Fg+vXuWili8eJOSDSpEggM9TW
         SOEI7I4OsuEFFpqCBMMYqClTvJKjHMrUDXOpZdxtWEDzPZ74BHjGknuwhXlIWYC1DpJf
         wWWKP6RWBgPy3gmUPAXy/Tp1RIrRHzcDZPYE99vzI115CfAtT+d01U/LqaGL4aCfghIj
         wnJw==
X-Forwarded-Encrypted: i=1; AKwUvByi4Vw3BV+rpPWAbUQiMTgUWZSaAcOLydzzd6yW1pcvvyaj7jvyTTLt7+lt1JTH8A/5J+g0t4SLjFZlgNU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcZ0xXAxxccXDpNDVcRERtAcaok+TonUw5oqGEwjA3PAtWk6SK
	PomAJJwXe1BeSD9lEqRJpzn+IgPQ+UUQR49lD3IMz8zAExohV1o4rdJY6mSbcDwbLAEgBkCYQor
	hLVNaLMnQwwCPol34YTeoQgKRSeriGvq0Cr8JYmT5c6wKzqw/uM7XwOx9GG5mqZ5f0Gc=
X-Gm-Gg: AYBFou0SZA3f2mgxIxamrTvdQvYQjMfqw86B7BzTgLlrJbC/MGcQ6mL9dgcQab8+bII
	cNNo+gXwOZjCGaN6wHaW3Lnbh2TprjYcZPy29MmFEUuMTAsq0zfDb/C+Ubp7Tah/pX5DNgWbLVa
	NmE2XJdMRe9d+1TWyEE9CmzlrszVQLZUYwmAQOSFcMIc52+wLluULx0QQ/+raOu4BqN8VYZHmeX
	QA/BeFLP9CubVoZe5DGoqX+ZYMq+pT9rDXOrz+fViYveCjuyVmQQlkzGIlnhR/6t6OtndTM46wt
	NXHOu7PA8qjZia/21p9p+I2TZWbr2J7WmUcxllhZCooERxd8U9RNziaeEnIXtM3A4nTxx29YChX
	fD3NUPrOzCtky2WO1tSK4SQ==
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr3878494e0c.1.1792065885618;
        Thu, 15 Oct 2026 05:04:45 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr3878461e0c.1.1792065885133;
        Thu, 15 Oct 2026 05:04:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda043b93sm115554566b.56.2026.10.15.05.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:04:43 -0700 (PDT)
Message-ID: <a940a7e4-95c1-4207-91d0-6aa5e715c2c7@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:04:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] mfd: qcom-pm8008: Add PM8010 support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p05vHr45axftVcZj73wgXk7fugj3j8jZ
X-Proofpoint-ORIG-GUID: p05vHr45axftVcZj73wgXk7fugj3j8jZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfX5USnGs5k/EQC
 xTZ1c7pqlCEgtOZOs8Tekhj0rEQwM7Kz4fHoe/zQv5il0YQcpIAFWZGui+eXG92WWTsvD+/EaG9
 yxLxKNAHdGTx74dQZS3uvAozAAjnRCU=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0c15e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=UejlFaKpO2bYa5uMUq4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfX2BlelNgjowCK
 47lgE31GtRq/rMOxAwn+WS/i71CpUbQ07pWAiPtxnsHQIqjf0eEM6KJgslAXVg6d/NgCYutsnp7
 a9H+AezEZaaHIGa6h9/JDmTEW5sVERhBr0/H7WuRDiuQGsYdg2iwIxxjNK7VYMqEkEUXC3WhbuS
 YsbAFiq14AG4IGXISFOcmQD2kHoToHp2pcGIws90bqFOndlwmenZyveePbKnw9wGWxDrsU6AHX1
 vvJkCivMVEIvaYvZ4ts8euy62eg7+4WIfXG+F8pnp4Q8FHA+l6val7hAT3dvVn6CmWDcD8g+8Yf
 FZHiddAgm1Q+StjTflJ0lXwBtWj1bNLAAuGOV6DrMuXfXXY/sFzVZ5w3i55LAMoXMhbWbWQir/7
 w8sDE6mSvyrGD72lJtMkBfPVluMK3lC2ldfG7Qet5qXk1gaufjyFu+wygaJeRzFzlIvQLHrh0i6
 kz+fQTNPgNQprmL/QyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150047

On 10/14/26 12:32 PM, Jishnu Prakash wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> PM8010 is effectively the next generation of PM8008. The device is
> generally designed to serve the exact same function - power camera
> sensors and the associated supporting hardware.

[...]

> +	pmic_type = (unsigned long)of_device_get_match_data(dev);

I don't understand why you changed my match_data_struct approach
here just to reconstruct the same data

Konrad

> +
> +	switch (pmic_type) {
> +	case TYPE_PM8008:
> +		irq_chip_desc = &pm8008_irq_chip;
> +		mfd_cells = pm8008_cells;
> +		num_mfd_cells = ARRAY_SIZE(pm8008_cells);
> +		break;
> +	case TYPE_PM8010:
> +		irq_chip_desc = &pm8010_irq_chip;
> +		mfd_cells = pm8010_cells;
> +		num_mfd_cells = ARRAY_SIZE(pm8010_cells);
> +		break;
> +	default:
> +		dev_err(dev, "Unknown device type: %lu\n", pmic_type);
> +		return -EINVAL;
> +	}
> +
>  	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
>  	if (IS_ERR(dummy)) {
>  		ret = PTR_ERR(dummy);
> @@ -233,19 +293,20 @@ static int pm8008_probe(struct i2c_client *client)
>  		return ret;
>  
>  	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
> -				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
> +				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
>  	if (ret) {
>  		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
>  		return ret;
>  	}
>  
> -	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
> -				ARRAY_SIZE(pm8008_cells), NULL, 0,
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,
> +				num_mfd_cells, NULL, 0,
>  				regmap_irq_get_domain(irq_data));
>  }
>  
>  static const struct of_device_id pm8008_match[] = {
> -	{ .compatible = "qcom,pm8008", },
> +	{ .compatible = "qcom,pm8008", .data = (void *)TYPE_PM8008, },
> +	{ .compatible = "qcom,pm8010-i2c", .data = (void *)TYPE_PM8010, },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, pm8008_match);
> 
