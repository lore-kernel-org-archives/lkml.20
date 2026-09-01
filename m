Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22E33A9612
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266397; cv=none; b=NpLTkOiQipjmI9DhM5ouVNYvxISDbWZzS0OkyP95hEv9zpiQlrdTHIIm6phqAIb6dekNSEM5HzYFeKhYGVM1iSBPz1Te1OURHnjBhxyEiI3mdDXkncS1Hd5CZ9k5ZvYbOy4IhtFY14w1Lg8h8TWhuKaaUxO83OX5vFSFxse8V0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266397; c=relaxed/simple;
	bh=WoB/OmRTJJSpwrFDmSdgZWJFQWCDuGhALHK9eDbmU5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHvmd+tpoP3MDtpT4c3oDpkdJIuXb1yT1nnNbYmYeI/48a6H5h6lmSkawjcH89zoIgfidbnLZNvLbBch0V8QupQ7GBv8p8GlYp0KCrXL85o53pCuIcDTlb/c5mSFtWjwww/z5TyY8RI0FFslAEYYr8HoAcN5r0r7DhznPc/9Ho8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cC9zX2zh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dUY/tBSI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cC9zX2zh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dUY/tBSI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJcKH2141615
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 12:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N1V5W/dk7uvrao3kIiYVC1yNFS+4miACgUKafvhC/tM=; b=cC9zX2zhsWv/2iHW
	nJz+YIv6Xhm9qbdp8ujaUqDifYvrkHk+jbv3mGUnOGkGexcckoGlV5jL+W+WO9My
	WuTbxpzrWVoEOo0RHQYD0xJFqIIebBaB7+TCoRIL/yngwCvk02qzd8oZJO+ba/9C
	AWvp6HEMqSEI/exf/sO/yAT130uNYmCgnwoBWhzxzuyvJWwEuRL2Buf0y0GfDJ72
	yV7adgL42wztd+jJ4VRNVozhKBjrhnXXlN8Bgx+s8J7Yr+YRvDrGIZqxEterP5SJ
	3ZLhu5LsaqX1GaO4nZunfg3lB5oOjQfTcH1pZZFDylLcYXg4oSpQccig+KgU19pf
	waFzhA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8ft93n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:39:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90520763ceaso4510786d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788266394; x=1788871194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1V5W/dk7uvrao3kIiYVC1yNFS+4miACgUKafvhC/tM=;
        b=dUY/tBSIbHt2n6FLodAI0LA9yXQrHERH/l7Q4goph9ijFlHFGm42bm8YehiF+0qHTz
         5LMcyv3//lnmYMs9LVnAUuEcnXHYVTclUgxjs4nOqJXbcaIrNzijLBVNivo92KW6/VIN
         I1uxOGqNbF0F59+xBJdl9LpE5F1V8Ml2d3CWJ4BIdsjUhTNtKstzBp/cJSu2VECxrDF/
         X+xmqCmazkA16CilfZWpXPJjZAL7bblTrmU8YIpfaJQ2XcBaYMeD6mGkf6y/G0eBmYbD
         YluZdGzhD59YlASKcHUPWucXEYwKmneiVjYAuICWJUsjPtyOwG06s40O00h2P5C4hjfB
         6Bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266394; x=1788871194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1V5W/dk7uvrao3kIiYVC1yNFS+4miACgUKafvhC/tM=;
        b=YKxpg3IYBptWcCTxzuPs4eA0zqTlul9vNROYYbOkA+WR1/bcq0D81P8dfD9k9NBWXA
         VJainzuRg8wY3APgDuG1AuWDWhk43kHDfUCkrFa6QxhsTwTMneXMQHAtvdX13MaNCv4r
         PrtuFjTcb+ccnJNN/Wwn/d6t6AB3e1OeJ3jAxAirZtzttrq3xrson5MQuxUyfHn0U1x5
         gYwvwxuP1NLWkPtNEnbimG22jHjKkVKsNbAm3gHR77PoLp73l7l2BEAyLLbIR/CjIYuc
         ZabrEzVP9txq5aWt3vS8im5sTRUeB9F4DcMg8PiWchG0HyM+4v8EL2C/LIIEkfX/2NPM
         xibA==
X-Forwarded-Encrypted: i=1; AHgh+RrqxXeMVYu6BCw1IjmfA4gsLGtjgdpOB/9zP40074bY7adMb83X94MZabXslH5BX/mG8K6kBq9M2Gft3pI=@vger.kernel.org
X-Gm-Message-State: AFuF++mc48Yk7d0A1yvi72h/mUR907ZWlCgj08GpPiqeBRx5DWhQiTvp
	Jdvz3UVVuHDi6pJfrdrOhLD5jbukW1C+C26/ZGVnwRq01aMQEgzIOBcPGuJt0xiy38Ft9YalW6N
	KoRqXkImXnT2N1DdnQY1YLE/CWsHf0/eW7RUmiyr+Cnelsj7BV2nhGlMUWURXRjU7pJ4=
