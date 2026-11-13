Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564867;
	b=FJL2/1Sob6t+HZuG+STp+V1Nw7Mu50GfM9ACYFmRvociJv4pzkQqQmOqDFFgoI+csC/J
	 WHwlHPWr8QtSp3aWN6caNGMS3LjrQRVrxJNxJa/CLyzHiCTlF6p3EuriYUTDkFYAjkeUL
	 AAS/IqO6m3RNgp7mV8TwiqbqmIs/5TwprodIYQN8uN4kAEvPpsE133Qcljlg+X6eXOEUe
	 K/MyUQreQ4g4eBFVmS144xIJKXpK0xYPLBy5Ri9vfNLyBBgiNsoTJkk13j9EzF4Slhk9z
	 +kNIxavIqYqa7dNHtCABCI8rAb2dpfgL7pqf6nabOTGQUZF6uszSRLwaxjJrD8Sc0Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZsOlRIP84+cd0ceqPpUVOhUaXHip+vkj83YXh3mKpJs=;
	b=HLrcqhKMAg1MtuGFdrpEoWT/41v1EDLbzftvvyal1Wx7tsCIfMu8cueiKnqsQ08hJUNa
	 lQAXWYWKdqf8+DFX9KbS43rp1EzDQ2ibw90SrF/R42epeHU5z0K8o1GwiRKe2h+w+hLO+
	 V3NqWO6nIzpviJVjRFZeBW+B5YLRMwurMzPKWMO6Hm7+Sg88jvPh+P8bqr3/zHye5ebKC
	 aYXi0wQZuWs7lUf94r9CqwxvFofvro4FGLfgFK1nt36x7i3A/xZsJfp6dJEqzfo2Zi9yT
	 7h9rVZHtNPxMs3LrP/OsmBjI9d4O4Mrgb/jEgYs2iXhjs4L6mhlzWp7XLPTyp2cSMBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlEZuqpP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a2A56IHW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEC8606A8B1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDEC8606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlEZuqpP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a2A56IHW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VEhb4163569
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZsOlRIP84+cd0ceqPpUVOhUaXHip+vkj83YXh3mKpJs=; b=mlEZuqpPF39alVmw
	XApYRuTPVfcUjxNT7dsmKkyxJoShSvtBNG+fLek1nLHG70UzKQRbzrcvnkLKFYwK
	DEfLzqXRzlr8qZ0mJp+KNcOHGf2U1t1nYMgV8RNUzHqFwKioGKfbuJpwj8oSIzKl
	LxVXHOlPqZvCwOBn4oqVl5vtESxQcv7LlRKJTO9l8w3shUxM54tiLIguftfH/beJ
	L6DY+IveQp47j4Ua7BKxWSJNA6oPow9lEbHwMHnuzxS6fshlU5fjZjbqOtf8VpAv
	RfoLRt9GEYMawZ4SUQ4hQmxDS07WleaqdVj0Aj0E7OoEZHnpHuAbKxW2wwQYhjlb
	7XbDAw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ak8pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:14:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530cd3dff25so1880351cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794564865; x=1795169665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsOlRIP84+cd0ceqPpUVOhUaXHip+vkj83YXh3mKpJs=;
        b=a2A56IHWfz1Y/iMrxV/OtURhgg43OmJZPKyPYHBigugByNwOv7JDh2CQwY8i3kAjip
         mfF8ViBhuayCRal30yAG1f/0Ak2B4XC+vqSzIZL5cOxH/zpb3ZoVmhZfJNTfaU6gXPAy
         rrbl7/D3Ag4v3JJv0suWyJhcO4IZXt0BnKS5B/E0w9tQyOj/wb9eHArMtsRtgNIdtc08
         Xl0c54vLzzXJQk+0oUYOVehbIZO+tfRK8oopWGUPxez6rQDa4NM///1N5Vdyp1lR92DH
         k9ZXiLItg2Kd6x9FdRLv3Xc8gXy/lpkON4gGsBGijTYBcTzAAmOdDg3Mu/iibtRJDJ26
         yTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564865; x=1795169665;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsOlRIP84+cd0ceqPpUVOhUaXHip+vkj83YXh3mKpJs=;
        b=sDad31byCnxSN+np0jngXTqvAYxnGJjTE9143LA2Qjj71mDeqGy+bJXZtUtJbmoAkQ
         TZBYUuvcXs8uGw2otb+cShCPQSFjTGwc45+OMyDb8EIq4flgGBVLQjGY4Iz4QLwmgslO
         VNnOel5bFP0O5rcLDjTBIJMcVT0M1cmxDrLLPvoi/aeJnE7mBMxSCETT2IiQjhp5n4i9
         nhoPG9m/86ufvAr7jumqL/8UeUoM/TtHpk6HAiNMbAIBacNCXBeAvIPpcWEK1m3uDwf7
         p4guNjxfyRHra7QiLySsdiJAGSxZG+zxBB411BQdUwD2yhg8bRg7w67LH5JbkrSoLFrk
         /uxw==
