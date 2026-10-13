Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012055.outbound.protection.outlook.com [40.93.195.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6EC410D3D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888250; cv=fail; b=RrEYiGbkfcKIOF2Jaw86RvTi3H/G9mGkjeYbmNbD1iaUky0h4O+jKM4cYTuhSeMqHSE2FNFE36g+3mL9FPFM6/kvaJ4xLu8r81JDU23PNotdWSx/5u5U6A1+wNrWzuashtqahX+1tUdYKvJZKSrpCuy8Sixf+fbDzwMrYc+vjyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888250; c=relaxed/simple;
	bh=stK4izEH/47aroJhAy3CtIT9kt88mL6gTKqDDFWSmQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=j5lJOusl4H5zhEg3okNXXZDEpZ9N/VEZH8TfZuLmi721ZCnpDHGYoMz1ijxNsDQKCJ5gh+0H+LCVEX9iw8rugdw68Yuf1psMMz7KQu4Veqv89j880r6wx1SyWH98+NGdPdNxINrm+7SuK8P1ZyF2sG8eiLlWPZH6Y/h+UZBfZpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CX/EHeJR; arc=fail smtp.client-ip=40.93.195.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CX/EHeJR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIGaAQNSHcoHD3g0L74cBQg1u9DJVaGAd0Gy1VyVIkU31ZyP0yrFysa3flSVYAKZH/hxPM9qrc+etoK4FurS9HuJbTnJUCBsOrTgk/NZly2IRLkLL1vCPDva+EIlJNtFb/vxDDbwUe/HIhO9BQiKu/+5y7JpsZJUR8ClnlQf9w7kpEgycOnQvZCoGc5q7uyhMDnQX0+D3wFRtxB11SDDInbADrq48O1fvHeelTZ1xJpYaJgXugkLPcJpzLq0vqordxG3yte61B2Zq+SE5acZ+bmBapIy5nq2KJwgiiIVV3+ebRsP63elBL3JDRdMyhOX1Iys83IvIKWgouu4NHQPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmZglyBHhmfjJff4fItJV8SKm8HCTUnOUkCEnj50z+s=;
 b=qwd0bHCwwo2uyf0uynjjumiC0eqXBx8/q56g1FMG1X11JGwDzCxuDrs/Dshl88Qi4sxCCO4/xEP/cBF0r0w7lQOZFklhdlxSsG0w/zcLUmvAELPi9/iRFyjmNmZS6BVUCWxy0zna+GDbojg8saoCkJhp4cp8bDf8kazt80fHO/HbQGjLXfAesGC8u0n+sJp2T0XnVPrUccSA/HSebj8nCvMBDWTWPbhKm+d03GCGpD3SrcDNI/wdw1sG5n12x6mCzFab+XHPDBXa3DFGJ/HhOY0eDqrT++YT8hhl34OvgaYG75qGh2Lm0T1NYebt0Cb+awYywYtWOMLzlYtn2/x5Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmZglyBHhmfjJff4fItJV8SKm8HCTUnOUkCEnj50z+s=;
 b=CX/EHeJRTpru0P7etaSiiDU1xbDdkkkhXmrKiJ0qy2ogx0Wk8yvnqcbLOfaBFnQ1jtq+hXvyFp4b2AvA5fdsbqVcr26vmyGIybGf0xRtBMZVccnUfzfyCsV+s+oy5k/7t2sduO6zWmVmVBjdZKslxvw3rdHAMUOm4Dnq2e8wccc=
Received: from DS7PR03CA0153.namprd03.prod.outlook.com (2603:10b6:5:3b2::8) by
 MN0PR12MB5763.namprd12.prod.outlook.com (2603:10b6:208:376::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.23; Tue, 13 Oct 2026 10:44:04 +0000
Received: from DS1PEPF00053452.namprd04.prod.outlook.com
 (2603:10b6:5:3b2:cafe::d) by DS7PR03CA0153.outlook.office365.com
 (2603:10b6:5:3b2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 10:44:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00053452.mail.protection.outlook.com (10.167.23.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 10:44:04 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 05:43:58 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 05:43:58 -0500
Received: from [10.136.45.168] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 13 Oct 2026 05:43:54 -0500
Message-ID: <da69418b-7de1-4c94-a9e5-596e40868079@amd.com>
Date: Tue, 13 Oct 2026 16:13:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Apparent lost wakeups
To: Peter Zijlstra <peterz@infradead.org>
CC: Vincent Guittot <vincent.guittot@linaro.org>, <paulmck@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, "Dietmar
 Eggemann" <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Valentin
 Schneider" <vschneid@redhat.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <kernel-team@meta.com>
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
 <b2dd8374-63d4-4b04-9e2c-f6a84728f092@amd.com>
 <69622916-cc8a-44d5-b776-6e25f79aceda@amd.com>
 <CAKfTPtDz35egMZEVz+wb5kytgVrv7APcVOYBkCByvzPSCH7Meg@mail.gmail.com>
 <20261013101452.GG2009045@noisy.programming.kicks-ass.net>
 <a5b8b01c-1020-4e0a-8d2c-a8f898036f5f@amd.com>
 <20261013103726.GY4121339@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261013103726.GY4121339@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00053452:EE_|MN0PR12MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: 506281ea-ebcf-4eef-f96b-08df2916e66c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|23010399003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DdJCjUOPtXo7FXxBeYrpejF40/PO55wIN02H8uFE2vJhKVJp+0/FRR/D2Rk03CJIxjefoBqMF3uSi7Yk+XTOUJ574+ISk078qnMWLOecOFHiY4XfdHwxwJePYg24mzuj3U8vaSC72eTESbIlmJJ9KWfccUip8Le3a1UJrK7Uljm0anINu5cF+4EkHuL1viOp8gGfcqg6oCvVINBRxW2Hu69ZCZtKv7UY5lngirSISQ9tgVmKwT/LEQGMNsFvzuz7QcTfRCT2vbxcMev0orbbVLdU/Jso+p7CyNKt3nZt5W0pEHRFUtU3th5PZ7LRAzDdBUnGQilmlyHZ4DwsyzZyKb6Wt499/YW3xUPVmxCxZ2if8vlHEDHIRuT7W7HdEO1nQPyVfxZFYi9uaeKB/kaD4ynPl6CcWycaFy0FxsxpubHhXrOgA8Bbqrp9pTJ9sEl6G1Hdl3o3tpqbtUupgbsSsGmGXJI0Y11ji/0pEu6r78btAKkzjlNWC+4ig0bQ2r97OyDRwKh5musz0kNh2lerYx3VU21mMjfOIKSLB/utK+leC2bJCinYdAh+0xGrdXE429QpRmA/4sTSq8r2BTLiW7QAZwfkDweJlRk+TekRzwuZPf0kVMejxmnu1m0sUsrPU4HNg3nkZ1iamcfW6o6yRLblwHTzFYYaZyZ+v7f6vtAJC+v0D5tWaKofSg+mVa/+7zpdssSg+C+AZttOM3XTkg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V8BXLr9H70V5OE7acgrloWkq6yWAkI9PlPZPmdfHNWaSGRZTJrYnAcOuK/NXBKeajNY/7sN+f9y1iAm3n8GfcBU+Zx3mQUe5oJAJ0VwGA0VPMLVWOqQeaFAr/eRUNSh5T+vygrTVnl+kBkpJZ8S7dXqu/Fgi+zPF/y3ZtADb+DALF/iwQNVI92aqUHuFx+WMspgRttwAIHVhqTUd1rdJlV6hTwO5HhLY6YJo+WObN6gJtksB+9U6z7wmLNnxn3Fb/i/QvdhObIOpaTnmDO+NRXcSsFa1UkUM04viwAUjj8t4ZSEFewZdEBuIyiITwpqi2yeAxCYCiasxoY++qgQCGZow+040CVM+yPsI8MvEbLzqZoHjbLj4pOVErH+ALckvqjokmtR4sldScprFXeWu1lU/ugrMei/osnNNTvDWsGzUBnVm9LQQFN1nQxekV46g
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:44:04.1100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 506281ea-ebcf-4eef-f96b-08df2916e66c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00053452.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5763

On 10/13/2026 4:07 PM, Peter Zijlstra wrote:
> Can you turn all this into a nice patch -- you've done all the hard work
> on it anyway.

Sure! I'll run TREE01 for sanity on my end and send the patch out
later in the evening. Should give Paul some time to test and confirm
that we are seeing the same issue :-)

-- 
Thanks and Regards,
Prateek

