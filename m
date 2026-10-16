Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ECE4756D8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146609; cv=none; b=Y3mKb7p1D6wZba05nxhYuxQKWjhgWVeONjZXQBEnTTBOSZmO3K3+dDhTPvoRwnUKraC7w8PosS3DG2druvdhulGRrMKoM9pFJ+HYFIHUAzerd0YRJJQAWINz4jyS/2wDpAP43dS3jCyzYNx3SQ30yniS9/Gn/Ubbi4TzcGuwnZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146609; c=relaxed/simple;
	bh=fJhK4HS6UR5SV0eI9RcAuHMKhQdO49cC23Ycx/JHgh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9vs8rXMFF6F2gpP8VQtebb0FDzGK1ZfyLH75Ka1qqZFDl5MeRPRq17pOwGCaIiCRCSlnwABDdg4+r7E7lCN5lqcYiS8GWwdK87zmTIVAtVOiVLJyGl4nmEvs7X/ETcwSpPko8jqVycEE4bIIHvSmeiAKMd0aQ5kiCaQsSlwYSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZC2yUw95; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ckUdZdP4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZC2yUw95";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ckUdZdP4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAAqR1946250
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5BV+EzuXrnKNRjeXd18ev/pbA/DKrL0rLwFMiB9prM=; b=ZC2yUw953tWfErXE
	2mkPwFzXBE9bFWEY46sXl6egXujqbnOvaR7R9YNg6nSqrPDFPFCbWCeuF07KXDup
	wfsb2pjMPqj5JM0e3zGO8XgzvSuSM47w96j5vBnmUpxaHffKJpkAMaKwrCGmqZRH
	llP+j7xtVPCKMXIFPLN6FCRvkc9dnx41MzF+4BHhML6wkKTzdwbpMS901nOSXPn2
	3DvTO+Tc2qY5MJ4CtSrwdYImxog9gJOmjB0X/Ad3pEnDpRnm2hMgewiJ/95JwQq3
	VKJlNRzkILkQZjy00wSKcePvWuzm6ZRLr6Shj0yxT6BoWJ4In7Ku/4jkfWok6yrh
	9PD8og==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yrh5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:30:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934a8cd3a8bso95615185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792146606; x=1792751406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5BV+EzuXrnKNRjeXd18ev/pbA/DKrL0rLwFMiB9prM=;
        b=ckUdZdP4XnLtGPWjnmdyhnZs7eozkeerU08WF46TprbEddMdiH+GiX6SsnMuk841OK
         cMl9Br7SduzXHzcYmL9fKVsICaz26u3SNvm6ENvxMATufDswlNLGpel6YJ3GLqMhxPqc
         tKbAN4YNEzKOewK4cJhnYhPZwqJ83NBZFZhXzgw5gsV8duu6YObSBeDLVfcg0iHf2YqG
         eEz8DGB45Hp5GOr8bwKWFstnnmi0gHroDPsDc3zk/DEkS4ZfxIvKDTVagIYx6GI6rsCD
         UMKOwEG143Htps9AGrCg304O5UQhJXCTXBWZiGE92My3J4dP+Rm6dhrMqyxLJU4icVBc
         aAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146606; x=1792751406;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5BV+EzuXrnKNRjeXd18ev/pbA/DKrL0rLwFMiB9prM=;
        b=cvtG9wt3qHfUtWliNZQqEvqYpZD93clmQekjnm32HW4rTtOg02MqGIP6ftoRhWZyY4
         5mbhzzrh/dOp8E89KT1zhMSy7yGRFqclqdL/AOJBadnk4z3bBhjb4LXOu3PzSRZbgqeO
         NW3NumOL5MMGRgugKSLM0PuDs15ypwf3fQF3wi7pWHtk0Z2uaPV07aQDIHd3N9bf+dd0
         meHpyItJ1CduwVRRS8ImqfQiNHyd2yEgySa7JI/kJLw+hvZL270cK5eSZcrWbn54OLBH
         DNWjbJokcKGsPczHzC8nAoyVYHNGMTxPZk1air25n9aCI8ZFgi5+F+xGiJ1YqGcRNTge
         SgsA==
X-Forwarded-Encrypted: i=1; AKwUvBxNqoRavKd/nKTt9cr9A4qB5lxZDXyRKGLo6xjbNqyCidXsKLmDT3KjuPr6h2NV6fvplKXJGJ2uwVlJJ8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrNsZk4FJ9dVjiwMGNpG9FGh4bMfhutGy8lOSG86YaalPUv9yE
	/p9wjATvTguPVgKl1b43T5Vw0jtbL81uHf/uufIGsTLkHdhSRy/42KXKy0LJOoji/UAT7o6nNpx
	VQgc6ntUPMPYX7cEh7CPKtkQeJ4cXA5+vjpwxsZPYu2qPVT4vDsUsUG/Goi9MQ9pfVCA=
