Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935100;
	b=3wL8QEk5jXd2u6dwlnk5qjvC41NQaqwdsL6ZgwJplhL45S0mbjRvzJVSbcEU3YAkVYHo
	 /p2kcdti/gY0OkN4hNySxNRrJ7QP3IXHRhK0KECc45nfari2Wn9BRz47bJBeCkpLVa6on
	 31YqJjTKkSKLsnG+Z9Ge0V531wvCC4MFWXq8+q3uVmjQV996WfWpZnzz+kPjTKlPSH6R3
	 c2iewmeBiTxOJFmcpvdS/lp3wUGVlmkVfkKA4ydFpfADyrnMxQQdZpYTzAM3j0NeGl+x8
	 3VanKrEay3wbvBOu5bznLiiw1oxr6rgBQUl4SO6LgLY1MohfGGp227sNCWSQURm3RLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yw5ELRHrebd6o1qt73LR6t8y7TmlfyCU3l58M6QwR7w=;
	b=eUW7893Tuq02cM5arPz2eXEBYb6YXo+IKo56caKztXLVxLgubpQ8z/rNOXaVKTYfLM8t
	 itq1ZFB0QVN7fvoLv4OkS8CVZF54K38QwAhRFDxju65gKbdIwn5VICGUFKBORzYy/PjyH
	 65l2N0kPPLLqUjp8i7PzLDiGyNFX0AacK0oliq7Sm6eyFRtBkIBKUtV61fjpAHAwEhP9N
	 Egpwz+1BYynzLr4WdI/LyjgnnABRbTn9wcY4WRvXpaE7/HsLHQ0WkX/GPcw7Ilwfe1Nme
	 fWzYRmWpkaGmq1hHQ3doNvpJf4E2MPKGVKylyD0B0lSJWrTOc49GFQv+a15TB01cQnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nyuVXcGA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YaDkS1PN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB94606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB94606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nyuVXcGA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YaDkS1PN
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHGJxa4617424
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yw5ELRHrebd6o1qt73LR6t8y7TmlfyCU3l58M6QwR7w=; b=nyuVXcGAiDP4aVXO
	z1RgkoxOVW7+/sVv5pcO9u1QXiaM0TfbPBGuOpoBiYf/HVdKfdb26XyWX3wIsoIl
	jlKFzPn1P21p3H3Ste7ejwZg8h6TKBK7LfcvV+NJLv30w8x+cMMYSkjTahDXbz6x
	gU7epuiMJ68FJnLn2hbbxugCiULB4JFuwMn1CJhG/eExTI+pzcZthmS9yPuQ3/zQ
	I1Lh8605U5WXZ4Sge+fSxACNh4MJ+owCNwhegcJfgMUVo/l0FIhaMSsde2OFz/lm
	xN9I/Ja54llIy2W2q6HzDeD49C6h++iFl9iRp/0VyBLDBMJC9RRdoaC18ojsO7F/
	0WFJjw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0tbu87ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:04:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso132446eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794935098; x=1795539898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yw5ELRHrebd6o1qt73LR6t8y7TmlfyCU3l58M6QwR7w=;
        b=YaDkS1PNAfOO9tQ0ds7P9BjTcceoqIrc5Zx3VZo8zfzpR7yHO1X2NuDae18MNq+aO7
         MdByodqPsMvGISbmn3qNjJIpJI/BBSw/PtvaBSQ64TLSVH72JmOcgAW7U9NpnRvXlcza
         pbR5HDs+20lc/ypMsML1NHjM+fJgxIkJd0BPHwNE/OzajCzLilg8dRoJ17Vw3McJnutr
         HeCZjEH8a3ZKKzAJjcAmLU++oIeMKEP1DCidTElKcdr/8s88T66n8vBDrNJXoxale878
         sztx7IpNKc1QM7QyT2bpKvtCmsfp1lylEoDspZNw/a/2upB86DjHo5kfsDUJyzGfS+Qs
         t7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935098; x=1795539898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yw5ELRHrebd6o1qt73LR6t8y7TmlfyCU3l58M6QwR7w=;
        b=wCKcR8OxAY597cfQ//Xj2k3i5I9x1SXFXTnf4g1EhurXAFZ8r6MWfIUSeCHwtXdoCu
         ZXfZxpz22i4UGulArh4DIH+tOMrdMQ3B0lQnZV3WSc6Zqi2wbBPMz6y2MM5Keok63/Of
         oGvowMETUfPeXaDQS/Iowen5XlYUXipMeiXQ57Fmz3Fx3OYfDv3OIwuMcZkB8+/ElTbP
         rx2UURr+XGIO1BSvN7godZhe5UJLZuPhhiYf54cAX4bMgqaqm7TVTJpw0Gk5WlE7nIuQ
         IbeeApSopwwqXsnGOCGyWqouH4SJ9TLcDzVPrWzuu/y1B4InqzKp6XTr0eLQbKMR6e+B
         +Ukw==
