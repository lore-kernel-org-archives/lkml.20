Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659876;
	b=aXtc1ByORYg4fUXusL2K7ymt0ld5+ydnmxIo1RhMvDdEE5SjddHccltsB6ck/g9pnlc/
	 DJHqHN9MOaec12aR5SAwoT4QSELD/rqDwxm/dVU1w540vIJJAT+7LgIJTkxLTRzzOYozs
	 Q/i+DTEmp46wfx+KnxDj2szCfqKfBhRKxKRvMal6u1OTDbFhqzzSglc7o0y/8fjN4uAl9
	 Q5QrJI+5TYxcukjBuA2vniNPyfkmWtG28kq/0PWnBNO9g+XEs9URfWGLscKnbiXEm8hb/
	 2F5itmIoPuVJYT1U/WybSm27FYO6LjLS3xNrA3Qc4SMQJsBPkzbeXw4jF4XKlmSPhMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gnkS9k+2/tXEDPTycA0vOUMBxxhav/Et+SuLMPjpzJQ=;
	b=JXk+5odXI4F3pPx7LeToXfNtj6rYVkqlUr4bmcsqWkfwJK+KaP/eq89rYuMDU7bpaVRv
	 gvJk/TrmkGQWqR268nj44IXTsFDh9QYZAlNeuKVZAmnaL+oRJg2QdsjBeVzkA4H5lctFR
	 QC1frO0Akys+Z6Ckj1lJY4ALmKjZ3oycrUNSrN5p2jfLs7phxUP3r0Xn3sRMAzKQZjwoM
	 hs10CqKk/1VR4UUHIs6MNFOlkhqEiz3aLvWF5u3H7ErkJN+wONP2QgSk8JCLON4AHDap9
	 ElT1IvfMWgWx6Nm3mWwqPmReC8sVU9y2GA9cO3A5GwrluDvl8F7wF15WXo7cEY0ftGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwdV+474;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B12sLeHX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC29606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FC29606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwdV+474;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B12sLeHX
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M708o63517467
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnkS9k+2/tXEDPTycA0vOUMBxxhav/Et+SuLMPjpzJQ=; b=iwdV+474yLO5p50S
	vwhffizSEih/hIHI0dZ3QJGTkQPu3Pab9WOI4nahgE1oE2+USj2yzz61VZlc8u6I
	IzEcH93XSHV7M81IWVRGfLoFN64HyJMzByJ5I12MzYh4jAP14/PHX2J8c8vlFxOb
	KQ9ipcIJvarE9FHwREmHE88evVwamVvQ9i3VoqwAqpTqtyrN7jLZDDdmqby2AJdP
	7ExLBMF3XMWGLagjG5dtqZvwSAt67oUJouFWiKOK1K1QKTdBE7rlgXtJtvcIvtBg
	7Ki5oDD3DVd2A+N1/w4I9JVzvo2/5DK8QqPsHyP7FeVbecNnTkEPbznSAbVFjgxc
	70TDfA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bhjfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:04:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9106bb33cdfso3936326d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659874; x=1793264674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnkS9k+2/tXEDPTycA0vOUMBxxhav/Et+SuLMPjpzJQ=;
        b=B12sLeHXgtj84/PgsM9tkJGsm+B6aUNnFdQW6v7Us5vDnpjY0VbgvLSJv8qpgJTZqO
         V4rEdGYKIxIdIXJhXtXeJlAvY+jDNetQ4z6jbzlFi4AqdXg0BNgSqhWFZ9nBvffF9l+A
         FOQY9Qzo/p+7/ibaSaheTzEHJSA8vP7ofV7wQnwlO+ktKNpVJfJaUEiOetaW4uO1M1qV
         zUIze8mRQ/J/jehy/kJ0OG86yYRpNh6EGkRuEZrnytewlka2oAAC34NqbPRWW1R9Q2QK
         frMC2mNXA2Y+Aj3yUGA9iLBwZ3RrB8d/Z0rcChCm7XD9T8DJySLyJ/ToX5fEaeL2oSXv
         uDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659874; x=1793264674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnkS9k+2/tXEDPTycA0vOUMBxxhav/Et+SuLMPjpzJQ=;
        b=titukSQEGxL5c8y2oKEtTm/zBLxdgMstcDzFtPrBdBlqeTo1ZaSCvrAyzmtJhMA1CU
         Sw5C0aljxPXg11Ydrac0zstRMal2YHRWmqapePOxstCnacCh6EDiD7rs4Xbea/NggpmT
         84/yaWLshfwI88AfE79pP/p2Jqlr+PTs2qxJ++jfzvNTlkO/V1udTQAZcsXOWDCSMKCu
         fgKc6hi9ShmXfhcfAnH7XLrNe1HF+bupyVd7wrlvpBdvTh5Mnuv76HuCNwQukB3hHOYT
         zi4brMA/93JCv7LWruiltW2l3/pU0zHf66NWq7Hk7t3wLKjCxf84teb3nd4UN6AVl2F2
         L3+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzu6B0mvNRYo41QrHTBUtnNYKIRes6tCtikSicf6CwbmQTlJ6Zd0cl0+r+Q0DWxTEceDOpY+ZNjQFHh5aM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8cBD2KUe/SshgO6HmRUBUnCvqK/3RB69SfHycciL/MrAyoV7w
	6ak5U80eqltcmqEC9C8vHdImSMPw/0jvXeTDSrk+85PHSpVXNny0+GUi4tXvZ7j6LyxiYtHH8Kx
	21G82pWB2XmmxWELBLFOy60bBYfLSiL+t4Xy5gxd55XzxWGCUOkWv0CdsXGKMmDcneVc=
