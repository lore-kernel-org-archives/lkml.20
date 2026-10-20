Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792475574;
	b=5ky/8rcGwBt5iVxOVb2T7HHcE7J5hpPXOlcwJUdnhPOmwpizGbL3nwpPwefG4kH2YClk
	 02zv+l0MzIgCe5EZGLy88dBxZ2yrHqeyZMMyS8M5HLNrkvgnihCQ9/Nx6wDELSLZ92JDo
	 NAJ1YZWARcMoUdgOV2qABm1ZuDxQeLI1jtWr9at/M4w4CCtRxockGG7cOm1MOGQavw8Mk
	 ity3r0yj8KFLZRG0a/9vGfynlEzlF5/1d7JyCcmmslwRNAO0EYE01ABTb2q8+phau449K
	 wuoaDD9ZmpCRn4CTbCqPMuMTKIbRdd4S57uoTg67mZ4NgqHlysQux6OiVa+xQZUIiqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792475574;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RN3wmZAM7GFWTpaZKW6y51wUf6lXSD82i4H184b/1FU=;
	b=VCPKrmoON437pHHbX8wXKW8dEi8iCJfZRYtlb5tF2GoIvjG+OLhbel2oElbIQKTyWCgP
	 WT2w0mrool/3cXRipCJ41tebN6ejqu2nXWxvoJ00vK/ulBf6137iWQc9qEEbYpzc6SQ0B
	 PhfsjoWVT4oK6wGaBNVQmFE5YTKnDKHWsyYxLPEmJqTxb92E9Ehw88pb8cvnuEu9XXUm9
	 qIAir6rtGpKUkdU3+BZpNClJKGyjnVHdSaimge9N5vjNfgSs7ZmefsZM9b+JfTz3sfuwS
	 SIgqvn7IqfX1hiH/c8OrCSH+aZ4qC5kiSFfDlUZW1DcrwO4Q6WKm3c0mNnk3Wv3+ddw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P93bWUie;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Aqi9lt12;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85377606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85377606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P93bWUie;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Aqi9lt12
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tIse4178063
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RN3wmZAM7GFWTpaZKW6y51wUf6lXSD82i4H184b/1FU=; b=P93bWUieowygmN7l
	UjmKOil+5SZeXhIw1dYC+/jGPIFaWv8szg213Dsvhax7WMGMFhe0Jp63y7xfEvJ3
	oIVkWSH7+CPiVQelteFqAkcc+bkDvsipf/dcNgWvluNiOwnEf8Uqv1DboWnlhq5T
	2yDdGkxEgRqSIMTjE7Dn6qfHvA7EfMADYXvkjhDTmuCIn4X3kX/bU8AMto0LnYb/
	i1Pz8fgSVvEImcJ19/g5NAOtAjCKx7lJV2Hr7OVr5+YSZfqwrVcYIiqg3sSoh7CJ
	e3H/FHj4wEneKXD9OkdOuqpsFslM7oizWb7xTxAwv8wjuTe0ykC+hqrlBXAaRUT1
	2hbSig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n119w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:52:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso54571785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792475572; x=1793080372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RN3wmZAM7GFWTpaZKW6y51wUf6lXSD82i4H184b/1FU=;
        b=Aqi9lt12y4gp/rEpac2SQF4TCikAzOMqYXwy4ORyqp9efWtkEt5x4mHzfVBa2b21zN
         O1TANR8zWT0sLUZYGlu0jav7SgMvAaRXaIOoa9lCP+aH9H1CuPd78DQqQDDeEJ4wERly
         eLaWLE3agyqLd5JV+GzhPx+TPQp8ANoiOkotCnM/asCoj+983SoVobh9tDIL5m7ijRw8
         CKucKtI91h7H8NbeOJzysgIPc6OHGExnFCqGgU3eud16Dk+wCBhCGF8wNSBQnj8hxP/m
         XWMEhQA+SZfgztEN5q/tyoiABCmnUqyrAao/gtgyFmvFIm9PC/AaemTv8ib6oFmqpIhY
         HWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792475572; x=1793080372;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RN3wmZAM7GFWTpaZKW6y51wUf6lXSD82i4H184b/1FU=;
        b=UnVoRelkCVdhURUMkO+mcd1g7sUwmrNs3s4AgJQ3GrihJd8IovKH3kYumcTGfa4sJl
         e8HwSZIfMugE/uKLRxoCz7qguuEj3UWGWHbbrGcAkmPnwgcDzZH7CctzdMknPzarOPHH
         sn2wRMNR4/KMy0TPeog1pL/qehWAW6LIIBXLt7q/yjQh6DKOfqE1SZWWIt6bpM9nN+pX
         VzkJc+ogdkRmwoHNna51sPCUsEy2A1e1uOKMJkzouOcEIbT6IIW5+N0LWjJf2FfA/F1z
         owMRlpgTYSEH8Ji+GFrMtQMHhEQNqOWsib/c1MdvLzgPc7JOZE69cMDK5VShgR41nplZ
         9baQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYI7BW4xIeTFGigWcL7Q6BtAp8hpzp1VDQdq8U1KltEdkPrBXTUci6wD6S2tIyEsirR1hL4th/XiDh1Uo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrVYTeTyA8BD8EDEkUD547HHxt31kYMtOuqIQ8pmclskDcyXWK
	vlCsN65ZLq6N4anpP/3COwnetMvXIWR/6eJ3IiBFr0pzHlMdayROHXFQWxjF/wUzqnW/m+GZDXf
	XKE7TojrCwwFv3J/ZhJJ0zMuQnayRtHWBvK6LADUqBYFzs9WqrVxdHw4iIHLp3RVDnnM=
