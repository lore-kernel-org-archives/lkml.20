Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B914D17C211
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789614050; cv=none; b=DYikrBiX2TpzyR301wLOWvNaUN/5HZZBUSH9zyOEG+61v2h0gIRyAF5XLLTMRoRTIcxhJP5ZjePG9ezsopP7CeVp/VtuP4U35y+Johe5K1FbOiv5MCmrFJHKNMmcmM5IiyDkiZm+0lZQIUDwWvdVG9cESvlv3iX2teGxXMeFntM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789614050; c=relaxed/simple;
	bh=omyFGu7zMrBNkx9/hINlWGA7NZzna/VDrEclEElieyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnPAOlRmtx5K3jCEYvI/pjEm0ttOoinb/g0Z1xhySy95gYIkwFUZYqoGqRMVzio2Tluy6DkG1EHGwY1MxTPX6D5KZfTK0gLWBtzit0fLCCjtC69qYs9FNkMwb/5a95PBgqoAAbXfNURz+LTXQYMOcNs5qAHt+BYiIIQ3YHicu5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPuoBMz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A0Wd2PuQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPuoBMz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A0Wd2PuQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2GlXp3238097
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vmcg7SYP8ZXHyrIlBC+RXOu5
	dKQEPDtZ/2EtBYdhMEo=; b=PPuoBMz0iWjOZ+VEsY6UE4r+NR800lU++LYwlbrj
	+giumJsSCGFw9IQPBVUSkUncrCNjCw5wIKWY/ajEfrG8mK758GnmbRQV1eDveEI5
	kg0e4GKCMhRRsVAYZuB6nyZlwzzbhZ4LrSAA5pnMxmBPc6C7h1h451V6SWM5yDGM
	Ab0fuWGobxPhREqeCnxKjQ9ocYcjxCWy8fqYdz8KoUmQJMql1/V4J/EDxffrFkQu
	d4ijJkBxZKlmHDsnNYCofG0hB4haWPEykkBpLgTG/lKO9aMAEhTGk4T4VqqcvadE
	f/bXkGipQb+3bsjzVhY1Fkkzr0WuuADKZ5+OhaULezI0dw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqyga1x39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:00:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so307260a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789614045; x=1790218845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vmcg7SYP8ZXHyrIlBC+RXOu5dKQEPDtZ/2EtBYdhMEo=;
        b=A0Wd2PuQ7nCkn7/28CYr9CuB/3kQQmDumrkhMoM8tQDO1YRFDHpnuhwr+LhC3dKkB9
         1uHQjvNga/KlHNp3h+iTn/5RyVnnQKlfxkqEVt6N13LvSgfRA3R+9eBcvQPE9TAH4tUC
         lzWF7j5e5XUHecthbZsJZVq7ZoJ3q4hdxkyVZi9+YJK9t2f+rUq4ouaDDRGv9wm173LO
         lAXtCVsjP8Ez+BQkThX3U97aHD2hQNP44kCPkRmFZE+bMSxKGzUg8nWDkESX/TUseqG6
         I2wNYvbknJZF1N0NOYXGU6RiptmfPBNM8Cp+qTZyXsvYcY6uxdRjvnlM6AbqIwA8L/zr
         EmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789614045; x=1790218845;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmcg7SYP8ZXHyrIlBC+RXOu5dKQEPDtZ/2EtBYdhMEo=;
        b=V2hoeS0kqSE6vh+cC1kTnfL7G2dyzYRyAGb0fNyEwcUref9itZhBiKcqYe+8FXlRLg
         KLU7LyXUXQNeeZ9Kx/0HPveiCQ+OdCqdeajUnZH4rNxIGNb/W+DQVQzzrF3G5sSQ5I5i
         J0EGfzWOv+NEV1rzJP1gjCgjeYFJzhPW7AKwXRRe1hhnJCitj9+fUcLwNGq5Q9Mz1LMx
         H4caE5mtN8+K9nLpwOCJYQ9ndJNXUlgTLNs6w+VQar1BuCVwXgnVthS1hECCHx95EUBQ
         sqgqgEGnlGFZO6aIpf3DUNEeUuk2gyVg9T6Jq+r8Hq9IT2SgzvHS4SW/Kpm1B4ugOUPZ
         Aq1A==
