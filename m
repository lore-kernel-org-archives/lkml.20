Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080175;
	b=TZyrv2OOzTz8ZAxbu9+PfirIKN81sohvw+Ez/9PS64jI7aj+ibOs3pCodmZ39Bu5VtMp
	 bjwZ+EYkHW5hU/cMhotDIabYOLa84tbpZaSTe6AlUkw2qzIaKT2UD79xLGRR05r9HxKAH
	 iT9LjvQ7yAJAzjLZ/zOywBrwLS2yylrw6eCOtTBk7f8qa+djYKJHyEBr8pI+wJgIN0kaY
	 he9lBgAeKobyirZAmF6gLxQF3nuHVWceB09CJ79EDCrSMQA24UyEsInwKlpMAJY5CQkc/
	 WtOPrXd1k8K8qEdzbN6M1IgdKDZ554fpouQy1S3o1EWcQSduZzXl40NnCwFQJvlq+nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tdDzzb7njMmvh6JgfjhgDUzQ6IjYVoA2SUdOnYKOXKI=;
	b=FJni+GxEW9en0bUQr0UXu1KIJVW4Y+BN/yLDl+sGT3u26JHxsNgfRE/Rc6AeHha4wO7U
	 YhqyhdpL4bCTH7h+fVKEZz38NpDDS0qaKJeAXVJH/1VVVabrd77G1brU8rf43sUVImbIx
	 ywjToQfhPRedA5vK1zHVOkAGlsGGckSOP16Wx/fAGCDWdCy2SQ/In2Rx3VT6aWxghCBI1
	 Eu8yV1jd0NZoXLP7+1OG96CDyxa5IYwm3Q68KI0nBG7hH+xGiOETZrVMus+xV06zsqObz
	 Q4eoSzSBr9Jk0riwZlvkDsuSuePhf1KC7BC0nAWeFOhC4jwVmAqsUsvV/joX4e1yYcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hpxGzwiZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1kPF1X2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCA8606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BCA8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hpxGzwiZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1kPF1X2
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YwIh752083
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdDzzb7njMmvh6JgfjhgDUzQ6IjYVoA2SUdOnYKOXKI=; b=hpxGzwiZiSlsGp3P
	W9QLw6M5XPzomtb++twUI+iwwedHrG60xbKa5/ILDrcktnaL8yM1xnhnQSJd+6vp
	LlMANgU6F44dEUtizmCSHj2LVn/A8yK8VbrPG4P09Y8xwRVdkFHNY0w+6o911b7q
	ZkYvQqHC1oGi//5Sru+Pqu9NiTyW4IjrnN79PHcD5syyurmMO1kHdy4pjt3oY5l0
	n9iFcrZtUom7HSIA+eBGfzZhPijKgXGmLMkr9Af5OvxJbS+pdXMpJMayHvcErtaw
	pkBQDOkZOtP1h6QXdCOH7IQ/WAZCoOEVq7Qfs6A7DLIX8aYCC78upfwusa9y20R0
	GHixMw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmma44g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:49:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a190c53a3so71677eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793080174; x=1793684974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdDzzb7njMmvh6JgfjhgDUzQ6IjYVoA2SUdOnYKOXKI=;
        b=S1kPF1X2dQElSSRL/X4eRA/IESC96043BV+ewUBnp6mHjymkXvsxnAnDXQBxPr3jJf
         9kbsZyS3NuA9T9f22dX0U+SKMiZk0Q7dci3wGy/R8Ovi0p30hfql7wVhwtHoDHog3NIW
         64YX17NFVuvuqnTT8XN3HX3VE4RtR/dDlA8FGOjrJpn9NjEpy3yJqfmYpC2STi+aaVL+
         KEM8fL7MW8kOyIWEqVaNASlggeAHimxBbmDgKBzfCMoAUuPqpiNf/AITxvr6C3Fl/wOb
         GM0Xtplge7v7OJx8gqchGf8RhXkaFD08fVd5LessAYGEcXISUN2ge55RLZKywt7RW26E
         Bp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080174; x=1793684974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdDzzb7njMmvh6JgfjhgDUzQ6IjYVoA2SUdOnYKOXKI=;
        b=ICrKW24MmBhvqEsMlsq4D/B1PvVl+sAVb3YMgdCGFkioPyrcBE/x0Rnm9fDOqcdTSP
         90geLCVyspZnWe+RveXbk225Q0hoDg11OJSZI2bGWxidlpTfpq/L6ePNxtwKBOcj4WwC
         cjrSxV8mh8IEAErKj/g5btydzCHUU99UsDcFRSgFo+OvdMl9ybiGsH1MrpfraqyaFZe4
         gwOo1uEQnuG4CxntBA1rjUAe7L7iepeq7Edef495YKqThUBo91iXG6gJToJjgfACXYgt
         O2ZcliACVZ+4EKix34Em14y+OG8p0xluVLOI5jAfv8NeCup+CMNSVDdp/UvLymLVu0mE
         fzoA==
