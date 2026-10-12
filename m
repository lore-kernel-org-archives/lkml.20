Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961A54AAC74
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822145; cv=none; b=EmsVvSvltIZyUZB/+wnISX4YXmBPCZEU9B80mO8rPKd64TiNgP5sPoi3tKDzJHhCrodZxsMJj/Nqtc9fHnQStRmV84AUznHsdGxEqWkKFrAygGSWt5566MCp9+NhMq+smltJiD79NMets0bldePEn4+1EtVOJiaGuUdFEjgqvAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822145; c=relaxed/simple;
	bh=lvpPyCGDTXesWaEY6g9dLJJ5DWtjGQaG0FaLxSfIFBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s8yPKTjESSed+jhwQT27PQMzun4OKlb1HSTtRo4F5DEApGvip36UyUfw0+g7QWkU1Oxl8rBJO4kq8O39jqCRbGkmqgz0QRTeKMJO9SYDunFWBp62EU7Gg63KHfyNG8Dpy8vLRighMyI4vUt9YhfgjyZantEqkQTRAwde46vpskU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nkuk9YEy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axE60Enx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nkuk9YEy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axE60Enx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFf1Wk2175331
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qvUxIZZyJ0aPoPDhcOpJX9lew0Lb34qpElwWNDtrpkQ=; b=nkuk9YEy/9Yi7cv6
	mw/3wyTTR+RFFBzhmK3iqDePsLd/II6Ak7uCrUnfSLQoge9768mUl0+gG2VEzuMk
	rHGyqsR2Hojgnb4knZ2QGSdxGyugYLj29KCF+2Tc6iKtTyc4nIwgosT59bDuyh9P
	UYC8JCvRkF8XrVSaS/FMgRl+StjIevll5GeGHTNBxT19UbBZLb/YaWKIFbDn5pk/
	iI/EmldueRUF6ZClIE5c8Hpt7l9tTIdmXqyEEWtOOsCNuvxwvq8H4o4v9scs0s3V
	ugHjdsNXqf86eNIBUs7jMa1wcAzk1bLYnZ+a4phgil8rhdX9utSjty5Lgf2BFu4L
	DHFXnA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1rja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:22:23 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso46079137.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791822143; x=1792426943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvUxIZZyJ0aPoPDhcOpJX9lew0Lb34qpElwWNDtrpkQ=;
        b=axE60EnxUpA5BkCLysTc4IvEYIyU0J1YwuZ4hEikPxbz+tgzvluDQ0Gohg57nFItDP
         ECiW+nvrYsWn85pw036yhwvhKwrxp4FSNVqk1HlZYWqR7woX97cS7znO7pOhrbiwuB5u
         Z6vqcfuQex9WgoVwcFRzyB6ArQXz1XPle4/dwEOoacfsiIuFKrmzaeWklBi5xrUvKfw/
         c5lyNHTpm49+io6uzA91m6ntwozASYuHKrcNPTGz4oiYLD+CVDmr7M6kduBX8rR9/mYZ
         HAuXRO+aYmbf0Ec2EIePSVleHSSMFaCGVPjZlFsILZvnOtpkgdYlC3Bf9ai7KJ2k4xgd
         MHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822143; x=1792426943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvUxIZZyJ0aPoPDhcOpJX9lew0Lb34qpElwWNDtrpkQ=;
        b=JayrxAyQGQHLDAoxgiW40sweO2CVIFFYzEeHnzbogP/NvIGy+f+zcWNQ+CfqM2JudD
         r9gg8gl+reWYengXuLrm8KR1yjdrVQqfiuqzrPajWlx3fdtm+YADTrKGySAmLEGZN4HZ
         DC5sGgMp6g+L4s+iZK+8OQnu13KIrmZaQe+wHKeCX/5gaUQIa19/90IbT8T0fQb2rHu5
         5OnHRtzo05OpV+uzmFhK8LBBWnI/A2oD5JwoUQz2O2r0vS7FAVEB3RSn0gPgJdLntpyk
         7l1gRcymUfg/XgzR0x1JlB4BxkEPXh7uUv5IoOq9pmZT/ahB/MAPFE4AMMOu/toEz/Ah
         e0kw==
