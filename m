Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.132.183.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000035;
	b=sEW9CCV5nW/mV5Wa2xji29H7Fi6EOoat5caADhVD/gfP7LPItcLQojutsbVKWY4lm971
	 hgAMTLe4DJhS3P/k9UvPC7g4IVk7W0tO5Ru6CxfoL+6fnoRi7EfVAP6oAYD8Um7wFHoAn
	 UbEZTfTOm6MfB/6n/IcR+y/My1pYIsvBE/NoeW/Y+6RduloYFzJvjiAeCwfXKtJo79c2F
	 dbNrnPCIKLRDPeLWsqMCSasCzoLCDrTotZlU0qdw5akhAMVLhSxHfoT0tI7wygm17MIwC
	 /oLKyJ84VeAuNcW7vP7uzTo7M010N4D6Z/p1HrwK7hpd4s98Z8XCWqo+EfVAfoywkVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000035;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 Cc:References:Content-Language:From:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Reinject:
	 X-Sony-BusinessRelay-GUID:X-Proofpoint-Virus-Version:
	 X-Sony-EdgeRelay-GUID:X-Proofpoint-Virus-Version:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Sony-Outbound-GUID:
	 X-Proofpoint-Virus-Version;
	bh=0t8QYVucYShVvSMATvqL8jL5FxWeDDywI03ePp12CeQ=;
	b=UX+ibuLZrPU7Ny0Hq54+MfhUeLBSGwH6bA8sgu82nORgiyphQ4ED+JFE3pNPONm2AqIP
	 nBNdpwjF39E/mq9An3paUJk9LyXAnjGBlJV3RkFD7K0GXpPpEA7Flth9q9m95dUliV+tq
	 BSZiKUYqYMe3VHod+eb4FkRKwygFn3AwRwuk8p2mf7FtQapmd4U2jH75Li2cTyidaFzyN
	 svIHNYoa1nrxxNWcjFTfjc6anH8/nEicqIVzD6CZKp4rONS8PhMdBp5873DGJvOnRE2CJ
	 HwX+TQn0bb2hGH1OMX/n1TCVYDqoy+kymqmGDmUtMq0eYa3UUfBo5rf4CfOQuw10ntw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sony.com;
	spf=pass smtp.mailfrom=sony.com;
	dkim=pass header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=p1 header.b=RZ3T5Pzl;
	arc=none smtp.remote-ip=185.132.183.11
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10F4606A31A;
	Mon, 26 Oct 2026 07:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C10F4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=p1 header.b=RZ3T5Pzl
