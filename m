Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658567;
	b=uq+26BPQ98mvhTt7OvZkKTfaNIUKZpuuo7QLY7Va6TJOXzxOXq1IJxyraK/2KCQTaKsj
	 Dj5K1ZKaBTZZsCPgT4Ocz54wi9d1VM2XtFro2WTNVKMRmmgOOPdHdb3LTDjD89+0RFYzG
	 yiQANnXryoNiYK+WlejmGUyO8FC5QWQp9HZoR6Ex22TUHv6KEu0Fj1nsWmdzNbgV7dDr8
	 4R2riF7+R6WQQyZG2B93lrisEI3ONWNotRuP3XnyN1GvRfjjQdfU3dHJ1ydOdMhPNrcNU
	 ypDA3XGT3sepmplqTdst96+fMYpvNgUyZ4nCdeG9mUbmDnMA1Cz4OFE1+QignrrABhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658567;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ia6LN6WREwHmv3zdel5zGUo7HEDYQPcun0fgWMYDdRs=;
	b=oqx2pXAUQsGeMFrwNEYYi4HljhnNHJPAG3JN4F3/RuHnFeBwY5aPUS7lHoP5r4EHxj4s
	 n/gTCqjKRkNjc1B3G4Y8m1ibQSP4x0gO1qFINfm0HrTyjrWQS6zhaLE6UknEHoLzxedjJ
	 IVrFdtyyQO7xozDv/fobaIE+H8mXOdQIxY5xyYXXDjl2oQy6dQMWjhDdqTAMUjitY61Fr
	 CefcJEwJo9hLoJ7fPPfn0cbEQ5CQSKQs1AP2h3xRbYT1xBfxJ6UQR0Jj4KPeu6WVXLwtR
	 2f5Dq4UY0X12cvqDq46zzlaem/w0d3v0q9QJ+j3ZPNKIH34oDVc+Zm1Xww4ZGTFJ4Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mgagUyde;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cpjh3hK8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC747606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC747606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mgagUyde;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cpjh3hK8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M701Ck2714175
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ia6LN6WREwHmv3zdel5zGUo7HEDYQPcun0fgWMYDdRs=; b=mgagUydebMG5Fzsr
	22bhGLvPM9MswVbY217xWPN6M/TTO7kNlOEh6Ti29k8WxCGeC7NUzmWJhl8qj6N7
	Lxv9lHLMPLjalrwwznZPzKkPjMhuv63agr2xXVMES6rrS6toDNRA74WqjTI1BJga
	DddMqposK0D3Kz1ESA3Y4GcbUllpezHoXpq+MFpSup7mWi62s3xpG6cRfPwhJyxt
	9Va5pQEn4xSlIQR41HU/f1+ms87Uz3gO6MD/iv1aQzwkCKnjy6yRtG8CzHsmh4lI
	8IkutG/UGk6JDTAHpROFRjVvI3IkUE4uJDVpU7Uq4sl9PFENqb541tkwqOJcnWxY
	8n7QyA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsg8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:42:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a030e0f9c1so1619701b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792658564; x=1793263364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ia6LN6WREwHmv3zdel5zGUo7HEDYQPcun0fgWMYDdRs=;
        b=Cpjh3hK8yRhgYFLXU84IPZiq0Ka9MKZcr11Vg8UR+DFXoJneaBoqFQrtIDSjM5byAb
         dcs8vkXhM81q1rwe5ncDmZGBfl9fIhSivd+mIzhDtMXMyNIyqoXY4LLhSjSWVTGjHz3G
         kKpm9hwvqpKcXPQgIewc9aXda7APeDqxJekg7x8TGETG9QSyKSSEcrY11s3xQk38Nr/j
         TR8TCfL3NSVAXQkYBZbjOvGt8gPqgH4LnXmW0kPJdhIeKMyzS5+MBsjOp926cuHAIJBg
         B2DnAIPhlkWPWe93wAF+mYiQeag/MiDfb/94tpwaMjpgIGTB8dyGN1Vaqc5R3FaDilWo
         06vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658564; x=1793263364;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ia6LN6WREwHmv3zdel5zGUo7HEDYQPcun0fgWMYDdRs=;
        b=LxA8noZV8mkunB2lv52IroI59iW1Oemg/0azYY36IvgXx369QUSePGafEYLS3FZEE2
         Z5AKXALMaYQsRN+mqsq0C1jlMP7Fy1VzwdiFjiIWyhlj2oAta7zvsOee7eDTdf52r5IX
         /LKbpN6aOIWvvmQ/ZcmlKgx/Ylqh5+h2g1r6kA8JtB/04/8UymM03vKWWDxdwKOkEz0L
         ih70TJGXs3xMo4GTfTM9jn9kvShwyOdFKkFicFcKnEyU20HgTgUFXdzWApQ5N0GsDUz8
         K+dIpYF45PFpV3E6RGZvBsa4jY0yXcJYj3kpKLoGZuYei5tXzl+NRnrFCT7xuGsNFx48
         n9fw==