X-Forwarded-Encrypted: i=1; AKwUvBzlVEG6vwnpAVl9xrCIYo6H1ongGl7mFmyi7TjdoX+5RfWdtn1aUBsLxL57g4EMN32wA3w2c7XsdP5trfk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFc2fWwDHS3b7CmSeEEQhj4dJlVH9QL78kXz8SYRNow5WZcgMQ
	Ur8vheA5tLtam4KWzeb25umLUBgm//xcdbZBo7AUD2Rr7OIPDxeCKVSsgZNMl0brrL7rPR6RBTR
	wwqLZiXMoM40fRbUM7UhLJvBVi320vr+hhn2gCOGAdQNUxGq6rcVUCS9F6BpV3KoNx40=
X-Gm-Gg: AYBFou3gvGQf4D/8evwisK6ZyFiuwvirCremagmO9Hw+1xp3BvyyqWWCSNI08qUlbFc
	kN4/YlVNMcJJrN1oU09Mg5lgN9VJqD4V1ld4m1+J/QRtOsHpPktbEzSMiZc1SlioTEWLHOyqME/
	gSr1pNZc95AQOEJL32XeZYYNQeFnx71v+kYkayrUXgsUUDlhiHHdYggDQ3Lql1aMF4K7Ija/hmj
	bagMvA3ccarl07CBSwPjPfI867afJHuvTgs4lKd5C4zOWWFCCLm8O2XFmyhNe5DthtOS1VmSdMa
	xu033+vEqrK/NNbCAodM2Th5Lr7qAPSDtUoQjo5vWQgbRt7nffREguEeqoUxAy80j2lEJPnAD+Y
	X3JG6No14R6ANdU8LZqqTIw==
X-Received: by 2002:a05:6123:4204:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5e91f5370f5mr2016011e0c.5.1791822142763;
        Mon, 12 Oct 2026 09:22:22 -0700 (PDT)
X-Received: by 2002:a05:6123:4204:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5e91f5370f5mr2016003e0c.5.1791822142251;
        Mon, 12 Oct 2026 09:22:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae46f0sm484257866b.79.2026.10.12.09.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:22:21 -0700 (PDT)
Message-ID: <0eb6bd2e-110c-4a6e-a073-9b2b6c93d086@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:22:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm630: Add interconnect paths to the
 BLSP I2C and SPI controllers
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261009-sdm630-blsp-paths-v1-1-6a86ba193e8e@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-sdm630-blsp-paths-v1-1-6a86ba193e8e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX3u5KPd9d33Uz
 jqoLAAhH6RR5m7tU3UgDj7tBSaoRP9cqEkYZ8JaxE7uUWTHEvXdVo4ch7qpOMbwszH1xjodmpUR
 D+0urd1O36Q1OYhE1jWHuOnIF049MgQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX94GbBDB4kL1W
 pcm6fMgfrip+5amBaxK1wpn1mlCZ6inHGDUxAqvabmk2paE+Rnros6id9zSClybJpHx72QLiKnu
 nmPIqp2jksqHB44MtiD3dFdOLZYvMwDmYPTLXLmhRcRSUfhJNaJtE9o7/3pz3/T19Ps8vSHfR7o
 hwqlvyyut7+B2BTTjnE7o1TE/O9NxiGdTmXBd8Yzx1CSyz87OZaOuao70ZXKuGMfXHpL+YqyQkf
 L8MQPXUBrrzL3EESVaFamrliXdXDGFtHvHpnIE2EckHEoIz3KNVSP52kQzWQcibl74MmvYnxU+3
 Z/DgHXhjTAVOA5SWuxBUXK6szjGmatJ7QLWA7krFLGhYSQcPIXK1g0lMHCY5hq210CwAzTSJnNF
 sdNHkY9MKgQzH7Z5uCgFkRIar03Jpuva8+iEMVzF1a9VxEJfjYSS5u3KKNgy7lnWCUfRrDBYEei
 Ish4Mx1Dki2sPhyiSEg==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acd093f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=vvS0s_9CdDRdiUdw2gEA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: imdbUD-eQCZLM7m5buFTAc6zskK83XRv
X-Proofpoint-GUID: imdbUD-eQCZLM7m5buFTAc6zskK83XRv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120065

On 10/9/26 10:49 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The QUP I2C and SPI controllers move their data through the BLSP BAM
> DMA engines, which reach DDR as the aggregation NoC masters BLSP_1 and
> BLSP_2. No path is described for them, so nothing requests bandwidth for
> those masters while a transfer runs.
> 
> Describe the path from each controller's BLSP master to DDR, as the
> vendor kernel votes it. On a Motorola Moto X4 (SDM630), with the
> boot-time interconnect votes released and system-level sleep enabled,
> an I2C transfer running as the SoC entered that sleep hung the SoC
> without these paths; with them, 5,000 transfers ran through about 3,000
> sleep entries.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
