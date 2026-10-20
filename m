Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483798;
	b=PpL2lw20PXmJHMRYCDa5qIQrm068mg2JuiSUvKYMr4GJtc7hwzO9JO6MaFgabtTO/uPX
	 fJ+VSEsePbWwzYPRcHHtC2aNb0GI+3ue4rjxs23Ps8dN+F0FpgrW7YKAMmfZFS+zCb24o
	 MuXMcAD8+uGffGF1Q2mIVqorxMMRFD+CKMYh4WttFHRp0k+blvH3ySjNmzABi3R5us+V6
	 kwe2wTsHAEQCjFEOSM72DJNIERX4QL7N9gdAzrYRlSQNdpajPK+XEc5BufrSb1RLgVv62
	 Pyw7go9/XzJycIO2U9AzvdKCpoG78W2bTBbCGmppGqTxhdkChQSW452v/eb3Ss5EtdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483798;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WytZL8CPn2x2UqBbuwhWlaP5HNZx/Obwas4Uf3JOylY=;
	b=kEQCLBcSqpDVurYGMDvX4DBvbsMzf1ivdhbbBilEM0zKsjMWO4zs2T9WfdPuBlH49WGs
	 UjZiSjNcuervrglPYkp8mwPkn0OITiVM/3NU5jDkBJJWwwmBOcHjrzcPZCaW9zRePmLMq
	 B3PFcPmTPTUZ1dw3BmeEdJyAoQxE1G2HUEc/OWNv8PFqjtnJX/NgfcE6AIR4CWn4rA4U9
	 kJSWrvjeLAWO1Am27PcDbyYuOvxVqOHbnxAA/mOcHDgBjBZt7oCtGANux7fhrbg1CXaCA
	 q4mvVdaaDC1eSPsB0nNwMs3Q3uit4YTpvDkbYa4D75G1fZOXbDVj2VSC+7ycthvS68g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zqy8yAS0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DTjoNG8Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB1A606A328
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB1A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zqy8yAS0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DTjoNG8Z
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tPwv4178143
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WytZL8CPn2x2UqBbuwhWlaP5HNZx/Obwas4Uf3JOylY=; b=Zqy8yAS0HNfPZCxk
	5Fd34JhwwivmBU37ziGeF/JjsPsdKLEfmviRKkzXEEHInkcH0Vxy9MrmD8+AOdF9
	SkyYOO2+OvLs/YqTZjOFIg4y/iKnNTwNZp8xAsCZjj8+pPrfxhOTVWjwP2l5RkWQ
	h90v2uA5p7foKwKsihwSWWRRpDtOGoNJ7puC7vhmabpFKd2oa47viFsLBl515v/X
	kmrR+fr/9lKrURe8HuZt517CzTaxXTqcswB+0SOH+zSmdXBYfY5RpcZjrGlFg/Rx
	2f/ud8VEW4TLDJ4oXNMFM9ApnhSyobvYFScjBY5XBiHgy+fDPlceIJ6qLYHjMhsV
	obMtJg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1hd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:09:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-533962f6bc9so5924191cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483797; x=1793088597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WytZL8CPn2x2UqBbuwhWlaP5HNZx/Obwas4Uf3JOylY=;
        b=DTjoNG8ZnL3qBl6AhvJQ3gxJGXyctCEyGqhjLFvRc6VvUQmu4Pa1SCh8z6cBuEhlI8
         V2tIfvEoAebLd8AMaNYGZ4+UNoecZqIU60yhA/hd+8GwWT3veGlg/+vHBJ54XOJLFJOv
         6wiiXpuIj413pCJFnY4gPuh34IDmpNnVTdBWx6270EeosRWUoMH6aG2YRf+s9MiPzZZX
         ib1abPYi9abQgQOZfQxlFFcfwAcJJrKmcwZeFJ0HCDOCbOkc5w6xIHFbG5J+OjhQaXls
         7hh2zYPCcAI2uGdLmtfTzFdGvANh/YpOCdTfj2/EXTTo/gq73OepCKHEJ2lJWyO4AD8p
         UZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483797; x=1793088597;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WytZL8CPn2x2UqBbuwhWlaP5HNZx/Obwas4Uf3JOylY=;
        b=DZqopanyLunqb3YBap8vhKqx8HeqpVxjS+nXif5yvr/4E5PtVWRWVRfrweKzx8NJC+
         ji0yvnj1nRAB+5gX67uoaCqq7U77kyWX8qGXfJXOU4IQ2FqWXwEPjb/J9UO2yPYSMW2G
         Yi5dP05KqdnuYtxX6J+VxmfPYwuBr2AQ0SLhzzAM/o6N1RzmO12Q5rGDNB+igusUtMpm
         V/zSZfPBId99wq0obyzRl1yQbOLszulwPg2JrXO1CRM6SA4E1NAnBUhdkPY5+V1U9b5b
         X/leQVfdBoO70Vy67/P5qtSmTjKhRGNxVGN+alQr16d2w0DhOnAckdbmBgAH9m/v5l0P
         NEMg==
