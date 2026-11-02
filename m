Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615839;
	b=5fYhBVl+uiSRdmPvAa51LdUzu1Vm8HzIIRuQ+/yp5/u7feUlm7X1P5aMS5d0csFhkqEh
	 qg2OoTP1RVEnXPwu/sty6k27TBPhsPlITNH7OlM/2r4WmEyuzYna7rTlXbqcdsKuQ11Gw
	 DaNwLMYDA+1JxAPUjkYOYwVg2wZZg0NlMI7sTKd0wG9B9bbp98B7iMNNf5kpHFf5O5FwK
	 LR2SMqBpy1JCFg6lMAGJhgahRo/GbqO4xC9/K/AXqh5jBN0jJsP6Cr9LYz10BIxb/ylvP
	 By7MSmF0PFQ0+Y3mk3ktjg28aoWo0lr3MR7WfKfQQwiVITavnp94B6XsfwRxeBumerA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Uem9Sk5u5wAym4KNtUXWwa5Ya3q2ExNebAgCwip5iPI=;
	b=gwJ1sQmYxYdYnr/5VFL5miTee9pQeUkneI0Iv86b5FRirP+KC1auZZox9Jxm2qpV1nDV
	 Ka2ppz0+dJmeB9LKnpLKwGOHS9WB4bUZC17yROL5nBwzf76BqXa9xb4GnJaXSCo/SwpPD
	 cLnjxF3i910CXrPE2iCYE57fTRL40sX6i2vNr6bECHnS+RVyiFe+R7g7liCki76FytVIe
	 3rt1EyoACAstWYCo/toHO+BvmRDrvjcD6rwxZj1rgkjm8EJT/o4UMVhb7f2k4w9CEVVEP
	 EoEanqEbcgaY4hzT97mRfdswxyOLoTqlJ1t9PCrYWuYKukXVb6iGb6TjamD4dpJYySA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EVu4uLh2;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z+gHfoIp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BE9606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29BE9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EVu4uLh2;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z+gHfoIp
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ASfD3440489
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uem9Sk5u5wAym4KNtUXWwa5Ya3q2ExNebAgCwip5iPI=; b=EVu4uLh23CyAzH/P
	QSvqOGuYNbSUbidYYgRyPi/SyESPzukZ2e1DhRUJ4M0u8UlGHLy4dorkvTOM7d6D
	E+ukEU1SUF2GmQzTFM4vUJYtUcEmMchVuplK/4SxDn1t+A5q4UPnkXGPavMh1KB6
	6wJwZwpI9t0qGr3tqnH7NfBNlJbs0YflkSinRl2c6PLWU35Dy5q3L2GkRDceYOO7
	03Bz3Cvu2gmVrt3Lpnjx0zztTlcSZVneDhUFfBixop+x8/DH0J1qWUVBgi6guye0
	ukUmVYmdEh/hW1IfMpCiLmv4whOJqhwfxV1o0HhKgFppxt1ZlDFr76Zfr9LM7m9p
	C+CXjQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201wx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:37:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so577810685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615827; x=1794220627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uem9Sk5u5wAym4KNtUXWwa5Ya3q2ExNebAgCwip5iPI=;
        b=Z+gHfoIpRgik0K7mLyBMTdpSNAqu9Qb169VaZQfz9/Ei0oyOoqBA6163Pl6lyyTVmu
         cIA0lCAK9tKLMlVYOfHwXHOW9OmbxIxYMSOJl09gzfTiKaG2AJHtZnD1RKaDdIcsN7Wz
         sd+AOMmKcgC/ZF721BShUl7055PHI+r1N0OuZzAiXQHNH7g1I675rXbTO1ZmSGT7WJ3B
         b6wgnvOBsgzBAMDI98TxNdfNL+G2jp6LPdPVhNX0sswIJ4wY19owpgp2tKfAJZt/+rj1
         1ANUWSZmNlUQw6KopktZN+pdVGY5ppGcr5XxoaabkCaBVMnjFTXw8c+C2MfY3OLquWl6
         Vcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615827; x=1794220627;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uem9Sk5u5wAym4KNtUXWwa5Ya3q2ExNebAgCwip5iPI=;
        b=jlyz46nYWnp6Qvyccp1jInhMdyqfUFam9n4l0EXr7/Qqpt9TYBZdw/0CaCG01Z5Yk0
         jKZY7R20v5Uz22SdoB/KnX4ipHajNRk6iEx0yhVMVhRJ95aNXXxFNxmx+qa22kJK+ES/
         RrGmsJDh8H14e0nJLb0vysyIf9YIQ9qfwZAIT0nHVYPjjsIFP6a0/GXr65ihSFhohzXH
         81hyc2iBcnJrB9GGyurWtt0UZfT9/Hq4KUpZpd8nXyI7BQOonvHqF4OdckaRAvXmKmS0
         JUYVjm3WHUjsEjapT/JZ7+qis+Q8sa+yLnEg5L+kcaL+0KoDktyNhllFVaPcwDTCQqXG
         9Oww==
