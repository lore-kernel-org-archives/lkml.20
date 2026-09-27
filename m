Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9025A4A21;
	Sun, 27 Sep 2026 05:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790486458; cv=fail; b=dueBzPU3R6khrFD10IyXa8VPDa6NtJopUkDP82eJDDVeCcN8SiI46T0tBrLHNRT/90QlhBVodLQ38gUpANBGNau2q4yPMJSXP2jWJd1v5fx3GuyvOchI8yENpwy4J4ef/3TvaIDjdg2HAaaFgTSVWFEHWmx95+PoDrxTiF3pnVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790486458; c=relaxed/simple;
	bh=PBz184/v+//uHUpOzBlzCD0Qk0+tyJo3vcb8nYqdf1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fcLOnykHRTQ8MhLEJ/PcU04Ttbg2KLnF+OtFuj2tKShtvzyXVKFDFWkNlQTwh2R5izsomZWLPfSWNps3l20WKT1+9YEB5gwGCV1zwp+g3XD2AqzZonSgXgQzXSyB5P6FIYb61Qs1TDW1XFnNwTOWrTrRcgv9qy2u0lQ1Ks2p5nI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=mp0B+Ve+; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OpuFZgvA; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="mp0B+Ve+";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OpuFZgvA"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68QH0WHg2071887;
	Sun, 27 Sep 2026 00:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ESKq2eYsstwpev0zrtBPK9qr5NOqWQS0YuXfqeHdl
	ks=; b=mp0B+Ve+K8fNrsBb1EK6QorS/m9MDroazvRqtckKga+mNpr6xhLO5dWno
	xTBoFK0GzxLbebi/iAAT7GXxN1PUskV8Lv60PFGPLtdWxodjH4YGV7ruMb0kQiEN
	aEOa+0piK9L9irMcVYLXTmMoB3vIUtz573HiVNJPi5JTD0dEVROcuEInlaMIkbDI
	/17tWTOiftKoH+U118cglnz1I3zrark4OOBWVLco7vx8K6OCGxum5T4zu153/hQ0
	yIIqdxiMXhUvMMi/FH7xcLUv0Mj/1YS0xepAn2EzgAU6pZu3dSrhgaeQbniSOkqK
	72q08hrdEmmYIY1UUUBp4ori6IoVg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011004.outbound.protection.outlook.com [40.93.194.4])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gx0agnjx4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 00:20:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EnF6DLMcus4trSgq9qESXtLB/g2iCuyaQxbq9ywhxjjF0rKKpC54Fg8pNlaNEy5Z2+PwuTUbKakYXO97k2ckpxyl2dpEQZlnastryxaO75rDpfij6a/wtvtfFI6UbQgL+vWvSnvfhXOS0vAwNQXJGBSdflLOBDRqxd91aQBMqZ7NNa7mA7Mmnaf+46R0PNl4wgkx0wtUNSEXTivd9hi2E/TiICtp594gWokVMSIqSFWEFLJ2jTbFXxHKsuubZjSbbSL24/04TeeDd8jmroCf8AroRc/V43wJMzPlVQdEg+ytgF+iDNl/7Q23wTc+1tkc0KcUVXkYUwp+ILmaHHvQng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESKq2eYsstwpev0zrtBPK9qr5NOqWQS0YuXfqeHdlks=;
 b=sjgvKE4QI+GSFIZKN0onI4bl//3F8yedO1qLhYWS31DJGCgMua51i6FR8NiajX1ZHmSK3OI62V++pRD5koK+Hj8fZTdwKaJtWdoeyOMWQNgwPVV5j1YPPvWgHIkq7yuNH8M4+q1B7VCp0nokrGufUajx2teTt2vRwQi3KC1TJkmXT5eQ7eajkYeno8LZBRbsPUA5/hX7deIvMr8tMKwaIa8HJ29rZL85JNg+MEBx1AjbzTD9epwJr68EBK6rfq5sn89vfwk+cIFdZyjCxKOPZbU7YOKe2MyZ2JHaw6KGD01DLzeKUML6XQdvTCmfMYiWpdfqWrLO4Mm2qqgxAszcRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESKq2eYsstwpev0zrtBPK9qr5NOqWQS0YuXfqeHdlks=;
 b=OpuFZgvAn87HuUPdMY8vcevnCCSQqlzT+2wnKcdM2krkJJxRyc3vz8bSN7QxStHoz3hDT/WwneJ6Ux0ml1NxayG7UtGyLrucrukasDyzesuY5suWfyxFFDz2Q1bc/keHmmf7wE0TkqURWja9iUaRBurXp7iwbkiGuiigF+fCJQM=
