Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792849597;
	b=L8Ojubv9GWa51RiTvh0wewX/SNZF89yderEEPfvj5ipDNrAHEJOfrGtHGO/Akm8Ae2Uv
	 cdZ5ScU5TFBcYY1KRFFB2NgoUOljgsaYNY4qE2yyjET0iQ0Stu6/wdyWPsn79Xa6etnoY
	 tD6rRBxWneVuNBxiBKX1HmDs664Rusp4947larT4JSBLt06KuP1JGtuGh6cELli5O/Pxx
	 ATh6S489T87Clz692PL0XRa0Jm+KuYfzJytJwWMk98TewEC1nR/FFBeD2CU+GF2oO+69n
	 HSjEoUyrEoikWAHFPezRktVV9AG2RA+6KDknyiO6dTrLBTclSZvGVyoIG9HeNtkzvFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792849597;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cedsDiWxiMJHd1Vt3zDocFzdubCPdae8+FNLHOPg2Hk=;
	b=oywzMkH3wYPTjikWu89YlKuCzMPmsD5ZybxphAeq62yIoF47Zu1HA3hvrOUjRoBD8q/R
	 LqXzQTHGbHtqsaCE4utDpu61DWSuI/RgD+2L8dP4jq4FfSADXe7lGxme4WBwrAo2+9KsC
	 gfGFEyNBCAqh/nuFbX8BU6R68e7Mu/2q9kjsSG3AcG42CuEJOODNa70CnpWn9OhLYo/ge
	 JR25ITVqT8dwSL38kpWSE6xP7ENI0Yvl8DuOQ1QjBCraVYogcTwZeaqgO7ujxkPUJ8zEB
	 hSmVZHvp1C+ytojlQrQSbErrbtBSLo4tI2mzJkK69AHgePxHcQoLwSznThjVTzk2TxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eDc450pX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UrmoVkMk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73527606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73527606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eDc450pX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UrmoVkMk
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8o0291143026
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cedsDiWxiMJHd1Vt3zDocFzdubCPdae8+FNLHOPg2Hk=; b=eDc450pXfMSNd+pr
	DofrK6ft8ed0rfhwc75PeXNkL3Wo+T81k6aQgArTIqqASIbC8LQktGHa9P1f8BYK
	Dfsbkmz4lw6NGKR5AtSFAMMbnxvUAbBDb1EAZig7rwQbqYcnIwq+QZKpX1iBBY83
	NIpdHovQzjlb8k9ttQDfBdsSwzj9o3THVDeLGn3sCTLgfjPiTi5AdtaohmuWqHBk
	uOAphmfCitfLJlIdWCI0aB8o2dnXiDNL/cgwIcVCQPPYCWFCOgDrG9nL3WmyXQ1j
	ORjK2xmlrPX8uIpwHTFgfT3MCauw+C3LO/4pQtRHMXVvSaJj0tZD04UQSS2D+2vi
	qxxKgA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgj1p9d1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:46:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so4729831eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792849595; x=1793454395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cedsDiWxiMJHd1Vt3zDocFzdubCPdae8+FNLHOPg2Hk=;
        b=UrmoVkMkWDMUQvk7+D/6RiPjE/nLnIjpT9/9F2dpCvpccUS/YMS/yBDIyn7l25+8TJ
         3doW69QKm0FH1JEfHvExLfwmq1A8YRlRt0+JFYyc1XexuU52buCr4KW0c6jE2NPLMF91
         AySrJdPwWSl3yzackF11/rr9P+aptP9vt6xZTt3AgIZLVgnWL8XHpIiGGcryPUE1ilOo
         /B5nS2ZJwcsj8TWcKSBKLRsldP8mDVthySBSuBRlDt7mvIXzx4ZfbZNpi6TcDXosl8PL
         S3BjvYBdaAOvbo5/uxgm5+u2MaXxJ1syIzzZ5LaqAgOlw7g0jHHwi/UdFCJ+d3504gXN
         qOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792849595; x=1793454395;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cedsDiWxiMJHd1Vt3zDocFzdubCPdae8+FNLHOPg2Hk=;
        b=X0zl73eSQgtZki6PaKhjYCWDg08b78K1DtXeTUZ5yvV/LJSTZjqigLsqFKa79PR5Dl
         e0DvdyNy9tD/vLsKKwAVOuevw/GFHmc36aw9ZKMVZ2zhvwUu93psRLqx2FE0hqFNoXDJ
         Jdcsc2E2/aXN+3ju7ToUfbrZnIEPxXgtyGMpKwSA3jTDv7gWOrbOfT6aUBG2o6S3Jv38
         PKcG+YiIOVLD7NrmL9geKIXsVh5me76g5jnav2Mua6rvbjnOkxgOqgZNQ1bc1UFEkP3x
         dXwBRwgkqyQShfhP6K71IrC0X4fbk3Z+tCNSogmRtoPjLvlSMEfU4dtBN/KYPZ8Vk964
         oOlg==
X-Forwarded-Encrypted: i=1; AKwUvBxS9LPsD/a/752aXqYRxaJ0VFAf1D4uGPQSjJJJjeXZLvGOHJ2NshkDs8rSTGOlRQUohST2xeYH0g6BPgA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwugGncmwUzqQ3HfLmITVeIsa2gzZqii8bwxS7WDzLMPTFUOBb
	IM2cnw+jaYjht69Q1JQ//0S1vV8xUlOq6Eq6CjWsbUA0zuJnI93zMAzzjXHghsz8+c7Pbm5QWY/
	FlFyoO0lRiatXmMysEOYWHDgHFL5SwHyksPxD//4sOuOhl1DV+hnPky+Ylr30X1eVDuc=
