Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013018.outbound.protection.outlook.com [40.107.201.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5704ED199
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169061; cv=fail; b=jj6+m74FUmbIa+iKdrewwAbxf+ORANOoT7XMrNWfixNnC/IbkOiWVe8tXxHPYAgPxwTD1Buu+PkBEbB6LJgd/NL4ADO0gmSVpALYtHbwMpN9117DE/N576xWCaIFV4s6AU/tVmAUL4EdqZQvXtnA4l/JRBlRDEumArBdgLkxf3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169061; c=relaxed/simple;
	bh=n1iZdUVyyZDkr2nkhuQz6mWGVV5/7HV86kJizrdR+CQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XLyT2zWS39hq74+ukZiOu1njl066Nci8UDvEZdvtc3LwOIzINPhRRh3SVblYE8mkgnMWIkm2nm/8iuXuFAA+LIZd4JZNouAPPlwPpYHtlv7pky1aCtK4/kJwGZXE6LowugWUo2Yk3ljuIFPaszGWLAAymfUg+BTtTsPsmrcZw4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bMMdeudy; arc=fail smtp.client-ip=40.107.201.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bMMdeudy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvff6/Apeee7XkKWyNGXreox7ofHiTWM4Uk8SrsNXKyzPS/zkmkGK3QEmLFP727NBXvajRFkJTlq1MrRxqxvHBvhh4xQrzhI7K9xximNBfbHReiX3iDZqhoVhXJzEo9ZF0V/xdC3TkLpQgvVUZoelDcjy1hW0A88tLLaJUhu5uR3+bGIvdOBlxphWmk6L59Qe0KGDkMSowhhlnonDp27o1sY1bDAvvLrPPxkfqxRqEbASpua9wmsF3IjmhBL8g5pWcq2zbrO78CbGBMfydp4zaBKEHle+wdcG8ErlRgVZyJD0nhx1k98cT5ITZX7jG4NLV5rQh0y8tFdEoAY8c2nzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLtGLtNKyXZHh8JGumqYyiz0x9M03j7wwKoQnuxR0jU=;
 b=wWkyy3aZrtJxO3xO3ssF8DszN9duTCb8T1hEAUUNstfZKaf1WBrxE1OfTLlhVf5X+/qyjIks/59xmbkLRPa92vguZktayhiHtTyIoOGE/Dhb/eqoXl/bhpKQVyHk5DirLP7HoCobLxCH/gZbaCJ1Xmc/GKajN4gQMiyL2ST+56JpE/h5XeStJkeoooe+Wwhqcx7+76Rgaoae6pM6hu6dC0vcc7NlbrdveC1YF6EvRyEJo8FgBls2TX6Qu7XXNAUJVDzqrXN7NN7rrtpgKDjE/bsvVi4mmlc9gf2lWmyBnUkaY3jDrUTnDe92rPvKT9zzMqKDujXy/kMcEkGwIcwiBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLtGLtNKyXZHh8JGumqYyiz0x9M03j7wwKoQnuxR0jU=;
 b=bMMdeudyd8gtv0GdzwjerRj+jgeg78xnhQGXRJCt3JisOWeY49VYkO1NxFEk/KkUYNU3oqodslkltONOPsJoywJf33PPI+RoAasRWRZc4ASa50oft2AGjH9WCZFShR5flRoGZTvEGOftyVtrfpFfyaUrw8191Zb8EHtxnB2WDYw=
Received: from BN8PR04CA0063.namprd04.prod.outlook.com (2603:10b6:408:d4::37)
 by DS0PR12MB8443.namprd12.prod.outlook.com (2603:10b6:8:126::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 16:44:16 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:d4:cafe::7) by BN8PR04CA0063.outlook.office365.com
 (2603:10b6:408:d4::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 16:44:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 16:44:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 11:44:08 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 11:44:08 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 16 Oct 2026 11:44:07 -0500
Message-ID: <4c9b533f-251a-4569-bc78-fd7af664c831@amd.com>
Date: Fri, 16 Oct 2026 11:44:07 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [Q] zynqmp-ipi-mailbox and SGI interrupts
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, <tanmay.shah@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Jassi Brar <jassisinghbrar@gmail.com>, Michal Simek <michal.simek@amd.com>,
	Harini T <harini.t@amd.com>, Saeed Nowshadi <saeed.nowshadi@amd.com>
References: <20261015083937.8SDbdK8P@linutronix.de>
 <1ee3f542-e0b2-41d4-bf6a-b103dabf50cd@amd.com>
 <20261016162356.m2X9jbCa@linutronix.de>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <20261016162356.m2X9jbCa@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|DS0PR12MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ef21bd-5232-42df-e139-08df2ba4b6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|6133799003|22082099003|18002099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	4KJVx8gnk70oRAdA5DK0qACG4tyjjk6jAYMwz2cyPCenB+xEgRmDud3o+8daCHd0HH9MsZJ5GD6qOtGsDEb9pS+Ce1LutT6wYmivD3se9beV/khBPOR9AG8b6hQUzEkzI4n0R7m+54qcnpacUT+yoT5zRMxJOwLKf/42BBUf2wAQCcXX8jLHzadju9/ZOs2q07uuyc99AeA+gahdHbLz/4ow/DUjEVnryzo9UIiG06B5sEVrFz/P/ojQLyK/LshNmkR6A4zaHkwYdiCkTjeVCQjHtoyhWzElkFvjqJj/eOQVbIFFwyyqc5LjcHBsrPt9b4Mti3XHinG027wbVr1mrAt9XDP0ZCnku5FUnNJ8yOcggI/hSwDcjA1uxrvwQgQr4G/cVjhs9IlwlX2NiElJEOsNlcxM0xsmz1Ctacjyb4IpWd6mvln+vNokqYIxxhlCAxUaQBsl8UtvCaG2mWmr0WzxZu+hT3ssBn+Pe7MGzKbMDlgf+ru8/4VGiQazwXHMlNJpqKdFyhpK8p28aTRIbZdkYRHTpMxceOA1h9CYZ7PsKRxHaY4oyKyZ+oA8IP5AUr2WgoBBrwkRqLGQSD7/ESv1iIbF2b6AJ6iTTTL6AUmssv4mmWQKHUSBBulrO19GcAswdziyKE02AP00ioDLOo39sqKxkmrTq02Cd0LlDY+MDMRGxhpUZrY70RvmMdV9JeBZhUBJPQbtInRQJdADnw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pG8l0HiM/3dUMKVuTI7pvEQ2gR6wS2nGQ4fqCNyx7kijnClfuQZzylckkPyKBa0e0LeOK1UcUc/2dpsy1zCGMB4OfwxISzyYRZHU5pLYsi6OmUN/WxkcMTyT6B+PgLBHiRyp5d7hmTKU3uLQXFhugHBbw0PvPDikPxSOQc/LRvui75Q0rDavidKyDTWSZ/vmMj+SZSDzdpP3NrrVvyTsiifn6Nd0a5CfynUqHIQdjUA8QshHgOS0mF2J/bJZq9BW4L7C7/CKBXUBbI+MqaO3wumtHJuyP0uO3Z5NN3FJ1DsBhc31Ss6svgMAP4cD2nH/sdajndXWoTMtjOshsENcqxpp4YVX8n6OBQmglEuyQBE9HTgG+JOa8skL3G6vdkirLvV+U5ypkQhEyOrLDXx1cgMz+g1Vpvhm/OnDQRkRUmS+NPATMFylAeHYbrQ5MDX5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:44:15.0895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ef21bd-5232-42df-e139-08df2ba4b6cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8443



On 10/16/2026 11:23 AM, Sebastian Andrzej Siewior wrote:
> On 2026-10-16 11:10:29 [-0500], Shah, Tanmay wrote:
>> Hello,
> Hello,
> 
>> Thank you for your email, please find my response below:
> 
> Thank you for your email, too.
> 
>>> So is this SGI-IPI a thing or not?
>>>
>>
>> Yes it is. Ideally, TF-A and Linux can share the IPI. If the IPI
>> interrupt is used by the TF-A and the expectation is that Linux mailbox
>> work on the same IPI (because all other IPIs are busy) then the work
>> around is, TF-A will generate SGI for the linux mbox driver, and the
>> mbox driver will use that SGI via device-tree.
>>
>> It is a vendor specific use case. So the dt-node for this use case, may
>> not be available in the usptream kernel, but can be enabled if correct
>> SGI is configured via the device-tree.
> 
> And it has to be a per-CPU interrupt? It can't become a regular
> interrupt which is not per-CPU? Does the driver at some point access
> per-CPU registers?
> 

As per my understanding, it has to be a per-CPU interrupt.

Driver access those registers via percpu APIs, for example:
xlnx_mbox_cpuhp_start() uses enable_percpu_irq(). It is called for each CPU.

>> Thank you,
>> Tanmay
>>
> Sebastian

