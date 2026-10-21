Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585038;
	b=xOVln0ip+Q6/2qAZbVk/k7NEfSAZVJDggVfKUsfQVoY8JwJagwEVkg1r7P/Q4wfRmuDe
	 fY7Pfi1Q4QQr7OdFUgpcnUYvo3FKdoRg8s8hFi9zlLrdZ7zYkOUQfe/BWsYhuXHfsOjY3
	 5of8GLemk46fYvYpZMqTDDLS6McAAGBfnBuVCZBrZCdE+cgMx3XV2XSurBOMKktxDe1uo
	 vkRNVtncfRpXY/fLlXdnQs0dN6v7j+UccGLiE+trkS5l4ldqFf/whC3KKY9pizz0USTH1
	 6kBBuu023a48B13N9S+SPkGd6TJY3wOCEZpqnQjjBxzqIMdUgrvJ4ygiAUmBVjPn3WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585038;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GF4COE1Ae4LGoQC9tcDTAC5sKVXGVzKdFIgFJ5d633A=;
	b=ye4D2XMjsmqmbKfMjlsOvgC3W/8tQ2qOlzafQeNo1nUDhYrfpAZnyZYNH22HrgplnqkI
	 ALHOwepRwLI0CdCLSg4T0GQY2lNOYxJuVyFR7ZccfpBQSRofyHOiGcUFzHCx8pvmHJatK
	 ejLCnLDtgd/dcOw9fUr+lgOsaqvsUjVUH4J8vOj3ktIdUHDMYh9pCoo+49srx+h6dO3ES
	 B5Dh+EOWZ58BOv0Wbj9EHKbaGuHgsyxzxjGDRCYDG0C0VSvmw3h+mN/gPrwJLf1bZCD2B
	 cBe4D9TnsEy3tW0hZXQwwS+ouaG5e48VSPvtwP3sX1VdTgXy3YU7PcpX/ngkuHvnIFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDGEkuej;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FF7OHOZX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD214606AB39
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD214606AB39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDGEkuej;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FF7OHOZX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg8pn1568316
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GF4COE1Ae4LGoQC9tcDTAC5sKVXGVzKdFIgFJ5d633A=; b=VDGEkuej7SpcZ/Z7
	6mt3tjOhU2/wQB+7cvJ9tIplO4hG1w2wpWHH+doQCrVTjZk8M+t4oEtYcsFABUQ4
	oQgtj/moZY34KoHzck8DyWbP7Cdn20nkBmX4sLUpEBMfX37bM9KK0ndDEAQfFi1m
	plrxvk7na+nJ/1nSaLR7/lIfcNZW7U+gRayTt0bce8S6X8c/6JLn68klftcPI0xc
	HHBNuC7c/xu9A1F3EPIwBtxNa82kQlCtdUOZ2ap2zL7M1eIEFKqUerUdLAwyNnrZ
	SbdkORJhD2Fd2dqnjVA4WuVww3BuTISTENgBhG/GIAfTvNLFwTSPTLJhrIVYocZj
	Ebo7yw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4utpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:17:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso10631885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792585036; x=1793189836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GF4COE1Ae4LGoQC9tcDTAC5sKVXGVzKdFIgFJ5d633A=;
        b=FF7OHOZX+VnMjUc86Jh5Sxc6tBHYOVWZm9/CHe3ZLgdZYKXwT5ChxMxOE+y3PB0rfP
         /q8uAeUTkZG/Qe8zjee9gahRG54cuayhFLboaj+Ccz9LIl7yVIBJf7SKt6O7qkQZ9MV0
         CrbHS2gaFaDyXGB9g1v+bYYI8snzX34vEsFwyRkCbcpmSgq9s+i8uLQ4+mcHSBoizwhz
         NOiWBD94xQWIbE75jAaBsry3Q9lKCrjkkRx/KtvMa2r1y7nWcZMDr4LYU4YNC/1VqNcy
         9H7lG7LkleCYsLVzWSrastiildGqd2C3EavonBGGpID9zw5FGJmvKDrmnYEV7QMZ200k
         +UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585036; x=1793189836;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GF4COE1Ae4LGoQC9tcDTAC5sKVXGVzKdFIgFJ5d633A=;
        b=AHmJ9egm5eCAHHuUeD9LNvouhl9BQSyyB4CG2Se7wLX7aIRHBHAII9H1gPTLITQZf+
         Bk7I/A1xSFMR75sDwG6GIQ8liNGdbJau9e377O+f+QjWwTB1lHzkV9gHclLFJZD8i+2y
         uYKcX2tM4mUXdfHWJyTb745C3+WiFzXj4N19petmDfruxAUFtm0ge9ErwgELB4g17LMA
         XsiEqKC/dgUDc7qZihqLYUc4N+MKIwfFN4zd3vPpyc5/IMfaDz2V92+pPhnyuaPRJoE3
         UbX5HEHhcvTgJUTlvop6MBJSbOsyorTh5Ipl1i4mTJ75HBJrYl21HQrWAK3VtHI1cSk4
         suOg==
