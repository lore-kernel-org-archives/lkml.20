Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E92D345EB5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137461; cv=none; b=C8d1qgSeI+MyHYrkGzEjLLPFnZGT2miw8ITOhZycneFTWZn/ZXkwmEDaS2T7W0yIu7+DR5fUGBgPeuzNtWNHiIs6SWr92CmVN9C92E5RsFLKC2/+4vxZcLEfHA+OpR4TQt5B3u32j2osry4FvpK/8ulPhaOxgjNzRuielhfWSiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137461; c=relaxed/simple;
	bh=b+gTCGiDwO7AAZUz2RC12nJzP656GpH4eTQ5xuQxetA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oS3+i6jroSdMiRxhgQOsq9xFQAoKqqNw1Zq1WpjANTyyyv7sM7hEEd0NGkYlsJ1kVT8wnlsBSOfDAS32sCmDnZgP7JnieL11ixyc1jmU6yktjHLHGurC0Z3L1YKKZy/PNP5kOJvO+ECNFT28XX6RlwgrUpxK+OH7rWAzpve7tl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dn7lFFFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NiVQevSA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dn7lFFFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NiVQevSA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEalld3722826
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cG+4bsboaubOONr0y0VfhGyfp3ufATAAnPdJy2AgpRw=; b=dn7lFFFU05o5si4G
	l0kJkSN4KE6AkK3oJthtsiODxxLnASEx0ZuBLimYaN4aajDJRB63x1F9qnr5nKJT
	VN3vGPEioBbP7GsdUOgBU3LiMLIy4bs2h7mrHw+bVWHLGpoI8nvge7mQS6AMfHL5
	Ts7I0GoShFDQZSUraMpvazJC9KC0KxVFEhIUtSuxZunQe7PXs8796qk2skY3lK6P
	3xgXp7NV+4L9G2TJ67aPjDxDgcZ9wTmJO8H459asfxD7KOXpEmpF7VVMtj86w/HO
	imU6rJkZz5DaMU8SHFf/tASgQof8PcyneBxsHQLlAvQFWhzht7OxpLXb+7Psn1Iq
	LQiLUQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729k4et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:37:38 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c6725e7891so453895e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789137457; x=1789742257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cG+4bsboaubOONr0y0VfhGyfp3ufATAAnPdJy2AgpRw=;
        b=NiVQevSAw30lIkcedEz683F7xYvg6WdQpPqWzemawooPjchtGFcEkQ3JWf244adZBR
         sr0Vi6u7S5vhsxcH5MiEZOn8Rqm+PFMwqSkQF8+KgaV5tA4Og5T8fI8dK/ornU3BmGAd
         zd29ehQnKS1Vn84EHx4o24eixts2hYBC1gYx5LcsH5k7Fep0TDkz5fIu75oW7bFGkL9h
         wYKY7VhxmxpuKIRD08b5xcCxL/yussVwI8jS7XWUp2GVVDAh9aR7zD1Ot2Zzef5vsGhy
         JaRpNbW/Kms5FIP3+u1twnTKMqFDMP9eMxpXaoX/hQRL9ow8R3sJ2cE1LZLT+QjxSJRQ
         7VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137457; x=1789742257;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cG+4bsboaubOONr0y0VfhGyfp3ufATAAnPdJy2AgpRw=;
        b=GaUISI8EdhjcA+84+OyynL9FQPJGZjRDiIKH9KTwbYv2ww2pFrTCRK+hkjVBZK4wCq
         FeasuJpfDgqMmpY708CA+5wcSA2lpTbuoSjfgvmMreyLnUgqUhSBjgS1TQ3mGBnoCTTM
         zb5RBbkNVN9Oz4cyv58G/U1WaDTw5/NHDSjjIqhCL+cLOHTBiT4oHZzsc8B3ZvOKI5xf
         aqfy8EmKcRqX6+TG/YIJQLwZ98fSbZhkQPD1pkP/Gv+fZtTg3YfbaCvGbToYWenCJ0cb
         W5MhezmSmXke9EGA9twjc5n01tCVfsnA+RT3wNFQ6/feRy21vUMHPhS+RQyJOSOkn+BW
         n8pQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZtMTM+3vI6SWwf8K53GzncQi2FRG2ckSX78uzuOnFAjAah/INxm2Ucv6cK7eHhEj1q3L7Lr9Nz49W2a8=@vger.kernel.org
