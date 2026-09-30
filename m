Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB18B471424
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758730; cv=none; b=clpgpXUkily45TRNUul+2h61A8xNO32rr/0EbiJrTviaayz1t49CKsOdQ7xKsIi/sDNhkrXZJAZnPh7wYMW31StnLrXuMTxgctEtywO8W3vPSe/i5riv4XL83yS3guO0cLj2G9XRBuqeUJ4EY5zhmKXylWKOemeJuW2T5Juzw4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758730; c=relaxed/simple;
	bh=mZ62Kng/0Rgnxdkn4HmMlG6Oxc+tVal1JPFn6pjaB3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYgN27jmYRasPMpoe+2pP9PKDg4wIhxGNfDPfn56pseFvJOpgkaBaH26gDhOvc1VkOUdgCJVkRWxUTO33OnGRSmUt8vUHj8NeLcCP7Y95fu+2A7oYDTr5Sc9U78ag5HJFQvqFEKAxq8wzTocPEKxJoIcTu+nw5HRlwasSPevl2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHqrHBC8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5LI9n/L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHqrHBC8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5LI9n/L"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dNfC3082220
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rmkFRaiiplQ+paOGLk3epfQou5738Zs3wOw+JTEUgjM=; b=WHqrHBC8V4pGgxVA
	VfNRGe3zNT/WpiNniEJpuWIi2pZQX6kET54Sb4TmmoCPtzFWuJny1SxESPsDqcM0
	Exe0ObADWSHVwWqlv+UTWqaXMrvJ+l44iY5SUGr2e9LHSnuBHCK2ggOPciEb5B5j
	ecHhtI65evHiOrlZ3YNRzSGzk2rYDOIjcrmqyp7Y+j+EGPce60B+6HNS/Z12fWY+
	n27bgDUvNbVoMTRfw9UIdjoiQTQBdyFt0ibzUyeV2IjlyGNPFNJC3WYUk7j8q43s
	cdOYNwwgO8P+8izf2v/5lR2XdJO7Hffqd1Mo/MbUFyN8Mt+t9QIvC8DISXDwJvMi
	u6pAxA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w140p4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:58:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530d522a20dso14168191cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790758726; x=1791363526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmkFRaiiplQ+paOGLk3epfQou5738Zs3wOw+JTEUgjM=;
        b=K5LI9n/LEBSCGzZqqzT3US6Df3aOh/5cpCFhzkDw8Wrtoyj0NRIDrzibziWPsK8pHl
         WNwWViRL0Hhb7nIbpqRmdVKIgAWJp7y9iug2ShRxlTBwT4mepK8DTMZUJoSVpEgsw4kb
         HMoB8Rq6WSZovdM9zQgGTzAUoe8GEi2OL+0Wx5LPCrrK1eQaTOowo8Bape00SXAW+BpT
         xa3NARcDF90c773JqQzOVt+sTLR31NhweP+hthOjXxsk43xl61dObm7CbXcGhNwhENPi
         RuMikjclLF1p9+jSAiDEvMKhs3qN/K/YBQwYRYLQrpL2iR4sGbiYA302QnOjPBg595gC
         /t5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758726; x=1791363526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rmkFRaiiplQ+paOGLk3epfQou5738Zs3wOw+JTEUgjM=;
        b=lsHtMsIlTPIPc8or8kdGsDtyr27u40nnmQYU2OCaLs926VdfvZoCmfuym3LIXBxoKW
         /89MPLVyF3ffVXbZQpVQHrqu4wHIOpHeQTA17e3mpujOMpcx+5Vj56D0d96S3oZXqe2o
         9B0JRDyCGSnfxZ4XOT6D184P1ujYoXtp75x9fqDg1l8SlmKQOE2IwrtI19gQUBE6keMJ
         m5mI+3Q3kUT8HmTTt8CNE8Nq7mmFixeS6fiQbg64iZqLWMCv+62VtaVvi4nWR9Y0TkDN
         fVe318m8aHgIJsn9DZb1qy06MB7VYgcaLd575EPXVRkYaX0btiKe+yHe4DHOF8QsETRi
         0xow==
X-Forwarded-Encrypted: i=1; AKwUvByZT6knD+WsMipsQxZ7wzOyXfseSbf4NLYdviRaBAjDpeRssAUVInYYXghRtQ9FtYy+H5zfpGHHjM1bZ/U=@vger.kernel.org
X-Gm-Message-State: AFuF++mFz5xgvwOBDtqBzrVbVHG98eUqCF1k0ij+12XHpOl9Xds5v3NL
	/guRf6FUbCmaTCIEVw+Ia73GiDomDg3snsFiRIuInzwkrlRzi4gxiouALqEeQ4fkMnldF3Ze1ve
	6NfXfFMf7RalfPscLIoXRJpCq8lF/2LSIO/rBJtZtFxf0gtPrUMW95pxaI5GYtTsFV8zduGd41H
	c=
