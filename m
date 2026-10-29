Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793247444;
	b=cmsKpNlOMS5DiEPsdAuIOljKrc6xKM2LGetAyVwV1NutqbHbze4+XEGvSAZjg5cyFN1x
	 25cTLgLsm8qfoXBZQTbso2Cg2mRGNw4tQ9G43MhjdOhbkrxJ3uP/81rrUGwzj1pfLTZDQ
	 gPf/euTwp2hQ9Jtz9gXti7k/CyiWd9QMtuXeJnWpyBb1uu0Ics/PGPbX2ANONVrBGEVwr
	 vJzHJNLlr0ssLKhlFlf3+Em8cbKR9y7zzl2X36mwRdZ9iCqh3fqp7shfDMbGLiCY/XFXp
	 woW48hrXWveVr/N0IkjHg5Un21FXmy8c/rUTQjrFUE3lN/Py0UsrhDWqXd+liUyncRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793247444;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
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
	bh=rSJCe8zophbfUBSAlmq6SzeBx9UPvQmMr7CRrRTL5U4=;
	b=qClcpf8mbD+zrNiHS0wbxTUtNBPmPzMawaHfdMxAI3l3YnxKYXPqDT1ayrs8+8PoX2yJ
	 QmidvV4ZM0ix1aC1BuNHGlClPkwPCgjmKpr5sJuftDFAubcXmoo3wqdeLIzSKlBaZz9i3
	 xA28qaRKZpB26V6glQauLUGge09hUCvUlOS3WDmEuuRtrP0qJ1SFMsnfJQB1WteqRuufb
	 eh7Tg/kVq1jaAPxW8UreLAlMgJpiLTZCX8w7jp5j1PDFi6oN32zoqveklMdZp/mA9mAui
	 UvwgEujh91gwJCcJ+Kuotlqrjc7OJCtv72gfwnXsKtHnVT8EEIbGYvcE+632o41/q+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=z2gPyzrq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.11
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011011.outbound.protection.outlook.com [52.101.62.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE56606A31A;
	Thu, 29 Oct 2026 04:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCE56606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=z2gPyzrq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGRFQqYGVBnIRJk8Wxo/NFKW1n4j3BH0OPNDaMEcqXnSWOy3KRGjRvuH1LEYH7xRk2++33ZalA+Achl10/Ga8l91YzqRHFZjPrj4aYPBs2ztbH1h8woeTDRYyzjedobpdXv5lwgoAya0m6NeLb0g3MGvYAogAP4ptjvalXXsKAsqXzzlB2h9qWj75mSXo68ouAUPSijyhtai94p3BE0Mmou5tYveJX/LNb2djxpMZvn/fXyqL0EIRYVCJKOOnOT6hLvtdEh28Hjx3C7AILFkcr+zV24yQ7Nk+uPNX76enrlxTLeDkIuJ4l/948WJO34PNzUZEuCErqpySmCjVf5y0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSJCe8zophbfUBSAlmq6SzeBx9UPvQmMr7CRrRTL5U4=;
 b=BtxLAfO8gPNXItteHHop17FWyQO9Tr7qKpHz+Hn9Gp9Y9g8nxNqKiy/ECsCjfu5UyUf5AQTlhFuWPw+svD8KHYdq0nC8HSd+yGVKnCVotakbcXC//97ZRXdRSZYSgYo+eoeUxJRcB9iySahBxI4RNEwjpaXAxcaYtw3s+0VsgFj58NVuWaUurWy747UPaSU2pkqkEjeYiqg1ZJaKN9F+8OIWP3R28CuWZ5KmPdP6bTLfRi7KeeP5nh7RMbcCdiVq9f4kxTwwB24JiByV4k5x/qUNi9XOyY1wQFAYn4C7O4rzWDwnJd1IGP+08dD2oXte5FUs4H8+40sI68Mh4Qs6Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bytedance.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSJCe8zophbfUBSAlmq6SzeBx9UPvQmMr7CRrRTL5U4=;
 b=z2gPyzrqo2LmUHU+hKsGxJI3hMuvprB8hzoAAVhE14oCgQg1LyLdNDcWmpopJq+JFleJkqiypLaxQ1+L+mU7+X8uE/8o9k/messHjCsvwMNkv9zS7z0s1Wish4T0rFlvKN0xqxvv9OmdpykV9dsx2RaXfeqJc0zBRlEm/uX7exE=
Received: from PH8PR20CA0011.namprd20.prod.outlook.com (2603:10b6:510:23c::14)
 by SN7PR12MB7130.namprd12.prod.outlook.com (2603:10b6:806:2a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 04:16:52 +0000
Received: from CY6PEPF0000004C.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::88) by PH8PR20CA0011.outlook.office365.com
 (2603:10b6:510:23c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 04:16:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY6PEPF0000004C.mail.protection.outlook.com (10.167.247.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 04:16:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 28 Oct
 2026 23:16:50 -0500
Received: from [192.168.0.152] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 28 Oct 2026 23:16:45 -0500
Message-ID: <e2fb13e8-6d17-41ea-a9f7-397f62a85f72@amd.com>
Date: Thu, 29 Oct 2026 09:46:44 +0530
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
	<mingo@redhat.com>, <peterz@infradead.org>, <riel@redhat.com>,
	<rostedt@goodmis.org>, <vincent.guittot@linaro.org>, <vschneid@redhat.com>,
	<ziy@nvidia.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>
References: <20261028041253.74839-1-lizhe.67@bytedance.com>
 <20261028041253.74839-2-lizhe.67@bytedance.com>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <20261028041253.74839-2-lizhe.67@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004C:EE_|SN7PR12MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fbb6a21-1bb4-419a-37f5-08df35737548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|36860700016|82310400026|921020|261028144727099003|11063799006|4143699003|56012099006|261021121427099003|261026140227099003|261022105027099003|10067099003|261022075727099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	lghA6RluDIyLnFFvhX9rRwyXQVPXDF5Q09X9mZz7yf6KfDPeIpsfBG4Pp427Y2pJdaPJgSRAq8SQOLynq5eGo/bjAJ9+xI7WsNyajiEdagRCbtp3br43plZAoiRn6Q5vtxyX+Pjc/S1jZnLJP+X86egbT+yLaKoLQlYv8TkZZQVMOf9NIfNVgf0pEolw5+iILeYrL+ZQbqrsoHQnmnhreyqGy8NKUFhMzXP0BcAuya9vrBFv88RmrgIlgT8PdzGe0SoqoXxfS9XBmP+hlP1D/69VE57sg7E2reRHkMKV/baoQN/zkp7WeDZiixbmnXbmH5FZES9f0BUBj6zc0EBQ2uS7zl5pwPt1mERpJO0p7MWn9zMEoSqkFkHsQCHYbozEz5sltTe0JUOTKtwoIghS0JMa/TRHVhHP/dOpmQLrVfCnXXi2R5wHm3ovUIvfxqgku0zA8uC2Zw5O5B9Ri5ibre2zV6I47/LIXWHZZC0V2CEOsAALlgfo5tbRc3zhYGuuwBiPdc9dzjLgJ8I6S21qDn5QLAhRQbroYfimgOqmwwm8DXFvGtV4pvzbW6934e1zeBTL2r/1Q4WKTOSvIUnhZ8uykxqkA7xHpIUWIkHc0XzIkz6GtJ1Rio2ERodq1/gRnG67o5SiwGQkVj3lWsKI9KUkWl/9n2PDLuInjd1s4myOgybdsw92h6bc2EC9FFVzu58QZtlX6ttoV8usL3WQdJ8aRyCuXEk1AnQKvRHlcwQpRd5b83d+LXIGKk0zsOdr
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(36860700016)(82310400026)(921020)(261028144727099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261026140227099003)(261022105027099003)(10067099003)(261022075727099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oqVkSRXzBFedJKBR+kLSwCEO1vxosnB0uJwkaHQJM9bJ9+Ys9ZXtC09C7juq/0fh44zti7Z9EJUh+gLSOYpzrRyVSjBzFYmlkF/xW+X4YLHHmNUbWdKA931UtCJvKcJ0GxkgVq6lqzvk0jURkKKkTnnaP7et3qF4HHdPCxFfF85MJdy4+NWtmAUSVbJqjpxdof4xAxZezMYU9lskPpDiTfIsyYQi4aGEezs/78V9NWle2bj1oA9fC++8pdpEtKuyd/SNxPRBewnty4OZjCRTLv2WU41ImOwF350CMO2Xkb4pIsoO8sexHwqgjCsobS7PBB2ZBsZy4gJWUKeupsgVtau8PeDTjgQPExrwU5542kxl/cTwRVFFsHpWi8dqAstuLzYUjKztuaOx6ljAx0lGBZzIM2N7OCtB2d8wzgWzOuaED0OY8XCLvoBK5sm9Xztl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 04:16:51.4189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbb6a21-1bb4-419a-37f5-08df35737548
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF0000004C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7130

On 28-Oct-26 9:42 AM, Li Zhe wrote:
> Memory tiering normally promotes any recently accessed slow-tier page if
> the target fast-tier node has enough free space. This preserves the
> existing policy of filling available fast memory before relying on
> hotness and rate-limit control.
> 
> That is not always the desired policy. Some deployments may intentionally
> keep part of a workload's memory on CXL-attached memory, for example to
> preserve a desired DRAM/CXL capacity split or bandwidth distribution. With
> the free-space bypass, short cold accesses and bursts of hot accesses can
> refill the fast tier and pull the workload away from that distribution
> whenever DRAM has free space.

Currently promotion happens on 1st access. Won't it be more natural to tweak
this frequency of access and also the time between successive accesses to
prevent promotion due to short cold accesses and bursts of hot accesses
rather than free space bypass configuration?

Regards,
Bharata.
