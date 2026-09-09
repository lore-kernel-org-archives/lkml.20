Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4C254CF7B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955074; cv=none; b=NHOqDD7c19obZW3g8nilmMogY40ad/MNbGFByQZj91gXeM2BDKHd72r3GjKOc2xS9BNGHKXJP6LE854qKvoawxHZuOd3TXgiafE99vyeNKIgSv0WKWOmeivKbWyXRZCSdl+9WrJm0ZwJdHm08/Fc8kMPckgOld4vGsVJTF7bdiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955074; c=relaxed/simple;
	bh=lvHuBtyH8PU7WAC9E1zAzmSNFh7r/i19FyIT1zoM1w0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofCiOsjMPIqq5lSsGivMe/aKOfVt/wHKd0LWukeltlpbTusZvA9tcPZ60tmNUFTuL1WePPblstNCZWMo5qWQaaQ4t6T0VqeotCSN7BLr4mYjdLrQFHih5poDpvMR6CITzQgEI6QLHW1qBAQ6LZyXWz27xMP/7a5435I5Gyuq3OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5VDNKJm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BLqF2vqA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5VDNKJm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BLqF2vqA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUCrl2019456
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PWcE5nOjG7EYYp/TKk7d6uZY3yzA0oSkS2vdFUfogW0=; b=k5VDNKJma4gx7N2M
	bNVnCgOFRaeXbZzGItFtTmYpTv/gBSXOTIG+gOJ7tCdewnPFmTduVh4Cg6/dhKCY
	HAhJQyfQiWH2DVRHJYIWRKz410iLNuLH3u9cMEE5y8VxB1SjQ+CfwTQ7hfIYCZSa
	2ge4VK3Jzo7OsRA8OXKd6Hfr1xLTr8qzkSdW/ooSf2PoHtEHuD2vgvzlw7GpDv4X
	pqIUG8ZhkLV9ezcepSAPRlJSzXwmlhY5mmaLuqiSpLS3wNXu6utg2sWnZ222Gsfl
	dFhdO1kamLsCmebm1m9or8XcSM7NRv9FfubiUSS/JJUsvPkfkzJIxs1MCWPe8eRx
	2O3Oyw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x87ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:57:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so113557385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788955067; x=1789559867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWcE5nOjG7EYYp/TKk7d6uZY3yzA0oSkS2vdFUfogW0=;
        b=BLqF2vqAL9e8rczrmOR7yvFhgyTXi4DJxBdD+4x9rBH6/BJ4Kjw946fKeonfMsiCPC
         8elCo5mze/FCufQ2m0/XceGBY6y21kEg1M3kZuftiKQmegEFoh04o+JHH2dV7qt9uTad
         Z4typTeTf4hZPzkilhMY5zC9BF0kYalG8u7H5+gOQGRUE5MUtPMKfVnyKOL2HnwKUG2C
         1Qa8LWiGVFFfbXsu8/45MU2Cr+1yjKcA/mLaAKbAXtLgfnn+FWIusb+udOrmgbr/VvIz
         XVV/TvIwOL2ECjBYVx8zXlY5fy9ipaHNLCJsn9ZejpIuGA4p4KuVUhSVejMinosQELLH
         X8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955067; x=1789559867;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PWcE5nOjG7EYYp/TKk7d6uZY3yzA0oSkS2vdFUfogW0=;
        b=FqdhktrEEymllS3y2XBKAlNEveBHj7wNZoFkZAbuTzT3oF2LhjcJiBi7MxxPbn3QgA
         Qy23v4FqyNOfBfjpVf7hE4VVLkHa+PPLh9oJiCumXA1gL9ykYlvWfZULBAcNBx4oKr4/
         SjlSqJnVf/1yJbiabB7mmzWlP+APy52KrGqdyhGAFBN8zjJ5P5JPAX5mUNbmjzfz4R+N
         SNCAasrlYPPi3W9gBms1+AJ5VMaIYTXZXZzfOUiiab5IoWxawJMxDtxZADHIPh7vAD34
         V+RAUYpwUa9wlKWUALgAGwKpUS8+5bco2bm4cpCA4ggXY+T29T1nf9t9kdQQpVw+x+2Y
         X0iw==
X-Forwarded-Encrypted: i=1; AKwUvBwBD6iz7eTWSAddZ9B7cfmXWyi38iL5RMrDf+0bm/0Np9eeswn4Tpn22jcIgMIH4NaPmJall/B92wQWTfU=@vger.kernel.org
X-Gm-Message-State: AFuF++k5RyijvKYtFkglavtHeFcgd+TShuDzM+RzwPklU+vWcOaL0UQM
	Wwcic24vZ/mIEYPIgWu3K7dZ5g0JVjAWQKmTLeaa7CJn4NPp0dOAStzajc5zy49yvIsP/uHmbLP
	S50MdhmLmCsxbP5zLBwt1Vz8RAIkycRAGLeiA4E1p2yRUu0evuhSD3EVswvZgY4eyZTk=
