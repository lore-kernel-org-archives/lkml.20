Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518314BD0F8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846490; cv=none; b=q1YTd/yY3p0ccDhK3O6n7zQAH84JH/wdfgZMfDf/JoSrtN3UHMCZahuN1dSRESoazECs/F3+fwcTedtZJd3/haB0VT64S/cl2q2qyyzOaixKk1xGPy7oYFkwn7DJYLs0iUQa8eipnR34toOnsAmgtE6YVwdNRqg74TgMEfiSzxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846490; c=relaxed/simple;
	bh=/gbOxSOrolLkmQgvxHnI2ULujiAh+pgAvB0yGV93klo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swx4cOekV2EBGo6VxRpM5XWh85ImZUulQQbBOXZMkQmJ9LURJRlCYZZV2a8tkN8qOmwxUu2SlamdKZq48n3IkMNnfx72Tzy82X9FtG0bx1b9ubVVxVUdl89Jv6SejjyDe22BBg4u2NBq6zXCBSaYuDxzqDfNVTPdWwTypQ4LsPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ah8Kps6h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvLjCq0p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ah8Kps6h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvLjCq0p"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xPfd2176837
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 09:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hlj1RSurk6tC0HLKwc5LugbIH1Gsp5iZA1JLGbZPNMU=; b=Ah8Kps6hIMgy36Mz
	2GaDcpjEkzmYoQkO6c/D0J1q74DtVmnJ189WwybqoHyCcLZPXKnwHQWYN6UhIJ04
	AvnbfTX33JdNxSLe7xR2BdcfQDlRM+dStFB/hM7IOfAcrF9K8IJkRLc4YZpjNprs
	WkeqUZxZKpjfZeHBMkMPop4N/t4HrfxiEDEll2OtWNIevlPyowWSwkOlVPXr7Wu5
	2Ei1kadE8vcj9SP0QrmUa67UYTAnkNf57cwCgjb7IeJEczNCmPuIDO1nZfPVj/5V
	4cqhpJ9MErcw+8cGeSs79kdHwRvEyX66Rv0GjPNWFE/cN9sfytdB/IThgbcGz+1k
	am5B7g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nryfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:21:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530d04ab694so19826441cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790846486; x=1791451286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlj1RSurk6tC0HLKwc5LugbIH1Gsp5iZA1JLGbZPNMU=;
        b=MvLjCq0p7knYMiy0vOG7WT9Kq4F/I0iWK/RzhsxKYQ8v7PrO/9f0DhMIiv2bZgECS7
         atcsQEEbK66UuuNS/necaai+AfhJTEPkYsK1DRS7GSec5Zz21vE1aC/KM/knnK2stNcs
         YZJYdgnbPA30naZaFNHyU8hwxx724er92xszDqGSQhSsPUn2nazF1H0gl5dLufGe/L7U
         gPdhgr2BNgoMrQH7v6y/bZC3T+L5VaQ3fIC+KEicSSsHsM9T+wE6O++odzSaisDnl3o4
         W6uoi/1zrOJ5MrIjGMh7bcq+x+MGYgZrGmTi5JnheZgMMVTkiKgenemp+AYosL+P6nm+
         ZeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790846486; x=1791451286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hlj1RSurk6tC0HLKwc5LugbIH1Gsp5iZA1JLGbZPNMU=;
        b=ne+MhqsCEPg8z3javtarBYz9+NREPDa/OiX7eoJPUL+gjk261s+976J0JPnTnS4yRQ
         oPnIkBiFkJJPIky2HTi2EZQR3vWmn4xlNLgRu1SBWQvKopfTc72YD86/NepPcujYr5Xq
         vNIHq70lGVE06jbOPe1sMto2YVZJbu8AeMCfutl0FeDS/FUKe8uxZzk/4mDKQR+T1Ruz
         8FMvvGQxI7pCBwlL1U/DRvSiCMSozDWMLk/lP/B6ZD8N2wXjJ8D7NBrp9RZgG9YEI5yJ
         wkgC9ikIe4GnCdJVPbu40HuyJCWnaWXC+8wa8f7Epsye1IzR6t2e4Caxy4wrhqg87TgB
         zOJA==
X-Forwarded-Encrypted: i=1; AKwUvByCFp0+L5YteVFyOGdC6+sO5KYEYiQstGl5tSR8++Q9oTIEfQB+Ye4jRp9MTKBI4s5SaBtqIsyQkNvznWQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kQKa7WG4G7w7HVcrdE3kc//CZ+AqRkx2M60Sf+ywHygmKgb5UW
	va0ISuxjNmBY8UeVgQr23XJ7s3J79gPCn5b/Xi8BUO9M8dZ9qF6GCY/uKaw8e4ghLKvAvV1RXSJ
	d9OgAv50HGCu34RAv1qaEZkqp/WiRTRHctk4gaDnws0S1Kpf9UYrVEvbI6MVKZVjx0fk=
