Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490462;
	b=Qxn+tiE08AHMT8Ty4pxguwyJeJGGugcDw6emnkNxIajtRN6WUWfRQPmsspA3NA91fpk1
	 nXIF07gcWXPwUHzbq6pNOJ8luE4Z8BebYcCsQd9cDcYM0fLLopf5orUYLeqTBVDJ9nbZO
	 UYT5JP84WBDdkdz7lak8BQlqVXOKLlR8ENh9m6wogHiiNJlfpneTAnNTLGOhhBf9uxKF+
	 y9mlvXehApv/P2TF61txW/sBY89E+zohSFTI+fxlbZ5FtCF0zdM1Rf44G1VO0fZ70TN1T
	 FQB4yf6rGYSXgxjsR8aQpk9TPpFbxeOADAJbw710bNTdQTr1X7TGEDv5QAhigUZqUfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MS0b8nEt88g1wfp0LivrvP9tCkFoNKaIyooh0vFsgK4=;
	b=nZYUELNLVw0/yj1r7TTLJjOdt1yyFBj1CsVSkllbdYTzosTcGX9YD8G1mDsV4xkXnOFh
	 RH/VsD2X1VQzW/0iRDZzQmx3Vtq/QLjjAiZsTxIrVO7v6TLFRXVJ9NveZ4DhY+SUrpFV0
	 Z65u8POf5abyXbB/nyYBmiL+uyPTj9gVsQyFBp9KYo+2ZZXzgb5im+oFc0/zpFlPdPvUx
	 la1wzZtIPDM30Znz+eldCpnfxXftWDZ5uXEB83AOjbiK23FtBENWDz4NQLtGRU9Vj6wo/
	 zSI0f+OWOFQ+o9HVZgvhnu+QgI1Z0hjHTMW8xVZsnKD+Bbq47VFh3xQ7jBzsPBK02hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hHsGRD7C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5jfqXnb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AB0606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44AB0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hHsGRD7C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5jfqXnb
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC90v692514210
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MS0b8nEt88g1wfp0LivrvP9tCkFoNKaIyooh0vFsgK4=; b=hHsGRD7CIheVre2s
	LWP8gjwXgsLt5YhSb8KdPblO0CHJxMoTwEJlliXeohBUyt9bGYvN5fGTChs5iPiS
	6azkvQnMhe7LRyYNcqCZmOhbrLctwwy8iaqRXher5tl5L3Sp4z7bOY4+ar1fBG89
	C3sz4TXbCcUpd4Rnv88Nlc9boMpjcLGZ33AJbW5oYafE0HD2Z2ojpNlFJKQCLXyJ
	MSRib5HXQa7yqSUWkuGy6kyEYnTX9Fg5BE1sAtHEU9KwaWLPba1IM8pUvNJt/SBP
	m5f0x0MZD2RAp5ztCgoj+cN2tcxAA1YwbYVnrw9HmcE4ojEfJh6RHXJwdui7UsBF
	Xjg4kA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1urt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:34:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-947a607ec40so303860485a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794490460; x=1795095260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MS0b8nEt88g1wfp0LivrvP9tCkFoNKaIyooh0vFsgK4=;
        b=I5jfqXnbAu+K5yIZKbvly4xkMmcd+toykRbvoCSRapj5x7z51HZTGvchLU7DY5JlYn
         GO027vlJ2p/OF99J42MLzJjegyOw51yxnm5hlK60NZ5/ROyoJ5shI23iM5QI3oxYzm34
         CBBlNQxGVu+vzj+oHHpemo68g65fIjyV/mfi0/tQVc/KAjN3yBeAWyl8fiQDFIa3iCz2
         pa23+/oy9mxsUk2UrKhJ9ewCwz64MuGmWxKkak6DdjoxWsa4POTORGJ6XQg/vSsx36L9
         AFtXhBkse29ziyqrk1Ps9KVBDP1EnJ4Aa59GG1T1l8C92qRNGfP9Qcl3DN89zpYm+F31
         BfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490460; x=1795095260;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MS0b8nEt88g1wfp0LivrvP9tCkFoNKaIyooh0vFsgK4=;
        b=0Ki8wE1PuwFU72VzuFnS1MaCX89vSiz1VOamaeDm37JsXZc1d1U89TUBwYN1AMfXCx
         doAiBeertn5ChKXkidT1GJybwqt4KJvZtbe21xGVyebyFf6yUXp01PblHrMaJ9gHpPTa
         UKhB/UQxRslal3+08E2c5+Pjj9AwDGNnsNuJ+N9xJjfKh0VjDRgKLcCPdHLFSf7WBlzL
         dmSY9Tj1To05UrzXF6eIQq/OfmuhbKbHY8S+cNxx8jL5wo9XFL95J2XzVpqqJ1dPlbnw
         1OsOvEOda82VHtaPrvvBBth+2cnv0tYx8zFPl+JoxN0WqdPbaO2ggyWFAZI4ujIqTRtP
         1PkQ==
