Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6C952269B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168663; cv=none; b=VGVpYWE09WyIWDs/A30P4xp6lnHbHS2+FWIV0WIKdEXRHHHmU9asJYsceyyXr0FEEK+MkwVCkdg3CqaTFMoyJ81TLCWZksxdMdnGY6jisJaO6jD2ONGUZoPi7sOhIePrNmZSJ+R6ngNbfLtqxiuhO5in7QeZB2/rzHlrvcrIp+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168663; c=relaxed/simple;
	bh=jAtUvHOL+UcHTw/1yuGYltepxe1MNq2D2AIdAMygYQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndMjMPg5SEpbklFkU3vL+we7W5zD++Pz0slyeVcDNpXDJzUh/9anzBlg80eBPIr7ivKN3kZlT4W7zWyyUeQnVvgi7i4++InBRYmQGe3vMDTlJzD7eEU0p3uc5LaGIy2CrMRdtE8E/wwXRhIqhx6r/rOAkaZsTEdJ5hRc12iZqxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k7z4xXkA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEWjqfy2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k7z4xXkA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEWjqfy2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbTxD3413818
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SvBLCJ2t9221TW4KYx3Wqjeb6+sRVpVtJ6KavLSqfA0=; b=k7z4xXkA/SZHfuhi
	vn9NYJh5Ahaxe+BXAwR8yjRZxLP4fJO9sswA51eQ1aMyN+KVgWKNMCTe9cfipXJG
	47EY/ccDUuzZ3MMae9a9+i1GRZS2jCa2UuGzOFaTEbKdusyM7JRGBiw78iQkBXrI
	Pj8hu5w1nBwa8GbTiBG0JBFKT3vDC4O0f1lQediXz8QuH8yUMXe/ZkDfyn+Pzzy0
	n/KZk7UWuwkQ0pwQ4PJMqJ25CL1sxzflSMYIQokDuC2W0cCLyn45pZGZs0QdKASh
	oV2Je+ZQvUeM6I+bo6xZ+NOQB+tJByfXS2u/YXRewmqRno/S5O11x+NSHRZJPZeI
	6AHVtA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n23en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:04:20 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c1a8def466so102883b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168660; x=1790773460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvBLCJ2t9221TW4KYx3Wqjeb6+sRVpVtJ6KavLSqfA0=;
        b=kEWjqfy2G6PvHxPaetag+A1fHiHfnVsS2QSSlwbx0N2I4THTv/wBirtJDvRMuIBICA
         ldABZBPPamygRBT4sGsAEfJBc91IFpGHJ6RENSb1DtaPoP3TIi94mm5bNUr+dcnT5NNm
         1C7/NjyVYIWKCdVkTOH3Q2kACIsfX+p94mHi9pj2gEORLwLV2MzsrRrpJMK+KA20u3U1
         lP1fF6Ry4Wqhj90dU7kZZ/CGO39Fcbm044hQslITRjZJ5K1tyHyEK52bs7sC+Zip0LLZ
         r6O8im6jmd+DsZyJLMmSUKx0Pt448DvVPV0aHeRK8q8I9ODN9PtkcNtASqo10Qpjl/2n
         zjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168660; x=1790773460;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvBLCJ2t9221TW4KYx3Wqjeb6+sRVpVtJ6KavLSqfA0=;
        b=k0WaHwyAHug+DrnhnIglAAxlm87CHAjCJk+taNosVBvuTkikfYr3VkqaLwAlVAeXjc
         vj8PxHz2c84+M4NRbHa/95+v3S+yX6vrhCd/I0fG0dZ2kYnYjoxOdLJhBP16tkyuhUmC
         iSwyHf+7ycLOTxI3PdD7+aMPoQOpJTwq5UB9RmWr9CYbbBDILovHsl5Wn9jPf23wEIFN
         7FekwzomsGzd6F3av9zxq2GPuiv2lktR0IJmVMxa6sWc/pBSlz9ZBV3sB0WVdHlR2xzj
         wCAqkc65m45df6czpl8FFbQN0MEty32iQcs3YGu+J7APW90DgpcKRxAxtU5tNSe5rq+B
         8KXA==
X-Forwarded-Encrypted: i=1; AKwUvByZchERM885eW8B70VATArPXM2hiT+8pIP+XR3UfDO+BIwMrPbnWTMwsKYh4G54cy79XnKi82Ogv/JeH+4=@vger.kernel.org
X-Gm-Message-State: AFuF++kCFOWbgeAa3EQ9K1WWAOyGZ8BGp5fJPdPj5G/bG7/ZEhNIROUH
	fvuqXiPPM+kfQj4hE19c2CA9jZoLeDtXjAhd3EbyWg8c9riH0fP0/kyQ6eZIuDkaOxv0GCqhP29
	AX8oo5lO59U07rAvW4efhVAe6mN8JhzrNrWdKOzb0XLVFU8jVEFjQzUbSNMJEPU3cLn8=
