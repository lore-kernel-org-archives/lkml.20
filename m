Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D4F3ED3CE;
	Fri,  2 Oct 2026 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937090; cv=fail; b=PIusKAoXQfSKge0BascE/URGrraWQBAK915f20l29WfhdLePv29fX481hCnUbpNK+h/fGjZQ/jEDBn6LfB+AdNiY8oczOutJ7MIaZO5pIlvHCCfm9ARVy+Ur1pVT4iTwalLer8siNHNCV/CjdHAHyq7RAJ7tUOQv310EuMBulEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937090; c=relaxed/simple;
	bh=pDUbDPNwP4rfI8PKqV0FDC8ufobYWj5Z3rUvRSdWnyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fCTbuIVUFY3fmAZrvnjluduhW9Vbm15XcPBQoXu6i+gBbw9XiSrvlhRnwaja4Fyxw7spmy1z6jRGnEnrOpal5nXbOWgAWW8cV7TkM9mrCzwOZgd1IxzTH2/9OQv/BIdSTw5FsjYuA18RQ6H0PhUJx41zJ0G1bH8EE7DGgMW/dZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=cSyPRtDf; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=VKhnXoIs; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="cSyPRtDf";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="VKhnXoIs"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6929lme24170754;
	Fri, 2 Oct 2026 05:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=uY7egTLJgTJiShyzKIn27+OJ1tIuzCzAPAmM3w7Ei
	wY=; b=cSyPRtDf7ZQCPH/6dxYqbFqhHK1sJKCwHg05YG5j2guC0GKjBIsFWC7BX
	fE1PzOUixYez/NJ2CcL2s7fi4FsEysyr5h43D8F7djSA92zR3ckmDfD4chW2S1Ko
	oQ7Y92MVlY/AED++2iSkP/T7NLbWP8YYPO9ZXUW8dpqAOSXB5byHtq5Oj60oqdXs
	TpfPn64HIShWwE15MuPmhruILsNC7mR9IP4EWffxj9KIZWo4AMbR/XHGrso1zbNP
	YevEtfIvbp7sZZm//CtvmACSN/mmHmr1b6p999OeXI3hYuc+yYfgW+lQP764B6Ai
	qY10aov93tfTFHvyDuNoixVE4YmMg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010063.outbound.protection.outlook.com [52.101.85.63])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h27nxs0k2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 05:31:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=De5Vlv1e0lRS1rrM0JN5LppjZplQLTtVoi+aq+QYMXP+FHQTHg+pWGlGUHvxCys7gBJEW1sEW+MvQZHJ9Mlg2RS/lzvFWjIjsdBhYSgxNg2hCV5nXs63aQEQ/xvpkcatqrKDVVuCqMj5OpkdfcFRCPR6OCbuUx2pM8Z4piNUaP+7JshMsLF+UGqEOueyTrrE4wmqlfotHoL75SlgHnI2YfREIg+cIgbAG1LOCyDftviVfjgb6yVSHOFwe+HBnipx8RtbhjI1b3urFZ/mIWMA0b51w7N6mkz2gyA9rnHCvC/a3aSnB+hakIn0I8eXgAzHVJcyVxeB9ifyvojsWsayAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uY7egTLJgTJiShyzKIn27+OJ1tIuzCzAPAmM3w7EiwY=;
 b=Qa/i0oU8BWKPWZqVSOm2SfEgD2rxug8swHELEvJHzlF9ZxH929zVNvwh7PLOdk19rYiiFEeoHKndfsvcZekkNRt4OOTvdh2SgTpCovrinjtNWrReQc7OXZNV6k0NtZYXNaIgLswBCXygTSA7pmfL22/Sh9XbivtiLKpX0oo+cLBnYk2hBnUmsyctJEatGV6n3aHkfLreH5YKMGDyUvrRLbWw7HF7jWLvY6LiRCoW66a6+0c+4jw7vXUEVJBXVejm79K6li+bs33EaIXfso/etZN5eid3HmAQIwOqqS5Z0mDyOTmHh2tS9qZxBQFKNqSOJ9pLALcNT14LWqzbrr8OEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uY7egTLJgTJiShyzKIn27+OJ1tIuzCzAPAmM3w7EiwY=;
 b=VKhnXoIsrX+5TyT+hV0i7fIhp+jYUn1qD9CLfzb/XF/1r3axafe5Pj9me8hzusG/fi72CMtRBmZ2iOMRVLzVR+rRcQP1mRe6ZW52+k6G4DdqSyyoM6PHvJZJuEXfBcYJF3rR6wtah50yuWIRECJ4Ca2Ifxz7eTVjHQ84yZl8AhU=
