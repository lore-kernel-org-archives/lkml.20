Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AEA78F2F;
	Sun,  6 Sep 2026 12:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788697166; cv=fail; b=aduAyFLv2QlVHybeA3HGQMhNU8CYErchuIaSrpK2i6LRLD68zO5KONCg8fphCfz+qPdXOJ98F+iqvIVybngHflZ3ZB8gns3EBMOFQwpuurGVo0WKWzT6CTsPVilVMdmFtvH4u3GLlpJ0wj5jUH3YHlqFLozUxNwNJWNpQBjneYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788697166; c=relaxed/simple;
	bh=zSHxxKkWO8t0nbILhivLWBynRX3CAk+kQynWpy+FI2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YlXrTQMPcCnEjBvOnpRQ9Z9mJtMLsO7kCibzgSKX18vKtuu3Q65emze8vvlRnzDrXwLZ/p86SdDMBeInZzB7wwBRXF4Eu+3JgTEjRTYk7XFDRQwwRVGTh0Jx9hIFnT0nwm4FHnx1RAOscAsYF4mriHdywbVB/6S1m5Qd/m7tmLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=bS47ifbi; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cQTS1u6Z; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="bS47ifbi";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cQTS1u6Z"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6867lgXr063048;
	Sun, 6 Sep 2026 07:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7B2X+IoJr1jpGdtDc76HBnENAB3W6OkhhgHfkiaZT
	mY=; b=bS47ifbiyicPKRySJ019mpOi/NRWThvAUZ0MRSj20uOE0+WnwucqKfgUJ
	EXxd9aCmuLFyo8vY9qpb8Fp+BZ4Ub15WzfZmulUsnsFctUuJxZ96foXm/6DhG5OW
	gNqtG12I0azwvb6kbn5ljnEURrsDNk4DlyX1Hxj7F0VqFDmzo20gB2aXm05R5j81
	ookEb4viBPohelR9IgzxetMuRuYsteB9yXoTg30AkyooV1fFrlPWFL92EjjEQYOd
	ZM3svvXH4RyFYiBTDcuD6WnrhlubpfZ9/XY/Da93UaFvZ6GZmi8b6NoWBHEN6+th
	TqUDUj4J20eVESHlobnu3uXfmhbIA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012049.outbound.protection.outlook.com [52.101.43.49])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gh43n0jwd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 06 Sep 2026 07:19:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOSKoIDMSQ/ueRBeoO+Gxjb5vz7sIcSehe9KRIJ8neZMeQF4b7xbiM5YNlrn/oNRzdsDJS5ngT4LGrMDzNBVU3ppcqJKsabt76IiirA/q1hsBjRDES0jmP9ua63nNmHjppL7c/qknqPM2bY5VEjuMvambF7bHTI8EjgQf2BAdiu5HD/G+YIOk9skraxTBlhO1Dr3H8gKkav9pbt14PEJoW6l4aObKGz40Ym0QMn/xHZNGN9/0/8phBZmeS33hUD9n1eks9k857EGiwKolRoyun2qwzyqN4EVGut39KfoCXkUdZUmez0UzGLvQV+QRGiZKtck7NM+fRkSh3t+gUP2dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7B2X+IoJr1jpGdtDc76HBnENAB3W6OkhhgHfkiaZTmY=;
 b=O9JuxkCqfNqMiarV5HfpxBd0VDa/vJ1FH8gjG9SWEw7CEgbGCj46E1JMzR34MEVQRP8X4JSdw05DV6hEIfXlzbZg4ngdW888anoDKx+UaAYZX9inA8S9++iPbHFrR7kFbqhRQzgJG6bITBD9/oravvKlnsLRVIzKoP+pm2rNFx4Fq4o6f4sxfxlByMjVMF6tOUk6egWvQgJjSEuGu77vWP46QXC/6Z3tyH8xmbsfH2LLGHILT5FoyZAGhKD9A6gVO+gU5LUzfU7ManDr+47WuzXBD3f/MXPN+PVlAM79nIdTAFeIWB7SI/4rKII3WLJd9MvqOhF//IcDXAT9gxN0IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7B2X+IoJr1jpGdtDc76HBnENAB3W6OkhhgHfkiaZTmY=;
 b=cQTS1u6Z5daFAsCfSYbwpW2uiqCavtPJ2H+aPhRcxcLlubGcq0wz5BEGWZOvEusRUbIKHhf4mtgrzxPcmuOvGmYt183bE03GmGDq8x9LvqZLuYdoavLB56rjlV90Yvj0aqIp31QRqL6E2NsTuoggTtvXAmecxmw/BpU+La4jijw=