X-Gm-Gg: AYBFou2damHk+UHWJdk+cLnXXAKy7r/CsQNr/oKuORbGmJVSGCImHUydL7s/sDkmV/J
	kZ2amzgxseLtqCDOR1eKMr6PsNYnu31hd4Q8WTTXDB7BqLQz4P664YQuBLXy9/5f89mnsXGk6py
	ocso54dK4Bc1+wseL6rsebbCSjX+IdzKWh47R59z1fBgFXINFOV7mubM8Tw6HqhMA+Ea1JN5oHV
	mqiJEp1RS3urOx5CLbXbQ+uASU89QyYF1aSOnULW55FyPOq6KMZhaogScSRoW1Td+eTGVK7ugZ2
	GC3MMRf9Jcx1wp+71fLQANvNnIuvqYBMOXSMuX6uUSE7TgixtiIvY0xGz1t+KityVepGIIJeQfe
	BSX176fyLhm74xLC7ipX6Uw==
X-Received: by 2002:a05:620a:6410:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f29c4bde6mr1838303185a.2.1792475571893;
        Mon, 19 Oct 2026 22:52:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6410:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f29c4bde6mr1838299885a.2.1792475571373;
        Mon, 19 Oct 2026 22:52:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea1ddsm4705947a12.34.2026.10.19.22.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 22:52:49 -0700 (PDT)
Message-ID: <be1e1980-061e-45dd-8b33-a70709e76677@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 07:52:45 +0200
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
Subject: Re: [PATCH 1/3] soc: qcom: spm: fix the SDM660 silver L2 AVS control
 value
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ilia Lin <ilialin@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
References: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
 <20261019-fix-qcom-saw-v1-1-9c7ba3fc2493@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-fix-qcom-saw-v1-1-9c7ba3fc2493@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YF2Csn-9T3j_zBO73PAs1-5kF1kDRRCD
X-Proofpoint-ORIG-GUID: YF2Csn-9T3j_zBO73PAs1-5kF1kDRRCD
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad701b4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FhHAzHn85Cby55PZOKIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyMyBTYWx0ZWRfX0XWpbXpiV23B
 JmwMgTq9yxwx7ltUB9Sr6gt70r/lAcya0ccfrUI2J+ZytYAAIpRNyt7PMqnL71TL245BJ4kHQqI
 yoK6G5upp7pGUy3jKVL5eV9g9t0aCVO5ArZAdO7NwrbQ+hZNnIXmZEinCiwJRzbXoOw/sG5hySm
 CbS2wlEMxYHe3XW+5EKHhIGuqsEMSnrVNusSWjqaoa+MJjmcX1c4iQy2yQKSjQ9zzLq6xqVuWff
 7uuiZ3IN9KZ6PZMmofDs5TJyv0gxJtw1uEr5ZsemjOJGqJesWGRg/AyW8NDN1KJEfsNeXJgniQq
 FbnGP0n1Y7k3TX+fEWAq2xG1ODl790c3F76BNdDWpwczP1LcNxdGfv5/zVxDHK9POF/n5DLhAoM
 dDoW/qqLFT1Ql0qcLAYSJ3xB+YxFS4XqB1StCYU2TX2tuajIN0DWCERd2CcfQQh/ycFekp8AKIz
 DfGp3wg7MuMlhEJfRVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyMyBTYWx0ZWRfX6/6E5boc8zOq
 XFLc2SMVFIaun6s4Y+PkPGZPthqnXsTR5yXilbaThJUBWURQT/DDh8tiZfOhuNVIwJcKfzvYeme
 B6lt3V5VlmYD9qYGr5SNgy8jRCRBhKQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200023

On 10/19/26 4:39 PM, Dmitry Baryshkov wrote:
> The power cluster L2 SAW of SDM660 is programmed with an AVS control
> value that differs from the one the vendor kernel uses for this SAW
> (0x1010031), so the AVS hardware runs with the wrong configuration.
> 
> Use the vendor value.
> 
> Fixes: 13e72c3e2261 ("soc: qcom: spm: Implement support for SAWv4.1, SDM630/660 L2 AVS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
