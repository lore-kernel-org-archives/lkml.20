Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028513;
	b=w3G/78RU1Tbt/p4JJPAlCdvFxRDT1e1MhsKuZKrDabzg1CyISUVw7U10e2dP4ZyyLbTs
	 M6/hdppR19KChDboFkQi8S3ZEHcImTIzURSjrUokcgGbSdxrsdKGvYL4Q13Bp4R3CncBt
	 kUltLmFghOKFTKbm6T4DNxODw/NfGahS4q+3DLKvlhHIDc/2rsH6hItbKvA1p50fh4f+S
	 0M1V0PVLlyr39zbdzVTpBocjyTceSYVxMrcpROgBk7T4fMU6Vw5/75fsbk36I9cwhub0n
	 pZJ2BbLyf1NY1GWs0O9yYrMZpKjEGEWY5RMLKHiA6fZhpUzopmosk0Of0cWpPVxzAiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028513;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hXcHUx7gta3QYy8zKukEnpiFjOMOzlxILH6yhsvVS3k=;
	b=QxrYLedM5sMl6X8tFlkMYA3odiy0P/uCdIclqoHG99VfIGXGVWJUSP19rOypM9cBZbgi
	 HTuHQliJxMmFo1c5eG+36glI8CJFvObLW0qy5/IEhuzf/YVlUZUYRu+6GnTZ6t6quPyNV
	 8FwRsTv+yXrXqc3HT4SlUpuO6eEYcRCbQN38vdHyD1bfmRU+xneCm2qp+BQ/ZK9wY1Ler
	 aPdV9ZODzEKxlPvaDdON86YU5UqHEFxRJpU4NpdXhAyh8x/S06dAFB8eIB/Ms005h7saX
	 F8I+qhZGyjNgGAXxNfEYwSct41VvkdLgY03rwg4x2hzoIKryRAbGc82f1xcQj6UqNEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MnoYhO3H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fk21S328;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFBB606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DFBB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MnoYhO3H;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fk21S328
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEwBe23074924
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXcHUx7gta3QYy8zKukEnpiFjOMOzlxILH6yhsvVS3k=; b=MnoYhO3Hq9ye7d3n
	I70bVPkJMUXaLd4BchJS6wdZIeo5uumbSB7Ayb2MbMTuWjBKETyLP0iTxmEuvQs3
	FUe9MEZHyQT6ySivib1zo5jcl/hpYCLLs5JpY2KLPXp3zsE7Zo2M1Tw/z/6ygo+b
	RjuRgGr9HhstP9vEPnuVuXn4xG6FEZAsc6ALW/Bh2hQkDSRQDc0JfN/Fxbm/Tf7e
	LXVAw9sjVBDhAjcy+gDYi84cpec+dvIe3fljak7hGhoyghbdMIEj1DAtaQxDbbVL
	+tN5EnQNrdk86SG8RCYEU+14qxO2mUo/w6XmoBAGYPDbhjGRz9B2Oq0oFwydo2hg
	d7+Bfw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdb3uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:28:32 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988b7a28291so48368241.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793028511; x=1793633311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXcHUx7gta3QYy8zKukEnpiFjOMOzlxILH6yhsvVS3k=;
        b=fk21S328HViUZqIffDGbZjQ54kRTT/OM/R4uX9wXY6oTeE9si3orwptS2C7Qhq90gG
         SU1y/IREdSnmJnmccxb9WZzrOOz6iTmgIbXSF+NnFbTEcX/vwpgQLSnyBzHeEQjw85PV
         LDrwUPvoN37dNbo8BctMcFb5NTlrbzbxG9eIF6rfNHKVr+9YFwJr0Uh0Acuj32vBgZ6/
         sA2ODRFc/a7+EbLiGxNTYAoatKcqoLKSP3KkrTo8luqDaQM0gpq/G3LY5xu/dYnGLKcd
         6hdyzb0GC5q9dFjKm3J2ozBnpr80E4R0lcxjU+HBRPjuvJo2YkyPYPe7RGLel9HZDfZ8
         Sbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028511; x=1793633311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXcHUx7gta3QYy8zKukEnpiFjOMOzlxILH6yhsvVS3k=;
        b=DBZsqFiHz7eZ5C5qxOic0qZ234LpYrb0f/LNS4sIZc2UC3pi0aGbec9yQKcnmU0EKh
         UBIRqRDRE6xBLwqrURsHvMaF/Fw4pprgRA3mLQ1Pl723XiCHZQeskX8P1IueAxrJD8PE
         N+BinpPFQ5ZU1qR/97LHcjqYnvaQlmMJWE/NU7q+gQVqypONItViJr84KwQSD3Wuoh9h
         VXzZwMiKExrU9tOcazKlfyEgns6sBY4ndxtF40kAt7mpwWujPVoccV2dkbcjzP20Rfhz
         TbJ5xKkcEtMRZfVfWMBTiCF8uAhruF2s4//6UxMHGBcjj/RQQR6IAaVeGW5GOMG8MRR3
         xuiA==