Received: from BN0PR07CA0018.namprd07.prod.outlook.com (2603:10b6:408:141::25)
 by PH0PR10MB4773.namprd10.prod.outlook.com (2603:10b6:510:3e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.12; Fri, 2 Oct
 2026 10:31:10 +0000
Received: from BN5PEPF00046989.namprd02.prod.outlook.com
 (2603:10b6:408:141:cafe::25) by BN0PR07CA0018.outlook.office365.com
 (2603:10b6:408:141::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.19 via Frontend Transport; Fri, 2
 Oct 2026 10:31:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN5PEPF00046989.mail.protection.outlook.com (10.167.245.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 10:31:10 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 2 Oct
 2026 05:30:53 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 2 Oct
 2026 05:30:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 2 Oct 2026 05:30:53 -0500
Received: from [10.249.144.74] ([10.249.144.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 692AUlBI3824744;
	Fri, 2 Oct 2026 05:30:49 -0500
Message-ID: <33bea116-676c-423f-a225-80762d45c719@ti.com>
Date: Fri, 2 Oct 2026 16:00:46 +0530
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
 <ac1d3bae-81c5-47b6-99f1-50e5b06c1a86@ti.com>
 <7a66abc8-3b9a-4a9d-a094-e47e3588091a@kernel.org>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <7a66abc8-3b9a-4a9d-a094-e47e3588091a@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF00046989:EE_|PH0PR10MB4773:EE_
X-MS-Office365-Filtering-Correlation-Id: 084302a9-6c48-4a1f-339b-08df207046ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|4143699003|56012099006|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JVvWCX6A+Yq+3B3OsR1Ocphz+Ps7Oq4ljsCz+FTysp/NV5Mn47hZvnfm7tnDALacwvo0U4OzWnhBDbls+B6b/MoRURLafescwhylf//UQiP8PT13izeHp0aS+hV87vicIqVzUCJrUv7ZpoZy8y/TDlc0U78dezXeTH9FPyGQDz39bOG7iXsGo60Xc5Ze/2grPXbfFkUX/4ZmVm+jvY/icSUnB3xm+c+MrxJIEJdwu7B6p9NcB45p9TnhNahNCaZuqvfEXWGGIJNqyNNoSMKfsuuTsxLi7yWl6fgLW9ZPdKhItYyXRArgHW3y7ZJPQdn6aIPp9cCwB8XUQ8W4b8dVdKQKTzV5ro7vEjhDON2Mt0zpiDBDlnnFxs8yyhZryw7BCkqkUoDkiFcjum8IGvi2o/1hJFgNtOj7GCMme4k+h3Yb8zU99Hy6s41PadGGTCTD8XDfbVEmnQos+l8S+5rTWdsA5Sl/wxxbYCigtnU6qhgCJ4BhQsT4wrEIhhne6Z/r55I+E58BDoB1QOc/hY5wGbn5EQrodcMVnqf92/j1kcvS6HccNJTR5ZQOztLPqQkA22dSbH2YFPIe1PxWbFIQI+rnWYtdZz3SpyoGo5qAsTT0My5FU50hn8IPLfqsDJVa6AIqLssPJFc1Rd87Rof5xyA020aevj4GBG/jYhx2HZFdyM6w616j11GTc6kCng1tLiI/ui9vh3I/RCBCZ12a0Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(4143699003)(56012099006)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JvE8zH6ZRobSLLjJMG6B9ddTGS1fYSLa8Wg9DNlJwE50wX/AeUe/sQnn1hX/Q+DFVJPCxZj7uGLshjsX7tCPNuPXHfipfgNjWNth2y7m4dmdWqgz0fb15iXkm7NLRDKWtilvwsYEF0aNdt9nNnMxlo+IJz8ESyCDqVy8EpLsaw6a6yxB0AXK+G4xdTdHn4Y9z+nhFjCZfRJE/lvAlJg+yMHNiCl6BGhFp1yvWhzBiA0ao//d23deLDEhV+HtwWaZ2oB+7fULAMnijJkfV8OdzIZNVwZlDkXPakQrZlr5VN9TvENIIL8nwlQSWWeNxo0u8uVNG1tyL6a54fwZpT/RwEAeE3JjA018lN6MZllSpYnK0/+DHnJFYBjdCmmPkROWhay8lw6g4HZ/6iwQWK+Q4eRTszB44+Xxu+wi1S3oxd+ZXGCI+RG11LhNpWF54xkV
X-Exchange-RoutingPolicyChecked:
	fz66P36TyPPS6raMeLWTbq3SYErUUOaz8bZJlnilZX5yL7zKagjvrN9zfUVdECQxvdJ0ZnghuJk5k21seXOhYMruVYtHqtb01UJedTaiC/lpQeiOhGbYY+rN6FlT9BOYSTr0q9ZDR0nXdLbUdfHElFkxCBV2U+P38L1VnAhgLELa8qFpy7M0SKvtIdH+hbl6TaRcoEiZibJ5SVNoAwxb4oY4OtmEuw0HV568Y3mb3CnLolC4CSPs5PZYy04ybrUU7n6tngU4dWTwi8JG5qexI2Hyk2mTX01hGbvNOfT9ARvUmLXnTUGN15HV3QBGa95tALHHRL4aJi3pVlLCnUoUMQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 10:31:10.2816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 084302a9-6c48-4a1f-339b-08df207046ac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF00046989.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4773
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MSBTYWx0ZWRfXxkDwNkHqWsha
 kXZ3/adwyrGXgvxGuC0kVmwL9+pg/zjWsHLLBaZ/SCSSBeoe5+h5Ilg4iR0slYR4cyFk9R3CeBs
 xgw6cAma6rAIzW70DEDQkjoMu7zPcWM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MSBTYWx0ZWRfX8xABdrTbZl+C
 2B0cbl2ONuXNI49RIXIChVIpXsOJlNwO1htLUHWhJXxQWAJGRbkof3kJJif3XsOCa3wScvWdjUE
 bYjvTSzwzYCko+85ksD/bbjTRgHZySq/Lfb3iYslHGDTobao7Vi6+fniVRR0jlfriKqN7Dwv9M4
 bAY763Ptc2VMD/tBqRde5BfjaQPKxFulO4S2La6SFh7H9UCskKanvgqQ8A1voX48tlu5+JWPWYF
 vjfe/DZ0iDmcwfgmg5MWe7lmpFtwQ+42HZrFpMWznjY8TnFOMeG01Ly9KeCEYpNmxs8FW0DQ6Lj
 zO9FoScbXe9l/Kz+PCNiDrLDciSAe57DIw2qV77+lDW9t+1uV7sSwmqAXWz0hwnRxtmD0RAG9Ge
 LYK7EDMBW1dUQELx29msTyY8pIlQhjgzfNswkVhz31bJYJE3snj5+3iE0T5oynDjY3oZ5yA8ZW2
 h3tZHo4d7XUz/r32+Ew==
X-Proofpoint-GUID: RonTe5vlyiNlE4xyeQRrYjrQLxY38JjO
X-Proofpoint-ORIG-GUID: RonTe5vlyiNlE4xyeQRrYjrQLxY38JjO
X-Authority-Analysis: v=2.4 cv=Ps0G/AM3 c=1 sm=1 tr=0 ts=6abf87f2 cx=c_pps
 a=mOz+rD6hbbSUvRiPFvEd3g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=W9l-60YlKGrCnE54gWMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020041


On 10/2/2026 3:09 PM, Krzysztof Kozlowski wrote:
> On 02/10/2026 11:30, Padhi, Beleswar wrote:
>> On 10/2/2026 12:01 PM, Krzysztof Kozlowski wrote:
>>> On Thu, Oct 01, 2026 at 01:11:27AM +0530, Beleswar Padhi wrote:
>>>> The previous TI K2G and K3 architectures were tightly coupled systems in
>>>> terms of Safety and Security. All the TI-SCI messages from HLOS (Linux)
>>>> were sent to a single sec proxy thread terminating at the core running
>>>> Safety service (DM). In K2G systems, DM handled both Safety & Security
>>>> requests by itself. Whereas in K3 systems, DM serviced the Safety
>>>> requests itself, and forwarded the Security requests to core running
>>>> Security service (TIFS) on the HLOS's behalf. This posed various
>>>> limitations:
>>>>      a. Increased latency: An extra forwarding hop through DM adds latency
>>>>         in requests and responses.
>>>>      b. Freedom From Interference (FFI) concerns: Having Safety service
>>>>         proxy Security's requests (& vice versa) undermines the isolation
>>>>         and FFI of the system.
>>>>      c. Potential Deadlock Scenario: Forwarding messages between Safety
>>>>         and Security cores can result in a deadlock if there are circular
>>>>         dependencies.
>>>>
>>>> To eliminate all the above limitations, the TI TDA54 class of SoCs
>>>> introduce an architectural change: Isolation of Security and Safety
>>>> services. To realize this enhanced isolation in hardware, two
>>>> independent sec proxy threads are now provided for HLOS to communicate
>>>> separately with the Security and Safety cores respectively. And the
>>>> TI-SCI message forwarding has been eliminated in Software. The System
>>>> Firmware ABI5.0 version necessitates this improved isolation and FFI
>>>> change.
>>> I don't get at all how above description helps to understand this patch
>>> and this new compatible, except that this is not compatible with old
>>> variants.
>>
>> You just answered your own question.
>>
>>>    So 30 lines of text instead of 3?
>>
>> The existing system controllers have been compatible in all TI SoCs
>> for over 10+ years since Keystone generations. Using 30 lines of
>> text to explain "why" the new system controller is not compatible
>> with old variants is worth it.
> If you decide to spam us with a lot of description, including marketing
> crap ("To realize this enhanced isolation in hardware", "this improved
> isolation")


I am a Open Source Developer at TI. Marketing about TI Product/Hardware
is of no interest to me, neither is my intent. I was just describing why
& how the hardware has changed. If it gives the impression of
marketing, then sure, I will drop the "crap" to not waste your time.

Thanks,
Beleswar

>   instead of writing concise and precise messages, accept the
> outcome of maintainers choosing to allocate their time in "improved way".
>
> Best regards,
> Krzysztof
