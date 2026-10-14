Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D61551989
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991369; cv=none; b=SuVXnAFZz9Ml6h1Mnh1FFy/Dh6aky6cDLubE+hE/gJDoMCcaXppIsTUSkgkDqJY1FUb/Pp+puAFZdc2N/s5wZzGcwxnSQKvanqBKa4w60NsVUkFpVDCwJI86MjI0UlUFRWQNCq8VJZvsMqZRsXxYEaewaIYMVGcl4R37VZTdAdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991369; c=relaxed/simple;
	bh=2ZU6MwfjnLqrDRReQEGGcxuZxUUQUqDtTL1lntQBV7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZrtSGo10jYbV1TbzIJ7Odzld3+Y3jzmjb6IJPYXVPGod/dV9bsGY/MNaN/0Za6f5++xsDhxdl2w8SkEBIYN0pyeZvvv3Dpjlg8JRkfiwuIPyWL3yz/0aS1v0EC1Qrj+B1YpB4WLtJ3k35N2qDSr9V5WaksHdOeh+A21PK+Ao1/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRTJaaX5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oa5NYCLj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRTJaaX5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oa5NYCLj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbHv4467705
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQwxNYjPO9tbvCrCR1s+whpG+EIzL/7a283QqDnqnbo=; b=lRTJaaX5FMs0taNi
	0N4GuwqfoTWjVSX6o7mz+daoiXNEOjiKIgxhUJYIrmywgq8TekA/moMm7hNwbyPz
	QPTOHbuvoXlL69QLdONij3qkU7v4HG2aBQlNSpenRKnDKV1J9En+Nfa47wVDQfwQ
	iCHACVOAi/toYNJ6wA1CwWVMNTsNURHPAq1BDcZs7aHYBLpOuciiDtiL9qg+j2Ns
	ifag7HqVnQ39wfi0/yKhyedBJgFzVvrJi0jw47yKKczhBoJ2QVN8xKjhZ0W6Q4nq
	ICEwzQ/qiIbJgwtO8VoAp+IRSVilOiCu4r/Isqt8bkRzWRYxYcwt09Iqr0vDby+j
	X/jMHg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphk7p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:22:46 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5de7ad7cdbfso153045e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791991366; x=1792596166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQwxNYjPO9tbvCrCR1s+whpG+EIzL/7a283QqDnqnbo=;
        b=Oa5NYCLj1jleQowTcjcWUIBIWV5BSh1Bm3Hs15vSDfBVm7TafSMwssNgzhXhXww0jR
         X7N5ZKy9KaFrelQ1F42gEim2zsKvflW785E1pz7m4/nT3aiS2qmpUI/uO3KbVzTpA2KW
         E3AppRC1XwiCCzPI2dkP8G/lEU+9i2Qz8OgqTuBTVeuPQNfdxHsSfCICmVlLsXsN1mY7
         CFi5pVEiPlpM04o6oj8lvz3nLe3TBrj0xyFVH3LeSJiex/GJizveVH8TP3xcENRBv1QR
         haz9zxIFHvN6mFOsXvQ2zi1mOiOqdVjIUtlPJqRguWvhhwJKRHx67t/9Hw1gGCDZAVyD
         q2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991366; x=1792596166;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQwxNYjPO9tbvCrCR1s+whpG+EIzL/7a283QqDnqnbo=;
        b=SZu2atmVV+9nWDy+phpU+N9lHRoOCRYgPiLNWbvFscxCakDJVJdx63FZzUlpP9823y
         iPbDlR9pJ0jHMu84r4f3aCk+GdwdQPBpB8ZNu+6KM2l6c+Sul6BI1qtBZ5Go8snnQSlt
         lFjzsF3v0z+tI2Xoc3uNWqeHhuxUyWmWYMclmIwVfDVsHVsQL2EgeIClPAYGH/WKX8Z8
         pV/swTCAlshKH7YJv+I4J3PW6u83yGFpocDBaSEOtviEc+DtwCPBDi/8QBTts+QnH6jl
         52jmniGECn2/Ugc+7kGLJJ4omgH5NGMPPtSgUyLpPTXiXQbMPZa5/Dk5+M/QoyI7qTEG
         eiow==
X-Forwarded-Encrypted: i=1; AKwUvByT5jF+UVq8B+MLciykbB7i5o9RS6knYqipitO8eksp1GumUfFTePNjwWzZas6Y7QD7NdAyRcjTlnx3xME=@vger.kernel.org
X-Gm-Message-State: AFq9FYIte6NUA6a4Kt+7U/ggd91gkP9VOg5lQ/2ffkvq5cozT9ssbAjY
	OREbFvcaJv16nrFBcqXdCo9vdDUbSYQ0n/f2NOqNkqYgGQl9U0SZlfLvum3ytPCbrxE+cU5q+06
	KMabkTTIWV5XGiTMQzKQ6DmHQPNro+59AdQAXcZZv3jQDq0shIdJLqF/iAQVvtLLdMq4=
