Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B261353EEB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945837; cv=none; b=VveMRYUhe3gj7VGoTufpgEaQ14DkENvqhyM60pNiOWIAIb3xwQRqXRR6Zw4Wg+OW2IhYaeXciNvy/DG7lz3fGxC8PK+ccuC1KyAcVXx6TNbANPrxDEa7XG4zriJELpXXDipkzZiyD4Vlvrxh1fdgVoFqaV36RPCrSbqdmVZ3jVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945837; c=relaxed/simple;
	bh=MefwGGus+1Q/IuGojqThe9twVN1fqV7QINFZMvuhCDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2MJ081QAUDcSQ1b0wGzTRENfH80VsTl9jUbp8o/kVUxFZYxgI3Ro7RkBleVpIJbqoSIrTFmz0JlmdbAPU2aJYYBdTcVsrPSozBB1tyAAKmGAAjeJBMwNaRtvd10t9DPPpyI+EMNTfAtKBRALnLcUpVuApQ+dQxpW/nfsmVK1JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIHsBrc2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VPyXt7tr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIHsBrc2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VPyXt7tr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6898Zf5Y1189208
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 09:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gWyEGgxT4E7X9KltLLkSGf6POqbL5iNCiSRb74gc82E=; b=SIHsBrc2LY11MYJc
	HPBKaHwKbKAo0/VmYro9lMRr+FAcUXpfbqdCs0I8WbVsbJ9ZP6FfkrErJWYo9Wkb
	mnqRjQHECn8g93u+5+qBxcpoPCjd4qGRjfu1JOW4egFMf3dVJzMuBIxTbVXyt+M6
	51yQjK3FDdWomqcM0C+5xpjRRAGATTvaEG7sPCnuxG+GAi3329KCp5yDhFVBedI6
	B6OzyqNaK0D+zw5g+scUSTWyMzkNQ65P3t9fxVoFt7UMVsZw0/aJPzq7yQI8yqNb
	4wU0HF9OUM2YSNJ9DdPbY57WjZ/AnUy/jRuqNOeqr9fwzpCRLyF/gsBvOjmaaQBr
	Zh0scg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxtm1h3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:23:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390890ae83so70863485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788945835; x=1789550635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWyEGgxT4E7X9KltLLkSGf6POqbL5iNCiSRb74gc82E=;
        b=VPyXt7trWgrW1E695mc/hcGJCwKOHKmaWuZTDoi9A2lg5VgjPCheWX3KW2+adRq/5p
         uBR8ykBuTyh0f4X5rSp1ZUQLs8qt74pe22PfmKhOoi4jgTOkN3436eZSvGiTSIBQeaxG
         ++e4eDpadSSG6ukZ/P2hF8NW6+y+tCnDlETiC28gU7rZV/go9/iHjsTXapxj8R4NXDHo
         UXowQxrGL1Uj0mKnrptfLOz27ANdDkDIVx7I0IXqob7CXyordY10sSMFx9BzJI4aMOPx
         qkt/jaORfpQ7XdjL10JzcFvXPjJaVOAxjqL1tcQ5EBY7fr6xhAh0AiwtnROdLtY0z2Lp
         oVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945835; x=1789550635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWyEGgxT4E7X9KltLLkSGf6POqbL5iNCiSRb74gc82E=;
        b=ZxbYtv0ztQkeVzBFDeAtn5ttrW8zcDfHplanEeJu1J6SNqA1qlYvoKhWxmZu0oWau9
         MIrKgMWXPcKdRxAydaG6y3sLXBsnB1uPQ6pYzzpnYg3d3MIQZIByesudFSZ8HQVJkrjG
         J47zKfzXFnkAE8dBBOMYxXQ/5gVzJpsbkcuaoJXfmaHeu/n20nwFoLTy4xqKmk2slLf9
         UzHjywkK4qi8G1N0CJQUAUvd8QqRmRtQR3pBSXsALG1kSMQ0U6/6t4gwqk6wnx2vEZYP
         FSxkibdVY/oQAwHjuffyHt4XF1kH6uVgoQuz77BELD4P5qaZLjcbXTEKFEDmGGB9OOtq
         Y0QA==
X-Forwarded-Encrypted: i=1; AKwUvBxaZwMOT4MVu8SgmNjlNencqLBCo0t0pB0I2z8kJy2MSZZG26NQMZjTFhDWc/N8QTAbgbGCsQ/9JSdaUeU=@vger.kernel.org
X-Gm-Message-State: AFuF++mC/MH4ab3KY4RGoBTFHPx3ykWiXaY0Xc7M5p8aGrernXBL/aC7
	miKhgqZOqj6QjflhmcjYIWr6vIZr93OIDYuGVQqY+/HPewbZYU4atSzZz47HAbGcEjrI6EsuTX7
	M7ogFW1MdU/l6hX/DpcK8aLL7erQOcVIKt6CztP7oXy69uRXdLfjRqTSXq3uFYAr687w=
