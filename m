Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E330B3E5A17;
	Fri,  2 Oct 2026 09:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933512; cv=fail; b=X6GOGKqULTVl9U0QLyD7N6AxJpZfhkIuISQELquY2eOAlLXbgkRd67INUVRbMpx6spULgy0v+fYq4kYxPp0wfBrgfm7IbEPTNEd3RrHXFpwjoiwP+flRIzoQu9ADZo0Qq2z16r0bERwG7x5MBOBIFfhn/Xraq1mOCb5wtXZGo/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933512; c=relaxed/simple;
	bh=oh7/zfpex7NhLzv1LALwcbucTU/lvxIu2H8WYnaMYGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s0f0yNMeh+Gm2TEliinOoxQfCtI3YtDBviothDrW/pErUJzfH9Xlhi9kocyu87+aiegL2Hn/WYPoQriQWgYEyv2JH4a54qEejgCeVEbKW4c6W8h1SdO5I3/zws+hDAzurYJ0TwGUO/P479JSMPRBl5TSDprWhhXpCzSah2zqRvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=grOPhL4n; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=jqdXdHsk; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="grOPhL4n";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="jqdXdHsk"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6926mYug3829574;
	Fri, 2 Oct 2026 04:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=EiNpO3bvsSatruaceP+1He90MukfPaPFInzJlkDxN
	bM=; b=grOPhL4nqNZ+AWFF5MQyWY4zqhEfDvsRYUl5s/ZqbwDHfwulryXY+Fdnk
	A0yzt/Snu8ZjaeoUpuyD7+XKj/f5L8uhc4MBaCj0yaMIn7ZsfKYgHxE4emFlAL89
	N7xZZ9LZ3J2EB1t8xB/Sd/1F2QJMuB1gTpm/Mp5sOLY98MNCaVevwI4sTpG3+VbZ
	gjy3T7we0jlMJ63BwpHMGFChSs6XXf4usQbqg2E42b0dM2Ob0gd2nkp4gO1jZSiT
	YeTeIkTQBAX6bB1QWqmoyb07B+5TGKZcffHbLFZIKWCLBlUBXOcMTxO9nkFRcyDV
	ZhCtPusA3N8C01pMeXd5Ec1OXyFLQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011059.outbound.protection.outlook.com [40.93.194.59])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h27nxrqp9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 04:31:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqresviloQ2gBHRtEBAWeu29DkXJPLltQDEJ59ztIpUlTecKuW5/9Ny3PyGn0csS3GDqu7VCWrPsh69HwFL6UcgTgeEQhQdRslea28x2f7zp90NbTsz8MQxynk0Bt8sG1BOWCJPlfpxrWfyJaLpdZ3Kx1jCkc6C3S8woupXXr1AErYikjAWfkWiKN7neZ97ugqFUt4mpzpW49reQGqMrBS4at/NAKVRbA/UKCgynAXsw/nl8JLJNDVWIPMyPJyrf3ylEPaQBUIjoZdr8noMyrhHV6UlAQmbqpKABNfMWJoqT8Dye04lLJzycWyo3Yr4PgV5tiUzkGkOCTNEp8B60Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiNpO3bvsSatruaceP+1He90MukfPaPFInzJlkDxNbM=;
 b=b7OEF3QZ5BxoKlOVVI0JC0SP6NSXP6bc93cynrnLw1wEw0UZzq3CD89qtUVweiNsOjH7+0Xm/Mhgb3+gju04b9lBLoB3z8ThUOYDkKFQJdB7Oy/Aba9bB6CWxNCZhn7yE5rjhCN1uy5mOY5cphp7IL+WZNZFxTmnRsHcbwbSXefS4lfmj7s5GjdwoUSHwHL5rthrOiIjzFMm0JwJ8kw3FEf18lV9OyMCEFNtQBPeJoT22e/Q6WvbKTs2HCjvxbykwnvpwF/tF26OafW7QYT1rDaAyPzydKQ/vtp/0x7XiY07ljAy1rzfuZgZfr9u0xqMEHb8vJQc0RtEzKg2+c8z1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiNpO3bvsSatruaceP+1He90MukfPaPFInzJlkDxNbM=;
 b=jqdXdHsk1i9LYOMoXhjofNrLZe6Cz9mwgEExAt9F+7nlzy5Vt9cqN1Z7LjJ8gM3edrAE7P7KfHxtAE5uzsYSXW1/3kY5NE+ceEd859i2KIKrMJvYIWFHoxYeg6Ty7nYy+2ZpN3fMDGrl/Zy/kmCF8Ie7YOjFIK2Raf2Ck3d++Nw=
