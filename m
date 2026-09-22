Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4B43F58F0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100838; cv=none; b=kQ79fTc9ZS0TZTUqd2PajYsazqWWQzIpyItmowRwHtNRumX10+Pg/Rm2u1PC9fsIJl0h1nwvyd6OXx1Vx3yNDJNsM+pDByjJ3+bqhT6V6E3aonA+AKd486jxj07fCgIjPSdoRZWlHMAcU2pGRP7mfMOgFn/ghkMs6xto178rb60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100838; c=relaxed/simple;
	bh=8qHJ2jljwKT7vkezJXoh+SzC08ST7KZa3akvLAlytVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FA/RcGxBJW+zgPU2UiGJPtReVWXfVpCAxOvl0o5IvPh1c3VThlmLw+XHbppmaox1edYl1v5eJNmJHKrXmJtuBilbLqM16mw8RXe9g5bVGq0XZto22gxTa/PzMcfmlHTu9vFI0qnxOyqGyAoeY7SSZHom0tQQJiVjeYfxXtfOTCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKXnRmlc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ck6sR4S7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKXnRmlc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ck6sR4S7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7flX3757240
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7XlQOqTWG0GA4JV4YRIpDCXGSIq0z+OAUor2GjpNIyo=; b=OKXnRmlc6HpnTQlW
	NSKH76A9Pmj/LswsA2hG960qCSljI4x1BoTahgkfNFjvdjrrrVDYWBmhYgF2Moc6
	3Qb5dBjvlRSG10ckGZfXDAwzp6hGcTNKFp/O6hM3OIva6cNYiI+S4bFz7q24SYpU
	HEygRS6OfUcUGpjtL1UFIGQJpW6NLr5wxwXHVBOxeIC9cJ14Vzl2K8clsmpLDLWR
	hj7KWwyf4u+94RRSXa+sNTpsf6ScUyGNlYbnXRGq7POjUMs9O27dnS8Pq4fTGVCp
	O0HU0hPmh8taPTcHLMXCIeLqQoMj5JoLY3OTxLmt+vEX/kR4pXA8UxoW17VtaTTe
	Jpe+Ow==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj113ra5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:13:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3284bbaa89dso258954eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790100836; x=1790705636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XlQOqTWG0GA4JV4YRIpDCXGSIq0z+OAUor2GjpNIyo=;
        b=Ck6sR4S7aLsyZEBRNN02we6wZKfdj6+Ho4Vz3LTHks9VLKLVyR+HQDltndx3H1uCfn
         XxLLv5/ruqj+x5nCHjOTaFn/6xu9mAdX6eqUADpytaXjHDI8PLIWXarSBvOZqE3Hvj3S
         h9ZPqSZWt6PaTpqk2wj1jXb3MzDFujHWuevf9zpbDngyE7i7N1u9uUTXdADtTspleLdq
         9LUCFBjGWsTiMtXo8b4/usO3ELgID9fl1V4Wen37lI2TvyeMUva5BjUM+Xh58bjRZHxY
         AqffgS4ac/8N/lb6XcJXWVYgp9VdUT1fpmqS88xtmy4m7q1DfXcHOLPBHncWLZAYx6nJ
         dwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790100836; x=1790705636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XlQOqTWG0GA4JV4YRIpDCXGSIq0z+OAUor2GjpNIyo=;
        b=0jeruO4R9WOSCt/GeyXPA2Q5W6vljq+p4jeo3KcLs9FD4hA6GLHwMhSjZsQhd9n6PA
         vAx+DYZYqEqN1mIddKkmyzJHPwpo+KcPUenpwIfzYRqaf3CP8bhIYQJjLXbugR9KPcDi
         D/PQPbA24m5sRi9va2ycMYzqkS7vidd1QMKC/vTqXlmWaqkKV8GWCy0FhBWbtIb+z1pM
         vBPZ0JmJzX/A6R3ObeeKpEWhE9pMYnSrVqy5OkLSqR13RlKNTLV5qLW1QOuhPl7E1cjc
         bShg0GvioxJDVHygdSJEDFrHWdlJieeHQA9NcG1mBcLgEVmmflbc8YawrIn1qKMhi2OW
         MrZg==