X-Gm-Message-State: AFuF++l5JKfqu69LWmDIFgb6SOsC9t0NVpKwefU7+deE33x2OxKzX3XL
	583pBG5ww6yMYu9ZtgXPPmonsx1RnVFURSuwz4zcmj9gmTa5yxmIJ9T/66x6XKtq26MdNOePhDM
	rQfAzhaCOZy0v2kD9oc85ri9dAAi1gsch8yUbgpTFxK+DROCvNRnVHlY3N1w2Mv3GIXA=
X-Gm-Gg: AYBFou0GuqsRKbhy7kSK7ehDYNcC9DHG0UaFY/JhFFNQnbbrmtEqTjKYYCAuGfjfdjY
	R0zQiYeS1ngzZKCSJ9GR1VH4nrziOfM3AYnpJ1s/tizNqTubw6tfze2jHSVT3xBFuHSHdTWsJu4
	c6e0yQrmv09wYunPDWTmh29D6kO6/BpY8UzocW3uTWeRw8Qrc+3mc5E+k8dKjAexFKtjSxnnc2d
	cjxBO0C+AJELTKFcCDE5Par7qY7/emxTGN0deHWU0ScDviUy0k50KCObCgni7JVNL9qwdI7JSc2
	CvXAjhczy/EHJqmvTzj9iwDi4h88M5SywBnNYio6dqUynI4AlYuvHJka4vLKMUf9+9cvuvJ0ByG
	acYpS+6GVs47lHWrs/ht1ReQ9z2HiKbaKNkLMI4+1
X-Received: by 2002:a05:6122:794:b0:5bd:af82:fd9e with SMTP id 71dfb90a1353d-5c84632bb1dmr5919264e0c.8.1789137457302;
        Fri, 11 Sep 2026 07:37:37 -0700 (PDT)
X-Received: by 2002:a05:6122:794:b0:5bd:af82:fd9e with SMTP id 71dfb90a1353d-5c84632bb1dmr5919166e0c.8.1789137456827;
        Fri, 11 Sep 2026 07:37:36 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f0403125sm4105340f8f.8.2026.09.11.07.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:37:36 -0700 (PDT)
Message-ID: <cdb1109d-2d51-4b6b-baaf-30eac4b9f008@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:37:33 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] media: qcom: camss: Fix CSID-to-VFE all-to-all link
 crossbar on sm8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-6-gjorgji.rosikopulos@oss.qualcomm.com>
 <9b7cb871-1bdc-4a9e-9917-e16a53dd3fb8@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <9b7cb871-1bdc-4a9e-9917-e16a53dd3fb8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwNCBTYWx0ZWRfX+YtrNBsWuimC
 iLtNwgE0e5rWFnPnbN2zitnf7UF5QhaxLsKWM9dJREXT8fSDqOnan987VQZDPxBEWYC6R8B//rw
 Ls/O3f5stG7iYr6kFqa8JH6jKNPyxNI=
X-Proofpoint-GUID: e689ILNH47oSVnt_O9vtUwgxP0U2a_v1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwNCBTYWx0ZWRfX6o1G4u0viHLv
 IIU20pV+vIrnqNK1HH4MrBxU0XodqRCgS0zde+xwb1biJgHyvkzIcHatTQhPdj/q5jHYhFV1jV5
 h6AfoXqF9il6ZFt4hmLTk4OyL6QA51QWC4fdS6up5e4WgddJYM+Hpp/4eZADyZ8tE5Mmlph6RLi
 TzC7AwpIaksFRQExWVKGHFbpeBYCcAHKdCjJh7McSrHRojUyVGOZym7ArLX7mrR/rz+U1GhDm14
 Wc+TKxHMXPsvvh1CsOGoSAHFdE3PiOUcvjCW6DSLe2/bKrrDjykWZ2j2HwCsGy2RuOlwZmeltcU
 moJilnUfrHw6LRaCXp3G1jHVqC2gbIJo0+h/6Y1KKlx3fPeyV+iwXoveAenvRk57pAMPXE2E6j9
 bKcTC4Ijewc95jqx+6rAh5yJP0OH/NHEdF9UymJB963crdcU3Y02ZhStcHAkTzZK2QHmu0H5l1j
 WBmpZhcnSEiqvwLeWiQ==
