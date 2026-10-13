Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCDD24A06D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904616; cv=none; b=AsIFDeoO6DhekQz9TUaDtH5dZS7DrzjpiejLRu7FFvn2arAxxHN5P92K95SqA+tYGNsZnsmkMyh3Ubyr++80/J4U+pXuwhA+b55PnKavnyGuLYnrM4SsQRintcNKt7maRcFJzexolCRhUSyFVTMYvAp2a0bDmjD5iwOKOUuMh6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904616; c=relaxed/simple;
	bh=B7ktLQJ/pNrrqvewQaWggDr4aYPF+wQWTdWkQGGLAWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kowzShFL3CYXjTYO+KxbTiLClOOvhNDnHWn0lYYJVQNrfsGAA7n6qzRQomMOTvWz2qQlDvURZocKe4crINbvzs/4e0lyY8ghfO6X9OKBq0j7zocWqudyItE7Ry3bbbnORkRDTptprBNyyGKevJlJb6Y1nK/rP6IFUyuQ0tPrbO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkqT7zeJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJmnbFQM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkqT7zeJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJmnbFQM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE4dvu2512239
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	El24uVnSEY32uH0Qk2AIcyciDDvjht45ElBt3XamHQc=; b=IkqT7zeJ/WV6RFxn
	8ALb8LMf3Z3JLflpolgcgstanzuAS+DR2dMKQ6gbYFPeD7WiD4dLmHdg1veRtWDi
	3mpI3GRfl56GPgiDFBEEykv3qsMg3Apej9+si01FB+BIq/AwXHahGqhvF2qjRaCf
	QA4VX2Yqk2HdJKEc5Hyi+qBzq+GOKzdZ0FgIVSgY9BzIZ1HTyi3I6EMuMO7eUfoB
	WQmP2KXMfg9ljxOHrXI/kQnPSvhXDeax7t4DeIjZmiv2b5mRZMKNOVyWjEFbY1g4
	u6miMTzH/O4oITWgqCAUD2aAVVm/lg8GZl+loXaWXh8IJMZCwEDa5+ApIDXdwVrU
	vAD1Gw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1up2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:16:54 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4574f1cac98so5341734fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791904614; x=1792509414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=El24uVnSEY32uH0Qk2AIcyciDDvjht45ElBt3XamHQc=;
        b=LJmnbFQMwaRwmK2L1unfuEP+TCW2WnN+B/XrWkczhbjO3FosrSNt4UV+ZvOJqCvUCK
         RZa1/dFD3dt9ex83UcGDrHnDnrCP8JLNwQI9qR32ssuVnIUTlD6m/rQmi9p8p+zVb0my
         ccys+sfoDJ6c94Mlg6Lb1JVBmaLQgvQdMJIoX+3ov4QerFkbOwSaClHOqFObqTFYb0s1
         vY6Anpe2Tgm7wFmx76nSXyRC1tosy1YmT2WGhJAifF9Bvx5tdqZ6Zayyet3CJzcDTgp8
         T+nN7L+15mp8S1QHK/6T56PDBVoMpqjQb8nW78p2mnzgMka7q/Hzfg6En/E4f4u7NMik
         9tBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904614; x=1792509414;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=El24uVnSEY32uH0Qk2AIcyciDDvjht45ElBt3XamHQc=;
        b=levMyKNsykMSt0dtDyOL1pN8JJJrrPQ3T88Jyzu0aA7bzXxonpVy4aEDY11R50TmDf
         0/jcN1/4cGJWom0YublLZnl+mjZrjOdjdDvEoDfY5JChgoIkZYFkATr43/AOdXZINO1i
         hDN0P7E5SEY4kM1Rxg0H89tZgL5gmk0Fi29kG4T1aDfVv83CGDgAFgdEEOyDhfgvDJVb
         kch7YZp9/UMT93nE87vYp/XKDfzM56/z/4O+7A3dt4ssqxbmPOcihJxx3e/byvn/UOIe
         i4gs4+m1eqJAnEGDxHD3irw+8GfZmEFnI4lkHAMbFHeLzUahTQYUaD3fk81eb482x0kc
         O1SA==
X-Forwarded-Encrypted: i=1; AKwUvBx1/68GXI8G6pmzXvt07y7UEkY0fewvfHgZhBPdhpeVc11ny3Vya5TI9KMY5n1KHJaBwYzdqIU9zFWQONw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+I4UlQFluSQzIZQK2RUfBRSyLg/TDb3XWVkg3iRjuo3dqVw91
	mEajY1xoRGfOZSmHXZNWbIEITafrJM6s6Bhso+JTve0A7Dq1n4+Svhnmye9SKXHJH5B0w+usPsA
	QotaiI67VPnvbWpt29uFR1Vd/KC3xV2MwWL6RxQ9td2x2z3qTYnp953SmYIEf1Iq2qdg=
