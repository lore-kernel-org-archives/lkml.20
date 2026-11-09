Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235677;
	b=X4SHn+aiW32XG3uTO0BqkjkEpampl8fNMSZCTe2wlAh10YXFCLw9Z50w+9n/dgNxMAAZ
	 Mz4y+GcVgJBsf0++q4h5lyAEWnwSsl2NPIYcbrc2YP5H9t0NrDJWVdqHRlY8pb6VskEQK
	 XZXjwo4DKezZhzDQI5qifXd3+ZAu1mM4OmtYCsRNaYgWIfaUg72UG0No7w7tXbER2hzBy
	 Dlmp+YSQcTWgXe5qKo01dxGnNDSNe3tnmPCKrAvtPhbxfejoVPV9MdiW4XF0r5UYZy8Vm
	 xhUbYt0VmMUeq0O5y+lwJFclVRLsyqPISbVyGmIy+nkjWBaLFC8y3BCpDn6O7PJoXeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235677;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8S+tQBGffx4GavU3iQOwkuWydZ1DqkTiSiHsOGPzy7s=;
	b=AG3H8Z3iK8edNH3B0x6psGKHFdYK8Jrt5BBVpRABdPxS+DSC2Jd+X+OlR8PAseccjORt
	 BL4bgRf4KJskH53+7SQwZ30HTHHaAIBil/nGYK/J5fuPKQdzI35u/GDdY20ZE25x4DjBJ
	 sYtAnNPAVlSKMLFIuLQYl0VviBi6dRMrycOcsLYgEa94ZYFOAVm9ShG4Gq5UZy76ONaix
	 cgJfd9EJfvEiJ9h0gOFGrbUikqTbO7Mf3fq0MLqEOTH+Frd/h68aBH7fdDKFlp56uED8t
	 L8yeh7HWeAjzVqB6wY98NyWGb4Cw8W/3Dge2pZeAJAcWDBrke9JnuxkesqZTBct7SzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V+4ERrG5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DdDGw81i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC00606D821
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CC00606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V+4ERrG5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DdDGw81i
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFDG64025853
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8S+tQBGffx4GavU3iQOwkuWydZ1DqkTiSiHsOGPzy7s=; b=V+4ERrG5i3T8g0Fd
	Is/6bobd+s8g0yAgT8c5rZRtQeeTMs+UNr/k0xVQZu5BNGkn07kkYc3GFwGBdtfz
	JLXYbROt5NleJlGxig3qsGMChILhk5Z4FCqqRbrIjzagCTEvdWQdFS/fFFk6WTFI
	uDzWWSpqUNF3Hw1uQD19qXqneF5LTVK/saAZEWmJvYq4kETLsY+77mpmi18JtOuv
	uvkrQ/fOKX9yLnC34jXUpzvfpbh7xR7hHNljYZc68x91gD5lrHhVpp0SNtUDceeX
	XjACTel0HmBAMWfM+WOOsyhq/wl+9SLTUdt/OC1t7YgQ7ofQTdZgLoEFYxi7cp5u
	fF9ibA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua589e2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:47:56 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so43318e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794235675; x=1794840475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8S+tQBGffx4GavU3iQOwkuWydZ1DqkTiSiHsOGPzy7s=;
        b=DdDGw81idsDaSVqJdnLFw7iYk0LASCh6eDnLvNFODhpqbsOgT5XiqfP7hKQ/kK2+WP
         liUV43mHTt/nHfUgG0cAD4E3vmKr2mKLbFWZikdmH0uEwmYZUeWUVC0bYuegc/HZxJZm
         o0ZPV+zOceM2/xNDPTld/Ir5qz2FyMiEzln4LC1R7IRLWElWAqtzyRsB66UG2r1x+S3l
         A4yt6ZAe0FuVfNfME3lW3sTIR04nKgTDNwwivCcw/q292HHf71kwV9BuVleExMUtK6IE
         1dCBKJE/zgAXnOWyYK7z1YeMTNmnEcTCgHL973r43sBcIV/i2CoFC2XAf+dtuXETFFi+
         ckzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235675; x=1794840475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8S+tQBGffx4GavU3iQOwkuWydZ1DqkTiSiHsOGPzy7s=;
        b=F47fGbE1aQykWmvnfGOZxMvhcr6eyDhmdxnuucCvcDXw5zuJASr2E0zFPZr9LfM2V3
         ZBQ7O4DajiAY3JfTem1HTKvBrIAq9nxFLelvyU/mgAuJV42Ivk/oTtgoVlC+OK7xPmdu
         YbgpEAW83Fq1xWBTxRegOzS09BGAhSua5mT6MoLTXWkiPmBr2VZrJ/8+b9F14aDZgGex
         IBvDUMPYyWMLAKF1RFEm9QdAIsU+kVS0yMvBmLy24AgZIcUKlwKHMa0nkudK9p7g6L3Z
         SfcQ65IxIbbQZxVRc5qaNkKg5RqtBcQ2eV9bxamCXCf4VQsOczKmGIGGiBWrjxB26QDR
         Avxg==
