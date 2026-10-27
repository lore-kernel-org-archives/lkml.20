Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100846;
	b=a6VAkBE8s7S+H6WDUace7DIY1LWWLxLSfD05AhYFJoR9Pt97VgkHUIMnP+Gk3p2u/2DX
	 A7Shq2duZPzR8kDAIdY+TKrEsu407GVIg7nCH6UGJeedO+qMzrf7gSLp+2tMUA4rX26cM
	 9ZAcY8QQZ+xWlwH0xiHOVK0nMnbQvFmJ1t4oQMbOKRPljOrEy9H4Jj5CPESuzp5NiiTpJ
	 hM5JMJp/sTQ+EMmPQjphjgy5Q1b7P9dFeqy2xaR7OUuQ0ItdU4dO+dTNI5QXwMat/wJAe
	 8Sd62ADnfMQkxB5qHWkVjNiRYUCwhh6vDujfArALYVLo6JWy7IIJRKP1GsUWLH5gTfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9NnZK2sny34h7fHthZ2KAJ/JJ3o+yLef90wnW+xMkRE=;
	b=JqxqpNMAF1i/Q7an18vH/+Kcd9SmFyFxIIhhF3P35Yw0Qbm2wTegr1m6tX5xdUxzO0Hr
	 YXDNLTM5vdnrVg3eEZdTQIiPbnJyC2ORERCUXOGkX/x8/NYOV8xODhkr0doBItjUMwYE3
	 KAHZ8CIOdHb8BMcOvEb+Rh7ywpI8JA+FWgOXpeHgWCODwuXeGOwJY7009toAXaBsZFrUk
	 X8RcWrpeNWCnkNmm+BorCa/Qx5VLVEKDz3AWvE/ZHAShHOkOEyoySIwSlvVkVBIQE3XBG
	 jrcnRaeCr9jzygb2wpm6J1WBqIfcyxeKc9n4hNATc7xvd35pMbjj2yU4j4dl0V424Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UDKH5IxI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kVRD6031;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF8260A381F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBF8260A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UDKH5IxI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kVRD6031
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe6Ih2524882
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NnZK2sny34h7fHthZ2KAJ/JJ3o+yLef90wnW+xMkRE=; b=UDKH5IxIV0M1zIuK
	wfthDtrI33Q1APWL+XivnX0a4xs4ouEd0AFb5cAnlMA6Tl3Es/yAUKQX2EQ04j0h
	tl/9Xg5HqTRZDkT75hpX2dqoabff+OVq5TpTG4N1bzDuSdAdKBPd23y8oBsgsrM2
	tFBpiQIl94JxmVuII/2Iof+7fclT+/qrpM1sb0y4JGdIUJcliWuiEgYw5cuNjToD
	VJMQPQ77dk2Ozo/rNkCQ1u+R/jyGF5EFL/FmwZGEVRvE4Z7PW/uYb9qKAYoauQMO
	R/2Y6I+qJptUeWN1s1zvZMeNcVhnnn/gn1U39U54txoHHYV9qbRz2qgcJnB835kr
	VRsCTg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw20usp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:34:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so10794483eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100844; x=1793705644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NnZK2sny34h7fHthZ2KAJ/JJ3o+yLef90wnW+xMkRE=;
        b=kVRD6031Gq6bxMtGSh9EcEKA4RPRMAAcIW2iG3v3BPV8QSB6rafpIlPgf0UMsVKtlz
         IlN3ub5rgqcI2JeqFULEIiVfk6sREveyqZwPdKIJqC5wsdRpZLBNKppLGPRuRFr9OX8I
         hNikVyQOl01+HlaNmRC65uhdClmSQxeKBIrBJosajNQL+I5FDwXDV5F2oDkJ55E/m6d9
         GRgrFQ9eLe6qC0DKzcsPzF9wuh45qKTptWejgXmbSRvbsFPqCoXVFbtYKRtgcOlhuddD
         f5WZw7dma5d+Oe0v8fR4285IPgqxRMd4FSFEXflidnyKzGKdfOY9l3JTR6KKpT3qlOqh
         Usxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100844; x=1793705644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9NnZK2sny34h7fHthZ2KAJ/JJ3o+yLef90wnW+xMkRE=;
        b=2yhvxk2GNjFsTsvlln8c/zycOFRfZQVsh1l4s7W31mZxmuRAedSLkv0OJOrHr6nO9q
         kOWofVSf6XmFB2bRPLgAlgIyL1BqAkphgcRL000kdsOSSR2Bo2Lfg5bMHJn7rgEkueQv
         oegDrzgG4Z46m8e1AKMRibv4kyD4vRvpbF5RJsDESn+mPjN5awKAXXmfHcqgrKphTDms
         Qfj5U+SPJZujNWINaaXpqvEbikHxbHWTYi7hqbzbJTf3fbM4dydp4uQE7h0P5AIjkE6N
         LkNNMkWBEMeW8MX21Exzjj8dmgOy7uSNmxfNZGIhy7+40iZbVeKRqgcO6vFHHngDLBo2
         i5pw==
X-Forwarded-Encrypted: i=1; AKwUvBzdBsXOk8hqfa2SBa7mnhfKuFbCKQNoCZC9yf2eLV6lD+n/Ol6zwljYt1ChKXvr3BjuQYLsce+Um3q2fWk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUQdFW4qPMfz75HAmyYs/qADB4zCZ2izltuhQiCiRX12INr3p3
	Am1praTiF0Rw1ecAj+3i27ZxJJPFbFtAWTGYTWlB+Vb+XjzEBTe/pkjhhX5dNwSzDVsIT73Dv+j
	3mDccudz8hrvRIR+2PpJvpudiIPyGLW6R33IRu/0nyGWEv56IjNQ47TOqAyVHjIJ+P4I=