Received: from pps.filterd (m0209327.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q6kJVi3575471;
	Mon, 26 Oct 2026 07:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=0t8QYVu
	cYShVvSMATvqL8jL5FxWeDDywI03ePp12CeQ=; b=RZ3T5Pzlnms3PAjXIizUi54
	CBkmAJdIB8ua1wXlB0098/f/3h7xGXKAglKORFRU8NcvLedb/F25N47zajtdP5lY
	B9pfMh+8t1dUWAMx19e3/idONf0Xonde9dk8WJEJvvsS4SL8L1MudkzKJKwF11t+
	x0RdWGeZ6z6WWbXrQlSIjErYtbYrA4Uiym4ZzRVP+4ENDRVfde8v4VzFcKykx7Nc
	fX0GF8pH7oe0EeDjFcqh6P6RYvZ7xureuij1195KQZZIj48XLE7tGo/FDqmmKZL+
	lAuQ/4dx5PS3rHdv66B2Wt81Bq+mPw22ltOeqbkzv5MNJx8yUpdEFf/h99Kw3fg=
	=
Received: from usculxsnt03v.am.sony.com ([160.33.194.235])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4hgkhxj7a3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 26 Oct 2026 07:33:43 +0000 (GMT)
Received: from pps.filterd (usculxsnt03v.am.sony.com [127.0.0.1])
	by usculxsnt03v.am.sony.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q6NN6P1003600;
	Mon, 26 Oct 2026 00:33:42 -0700
Received: from sgppsbm01v.s.gdce.sony.com.sg ([146.215.113.217])
	by usculxsnt03v.am.sony.com (PPS) with ESMTPS id 4hhe88pk2k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 00:33:41 -0700 (PDT)
Received: from pps.filterd (SGPPSBM01v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBM01v.s.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 69Q6o9E01047713;
	Mon, 26 Oct 2026 07:33:39 GMT
Received: from [43.3.250.71] ([146.215.113.251])
	by SGPPSBM01v.s.gdce.sony.com.sg (PPS) with ESMTPS id 4hgnrjqbg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
	Mon, 26 Oct 2026 07:33:39 +0000 (GMT)
Message-ID: <0f953415-aa5b-4de2-a040-80238b55b7d4@sony.com>
Date: Mon, 26 Oct 2026 16:33:37 +0900
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
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, kieran.bingham@ideasonboard.com,
        jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com,
        Kengo.Hayasaka@sony.com, Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com,
        Yuji.John.Takahashi@sony.com, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20261019014720.2635-1-lachlan.michael@sony.com>
 <20261019014720.2635-3-lachlan.michael@sony.com>
 <atdGr8S2sf1kZFUw@kekkonen.localdomain>
 <20261020125630.GA158670@killaraus.ideasonboard.com>
Content-Language: en-US
From: Lachlan Michael <Lachlan.Michael@sony.com>
Organization: Sony Semiconductor Solutions Corporation
In-Reply-To: <20261020125630.GA158670@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Sony-BusinessRelay-GUID: sK06nng5iL2eyB8Kw4CCf0xFnEe3CGDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Sony-EdgeRelay-GUID: 0M8f_NdwfFeo7oUVDJPNdrmplkxUzG59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Authority-Analysis: v=2.4 cv=H6ROUOYi c=1 sm=1 tr=0 ts=6adf0257 cx=c_pps
 a=Ycsf2/9e4zkPkE23zi987Q==:117 a=Ycsf2/9e4zkPkE23zi987Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=b20fedWF67CaGdYoUt4Y:22 a=VwQbUJbxAAAA:8
 a=yAT16FBiRIoZr8f1NH4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyOSBTYWx0ZWRfX6Xe1O3EkVzGE
 O+S0HPYvy2Z7S0DlUHQ5bf+apAgTJ2Z/ovmwMiWlCbuXHxTcBv+D2w205+9PUmpG2g82V7P8jq6
 rQPzdlPNYnPy/OKCzoqFz42DbZuweQdsgc8hXLDNPYOx3kXsGXOn
X-Proofpoint-ORIG-GUID: hONqMJyhNQbV8sZ319oIfhJ2c22k0BPQ
X-Proofpoint-GUID: hONqMJyhNQbV8sZ319oIfhJ2c22k0BPQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyOSBTYWx0ZWRfX0LLP14a5HrEx
 tm1RVCJUeGOJJ3AZ35LYtdB0J5zLA7RHIRStByBKjEQU08nlhu49ZRFngDriZAamvgVAHYKcRMb
 Wp31XSMEkTEsCWA/WA3WzgbV2SMijr2j2Ua2mtjXbnaKwkY6s8V8obTChRFlLE332vQ6+bHr6Nc
 aoLTL6qgGGJqkEm09C1gLme+kTVJRTOTMblwi0vljps+Ec9QYWqvgNVW++DGViMnDFMwFAdGY0N
 clh3VBOdreIcW1LE0ZqAV7YpRmvndqNPXPbe8JwV9g+9xBZ186+lebKx0RjxEocyCFDZddyuHIC
 FTDu06Z+3zT/FTojCBWBh4QGcQn25I6wW8vRQyfsVG5a3Bai4WJFwIiSGkGlQYlRKQX7qU0JEBV
 uUhY5wmvXNYgSTVatUe/ZhuZBBcWPX4kX8fA8s7+sOiK2NumNFPk5IneHND7K51ilRaZp1FJHpa
 v39X99prZXxp5mo0tyQ==
X-Sony-Outbound-GUID: hONqMJyhNQbV8sZ319oIfhJ2c22k0BPQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01

Laurent, Sakari,

On 10/20/2026 9:56 PM, Laurent Pinchart wrote:
> Hello Sakari,
> 
> On Tue, Oct 20, 2026 at 01:47:11PM +0300, Sakari Ailus wrote:
>> On Mon, Oct 19, 2026 at 10:47:20AM +0900, Lachlan Michael wrote:
>>> The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
>>> output interface. The driver supports RAW10 and RAW12 output formats,
>>> exposure and analogue gain controls, image flipping, blanking controls
>>> and test pattern generation.
>>
>> The imx908 appears to be a Starvis 3 sensor. How close is it to the Starvis
>> 2, for which Dave (Cc'd) is working on a driver (see
>> <URL:https://lore.kernel.org/linux-media/atdAsDGw_jvhaydM@kekkonen.localdomain/T/#m0c50ea017ef9ae0d3d76a36b840db9b6f7ac296c>)?
>> The register defines in the two drivers appear to be quite well aligned.
> 
> The current version of the driver implements very few features of the
> IMX908 sensor, as crop support has been removed pending the raw camera
> sensor model, and Clear HDR3 is being developed. I expect more
> differences to appear when those features will be merged, so I believe
> it makes sense to have a separate driver here.
> 
> In the future, I expect the raw camera sensor model to open the door to
> more code sharing and more drivers supporting a wider variety of
> devices. We can decide then if the imx908 should stay a standalone
> driver, support other sensors as well, possibly across the Starvis 2 and
> 3 families. I'm willing to help with the refactoring at that point if
> needed, the maintenance burden won't be on you (and I'm sure that
> Lachlan and his team will of course maintain the code base).

Just to add our official comment that we absolutely intend to support 
the agreed direction of the community and will refactor, patch and 
maintain as necessary to support the imx908 and other future contributions.

Best Regards,

Lachlan

