Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349415;
	b=hA9hBr83lfbOfWQK82keCaJ28i3n6UW4PzmH3H6PMCDsyQfozio+OqArndyV6707h7+e
	 FN74Bogb3yG19kNplUaM5wCZwz0qOmxxQdtfj9JQPLCqnW1zIjwEq1+p4/YPUhha2NFqV
	 GWMIg9fnX+u5WouKhfl/aJKu5EU45u767iIextu3UfR5f1vj/V8x+GnMOI226ViRk+FKU
	 YgG2WWIUs9yiB0ChY3r1uBovyGmG0JjBvSQ8WWn7mqx6EzLzFVCA7ECQ0xXcrM8/vJuuK
	 upHbMtkv9PkwFmuJUil2M1XHSEJNHFUSV4/9Vw8KTpkM2qPKiSs9LE9WnL4fU6OkqYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349415;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GFKAX4ESfiQcX34DEO8/H5iweYY7L6Uhahq73cphBfo=;
	b=DmDWPxl3QZeNAHBJ6qsTToCWmqBiRKH1bjIOv/7NpEcsGiau+ginWfXO3DVdgc7O+mGy
	 Ft3b3k095NlWjQ8CZ+M5pGoAMOfaMYlTHPnhURmoyC3lXxZ4jo1ZURKjuSRfRNh76gI3I
	 yv3hZKYis/EuHsq9CYUkDbExm3Q5QrhECFAUd5BwmNB42dbSRI8kTYhHl8YJpb4cI51vm
	 zcISPbFJ7VbZSVJ7AZdm3anf7pXVUE7sBPwP+eF4otZDRGKS3LNUS68XOkqQe93pGM9dZ
	 FbfX6nKCBJbg5tTnKWniXeNZScMRCUEgyGuEzabln+pXFmDS351MnfGx85iM1345i7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Npb0xvIQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gOW/DsAI";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A34E606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A34E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Npb0xvIQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOW/DsAI
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F2HO2134509
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GFKAX4ESfiQcX34DEO8/H5iweYY7L6Uhahq73cphBfo=; b=Npb0xvIQGSRA+aPx
	7LKYgO9RBr8RkHvzdUIRK2LpgaiITULMMgOV2LMuvv7qbfVCc30kjRtkjViuKqth
	z5c7JU1d085ob43F348Bmix1gmiKoGwuGtK/cbl19KMskJEpVX4zIyO7KpRmRM0/
	mtz4zJdb8l088IZNKDpDoQdpXa0Cn2jtLromPMD6x5KiTJT1ZfybLI9Ncnnyhdr5
	0p+02ySBkrd+Z1xpOqO9b30XhtBb8lHF+KUbxdhLTZ7JgptGd/7NbMup0ycCb2Gv
	umRrktlFaXGFEqjwurdMZXUmn5BTFh/jMR9LeL4CL2lPhayQp3Aq3egA9Ya9zLFY
	EfR2Qg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj0nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:36:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so8962685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349412; x=1793954212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFKAX4ESfiQcX34DEO8/H5iweYY7L6Uhahq73cphBfo=;
        b=gOW/DsAIAbyCTIKZIFziFB/BIapdQKDqgskODuTvnwguScmG26BlZat5zn2Zcja06I
         OJYjiC3CcepFFdh8RitUrOw5od5YtQu5pxM7tiTMfBoNGoWjNVLZ47cdeMrpX1NB+r1z
         kveF218CYZkNTVBkS99v3kH4tIaPqg8+KULR1brDGLL8KF0qBFhccbdl/G6PDGVtL4q9
         O43cu3uYh2oxXckte3589o58m2nAemNkz0IWwWmYRxV4BljboUuu+KCfNRmnoSayL3uY
         +FER+69KmaCKaJpoQ5As/whkQYwx4oYmlRJkXAvleM3qpXwn74/2fdwNSgPqglZy1W9d
         UPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349412; x=1793954212;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFKAX4ESfiQcX34DEO8/H5iweYY7L6Uhahq73cphBfo=;
        b=ZrcoC0ygEGAnSn1D5aBFtpNNrkeSdchpJbNtInUrfJYOG7kGsfbBfcXK0MGb5YdSqq
         BlhP5xX4NgpDQ6QJpCwIww5AXkt5Qc3heg3W8PFArP78YZc6YaBCtml18BnRxp8HmSaA
         EUfvQ3VO2izF+7k5ObmIPDTeYMwON3+wO59Lawx0zz1lZFDkIvoUvoAuppsRI7mDg1Gg
         g5HcHcvy7aXZDpQy5QRmeL1GsNl4bB+EXDZDMjsxmQQmWltvR7+ZBuhyKrDb2Mq+nVwO
         e1imcv1f0QvpDMi0GvQ65jFhgGxDgTqGKzNknOZ6nFICWSIk8KN68Dks6gWwIDiYv039
         zwbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBYD3hpkongCTmELWus4HUAzyRM34mQyeiItiUKNVDNqCFclOdkPSSboSD7ooyc0fCuWfNdTmh0ozh4n4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL00Az++cvEUO225IJSTRiMt75zpiuie4pGCC/nUzHrgQ6q5Jl3
	mfJYeK6IeTxHpuVQBNk1v9ZqlmE9qR4IbOfsiC8uAugb0mzOgJvPsQ0ai214HOhxjYQgjbCdgMg
	ZAJCh/V62D8aib5nwYu8ubFPX5UVsi2mXI+AFWjfGzUDmAzNrSYjCBv3mIGdW7hasxwA=
