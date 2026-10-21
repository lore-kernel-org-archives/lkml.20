Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577457;
	b=ccBtsP3vQP5LegkNu1Ay9HkXWs4r2bCeeVyzyvMBBjThW01Yg6/h8i8pj3L5rtFwdY3f
	 YQ09HMk2hZai2Gy2jKqoID8JQ2bTzRNgo2P8Kkml6PxQywrCssAe4LukQ011GvwISlHaX
	 kAqSlwlbO3SfJ39ZfPJeSlqQf6DAf+7qEFz+nxMEvm66RcpPE2ZVxx351yhRKcwlOru/t
	 PWY8R4hr+2CcRLnAEG73JCIAjIsi/oCN4i3zT3W91SlAt5Pnz/czwye6ulhfrO1d+ZQBO
	 zWe3pNGXjUeun4sc8LTuBZ1MDdwT8VFZQQwJOI7Lfct9STb2eelYqEfSq/CP3Oyz6CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577457;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=673uTcdPoIY68ipEFGBPkiSaf6p7WUQ3Lpb43q4E+tM=;
	b=cZMZjDk+3NXSsEUZYHForG9NB1I2kdedfKf91o4kuSOtiHIh11TE2G05csltVUGcWzBj
	 IdAVmuSuoqL02pBWP4DJCK7JaJHPL7iLKLDZ8bqt/dM3lXtHi2+ytxBLHVTyNsPTOrisI
	 W+NGCHjZTUHKhKJPEp8soepeCaMplQOzPVSpITWRopLOWHk/pofPU22AE9gCrDGbl/xdq
	 a+nxYvj172DmjnSNdZ0igpVrhBipDApqVifU8ttz858q6PYNRn+M51uSSvl30ggyh+dBq
	 8P1nzSwLoXHiGfDHK5EkHZAyURKMeWF9LIqggw51ipcxNhNFNasIheIjIJX8eamUAXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7vVOmTG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwkBaQMq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D82606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23D82606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7vVOmTG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwkBaQMq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5tg73958129
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	673uTcdPoIY68ipEFGBPkiSaf6p7WUQ3Lpb43q4E+tM=; b=Z7vVOmTGITXiDNua
	muhpHhaJi5/fqve85RitVzb69T/cpqG0It+jDxPr+ceRGTxmgkETGGn1/fmZtLk9
	mHH/EBU46wHV6IC+88OgXVpVbTw0uAJ+mO2PqKV1Hlpc0vdrlrEWFqEdx9OhpqBE
	fV2EGRPMaW0sUmv2A84aC/6oMPVqz9d9OT6zIVdjOPOvlvjWag3Bh3HvxTvqNJe1
	c41ydk0xIh+FCHQtM8h3iJ3sr4qicmxk5/wzUSSWCyvAMEcwjFt7FJHIqzbCIRlq
	Ueh0ag9FEFQvWdAGXFTnT8r4KXkJ7b2lIQlYAA73wzolM3AFSIs6gsQknNnPq0vb
	TM//Uw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0kd7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:10:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso8477285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577455; x=1793182255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=673uTcdPoIY68ipEFGBPkiSaf6p7WUQ3Lpb43q4E+tM=;
        b=BwkBaQMqGRS9tmBbtD1hDdiT1+DajI1zsk1iix/Uqdw30dEGt1DPCZtiSwGkgS/i5O
         8Qc1RlBnH6cSlysqZdWX24fgHjirbqgnmQRQFSnqe+Zz2WITUqqFi0LTGbHXhdypjdmf
         p4nDXrN0+/ToZSKf7vg0fTUEgZbyzhm86clTumzFjy04zQwesS8wRYOdEFwl6G2ph4CJ
         p0d7BgikkMYeZVtK5msUgoQHbURIZTwLnWdb8nYVoAbfk02/Ru6IMjHybjz8MwULGPzi
         qCVSAe6cdC+wdtQOuPgR6XDyWOLzAS///kxWiWprKvsQs54mFCDl/gir3DB5Rjy/wHta
         okAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577455; x=1793182255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=673uTcdPoIY68ipEFGBPkiSaf6p7WUQ3Lpb43q4E+tM=;
        b=Y0FQoeNxtVpQyPsTBVSndKe2QS0zMvrKI/n1wbN5CVHcUOwXI7K7YM4GGj/rGy7Ju2
         a5v7tALdSk3Ub041cW58BNmVB4JKG6bep9yDJ4mu1pMT5fLMtLtHvmr7Q/PzzR3ncy7g
         x1B7Q93HQqMcRJDpmQGqXNG5CxC/I4+MFp1yFF9bFnLJ5smiZD2to7TYSbsaKYUSZdlT
         7Hpa8r1dkGi4dRGXAt4xQ1kmfUNLq/aUqD2NEz6H6FeqIZuYzhEZ+uQHppGh9k1Sj/MR
         H6ut4RigZKDzRfvEhE4RWoT8N/zVrakq/tbxxADSprQ5xChuKWOlazyIDSApdkGpaOMp
         e2zw==
