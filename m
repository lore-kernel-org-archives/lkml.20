Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E944331A66;
	Sun,  6 Sep 2026 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788708542; cv=fail; b=ZOw60dbagp/gzlrxnKXcWohRLrcPxwiROaxJ0z/nrq58iheVwmjhM4dIgvtqiHHY48T/mse2+bh8mlt83ws/g9fCRiNav2pI7Jgo1/99wCvRe6hruV4RsMgfp4XFQpc66UgpdNWppyYgS2755sx0Y9RwdpU8DuWKrv71dV+biWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788708542; c=relaxed/simple;
	bh=jhBMWqGE5yJ3D0l/hiPjXhbpEuuyjP4LtVkt5oiUfAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mvVr4kf4IWB1mxHRQieAcYEfaBUx8ywOWm/9hCoRXlv+smirLmyKK3/G7+iam9JMZ4vJcTxKfWhRemhzDn5FMjWeYA1YRgkTutZPUHbCKKTbQoHEWb1eS6W+Ci7LhUpJzPa1334ZD163BsLwF8GbPw1YI1Qo/JG2wJWJEynO72w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=D/AcvJW8; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tK04dEEh; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="D/AcvJW8";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tK04dEEh"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686EXLTS964814;
	Sun, 6 Sep 2026 10:28:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=atxn2vgJpDUmpNs5SbO2jz0ppE43fFWo5yBmTVwb/
	mI=; b=D/AcvJW8m+RMiKhmeCgAZ0TAj4bKmmyag3GGP/To+snlykMg2aqg8ezmU
	dxqe3Kog86Jc8gxp0OOx4Dw9f9NRDWCC3o9gpjrHAoTfM7jlRhZGfr5dI6CaSCJP
	/Dd18pb4kMqy1wbwpIN9Or5oRPeF9VmabquYegPDsCKQP9svMbrN70VUpsE+KO0W
	9UypIAh13G5vpcRX2r1De05Cag4UVfgta8UlKq4u2L6zirELscPpr0WrHuGN4DaA
	WOHcLhVzatpSY0yXBOVCXUc6Y12pFJwuhTBFsgxwCEXccZYRW5ZP2xWQBqRTITIr
	HqWzTckP8y226CPSvX5A/H21eVG7w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010023.outbound.protection.outlook.com [52.101.201.23])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gh2f69b0c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 06 Sep 2026 10:28:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UP5Ozl3pFI8F0UeyiGmNcJuUditRCRg9qqgfO9Fcee5OHQTsLFUzdZ+92uYIY98D/TMRgu0PjIu+tpc4hghmEQLKXzNVLKPiAf90L4vm01hbJr4sRU6/TWZQvp1tEeyaoEoxMxecJsBUagdebcCb7tL+O/kNhxzm9M60OOQAxB/ZXQAIZSY6ufMS5pW5a/9jg83h9ajAD6oqkaXSfMO58T6nkXG7Bo/LrZyIlSzvPEXagaViFw8YPe3JppwujEX+yzxoVc2IDpLBvF1kKmv4viqWwrBjzMhvdsOLHDuzzEegYzfHjSWyvCblUobX3LrmocHHADnIVo6PmJcSimu+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atxn2vgJpDUmpNs5SbO2jz0ppE43fFWo5yBmTVwb/mI=;
 b=greRLx68R1IBVKu1jRdS9DEPvw0UoDd5RXfI5k1aCLP38ZhFsmx7IsLW9grc/5QIOzkRUm4as+Xr/LQv9jQ1Bj6CFC3POAgjk1cWVkfy5UHZJkkgbWrQ2/Ly322ooGurWq/hTaBLDJn/M490q8emSzTeE2GIYR2xXwX8hlQ309mekal8rfurlJbbwy2TnBdlj7qXzEq0eJr8pG23MCObhgYyLydLYc3+/ITsOhvUnTU3LP1XM2dE1aUWvGshg8UBKdU2oC6vP3UedxxS+s0l6NTwJqiYsqfHBSzbN5GnF0bsjSrPZWfu9lk4vHb9yMdYFg1M/ALJqnGvKFP2vlljsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atxn2vgJpDUmpNs5SbO2jz0ppE43fFWo5yBmTVwb/mI=;
 b=tK04dEEhXdVRyFjs59iJ/dVH+vTmTTm2jN3Hxvev6NlEwmFLB9ivXmJYJJazJHFzT8wuKkix/GtDB0bJAGb/E6SVgFWmJ/6+mBfGmSGGM3KXEdiW2X9uermBKRU8cJS+VgPj9eKdsPajxpZLrdQfe+fOkUK6uLAamxGk16BFUJ8=