X-Forwarded-Encrypted: i=1; AL+hErEBsiRG1a4elWiyvMVH/Z/QVB/poZwuhaya3Okjyf4ZPXLbWZ1B9mWnezFm9uKlms54lB97OvG9qDiheHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Relhet6FIwT3Zr7GjZRgO+1Qr+pkaec2xDge9Y4RopH2VffMC
	MyBLO+dyiCGI4EHYPbap6/Jyvl6ok6eIRRSZHunX+3OqI8/TpO3MEdV8U2077RmeWe+rkXpKhuH
	Zm7Zo2reG/XM9dgEzMJGaRU8GfHg/fwzAPmPoaR34+BQox9z5zaotJrO2QQjdc4FoOGM=
X-Gm-Gg: AYBFou2eaTQGqOT0DnjPSv4TlZKneNXMHdpw+GaGLVbvd3REPik43e/lnsGmeyHvsBX
	y4a1P82zcEOGEc8hI0e1ZwfIvhET+Bj4BAr7SX25vAhaoVA1SS9foR/ZJ/b61W3W4vbr9dOUEd1
	A3W7dPFgVIkPUpxx6OaEuLbW577srE4gSQUF2aszhXMRKK+d9ZWxmkt+4DAglZD7V6T3wX/aP8O
	B2EUd3w1dYDc13t5hVC/w9Y8LL1tfLKAGKQXfyC3CyF9/v//+QcLB7+Fn4cqllqMO27dVhfP8cZ
	iHUjdExI18m5OyhaaA+1Pkp963jBKAakVwHgczdWZi8NVVY9f5hmVLs3lpvNafkrZQsORbZq25L
	VWZP9RIBtjibgc1Rx/LxpHoVVGQOOH/CcogZaV9FHmPbM/Xs2hrhzDfX5saa2Z9FJdTieDEc=
X-Received: by 2002:ac8:1009:0:b0:54d:2f0d:a83f with SMTP id d75a77b69052e-55ac667e23bmr32303351cf.3.1794564864802;
        Fri, 13 Nov 2026 02:14:24 -0800 (PST)
X-Received: by 2002:ac8:1009:0:b0:54d:2f0d:a83f with SMTP id d75a77b69052e-55ac667e23bmr32302991cf.3.1794564864268;
        Fri, 13 Nov 2026 02:14:24 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c264d99csm729164a12.36.2026.11.13.02.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 02:14:23 -0800 (PST)
