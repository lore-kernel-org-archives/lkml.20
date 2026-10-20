Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476863;
	b=KQpbLHhC0Zkuw2RGxM6QSyRZLon7Mc23O4kqWZAaN7fYJIOxVHQ9SDQG1bXIaZknlovQ
	 3uJTDbslC2If00v9mXrhLo4ho0RToe+SaJ5PxCM7VMcOjyGml6Y2V5NYy6PjtfXP1/orA
	 YX7otJ8MYS0XH5k558TbaCZpoS+OyRtP7d4St/I3RidbCaxTlTa2XhZ7CSg3Nm7iI+kik
	 3FIrQ0CLuncC3bJYAD2Smkt+rcrnx3sqEEJE+XrTwhNJmipjxcrTwYMNk/sjX1/FbFp/Q
	 nlQss57NHvK+35YgpdWAciCBSBNi4f9xvF64PbsEdPpjrYsELB5mJbGe61eoBPNHqWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hpn5/imhVLkyJfVtXA9ZyfLeHTm0l9wahpNmwyZ1iuY=;
	b=cBhpOUpZK0Ds/WRATOszj5EsUxLNKQZMUeoPPuyx5UlQr945K5QrkirHsvM8jyvMtlSv
	 kbNTvUtijEEWCq2xegcd4+mvGdGYakx9taeOzl96FiQE5tQStrj/qIxDgCUgfqT5XUNBa
	 co9At+9zTq1BAkdojH+qlBVygW1qzlIRToLdVRRveDDEwkMcD2HQ44zRyTjWI0B2tGcbc
	 qZE3O8NzCv2kf80pLEUsdvzAjgo4mjOc9EvfYnZs9+q1jZf6tIHqmWEs4UMEbawEfI1Hs
	 8ueABUBlMvRx5bBUHd/hvyBaUdhpZzjOHKgBeiHAz9d4iNK+hHDyJs3I57qS3RCd0Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfKSDihK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HOiV4n2e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481E8606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 481E8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfKSDihK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HOiV4n2e
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tU3a620613
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hpn5/imhVLkyJfVtXA9ZyfLeHTm0l9wahpNmwyZ1iuY=; b=ZfKSDihKFacIqpqS
	d2+KviIIWhZ2wrHxLy5ztQw7gBdTjQXQXvMIA9yBUS/2k9EgKzGeNcRGHTOUeaAV
	IgJM5M84kimu5wAu2mN/VVJEyXSErm8ksu/ZNtJKioVKCaJ6CJPDFF1SnLNZtZ8b
	s6Re+s5FmExW6AqeoacLL19yDIMr3KBi3KTLNcH98zPJyj39tBn6YJO5am/lVAgA
	e4SEQYzbMmIbpYtJt6Dh/N7oZ8aclFn7mtXjjj5ll9L7PAvGPk2iD7KW62Y+fsbh
	/YBm8H8YObw3Z/0G0zHhYJQoIvGfKEJ0bqizP1ASXqty5ouvbBuUEreZMRm4kqqt
	Dlx3kA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ns2v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:14:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ae8e7e546so625093085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792476861; x=1793081661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hpn5/imhVLkyJfVtXA9ZyfLeHTm0l9wahpNmwyZ1iuY=;
        b=HOiV4n2exjuLkrjSPhWReDJKCI581JGKeqSEzq2JzamYrDDYUFRn587f+3OpvGEcYL
         VMVqCP9D1gRocl/qF36evYClOrtj8MBNHdR7BpTCQpuHXbpbNL72FjaoNskhSRPYSSbU
         vjlzDlDzYBVoz96r/gCRdhr2/maCjKBlLkCC7aldsFZVDFDfj71/AsTidDRZ/m8mTZ64
         5GjQR1pYwzQxQacp8VtaIV4KZ6fc6cM37IKM/IcL4yaZdBUTLG77WubJle/ziFA0/nyO
         mCAYSkVBXxzl7EyGp08Ac5AhCPQ0KRZK4KZXarXjxdt8IAngUSOXjVgeweysdWQjwwNH
         QBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476861; x=1793081661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hpn5/imhVLkyJfVtXA9ZyfLeHTm0l9wahpNmwyZ1iuY=;
        b=f5V02BovQm3vi19gOF0gcuKkmURS84w//z5PQJDuTvjeJWNhbGpRV+1yK1W+8md44y
         u2nS13lSKE+BBaGfKgyS6aDfbkmdokDzp9RxupQxGYWJ3I4OpOqbf1fbiUeCeXRjgvEA
         b8g0ClMhIyluUNCq7tOst/Q75R95IoaGLdl8YgVWamQTajh117+Zs4aT4fT1suyfVkIg
         jMM7j8GwU8dZt26pRJenpOD1ohp1SLGP9U9M0wX+criAEP54JKC/6qzHyra6CG4y5ybn
         FEf6pEMIInj9Yxihwgoje7zsaIrFIRt5B+ugKi5ctv/wNsAZljWEqnyXCv+3UsZGCPMb
         wzsA==
X-Forwarded-Encrypted: i=1; AKwUvBwOsaNaBMKJ8PT8ymEmhJilbz72IDB31APEw+u0/Ih358UkQ/x+WPzHekoMlbxhXs+GqBDdElaAl2byAa0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3RsZOcZ2W5d0wayKSnfTk3U7odeY/cJp08nLra6mVFDP78032
	gkRu02wodZqUGR9XmTbQdG0GV6yv15TMhLVEIqt3e0TonaXZVKq0BgAG4sL6/J0mtfL0utvZV8P
	4YfncPOAd/04ICQfgJx5+RGtQGLP+e3Nhk+qAMjIdQpUOQHAOZ2Ia54UGPA+zKQsyPJA=