X-Proofpoint-ORIG-GUID: e689ILNH47oSVnt_O9vtUwgxP0U2a_v1
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa41232 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=31iUUCM0u9l7UKhvf3AA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110204

Hi Bryan,

Thanks for the review,

On 9/11/2026 2:37 PM, Bryan O'Donoghue wrote:
> On 11/09/2026 07:22, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>>
>> camss_link_entities() unconditionally links every CSID to every VFE,
>> creating an all-to-all crossbar. On SM8250 the hardware wiring is
>> fixed: each CSID is hardwired to exactly one VFE (csid[i] <-> vfe[i]),
>> with no crossbar between instances. Enabling a mismatched link (e.g.
>> csid0 -> vfe1) creates a media link that does not correspond to any
>> real hardware datapath.
>>
>> Add a csid_vfe_fixed_pairing flag to struct camss_resources and set it
>> for sm8250_resources. When set, camss_link_entities() skips creating
>> links between CSID and VFE instances whose indices do not match.
>> Other platforms keep the historical all-to-all link creation.
>>
>> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss.c | 7 ++++++-
>>   drivers/media/platform/qcom/camss/camss.h | 7 +++++++
>>   2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 2123f6388e3d..1bb22cd23c5e 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -5000,7 +5000,10 @@ static int camss_link_entities(struct camss *camss)
>>   				}
>>   	} else {
>>   		for (i = 0; i < camss->res->csid_num; i++)
>> -			for (k = 0; k < camss->res->vfe_num; k++)
>> +			for (k = 0; k < camss->res->vfe_num; k++) {
>> +				if (camss->res->csid_vfe_fixed_pairing && i != k)
>> +					continue;
>> +
> 
> A) This should be a Fixes
> B) This should not be limited to sm8250

I agree. I think either we can have this based on platform, or based on ispif availability.
The csid routing to all ife's is possible only in the platforms with ispif available.
Please tell me what is your preference i am fine with both.

> 
>>   				for (j = 0; j < camss->vfe[k].res->line_num; j++) {
>>   					struct v4l2_subdev *csid = &camss->csid[i].subdev;
>>   					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
>> @@ -5017,6 +5020,7 @@ static int camss_link_entities(struct camss *camss)
>>   						return ret;
>>   					}
>>   				}
>> +			}
>>   	}
>>   
>>   	return 0;
>> @@ -5666,6 +5670,7 @@ static const struct camss_resources sm8250_resources = {
>>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
>>   	.csid_num = ARRAY_SIZE(csid_res_8250),
>>   	.vfe_num = ARRAY_SIZE(vfe_res_8250),
>> +	.csid_vfe_fixed_pairing = true,
>>   };
>>   
>>   static const struct camss_resources sc8280xp_resources = {
>> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
>> index 93d691c8ac63..ad0b42719788 100644
>> --- a/drivers/media/platform/qcom/camss/camss.h
>> +++ b/drivers/media/platform/qcom/camss/camss.h
>> @@ -119,6 +119,13 @@ struct camss_resources {
>>   	const unsigned int tpg_num;
>>   	const unsigned int csid_num;
>>   	const unsigned int vfe_num;
>> +	/*
>> +	 * True on platforms where each CSID is wired to exactly one VFE at
>> +	 * the same index (csid[i] <-> vfe[i]). When set, camss_link_entities()
>> +	 * only creates CSID->VFE links for matching indices instead of an
>> +	 * all-to-all crossbar.
>> +	 */
>> +	const bool csid_vfe_fixed_pairing;
> 
> I think the number of platforms where all-to-all is possible is quite 
> low - if possible on any.

Yes that is correct.

~Gjorgji

