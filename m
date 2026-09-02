Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783A84A99A8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364717; cv=none; b=XweM7qYK3bsncGmpzZd1ayLY6lLQPfnrxjseRFhFK3ySh08WU4wpIcXym8EF6GYvVHjuiJF3R67mmXTDLx0d1Y7YR52wTbm3VsH7AzsoNrvzGeJsFEkWCJkGHoNeYo3gemyJPyzdM1hASkGrEL09eZKEe9e8Ms6Kxyg1CN58uMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364717; c=relaxed/simple;
	bh=lwm6jSNbiO6LZzYLxybW8K+lAptA9OdyeL+wXz5Haqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q4kiEDXNqbxP0hqbYDcorIJR7OCSX8P9MCfhKzALZyBIFmH/X79jfgdE+UXYHRGxcfv3+A3YdtixZdkYZvdjjEMl7LrR9aErWYRVVtINIlUXaWcQP5Jr+sehKMdi5aBNJuA9Y2SecKI9e6y+QGpS6S4sXD0lSdZZcSU6v3NurXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0o06vvW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aFzU63AK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0o06vvW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aFzU63AK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZT1a2671021
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WT4vDkQPrtgRr5nF277OBdLIuA4Vcdh4zy8bVUfvfeE=; b=f0o06vvWiYYW4k0B
	x8yxMht7qboOuruBR1QI8ZqNZ89BhK2FgeLQWItmX/mvkfR3Ph6zKVc5wmzZafb7
	tejjztWgvzjFzkxrQs2UlCg2dINhF/HAsLAOP6lL6BtqUQxQ+O23Ulskx47I67KP
	x4y+Cqh/rdhd3CvwlkbvynmUFSoA7i/+4pUVs+QwXS7p2M6tYBIWBsn3dTrD1l0B
	4jNMH4ZF02A/GZg1BL14C1ztUpW0TnE2/3GfmeasSp3iG5i4hHpX5Nb7gI1Ei2s9
	Bv/sNn7fK/DSGvhtYFMZnEB2D5WADtBGSAlWsbiUolgtTaSmOaoMpy/IGSftyqKW
	rzq1iw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx2t0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:58:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93495488976so30770885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788364714; x=1788969514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WT4vDkQPrtgRr5nF277OBdLIuA4Vcdh4zy8bVUfvfeE=;
        b=aFzU63AKMXwpR+dLLoTsPbl30vL3L1AigLKhRaK4fyFvyXGrv0WexMDV8Eu1+TmsIp
         0cUrlVYTjS3gYRiV2fk9pTgpLCUvFBI1dlz34iuXadUHruxBUQh2cEO+iHTbEA88ubuc
         ywUuGSPt0oBDyZ3LMfmg0xd0YT1977lU1SGz0YGMAbn2uds+EwApLNxVft+OZpyjFTBI
         xMIeBhtmYOO3eMW3T+13i8lZEqRyZ0hpOUNg1kNFi2rtduJ69j8dCKN2C8J3rEAoeoCv
         tjFR8DYoVUMpKoVv16bAhYrycaFI2CtvlYo451Av2fZfvzr06/xGdgzXjJKKnd/ID8h2
         dS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364714; x=1788969514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WT4vDkQPrtgRr5nF277OBdLIuA4Vcdh4zy8bVUfvfeE=;
        b=ai7bwlYYyoq1pWKWXkbsv8APDvKuLlL7NBnwHYFIvTDDrvjez7AWB11adk5rFMOUY5
         rJC6M1ZSD4gWRUR7wlvHYBtACqqVyAgfJgDrDjCUHQR285NHyA2PDr8Laz69eOpGkaf5
         PO19QqNmFSikRe2sPmUprib88Q18KeVrXpMembPFz1LwF9bMZnS42F3UERBl60sPxjK7
         ONL9U2PkfXxzjQqFdXrZSCRi/HzDN7nu5Kg09rSfEEvSe8oXJJaNk9VfhtPi590cO/Sp
         6H986aUvTt1bSoY7o7pFb/CvbMFJdBOKY+oYMjHeu+GLPobL5ep/Oltv8g5F7HlCCOua
         Nlhg==
X-Forwarded-Encrypted: i=1; AHgh+RraiORPXt+Z0Pa7wzBNG3LgHb88cNqqyOd7SDUsKrycWkD66xs/9Y6+U1/zclrokcE/3rFJ6KlChltCbpU=@vger.kernel.org
X-Gm-Message-State: AFuF++mXqBDreltqMXGonCA8CP0cIfqZy8h7Q6jv1QQsCyaTMQcVhE2T
	6uUm+oRayInHq0BRWMv/W5Ce9PgzwcZax4n3ItGu9pSDDQW8LbosgZKMp7kQ5apySK+9NGEkBB4
	1LAClyILboEvkLG4bT8h3yBFb5FSNrn0nTJvBjbcZapi+Vx1ULq0w7pfI3Btwn0kCBDA=