X-Gm-Gg: AYBFou0k8Y0w3BmgZ3IgcoAK+JP6LqaSFoQZs7PMC8x3NLv/NE0PYsjGD1VR4hRuR04
	eqD6rvI7ebf3ljH1RY2hQAEwsY3HNZJYZfGy+8KyzkjQbojiWjv22G2GyjlLlI5vxA1Yz18/xc1
	u1Khu+vUz+IxRrB6u8LQIMIWBF2yC03IqxGyoQI4mZBI67b0ewbdzVlTT1lRMsQLzfCIr9XoeOX
	sMW9Oy6OUQ1U/1oAKNyBVZ1tcQlaUjJvqqcVRF2ih3OCNntYF8HTQPI4IGTaF12Cq0cEmgSpOzF
	/FRM9iD3MpJWXiUUuv6reIHDPYJBmvRhahlp+cqkY2MW0vR5zpORn+SlBSxUkFLaOI1rZtChqkb
	YRv8ywMVbGUyjCOvMbHx2/pT4Qg==
X-Received: by 2002:a05:620a:3715:b0:93e:c12c:9dd3 with SMTP id af79cd13be357-93f29e0afd2mr1621875985a.83.1792476861448;
        Mon, 19 Oct 2026 23:14:21 -0700 (PDT)
X-Received: by 2002:a05:620a:3715:b0:93e:c12c:9dd3 with SMTP id af79cd13be357-93f29e0afd2mr1621873885a.83.1792476860971;
        Mon, 19 Oct 2026 23:14:20 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm276350095e9.5.2026.10.19.23.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:14:20 -0700 (PDT)
Message-ID: <cdb55ed3-b19f-48c8-8803-dfa32000dc1b@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 07:14:17 +0100
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
Subject: Re: [PATCH 2/4] leds: rgb: qcom-lpg: add qcom,pmk8850-pwm compatible
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261015194732.64428-3-srinivas.kandagatla@oss.qualcomm.com>
 <179213351749.2581328.3338477962958404050@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <179213351749.2581328.3338477962958404050@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX9bS8RrY3RRS7
 jfSC/offHrktio7ZcVT6QHTn3JS85xuE/MggLqhud0iC01WUHiLO89qI4dAlov//r5CLB0arM38
 33/FLe+zbjivhspkb+7rcsidV35awYQ=
X-Proofpoint-GUID: sEJXSOqdxvzbU6TgdQL-LI2u9e8wmWnu
X-Proofpoint-ORIG-GUID: sEJXSOqdxvzbU6TgdQL-LI2u9e8wmWnu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX4uOYnu0YYk3F
 G2fHzcykPpgFY31+lmPhY4Cd9Bma4+ooAqoSuqI5LX3gKxAS0u5gyF0tdJ+N94Z7t5QQmYofvv9
 eDp/CQFs585eL3USC5rihFhq/dp+JmTVJHYT1lsHpVqNs8TRYR+jkL5XgUydPE1BpkNEmlt0Hwc
 GdDeGC4EAYsqZVaaOJZqHhzy2C6TYmLo8wrLuqbHCYTtcvG+AlxvOkkU98o8mSe3RdF1/HPEPH0
 a1yt1QicsWVDNM3Rcxq1lMM0R+krEMzx0XS1SdlCo8zU+2K1gei7XBn4uXtmR6ys/6ln8lFnyJN
 OGTcUgchtDfDlqnBgJcocrRPAD/suCUVRy4RfcTfxabAoDS2U3aI6j89cxlzD/Dix+IxzhEXzSf
 8hoaZ7H56stR4uChK5yIyft3Z/Rjx8rMS89DAmOZBobRRwdeyiA/iqA5KFSmXsQg9CginPjgiQQ
 waFrck33xd931Cb8y+g==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad706be cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VAR32ooWsMDrCBR8X2sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200024

On 10/19/26 3:34 PM, Lee Jones wrote:
> --- checkpatch.pl (1 issue) ---
> Line 23: WARNING: DT compatible string "qcom,pmk8850-pwm" appears un-documented -- check ./Documentation/devicetree/bindings/
this is in patch 1/4.
> ----------------------------------
> 
> On Thu, 15 Oct 2026, Srinivas Kandagatla wrote:
> 
>> The PMK8850 sleep-clock PMIC on Snapdragon X2 Elite (Mahua) exposes
>> the same two-channel LPG/PWM block as PMK8550 at 0xe800/0xe900, so
>> reuse pmk8550_pwm_data.
>>
>> Used on the Lenovo ThinkPad T14s Gen 7 to drive the eDP backlight
>> (EDP_BL/PWMR_BV_PS).
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  drivers/leds/rgb/leds-qcom-lpg.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
>> index 24ffe079f221..485fa2a7a848 100644
>> --- a/drivers/leds/rgb/leds-qcom-lpg.c
>> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
>> @@ -1837,6 +1837,7 @@ static const struct of_device_id lpg_of_table[] = {
>>  	{ .compatible = "qcom,pmi8998-lpg", .data = &pmi8998_lpg_data },
>>  	{ .compatible = "qcom,pmc8180c-lpg", .data = &pm8150l_lpg_data },
>>  	{ .compatible = "qcom,pmk8550-pwm", .data = &pmk8550_pwm_data },
>> +	{ .compatible = "qcom,pmk8850-pwm", .data = &pmk8550_pwm_data },
> If PMK8850 is completely compatible with PMK8550, why are we adding a
> new match entry here instead of using 'qcom,pmk8550-pwm' as a fallback
> compatible?
Yep, will update dts in v2 and drop this patch.

--srini


> 

