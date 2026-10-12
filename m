Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0351244F574
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804716; cv=none; b=B6GVcybJ1gDDeuneYVWEHw7CY7o+JGUwMQ9X8x3Me6udZqcqQ6mvLRcwhlABETBRr811aCZ3DrX0IEO3Sb4tdYcknvF7hRWFOtS0wsJx7wm5+Ks1e1KUNh0p4PCKJsYAMFc4FYk29LLgLTlAMABgh/90NOf5xH6s2+UZgNT/iPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804716; c=relaxed/simple;
	bh=JUrzZCqhpr+6E+MrqT462051gDoUBC8OqfAEbMmtKk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YL1dHeQ3v436JnVgL9rA2PcGgsqtOLNBxpmvc/QK4p14O/C09EeIvoNSXbYNhtc4uCyctJi1uTOZ/iR4udF5/ULNsQhUs5lLs7D1yx05AHqsS0FSsUtpwF3PnGBGDONo4nbNqs7Jq75R081swNGHa43cfTxz6Y4rSCoukwxtgMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=duRWL3Ce; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6+GV2tH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="duRWL3Ce";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6+GV2tH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8cejB954961
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HhAsnUJQR0XtnLbL9uGATdXzBNkrKbvYlxu+kfkmiW8=; b=duRWL3CebqWstGBk
	LhiyhfPk8Z3WHzzyHSmiLSR0RscJNhZXVAMK+Yn//PiDA/qa5OCvtXlOaNw47QYR
	/OXL8m3Exx3xRyw1i+mRLPNDh/t+k5W5hRCPmQt1cL09xzadNR9zEpIQBqpajEyG
	3NKhmc7pDldIGWHcTt3xIt/6xaedNdCzio639P6Gm4xh/mVZxASetH/B3JUlbN9g
	BgtjZKmPqWpI2Zn6J98q5PrACqPXzPqBkaEtqe0NihiMkb3rsyjm80ZrMbAZ5ssA
	sU7BB2rN6IqH7esbaOLMjNgN4rHNMkNkG/5xXExFmPyfGbW+sIVYzUyW6JqzJ8vQ
	bu1zfw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kruw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:31:53 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5da7a39e589so35851e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791804712; x=1792409512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HhAsnUJQR0XtnLbL9uGATdXzBNkrKbvYlxu+kfkmiW8=;
        b=Z6+GV2tHJiN2xVqghhVAVonS+TAj6gttGHQChOsQfowXJewIDn/SaAOv0qYhSop9zc
         uE+QvP7wOwcasAdF5muL2kLe7VlOKCl1Jjdv+zhAnwJ3HrMaqbSYoAjGWfE8XqYnWyqi
         oz60JYiqztr07e8FCKRTO6D0U+PpYwGX5/ud25Pa6x5w5+POY1qzgrBzdc5/0yWW0Swy
         9JdzMM1Z3mqv8iTyjPKSWKEzrkMzb2vXok342nwYsrdYb4rElBvTqB/ddXDXUoWZGW9I
         bHhT10XdSSTJlsoNZ09ApZGWAGROCydLqAfHDd0FSvWtmxFC5zlt0tKU1YUkWWQmlwqT
         rqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804712; x=1792409512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhAsnUJQR0XtnLbL9uGATdXzBNkrKbvYlxu+kfkmiW8=;
        b=eZBJmjdCA1ZruFojH7K2bSf4pBZZvPPiaDpQTwNuF27GBTxnoOt83jQX9T8U+LPHtl
         PW5nPhEvFabOrHZuRfy/OBvN0XZvBJx/iuLc161WcL/e0VV1Ea3sdmtIOKNVDHyF3nWQ
         zjBHz3dvYXuQ9Y7NCE4FbMu2ohtZXTqbU3zR7d/YMp2TtsfGnWOStnlXVGO5p+cjmImV
         11dZg6E8X2vivWuQ3KqHzTmXZJ4LafSE2ETqEgb9cTGwYdnlLe5Sr0wBTGFRGx7djh0l
         9BrvtVwecuwKjmckF716nWdlD8vM8zLCZHINz07opPxA1VzFuW6P935knygNvrAXYR1x
         zygQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYpzzZkbhnZTvRvXq0FVAUPxv/Aw62BAwfGpC6oZdwWHi3vNKj4FdXFkGvhMUqFY5EC7JGXLTqyKnV9WI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbjONXun2UOHLKeDWxcJwS/H6R2JKufOa+IYxcebS3CHkxfqOO
	jWF/NNN0CVH7v2sOw0/vOuh4z8YJzR+NOGOzneGdy7AqMd7hhdbT2+nmeVYphNzHSujKzc/rE4Y
	L6Gfvb0boBw2Dm2aCsNgKNEfcUVsgisQmw36tds0g1AlCv6LwZ+YpHi5tlgBbJS2DjR1gXcDsPh
	I=