X-Forwarded-Encrypted: i=1; AKwUvBzcPOLO85YFU2yMSlS0wfTJm3z2XRpTnbfv5c8X0uSLUATha8uzIxz1PC8E8MZeikuHW+USpGfNXrOxfTI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPHyXdJK3pKU1isg+gW2Zrux8Y1AEKPnMV273WHms1R2JiAd1r
	klIyR/lKT3DaGqeMQFbjZPp1uFGaZSeh4mjRgj2kFg7lI6Tq+g/n+IYabG7mzlH0zt+ZortjOnj
	QtizpNzM/CO6czGISbloiWLt/ViYpRpTwYtWkQEL6iDEkPPGMOQcIHVhMLvCxxYaUiEo=
X-Gm-Gg: AYBFou2kXROYrOkhho+fbjnvl9eCtJkSY45hka6XtcDb3HJ7EL780LknR4adM2167+j
	acJCogCKcj4uWF4YT/cPqwjh1FZU+bSO3bCx75lCfK4nWsqSCEEZ2brvMirWCuUBMkfp1cfjUFU
	7eBssE/XGVSCu99dicd6wp78rrLpSGK0awV9+UiQ34E50HKSAfQBTZ1RTcRVi3UUDx45LeGa5j7
	qvLcsvbV3YlLbdtHmKA+v/f5Kp4QpST7ZFtXuJpIhgpSMF0slLaQRJtG0nYiPxmxaii70iijJJv
	WunTtfDv3QEfmjoDkSd1ptBkcm+nAJPyni/cUlsnq4pk8OHwkrezsP0JCTRiA9uSTO9pRupeHGI
	tMhHwse0X62oXByZO0RR5tw==
X-Received: by 2002:ac8:5a89:0:b0:536:34ac:1a1b with SMTP id d75a77b69052e-53645d3c8f7mr186999761cf.2.1792483796683;
        Tue, 20 Oct 2026 01:09:56 -0700 (PDT)
X-Received: by 2002:ac8:5a89:0:b0:536:34ac:1a1b with SMTP id d75a77b69052e-53645d3c8f7mr186999031cf.2.1792483795094;
        Tue, 20 Oct 2026 01:09:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0f2asm461081766b.62.2026.10.20.01.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:09:54 -0700 (PDT)
Message-ID: <0504f1db-991e-412f-9f7f-2840beca2ea6@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:09:52 +0200
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
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8937-xiaomi-land: group status
 leds
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-xiaomi-aw2013-v1-0-a0c3084076de@mainlining.org>
 <20260921-xiaomi-aw2013-v1-3-a0c3084076de@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-xiaomi-aw2013-v1-3-a0c3084076de@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DfzQEg2vJAmS-fhKF7OaIZd5JA99guF9
X-Proofpoint-ORIG-GUID: DfzQEg2vJAmS-fhKF7OaIZd5JA99guF9
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad721d5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=OuZLqq7tAAAA:8 a=enxl3d4HI8DR7CG5SUMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=YF3nxe-81eYA:10 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX+Xv00EKJbZXt
 xCns8VEYaI6LnazHalDISH/FRNgViq5kzUu2rHgWv//hGfpp7km4VGXyd0IwBQRwc1lj933Z/w7
 ho2wks8Hk/3C8fNM1sEtuaQLhdZXTD6ca1sr3l7EIjgQwrgfnZOFm/RAG0wuHMUWOCrdvpzqqdw
 UXX24QegUFGeNiNkJArmWWl48BtBdbhASQo1nZe0yuWFRlMThjlEGHd3bS1/kV/l4IHQ2XYXys5
 ag09TxriCxeO79g8Rf9WDDR0AiVPRlY020KElpyxhq+aEuQHg/1NLub6KlLstFLcJhHlCnkaNtb
 2NGv2cclLVQo8zyqvlXTYFAQYBBm+9PY0/t32AddeURgdw+Ti14HH/gV6bUuTSzh87rTr/yuAUW
 vMGmMcR8YcVcfUZHZXqoqHWpGvHdyerLsRlG7uYhH4G1m2TIPKULjL5X1DmZTk+pd+nbJMMiZCz
 3fUq11laD9v60Co7I3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfXyoJb72JiZ8Up
 id3LssnNoTBSToFuaTnPN2GsUb637mB3w+ZW5H8G/GeC3hVSZ7YtKtOoxSwU92ZNwVp35DsrVsp
 auhtuhWyznbxLHErWFdBhbz/4vwF1ss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200032

On 9/21/26 7:43 PM, Barnabás Czémán wrote:
> Use leds-group-multicolor for handling the RGB notification leds
> together.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

You can update the driver and bindings to make the LED controller
itself accept a multi-led child

Konrad