X-Gm-Gg: AYBFou1QZhG48T5lC7QVSRvcpRpagNPKf7a67Q95zDN5kBZVJelOHnDF2UjWqaoVSQF
	KqghgaPhqdpnbRNSRptuil1Ab1Qem4jSRxr6HRAfGXV6PhOgsQA5j9ZVm+Qb2drI/3yjKohUIc1
	E08VxYSr827mr7eqmDXGnBj4MGmkTUwKWoXoSYjrcNquv1GeafrlBnKaeexqovPbVjIK1a5qbZg
	uQrhu5m4z5PyGTSbWwV5AXaKlcw3wTTejsm1nzCtrIDA41UOAZQQhmRqGsD93UAmsDsb/+8w2kd
	DOgJFea/0W5PYdCGE4L0uuoBq2uynfGkaQtLr4VOcH/N8TUmF/SDuy2flCwATLD9N9BUwmTRCgD
	a1QQNZZtLXmXK3HAHDFZC520e1A==
X-Received: by 2002:a05:693c:2d86:b0:369:44b3:99c0 with SMTP id 5a478bee46e88-369e847b24fmr20368352eec.8.1793100843583;
        Tue, 27 Oct 2026 04:34:03 -0700 (PDT)
X-Received: by 2002:a05:693c:2d86:b0:369:44b3:99c0 with SMTP id 5a478bee46e88-369e847b24fmr20368294eec.8.1793100842969;
        Tue, 27 Oct 2026 04:34:02 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a064510b0sm17653416eec.2.2026.10.27.04.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:34:02 -0700 (PDT)
Message-ID: <3a1f6a65-4406-484b-a2cd-00019149d4a1@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:03:55 +0530
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
Subject: Re: [PATCH v2 5/9] irqchip/irq-qcom-mpm: Program wakeup timer when
 CPU cluster goes to LPM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-5-ac7f1a0d5638@oss.qualcomm.com>
 <b833f6f9-5729-4936-8c5b-cd42d32c5198@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <b833f6f9-5729-4936-8c5b-cd42d32c5198@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX2zZCTrpPrGS4
 0zjYRLg37UvwWgYyEAh2bF6EBjhGOfFgpqpbjVFLSYKaPwQpTVN04OrdOEvFP9xemrW0yL7tCgL
 9dWovZqL9jf4FZ4syb+enqM5nG6ItL1w3zIg5XuJSJnWaeI+d+B2Y2YGLlerpfW7VuMx9p8GCEc
 dRJvhwvGs9QyNmoHGxCW6oFVIRWIFbYsEbL3fpq3KU6xh2L5GKvhUEyj2N4Fs4glXN/ZZV/OTwm
 OYu/jaY16+ehGmUiHBEyiE5BtohUmQUC4S6II3XaLP9mCmkhI5FDhc3XidCMrNgACHJMbsZrKHs
 kxdWKSCzOqen7vkaSHtuW6ITBlIRVZkYD0Zg7IfiYWPXyL4CV5xUBBVAOq3BJJLOz9/uhyuRE4I
 tNgEDR89CHIu0L2vHxuxZGoWxgFkNpB5M4mMki+nCxw72ej1zCRhoaBN0EaNrC76vgr+AtBzu/Z
 x/cKp3v/MTVRoqT2Pzw==
X-Proofpoint-GUID: EN-zHERFN6gObQMfZ8lS83mYUqcieTYL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXzpxM5jAxy5Ln
 RV1cEdJJVaN20jeGRRN9Ywl5hkqZGGoX1Q4naKVIi3UYTzYqDPJmK0qPTPwUvTlOTtLEPIFMbVp
 nXgvtVx0me2J/UIbBmt/bMCFFOUrfic=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae08c2c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vCH4AkwshzAlar4tAyUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: EN-zHERFN6gObQMfZ8lS83mYUqcieTYL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045



On 19-10-2026 17:26, Konrad Dybcio wrote:
> On 10/15/26 11:55 AM, Sneh Mankad wrote:
>> The next wakeup timer value needs to be set in MPM timer as the arch timer
>> interrupt can not wakeup the SoC if after the deepest CPUidle states the
>> SoC also enters deepest low power state.
>>
>> To wakeup the SoC in such scenarios the earliest wakeup time is set in MPM
>> timer and the Resource Power Manager (RPM processor) takes care of setting
>> the timer in HW.
>>
>> Add MPM timer programming when CPU cluster enters power collapse.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static void mpm_write_next_wakeup(struct qcom_mpm_priv *priv)
>> +{
>> +	ktime_t now, wakeup = KTIME_MAX;
>> +	u64 wakeup_us, wakeup_cycles = ~0;
>> +	u32 lo, hi;
>> +
>> +	/* Set highest time when system (timekeeping) is suspended */
>> +	if (system_state == SYSTEM_SUSPEND)
>> +		goto exit;
>> +
>> +	/* Find the relative wakeup in kernel time scale */
>> +	wakeup = dev_pm_genpd_get_next_hrtimer(priv->dev);
> 
> This returns KTIME_MAX after the DT patches in this series are merged
> (because there's no power_domain that the MPM hangs off of anymore)

Yes that is true, thanks for pointing out. Perhaps we will revisit the timer changes
once we manage to add MPM device under CPU cluster power domain without blocking cluster
LPMs. For now will drop them from revised series.

Thanks,
Sneh