X-Gm-Gg: AYBFou05swQ7knwgXbWt+yWiqEWQj5kRO3bNbwNaMx1++Y5H30Hs/48+CPb9RkjbrqQ
	/Gl3fQnp9LQL+k86L36Ao1mYrUrHCOo+81AEoFvk4s1ev7StPnkYKaKFUpHKawGiER4Fv2hojhW
	fWYedY+5G4bygt4GSAMbTp+s+0sgSlDYXio/RViquyJEMeSsvzHznIoBMGtQbqQ6U3F0YIgh5gS
	rwFrdES7FJ1kiO+CelPoDamna20enlS5ve0vWGki6rhcTyjUyzYwVxfyh4RWsdM5R5bFo6/09aA
	EClMclsDuovjgmVmrfzxeUs6ZquvsNHmUlfhNu/Ofx2edn7wyc8zzboSbpIyckbP+VyB/5DigAQ
	Li1WRJMW4TUKsBDVYQdERmg==
X-Received: by 2002:a05:620a:261c:b0:93b:c6ec:780d with SMTP id af79cd13be357-93ca9880834mr94463985a.5.1790758725782;
        Wed, 30 Sep 2026 01:58:45 -0700 (PDT)
X-Received: by 2002:a05:620a:261c:b0:93b:c6ec:780d with SMTP id af79cd13be357-93ca9880834mr94461185a.5.1790758725400;
        Wed, 30 Sep 2026 01:58:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f79497sm31063166b.39.2026.09.30.01.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 01:58:44 -0700 (PDT)
Message-ID: <9b4eb301-5bb6-45c4-94eb-a6a3a2540309@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:58:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sdm660: Keep the USB GDSC in retention
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928-sdm660-clk-fixes-v1-0-5d5bb84e3258@gmail.com>
 <20260928-sdm660-clk-fixes-v1-1-5d5bb84e3258@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-sdm660-clk-fixes-v1-1-5d5bb84e3258@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzNSBTYWx0ZWRfXxM7D8A2O+Bu9
 UAk1B0Q1iQrUWlYLUc+RpzgVdhIRO786UbNzYsmfhgRwDwX+JgTPHHcVMX0Zrkmx37v4OjsxrUv
 GYgp14xa7JF/6jj7jrdb5RdfODShPKE=
X-Proofpoint-GUID: L6gdJaCVb0FZlhKvWmtoPjgY5u_4fGG-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzNSBTYWx0ZWRfX8vhT7sQhrOUU
 x/OXmgyz+eB4guskuxfGByIkMbAWrFdODhofbK70d7KTVt6Sud0rrCPdUWUhqKrEZNma8lWMbf+
 ShmYyXI1a2wNZ7z5fVozQE1Yyrvyv8thO7/fGR+zuH8PB2jr4rZV13Moz7zVnnDtukdLpTPWfAB
 Z20vnYME3m7L2KvX8n2r0FsxOboPR0bBXCjGF3ID1ie/kXSQKa7PUSbvo77oFOM3e7CDrqom+nv
 rS1Z7rWQpXGulY4F5IkDBPCY7c75/7GXU8b/KFFDWAo6adv7DHvfxJAoVIK3gI3ktiZyu5jX+EO
 XulZ3Dr7/V/2oTmRydUsEbwsXQgEES9pvl2PWixfvQ/gK+xCL+MqVDDT7gfH0O7V5i5RLqsU9eD
 7CQmq05CCmmYB0+vXa2XYZ7Qj1W0DgziLMopsxPikDcj+1ki5QrnyrY3ZUAif8vrr9TFX2bsuuw
 loIqXcMCwTh7Fik2sjA==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abccf46 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fhGIgCobiWGKHZvJdykA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: L6gdJaCVb0FZlhKvWmtoPjgY5u_4fGG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300035

On 9/28/26 7:41 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The DWC3 glue writes its QSCRATCH configuration only at probe. When
> system suspend switches usb_30_gdsc off, that configuration is lost
> and on resume the core fails to enable endpoint 0. Keep the GDSC in
> retention, as is already done on:
> 
>   commit 78a2f2a04fb5 ("clk: qcom: gcc-msm8996: Update the .pwrsts for
>   usb gdsc")
>   commit 83fddbcc8337 ("clk: qcom: gcc-msm8998: Update the .pwrsts for
>   usb gdsc")
> 
> This change should be reverted when a proper suspend sequence is
> implemented in the USB drivers.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