X-Forwarded-Encrypted: i=1; AKwUvBwA+dH7ZrzEtkCwov6B1YqsIuWZw9Vq231UIJHuHBR4VeoY5wPgIf0OgBxW3dyxVNTvZybTmkG+b3rUesQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJybj7E43ILQq4+LK0y3fT+EsHA330QQZ3zG38qcIRTZz4N5XVf
	TPYqzQGEp+wr9iTZtB8C4OL7qTLoIyWQWe5VN5i7xGnxeHzJDGJvtj9wh/rz69bzvmVYe4YmnMc
	OEuLxTiSDCUeHHWX7ZNHJWj68PbwDIGOesmYoc9CvylskEnB4VPD4j4GBRyh3CQPYxfQ=
X-Gm-Gg: AYBFou3qLh66z4v0Wx3ReZdrlkYI3FQTXSL0zAjgQcyyLSC8JOY1rFTh8qmQfPw9/oT
	kFtHPJDlolMiFXgtw4jiKfqszTDxBNsr3tp1k2GNWm8SxeoLVjenK7gOwBZ55hxkU20BD8MtBMi
	ylMZOLMlOQ7lb3F7guM0ZoTdeaBpng6h/Gjtnd+ssQj5h7qBPI0b7Lewwng03g3LeI9Dyy2UE/g
	bBw71JqF6XY96Z2AlBSG6qCgkwr54tXfvObuq3eI/A4B3jL+BR4VOSn7Kf7Wu1ZclTormn/cRTZ
	XhttHTuaxwL2IKzx2wqDQ5yS4Ro5L1vmQVsWq/OCsTX+ooTBVAyBxMt8mtz8oNAgDv5BvOd0pHo
	whnfU/uG6uhAXRcHaQYBku5uvVbSlAy2Gt70s3d0Pvro2yvMJEVrzqRnCQB/s+wymkPe9ZZ56Ng
	==
X-Received: by 2002:a05:620a:6406:b0:93f:2b23:4820 with SMTP id af79cd13be357-9442177e71bmr1490846385a.48.1793615827484;
        Mon, 02 Nov 2026 02:37:07 -0800 (PST)
X-Received: by 2002:a05:620a:6406:b0:93f:2b23:4820 with SMTP id af79cd13be357-9442177e71bmr1490843485a.48.1793615826944;
        Mon, 02 Nov 2026 02:37:06 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm18907414f8f.47.2026.11.02.02.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:37:06 -0800 (PST)
Message-ID: <cd3f4711-50cc-4a0d-9f15-455cec5cc1f4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 11:37:03 +0100
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
Subject: Re: [PATCH 1/3] soc: qcom: smp2p: Fix use-after-free of irq domain on
 removal
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Chris Lew <chris.lew@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261101202404.156522-4-krzysztof.kozlowski@oss.qualcomm.com>
 <8f91b302-8cbe-4bf6-9558-041ac10f4696@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8f91b302-8cbe-4bf6-9558-041ac10f4696@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1wpK1ZwwJJM9pWNsSaU_t5uPWWOs7Ehd
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae867d4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KI6MEPFJG_Ll42QlAT4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 1wpK1ZwwJJM9pWNsSaU_t5uPWWOs7Ehd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX5zo48bCnUFg7
 V1VsXuN+yaF4ReY5gEElbAN4ovhmfALBgIbDfyNZGYeIybo0Hvr90cbY67SgHQPKy+WT5jgCCL5
 n4QMaaPZFTC4N2uq2b8TgHmyGcBlicWwVCEqZPTeM5WhRl+gNwSLt3c7dN8+Q9JOd5KrorynRBu
 XIcKsALs8V+Yr/dpxy72lAXHRXOUaHzYPCZ4rfFsx2wJBoEcLzEpk5bvLrvEHltLZR4VTHNS2Uv
 cVtQ1e+5LCerzNjgg+sgkZPlJo9ZS55q++bC1T+rFGrqNYNSNRyQs8NsALWNY2rhm4C8G0OlQ6h
 3mVyqckssWlhxk19eDG4izkKJbXbhnibi8h65JT5blpWO86G9kTuOwVdZXw/Al0IihygKSfANbO
 tGsR4J4yD/aiTMeU5qrK7PLO+YDfC3ckLCOMnOWeRUMI4Db5Qrae1QycfNVjlqxVybmSGmdEs11
 aMlFFUeo3Kl+adAwEbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX6pf4x6cszmWH
 OKgrx9EzUofLrQTBVbGigT2Upl5khQ7GzYsehf+cgm+IhZonPGuVm2Zp6WKOgk/xr9VkjctvUTQ
 SIJP00rcXZYxSKvc5J60hNK2TpR5Fwc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

On 02/11/2026 11:28, Konrad Dybcio wrote:
> On 11/1/26 9:24 PM, Krzysztof Kozlowski wrote:
>> The SMP2P interrupt is requested with devm_request_threaded_irq(), so it
>> is freed only after qcom_smp2p_remove() returns or, in the probe error
>> path, after probe returns.   Both paths, however, explicitly remove the
>> inbound irq domains, unregister outbound SMEM states and free the
>> mailbox channel before that.
> 
> Sashiko flags an issue with this one

Thanks, Sashiko did not send email about it.

Best regards,
Krzysztof
