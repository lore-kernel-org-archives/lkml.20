Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977613;
	b=CiEfYL1d62kHyByJ4tlT6gWaZsPPknS3F9lW/jJIGPodfbczIqdkN0T3F2Fh6dTX2ERf
	 BgZDN4JuUTFiyOb7xUXbgYjtk4GYLCon/xgabmHFDMCDG54NcxY04ljKvVb2B1QIr3n86
	 tgcuRteepNyp/+cAkjrQ7JaHclcGBXhBDw+Ct7wrkO/CS9VBXa6Jd30q7IWt06ha4zZ3B
	 F1O9CeKjYGT3qmuFV4uU2U3xpcQQ3UYdjvrGZBKimw/SWEwvUjKeauD4JJjnbTEdItj0u
	 Oj6TEWV3CIVvHgFMomCOB8kkIduW2y6Es5gvfJreK17BjNGa24Vp31XsOTIOlmKKo3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977613;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L+gz2J/ZGi177mXkyUJST89Pwyo852hzkeYwHBsRBvY=;
	b=dpyHYTwEDVkjte4SnN8+Fc6H5HWDWgvIUlsJNqyB+AP9i83/MjYNH8sI4zzV05fFmbHq
	 JiwyQ+LxN5VnnqISC4Yds5oRcDzLHZiCjF3fzwMPxd7odgXv5CUic13iymCi5Zf5UuCRP
	 YcY2MlSL8Sb2JIcSaQK5W2nN23fvY8CUbmYod9l3RgCYDwIJHAIXMpVbCPPv6O4ZtGJXd
	 aODhlajm6ItFuZ04B2rlutkG9XCik4w//qSt9w8NJ8EuiNEeDZhSIqoGTUn5aCPSdyz5i
	 IHDDxlKNkl6WZ8m2uYbP76c2hqD/STsyZ4qJwEYckvEvbzCJmqOaLoGMykcwGzUwnXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gWXEm7MN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OlBALZWj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB61606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAB61606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gWXEm7MN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OlBALZWj
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F03bh3723367
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 15:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L+gz2J/ZGi177mXkyUJST89Pwyo852hzkeYwHBsRBvY=; b=gWXEm7MNK71AuT+y
	vQxWIM7285UIISnV9IKcJDh/Gl/Ms+NkVZALgXzr0H371+obyPYjJxoaPerlqRfn
	xHTS2kyPoCAz0CIkCXDxvKuqcIUAU6nQdCZ4CUaLq9hHZ0JAUytYNtGKg+ldgKjP
	Lqxvf3nKcHBBVbYNTyqxX64DkSuLgTh/DSzL7njpTbyTZurSxLfe7D+I9H/zVYLR
	BCm3zfY43D0BjvR/EmeVY/BLAAJSqqw7xesgFio00fmcTZoTInts8/bdjy7sgTHr
	Ju9HCLJwcKr7dfT5wlonPKXku2dnQrwz2DgIIQorWGHVpA//hIbVcpp3WHc0pjnn
	7HvZVw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9k8ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:06:51 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ecbb3b4696so34471e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977611; x=1794582411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+gz2J/ZGi177mXkyUJST89Pwyo852hzkeYwHBsRBvY=;
        b=OlBALZWj428LGdJDpPZnpWeJmtML+PKWKTc5yaurfVeq+h3/44ARCFNsCbf1mgs6Da
         JHwbv7wYep8vv99xQ1mORp/h9kgTlIYRFV23+tsC2XJX883UQIQGQ6kI7plUczpghoZE
         qKXteQojUNiIcrctJ1UQaUFpQlGEzNhnUqM5L7NGbvx/FJtAR9VIO0KoxciAnAgD4BSX
         fs0VHrL3HfANd42GTuzzQFyNkaIMXMdmycQtccXioFT1lYF9y0vqyLO4/CgOugTVuiaj
         Moeb4+hm1m93k8Yg6jqpQXdCjdKglv9VK+KhgXigKKHyNuCjRcvQIBRBcMsEhHzfzAaU
         H/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977611; x=1794582411;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+gz2J/ZGi177mXkyUJST89Pwyo852hzkeYwHBsRBvY=;
        b=xKu+ItEcq5G85vgtha9uN7H2BnsOknZdcLEYb7TgLlvI40XwyxoBfBMZqOI4crkm1F
         pQ/XRvdXtP7s24AbWGJtfg8WVoyP3N3IyBjpT2hhUXF6LH86/aerUKqIU2N3HQnddyt5
         o6nXjdsqp/hKGPF7lczuCYxk/BFQecf+Ik1HYJ3z3YLVZucO11Q/lwPj2Y8FPRbbRW41
         YrW8S9G/nTtD5dMRcB8t8+sWQsya8aFNUxmKg5OOowR9skuShePjlOfxtxYVMYYILVZG
         LurebwKNexAY0d5TB8q8YkEmC2wBEhb234VDLNYhIXPvuiQF6v+IiHxxMaMlFaQ2WCwC
         HBjg==
