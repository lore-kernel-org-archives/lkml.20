Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C753B4E36ED;
	Mon, 28 Sep 2026 17:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617622; cv=fail; b=AszVZZd5pY+v8x2qPMfbWkMywfe/ZXBUGM9NcpFbpXAGWdETu6x9nzMbcw3xU8/QT/Qp1QY+cz82qXMb0Ng0NFh5+t4w1KM85jyALWtMginu+O+aYynpDm8gjks4ClPXcyj4t39l0kle5ScrIjw6w2xXYv9YiZT/sWmPUOqz+XM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617622; c=relaxed/simple;
	bh=iyhd4RvwGt7d2iLrBP6I6iAs1cLm7BGsdMi8Pbn1G1I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=eB9fS7bAVhCSJKhTc1jv1TlriUeRfKbnvmIs1zTs4vYjBd3pLu1uPMosSdkineOxxjUn/c5ujzENqyVkIksXF7Yvpz1bZhaXQkeE1L6rq12L2fvWP5YVsukqQOu4Hisl4uZGLOIFkQDMuw1zU+d9JCz4fwaVKpKeiJN/anWAtDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=hNI9YhDy; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Cfsm0IDG; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="hNI9YhDy";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Cfsm0IDG"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68SFK1ZP2811903;
	Mon, 28 Sep 2026 12:46:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=tOG1+pDk/GCoO6SDBBgBPNKn28Mg4npdpqvN3G1p/
	Qw=; b=hNI9YhDyaV/BNJZVPZ9/k/+vf3wJoyjSAXA+bkuBJEBVnfeXXu1FvvQ2f
	9pjYgYLc2lmS0A3V2ZYF6nlqQYUNIun/zMeyIiZaX+V9uylXyKTdssqAwEGE2E38
	UuKq1WfdIyk7aE6yfiucUK0hN1zKrhaoW2iCQoogEwi24F8ea0ow4bpvochaRpuq
	M15YPFCncR9Quh/vZHPcVI+cQ64FuUb8SkwLYlOj7f8qs5dHo6XZ5q5IbEdUhNNv
	u2yyorA00yFS49ST7OZIH+Nok4RvAs9sVfpwRJk2ft9QxkdmM1vA2qGnMLD1D3DD
	VoyvNDr09NQ5rRzJPvKTyThEfuQRg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gy00nfchs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 12:46:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBitfGG7qPNclJMOwLdsPierzG2heh/g0lHI2m6UE66LJ/+hInt+aD90+h8rzWWsduqeT83/NWQp1YwSKp5ukhmwZfxiiucxZNmCaTPJupQXYSIyUUKbSI/alRln7hIaNwfm2jTjvAtyjpg/pBF7UY8IZ+eFToWAF0ZbpmYhsvPOx4tHT3EGfVhLGPinDh1BH4/3WgbGnUec4ZeNh4ry+tnipWvjxW39xA9e9V4MZfoCvO5fmcIu3dheS3wAbLLYLqsmNLHpA6lEQR6Zcl8uFLbOEaCunRsBTbOvIsl8fN1OIK0RrZk8jV1I7DaZExOGOqmR/P3Gu5uD6h7VH7VlKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOG1+pDk/GCoO6SDBBgBPNKn28Mg4npdpqvN3G1p/Qw=;
 b=b2sFMd6wxJDDfXWNI5lMw4qErZZtKA5G0wtusHaZLFiCr9v+G3uNJ/Jek8EV85KRby4f9/N2BX8xAY3yWtS8NzP+jKU7k0kh0rN5q/sO/i8z+YY8q9GJPtwPpuCKVcwko5jr3poIPjWVQA7p2XrpevCv3sXFi+9T2AA/t/oBbowEyajJ2ik2GgK7cu3HvjBr3MsJyQqv/htf5GYOys9t1bkbCTpz8FknexIKMIYSkg2q/Gq0sTuM9xoPS7pagV3uFTXxE/Bxe6Caln1yj7UC1wxVMemeyU8QAsr7ZQ0qv5GlPrHUFpmgn6V3Msb9CdYsAJeDkARCPEu4GaNdnuu+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOG1+pDk/GCoO6SDBBgBPNKn28Mg4npdpqvN3G1p/Qw=;
 b=Cfsm0IDGtQ0ire6lOLJDixMUwl8IFP37IrC1wazKGJg5pdSeLy7+0WzHbhul1ICcwBNO589TiKMPyVOpPXzN4vgO3ZYK7zt+McDxJkGrf4jNW+EXwSlooXHjpNrHY8Hg0RDjvhQtjpRQvn8RkxEeu6FPLcBwhdd3z+WtMcpDZ6E=
