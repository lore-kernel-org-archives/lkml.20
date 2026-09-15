Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6210B3C09FB;
	Tue, 15 Sep 2026 12:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476112; cv=fail; b=jxAqamK8sL02QkKXNxONOJjlPeFYThNZrGSyOxLz4i4Yzxy/kVmiDgQX2ksLzwfZGpGfKscI/IyXixAeuazZG9zrGZDNyNa4k8JoV043c9Ro2QfF5+wHUV1lG2j5Dr9iSSz0ztSB1cQ4zp0nFtrS/xwa4hzyBZ/Yo9/b3Ue4c8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476112; c=relaxed/simple;
	bh=LWFPgjuuP7jeMd8pXLckCc4OT4Aghf6hI4sU8jyhcgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tUenJtjFfE9xs2oj7nT7yA5o+Qdx1MAYGu1pS+2E9d270toAJpPY+XUMaYp7n+36HmcqVw2JziZKImT+Tnt7jytbuufRNFXNCe/bb+/B1QQb7UFJLutXtH6rqALBjjJOGMlf4j0ZZVcE1S0UBEfHX+wCoHeH6QU3c+MIllO8Gg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ou9jhK/r; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tToPydE0; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ou9jhK/r";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tToPydE0"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68F9ei9q1480544;
	Tue, 15 Sep 2026 07:41:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=fhR+O9f2EAGni+VFkCJQ7C5wAr+F2tSvPpWYGOR2I
	Wo=; b=ou9jhK/r6mX3SsQQhTkx1FZHLbSzd0vmbjovCKnEqS4iBRBUvPqO8pxdt
	GHCT6iruQLex0WOgfRu0xNgIN1rlJw2XnDW7TIHJrQZ3V8YWdGjLY8yxotRRd35B
	7s6ASuDKSCsoT22+Xq3+D/7kD8DE6tVsBVF37z6dMc+KVdQ13xGDIx8NF4j6om3C
	PgT2oERuefJ2vwTc97rLv4mhKQulf0AMTEmHxumVFux3u5mwp/OOf5sZPuymBlRp
	z586izmw7o/d/Krk1Ls16vpfOguIG18SSoJfz931zoNNma2Q7O2PBqQe0x4YhfuO
	zGdZNGhdq6MhjC1Er50OdrPMxHNRQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012021.outbound.protection.outlook.com [52.101.53.21])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gpvpa3g5r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 07:41:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQ6+AvNJR6nknvHu+pAHoE/+C4OZaGm3AoCO5G+7ZQrMrRLi9Q/OvWxGxBudnkVghfWs8W2EKggzGwA6wv2HXJ4b3fkue//rlHccazhVdC6ssjD33RmBnsOl7hLiBcYmERZDx8VkgDlWTspfSYBlG5fJQI5AHub/Paq/yRRWhx+BEc9EBf5i3fUpNIpqq37jdllyzdDOeOacd0+EtH56OS4JqA2/PcNs475atQkl+9e7wWvs78Ib5h5OFA+Rx/Gld07pC9GfZh3eQCGJxcWaipTKszmrPP5hxB/Td0dyRPHNZEtvb2U70r3Irzi8FEbbDo1Fm9iqPBdb4ZmSH80Cgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhR+O9f2EAGni+VFkCJQ7C5wAr+F2tSvPpWYGOR2IWo=;
 b=bHtOoN5Qk4+L4o34YVtJL6brAI7q8L8DzaafD4RwqBa4F7o7YIvzMX88wxvOUviWRx6FUF06x3EcDj9LdzoXlrffMw+U0xgH4BA1m6N5hgdpJjGs8VNZ1x4uLIYePMxvUwsDndiWdR+Vm4queedbCcVw/iuWot8N4s2LDRZEiJ09/8RW9K1RChVFytaKu4xPCQU6oh0GaGG72NSyGXg8cflHApgnI7chzyHFI1AJPNYvXQ4IubijzbazwB36OFZgJNW8j4S8TIzSav+zqQR1gcCi+SR2vHkEHlf6i+GVWUHFSZflywZY4qxmo8Av/zdfp2GsH7HJKtz1lj7fCC45Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhR+O9f2EAGni+VFkCJQ7C5wAr+F2tSvPpWYGOR2IWo=;
 b=tToPydE0/6w7n7K5dAx+LVtj8XuStyTTlyVumpbFo6Bdhp/PpsY/GW+ipU3GHOKlQ/MpvU4R8XYpjnNPyR97+WMU9WyhGeeJZMiGhETh6a2I6x3DoOeGkwGLy2ZeUmYFnYrpqlekzHm+us3M5II1gf8HpYMOVEEgwI9OLCMPtOk=
