Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4431E7C18;
	Wed,  9 Sep 2026 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968230; cv=fail; b=M739xn1ppUMKoVgSu3c1eB6R9zBxHecfgUml8F7BktkSRnvqBWKY18jShVaYA1SoTdJy9I6Cq/bWkT5y8xEchedy7ul7pNICWGEhfJg8Y5vB8mpO5V86+luh5CHii0ZrRKs9oyjRgsWbb1l1Wt/im0J/zH4qdvFaSNjOk4TICaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968230; c=relaxed/simple;
	bh=TLxdpKfA5S7hxtShBR+rs+TnNEoMPkLbw4qrWwnu7WY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DtAYasep0FPVn0iYfeoTS5m9j3ty1YqnOYTW5FipsDk14N/SboywQZH+zrm4P803N3HKHtjZbeVoSGqyCuM/AxHS3MRudOzAS1reKTKyUY6LuRe92YfAFz/G8eZMWA7qbp9DlJus8YDMeedJfdAC3tMZjpbg32OR5PCv3r2lq2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=kQLZIBBG; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RIhn0dHD; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="kQLZIBBG";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RIhn0dHD"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689AogiM389524;
	Wed, 9 Sep 2026 10:37:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=9DnX7mOqve94uhCla89+JPI60ZKLoaNj6YvTLGUH7
	Os=; b=kQLZIBBGS7wV0L6BnQHQqRuIM8TcE5aAZbAvr5+9pzx18S3E/zQ6ytS33
	Wn0g6lybZHOpVdzrhLvWiAb5cthBdkU9PH1MIZe1D279H7enDoD3rbCpahrnldhQ
	mhuwr2HOohuZ86yoM6C4/fVMixRG/cvxmMDO0Kv44oreqtBy0oaKZmROLxqYQotv
	frEkOhtxPKvKCpI0788mQQLDxoLPfc45NXXQzr/lPlQ3qyd5qfuzPfbWMsg/dGhf
	8FfqSxckQq4sCnmjf3ERXN9CtE1jktt4IVYF0ba+eek+RCFmM+MnzjhcBlAUX7Ic
	4xX0ZoFT44wY69TGB4g9IUi+B1aQw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012060.outbound.protection.outlook.com [52.101.53.60])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gk4aat706-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 10:37:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbxUHkORnkzULS2m3VUuDc9HorOQN3iUP07SsNfmE2/CUtSa1qFKeIYal/rewcqeVf3mzUQqUz1g7b1znyYYz08yUCKdVzPRgPvlB5ajyGEtsoQsVLpYIq0Txpekb4EL2Q0QFgBdT+d9QTqQA3O4U5FfqIb7TqAup4ZM+Lx2onoJ1NEm43C80gIpwMtDavxG13Z17ApKx97QrEaPDn2I7jRqPAedenKa5pP1XhSfV6meed5xTTJCxT19rSmB+TRElKWPlvJu/C1+2VZLSELYOo0IhYrH5GddyYYJcQ0bLtDhWfHWPRaGOM3iSoV1kVttK7HQJle/9JE+bqh7pySxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DnX7mOqve94uhCla89+JPI60ZKLoaNj6YvTLGUH7Os=;
 b=NrBJhHzDGoNt6RevpZz1Juy2dBA22uCqXsopKEauuWlPdUc4cuiuAJkLeUutOihO7sBT51vE6Ae2mlTnckjfUpWGCu5E6EWR3LcvseGzt7mIe5Kkj7hbge7rPWjauHY5zJ9KkMPry1GzjLQ5NG85XMwJgDr4O85Vx+WGP3CM+aq6Vs3JFVaE4y3f5IKvbrcqxFjHDQJqUTS4DAenfDxq2zXF+P3RFN+jMDPhQVOUHGvlKzKHjPcuKe50hATIaDRWgkwg7dqJAB+A+Q1EhjM/sTQSC1ZxQWn95OSrk3zZoJe0HbIckNH4uZoY+wKG2qXQl6e7b51VDplG/Rz1HrtD9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DnX7mOqve94uhCla89+JPI60ZKLoaNj6YvTLGUH7Os=;
 b=RIhn0dHD9uNaMLUqoHKyOmevD6USCyL+KfcW1kJLCvvOGqJF+iSMo0iyZszjbbbYXiMiSCUneMDsQIhTZGh17BhfWQpy+6VfKKNpL37UvYEpDciKPlIzZDkxRHRsQgOsrPT7g08m57VN8gsvv5QQEPMZlW4SZsK2Ai0dPGYgnhc=