X-Forwarded-Encrypted: i=1; AKwUvBzY8je8R9IraCbIar9jOyrY/uKA88kF9AWc5S/QqWhRLErVC3V2uJvamW12AcibMkdfSRnT9cDlrjOHtCs=@vger.kernel.org
X-Gm-Message-State: AFuF++m+Cj0O955BKTThaOFsPNolZdUVJFOqge0235zqDq/iVIjtxYJt
	I3qy8hNcpmvHTP/MmM7NWQxzBpxwT7BqIIz/9dFbYkopkqaX0RcgqKDzGOFYXUKsQu3KtpsrPtT
	jpHpMVIC4Ghf48+3WjzULrdsqu9Tseq101ueFPcZgnGUNTc3yEJm+blrJ6H7TakI0bJI=
X-Gm-Gg: AYBFou01zBwOZpP9m9UVjiS74rA1UJySOQnxO3cCOxBMqGVtrnFClPHL6Pjvf7WK6f9
	72N0iO/d6/GY6k5DAx2D+KflC6gZEtlhz/eGYaFaWp+wpg9u1YOBzoaYXQ6yIywRBDqmpvXdnyG
	YbmoRlMuIDVytJfxuzexI8MCBZuFIOF+CEdjVs7pT645Daedw/y8wX56iBelhdYKZGT2tKW7pqp
	wsye/6rTSI7uqsD1+sce6sLJFDqqHGBK/r26jxIqvPTtbe8IxbVutDqHyTyUlAuOXUYWAjfJ95i
	tQvYpHhAs+rtVppDtRSpjsNtuepfll0kX6uplczwx++sq3OOQHWsiDwheNkyal8AR9n7Iai4RcD
	h7koGX5/hFj8imRBcjF1Ak6kIuDhI8Rv6qw==
X-Received: by 2002:a05:7300:fb15:b0:334:2bee:348e with SMTP id 5a478bee46e88-33e8dbc413amr101160eec.22.1790100835672;
        Tue, 22 Sep 2026 11:13:55 -0700 (PDT)
X-Received: by 2002:a05:7300:fb15:b0:334:2bee:348e with SMTP id 5a478bee46e88-33e8dbc413amr101119eec.22.1790100834980;
        Tue, 22 Sep 2026 11:13:54 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96846f85sm14407eec.20.2026.09.22.11.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:13:53 -0700 (PDT)
Message-ID: <4da1dc31-f586-43fb-ad6e-110248177b4d@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:43:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix VPSS line buffer width and height order
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wTXVCCToeQB7ZUk7WUJhBAY3Ejii7wmd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX0jjL8q1qQgrX
 rKlX6ViaegeIyhEgrNYhRz7FEmvnVqd2fo7k0/HflK9TDyBsy2CWOs/GsdAkFI2by2RKk1ta7uN
 4pSn/p4qA4jL+YHg6NVL64odUpN7Fv0=
X-Proofpoint-ORIG-GUID: wTXVCCToeQB7ZUk7WUJhBAY3Ejii7wmd
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2c564 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LNHj20nFQCkdnYxJI5cA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX1c2zFpkBrpvE
 phyKlcdlXk1hp4TlSIAVQi9rACvf/1zSQVompqalTdVSLwCpMU5nlrOan70uGpVXJLwBG6HsAkR
 t6ZtNTj4Wl5iBV95hW1t05M4GZ+sGNBJsD+ZNUL9t+X2YnF35pcpglSMzV8u0JnzYuoMNw0DTQv
 Q/BLloWL4lAtM/ss9oK5627NS3F2ZBmMDXGMBZBafK9Gcnc9yvL3IYw94OWmPgmtcaCxV6EeLjd
 37RE3UcBDTpZdbsEgPzmsn3eao5r0pnmMxY0BxyXkJbvhiXIXXTKHLfuDV4vgDdlkIc9nFjYz4n
 NUxrZycipEjzrKx/TwDEzfqHRLHxNtCjnNta0Cl8YuteT13C2ciBKYC2qv2Wt8raIj7C4+t2zmy
 V7XyVoURecJb8jVMh40J4hW8SPuvtLVTwtgO/KC7TYt1AO+nykMpNlF5i57LUrHE6Fp78bYDZ4X
 +5CpuW/6FIdxyzm7ujw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220265



On 9/22/2026 8:54 AM, Wangao Wang wrote:
> size_vpss_line_buf_vpu33() expects (num_pipes, height, width) but was
> called with width and height swapped, miscalculating VPSS line buffer
> size for non-square resolutions.
> 
> Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

