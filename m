Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579367;
	b=XjT3cY0O4wUv6OSb6+1Y8r0TwQIN22tIKgDPz9viAG9pwbE6psRcU7volT7Y5kAa63FO
	 oWPUHDG6WX0SkIMLWE+6bpnvuCr1/SBeiBYLifGJyAetTf8bmqZVi0zf/8ey7c2pPPkw5
	 Z/W22G00RwVae1vm0PU/Whe61skWz+6jF3Uec+sl00+XjFXdvQQ0V2hOti6PQP8UG9VO6
	 l/7OMf1/cXvVfgkeVz2gtVYr15NX8dWxG6laXklAG2PFKnwPolomFrN87CHl/YM623hGH
	 yJubZn11cM65raTLclMHUWunfr2oVBsgagPg/TRv0qja6CD2Itp9Q27SSNasIpafAPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579367;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cDr4z92Vg2vGjbMP4QfEv5oW9ZFER0bgpZkmEeJldKQ=;
	b=tizPQXqGiM6NWxUmw7C3GZh5u+G5pAtIhz++p7vFXzrlPlyoyWPfZYntJioUkiDf5c0m
	 8GVaUUNd4cDWRlIBTMBa4hQnHqgoBGvme4CROUOgR/uEW+PTS9iSwXmd+5hILyuojjcLc
	 yVpHHcLf3n1ZwEcwU3MOjG0IrllsVklJrnsI4ZMikiYYE17pULpiCUQS4MbumRiQl3vzg
	 sIPEOkKgk5WaXByo2fZJcERLhcxGlI9rSPhkgQX+1pJjMiUjt49FQRYDu29AIDiYdU+jl
	 wu3vIQTeE+z1k09do0ah7FmMQld7FjzhZQRH8OGVMoYFSWovJFfYdsJ2z7E+NGcA/8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZBI3eGB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mg2fqjNu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA54A606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA54A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZBI3eGB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mg2fqjNu
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6Ruq769853
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDr4z92Vg2vGjbMP4QfEv5oW9ZFER0bgpZkmEeJldKQ=; b=MZBI3eGBJ/uhGQ41
	SaQnds05VkpHjBzXDoJgOgh/0+HHDJYGFE8yIw1x98wpssQk8b9P4m6t3b4JhckQ
	iOAD8Nnzyp8/y8oGiv8VlgeENkedwh1Ko85bB1rPboQczRTDW632HRMXlUcBst0A
	LVveZZANXMyKPPC31TjtTwJZ6yRiJ9kNoaDOGQWat5tHtqbnK3i4Xeta7okO8jNN
	jjAQqo4cA4CgIXIUwy5M53tHUJMLCeRi+3fAchfqzF5+6/6srUeaFwkMyq6JLX8Z
	wU0snWaxXoqddtFnPX9pM/ofCvEHSM3zHY9DO44iMIMsrUxs270lvip2NKII9tkU
	uvAtHA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02r6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:42:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106bb33cdfso1712896d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579365; x=1793184165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cDr4z92Vg2vGjbMP4QfEv5oW9ZFER0bgpZkmEeJldKQ=;
        b=Mg2fqjNu1BmiDurDg4s9bQXCEHeyVq+tlqQrZkHT2OqtqN1ywxTViNNlIzPbU+xS8J
         B/A8enbsgENsbWFDK7Y9G2WC0LkPTChPcgKrmKo8j2utnbyRXsbnCiLpzyAhGjDi2vcJ
         B+VFRuLi37zR5CWW+amgyteZNhgI+AdaLrKpwqLw4ztwv/G7UGqR61ku+4OELXL2xCRN
         7oD/osMno+4dPk3FEw4p7Nw5JRSEFK8IZz8Na31eyJESyP3udssWD+VunFJ9396IGpKn
         qvEiSnu9qcAlbi5bbMI/2Ig0Zi2y7VCb8RZ7BbecJ5mUWoat1u4eNl9OVka2cyPPnyNz
         DmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579365; x=1793184165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cDr4z92Vg2vGjbMP4QfEv5oW9ZFER0bgpZkmEeJldKQ=;
        b=UxvLOqlb8XTSlhQjDL9Op0rXS2Bh69az7rfvJb2YQxaai9yK12ZgO90ZO91jKv10bb
         ePVvRBetTNKo1w2a6euBuqSHSR8nKouGSF3wLN8YsBAiSGhwAqNoYjkoyhQf6OshX9Gm
         xWXBJfD0kLL4BnmWpUkzyVMN1yQiJseGn7Bb909jw4McswDPjzVJ8V+jkKr3/OOmysjm
         BFxpXyJVhCE0BWxASjmSnSixbgCvGqUYUXoNUfk7Fz1KXfhPNL4B0CbtbEeCC/XiPc4t
         1zx0MmUAqI+CyLkOg1vS+MLe8L3n1zBrgPTsSnzjjA5OOJ/4/sAfYmUSZ7fQooefrtWT
         XYYw==
