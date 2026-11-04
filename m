Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801481;
	b=O0/vOqNAxLFMrqFf76bT+PHtbuoSC8+Ga4FqA4zmvDbBDt+ZagnukQjA5UFBd3X/x2EK
	 rgEDL2tkF+iCkcfJRHvvEVcQotWfAEDNX29r5T7ZttgQ4BblEsQMp4FNBI5xhABa/zz6R
	 IS+MmQ7sKB+9xj5/2aeQd8lc/HnFZxuZuzMO1YBHmEzBGoavROeKSySYJ20zn8tCzTLc1
	 mPMkDdjg868eAlvf+Ry3oLfh4KjkfUZ0c+GZV8zurLbWcARB3AVVqXHW5IuxFe6f57K65
	 GoN4l0jJvg3t/5tGWrS6csoRu5LBOyT/tHOBVzYzaMFSk7s/BpUXXKQCkX9jiI28nUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801481;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uF5ryn8Iftp4OJ1P9rbWQ0MW+5o+I98321Jd9dFZUmo=;
	b=QCmOi98mBfvQfJUuFqxbrKeYydOvINe8EmQy8x7Ztj4FIaH961tyBV0U/RD1sSr8vuDH
	 qcTHZ6W4RD3zlHPoe578xBQKk8m/41fie4fN3QaS2B70gDmJ/xmIFisxD00a7use/pBO+
	 SCDK1YSR5O1+cb531vLbaLnMbrDTCoRjL7SraQf/Z9Nu3UAV6w3nOucvBh4oz3/nWmZd/
	 /xNGMS54iEtbB9G6RintrbzUokfKfnbNPhyOxpQ7II01BiI7sPfu9+5aPPoAQF7IIJekm
	 2QGmdAlXG1dnkLOeq+z89F+n8BUTOIKGtXADcrLH5JQhBMGvl5Eze7lRlJInbCgkarg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fb1F15OH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kLJpyCFb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785B2606D807
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 785B2606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fb1F15OH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kLJpyCFb
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba8SR2284431
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 14:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uF5ryn8Iftp4OJ1P9rbWQ0MW+5o+I98321Jd9dFZUmo=; b=fb1F15OHIyxjqnI2
	B1AVC2UzHx49xheCQUsJRjmGX0wCu0DPOG8GDvB/B6ydN+7s0zae9V6p7WgQBGqI
	SxGsSXZk55rwdjnBvb2epitvOKEGtqAbWytXFne2Dn4OMxyjp0CiB6S5SByuI68u
	9wRBWvlC/HGhd4HVb/Avs/RCVW09wvRXOSUrxjZnKH3YZkem5hwBYbwQmxdHnszJ
	OxSjp8DewqEDBScTMQ7mcZOMWbOswTrGio3QrUXHOOUNqp7m1yge7xCF+gFc9ajt
	pc2y6yZQAQ1j51Ny1DS8MI/r/r8dBwGsQcbTtHkW0xKaZ2YHU7CXzEdzv+DodCaX
	hZVIMg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284s14x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:11:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e95f8543c9so9367405ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801473; x=1794406273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uF5ryn8Iftp4OJ1P9rbWQ0MW+5o+I98321Jd9dFZUmo=;
        b=kLJpyCFbkNNMBdl/XJl+qxbjwCEesgtdAyEOr9F7oE4LpE9WeRi7jLqoif+C9ZjFIn
         Q7Zi4wZxt4FGwjUuKc8Ii0ItsYERHLAsIQ27fXm8Jw6/ZC8+skxvFRGNS3c7fxJrvop3
         Gehy7zuc5cjR0qmc8jUxMaGdGuThtaw4UqA57DbLhqv8xcK6qb/BFKyauhvxBRKGIZk3
         MZn64Y4Rf/8/zyblMa+CwX+pkw6KMeIGnm4+vQwtXBqKHVODvN3bUSXz+I0OA/9lNmJD
         pJyaNy1sqidMSVNXLpTB5FAUXfrnmm8W53/UcSU62M+94PO/VBB+JulDjFYOEMa5Ksnt
         PClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801473; x=1794406273;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uF5ryn8Iftp4OJ1P9rbWQ0MW+5o+I98321Jd9dFZUmo=;
        b=Z/6AlNumPcbiKpKqgH0xOVzRhGkQS+PyG/rso6jl/tgSTwtk/HS+73JSh45U0oMw5o
         TdZCUY+wCN/Ek1XR2InYJRj1bI/246euMApQwTwZZ772+L27VHB07xGKqkAeB1TiMHML
         heHCoJYZ3gQ8/wfdTqsHHshgJ76c6jxTGe787ZZD8AXEs81te3a0BFuduPbezZScjdEV
         8mEfDR3kEKYlH/a6wEibETWxsFxZadevAqDnJ8TxfUp4IwZcWERWAPcgdqH7rXoK711E
         h/eecVF3Vt4o+cjWQRRP/mccqsYybbmgC6axbQFLhgm9xYevgfQ4He1M/8tdOK9PQDca
         X3Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxekBzJtxsn/J9/dN5fVUdR6Bk4lz5ov7ubQnqeOqOBcvmRwowA0/dpeZo2MyAjGPKTCH8r3ELigSWq6pI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9mYCndnn4kOgFeGOgMSJvnGkHJx7YeqFim86taSMfMy5iCXnG
	7kNw6hXYkSKmyqk/GH3EZgaO7m3od3qiBZVTSMaf9Zxp2R05JOX8SJhReMJt6e9Hl/+KWIGC5nR
	gLJma9ai+qHOZgD/koG1vdJoReyxso1eaisBVqDow2OhEiF20LZUnU5umIPX12H3Turo=