X-Forwarded-Encrypted: i=1; AKwUvBwEAZAUuhZl9yOsClwr8gpd8Re2I70hotawy8pQTI2ywlMSkylsuqOdDNJWX61GFD3GWuzBPIfL7SZPeAI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEKopKXBaqvzFraPXAbf4CpwQL4OOtvQCDB6OK0e+gUkLo6rtp
	Kx3UFso6SkdS7nAxxQdEv1dUCwtklr/RbytC/xtlIe3o34io+sKntbs8mC9A7+y0L1u0SMLPVOt
	dhMskojF4KjcmPtTT93l2UId55Di3SabaSazl2ZllkNe/m8BX2oFoHv7KfNHT8/AaRl8=
X-Gm-Gg: AYBFou1T3cqIHtGZPV3/QmPPmibn+vxXmY2LrndEGvljidspp1pPFx5LWeNSNTX/5xk
	D3KVxpELQz61vOYvFcqP5U8VvAzDLch8Bwun0KtTr+kqiBhEmVKnnDLZSINw6tl+Re+5dsgFczr
	Zmde3VYXvestpJFdpNd43bWX9YxpNAW+jzpMzS7amUiX2Zu0HG3dG4cu1Vf72QyPJlYkin1kJ97
	S/b/tHd01vxQIZdg9duJszw2EaUGAFBCFTCxrO02Q03yz3d7gxvcNJAJvaL27+Unyhd4K5gKS5s
	dHeqau6E1gVds096CVrdlRYdtWWjjK0w61QqvoE04LNaoyomdBoEZyG2w0hSssIJR/KlAPds39K
	Gk6aHCl/e/E+8Mbo6/O75VQ==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr469812985a.1.1792585035926;
        Wed, 21 Oct 2026 05:17:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr469805785a.1.1792585035047;
        Wed, 21 Oct 2026 05:17:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm789326a12.27.2026.10.21.05.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:17:14 -0700 (PDT)
Message-ID: <bf792247-69f8-40c1-bbdb-c02c5a56fa46@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:17:12 +0200
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
Subject: Re: [PATCH v2] arm64: dts: qcom: nord: Add more clock controller
 nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260924094448.1030807-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924094448.1030807-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Qlzm50Ap65TBzFVZgJYZjx3DaTkLHBX1
X-Proofpoint-GUID: Qlzm50Ap65TBzFVZgJYZjx3DaTkLHBX1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfXzTI69482LQ1D
 WXDHtvuQo8a3pi/Io4HuVqKsFUmqfzvdfyrcmNpbT85H51wb0tuZfyHvcUr4DeVYJI4b4WZ6Ky7
 8sk0Hp+aNDREMX4+5a7tt95OAXV9E+4=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad8ad4c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sJXE05e3qEaUFtzxEIoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX77PNBMSYAT/5
 hPaJxPhcYytkCtNt3g2AfXC5IAEr5SYmFhwff4CeWN3QI1XlEIF+oBhaGQxGDHOLpDl9znN/uhU
 FBI4H15hW6TcxbYXLa0+QVvNfMTqWbnlBUEa0jqQ7Sk4nP+uPPuaLZgKwB+OyOk98ZA0oHPIvRZ
 arPEx94g9/wg9iZYyHSfZ9RghL40AIjs2YrKh0JuDesubc3ltj9B57qfz4k+r8qKkWl6chmO2Lo
 02tkDivtDA1LTWM09yqC3f3aVFbyzEtGaIVBdQFkjWLYfzLFRysJw5bjr+iMDOXR+hfNFjnmFPH
 YsS7LaLwQw2LGOp66TT4zT/53tD3OylSnQ4vJ1q+R6d0wFUhCzp1FvHGMGmGqhRV9nq6j6B2Xzf
 9wur2ipQ8MQaOJvB1pHAqo0vR6cXyIeayDxJ5gah5ekgqRyI2ybJ0/cfG8GmHxYJWavTxUt9avL
 GlcGZOMdRd2J4kX2nzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210048

On 9/24/26 11:44 AM, Shawn Guo wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the GPU, camera, video, and display clock controller nodes for
> the Qualcomm Nord SoC, along with their required dt-bindings includes.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
