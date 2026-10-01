Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF623348C7F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871359; cv=none; b=pXji3HAXK0IpRLp9XIIz+NUfVZWihQJqClfTw9/WOWNrsKf4wjvDItbB+0TZO3FlUhDBTX1jYH9OsR+EFTuvbGK5IWaqm9BBBs03EpC3pzr9tZRrAqRbWcJczo3FqZL4zZ3PBRxhfk91upmElelo8HKGFWHZE2WdnWGCqHcYicU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871359; c=relaxed/simple;
	bh=uqVWGQCfo6Yf0kkabKm2EtxgVf2o8pjULxFa3NT5B+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=esGTL34f+gmlM026sx/thX3fzyLRwXJGdmkugCEypYcN5zdatZD+kQRuX9FvAOZ9BckZ1ZrM03D7qyusHkgD0Hh5TJHPXZVOmswH6zpCKvh/3i610dTsHuGEsxiaPLP5lq4pburioPd1tlzbCzLx0XhSwFdrrgsqxo4h3/JFk+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pT4KVaBJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LX5tpIkQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pT4KVaBJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LX5tpIkQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691FtB6r3355914
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 16:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ekpOIEshdfoL/KvLAu8ZlpZV9Rt5VrpqptUJ/oZGIKU=; b=pT4KVaBJ8HaBb2az
	SGM8bpJj3fGjPC+RoGJO9ZV1KyrZoG96lYe0ZxMgP+xAsEFmCbb8nHy94TJOxOSl
	edFLmE+EGHYDKpVs3oCk2yxb/+wCeVEmwnjQGwH6acC7fCSWPkpzYYOItXex0WQL
	ALoc97O0suq1+eDC8831z7TT34nX9oX/6Zw5HkLf3+A9KdXsrcwT18SfYkT2r90x
	4c2u0a4EoSgfH7AnG2THlYM8T8/12ZGLm6gHuSXhKpJlSF74JfAVtEwxk7vpT6Fi
	H3izDBOdHX814bNZa14kDyd8LQZ3T+PlmmFTPlH/IXDhzZqDw1zxQ9iqSUOYJCCZ
	UWA9zw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7ntumb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:15:56 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5d952ad4bb3so31096e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790871356; x=1791476156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekpOIEshdfoL/KvLAu8ZlpZV9Rt5VrpqptUJ/oZGIKU=;
        b=LX5tpIkQ0YvoGxlnQubxOsMc/9J7GfuT+UUvq8+5NedQHZNROEcRwgnXVLWPOfCPP7
         Kk1wE92LDtQNI079lNOU7gIE4cqoS5f0586dv9TeSs15pkpwCO+J7BnL5wAQISphelAv
         PBOUbe37uHgY136jw4twpdLFKsvreNtaJR/uF3aUAJtWU/v8O1XCd2eY3o/wlvxkQqCn
         vUkJg7hh4jClcbzub9Y6xMdDGf0LsC80JNvcl4qOExILDFlJUKjOaHWWKVusIaV5Af1g
         NiMxOPSHf0TjNYlBELpxJ07M+eZeIp0YBhG5saNTBq2dXfWJCmM3p8QxoshzkFRbsKn2
         gw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871356; x=1791476156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekpOIEshdfoL/KvLAu8ZlpZV9Rt5VrpqptUJ/oZGIKU=;
        b=1cf2lY+zvisBeMBgC13C4qT/ZGDze/3+QffAmWbXMykyHxD5+MaUv6PMNNqzxnFJoL
         CVMywow3NnCcGXxUiOvwRJfWXwC/M0f4INhoCvxRW7Fya1YBo46h9p8nyLItI/Fn/0fm
         qVIr25V48XvP/r4M6cHdmQ1jkHdM/Bq6JBnpbyzDV8+K9FFNVL3yQRf8Y56+fcRJDsbU
         2Gi+8C4Sb/jhvkG42yEYAry5NSbPMhZJLm9jEYdJS57rpie0qhBtgUzEfGmCCNeQVrr8
         XtscDBM7/+UyBApdph9mJkJH3KPLBWzWHDeUTcSl4Iya52SmHXqqVpuYUvbzyMdBbdhU
         gdsw==
X-Forwarded-Encrypted: i=1; AKwUvByhJNmucf9iTBQBc/2Rn1UCbRUFBiJKL83xlBA6qKOXUUZYnA7uOj5/D4CbDfgH7/P3FeQJyVaEuKetyFI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxJjErWoe367TR4rb9t+wNRGYjv6wddgCe3hrPq7icv6lFb23E
	nT0tspYzshITQ2+qdd+qk9icE/Ke+edaFYbkVl1Nqfq5Wfd6RIGkRT8P9+9zCNTF1C+DCpB0fTg
	c6GUi+n62Na1HIQxaL83mTs3bkwK4KKPOv2XTwZN3IZ+5TK1+4M9n6LZXipzi9cYYglXP8G7Pf6
	E=
