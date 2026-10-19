Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A434439B48D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408759; cv=none; b=W/xvs0sO0emG9kmaTCr5bDDgt70agea5880iYc/1xmelHRcXKpGSPBk1yTpV4DduLHitW0nc9ywtGP1Ap+ecnXIAHBO1BLzwj9SswdFMvAkr9oyRMXYGhThkDrBA4zq+2SUyQ09YFyM5PwQ3uWJT1t4Ess7ZIYVeFyDQSc9JQd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408759; c=relaxed/simple;
	bh=hicWBf/nVrO2B5eYi9m4lI3Q4TQg11SfjA+n7D5Muxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uh0rRvU1wpV1bbDoVqbBCHDKTYyiLoRg6NMXkzgZNJzdqOX4iEF4xGMzvdswVYJ3ns3yl0fOu476grRhGTKvldKlocu3dQYrvmDQBdE3QZL7H09YA14u9elnMAeg8/8dfqR+8m2MTznMLMVePKGjfsy7aLl1afRFi0S8hR4pons=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqaz8iOU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCsWx8s/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqaz8iOU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCsWx8s/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P3nn2042434
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VJwQ3LmwPXa1BUiwGt4fvNRB7J3oUm4v+8tRT0WON2s=; b=aqaz8iOU66AOsySE
	3bxvHMMq1Y3zs/8NhvncfI8jRm9FB+fixr1QBQo/JwC0L13/5QYH96xi0ABqUb1K
	gFzNpXV6yuL4gb4ThW0ufT5xXu4bCGkc9dXypvzolNN+15RAK0zJcyoaH01jGSIq
	PLwa5s3zWSmDFEZ4Ktn0L4imOQHMsDqqcKglaT+vuAp6iA/LuJeMRSUH7Hj7NkZ0
	FHmySMftoSkEDSaOowMpBb+OWesW50ipy98tsT3E8k/c3hzSwgUfxvv3h6lTGjf3
	8oFpZhFItHAVpKWAD98bzYTTQKaLMU+8uLGdc+c1AJr3G91lUTZ7uKo/oGalGBKG
	AzHPew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur2evj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:19:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3960dca5so20964785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792408755; x=1793013555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJwQ3LmwPXa1BUiwGt4fvNRB7J3oUm4v+8tRT0WON2s=;
        b=jCsWx8s/zLEOzqTf3s/wYXkTcoxXlAncmAUwUv01a3Oc+/CGflf0tcnK6z9Ep4KjRO
         2Lnx2tcngASHfW72IQ/q/zaGeLOYAGXPgKMlVN8YCChMwckTgFevpPa8qihTAw8qfGxy
         e6zcJyvWm/PDmfJV7t1Unbuh/KOVF7+sCZiwkZjaOE1nHso+nH5aNpB/vwTlnig+hljJ
         KWZqUV3/kOe/0jQnhohfFnJffjAHqe0jZw2U9LS+srvm+iC95+WpPVanXuS7f/dspjmZ
         hbrtFfCJSI+GwBl16M12LMDNq117v2g16BAA0YUYdZ2CYPTjsXHcMlmHGPBxYL1f/0/M
         KvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408755; x=1793013555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJwQ3LmwPXa1BUiwGt4fvNRB7J3oUm4v+8tRT0WON2s=;
        b=uybMy8J0sxwuSIxs/pJc0bLYkvr/34yM9sQRDj+XuQbeAu+sl6yoy4glC4QLyueMrE
         xpv9h5o/gcdJwe6KUlZYwcFAOBFcn1ffjJ+okZgihDhYbUOusC8lrlErRGfg3rg4vYHC
         Z4YGZM6PyDUkS1uZpxmZYTMCgKoRz95bg+5Jjn4YkkVr1+1LAqmMoTYzneaft58/uvvg
         5OXyUDorl339oupL77EyhkCakMe8U3fxcg+ff/W/2nmQRbmHEPuxVZkFtjdG2v+qsuso
         0X1YIjSqmMqwemFef82RgP4LGziOs5HpujK0elJ7z9T5o5kIrV9yTvmLSh9m3TiXaXfy
         SEIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwy6lnvKynoS8UahRBTelPnZp/TEN9AWYM1EK8G9KzW64lSAn89620UrQbPFKPHeANuA0bYbvIeluls0RI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeFA67LLvn7KonA16gJaGOCHqQ1t8ZHSWFHkZCI4l0u4oAI02q
	z7YUWsQVLbfRlvqq8FAqVVYiW98+4LFNPTXi8M13dyh+dai+oy5aJa1I+sGFKU2h1MBXuO42atK
	5GWUpTOAqvXTv3qqqweuxDIKRFeggAN6P84T4o6Rc5Z2oR+tzw/BxFUo/EQZVWfZHmTs=