X-Forwarded-Encrypted: i=1; AL+hErG7NKqGSq5YuKkuITAMWszwfSdYKSfVavoq8enFzMpkZXs7GiiFs46pSKw8lOfGLpRPJ8DOXsWB1v3pf58=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z30STFHwvJERvS/kunJxnI1YVf64RVncLXrSVte2qZcPeqc5w
	fUXVzobmkYa5QRjbFzZjzc2hzfn0wGEXGZAToKfYcPKUGd69VmSt686jxC3XmCo0l7fyI/xMHGv
	9K0nA8opLHnEqK/1kzV56F47usbxmUFaiAKIivgzWc70uMqqCCX9tnoyC3JTNkF2GU50=
X-Gm-Gg: AZFdTZcXtyzupi5FeUSxllySE6Bb+yb+HeGSdtnuVm0mkebT92rMdGFsF7x/KAE/Uca
	f9vrc+2RUDbnnHkCMACYXaRHSQaqsApPeBNEnYNnl+6GO4mzydagnXz9dPmrTABS1atP6Sn99Oh
	LRzFY9HVkeOQNCRvw/TQUL+soGSA7bG18pwshsRD8GvCQ+3hQZQzjfXLuC5galC6daxoPMYIzUG
	TXVAXzsl5mcIkiGiIQGS3AEMQEZIQQRPp1pIkkI+iOB7Gy9tXVSvIpvfSQNpX5USg60/ExAe7qe
	ncpGusXLVLf51R4bLWurg5c4ybAQhlAZ8g//Q+6ln0AKO1tXPdSEqvrH3DzkQ7d71fJgnHlnTXZ
	n9laACwuF0/J9FUyIDklJeCqAUSNqy+SN9q+9FonzQ52eYlq7SnkNjju7IwWo6Ujx19+JPdMN3P
	k3KR3NjDezP5gXHHYu
X-Received: by 2002:a05:693c:6011:b0:366:9f06:3c4c with SMTP id 5a478bee46e88-3828190b173mr37198eec.32.1794935098068;
        Tue, 17 Nov 2026 09:04:58 -0800 (PST)
X-Received: by 2002:a05:693c:6011:b0:366:9f06:3c4c with SMTP id 5a478bee46e88-3828190b173mr37163eec.32.1794935097390;
        Tue, 17 Nov 2026 09:04:57 -0800 (PST)