Message-ID: <58b64727-4b36-4328-9abd-116b984eb7af@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 11:14:20 +0100
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
Subject: Re: [PATCH 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-2-21f43042dd60@oss.qualcomm.com>
 <20261109-wandering-miraculous-mamba-0cf21a@quoll>
 <2fc8f7ea-651e-466e-9346-c47e0a38c5bb@oss.qualcomm.com>
 <20261111-daring-salamander-from-tartarus-4c72bd@quoll>
 <c9427a03-8b45-4e35-a29d-7ebe30f07ed7@oss.qualcomm.com>
 <5b6e4031-4c52-4b67-82c2-0033d13b15d6@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5b6e4031-4c52-4b67-82c2-0033d13b15d6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MCBTYWx0ZWRfX+Z4vL1DAkoGA
 ZF/3ciI3qTNlD5KIzM3EA0lCteGorbrAFxUq0oSNN7E47tD/4jFGJTNTS8rRIWRkZS32APh5PmZ
 DSWCfjwlCNCQzjiY0g7FjM5BeJg+zOs=
X-Proofpoint-GUID: 0Ef6z3XWyIZcuBrYsttXYRNblbtTKHt4
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6e301 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=O3q0-ZaapwhYWF49y_EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MCBTYWx0ZWRfX8ek8C/lVBF8/
 zpYBvu7qQi+B+71Dq/I6p2yCzG6vQKlVz88mFexA/mAbSVAgHgrjbxF6gC8nJkVjIxPpP1DQxU1
 /aJFp5N3sFQydTbv7YPtn3stoo3QYjfo1MqcC+u7S71oA2aoCIQdDq3O+IpciBAId6VF8a+8mCi
 jO//OE4v6ljdtAdDzduP/4HlzFZLwH4x7izb6h2ZB4ZfPNVmLuNVKdRdSDWvd6sPqQIIcaOA3WV
 Mf1JQj7SPqpSpkij05JM/g6STO4rAzA/rXKHTEh9dMpbzOoYgHqoSUgjiKe2FCZg4sx0bD2IFZA
 YBcwHRt5oX/24WBaM0PWEs44Uj5tp2qODk993n7rjx0+DjPYyvnrrSBY1GNv9a8mR5dks+2kXNg
 r1mYC10VxYAYNOEZxZHH53Ag9MEgOKCK9moj6dSpapFFnOhzEUKSzehLa8Wl26BnROMspwRps+o
 sRO2MlHt6yZHU1cUnCg==
X-Proofpoint-ORIG-GUID: 0Ef6z3XWyIZcuBrYsttXYRNblbtTKHt4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130040

On 11/12/26 2:57 PM, Krzysztof Kozlowski wrote:
> On 12/11/2026 14:47, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 11/11/2026 6:07 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Nov 09, 2026 at 08:03:29PM +0530, Jyothi Kumar Seerapu wrote:
>>>>
>>>>
>>>> On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
>>>>> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>>>>>> specifiers. Its value, 9, matches the GENI serial engine firmware
>>>>>> protocol ID for QSPI.
>>>>>
>>>>> What is GENI serial engine firmware? How does the Linux rely on it that
>>>>> we add bindings for it?
>>>>
>>>> Hi Krzysztof,
>>>> GENI firmware runs on the serial engine’s programmable sequencers and
>>>> implements protocols such as SPI and QSPI. Linux configures the engine and
>>>> submits transfers to it.
>>>> The existing GPI DMA specifier includes a client protocol ID. Linux programs
>>>> this ID into the DMA channel and selects the corresponding descriptor
>>>> format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to that interface.
>>>> I will clarify this in the commit description in V2.
>>>
>>> Does not really answer. I see no reason why GENI firmware needs ABI for
>>> Linux.
>>>
>> This extends the existing GPI DMA binding, not a GENI firmware ABI.
> 
> OK, so it is not ABI for the firmware. Period. Let's stop discussing this.

It is a firmware ABI, the various protocols each have their own magic
number and the firmware needs to know the right one. The GPI DMA driver
uses exactly that information and programs it into the core:

gpi_of_dma_xlate():
  gchan->protocol = args->args[2];

gpi_alloc_chan():
  gpi_write_reg(gpii, gpii->regs + GPII_n_CH_k_SCRATCH_0_OFFS(id, chid),
                GPII_n_CH_k_SCRATCH_0(pair_chid, chan->protocol, chan->seid));
							^^

It doesn't necessarily _have to_ be the DT ABI, but since it's
bijective, an identity mapping seems like the sanest choice. The
holes are a result of some of the other protocols not being
supported upstream (yet?).



But we already know this value in most cases (if the firmware is
present). Once upon a time I tried to de-multiplex the GENI nodes:

https://github.com/quic-kdybcio/linux/commits/topic/single_node_genise/

particularly:

https://github.com/quic-kdybcio/linux/commit/02e4671d8f9c3743a8e1a520cae75a455912eca7

which (for x1e80100.dtsi) only keeps a single node per QUP instance
(and not NUM_PROTOCOLS nodes for each one)

But I think for removing this completely we'd need to move this
information into a new property (qcom,protocol?) which would encode
exactly the same value to convey that to the fw loader.

FWIW I can pick up that work again if we agree on the bindings.

Konrad
