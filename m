Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD04562617
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873340; cv=none; b=Y3TgcLteg6/PxIWpeFMFmPGeFygRngpDkJIP9LmVe3SOMC+A6HoTFwcQYBYsnbb5tlGtygyM4XCPZY6SoX0T2Prz2ghzmtEXaA48uYhEHTcZfKQxLInycTbmWYeo4r9OFmjqjRfYnjS+gZEuVoFpkl9iIhVTgwXQ9zi15I6/PFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873340; c=relaxed/simple;
	bh=Zcdpx+RNhi3G5SXrQ458cAnUNQSGCbuLRxF/WFPWRuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JhgwvAL+2c6w62BMjsGFOilwiVY45Hay+nVB6dyGNjKlftuvzir1nUu8KDT8U37Ks+rgSqgkX+4FWyslVZvRvA8P14OTgPgeKFGSBolO6vQZ/M9/iXWVfSlg4bYS3FWIAUR9Uc6PhHX2lD4kZlqU/MsLnSEgBSpEYJpTMJddMkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuxecpYO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xjxh2zgu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuxecpYO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xjxh2zgu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ckt1B3844305
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 13:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wqg4RIvj4EDznPdH5QGIsGmd5X2+Q2zBtKlvYGU1LoU=; b=GuxecpYOHeqk9Hn5
	tMZ/7WCZnCZWme6Z243IfcJ3Uw4W1q/nUlhC2aHKoCQX+uAzg36m+C9UeHSDKfOC
	iPsmjW9BtXfrMUyo8dgm2IQrJAetXDdaViKKtzoJasolUNlcVK7YvoV0+Xf2AfUg
	YR2DdW8RdyRAR/eptdDTodJqUm/0MhgUq5LeW8YYDNH23dweth+m4NdpjgYsW/NG
	SGkK6bSLPX0EpkiTm+WIHwomulj44VxqjVEqnnSGIrdwLiDSszbUqB+VaFz0YPxW
	3h8L/C3SxAJpzObxaJWQFspvASbh0Ht92F5OK1VmxCGDDRUDG3MdZwrqVX9llJ82
	a2trtw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjg8xrq89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:15:37 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c665139c92so83302e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788873337; x=1789478137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wqg4RIvj4EDznPdH5QGIsGmd5X2+Q2zBtKlvYGU1LoU=;
        b=Xjxh2zguwvL/NWWBWCewc/lZMIYertvOR549mm8JkT3JE9GNAo25OWwG2NnwVc3rZn
         dXXDamrb+PfF+sDkLrHCFvaV+0ehz7JFosJYv3IB45i7A0rF4FQ6oJuWeGhOstrdq+pQ
         611P58KIpYWbKktqRUt2z/cBvCCHU04cG5UU/sIVwE9CGnHRrne0KMvqmjvyMxduEIhl
         ga0mh1/YasQ5zzv1BxmwapGIgPhDzogDQfAVOmo7Nhru+iUkfyzWmgKxWhJEwSTaq4Z5
         7NUC7ZhuxFvNZSI4vb/qUA2hnYYtBgglS1gmHbiApOI+RKRu3I40n97i4knW6P+w1ML5
         juZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873337; x=1789478137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wqg4RIvj4EDznPdH5QGIsGmd5X2+Q2zBtKlvYGU1LoU=;
        b=YXp3+Bcgi8+SQRrauYP4dPx7EpBU04+lRdE+Ntz0XcK04l1rGLHVQHnr0CnkSvpf06
         40elj2tNC49LdIR5l24SfWOh5MCXSapJkAsEUh4vRAbK8NEPFdZynSZO22KfWN9UjV07
         oeiWav4WX8s2umJSV1bpiexJlmLAgrJSUYVBiEPgn4d6IGXYV3xbs64vrUGevmhdfar7
         OmPHYBsQdi3Xwd2OJIIljL12yqjza5ke9LUVfBQdiPtTJOqGWMw59R3wW4iJzdEhECNs
         U9OfT2HIFiOxTb0JJR9F5JO/W8FkMXrKrDrfsKTMA/toIPP0pXqKFowW5SCqp7zO0iMv
         mSPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnaZjbS5Ghsy4HzUQ5Op2X0trBz/E7hwAtYJYVs0drlKwxX+PK4w4HSxygfs1tHDH5slpVamHLdV/a3VI=@vger.kernel.org
X-Gm-Message-State: AFuF++mq3xzY7NYACzaRrV+2VA+tXKPC1dbkbKhOHt7q6T/17fy9JIZe
	1Evt0kt1uthbQgyj8LPHRkaFDnSmxDjIFIQ4xvwSfeXxRcuReICkpqlvkzfnxnqH0WTunXfn/gC
	Zb3ag/Olvb9Y2/s99lABQcOEUtKtx6k5K9X2Uf1E7eAZes7Avu6OFjmFS34XnkSx+VTs=
X-Gm-Gg: AYBFou31jvGYqHhYOuR3txaJ6K0y1YuTQSuUuM82CIQG0K5rtE6Hr/HcZCmTQC8VZsD
	AKH4qZOgMQDjip8GI2NqtTpMp9nn9C9ksgrVyrV3Ig1Vz3zK/LtxixFaRIJBPRkSPoFNDTJtoMf
	TYxh6Rj06agZTymruOj0p/fZNq8DryLml8/o7MzMkcCG4h/D2G/RaUpFrc/vVreSkHUGewnAIMe
	4IdJbyAQoVnkCfZM9wlM7zWRWl1kL7XZGyM2+qKiv/DVIAyuHMaBdJaVFbsf1EKoKdCKXbQgko9
	iHA7Az6TElGp61mDwu6RUTnY6wc3ApxtdqT4BQsdDZs+PcQfwOMm8OLxKbrnnKAXXyjnJtW2CG/
	w45cio74eii6byXhgy+eCfw==
