Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B0F43F4AA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329872; cv=none; b=LWTcb7MnKdb+LhVZYGbb2Y/9AC9LOq2Acw86xjxxW6yGK30rR7FEQ35nOtir21qF/l//htFsT24ygzhTQ1kH8QipAwntA5JqwiT4jQ2LCYIG2Q0zTRD1TXl6YNLQgZwZMVnbAOIqyOjLql7WuFf+CxGuUdC7rEF9N5CZBAtzeSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329872; c=relaxed/simple;
	bh=4mUYqTwH4Y3dl0t7kzrCZYl8nAq1yVFj7xqSOfbQXQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZwGvUH/r2PbTRqlEz+Pr7qOJvy5K/Og2Ppw6XXqB824y4FVcqX+4FEF60AeMH0q+Fq+IdQQzc4C0F3WFOAhHNTvjoNOHq3wjWE1FF7IM03lm6150T07/bludMfdAqba6dka2dIPTl9fklMYd7ik+taLHIqGzmcsla3tixPF/tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qh5VmIR3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWrs0T1e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qh5VmIR3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWrs0T1e"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YwOA4103023
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p1BHZ09rmu017kaXVd0AyNSx
	ij3jcnxOgDz0A5/XgXU=; b=Qh5VmIR3HlSDHaGoYET2i9YIr1SqSnYDDMyILtT2
	lmcCbr1IqAhgUd2RpjDO5a6yZzL9t24/XXBRCy5MIsk/FuA/5xp3FndNSzAoyb3M
	aXeLEX55dHAFv2NiUqBgQFXLZYBuRVhXdXdF/kLrt38ab76kUExfL0DpcoWwSAUx
	oMompl81AOVJDuVA5ayNvRqyi7vGPX8xtMYuoIs1V12F9BvWyUnPJdso4lS9bj35
	F8UwCZpZ5yTWITL2oRMA93kDKtqCamolrPH1lYj4rEfemPxi6ho8rYebC70ZiTT2
	u/wJPf3WKt+DsqQaEza2nH3EZr9MojgtTAWU8YcnAaoV+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8uskb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:51:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a05d645acso147109385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329865; x=1790934665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p1BHZ09rmu017kaXVd0AyNSxij3jcnxOgDz0A5/XgXU=;
        b=NWrs0T1e6+XUKN2R5T1Bvog38RZXafF4sHDZaPg1uK9f88byuEFsRIDOuKr90aB6Mz
         isIEFDLN053ETOE2cZdNgRkB49AiEBZP7kifD9VNRlrxZFhX5xDXK6JoH6UtHjpLdql2
         bdC0gPczTK+a5/g2gWyqYqLMPac+uDdusTzRrhIFM4B6VIEhva/GydttFFX7sDO/49pS
         m6Bhwlvzuz38fNYuuVlCqB2maDbKuWlY/vOga4PiA+n9PvCM/c2TA+hpXF+MZl5y8lV6
         fEopmVGVjNcA7Jg3sRwzhO9XUdDZE25Brzu7gFGYrxLEfyTt8ofGJNhLiMmPn63y2fPI
         SWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329865; x=1790934665;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1BHZ09rmu017kaXVd0AyNSxij3jcnxOgDz0A5/XgXU=;
        b=l75xwb7pw//ECZeqSNMeMnfpHijV1aPvNyNnuLrmliSWjgc28T7RhoxMa76unMT37R
         zLMajZncI96kR3lSd9tbJxNhPkeRXzcV6OjH0jAWGc7iLTzJLnWULJ12nOfIpil8C9Co
         e2vP26DFwLSkwDUzj+cj/4lGM2RlxcE9LOKGexDTGOY+exA2X+YnyQwnLc6o9ra0Ri+x
         SpUOCPzTrOI+Au31hApEGm3oCvPnNkGw5eJl8bU+k3pAXOJAkGoI2CQzRfsWyCErcUhQ
         isY4SnIZwSbuAu8VEyDNhk3xxGNTmfVxuwy7CZUzuxlB2uIS0UUmBHZUEfXk81g8S6nI
         eaSg==