X-Forwarded-Encrypted: i=1; AKwUvBzJ+aaj2hmEOpfGAbIsSngaTRNXAXeYp4YigmPXphOIFSuJMRo1kXCNSJRrTSZRpJ1njnub4pvp/zZVKXI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKClsACCsvqBCxfWvquIKxNZH9VSjgqo6q3PfUXbQAUujHnebAB
	y/fGAcrpNjwt3l+C2WIcgxBee6jjeQ7U1SGRZBSzcyBf2TSAI2+bwLIANUeCaieTeJZymXlxze8
	YEfQFIK1E9vaIf9aGxg9CCOz0i5LZpGxPi0bSrTCmKyAqOfXS3dugwyC8iWEkixJ0nCxL09ZOBb
	M=
X-Gm-Gg: AYBFou1VLGgoNk1HdB6RcGxm1QeKk25g/wjTzSBvagx6i2mSHZ+gofl5BKsfmE3xbwg
	G8Wv8arOpcjUp4nwtHMSkeplGO98inyhjTAPup5P2x9tfpqwveWP68whCtB7jW8FNWnZ3pO6twF
	qDoKxLOad4SL70BeMz31C1/YfgS5HyzmDzG9duRsMKMq44krlhqN87Vj0zsmTlEavD8HguyMtt4
	Hb9MW1P9oTooA+P/bIzhVkWWhd2w1xFbaIqRq65FEAkNIC29hdKQiltta8QgBi/LudtGm9pysKN
	Md0gsOVyiysn7Afz1MidIpssZe5x1nCSVl/ROj8SaeCHYXQHnflH5Fnbi3b0Ix78aa3mZsZRSzF
	UITeFbPmRXhMVgvbiDu/pKENESeLp
X-Received: by 2002:a05:6a00:ac8a:b0:89f:ed19:f093 with SMTP id d2e1a72fcca58-8a089dfa561mr3281515b3a.34.1792658564528;
        Thu, 22 Oct 2026 01:42:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac8a:b0:89f:ed19:f093 with SMTP id d2e1a72fcca58-8a089dfa561mr3281500b3a.34.1792658564102;
        Thu, 22 Oct 2026 01:42:44 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a274135f0bsm297617b3a.4.2026.10.22.01.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:42:43 -0700 (PDT)
Message-ID: <cc00f347-4008-4746-91ae-c2b583914cac@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:12:37 +0530
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
Subject: Re: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
To: Guru Das Srinagesh <linux@gurudas.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura
 <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta
 <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa
 <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
 <atXHa8ZhwEaVUlGa@gurudas.dev>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <atXHa8ZhwEaVUlGa@gurudas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XSL7NC1mN1LgV1d4UCa0nV1g5fEZ3wc3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX+niYxZGNsoJP
 r8V9Ifh2t5L4om3mqkFy/Y7a4G4ztAWcsnOgXSzp99SDq/ko230eXnftsSmI4E7BDghL8ozAmbQ
 4gUI8dz6LikmhFWDb6XoFtOjGsJta5dI6ngcJUudpQ12KCOCkCJBvsJMKleAM/4t2g8XkG1tQPT
 nMspFZB+l6+uYSd/WMwTCv2jhvfGG0ljGm91VeFg7Jord0oi3mLOMj0gHyJ+/OZN1lv2zTk+4+M
 hmldiU/KVJXeb1/QgPNZZfW/Od2eXc1juph+gqeK3PkA2SeW6p6CBEYaXtJdeEkh/gSBpcvFpks
 g5rge1S1zVn05dHkgbafxNUcyprCO8k+LTa7FkA2P59VsNOVqgUa3PQ4gFq1WlVvxTyiYhXz6+L
 /nUU2NPxv5ub3Fpe1ffTdYCyvS/VFwlsy6r6Bkov6nOkXdnLU5QULbuY3WdbjMUXCjI6HHcMWln
 18WA1mUVHvchnHXytMA==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9cc85 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8zo3re30kI2txGzbV-0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX75y+10jqtXIZ
 +q2VEZR4cktBfFmfqD7Sqotqt0tVaGQQ7XKqDbU9eXwgS9PEFcTpXhEYI06ufeiiT8NDr6rXhb0
 0PeSGOtQv9ECPZ+ZeP5CZyyeP5sM0W8=
X-Proofpoint-ORIG-GUID: XSL7NC1mN1LgV1d4UCa0nV1g5fEZ3wc3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220034

Hi Guru,

On 10/19/2026 1:01 PM, Guru Das Srinagesh wrote:
> On Wed, Oct 14, 2026 at 04:02:00PM +0530, Jishnu Prakash wrote:
>> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>>
>> Implement set_mode/get_mode support for PM8010 LDOs using the mode
>> control and status registers to allow clients to vote for LDO modes.
>> Mode voting is not supported in the PM8008 LDOs.
>>
>> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---

....

>>  
>>  	id = platform_get_device_id(pdev);
>> @@ -169,6 +237,9 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
>>  	if (!regmap)
>>  		return -EINVAL;
>>  
>> +	is_pm8010 = of_device_is_compatible(dev->parent->of_node,
>> +					    "qcom,pm8010-i2c");
> 
> Patch 2 adds a new `driver_data` match data struct for PM8010. Could this is_pm8010
> variable be avoided by stashing the regulator ops in the match data for each
> variant and using that instead?

Yes, I can make this change in the next patch version.

Thanks,
Jishnu

> 
>> +
>>  	for (i = 0; i < match_data->num_regulators; i++) {
>>  		data = &match_data->regulator_data[i];
>>  
