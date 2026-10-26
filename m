Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999490;
	b=MQKWRRe9pEZrX2XGHVgFAOvexahA/r34CER8/zGdDewbhgdYYfZFf/PKf/6t2UZUuEOe
	 VlnCxmhgJIRg2RAyVVcnfGYRu1g9GbF9fKBmi2bwUhnlb110A8B5aaVOt2plO8W3SXPCR
	 6NjjGIjlmm9N4qqFTgm/UHzmWRt8AN86PgTG7L2GElf715U8uFlXiQpM7OmBJ2b5eRIVD
	 J1EkB6xnD2n0tsRe5hh9kPouC6sko/1cZErYUakn5Fax6hwuopuPfsBSSuU9qnZy+cI0E
	 FB/sydFXYAFC2JpPOctaI4alNLaLREZFOYLC300nJyD7T1qFfmt4Vyb/N7d6KO1PD3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999490;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0Q9hZOGPGHQItfvB0KvMGoubShfJzS8NO1cPSm+V9WQ=;
	b=L59m/T0rG5iC6Jfv+ctCCAewKwuHfP44G98QF9BfgYLFmlI7S9ui0F4F1l7vt8z6DahB
	 hCk9GeKUEUvYb8kJ9/NwoyOmjMIGJn34V35E7Jdk0OWACoKyCRXaa54WsCOw1f9b2cuD0
	 VuSW/KYEiEiNrRa9ERPeqXDFWVH/lMRSAGKFlswrKkHcqbRxhxXMcAk5WplUR6PK/8hKx
	 bIJSMo3x0ejeZwKNWDGnm7oARWfdlW43d+I4l6ZnIX4f7yrZCkNfoMQvMD2kt+VoJDLCn
	 Ix3eqL83RJ/x73ytxh7H3mADi3/rtv8EK3Fm8xrVbp77NHXanWSEY+pbqHEE9S6fEJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bxh0UO8g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MlNrwdQt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F78606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F78606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bxh0UO8g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MlNrwdQt
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aPMn2222520
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Q9hZOGPGHQItfvB0KvMGoubShfJzS8NO1cPSm+V9WQ=; b=Bxh0UO8gpAPiz5D5
	E3S9mOqwI0wTzEfGTe4C7thJEq/v0j0LvzQoxntZrkv0a1xWzZh0WIFGhxUoqp5b
	qQgKnhgQXT+zjrmOYAdAwalHzLHt+FpeJt25pt2sX3cMwXfumma+HWOlqTYk+ITB
	zfGJsWkXBbhSTur0ONGZW5nSxaZcCm7g0laj9se2wuzmxsroP7ye+tp4GnlPDXbG
	PkIdTUT19X4xb4Nps8VB+8xBybbCd0QjTBms8BAxftqFxuMAj+OdYvru1iqlJnVL
	vVJxGkkIG04n3Xn1zjbsebm19izIdAUyrTG/lAF8Mh+5n/YCrSFmlW6au/R9lu2e
	ngYnkA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd91mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:24:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so8043066eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792999488; x=1793604288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Q9hZOGPGHQItfvB0KvMGoubShfJzS8NO1cPSm+V9WQ=;
        b=MlNrwdQtRKk99EFPWiHhNVod3fwEY6dM7m4Cel77xJiJ7Mf/7Wvs191WJHsVmqXuyi
         TqJ+BftAbEGlk2NI6vnB2epPFAJ53bw0ilWI+ybx5dYyK1ZW8UURaw6ErYJUX9pEeavB
         EZMYnunuTq4BIMP7YltFz6Y24iOoEQCKjDWz7DsCDi7EAVQSf02nLXMdEcL8/IeK5azO
         e41m3J4SfO5p2UxKI2Qmv9gMroHxorxRNr1gdzrj+Drd0X/vC93QOjKSNMQgOtHMejSN
         xiG0vqYWqCIsLzeaBcg3OCCt1urXKTqyYYW/26QVocARngwxuEkARbpAkudIF6ifHGt2
         cwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792999488; x=1793604288;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Q9hZOGPGHQItfvB0KvMGoubShfJzS8NO1cPSm+V9WQ=;
        b=zcwUrCB/TzGif5OIQgszDSUfmqaBQvmU2Y8io/tQwvYciZL+KrqEX63S5fX0ib56SM
         JBTD6JqYHhPceau3qYN45bgJEpWi/R+KcOTBja3/2bBAfsZFhv7f8bwyOglCfZe9dkJY
         +4ZfdCiJZ90LZ9u/VTe5DygUqQcsCFzHYuQ4kZpniP/eDSAVVH6DakMImuAEYEb/Si3S
         VjIz6Z/jv448pX8TlH1FKxQ+P7Yd28qbGdbQAqrH69AWdoui3WbE0wMxgyparr0pk6Bw
         XtQXYxh7w11DGZGKm7VEN8a9mvoYkG0r+/fk8MMziT7Ryj3dA/4NDsyudhHlbcJjQU69
         f62Q==
X-Forwarded-Encrypted: i=1; AKwUvBw2cnob8k/GyDyz4+Rapm7WqEgH/S3fi0njJ9cT/qkZNgNeHLhCGDrcVCSqpQkGns7AzuXvl4uOeX3PGDw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv+dQgOLKY3WudlfrqPJeYkD4Ya398Uk5bSSAtmt0kj6/ygEl9
	MUkLdlliGC3wIWmcj98/D0smdrmsfCzcb4MTms8+fWizjVQHFH0U38pyzdyRFK+I4cLvATXsKI7
	tGTgWo8S0/X9uYrrdK/bABNpwCeB5x5scvPoKnOiqvlCnu0rA+7zWQ7AiZfBR7lN1sOA=