X-Gm-Gg: AYBFou15rDHhnVfoUV2NWSoYeaCaSeBkQdy+IYyXqvIH7ZIQ7W2KBffGKRxz+hWQk/6
	pDdEwwIiyVFvy4TSoDoy9f3dO78Q9LPAMs+9epujG+Ccwgju0gU4ENJPXSxvWQQ0A/DUfh5fFLc
	uPH5QHdxE/wE63GVM7bc6VNJef+Yr1z0DbihpxaMJ2QefbOqFiZM3JeYXsqQRbGGid7jeZXxxde
	wXVjs8BF7ez1EvYTEVhkjvEUMCpRdC9kpnD25yrCzdW2459EwQIRRXOxzzV8Nnmhu/RPvlW3nO2
	eD3ifgn8QIZ29IzBZVWf34+EuCVDDMNxTqoP1CfwUpVb6bptjsZw6R8u2/jYJZiNv51Syo5LrLN
	4qE8JCBxjbqfM1s/vTn/aIA==
X-Received: by 2002:a05:6122:8111:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5e91efb84camr3492466e0c.0.1791991365664;
        Wed, 14 Oct 2026 08:22:45 -0700 (PDT)
X-Received: by 2002:a05:6122:8111:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5e91efb84camr3492426e0c.0.1791991365164;
        Wed, 14 Oct 2026 08:22:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a68c08sm713903466b.31.2026.10.14.08.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:22:44 -0700 (PDT)
Message-ID: <bc6a824c-f242-4047-9198-dda53f789704@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 17:22:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM RFC 14/16] clk: qcom: Enable clk-dvfs on SM8650
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-14-3041b788e9f7@oss.qualcomm.com>
 <rfcbfy5z45w43ju2qjslrcnxfbhqbcx5fr5bii2icewm5ggihu@lsooj5mc7mpk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <rfcbfy5z45w43ju2qjslrcnxfbhqbcx5fr5bii2icewm5ggihu@lsooj5mc7mpk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oKqmGL537fgOj5WKYOdH1U73PN3ANEdl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MSBTYWx0ZWRfX7/DwAjJz8Zps
 OVURj9KGn8wkT5LjWVqNWUj0C4QUteq+JYazXDomAsV3yPRSILUPUHr8+Uq2lzta2RND+TdVlc/
 z+ckfO51uLTODxZe5P/LyIvc+Rd4aPg=
X-Proofpoint-ORIG-GUID: oKqmGL537fgOj5WKYOdH1U73PN3ANEdl
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf9e46 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xncweAwc9hG03UQb53QA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MSBTYWx0ZWRfX+NwEKB7SzMhd
 tfCMGnt2xqL8vDA3CIsfXfn7zgyGDVKqgoT5n0VCJ1XbSYQB0dwsMJbPavH+03zI1d/G34XWOP1
 HMz+5u1ttWfv6AjJxaRqawHSZZLXMFaMWZFYlv+klmxPzwRa7a62pFuR0SyLpsc6TAxWSOX7F0U
 lXH7+MDGOM89jGgZhApjor6CbeC+a2O4urHuON9m0lkKtBg5eD8glLLjeY8E2g2yMnnKdZescNv
 vuHTGYpmHoB8lO5cgbRXOegiRAs7gwuchNj5Twg+5pyJZsaRr16e2/PmFVGlGQiWhAOOvKXAqb4
 OCTV0/eTXRYcmT7YJqwlGo6qD3BbnOqm4svkU8JIYcodn5BzkYV6qgMp2ao2TsmjfTCM1iwyiSc
 McjSf8EEG6mSIgCxYje80BkLWGG0fci1ZMXwpkWT2ae6F0qlDylZhso8Rygbft4ATTtkKzgd5n9
 lHzVwcSttqbakipfk3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140061

On 10/14/26 4:40 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:14PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Make use of the clock-dvfs infrastructure and fill in the power
>> requirements for SM8650's clocks to ensure the hardware can operate in
>> accordance with the specification.

[...]

>>  #include <dt-bindings/clock/qcom,sm8650-camcc.h>
>> +#include <dt-bindings/power/qcom,rpmhpd.h>
> 
> I've commented to the cover letter. For me it feels like the layering
> violation.

I understand. I still think it's okay given this is a driver only
for a specific SoC.

[...]

>> +static const struct qcom_clk_dvfs_data cam_cc_camnoc_axi_rt_clk_src_dvfs = {
>> +	.pd_indices = (const unsigned int[]) { DT_PMDOMAIN_MMCX, DT_PMDOMAIN_MXC },
>> +	.num_pd_indices = 2,
>> +	.rates = (const struct qcom_clk_dvfs_rate[]) {
>> +		{ 300000000, RPMH_REGULATOR_LEVEL_LOW_SVS },
>> +		{ 400000000, RPMH_REGULATOR_LEVEL_SVS },
> 
> And does it actually have the same vote on both MMCX and MXC? I'd need
> to check the clock tree.

In this case the RCG needs VDD_MM and its direct child branch
needs MXC for the flipflops.

[...]

>> +static const struct qcom_clk_dvfs_data cam_cc_cphy_rx_clk_src_dvfs = {
>> +	.pd_indices = (const unsigned int[]) {
>> +		DT_PMDOMAIN_MMCX, DT_PMDOMAIN_MX, DT_PMDOMAIN_MXC,
> 
> Three domains... If we want to have three votes, we really need to have
> three votes in the .rates array. But then it starts to feel like an OPP
> table.

In this case, yes, three domains, same RPMH level for this clock alone.

Konrad