X-Gm-Gg: AYBFou1SFF7wTDPBlJjBXJtF9WCt/PvSC2v1zWrWuSTFo3kwQbyfnGw/ZVt0Iz8t9ca
	O5NgWGyKQ4R5g2SQKIssq4IjiqSZPj2WFCzksv1uV3XDY6gzTOiEjcpU/9gG0uyzyeht5tE7jU3
	LhdbMMWINTZwAhi9/vkmNbKcD093qYvV0wUdNF2NSrM68n+CWkfUxuLHl/HfgMtVx9yswhrpdpN
	GDPINaki9FU9Fd5tcHxCK9qbs2ZYXUddcXHPILs6HzCeM5Bals/5yz182i4JtM6UoIYhUzzU1vl
	BtmpGHG//TqPmECza0+htKnLOaUOch1D/MqYwiiLbgkPVEhS1SKeP0VeQpCvpRMpbjCu93Io+LL
	jkk24wq2wPN3gcsHVwrDLJQ==
X-Received: by 2002:a05:620a:9c4:b0:939:9205:4d78 with SMTP id af79cd13be357-93992054effmr1798964085a.3.1788955061604;
        Wed, 09 Sep 2026 04:57:41 -0700 (PDT)
X-Received: by 2002:a05:620a:9c4:b0:939:9205:4d78 with SMTP id af79cd13be357-93992054effmr1798961285a.3.1788955061188;
        Wed, 09 Sep 2026 04:57:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a94f2e167fsm1614641a12.26.2026.09.09.04.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:57:40 -0700 (PDT)
Message-ID: <cf856c97-ea82-4a33-aa9c-57cd317e5b79@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:57:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: glymur: Add ADC support for Glymur
 CRD
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
 <20260731-pmic5_gen4_adc-v1-6-9c49b2eea6f9@oss.qualcomm.com>
 <52c023c0-a61f-4116-851f-ed19de4d23f2@oss.qualcomm.com>
 <695dfc01-2c1f-4503-9049-2ae266774ed2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <695dfc01-2c1f-4503-9049-2ae266774ed2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMiBTYWx0ZWRfX5rT2IhNnkV/2
 7pv6YWQa2lqzazlXFrd+HhHA9AI7UwsuQDmz53UkhM8BHnPWo4Ci0vXM4X+SNBjAU7KCfB6VxlP
 b7sm4rEDr3pQET81fSrrh93jHKrsWKI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMiBTYWx0ZWRfX+uTwefHRo0rt
 OOeQQWSrrM5MRwEh1eZYSRJX0qBgBzgd9rYnmkGTCz0l9aqUSrI964S7X0lIWQFlM/8Ymf35Rri
 RTOV1xmhyx/LeWNR4hlYf49L7muHxI/om23r0UxwvEOXXOzCYhz6Jt/aam4y3OP9dJHVyfYSOxv
 EmvlWEPCgGd/kQdswN6dykvx32rsCImNvDmdVDergZJsEwzukOyi9dFESKLBWDxgd3ulC00MXQx
 mBL3y5ypcKKxFxJOjgbWb9JTu4P2ybxQpT46FG9X0mNCTp8ABh+5QhI7DO8x/1Y/86jcQeBjdHM
 PDpjKAk+VAtjlC+kn8rfOVuGi3xRQJ1seXaP/3gpZNS6xBWCDYDirAXTMfhqeM3dtjqnssggjws
 S2XXOrqcFDOHA1TvxG+RScnSNZlNZopUZ7xbEPqfD/4rBnRpJhkOwhq3Y6I+YAjCaCaKVWMmshY
 vDcg4fFTVVJKVu2IIiQ==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa149bb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=CY4bWrPPlyhwilDFwNAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ISKdosPgK5tD_zkb0xh2KVgFLH2riC2D
X-Proofpoint-GUID: ISKdosPgK5tD_zkb0xh2KVgFLH2riC2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090132

On 9/9/26 12:39 PM, Jishnu Prakash wrote:
> Hi Konrad,
> 
> On 9/3/2026 2:19 PM, Konrad Dybcio wrote:
>> On 7/31/26 8:06 PM, Jishnu Prakash wrote:
>>> Add the ADC channels under the PMK8850 ADC node for the
>>> other PMICS on the board with ADC peripherals. This includes
>>> die temperature and VPH power channels per PMIC.
>>
>> [...]
>>
>>> +	thermal-zones {
>>> +		sys-0-thermal {
>>
>> Please name it xo-therm or something similar to make the connection
>> more obvious
> 
> Sure, I'll update the node name to "xo-thermal" and make similar changes
> in the other patch too.
> 
>>
>> [...]
>>
>>> +&pmcx0102_c_e0_temp_alarm {
>>> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(0, 2)>;
>>> +	io-channel-names = "thermal";
>>> +};
>>> +
>>> +&pmcx0102_c_e1_temp_alarm {
>>> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(1, 2)>;
>>> +	io-channel-names = "thermal";
>>> +};
>>> +
>>> +&pmcx0102_d_e0_temp_alarm {
>>> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(0, 3)>;
>>> +	io-channel-names = "thermal";
>>> +};
>>> +
>>> +&pmcx0102_d_e1_temp_alarm {
>>> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(1, 3)>;
>>> +	io-channel-names = "thermal";
>>> +};
>>
>> Are these going to be always wired up this way on all Glymur boards?
> 
> I'm not sure what you mean here - each temp-alarm peripheral here
> is using the die_temp channel from the ADC on the same PMIC to
> read the PMIC die temperature. Die_temp is an internal sensor
> and the die_temp ADC channel is always present on any PMIC
> which has ADC, it is not like thermistors which are optionally
> connected to AMUX/GPIO pins and can change between boards, so
> I think we can consider the above configuration will not change
> between Glymur boards.
> 
> Does this answer your question?

Yes, thanks, I overlooked this

Konrad
