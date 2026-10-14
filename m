Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8934FE2F3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988725; cv=none; b=Pq8KeBwDwGYlM8LT0HHXQL6QzdYF2hMDrjkxrpC1j672NkwKm8/ssyuqY6oI7r7AEZkvoQRvygN5w7+ZCIcW6kqgEJ4p6zL1HSbaxICWhrskecqxRfEGHEBRvL5cRgHr/+LU/xNKXdIZkTp7VJAG1Pyoy7Sel+kYVY3DgPZRzIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988725; c=relaxed/simple;
	bh=qzP2QIKiECGaV3pF/xr7NmYuGq2lZLjrl/0RZ6n6Tck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HgQO/7j79T3WCGJCUHSKw+pKI25ibGe4b3dCLjAxRYR5pjdJKTax7NSsKjTcBjokEvhygXbYTs4cbkEyrYIVRZORlHJA/+bNog0sD8KY46L12vxLJjbSP93Je3399QGoSdqzLcIicHUQXzq0Es7Ow9n0ThQFHOXGV0vBqYnw+lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFLcu0hn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GVuHtnHo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFLcu0hn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GVuHtnHo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEcb7D3209612
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kQs01tpGJH0ofScJH7o5f39c8ptAYJutVnkeKPc48Ig=; b=FFLcu0hnCyvful/a
	5MLerG8b2t/XoLDjPurN0E7pwzminACUrk8Sh/kcUpNy/AO6rHuKiv2TsxT5JZ7u
	CFQDV0K6mjPghnCIYrG88+c6kcajW9ArEj7p89yUMeF/g71JzyR0Q2HdQmC+7hsV
	7qTpDtNbRTBYrCZp+p3euljcBdavOw9lxpKhIvWqw+T7C1vCa+HeIkfzP287Hnw4
	UHOefir2WZXQjd2pD4EoWlXEddocjRlk7fzAjyaL1dZxJUjHxCRFvTGP4JFpZc/p
	rbxAeQrGpbvbFZx4PgCSonaXsfI8/QfrR0nHCQwKSOjKGm09FVQEC5sPqO01DQJ3
	cG6fBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6by60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:38:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea6b66e53so66856285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988682; x=1792593482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kQs01tpGJH0ofScJH7o5f39c8ptAYJutVnkeKPc48Ig=;
        b=GVuHtnHo5Wk5KwJIjBVkQwLVjGYhmJWfE4wk1+CjW9e1LKw3921aJ5UEd4dEgbIkVO
         Y0pK+x+02D68UX5U/2bm+hBz2E5sHtiZ9knOgxVfc2nPGbTHU0r6AJXL0MAfAhqxIuqo
         9ifrAmcMlM9Fjrf46izdLxqyIzX0+azeB2i6/B5Qq8Rz+X8EbBoH47FXuSlw7vITbyYJ
         QU91W3bU6/43Zzdl6D3JHwmvcTxDCplo1qLG/kqL0LSPAQyZYzPAus6HoqwCR/XobkhY
         yxTt1BaQO+R+0gz1JT40FjhCWyaEtK/OZ2PttM1G7zNcVk53RpMVPj7USOEHJjiFXHdW
         O36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988682; x=1792593482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kQs01tpGJH0ofScJH7o5f39c8ptAYJutVnkeKPc48Ig=;
        b=dd8iHPoMUwwSEYuPQF3K5IBlXCPnluiyJ032bvsUWANaWVpW5FCP6KW105m9L3xCnt
         bvzvNu662c98qqp0amF7Ieg5xNIAHrPZ8PvwCE8NocWj+zDfQF2Lvwghu9KDCCpmkZIf
         RTl+nQWCmBTm6gBbPHNYUVb5jyvcenqJOWd+tL6j4WtWeRvIBcuq4bRQfH5tHKTBqpfj
         rPxiQfQr/qn3M1IgqB/KBYm2Dtayoo6eXUhDq6gwkXTQdEKNT2e3bTtWDLvV2TlU74Pb
         Wp9pHlTc4MvkgE6CPWHM64vVHniz/3ZrjCi0XBKEClz/az1UmwXXGjZ/aPIGPvMPcYFL
         zaPw==
X-Forwarded-Encrypted: i=1; AKwUvBxrDkq1LKmoDQLQO8FoJ3pQ8lxBTywYnoj02bdCWuynYfiVKlARprmMhZRfvkHCEtaIzZRQLOwTyFwZJsA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDnoX7/XtUZj4nRaqynAqWNj0ZQQwGqYlpDBVqAfyya8jKqSfN
	i3HakrvXEXEX8OCBsf45KVJchPPoO3RXXUazhFMGftJNfYXmpoyOGdAzlHxZUVQWKlE68YZnihk
	DIcAsfTUBATJLgcYD96XmH0mbHohJw0RnsVanHEWz+rTMA+dA9CTYNZD/bviKK5ofKEI=
