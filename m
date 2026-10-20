Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501647;
	b=kB+5CptWSiBvUaINOMT9a4zRaqzRdBplmXdCPRDumoLilrO7Hf+uhUWl2FB+sBtD5xl0
	 J1fMn3y/9qofgT0ceYWM9O7Vs4lAVbU8RZ1Qs04lUfTJOQgLwfsBpJ3SHN57xXLSQvvhz
	 XIQuMqzL+NVo1iixhEURZ88p5WzQicawH4XrSBmGgYJZzMC7pRlLj1F6vYQWGcO2GCM8b
	 PSEyKbku0pEYfFNhMjw5be1KfF1PMSy1R538Lq7SrHnjl3udjQtMHUK71mPXI5nsv0eRS
	 k60OI0eo/WvZY7mu2KZ25VDpGwvx2qVBkGtqv6ZywW575hDLKiuutniPsFwDFVWmsgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501647;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4gduBN8y/Akb5TuPhoYpqkFtKFLolNkjuTQDl1aV+6o=;
	b=Kl184cvt9jTWGKNYCxmh5qj62pp6iHiDa+ZRW52LybBJv9C/IPVAEOjpfmmm9yaclU0G
	 RmpRQn3kYgWTQPi1HVJhzYHiuP0YsiqEzO7BZ/HUkGwqwWO9iA73v9+vgLa3/RtQid8N+
	 E25XKIME6nv/bZ/DARmaYQAA2+4gdvX5ryX1APLxHMfb22pHB+5sekgoXZFLX1FaYD83r
	 KLXEAK900c2yDMfFwfyOTd6URXobOqBuSgjzEj+psufG/UsRbBMqBGGDV3/0LDLVnIxj+
	 A6xdJ/5AbPSFXDInZeW7IW/sCJ2o3lpmeJ+TGvfdcKDWnr5DKlpySfuQH/MqM/T5C6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAYYT4V8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsE37CBq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5235606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5235606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAYYT4V8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsE37CBq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBG6OC1486399
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4gduBN8y/Akb5TuPhoYpqkFt
	KFLolNkjuTQDl1aV+6o=; b=OAYYT4V8z50DfjzUMa+yqdRtNxhS9fwDbdY0tsw1
	VrTptOsnHlwyf6k4Z6VNuOOy/5pol8DVeORyuXsgKvrxvsZJdzbxVlQa+aCFSOLy
	8XURhBCgEg2hUMiZ8Z2uB1UiABvuuMp9Ma+i8ZKk0LlUQPIUK5bM1TYVt+vVSqVi
	kYKusc6VLSY0y7llVaI2qeN5Czt35Ao8l7uHJ2DF1ZWmnJZN+TLFER84Ust8R2/z
	SR0fXdHtB+BANj2foRnnKwfWmjk9AUg5SKkIuueslo9SbDh88JvZglY9u1r9GjtT
	D34/4g53Z0xIOjWZN92pj9HGlZvs9I96dDYUZs3j9rkQ2A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2ju7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:07:25 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cb9d27ddcfso850092137.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501645; x=1793106445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4gduBN8y/Akb5TuPhoYpqkFtKFLolNkjuTQDl1aV+6o=;
        b=HsE37CBqjQo/lE3dvKlMwvywhZaN7OWN3zlmv1S8kepCH9tBR4P3wjqLVHkTLvrGch
         mXnrKhY57CiTueH8cqunisbTrOlKv52xbnP/6Qh6aOWV1P5jXwfB+D/k4T+aGAZjBHl+
         SU+jOUqpdPLcOsImMjB7Uelpj9mgPyfOdwZt0XOw9J3biT7TQ2Q3ixR21FqNjTlcNxTR
         thNZlr6lfd7fPNZJJEqyVWIh+Eq/aSbwfSobLtMhhhNaSBU3GojJIX3G5ngaTTx9Chml
         Il8kH4dUB4wOAoMuFEEXdLc1X/QrkdUgMh78uiJhabNt8zAVFZQkifuy4bRnrnBgLP/t
         Fj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501645; x=1793106445;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4gduBN8y/Akb5TuPhoYpqkFtKFLolNkjuTQDl1aV+6o=;
        b=u5UPtwrc9tdJQquhWPL2fF2ssEjiWUenh+vDqzROxg615vpf/XDGP12HYxYMHd62xH
         G6Q/wEdhx+pkUs5f8KeN3Djhy68tDlQ00jsRHF73gr3C2ImYHk/dRGpLeIfw2O/vBX3U
         sDBnE+ZWLWXQeUOf+LeAbHd1pwdtFEi2z1bfmBL+eS1LGI+NFOPFF2o3i7f2bEpq8q5S
         e4ZW7Kc1hVGcEIbTQMzrhEQMrB/ja1IkicogFa/M6mTU0br7cws2jkIyapzbX28gz0ao
         TmCQLvDlZs0p6Q/3BON5UBOF1tc11unUGDyf/7yy4M7mMX02RYhfct8KR1FOR6Q3XSGv
         Sm6w==