Received: from [192.168.1.66] ([103.172.4.28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm68957328eec.8.2026.11.17.09.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:04:56 -0800 (PST)
Message-ID: <427ecaf2-9a09-4829-a598-11298e507614@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 22:34:50 +0530
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
To: Krzysztof Kozlowski <krzk@kernel.org>
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
 <0d4fa5af-e406-4761-aa58-534c3c6a043a@oss.qualcomm.com>
 <4c3bf92c-2434-46e8-8a3a-ab34cc50c72d@kernel.org>
 <d55bbf0a-3556-420f-852d-7a15ed8d5aac@oss.qualcomm.com>
 <276f1579-6a5f-4093-a0f9-53c6808df32e@kernel.org>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <276f1579-6a5f-4093-a0f9-53c6808df32e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2NyBTYWx0ZWRfX4zDz2fOzvzlF
 zugoh3ya/R/fKNLenkzhHviv/EXTpbhfFsPeJCvcRkB4AQJ48smkxaxbyBagqKSh8S+VqU/byaz
 GQgXopaVbKN8J3t8X74+FyuBVy+p3uEypI0eR6Yeif689krxoqQ3RSKDNuY4V+PZPpGxJJiJoCW
 7PCrbtJWZ22mFUJEYFv26YBQ02mTJpSLFt5T9jFe0jq2NX8bw2Nw0R999kxhLlM3qhaBDCIhFLj
 wM0JhYd3oAu32OrnE1XyvNOOtNERuiVwpNrWPmtpxGJSGZuLmI+SuMbBRiiZ4OqojrGLvImQQic
 3RF5ma8wOD0EPRefox1PlFy1DR6rEhFC45kTzewwUF5wPyXXALelcbyx6Hy2Sc7++XdkG9n1we6
 icXx5tegAAebL3soa1NeY8BswPlp5NJzX8De6NBGFeLngo4Q046IH+zyk8v/YaBw/45SKPeMis+
 25YolCyOwKaOUvszr4w==
X-Proofpoint-GUID: u1XWPed7Rpxw-azOXBrXt9dvYYKNDudP
X-Authority-Analysis: v=2.4 cv=FeOiV5+6 c=1 sm=1 tr=0 ts=6afc893a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=kYVgg70FI5gtGbgwxQSixA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=9IG9TpRuJpbhppyfOHcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: u1XWPed7Rpxw-azOXBrXt9dvYYKNDudP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2NyBTYWx0ZWRfXzcZ9T3rVyTf5
 2nRKCsh4zYFucqHGp23W9VY7Ru6LhGPNI5dSNc/NaUVSma6u33LEc6X8coTD6BbRStwnkCSUl69
 mEX40urGKzL8E7qg8JfQCrCXeJKyEoA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170067



On 11/17/2026 8:34 PM, Krzysztof Kozlowski wrote:
> On 17/11/2026 15:38, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 11/16/2026 6:56 PM, Krzysztof Kozlowski wrote:
>>> On 16/11/2026 11:36, Jyothi Kumar Seerapu wrote:
>>>>
>>>>
>>>> On 11/12/2026 7:27 PM, Krzysztof Kozlowski wrote:
>>>>> On 12/11/2026 14:47, Jyothi Kumar Seerapu wrote:
>>>>>>
>>>>>>
>>>>>> On 11/11/2026 6:07 PM, Krzysztof Kozlowski wrote:
>>>>>>> On Mon, Nov 09, 2026 at 08:03:29PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
>>>>>>>>> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>>>>>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>>>>>>>>>> specifiers. Its value, 9, matches the GENI serial engine firmware
>>>>>>>>>> protocol ID for QSPI.
>>>>>>>>>
>>>>>>>>> What is GENI serial engine firmware? How does the Linux rely on it that
>>>>>>>>> we add bindings for it?
>>>>>>>>
>>>>>>>> Hi Krzysztof,
>>>>>>>> GENI firmware runs on the serial engine’s programmable sequencers and
>>>>>>>> implements protocols such as SPI and QSPI. Linux configures the engine and
>>>>>>>> submits transfers to it.
>>>>>>>> The existing GPI DMA specifier includes a client protocol ID. Linux programs
>>>>>>>> this ID into the DMA channel and selects the corresponding descriptor
>>>>>>>> format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to that interface.
>>>>>>>> I will clarify this in the commit description in V2.
>>>>>>>
>>>>>>> Does not really answer. I see no reason why GENI firmware needs ABI for
>>>>>>> Linux.
>>>>>>>
>>>>>> This extends the existing GPI DMA binding, not a GENI firmware ABI.
>>>>>
>>>>> OK, so it is not ABI for the firmware. Period. Let's stop discussing this.
>>>>>
>>>>>>
>>>>>> The third argument of the DMA specifier in the dmas property selects
>>>>>> the peripheral protocol. The GPI driver programs this value into the
>>>>>
>>>>> Yes, so the third argument can be value of 6 because it has no meaning
>>>>> for the firmware.
>>>>>
>>>>> Again, follow standard DT bindings ABI rules, you don't get an exception.
>>>>
>>>> The existing GPI DMA driver and binding uses its third cell to identify
>>>> the client protocol. The driver takes that value from DT and programs it
>>>> directly into the channel's SCRATCH_0 protocol field.
>>>
>>> So register value? Not a binding...
>>>
>>>> Its mandatory to maintain protocol ID-9 for QSPI.
>>>
>>> How can it be mandatory if we did not define in the bindings so far...
>>>
>> Hi Krzysztof,
>>
>> Existing SPI, UART and I2C use the same number for the DT identifier
>> and hardware encoding. gpi_of_dma_xlate() stores the third DMA
>> argument in gchan->protocol, and gpi_alloc_chan() writes it directly
>> into SCRATCH_0 without translation.
>>
>> Neither 6 nor 9 has been defined in the upstream binding yet.
>> Would it be acceptable to follow the existing SPI, UART and I2C
>> approach and use 9 for both the DT identifier and hardware encoding?
> 
> Not 9. The next identifier for new constant used in ABI, as expressed
> many times on the lists, is the next free number. "Next" means
> incremented by 1. That would be probably 6.
> 
>> Or should I use 6 for QCOM_GPI_QSPI and explicitly translate it to
>> hardware protocol ID 9 when programming SCRATCH_0?
> 
> The ABI is between drivers and DTS. Whatever your hardware needs, it
> needs to be programmed by the driver.
> 
Sure, i will update the changes in V2 patch.
> Best regards,
> Krzysztof

