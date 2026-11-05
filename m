Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.132.183.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793853679;
	b=3MoF60atvkp2rdPidp7aVh7W5WkA07UzMWkIyrB2Vgz++jo2xQZByGlixP45XORpZ4SA
	 4Ca2Z28LkjBNxCbL05nP+LjKdI2+BFIlPlEld4pPqAILv30855vhHXWTIIpNbR3FNn9ua
	 OR82Hqo7DGrIJSGFfLxDl4tFB0KyII+73fEnjt1oyb6pmUFrKglXD6M2SiwVGURv4cec2
	 zC+0uF0DGuTnWmNRvOwhqjHls1c6QY85gqz/6WtcADFbLe78XGEnAswzpyYUpwWYUSDT2
	 zqzKYuv/ySUxqkZqSvNnb94jSKhktptKN9VAEpDJoedGBNMfLK4JoVTODtHUbdqk2Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793853679;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 Cc:References:Content-Language:From:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Reinject:
	 X-Sony-BusinessRelay-GUID:X-Proofpoint-Virus-Version:
	 X-Sony-EdgeRelay-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Sony-Outbound-GUID:X-Proofpoint-Virus-Version;
	bh=CEkGvy3aLrxRjLGdl8tfvu1ARW7upt4AeWpWqbv3z/w=;
	b=C1uv+PKasxErl0YcsXAVVabxe9qdiWvQIqTchp8ILy+IuwPepU5x3wrlU8ai+vOadMLH
	 qhbbr9eT1ELsttHYRIBPV+nQ0x+46FwJRB6fvFTdHVMitnMp6J/rG3KGlRTOexBZRVGn/
	 EaEK3KB6FekzWtm1AliwtmFS2l3SgBSAD1ksQUSquvfHoxihIO0bHmGfuSwQ9fj15iSEu
	 0xcnvyXfzBW9/ZDRBCPd9PEqJgp5ShGVGQNKvRiPE/XLBtHAniHdWGvoR4DsmUfjUOXCP
	 lHYCvVLlWvF5MROvJQzCxcew6iGL1s3NcYX+7zSB+Wu9+M7UXCD1awbVKSGCT0NyBkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sony.com;
	spf=pass smtp.mailfrom=sony.com;
	dkim=pass header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=p1 header.b=fq7og1EW;
	arc=none smtp.remote-ip=185.132.183.11
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4D76082BC5;
	Thu,  5 Nov 2026 04:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B4D76082BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=p1 header.b=fq7og1EW
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50nVid1016127;
	Thu, 5 Nov 2026 04:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=CEkGvy3
	aLrxRjLGdl8tfvu1ARW7upt4AeWpWqbv3z/w=; b=fq7og1EWFwS2tdP+kAw0gCO
	qhEwXgxhadkeHvq8Ihg7I56wT21B3hH5EylqCn/89vYaFp4pBq6mcJL0AxHLtPJi
	57+PGKG96bZeZnq8TziCKgT0ZGdqY/BQJ/uEKiyJJKFJ4hePeLWWF1xGMWRULU8Q
	iK5/uJfnbbKsOQyFTGl1TqH+ZQYY5RE220qL1Najr5DSfytrHZGPpJ6VHrDSC/UY
	bHP6Rm7HqIft7WE6hZ00a9IUSeQaQmmuKFFqhsuS0BmmVpWi5KPcKzcCfWVoR/+F
	aInfX4hWj/WOSPcVSK9W68mT0myEaqlQXDWjpchdLTxKEb8IXr6T1uNh+Z00d6g=
	=
Received: from sgppsea01v.sg.gdce.sony.com.sg ([121.100.43.225])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4hn9gg6d2d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 05 Nov 2026 04:40:50 +0000 (GMT)
Received: from pps.filterd (SGPPSEA01v.sg.gdce.sony.com.sg [127.0.0.1])
	by SGPPSEA01v.sg.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 6A54SYk83638969;
	Thu, 5 Nov 2026 04:40:48 GMT
Received: from sgppsba03v.s.gdce.sony.com.sg ([146.215.113.220])
	by SGPPSEA01v.sg.gdce.sony.com.sg (PPS) with ESMTPS id 4hn9dh1q57-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 04:40:48 +0000 (GMT)
