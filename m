Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DF24AA018
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366104; cv=none; b=gFKCRAcrOUjUDDPapQBhJH79y3KlKPrkL6xWkBzG9ZraWuM6xu1z1kb/m7E8ZZPkgcDRufzDKFucbplw7SwdwZnZ/Os3J5hcK/9tS72R52shLHMUtflMP2Di4xPAve1piqvE3HOSc1PxY+8wL3cnOkRmUuQigHVDtNZCo8FGCug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366104; c=relaxed/simple;
	bh=TahGuo3Lcj2WLJB8fMf1qgiFJz56dvCExcf4jVNRKao=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kIWix4IZI0b8eINp2hdAJY8X8Sw7U+EhcVLrb1CzajcSuXGKyufA7RGOVchpU8OSqiLvlvpgIJuWQxxcF40RYxJU4sLUF8oBHw0abDe8+zVd4L+tixD3xdJcHGoIsn8H5xKuWpwLUBqSQEtYTfEbtNeft6jtfGiGcd8RiDtPGAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iHbFwbGE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PkknHQI/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHbFwbGE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PkknHQI/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZBt02177117
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 16:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EvXCVAcc/iZFfCMT3GRM70uAbTcPAN7trsG4OjSDXeU=; b=iHbFwbGEf+ovYvZY
	zVUMC5QvfDjAzZzzfQYexmEIpK/9gg7Nc9fdnoz0tKtT1N2IVpWDJdLD6u9nU/ef
	GU/L+y4N0suvaYM2ICxQIz+AVA8hHZRvuU1ir3IX7Q9Olf0Qxb8RZ0mF/jPetPar
	iyvhVlrnV7XCVolvmU4wRBGoVZ5K4vLqmaHICCvSg+FW+Wni1YVzjo08bOYg2QlM
	lgDxmu7VyjZybKWaC1zn1aTO9Xbm+twMtMUr+GKZQTnjuKkCP/zvlbkPgCdDoxWp
	D6kyKbev/ufLEgprAf/lL3Gd1U9Ks9njRBuh2VZi23236xK+f421l5qNrLQ6OLyo
	F+dHwg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh8ptd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:21:41 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c676017194so43005e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366100; x=1788970900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EvXCVAcc/iZFfCMT3GRM70uAbTcPAN7trsG4OjSDXeU=;
        b=PkknHQI/7+D6xqQGdnLbWKysZt8pIvFhlPWrbXFuKAH/vfinhy7CNdE37Tc5yArUvj
         9szgepKraMHm09vYf3ytyapTWkArXNeJawqrkEKxlLoZyMtUmd/uAuKAeiWwvdGHNCCK
         yXmIsBsgGB3ZmiJZx/pZqquujNancONmke5Wj8V4mFSPvy4n+KSB7Ypm7hKtLGqRPluX
         37D+QDw4RDlz40CuAPddzCQrzHtt95RZhyTO0cREjz5CSTcXi3eP1sXXFRneRuoMW+jS
         b1mEzcKVxA0wxGNJyIWZMqAwBAIQg5AAsIsz8ukC1+jZFjEaw9ukMQ11s3JQvBpbbd2o
         pLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366100; x=1788970900;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvXCVAcc/iZFfCMT3GRM70uAbTcPAN7trsG4OjSDXeU=;
        b=s/3slwzwU5jKkMxT5/rH+tsTxuz4J8wU6aN96zudAQXD41saxv5nVW9AFwTx0aMTfZ
         oz+ERwG+iLP4vpcuz6O32a1Lam7Mojg9mW7lJkAXIaMnzRFLzmCh0zyCckP5EOpSTO8q
         giYWcmr1wzv1REK0wL+r/S4EGoZV3uSdr/RuIuGC2M0w6X42d2wFtbfS6NRqzjeAsdpS
         hpvIlo7AjkahvbXhqBp8BUUWEDXHWHJXDAfQQ1giGE0xuRsGrLouDs1MZzPMuRUe2HDL
         zGh565Gjs73RiHPtrBq7sj1UDn6K7IBIymWcxF/Ueda4gP6jhA34MB+AB3pAtrQpJ6Bo
         Sp+Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7KsO15qwUMtcOYk4rkfYWFR34UVbGPnkG5uR5MKDer8g6WGQuQg8HBx6QJAMumbNFu4kyT2VUHtP+PGI=@vger.kernel.org
X-Gm-Message-State: AFuF++laz+sFaImjwikQzuVVV43MyDXKuVGBbu75ICKxqHMEVWX/wwpd
	9vBmDPgrQDDCX/30A1n0MA9qBlqfwVG9pDtM++UvgE3W/0l8z54ZfVY7tzABTMss7/jz+BTLDIG
	K2isI0EZDoICiKXeDwuXfb06Dr1UIYLPv6VC5UNl83DfeCVqWwHbKnlwq682O2goIJtq/bN9/EI
	g=
X-Gm-Gg: AYBFou1BYSN47TlvJrXYOQeFyi1udIFg/eJ6Re35Q17ZOutVIHsh/uxQhHHZDcRyt6k
	p15sOYfK3qTyH9SF2reI/z2aPqGIh9Hn6zg3uxWxoCNUMYUpqi6WTofilnVVBk1RVr0gCOexvBo
	0SYUx7IruNpnW9UN1u/Z3ThJUgOT3NAY6YlekMHG7URp360jYN3hs/AEj+iTu8jDSvN0Lr/oYaL
	JxfAeua13C2U/0IOYgD93tod8jK+G0jM5qp1s3ENqHObW0hJQP490TRv/c05oNhH9RcVTW5yhJI
	Azb/Q9H8/v1Sv35K/lrM9yawRYRRCzYkM14Jr8m4uVEmLMFgXRiMKPl2S9s3WI42WK8toWMGnOJ
	k+F7vel02pi24Ot82FHf1Qw==