Received: from MW4P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::12)
 by DS0PR10MB7066.namprd10.prod.outlook.com (2603:10b6:8:140::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Sun, 27 Sep
 2026 05:20:39 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:303:8b:cafe::3b) by MW4P221CA0007.outlook.office365.com
 (2603:10b6:303:8b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Sun,
 27 Sep 2026 05:20:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 27 Sep 2026 05:20:38 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 00:20:36 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 00:20:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 00:20:36 -0500
Received: from [10.24.52.125] (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68R5KUNI1590486;
	Sun, 27 Sep 2026 00:20:31 -0500
Message-ID: <7e6eff37-832c-4a40-a4f5-4e3699bf3a5b@ti.com>
Date: Sun, 27 Sep 2026 10:50:30 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/8] media: cadence: csi2rx: Add RAW10 RGBIr formats
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <sakari.ailus@linux.intel.com>, <mripard@kernel.org>,
        <jai.luthra@linux.dev>, <jai.luthra@ideasonboard.com>,
        <devarsht@ti.com>, <y-abhilashchandra@ti.com>,
        <mirela.rabulea@nxp.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-5-r-donadkar@ti.com>
 <20260926145242.GD764757@killaraus.ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <20260926145242.GD764757@killaraus.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|DS0PR10MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 7071a50f-8505-45e0-5185-08df1c571167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|82310400026|376014|36860700016|13003099007|10067099003|4143699003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	Y36HNc441VZElAaNe/J/L6HckXrXqFlWvTPv0OlUNrdbjQNlTW8wbD6onyLZDeHQHyanWmebDc8VWRUqatqgCQz2stYqrJAnSC6hjpEabRVrlSW/HqIiNsLjNaqHIVY1H523a8XTFZ6HSFngc5jTy0wgzRzIqj9/XOZvTKvd0KynYKiUg7kldiZz65snTesiDHUw2Rz4B0hfJgEEj6he+a/5tXGHAVb/xdSGkzUV+nfch4Q0T+ZqGU1rwuErvof412r2zPbDE6ODmXa8IqmQzlVvi5pXU4bdha2+2qEEcAI1qcki6Vz/cDhyak2D7CjKjYKtVvwHlkucZ6jBMN/Nf4PdUcuPzKU3M5mpnVpToNGJ8DkShFPRm8pAwpb6HgFccvUDYSEuoPbq2zLy580uCOyvKPknGtdhtvgvbfuHZY1sYTlpi5Ct4VDouMc6ZpoNM3J4fUt4CEOGucpWxNBTf52p0Pxiy/1I5agSkeMVglJMigbbJn1rAKbq+9vrpN7F8JP9jg5q+s58qnpc2geJYjpBXDJe8wXLfkgIE0Y+ZMo/CszRJeGxlWnXMDOThlQ74+IcQ4/aODKHSzxeorphMRWIEXUK56Mgwb21K4VY9QkleXUBWGmn4yFBL53W5yv8XsonG2I9o8l7DUKxHnk2pjsT+NgAD/9dsmPM1VF80wkAyKaEZIpNcB4HiYtzsjkPf3bfYArIKleeo7CnOypBgg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(82310400026)(376014)(36860700016)(13003099007)(10067099003)(4143699003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jgWHIUdSagDZcHwNFLNCbxz85alWc89Z2SQAqM1tgtTOwtZrfIYvLdSnL6F4Oq/RqHzhVMr+Cluc7J5POHilV9qKfgf9Uh7QHW+OKpm9zTimQb9GADJQbkLopDgNe+Q2kyml/qq8SGldkp7NqavnW/pPLohbu+0g3ifBPhFuxDVC4wMI+3hWciZNl683igMGK+4nhWY++/HzQ/55f3YS7V08ly62L8Lp9HugadjQH7tPbbD1Hr/GH9tG3OkX5puY5EX1KuG75Fi+wiiFEvmvm9Obi+F7LyMhwF0QIztgwqQ9OeDVuCzK9H89sJ37Z7beygkFM87LbABtVH4nZtyz+uIgUbQeyRIrzdOHi5RqnZYuNElrYeJ3zR5xSXwBWBvSgsJ4jxuNxHjHuyFk44j6Bkl0IhTqX0zCtU89s+Vp5A4RbdfOcoTciIltQYvMzZFR
X-Exchange-RoutingPolicyChecked:
	V/2X94npQpZXNx89y2Ew7OPMZwFJR2lSC+1frp8A6zdwr95xTbhqmDIr4gzmm/0X94/EH6R4/PcAFWM9H0kw0XwZXQ72UL9RfbVUrwL2EAEUvlIQ7kupB/Ca2GLjH9VBvN1RL4wKerj9UTjmTx89i8f9lPpFmGyfs+6nECOHyt+tFGXp1b6RABi29Cb9RDcEV0zpctysm/TcfWtB/aUpkqIWJ8wwWZeBudKHaaqBni10UzDAZ6SDslPmIsyxd1U1Zmu1Sm6Zz6E3iMSOfLavoJBmOdcdOtG9vgRZ9082s8Wjj7gTLexEetPCTfvviuFWhyU1YrD0cckPPWWkT6+meQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 05:20:38.8334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7071a50f-8505-45e0-5185-08df1c571167
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7066
X-Proofpoint-ORIG-GUID: uJqjNr-06XrZGCw9t-SMl1quZE9FFdUa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDAyMSBTYWx0ZWRfX7nN2pPvWzVnb
 6TddUTFId1RYi80CuovA2MPvWQ0x5uC2yAKjuptbuNDsPV611sD8q9Q28ruKewksOv8JwdGEjeK
 X8nUzWPv0HT/BXzTG3Z9wOtYQv1GF4d1WN6qm3Mzyav/hUlO2TXmn7SWkiaRhB+JXEEwLUkQtXy
 4NMGJL3YWnDFTU7gEOauYHT+cmtFqus1LDj9PY+Vz/03dsJOn5HEl7w5g3Ums7mmLzR61YEnMub
 WoRnBowmWuI1V0Y2M4GDVUMux6VtKKw94tctV8M7fPkDqsjn1fHAs/xvxiEK9Idb3Q5IJwlcfBz
 8ENdCKRMJBRA63cV4Weo56Q2ZpboLH5a1rn4XM3w7YX+r7Luk+pRXBk8QRnNaT175+x5vVZvxfj
 j82JW7+aTrJpXCyEhQtEByPnXKSyPDBh4DteSGDvegfGZ9ba5993lWvsrYZdOH+cRhntw2BreDi
 5Asvet0Dh06fA1qbfYw==
X-Authority-Analysis: v=2.4 cv=dYcVTnXe c=1 sm=1 tr=0 ts=6ab8a7ab cx=c_pps
 a=FYRcjPsbj8Vbl0y3HSZiwA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=xq3W2uTSAAAA:8
 a=sozttTNsAAAA:8 a=iSLACsKqq3SO5U7miusA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-GUID: uJqjNr-06XrZGCw9t-SMl1quZE9FFdUa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDAyMSBTYWx0ZWRfX92nWPvbxGb5Z
 I9UhluNfas9/W32Z4wQICTW290JlzSXlyYRhI2vh84NfzbZtAunWHJA525mZAZ1BaA27L8QroPp
 Jy+mU9rnHI5C9onEGSaa5Dpnf+ChWLY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609270021



On 26/09/26 20:22, Laurent Pinchart wrote:
> On Fri, Sep 25, 2026 at 06:59:57PM +0530, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> Add 10-bit RGBIr formats to the table to allow capturing them.
>>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   drivers/media/platform/cadence/cdns-csi2rx.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
>> index de7cce76397a..8ed730452d3c 100644
>> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
>> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
>> @@ -173,6 +173,14 @@ static const struct csi2rx_fmt formats[] = {
>>   	{ .code	= MEDIA_BUS_FMT_RGB565_1X16,  .bpp = 16, .max_pixels = 1, },
>>   	{ .code	= MEDIA_BUS_FMT_RGB888_1X24,  .bpp = 24, .max_pixels = 1, },
>>   	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, .max_pixels = 1, },
>> +	{ .code	= MEDIA_BUS_FMT_SRGGI10_1X10, .bpp = 10, .max_pixels = 2 },
>> +	{ .code	= MEDIA_BUS_FMT_SGRIG10_1X10, .bpp = 10, .max_pixels = 2 },
>> +	{ .code	= MEDIA_BUS_FMT_SBGGI10_1X10, .bpp = 10, .max_pixels = 2 },
>> +	{ .code	= MEDIA_BUS_FMT_SGBIG10_1X10, .bpp = 10, .max_pixels = 2 },
>> +	{ .code	= MEDIA_BUS_FMT_SGIRG10_1X10, .bpp = 10, .max_pixels = 2 },
>> +	{ .code	= MEDIA_BUS_FMT_SIGGR10_1X10, .bpp = 10, .max_pixels = 2 },
>> +	{ .code	= MEDIA_BUS_FMT_SGIBG10_1X10, .bpp = 10, .max_pixels = 2 },
>> +	{ .code	= MEDIA_BUS_FMT_SIGGB10_1X10, .bpp = 10, .max_pixels = 2 },
> 
> Raw formats will allow supporting all possible CFA patterns without
> having to extend each driver every time a new pattern is added.

Yes, makes sense !

I noticed that patches for RAW format support are present here

https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata

Is there a plan to merge these into media tree in the near future?
If they are still under review and need more time to get merged, I’ll 
plan to cherry-pick them and rebase my work on top of them.

Regards,
Rishikesh
> 
>>   };
>>   
>>   static void csi2rx_configure_error_irq_mask(void __iomem *base,
> 