Received: from pps.filterd (SGPPSBA03v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBA03v.s.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 6A54W6El1849964;
	Thu, 5 Nov 2026 04:40:47 GMT
Received: from [43.3.252.132] ([146.215.113.251])
	by SGPPSBA03v.s.gdce.sony.com.sg (PPS) with ESMTPS id 4hn9djmvgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
	Thu, 05 Nov 2026 04:40:47 +0000 (GMT)
Message-ID: <8d0a7e8a-f8f5-4896-b2e2-2f42f1e5897c@sony.com>
Date: Thu, 5 Nov 2026 13:40:45 +0900
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
Subject: Re: [PATCH v6 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
To: Conor Dooley <conor@kernel.org>, sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, kieran.bingham@ideasonboard.com,
        jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com,
        Kengo.Hayasaka@sony.com, Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com,
        Yuji.John.Takahashi@sony.com, linux-kernel@vger.kernel.org
References: <20261029050002.3880-1-lachlan.michael@sony.com>
 <20261029050002.3880-2-lachlan.michael@sony.com>
 <20261029-distress-stimulant-cd5bb18f5ae8@spud>
Content-Language: en-US
From: Lachlan Michael <Lachlan.Michael@sony.com>
Organization: Sony Semiconductor Solutions Corporation
In-Reply-To: <20261029-distress-stimulant-cd5bb18f5ae8@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Sony-BusinessRelay-GUID: Z7YAkeai05ddJsO0Mm1AR6NGAsst_H7c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Sony-EdgeRelay-GUID: C4xOC7c57qqHBZJODKPno-vOV6sTDYs9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAxOCBTYWx0ZWRfX/1iVh4q3VmC5
 Ht8QB0QZYAgtemnpSZlDVv3gj66FJb6CyXw9nrUXefbG6CNqXmfL/uGDmkmdt45HEytuI18hOta
 B2aZjMGRmh358MWn9m+mt4jP7qtO41y646bQVdhqB33CMgOa/bEevFrU3LYHbcTjkv4B19Plk4Q
 XQTc5HYy+0uP3NAq6dm+voNPvAxYV2orhNQlbTk2dNU6W/gDs74TIgeDVcy3Rlpz5y23d2x5/DW
 YEVx4s7xCeugDrRlL/IsiOC+Lmt3pDtln1P0O6yrrA5H62xJ86qjJBFSda/baVBRXB3c89Y6eZi
 +hB22CwM45na3QgJsyHdLRBgT4WN4b7xMykr6dHj2o0VbGcUBGBN9VNxS9EYpyRRqzpK69Xr8i+
 bFQ19hu+iYDL+v+GpFXBF9jK2k5GdCftc26cPTmI812c9nqOpxAFWAnD5uJ9r2fproRipptnq5t
 hMFJBP8n+BuenVRF3Ug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAxOCBTYWx0ZWRfX/3FoIYbIeZa9
 l6QdFy9ztWXt6j9cBn/VucEjnI2gFSrqT0IQT7zL+LTs9oW0WYbD9pAlDSv0KuEHAm7JnWGSyIt
 S5ogkYgA7UHRdBFHwsvkrf2GGV83KmtV/amZWSJM8+SWbKP6pEl4
X-Authority-Analysis: v=2.4 cv=Z5t5j3RA c=1 sm=1 tr=0 ts=6aec08d2 cx=c_pps
 a=XNW8778QP6juiAqijDMnrw==:117 a=XNW8778QP6juiAqijDMnrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=jHItnBwsj8f3cr25iGAb:22 a=VwQbUJbxAAAA:8
 a=P1BnusSwAAAA:8 a=XYAwZIGsAAAA:8 a=yb2DqlCEcBRr1FvsFXUA:9 a=QEXdDO2ut3YA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: wf49VU1VyvftWfC5nZpDDQW5N8MIxx7x
X-Proofpoint-ORIG-GUID: wf49VU1VyvftWfC5nZpDDQW5N8MIxx7x
X-Sony-Outbound-GUID: wf49VU1VyvftWfC5nZpDDQW5N8MIxx7x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01

On 10/30/2026 3:41 AM, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 02:00:01PM +0900, Lachlan Michael wrote:
>> The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
>> with a MIPI CSI-2 output interface, supporting RAW10 and RAW12 output
>> over 2 or 4 data lanes.
>>
>> Add device tree bindings for the sensor.
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Acked-by: Conor Dooley <conor@kernel.org>
> 
> This is not the tag I provided, I never provide tags using this email
> address. Tags must be used without modification.
> https://lore.kernel.org/all/20260828-hedging-olive-eaea0b4027a0@spud/
Conor, my bad. I honestly missed that the mail address was different.
I understand that it is important that review work is attributed to the 
correct person and organization.

Sakari,do you have further comments on the current v6 IMX908 driver?
If so, I will fix this issue in a v7.
If not, can you attribute to Conor correctly when picking up the patches?
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Best Regards,

Lachlan
