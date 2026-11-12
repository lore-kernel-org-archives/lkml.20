Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474960;
	b=EMMS+VN441anWfdrQfAcpb9NeEwl+jEh3H7gXyOV3BRn1vp3TCD5xCgbyo9WGKE6hBpD
	 oc9ci/PcAE5xJDs/6S9qSwZeoCfiuoxkgNJk+GLmwj6GW5XgeAu+rASCMEabDdiTlayaM
	 Cas9w5z/y6PlL9tKkXr5Dj1GTKr9q5AOe67hFanlfZpMoDnbuIXwNb5gyjgpcnW6C6EJl
	 r7BfQ4Wnhpr3rWDjUovKHiB2PN4N6tzqW3AQW7YrLr5fnu6Y+/1l9oFWisXg3Plc68sXz
	 lS9hvO7k37Mydlc7wYvcVoSZHkg19VPFAPFBxooqvngG8HV+KOl+2P5yeQaE+AMssfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MEnoxCVc3mFsHG46MOit1/TCAB8kmZyxFDbzRzr1Hwg=;
	b=DD/kP40Jp+pKrazTxxrt3fDIJdgLecUT3D2zHW6pgNM2331yZNRSozO4C8HNu1ftpcFU
	 XZPf5pqVfCkNrxJC1XwhUxJDn1qUy+Wr3W0SowPhxndWI7xrb90vrVeJdZEB7FrmLmR/L
	 gQEkaDLByPcauaCO6TUG3+wIJVA4sAog42l1TL26x0Mf0iovoHKPY5AN2W5JD+RXx/mVK
	 zHEvxN7KS3bVgzBgtWSRk86hxEmyfQrqNEnbo+9milaZWHJ0P7zyLPbqM0EpQE/ijdYss
	 gZYGgtD3sRqIv4VJQ00taZZBlhOreg1xA+18b1+ZLq9c2hcyoBbUcI+A9EZ6Z9Nqtqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqDq8bmM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z1yUwpIg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822DC606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 822DC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqDq8bmM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z1yUwpIg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9E8SA480590
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MEnoxCVc3mFsHG46MOit1/TCAB8kmZyxFDbzRzr1Hwg=; b=PqDq8bmMBO3nXfxg
	aSqmeUQiTKT/yujxY7YIbp9ISBVRoCWHUkhBG+ZQW4PKPkfKUY6STNVS/L+1cxYz
	SNiRyHQZsNJMbiALMTPbQ0j8zArDup57HdMCO+HOUWfiN22b5FdhaAf0DvFgvzpv
	npm8GB+mnNKP2Oh217jLN4ZDXKYtAUvhGbgEp55P/JIwbYxTgO+tLRs4Fg4hn2tQ
	0p1/xxlVKRcr+K7krvBTRli16kzrU8MMVPGSiYH+051WDMdIWNTTOiCgnpPLm10g
	a/gRG1BV0URfMYAoIzlhvxcauWH7j3mxXieU+idb2B0ulluVgS5fGMJ3Kr8Zg5sF
	Sz/0Hw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwan4r07x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:15:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so2770863a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794474957; x=1795079757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MEnoxCVc3mFsHG46MOit1/TCAB8kmZyxFDbzRzr1Hwg=;
        b=Z1yUwpIgZ5OKhJJroG610EXma8lJiCg/jLUvWXgxwk5Htt2oMWZBVm5gRp2E7ixvPp
         xl4hlk4BX2M6Elri0UjwpXXKrlbOD/5geTU3ibUB5HMHymK5CQk0SCeTrdQgtOnJ9ibo
         3iPOhQSHKe/26gbdJrFtmpv2uagIu/VWbzm2Y0UJubrRwLw4CU26pap2PiMOPulCB1Rv
         D0JQxsofS6h9ts2qGLhkEUzZ28FTpeyDiASrNgApPBbMrP9qCHNAw7YlFuJ1UdyVlckD
         RLw0uEbVp2KZ/V4TolRAHmQMIW/wDm4TDDuoLTcyCPz4gmlA11sG7+vNpSclwaOjRfpI
         YvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474957; x=1795079757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MEnoxCVc3mFsHG46MOit1/TCAB8kmZyxFDbzRzr1Hwg=;
        b=rC5yQvvQuIlDCKQSuna50vWJlNUP97i9wMHLBQsUeCgHNL0wkPKZsdcNhsO0KMQ7xP
         sfTPlIEiUfNZ9qBQe/Ld78QQeuhONUxBvXdt6gRIFfaBxUjC8jjW8cipYq5YRNLZpSGi
         cshWyN0qUVRdyrSgVaoLjoWCabCh2GgqCnDWTxRoRHG90syFBcXIpiPAqXDnhE1lazjf
         BGzuDeXkTpL2cGp/fVZJhvquZGWBlwqKRm2h9kw5BrlkzKQTBYoVmclBDhj1cLavKHE1
         5UqMZ5h0ZIXRtV7+9IFRsJv3doVxe/cB01SSqQy6bE7ytUqgbFOu7iIev73HbeB93u/+
         MUew==