X-Gm-Gg: AYBFou3JcNfh2HYJ1pLMGPSv09vMgbQgal9pzSuYilAlkX5VMFZQghjq84vCDWfgsyj
	o0+vEylyBXFr2QK0P/BY8yu04NGGN3TnZYrEE+qK0nOS5/BcTJIkdrCRhejJKE+bTBLHfMbuu5r
	CxsrebrgtCU2Fo1lNxOhpcZxrs8NWP8B/JxdRkBpd/ZZSz9pMIn8GQUO24vCgnHO5pd6SB573u2
	CED2zBVFCcYHn82MtfMAEcysxp8RGf0GiY2IyAN8FUHTS8vCcVhQ9enSwxYJJ2CbaBB3KTf9nLF
	8hTFoiegHVLZINsjBU1foSxHnAizZaLvY3yLP2WKulSLB9dPmUFtp3bYIfZFI+gKBM+AuEhiyHH
	reV8ep07uMJ2amyP5MaOKkT5Mp+g9KqnNPkxs9J7maa9YTpfXPH4UdVqMd48563TJokWVs9Fzbv
	KfY953DCuSBsgxXxNr7vrRSg/T5SajHIUsIU+lCGo=
X-Received: by 2002:a17:902:e5d2:b0:2e7:e73e:7091 with SMTP id d9443c01a7336-2eb364bcec2mr173883075ad.31.1793801473002;
        Wed, 04 Nov 2026 06:11:13 -0800 (PST)
X-Received: by 2002:a17:902:e5d2:b0:2e7:e73e:7091 with SMTP id d9443c01a7336-2eb364bcec2mr173882865ad.31.1793801472460;
        Wed, 04 Nov 2026 06:11:12 -0800 (PST)
