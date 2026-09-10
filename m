Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E56381E9B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030242; cv=none; b=ilvHq72QhpT+5dULKJNLFmyDYsKhDVTANtv0YqFX9LStUD5LfmrrE6wp3nxm18NLrtttvymGuTb+aeZ98/AV/JWIlSCowrqC9AQTnpCRfc7oULsMqdzmq/jCuwxDCFGQLOUnD5ox82Co+Fb3NnlNj6MimyS9DFxXXOCSIYvSZ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030242; c=relaxed/simple;
	bh=N88uKLZFsr/eQme2dS2SHYUBJuv+wPfdCIWa+hgH/Xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dIazwqFA1nDn1wff13y3cXXUayooFratLPZgtFoSbmDnJwW8LbFknSS9bsHhNxn2eerDBd3HUiLo15U0OtFmDagwuDAoYi/k4is+9YSeqy3jmKicTiPEoBOrUcuYy+uZGAAfcX5ZpvF1Hsxei6CHMH1S1DbKzME6Z+qU5vq+9ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHkHA4Xh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VGDM3Llb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHkHA4Xh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VGDM3Llb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GsT03520313
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5FApJZEs8acSqYIh6JPQNftQsWHjTMnAOU5BUKUB5I=; b=nHkHA4Xh6TCyikqS
	Tz7a01TXy7FlCuV8obnbAT0ztKpeEzBqyhBrWJEd2vjFMrYQGXlzZUBzFyJ46yes
	aP9Yw9oJ+47OXnbfaoj8ibYIeh/KNaLk4NT3Fl5Gm/y6TMKwrEu5vrycGC/o27xv
	7pGpu/g3wLU5o14qAkq4QO7vlK+WzMsO/9B1YK9txh85205ET3jKAUlOLffdM+tb
	AJ1xj6BW8ts/cxe9WIOp96vgGJtcgAOaJzJAzJDAiryQLWD3VqNL+ZwyI1sEasg2
	WiL5vB1kiQmxEoumdk4YEix1QKgGT2un9O0F1qJ40l3TV27k4+64OTJXQyuPt+5D
	L7cv5A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfk1ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:50:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9375d92d0caso84172785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789030239; x=1789635039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5FApJZEs8acSqYIh6JPQNftQsWHjTMnAOU5BUKUB5I=;
        b=VGDM3Llb1Tj6XOs80aYz9BkUjmJwWKd+7nnj/rBDHBrDCxZ4N9BxvpkidgDU0DmV2g
         CdwNjuuRjroaIEmmvgwCp83M9NUNHljSMe94G3q2OY4L0lcAwBKgDhylgd7MSMMDS1Bq
         pKtn8xupyzyZbLpBkt2hjushNvCnC04ZZt6JiyG3XJ+KYHs2nB5Z9y7X+zVfx/J1dZLD
         yhZ6fWU4ZaSF5/o/TG6ZMByX3N3ZVcFJPY5hC8YL94hopWgd83LBw5PkroBqRt2K3MhR
         3zlA8DbwmAwPfviYXSl6v/vkPdn0GbDpUmxHihtCzElVOM33wYUt+c4fHCxC7rKTT/YV
         QPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030239; x=1789635039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5FApJZEs8acSqYIh6JPQNftQsWHjTMnAOU5BUKUB5I=;
        b=VrCgQOth01dNrhMZ+sfCAYYMecbI042z6zSgSCx/GWECfO2WUfHVQzKlmUhHvxBRnt
         j+5zcRaTNXnfQNIlJw+IVcK9mmLkJXSBlhX134eQB6xqca4JJ4XmPhah2RHYRDKqV91c
         Xsbm08P3bkrsW4a4Yk05UfkeAYohdyj8DAc6VjuIPKGqBA+bGdDP0FBfLEbz+FwedDuB
         nmwIzIuAQdPWx0q+cAAnWN+hed+vTHeahs6JwRtZaVLDrkkXSbjlxYLS6u+z4eWZsCYq
         w1NQT6+XMGS0lkehRXiG0xqTHZaFnh3VRx7SQGiQx8iarnr/Gwk+UPfcip8o/AFs4s2N
         XOZA==