X-Forwarded-Encrypted: i=1; AKwUvBwe5sCEb8KnJ02E5Ll2XIy29nbMbA6P3r5D2i3L7eN++uRF+rC3lh9OgdNqUY4PoKsdJ3HIChEk30LuM3c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIz3IR1obmJfoDWeqZ87gE7lACLku+PEDaAmhuvgUAkmFn4GU7C
	Ih25dvSEO0NS43HGYIxYGwBE/4zlt2i63lMDDaVTYMSeEGLII83hAqxhWSJ5uUuE9+hv+Bq9n7l
	NEnMCiit6AQMURCF9v6XpzoPweY7qTuTwCqo6dv33xWQxamEDIholUA7RV450cCOpIaI=
X-Gm-Gg: AYBFou13L4HLmx2oZVq68cGj6JuCKgo6VwT0pahY2iPq9bJbTdGQS5MyrezCNv7a+kq
	/KCCayC0uN3uipJoO0FMhCrX3dCByLvkds5ywBUvIhG19GX+kqcQl9TIZm+lCY7hDN1I0cJmP4k
	SNcqjYmrstO11McBf6mV30PUaln7+qwwV3SWcQSLGIfU/d94zAPFM20PYP9mdmHmCVEAnwZtqrm
	+lBnUxcG11yl1KsQNyJGvlzF6gdj3zXTPsRDGZvlzrO4U129lYV5y5GKcDwT63+zWqVcSwYPkM3
	1iBrWYyGBUNgpo+QKvucMo5rD23lXitEpeEQy8yGFSHIeHQkKlyhpL/e4T0flGvlbxa4Zo43iFV
	y4c8CePg1Ql4B75GwDlfQ878PhTaFWeBd4LDRU8kp4PJcdbcqO2whRwW+148BKGa702yKRVHH8i
	k=
X-Received: by 2002:a05:7300:bf13:b0:369:fa21:ba12 with SMTP id 5a478bee46e88-36a0f7df5ecmr2031695eec.7.1793080173518;
        Mon, 26 Oct 2026 22:49:33 -0700 (PDT)
X-Received: by 2002:a05:7300:bf13:b0:369:fa21:ba12 with SMTP id 5a478bee46e88-36a0f7df5ecmr2031669eec.7.1793080173027;
        Mon, 26 Oct 2026 22:49:33 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm35294210eec.13.2026.10.26.22.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 22:49:32 -0700 (PDT)
Message-ID: <9cb32956-53ca-4f29-95f4-ceb629b9e884@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:19:25 +0530
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
Subject: Re: [PATCH v2 1/9] arm64: dts: qcom: shikra: Add CPU idle states
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
 <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
 <1f9c34ee-7d30-4ce2-9e88-93612eb897fb@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <1f9c34ee-7d30-4ce2-9e88-93612eb897fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfX3vpJYOdmK3kR
 UfK+t7Mld+IGfekob9pq1hlqr80x4AOv+Zc76jYfW8dreEeeNHXh4c+G2jDN4dkHAq+WC+k0vDq
 5aZpVRTxI+mpque+Y/nSIk7BjExNmMk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfX72Nv+ChNnX91
 CnzYrq9w3uLRCI/IFqR7TeaMuGv5jcnqxmM7wYWIxzPbk4evNCyuyMzxOEmodnV+cHLy514JByv
 dBvji3ZKeztGQyEcTI80c0nPEV4SAc8hrcj1u1H/th9mGqYBVTh5GpJ4kjq6TgXhc+TkpXTVUyh
 30aqeZOv+4jGZo9ERLN27Y6L4BiEmNxbIRJUIm57nEce4NIni4yUYb+bCI3iUyHXt9N57ofA/cp
 OR1+E2kx7mBDiHSpU4kkVW7+TFa4rJSMXEflP8N2vlvkVhWBg8a2AMJyPby28uIhhPp2O89UGoh
 Buifg8+anWiP80N4BNAUJdB0Tk5ohYKqcbgGMz8jZiYIJzW3mUaM7kzr615b1QfCc6FikICkPPF
 DfZf7B9ZdYZ2Z2e1wLjRvaGd1xvmetaNYNUf8DZfFVg2ioQDZzZ7BnFkgH384lkHc5s1TLIFHu7
 GsPw2BlrsmD5fuZolTQ==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae03b6e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3tai7eX4eetm6bD_N14A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: oM94V4nPejIFOD1WihCw4AmKkk9zFBs1
X-Proofpoint-GUID: oM94V4nPejIFOD1WihCw4AmKkk9zFBs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270022

On 20-10-2026 19:29, Konrad Dybcio wrote:
> On 10/15/26 11:55 AM, Sneh Mankad wrote:
>> Add idle states for the  CPUs as well as the whole cluster. This enables
>> deeper-than-WFI cpuidle.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		cpu_pd0: power-domain-cpu0 {
>> +			#power-domain-cells = <0>;
>> +			power-domains = <&cluster_pd>;
>> +			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
> 
> nit: ideally <&foo>, <&bar> instead of <&foo &bar>
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I will take care of handling this in the revised series.

Thanks,
Sneh