X-Gm-Gg: AYBFou1l1I5DoziEpBnpofk4sYJIEF7agThNyRTtmzYVUzvaCSulDNFHIUEhFiV4KI4
	Qg6ddgWjopNwJoIdRJL9a8fOzs8RH89OqVi9SiRhJXt9+JGAcRzbqjNOqvEt3QbJnUz2k2+ZyA5
	7NEpmqgCt1nTi3wT114tLaeFOhGPotwPlVaY8f4LoN840hRplKkqpgGeUxr6HKksz1Op3++f4yS
	mmRfxGFpbFR+qoM3yXNgFinTn/VrnoANRluzvwc+ColgFFjcItbJx5I1alPbcscFpjsXIA5nik9
	KudCnIVdCJJIsv3HYyM9UQgCMJl7WWhDSjVPqQMn1cX4AxQhpYjDAeR2gyaguOpghE0HI8D5pEA
	yojIVR4hj4w4MOFD36c0ZYQ==
X-Received: by 2002:a05:620a:2913:b0:939:5924:e319 with SMTP id af79cd13be357-939914ccf18mr2213638485a.0.1788945834581;
        Wed, 09 Sep 2026 02:23:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:939:5924:e319 with SMTP id af79cd13be357-939914ccf18mr2213612185a.0.1788945829338;
        Wed, 09 Sep 2026 02:23:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c42c2sm6520490a12.14.2026.09.09.02.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:23:48 -0700 (PDT)
Message-ID: <387b1aa6-f168-4fb8-95d1-895f74805767@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:23:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-sony-tama: Add battery
 properties
To: Shujath Mohd <shujath@outlook.in>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
References: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
 <5enkadptjkxm5mmjjwtqehm4futxejzwewevoewlpeedjhszbb@dsfsfewasuiu>
 <TYZPR01MB513102932A34B982696E2AD2C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <TYZPR01MB513102932A34B982696E2AD2C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwNCBTYWx0ZWRfXxeYJNS0BEVVa
 0OE/zl44yqAfXM703WjvFcA1EOs1NxwvG+/6BJ8MHWVJkBti2dBr6foNpMfZ8g6OBb8BJ5nUbmC
 XgXuEIlGJiCVqnEtKFYZ7igb7Ij+mZA=
X-Proofpoint-GUID: QtLHn0hlgXpQjI3KLx6oB4-FNx8yas8y
X-Authority-Analysis: v=2.4 cv=F+1nsKhN c=1 sm=1 tr=0 ts=6aa125ab cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WY477xrWUYgG2yMJyFQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: QtLHn0hlgXpQjI3KLx6oB4-FNx8yas8y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwNCBTYWx0ZWRfX+NtHDxNoWLgY
 JVbDj2BlwCpxV2wHDviT8OPgDMgGgZPqYj1IthtTqQPiv3VXKMrsAnjqE1T5beS8F/k3s9N2jwI
 LMBIPoytrDcc+H6k6FVM46KCYiEfA1iiq9gOInKU57GxVmoAEJKvHqxp0H6LH/idN5XRTI5bdtP
 AmL0/x1fBYU8eGUFDM2Ejw2ERg6M0zu3JPyCcBch1F+Ks810p503phBUTpDOlEQHMmvXtgCfwlk
 n4SH44JP6OiTFbcucIRcdLx5I+a0ly0xIFLFlZNGhwIm6n9NB3jVUmsKrVHdiMg+Obsp7yl64Gf
 XbknFfhRT2g+tkxzxrd1aLAyusAV7W36zN3ni4hxoUUe8MznuZ6VdPDfhmzWZNCU5TZPEjgj6YT
 FRqFGeQrOxWodmdcWNQYyuybpVjhPUyNblfNi5IYNwMKDcgmzcStGcqbuGDnYkujaU/ZysGWurE
 6tqonaOUVrnGqCL5GQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090104

On 9/8/26 9:56 AM, Shujath Mohd wrote:
> Just the commit message, nothing in files
> 
> On 8 September 2026 12:49:24 pm IST, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>> On 26-09-07 21:33:08, Shujath Mohd wrote:
>>> Add simple-battery nodes describing the design capacity and voltage
>>> limits of the Xperia TAMA batteries.
>>>
>>> The Xperia XZ2, XZ2 Compact, and XZ3 use 3.4 V as the drained
>>> battery voltage and 4.245 V as the fully charged voltage.
>>>
>>> Signed-off-by: Shujath Mohd <shujath@outlook.in>
>>
>> So what changed since v1 ?


For context, everyone is expected to provide a brief changelog between
revisions

There's a pretty in-depth piece of documentation regarding all the
(well, probably "most") such expectations:

https://docs.kernel.org/process/submitting-patches.html

And the b4 tool was created to take care of most of the annoying ones:

https://b4.docs.kernel.org/en/latest/ 

which everyone (contributors and maintainers alike) is encouraged to use

Konrad
