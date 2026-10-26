Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.132.183.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999601;
	b=XcCb6BzBX3oH7dHjEXrcGx6Gi3GCys4HU7oNl2MXB0/WoTsQE0cRG/wVV53bXDKFpj+E
	 qx5YP0qS4XuNCdpzZR82bjkS2Bsz/REKnpMeThqHykF8iMVuKrN4Zi4jSIFHP/7AAXOKK
	 BOAOAgdOro85Hen14cBHE/66TTiLvR7wVe4QxcA96i5oXP06cT8ZmyNYqZI79ZGlEsxI0
	 7O6V4AfBG3/8fDwtqc5eCWtudsolnbeoFaxk2O1K2ZTTRZo8rGwciv7i/AqwhGhNJHe/S
	 SVvzJD3wKEZsTYhesQBpmbovpOYo9CklRUAac3LcwL7Vg4f3MIv2yYl5Uq3AMX4m1WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999601;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 Cc:References:Content-Language:From:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Reinject:
	 X-Sony-BusinessRelay-GUID:X-Proofpoint-Virus-Version:
	 X-Sony-EdgeRelay-GUID:X-Proofpoint-Virus-Version:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Sony-Outbound-GUID:X-Proofpoint-Virus-Version;
	bh=AFUnvlpbXFqyS33UGnzfMDgJVdmL9eYWCVMHJOFuv0I=;
	b=k2LEaPgvwRZ9p8PQxJ0BJxdHYJf/FKzZDjo0n+0D05orEPYmR7TsijMs8URVlVL9/sDH
	 lyYKtL74QqsKLVzMvnjRaAmauQdJok29al/DScYSgp8uTWLyGZh/oob8ptoXz7+kXDrGg
	 FtJ44Bg7M+Nz9rmY26WIvWAFZoDfcAiTYiPFW/PR/JgcCzIFAEtoOV+mir/0frHbT2fh8
	 Wu4uBGhegSkhipv2kM+81Yj1MAWMs564shNW2CpRBgjwabadEfEqzWKMrkKifPO/oia0L
	 rosNA9C2LKQkIqeVHYPaFCnFVA/YayeqDNxe27dVA+X9x42xK1ekJJ3RKUB6DR0Ucaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sony.com;
	spf=pass smtp.mailfrom=sony.com;
	dkim=pass header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=p1 header.b=BZiT5XVV;
	arc=none smtp.remote-ip=185.132.183.11
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EA4606A321;
	Mon, 26 Oct 2026 07:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8EA4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=p1 header.b=BZiT5XVV
