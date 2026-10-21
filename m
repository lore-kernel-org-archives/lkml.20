Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569500;
	b=cD4h18yAmdgwwQ5JQUKZqH5Q4Br6Ixrg2piUh8IyNDij5HgA+NpiBOJdmCfBLEJw2jma
	 dQLVoRcaDvGCnP0+LAXTG6HTp8vMbD8In0BN8jWTgBd0S24Bm4iT2dvCf6nBIlhpO05Tz
	 1cFSRB00IzejyTUfPEitO7Pi6Y1GqdD7e5dZNASqHwjnqQ0X+XnQHPPO2aSPkCTY9brhu
	 mpmYJ02gaTf+/jxEeYcOyqKyIaP/Xgx6HFNCmnfG9fKR8gOV6WmgkKdirYwLbUP8XkYsO
	 IROwCEUhU+QTPz2dtxmenDSEO9mqoVN+oclykXbF7vXxbSXHf8YfOD6/dPVHwNWJYaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569500;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/2FCOFkahv02WUb8MJdjoJ0kcL6KdukKsXu/EI6/Sz8=;
	b=sSWig/9hvXBjdKYh9ajc8wbnb+/HgXhAW/cqSeoWlidUPZO5VEkFF+dIYcnO9J2bCZIS
	 R0MctkaDfjbEXxXJqh3Q1oVipGrhl3kTLu0tAXjTOjW6cSLbMqqxivOQ63WBS1hH5q7ee
	 3155MPc4xmDr+YMQo6BUeBd5F718jrzeuQzN6DUMYn6OTxl6XPfaUTg1esh/zvjaM8oaT
	 eCzHBWMb3fgcf8TocDjfeApNKJQFYDzJvF/djKRTr7m7H2A5GPuIfpuHG+q7dsMw29ghO
	 RMaDI4sDrdV+iJ9UieGc9/g5YlCaDgh1e6HBvRBppFsdwKme/wwlCJ4YV4CcCd8cw9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JyRg4Okw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3uxpkYD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E377606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E377606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JyRg4Okw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3uxpkYD
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j93u3874614
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/2FCOFkahv02WUb8MJdjoJ0kcL6KdukKsXu/EI6/Sz8=; b=JyRg4Okw2lzPun4T
	8MHA1mbvUB8lV51dPNLX6y8pn/PiWSA+2gtprbCZ4ZsY0hcPF9WdrIylI4CEjBQj
	D4a1erK+AX3S7vXeO+F9ogocVkMcKTVoReurMORgQY2bqMPRfnmGRjIb7r8nxL+0
	odkMimf7OXlLfXTtYjJ4pFg8JRObXLwVToiY447omvbw9FIjjWuGFKruwNOMY4PA
	Gsyt7ORqCGGaSa6bjH2Fma04fxolydR7ZA3etRiPB3LjzAdbuTSSTykcPyjRtlRa
	t4yWUF+1YE9prsDrdzMPGVeODP1X9GAkyqezqzTX0dCIbZLxZmcXrt9SlwpEZpmi
	SA9TwQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r1she-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:58:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea6b66e53so14222585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569493; x=1793174293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2FCOFkahv02WUb8MJdjoJ0kcL6KdukKsXu/EI6/Sz8=;
        b=D3uxpkYDAXpfUt2sshatG3/Al7P3389pCq6BNlVPmooJtnj3Xy2ncMMQy80krtq6x4
         RZ2LWKnSQmmZhhNV4xtAqyBXm3TpxuDSBbhLImm+p2Mm6WVLghJE3I9m6N/0hH9yyHWs
         MHC77wzOk7fWzvm7QiB2hpUJYZZbamU+6jJNiA7UYUjvd918XWupDjkBwjA4NWbXtxpG
         ykZl9B2MXtprCcS1n+O0B21Wu6DsxpMPgCpX7hFe8CyHonXu5SxlFjwtNjxw0Oh7S5QQ
         IthXjhssFTjQrA6HwxXLdUhg175rWkv5sX3xyZIKN7QMjBPr+OtUyHLFL7u/AVCf9TY2
         HVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569493; x=1793174293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2FCOFkahv02WUb8MJdjoJ0kcL6KdukKsXu/EI6/Sz8=;
        b=2PLwo9r777BXlEFYPd5hZAMqhxA2W2eouzCqcrZnNUi+3eOxX1p9CygcRZ/DTuNr9x
         lF+TzdL0tcLzCBAELosOuOOI8J4l44U3TKYziYFrfhcJlvCGsvdkzhJ2Is+qKqqNY17h
         5l4vNw2VIKbWFbjAjSrCX1AdmKCjL7hVKwMAndJQ2SYPsKjrcvfNQ0SsOWLncdX4xyQJ
         GwW8EjGb0gp+E2P8qhR70CJpzvluAgSDu2J6POpzgcnEcXBA4ClVlPgdfMWOvKw+Bg26
         kgF9/4HlId5nWbuqsP2xmWZT1hmcvGt3GSMq+dUR3v7TCP2+rt7fqbNeCJshISkPjSUY
         fHgg==