X-Forwarded-Encrypted: i=1; AL+hErGVNF8z6PLyaP+5h40tJGURU0dhNgPC7bWPeHXCiPJiS7yySoqEZehk1829jckKOCuG2onIwaCCELci/r4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mt5em++UmT1Oi3PuHLVs0Lam1HXulNYjFpXcd0v2oz4c49t4c
	aQUYVKEbxIxa6eofderVQL2NcZ6q8/muiU8CX1t/T7qFdLRreMU748Qva01YPJXbEhpDv4fYH7o
	ycJJXfSOUAFEyWGceDdTpeSH9PQu7V3KEl6GAaqPtMzzJCOmjcr16+pCpYejmgQlQliA=
X-Gm-Gg: AYBFou1BnZpQwyg0xkOPjrCJHC+q0EAyT160fLWK+MKX+lGcfu+8y0amoB9PEtCJ+f2
	tYpzrTsNnZCdxi7cvsJIePWKG4A2Cz5G9GSuPpRpmOtuzsPeAxc8EslYHrY6gu+RCSF6Sk8TD3L
	A5J+Li3k5jnlllyuPNjTpOeihXtTl2GIJX59VnJEw3YnGpxEmP8U0yVQJKHU+/E/PpHt77Y03VR
	+H8gq7irccm6viHvHVqmpSrYnBLfui7KV+My3wOrZWcd4RKy0skEWPF9Djs6ADTO256rVBFy5v6
	UNSyl/4FXKsyLlpvOUhukQpl2fuNv06DBvGmKZc9DC3kNfxri9zwVH15ETYSgUejcw4vBCZY3t7
	A50L26Nqh5Kyx5NW0Th3nrJe3VF3BrzZkmSqGQI8G55XR3HRU+sj7tbeiGEy7wH37hbBy2w==
X-Received: by 2002:a05:6122:62c6:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ece74072b6mr1736248e0c.5.1794235675576;
        Mon, 09 Nov 2026 06:47:55 -0800 (PST)
X-Received: by 2002:a05:6122:62c6:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ece74072b6mr1736221e0c.5.1794235675113;
        Mon, 09 Nov 2026 06:47:55 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f9384csm180195166b.13.2026.11.09.06.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:47:54 -0800 (PST)
Message-ID: <8015c245-5bdf-4088-bdce-7e81b3fa440e@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:47:52 +0100
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
Subject: Re: [PATCH 4/6] soc: qcom: geni-se: Define the QSPI firmware protocol
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OCBTYWx0ZWRfXybrXWFQU2xNP
 RR43wcZ7cFvvPa14KPs+sPFdOVrGMMHxu+vqMguWi4O3IRXsDsOWNMyS5Cpidd36Ppk+Ux4A55R
 fN4v9aoy33dLGJyFauOoBBgBKfklGDl7E9P/dNMJcRdlrVUfnHSIh0ijID4MlBw4EawwyVF2WdS
 VDBCETd9e1n0aSpx2qCqIW6xmw9ihUjc8PZFDJ6bBjy3zY0efwaruk27Z8UxOrv9vpdZ1Gu+uDg
 4+QBbtmIsLRSyKk8/8rdtev0C2gWqm4eeqR3qr83EH2WRwRFf2rOl055uIPzI2R+pEU4D1YQSzS
 DEyrY+DL1t/jp+tc2xH7KjeYBik/Fj9c8s9kU/1yhsNBWTVP/GpQ50hi4h1OXhEgxEuywJuY+gA
 YewFnmdTiV/fMethavgIzeA4JGHgW2xlixu6X3zlXPyKMUf2JfIZRXsoryl4ZhWrV6MdyarMULk
 qDNfibQ2bj/EjOQIYrw==
X-Proofpoint-ORIG-GUID: WQFca3fjwAnCX12jBQi_CNX_eD1vpmXe
X-Proofpoint-GUID: WQFca3fjwAnCX12jBQi_CNX_eD1vpmXe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OCBTYWx0ZWRfX3pPd3p0CiGOJ
 3FfJshzS/uzJQgNGKFXnLcVSiAQnrDtfXy43lOKXRGVknIktKAy9ZPUhHPNHCCmqMcsHpVDtODr
 bya2OgzDkmYBMOZqOfVyhEJifPPvkSE=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1dd1c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=AQxZ4Z-7SMcdX-UDKNcA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090058

On 11/6/26 4:01 PM, Jyothi Kumar Seerapu wrote:
> Add GENI_SE_QSPI with firmware protocol ID 9. The GENI SPI driver uses
> this value to request QSPI firmware and validate the protocol running
> on a serial engine.
> 
> Extend the firmware loader's protocol-name table to accept QSPI.
> Reject unused protocol IDs in the sparse table before looking up
> firmware.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom-geni-se.c  | 7 +++++--
>  include/linux/soc/qcom/geni-se.h | 1 +
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 873bfbd6b2b7..396f3d81d292 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -122,7 +122,10 @@ struct geni_se_desc {
>  static const char * const icc_path_names[] = {"qup-core", "qup-config",
>  						"qup-memory"};
>  
> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
> +static const char * const protocol_name[] = {
> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
> +	[GENI_SE_QSPI] = "QSPI",
> +};

Please use designated initializers for all values here

Konrad
