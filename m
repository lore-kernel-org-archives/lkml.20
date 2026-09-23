Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C4C2BE051
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161955; cv=none; b=V6Tw+Xf0hJmGdtZ08hNomky8IBDxXuBv80EI8uGYTtzq5m64KPV3gNstx1c07gvFSuxFiWJ77GUcXPMShzptpOnd9+9RpC+X2SSYk2GG475AMj9r0uWNYN6b6XRjylH2KIyIxTTBgH7PfQVPwNIGFJRVWRXA5Ft7rdk7ruNHXk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161955; c=relaxed/simple;
	bh=V2VJvOW840mB6HC3q2nKv+QwYl/C0sO76yt83up2DVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SWmF++63fcqeYqRqUoPeEESbnoZVReMuA6y4w6kJDkN7x78371niTqMuk46GaGC1Eu9NUTMroHi7+usUeXyg7WsnjJtkE2cAluqqDZMW76bAosb3MxqYMYPWjdMCI6MZ4GbzH7kvfw0/lPwaV2mPlOizZhs4TzazgVcxKRoVlU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aK04NABw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjG9LBRj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aK04NABw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjG9LBRj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NAm07s3663288
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BX0F61GdgR5H9GDUkQWTHDJL7SZk5K442ZqVFCkL7y8=; b=aK04NABw09L7up4y
	kUDONRmcp4isTM/bdQW/iOXgiEdRhRSRWb3R3Pfj4u77wLuWugnXYthQ2xkdTLsI
	su4+gY3LniN5es6i+Rl1c5ep/o5AbhUMreuqEDJcTWTWVcNpJgiWcSbPJFv8Ibqv
	Xt3QYV2Bme88jF/nb2edjciinQWM5ELlt6CDdJNLUC1QckeyVWvtSkaosktX68hl
	fRTQrAq9eUZKX2dpQifU4JtinNoZg/KHbcWvrbabpXN484kt06+vGA72Enu7yELz
	dBFZG8GK8M/aiOS538totajpa0CKm6OvFxbsMfk6mewPDJ7sC1vmaH685Rrwt4E2
	xrC/jw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb603v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:12:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33310847fcaso1370684eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161951; x=1790766751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BX0F61GdgR5H9GDUkQWTHDJL7SZk5K442ZqVFCkL7y8=;
        b=LjG9LBRjZ48g0bYkfxY0Hc7MMj12a5CNYZQ58MJw8qPtp7ADhESOx9j71uVYJHfzSd
         KWvsEfAhJ+18FWrFzqnn2xq88xdjR40bYYrxUPmsiu4n54A2Hm25pdb2jAo7rf2sW+iE
         0fYgAX+ymTe840KG9UGp/RP7/Dy8qJ/ZS+34UC/0cGgCKI26VgZiHCtNaC+Mtt9xQXUy
         wnmY3muihv7nnl+yCPVgUPvr1XmS1jdXsac0Yp3sNfg0SM67nPN4B5z17xo+mxIXNnVK
         DAgfDSZyOJEN7L/daUeM+bYOL9otvDmirMmZAOUrmmIL1pdYOrFVuyvx3coMbYKJxh2/
         uthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161951; x=1790766751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BX0F61GdgR5H9GDUkQWTHDJL7SZk5K442ZqVFCkL7y8=;
        b=tI+TBRf63A+XIvBr56C3Yd0aDc/jXfyfMFyEXf7W1IxH8uR4PIWoFpKLhMbc5uObiq
         tcad/4Fi4ii+T8jzmUWgPtmqld7IuqZ+LhwWt/n+tEEIPwPb9s3DJoLisTGihDglQG2H
         d5tlp1RiIIGFEL35WXT12hkXVjEmXpzxC6SzLHXhALASGUT3dYdtjCGZFkuowFyzuzse
         nqKM4O1G+S0QQ6/SUC241Q0j8pfxs12SCkxY2d+LOSAwEOsZynZNvYUTZAniogq5Y+lr
         pRhGeeBVpVhKiSuNrrWfY9N6rq0iIhEG9d1qa8Hcg4KCG3UQkAiTv6tC4Ol/O7JWLTJ2
         w8Wg==
X-Forwarded-Encrypted: i=1; AKwUvBy4mpQVG8Gc37T63zbuVNZlDDfVSTVuMEY0S6/XPw4BGECgH5IHQXYrfPX2p/9aDcJC3KH+xNhgIArq3VM=@vger.kernel.org
X-Gm-Message-State: AFuF++m0OsZqmmyr9xAabvUSt6tgCzo5d2edbSYuawixGCJQ8cfCFGut
	9/MIYkgpUPhTdKtVvtbsbZQEsXzNWbX4tLSyMiWhd7NF3MmxDAsnfuRsgjakpOa24O1To/g99iV
	rieuzDr6ibELkga9al20yf/kQB4goKbpYuOdTDsh/el/3msKn10oe+vQQdJuB/WINoCQ=