X-Forwarded-Encrypted: i=1; AKwUvBx6ljy+wOkvNC6O8R6oZyhG7PP3F0Bb/g4RZJiyVxtgc954FkVTGOsvfH/PTA5BLrTRsA0oLzp/KKaryU4=@vger.kernel.org
X-Gm-Message-State: AFuF++mgRteuXqYGyXfwmv0JWE7/Ldl+GLTLE92inItsZLATxyMgp3ql
	pU3FUsRLazPNsibzIuI0PMQICordCXbrER97Q82kdIxUZA6rdJYR5UTmSi1BWTkZCVRh0G8Lh3k
	5Nzhf7+09qZQHrs1xRYqNCo6po0jyC2zOjJZb6JONPvrgwYU/xT7Mm9EOQPU8ZmfKT4o=
X-Gm-Gg: AYBFou2IojjrQMWKeCGQRqDm17LurRAqQtZXXLIAv6VQlt5DCNt37BwHTRsJ0hpanmA
	rdi3zmStWyC/E0VgFuSdi39EpamIwoBhaED6sabhtnayotFlECMNKoRnIYTv//91JiJS7SpuFQv
	9j6JvgeRo8aiyl/G317NScm0SAZ8J1TInZiAhHwHy35o9sDWUY/ftLtq6ziKkd/kj5jddALB8zu
	9XxqiMmBbKV/wUMKgxawBvWYV8BJ/cKTnbvUHKZD+CpV5c3J7kX1ZqlSu8d+KbD1lTUVdHrMzDs
	Fss5+3mVfjGatFl70+8sovf2GBe6hpr3O8uA/3eQu9Fs7Kk8sKaIBXelU7CrJXoJkW/8aJXLcd/
	KAmZWMdgsGoYgsGhfTLxcJUm/3I9OILWs8PMGNEF5Lkg=
X-Received: by 2002:a05:6a20:430a:b0:3da:6bdd:2308 with SMTP id adf61e73a8af0-3dd5f5d673emr11853554637.18.1789614044358;
        Wed, 16 Sep 2026 20:00:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:430a:b0:3da:6bdd:2308 with SMTP id adf61e73a8af0-3dd5f5d673emr11853194637.18.1789614042305;
        Wed, 16 Sep 2026 20:00:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ac47cfsm10357234eec.17.2026.09.16.20.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 20:00:41 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:00:36 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Message-ID: <aqtX1Dvi2uyCEdMx@QCOM-aGQu4IUr3Y>
References: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AG6aZkoBtVeRABmlr-EKQlIIaTaf7HYy
X-Proofpoint-GUID: AG6aZkoBtVeRABmlr-EKQlIIaTaf7HYy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAzNyBTYWx0ZWRfX3xHWYk2Zxcvp
 EbK6UMUs6CEJZsb9sjO++04OvCD4SbzAuRuVh1xUPse1L9QE0L5Ny/7uUWtqTpiEotPJ9hrp2vW
 TpEGckGK0dEFEzyrXBJP47hH8Z7Ezyk=
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6aab57dd cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4j1a0SwZ8iOXVT74WvgA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAzNyBTYWx0ZWRfXwpGiYGLDr466
 e4gn+PrOXWRmO8NXEVB14rVcE4shi4KMG2KXWG6kpgxkDq2ioIAsalghTu1v6PoqcZpj1zlySVK
 tf4obcb87BrIx0xX8WKEy4vdjb8Z6bTBjMozpO+0xLrPBubS7Cw/rJQjtipaccciLqzBcV9m4+Q
 JBKk4RxEWeHbf1CXra86iSD500U+OCMDHIG2P1bhKUA2hhgsNqn7aJbPLmq+hNC0VGnpZcrodu6
 296Ktm+4nMMKnndVL1ybmcfn7YsCkyd00TzP6oA+sqb0qwK9bzK7W+aWgBdYANI55Bb0x0JMNtN
 Fp20Tzer8nEyn+5TxKaXfsx+8FEZyKXGYIwN1TWlXHjD/sWQWt5owakbXauUKzflnH9fJbPjY8W
 KnMhVbAUVTQyev4ZwUJMeRVEUSQNx8QO3i2qjA/wZslI+STV8/0ZSTYLMi3W409r4iUi/YuMmF6
 EnaxPW0nBmMksodL5yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170037

On Wed, Sep 16, 2026 at 05:55:37PM +0200, Bartosz Golaszewski wrote:
> Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
> nodes.

As the nord base dts series hasn't been applied, we need to call out the
dependency in the cover letter.

Shawn

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Bartosz Golaszewski (2):
>       arm64: dts: qcom: nord: add GPI DMA controller nodes
>       arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines
> 
>  arch/arm64/boot/dts/qcom/nord.dtsi | 219 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 219 insertions(+)
> ---
> base-commit: 3c60a5740403002069d54463b6b0f603b9ba08bb
> change-id: 20260916-nord-gpi-dts-40456500b7b1
> 
> Best regards,
> --  
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> 