X-Forwarded-Encrypted: i=1; AKwUvBwxdw83NH0ed/YK+Sn9ixluLnyGyj43f8HFBQhBYnkOu7KhQI5exKoxamnm7LSXHlAIc5wJ3WxakP1ImQY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSVFUq3i+HAph07Qai1AZRX69lAB0jI8C7HP/R/pbPHEtf8FBD
	RhsbHO/tk99fzqf/gmm3TypZsB3Oz4X2mYC5w5kqWJUnmmjyBo+ZHIOEHuT/+U1ExVmnqkW3TKu
	DsO2iFAABYZluRjSKLOMQ+2EuxjMEpv1DWudgSoMzq1uw3/uiatoPyiJMt3kvUatBFaw=
X-Gm-Gg: AYBFou1wYl3cxcEB22zD/m6r9lqRdAWXtbZMfx4m2IE6LqPwn5Ibey3MPP2kdAbBoVa
	EG5MzpdWZaL2p/hTex9D5YI1ENkoT9WSmHlBEZh2NRcBh7zNRhGu7CGoSVHoU7EtburSfHaBQeR
	C/I2E47DvbPlZ4Ofmvqx86RkW0uGG9kZvBxcia8ZPZ6vQ6hfRxjdSTLTO7yWR7nZ1ZexfKe6LLq
	NsUFZtcciZ+vXrdh4KIfXZvxpCl9fN1lVpZ1uD9LLOKZFJk//qozXs9Hp6FPy85qy5tLXipFTpy
	ZfTCR9OvydwXjr9wGzCDIS4AWTm4VFCkz4hK+YPGsmaRbeLTL175lx0nh+ejkUMrX76hBhToA6Y
	7WeE3f78vQ57hFU16ugBu4Q==
X-Received: by 2002:a05:622a:4c7:b0:536:79aa:de1b with SMTP id d75a77b69052e-5369ba1a2d2mr23732261cf.4.1792569492691;
        Wed, 21 Oct 2026 00:58:12 -0700 (PDT)
X-Received: by 2002:a05:622a:4c7:b0:536:79aa:de1b with SMTP id d75a77b69052e-5369ba1a2d2mr23731911cf.4.1792569492191;
        Wed, 21 Oct 2026 00:58:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fe5479sm49671566b.64.2026.10.21.00.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:58:11 -0700 (PDT)
Message-ID: <fedd4398-e652-421d-8c85-b5afed0379c7@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:58:09 +0200
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
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8916-samsung-j5: Add
 proximity sensor
To: Christoph Rudorff <chris@rudorff.com>, Linus Walleij <linusw@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261020-iio-light-gp2ap002-v3-0-b7e0946c9e79@rudorff.com>
 <20261020-iio-light-gp2ap002-v3-3-b7e0946c9e79@rudorff.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-iio-light-gp2ap002-v3-3-b7e0946c9e79@rudorff.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad87095 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qfT2Yf8mAAAA:8 a=QUAR2sPic8ULKe_pPicA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=nKa2voRIl820JbUdVH2x:22
X-Proofpoint-ORIG-GUID: xGDFWmFHPmM3odNwMNUS75-QyRx1tV9v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX5B6NJtwNrgKb
 m2fmr6rw6RjzVg67MujMyupETZVqq+cATdGD+6A/0UWmSB74pin1a/ZO/F8oa4Tw6FJSzwDcuWn
 MImCY4/1ad66Sg0htQFi7M7MGwg695iz2Q9fzzk1Y5S2qFM0RDDhOxXXgZZYomiotJ8x0xsXKhg
 NJ0tRstQjLRcfVC6h3l6DSr1MCOdl5Ib6kn19Ctf4riAhbjN9IT2EHqiAQs5UDob+dC6wXPt4eT
 Rz/nRijxcWdbmZGw0MOH9OnNomzGKuTk4PBMk9MWk+pFAV+MM+DJmOuLNMK7fYJy+wzBdmopWYi
 IaPNoJeR+PLrk4mZsOJhM9H8kQAQYa+P/biH+nfI4MO1vyiD+lYhA2/0R0KDIc43XrjOkeqSv4x
 TonA1d5dNi3k6t5g61dAEaOzgP+K0CJD3GZvqUnNoIuB7UJ45hdKDirvHwTvB9kK+vh26eE1oZv
 tTVhtSHvJxobmqzpk7A==
X-Proofpoint-GUID: xGDFWmFHPmM3odNwMNUS75-QyRx1tV9v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX+RSgQ1Yz87Fj
 lYQPk3jo0haVCdiC926SfN1ZY5rbixQd0XCWC3Rn4PKYErxFiNBlFtCKhsXdjaNmR1oWcHuCLmL
 cr6zUTsKRYQ6IVgYLmnbGVDfNXjOWd8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210031

On 10/20/26 1:35 PM, Christoph Rudorff wrote:
> J5 got a gp2ap002 sensor, add it and it's supplies to the device tree
> 
> Signed-off-by: Christoph Rudorff <chris@rudorff.com>
> ---

I'd like for you to comment on my past reply:

https://lore.kernel.org/linux-arm-msm/5531e454-0d84-48f2-af0d-1ab34c149760@oss.qualcomm.com/

Konrad
