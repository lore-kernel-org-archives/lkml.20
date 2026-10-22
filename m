Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664075;
	b=0nG+POMiOIVqe9Z/LcenZQLSmNLyvzx+e0L/U8GL+lci7OR79DqxpsDcXQxgsAb2+MEx
	 kx6yQ0YiANbdy/t6DteQ6jOFqcprbg5ZQ3yqeIo1hEZk1qih7wBo6jGLKjGNf1KEpnVAw
	 BaQNyxt7dhJ9Pk/1tIpBOX+C1YvOUZyFabFTToU+m/naDIC3kjhUT4MbF0tYcvlwuTQtM
	 rKIgkKztu/6tg7QnSTlTfwHK6KjsBv7NRA1j4UFJTH1YW+CmUHTucxxVobqb9X1ueWVIb
	 a6LygVR36J5REOf/wtkNLbZ/LO2a80j/bhprpag9Ck4KaU6PpKUq13Bhu9KeMXPJvPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HUE0GXS7XZN5IUzugzmvSNJ7RHIYozYf5z1Xco3daL0=;
	b=lxdt3PgMmXLBaAWr+ryFfFPF4AXhDOkTSapzPWu3uScsXYAN0zbRGFS2yc6weumi3vWi
	 UP7kvw03m9EsZIlySSO/q3ZPYbVXdZJRvnJ2AIvx/6GBWtVMRPaxEiLRYXBDWT6xQZ58r
	 4CLoyYxUfAw8r4a8q8qEXLGiaxjL3i6mOX1c8LXlWbcLq9+kv337R+91i8o4lbyeQrHxw
	 THnB5kry+jtvupzu2EWJvgCZrk2oXHxWqYY2gnmHJyFSmdjOOaoHeTwT1xH8Ag6SpwCAa
	 PGWRNu3gOawOZyY4lxKnr2iL3sfeG/oo+BE1oO3kCmkbHWP8An8nLMXiXddbXOLd7+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z3bA9Cc2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XJ5ctBke;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCC0606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DCC0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z3bA9Cc2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XJ5ctBke
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0EJY2919021
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUE0GXS7XZN5IUzugzmvSNJ7RHIYozYf5z1Xco3daL0=; b=Z3bA9Cc2wmwHfcbQ
	2dXZkTATr0wGHFo6NBXCZxGGDR+EO27hkpzXtAfi2tenSKG7qqXfP0gFmIucLf0h
	MyV0ng3YBN7qFqtcX5HSJkPD4Gkg50I34Zy1kdL2L9x0DFBmYs+7NeWvwptxG3qQ
	yAdqJGbpRKRW/wIKfPUmrzCpsgeCHThUzyZLhf4oUb4ineHgE4IWt4B6Jy0/0G5K
	uhiuMvKSGt6uHG+i3HImzTZd60MTWbpm9kyoBXPRk8XwXLPnnranV9b8SxmAm8C0
	xpbj0Xe+3qsnDXGKJW/8OAkBQKqokJ+TXjOZgDkMuoiNhzS2TdTVNCCAZGG11sW4
	4oSdiw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9wyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:14:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cac495d99so31211285a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792664072; x=1793268872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUE0GXS7XZN5IUzugzmvSNJ7RHIYozYf5z1Xco3daL0=;
        b=XJ5ctBkelRdT6ekouP1PD+Pfo0Zhva2e1J98smrdsPgMl8/p57TsV8Bk377mmmG1EA
         roQyqJSRmv0AMoLZ749cksCX5K1vsFtdvCSR2OgB6MT46wjc210mFoRvFeVbePVbNbn0
         nok4g7/bKiqy/IGwkh2yA8f7yOwS8PGlyjHhW1byO26piiQFea/+VSClwbR6dGvaoh38
         PDvrVLftJaeQv/cxKrcCKMYR40UQN5XDWjojh8q/xT7O9OcJtLC2eB9lN/6ZKNYxh0gp
         w9jkJTWfBUSVIPzUXOj3OlTKU6e0U1Ygd0a1JkQ7Q15qzlMz9/X9ciLvVyT7xkZOZB4x
         SEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664072; x=1793268872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUE0GXS7XZN5IUzugzmvSNJ7RHIYozYf5z1Xco3daL0=;
        b=eEMlb/pEmMhS6v4IopZ6Q1Twg1xGB0Ggr9kitgV+qDiIhyQxkfD3k96afPOfA3MudQ
         Ofiawu99htKJziPIH0i/c7BE/XL5UBxIMMstw+BrHKbHMIe3Bq2n1GDwbbrs3RJxl7u2
         CHdh4+jD4alJQlLKae8YTpTksxs0gmW6pPZFQbi8nqowtBuKmC4V5LIdD/N9GdZlu/5d
         6R1ZZnW8GDTLvYLnaT253ypJpXx8jqMSr5eUhRkAfIiNum64UiWT4daOO6TtRu/BVce7
         EBTEX26ewIeYECuxEdSHxWK02ucQHsz+YndO1UZAh/X0YWxRHiZ0vH6wvn220NbFS+lu
         o7Tg==
