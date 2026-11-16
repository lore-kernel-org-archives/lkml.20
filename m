Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825428;
	b=JR6zC+7ki60p2GRelAcystI0P6Wf1BmZU8TI4SBdjHcFJZm79gGeVXSb3ui9SRs9xfVo
	 xB7aB5rR+z4OF3ehCf47h4lPivK/ENqhuhjL2esiEfdC8HmuOoscPfb3hEVPTWoCReA79
	 nwm2eBpbEIV0NV641S8yew3PsDGmW6K8aM8i7ClbGuDmbuAwADGkeGO7zNHn8no8AFpr/
	 k3yntiONdnRUlUG2vuxbgRvY84r5lx9QqOvajirikBVatSBnovoi4tYi62jT4P1CASO5Z
	 l2unys/MgKXN6BnaAaP7xKYnFkUFF9DH4gGbZx+9bgl7TQxPl9PegG/1uhRzDDImgKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OKzx0WFamDGxi1lhlFcpXjjwrC6ez8FTZm7ETCzF7RI=;
	b=whsDg9qNz49uNRzblojmHCNvuR19wC5zUw6MBvh+ywfT/5md4Y6lqtRtBX+S+m110iag
	 CQA1gRQ8Rfq2aBpGkV++mdF5OdJQZqnFsESxpE7D5dVp8X1c/ZN7u4Y+G8kB13XrTNs8x
	 IYWdR/QGoq1qUr9HEMV1yQrCABa2bpjgHc15NyHkzqQQiiXpPHD4E/2ymNK9pRfMs1RTv
	 YXpC3tVv/ixW7Z8lDrMvXrSkrwAL9wpHcYWGL7zQkZ0lquQ5DDs7BI/gEsAwzEPs+tHgN
	 kcbmyXPt4rqkikrAjpKEHNMth94sJk6HRhSyXBMsyJvqBPAytbMJoVWO3NdcezwI3pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ii3LY256;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DZtfeLiw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CF5606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41CF5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ii3LY256;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DZtfeLiw
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGA1hYU273408
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OKzx0WFamDGxi1lhlFcpXjjwrC6ez8FTZm7ETCzF7RI=; b=Ii3LY256aW5XqhcZ
	W//p8pPdYPjkQ9PQfjeYCNCNWY/y0zC4kYV1I1N67IIN99o02io/Y848tjsrnCEV
	nwoRyZgBN9JtLJns3QbejJcpJVtD/D5lnmuWJxxeOfFaYf5rimOCmOk3bGPluQ5u
	TwzT9wkHByCEkSO9se4AMH5jfaHV6FGjk5HSO3/P3YhV9EYBL1v+T5TyrieTBOaH
	ukUY4qEiz3wawR3zbwFiZXyse5/eMmU7kpFvsbGJC4k/dPAGX/MOMbw4d/kOb/p+
	W0rkEIjsjNp9aFMKlCQzBWSlyQDVUdagtI/AVKrj0gfqbj+Ayl2y6HCj7OPG+4Br
	rWt/BQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqgg404-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:37:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so2753252a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794825427; x=1795430227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKzx0WFamDGxi1lhlFcpXjjwrC6ez8FTZm7ETCzF7RI=;
        b=DZtfeLiwdExmU1TbpIxZAy5XYLxuRG18zdCAW9OzECgFIQZVgC6DREz3PNPWA22KCJ
         GaBNb1t7/ZUGq8CxlJnJbOfYdM997uZc31OvRPISAqhPuKfK3FkgT6AZ8O+WmAIVzyDx
         7PnrPdRmdHrEFhH1KJfBNiqhmZFD9X5Tj0Z+ysDaK/0cjUZRLFLFLA4oxmx3Vwcl8ADf
         SwM8ei2yck9YJZy1VDKhXfYnLbMj4kmDvUxncU43Yun6lWz6VuvTW9eQ4hV68hH76Dly
         6gXEIoK4Iy4DmG3hPTGiMhvl9E8iWHZ3i02rokdD2KPtlE8hfYvTzVO9l7NdE5cuepRf
         YvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825427; x=1795430227;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OKzx0WFamDGxi1lhlFcpXjjwrC6ez8FTZm7ETCzF7RI=;
        b=meqV8dsyJxvlfbhffOkcP99MwIqsrmru1sU6aBIlPAers21WwZBDLOMwc43p72Li/6
         cUrjr0GBzlTIj4Ou5XJCzXcy1QRPVPzWd8w2NnDV9hap0LXmiEgDq9csBunHVVtvQRrH
         0jDMV/xZzWB34zWBa6rPCAeFEffV+CiF16ZFCod/x4Kc5Q3fukOHIqvr/Cl/AnJgR202
         yl1b2rBMfpLXCA+VmkDVRkvDWWIJHAad2lKYNd5DyPZgixn60Ezviifj/D9k9wcujFtL
         yaqyvUtsuWrPPuPOSQlfOHtGIJ5QNXQ/EP9yt5xtZoSeh7d94/Gu+gTbuLkc2BQIB9J+
         Uqlg==