X-Forwarded-Encrypted: i=1; AKwUvBxcX75H+4uK1LaTUfDNVclPBhhEyHsjq7LlQqTDLn+qhDk/jwTFeXfWmwqGpGpJwDc4bhiSM6EG03IS5iU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnPq1oxvta4/U2VMgxWnKq78cACkVTRqe+9xgjOkS3VU3J4R8A
	OeLlsqms/KMC+5caFIB3HneLC8Fw6DZj7TelUzoMHez4A8zfnNDTH1cHxC+Qt1bd4m7JphZ54sL
	ep57R23S/FIkMYIfEimf3F6OgKNKMDN6Id+VaBiJTyl/rEWUPDJ8EwpABOky9d4qViww=
X-Gm-Gg: AYBFou0RHgoC3BqGkZ5AKngGdFKZK5iNqHyYB6vDzVFvHhF8AGIxg9wYY77ktSfenho
	vj3Geh++v6b2teMPijDisvUEJxprm1p9l7XISFMJbgnAiYlygYshCZndHs+wIj3cSg1/CsjHr3y
	F2X8P+IK7ROSsy8NZiGFjTsco1mJvFtqob/RAOUMWU8Fk6lpOzHIfEd7njvIPZiZM+/01JvnyrQ
	uQ5yv0ATYD38T0og2/U0dDUYeVT4/ef3O4oODOT91zTHsPL8YCEfAl1POSHi9p5uKmGnUaePioG
	pnjU5bjIzNR+01SvbaIEj6jjTyK7T4NbAb1z+SfvBpIvNPhWDYUyFVztvRT/6wiKT8FP8Lherjh
	OcKptFhugafglqj1GHfJVbA==
X-Received: by 2002:a05:6123:593:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ec2332bf58mr2107157e0c.5.1793028511413;
        Mon, 26 Oct 2026 08:28:31 -0700 (PDT)
X-Received: by 2002:a05:6123:593:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ec2332bf58mr2107120e0c.5.1793028510938;
        Mon, 26 Oct 2026 08:28:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e9968sm334450866b.17.2026.10.26.08.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:28:29 -0700 (PDT)
Message-ID: <652f45a3-8af3-4460-a081-30f67bee400a@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:28:27 +0100
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
Subject: Re: [PATCH v2] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: enlarge
 reserved_mem1
To: Roman Linev <admin@mswin.me>, andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        barnabas.czeman@mainlining.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821032541.1856299-1-admin@mswin.me>
 <20260824155535.335494-1-admin@mswin.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824155535.335494-1-admin@mswin.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YtHTspmSOBE5alBwusRASGDKGaFif58m
X-Proofpoint-GUID: YtHTspmSOBE5alBwusRASGDKGaFif58m
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf71a0 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=p94XzNcQMd10UbPFJ04A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX5yIfbpgRHEnh
 7Jt8e+5gWn0Wd/s2mN5IvAm51m+tgKzNEaxr+Fm6WVUfBYfkceBvCmLsHNOMJB+IQAF04keDCxX
 xRcTAyiO194PUc7Gf77GfsQMw95RvtQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfXzIRW2S+i+tn2
 5QkyIQVkbPjKqi2Oqk35Yimax/iEHqS5i2SD0ZtbrI/ZDmva2bOQZxKvtuo3raKr4ECDXu4TNsK
 pKm3QubhJ0EtBzXD+ueLkh5rWS+NTPjpz2Rt/LzNwKs8njO1YktqfZswVoi3dfdXP082fBQ730M
 ZzcmEyV1aTsHWa2IZRKQj53kdKUv55nqgJShuoZ0XbhFqmSXCjO+xUT4pN2kImxWuJbTgO670NQ
 PT36V3VmXp/DT5gw9nygpqBzWZyJj14fW08Haf03qKywlWX0AsunfzgiIL5yZiYbcCt/zircylP
 L4omN+yNO35ewEUkgiERIRI/gC9BxlCeIIdi440ZMxvnkePMx7Oo/vMYQogAQVR+j1vLa6HO22d
 j5k5LakhmjNnlg0+iTfWrpqtmSmtIRamYOUn1GbXmtdw33xaLacevHH6pwQmVQVB0OCxWyLpQtU
 nVjvq9//A5ay1ylTguQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260061

On 8/24/26 5:55 PM, Roman Linev wrote:
> sm6125.dtsi sizes reserved_mem1@46200000 at 0x2d00000 (45 MiB), so it
> ends at 0x48f00000. On laurel-sprout the firmware owns more than that:
> the downstream device tree describes the same base as

[...]

> +/*
> + * The firmware carveout at this base is larger on this device than the
> + * SoC dtsi assumes: downstream laurel_sprout describes it as
> + * removed_region@46200000 with a size of 0x4900000, ending exactly where
> + * camera_mem begins. The 28 MiB past the dtsi's 0x2d00000 is not the
> + * kernel's to allocate, and handing it to the buddy allocator wedges the
> + * machine under memory pressure.
> + */
> +&reserved_mem1 {
> +	reg = <0x0 0x46200000 0x0 0x4900000>;
> +};

Please update the common DTSI, it matches the reference fw map
and I'm very surprised the sony phone didn't crash without
that reservation

Konrad