X-Gm-Gg: AR+sD110Z3bmbJJHfAakcjzVkDq98OzWr1yMF2FQ1Hxfze4/WCg5r4XdrKPs5sQDcvg
	I2yFzBw+kMeoI7u7Ibmxj/M8hbRLkRnVtrmXYCPFT/tqpJMN1Qf300t2TYpWUCKkr8lNKxUgZp2
	DYJXJfoj4i5NnnAvuSX7ZS2wp4arzV6jnXR/PTCtbrywuZdiFEgXAZaT5ld437Y/+LUActZ7zTc
	NEbN/1Z7+zeoz7iOYyz1XStrqaToKLjAbaZBWVx2ZTgw6gRIT4hM4h97h+gFVvXO/YhrBWOmBKH
	bspdGlip47kSmkb9VXA+QOJZm/0v5XJpsAzd+nhhTITTWs8VmT14Eoi21tceTMg2S/j1rvf61LH
	stgj2RmkZWPId8KIpYd+XzQ==
X-Received: by 2002:a05:620a:f10:b0:939:216c:59dd with SMTP id af79cd13be357-939287b1e3bmr1525533585a.4.1788266393548;
        Tue, 01 Sep 2026 05:39:53 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:939:216c:59dd with SMTP id af79cd13be357-939287b1e3bmr1525530885a.4.1788266393064;
        Tue, 01 Sep 2026 05:39:53 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a66d052d81sm760433a12.23.2026.09.01.05.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:39:52 -0700 (PDT)
Message-ID: <74c0fc35-a56d-4297-9fcb-23e2df8646c3@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 14:39:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] PCI: qcom: Block accesses to downstream devices on
 link down
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260819-ecam_blocker-v2-1-e7a8fdc1c5cb@oss.qualcomm.com>
 <178826612782.58092.15490835074765422013.b4-ty@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <178826612782.58092.15490835074765422013.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _WnhmkuXP8Zl6y5bR_jg9qpc2BH_8abH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExMiBTYWx0ZWRfXwEhs/J+ZfJ4E
 +BiH6t+mjNGvtlB7ns8LQkKJEVnRlLYHxblcVtbzJswDg/uPEcZO1lqQkfU/KcwKOuo/l5mhlIW
 i8BYDPmeKFANMuyIbpk+b+jQIqLt1i4=
X-Proofpoint-ORIG-GUID: _WnhmkuXP8Zl6y5bR_jg9qpc2BH_8abH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExMiBTYWx0ZWRfXxbqatoHQ1q2W
 ffv7HyJRog/wFPq+8qgqhGk8I21d7iVCYw44lv3PeK0aiX+GQCwWpyIdooYPOZ+/vE5kVoyXqww
 aZ7AxBpxwjm8L5G63K/arssKViKc1ZnNWavz94vttA4sLcWaH/CtUNGYtevbd3ZdFNl12HYkdf1
 VV8N2aXCR0lNl7HiXrb79c0PnzMHIfWztsTrhDIPWl/aUlM+fCIGWbt75zWDjLWRnIZmSFbaZ6f
 21gas0tVuPJhv9XB0fYn5/uba9VFVnM/4iOi1VM9MlN53BoA48iC8MsbdcsRxp4On+I33pc2yEb
 gHwS/4EQI4iJhK0tnCAc/5bcHm4Sx2VdEKlA96ixCEKdDiX/GOduT2iD0E2om9mVJzULjc73XNJ
 DnlBLvq2zm5i7TkZzHKo9WnvTVnSNEEY6GTUJvCSshGZ3TypudtfNwKg32JucnVk+XHrxWKvqCU
 IUvvJlDyU0UbYH20mVQ==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96c79a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AFY7VbZHp1LxXVr_yegA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010112

On 9/1/26 2:35 PM, Manivannan Sadhasivam wrote:
> 
> On Wed, 19 Aug 2026 23:36:54 -0700, Qiang Yu wrote:
>> After a PCIe link goes down, software may still access the BAR (MMIO)
>> space or configuration space of devices behind that link before recovery
>> has run. As the link is down, these accesses never complete, resulting in
>> a storm of Completion Timeout AERs.
>>
>> Use the controller's ECAM blocker to drop these accesses to the PCIe
>> address space as soon as the link-down interrupt fires, so that Completion
>> Timeout AERs are reduced. The blocked range covers the entire address
>> space (base 0x0, all-ones limit), since the Root Port's own DBI/iATU
>> register space remains accessible regardless.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] PCI: qcom: Block accesses to downstream devices on link down
>       commit: 86624b718f94517b26f96c1d7beb7632e5562afd

Could this be a fix for

https://lore.kernel.org/linux-arm-msm/b461c125-947b-4e06-b502-abb354e0cba6@oss.qualcomm.com/

?

(+Xilin)

Konrad
