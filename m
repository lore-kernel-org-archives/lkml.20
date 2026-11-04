Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783046;
	b=J8krjHAhhmC7BD1RjZV35w1ck9kalfXmFbHN8uNCa/f70C1JgYkmWNDnimFP+yMIZXrx
	 la5/Jl88oVyPPB8ig10q7KcwLlQ5rSqp+B2mqp6lfMG6JWtidwLilsQRe6iXrcCckbYZL
	 oBNkw0RcOAE7YhNK7hZpdutXppHK/fJScD1qkQxAXUdEUS381QSRp29VX4Gp+i1bjrk7D
	 rKagQzL99/3m0M8i8j3cleOcGIL7IpJxrL3Qx3sLS7wk7JUaaFWoboTuQffg2rD5b3sEh
	 WAjucr2lT+ukVyfcIDtE25BT7bMW1MIXlEgFISO87CGoaVrp71Usl18wiZwBrDHr5tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CuQ+B9JkfUcZtLPB3R7ZhcX8YyKLeKZy/lDXJDIS0fs=;
	b=l0CSPdLtxD0tN+vGLkBJ3RNll6eG+WyMjGBPK4CQplXEeUaGF2i86kxD4btF8xcskgZ/
	 9p+K4BnU1FsAuXEa1M9SMF+SJeolPFXkAQVdvwJzUMhHno4SLaHITlo5d0dYtTvtC0ZC+
	 Qa60vR37l13FOvSjrUgeFbkEt0XP0dMV8dP0gFYaLUP/roqDjJSKKUnTncLgrUh0na6SN
	 EpZYfzrsyscIPYZ0mWG7lkFqk06CqooTmKqJwDxHsfIEZbISeOi47l/Sttj9nHGg/OcWz
	 QMaBQZ6M18b5IGsYRK+oX+jyfeFlqEAI5wc9wDbyWxtVBSwM7CbzrbXl4ubRSvOX95w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fdr+95ZZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M5VaYGCt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5CF606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B5CF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fdr+95ZZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M5VaYGCt
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48Kh8L1264042
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 09:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CuQ+B9JkfUcZtLPB3R7ZhcX8YyKLeKZy/lDXJDIS0fs=; b=Fdr+95ZZqnMfP/IH
	BnG2c1HLLaVV+UjNfyYVQdNDDJVIVuHSP8kHyTAdWV1dvmQm64sBl0+QeCq/KitV
	iGfAmKluAP0UAj8XlFq6Bq1UAYlDVgVwYnqe+bG8ftzd8A4ekcnV6y1tTYoBuVBV
	jptT0/f5+tNbkf4M/Cru+n9/0Tjj3k4igPUr1AZhnVTB4oEkXWQbe+fgzIll6E65
	DdWgqD9XajqIG/Zk2eEO4K98VDh81zksl8+aCMSi7AzWbbNXUxX7+37F/gB4Bm54
	zTdTv8Xnhl3sanaRKg0DkwUfiw9Qrqlh5X5OP3nwCjmRpwUyEfI3pPpRNkJnGEtO
	aVIIDA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubksy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:04:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c99c10e33so1087186d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783044; x=1794387844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CuQ+B9JkfUcZtLPB3R7ZhcX8YyKLeKZy/lDXJDIS0fs=;
        b=M5VaYGCttqDhVKRGgRw/IRPBFvazkbGGI76EqZ4frYuDVGpMVcv4LHbgzHBdttmHgE
         5PIuATMJmW0X3jVKATHZLDWyqfAfZK4ke7xNAxCuBlbBZyqdT2eMB7nn1v6Vy3xkx4NW
         0N+nvZB1LrvqsD3L+ICzlIqQNmIx23+hZN4L5ZIiWj8vM3n5bOCcN7qK2ccfpv9D+9v5
         yrbceO+QGtmtaSughcXkxLSpPamjmT85Ebmmd+pJhi7ijPaGepCyGBd/b2gTKf47QRmI
         V97c2LeRxX1JFr55DWgSigvf/+MsGh3Q/V4t49wh3aSPnZESEn3stmlvI0ogiCnREOH7
         KO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783044; x=1794387844;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CuQ+B9JkfUcZtLPB3R7ZhcX8YyKLeKZy/lDXJDIS0fs=;
        b=nNGA/mNV0z3Z7SYNVSiR/7noziZnW1VTWwz/yN6M4cOPZt3S+jVeDi/tFUq06A44eF
         c3+au7ZAzO4l4Ftb28Fa7i183KZWCLcdDFMHY3Sk+iJ1S1G1YCBT9prFkOx03AMukvO8
         wkvkI+n8W09rH0//l0YJE3mlTtuqXiQ+FUIaewKKVRfei0BbuE0Lkuy9VGWRvFVMX5dH
         kUk1zkZsHP2e+Oww+OVsHf/H5Vj60GsgfwXery/NuH0rNY9cQv6L1eq+rchCNCNtRr59
         M7SpGUdtjtZwyCkedAblsvfFLiW7SWCzwTcQHug6plrCuv60f+5prIIx/z74ub5leP5r
         Pffg==
X-Forwarded-Encrypted: i=1; AKwUvBwRtLhXlcIxzR7HyuNcs/FoQrrkfi63rK4Vv+bZVZ8tQy2lBxl7gUuV9rirXOBOhuObEuoRfjesWeJ+jn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nBwv77vmkMJ5+6UYC0AYumESeHW8qrdOfY67UWdjCChBna/HB
	K9EDwogAmgYg7/yHSuCLPvPtivP5QuCgePojX8sPRgbDsRzYz1UrN1i2keo2XgzMnYf2Llyn5Tl
	U6Nkv3sQIloZXlvW94UzoYd7y6/jE33m37Y3pbu7ltarBUptRvHnPvhaPqmjBBXxKQwM=