X-Forwarded-Encrypted: i=1; AKwUvBwNXtaRtX87KZJk1ht7arTBrY4WgitYPQqG1AvbUIMu+eEV58imKT2PzusQ+V2YK12QLMhTExtzn+9R6ZM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPc7qlvO0YJreDxe4q9Rc69a1wE1d+lR02VL8w25tu4wkelnk2
	qERvZmB2N2VTlaVcTJQ6orR5/8NvO57z1GIx3m+JxSuoCHqqj7vAhtfdywWj+Nl9p35meiGyETw
	Vx4cEXPoJUJxb3QMtFQgr2Y3D1XzlVufmmS63BP6mcYAYV/Vtcet7ozbGhOFodqCF4wT3ctGsrH
	s=
X-Gm-Gg: AYBFou0hRBVRPplbOu6aZH4uerEtmW7JLuXpHkIsBcNYzLenvIZgoiqA86CffgqrZwk
	LT4wgB9ucswbnCTrmqQeHK1ko57VRbLvaffEhu6W+qMG/ZtXXg9eTzwInNudGS5mHunKk1udtkP
	nKd4NBAaEsNeJj0yyWNMJWgXD067WR+q3RVNy2t4bDpmJKQ+E14Gx0RTpB1dUKg7S8X1VIbOv38
	TJkIKAto7kPMRkMZ+4jRHONhMdhSn+AOez2HyMzW1OGXe81gtW4WFAolE/UtbIh/jNhRXCTwGYH
	3qpLQKLBd6DYS7OEH4f7J7f1kDtGaDuFO0vRJ8Zwpab1JHBCB9rl2nxIyYxl8Xb1U6ThTVn8RV2
	vFCkoDtU2iFg99mUOAJuwfQ==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1137721385a.6.1792664072306;
        Thu, 22 Oct 2026 03:14:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1137717885a.6.1792664071871;
        Thu, 22 Oct 2026 03:14:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5dd548sm89397066b.65.2026.10.22.03.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:14:30 -0700 (PDT)
Message-ID: <e0becea2-c5a1-46d4-932e-50517311fb96@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 12:14:17 +0200
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
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
To: Reza Kurniawan <imkyufie@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-3-9ce2133c5659@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-psci-fix-v3-3-9ce2133c5659@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9e209 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VTptWAqQFsUFMNnqaZMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: yMToqkxMJSBPZgrxRBis3zf-VDjY-Ey9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX7Zt04lTtMHOy
 xAm5RP5hvaKfHqMacrmmE69Ntd+O9hQc0BhpVt6tHG8UKgc7UQAttiNAjuOoLB4o3xftNHudHwK
 ZRpnLixdxViYk4bzvaBcshZiR411VfU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX0eZbUMskO0sz
 /BI4OsR9gDdFuvG8qG786PEfsUxkv/Bcym5PZfoVBwncdOlF+eP0o95weUFMb5ojWFeI0R1qnvi
 bjsILlvsyT8aHDK49xvIE+jRLATAbKUthfMo5xIVCJSKd+xqW0GC2TffxcYnzOSVSio/mtxA6oj
 ptgln5S9yCbNxJNbiffQOb2viiBwzogZ0gf/kIMg29+O1SFELKEV5sCR2+/JKAZMqnMBCLPGKWA
 /nzImhQpMPCtkUvrNlesocwYCqTmSf5gaE/LDKUAxc7Mae/pB09kgNqHURIG++o3/F1xp0tFKdd
 unGSozk1/KWAceP52oogV3/0l5wWzctnjaxyJdNz3naocTscRsWNXbPAqQjuaFDTNYK4sIeVJvg
 OfixunsgxlqHHDrjp5F7xlAMhifCCo0Iyl5T/ctO80VquExsyf94Ld6mgTyJFLnROqAtNwpeX+3
 uWD8Q9QerVMnWC+0Mtg==
X-Proofpoint-GUID: yMToqkxMJSBPZgrxRBis3zf-VDjY-Ey9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220040

On 10/22/26 11:41 AM, Reza Kurniawan wrote:
> MSM8917 is a single cluster SoC, so powering down the cluster means
> powering down the whole system. This causes two problems:
> 
> 1. The system becomes unresponsive, even to common interrupts. Waking it
>    requires an interrupt from the MPM (MSM Power Manager) or scheduling
>    the MPM to wake the system later. Linux currently has no way of doing
>    the latter, so the cluster may never resume operation.
> 
> 2. Entering power collapse blanks the screen. When the state is entered
>    and exited repeatedly, this shows up as visible flicker.
> 
> Even if MPM scheduling were implemented, the second problem would remain
> and it wouldn't fix the system being unresponsive at idle.
> 
> Replace the idle state with PSCI mode 4 (dubbed GDHS downstream), which
> is less aggressive and can wake up from conventional interrupt sources.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---


https://lore.kernel.org/lkml/20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com/

and

https://lore.kernel.org/lkml/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com/

are in flight, you may want to integrate/test them locally!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