Received: from BN1PR14CA0013.namprd14.prod.outlook.com (2603:10b6:408:e3::18)
 by CH4PR10MB8194.namprd10.prod.outlook.com (2603:10b6:610:23a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.4; Wed, 9 Sep 2026
 15:36:54 +0000
Received: from BN7PEPF000000A4.namprd05.prod.outlook.com
 (2603:10b6:408:e3:cafe::61) by BN1PR14CA0013.outlook.office365.com
 (2603:10b6:408:e3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 9
 Sep 2026 15:36:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN7PEPF000000A4.mail.protection.outlook.com (10.167.245.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 15:36:53 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 10:36:10 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 10:36:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 10:36:09 -0500
Received: from [128.247.81.105] (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Fa91Y1536891;
	Wed, 9 Sep 2026 10:36:09 -0500
Message-ID: <3079f9bc-5a15-40bc-bf8d-1b53c32ffccb@ti.com>
Date: Wed, 9 Sep 2026 10:36:09 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: dts: am654: Add 650ms power off delay for proper MMC
 power cycle
To: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260908170635.238775-1-jm@ti.com>
 <20260908171613.bpd6eo53cjtlrztr@macaw>
 <e8abc328-578e-48cb-a469-1e3edec6780a@ti.com>
 <20260908174934.pbbvtrfhlnjinipu@constable>
 <f99dff87-6fcb-4a19-ba3b-4d31e3835726@ti.com>
 <20260909103646.7jk5vwvyc7tku5yv@kennel>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260909103646.7jk5vwvyc7tku5yv@kennel>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A4:EE_|CH4PR10MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f2c3578-1aa6-4792-12a5-08df0e882c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|4143699003|10067099003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	gw0u5kgAPumenQXEBGrMKAqLHBB1Pxz2ZdY0RrxPO4UPCGteiBkN8jKwQ+IN75h0KPR1V/Il49MN94H6ZtbwaK64o9kgYNkKQZ6IxUXai+WG7LwrY64OGY4FL7ASRslBtWeZD4pe2gyOysaCUZ1AJTxnlI2+zPmud9pJ4HtIksMr1XsCETiaZ89qVearfzqO607efERdxgVezYCsqgIQCvYXRmXhDIqDT+ND8ViWbMffEILBIJl5a//OEu3ZWDb2Tscqw2KF6LgU3Av0y/KKFnZmpQFjALvBFQk+egH1w9loV/VnePWbjVGo+EH+5ilcCPdFQakrXJQIXvhuR8iOW534dbKSjSDA+P0TAAzRcm+EVU1y2QnbtaNrs18DCaW7hXFfMFHvaLdsraNKv+yULFAS8U8P8B22DjYHKMozpCDERzMNFcgwXroMdkc+QRg8mryOX9JP8pmUGgEdmlb97DHaOOyYye7sypmUEsm1sYNzLuAqj6wLsu04ZM6U6yAFgbUn9Zz25nKiIEpehc4vheiMhX05YIWpDaRFfXUZai1wjJGaZrGTc8BEgxoJPFSBD2OIlMFiacwUtElYXYKuEpfQDhsnuDlRn6hIb5yXWaAxIN8fW5e8EyZybfHOorNRvK/AUQqdPLF17/NhKufSK2SZKojLBuKxmEOPgrhg9agUKIvBaRmRUq1JCkVdygkhWr3HJ/oJQXIyeoYfyDsEZw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vCFbhaVBX+c0135jiNnPOZEdVB/mmMPl1gKA54Piy3vnBKJcIipkW6r+9YfB5bsU9w31POW0bSXFM3dFppXM4tAMTWH2ZcWY93JPA6X55DOadku7QG2RCfD3+IzaNslndoRIrXj4Ekdzz+PmSBuryPGsOMOOqA5B2ltXCWYELZd+KFkLAYnSBu6In38A+8/H/WHhDZxt3GJ7zBZbXeTWdXSq8S0Gu/qCVjRBCYTQg/Y9ZinlraVpn7QXS/1YU9dS7SEgoPTUQ/1f6BxA+/fCcu2523yLVwl7hzvld44WYu94XsKxCDaTtGUsUd8tyS82TjqJWEYIorNpzL9OR4LCeuZJj6QRslFTcV/4kWXf8GkR5XmAj/ptBDBt+s7ecRISHaSIkGRD9ZyIHsw9A/f+dGWqDuPrKU+kArDQoT3bFvBVnoueXMnFGkXWA8bgyten
X-Exchange-RoutingPolicyChecked:
	rDYsNDmKFOKNxiE1cU4sCOTDi8UZDi41JKbhdFymUDgO/GvtK7L5dZMQ3uDvtOfXjp7syleK4bA9nJoG1KmRGrbrVQ0v/1W1+nJQiIeGQbA5+X07RjtH8gp2/Q3/NT7dZe82FO5n7GiqOyQpPU9X+CZd2XLXTdk+Id72nCKaOGL9ngtFNIFTc8NgWKuHl+1X9Sz/VDqu7IxhdNZnxPLO31Oo9Aor45sPFkAiN0ybPId4RXcDFaMUscOV8s4o/BENaYqRiT8eltL12z1cKkmtx63G0KhNt7rawpEYXa0DEkO/Y3pBvUlod2HZs3lea0A2ZGTgxnco+14i904ufcOhiQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 15:36:53.1037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2c3578-1aa6-4792-12a5-08df0e882c57
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8194
X-Proofpoint-GUID: AFmtPlx86NlgM7VXE-0zeVq8r1e4-gHj
X-Proofpoint-ORIG-GUID: AFmtPlx86NlgM7VXE-0zeVq8r1e4-gHj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE3MyBTYWx0ZWRfXxrr+EV84MFb0
 mk2rBAWC69gp/3zPFDZBZrkEVZMzkPSk/SVA+kOj5kXGpaqPN9Xsnq9sXdzzFVn1S0NRDfvUprJ
 xpSilRDBIXF8Q7VwyVAGV6cLQozGC2NzZFsOqGAKdMfq8JN/8v50fTIruYbM1SVOVdG1a2AXdnE
 EufF82d2AaPH8tGGyeXj2yEb6fhshbt88ZnW+3VyBIg8e9DfzT6tqqCp3wQXq/a1V0PaxH4itZY
 b3ZOeGEZOB7DlsCRBLmBqnSZDo/aTUIhjLB+dF4CwHYjm15TJ/6TG47J5UPS2KPWG6Kmg4sA97M
 iDWXl8Wvmoh1hp4sdDt7PQD5AWZr+7FrC4xC4wXTOLDj+1AeMyymlQQE1rE8Ev6wdG8N16cLEiB
 ZVY80/Bn2l5Vfmg+u0Cn+XPatbeir4s9y3X+MfBnQpGq1B+ZUQ5n66BNxBQzE2fAsDFyoy0VFuh
 /9X2E/vdkkFO1lFr0rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE3MyBTYWx0ZWRfX/emQNTE3d5rq
 SHivpuY45RuD7S4yjTSiQDhP2Hdhn+cSGWe3FhUr6mP76HnWyljFOVapNGBCAkG5mI80LFtlj5F
 dNEA7trhxEh/W2m7zdDUUsrdVFwhRZU=
X-Authority-Analysis: v=2.4 cv=DfEnbPtW c=1 sm=1 tr=0 ts=6aa17d1e cx=c_pps
 a=yaJUXpcFNTkE3gTvo4ZtIQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=MsbBCBBioWvCGMzGvfkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090173

Hi Nishanth,

On 9/9/26 05:36, Nishanth Menon wrote:
> On 13:13-20260908, Judith Mendez wrote:
>> Hi Nishanth,
>>
>> On 9/8/26 12:49, Nishanth Menon wrote:
>>> On 12:29-20260908, Judith Mendez wrote:
>>>> Hi Nishanth,
>>>>
>>>> On 9/8/26 12:16, Nishanth Menon wrote:
>>>>> On 12:06-20260908, Judith Mendez wrote:
>>>>>> The AM65x EVM MMC1 VDD rail discharges slowly through RC circuit.
>>>>>> SD spec (section 6.4.1.3) requires VDD < 0.5V for minimum 1ms during
>>>>>> power cycle. Measured discharge time on this board is ~632.97ms to
>>>>>> reach < 0.5V threshold.
>>>>>>
>>>>>> During boot, MMC power cycles between boot stages. Without power off
>>>>>> delay, VDD doesn't fully discharge. Card retains 1.8V signaling state
>>>>>> from previous stages. When U-Boot initializes, card no longer asserts
>>>>>> S18A in ACMD41 response (already switched to 1.8V). Host misinterprets
>>>>>> card state and forces 1.8V anyway, falling into a bad state and causing
>>>>>> a boot failure.
>>>>>>
>>>>>> Add power-off-delay-us = 650000 (650ms) to ensure proper VDD discharge
>>>>>> during power cycles, allowing card to fully reset state between boot
>>>>>> stages.
>>>>>>
>>>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>>>
>>>>> Fixes ?
>>>>
>>>> Fix is really for u-boot, don't think I can point to a u-boot
>>>> commit here can I?
>>>
>>> You'd face the same problem if you are starting from a different boot
>>> media and then enable MMC in linux kernel, right? what was described in
>>> the patch sounds like a discharge latency of the evm. This was missed in
>>> the original commit?
>>>
>>
>> Not exactly. The failure is only seen at u-boot specifically with
>> SD card boot. Very specifically due to the MMC driver in u-boot and
>> commit [0] which is not reverted since it is technically correct.
>> The commit just happened to expose our EVM's issue first. According to
>> the discussion, mirror Linux patch may be coming soon, which we are
>> now prepared for with this patch and [1].
>>
>> [0]
>> https://lore.kernel.org/u-boot/d17a810c-e2db-4a24-a37d-2d7e02466ce9@ti.com/
>> [1] https://lore.kernel.org/linux-mmc/20260806162202.657512-1-jm@ti.com/
> 
> This context is useful in diffstat. I see the driver fix in kernel which
> can use this property not present in previous kernels, hence no fixes.
> 
> That said, please fix $subject for v2 and repost. I suggest:
> arm64: dts: ti: k3-am654-base-board: Add power off delay for proper MMC power cycle
> 

Ok, will fixup coverletter and subject for v2.

Thanks.
~ Judith