X-Gm-Gg: AR+sD12pXw+j/S0WLNMk+1hZiwqvpNmEY3NwQp0eJuZB4SOkV3919mW7lsrpQiiMKuL
	wRScRHmfjCLPw/C0zfsodTXJ1CW6hx0ijS5OTUoeg7VL2atdV6cuOMDaJ68AFLRxEGGvaXE+dcQ
	TGeGo0Gg33uSAinxz3NS3EQPeBF/q/FDRPiJLot/cccU6An0SSoLFnIGjsu5V/18mz/oimjCAeS
	JIRUSoLUF8EozoaUrth/jQZ8Mfe1ndtnZxlp+k/RLkgQII0cS9upHZdwaNP/aMTvBQiYsF/JJee
	TE9XimJuGV42ewyWTqAkzTXlhxvLepu2gBIf+mYp9nZUWp5auoykR9IxJdEQK9xj7EykRv4mWzw
	UIX/z+40T8hdwKl2LMeDL4Q==
X-Received: by 2002:a05:620a:1790:b0:939:2884:e11 with SMTP id af79cd13be357-9396108b065mr451122485a.5.1788364714427;
        Wed, 02 Sep 2026 08:58:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1790:b0:939:2884:e11 with SMTP id af79cd13be357-9396108b065mr451116785a.5.1788364713865;
        Wed, 02 Sep 2026 08:58:33 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d044d776sm159586866b.62.2026.09.02.08.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:58:33 -0700 (PDT)
Message-ID: <245eb766-e35b-4f73-a252-69eda60011a2@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:58:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: lemans: Add support for TSCSS node
To: Imran Shaik <imran.shaik@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-5-beed14e72510@oss.qualcomm.com>
 <a93f11c5-d0cf-4acd-a959-53fecc996e5f@oss.qualcomm.com>
 <9d1c5451-f665-40d1-866d-51a53fba27f6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9d1c5451-f665-40d1-866d-51a53fba27f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xsOB3uy8ifsieezuohNm2ENrMEo-NKt5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MSBTYWx0ZWRfX8SxI21tPM/nV
 JP1lKf4Z9WqvOibyjFni4RYUa+OJXF3vTrkObHBN1kBHaJ+GkrImjadOYNl3B929LoN72Q2fC+F
 dc1wzcqRndhFszRung/5/GzLhGWzV0kCOL2nf5niVquc59yRtxceHq3ahy17oTS9fwMOBbcCxr7
 F6il9V47aDm6OCnVCxKgebE7cGo8TXmJGcMq1WwQQGfuOCKE0eaZctTd3Q4oit/cp6s4i4cLF4C
 h8+0KUN+WB5Gg2Fxi0h/wCqgvAIQNi33YKFoLSj93sIkX5jnAT+8p6/jVT2aMTalJW5UuqTo/2+
 H/cjo6lh0aDpdyaWb0sdp7dNIfkJMTJq6LAwrtapz9HNk3xtcHN+5sZjoAQ8hltUqM3jit/dX+S
 g7WYj7EFhZOnk8yBFvn9eKO2gpqe6BYRA5Q9K7GwqbJHGaXAn0IFFtdE5A0TzTpgMSBRLmgIFPI
 bzpdJxYT0IQp5C9MKfg==
X-Proofpoint-GUID: xsOB3uy8ifsieezuohNm2ENrMEo-NKt5
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a9847ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hKkCCEgSrQTGbmuQoJcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MSBTYWx0ZWRfX+47CUZ98wr9T
 wnnMFnbpZsz4zUksYWXyJiAOcS13/DNq+Sob3dZ8GGfQDcTHFtZiK2BAXLUFduuagpQvQMyXDyO
 NtI6E+7sh8OA9DrtQ8qMLYk59T2dt9M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020141

On 9/1/26 8:41 AM, Imran Shaik wrote:
> 
> 
> On 27-07-2026 08:14 pm, Konrad Dybcio wrote:
>> On 7/27/26 4:11 PM, Imran Shaik wrote:
>>> Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Lemans
>>> SoCs.
>>>
>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/lemans.dtsi | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>> index 3b0539e27b5192582e0bc9ea248f1c0382e05030..e225292a1e41a5a313aca188ca04bb12474995e8 100644
>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>> @@ -3023,6 +3023,17 @@ pcie1_phy: phy@1c14000 {
>>>               status = "disabled";
>>>           };
>>>   +        tscss@1c80000 {
>>> +            compatible = "qcom,lemans-tscss";
>>> +            reg = <0x0 0x01c80000 0x0 0x2000>;
>>> +            reg-names = "tsc";
>>> +            clocks = <&gcc GCC_TSCSS_AHB_CLK>,
>>> +                 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
>>> +            clock-names = "ahb", "cntr";
>>> +            assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
>>> +            assigned-clock-rates = <15625000>;
>>
>> I'm guessing this will only ever require a single rate - do we
>> need power-domains pointing to one of the RPMHPDs and a
>> required-opps reference to match?
>>
> 
> The power-domains/required-opps are not really required here, as this
> clock's rate is at the lowest corner on the CX rail, which is always
> kept ON.

The clock plan calls for SVS_L1, the RPMHPD node also defines SVS,
LOW_SVS and MIN_SVS below it

Konrad