X-Forwarded-Encrypted: i=1; AL+hErHCpelWFODba260my0rc4Tqh7Aq2coE6iyDi9EkB+UgemFC1vNIQHmxOXcdsrKl6SLKkHIrSbc1AixGDKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/+ZXRxazpsMmHKAE2r4UWLTrX1c+0o+zii4XSNKmyrAQ0isvJ
	pmPC6T2Qph+9XjaVQhGLIHhVhMfZYhMYeMG7SfGP3b3O45KlsvYKaD0mn0JBuau3lCLPmeBu1ls
	PirdkqEp4zjZv3ioZUOFJvnutXVhOx1EPKA3FrgyqZDG2rss/RvKLbfg/77XCAAYYBqA=
X-Gm-Gg: AZFdTZfr+/CeQnFvpt77WV3Y+amTUlKEHfQF+nx7mRNGEFeQ1satUZpeZBcaAQ8VxL2
	L2McPAE7cZe+0E2BYDcIDn2Wj/XJo+xc7XVaGXISI4vxQKlRSDh2aQEs9Lhk7t2+/L4D+JJV54v
	E5nhRjsqS8I54P48gte2hzbwBxcuR15fOFj0cgate9V2pXRakAaeEMWK6M+RyemOUSawZziV4vE
	yAu681efJrn+egJkbqKthcsCybIqtmIEGzTEXGtJe0397qg4lJTvEnThiiGmgmh8lE1M2xR485o
	+d+3EWgXsE7vBGUSkwO8lpGgrKdCq4Jfz1a79afJFf0sqkPkUQYkBInk50dJGR6/9ziZSlbKk+f
	SNN4+OV+M+WkCttCED9QOpJNeh50iqbhqCNcL8mkOG2aY1rDuEWbQFj3SSIdIqWJjqW+8MRNOlj
	liDDI=
X-Received: by 2002:a17:90b:3d87:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b1b0a3956bmr9673719a91.40.1794825426529;
        Mon, 16 Nov 2026 02:37:06 -0800 (PST)
X-Received: by 2002:a17:90b:3d87:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b1b0a3956bmr9673681a91.40.1794825426012;
        Mon, 16 Nov 2026 02:37:06 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3d279d8sm8190788a91.2.2026.11.16.02.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:37:05 -0800 (PST)
Message-ID: <21346a70-3ca6-4b9e-9a15-294004a1ef01@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 16:06:59 +0530
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
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
 <58b64727-4b36-4328-9abd-116b984eb7af@oss.qualcomm.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <58b64727-4b36-4328-9abd-116b984eb7af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MiBTYWx0ZWRfX77mrP3WQ4kcZ
 nxKjkJOMOHHnZYQuEklhk3N44J7zk6fOYsanQAyXbyO9YHgphEPoIhMZU/InOnL4DTrO5ZesIoT
 /2mi1wFCNjIbaGaLogviPnKfbTFwF+4=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afadcd3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=89fLKjHVl8os-4pLqkoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 8Oin7wxOo2o-fpt1NSgsgV2wSzdHM8er
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MiBTYWx0ZWRfXyiIvvOr77/Vq
 521Vz+FLL+E+RVBWRvqA+67Ccru8bgjwnLj7gzldo3jaCAesE0zCyc/O6f2Fh35zGUfqF8VII0X
 tkSRcZEKTH6ztDaGgXmXAXT43m2D0sImpmmJ31iVFDFf0/VkNHhqSxo99zW1R7tXF7ihzl3840C
 PjUP70Xx5N+2Xbkvl2LKeSn5FZC89nDV5aTNLeh3eJp5uJaUhmmKHPVQHfvjFyNM1Kgrv0tZvLC
 ehnn22SmhiB2qm3SLnaQOYTeX1T7j54fWkyq1fjfwfAFOmIXnqocrzrFvK2SMN3gIJaclwVee0Z
 d0xxR3l3LjGXqWOrB+Qcau1sqFZSIhsA9wuDUtNTSqki4yRvOSGJipG/t6aTMyfVkD7R+1iz2g/
 4y9ala8doBv2CGS/NLA4urfDiwG8lc/11bxuXpf0g+ALX1onHkXCUFgFuCvfO6it/G2QaNw4//G
 tPRaA6e2N6F7lN2FNoA==