X-Gm-Gg: AYBFou2hf9o3zrkdok6uqmLLY0NaSzTzIhxeJ7GqPADW77CtPAo+FYKbkQ0flrDGJVy
	mbI2PS81pia1dHxwYEeMt2rK1ZabzOGvLshewbNG30NaNbwDKdYiZ5MEI27UNn/ICIOc8kxFMEG
	0LwkJwQsal0+kzW9ptusJaxFFj125oBQ6njy5y0XugL78AmrGIpzXzAhqJ3UXUYEi+lAqZ8lDLt
	pwfO6Dj0nXpOc6SeDXFG/svhJxlLclocSO4o8EPRRL56dKXrIo0su7/swYPRyfMegE4sTn4G9ZR
	sEGlPGkdAOjRwTKK+CBgkEsTXdu1DtLPK0BCKjhkOE3yH+igrBwIOI+SzjcObY1wtJTTBvRtRZh
	lQ81yDnNrbEpS0mJWhPSaqg==
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr3186841985a.3.1791988682204;
        Wed, 14 Oct 2026 07:38:02 -0700 (PDT)
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr3186836085a.3.1791988681679;
        Wed, 14 Oct 2026 07:38:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203862c4esm1266980a12.16.2026.10.14.07.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:38:00 -0700 (PDT)
Message-ID: <5c87c231-6c76-4363-9f4d-6c43dd63ee9f@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:37:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] platform: arm64: Add a driver for the EC found on
 ASUS Glymur machines
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260923-topic-asus_ec-v3-0-2bf3bb9da879@oss.qualcomm.com>
 <20260923-topic-asus_ec-v3-2-2bf3bb9da879@oss.qualcomm.com>
 <d20f4159-de71-7e9d-46a6-5953364937cd@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d20f4159-de71-7e9d-46a6-5953364937cd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cRKjmIQQMM0UN-blkgGz4bfx3vhiPwAD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1OCBTYWx0ZWRfX0Ynxc85x7ePd
 CNdR2dhRVKCMwqZHi+YSgjY1NbyE5/D6eopnmUWVNBltWTOJ3za7AZKqcN9C/giVEy3ICXdNUd7
 1SnPMeVJknU/DJTWe5nOsqUplAt95eY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1OCBTYWx0ZWRfX7RNyGgSAzo1U
 M/W+BIcpjeD5NwOpcLFCG+Z6o93wtLVY6IE2rsApXooQRwudb5oEstPZ673rzBZ5cxOFDNhJnX1
 Qm5LwMA+S+HISa/lPBgUOCpYk/Er0Owim7EgwHsObKJVucSG9jFgKDXKwu5l/QwDPODqFnOdhEU
 sLp9zbdgWetAI0kdSxe/MwLf/dAR+yd8bOcIyR0eL7plgEXQM3+snLtCv62bhwYiUdX2MTWjKIz
 tvaWmdRavZAM/vKXQatmuw/aYU44F1nk5B7evGq6snCcJpHasrMHD84UEQByV5zzTiSQyW4oUhe
 fgQV5SzcEwznUih6f2+plUKDjvexEoPUdvpRLrAspGdkBGkOYEiAnMvBRxaz6xWh96j087QDSGo
 QSFzn1c09fFS0JiX7AbRLVZeajVe1z7+57wb+0mjalZaB8sVqSt1s9vuRoIFbgUNMZUHhI8sIBh
 E6dzRfHnX1xWyTuF3wg==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf93ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=WnbzyOWOUeW_Ihyr:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lMiqTAaMOTRiM3jXlLQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: cRKjmIQQMM0UN-blkgGz4bfx3vhiPwAD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140058

On 10/8/26 1:28 PM, Ilpo Järvinen wrote:
> On Wed, 23 Sep 2026, Konrad Dybcio wrote:
> 
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Some Qualcomm Snapdragon X2 Elite (Extreme)-based ASUS laptops (at
>> least the Zenbook A14 and A16) expose a custom, somewhat
>> Qualcomm reference-derived EC interface. Introduce a driver to
>> communicate with said EC, allowing for fan speed reporting, keyboard
>> backlight setting and receiving of a number of miscellaneous sideband
>> events.

[...]


>> +	ret = asus_qcom_ec_write(ec, ASUS_QCOM_EC_RECM_OFFS, frame,
>> +				 ASUS_QCOM_EC_RECM_FRAME_LEN);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = asus_qcom_ec_read(ec, ASUS_QCOM_EC_RECM_OFFS, resp,
>> +				ASUS_QCOM_EC_RECM_FRAME_LEN);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	*out = (count == 2) ? get_unaligned_le16(resp) : resp[0];
> 
> Same problem here when it comes to sparse.
> 
> Does the ec really input be16 and output le16?

Yep, it really does..

Ack for the other comments

Konrad