Received: from BN0PR07CA0027.namprd07.prod.outlook.com (2603:10b6:408:141::29)
 by CY8PR10MB7314.namprd10.prod.outlook.com (2603:10b6:930:7b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Sun, 6 Sep 2026
 12:19:16 +0000
Received: from LV8PEPF0000006C.namprd03.prod.outlook.com
 (2603:10b6:408:141:cafe::a5) by BN0PR07CA0027.outlook.office365.com
 (2603:10b6:408:141::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Sun, 6
 Sep 2026 12:19:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 LV8PEPF0000006C.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 12:19:14 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 07:18:52 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 07:18:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 6 Sep 2026 07:18:51 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 686CImI13815676;
	Sun, 6 Sep 2026 07:18:48 -0500
Message-ID: <a935ba6a-3623-4fb5-a31b-fc58ea9dda21@ti.com>
Date: Sun, 6 Sep 2026 17:48:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-j7200-common-proc-board: Add
 ethernet alias
To: "Kumar, Udit" <u-kumar1@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
References: <20260811061351.2538688-1-s-vadapalli@ti.com>
 <20260811061351.2538688-3-s-vadapalli@ti.com>
 <b7147489-00bc-4f55-bfe5-2c9cb675c7ec@ti.com>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <b7147489-00bc-4f55-bfe5-2c9cb675c7ec@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000006C:EE_|CY8PR10MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: ed9dc302-661f-4821-0e49-08df0c1110ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HQSw8xKWw18/gWVQY9i4MDiY6QRhTmnlvE2JYtBEVxvu9W88n0qYrAA2V0hCa8AFXj9Syt4cONt3p5C58p1A0PqA3ItXrZMp85CwNp23mMfEajZDiWHgt+XlD5iytpiHI2DmQqwRrW21b19UH57VnwdiDoqEfQxl6AktaAKm1ZVY2dLs37IHAJWs3JpFosgANRRpAMEjy21315iKeiZ1pY6I44HYd0T17RIz+8paqHKhG6XrcMqMhbZ+J7hmdAMNSR+MDyirC99M6YGhC7wfr4ACp/Me2eAbHMP/t2XC5yvj7WJXCfMxqqi4skRpg64XEKOdBEybykg+xiE8bl9IAqZfajRp8+B34qeWYbhynAaRgsMR0grmS6CUQ0ktj5ihxUeLNfSzd7Th4HuTuPXWTL7VM4qNP6J9obtp2uzcTJoPxiFaIh6wnwjo0YRgFApLdy1qZiCsVTDf0Qy/ETTTD7p7mV/ja4j9bA6z1BfaYryqE7Iv67LMjWP85biyyo557ilvpTLDA3ACDXeudimvC7PK2u/i6Cnlq61MWpnP/05/0FFNybjPiHxxuOEOf6nySPF+cLOvOMfFuQKqWZEs8puBQESdVUm38qPxZcjG8o7kWBAjHBfWGNvqV9wmttDOqFapxGTA0e6XDWcN3VdlcheVbi56jonGe7q0AP17LelgSoLbarkB99t04vUytRktgU0D9GJXPYjYx6pRjVd0Cg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qezDmzWWaIe1ut7wARjMeAdUEgmNhtrv2ABeUyTqYzdpEregSspsDMlW9vg+0oFiFNVXu6ZUKlfMp33meDxCYWHqx4QgJxdJnnY5a2FowNNF9KT/BiSScazf2J2VBhwkc1X1wOAfVFd9VoHHYYEs2D0AvK97j9oAf/oY2fCsnPnTZTcqsqJ0DPDYeobWDQDM1JYnjLkDy6z8PKMlkX5zXwglVQFheUg5c/XiIOsSy9eNxbsTYVee7kfTDLTs/fJFF2s6IGzo3kdOyVcPoqsuOoyQ77TR3Upz1C4z57gwn8UkjyB7qztaM7Q97wjn6KLV026U6jHZjCe++gqeqOr6kZgX1o3GJNzggSQJCV/G7lNmX8ftRK1+MDxwWuXbyi1ILtsuqgsj+0GRcX6TuTqF5Zsxh8fEwzjHLcCGZJShEv8Qz1lDzWkFxaNVbiPBz/Pb
X-Exchange-RoutingPolicyChecked:
	w3jGJ5hyk2nm83k6a8JmjZ6BfwIL8v9pWG9OoqKscOH/guzFtc76ICloDXPEQZYktz9AbYRGvdS6D8uACBGslFjAEaZB0ks9LwuEE2u5/9O8mPLyjlMpdvGzm6xSn7I6TrLbtJ03L10sFMTSx0audXOCUk78kt3Y3IM5XGhXq7k7vAHUM/sXz5UzKnS5fEoa5DgZBfbPS2Ala2Yc3An0fYbYowswxOVs9iCw9oPS2m9FWdlNcr7mJ1ECd7V6twJPY4/5vEm8A0LHLE0rntuCDKmcRRiC9x+By1aI+qlx/vkz1sBZfLwVLXXOA2N8PSaG8fxp8vVui/0KvUuP1xv2Cg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 12:19:14.2498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9dc302-661f-4821-0e49-08df0c1110ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000006C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7314
X-Proofpoint-GUID: mGOiRXlYVoml7k3Dvf3SdDKkflJe-DyO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDEzNiBTYWx0ZWRfXzCDHWswr2Q3O
 CkZrPgvtNBUQj8uCEKj1hvyY+qLidw3GwTFIf6j1hPAudtIi4f2WMjnZAxH+G69MSmX0bunr7ND
 J37tqxagvh2GceesaVLMg261/7RZgk068yq+7p6bqhGnFf4koy6pjNxUAte06TDL5zkomAjNmK3
 e36BJnr61jMEg9Qh/Xi2zMlcLt/i4/5dMfUzV4W2fJXF/oh67hvkbWENKeC4Ai2oSUvm/duw2mG
 PVhuubNiAEoOeHIG2ePZD4o4S+MmpjD4Zh2Q6x+8IkXu79MT+wyRGv455ijUQXlsOfxY37zndVc
 YYCVbopvY9EIJYlrBKY8PdlWdBC8wP8l7N8zseK9pPjcCP/gc/f54Tps+i0tR6kl+09lmEeEXku
 kzS15uF9QfoenrgPidunJEP7hmVPeTs5X8wUb8myJ/hsyHpkrF0ise9zNSNlZ8JxP9McdTONN5N
 8BLpM1ND3FI+HS1msxA==
X-Proofpoint-ORIG-GUID: mGOiRXlYVoml7k3Dvf3SdDKkflJe-DyO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDEzNiBTYWx0ZWRfX2LgAKnhlQnZj
 Qa1Cqg7gq4E4eTS4Bsj2JOB7KC1ADKvRDyIIIuu2LL8A+W4MFgSg2WEhMlGl/URuGTiA7kAwksa
 60/Cx+uptahFc0a/HCUoTSri8H37IGQ=
X-Authority-Analysis: v=2.4 cv=JdSMa0KV c=1 sm=1 tr=0 ts=6a9d5a46 cx=c_pps
 a=cGw96uMdUXN41aDBKcSctA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=ybLVR-bQ3a4UdHOyz1MA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060136

Hello Udit,

On 9/6/2026 11:13 AM, Kumar, Udit wrote:
> 
> 
> On 8/11/2026 11:43 AM, Siddharth Vadapalli wrote:
>> Add the 'ethernet0' alias for the Ethernet interface corresponding to the
>> MCU CPSW2G instance of the CPSW Ethernet Switch on the J7200 Common
>> Processor Board.
>>
>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
>> index 54dea36b153b..ac1c1ffe40b7 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
>> @@ -24,6 +24,7 @@ aliases {
>>   		serial5 = &main_uart3;
>>   		mmc0 = &main_sdhci0;
>>   		mmc1 = &main_sdhci1;
>> +		ethernet0 = &cpsw_port1;
> 
> Hello Siddharth,
> As default only 1 cpsw port is enabled for all boards in this series.
> So ethernet0 will be cpsw_port1 always, In case you want to enable more
> port in default config then having aliasing will help.
> 
> otherwise, you can consider to add aliasing in overlays where you enable
> more than 1 port.
> 

The first patch in the series for k3-am62a7-sk has two ports enabled by 
default, so there it's fine to add alias. Also, there are many other TI 
K3 platforms which have only one cpsw port enabled but still define 
aliases. So I guess to keep it consistent, we can decide to accept this. 
If future overlays are added, this will just mean reserving eth0 for 
cpsw port1 which is also fine. I am fine to move with accepting this series.

Acked-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>

Regards,
Hari

>>   	};
>>   
>>   	chosen {
> 