X-Forwarded-Encrypted: i=1; AL+hErHw4uh2vsDYzq5OHi2WICuMplH/39whYzbd+KBa8t+rIGvE0h+nWVCV/RUTup7ULuUS6LDNTDXSaJrZ98k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+36sadZW45Cx8Ato7I+eVINKqTOhmK5Ye4bwulQcZgJJDLpCkk
	zVrOpWXfMGPYe+xyOcsKZudMhONvm6yfKuOlvccd0U/Dqez1mxVfgw7peQpYaHypc3OLQ3SzIJz
	OlIszG295EujrrWiVtkUTq+YOMB6UQXrRVVTFqguLXDGkrx32jdswU/Ug2rmZyj+RSoc=
X-Gm-Gg: AYBFou0DB7WJowGGW8guoMvmKW2X6deNyrGsyOx9O1Gl7gOaNssKxP5l8kMqND+fNO2
	bXAlXx4aREgYDj4GqMwyZ5BRv2GUh4OXET8Q2gRYBlEd9uoZmyv+tBwy+3oNMr1sLvRNtDYY0tK
	l3+WEww2kndhFrCFbKWqJtX30ilE4VruvZYARqK8zQ16CdTibbTMbfVmQXaNLgAw/pI93uHBKA0
	XElCJXmbrAayFtLXCs4MV+67INRRu4gD/LHydBrs+VSpRTjNZ9ir0AMwtsMu6BbnDy/vqC/8AEO
	4o04l/pHjrIzwFXeL9JhTdRJR0HX7yZm4ojreoboMAWbqSzVQjHAkiQ+/rGb8BazARuNJQqjUaD
	+EBtWUB7F+ZjYxWbL2CstiRWB6DdkYZo2JOyZvv0PawAJULZRgDPHgObpT/+mkBCOi1gs+wuwmq
	rNX391EvkGXx01yy355eBjtgvcLz2Z7oNURtLShMSO
X-Received: by 2002:a05:6a21:498a:b0:3e2:b295:7678 with SMTP id adf61e73a8af0-3f2fdfa38ffmr4070804637.50.1794474957497;
        Thu, 12 Nov 2026 01:15:57 -0800 (PST)
X-Received: by 2002:a05:6a21:498a:b0:3e2:b295:7678 with SMTP id adf61e73a8af0-3f2fdfa38ffmr4070779637.50.1794474957003;
        Thu, 12 Nov 2026 01:15:57 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bd30c8e6d4sm1051351b3a.48.2026.11.12.01.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:15:56 -0800 (PST)