X-Forwarded-Encrypted: i=1; AKwUvBwS0UMRNbUXfjDPP/u3/uZELWTpxmGLhRvlWaizQFXog3lLJ3YFRDF28fxvWmV7ts7/2FGyF+PxHUECOcY=@vger.kernel.org
X-Gm-Message-State: AFuF++mAcV0oMFk1cYmMum+YNRvj2XCFuigJCjzHCd1q34Fz3bqWI4NC
	MPmQDkuPNXaaet4yMzg56xOGDg9qjBswLTnpDWzPwo54lrxaU9dwNEo/7WvJlQxhNS8seGRkO1S
	OdwL2K8YvrnJ/dj1rUkgjjpVeNUD0BrHEA0BVCIjKxWRxo/5THvVmuexSex3o8Cxw7jU=
X-Gm-Gg: AYBFou1AA5gx+ZYtPvCJ3UsLoDMKwREOR9/o+VczBPaZ1Sj377P3Tiwsenqv/s4snIW
	SH6iUWZ4h1XQ2JZU35JtskJxbziuYANmyiItG5hPT4I9/P4gMSXCO9GyjAoW2sh2WNogaGr7GgG
	5J/7gx59xFcsARoFnYVnttvlcNesEOlqJh8pUU/fD7wqIwYRRxHSZXiY2nM3Q4nMUgxVi5+TMiw
	1RLxC71UGu8ajRRSGTPcS3xAh8vlu9xT8Ti6I3+ghIsn865NB935QCiY0K9tFl8LTHCfhiNWFsz
	9gLId1pNd7NcWw3AK2rIhlI4U5UmbJVZEhBRkMbJqSfJk0f+LIScUEaqxF3uq9KvQ8Ra4/C45l2
	gRZBnXJ6B6HII89o=
X-Received: by 2002:a05:620a:701c:b0:93b:fbf2:cd50 with SMTP id af79cd13be357-93c43c97209mr372237985a.41.1790329865464;
        Fri, 25 Sep 2026 02:51:05 -0700 (PDT)
X-Received: by 2002:a05:620a:701c:b0:93b:fbf2:cd50 with SMTP id af79cd13be357-93c43c97209mr372234585a.41.1790329864898;
        Fri, 25 Sep 2026 02:51:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff2884552sm29314895e9.10.2026.09.25.02.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:51:03 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:51:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: add chassis-type
 property
Message-ID: <qgnyytnukavlphwtexrsldaaedldjoqnmylckeny4ksqdnocuc@4nwrlqhouj6l>
References: <20260924-topic-sm8650-deckard-chassis-type-v1-1-a58729799bb4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-topic-sm8650-deckard-chassis-type-v1-1-a58729799bb4@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXzFCx/6tM8n27
 VnEMRPPgWmGLmyDV0hMYlosguXgCuqVgylzXVsvZ9oDiEv20kR8hDZXhz69kdtPs2BvSyYoxOYh
 7yJYBVAY6awF3blY1KKDx3ZP7aCe4QA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX6mKhXKHEXWMV
 tUD+fPa22rNucBRsLggtNxjYKNX+XMiyzjd3OR0rzvwE64HKyapjC1yGwyslPbCk5hYlJCmS170
 lYZGUU2tbwKevv5bcJ9AMKqtaNuV0CG0J9TSPuyuOZ8I2w//+h7vyCLZ4tNQgzobf9jlXZKzz4w
 25LGZJWNFOynKkOSRE9ElDnGBnVjX+DssDbMj/kcgPSEuoBohtWbdANqCYQGYTOrukFxxZciTm2
 EQNmOIrXpFPee4OfCdO1uhsgU5DYlCGscbIKBP7Zh5io1CZ7IzDVcZIm3+H0rhEz5YAq5yqOBjJ
 DvvABXaSuc4LnsIZ55/DrlhyW2WL/vH83oUg2hbhtQSH9Kb+Y7iOqatdtJb9x5FBcjgG5BHvkE7
 wXbOktx9rtdZi7Agch2yFSUO9Uj3+oCSbfsl/Mje79hmYjqi1HPchYy9f8DN61OEIu14zIuStiq
 jZL5Qj4zW5DcAt6aoXg==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab6440a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=96plJQVwC7y4dvEGRvsA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 39QlXrlEcZ1s3vWD1INKB7D2kqlCheYn
X-Proofpoint-ORIG-GUID: 39QlXrlEcZ1s3vWD1INKB7D2kqlCheYn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039

On 26-09-24 17:54:59, Neil Armstrong wrote:
> Set the chassis-type property to "headset" following acceptance in
> the Device Tree specification [1] and dt-schema meta-schema [2].
> 
> [1] https://github.com/devicetree-org/devicetree-specification/pull/87
> [2] https://github.com/devicetree-org/dt-schema/pull/211
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
