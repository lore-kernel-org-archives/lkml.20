Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374155;
	b=JxHjtLy7MOwgkQ8e9tCNTmx9szj5afaJGv0wIFDdg5pJIK5Xk9Hs30BV5kbI8IiHMHdv
	 cDrjpdx7tXN6Bnb1H1eYYPX0enHTpDq3mPSJxZG261oA+unJ4a0tI8wj7febNRqNQIy7M
	 O3sg0SBfOeVK94rOSAiu8is4a4Dt4TAl2jL1h7YVEOtmPebMkn2jHiXTz6WlhtZ9fr4LO
	 tq+L19QSpjjb3ULcB81iLCsZBnsp0P1SqdGDFwBCSSpJ5IMsVIPEEQM6Y4Qx+KUEooQUU
	 FrFd8vy6ZUqK6UXID+/uNvClwMe+vBh+RxIYEFywCXSTFtwR0Df5xgASRKMmM6iAJfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374155;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lpfxxF1BXeKYsOQeqaWCrwdbveAmxjDzeY39sdHqnnY=;
	b=30l3Gpwq6bqMSD2k/4V1MBtDOtNJkPIDnqVGmGNCTL2XzfTUWPdLw2F14dSSllKOczT/
	 Ws3nj+qrrobKNKb7ZX9B5qYx12ugZCd3RwlwXDuup6iw87oZPySY2xee50ZhJlHhhmr/r
	 4K4l87MeLC+K4m8pDUxglCyD/SXaYsyNghPborhx4SgHUSdVjEgp2oJ7xdMEqYMD63qTc
	 SMWgCMjq5K497NPL8o/iSL0eIdaXjcdB3akfcfrftu3qvqjqN4F9I2IdwqdoThL3/+QJY
	 tRSQzMPZNrdtrPTQ1fce5Wsk9b7q+iQiD+pflSFHZxpCOo4cNmjiChgXBD2vEv5izqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF2zeuvs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XjGU0fPd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8566606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8566606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF2zeuvs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XjGU0fPd
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERwFJ3208635
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lpfxxF1BXeKYsOQeqaWCrwdbveAmxjDzeY39sdHqnnY=; b=bF2zeuvsw8xTU40d
	HT3A/yDe4WC9oljx4DKP+7HSiqoE9+lGkf+ymTN21QJD480GTyQ1CJtgBZB3qrHU
	ImLYsqEaLETN8Bf3czzoU4YN2cyGFE1+OuswgKdL3Wb17SXpYgb7UYpW14Lz/qxe
	yJK+863j/y17yMbvgKRvcWSZX/dvSVqxQpCk1aoFQGpm8WJqnFL13Xbj19Y4SZFF
	mK5KdJyby1L3t8TcdmxyONIf3mU+G0I984B4n4ksG+ySVoLL05k1v3iTvqXL56fe
	RflZcfEETNCUegj4fE3ge8WiWNvwtmiiKtTOX/I057m+pb0IojphXTVCyAxB3sOL
	USiJPQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkre3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:29:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eb1f470a57so6051835ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793374152; x=1793978952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lpfxxF1BXeKYsOQeqaWCrwdbveAmxjDzeY39sdHqnnY=;
        b=XjGU0fPd/FoAjh95t5/VvQCDs+5TxtUzwmlg+vVR6Dpxf6XDog4JHmvr9vH4te1zW3
         6NJ1VUuC+jf8CbusDtfj0zFwmd/1PmAd/+qlSa7cpbmsDKR/Lw9XRyrka1TJ/tyRdWCx
         ZATq2yi2YyuSI2QUlFO4yINsS3HTRsnMTiM2qw4/XgitCmivYMn5LnoDdg7+J2vHWb6y
         kT+mYdgXV66stbpPUJ/hQzAHj2Mp3LA2aryyrKV1L8o37faDdaVDtOMsZ1YvboFy9Tym
         Cfg4LB8c4Z10Et12cQVkP3tIze7K/ab3efvtjqS6k+XcctVmPY/5TOt5wchMG074JAc9
         BGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374152; x=1793978952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpfxxF1BXeKYsOQeqaWCrwdbveAmxjDzeY39sdHqnnY=;
        b=EjzJn2/g6AvJUlkcihkPVWfgdz/CPKZT+2hC99zSfcvChvLtev4PNuEFSZ7PajT8DB
         eYsVvy9yuImri+QOB2fOFhUYdgIceRzb3WVCl0RtHE/4fE/u6fnVJdkm1gHuJ0wvx8+v
         j3W2H4Cz0/AFHKaEIWn4rAbVlPKR4tRoy7v3FfczjuZMsTwmeI1LMYu8qWzNDLvxPKrO
         veGk3LMkLqtG8KsLJx0wQH3EJIFdqIlB2szCXWz4vFpzBtCUcecNGAVx7Pl/SUME6M3I
         7QEXqrX1qSFSQM37wVy5isDcJIDpJw3nS8/OaYBWbcdh8s0JK0KlXncEGcX8OmtZaQrg
         6S2w==
