Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016972;
	b=XHh9lwiXMm7OVw0bq9nlIgt6lHl857E52G+Ni4OplRTuU+nwbrTBe1l+In7GUm5Hcyvj
	 N/bSMaWIMuixbqLu2B0wmXjCkr6YfCgKSrUmYAg9rbQf2ckFl4R52lkOYvHNsQVFWBMCo
	 nA5V5rtNFCucZkpuLrfwSuDwRJrgPuz+JfDikhZspqjO4kl0iyqiNd9nCCizqkf/uYYm7
	 o+mwtgjQyOiKMzN9Eo7bbUigh/vcZ6vO33AQYXLbDqSaLoQWB+3LATDcjlRMNdRd506dL
	 THceqJeBcCfudTnPIFRPSoZDjasiNxzjJFXTnJrRpism/oMAofgZhyquCR4lCzrdHiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+LTz0oBJTc4CpLrS+/ZEJ4++07RrvK247eLZ+9FQt4w=;
	b=bps5GXAxOXgCocWV2XPhbox6E4QjC1jV6HW141EVOSU1VQhbWrPlloRCo0iDChTUq2yD
	 nA54/GZpKHmk5PvIt0Gqrne5MELCG1gAWh4osLga2Kf8shaZ2d8bA1EKD3mVEHUOXpXVm
	 rVE+oosb5tIzOUzVTyO835Iq/AgKUM0TEHA4nHUpH9hSYPRXkPH9npg5/TOT6PtOXApNa
	 WHHz0QlbPBq7ZYqZ+7wt1LehAddJNAyZcgWKn/wwlcT1tk3I9JfHQ13O91J8BTBeGx4m4
	 pFNTVMPjDTFxOdbDCQb5uba2liO9t5sp+Y8f4lmoRIDWvJlASf5MYlxs92yN/OcYSMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTLyfggU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RsntLCkc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3CD606A327
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC3CD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTLyfggU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RsntLCkc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtQA22009977
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LTz0oBJTc4CpLrS+/ZEJ4++07RrvK247eLZ+9FQt4w=; b=PTLyfggUoRL1+sjm
	/dcaXJcma7GaQiR9rDSTMAhb8C1uuduWHQ1g8oGnqheBndD0kclEKiPfTbucUCkI
	n6AqYRcXkAii+mT+Qr6pWfKFrkr8BF3iYjk7m/x7PCUAi3WKTgCQjlUwlpsdAxEt
	Bz/p6N029oxMmZV0QJ520ik9Jf3jdrhdUzQ+ItOwnVapESdlHRXSxb+SguRw6q6v
	AV3RoSnqS4pJrRPfJNI4O/hyC+uF+Zw4T7HZ2rWmsbupTHl1dcnXXNzEvMFdJUqD
	HLcguNwsRNBdjYMmeraNyIUUOsrrpPjeVoxvQywEM1IyKqKlM4lOdxfnJ4wTGTi5
	Ksrw7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27xa9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:16:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93df7a9466bso30067185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793016970; x=1793621770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LTz0oBJTc4CpLrS+/ZEJ4++07RrvK247eLZ+9FQt4w=;
        b=RsntLCkc5kvFQzOtihmgS2ACBqVKvrwCd0+IOCtikVBlXQ4pk6K/09+3B97wFi9VqW
         3LoaiGLmKVx1NNEXXPSQFwO3qqhmHBRYqB4x2hIZYWCGjUN9DNLvZm0oTF1gHUSAI1pz
         CLciN8Oq647K+gomHN1vR5gU5N42OmygIjl459W1ZHJ3mqXQakW5yeVJnIr+ceOucHGj
         5DXl64eLrtGyVJHCDMZIokktGMG0ZTRXpFU24rzwGvsFCPmUa/NF+iyLssliDzxz3B20
         a1Mb8NWL8sDeZqYUfyaczIClAgX/LLgR8j02EFYfO8xFgQl9L0N+cj2l9h+sWhu+zYXg
         9baA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016970; x=1793621770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LTz0oBJTc4CpLrS+/ZEJ4++07RrvK247eLZ+9FQt4w=;
        b=xYUvDW5rTWuszywCyFGFGx+j84sRcl3ax1f3UV/fjkrNnSo4KqDl5cWIwYpawSk9HP
         3Rd4FYYOfpO28uQICcOJcp6rUqNTV9yFDfM9GzXl+4L7Xw2XvyTGfe9NJMqCBpOdtI12
         rC/RXhWg60H/XKrZ2D20jykE4B+7KT1lFEusF2mgZX6m0devmgroPC09ERg5gs3GDGsL
         /taoMdfOpxXFCAS2Cxl8qeAkcFqE8xofaANMlEblGY6d4o2bizWxFHseRMi7Bo0rZxbT
         O6O6O3K/c1+sPh7iVAE2Whp6/QQ2YExH7+3dpi3jlDGO1RYSJI9pJLxeCjoqzoYtIzJI
         QURA==