Received: from CH2PR12CA0015.namprd12.prod.outlook.com (2603:10b6:610:57::25)
 by IA3PR10MB8417.namprd10.prod.outlook.com (2603:10b6:208:573::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.12; Fri, 2 Oct
 2026 09:31:39 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::14) by CH2PR12CA0015.outlook.office365.com
 (2603:10b6:610:57::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.19 via Frontend Transport; Fri, 2
 Oct 2026 09:31:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 09:31:37 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 2 Oct
 2026 04:30:59 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 2 Oct
 2026 04:30:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 2 Oct 2026 04:30:59 -0500
Received: from [10.249.144.74] ([10.249.144.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6929UrAx2800342;
	Fri, 2 Oct 2026 04:30:54 -0500
Message-ID: <ac1d3bae-81c5-47b6-99f1-50e5b06c1a86@ti.com>
Date: Fri, 2 Oct 2026 15:00:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: arm: keystone: ti,sci: Add
 ti,tda54-sci-pdm compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <afd@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>
References: <20260930194131.117129-1-b-padhi@ti.com>
 <20260930194131.117129-3-b-padhi@ti.com>
 <20261002-observant-prudent-booby-eac28e@quoll>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <20261002-observant-prudent-booby-eac28e@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|IA3PR10MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 2926a0b6-cf85-4607-7955-08df2067f509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|56012099006|4143699003|10067099003|3023799007|6133799003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	38av0SqZRKCAHeVxANJEVLjH1niEXxO3wdfI+z1qfRBAgDlfHyTFKdVZNTOcy6RMnxnRjwuD1ZhmX5zhXiCTzochx0+Hw2di5vzbPiLu0LbD3cbo95gdeNypTngqUj4CTf19FfomPMjyKsoLEeOltKJXvY9ZaZ7pImHAeZWWfHxoixZI/Q8lhbHLKJAp+tkk8CfUjdqfPaHTiySj8kumOBGAUQc/jZQieIgk0P0zbdMtIqLK/I5NTllRxbPuSAoCS+d44ffhkDLsFnDEIT5V8OBvS/wwTJqeUBFCNQqa3kUk+EPJROUp+xhOvJk4JiRWq99RUwerxyU/6RCzWOTofitUR8pH73z0nRqHhB/++kMj0IAbuvWXJrUaeWyNNoW5LCx7UMbsYnQVOcb5r8NOER/JIiRsjTTYntKnqhLnzBTQRexCTbWvA4vxJ4BKHFQPfnTqK8kLfH6zpPg/8axB4OIt9NAgB8GpdtXBEZEndlOX+VQqJ97wjH8k8dmTsaIfkboJhViBW4OS33v6ZLQQ/AA2HUiUiVSHEsTVvXB8B8aVlL8YxzYecSj+8Vr6ZlSrJOnStujJ6fnXaKZXuTuKms/5kM/66D7LaoSRpzgVbChKsD63IMzsEaZm6Ov7hxsbvPvPSMtjuCdxSUYXiiqNvKILEyKE/rMO7UHU3rgVucs=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(56012099006)(4143699003)(10067099003)(3023799007)(6133799003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AbfqdxKEkN+U1/GKHKpQq11aIrEsj/+t0B+k5vCL7AbkwlIRWA4ofLmUahYxeE3WoK8rJ+wVR3GzRsRb/Qol2PFM6UczYX/mBpXb1qOZ/IcAPZnAg2t8C84aU+VDFn3u4qbotX83pNSNDn47wwrwz+DMoKo9DKhXH98em8PoKJJ2gcHz/hwmjIuC0L614Jhw3CqfEQDL6PmtgMUY57PAli3qoV+4uJg6veR97kXFVsh7GuCptyZbARCIUXJwzrUPJYXPCKUn4TWRWA5cpvHp1IxcNj/6HSOvK6P7Xt5ARn73/KFCWZAAThisW3w1xArCTJoqdLGwlCbfBg4SctCpN9D4D43u2L9696a8B7nRHA64gc2U99N4VrojoWQy+LzvfOrw/VGLTWv+/k1n6tknXnaw3I5JOLqKwA/rhgM9ebmt4gbLtnzZQMgwA/5SoAVE
X-Exchange-RoutingPolicyChecked:
	lj0qBQhsHxjQSJWEgf3abvNdm6/MzXILjo45tjhFdjdWfAHtsPaDVMVnIkNw03gKFqFvK/CsEaL0wWODffuS2zQUxiOS3C22H5UVMqvYoLAyAWRR76TmC+i9YRXcCoosMjFWUtDWg2Ntu0Qln7gUXEpdc3YBPm9MRdAkyXhuJbkArACg1QxOcbfe6eLrBo1uc2y+Pvrm+dMNb7Q/ZWozUtYf5I2l/dElMKF3gqiPK52S3i4erjtU5zpwopWPyj+gmSAjdF1N7J9ZZr5GsNsTe3qnB02WDJy7zew+mMIdEdkVoZaCM1Iq3Sr8IKfK8/gfjO+s8/2lmkUpBHTBsfLERA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 09:31:37.3720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2926a0b6-cf85-4607-7955-08df2067f509
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8417
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX2s2pJoZ+d5CJ
 gI//vrfAOtR2410fLJD2hMMzecS37IZHAS1Yv5cbPog2/thRt31A6nQD9F5zHP2GvQJBm/a2ozN
 2kdoI1UbY23gHU5kvZURGsi3pvULATc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX8yaZKtOg0dy9
 ONhx0xOJPOmsbBvEGBHFIQJIKLMduwNBHC7FMzn56oVk1OJR/mmLqv+BoD9wi+vuq64+KLdzfwC
 rEPv8X9HddSZH4zBTWZVIN7G+PzSwvuneYuL25RdDugEX+UQ71uzGOJKfFZR4FS8FS0Nl4zQDlr
 HY3ygu2SN776WugWpXCSLRKRXyTYEu1qE/76j26u87VKV12gNsWtOhbPYc64gim9Rof+PzbaoEP
 crgde36WhJ3EMddRFbjcZx1icbfQCyJJuSgmh6ABWPDVU7dksBIxc0oIiAQ/IKIKxJY3DkEY3KC
 poorSnCGJn0Q5mJ3V1OcC1dyW6860zl8/UiqJrWOJuuz9kyH7anGoanLE23Qqjc0m8hXCELW4TH
 tssm10c0Mg4WdLPmn45zEjbEErmdmVib3V+RJQLwJLVxLUuWzrFJxyplr1uBBBkrSPG8Pf5r4Dc
 5spEHnFYnQLL2dZeAzQ==
X-Proofpoint-GUID: TLIbDM4T6QFrWC1ExbgnuucKY06IS1eM
X-Proofpoint-ORIG-GUID: TLIbDM4T6QFrWC1ExbgnuucKY06IS1eM
X-Authority-Analysis: v=2.4 cv=Ps0G/AM3 c=1 sm=1 tr=0 ts=6abf79fe cx=c_pps
 a=jMLRuqkCa9WS4sFRI2wrKA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=rFO7FCmIUIVRndp9zxwA:9 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020037


On 10/2/2026 12:01 PM, Krzysztof Kozlowski wrote:
> On Thu, Oct 01, 2026 at 01:11:27AM +0530, Beleswar Padhi wrote:
>> The previous TI K2G and K3 architectures were tightly coupled systems in
>> terms of Safety and Security. All the TI-SCI messages from HLOS (Linux)
>> were sent to a single sec proxy thread terminating at the core running
>> Safety service (DM). In K2G systems, DM handled both Safety & Security
>> requests by itself. Whereas in K3 systems, DM serviced the Safety
>> requests itself, and forwarded the Security requests to core running
>> Security service (TIFS) on the HLOS's behalf. This posed various
>> limitations:
>>     a. Increased latency: An extra forwarding hop through DM adds latency
>>        in requests and responses.
>>     b. Freedom From Interference (FFI) concerns: Having Safety service
>>        proxy Security's requests (& vice versa) undermines the isolation
>>        and FFI of the system.
>>     c. Potential Deadlock Scenario: Forwarding messages between Safety
>>        and Security cores can result in a deadlock if there are circular
>>        dependencies.
>>
>> To eliminate all the above limitations, the TI TDA54 class of SoCs
>> introduce an architectural change: Isolation of Security and Safety
>> services. To realize this enhanced isolation in hardware, two
>> independent sec proxy threads are now provided for HLOS to communicate
>> separately with the Security and Safety cores respectively. And the
>> TI-SCI message forwarding has been eliminated in Software. The System
>> Firmware ABI5.0 version necessitates this improved isolation and FFI
>> change.
> I don't get at all how above description helps to understand this patch
> and this new compatible, except that this is not compatible with old
> variants.


You just answered your own question.

>   So 30 lines of text instead of 3?


The existing system controllers have been compatible in all TI SoCs
for over 10+ years since Keystone generations. Using 30 lines of
text to explain "why" the new system controller is not compatible
with old variants is worth it.

>
>> Add the compatible string for TI TDA54 SoC PDM system controller to
>> support ABI5.0 communication protocol.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> Note: This patch is independent and can be applied directly.
>>
>> Cc: Nishanth Menon <nm@ti.com>
>> Cc: Tero Kristo <kristo@kernel.org>
>> Cc: Santosh Shilimkar <ssantosh@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>>
>>   .../bindings/arm/keystone/ti,sci.yaml         | 33 +++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>> index 67acce8a559a1..f0548382f7d52 100644
>> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>> @@ -20,6 +20,11 @@ description: |
>>     initialized early into boot process and provides services to Operating Systems
>>     on multiple processors including ones running Linux.
>>   
>> +  The TI TDA54 SoC, however, has two independent system controller instances - a
>> +  PDM (Power and Device Management) system controller, which handles Power,
>> +  Device, Clock, and Reset Management, and a separate SMS (Security Management
>> +  Subsystem) system controller, which handles security services.
>> +
>>     See https://software-dl.ti.com/tisci/esd/latest/index.html for protocol definition.
>>   
>>     The TI-SCI node describes the Texas Instrument's System Controller entity node.
>> @@ -40,6 +45,10 @@ properties:
>>         - description: System controller on TI AM654 SoC
>>           items:
>>             - const: ti,am654-sci
>> +      - description: |
>> +          System controller for Power and Device Management on TI TDA54 SoC
> That's redundant, you just repeated the compatible.


I did not. The compatible says "pdm". Not everyone understands the
acronym.

>
>> +        items:
>> +          - const: ti,tda54-sci-pdm
> Why it cannot be enum with existing entry(ies)?


It should be. Will address this in revision.

>
>>   
>>     reg-names:
>>       description: |
>> @@ -135,3 +144,27 @@ examples:
>>           #reset-cells = <2>;
>>         };
>>       };
>> +
>> +  - |
>> +    pdm: system-controller {
> No need for new example which is the same.


Okay, will drop in revision.

Thanks,
Beleswar

>
> Best regards,
> Krzysztof