X-Forwarded-Encrypted: i=1; AKwUvByQ1g4FVWtqKuaFlUqrt0hbeb2H52jSHEXIuZ/QLoFXyQ5M4XyixnYegx/N8+E+aZyO8C27Tuj7kPVDmPc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+yjuwIUVmuKq3A3rmWEgBsuR8ldg689feOl4Ik2jo2e3KvzQB
	r+aaDauAFwQTbown/5L84bf98J9RBDEYkKdgvc45cg4oEcowNIc//MtlOsF34H3E8F46oiDeguZ
	jVI1hCluHGFk3R36beeNiLVVlVYXfohB6f6mLtnF1clw/G0MifElBoGDFqkQqakwHkeM=
X-Gm-Gg: AYBFou0/fRpKvYkc3Dzn8o2qLTI996crM/DxqeRoydzrtz2A99PhbFkEFEKWOlvdlXc
	uSrvyHidhdivxP6FPyG4vlyULQxn/+LIE7+OaxwrPpfEluyHoVUvPzoYjqiSTOS/ga9zXOu2KIt
	ZMpr6H39KSXKZRFTqnYbmnsKVHaqVni8MzsFvW15E1z1vkApdT3OXom9PnGZSYdxsN331aCkalY
	L4L/L2buoSu//yTrRC8v95hzqwzC5jGilTI6tTRFHvUf6Smnq6r3edmwvDbVZiFCx587l2d2Ha/
	2kVFU+QhjvWnc1uTf4JX042K7ZATaBeUCFMelrB3ApECSbQRxs9UZ6onHYdDEjhKXJrQjaW2cr3
	xni/ICbh+cEavudwMwtKDBjx1+vzeYo2+Svv478QzfMBmdA71xXwYwDcTrgC+LaVxexb5wfaUC1
	41Vbb1G3Y7gkiv6c2ePlgMv+c91ndCWmZLzWOY
X-Received: by 2002:a17:903:3804:b0:2ea:fb8b:258d with SMTP id d9443c01a7336-2eb36401e95mr30024365ad.6.1793374151731;
        Fri, 30 Oct 2026 08:29:11 -0700 (PDT)
X-Received: by 2002:a17:903:3804:b0:2ea:fb8b:258d with SMTP id d9443c01a7336-2eb36401e95mr30024015ad.6.1793374151265;
        Fri, 30 Oct 2026 08:29:11 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.160.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392add5dsm9202195ad.68.2026.10.30.08.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 08:29:10 -0700 (PDT)
Message-ID: <7d443972-d4fe-4bb0-b758-49608bd27446@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 23:29:01 +0800
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
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Bryan O'Donoghue <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <23845ad3-dedd-4e24-803b-5abf3b030c4a@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <23845ad3-dedd-4e24-803b-5abf3b030c4a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae4b7c8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6d0oVIyUxUng7TJeo7N4IA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=l-QsVsxeav8zdcdG2uYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 8yClu4qpP7OZXdCkDYP8vRPOiP8wlyI9
X-Proofpoint-GUID: 8yClu4qpP7OZXdCkDYP8vRPOiP8wlyI9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX9NwDCYwA6TKA
 inPhHb2OgidquqT84ap1I23UhplHiAv0l3mfB3g4mMDoDrpAqBBAp6eM7diBKkreoXr+cQ4hP+5
 SniBl9Z6KR9GSyrMTJenPfQWmfLQQ0DOs7rLPCzI3h6iVMBo1bFfgOQH9FpsJcmOwysXP+9KTfN
 NO+dHIzLt9hPOlHnjmWLTwJ/7lVscvYWnlpFgzLn1b20CSU0SW/UBrHNKchpercdNWCWBEHOp0t
 WWhPRl5cgRa5jEkipFHgY1222+HSqhi+Shz5xbRPIcKPGsa/ZIaCzXReagYsTc4MgcXJCggBWIy
 wOaMcF3crcMbKogbVdx/k0MJVkphbpcuYV8liIo6K+IFBa+IPLagONrSw8bsU2Bl2cOmo83V+dJ
 fVb+cqHFbyjeYtkbp7tFJ1SrrVuVm6R3RltvoURlJI7yeML+Oqr1ElAZlA5lqVw0DJkw4FTA1Km
 GXV2lArgnlRj55Ck20g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfXxjMFG1fJmyNw
 cNosQJbmSWKPcjTENoODEHDl42V30BPCH3gZJRJll1RI8oVtOYn2RKTxoLN8menJ5aJFayBQsMx
 DA3fiMFeSnGwt8oSy9mSZtA9Z0cUcGk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300061

On 10/30/2026 11:05 PM, Bryan O'Donoghue wrote:
> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
>> @@ -6113,6 +6341,7 @@ static const struct of_device_id 
>> camss_dt_match[] = {
>>       { .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>>       { .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>>       { .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>> +    { .compatible = "qcom,hawi-camss", .data = &hawi_resources },
>>       { .compatible = "qcom,x1e80100-camss", .data = 
>> &x1e80100_resources },
>>       { .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
> 
> this insertion makes no sense.
> 
> In fact glymur should have gone up the top with hawi underneath it.
> 
> Could you please remediate ?
> 
> ---
> bod

ACK. Thanks for pointing this out.

The compatible order should be checked carefully going forward. We will 
correct the order and make sure Glymur is placed above Hawi.

---
Best Regards,
Hangxiang