X-Forwarded-Encrypted: i=1; AKwUvBxGtzV7fIZXaYSav2sCj95SCSrg4KAEMzn18tu5R/WP0DqPGL8kwpJ+bAOtsQxEsLQfSYcx5CjnuIW72dY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEO22mD01NQhO3ATQYiqGcyFe9gPvSBpBAX4r2CbCKbMV31IPu
	MK+4neAjUXnWNYQsWzus3DsaV/Iy7a2LVmp/QjMpE/aBr9+Dc/58sIjJMPri+9UUFpwWQ/tlLkE
	LqDMfPuDyOHiurGaXzuuauZ4JNRKbnBoFJO4FIz/pJ+fWFuFMmVT/kPi8N7lRPQJd4Ag=
X-Gm-Gg: AYBFou1FgYAPdk5hNVK+q6VAGupiKtR21C0Xsnn3ueKQ4i929VjLPqLANS07Ltz0gc2
	VEBGENT6bWw8H8UkwAeTbxIfKUyDH1iZsnILLzxXWQJA7rKywf7Bi/PMy5BTN1+2unjZu3vFNP8
	MHBjL0RR6msR3qh8BNh/y5AnzL1XoVlMOHG1KqSQT2c6wgZLAh5FA+OqyuEiBH2lyNnWw5e85pO
	ulDsg96V2BcNnjZHZDNMmkSCEOPln0biEaxpQhxalZO7b3gqhwLjfGnrlpO3qvxnsBsfYTFZQey
	wfVsdH81J0Z5sBsZPMxH9PgIDgZa23jfd4BFFdf8Uu2uU7AO9ILYsxlderiLDOLnI8yhdUqjouV
	v7eMHFqqLTLiQCV6dNTA7aA==
X-Received: by 2002:a05:622a:1aa5:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5369b5536dfmr27587751cf.2.1792579365028;
        Wed, 21 Oct 2026 03:42:45 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5369b5536dfmr27587491cf.2.1792579364515;
        Wed, 21 Oct 2026 03:42:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678faa5b0sm64563866b.37.2026.10.21.03.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:42:43 -0700 (PDT)
Message-ID: <4cf59328-843a-40f4-bb9b-8fc5b9fcd574@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:42:41 +0200
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
Subject: Re: [PATCH v3 3/7] i2c: qcom-cci: Detect capabilities from
 CCI_HW_VERSION at runtime
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
 <20261016-cci-imp-v3-3-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-3-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad89725 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NORypjkHWnF_li2zo8gA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX5h9VmJUNKXKn
 8wonogzDgUVrSj6W7D38WbJAD4a/4295E2az7Mn+//e5KBCtVgYhUWSEpEoChynbNs4/d0OkoOi
 4FWMvKFGyMoC65n6daUljwTLJsKxbs3ur3SAzz4zyTXlRWPunZxTzaOT8tYC32TmeOogYosBjOS
 BdlJCZnzxyxhNn0QicS037rnXBOsAkWvFRKzsUCkMVp7KlwSvkpmgfUdYpoYO0UtKSHDcxeS4U2
 0VEvY6SZQHDvw1cb61+cy+Ps+zgTRt3AQ7vpeT/TVbHam30NgpUedjnPp+WX/1izXaK4Aq0/KlS
 /aqcvJI65v86jSJMbH/MvQ/w5nLgGGzpXDp9SUdQzsBnirX2LNbLGHNPYnDbLXwD/5AKctyQU14
 pga6q38DpaxmCd/rROiUFm/1qomC/zNewmYfgpxGe6INyJJAFGTIpN9nuYbeLa0+4TIRp8f0w9V
 PcIfR1/2IxTZu9JkUTw==
X-Proofpoint-ORIG-GUID: D1AKFWm3hXpe3I6BIUdHTwjZBXCaD0Xs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX4VZxWOQfruO1
 R1Tflj3aw3/6Qsz3BFuK5kQ2U7+cRUqQwPAvnwpwyIVqHKW6vXMA6v4saniUHBoOE9ixmJdOW2C
 VrnwcFt7XSL6PlJUKYcBKBklkcMFCQE=
X-Proofpoint-GUID: D1AKFWm3hXpe3I6BIUdHTwjZBXCaD0Xs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 10/16/26 10:00 AM, Loic Poulain wrote:
> In theory, every SoC integrating a CCI revision that differs from
> an existing one should introduce a dedicated compatible string.
> In practice, most CCI instances still fall back to the msm8996
> compat (v1.4.0), one of the oldest supported versions. In order
> to take advantage of capabilities introduced in later versions,
> such as larger queues (v1.6.0) or threshold IRQ support (v1.7.0),
> we need to properly distinguish the different variants.
> 
> Replace the static per-compatible cci_data definitions with a
> version-sorted capability table keyed by (hw_major, hw_minor).
> During probe, read CCI hardware revision register and select
> the newest capability entry whose version is less than or equal
> to the detected hardware revision. This allows revisions to
> automatically inherit the closest supported capability set
> without requiring additional compatible strings.
> 
> Several compatibles that currently fall back to the msm8996
> configuration (e.g. sdm845, sm8250 and sm8450) will now resolve
> to the corresponding capability tier, gaining access to their
> larger queue sizes instead of the conservative msm8996 defaults.
> 
> - v1.2.x CCI increase I2C write payload + burst write support
> - v1.6.x CCI has increased queue sizes (64,16) -> (128,32)
> - v1.7.x CCI introduces threshold IRQs (leveraged later)
> - v1.10.x CCI increase queue 0 size (128) -> (1024)
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