X-Gm-Gg: AYBFou0qIouoPIuUluX7+Y6av19kGddLOr41mqwMd/TeqwYM9pU1fLeXzLlKbsbJAf4
	E1IcCXQD02lpcE1stQvJ+3frlsCtEsgvh2/Jfc16C9dhBpWjC8x4wHDhq9oafEFtOuMn8UnpHbB
	O82Yj2wVmJomXLv6PmJXNfSRmhK8VcZeMe9zQKQowq01QDP9U2OYJmPeFa3CrC0CzooFOrbfgbr
	oNjObatFaHFNohqGm58FCdG1R0EnDN1cE1Z6tiakL5yyk6A741eippKHgL5lmYZYecUO6c0Uvxt
	dlGhVctiMvIoz52kxONeBWaYuA43P+D1JMNmOYjq6DwDppqE+/mVgS+ivBCbgeBqXUU7AzJC0DL
	U7Ok5KymMHRU95+KQ9CFyGA==
X-Received: by 2002:a05:701b:2501:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-19933f05474mr9361056c88.14.1792999487475;
        Mon, 26 Oct 2026 00:24:47 -0700 (PDT)
X-Received: by 2002:a05:701b:2501:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-19933f05474mr9360973c88.14.1792999485793;
        Mon, 26 Oct 2026 00:24:45 -0700 (PDT)
Received: from [10.219.3.4] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm13556700eec.21.2026.10.26.00.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 00:24:45 -0700 (PDT)
Message-ID: <f2467cdb-e4b9-47a9-bf64-51eac8732b28@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:54:39 +0530
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
Subject: Re: [PATCH v1 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-lt9611uxd-evk
 compatible support
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-6-karthik.s@oss.qualcomm.com>
 <4e08bcac-66ee-41b4-a2b7-65797ec0e3f0@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <4e08bcac-66ee-41b4-a2b7-65797ec0e3f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Extb0sQhX40y4Rq4vW_tc6n5LTt1o-6e
X-Proofpoint-GUID: Extb0sQhX40y4Rq4vW_tc6n5LTt1o-6e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyOSBTYWx0ZWRfX5G+e0SFjMzjC
 kHGIBpof5TR0+f6z6RYGmq6SBRjAGR6HG+23dVbvemZqV1FxWJiSEWzPEhsA7QItx84xAbzq6R5
 F2awMPMzmBk/bGb5XNSSbs2xXD7U4drFCNSgjD8sbuJeo0xN10ovi3vPybRkZWEbj8RwGAiKVa7
 P55iuGrdJ+/H6IGJvrTKYYXXOy6zgULDwXEfz4T6/a3jpMJ5f7hwk7EqLTPqQRVmQwP0J6FJySW
 w58cuxfhCB8oPwk0GP8jKiubcpQsUCDW+iE3usqMrrHtZObLD6RaXCWw8fpWWVmCb5WvtfnWMrH
 3FuiEquDYU59nSkHQwcHbsZPgMB/c9LcPBhES2+KLITSZugUByvdXiuU9sSY4mocP7avoG9CGg+
 PdJckTv0xTzq3g40Jz0HQQScIep4ld6Fe8Qdb5mErPlYSHcwAJqHqiXjFP90cweeRt0uT5TUe9B
 Ltf/IT8reYgYp4zHI4A==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf0040 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Y5lwcFhJtQqtPFhOBPcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyOSBTYWx0ZWRfX7vx2zbfNu3OP
 msyUjU3jE2FxDcGw1QcNEH7gthQpZb7rwDqLwlNdd1SyPVIz/CGZVLd7YkKq5fNqvB6pdCrCBo+
 3FQI5rFqLjChMkzQkatzrw3zmJfufoQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260029



On 10/22/2026 9:37 PM, Ajay Kumar Nandam wrote:
>> +static const struct qcom_snd_soc_common 
>> shikra_iqs_lt9611uxd_priv_data = {
>> +    .driver_name = "shikra",
>> +    .dapm_widgets = sc8280xp_dapm_widgets,
>> +    .num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>> +    .codec_dai_fmt = SND_SOC_DAIFMT_BC_FC |
>> +             SND_SOC_DAIFMT_NB_NF |
>> +             SND_SOC_DAIFMT_I2S,
>> +};
> 
> Since the codec is configured as mi2s_bclk_enable, shouldn't we also 
> set .mi2s_bclk_enable = true here?
> 
not necessary in our case, use case is working fine.

for example in case of qcs8275 using max98091 mi2s_bclk_enable is set
but mi2s_bclk_enable is not set to true.

>> +
>>   static const struct qcom_snd_soc_common sm8450_priv_data = {
>>       .driver_name = "sm8450",
>>       .dapm_widgets = sc8280xp_dapm_widgets,
>> @@ -608,6 +617,8 @@ static const struct of_device_id 
>> snd_sc8280xp_dt_match[] = {
>>       { .compatible = "qcom,qcs9100-sndcard", .data = 
>> &qcs9100_priv_data },
>>       { .compatible = "qcom,sc8280xp-sndcard", .data = 
>> &sc8280xp_priv_data },
>>       { .compatible = "qcom,shikra-iqs-sndcard", .data = 
>> &shikra_iqs_priv_data },
>> +    { .compatible = "qcom,shikra-iqs-lt9611uxd-sndcard",
>> +      .data = &shikra_iqs_lt9611uxd_priv_data },
>>       { .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
> 
> Nit: please keep the compatible list sorted alphabetically.

sure thanks will update in V2

thanks and regards,
Karthik S