X-Gm-Gg: AYBFou1VEzwT0KkRQV5jgncImHb22cz1xIg64+agPxVrHWW/jr3b5H9fxKMTpHpRThh
	5WXYHVmLpHgNmgnKs2xPxRo5IdXJaI/fNL3+yX3rnEVjMALDi5nHYMrZxhZ0cMIEAfgxRzblCNW
	2cTlpaSnSsxUe3FFR7HCURecyVKvkIRxfiC6a/mmDE0JCkAPNnnBBR2mK2NDdvFr3i1MVRfzQE1
	sqBLCNKdTMWQBAj33IcLwThrdm5gHtNDaS+mqmyZ3gmVRQ85v+F/ixQD/IU+IyhlyOqEEzHpW4g
	UkRtkek4b/qXLVPGTFR30mtTNEA9e/tZBZ76x0galmjaV4meB0T4xqT8TO8lUmqpTP0TJGJh8XB
	90wG0O6s6uOR/jIz/X1weSw==
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr284988661cf.1.1792146606309;
        Fri, 16 Oct 2026 03:30:06 -0700 (PDT)
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr284987941cf.1.1792146605583;
        Fri, 16 Oct 2026 03:30:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40914c3fd7sm57694766b.43.2026.10.16.03.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:30:04 -0700 (PDT)
Message-ID: <168f56a8-d66f-4a28-a689-8f52d9dbc331@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:30:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] regulator: qcom-rpmh: Add missing regulators in
 PM6350
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-3-68288ab70aee@fairphone.com>
 <ef06178c-5c16-4cb4-8ef8-3a7e1ccbf260@oss.qualcomm.com>
 <DLIIC89MM6AK.L02JKTJKQSXZ@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DLIIC89MM6AK.L02JKTJKQSXZ@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: amqp1BaecO4utTxj_pYxUPamyW2YfFtG
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad1fcaf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=N2Uf8L9AEDu0dafj2CsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX/reKclcjtAMt
 9MRLfYJKKWWyZDvyLa3Thsz/sg6hczp+eYHsLoSbO6kmm0SCxwbdvTPOe22Oa8pjA8eBXXUufjL
 7+JDQm2hGaAe8Oib6MTRL/RITLFdlz8=
X-Proofpoint-GUID: amqp1BaecO4utTxj_pYxUPamyW2YfFtG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfXyKdFUGXAsgCs
 iPhx6ssPTM4GuyEFmOTzcWaQBKDl4os/78ni0nMwcDTHx2zIM34PACI3HztB8qxVzenhgXHa5nw
 F2GSQLXYUSHIuEltkO7OcRq0uoeXtBX23BpoN82YpWB3qitSZzistoxVtqiuI29lf010H9GSK3Q
 yEK7fq9gJ+0opY/DAMSKdVbFk7qgW4Djrl/9Uc1G1zktzGVAqLGl24RHfZiWSygq6loXIVpuSG1
 RxbEQxnhmhlkgVzwMhyPo9JyUVuRkFj9Pry9Rl6gvBCw/dJP87LlHof9V3Zr1udiRJnbPCR2ZzH
 l+EOKNM4bLoWPgA20nO3F3ibvfmg7d8KO80Hxoqh6vMqth6xkqFSXKoIiIs+1XHMDyVr2Ng+jyd
 xEzg0y+4iZsO8ZWV9p6qCyPueG6OEg5Jt0q14F25ipMLQ+Prjj6CYWJhcIB9DHTqaJj5eeyr+Nf
 5Ff+sPdzvV/eHC0lJ1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160041

On 9/18/26 4:21 PM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Wed Sep 2, 2026 at 10:51 AM CEST, Konrad Dybcio wrote:
>> On 9/1/26 10:58 AM, Luca Weiss wrote:
>>> Add the missing smps3-6 and ldo17 definitions. While smps3/5 and ldo17
>>> are not used from the rpmh regulator driver on SM6350, the regulators do
>>> exist, so add them with the types based on the datasheet.

[...]

>>>  static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
>>>  	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
>>>  	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_hfsmps510, "vdd-s2"),
>>> -	/* smps3 - smps5 not configured */
>>> +	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps510, "vdd-s3"),
>>> +	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps510, "vdd-s4"),
>>> +	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps510, "vdd-s5"),
>>> +	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_hfsmps510, "vdd-s6"),
>>>  	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      "vdd-l1"),
>>>  	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      "vdd-l2-l5-l7"),
>>>  	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
>>> @@ -1608,7 +1611,7 @@ static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
>>>  	RPMH_VREG("ldo14",  LDO,  14, &pmic5_pldo,      "vdd-l12-l14"),
>>>  	RPMH_VREG("ldo15",  LDO,  15, &pmic5_nldo,      "vdd-l15-l19-l22"),
>>>  	RPMH_VREG("ldo16",  LDO,  16, &pmic5_nldo,      "vdd-l16"),
>>> -	/* ldo17 not configured */
>>> +	RPMH_VREG("ldo17",  LDO,  17, &pmic5_nldo,      "vdd-l17"),
>>
>> L17 (and other NLDOs on this PMIC) can do 0.312 - 1.304 V, whereas
>> the pmic5_nldo config allows a range of 0.32 - 1.296 V. But I suppose
>> that is something to fix separately anyway
> 
> Can you help with what numbers from the data sheet we're supposed to
> use?
> 
> In 80-PR887-1 Rev. G, Table 3-20 would suggest L17 is programmable from
> 0.312V to 1.328V while "output voltage range" is 0.32V-1.304V.
> 
> But Table 3-11 does indeed show 0.312V - 1.304V as "Programming range"
> for this specific LDO.
> 
> So the voltages from the Table 3-11 are the ones to use? The other ones
> can be ignored completely? But e.g. the step size is only listed in
> 3-20.
> 
> Sidenote, are the step sizes for the SMPS listed anywhere?

+Kamal should be able to give you definitive answers here

Konrad