X-Gm-Gg: AYBFou3cq813jOWtuzeDUB3n5Q8axwQcIdwE/cSu/KPZxUY4pPykiTiMaKJedXljMDU
	0gN6X8J97uRTuYI75gfxClBdsP3j0CGzVak2Ipz8mx2GKJOQSdQLyLZ2xtK4tDUWW07dXR9ZCU9
	SE8/Sx/TzU1R6XdnNtFw1wZcNFDXnP+zmoZm8vykSXbrZL6Fr2TmKLCG32EKVqBdOU/wPLsCm9D
	YweSpStMwezZo0DZMot4zAJNV7BQTJXoSffruh0LM9cAcxpmF8oy4B6KiiokTkzPVrqbBqZ8qe6
	9J08dPXXlSyJxNsR2rluERIv8ungeP+tisiRTcc5QrlyamQKo9tLUVjXo98CuF828zVwY7VFpJ1
	6n6cycY4ZTyNywOCE1rGKtg==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr693565185a.0.1790846486389;
        Thu, 01 Oct 2026 02:21:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr693562285a.0.1790846485939;
        Thu, 01 Oct 2026 02:21:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31dd9fbfsm117573566b.71.2026.10.01.02.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 02:21:25 -0700 (PDT)
Message-ID: <9fbbbb0c-372c-4e60-88c8-13c11a4c3599@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 11:21:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] MSM8917/MSM8937/MSM8953 fix prng
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Dang Huynh <danct12@riseup.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>,
        Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261001-prng-fix-v1-0-72f924527465@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-prng-fix-v1-0-72f924527465@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe2617 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=OBZ-G_CF7z2MtCSAfMkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNyBTYWx0ZWRfXw1EX/3pPlQWp
 uJJi6jW/rK+yP8tC++6aPJ32m8iiouw+P15S+UlkbK5Ik1opF/Glt/cGCkQ0B85OK+lHnSKcAnE
 K+/LzS4t9JzWoN6fqbFqg6lVZlsVngU=
X-Proofpoint-ORIG-GUID: a29eyLWkT4JKe2jurgqEI8WFgHqhilmg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNyBTYWx0ZWRfX9EOPTecVlNiy
 hLahr9EAgVKJmjjx3RykS/BRW87awrLMhcWRfsc5V1VpK/mOFyiJNAc7zg80anUznIYjUl9ktOi
 qtBN4WDK8Rk0t2ynmu769ouooLS2QAQHk92gmnSRx2SJ3x7H6+rFrGeixV1lgAbUvfPgLBeORyG
 BGG14hzcfrGqbKtKAH6wB7m8oFjJLIV2rrQfra7KylpbnIgWBQZX3IgQrAiYrhO/c5NDSfJJRoj
 a7oLQyAj+eiaexm0lxpnOOvnez49RuRy7T7OXOAYGcS228WeTzHLPQiZryQ5FG8IgT94Pd8mwdo
 B/H3MRhFFq046Do46N6qo6Mzof2+u0W5S6xkIme6W1AVW9kCc6ASJUFMUrkxTC3DFl67mER5Mcp
 yt2t4EzijPB6K74R4RF9ABaOAUsvolufk7vmIXxPRXoY90ix+YFBKYqrNSmDy83V29qUD1KVkMP
 Vbp7YG4bXmalxxqI2hg==
X-Proofpoint-GUID: a29eyLWkT4JKe2jurgqEI8WFgHqhilmg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010037

On 10/1/26 7:51 AM, Barnabás Czémán wrote:
> On MSM8917/MSM8937/MSM8953 HW QRNG is configured by TZ.
> qcom-rng driver will not have access to the configuration registers.
> Change the compatible to qcom,prng-ee for skip the initialization sequence.
> 
> Compatbile changes are fixing this issue:
> Call trace:
>  qcom_rng_init+0x6c/0xe8 [qcom_rng] (P)
>  crypto_create_tfm_node+0x154/0x198
>  crypto_alloc_tfm_node+0xa4/0x1b4
>  crypto_alloc_rng+0x34/0x48
>  rng_bind+0x60/0xa8 [algif_rng]
>  alg_bind+0x15c/0x1f4 [af_alg]
>  __arm64_sys_bind+0xb8/0x120
>  invoke_syscall+0x6c/0x11c
>  el0_svc_common+0x98/0xe8
>  do_el0_svc+0x2c/0x3c
>  el0_svc+0x40/0x9c
>  el0t_64_sync_handler+0x88/0x134
>  el0t_64_sync+0x1a0/0x1a4
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