X-Gm-Gg: AYBFou28+tW5Z38AHkp0ffy3RRkkhkOJuvvjWFDEaFdujPmIWPmKa9+2NkDfp8Ai3wK
	/mpNIktINIzkm10qfjhHbKtCzxBwsFRODUg+vbQYpwfcrxJOjpyT+jcyD6EkNnxatlPCJlGpI67
	1sHNGMoCmdsE8XXWE2QX+tfMSgILuG/tSa5sugLqROHENyWe5KM4Reh3xgLr1UYezDTCYsc9mzy
	iOq8fMofRrjZVkSxDK6g3bf5fo6p+zqn08m576fn1h/kDnD+q1/r9UfB4ekIPXjTtYFLtTmnWI2
	1JkMHykEVsbHBbXWB7SrxJMR8pRIJVWU9Dt+7BuqXp+DPqdHQ4fHWZHQtI5djVLNqqVsTzFAM2X
	9ekE2QAaN5jQIpHw14rv8YQ==
X-Received: by 2002:a05:620a:2948:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f29dcd9cdmr1236981485a.5.1792408754591;
        Mon, 19 Oct 2026 04:19:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f29dcd9cdmr1236977885a.5.1792408754046;
        Mon, 19 Oct 2026 04:19:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1eb8dbsm3646220a12.37.2026.10.19.04.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:19:12 -0700 (PDT)
Message-ID: <d4e2fcfb-856c-4fe9-b0e7-fb8df4dbbc15@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:19:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] irqchip/irq-qcom-mpm: Prepare common access path
 for timer and pin regs
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
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
 <20261015-b4-shikra_lpm_addition-v2-4-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-4-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfX/Kt4s7QdJ0pM
 f7COuPb5/mINHdOFnA/FbyRP2Q2F/nk96srgL9RS08Q6xrD4zGrYc09crArFLtOgOj4qULRm0I0
 QTdUcEC9PxXeG06vKmAHDMeOce8/GmE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfX+gGaezHRw8t7
 uwmdIo+qS2tkPPJx/5kn9qn9/vdwZw9qJUmz2lCJmjShpwROsANHsSCLN3uR7fcp5JuXQuvHUVR
 y/5Cbwh2eY9EhRotFOQfkBrjPsa9Ck+JDoV8V+/Ull+GWOaRwjJhDMHWzIX4z1S6f8XBZRbz3d7
 0nbt40A2cpPArLdkpFCTYxpBHqtPH5MZdPAZ2EO9xLuwUPRdC7nyYvr1riL/5ygf0Fb2JRmr/L6
 L7y/RInbHkZ3iBeHP2t7XDzVcUEvSgWapGkMM4r3glJqteqkwAtgbgf03B5wHfgnKIKWK+R637y
 /joqqThzubavllDWO+ZR3qojoP9bWCMShhIr4iV7WUCMet+WmOnHbtRhL66X/JLfsp3GYUr/2sm
 fxwuLPRAHhoJQa3GrPkAZ69gyNKpDjjPIPGRWqXvc0wgn1OfusMWVKKSIjbCGMw6SQ0HQ0WK+66
 oUGIlGQIxtvTIb4bYjQ==
X-Proofpoint-ORIG-GUID: FcQOC48KF8SAlBDHSvikYsxXwf-SG7Pw
X-Proofpoint-GUID: FcQOC48KF8SAlBDHSvikYsxXwf-SG7Pw
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad5fcb3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_QkEx9C7_NLcMqeofcYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190044

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> The vMPM layout starts with two timer registers followed by pin register
> banks (ENABLE/FALLING/RISING/POLARITY/STATUS), each with reg_stride
> number of entries.
> 
> Use qcom_mpm_offset() as the common addressing helper for both timer and
> pin register accesses based on that layout.
> 
> vMPM has MPM_REG_* values represented as contiguous register IDs,
> hence replace the macros with enum qcom_mpm_reg and modify the accessor
> helpers accordingly.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