X-Gm-Gg: AYBFou1fogdsxYIVPT9x686aZxheC1FRRGZw12v71u+f2BUpCWzUIW4l6/SiUTQe7N0
	9Pz1vNpjySd6gCVy6m2+IRnywTsXRCDfR1v5+Juod8R13yhHATsib+qhav5exvF6zJpkWo6b8UL
	9YavwjIpb4x3lENs9wXiDqw5e6fniAXfbdGT7VUD9D8r+Ylon2CKq5pYcnaxM7FvJAvr6Bozqxv
	9piD4JXxk/MdKoki6XJCcb7EpzbpovNPbsikpNdzjhbeQaD8r+gSP6iOX6gJfXrI9a/wa8tg+vR
	B9vVMkMZ66tR/U5TJRc8uVBD5W69SRQdu1WcLMFiYa84ONmNssX2mAX/FEMaBWGI5ZKleqhZwNR
	47Avt60ykHxkon9R377UedauyAnw=
X-Received: by 2002:a05:7300:b10:b0:33c:342b:3742 with SMTP id 5a478bee46e88-33e8c0601a0mr2180568eec.12.1790161950630;
        Wed, 23 Sep 2026 04:12:30 -0700 (PDT)
X-Received: by 2002:a05:7300:b10:b0:33c:342b:3742 with SMTP id 5a478bee46e88-33e8c0601a0mr2180539eec.12.1790161949923;
        Wed, 23 Sep 2026 04:12:29 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7d003sm5442832eec.9.2026.09.23.04.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:12:29 -0700 (PDT)
Message-ID: <760eafc4-8ead-4573-9f51-1c7886fbde43@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:42:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] dt-bindings: sound: qcom,q6apm-dai: add
 memory-region and relax iommus
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Jaroslav Kysela <perex@perex.cz>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
 <20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com>
 <179008111464.3145305.16495726545311526155.robh@kernel.org>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <179008111464.3145305.16495726545311526155.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EzBNpIw_EZNRk0HeSs2RNtWHoTlvHZOt
X-Proofpoint-ORIG-GUID: EzBNpIw_EZNRk0HeSs2RNtWHoTlvHZOt
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab3b41f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0awkmHLjsCMGZ7zvgVIA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXy0E/dkv63nuG
 +kQJ3WUaMcohFWSpkOtNgoS0BJB74gj7HDZ5cVJSRRakzsQQinQhq1hMnP7994+WxU2WlZgLZ+O
 KFWVD7Srj1oGm0kjZNdQS74CZUhuTzk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX1w97CA1k9Epc
 DZfG9ct6LAlfY++KeZ/oV+qRKGzJco9JadedS29eyzfgx5rN3G8VwUAl98iFMpktE24QWEixljY
 lHc46PVJmE7q69/fvmQmSIgdW0tOiae2liM5SJBMyyXeSZ9as0E/su04FpzcPIqhAdqH5GtWQ4Z
 KdgObDiRFwwhn8dAZhQMsQjSmHNGqFc06dhYUT0hS2J3eDw8hWYdzDTauSMkxC2MdW3VqB3BOBp
 npTMgkPypBbZCDK4alVyAIu/4RpJ7sqTEDe/eF7g8sI7vcvSiWSMSxl+WNRt5jXwBj6ybuH1CqV
 WVcZk9A6WDE1nyEufYCF4f03434VVaPqCOoT2KbAXM8MfQXlOIVt3c9ca/w8PdQSG1RvWjWZwl/
 hDIZ/PVvLDmDvrwiUnqBuXT6wtfdsy6sj5l8tqEqRUjzdiCFKudX0psno11BQ031C6HnUrUhGkQ
 zPtCuzVeUfJUqHioFCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044



On 9/22/2026 6:16 PM, Rob Herring (Arm) wrote:
> 
> On Tue, 22 Sep 2026 00:38:11 +0530, Ajay Kumar Nandam wrote:
>> On modem-DSP (mDSP) platforms the DSP runs in a stage-2 protected
>> context and cannot use the SMMU. PCM buffers must live in reserved-memory
>> carveouts that are SCM-assigned to the appropriate VMIDs.
>>
>> Add an optional memory-region property (1-2 entries) for the
>> control-path and data-path carveouts, and remove iommus from the
>> required list since mDSP platforms have neither IOMMU nor VMID DT
>> properties.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml: properties:memory-region: {'minItems': 1, 'maxItems': 2, 'items': [{'description': 'Control-path buffer (audio_heap_mem) for platforms where the DSP runs in a stage-2 protected context (e.g. modem-DSP).'}, {'description': 'Data-path buffer pool from which per-stream DMA buffers are allocated.'}]} should not be valid under {'required': ['maxItems']}
> 	hint: "maxItems" is not needed with an "items" list
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Thanks Rob, fixed in v6 by dropping the redundant maxItems from 
memory-region. The focused binding validation passes locally, and I will 
  include the base-commit trailer in v6.

Thanks
Ajay Kumar Nandam

