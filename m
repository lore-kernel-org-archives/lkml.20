Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084401;
	b=TuhrT2OkLH77BG8uQTxBV9O8I7aT7pagknIXWBeGMY956VlwTPtUeab8YhtiXewJWJp1
	 tNIr4Wt6z6RECwKwIelKTyCPoTs3rVH8bJtCtgGwElvr0Hjd9qPf/0rfamqQYmHoCPNz+
	 7kxsV9gi9lOQC3V3KZLAiw9fXu39BsNMrk50oSwbZaVofWc6gS96JZKFeoAL/7172tu7D
	 1iw2Og9qr23M+sS+HfFIMShI2elqGVdoi4IYXC57BEl/I+L+GhByI4LekLL3+H3hpmU5i
	 6qsKQ+7zVAZ9cq8ay7AEbj/bReMsoEbpe8pDyL3HvbcZlyWemguF0lN6qKJtCE3yqtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084401;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WNC12pOFow6vg7cxuHOJtzrj2t/7mEYl6Zadij4kSCU=;
	b=EG7wywnA0hhp1IMAgbfaHs66NtEP6XTgAmRxMyQeiTfYsxno1Xf2hMCX1omQJme91zYm
	 xpEEaNYVGBjYUqLVExaarldVbrRDO3/NEKboXsyNjeUxkEnMXYsJcS2DFiiGQaSwTMKkU
	 fycDbnGtEKTa7x+bChoU5NAZULoY3NwxT7MvYyg/i6JArWj7Yqdes3R1XUttiG6BwZfdd
	 qPs2wxFoayP58ftPpytD7QLRwTMKW84A+gjB5X7eBOdrONZkKMA0JDvRnZ8Gu4qWGXuf/
	 mWSuoNs8fYsu+nn4EgJXEtgCUYkjor9gIrO6e0UBIY8aqvoBQofHL8XmPZoIeMtD4ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAVRLh4P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a4FzZZbs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3C5606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B3C5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAVRLh4P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a4FzZZbs
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Z8Hh1779851
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WNC12pOFow6vg7cxuHOJtzrj2t/7mEYl6Zadij4kSCU=; b=DAVRLh4PXOFgsY5n
	NOwS1p564NkTFUyqLClL/gsUJR9wNX5qnJvEAmMt/meuWDxin3W026bwuMSDlGhi
	DEYsNqPGlP4l+RtFRwlBt0s6Qa1zjvo6TOkLIZoI9chXqrOg0breRflgS8vHRRbX
	IhssrvHg+ZcjAVcWw6fMnB+zThniQpDauTyBiYFCqg+PHGVjZV2m/B8OXFtwaeP1
	i/dhAWkpoOaJ5YGykdTdAOWwY9onmx5ByNRJapV/HCIRBRKDonJkyHf7fasLii8s
	4I7CHxuXfMPvQak69CmPD57UZpxpu0ldWgHGkvX4pa7Ki/xAQaH+mjDxp85hGiMT
	9UtFXg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbt90b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:59:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adcb81f487so6128680a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793084389; x=1793689189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNC12pOFow6vg7cxuHOJtzrj2t/7mEYl6Zadij4kSCU=;
        b=a4FzZZbse2fbYo2HO+BOk2KVJIdehLeh5UPnmbx+/WyQxqXOJny0RNOup3jIQKEqGr
         YV6OULdNCVz76M0XAD8WJtNAodcfA8FhmY50nyt1IbJvwXEZX8I6ZvpMSa09JOJmME3I
         PvNCYTVBxfpUQRRmcR0UUiNyu8/lN8egY7Teoa3WbiiVRUPNGdtfOBjoLHiIv/G3B83B
         8w9vvZMABVFRE+P1vTOAr3kgoFQb3w0r275RPVXc0223NIhAMh807wo0N9Pgjf62mYXD
         5eummGTkmUuWaVLrCuj4nU2d8kUa6HAHBTpF7lOYg3PYzbBXhdebCnogRkFMAl7mvDiQ
         V9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084389; x=1793689189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WNC12pOFow6vg7cxuHOJtzrj2t/7mEYl6Zadij4kSCU=;
        b=UEZcs7Tgsz64cGF7whJjdeS+AqovyayiAI1hInLlkUWBRQJ1at0cwCeeYrOgcbRFzO
         87R9FTvQhOrp9yL2eCHO4lLPr+BzbBO0aR3c9jogwQ+MNT8rYUZ51P0hiT83dBVha19M
         nzM1sKZSuDEONB+CJFNYjhcqDkRDdxAQDFArc0RFCHPtzGE1XN2MWF32O9y0ClBOPN9d
         HMPgkJHjXmaDFxCI6WYOZQNTk2pLjC8ag5BOE87AU+4cxZhMlXeIIiAR5qGJ5GJChj9j
         FWVUD9Jb1QlzG3jLhUdABTJAuhamRy5bOsclcbhKQdcJY6jrPl30LrbZS5sz3kk8cNPz
         +71A==