Received: from [192.168.1.2] ([122.177.242.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe4fc8sm8301675ad.16.2026.11.04.06.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 06:11:11 -0800 (PST)
Message-ID: <52f002c4-9462-479a-b915-149373d6ac46@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 19:41:08 +0530
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
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v3] usb: dwc3: core: Fix RAM interface getting stuck
 during enumeration
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260929-ram-interface-stuck-v3-v3-1-0d1a54db233c@oss.qualcomm.com>
 <d45f758a-8d00-4f76-aef9-7364156f4ce3@oss.qualcomm.com>
 <as7c1LHrOsqAA4Nx@vbox>
 <94c4056d-7f7e-46ef-97cd-dd12621260bd@oss.qualcomm.com>
 <atAuSs9VTveGwzpy@vbox>
 <526b4857-4a4e-4ebc-a367-bdcf9a9c9a53@oss.qualcomm.com>
 <atgaF8VoapljDa2f@vbox>
 <138abb5c-b1cb-44e5-a103-dccb022f3102@oss.qualcomm.com>
 <auksxKbHVZzUd4G5@vbox>
Content-Language: en-US
In-Reply-To: <auksxKbHVZzUd4G5@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb3d02 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=4cW2FY/XLap1olThQF9nEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=3YhyyRXw4QUH7AxPMAEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: OzjxLUtsdfMzx1eqgvo671vQZnjIYuit
X-Proofpoint-GUID: OzjxLUtsdfMzx1eqgvo671vQZnjIYuit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfX+OHvJWrUeogE
 gmnk4rbtTT1JbQt7CQknTZZVUiEFDCfo7SM/RjTbbO0FAtO/WwpPbRB/tpxYC44OfpMmaW1LBXp
 dgIAZ/MpbvGaUoVdhE505i/sdhxwl0YcvVaaw26zPI0A/Ese2PhfDTACHbb4SaQHmqQCAAe68A4
 kRbAI7qht4PDRS7CamjMWqSBTcd/+vA9ZDzrYtqejVr+GnYUK8u5BavO4sqJCp28orkxENCP5T+
 DWWHy28JBmZCEN5PCiU25tgMfAYl0lkSxBhKDILSGqZ48ge2s8iLayInCbvxiWxb9ec5zb0ISHd
 lyEgJkmdIlKJ7bEx/SVjRYAatoFibihf+VhjbyIJp2fKGDVceW6H2DgXORbA8hG+NM5RZfu73Ob
 tTQA96Lbsap0oSZUvc1N7zQTLBtXqj72F9Jkp0y6PLmsnAuJafPyhtjCc4gXsCpF8ItqVppUmvr
 GQwxCnP6tXi6h/s10pw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfX8AYwLAbWgU9M
 ciK8+7vVEawOtmSnWS3lQ5OD0Hg5PWrlenwYHkOKd49Luw8D6nAj8nYj+FA9ZTPAdjJolD3xcXo
 mDdHJxB0iwP/w5TfxJ2TwXiyW5MaZHY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040056



On 11/3/2026 8:41 AM, Thinh Nguyen wrote:
> Hi,
> 
> Sorry for the delay, I was out of office.
> 
> On Wed, Oct 28, 2026, Krishna Kurapati wrote:
>>
>> On 10/21/2026 7:31 AM, Thinh Nguyen wrote:
>>>
>>> I'd rather not take this without testing. The check adds a register read
>>> to every endpoint command and implies that CSR timeout is expected
>>> during command sending, which it shouldn't be. Without confirmation that
>>> it catches the issue and that recovery works, that cost is not
>>> justified.
>>>
>>
>> I won't be able to test this in my environment. The only PIPO test that
>> easily reproduced it easily was with one faulty cable from (IIRC Xiaomi) and
>> CDP port of AMD based Lenovo laptop (there was a particular variant, I will
>> find out). I don't have that faulty cable for now, but this issue was
>> reported even on Kaanapali as well on 6.12 Kernel (mobile build). Not sure
>> if I can provide this series along with err_recovery_work to OEM and get the
>> results since this is reproducible with very difficulty on their end too.
>>
>> How about we add the Depcmd check and then the GSTS check inside it ? To
>> avoid checking GSTS always.
> 
> Your report shows ENDXFER timing out with CMDACT still set, so the
> DEPCMD read back may not show a mismatch, and GSTS would never be
> checked. To avoid reading GSTS on every command, we could check it
> only when the command times out instead.
> 
> I'm fine with this approach. Since it's hard to reproduce, please note
> in the commit message that it's untested against the failure, and add
> a dev_err when it triggers so we can confirm it when it does happen.
> 
>>
>>> Also, looking at the original report again, the stuck state could start
>>> without an endpoint command being issued. Unplugging the cable then gave
>>> no disconnect event, which blocked suspend. A check only in
>>> dwc3_send_gadget_ep_cmd() wouldn't catch that.
>>>
>>
>> Currently on downstream, the way we work is that if we unplug the cable we
>> expect the controller enter runtime suspend. If that doesn't happen and the
>> controller is stuck, we do a "usb_gadget_disconnect(dwc->gadget)" and then
>> upon re-connect we do a "usb_gadget_connect(dwc->gadget)". So, if upon any
>> plug-in, if enumeration fails and if we encounter this scenario, we are not
>> handling this until plug out is done.
>>
> 
> How do you detect that it's stuck? Soft-connect already does a core soft
> reset, so you could call usb_gadget_connect() right away instead of
> waiting for re-connect.
> 
> Would be great if you have logs showing a consistent symptom (GSTS,
> DSTS, DEPCMD read back) that we can check for.

Will dig up my mails. I remember having logged the registers when 
discussing this issue with synopsys.

Regards,
Krishna,

> 
> BR,
> Thinh