X-Gm-Gg: AYBFou2fpkKzgR+6dHZ6jU7jGcx7jvrJUVBNrUvcwzFaw8DqtgW0U2GXMRW6f5dLlHy
	RfdCylchKO2AZveqU+w0hOdux+lk09gm3RBYiEJY+kwUKlIwm63HtJ/BqPcidxC8Gsi3CCkc71s
	8aIGNVqkxPyEyeVJPQdqC5elG/WeC+iaG9+mA+L0Mv8TCl2EQDvNvYInom0xHv7nPGyPq61wDdl
	ZqucFtvcY2wqcXRQ2CTW920swOtEwWjA1yPEWuPR249fS8gUMRrgDbu4FA8BWGIIgDidZXYhR3n
	Zxn2OVnRXePsxFof+kCgD8eBIhJQDGvaJx0Q2KTLQOuh8wKTnfQMky5kZQpMy3t5BJYQz95li3H
	K0YR/TVUfbQZpOrbJQPhRlSm1EEWGpX9xPfr0ApR7U1RFdSa65V6XE8yy4yn4/Pe3JP1V
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr2582230485a.1.1793783044299;
        Wed, 04 Nov 2026 01:04:04 -0800 (PST)
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr2582225285a.1.1793783043660;
        Wed, 04 Nov 2026 01:04:03 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac80752sm505660a12.31.2026.11.04.01.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 01:04:02 -0800 (PST)
Message-ID: <26bef7c3-3c5f-4f9d-a9fe-bde9607e532c@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:04:00 +0100
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
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
 <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
 <02ebb6b5-4f74-41a3-b6ba-bd8ff24ef000@oss.qualcomm.com>
 <aurv-mqf4MJEiuF1@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aurv-mqf4MJEiuF1@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfX9QBlqoQMY0WK
 ywAuayFQcQxM0mCt9/Dn0/l+yvXzQncb+uTazBw6XTveETXigCT3GZZFtsst+PNHi49Bsvcy7Oq
 5IR3dsAVjNOlCNN49ZO/F17AuIq/FYI=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aeaf504 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SrN3rVSTMKwwy_TTx0UA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: R1jLBGWotgcqmS4ZqmIh59bjbUwXveTT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfX0cAYvWP8pKCm
 iKDRzzJFX0RsM15z/Bj8RESNu1BzqxpftBdNVLafxcn7AhASN4/fhlU6s/qkiMnSLgf3hJ7S4TB
 dqkqnkkHFkmpa8U7uWkQo3v7hOeUyGuvu3DPaZXvkwc+qfVl3HSjpbWfS2/N3FAQF6fG+v8deLT
 zy4LEPyZKJsuvvSnP/1N8xCMkND6bspY1UgS3vtNIhSHaJgI+Udef/GxSsmR9l+YVkpuxGBMpeD
 MzG/5tgjGonWpNDu6Qvyth7jy3CCtZE8Dp5WruuoGEozP3rwQLkIKpxMz8YYDzxucJOuXoqiX9J
 FQK+mIZDztFav266CaUVgjJ7aToT4kLsYBMtxpjXwT0VpGgT0XqU2yvf+av9cPqZOQE8HpRq0zo
 oBOp+ToQZfnKbvWkjbZ7gkEQewB1nLeCbHJP3Jbf0MGilILYSZhJEqoF6DKoOLToLXAKLvwSTBU
 /VrN6mjScZrWkEWfSjQ==
X-Proofpoint-ORIG-GUID: R1jLBGWotgcqmS4ZqmIh59bjbUwXveTT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040035

On 11/4/26 9:42 AM, Shawn Guo wrote:
> On Wed, Nov 04, 2026 at 09:04:33AM +0100, Konrad Dybcio wrote:
>> On 11/4/26 8:59 AM, Shawn Guo wrote:
>>> On Mon, Nov 02, 2026 at 04:01:03PM +0100, Konrad Dybcio wrote:
>>>> On 11/1/26 9:04 AM, Shawn Guo wrote:
>>>>> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>>>>>
>>>>> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
>>>>> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
>>>>> and DMA queues.
>>>>>
>>>>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>>>>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +	phys = <&serdes0>;
>>>>> +	phy-names = "serdes";
>>>>
>>>> I believe this holds for both GearVM and embedded, so you can move
>>>> it to the common DTSI
>>>
>>> No, this doesn't apply to GearVM. The SerDes is owned entirely by the SCMI
>>> server firmware for GearVM variant. LDOs, clkref, reset, and the per-speed
>>> PLL/RX/TX programming driven by an SCMI perf domain whose level is
>>> the link speed.
>>
>> Right, but I meant the assignment to the EMACs specifically
> 
> The EMAC0/SerDes0 and EMAC1/SerDes1 pairing is indeed the same on both
> variants. But the serdes nodes only exist in nord-embedded.dtsi, since
> GearVM doesn't expose the PHY to Linux. Or am I missing your point
> completely?

No, I was just completely sure that the nodes exist in the gvm one too
because it seems like they do on lemans:

https://lore.kernel.org/linux-arm-msm/20261103-sa8255p-eth-phy-v18-1-b00cc2fa0404@oss.qualcomm.com/

Konrad
