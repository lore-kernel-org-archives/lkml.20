Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491393;
	b=G8zPz4gPZwt+MjdsMSEyorsqygnj6mOblku9FPyz7eDjAO5vN6cu4vK37v9RBJ7yGUlj
	 I0krxPYnpFOfTdhNBB8SHUYYoBwV4ExVuSHbml4pDJVkROuJIKoEDsW7TMuyFQ2XpjR2z
	 lXIrWg8+8M2GxA6uldK3SBUxREYsOe5b2OJjdXj9hkUKV8Juokeg47b1NVceP8rvHyb7q
	 BbEKk9DzIriDNoXrGQjsDtNy2yrIQhcP7WYI+R2ptPXj4u7BK//7sRuiWM1fjSsK1HSxT
	 2VUHWaOiDDlN+OWBV/nA5Cb5qWxTZFiJ1BxaNZyWrpUu0fjA+8axpCEIajKDelpmu0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491393;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=in+fhMuXoIFRUp0erX4Nc1Z1jlL2QFiRRzQJd1Ie8yY=;
	b=zfUUBhLvhE0bO8DbwqhK/LpobxXgssd+VUkPOUDzIGlng9Urkn3KvWAMbNZvvynXkaRa
	 LFHIBdKx8hRvhGZXS7la3Mehpt6zDyEyEiC0bDEPryVyHv/5uCIYlE93nSggMBr1S1IWF
	 LkiHn59PGWdqHN/Mh03bsLNvRIzzLjibs6iLQ1J1sKWmVrYWc8iBYAgPO5je1oqB28mEK
	 +YM3bp8wg7B38gLc5GjfKgUklfWCwqN53s8ODNZFbJyRG40c14T96S8HamMUCOTkjLINs
	 cCEVAAxFVOLVotXWBoOgtpWrli7B31j7DSLuRjx4/nfE5cXc7tZ5/ZwVBxFCuDDd71g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M7m5X7eB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpK7mf0+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D3C606A333
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6D3C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M7m5X7eB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpK7mf0+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8WXVk3305467
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	in+fhMuXoIFRUp0erX4Nc1Z1jlL2QFiRRzQJd1Ie8yY=; b=M7m5X7eB1t4mV70V
	CVRgyiEhRWBi2+jzFZm0kcZfn/KilXnnSV9KfM3336T9YaCxrxPyQ2tb8UlR1cqp
	31hsVz6srU4q6y5GJ7+EYmmSSnTTvNjAw+rjw2FSYK0W68hDqRWTm7a1Zs4pga/n
	z9K2gA/ai3XnoCCgxVZc+0VkjjOd7IqB9n4687tBeQdjnkGqzwftNcUad1whN8xb
	Xit7Sw2/izjW3e8TwPpj/9zcUY4KGppNggJqh2rvEanB1Jz0POCIQY0HN5Op8KKt
	7g7z4yo1yiDPDqXQMydBrWcnjSKjhGtWwKIdKIFnJJTlVmYWrA/Vxf32Ih77EWc7
	Ik41SA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ssynw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:16:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934a8cd3a8bso54551385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792491391; x=1793096191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=in+fhMuXoIFRUp0erX4Nc1Z1jlL2QFiRRzQJd1Ie8yY=;
        b=KpK7mf0+ln8S9o+AYHdf/5Qge1jvuO6z3SwLsGhapaHa64XplPWXiucO5/plflhG1O
         p6X1pcawiqve1c4k7TZP4Zc4T+gPcjhn0vUirBS2W0xyRUijcmLVWXo4hldOg2AuQABM
         0fJ1QGU09nh/sZVuQT9v6qDNLIHuu0GLWsvX/S7odYhkmwUnXoXHj0V31HAyg14T2VQ4
         WYsOwXP7rFeCKe4JImvCuTX9glDBtRICdUN/agUqtk4Hq87yZShX93NKkgOsL4sspaRO
         4H1cCC8LQU1rufQBUcAaYBik33fnFKur8/rwqtY8oQ6PdpjHb4EYi626aJJJ9zpDe+fJ
         RZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491391; x=1793096191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=in+fhMuXoIFRUp0erX4Nc1Z1jlL2QFiRRzQJd1Ie8yY=;
        b=xfyO2qStUQ7cj5rKcT2Voq2xEC1l+RviVnb4iu1J6oiuFUVrwkCq2bkZYArsbUSfZj
         8elAvDBQubAKuj/s4RYnV6yUsJNOyfd2+gSqhel+VwZ7f043jR3NyBQD/iOk/R9kK0vr
         SKJiD+swUVll0XC/YaYagNC78tm3CU5tthOmI7UpFDfWh7E6Caln9yKmAmZV73TPYMPc
         FjPmAM6nUEa5rhb4UFIIzm3m7rl3Gi7rSiWNGJAfWRy4DgmcMUU7tKlucS3LSTH2IRRN
         L20fdZ6KcXT/Gisd/XVzQblKak5/DtAul3HRgeuo9PH0YnCM4wXYU0wgT1sIAz8HsjWa
         fkgA==
X-Forwarded-Encrypted: i=1; AKwUvBy25SK/RbNDgJd3zGcbnthaiguIb0CpOoSJcUyUnwPDAbJnJ5x48bZrGdKbco/KDo4235U+skGOmXUYez0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXmccmRiELCWq+9otTV1DkzCC+Dygth69KOPXcIwIAJldf0j9f
	wmw/tTjQaQHZv7fxOaGia9wC6niLZ7oIyRn513LjBc4EjrcsKGkoNnXs+j1aY943ZtNHn+lxB+e
	TWOyo6bQECM3uRk6ER0pjIeKourIHxEOCEqyUZ1Zpgj4Cf6NVvGfkm9sJoDbujhNlgow=