Received: from MW4P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::30)
 by LV0PR10MB997589.namprd10.prod.outlook.com (2603:10b6:408:340::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Mon, 28 Sep
 2026 17:46:53 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:303:115:cafe::a3) by MW4P220CA0025.outlook.office365.com
 (2603:10b6:303:115::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 17:46:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 17:46:52 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:46:20 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:46:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 12:46:20 -0500
Received: from [128.247.81.105] (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68SHkJve3607452;
	Mon, 28 Sep 2026 12:46:19 -0500
Message-ID: <decd3316-5c84-4f6c-a3ba-47501634c5c8@ti.com>
Date: Mon, 28 Sep 2026 12:46:19 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am64: Set MMC1_CLK pin as OUTPUT
From: Judith Mendez <jm@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <hnagalla@ti.com>
References: <20260928033027.1077689-1-s-adivi@ti.com>
 <20260928033027.1077689-3-s-adivi@ti.com>
 <850e724e-539c-47a9-a284-2cc8d362fca7@ti.com>
Content-Language: en-US
In-Reply-To: <850e724e-539c-47a9-a284-2cc8d362fca7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|LV0PR10MB997589:EE_
X-MS-Office365-Filtering-Correlation-Id: 740e7489-86b9-427e-f1e0-08df1d887b24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|921020|4143699003|10067099003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	dY0271ZK3dvNm9leycM7WQO5CDa9HiRrndMY4ISh0YreyI9siGjqc+tVgxHndipd5/dJdILvCDrJq7MOfsvImtcgrPwvHhZyyo5hJ5ocbvhhzqMbIYd6ZkIBQM6q1TR2MQgT4PER6jgSfED1SP+ljMkHJ5VcQ0+4ht/ibdqvOYeRQAht4YJf688JPrVbBJYX8p1KRCQjN2XLoFCXI4GLQytJzit14o5Ax+j+oWiDBkccLleQJ4R3EJGS8n7RkrCJbSizj1BJuZ9dHOqnJAwZ6yQ4bsDahHTLtZ9PdlM0FllyfxBy/ZxYokLwMFmtTVOTnmmXcJhCGeaksTq1x85s/2uZRsIyMs0BnNLtqBBitEIXz9myW070L9DQ3iXls1ipaLGT5CSpwOIPLD4fPVMwMoQhO8tsPybhkw1y0w6vpUq9PIYre0Ykgp2NzilHWffyFkCyPMBMx8eXmHBsNq01RLAAPMNML702pQITf01TO5wOkg+DPu0SPNgQ+EqFWOoKxG5FMBxbxiZmMYOiGTsf1ufy9jFKAXGNOxvdguoqbdmTDqFooMJPYUSNWemx5UdDzEvrG9CJw7snpoSITBtFgTe6pDiMs3vCLwCzC+ogDhFPpLJY75NWLA8dD+z2TZiyttYS3xiru1aUNJm/0wPI9IqrYJux0L2esxoePtBgyGapEwS2j79refEf6vnrSM1ztYK78uzZyl1SB6eBe+ThIs+Z3i+9sQg+VhzpDwGG5QjISnjcSKaL3USKvSaF19FP
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(921020)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZnbIZgivOgvMGt8tpRMd9v0Ho9N7PCwhrFbagzq503WDwOFgULZy+4Dh8LeK5BBZUAb/iNXTqb8373iQ5sW0J1meDhJaiNjZX5JLF9wl1VPte8IoOVZOz43i9tXC5k2ZhCFKD+k8dUDFGG358kVPLPoSBMK8Lptv2s2vPPnCaRRiAGaxbXKlO6YmK20jSmVHnjViUJlOZixIdvz1QlbJqxivsQvA0refk6Vs4LDZoi4Nack0+EMhLF05K4V7iDkznU/Qy97Lmg/aDHQ1J7LdfYkPTQ/x0pMqOpvqTnULESBXjez7uO4SE15QkVq7Xxu/gqMPws0iQ63Pc+r9sC2rHxou9jTb2MALlIG3luXvJ5RHl8XWTAsM1fqysBzwCgYE/MW9DV0PoznvepwSNQNEmURlCfLt8kltLsGEoIc5yJ73MGajrDfUdQH16/9QB8Az
X-Exchange-RoutingPolicyChecked:
	HJMHQPsw/8qyP2AhUvhaHyCIZYqBWQs4HObz4ftqg7qY0VWoICKf96WOQLyZaiMdV4BJJX6BOQLMjh6HV3NsFu0AUxqey3wQ+M9HPlEqhVkq7GmDetS57cCZobHLWD+6mcLiJVWIZyWpQAHpAy8AjTTVoV5i1jK++tBctRvF+72FJvhO3P9JEj3F6m4qbQxGU6NqvLKozXYjykhQQkBdsoch2PWlWun3w/7TjZjEZtQek8z25Zo0LiCMkeiouiX4Nk2Tm0ocwEgft3JZtHTGI7yZ/1Dmw4utfjlFiquelCV9XapWPIxaKjPLafex4aULa6Nf0xWaTqPEuI85ShaqKQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:46:52.7404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 740e7489-86b9-427e-f1e0-08df1d887b24
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997589
X-Proofpoint-GUID: 2WNhRAbIobpYE1LEE6Ur7C1WHi2kwzPd
X-Authority-Analysis: v=2.4 cv=fKysTpae c=1 sm=1 tr=0 ts=6abaa810 cx=c_pps
 a=/yS4kdDgObtqNMJizKN72Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=ixwaKgakihH2otXhoW4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2WNhRAbIobpYE1LEE6Ur7C1WHi2kwzPd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3MCBTYWx0ZWRfXwsZdFeSVvyqW
 LcRtEWtVmtYDHdV6jG4UTcifu0jTMFG+wbU3LXj92R+0717dXh6eABVzGA8WxVmD4T8Swrh8Ld2
 +iYWgye/LBjVl9exg08dscn8cR5PKoM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3MCBTYWx0ZWRfXy1bXQ99zuMUu
 zylYrsqAZsTeUvVWSiziE631Bvc6Z1255hxf6YbiaIhDKku2QcIlRFizCxoA5S1xykGu+eiE1Ex
 OzEfQyR5qgth6DRPOoCt/xAfNqh8BHZFiSerXehjxJqTwKzimfNraQXZOHF7Pbir1W9joditHY6
 39OSTTQvjS1eWnMhs/ERg9k88NGpjn0ZexfoVA9ZM6BV8zgQVwPXT2CtvE1SZ+RYBMQ9N7C7Mrd
 qfYTUepQXEKoP8MMkVMsGcKqbcutQczOJGabZKkBy3kMhmBPZsy/dFq7LVwwek3mg918QGXtD9k
 fOzkg4H+i9Iwgd3uTmf5nTGoiz54HE2X8L96k0P7iLqzBL+/yLHPSiHte8+4RMUbSbM2ja6LDOV
 E1lfN3VXk9QE/V449XSaneD1NgKjY7/LMsaKxQ/Wk2FO8VhMfs50rO6I/bUiSV5UJCg4ZK9tPRq
 bvkgSbLyoPwX/wVK8iQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280070

Sai,

On 9/28/26 12:00 PM, Judith Mendez wrote:
> Hi Sai,
> 
> On 9/27/26 10:30 PM, Sai Sree Kartheek Adivi wrote:
>> From: Judith Mendez <jm@ti.com>
>>
>> MMC clock pins must be configured as OUTPUT-only per TRM specification 
>> [0]
>> with receiver disabled (RXACTIVE bit = 0). Change MMC1_CLK from PIN_INPUT
>> to PIN_OUTPUT in AM64 device trees to match documentation.
> 
> There was an issue showing up in automated testing that I was not sure
> if it was attributed to this patch series. So I was waiting to see the
> error again to debug. Not 100% confident this should go upstream yet.

On top to this, this change also needs to be added for all AM64 based
boards. But as said before, I think we need to wait a bit before
sending this patch (:

~ Judith
