Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011041.outbound.protection.outlook.com [52.101.57.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758104E50AA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167046; cv=fail; b=GsfpLRkRs3SQwdH0VqLUq2MmAyOfKdHfjdXdl5uvu4Wj82o22eDzptCyptYGFswZh7p5kOQPqlvktIHyl8CAstSZCu1ijLvwcZrLXViqR0T3Tt8mBsHzfX0oRT9QcBhDpQ4bi01S2FI/N+v7IN/LAQptfq4ErFhmuwCp8INvLQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167046; c=relaxed/simple;
	bh=c+ujkinfvYDQKJH2h0XXdmfb0+B+hYiqMbaZVXdUrX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MptoADNtxWaw54Ssn//TJ8yr2AAJ2bTs2q+6Uiz8EjaE15Ff3qWFfKSBUz6jLTj8QnAjSxlB9lQNAO3Kkn/r8qItNsMG6B71JVVF9S7+8d2oc9POdW84mQfgmEG619N/Qq38O0e+K4FsMIMwT47w2eB1z7dc0T2WX3po3sTPij0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IrFpBpIZ; arc=fail smtp.client-ip=52.101.57.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IrFpBpIZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMnLiWMe4c99ExxRMwA9aQALzc6mixawihfvSOfieVTw72bUfbPoxvrHPdAXYrA1Ock+Hh0wLjljZHX0Qaj6AVvfVpL/Ets8NTMrQsNZL7HO/S1paEqmk7CRofG3aFQ+KlaPhPq2w0J3w8H1mUEjoRdI3gCaoGbF7K33th1nE8erCwOkBWN/M91sjdMXByrBSeGLkIPYTej2yaaJmEBpntnmVuscG0L/ZKF/9Ra5efJ9oaB5MLtJ6WFL7Xaqlha34xlX54QSRmEA8SgOg6fYEPKP4uOjdFWDCJldjffHu8gElvtoZpIaaIpYDYdUFzRmJMgi6HrjI1gobNPqJR5asg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irui3gbhJY9Ye3T55Qd5RXUki/6FJbqt8Mpaw/STXT0=;
 b=KkdpgeM4M4usme/JkHblf2sjIedSqnEFQ0x9ijJKrrgcOUmSgetqfaKHEgUaqZcW9XFb5YXE/Aglj5KsCOwWTAHNCJKz/A6W4mqxwstlwW0OQfQSyzoV9IPyng2T1rpegKbtLZ1Giss0p/ETo03AaB4aMLEt6FeiRSYD8r+Gn005XZr2wDflj3+niLMKOcDoLCfj+Jmx2LbOS5JLMIUNAuLi6TxFeHqd50OuUarjQYXPaancp/5mhA21tz6eAI3LV5wfq2x2YSFrXjnS9NQfE2XSt6K+mdMVE6XhIEYBDEOgG+HPpMdxYCpOEnj06Lv5RXOBPqMdgOBL5np9lFDZLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irui3gbhJY9Ye3T55Qd5RXUki/6FJbqt8Mpaw/STXT0=;
 b=IrFpBpIZBHXpmiRmpQCZ/2P5sovf8OxSuVjYwFXFwyVC2n5bh/OvI3V58EfZgZnsi0jzhbdfqy7xQ30fc8xavIf4PU4TIIiuu3kISGFwWqeTSxyGD3BC+dyz9G/s7v3pGI4J/7Vnhf/M5e9XgH/1BPNLy1lSGzU6ZKN7wkDvOb8=
Received: from MN0PR03CA0017.namprd03.prod.outlook.com (2603:10b6:208:52f::11)
 by CH2PR12MB4325.namprd12.prod.outlook.com (2603:10b6:610:a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 16:10:37 +0000
Received: from MN7PEPF00000150.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::4a) by MN0PR03CA0017.outlook.office365.com
 (2603:10b6:208:52f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 16
 Oct 2026 16:10:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN7PEPF00000150.mail.protection.outlook.com (10.167.254.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 16:10:36 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 11:10:30 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 11:10:30 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 16 Oct 2026 11:10:29 -0500
Message-ID: <1ee3f542-e0b2-41d4-bf6a-b103dabf50cd@amd.com>
Date: Fri, 16 Oct 2026 11:10:29 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [Q] zynqmp-ipi-mailbox and SGI interrupts
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Michal Simek
	<michal.simek@amd.com>, Harini T <harini.t@amd.com>, Tanmay Shah
	<tanmay.shah@amd.com>, Saeed Nowshadi <saeed.nowshadi@amd.com>
References: <20261015083937.8SDbdK8P@linutronix.de>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <20261015083937.8SDbdK8P@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN7PEPF00000150:EE_|CH2PR12MB4325:EE_
X-MS-Office365-Filtering-Correlation-Id: a812218b-57ce-4a8b-9ce9-08df2ba003e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|18002099003|22082099003|10067099003|13003099007|261009223027099003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	cYKzPr3M6wVHneguciJZv8HnQ63lhwtyp3YRO5XhR8f3AT032XiNvxz6OUHFT2sUNjRV4IZYpqzetX5lekGPBAll6vea4qjFK+cMylLUWOD07WR05YMHDfhgAbv0qF3OHKSplXRIcrvFLvTycN8Nv1Xdpg+eH2NHGH0jEuN9JDARNHnEYu4M71gLiq6rFlN9Wszy45hk5hfptdkGBMKoaHrF1KuVPGU7w7aObFtJLc/ik1rbkDhEn2ekLLsYHrYwIzDXGlCtOAxivd79NM4iXl3SS0EmyBq17hsj+SC4FGc8W5iNophorC3XjgQ+txUIv20WJQiQmZebhNSslvYnmtkcBP/I6jDfCSL6H4bFuE5UglSjcRJeAwvTiVvAgkBLlrfveZqVnQkWMklZ9aMFy2HCRPsnq6sVe+8NDR7LNYPT7kLNp9g1cunzoynImE6Kn3Cw90gYJ4GkPvXbv6n/PRLnlHyEE/kGKgzCFpNjNevE1lV2D+TI1LwNhBPRtxMMhFHC7Ulo+Qz3dRM8/Vio7m5xFanesewZK68uB9XPW7cDABOeleQEnwFrxSAYC9VFVxPPEwBmAoe6NzXLaus5jZ16ABQMjif6vM+Xc1JjLdNLs+NjpVQL2dmOoztv5kOvZbd6M3mXAvJcImYubU/GvqpXFHBu1ZoFtJ6cDImDCA+PKRMoyUQcYoG6OvgkLJC1DEqUlv2nooe/K94Oy935/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(13003099007)(261009223027099003)(11063799006)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Q1R0fg1+IjM/tkEKLEhd1aaFi0Vfxanm7MKpx/8Ez+cPzt8HnMDYM+Inez4WDiIZYx6VvTNGUH2CTxvIArpWJuYsfElVDXm4s89pIPxeQ7P6AiuqnNRvN6ISkO6Q9MDf+PQTgZ3RCww4jK/xNXItJtA8rjR1EWPV2kPHwqZlSYPHpu6XS/EA+JGqBOTzU95DMlMYc63igKTVQAcjupFx4BrY3wIdpoBgIpJaOkz9V5YoC0UOmCAE+ujzhMvJ5q0OnBnFo659U1wjIqLyWyR8MpbX7+cC+ca2Ram5w0v477nDiQOokNjcLIc1yFJH4KhYDgbZR85+pzoxAa0zLWMuftki5vr0m6dBWN8+Q+iK5pa0vIVpf6rUKJSsZqv4aByQgSX/nY6ey9/PgU2BVnzx0gj9iJuPPdvNKTnztSxCm9vFLFhzgTIHVcWeso//lxXU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:10:36.9525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a812218b-57ce-4a8b-9ce9-08df2ba003e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN7PEPF00000150.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4325

Hello,

Thank you for your email, please find my response below:

On 10/15/2026 3:39 AM, Sebastian Andrzej Siewior wrote:
> Hi,
> 
> The ZynqMP IPI Mailbox driver supports two bindings of which
> xlnx,versal-ipi-mailbox is not present in any kernel dts file and

This new bindings are for Versal and later SoCs which has buffer-less
IPI. It supports only notification to the other core without any data
transfer. The device-tree nodes may not be available in the upstream
kernel yet, but it is used by other consumers. Here is an example:

https://github.com/Xilinx/u-boot-xlnx/blob/master/arch/arm/dts/versal-net-vn-x-b2197-01-revA.dts#L100


> xlnx,zynqmp-ipi-mailbox is used in two .dtsi files.
> For the per-CPU interrupts the irq-type should be 2 (which would
> correspond with GIC_ESPI in the dts, no?) which I can't find.
> Before the IPI_IRQ_TYPE_SGI it used to check for the value less than 16
> I also can't find this in the two available dts file.
> I did browse over the "AMD Versal Virt" but it also looks not present.
> 
> My question is whether this is used or just a development step that
> never got somewhere. 

No, it is the actual use case supported by the driver. Just the
device-tree node is not in the upstream kernel, because it is usually
project/vendor/consumer specific.

> My guess is that the device tree here is preconfigured from the boot
> firmware.

Yes.

> So is this SGI-IPI a thing or not?
> 

Yes it is. Ideally, TF-A and Linux can share the IPI. If the IPI
interrupt is used by the TF-A and the expectation is that Linux mailbox
work on the same IPI (because all other IPIs are busy) then the work
around is, TF-A will generate SGI for the linux mbox driver, and the
mbox driver will use that SGI via device-tree.

It is a vendor specific use case. So the dt-node for this use case, may
not be available in the usptream kernel, but can be enabled if correct
SGI is configured via the device-tree.

Thank you,
Tanmay

> Sebastian

