Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772889;
	b=BpHUp9qNHMucps5DPoap0d7LYnLm7IUgeoazcYOgWfwaIMiLy808SPdCoJKp58GgKzXj
	 nYdLxCf96QWZfKZmX+MWpFYsgp/41k0Zzc+6DTLiG8HallsbKZOcUuJ1i63/N2/EugaOy
	 qMD5fAkst8fuHjMXg3ujEeAKeLQsFSvHDuQmsFppigpeWvO/gqQjU4zE5RIfthRhFG2BO
	 EuwYBB7jOTGTBYjTcSwyQo1F9RwrdJArerk/Z0h+mljYTcgXm8NUSStxeXUB3HUruiB0A
	 pm2+lWvkIiNeIvmA10wHkaCZ/3xP320ikXIP8PUpI9/FOikkWCQXD2ykusl7a82TSYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=;
	b=lrHkfWB3MtE6ki0Oe6nLn0iE01epFGcAYmdQV17n2GFf2VvssqsKiqA0RL8gXOTorR1t
	 rRnFAnyP5wZR1/27OkM+NXXRA5aJ/tq1exknKzF554Li4KdcptP6hZ8brY3h7IGKrSboi
	 K5f/MBXUN1CbhzUnQnA0o7iSqndDxiFcjLgn+BXr5qC3AlJob+mWpEd0PoMTXxfuIT0Zt
	 CEyTjDNLaDBPBzUwfGLmoU+g6h10XlNc8X3n48+877EMK6SNU4fhalIcJB0YmnEr+SCP1
	 3ui/nJWfgiFbgMkq4dW623FjnnIKzvVADZrfZqcJti42/jN8opQVB+W9ro56gDFWdcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTNkDsG9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hx6DAByH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50D6606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C50D6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTNkDsG9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hx6DAByH
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG2pwq3228246
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=; b=PTNkDsG9A5emxBdq
	Pdnx8L7FgDxoNVqkFA2NtbEIyf6WUMTnmbcDT8G23HbLjPiLCMt5MSAvJ/mD2ci9
	FICN5MdG5/wyNgBiGbRxgDDropOPEfi5FKebw9B2bsteteFRD2F1ncmHoSiIcZNQ
	4pNvD2pcEXQxNrIBSbFqNWbRlfAmVyaYlX5A5Iqs34WA1KZIrYzkfoSvpdQsI97b
	ISmo6r46Cj6qktZPtm43ptgJW8W2dMiXF/SmmygTq7HbDsX/u5SRc1+ByKcGUVki
	HMtxxSCkCa/xE5tihNs65C8BDUmF6IITGqIWqMtufiiBLaMQef0bTRWiRaUB20Zz
	tTXGsA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgart037h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:27:56 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaabe26601so76944e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792772876; x=1793377676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=;
        b=hx6DAByHxqHHpsqa+EIKQJzX/ToMEE9U5Cbjaj2FZaaKJbovJSAUxvQbgFxBgjb+Mv
         +Kqsoq9CVfpi9GllC6Kd0C1M1IRDfMAIV6ydzbI6+Cc2qz0TTNgRBTS0n/cRWexerO5w
         VoJ+uGac4uyIo5sJS4bNfoFPmeaVRfrySFeZGF6CYVUpMUWABEC100aoNigV49LdkQN8
         phv05OvVCaMwHlkechVSZzPYS/RYvgboY8w7MEKXH2sidG5dqMAE5SeV5MsdnmynwdXh
         1ZNnzmAna1lc7KBqlELMBfi/0c0HytzRJGLm22V45NyjXx4IkRRqDXjvBOw21eoxMM3p
         uLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772876; x=1793377676;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=;
        b=TrTYcFgmZGf+ZwlvdKz403shwTLzMg2URtW9oD5mxX9o2zFZjVQihJ4myKy8BzLcds
         61mcjdUHumJbybiGGrK4aMtXeypCrri70p0PfEdLlz18/Zn4aC7lRMuA3JWif0uEwGfP
         ngrxt/v/Ia1wA8bwt6RbxvSaVNVcL6bZaNBy7f+c6yRPdN7G/c3M7m/F32E09KZjHJnD
         2yvHsLqzQwRs074o9hTU8ntuhFLsBAWfGFfvqaQOiOhkPYnexjYctb7f6e0gVCfRME7S
         B34s/5Bmp/DUFC3IZ4Mbut/R1VW4eirNkz8BQG67hCoMf1pqVEfV0wuPagz3i3nSaVmB
         0tIA==
X-Forwarded-Encrypted: i=1; AKwUvBwC9ctyGi1Svdn+BCbPejV82aXQJpSQce97CVbiHBOOKEBJMyhndgySjTcnn5W5sZCEQSgCNKcTBKumEZw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPGGNabshgx9vcnWa1UawYD1cf4Nx5e8/17zjE/gwJ3dl3lRyZ
	H7pDru5KXXaLoc5rt/S6g7agzYN7UwuHs8cuhBpVOI6evNU6SMZguzoVuCipgOdXd/H72/rs8Xb
	Bceor5uu7ieSHrgf1FjKp39DAIn27ofZ7NttYAG09EP2gVx1GnAMtaCHuJiqAEJKwVsE=