X-Forwarded-Encrypted: i=1; AL+hErFIIax/SjcWudDSrhvte5+/M1jU3AoNuBMDEjDf54Kj+PkTvp9wLpI8yhfeQO6Egw2Nzsfi6teQrjJYo5U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OCbND7BafvrSmJjAxOiiTMMZ/ylkOHXd7V8XJIFF69ovLOpDp
	lJ8r5VExMqXdYL/wwVDYDHbicRQ/eWsO/fPX3nX/PsrfmineuTpfPSd15/bhPF6SAX/kfuC6O8E
	jznmh1NIVXS5MRTDDiedPBLUuQuxVjbwx0rW+4zcmzq2xf5L8+9Azneo8AoZ/6Px3wVs=
X-Gm-Gg: AYBFou1dgSFhx+PrMyNq1CHA2GeQQzpeD3IuRl85wEszvsBK+9AaTYw/HPPK9+f0PP1
	jbhzCJHEQM3KAVLGYKjwCBOcxfEd1RJIhIfev5BuHopHmiFDSCbOQjpzcoSNrxePfEvdrNGRZfL
	7EYGMrtig+t/xV3Y9X2zzugCTuR5gWh3QNRIywevzJtnXPPa924dlkpzuIM4BA56WTOltBMfFfM
	d4QJVVu6VXdAT8Qz/kG4xp/IgfY+ccyAong6haNf8SCL/K88Gp7YiTAXcI0OzexluO8pIcBKBPB
	xb1W8JiLe9hig4cf16tL9japgras+xxsyeH6JDn4qFxdYade07+6gzoHgh9ufEwKNCEzDUz/WjB
	jI8hi3OPW8B/rU1R8hKd8Ad6HTF3SGAecNjxkqgJ6r77IAaShE+uxE6TKl4f0gKbMiZio2I3zYh
	ixjSCSW13ubQ6wha1kiUEGwL4mZZBuayCSSJKQh2sGwDuvBIEAvFFcvA+VAnJnxCJzg5hwDl/Yw
	VwtBaumW3jAclBGs44/vsr63/hE4WlnXaPGEefLnnXy
X-Received: by 2002:a05:620a:a01b:b0:948:d833:1bee with SMTP id af79cd13be357-948d83321camr607632485a.3.1794490460257;
        Thu, 12 Nov 2026 05:34:20 -0800 (PST)
X-Received: by 2002:a05:620a:a01b:b0:948:d833:1bee with SMTP id af79cd13be357-948d83321camr607626985a.3.1794490459701;
        Thu, 12 Nov 2026 05:34:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a67ab93sm341707766b.77.2026.11.12.05.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:34:18 -0800 (PST)
Message-ID: <f55dddf1-d745-471a-8001-8f9e5768d97d@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:34:17 +0100
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
Subject: Re: [PATCH] ASoC: soc-core: start rtd->num_components at zero
To: Mark Brown <broonie@kernel.org>, Dennis Gilmore <dennis@ausil.us>,
        kees@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, gustavoars@kernel.org,
        linux-sound@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kernel@vger.kernel.org, michael.hennerich@analog.com,
        nuno.sa@analog.com, dlechner@baylibre.com, linux-spi@vger.kernel.org,
        miriam.rachel.korenblit@intel.com, linux-wireless@vger.kernel.org