X-Gm-Gg: AYBFou35KeH89J6571txuK0xl8/MJtuZFoh4Aj/8nH2wkaK1Kel9SRZYsBUMstMRJ4G
	A4r+ILYB6QGBwn3aKEMxHdmT+1A5MI1FXwmx5hl2N9K0sI7wh005FCPhTQZ4ECsBTnnbd8e7xx/
	97UhxGd7321yi6alpHzxFtOFIJaLDH1POsYbi2ARVr+40apEP+v1j8AU5QcFEq7CpUk1q66escK
	tbET1ooov8iueOk7DWb2/45jp/fBYLQ249mvi+oTdgQDmeqm/qEdK/9qYP/045xFkw1Tk/O3xmH
	6B5iVSGgJX1A1vRT36y5WzKTPuyFZhYdWM2A//y2HDrRmkuc2gi/G+R/JXsRVrjnqkBRqJUk6F3
	tBmUH5vnzwihdjpcjNSyS3Q==
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr903741285a.5.1792659874222;
        Thu, 22 Oct 2026 02:04:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr903737385a.5.1792659873706;
        Thu, 22 Oct 2026 02:04:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1f29aesm85858766b.11.2026.10.22.02.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:04:32 -0700 (PDT)
Message-ID: <97c2268a-0cff-440c-8e21-f19a809ad377@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:04:30 +0200
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
Subject: Re: [PATCH v11 1/2] crypto: qce - Only register algos if the user
 really wants it
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King
 <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        stable@vger.kernel.org
References: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
 <20261022-qce-fixes-broken-label-v11-1-0d33c34fd0c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-qce-fixes-broken-label-v11-1-0d33c34fd0c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXyNeZWGFhWUQE
 6cFqLUUmwlnbG5ioM9THIFv2s1iNK3HFBlCozbYBEsSlEuHKSOS6pcsHp3hYJur9FbjapGvPFV/
 y096ii7iNdU8EmpY1XaGH/lI0zmyyoB+2qaAME28UxuW+YFcGDQFBnB90SLPIW7A6AIkOtJMYW8
 7MKdwVwf/GpF01DpB9YEm2LqafMDz0hUYcX5jFK40bLVW9cWOaZbocRazpeBAgBRZ/jEvHOppsf
 uh7h7VNTv6ONmxp2vOmyxHJ9+XC8mOx+nnjhtT/g/Zr1IaPTnbDgDY5fPMr21QJ8jYistbd1JeE
 k8COHYkjxDB5u2/JxlogexYK3GM2jHe6/CRbDtKMGpNEkXUj7Usu83+KwCpK8/1NvG0IuD4c+i3
 7dncGdSEHQHnvDuk1gOn5oZZudTlcXDTTRXl5DBQRLbEQ17lToCy8DMDYwq4QcSjfUhf6v3CZsV
 Phpj2LY9wV68GkMdDOw==
X-Proofpoint-GUID: m5AhxBxuufCssD73QAEkT785au4aoqSk
X-Proofpoint-ORIG-GUID: m5AhxBxuufCssD73QAEkT785au4aoqSk
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9d1a3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LeLJCEefvvVT7qkYm4wA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXyyrXkWC3xcbB
 gD0DTEBEgIoE/sHzJ/cxFadVx4nIqa1CmFJry+MrsvE4gASJH0zBlG7hg0KuoQjxhccFvc78cl1
 wXDrtNAUoqwqKW/Fj3Px02FTaXrkri0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035

On 10/22/26 10:57 AM, Bartosz Golaszewski wrote:
> This driver's crypto algorithms still have a few issues that need
> addressing which don't currently trigger any self-test failures. For
> that reason: don't register the algorithms unless the user really wants
> it.
> 
> Add a module parameter to the QCE driver that by default causes the
> driver to *not* register the crypto algorithms. It will only be one if
> the user explicitly passes the do_register_algos argument as true.
> 
> The power-management part of the driver is kept as is to allow scaling
> down of interconnects gating of clocks by runtime PM.
> 
> Cc: stable@vger.kernel.org
> Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