X-Gm-Gg: AYBFou1DIrONkrLKaTreMdawTG9IALnjQwCETEXambYEXByjWzwPnWt4Nr0oG//fTR0
	/J6OGtEH2oWMchox0f4PnlD7eczBDSWaacF0vbp3uMQYr5r4TkvTpYScjtSZPaj79LgnLGck+Vs
	/0iOl3O0v2sNsD6dTUQu+lphaLCfO51M2Sy4I53oOJV/OD0nm3nBQeHVnFfA7jHQIWZJj5QQHRv
	mjTL0NwdyT4N0zU69nWWHmrIJkbRU7Mie7nMu90hbgnWSbMmzbO4tnfi03ejfo+OLAJf71FEqZJ
	OI+oEMUx1K+DphByIQ6nnH0atAnuQq20JpSOVynKJK7Q/ocmMQfUIfdjNJDwIqXsVWw9gjBWxyO
	U6sIUDW40ljjp2F/gU6LBWQ==
X-Received: by 2002:a05:6102:a187:10b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7ccc32a88e5mr1227640137.2.1792772875854;
        Fri, 23 Oct 2026 09:27:55 -0700 (PDT)
X-Received: by 2002:a05:6102:a187:10b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7ccc32a88e5mr1227624137.2.1792772875358;
        Fri, 23 Oct 2026 09:27:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4420e7268sm40969a12.9.2026.10.23.09.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 09:27:53 -0700 (PDT)
Message-ID: <15c97297-379b-45f4-af63-c9c71733ee52@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:27:49 +0200
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm630: Drop the cluster idle
 states
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261011-sdm630-idle-states-v1-0-3181d488dc0f@gmail.com>
 <20261011-sdm630-idle-states-v1-1-3181d488dc0f@gmail.com>
 <2e5bfe2f-f639-4c55-bb4e-e8893e9f098d@oss.qualcomm.com>
 <CANxzQdH3eC97bb+eef=wizrxoB4XfvROzg8iHFxCrN_a+TZiSg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CANxzQdH3eC97bb+eef=wizrxoB4XfvROzg8iHFxCrN_a+TZiSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NCBTYWx0ZWRfX0BTzMgYmE4nX
 PuE1TF2NKV0mM0U3t8uLnXjqLRMyDokuQqZ5MOC8dNrCTX+8OXnaB3x5+WESJw+ecSNTDroavkM
 QE1al43eUuU+Z/Y6Zg0QYvhKhOh48ZrZbvTJE+OkiOLiT2uIcoQR9TrpsmTv+pP6hqPuIGeeVYS
 iT2WxWykXtNF22V/EF6XRdzDdehfuXZp5IF5Kkd6T07UdO0iPGKYEEkS7WRy4PUYBmjvX20CFI9
 K8TliDKIAhgrNRFaRfw9ukuyXiQAh/9IPVLoHfAx4GABo+Jk+wLdMqaqLptx9qAwpZcbFutunyQ
 Glez3d5Fec8lq2e+CPX6o72SxcNFbfjGLALDH+KzcLZWaKMGhfWDzzB7imNSTxwrxXjmUycyuoA
 TSiUsHOKg96tswr8s1Zz7MtfsO0w3AMZy8+dz0OzOsNmyXDgOatOQh4ZKlJrFpaYYBvgRklUZgm
 VqJLfoK/VtUM4+p51eA==
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6adb8b0c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2CUSOdstmcgysknA9-EA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NCBTYWx0ZWRfX+vIqkNow8AIM
 VVUtgPXd+BtXOslrVVuJCf86m2FT07CfkE9cHQJasJNpsEm+S70vjU2TgVHeIW20ZLx4x+59Rd2
 4sqSR8628bivItIYNe+qFgBDhpJSpCE=
X-Proofpoint-ORIG-GUID: wmnPfIIDNLncwm_cOgJgH_iW1SSjEFPN
X-Proofpoint-GUID: wmnPfIIDNLncwm_cOgJgH_iW1SSjEFPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230064

On 10/20/26 6:15 PM, Fabricio Akio wrote:
> On 10/15/26 3:51 PM, Konrad Dybcio wrote:
>> I threw an LLM at the downstream tree and it decoded the states to:
>>
>> C2D, no cluster state    2        0x00000002
>> C3, no cluster state    3        0x40000003
>> pwr/perf L2 D2D + C2D    L2 2        0x01000022
>> pwr/perf L2 D2D + C3    L2 2        0x41000023
>> pwr/perf L2 D2E + C3    L2 3        0x41000033
>> pwr/perf L2 D4 + C3    L2 4        0x41000043
>> System PC + L2 D4 + C3    sys3, L2 4    0x42000343
>>
>> sorry for getting it wrong years ago!
> 
> Thanks! I had decoded the same values, but I didn't just put them in
> place of the old ones. This firmware supports OS-initiated mode and
> refuses platform-coordinated mode ("psci: [Firmware Bug]: failed to
> set PC mode: -3", PSCI DENIED). In OS-initiated mode a cluster state
> may only be requested by the last running CPU of the cluster, which a
> flat cpu-idle-states list cannot express. I tried it: with 0x41000043
> in the flat list the firmware returns DENIED to nearly every request,
> accepting only the few that come from a cluster's last running CPU,
> and the idle CPUs spin on it again, at about twice the battery current.
> Linux runs OSI only with the CPUs described as PSCI power domains,
> with 0x41000043 as each cluster's domain-idle-state and 0x42000343 for
> system power collapse above them. I'm working on that, but I'm not
> sure yet when it will be ready, so this is not a placeholder for a
> replacement coming right behind it.

See:

https://lore.kernel.org/linux-arm-msm/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com/

https://lore.kernel.org/lkml/20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com/

> Dropping the states is not the complete fix, but it helps now, because
> as they are they do harm: cpuidle records no successful entry into any
> of them, and since the deepest of them is what an idle CPU picks, each
> failed request is retried instead of sleeping. On the Moto X4
> that is about 133,000 failed entries per second with the screen off,
> and the battery current goes from 277 mA to about 115 mA without them.
> 
> Is dropping them first OK with you?

Temporarily, yes

Konrad