X-Forwarded-Encrypted: i=1; AKwUvBzk/CnYbDsKFrCvv7u/re+0BxvtWFTZ0yxwAgqiabbPeGe/vbFsy42aKB6rOzmfPwuBkNsgFPF62eU9Ysw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPGr0vLrncsTibZ4yaX2biwRSEpg0I4E7R+5ga2OdLRBDqS538
	IVaVgnGBAKCjKvVa36Wdvg1peFrLxrx6xRQECUGsMAuEUi7RiCYa0kX5EDrXjOCJ41igv0yjsk8
	DoxBiwnBTsyfjGkZBQvsWtz0e4a0bvkpQZOdspWC3Rciv80+Ij88wlP6eUO9Bd1axUGw=
X-Gm-Gg: AYBFou1PhtXlciBuOK7kKgMc99Z0yxujm/miYGLzN860dOoxBJFxfVS1NPgSawDFP7H
	q2dxdLLvMwH9iNsRSSVFSeqjE8VLQ5wHnmAUSDcLULkD8PB4M3HL6+Q62NNwXIJ4on7gg9gOPqX
	xUee8ytlAiHsp8qW5ek3fIRpI21YG4ORb49xvxCbdMfqNO22AK8BcHgxjIFidnhj5jgSkkuErdO
	a6h0t3izXugi/ygan8cflPPuloiPZqKksO1NFMI4CV+Yh6Z0I/RIEt7SAScXICKgZi+ofsp9haE
	8PzxdabMZtvI1aAs6RRqXgHmqnuoYyQ5V23eGUCs6SWtp23x3jOWhTERZU9vvuZe5HXZEFtsRVw
	/xOS/G+CZPTuW0eiUx8xXYA==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr370001985a.2.1792577455338;
        Wed, 21 Oct 2026 03:10:55 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr369998585a.2.1792577454891;
        Wed, 21 Oct 2026 03:10:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46790366d8sm60349366b.87.2026.10.21.03.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:10:54 -0700 (PDT)
Message-ID: <45d542f9-1de2-4d1d-8a89-763f7c96b8aa@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:10:52 +0200
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
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_adsp: Fix 64-bit address
 truncation in translation
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
 <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-2-f19b4b947bba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-2-f19b4b947bba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX4Ta8yPnj7Tk5
 1Bh16gPe3ZRKY4NPqQ1Xs3oklk3r9at4ZVH3j/Gx8kil72o8OW7ENmP28WjiAqegjESLHd6ba9y
 JNxYAXyFWh2Lt81gqFhPY07HsP0BRfXVetcX4jAO3sF2byW6U7yAesPerUUfqX9UtU2gadUpyYX
 z1QLo5xfO2SxU1Vyr4fj4oFSSi8Lj/BKfA/2fZuL/ekpbaOEv1JJYR6l6Em3w5Et6lI3Em8x18z
 XxLBamzfOnJGdgInea8b2X/XHEVCDcppuA6pSgedQRvMgK81W+WS2zK13n4m5jWyM/pOnIlGAA3
 h/Y9GJAzFwsF0l99ShtqSuxIjH0dV/+hj98CfRMvSoSV9nb2ZNNDvImTZi1Jh7a0SUfTMXIa5ck
 znSE3ZK5Z+ZpHvM8KLhyGhaVG1sqc6HpXeJ6hLzqZScMc2U8pRU8a3rCFlK7zpzKHV5H8mwgSzm
 Gb9PK9CezIW1M4ACpxw==
X-Proofpoint-ORIG-GUID: 01v0n3RZM9D6jmO4WcyEbKS-7_1nTkdG
X-Proofpoint-GUID: 01v0n3RZM9D6jmO4WcyEbKS-7_1nTkdG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX2ueLiiKDqSQR
 M+0OTIiJZmAjLI9/qcE953raIxBayKLjrg44AzQmNFMjbbwWA1w1cIo7kFf5JiSnwiux+WANymD
 OeagLf0CZPsx9C0f9tSDIj8mx0VZ8kY=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad88fb0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1FkldgVRT0rVbtvJ3NUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210040

On 9/21/26 6:36 PM, Anup Vishwakarma wrote:
> In adsp_da_to_va(), the offset calculation results are stored in a
> signed 32-bit integer (offset). On 64-bit architectures, this can
> truncate the 64-bit address arithmetic result if the subtraction exceeds
> 2GB, causing erroneous bounds check failures or invalid pointer
> translations.
> 
> Fix this by using an unsigned size_t offset and explicit comparison-based
> bounds checking. Check that the address is above the base before
> subtracting, and use the form (len > mem_size - offset) instead of
> (offset + len > mem_size) to avoid unsigned overflow.
> 
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