Received: from CH2PR15CA0014.namprd15.prod.outlook.com (2603:10b6:610:51::24)
 by DSVPR10MB997937.namprd10.prod.outlook.com (2603:10b6:8:3bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Sun, 6 Sep 2026
 15:28:49 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::a4) by CH2PR15CA0014.outlook.office365.com
 (2603:10b6:610:51::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Sun, 6
 Sep 2026 15:28:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 15:28:48 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 10:28:12 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 10:28:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 6 Sep 2026 10:28:11 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 686FS8dK4035787;
	Sun, 6 Sep 2026 10:28:08 -0500
Message-ID: <f849a5f9-e027-4203-a684-1bf15d032a9b@ti.com>
Date: Sun, 6 Sep 2026 20:58:07 +0530
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
 <a935ba6a-3623-4fb5-a31b-fc58ea9dda21@ti.com>
 <5a62aa0d-c829-422b-b1eb-2b64f20e42d3@ti.com>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <5a62aa0d-c829-422b-b1eb-2b64f20e42d3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|DSVPR10MB997937:EE_
X-MS-Office365-Filtering-Correlation-Id: d30dd46f-12ad-420a-d1d7-08df0c2b8c12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NZFMsqstsoOkHHR0FweA02Cmi17NJsND1OjnA7kxz3t6NcdUVH6ToHbF3wirdpi4JZGrUC1PGopEeWUqWNk8dgHWR2SNuXp5FLMzyrv8g+JjK/NQlfYwQbDhfsuLfVUQ8M7A162gpu3kiq8Ugsyxy6Lx3WOiQuE4TfUVgY1axyyA187vnbUyOY69ZxNJGi8Vz5znJVILswuLZC1e8/7QEp4ieOEJ2My3qg3dR9B/431Dahkfj/6qZVm7aJZBh4d0sORozjvUueP5FK28S7UlkPQJ2zIXhTiNXeORmA0zsI0LDypAgm1CCVxE7W5br+7HucCWidT9/g2QuHwut/a1l0cdxjYfsC/x3jyrUsPup9jcbX+GReABFyTT/+I1+QiaXiYnV07wcDEtNvlpFCrz8katHZbXykrwTCcad2u/DdUERUcUIzq6rODn9uFsFWoazQo2DL3lRDVod8mGYvHp0AyJq7/VG7rFZmpCgyjXF/B9DiPZ1rf9dwFO+pqqXKyYoRsRnGV3cQM174kHrRgoP7PVhe8VvA+tCMuwLzgOsh1OhkF1ukqp8xCf+GaG/vE9jHFCd66DJDHiAiyFjhrgh1BvDzOKbv4ZZXGCBPzb4i2R+VWbNQ0Gxv/rMJ7+mhhrPSXZspLM9q107MSXXbxTJpC5GMZ+idYUVyyhQcomau8=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yA+FZ5crpQM+K0DzD+bzMJ6pDdXzAIinWmBqAcjRNBdm+w3NCAYEgn1TMOYwI+dCSKzOpgYhxG8OD6JUq5RBqfOSwXifJn0/wSbM1cy9ScJITLtt+cKL9xi+yF1tmihpN8GuR4Al5561leGAlDyn4z+TuaN6gcOpUvS4QAzTY5SXREqZXuDWNTdPkdnAlPH3/LxPCl7StrqvezO2Vh5wj12tETwBieYVQfchPplRQoTKpGnDKAWEtTPZWOiFeU+LRBy7MglAaN4L5a2aOllo7N2MZ25nsOmasdyWaYVHjPyDN7cMFE1yuoYTuPnoLmWd5LjJtX8d9FnPhxwNZJOfTNplDtdzrLQPqMyvNgMKv4oq0H1NW1UOh/vamBSB2xQo8LufTADC+DZqX+VLbqPYECM7ufLlgk3Edp0FtsO6FrY+my76Dm3L4Ya5zR40GrCJ
X-Exchange-RoutingPolicyChecked:
	4TujMmNzRHBVe1PbJOkya0P3H6nCVMgz6+II7JwWw9V1ch/sjS9ISjmkWtEAaxJzm3U0PRRZexyDJC4QJTeMioWTH1AQpAh7w3wL+A/e6qGAsrAoMuKFhAUSjKEqaeQy+RRYWJFnouChOctYbDFDqsq1Bxq8SxTXWYp4cYX5Ik2p9jv9hAgy/+ur0jSjajtWUWg6lnClMq5R3G8wWaSpgBSlaOwGPWgDFyanHLoj5feWJIfSG0QUvHzdiD9a28lNHDjFpgAgrwWZBQF+9H9JwRROuKi+w1xBI0BGm1VvCj2DBxoR27aIlzNhXfCdfLZMiABRsuXp215EB5AtIiCmEQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 15:28:48.2370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d30dd46f-12ad-420a-d1d7-08df0c2b8c12
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997937
X-Proofpoint-GUID: yB4FMfAo8HzRKdN4eJTJsA-UhQeM4z1v
X-Authority-Analysis: v=2.4 cv=Wqkb99fv c=1 sm=1 tr=0 ts=6a9d86b5 cx=c_pps
 a=xBU3AFOX62plvdJ7VrUh9g==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=if0OlxzLuD2TamzVNTUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: yB4FMfAo8HzRKdN4eJTJsA-UhQeM4z1v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE3MiBTYWx0ZWRfX+easdDAfnj/O
 jP2tZnAsa3fD3tmCmzivcMhNd4sfOd8cmDv5fn/vwWRraRNIH0KUKmXWFbtzyQmpdHRk3+f/t98
 OyDTEc/qja9eT9DD6DxWP7X+6WMsQkodLAazF1jrI2cHgDW5tKZTC6rtlcaWNVmyFpEGvVVE1PP
 eyvZK9xwaAudApmW/sHF2HOs/Q92qQcvhDTMSFjcojL6BjcRlIME3HkFg7UAYS45vPDav3hM84d
 7u4Hz6MIYVyonF2FIYk+zLuosKB8d9WGgATLHVGCIZ/G0XmIDorOYuGUCDQxUPLo455JryliHm/
 l40JYTC2pMBmOogUfSHox5gbh8C1Xd+c3tgDfsbeijlBL5GcgOyOzYcxfoT71I+59YBUNdFJUcs
 VPw2I6vXG7JEtOa++tOOmr4svlnZ0GzHdRFHJxAElQ2SlIvYWFB/EcGacZqDzJfeuWyBndFD5LV
 zcqumk4A4GpPUVzPrwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE3MiBTYWx0ZWRfX3+/AfDuzrs4L
 +/bNGu6H7tc3rrI+cFnDsBNnGCkaRgFSAvk7aQgWwqLdHXunSjNBpbegW7hw4eGOI1kmUsasgtN
 c0GoVFJl8zWCA59Ap5EMnFczpwpu1Rw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060172

Hello Udit,

On 9/6/2026 7:34 PM, Kumar, Udit wrote:
> 
> 
> On 9/6/2026 5:48 PM, Hari Prasath G E wrote:
>> Hello Udit,
>>
>> On 9/6/2026 11:13 AM, Kumar, Udit wrote:
>>>
>>>
>>> On 8/11/2026 11:43 AM, Siddharth Vadapalli wrote:
>>>> Add the 'ethernet0' alias for the Ethernet interface corresponding to
>>>> the
>>>> MCU CPSW2G instance of the CPSW Ethernet Switch on the J7200 Common
>>>> Processor Board.
>>>>
>>>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>>>> ---
>>>>    arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/
>>>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
>>>> index 54dea36b153b..ac1c1ffe40b7 100644
>>>> --- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
>>>> +++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
>>>> @@ -24,6 +24,7 @@ aliases {
>>>>            serial5 = &main_uart3;
>>>>            mmc0 = &main_sdhci0;
>>>>            mmc1 = &main_sdhci1;
>>>> +        ethernet0 = &cpsw_port1;
>>>
>>> Hello Siddharth,
>>> As default only 1 cpsw port is enabled for all boards in this series.
>>> So ethernet0 will be cpsw_port1 always, In case you want to enable more
>>> port in default config then having aliasing will help.
>>>
>>> otherwise, you can consider to add aliasing in overlays where you enable
>>> more than 1 port.
>>>
>>
>> The first patch in the series for k3-am62a7-sk has two ports enabled by
>> default, so there it's fine to add alias. Also, there are many other TI
> 
> May be I am missing something, but i don't see two port are enabled for
> am62a7
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts#n796
> 
> 

Apologies, I mistakenly looked at the TI vendor kernel where it's 
enabled on both ports. I think still the below reasoning is valid to 
take this patch series in. Let's wait for Siddharth to come back with 
this comments.

Regards,
Hari

>> K3 platforms which have only one cpsw port enabled but still define
>> aliases. So I guess to keep it consistent, we can decide to accept this.
>> If future overlays are added, this will just mean reserving eth0 for
>> cpsw port1 which is also fine. I am fine to move with accepting this
>> series.
>>
>> Acked-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
> 
> 
>>
>> Regards,
>> Hari
>>
>>>>        };
>>>>          chosen {
>>>
>>
> 