X-Proofpoint-GUID: 8Oin7wxOo2o-fpt1NSgsgV2wSzdHM8er
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160042



On 11/13/2026 3:44 PM, Konrad Dybcio wrote:
> On 11/12/26 2:57 PM, Krzysztof Kozlowski wrote:
>> On 12/11/2026 14:47, Jyothi Kumar Seerapu wrote:
>>>
>>>
>>> On 11/11/2026 6:07 PM, Krzysztof Kozlowski wrote:
>>>> On Mon, Nov 09, 2026 at 08:03:29PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>
>>>>>
>>>>> On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
>>>>>> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>>>>>>> specifiers. Its value, 9, matches the GENI serial engine firmware
>>>>>>> protocol ID for QSPI.
>>>>>>
>>>>>> What is GENI serial engine firmware? How does the Linux rely on it that
>>>>>> we add bindings for it?
>>>>>
>>>>> Hi Krzysztof,
>>>>> GENI firmware runs on the serial engine’s programmable sequencers and
>>>>> implements protocols such as SPI and QSPI. Linux configures the engine and
>>>>> submits transfers to it.
>>>>> The existing GPI DMA specifier includes a client protocol ID. Linux programs
>>>>> this ID into the DMA channel and selects the corresponding descriptor
>>>>> format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to that interface.
>>>>> I will clarify this in the commit description in V2.
>>>>
>>>> Does not really answer. I see no reason why GENI firmware needs ABI for
>>>> Linux.
>>>>
>>> This extends the existing GPI DMA binding, not a GENI firmware ABI.
>>
>> OK, so it is not ABI for the firmware. Period. Let's stop discussing this.
> 
> It is a firmware ABI, the various protocols each have their own magic
> number and the firmware needs to know the right one. The GPI DMA driver
> uses exactly that information and programs it into the core:
> 
> gpi_of_dma_xlate():
>    gchan->protocol = args->args[2];
> 
> gpi_alloc_chan():
>    gpi_write_reg(gpii, gpii->regs + GPII_n_CH_k_SCRATCH_0_OFFS(id, chid),
>                  GPII_n_CH_k_SCRATCH_0(pair_chid, chan->protocol, chan->seid));
> 							^^
> 
> It doesn't necessarily _have to_ be the DT ABI, but since it's
> bijective, an identity mapping seems like the sanest choice. The
> holes are a result of some of the other protocols not being
> supported upstream (yet?).

Hi Konrad,
Thanks for clarifying.
The existing GPI DMA binding uses its third cell to identify the client
protocol. The driver takes that value from DT and programs it directly
into the channel's SCRATCH_0 protocol field.
Its mandatory to maintain protocol ID-9 for QSPI.

The holes are for other protocols: AFC - 6, SPMI - 7, HID_QSPI - 8 and 
yes those are not part of upstream yet.

> 
> 
> 
> But we already know this value in most cases (if the firmware is
> present). Once upon a time I tried to de-multiplex the GENI nodes:
> 
> https://github.com/quic-kdybcio/linux/commits/topic/single_node_genise/
> 
> particularly:
> 
> https://github.com/quic-kdybcio/linux/commit/02e4671d8f9c3743a8e1a520cae75a455912eca7
> 
> which (for x1e80100.dtsi) only keeps a single node per QUP instance
> (and not NUM_PROTOCOLS nodes for each one)
> 
> But I think for removing this completely we'd need to move this
> information into a new property (qcom,protocol?) which would encode
> exactly the same value to convey that to the fw loader.
> 
> FWIW I can pick up that work again if we agree on the bindings.
> 
> Konrad