X-Forwarded-Encrypted: i=1; AKwUvBz0wWbApj+U7EgeUZjQetUhrSQGg99ENFB2WoK/pz6/6UwdgWWYDQ8htIL7kIp6dh0Ggs+ivjYwzzgWaSk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNCs0FDS9iu0lNZrGoLnjyMWPY260xTEP6UXExMphzqV3HRWfK
	czuWbYGesLO2Fjc0s4uVEwh1owoCije4qM+MMZy5tuAV2ztW8mucpLgzHR0OjSsCoZ4slzDo1O+
	9y1s+Hdl4cDxBzY4peA9L+W27jS1kszuBWbJ9wk2UVzIlyBGVYgQcapmYq5hNFoISMcs=
X-Gm-Gg: AYBFou1zA0zzDbWanrM0gqepYhn1V/mmA6z6A6i8adSbmTkbHqbn3jTZONQbvCfYwvK
	L7qaeZ7BoO4Qf4SwHh625rs1DVUS7K47uKZKxSNHlQ5wGKP4+pQB9U1H/NKOe9IjEc1oP02onQL
	Vd0e3HSixTX+PUVPyEtJkZuLPn6g7HkIgKsvd6uM+bDXX0i2+0hOugh7UhG6/YCgdhsibzt9XlB
	N27AmmkO+r38KR1klGQzS7sBYHNSyt6xCyEJk8FwRfqU3KNAmmylv849qkLIG2Rzm43FIB+g8wa
	J2T6GVWPe4BSuZKDpZNAmtFHtVVAAD8oTPd/o0jUNPL5ZLVxQ0LKLbrnHKCvxHHHZ43dHqq3NZC
	yW6He3cIl5SiXPu6fdpO1hg==
X-Received: by 2002:a05:620a:5797:b0:93f:740f:5a62 with SMTP id af79cd13be357-940ef995b07mr1112354885a.6.1793016970047;
        Mon, 26 Oct 2026 05:16:10 -0700 (PDT)
X-Received: by 2002:a05:620a:5797:b0:93f:740f:5a62 with SMTP id af79cd13be357-940ef995b07mr1112351385a.6.1793016969543;
        Mon, 26 Oct 2026 05:16:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9c0bbsm1587764e87.77.2026.10.26.05.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:16:07 -0700 (PDT)
Message-ID: <673273c0-efd3-4ee7-a008-7e70fdada1b9@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:16:03 +0100
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
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sdm630: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-6-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-6-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf448a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HmQ7WK16ZiDfZ1s1pZYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Pc33y1zLqVeSbeBWTbiVzcoThoFWuAVe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0OCBTYWx0ZWRfXz8rOwTqDq1f0
 t5uj96aAYVky+tVvZIxmO0yITp5kpDEO3eu/Ml8OsVsbYBiwcQZDdRQa27rGu/FzevLc6xgybse
 v+SmjcM7/UxpEQ9j+GkB6Q5t72v50PU=
X-Proofpoint-GUID: Pc33y1zLqVeSbeBWTbiVzcoThoFWuAVe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0OCBTYWx0ZWRfXxZyIzEonaW42
 X26aGjIwFlTgv5BEZSma373h01pSUhGif83RJOQRoUnoTosQmjcxHzdPjezfMGiyFUJHQA6WvBr
 TTL9T62mqLaeFQ/rmuM8dkQsyVrYCLNIPD7EBzqbV8Zhjv2oAZdJ242mkiQVyxw+AzKjLczjo3m
 zsp4/P6kcRI6lPwe5UfAU6ZTfpfcBTRuM2mdoJ6+8GsrYtiOcKwdzTfF8w+7eMfIx3bmcub87uX
 Xg4r6aktUC2zvqA0pM2aRpAeoHmN4F48wvH6U2MDt/G9WlU/GfKIPQHLQIujn7446r61OWEdH/0
 9UhZt1WWx/PqffjAqhjaHCN/Th9V7D5E3DtlYsbjjuagsXv+wYNBsKoUS92Ni++VvjMZb/FXkNf
 1wQQ2AD4dCrEkoMBwfylTCNJqZ76DJZ40B6Crlj6PgEVMD71vccsE+RTLUGuOUVfrReoSroiVOD
 M8wI0VB9OPwztNqhpZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260048

On 10/23/26 11:03 AM, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from sdm630 device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: e8e1fb5c703f ("arm64: dts: qcom: sdm630: set adsp compute-cbs' regs properly")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index a41ba0da380b..721885455639 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -2483,11 +2483,6 @@ compute-cb@8 {
>  						iommus = <&lpass_smmu 8>;
>  					};
>  
> -					compute-cb@9 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <9>;
> -						iommus = <&lpass_smmu 9>;
> -					};

I think 4/5 are secure on LPASS on 630.

Konrad