X-Gm-Gg: AYBFou2wdrLFoE66cmRflqrZm1bbLagliYskWnaaCrGvosj97GNscrDyhCa89nu4w6n
	hezBWbCl3IcUOE0IaHBEky2VlugfDG5gwMbXJCtHWMbTukVjyoy9PJEGz1vdl9rNbScdCgRPyq+
	q61PZ/Tsexu06fdIELfCUTl2ittzKd99ysYKOwborH/LApCJqpnLfdijsooOyCQWslELJJoSFBj
	495GNsN4EQ9BTuonT4U7Q2hm++MAU7Q9PbjEuNnjzcpSYqmI5mYwnUcOniP59acrx+e3p8/EOCB
	FuUbRDk+uKRcDYZOrh/o8IaQExALTeqigtSBIP/yHHrjGMdLfpEqjP3uT9MpwlsHf344ka9ad09
	8WF6zVyn9u5tnXDc3sIxPoOCz5Bq1CUi2kG38rg/Cicw=
X-Received: by 2002:a05:6870:8127:b0:494:b587:7fa8 with SMTP id 586e51a60fabf-4a2a896dfb3mr11952833fac.12.1791904613900;
        Tue, 13 Oct 2026 08:16:53 -0700 (PDT)
X-Received: by 2002:a05:6870:8127:b0:494:b587:7fa8 with SMTP id 586e51a60fabf-4a2a896dfb3mr11952794fac.12.1791904613437;
        Tue, 13 Oct 2026 08:16:53 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.129])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb4e92asm13166fac.6.2026.10.13.08.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 08:16:53 -0700 (PDT)
Message-ID: <78480c25-6d83-4e70-a9f6-826760046cda@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 20:46:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-2-77bd3d68d850@oss.qualcomm.com>
 <5cfe6767-9097-4005-a78c-3066a2aef1f7@oss.qualcomm.com>
 <3fff91c4-b831-410f-a151-847ea407acb2@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <3fff91c4-b831-410f-a151-847ea407acb2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace4b66 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=vSQal4Cqo5fxyC+YxRTyzw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hj7ihxJC1nvnysMjlhAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: ukYONU9EYgH49VX2hD0TjXSgQSo9xj7e
X-Proofpoint-ORIG-GUID: ukYONU9EYgH49VX2hD0TjXSgQSo9xj7e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2MCBTYWx0ZWRfX5LYWs6C1Mzyl
 6zHDjzHNy64lWDImzYyVri570kk4FPAmnxy7SRnwgqFgwAS5bdNCvfuYzPrIMtllggoRiiXzcnw
 9SQdLLYkOVfSejSEutMS0xtE7C54m8Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2MCBTYWx0ZWRfXxCfu/PQqYdmb
 us7X/+dC8APE+4vi4TDuD0aqk5FZ2F4VNICtNBs2jy9gSIQWM6TdGgh2WaovQUnTnWvhL9JU7xb
 /900uaiDFlgorLtvwSbUylcGsyk0pK8sJdfpjx0hxt6XUpzoHxeuhL0lV8BhPihO1iejdVVHdRs
 CB5py+A4nfpb/UH7XH8E//AJrQs1HGH0aXrxw/3iAW/FAhIdwqzU12tEbgR8XmzgQKOPa+SeuZS
 PH5Hu83g4ddCQ6NqQJpsZHKNl0xJzA3zNvHpT9CLhS1siLxQp9smWEjj3+PL028IRkGUaVaTaUR
 D7L0BMjNKXuospp4wAhQLhyWutRpMhYCT6vNM9M1eObkeqSOqPDH3YmbK7Pp42lvsKfuw7VizrN
 LBGmC6QtSKfOy6ZcoIjnCMnRf0t3VSVI/KdQd4YU4IAc0jS6ATZfcL8EGQ+7hpn4ttcYURLxqe1
 Ao8F/d4M1QSjs7oHRyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130060


On 10/13/2026 8:11 PM, Konrad Dybcio wrote:
> On 10/13/26 3:14 PM, Kathiravan Thirumoorthy wrote:
>> On 10/12/2026 12:53 PM, Varadarajan Narayanan wrote:
>>> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
>>> share the GPIOs. The board has to be reworked to change from EMMC
>>> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
>>> and include it in variant specific DTS file.
>>>
>>> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
>>> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
>>>
>>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>>> ---
>>>    .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
>>>    arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
>>>    2 files changed, 211 insertions(+), 64 deletions(-)
>> [...]
>>
>>> +
>>> +&qpic_bam {
>>> +    status = "okay";
>>> +};
>> NAND is the only consumer of this BAM. Should we move it to NAND DTS?
> Can we enable it by default? (i.e. is there any reason not to?)

I don't see any reason for not enabling this by default . Since nand is 
the only consumer of the BAM DMA, we enable both nodes together to keep 
the unneeded devices in disabled state.

>
> Konrad
