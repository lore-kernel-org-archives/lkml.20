Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA4C47C0EF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727314; cv=fail; b=ou/7yEvDzF+ufbMFJoGLqGkqhosqVqDNzfmZhvcsqXu5MSxCge9yao6Xzvl1IsM5XMqlBTbG0Mg2yZBPOlcxBRnlz9ob32Z+g6XR2jhPEvpZlTjjspKBaw91/0HomgUwVZiL1Xuwv11k6Icl2R13HxZf03LrEjd5nqfs6oVi6eU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727314; c=relaxed/simple;
	bh=QLrtUnfFofBf+Ulp9UjGbgRSrvfUl/MIsvlvdYdjmhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YRdrDMc4cyHEKmZH+7iJNUbkBjutCmhi8/exJZfi8+2rZ0CbUJh22VHZarwpvUl110sek8RxQMRe3oziJhmlTLo5O0ZCnWfFPvW4WIrbx6ULfrzuywjqcTnFFLPWvNiaPTc3OWqE5wl7+n+c1Vc9DAXWHuFL43J+jnqIPGERcvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JiLe83/B; arc=fail smtp.client-ip=52.101.193.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JiLe83/B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJaUJTxYscnAYYtxw4aS6Jz4D+8dmNPWNsat3G6/fSt/zN8v3yXpSU4EK73lnccGjbdZ7FR2kLQqp9w6YyZ6rU8fHSb7TsdCMltD1Oc0h2jxBgiKqfPwzTV6AEpBYR1/ImxGzHVqKIQn0eAx7BSA/zJM30c+DZgLsYbwiu7BMBij2mkvBDiK5BP7V2U5jT7Dmhzb2YSX79l+N7tSH7YO5YOqxtuUxjloL6Vc41T1LZAe42JDHz8QSECXeNR3BU3rnf0yDUeTRpIzuKkbEQWypjycNikkp2QNuA+gGKTA/b4vJW2KeKqJEjpjULvfzjJAXxyvVr+iwZkRwm1a+lvaoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v28haCXzSO8iXHzD6c+N4HQvLCc+82yrtP3uN1xSnyw=;
 b=j+j0V43UcE7lc2kFWb6USVF2gezcZCkleHw4lhNIX3kFU/TsxRKSz5I3Ex5HgA+bzNIIPaL3dZPSEJrv7PvK2RfIfHDdEdqxuk8trw8liwq4z3aH/8ux/6+GkA79Ou811fm3TMfsvUfIXalr/t+kuNlH/dDHEfPa4QnLlnRQ6XwH6JsRBky2uBtqV4gTXdj1iEE8SKQPuDfVT0SEXRjL4mLfZVNLq6cJ4xRiJorwqRpA3eUIE7SCvPDe9kl/NxyPuPNfkKWCRs3a+yFqh00WlxrZJelSQIVc8WMvtcSsi0JXGp5xkZp6U3IbVpHWX3aIIFgT8EGbNnIkkQDTGuB3Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v28haCXzSO8iXHzD6c+N4HQvLCc+82yrtP3uN1xSnyw=;
 b=JiLe83/BZQ9t477GEhCNXdn61jxyRhAb+2h5AKkFXgTFtK9ywjQ15c2bcAi1MND5aG4NTJx+XITuyRX5D+yyRlVw+fQ4DOXOUIDWp63rNSs1j3j/YdHBUioL4B//9XAbiuQ/qlYC8IiadMwsXHhLuspBhB5+FU3WMBz83O921Bs=