X-Gm-Gg: AYBFou1pRtTvUJpVZ2K/0BKYTqoamhK0dLbRITa5KfCp7W1NIZ8cKVnO6XKEWxoVbnq
	Y5PYFakTvmIKvF7xpawSakcqOhKvYLnaXiSt7Ra4ZtJZfe4v5dY4MAfiVumt3uev/jOW/6i9bON
	o9GuzM+vhuHDAvhQj0IEwHmPrdM4REk4OugfD/pOFmNzoXrm9imokPcH86jhK4h7lwAzf3TnrDo
	YwraPvJoAaMR/NXIoPXMrzP5cMrgIGo/kBFiYBvrUa7HVv+DzWo35JsD2V/s5I/YAEkiS/d9rO7
	nsB0g3vqzjQwZb/ll7FTIOVn0eTurTvum76VmhlWDUhKyCJtH2gLxtdCLgBRLpDsrTunLS7pC38
	jCOehJbfRQku0onndCmNMbgulyjOAnQ==
X-Received: by 2002:a05:7022:108c:b0:144:f096:4dda with SMTP id a92af1059eb24-19939c2b3f3mr2567011c88.43.1792849595299;
        Sat, 24 Oct 2026 06:46:35 -0700 (PDT)
X-Received: by 2002:a05:7022:108c:b0:144:f096:4dda with SMTP id a92af1059eb24-19939c2b3f3mr2566979c88.43.1792849594676;
        Sat, 24 Oct 2026 06:46:34 -0700 (PDT)
Received: from [192.168.29.10] ([49.37.153.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm7566869c88.1.2026.10.24.06.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 06:46:34 -0700 (PDT)
Message-ID: <035464d4-852e-4a19-b030-a1d97e818979@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 19:16:24 +0530
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
Subject: Re: [PATCH 3/5] firmware: qcom: Add an TEE bus based ICE back-end
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261021-ice-migrate-tee-svc-v1-3-b035be7aab0a@oss.qualcomm.com>
 <601fa952-3639-4154-96de-aa09cf5f692e@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <601fa952-3639-4154-96de-aa09cf5f692e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA1NCBTYWx0ZWRfXwXb3iP2KU3Vt
 SpSxyJQgJ3UJW/qQBKd2ovPmZJaYYG5y0UtEqxhNEYyR0zDj1k+iRV/XLUk+PLUDUWYytWDymts
 pRIa5jbeXDyP93wk2mIimtvbN4Rt5/E=
X-Proofpoint-GUID: t0QlY_kDvf84J4xHJtGDmTNhi8t5TLDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA1NCBTYWx0ZWRfX1S1ymcAjTheg
 46qYWE6gmAEtQK5nsTq9dxhbmtaf0atXWO3cY9OSRIV7WZdBltQFqTeab/XGdowIYGL+YNPcwmG
 Sg81T/iOeMerb0A+8WdEjFfsnSMc/WPI2mM/atVfbB1B7DQ3gIFxTQCz1l4nf9VQAoUY2DUd3El
 kGTZWYsTF5U7ATEYo2xfTLpVanGeoAj7D1xJBPy36YoBG8fTVbv+PP7JRWC+wARra/5sphzVGsE
 6aHFXyMZwTSQjvdey+UJ8809GCIKBFgFpv8PI4CrvJRMeW6pvPxjKuRPS/UaCiwpv5+VpvoZDbQ
 dgoasm1LewC1CoK/Z52zm3StSRfCQQCOYjMsmfX7dDlwwUPLH/W//qLGaangKZbTBhXP/ZEEybE
 U7yoH6dMxnW68ERjj4GqqT3KNV1rBlZAt3Hn57UbfIRtqjCkpwobWin48mQlwVhZAklryNP5g3M
 LQHgje1dhhT/co92fMg==
X-Proofpoint-ORIG-GUID: t0QlY_kDvf84J4xHJtGDmTNhi8t5TLDI
X-Authority-Analysis: v=2.4 cv=D5vSufRj c=1 sm=1 tr=0 ts=6adcb6bc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=hZ1hWxSZf3UX9FuxeSnJ0A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cmTAmlLTp9sgBaqDkbgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240054

Hi Konrad,

On 22-10-2026 01:17 pm, Konrad Dybcio wrote:
> On 10/21/26 5:43 PM, Harshal Dev wrote:
>> Add support for a TEE client driver which forwards calls from the Inline
>> Crypto Engine (ICE) service (invoked by the ICE driver) to the OPTEE ICE
>> Psuedo-TA.
> 
> LLM says: typo: "Psuedo"; s/an TEE bus/a TEE bus
>

Ack. 
>> The ICE PTA supports both ICE Legacy and Standard modes. In Standard mode
>> Hardware Key Manager v1 is supported.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +config QCOM_ICE_TEE
>> +       tristate
>> +       select QCOM_ICE_SERVICE
>> +       depends on TEE
>> +       depends on !CPU_BIG_ENDIAN
>> +       default m if ARCH_QCOM
>> +       help
>> +         Enable the generic Inline Crypto Engine (ICE) firmware service TEE
>> +         implementation as a backend.
> 
> LLM says: please use tabs here
>

Ack.

Regards,
Harshal 
> Konrad