X-Received: by 2002:a05:6102:149c:b0:787:74cc:2b68 with SMTP id ada2fe7eead31-78a1f5dd312mr919811137.1.1788366100517;
        Wed, 02 Sep 2026 09:21:40 -0700 (PDT)
X-Received: by 2002:a05:6102:149c:b0:787:74cc:2b68 with SMTP id ada2fe7eead31-78a1f5dd312mr919808137.1.1788366100067;
        Wed, 02 Sep 2026 09:21:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d002df62sm165902966b.15.2026.09.02.09.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:21:39 -0700 (PDT)
Message-ID: <73e4b46b-6a26-4124-920c-7638b449fc1c@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:21:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] power: supply: qcom_battmgr: expose CHARGE_NOW on
 SM8350-class firmware
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Jan-Michael Brummer <jan.brummer@tabos.org>, sre@kernel.org
Cc: andersson@kernel.org, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260829054546.86210-1-jan.brummer@tabos.org>
 <20260829054546.86210-3-jan.brummer@tabos.org>
 <a2f3de2b-90f6-427d-9994-a8b1ec8cbed6@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a2f3de2b-90f6-427d-9994-a8b1ec8cbed6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lTy9Bb6XLLF7a6W2RrxzUaow5dhzduIw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NCBTYWx0ZWRfXyB2HAGLJwQEa
 9P38e14xahzpqIJ9kaPsCt8hmzfb5ddLHRep1IHgyTnKQ2vbBqvAGAvVBilT3ZD37rn/rb3+NMj
 mS/9QB4lM4owhO5zTadwjYmiNa8RtDJsGveBsvHatRyAJKyLwDQvo5uA7H4n5w0jFR8pNSwj/6A
 MuWUIAEG6tyyK5hQEGlg8tAfgLbv6KyWPMTtWmaP8+fTi18vfzsh+EwkFDLGTUwscOgdhqk9XjS
 decGhU5y2mZJUrwwYV6wPDzHU9YrobpPmmKShH4uxrfn7F9nFIHBMv7GTABL7uOdqa7IuXft1pZ
 CYYiU0Dc8Mx3x/abfo4ogp8EEoJPNbYBzOlhQR99UQQuHqF+UDOGeElY/fJ4QiuRkWP4UMsHuk2
 bNGWJLNfjVHTvfu1fWLdjDwZJ8pqZe361JUoUarJ5KfnEUuRzav4Syi8poTQeYi1KK7TXFsCF5S
 80Y2dTjV1pcxPVCJKxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NCBTYWx0ZWRfX8zrrVH7V8pUI
 p+cBREdTZmebQdnd8Jlc+vFV9XMfS/gkPFgw4LLkaDK/nTF/v3cMkYOS6eMPepz69UMqFKN77Of
 Lj3JGONCeRO2w51c59LGa89z9W1tgD0=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a984d15 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=DYa_1O34AAAA:8 a=cKoaJvaT5YP-QF2Gj2EA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=piCpHeHFVjWJlYWd443B:22
X-Proofpoint-ORIG-GUID: lTy9Bb6XLLF7a6W2RrxzUaow5dhzduIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020144

On 9/2/26 5:02 PM, Konrad Dybcio wrote:
> On 8/29/26 7:45 AM, Jan-Michael Brummer wrote:
>> The SM8350-class firmware does not implement a dedicated 'charge now'
>> property. It does however report BATT_CHG_COUNTER, and on this class of
>> firmware that value is the remaining charge in uAh rather than a
>> monotonic counter. Measured on a Fairphone 5 with charge_full at
>> 4116000 uAh:
>>
>>   BATT_CHG_COUNTER   reported capacity   counter / charge_full
>>   2434614            59%                 59.1%
>>   3525354            85%                 85.6%
>>
>> Map POWER_SUPPLY_PROP_CHARGE_NOW onto the same firmware property and
>> store the value in status.capacity, which the CHARGE_NOW/ENERGY_NOW case
>> of qcom_battmgr_bat_get_property() already reads.
>>
>> Together with the preceding patch this gives userspace both the full
>> charge and the current charge. UPower now derives an energy level and
>> runtime estimates in both directions:
>>
>>     state:               discharging      state:               charging
>>     energy:              14.4347 Wh       energy:              15.6003 Wh
>>     energy-full:         16.8807 Wh       energy-full:         18.1505 Wh
>>     energy-rate:         3.39313 W        energy-rate:         7.3492 W
>>     time to empty:       4.3 hours        time to full:        20.8 minutes
>>
>> Signed-off-by: Jan-Michael Brummer <jan.brummer@tabos.org>
>> ---
> 
> Ok this makes more sense now. We should still gate the other property though.
> 
> [...]
> 
>> @@ -1442,7 +1445,10 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
>>  			battmgr->info.technology = le32_to_cpu(resp->intval.value);
>>  			break;
>>  		case BATT_CHG_COUNTER:
>> -			battmgr->info.charge_count = le32_to_cpu(resp->intval.value);
>> +			val = le32_to_cpu(resp->intval.value);
>> +			battmgr->info.charge_count = val;
>> +			/* the firmware reports the remaining charge here */
>> +			battmgr->status.capacity = val;
> 
> Let me try and find whether we can rely on this - on newer targets
> many properties are more or less just front-ends for vendor
> plumbing (because there's a ton of different chargers etc.)

There's a comment saying /* remaining capacity in uAh */, so it seems
like this should be OK

Konrad