Received: from SA0PR11CA0161.namprd11.prod.outlook.com (2603:10b6:806:1bb::16)
 by SN7PR12MB6671.namprd12.prod.outlook.com (2603:10b6:806:26d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 10:28:29 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::21) by SA0PR11CA0161.outlook.office365.com
 (2603:10b6:806:1bb::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 10:28:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 10:28:29 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 05:28:28 -0500
Received: from [192.168.1.100] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 18 Sep 2026 05:28:27 -0500
Message-ID: <4eabf0cf-f239-4f51-829c-9c0dfe4658b3@amd.com>
Date: Fri, 18 Sep 2026 15:58:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
To: Borislav Petkov <bp@alien8.de>
CC: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	"Nayak, K Prateek" <kprateek.nayak@amd.com>
References: <20260123230651.688818373@kernel.org>
 <20260123231521.926490888@kernel.org>
 <20260309154317.GPaa7qlRzYcQY1dBU3@fat_crate.local> <87pl5are5q.ffs@tglx>
 <e4a41d43-4d60-4132-aa2d-70e038a3e9dd@amd.com>
 <20260918055423.GCaqzSDxu2xBB-aXK0@fat_crate.local>
Content-Language: en-US
From: "Aithal, Srikanth" <Srikanth.Aithal@amd.com>
In-Reply-To: <20260918055423.GCaqzSDxu2xBB-aXK0@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|SN7PR12MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e8935b1-b971-4fa8-31df-08df156f94c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|22082099003|6133799003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	h0/rFCtXOlt2k4Uyb+ZaOUHVNbp8xBDxX9XLHU5Pp4P9epF3OkViUz8jME/ahd0oY0oaCVHBcp3jyEY7MjLa/H8j4hV38ishfQEtLA6/FPetnWWC38qNozSMumXJk6V7Uh+bYwf0ZIIs6AUSLJKPZMP3g8yg4qEDwEdgMX3o9M2VA8rG2r4tu0XeBRpPtBHymy/q/8hKb4vver8rmugzv316UfPTEIDaRJ78kr03afabT9UY69iEeWPOu7PEECSwwXcxno6tWDPt54WSM/n2kIRDY94FUaWYlo/hSTGLfgeZrv2xLawMtWjFToEB6WYoShe6W9qS+i75iaDRHCHmOadQ0iRuzfoasc5+A6s5WkAF+QSoagSgBoxunrvVUzAqtZ2qINzt+NeIjLM1Td0nY5+Lt1gqkn9+VL0YrcH4Moq5Lzxx4KG4dwApLGUebIcPI8l+7ERYGZPhNObtAAAUahVflaHQA1dFAkUYeUyE3swUrgl1EHmHPYy0CZWNc9VtPZdxmjLa7JytItG6h+xIxphJ/XL3kGCRo6+/C4ZuY7TuR/zYLsUM/ZuBwQ+UzF4Kd7Ip9WmdhL8VtaxkeJ8lUr57ugRm5udGoWodwCqTQoEyciNsrSBr4KY5nkAaMOKJm3qzmmdOZiivlMKDlElqOesfCaAF10c8KJ78zt0FnOmfb5dLpsrwFUmWzaFo/nv5AmHzdaX3dPWNrCeTYo2NQQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(22082099003)(6133799003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b+f3F/pipVhgeQk4b507xmCfI5KRmSw1mTfX57oMwSooZJ13DW+da/oC+zRySthPfg7ZAbO68A2sr90keFQ7scF570P0A2Q6KXbSswvxrKjS84DiVs4U3F+UavyeZs9gsYZ3fjEsgncXw9+Ze83hiDunCxbStrFkpWgdvL2AXp1UzHc1xAJMb5F57w3I9PIrS7vhzh2z4ezq10SZaMhTOSVmDPgvIaEJ3hVAolJezZwSj3bOLJWAq/Ar3XeTcTf00jFdBBIj1zu/wuViBeK/xuTk4BsI+KTNnfjKOUmqlTKXLgx2WiQG5O1XXx7GSx7U/3ft02G605qVs3EVg+FTKJbcqm+8DOUmnnNVMtSN0NXPzqkDs4ZP8IhqI+G7+lPpjJXEqq+yYWajbCFx9SudGKlzUKaF8iLfyMnv7zddhVHm9cqAaJwmKtK7N3/LgTEB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 10:28:29.0867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8935b1-b971-4fa8-31df-08df156f94c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6671


On 9/18/2026 11:24 AM, Borislav Petkov wrote:
> On Fri, Sep 18, 2026 at 09:16:19AM +0530, Aithal, Srikanth wrote:
>> We have been seeing intermittent early-boot guest hangs in our CI for some
>> time. Guests stop making serial progress during the first few seconds after
>> SMP bring-up - no panic, no oops, no other error messages the vm just hangs.
> Please enable CONFIG_CSD_LOCK_WAIT_DEBUG and run it again. That might tell us
> something more about what's going on.
>
> Thx.


I recreated the issue with CONFIG_CSD_LOCK_WAIT_DEBUG=y / DEFAULT=y 
(with and without csdlock_debug=1) and still get no csd wait dumps.