X-Received: by 2002:a05:6123:5d9:10b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c7fb7ea227mr24550e0c.1.1788873336811;
        Tue, 08 Sep 2026 06:15:36 -0700 (PDT)
X-Received: by 2002:a05:6123:5d9:10b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c7fb7ea227mr24534e0c.1.1788873336105;
        Tue, 08 Sep 2026 06:15:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6167031f1sm3053010e87.60.2026.09.08.06.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:15:35 -0700 (PDT)
Message-ID: <de1c8eb5-c965-405d-bc4e-551926a886d9@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 15:15:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: fix fuel gauge
 compatible
To: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Caleb Connolly <caleb@connolly.tech>,
        Frederic Laing <dev@fredfunk.tech>
References: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com>
 <60faed5e-8a19-4eea-8272-145aca3db2d9@oss.qualcomm.com>
 <CAGHQT46f3wexEQHpcp_aoa4MHpi6vrtAd8Pbmt0KANdn9rANLg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAGHQT46f3wexEQHpcp_aoa4MHpi6vrtAd8Pbmt0KANdn9rANLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J7GaKgnS c=1 sm=1 tr=0 ts=6aa00a79 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ApsbdhC_8wnva6kFnVgA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: EMtcP1DDMK5LJ0KAGAwo3EJOa2X-RzFU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0MSBTYWx0ZWRfX9IilfXMyLTE7
 US6VdgCztt9iY3FrAsibAcTb5heg/NwRGz/OFxfWbIvXX1y8hlcpQJIuJLGOGvjasX+SK3bf1F4
 3iujV4ZFsU1orU4BVMcEPzYxr7AGk5NHT7iLLc6WahI/cVrlUKZABOk2DTGUG5LvowAcyF7HNYT
 GVs7w1zXVT2ZRs3hZS+zqJcEFfsd70FJAX7ZGe1+SGqFxkgqe497zl8dOZnHYkZX+lR7gojQPYE
 yu0CoDHvUe7sHDWUE/rMdEuLDKjSzVKU1k1e4FdVWqLHA6IQmw50RZur8i88hwHVgqb62wRdSPo
 e+QMcomKgY82dTWBBWNmN7Op7R5F5Wi5cO95PwwaxKP8GWCY5j4nwTuv1w6oNL2GKVcOhExMu5P
 nHRrwrUxqeycDSaVSsSw75kbAp+SlJ8jREOKPfkMg2eFXnYum06vGUVL8EomBEQJvioqtbaanrE
 ciDixe/u7OCR+tVBkmg==
X-Proofpoint-GUID: EMtcP1DDMK5LJ0KAGAwo3EJOa2X-RzFU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0MSBTYWx0ZWRfX3W1+5X+BzRZu
 Yyzk3Iiv8rTYAQrvEY/sqgZgY4OZqfiWp6+oKewf0ko8T+1DDghhNwQb/bBeZHRMLzTBs1tVqYo
 SoWyQlRjVYbxMu+vxOfynCiteyBcXJI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080141

On 8/29/26 11:03 PM, Rinat Muhamedgaliev wrote:
> On 29/08/2026, Konrad Dybcio wrote:
>> If I'm reading that thread right, this IC is on the battery itself (?)
>> and it seems to differ across different units / suppliers, would that
>> be a good interpretation?
> 
> That matches what I found while looking into this. Both the bq27411-G1
> and bq27541-G1 datasheets describe them as pack-side fuel gauges meant
> for integration into the battery pack itself, alongside the protection
> IC, rather than being placed on the phone's mainboard. So it's
> plausible that different battery packs (different suppliers or
> production batches) could carry a different chip variant, and DT
> can't detect that at boot time - the bq27xxx driver picks its register
> map purely from the compatible string, with no runtime DeviceType
> probing.
> 
> I want to be upfront: I only tested this on my own OnePlus 6T
> (fajita), by reading DeviceType directly over I2C on that one unit. I
> haven't verified whether other fajita/enchilada units report the same
> value, so I can't rule out that some devices out there actually do
> have a bq27411 and would regress with this patch.
> 
> I'm not sure what the right way to handle this is and would appreciate
> guidance. A few options I can think of, roughly in order of effort:
> 
> - Ask other sdm845-mainline users to report their DeviceType (a quick
>   i2cget on 0x55) to get a sense of how common each variant is.
> - Leave the fix as-is for now, since it's still strictly correct for
>   the tested unit and the previous binding was wrong for it, but note
>   the pack-side/per-battery caveat explicitly in the commit message.
> - Longer term, add DeviceType autodetection to bq27xxx_battery.c
>   itself so the driver picks the right register map at probe time
>   instead of relying on a static DT compatible - though that's a
>   separate, larger change to the driver, not this DT patch.
> 
> Happy to go whichever direction you and the other reviewers think is
> right; just didn't want to claim more certainty than I actually have.

If the driver can do autodetection, then that's a good idea

Otherwise, since based on David's reply there's strong reasons to
believe both variants are out in the wild, no autodetection would
suggest we need 2 DT variants (I'm really a fan of the other option)

Konrad