X-Gm-Gg: AYBFou3O9iDIVvg7DXLJwTPyFQoO01x+OJIlFpV1cBn5360flFHCCOkWN2vSnhDe1yQ
	ZQKRVijfVfxLf0n5DTofRpWN5m+WfCZud16ncrjwk7C8y+sve5GO58eBVXApuMM3gVSsUv5Kq/n
	oSAN8BL818kY5kqZWIe4D2i43lkbSrqaBMJBOPaeE/qN5vxIkow3x+ZVGtd3sv2nSQD+eXGKzwV
	NKigOwQlEXJ2Zb3w2K98PgNXcTQMl8H35ezB6qADdDIEQQ4FF+GTpBrWMlzssCS7BqkoPuuyYuO
	EbCDDWXYrYago3xt9bsmxF02e+i9MS26hAng+PwHQAw+xnents27B1axOZoW93Dx2bA44xbfY25
	s4NIoAqpjkBZU65ULLY+mfQ==
X-Received: by 2002:a05:620a:618e:b0:939:8bc:8826 with SMTP id af79cd13be357-93f29b72ce3mr1977421085a.2.1792491391157;
        Tue, 20 Oct 2026 03:16:31 -0700 (PDT)
X-Received: by 2002:a05:620a:618e:b0:939:8bc:8826 with SMTP id af79cd13be357-93f29b72ce3mr1977416585a.2.1792491390567;
        Tue, 20 Oct 2026 03:16:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32bc33sm468649366b.5.2026.10.20.03.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:16:29 -0700 (PDT)
Message-ID: <40a4cdde-6eee-4018-9358-2779a9fd7328@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:16:27 +0200
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
Subject: Re: [PATCH v3 3/7] pmdomain: qcom: rpmpd: Split SDM632 pm domains
 from MSM8953
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold
 <stephan@gerhold.net>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-3-95c47d0f26cf@mainlining.org>
 <i4zm6zil2qyfdrclkxf6sifgup4phi6dlggspxrd7khlvbqv4e@yxotc3cslqss>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <i4zm6zil2qyfdrclkxf6sifgup4phi6dlggspxrd7khlvbqv4e@yxotc3cslqss>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfXz9FEoeE0q6jK
 WQGXU2wstQ0QrRB7mXRIyzBmJ0/BOlimScyZ/bC0MpYoigbftd4Ok3tiXVvC1iB+Wa2EKfc3opZ
 csRNHyKtBKQ3uYuSgjvCM2lx9quVUtwQBZ3Jc0zUOrwcA62D7qRQ7va23GHKrRrzc6T0OaZKSjX
 /O8dd484qUwM1ImgdEgxLYJmCXfgjap8T3oQyjIiZWtRPRCvG5vOYE9+8B2oL97iwBcge5bF6cx
 aqOk3BPMV6/UJSRdgeaT6eFkhbLBJYaAyhfTPBhKUIdWizOb8Rsb8k3tEygi/XiPHJxG9l2H60D
 KxWsr2ZdVbGGm4G/FwUzvWJ8YVBWbA9on/wo7ahpnU0Lr/fvZhJvIgn7+jguMlFQwDBWYk2lqpG
 cd/7wKjXiurK5MEJW2Q7Ws96CaJDG5oSEi0qm0Y5UwszDyxpeDqRT/sOb+klbGekV7h4wFk1p/9
 BOcKvoAVWAyqeMxJ+4g==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad73f7f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=OuZLqq7tAAAA:8 a=7gWwhKplwqCMDIKiNsEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: g1b2LnGmo3ugTrYKp5hNHRDctj9ompo1
X-Proofpoint-ORIG-GUID: g1b2LnGmo3ugTrYKp5hNHRDctj9ompo1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX46wiakktQErW
 mIxF5D7AEPpx4w9Ibv/tNiZRctJYM8HB4DlmrzVNZykdUQVCoEDCuegYNe3mTa5nPMqoZoQ8V5L
 Ng1d3XiwNFQITRqqInEJQC33/LI/kYI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200040

On 10/5/26 9:04 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 02, 2026 at 12:38:31AM +0200, Barnabás Czémán wrote:
>> Remove modem related pm domains from MSM8953 rpmpd because MSM8953 MSS
>> is using mss-supply as regulator.
>> Split SDM632 rpmpd from MSM8953 because SDM632 MSS is using mss-supply
>> as pm domain.
>>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  drivers/pmdomain/qcom/rpmpd.c | 29 ++++++++++++++++-------------
>>  1 file changed, 16 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
>> index 5f55fc791131..c37a79d6bc43 100644
>> --- a/drivers/pmdomain/qcom/rpmpd.c
>> +++ b/drivers/pmdomain/qcom/rpmpd.c
>> @@ -503,19 +503,8 @@ static struct rpmpd md_s1a_corner_ao = {
>>  	.key = KEY_CORNER,
>>  };
>>  
>> -static struct rpmpd md_s1a_lvl_ao;
> 
> I'd rather see #define RPMPD_VDDMD_AO unless you have a good reason to
> drop it.

It's software anyway, and I don't think there's a need for
"keep the modem power domain oneline unless the cpu is
asleep"

Konrad