Received: from pps.filterd (m0209325.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q5sVt92996882;
	Mon, 26 Oct 2026 07:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=AFUnvlp
	bXFqyS33UGnzfMDgJVdmL9eYWCVMHJOFuv0I=; b=BZiT5XVVqKjsh17HOr4ZEK8
	y5IrW7DywoSAAbpV4X2T4OGbhSv+E7nEIRpxnnoPYnEgd/xIBFvy+3+2Smnzvo+T
	a44PiR44xQoOyy7BslIv45nQHLsVRf7/+Ume81ThRQO6ROZdwdAR03SnGzQXTPyF
	QCUFENiOW9BQMepbnypQpmHmBsDjSWl98zVB55xCL/bKOi0uQX/lKNw/7EtVC4u+
	C/g0Klooco3QCN2F9iJrDvSF9y0Rrx078X81QwEP8bWVAML63dyC+CZfAp9SSc6l
	MoOAFaFkaZvyGcVMLB19DP8SjV+OUgPbpsRnSA0+Rol8rMhuyUrEgiJG+ImKNHw=
	=
Received: from sgppsea01v.sg.gdce.sony.com.sg ([121.100.43.225])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4hghwvj9jv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 26 Oct 2026 07:26:15 +0000 (GMT)
Received: from pps.filterd (SGPPSEA01v.sg.gdce.sony.com.sg [127.0.0.1])
	by SGPPSEA01v.sg.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 69Q6cNpe445353;
	Mon, 26 Oct 2026 07:26:13 GMT
Received: from sgppsba03v.s.gdce.sony.com.sg ([146.215.113.220])
	by SGPPSEA01v.sg.gdce.sony.com.sg (PPS) with ESMTPS id 4hgnrgux62-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 07:26:13 +0000 (GMT)
Received: from pps.filterd (SGPPSBA03v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBA03v.s.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 69Q7DltO967194;
	Mon, 26 Oct 2026 07:26:13 GMT
Received: from [43.3.250.71] ([146.215.113.251])
	by SGPPSBA03v.s.gdce.sony.com.sg (PPS) with ESMTPS id 4hgnrhyan0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
	Mon, 26 Oct 2026 07:26:13 +0000 (GMT)
Message-ID: <aeedc823-5a9a-4e0c-9eca-76f9febb3741@sony.com>
Date: Mon, 26 Oct 2026 16:26:11 +0900
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
Subject: Re: [PATCH v5 2/2] media: i2c: Add Sony IMX908 image sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, mchehab@kernel.org,
        hverkuil+cisco@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, kieran.bingham@ideasonboard.com,
        jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com,
        Kengo.Hayasaka@sony.com, Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com,
        Yuji.John.Takahashi@sony.com, linux-kernel@vger.kernel.org
References: <20261019014720.2635-1-lachlan.michael@sony.com>
 <20261019014720.2635-3-lachlan.michael@sony.com>
 <atdGr8S2sf1kZFUw@kekkonen.localdomain>
 <20261020125630.GA158670@killaraus.ideasonboard.com>
 <CAPY8ntBUncMWB2DqFG+iS9gFgW2aaeyMrD6x-c_4Da7rJDv6Mg@mail.gmail.com>
 <atiogo14sCFw4xlT@kekkonen.localdomain>
 <20261021120521.GA273922@killaraus.ideasonboard.com>
Content-Language: en-US
From: Lachlan Michael <Lachlan.Michael@sony.com>
Organization: Sony Semiconductor Solutions Corporation
In-Reply-To: <20261021120521.GA273922@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Sony-BusinessRelay-GUID: OxqiAX1NmJULmJrJhFBFcJVRBycvA7hF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Sony-EdgeRelay-GUID: yMI1RC_2Z46wLYiYECb-RTNHrn_oSeod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-GUID: e8iEukfIBZE8msmOGAG-bArREIN7JLKy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyOSBTYWx0ZWRfX3gDr8ZjzChRr
 x2aeEYAatARbGyNmZS8agLwIjyoRrfnp5IknwGRtS41/G8Ez+tVy6Qr9Qm4wQRYTiQhYo3urxRV
 sRn1aSPrSK2UoBJX6nzD7pV64N8eeCZMYle1TQ19O9tfUiWr97qG
X-Authority-Analysis: v=2.4 cv=AMzCycPh c=1 sm=1 tr=0 ts=6adf0097 cx=c_pps
 a=XNW8778QP6juiAqijDMnrw==:117 a=XNW8778QP6juiAqijDMnrw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=FGjXJT7Bex8XaPnzAX5M:22 a=P8T2m7VJcMaW70c5MUQA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyOSBTYWx0ZWRfX2VhOn64qAnUd
 2a/5LekgplyTjj6LuucoQ1eJu8S9ssKOdvkTjOOTf4RsrRIPabndW69shm27YsQ8RmzfGBhyU51
 ue7aYE1P/DhQF+YG1PSCuY0ywCADCjmD1YbTr1VZLguozu0yNtNbPXZYPec4vBUwQKFEM26N0qF
 6VDdJiftUgQ/mvljkrN+htGMelKI/ZQPEQgCq1fZGEidvQ2yxiZjPogZFwuQQvFrA3Mc5vn0P6m
 Slw5fXtzjI6fGlcn+NX8gIDYjuOckq0Dr7T+83XLw8AtTQMwrM6c5BTHH7QhGBZxegjqWuedGvk
 WKY+baonl6VKCJdyfhmWslMcH3lOlJBjsBeLIBkGwj4Vteiv46cR340HPC8yOurCrSmeJfmV0fD
 YgNSyt1Z7Q9mj5rZmBGjJxxwH0CsRjRxsoWzHp8pOpI5lB9mdAjK1iHffwFrnxU7ovAMp2pDW18
 VUoRpK9NX8wV2yqjLKw==
X-Proofpoint-ORIG-GUID: e8iEukfIBZE8msmOGAG-bArREIN7JLKy
X-Sony-Outbound-GUID: e8iEukfIBZE8msmOGAG-bArREIN7JLKy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01

Laurent, Sakari,

On 10/21/2026 9:05 PM, Laurent Pinchart wrote:
> On Wed, Oct 21, 2026 at 02:56:50PM +0300, Sakari Ailus wrote:
>> On Tue, Oct 20, 2026 at 03:50:09PM +0100, Dave Stevenson wrote:
>>> On Tue, 20 Oct 2026 at 13:56, Laurent Pinchart wrote:
>>>> On Tue, Oct 20, 2026 at 01:47:11PM +0300, Sakari Ailus wrote:

>>> I have compared the datasheet for imx908 against the Starvis2 ones,
>>> and when we start looking at HDR modes they diverge a reasonable
>>> amount.
>>>
>>> Even the later Starvis2 sensors (IMX585 and IMX676) have minor changes
>>> to the earlier ones, so adding Starvis3 would need some care.
>>
>> There's quite a bit of this in the CCS driver, due to the variance it
>> allows for implementors. I don't see this being a problem as long as the
>> foundations are reasonably similar, albeit we can see whether this could be
>> further extended later on to other sensors.
>>
>> I'm fine with having a separate imx908 driver for now. Dave's driver also
>> exposes the variant information through the media entity name so that
>> should be done by the imx908, too (at least if there can be multiple ones).
> 
> As far as I understand, the IMX908 does not have a mono version.
> Lachlan, could you please confirm that ?

I checked with the developers and there is no mono version.

>> I'll review the driver properly soonish but I reckon it's in a pretty good
>> shape already.

Thanks. Appreciate your patience with us.

Best Regards,

Lachlan