Received: from BN9PR03CA0721.namprd03.prod.outlook.com (2603:10b6:408:110::6)
 by SJ0PR10MB5742.namprd10.prod.outlook.com (2603:10b6:a03:3ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Tue, 15 Sep
 2026 12:41:37 +0000
Received: from BN1PEPF00018073.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::50) by BN9PR03CA0721.outlook.office365.com
 (2603:10b6:408:110::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.11 via Frontend Transport; Tue,
 15 Sep 2026 12:41:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00018073.mail.protection.outlook.com (10.167.245.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 12:41:34 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 07:40:48 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 07:40:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 07:40:48 -0500
Received: from [10.24.51.39] (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68FCejOh3242321;
	Tue, 15 Sep 2026 07:40:46 -0500
Message-ID: <bacf61ea-91b1-454c-97aa-8c6e4ca07b16@ti.com>
Date: Tue, 15 Sep 2026 18:10:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH 1/2] dt-bindings: mux-controller: ti: add binding for
 event mux router
To: Conor Dooley <conor@kernel.org>
CC: <peda@lysator.liu.se>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vigneshr@ti.com>
References: <20260828100615.1700223-1-r-sharma3@ti.com>
 <20260828100615.1700223-2-r-sharma3@ti.com>
 <20260828-goes-scrawny-a5cf40c9514d@spud>
Content-Language: en-US
From: rahul sharma <r-sharma3@ti.com>
In-Reply-To: <20260828-goes-scrawny-a5cf40c9514d@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018073:EE_|SJ0PR10MB5742:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bed3421-4e8e-401a-170c-08df1326ad34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|4143699003|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	RwtAkVpdEmGxVWZo9rRNtdJ2QCTzCFrBw8LCe7UuB6BsNmwmI0Uo8+ygNvz9ITOAT1KbV7cZ9olU/Km+1B6+xNVwMeulV/5xwFSiU2lnP+tdqmb5/0iJPVrnJQYoLkcWaK+Pn5OMwAn3euYxK4Agz87Am1VU9WsJBz1d2OYMjiXh4YgOkKzmun7ZF5zBS4M5CaNAy270g8aKthahQi1nxagyVaf0/RIgPEnSXT19pDAJ2H0FE418/NE/BsmH9bWy8XWyDR9qAkrPKmM5khEDkXzEEAAXgCgugoaFmlNWOIpZfsoXPce4s2ftUtGm7xrX3Wu81Pn8vbciNhnupW1Fi/7A3OQKwSqLjAxDle/0nImITc/WZ3RD37wxs0yfhktz/R4/xi4WupMGXVxjBvI3cBLwAnPVxr7PtEeYK/1YQIMeB7Yw34zpIMxsEF9lu7jwv+OKVZR9tN3QU/kgGVclTQ2gDL1md3iLaxZ99md/Z2x+dKlsWwwB05oQ0dEtAdgx4VXv6PIsVLCrWyPqdSBwO7hzK024yPli+ifdiQ4U+kcXi3MPvRSJ/2ygiaoM59nd4PjJxW4f73tt0MLiKY6O4RO0xl3HdXEPxjsGMc0jpKiYsdhzF/+VdeKSbFJpQ8EskkCCjHkJOaJn0JbNWbymJw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2OsrTnZfXdFX4pbOkVNat0hJMQLnu3jqe1Qj4NRRtkqOhrorodRqiXDFrA3x0UCqNP7Gmfu/UE/0QO2ZsFjM0jXTgZBocoeqxB6lGM+qznIv9nPuwwBoEFqM33FIPNrdXKXvpNxuxNGpSASe+/PEJabhM1kbk2q2XQkqJGyPbPDLmqzGjUFpZI0zTWd9h25s8orGOnAysbdKyaEAwDVvbfO6e4Ym2hI8UdBFtvkk2DiMB5HxjvVB13EVCzmYLCl3w8nbd8dm3spwAy5Me0U082ajf58m6M3TKE7QySMubwAJESndD0P5mu6vNtsgw3ZmxoPI8c4Blj0Joda44modjLr5QLMQfM16o3yVogcs4YVwU7j4jRna+wYyKES3XzRufEsX8KDI8aHrr8C7QNkVqQnSChO120fysP9X9u3wpelsh3QTX1vtCipGPUfHkX/b
X-Exchange-RoutingPolicyChecked:
	bHl1UlZlHlr1iGvYAVBVL/88wfe//L1CoPb0i8W0Zah4F+MFp1bGdoyxGpSqgIwbi5ANKPRgYZb/0vKLY1RgK9rtoCdULsItMsdWScpj83JbGZzd+6C2Skjv55oDyyLv++Kd1QXGUY9r7t/eDQKAfel9dzz/IYv+FgzERFIGK2yJLc5/qGO7YRjYYHkrWlOLaEore3h9tkLyEmVvOMxO7D81PjvvZCPcKRonj8DOxRbQjqV9c44Lm40iekUbEdsGdLr+6G/+sRa8n/vxqkEhm3aMekOjotvVmLMPs+S12xFEDrvwqXRlkIYEmxS/F9yfG3GPzWcdiTfrltpcpp30dg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:41:34.4247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bed3421-4e8e-401a-170c-08df1326ad34
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5742
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NCBTYWx0ZWRfX1VP8pzs1dbw4
 cft+d5Hyh8CZjnnES/deuGStuwbaX2eg6qv156O32m4eLGd9grDe/OTnC58psxw04qfqHrFsg6O
 x6EM96paGxsyOvHWENQB/KShg2T9JQad4083SArEw7DZJuSreiIwozxsCMVqnBfwiShuNgHte9a
 8r4biOpv1WmH1cm2kH6B3/deUB9JQStcIR7zwMHwLA0vrvd3WUEiuFuJtHfOmQuIE3PV/i7xUeo
 mW00AY5uo7ghFTiKGRxhpJqIW1gHC+yVPWQopsaRFcUME3vOhNuQKP7xvO3RzZH0MRGd2910MXk
 BrXdEknwazBQkNupMDJNh7y5OTany+XZi7m/64pE7vZo5MDOVOFmkmAha4e+T4SUqeBHUw49YP7
 8+MMtCyg/0XmdAQqetUOfCl0cpshqR6hQT2Hek9dZ154hgVQg8VKciSDplnohON9DIXWmvL6JGX
 VfbVdSkITWd3EoxxLZQ==
X-Proofpoint-ORIG-GUID: PbbioqZOwJ09lPti7roZ_5dW_bSBaAa2
X-Authority-Analysis: v=2.4 cv=U7cHnuru c=1 sm=1 tr=0 ts=6aa93d07 cx=c_pps
 a=oYvfaNmKcCZhiE/ts8qH8g==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=gEfo2CItAAAA:8 a=NEAV23lmAAAA:8
 a=3ZF9nsvSjb65cSWvTIMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: PbbioqZOwJ09lPti7roZ_5dW_bSBaAa2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NCBTYWx0ZWRfX9p0HV/DKei7e
 eq/LG/1lHnSAfyWd5BAmxTyqKskLL9GOvuLyVmE8hgndEtXDoj3mx/YmzNUIW8OfMIb8gMX6xd6
 wAcUYTlX7NdMAOJ/A9GuBZEiB9DCKcg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150184

Hi Conor,

Thanks for reviewing.
Apologies for the delay in responding.

On 28/08/26 21:57, Conor Dooley wrote:
> On Fri, Aug 28, 2026 at 03:36:14PM +0530, Rahul Sharma wrote:
>> Add binding for the event mux router of TI's K3 based SoC AM62L.
>>
>> The TI K3 mux routers which route the GPIO input events or Time-Sync
>> events b/w peripherals instead of routing to a CPU.
>>
>> Refer Section 10.2 and 10.2.1 of https://www.ti.com/lit/pdf/sprujb4
>>
>> Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
>> ---
>>   .../mux/ti,am62l-event-mux-router.yaml        | 79 +++++++++++++++++++
>>   1 file changed, 79 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml
>> new file mode 100644
>> index 000000000000..a5ba7f78a156
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml
>> @@ -0,0 +1,79 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mux/ti,am62l-event-mux-router.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: TI Event Multiplexer on K3 SoCs
>> +
>> +maintainers:
>> +  - Rahul Sharma <r-sharma3@ti.com>
>> +
>> +description:
>> +  The TI K3 mux routers routes the GPIO input events or Time
>> +  Sync events between peripherals instead of routing to a CPU.
>> +
>> +allOf:
>> +  - $ref: mux-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: ti,am62l-event-mux-router
>> +
>> +  reg:
>> +    description: Register base address and size.
>> +    maxItems: 1
>> +
>> +  '#mux-control-cells':
>> +    const: 1
>> +    description:
>> +      Number of cells in a mux control specifier. This should be 1.
>> +      The cell specifies which mux control to use (0-based index).
>> +
>> +  ti,reg-mask-val:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> +    items:
>> +      items:
>> +        - description: Register offset (relative to reg base)
>> +        - description: Bit mask for the mux control bits
>> +        - description: Value to write when mux is active (state 1)
>> +    minItems: 1
>> +    description: |
>> +      Array of triplets specifying register offset, mask, and value for each
>> +      mux control. Each triplet contains:
>> +      - register offset (relative to reg base)
>> +      - bit mask for the mux control bits
>> +      - value to write when mux is active (state 1)
> 
> You have a device-specific compatible, why do you need this? If the
> active setting depends on the device or w/e, why can that not come from
> a mux-control-cell?

This is a boot-time/board-fixed routing decision, not a 
runtime-selectable mux that any driver ever calls mux_control_select() on.

Please refer below link for the IP block diagram:
https://github.com/lucifer-9852/linux/commit/aed1746e411a9f0ad7824f4e4a7121e6f56a4ef2

For detailed view of IP you can refer Section 10.2 and 10.2.1 of TRM
https://www.ti.com/lit/pdf/sprujb4

That's precisely why we added ti,reg-mask-val as a controller-side 
property rather than sourcing the value from a consumer's 
mux-control-cell: there is no runtime consumer selecting between states, 
so the routing has to be fully described on the provider.

BR,
Rahul

> 
>> +
>> +  idle-states:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> 
> This is not needed, you get the type from mux-controller.yaml.
> 
> pw-bot: changes-requested
> 
> Thanks,
> Conor.
> 
>> +    description: |
>> +      Idle state for each mux control. Each entry corresponds to a mux control:
>> +      - 0: clear masked bits when idle, also refers to inactive state
>> +      - 1: set configured value when idle, also refers to active state
>> +      - MUX_IDLE_AS_IS (-1): keep current state when idle
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#mux-control-cells'
>> +  - ti,reg-mask-val
>> +  - idle-states
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/mux/mux.h>
>> +
>> +    // Example 1: TI AM62L GPIO Mux Router
>> +    mux-controller@a00000 {
>> +        compatible = "ti,am62l-event-mux-router";
>> +        reg = <0xa00000 0x400>;
>> +        #mux-control-cells = <1>;
>> +
>> +        /* Mux Register addresses: 0xa00004 + (J × 4) */
>> +        /* GPIO0_40 -> BCDMA trigger 15 */
>> +        ti,reg-mask-val = <0x40 0x000ff 0x00028>;
>> +        idle-states = <0>;
>> +    };
>> -- 
>> 2.34.1
>>

