Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504779;
	b=SZpmXS6pwaTWY5Ej92o/nsfyGaVF0VeEuBVahSjYYsCHCh7cjxqT3BW8lzM44PvgnMYK
	 TlOvHhIFCaDqq+aD+PmBgC0ZD5skx8w3p6MZ3HAcfI4m46oQX5ObDQfAI/YusUgjbrTz2
	 sxjIbNEbOTx5/zg+G4dYdZHH0XI8wSbpkcUc3SyCRwzSiaW6yq4R2w9/oDlQ0FOJO02cB
	 V+RIkZDgRPRDESbwuo3/ey2b3w0sT3tn+1TTY2eX92hS3tPmahJvHkvLcX3GQdK6aYzYR
	 wq/jii3L6zmMYw+qVrNMC5VIJFcPxGuLPjWR5TxzisOIPlDfOCbZPcFwZcuGLxEALtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/1SXnPGNUvUddGrYhMLJ2FZJsi82nqvg3oxQOqmRtGw=;
	b=w93X/4E5V5ty4ReqqyUFnp7Zi4pOWjGKDWtIwu6HOWX9xggcFL2CAIfzx8V4RqmjhBoD
	 LkgDBvZhSxZIPlqR/TIl362Of4XvV8wErkmSIP+N0oChiG5cWyXcI8JuUS7VDaw7uDA2y
	 aVPF8a3/YRVGnZ8J3NPx9XeCDZfhfzN3vFjgbIEBrZKoFsqUNPZhfjZb52yw7IF5w8X72
	 c3bRMb4kFxg47VnEg2YZ37XA3DY02Ac48q8IlkRVR3Qzo1OuxFquEQ5eaXdasIIF/CmNb
	 SMQb1pBkgQcISnEmXpXGEV7ueOM1wUxjAMpVcyq2WWde2prFKatMD9LkhwVAKEMFmXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=niUAHtj+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHfHQyy5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C44606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07C44606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=niUAHtj+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHfHQyy5
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA7FX1782303
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1SXnPGNUvUddGrYhMLJ2FZJsi82nqvg3oxQOqmRtGw=; b=niUAHtj+Fdseix79
	i7hZEjPU6kpD5iwYP7SQicrMCrWop8ANv9ccdB+MAu4XMVLdi3vXj0FFqmrjAETa
	Bp4kSfk8l0gjsWkLgiNfMjq5sXejMfKVoJIcKzdGr7eRxo1SpE5JRE509X4keplb
	3SQRX9WV2CBesAyKvhsOhbjhbibNbq4Gh6E+1F6eAVhxTQcsJSR2hJxt5pJu7UUb
	uJ3r7Z1WeqSbHkLarPLEMdjW6lKnzELhtOUugE/MFWLeMjHywHCrr44KuxYffy4Z
	BHs2P6n1Tim7N9q9GCh2x45YB5rlFNABP5VNSX6cO6RSYIqv3G9wTVuxJQBiTWMu
	8SX49w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h28gmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:59:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e629c7b16so66412885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504777; x=1793109577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1SXnPGNUvUddGrYhMLJ2FZJsi82nqvg3oxQOqmRtGw=;
        b=WHfHQyy5l0fOy80MQfga8zMzZXTwWjoo0HObtWPYOSkUu3Z1ckM+01Vefa9dcmgkMh
         NcoUzgauVbp/0L/j8i3RJKg1t1hWdf2d0sScLARMhjK+lhC/x/YFwrvxDdYBhTR1wxSs
         kdVlyMfxgQ+qwNEeqzXcOGSFVBUTACHoLp2F1reF1Uvf4ESmKYHTlMrnCNPBvd6AmmOv
         Oj0iZrHJ0dKJkEQB4QbFL3IbvH34nV9wBVXkP4DEgCoHJQl/PjfwMY7NCZPXKZZIwuGX
         p5SuQ+hqkGto2GYFbu4LrbcvstUV45Q4sDYwitm7ZPtTVeJa6O2/6G0VtE2Ot+MSrZJy
         hqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504777; x=1793109577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1SXnPGNUvUddGrYhMLJ2FZJsi82nqvg3oxQOqmRtGw=;
        b=ny1Bpo65UrC9WXEcBNZlf3frs3aKg9QM3XD/R3xa84nM94kk1bV5KCPbHa2mtvZBRE
         yhaX89wFXXovFoam9aIwfwr7TMcnTALrom3EziadIgF8w5j3nTpNGXW5nxkV6EgWbUmx
         WW9G2wsJMHD3LG7nqznOiTejScvM24ddmuhYqyzZbuqlJFp12t/d16aKqhKvmcKvoypk
         AT4C6iltaavHZGfrOvwbpGWhIH4yXnKvN6rkaLXWzrms2UyFhpo8jv+aJAkJe46qO/Eh
         gNVZJCPBoBqdQhcsd+Bz8vUEnQqniugRwTlyjzY2oGzoQfEUZm3bHSzzHQbvKCzaiX5/
         D5mg==