X-Gm-Gg: AYBFou0eqN/4buP6VlWLN88ApNShYIu/Ir6a9JkyzlaOUehqST4+ry9yMqhRp74znJo
	cHvqh0wi2Go6X/0Zb+iGJ5Ew5GAHssuXaqjaZM4fsDQSI7wKjv/eILcRC9ZfpSQy4JDCmXm6Jno
	bJnVx7Y8OpQ0hgjzh8eNKuoOVKHLfqh+D+IQlSIKM4y7vFZhhcW2LgBHvvORaI1F2rM8ZmGrten
	KtZv3j+xCVudpHKinw4RFkLvnVzrl/SQeBkZBQ2a6cw5ikbDLASNioFIbg7RKQP6Imn4h527+fK
	6ju6ynErrQuPj+oHrxrJjQ67OqNw/a6O+Gy/byx5eLWf7+SoR5OCF8yvtI/BRrms4gpsCe7fj0F
	0//Ihm/ZidfLFnTKrNaEzHC5UNsjXFzIS
X-Received: by 2002:a05:6808:10cc:b0:495:d9fc:238a with SMTP id 5614622812f47-4d5b8ddabeamr3350307b6e.3.1790168659801;
        Wed, 23 Sep 2026 06:04:19 -0700 (PDT)
X-Received: by 2002:a05:6808:10cc:b0:495:d9fc:238a with SMTP id 5614622812f47-4d5b8ddabeamr3350248b6e.3.1790168659264;
        Wed, 23 Sep 2026 06:04:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae62dabcsm115627866b.31.2026.09.23.06.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:04:18 -0700 (PDT)
Message-ID: <ab94b4e8-7de5-40ba-9306-03c4fb18fcea@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:04:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: David Heidelberg <david@ixit.cz>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
 <71e04eae-7826-4f51-bd6a-318ea1108c08@oss.qualcomm.com>
 <e4b32a40-4432-40c0-8e57-f5602c98f096@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e4b32a40-4432-40c0-8e57-f5602c98f096@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfXxqfW360ypC1w
 gdmXR5gFtNxkHnAT/ktkzgUZn7bEnHuyPuHlZCnPRVf83TJdiPlbpY5JpagsJmP5N1VCZH4+UTb
 AY8SA4pVOs4ILHFei4RfzNFjHsJCLpg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfX+bz+Qa3qJIpm
 f2X+s/YydflENO/VEDoVGXyVJ9VTXBvaT3KlfPmVewW77FqBjzBqTz8SrIIsUmC2S1sr7vJskzi
 RDcplEb/poQXPhg6AHyPXt2D/+e6kVgrfCCafWNmTjiJCyFNBo+Jj5IGcWlZyhN+7GcVXd2VWKS
 zqXW0o6+GXco2el03TjRQWDO5CMrUVt/HUbM6XZCBXRKGooawOwA6yxz6X4VgMJONT7UC7b0TGt
 eGqE9/hlk8pID1WVRgwxApb+Oao0DHuTRGx6bgeBTSz76z3O1IRHs6znNqelrox2OxXX6EaLu2y
 BgSyums9f02M4kxs+kqwYm7tjjZwI+9wjAA0Khhc6xyym9IKcXx9XTfQS7uEs067Rt1xMioD02s
 syLCitsWEqSaNZWxVI4xqZRKJ3GuB16IC/sIRG4/62bnmQx1PzmD7SxTcmrc/zPyfnB4ySgOEv3
 6kzaq45WwUy+X/g+SWQ==
X-Proofpoint-ORIG-GUID: 4isg5Z-Se2S3yG-jmUezJqVY24HT8EQu
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3ce54 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=80cRBlfBHqb0UARuMZ4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: 4isg5Z-Se2S3yG-jmUezJqVY24HT8EQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230052

On 9/3/26 7:02 PM, David Heidelberg wrote:
> On 06/07/2026 14:00, Konrad Dybcio wrote:
>> On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Introduce support for sound card and wire two CS35L36 audio codecs for
>>> top and bottom speakers.

[...]

>> nit: 'co'dec < 'cp'u < 'p'latform
>>
>> also 'c's35l36-dai-link < `m`m1-dai-link
> 
> ... aaaand **sorting nodes** broke audio.
> 
> Moving `mm1-dai-link` behind `cs35l36-dai-link` broke the audio.
> 
> For now I'm keeping m1-dai-link at the begging and added the comment why is it there, but I guess would be nice to have this solved properly.

OK. But please take a look at what GPT told you below (I'm in no
position to suggest what is best) since the automatic style checker
will probably be deployed at some point and may mess with this..

Konrad