X-Forwarded-Encrypted: i=1; AKwUvByDoGD83A28gNQBHicyhOLyeD4bCLy7HIYALeboUwCL8jvctxSbxzXlcFURbP8ElX0wfwumucL2pZmowQ8=@vger.kernel.org
X-Gm-Message-State: AFuF++kmhBchDWBb+DOQCp8Jwqh6IkqiN6QTDHN2jJTn/mByVyS7Iawl
	VHspRr8NjdC73PzfaB7iFoi7A0dGkfmPk9crZUXGINWIJBNZZiy/iS7PVPUrZdSxs4Jsf7qrVSz
	gvQqr+GinCuVrASMesPJfiesSRDav/rqeRC0cSLoXIuHsFjDF7EnkTXfz6sKNBfb3SCh8EJ6uns
	E=
X-Gm-Gg: AYBFou3rzMam1K4KWOUywZ9OFUUKwOjPtCs28+WlOxJhixN2P/3Hkjd1B8ZQybic7h9
	HycF0vLSA4mbVFdt36NvwMP56hnrwR/QjgYodJkHqPYMWcu+0EZ89x834CX66WAEJvOGu7T2Oqw
	c6DF0y+N5sebelOUEF1cTaUcUObUP4jnWg8TAgHJmam7qk7sKA/VAVBsP/C1zzPcufYNxyQi4Rx
	hTPLweLG3BskvCJfAEA75Gisdo2/bfmJdp8LtT90j/S8XMAvaFZfnASEHcEi7S4pW3CfG6Abrk3
	rP4oPaUtlAqJhVDbqJZqU5ucIj9LY6xxbxhskGXEotCxpXynpAiAoHw/2Rcl/YbW1qcrYMJE6A6
	rZpmLITpKZYUpiZDpZxfWow==
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr2784904785a.2.1789030236063;
        Thu, 10 Sep 2026 01:50:36 -0700 (PDT)
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr2784901985a.2.1789030235452;
        Thu, 10 Sep 2026 01:50:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c3f00sm7933412a12.12.2026.09.10.01.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 01:50:34 -0700 (PDT)
Message-ID: <7667d87e-4b2a-49d8-baa6-65930bcf3bc7@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 10:50:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-sony-tama: enable modem, SLPI
 and IPA
To: Shujath Mohd <shujath@outlook.in>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
 <PUZPR01MB51413DEFDD09B4661D9AED22C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <PUZPR01MB51413DEFDD09B4661D9AED22C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5OCBTYWx0ZWRfX+WoQKhqBvoKv
 s+Ac0atyY+H6LkrOouCrbkk0KmfVPukOVhQ134dPUPLbCsgDypgO3dXTysK+5WRQzT7Lbf/LzcS
 KwT+b3ZNXoCjvso3q0/hWS246Gq12us=
X-Proofpoint-ORIG-GUID: Y5BJfmwMGnkTERgOYVQl7O_vhtX8K7MO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5OCBTYWx0ZWRfX55qhswE7Y6/Y
 XFj9OJCQFBRLEO60TA3hpyouM9WZ6h/JWrtsS5rwqH29RXsJ3DWJagKUkolXY0BqaZNymkuGh3B
 1/u3IZr8I8JqFxjNN0GAKjNVT9QKcMnnB0WQkMAd5/T/atLlBXoBnQ/dSvT8K7VTNItjSELv87p
 jatyZpAKOkhs3yhrTlWBWpbM7ovBQ0yZAGN9JQbwLfKLo5VZRdwJvlEdtlocz2dmbRo0BYGR+xu
 HNDUPkn8+7QrEx8IQfC0713uOe0DKOaVexbfzBicMbD0MTDtFyaM8z/MdwgWDpDR7cUFYlHpXAD
 jitRoBZMuBalT1ss3qta6Pu7fImw4g/Vha4W4wnN2PfbPrOH4jY1DhaUEANBRwHjGwIqsFDSThz
 N39LVVatAOi0naieeS1BgSfBIU1l6lH9g6GAj3K/pgSVUgf9aluTw6/mY4xZIWkhLI+ZtjpogRA
 NkG/Jr0Jrt7m/7u8qkw==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa26f60 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=vX_vO8opERNOMm73XEAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Y5BJfmwMGnkTERgOYVQl7O_vhtX8K7MO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100098

On 9/10/26 6:05 AM, Shujath Mohd wrote:
> Enable the modem, SLPI and IPA subsystems on Sony Xperia TAMA
> devices and provide the corresponding firmware paths.
> 
> The modem requires ta-service for initialization:
> https://github.com/andersson/ta-service
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>
> ---

for future submissions, please send new revisions in separate
threads as opposed to in reply to the previous one

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