X-Gm-Gg: AYBFou1MmxYr0TNPeAIue27ude65sgJr++gieBIJRMLJ+O1WzPO19yv3xyYSNLMldPw
	YEyVC4nKKoR+bG195ZpcGUdwO4HSo3xh6YciP2Zg9pTkUsSEPkmMvIYEPkiSUFQ0fHMPHlSsqfx
	9qqPDTvmm1ggM9Qm8QKPNMUEZq6A90hID3DXMpwKRPGdUcngqk/MesK1BSWKeQ5G43x/pkHVrEW
	VEbw7i2bxx5zPeiU0r9MUw+bKM/HZMQ9MJ5gDx6snp2CivcRAuKkEWzjqtCfwTf1j3gYVJgVOa+
	4U7lyB+zet5e0P4pjW9LJ/MtITURSDhZIpOG7YJ6G+O+K6AjSf9r1sxsGs5hOT04yFHTW7RGKwH
	JiGvXaxB4wQodSrFBomQdUA==
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1210574e0c.3.1791804712076;
        Mon, 12 Oct 2026 04:31:52 -0700 (PDT)
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1210569e0c.3.1791804711604;
        Mon, 12 Oct 2026 04:31:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c344ab1453bsm157724566b.67.2026.10.12.04.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 04:31:50 -0700 (PDT)
Message-ID: <3a5ff85c-0629-493e-baa7-543958764219@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 13:31:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
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
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfXxYepKstT/wyN
 XGgNneLF377wd92iA/N+wXn0LVkHK6+K3KUR5lOtbH0g/PYTPsJhJGRL3m7tBbTe9xCLMItCax6
 avn93z/6QZjEb85TqpwgZHIdsxAVz6M3gg76vziBlk2uLOFB0kJa8Vg86Dk8Bo+vzve4/kO09dw
 AwH2WugDRJeT5IuXKeoqQ7iUabH5ztVF0FRTGUTmA6htyr7jtRgp5AabzYg8LnC0gLSoFMSE9T4
 S3g6RKMqTj737jNZVBG8u3BMXfCL9x58UXyaDMiD5eoFcALorkMvK7ds20VnA0SqV+lU8WNZnBP
 TABmjBI9BYnpoVpu0ReZ46Xsu1g83wv7w0kE8diqOvFqwZDkw3PVMWZVjXJHOa0T5PDH4QaRjua
 FYykKcHZdhtDkGVaVvrobJz3GXG24wVCiGtPQKlEoUS7DIZjfe1XmePxIVdh0WhFEcR0w9EVOY0
 8HTtJAzQFxHQvUU8wPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfXwo8ei567sCRm
 vy/aTz2d3OJtdljHQx9b47StXKxNK5pGVQNu7FJiQtFLv8Zha4FQgchtj3PVQ+NvvFempVuvlcj
 qHpoGoO1FoAB8zfi9G4dSRRv9b01XwU=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6accc529 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Ojr5x5PTsytl4pN-IXcA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: oGaAUvkOTxnELV81DZvN_IP289bJ6Pyv
X-Proofpoint-ORIG-GUID: oGaAUvkOTxnELV81DZvN_IP289bJ6Pyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120045

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
> hardware monitor. The driver exposes battery voltage and current
> monitoring through hwmon interface.
> 
> The BCL driver provides
> - Real-time voltage and current readings
> - Configurable threshold-based alarms
> - Interrupt-driven notifications when thresholds are exceeded
> - Automatic threshold management with polling-based recovery
> - Hardware-specific scaling factors and threshold representations
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> +struct bcl_alarm_data {
> +	int			irq;
> +	bool			irq_enabled;
> +	bool			irq_wake_enabled;
> +	bool			shutting_down;
> +	enum bcl_limit_alarm	type;
> +	void			*device;

Why is this a voidptr?

Konrad
