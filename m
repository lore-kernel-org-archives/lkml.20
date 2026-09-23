Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1DD4508E0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148896; cv=none; b=G3abpyUAB6PRgyFs05SCWNj86gK9RCAucmQw29CCLZEjZ7Pdv8gezJ2zKSrjP1ckQu9k4Ek9Wn0mYKzI+U8zk1oTx/POHCTR9kzNbAIr3tPYkB7WBkXGwxxaXcoKDnCdIm3jJO8x+oHyr1UIfolREQF4CIsykr5DnFywVOSBL+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148896; c=relaxed/simple;
	bh=DHPnTomGvBdfQzAyHeXJiSgXT5Y6MYJ7Gp5GPnjGoqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rpHCoJ1tMmvwJGhI+j1FzRcyILQMH6atkAZU68qaLRbP0TECIUfCeD1slio1PFBOGuE/RDLHgStqBihNlYYV7j+VDiauXnbeXYIoepDf9E+ZeKKyGDE93gTh65RQZmQpC52rJukKFSB1rlZfwR1/pRSEVoiIsvzKXpwKPtazxwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuGroLs4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sb07en59; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuGroLs4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sb07en59"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79bLN2432957
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N6TsNrtQp0RRb33NkVheFzMS2e0BGHevfdWgITB9L3o=; b=OuGroLs4fsknkszW
	lmc9L7UM5kw6JVtS8/Rj1ar7aaYyu9TbE7WVfUMDfQSrs1/ZOw1z3/o7V7JlLAKf
	Fx7ZMGM4UX5lMiq7Uif0W8qI/nlpTS08YRKaSK8XHpeTjUKUVUXcJ47HpUs23oTv
	GU3FBXqpzRKfQ9nEznuiOFrWEQN6Qi/b9ZkPgf9LLv9a7UAI2Zf0Q4hzPtjGa3op
	jXM8zAcIgwRxWNIXKpN3+foErkkYBHo7dxZ8X2rNg3KNplD1HsapFus3Z8B3ZgvQ
	9GWZdqu7ROicdhEKthe3BgqbNRCP7zrCA+30/lc3smadx0iDcGuNFn++V3vaxutX
	gOE2QA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv3319mj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:34:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530a0a18108so1652231cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790148893; x=1790753693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6TsNrtQp0RRb33NkVheFzMS2e0BGHevfdWgITB9L3o=;
        b=Sb07en59GDLuaqEQj21snzYQv5m3KSykkILJzG0Jbf2ThJLwF9tkEu3mbrnBaLPNlW
         MXJzlBs60LAzaLPmu+FDxv7NbBKCvUjnR8Djy8pMhXoz+Ac6++ptgb+HYMsFMsEA5lL/
         GbR09EF1O8fs+xNcbKvt/HAWxs7+tAKX5r8lJxBwGRuOURlg8hB2KVUQ7GjeVqGp89Zr
         39xs0twbykeUNpk6GpWAzf2MwzYJ22DoZMxDjNFJFvnggA+oaiIq8urbMtJDM0STViGY
         26QC3cRu8vX6H/c6U8kncTzgyeO7q8LiRYJcbiBOVI6ghEUI5oQUod8xkXxjFtZI61Uw
         CSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148893; x=1790753693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6TsNrtQp0RRb33NkVheFzMS2e0BGHevfdWgITB9L3o=;
        b=POmnVp1Yo1IYYG6tZW6i/jP9OWSr00iWQiu4Ev6KltQ5U9L0s9zJW9IxCxSiZMuMeR
         zP38EWgIhsiHKRkyQdI5R24yB9yX4a8IhYmRRzXHiOtv5sotJsCW0N+FnTFw9Ai08EAA
         Lx+1J9lwt/hpCBnfeDBOfqpXtfwMCJds8uo75dBcnShJ6rFN8Pk8N+PvO7XqwvnBHBgB
         D2ksIpk1lDBRnppBJUecB/yqDJrq+elHs+K71sEQS+pEFDHLphsw5yZfJ5Ny1ljYfmGn
         pHbq9WE+6ms6rDL+Glba0MMyCjbUjBpN8XtTGDSOz0n1Hv2ombp97r9/DeUhQWaGuUof
         u0VA==