X-Forwarded-Encrypted: i=1; AKwUvBwguLr57bDpWNKd/TpUG1irLSFwQPD0gsHOd/86JX8TK0cPWkKXrQm9eI8/BgErZJU6EyrmSMb6WNuxP4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4Jdsv4Wus1w7Obtu7h7q9abqVfvm6fHXw3H+zugVAW5VjiILj
	Ycw9TPcS3Fs4NTUw91gYv/s4sq7f/s5b6h0+LzRQamfZnAVPK8C7nky0yyjKh/T//1IqHuiP3KG
	Hf9AfFkr2tLsYioymPQfZBJK5VzrDqB7wNfKYbSet4ue7k8TZ/EVJ5jnK5W75yQfKOtU=
X-Gm-Gg: AYBFou1D4TIJylT2XoAy0C1GT2X/4127Cc+f+CPoxv9FouBlJpdJ2nYg774pUZvvCHO
	bT5st1b2aEepK5uVTXZZFO/8E7qbHnmFNr0kfeQU/jhS9X3SK2d/OyKbAzlCAZMU8N3CdpOl4bt
	wa7PxTRz6reOSXWMDe+cei/u6qG+YiXDxfEiYU5rCbfyk09dVk7V72i8hsR7eQx9OlxH8fBOsW1
	n6kErYrpYuUYWuxdg0Q4kqcSwH7Cmo5j0woZhoyB5bGJ4T9q6kB5Ttw/zz/v+9qYagF9pReGSeu
	8aB60xqW+dPBsDcbsNpXBf3IPkfoDTbzzVEk2fw1l1mWKGHiNYzEVG17pQqtCd4ffbiCQKNMkTW
	TETNW8OuhUdi267VCOvLHEg==
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2188995585a.3.1792504777240;
        Tue, 20 Oct 2026 06:59:37 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2188991685a.3.1792504776850;
        Tue, 20 Oct 2026 06:59:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e328775sm485955766b.7.2026.10.20.06.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:59:36 -0700 (PDT)
Message-ID: <883e7b91-d2a4-4c3e-b6e9-32d0a87361e4@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:59:33 +0200
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
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: shikra: Do not mark MPM as power
 domain provider
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
 <20261015-b4-shikra_lpm_addition-v2-9-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-9-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _BRarKhSrwmkC-Ykhux4NxRR4twsWsMy
X-Proofpoint-ORIG-GUID: _BRarKhSrwmkC-Ykhux4NxRR4twsWsMy
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad773ca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=F9CCb8yx842l5dURUPAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX+h2OKfa5MHr6
 n1KpRJCSn0+uMBLJZpEGyaPDput0ne+6xikeN//+q7Yq1IKSEWerDK0c3TUQXl4gbe6ivSAd2Uo
 8R+eFQAFdKGjjNlUlSI6LmNnZjvLckY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX4gp63v2aGfu2
 SyepoWdVvcGVyiFqO49OqDEoz0LxZA/6H1o+MWLIkUQ6D9D64LOE5YPBP3Td1iVPDeOp55yn6w2
 BphN61Fkl5Ben4UqIoO2UQ7U/Jfj7DzBU/oEQ8k/NKDzhmuZyd0K6Jd1CeguwjjQ34t423VcaWQ
 BwIlPlrfaFjTMZeg9tWBq2TGP3vN89rCdgBCY9iTv4bfcB3hl13n5wSI0gqaSncoeTOoQ7IFgE5
 d76OW6TfVwhLVqYzPEh/f7E84KEyRC75njb7S7hHbzQfn9nBUWtVAFa1raKmK0ZDUJMCme+zOor
 2x7yiyLYTUYSY1qcGQW1OVhnwfgA3pNa8fIoyMMzCI/40vO/GSgYlW159fJ7SFMmk79tVBJmdfL
 sjyJf5PC3j+CqpSYZi8pAWwaDZcIpeJsbO4pS0rqQxxVPIXtbwHRl/HtQg46qqyyR5KjfV3yDcM
 wYOximKWwPYlD832Nkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> To make the MPM design more logical and avoid probe dependencies, the RPM
> notification is managed by registering for CPU_PM notifications.
> 
> Remove #power-domain-cells property from MPM device.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

Patch 1 introduced it!

Konrad