References: <20261112025252.71375-1-dennis@ausil.us>
 <179448342405.66517.5463730214277229760.b4-review@b4>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <179448342405.66517.5463730214277229760.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af5c05d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=dp6IbyjqBwS_WhlRAgoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Fw_FJ3byWnRfXQNakz6uoFLP3pHGUQpR
X-Proofpoint-ORIG-GUID: Fw_FJ3byWnRfXQNakz6uoFLP3pHGUQpR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX6rCx4VCRLZSW
 13XFAly1dNghMdycLRjLC5+Px6XJC4Rv+3T3lRdX2aE0OWKfiYOsPURsL6dBMsZ60V+HobEFdHv
 8fQPTWDFkeNHZdI4+4LzvGnYV8wzPkaQTPvy451roFMr3iJy9GxGGcg9LyghaCtgh7wGtLHgzk1
 lx4qLLsu8BBn3R88Naq+i+ORrDQ/RyoOBcbh1ItbKqT9jEaKPBHAaRODeeL5iBlC5hXJ6/0kFx5
 zKtLQ2oUmyh+RPtivmlLpvGNdhy3E/5vkTM8HgtyH+Y3uhJaeDGHs86EZNAGVFV2Z8BYffcOrJ3
 etGwyk23ku8YB4p4pEu1XIkNl/y0j7RNdqL9cwNrvW6UtNV8Q3+pa/Me6edp1cGv4KLUbFYxCsA
 iBQcMZEk7pmibldreu4ITZFS8l65as/YbGH61KQ70aRgm3ZVcFpSYwsqS/1sbfae0Gt7hKJi26D
 hcaev6f10fx4FXzEMUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX0jPYIPkUnWSA
 EfXpBgee3SnzfhzJj/PAIjGvZseTSPrIvDblqCBK3YKi2CqkjsgjMSa0pg/OlfAjjHYSSdGsEVD
 qOiF/nJ+03LedDCK8SS0HUaRG0UL9GQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120053

Hi Mark,

I was about to send a regression bug report for 7.4-rc2 but I first
checked the list to see if a fix was already available and I'm happy
to report that this fixes things for me:

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

On 12-Nov-26 12:37, Mark Brown wrote:
>> Since the conversion to devm_kzalloc_flex(), the allocator sets the
>> __counted_by() counter num_components to the allocated length
>> (num_cpus + num_codecs + num_platforms). This only happens when the
>> compiler supports __builtin_counted_by_ref() (GCC 16 here). With
>> older compilers the counter stays zero, as before.
> 
> This doesn't apply against current code, I think this is an issue that
> was already fixed.  Please check and resend if it's still needed.

This applies cleanly on 7.4-rc2 and fixes a regression breaking
audio on a lot of different devices there.

If some form of this is already in ASoC-next, then that needs to be
send to Linux as a fix ASAP.

Regards,

Hans

p.s.

@Kees, have you seen Dennis' remark about the same problem with
devm_kzalloc_flex() changing the semantics with the num-components
counter now no longer being initialized to zero in at least 2 other
places? :

"""
Kees, the same pattern (a *_flex() allocation followed by code that uses
the counter as a fill index starting from zero) looks to be present in
two places converted by 69050f8d6d07 ("treewide: Replace kmalloc with
kmalloc_obj for non-scalar types"). I have only read the code for these.
I have no hardware for either and have not reproduced them, so please
treat them as possible issues rather than confirmed bugs:

 - drivers/spi/spi-axi-spi-engine.c: spi_engine_optimize_message()
   allocates p with kzalloc_flex(*p, instructions, p_dry.length + 1),
   which presets p->length, and spi_engine_compile_message() then
   appends with p->length++ through spi_engine_program_add_cmd().

 - drivers/net/wireless/intel/iwlwifi/mld/d3.c:
   iwl_mld_process_netdetect_res() allocates netdetect_info with
   kzalloc_flex(..., matches, n_matches), presetting n_matches, and
   iwl_mld_set_netdetect_info() stores at matches[n_matches] and then
   increments it. The per-match kzalloc_flex(..., channels, n_channels)
   has the same issue with match->n_channels.
"""