X-Forwarded-Encrypted: i=1; AKwUvByV09YOF5bXvSbTo2rPGSknHf4+OjTsCUZhZNFX0HCLDv9HfhvPCFt0TwXrRtnhmeGPscPzrqaijBaUjxY=@vger.kernel.org
X-Gm-Message-State: AFuF++k0jvMS1ljUq/IgnElpvpFPgZ6KqwDGRTThkmq4U7pzkp9wCiYU
	PMwnNvof2CWQapQLWPzOF7aK3nPfUqMIdFqmlbgADM7bBbSLuwFN3Bv0PlyD+WzAEnsItJtb6wW
	kH1ELvdFJPvP5MkmWUDQm9ZnAj3dbcQfbiasODrHXmuMFjASXkayCrDWVAwNWcCRJLM4=
X-Gm-Gg: AYBFou0iJlPMHw54ZnoWxASGwl+rc29MIfd4hBfsW4TgGumifgqcZAnkhsiYo1VVkj1
	S0M/KAjYyYYfSLmIsNWxXCi7JeFg7WarA9bjfKI7qBaKzQTp6t74ip654XNXh/Z4Z73/GCcyGiW
	w+ROBc0bxWSwmYuY3RkxGUSSHfGzJKSbTE2vuHz+jEH7tBQWiNLQg8pCa0IeCNmw4rJRa9CLVsD
	klugl75MDZSCNzZxaK49tEGxHICZUAfgZvvm24karREm0HpsHlyZ2HvRUAHZDSX3+z3Wq9iX2lu
	WhI2aYWwNOegU3HmnTZ2Q7QPs7eYUys7Wmm7e3F+bwfEmHmPfm3QvwyzRlIC7l5f8LMURzBYuT+
	UPRhU5idQiugUXxt8inlqaeTITgaa7h5D
X-Received: by 2002:a05:620a:1a16:b0:93b:beb1:5790 with SMTP id af79cd13be357-93c2525e934mr301687685a.5.1790148892920;
        Wed, 23 Sep 2026 00:34:52 -0700 (PDT)
X-Received: by 2002:a05:620a:1a16:b0:93b:beb1:5790 with SMTP id af79cd13be357-93c2525e934mr301685385a.5.1790148892561;
        Wed, 23 Sep 2026 00:34:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c5c6csm60665966b.16.2026.09.23.00.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 00:34:51 -0700 (PDT)
Message-ID: <49c27654-e573-4026-815f-a49838389a07@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 09:34:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM8975
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
 <20260923-hawi-socinfo-v1-1-f0d1aaee9323@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-socinfo-v1-1-f0d1aaee9323@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vo9t-jJeX951ZYxVIDG0k6J-YuqEqYKX
X-Authority-Analysis: v=2.4 cv=HdaB3SE8 c=1 sm=1 tr=0 ts=6ab3811d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Ni0NwuYlWlgHZDj13WsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: vo9t-jJeX951ZYxVIDG0k6J-YuqEqYKX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMCBTYWx0ZWRfX4IFMK2K59r6P
 TbVDOM2jQCZJUlxtb5KhRRwMYrRC7BV8Fu7W3407UxGwear2ZRcSw/1UcPMWxH6Qat4JEMQZoD5
 vgOZe5eg4dPCv7V2E6S14HtKZi72bGj2OktiuTd0GDyansUpCYxi7RXpV4/qoV12myKsRieQrkn
 sEr+CPjzVIo0dFjwDBNjQ2O1N7xh4QNohKtq6dCdfSEsRmkKJkOMaiLcInW5frQvVlx6knxoJlS
 SepSs+2G/LC9nCN4YDfSZVgQufHmj6ZIbyHFPeCEwA5K8yfEk5uZRX/2qgAzvBMtZ5Kla4ZKHMh
 PGQMqc/XhuTo9/Xg8NefUFCNM6vTM9RPP6XkokQbI+OhgiVCN31vdOpUpUnv3kzAJkLh7FLxKmH
 GepKFRKTpWwkyX/+N9eLb/BaQ0Vf34s6gEsASTdW5r4QBDDVKR9VidobR8lngJk8tqpVTnlmPua
 a+X9uaXN6x4ZrdcCZVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMCBTYWx0ZWRfXyM3Gxi0HJ/RP
 cSjMfJ1koJebPeTyCvHJWvTVlsM8eNSNOQmUk01dIsVAjsVeJt1OS8gTTmOIoC6zUzv01lWn7+D
 Dr2h6ZSziDc0QUgQGzslVp83l8ytJrA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230030

On 9/22/26 11:07 PM, Mukesh Ojha wrote:
> Add the ID for the Qualcomm SM8975 SoC which represents the Hawi
> platform.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
