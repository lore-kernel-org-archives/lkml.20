Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013039.outbound.protection.outlook.com [40.93.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616FF582B8F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171881; cv=fail; b=sJvKeEtqMMbC2Ugkcqr5plS+3ZTIMV5Tnw6ZKz8KTpvV+BpSkAiVYpjx1zJj6QH050oACrHLRjCV3yFZ8Z0wAegHfCctnTbVGjhfO5NUFEej22Ysm7sPzzwj3HZ+Hgnt+fdlHA+02s65TO5uZiWMbcoI/RdKtzRRIhdf/mtYjks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171881; c=relaxed/simple;
	bh=kI06AsZfg38f880kyEuUHnlioCj/oX2QbL89+T86Eu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IzzyGpPeKlOTMbi5Elss2ATFjuXG+Y7dTzVoI3QK9xiXd9v+2zVcahjuEKuwwH6ov/z1e+51sUTBVq4jbvA3M9/108Wj7Vn9mPzuuFeXtdqDM6P6ACXHBXZabUFffK0CIJv3GAbUibfzQJoQWumvXw+++7BdxIIMtuwEWb/0Dwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1lihawgw; arc=fail smtp.client-ip=40.93.201.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1lihawgw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rv1PEdKkJT6aWsWRPR8HN5kAxTh42srxXE5JcJPNptpIcgwAqFJxWIZicB+HJz+gWDlZNrGewrflIPlIV31MMilHGH1e7KuGC9BvHsivU52sXvKHq5R0/ViCpCUnMdd8xeupmxcL7TK1ZsBn5/OCa3DCFep1f1DE3ioh69sptdlXFFMIOUYnfF7fwqPUlB9tLHZa5QNUIirtsSdg83zfN1YC7pjZHSBC8Vv1LNEkNO/deCHCIJq8UGlnALD1k+yeliKLXW5lt5/Fy5C6VOJWGXIGCmA8q417+nEO4SHPn8AjbpUDa9ReVMtwOHJZW95lagHz97u5odFbFfVZMSUNEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHFBa41LGusqjAcfDcnqGnTiMscvXPssA2NvSGX5gEA=;
 b=disdB0EKsu8MOelIWcWkh3lnC1s9I8Op4GgR5WLUYIXroKXE3DfOPo/d8dv9dueP0TqE6vZ2OgxzEt0LWJvx40cs3WiMYpdafmB/4cIn7AMtsGL+L5TGhh6JCnUuKG6iNIK662m2IcMmHzvqPwAZNbbak+SM+gmkdDlLJ/WPYsSV6N5pESSP3HMCy1cYr8rneeSAYUk7K0SfnV4mzzGeIzkBv+FSH7YAxzLmzczpZ1lY4jrH7tRVAFSw3F6xUiJm+njX7gUZU/4dVNGH+jtTKVreizVefYEI7A05fEJmgdeVO1KN8Zf8seXZh7kiO54hnEDkKe6b964klpllKO9J7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHFBa41LGusqjAcfDcnqGnTiMscvXPssA2NvSGX5gEA=;
 b=1lihawgwWlvEVJs4jCPoQrqxtzA4yZsv4k6rM3wHO8g1M9Dyg8NBmY+0JDKou+oQka5hhwLqdI2Dt58ghe/j5vBvgaTRmxXsB5BBQTnimsBSRRBRIr9EcG/MDWuM3+aKZmx7AU/KGf0HsGOl5e4YcNaRHnWXSZT0kJTdSU/U/Wk=
Received: from CH2PR16CA0011.namprd16.prod.outlook.com (2603:10b6:610:50::21)
 by DM4PR12MB5842.namprd12.prod.outlook.com (2603:10b6:8:65::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 17:31:13 +0000
Received: from LV8PEPF0000005D.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::93) by CH2PR16CA0011.outlook.office365.com
 (2603:10b6:610:50::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 17:31:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF0000005D.mail.protection.outlook.com (10.167.245.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 17:31:12 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 12:31:05 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 16 Oct 2026 12:31:02 -0500
Message-ID: <cf779b51-0124-4fde-956e-ddce76ae7dc4@amd.com>
Date: Fri, 16 Oct 2026 12:30:57 -0500
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
 <4c9b533f-251a-4569-bc78-fd7af664c831@amd.com>
 <20261016171029.wSftndCb@linutronix.de>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <20261016171029.wSftndCb@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005D:EE_|DM4PR12MB5842:EE_
X-MS-Office365-Filtering-Correlation-Id: 90a1c67b-8ca2-4971-b8bd-08df2bab463b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|6133799003|22082099003|18002099003|10067099003|11063799006|5023799004|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gbKvSEnH1ta4AoFl5XMyO+/rvM2cNsrAm8WEy3c+x9DxOgiCKx4HtdMRsOeXUQZ6aURkhfK2Eb6GShKh6fDBekcXRw7VHIHy/RsUiVlieWbd9MWepuCYtMPc5n00a8Xqc29qG7Gcktvw/roC/JgrxuEqnP9tWkNpU8Na1QL9WOxov1tRA6rKHPhcvKXOyCOwDxh1iezgrxzkeisa7FypLeLVioeb0AMD4TG8i5F/cNFdozWHpdS+jQZbS/dQugTbDabECamBUFeIDD3ry/vkAEBDnnjBKX/pRSW6fuP4QkYxX4NNd5RJfi8N2odvvd77uAqTWAVhlEMfcJSh1IYk9UyXXoUhz5+e8Q4GDxqDQO2abCttXMC0sFjPpz+XjFThUoUC6j4AqFZj5ZoK9DdSHe5c9ZcDkQVlK2pwenlSTvfJcp1mk1YLBty10ZSnsVxGq+72UTHDrwaPg4SJ3dcNsltqSUJU7Ds+bBfHp5z3HHcNt72oFRPEqStJqXF4TS+fM0vdRMPHVfuXHZnrphijXymjuaXKTdAIbJrZR3ndyDW8mqtVHrrKYGvDNUmSfDT7E2TiQJd4dDBQ2ZXY3BwQ3Yotiyox1bvdcrUVdcd5fjsRh1C3pkSIaDsjbj7uZ8HqOQQylc5Rh5lB6oKQuo+64XCleHm4f6FTarT5KDCK8N7IPXa3aiT0Nqoi6AbIJnaZyebBV3S3hSUQYfz1OmMPvw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(5023799004)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a1AJz1ev+1kNWPRAB+lQ2s8p3yup8WTRgBBnF1pEXHU5SsOlF4P7j40qJ9ayumuI2Ds/Ku1dW+eM5/D7HckL7JoGWLOwyxlUI7htUma/NqYBo1b8CryA9BhRzF+eYQgDuGIDds4iouBZrxH9lA9BoNohvBReXl/IFmNBio749sQyPO9SPrG2saJbBpIc7pfDzw4l+TvEdTqyKmCLMOMNWeySYglBFR9PERG5J1sBJ+9yTbW5yL0T7+UTz9gU6UKCasP4wbCkO8FCANzw5QAzAfKZSmeSvetGEsK6FG4sH85c2OKH61feb1e+ME3WDikaBrc4LpJ2QJ3xBYMQC9m9E2O7WBqI/DguIFj4zhu6rkLcDDlQHkTls3/V75dBO1E9Na70huuDeSFohPxVrz8lbF+mI3uLE1G6aLBTbB9mpR7xPpK/cz22aBBD5heiqAoA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 17:31:12.7136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a1c67b-8ca2-4971-b8bd-08df2bab463b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5842



On 10/16/2026 12:10 PM, Sebastian Andrzej Siewior wrote:
> On 2026-10-16 11:44:07 [-0500], Shah, Tanmay wrote:
>>> And it has to be a per-CPU interrupt? It can't become a regular
>>> interrupt which is not per-CPU? Does the driver at some point access
>>> per-CPU registers?
>>>
>>
>> As per my understanding, it has to be a per-CPU interrupt.
> 
> I see.
> 
>> Driver access those registers via percpu APIs, for example:
>> xlnx_mbox_cpuhp_start() uses enable_percpu_irq(). It is called for each CPU.
> 
> Yes I know that part but this is not the question.
> 
> I meant _why_ the interrupt has to be per-CPU. I'm not sure if this is
> internal wired as such or just configured.
> 

I think the SGI is configured that way in the driver. Probably at the
implementation time couldn't find the better way.

> For instance a timer is using a per-CPU interrupt. While the timer is
> programmed for the next expiry it uses per-CPU registers. So the timer
> accessed from CPU0 is different than the one accessed from CPU1. Once
> the interrupt fires, the processing that follows is different on both
> CPUs.
> 
> Looking through zynqmp_sgi_interrupt() which just invokes
> zynqmp_ipi_interrupt() I don't see the difference. The OP-TEE firmware
> is invoked at least the bits I saw, it just masks the source and moves
> on. So I am not sure what is the difference between the interrupt on
> CPU0 vs CPU1. Both could fire at the same time and handle the same
> request unless the firmware returns a different
> IPI_MB_STATUS_RECV_PENDING bit. I don't see how the remote side would
> make a difference between those two CPUs.
> 

There is no difference between the interrupt on CPU0 vs CPU1. The CPU
affinity is decided by the TF-A when configuring the SGI. The driver has
just lazy implementation where it doesn't check for the SGI's CPU
affinity before configuring it and will assume that SGI can happen for
any CPU. The driver can be improved to find out SGI's CPU affinity and
request SGI only for that particular CPU. But current implementation is
not optimized that way.

I am not expert in the GIC interrupt handling of SGI, but I think your
question is valid. The answer IMHO is the driver's implementation might
not be the most optimized.

Thank you,
Tanmay

> So this is what I am wondering about. Based on your response so far this
> has to be that way.
> 

>>>> Thank you,
>>>> Tanmay
> 
> Sebastian