X-Forwarded-Encrypted: i=1; AKwUvBzUnL6NBOO4b61R5UnAgL+FZBqxmds3l5pLRdwY15ucCcXUnh9TKSwFcyWfJOVhwuKfoaWiPS5J12m8eWM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUsULG40gKnmooHJqquKgrBI/0IphAIDRVLZGU8E9yr0ymmwv2
	ZIPazJydEV2/+poGEUSnBAbMiAJstD0bie/wt3ALqg0Q1EUyeIIDA2tBaH+Jrd+Jxrrx3w6GIOm
	W2XbHtC/YsigXIWVxUB6icec+gUwynASE6Jg9B4xJvdaGvb4NOKCSttu4OJxAoa3xgTc=
X-Gm-Gg: AYBFou0YkUKMeAc5kVocA5tQxhw7/75yO/2G5/R/S8QLUo1SNP54HMDWjOJCaFHHEI+
	iE0pSuLaWTzIZNrzgmsmLbP2pYZbzhNAu5S/FQ1RMF4RnfkxuQCin5iYcE58nT4dIsxWyUfb2l+
	ItJGiBoH84puoNi/PGXe1XrQANvLeQU3eMmYowPkjxtIvssiVSoKKd2iYrmBIwLJEhe2pQOcIyP
	aE/IwCNsVxl6O//ZgeZBgOYYTP2+Yvg+zgVbqImwN7nz5k+QIYbAC1wveFJjSQpfL4DMspxfJlb
	M79muJzzyrvAq7RdZhfq8IZ8fwOhQ3oSyaG7sCh3cy/tdoRRc8uomCwNKow6d9iy1bqJwGmG23R
	g5lOugNzlEqN+w8kbgw1pH/aIwu3joJlvsyM=
X-Received: by 2002:a17:90b:5286:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3adead5c836mr7647137a91.30.1793084389104;
        Mon, 26 Oct 2026 23:59:49 -0700 (PDT)
X-Received: by 2002:a17:90b:5286:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3adead5c836mr7647128a91.30.1793084388707;
        Mon, 26 Oct 2026 23:59:48 -0700 (PDT)
Received: from [10.218.35.238] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404730f1sm2350317a91.15.2026.10.26.23.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 23:59:48 -0700 (PDT)
Message-ID: <8ec30a0f-2c9d-4011-8e26-9ec51c68681d@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:29:43 +0530
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
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
 <20261019-lemans-draco-final-changes-bringup-v1-1-dcabe94f1074@oss.qualcomm.com>
 <20261020-accelerated-husky-of-whirlwind-ce022c@quoll>
Content-Language: en-US
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
In-Reply-To: <20261020-accelerated-husky-of-whirlwind-ce022c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyNyBTYWx0ZWRfX1uGySbq0aDSN
 29FD46XTH0urFnDuuMJrQ5R8tky5OmVo8o23XuXNkWht7Ynw9G9gOEqTnUQxFeuH1Kmp5/kKrUd
 mMmnwZxioAHdGWeVUlzErQUx9dCRkB0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyNyBTYWx0ZWRfX1jD5g94DcMcr
 yDvag3R0jOTE9KLXECFUTydxD9EZMnjJOBH1f1XTrdvHDd9de+RAu430UwLOQGUPS5pUWOL54wt
 rST9VB8OnZzG0LosxuZYyJi8E70ZhjC75E3g//ij5Y25UWmJrgYre1AW+hklE52RaH2X6GSbXk9
 ajOr4BeojvxU6Dy9cQdgk46r02M78l+V2ckNcfh4L1H0U6iZ59gAXyC7SpcyduV809V2F16Pree
 ZLVDOtZITxhFMR3YnNpCxuAsAq0JtM9L5AWrzY/kU7CQhzd8uUZ+kR9U5RX1au0eqgvXvG7dggi
 OEFAIJ5OtYLpyRPc5Oz3psqkf4P0qU0dlhvCIcfmAJ4PwtvlSprmdMehSkhLiL42CiT5TP+JRQk
 vvAqGBNd/Xl6yU62aQ3RgxHxoq+IEUmPT0uLoNs48LxTZ8uu6vX2p4c61EhDh3/4w7sQ1CBWk/l
 SCmVhgc9GaGwWf7yDtg==
X-Proofpoint-ORIG-GUID: ljSIyRklAHDeUre0szZVVQdltN0e51LG
X-Proofpoint-GUID: ljSIyRklAHDeUre0szZVVQdltN0e51LG
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae04be6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Y71-Jxx4QiA4W6V5z98A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270027

Hi Krzysztof Kozlowski,

On 10/20/2026 1:21 PM, Krzysztof Kozlowski wrote:
> On Mon, Oct 19, 2026 at 03:57:32PM +0530, Gopikishan Thawre wrote:
>> Add the qcom,lemans-draco-evk compatible string for the LeMans Draco EVK
>> board, which pairs the LeMans Draco EVK SoM with a common carrier board.
> 
> So here you explain any oddities, like why SoM has no dedicated
> compatible and why common carrier board means it is not common but
> SoM specific.
> 

Thanks for review and suggestions.
Agreed. The LeMans Draco SoM is the module itself, while the complete
SoM and Draco carrier board combination is the LeMans Draco EVK. I will 
update the commit message accordingly in v2.

Best Regards,
Gopikishan