Message-ID: <6ed0793c-76ce-4d04-af5f-8987311c5c0f@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:45:51 +0530
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
Subject: Re: [PATCH v8 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
 <20260913-eusb2-interrupt-v8-v8-2-0f505b9c394b@oss.qualcomm.com>
 <asNji2_GUda8x245@parshuram>
 <3a3cf540-816f-41a3-b31d-2902e7f4cf01@oss.qualcomm.com>
 <033c8432-4a03-4f38-b0a3-28f5d551b0ef@oss.qualcomm.com>
 <avV4B4g-NWtZbLuX@parshuram>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <avV4B4g-NWtZbLuX@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cfvhQpECZcg83vnIxigigefU-Acq8pLQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX6Y+9aJP4AjCD
 Efdv8w2Wq6XVEfFu+otyFka8Xad8WBoWRzSnbM4iF78KpEaegqBIJuYZ77xKQXEJExOMYz/t4ee
 OUBP/8DP5IrnoUFAMz+uWK0CBuzA1so=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX1DQUGwWhID5B
 3G8SpjGzCtwk+a1kmjyuywPn9sOF+qftPbIirwX76CTpAt8eCm2xaQzRHis9C5zg80y114TAP9s
 GvhcpNhdm4MH7JOEHA3yIMM5MIqQbyBPFmjvzUXsSrvIqWJM+Z4caq+e9mxX2cBsuUToRHOi/zR
 x6W7IoDtuB5p2tg4zM9f7H3O3Pe3ru5rdzT8oXO4lqT/P5gie16F8CISmMHhVb6FUMYwcR3sua0
 2MBlrey73ApJbM1DuF9tm8epvjTfsda2evu1rhyn69VNfRmuUvs/Mo6dwRofNifeXYym3s3hP9Y
 2dffaZqbPsh2QWKssf1QNM/qJknottyz0DGtfXcAYjgl2vQMTRqk9qInLYAjH0/cFngSr/2jvi/
 rVxBoZtKGcW8ISSPiXmDWQIfji4iS5fxOOUvLpD89CSWkLXLcZ5Fjm0KqttJCmv4nnpphqdsAFu
 5a6b20K5FZhbOVOsURA==
X-Proofpoint-ORIG-GUID: cfvhQpECZcg83vnIxigigefU-Acq8pLQ
X-Authority-Analysis: v=2.4 cv=Gd+CDgXL c=1 sm=1 tr=0 ts=6af583ce cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=DY95BI2w6Jwo1tMKFB0A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120036



On 11/12/2026 1:55 PM, Vinod Koul wrote:
> On 27-10-26, 13:37, Krishna Kurapati wrote:
>>
>>
>> On 10/9/2026 10:29 PM, Krishna Kurapati wrote:
>>>
>>>
>>> On 10/5/2026 2:14 PM, Vinod Koul wrote:
>>>> On 13-09-26, 20:10, Krishna Kurapati wrote:
>>>>> In cases like USB High-speed phys which can be either USB2 or
>>>>> EUSB2, it is
>>>>> required to know the type of phy (rather than the operating
>>>>> mode) because
>>>>> DP and DM interrupt lines need to be configured differently for each of
>>>>> them.
>>>>
>>>> Does the controller care? In preceding patch you defined the EUSB2 in dt
>>>> type, so this describes the hardware. So phy knows it is usb or eusb...
>>>>>
>>>
>>> Controller is agnostic of whether the phy is usb2 or eusb2. Phy does now
>>> its type, but it needs to communicate the same to controller.
>>>
>>>>> Add support to cache the PHY_TYPE and add the following helpers:
>>>>>
>>>>> - phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
>>>>> declare what type of PHY they are (in this case PHY_TYPE_EUSB2).
>>>>>
>>>>> - phy_get_type() for the consumers (like USB controllers) to query the
>>>>> type of phy connected to them.
>>>>
>>>> I am not convinced that this is the way to go... Driver already knows
>>>> the type and should use it...
>>>> we alreayd have mode, i am inclined to not say yes to adding type here
>>>>
>>>
>>> "Mode" attribute describes the current operating scenario of the phy
>>> (device mode, host mode, high speed, super speed etc.,). But it doesn't
>>> describe the type of hardware and hence a new attribute.
> 
> Not really. A combo phy can be usb/type c and we do set that mode...
> 

In this case, the type can be "QMP_COMBO" and the mode can be: 
"USB3"/"USB3 + 2 Lane-DP"/"4-Lane DP".

QMP Phys can be Combo/Uni phy type but the mode they operate in could 
change at runtime.

Regards,
Krishna,
