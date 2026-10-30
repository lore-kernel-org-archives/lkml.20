Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793331935;
	b=YYn6E+e2afI/dyalNoOCJarkqqOQvHgK6fiU3HnONPRV+YINgJh7Ee6dAEIFO/pUT+x8
	 HrcJ5NqYKi+O3l9VQ7r9qo2C5/2hJUh9qh9EbriPn4qcMwjhszZMvAMeV/IgAQHlxu3EO
	 kog3xAlWvyrFtdKx4QpgmcdPUaYrDZr0tfPY5Y3E7lTi9WrnQuj5v+6qGR2cxuYZDsPYD
	 jYN2JLK4EvsIwS6T3ZKXlEg4V43LuuaLakBbBnEAARuQauomqmzlNkg232D46Yy7aUCfa
	 wFuzNOfxbpbhsUG7XcFUu7xskJCNMXUWS6onCysk4uX18Exau8X9Vcc7xOevtTLNl6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793331935;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 CC:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=IikUAO8lSmNSAkvhUkTrh9Ju9HI1G1d2+VF79RdPZh4=;
	b=LmJIoX5qDDrge23YzY03s69gt20+Uof3Q8IeVuqeh7eafvLFc5o2uiP5j7DiuaeHgwcE
	 9+ZvGUDuKlLZR8eLRoWNafcqa7j0+T8vezEsDuPhfQSwdzKh3mub/pBpTOpCsvDMD6Opx
	 LoIoTqn5dRXFZ5j9YoWaN2ATpxVNSoxq5egQfBlE61ZTnpEDcAuhloGy1EZcE9Vca8BOS
	 zcOCB8DnTfLOn9w1rb9I2L/CBUHozZchNbG+UtxrQI7+dJjyk4WFuAicTg8dnXzkMA76S
	 PSVHB5d7t19R9tZIvlRZ7GnvoFBK/zDyAh31WIaDTPj0KIKfJcRv8IuiwNNE+DhhWGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=h9yowQd5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.52
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010052.outbound.protection.outlook.com [52.101.61.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648AC606A322;
	Fri, 30 Oct 2026 03:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 648AC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=h9yowQd5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZC6iE4zn/trnSrz8oDKWUMrNxhkpYVnkJ2IYYclzNUV4WGUUeGzgRF2dP8aXW25RjmhWtjFtIW9aGudSKBgXeNDjoyyElD2937hbe5MQOjkClD/J+NJxfCL0UuxeRd6u82h6u+yJXduVAiclaA0Yx8VdgJEK0jaM2vpYxmjjBMfr61HGXu1p2djc6QduVWpszE49QdMRK33KACl9XssrMrubIRVs9meM1WpgHP3tlXOZllQ8cCMUFFEMlahQaRG40pD78R0Mj2JPkOvaGshGkfq0RjC88n+m9PFbq3EnnUuxzTkEt5spViNGEcUg7K9Js50k0TMFNvjFHiodNfDTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IikUAO8lSmNSAkvhUkTrh9Ju9HI1G1d2+VF79RdPZh4=;
 b=ghiRmtpVejJsLUwmoFJiAXlZ09lxRlL6DLlyKlxYDeBqbeopcGZIzwEIg4yYHZVAkpjrT0V3XSw32SSwZB8jLkpOO6BnvTfLytvkUykVYNOFTLZOXO5EJQSiUAIHI5fIPN18mPMDGYcVoTWcnTKEhQ9s7UAD6eV8WsXcd7YOdpZYg27uz0irOoy4RQZR04b+SG+xxrJQkwFiZ0w4knWeiDiy+z1kfHMd7RavGiZDA+4U7AwNAdtMujrv5ybbQX2pz7H9DwUbSX6oGCZ0d7qWrrQ7slclJBBN7v8eSAxru0uLheHCMiWmzrQE42xfa3emhriNQ0FdOoAL+WOzYXT+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bytedance.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IikUAO8lSmNSAkvhUkTrh9Ju9HI1G1d2+VF79RdPZh4=;
 b=h9yowQd5RFO57r3Y1TK82DNALJkPb+BXstHYz/RhhD97ccO9ktaLFOMukJ3kcAKFRlG53my2TQS9Q/AzC0t8HrIRTCxMZ1c7rUqgOncPk+dH0pU+qKed5aysZeXOWxyjzkwbMh1GlZkaaMhrTwIDgBsEiWkVUfouTvjOEpXFURY=
Received: from BY5PR04CA0027.namprd04.prod.outlook.com (2603:10b6:a03:1d0::37)
 by BL4PR12MB9507.namprd12.prod.outlook.com (2603:10b6:208:58d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 03:45:05 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::30) by BY5PR04CA0027.outlook.office365.com
 (2603:10b6:a03:1d0::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Fri, 30
 Oct 2026 03:45:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 03:45:04 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 22:45:03 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 22:45:03 -0500
Received: from [10.136.40.60] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 29 Oct 2026 22:44:58 -0500
Message-ID: <c9cf96bf-f3b1-47da-b22a-9600b5fb01be@amd.com>
Date: Fri, 30 Oct 2026 09:14:57 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] sched/numa: make free-space tiering promotion
 bypass configurable
To: Li Zhe <lizhe.67@bytedance.com>, <akpm@linux-foundation.org>,
	<bsegall@google.com>, <david@kernel.org>, <dietmar.eggemann@arm.com>,
	<gourry@gourry.net>, <joshua.hahnjy@gmail.com>, <juri.lelli@redhat.com>,
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>,
	<mingo@redhat.com>, <peterz@infradead.org>, <rostedt@goodmis.org>,
	<vincent.guittot@linaro.org>, <vschneid@redhat.com>, <ziy@nvidia.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>
References: <20261028041253.74839-1-lizhe.67@bytedance.com>
 <20261028041253.74839-2-lizhe.67@bytedance.com>
 <0676993f-c04c-4e4e-9f8d-1650c8fd6d6e@amd.com>
 <010b2b6c-8f1b-4c3b-913f-cc2e8b957759@bytedance.com>
 <a6bcd771-fcf7-4fe4-8c21-5e65bd579de7@amd.com>
 <1bab234e-8914-4694-b0aa-f265fa49c6d3@bytedance.com>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <1bab234e-8914-4694-b0aa-f265fa49c6d3@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|BL4PR12MB9507:EE_
X-MS-Office365-Filtering-Correlation-Id: 306498a5-3563-4331-8617-08df36382ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|36860700016|82310400026|921020|4143699003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	GdzPgUNKan1dEr+SsMKZvP4L1DAy+brnTdNfyIuXAzv2lMsnjFqInjDQJosTKH7E8dvxaunECqK9AxIJgSbDv7Z60qt296RRYwqBnVh6wsWPLH1sOQqkfR8HjscysamM30mrnXo7gQeRZMctj7XEaHOVk0vqYyY57o3mIuqaF8hHEb7vBpsuqexM4KiYuzLUTXS6H7MFbTskI3kZuOYocHp34r1Fs6HXZw20LpSsEInitFKbqytXFnRghbsVA+wPw0vFO8a7hg0Y0M0EEWoPj0fTFjNAneVcO/M4QWFun+OaXaAC9zqx/9iJo20Lb8hPgXWCjv4hCj86Zy2GPJe1JNTemIobz+VlpnWyKdKUfaF5Li1TGOGLPx2vgzDkOWxJnXE71v9PaWII3hS0zcMOKYcTgNYXSH0eIhOTHdslfiGiS5sn4Ral68w2FRvQZFmnfYujJ8jfGFlPB7w+svXn4uNAXxA0h8OQSG81D16xejYRGEweOKGBxZa3AdEFfi+i2WctkLJ1CMcrt+QKY/WDgtxPXeSeJD7HKJ/OeQNrGYaDGfsGXKR4aknAkUy5oBwwrjeQmmXK+FDwhWCGBxFGFrMWwRJbnG1JjasGIYEuuJyKeNqhLKu3DpCmkLVr2KiiYojGd46FVtaf7oluZDLxn1pbaUsZ74d14vFmREfCjzK0HNHEG3BJtRv496uK6kI0Z4PRleFsD//87zA7uA0yGeC9YCcxanGVnEO0ejOlIZiHzcEJDiqdhZmgky3AtVFo
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(36860700016)(82310400026)(921020)(4143699003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iZjg/17YPA5A84SHf7aDRDN2/YVjvn04u2f6PkmtGTyO0QntStciLuNEd/VDlCSVcA4smx2FBh9UabTTYNYYxHsMMzymUOtjaJNp5MFuhpa/FVBgCPPNe3GWdFdFaFjdUYjfw8UdttKZts0kB9nwlpJwksqQNK8jc2wP5SbDrbC6c2BmcnBUDUXv7yegTFvPgHbTjirY1naK3lhR9FRYv4NmOmPQrmtKdKDitRYcA/p6LZV2J06jTT+5vHtPhCqxianwAfXD6mHQx49EldupyQHvNFNYlBsCE6ofhfjZlUeE6JGWJCP7ARLZrpUAizLEBR3nEh+fCo+flfzL4l8Zjuqy9VIWk8aLVLvllTjYYZO+68cYKZh4KbJkOZhshBtqWPS3SwUjyJOl2tvRKqBSAkS8v97kUcRo5F8lczUw/NVpYvw/+MmTs2TPUbYE7eb1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 03:45:04.1161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 306498a5-3563-4331-8617-08df36382ee0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9507

On 29-Oct-26 5:03 PM, Li Zhe wrote:
> Yes, the case I am trying to cover is closer to the non-overcommitted
> case.  We do have deployments where memory is intentionally placed across
> DRAM and CXL memory, instead of relying only on natural spillover from a
> full top tier.
> 
> For example, the orchestration layer may want a cgroup to use a planned
> DRAM/CXL ratio, so that DRAM capacity remains available for later
> placement decisions or other workloads.
> 
> In such setups, the top tier can still have free space, but we may not
> want short cold accesses to refill it simply because the free-space
> bypass is available.  The intent of this patch is to let those
> deployments keep using the existing hotness and rate-limit checks even
> when there is top-tier headroom.

Thanks for this information about the deployment model. This is a useful
conclusion to reach.

Regards,
Bharata.