X-Gm-Gg: AYBFou3JNVUGIoOf6+G1uFwc+cPs9g6DoRPpU2GeCEEX3V5gANfGNI0ShMh0NDc8NaZ
	8tIWLySU105QXaKIWc0/kvxjqzAKh+nw5Uya58rxTJ6tLSdD1lwTefDyeTbAiedVoEY3Efr54yn
	ym+dcbFpg+eZ5jppgcL8BhARhdvXOCf8PA5h2ua5Aqra9Fdbaj+W4W5Oq64GkhX9/kRo1knvUFn
	dfnogbwK548+04zMwMeO5RjKQOaROYU1bvxor8iJ/Dixnx3FZ1XRA2hutWBE9BFZIYyBfbYUxlq
	CEmoUIIdbw2v7Yj9wKIW2gStXbFCSzBVuhtOL8YGBzDAoIX5rUracVjTinYr3veaZi3jYspbNvP
	CoqArmQ4zqRYsEBsvbIJ1Ig==
X-Received: by 2002:a05:6102:5ccb:b0:7b4:d43b:43d2 with SMTP id ada2fe7eead31-7be729aee46mr1100993137.3.1790871356086;
        Thu, 01 Oct 2026 09:15:56 -0700 (PDT)
X-Received: by 2002:a05:6102:5ccb:b0:7b4:d43b:43d2 with SMTP id ada2fe7eead31-7be729aee46mr1100978137.3.1790871355621;
        Thu, 01 Oct 2026 09:15:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d80d5csm183510866b.51.2026.10.01.09.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 09:15:54 -0700 (PDT)
Message-ID: <66d48e1f-7bab-42f3-84db-ce794f2a2a89@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 18:15:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq5018: mark 'gpll0_main' clock as
 critical
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Stanislaw Pal <kuncy7@gmail.com>, Mieczyslaw Nalewaj <namiltd@yahoo.com>,
        Jie Luo <jie.luo@oss.qualcomm.com>, Georg Seema <georgseema@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260918-ipq5018-mark-gpll0_main-critical-v1-1-fbe8f27a0106@gmail.com>
 <e16cf23c-82aa-465b-81b2-6240f4a0f4d9@oss.qualcomm.com>
 <f2ccd6b6-e5a2-4d36-a12c-124638c31280@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f2ccd6b6-e5a2-4d36-a12c-124638c31280@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe873c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=qLDurSU9-_G6tQfgrAEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2NCBTYWx0ZWRfXyHBpmB+iY9O9
 v/3mvbAbgzIw6UWe6B7MxM9N/uLWSXt3hr/2Ns+RAYAbZypED3A6Gn1MDOIYa91oKlA59syMvYD
 qcJ+O8i/kv6+yFEQh2d/U9UneBWBpXQ=
X-Proofpoint-ORIG-GUID: 5wwYu7fBaCeuOuomGrWu0gPsB_Xbfwt9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2NCBTYWx0ZWRfX/BudYp8wnJT+
 McfvmkeO1iDMhg/AqAZTj9FvyRrNMWuALjtO7eyI6hCoBbc6MOAXewOjaVfvQpKaT5LeDp1twiX
 QSqhyWbgi3GcGTPSfrNxXJu7UDGd5WWGAypUilBSiVbgbvBavzfYrUNLEOOvoZuRzwM1FFJsoox
 m7KfCc3J0UnFTY+pgl9gyE4nPS9xWk+QirJGGgP1xcuRsivFl0uODRhp/vrzLioByG1djILkP6G
 DG5FGWdgp4zfbIkzg9lB+rwDlPWlMvEjM9xmiyolPm4PZDy4kwtwe4EyrXu37rf45iWCDij9NFN
 bUDun5fzHJ5e+eFMVetxqeilnuYDD2qvGAe66Sdw1yGD4XWrLU4fqjDnzlOl6VJHCTGyA1vfBum
 VsGB+Cv0SzpHOJFTcKkM2SCCx5ZFBs0ADaazuVyWyc09xjqnYb7w2SfHUfbDL3oiF/UgXoVvGtf
 yEQ6of57eZnOWFxlnig==
X-Proofpoint-GUID: 5wwYu7fBaCeuOuomGrWu0gPsB_Xbfwt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010064

On 9/24/26 1:33 PM, Gabor Juhos wrote:
> Hi Konrad,
> 
> 2026. 09. 23. 15:32 keltezéssel, Konrad Dybcio írta:
>> On 9/18/26 11:27 AM, Gabor Juhos wrote:
>>> On IPQ5018, the APCS core clock feeds the CPUs. It can use
>>> different clocks as its parent, but during system boot it
>>> utilizes GPLL0.

[...]

>> At a glance, we have the CPUs consuming
>> &apcs_glb APCS_ALIAS0_CORE_CLK
>>
>> which takes XO/GPLL0/A53PLL as parents.
>>
>> GPLL0 is a child of GPLL0_MAIN, so this should never be gated in
>> practice. devlink and probe deferrals should make sure you always
>> get a valid clock handle for the cpufreq driver..
> 
> Yes, the cpufreq driver gets a valid clock handle. However the hang happens
> early, when the 'apcs_alias0_core' clock is not registered yet. So CCF does not
> know that the clock (hence the CPU) is a consumer of GPLL0.

So is that the late_initcall kicking in early, disabling unused
clocks, or is there some other logic that ends up disabling the
GPLL?

Konrad