X-Forwarded-Encrypted: i=1; AKwUvBwLdkpSwSxDFOISJYmoKxOLhGM2ibWFPiA/I7kKy3QOJa2fyjhSd3TX3OIX6RW6PH+q1R+GMbrLilDvGoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/07XuwzgprnJ+QwmsrNNiE97VJwBX6HU85sIKHe/YUVb3xL+g7
	2bJW1pAMIX5XpUJB9tCSRNDx7DyhcsTY3SLMogkGojvDcyMzmblh62+aN+txSEhW/8MUbk3CQLL
	hthhlPfBKEqliDvioSV5kj7mTS+ykbmn9v/FWWMkDGaeW47ycv6FqNzew1ZVKNQh1AKw=
X-Gm-Gg: AYBFou0pPJWWyFX0yb7IvcmJoI9AQhJDIRtZSQi51kE04orHcCe8EAiwaYzQ0utMXCP
	pQn3RYG1BzVAg1OE15WOmb8WtP0egEtwHiQdzhpALvrxZyE+PVfyjfmu8KPs9vX1lcUftdQql17
	Dz0VhYRQEYhTjSPNJgm21wvl1Ss3eta2t4zspfWULvTSj68JnW4Wi4jNKclYGUsXEIoJUOdLHr6
	vrXaiueez9XHSb2ZZZMknONE9LbwaWk03gfctftTfl4pqANql9wgLTgqTuFyvHQGNpweeft3M4s
	TmAXaww0JyW73JdAFGVTUgnEaOcjyWrUl60W48fsoZfswQ4VnoWQo59o5pNJBmWDPwyAqKDULt7
	pLlc9YugQ2oRi6E3Mgd9COlWDVea8Larm2cLZHhMZ3YbyLfPrm/QzQm8jogMRa5WpbOgvcA==
X-Received: by 2002:a05:6102:3c9a:b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7d2a12f2e4emr1247561137.1.1793977610877;
        Fri, 06 Nov 2026 07:06:50 -0800 (PST)
X-Received: by 2002:a05:6102:3c9a:b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7d2a12f2e4emr1247498137.1.1793977610311;
        Fri, 06 Nov 2026 07:06:50 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664ad17aasm785720a12.9.2026.11.06.07.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 07:06:49 -0800 (PST)
Message-ID: <62e5c1f7-72fc-462a-80e3-bc26b92b1636@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 16:06:47 +0100
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
Subject: Re: [PATCH 1/4] phy: qcom-qusb2: Do not request reset by index
To: Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261106-reset-deindex-phy-v1-0-6a9c9f428be8@pengutronix.de>
 <20261106-reset-deindex-phy-v1-1-6a9c9f428be8@pengutronix.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-reset-deindex-phy-v1-1-6a9c9f428be8@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XSXXtA0UAlViVF2Nfk2E2CmSE1KO3a_g
X-Proofpoint-GUID: XSXXtA0UAlViVF2Nfk2E2CmSE1KO3a_g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX8GfL/PKExulY
 gjn6zSF2FsCO2F5ScfJgYMbFVyhtypeP4G5WlieU+o39QL+GPR6oXceiTvN5KNV6FjS5tKPRxUv
 Bla5sT3m3BrrJcr2xUrEgQRepWOr3mU=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aeded0b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IWuRp9V-5v9cUcI_31kA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX4D+Nn980fjcj
 5xJl2dCj9A1Kj/xO/A2N4PN3neYfOG/BxY+DW1q9q2XICYRekFL8rh3cFZT58ibbN1aG872yWfS
 MfBF/VxAc1bDcj2gE0QCbMGkQwocmnyuYjJbR1W8rX0QFZ8+66KHq9ibk16pLueTfxxns1mvcfx
 4UVzrLJTVQUJ/IPLie+q0m7zvqj9+U/oXgJNTrxbUpZ2kfnTd9VC8JqlpsDHc7sIcE35fn1QqZ8
 LMaldMhpTt8rceMpcV51J9ssC8unni/i/hKNeWf5qSEUKjlsNmW8FulGQ1l05ichpMLEOcctH+8
 kAfsHk3Ubp31q0uIXCbxyTKzev6Dq+7GirgqW1wHTqN18l8p/qEhwCSuu4xAbLdyzg9yjYp/b01
 lnqQY5DgL3ubz6wNyjYuLKvjgDFMgU7SdQHyEK+zsRz67mQTwAgKdGEExk9eTBqir5oz7h08G8+
 DBnKFUV9RQBJvXMl3cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

On 11/6/26 4:01 PM, Philipp Zabel wrote:
> There is no need to request a single reset by index.
> Use devm_reset_control_get_exclusive() to request the first and only
> reset.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