X-Gm-Gg: AYBFou3svWTZTXBBAxxR/1n3xFqJcM5+KzKq+aQ45B4qh/ZHOY5aL8YcQZJ4bvQTUrW
	6c0oTmXE7u9QcFpTJFlKwxqrXLBZ1nITFxnJxdXTVoiGt+lWIEMZiUC1xERD5w1MyVACvQFW9KL
	l79R71bjZB46n2xofiQi7eBtxYrGxtDBY1iJQzLxvjHvPxNfQWuI6ffClDC3LFT//YMMe5Y++2N
	e6M10S8FF5TVpAF2pKZgfG3otaQgyUWAQgXB/FPuGSiIAZfqquqnecwR2rUoloj++qZ9HIDfsSz
	jd+n6EL896aVADYzFWleJtN+cV0eFqnDWFaDLAcgmXjK0KsCxWiktxSif9l3gLvWSG3iB0DwA+x
	OgZSPOoZPryXxaCMXq9iaa4HOP+bK2CGOd8zAiNd2TH1m/4rDCP5Ht1kj9PYnc3IeCuy1vEE=
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr267091885a.2.1793349412547;
        Fri, 30 Oct 2026 01:36:52 -0700 (PDT)
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr267088385a.2.1793349411659;
        Fri, 30 Oct 2026 01:36:51 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b42653sm381344a12.34.2026.10.30.01.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:36:49 -0700 (PDT)
Message-ID: <7c8d7b8a-c2d3-4215-9c82-6083648c1da2@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:36:47 +0100
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
Subject: Re: [PATCH 4/6] arm64: dts: qcom: qdu1000: Mark USB controller as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-4-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-4-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX8CDevO15Mp8P
 FYMq+WghumxVQ7VwB0aLoVUx1VIA/b1AA0l18LcsYh1sLm2I3W4D06ysofpQekIgxeLA35DzXxi
 nb8ns2n4OJnRSa/bMC5MKcLyw3zVgjPDn7M8EpRI66KsZLCl+vohVDhoatLo33cKQO3U7/7XbSc
 XZcp7GeOVDTDiDl6DQwtKHmEkZB75u7O2SKUkSMl3txvzK+fkgoyOnQqGWwLT1O9ANTJ9aJxsy0
 55LCRPLAdCYHuIC61vtaWszsyyv++CNZ/wDT1/4n4T5YMfwnqlDq9AWc+0GT4BCGoSzlaNmxdLn
 SjknryOa23wB/vp2TuXAyqWSWq1XA4YLU7V+FrIFReUprzkQdJGqho1jyGtIxdNoRDvwbrUuteq
 /00LPtAm57KZvWGg1uqHKEaFvBcsfN68NXxkEtnvhl7ATcwOWSMhwIMZFp5hS5qDJODPSuJh6WK
 MbACNvSPvLQ1EXPhhUg==
X-Proofpoint-GUID: 16fYqtyuYLTOGGQLYBaX2iunO_Okrb3n
X-Proofpoint-ORIG-GUID: 16fYqtyuYLTOGGQLYBaX2iunO_Okrb3n
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae45725 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=r65pQlftkxrEpSp02AcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX5BXBmkprzN72
 oTQYd2EX21KcB9gR7vnbdXYyEiEES3Moro/9gRBwnBzGMMaNcNfiTqhfgNq+p1sXqSvN8ss86xt
 X95yiplk/1JTjLwBLP1R8HmGD0qCNL0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> The USB controller on QDU1000 is DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