X-Forwarded-Encrypted: i=1; AKwUvBzqxGRC/rg8R2FHauXsGJecLiVDJWOlJ5tSI72TM1FqCDjOpcprysCjT00KM/+7Aa0Y7p68AJoajmrVEco=@vger.kernel.org
X-Gm-Message-State: AFq9FYKm73PI2ZWnR7i1vtDVc7BIns989oAnr5gAUFhRkb+r04q2cdCk
	Re1pXU3isQ9scM9zbRKAA0zJGMZyGnDUznVCM+RVB83tzErt+HinSrcAzZIOaDJcfwcf4+N+xis
	xHkqUTpcVymC86L8OBIIjnt6urXS7w0jsFlwgD86tDp/sXPKX/baY+Ncl/5YQ7zm+suA=
X-Gm-Gg: AYBFou1R7D3Y2vRZAtxN2fJeKCDzKU3eBvuHj6TdmuV7MuhxxNZ9czZXQTXN8rtRtTT
	+AZPKMmn7+48ftxLQk215DQqTBvIXjUgnaaMRVDt+hegYtilwj9ud7SuVkHrMcC5Yq6C2ctl5pw
	bhnql3NJ/GXCLHQqrXBXw1hmGK2EMwsBL4WE1sP50gWcN48M0SDsk5Fl5r0TZNVzULWF799ACmk
	ZnS2klqxKKrfjF20LQvB2Hn82im7ZyqWwfIoaYqDCk3hQ5Z2pFcCofq7hCBX9BtTaQ3XlNRgsnn
	D2PipOjtyrNFOUoo91qMSD7kYi22nXf6Vb04sAqa9H1GHCkw0HcMrp6mQDsuv7oxU4tMW0sbzzx
	98l0SFLeMB9fZ3NGR
X-Received: by 2002:a05:6102:5809:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7cc3697d329mr2732878137.15.1792501644975;
        Tue, 20 Oct 2026 06:07:24 -0700 (PDT)
X-Received: by 2002:a05:6102:5809:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7cc3697d329mr2732853137.15.1792501644217;
        Tue, 20 Oct 2026 06:07:24 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d324f8sm64448535e9.6.2026.10.20.06.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:07:23 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:07:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sdm670: Use ICC tag defines
Message-ID: <lxtdscpjqwmu3gt4rbdkiumzi6yv464izxx7atwfcar7fabit7@rsrp5sfxlr6o>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-4-cae8d22649ac@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-topic-icc_defines_ao-v1-4-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-GUID: hQkFnm1h3O58XHfcBqyeBk49Dbdbwd2W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX3yusO4FDS2fb
 XIUVnNCjrnCuHKaJygKsQn0AYwxl+yevUFd4biuLHH8JEUz9xUnYBUhplNofqE+jpppVYS95a+0
 3Nd89d9N60EJuOmgLE5bTXk43aiPf0k=
X-Proofpoint-ORIG-GUID: hQkFnm1h3O58XHfcBqyeBk49Dbdbwd2W
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad7678d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=i2oNlF0cj4oJyyjMQKYA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfXwdlErctr7yek
 ArkHvWzwDpx3w7kSnWRPIxr9iRNUbL82ydzbtSLDnmG6VhKm0dwgiTmiWgjwoltjKF8VHYoYi0n
 qcAEjkpPbTqcWnQ+WQhSs59K/GfNlHoHi9Pjg5jOMbMrtQo5JpQ5deyvY/iCMeQl2CoaRTtIROK
 0TPzgmD9GLc5HfhPmpCW+k+6nU8LqpZKdur4wWeqEpZk2Kbgnv7pwLp1z5IJg/7Ds1HSYj8XLQ9
 APShOTL6J0wwK+90iVmQMEB8QHcI+rlklk4lZWboF6y0A7/GGkb9cTIdqE9WCVv40xjgPwEI6pD
 2HKQOyZb+zCDyk+nz21ZgUaYrV/qLO0HWb5nia+AGohPgazN1m2TnzZ5OxnXvEiozQyfxVXczup
 wtsBRR1+k8LOfntSTr4WJ5sZm1qB3nkbptiRlqppDlniZu0IZNnDK11g9GUPKlhWq10wnHgs0bW
 LnWmUdEt6XN3MmgpYFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 14:42:08, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The magic values come from dt-bindings. Use the existing defines to
> demistify them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
