Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013006.outbound.protection.outlook.com [52.101.83.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B6F4E50B5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.6
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852477; cv=fail; b=JCpDj11OpzWLrYrF8UvJu2hA4NHmM9sGUKDQXHRgzD9eECGHwjRWrsg/GZgL6XmHKYStfdPrdQlep2akw6M2R9PrkHx1dtcyyZotV0xqaJMINyxQygigOd0SFxsoFLkbq8f/BdJSMK0fTfTqUnnYeg2C7pEzcq97n/7GKezKLcY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852477; c=relaxed/simple;
	bh=MR1dlGyppGiIBtv0l2jdiCmrFwXeHoJynr1yIqFLYfM=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=FumoyUpO1jIkJEoej7bfcsqtZVzL44aBHxTHzbFBM0O8I6ta/7frn/bwDXzxcrntYNeOqO7Vl1HJ2Pu7edXiQFvud1mZUIYRsTV9HCo6eRIvia1Rr9ZatuAPetkRqrSrJYsnBPOrgBJEn9v3Y4mcg/hk6mEbByMxD9jowxoHdZg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pMcgJs+1; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pMcgJs+1; arc=fail smtp.client-ip=52.101.83.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pMcgJs+1";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pMcgJs+1"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ifdfxm/fz51DQaxx43JCLqrueitnstWjXJ4yu0g0/THYSvjfYGUxjJxZSZgB7OQzkZQoQwhPaTwFJDiyuJYSQ2p2P/EPLSwwXtI2W9WyD0KfBtyewQZ835id/Z1wQ4+vSYuGPjcHQiG5tnjBY83aTBbkgxGMw/hZ12FMbBMmGjE6dR18FVBjZRliu9QI+v0slp1VEULEt4Pb8O7BN0oSlpJoIKtHdG9myoO9tZGQbsKgjTeUAaKwBt4HyIMtdAvNUSGs3otMcCspo5i1yJ76kH/9YMLDCl/O68LUQrduC+ibchFltXNEKY3kKShIPNqtieOiiuDAcQXnLo0M4s0oLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+fZEXIXhYmZiWrpdQyqlYpaY+vwFaQcr2LPQiWkqNg=;
 b=Oo9QHqHzhJjHNQ3ID5KCBn4nK+tmUKHxpMSAb+7Jl49YjhUtG0qwqs1vvy95+qbKRSrTDnvW/7lk1MOvOiW4lotmrDWlr2rHxo+3iEMtLEPsv00uyQXvNRLc9cOYt4eseaXk1+y4k6eXsR/7a20bUsT0N9oELooVROzsLZi2BOmcl5ufPSPBbynrPYZBAb1XqfW+4b1zki/O8vu2RJ0N1eplTsC5dGXI6/6jNIG281dwoLaj5Au7wZdiosMR7BwLCEamwebnyJvEb3iWe6juV8hCH54rHlUIs4lBU+GVTm4BJgKF/z6e7uEa9dxkdy6aZKQ4kfhmLrxjP0pUyzpfHw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+fZEXIXhYmZiWrpdQyqlYpaY+vwFaQcr2LPQiWkqNg=;
 b=pMcgJs+1bHFsAOr7E1vCE1mnQ7z8Ricuejrb+5h+4a6yMImXZzdbLgniZu6Vqwv7CJCKyUBPs6Nzk2Ja+3m5KPMrKxo7j2pgSmIuBSlBbd1mbSq4SQ5Omnjp5R2ItxUcM08eyjhwrBxFNTK0m+hDWYVzP+fEuEDNzSKNlUv6KAo=
Received: from OS6P279CA0054.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:31::12)
 by AMDPR08MB11411.eurprd08.prod.outlook.com (2603:10a6:20b:717::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 11:01:11 +0000
Received: from CPH1EPF0000051E.eurprd04.prod.outlook.com
 (2603:10a6:e10:31:cafe::8f) by OS6P279CA0054.outlook.office365.com
 (2603:10a6:e10:31::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 11:01:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 CPH1EPF0000051E.mail.protection.outlook.com (10.167.241.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Thu, 1 Oct 2026 11:01:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAAqr6/57XhifdBBXeZIwdP9S9Gxi1UivXdwHRbfkDVUerpEW5OqoFFsDcBS2oDF/njzCTT/3PxEu6QXKN4qjnVlqv8s2OXhLn1fP3Kpg8mu8lJ5qV20c+EJEdJrYdj/GXXNpxqPQQ0vjh7j7End1tigwAm55/iIbMmxEZ7p3dooqyY0SWSRT0IygvHLgrGgJ4AQxUy1jPClQWfnjJy3Kpm39ghvp2WzduIvG3Zzb/LSdNdLqMvPuA8DYFd0Ohg67ip7xruo6bJ3jwnEX3pMEBWz0b44nBy4vvnb6AhtD+F02V6ThVJMIA9KX174WH1AKf19lz76M5jOcIn2QvhUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+fZEXIXhYmZiWrpdQyqlYpaY+vwFaQcr2LPQiWkqNg=;
 b=oqFTv1uGD7yKt8uIvoT6Z0KYKRVMfeIPT2TgcVomdZLNi6dFGjUcYoqalaqpXHgcUPF7H3d+j10kN8u/d80wQ7NwpJdLmMUusYnydDy7H/0dpxYkWU2/76wHQvKJc2oB5bkf9eCULnAUmSuj1KPykfYjOtGrpZUU/roTM+Hun8tIB0/GTZO2kd5LLFrumlSr3qZqOry7AdH8RnG6t5Wcl9WAnVmLaFC8063Myi9AxpvGjMZGWcAI6On9VIWqckvAEkSZK2ZoHWGvTvwOVqginKpKSeHfFTzxTcrRIktN3z+NR3tAfnDFOriNHUooEt3hbSZ2c9W1icuzltAlwT9eAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+fZEXIXhYmZiWrpdQyqlYpaY+vwFaQcr2LPQiWkqNg=;
 b=pMcgJs+1bHFsAOr7E1vCE1mnQ7z8Ricuejrb+5h+4a6yMImXZzdbLgniZu6Vqwv7CJCKyUBPs6Nzk2Ja+3m5KPMrKxo7j2pgSmIuBSlBbd1mbSq4SQ5Omnjp5R2ItxUcM08eyjhwrBxFNTK0m+hDWYVzP+fEuEDNzSKNlUv6KAo=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10) by DB9PR08MB8410.eurprd08.prod.outlook.com
 (2603:10a6:10:3d6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 11:00:36 +0000
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04]) by GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04%5]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 11:00:35 +0000
From: Bence Csokas <bence.csokas@arm.com>
Date: Thu, 01 Oct 2026 13:00:07 +0200
Subject: [PATCH] cache: Make cpu_cache_invalidate_memregion() error out if
 there are no handlers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-cci_enxio-v1-1-3c9e16024abd@arm.com>
X-B4-Tracking: v=1; b=H4sIADY9vmoC/02OQQrCMBBFr1KyNpKkYKkr7yFFksnUjtBEMrFUS
 u9uUxFcvj+f92cRjImQxblaRMKJmGLYQB8qAYMNd5TkNxZGmZNqjZYAdMMwU5R97WvtWwsIjdj
 6z4Q9zbvr2n2ZX+6BkIugNJxllC7ZAEOJRssZUzkMxDmm9/7FpIvgN2j+BictlVTKWY9Gm8a0F
 5vGI8RRdOu6fgCAr+NCywAAAA==
X-Change-ID: 20260921-cci_enxio-f3d31d9acec7
To: Andrew Morton <akpm@linux-foundation.org>, 
 Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 Yicong Yang <yangyicong@hisilicon.com>
Cc: linux-kernel@vger.kernel.org, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
 Bence Csokas <bence.csokas@arm.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: LO4P123CA0228.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::17) To GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10455:EE_|DB9PR08MB8410:EE_|CPH1EPF0000051E:EE_|AMDPR08MB11411:EE_
X-MS-Office365-Filtering-Correlation-Id: 931564b5-109d-48da-587b-08df1fab4d0d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 cCpDk3W5uVNrL1ilGxzFbcYNT3VwNGsciSgBMVBHlbG83bQjg19qpbj1zoX3EyPZkVDDz8e5o6uJ+Gk5dtARde/oR+0zwnzhgdTRMyFK0IDWgYg3g6Avro9hnnIm3ujqZKuQdY1hQwSv/wCnkxirMYGRmNolT0Brq/Hhs5HNYEIy9GFa5+0b3TJHy209Y/n2sWQg79YpF0mKDLenT7yjsntDzW5xNlv5wjWu4btTbqgkfSiEFc2B2YrtMHeoZf5yFQbFJdrfRGiomV9ZIOquEe39lu2nsif+yZrHiNTfFUm5BsmU7syXv8+UC3TpejR92sm5I3/FcWGJDVZ/u1S/7JptkVt3rf/av1OBBJOijR30Gm2knwjKHGbAXqTNIZdrCf8aSPO6omXlYW/kvLRQ7YUZyQ2RTp11RqKFkHchpPIMTPaPVCrlCUpViVbMo2DHYDnJ3xkpKpm63f2D7oWhJ+JEfYFXi67f+jLTmcfZ9B6mI61KieWvK2B0oY5OFWWYtvfZ/e64XQVSrcBN+oqxntWbFdgoWpk3TABnt69sZrUNhSEjn8zg2Qy5tZbv1xi41dPO+XeKYRki5lT8CPJ1Ml/dxTgl9FvNSDnLrAIKFZY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10455.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 HZO3uVqwBBN2jqVI9m9Pl2SlKqlmInVHkFBiV83Hc2X6APf0UuMGn7ynFpEK6CioPZI6urs4DUe5P1DQtwM12YEDCFhKKg/yvc7o3scnAhYMbWq+TV9y++SrDAZG6A6J5RRoNviXX+XZhao5GPxzQsIru+yWvWUuc6H2/P6zfzLBo8mngCSjw96F3IJOshkhzLwbt4qaCrYHOiub0V2bc6I99X8lR2A3GweEaBFhJmAKF9F62ic81MefK46tzzp3SEkp4sBBbO1pRXos9QKZpHex65BOyovqHR2eJQ2KcyQYkjHAS+xXgaStNTornj9eZ5Yf9Drus8+6eAz/oMb8Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8410
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CPH1EPF0000051E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	779053ba-424e-42b7-f7b0-08df1fab385d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|14060799003|82310400026|35042699022|36860700016|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	vrX2AJ2UI4rbjVqmBjgf5SYb7uaq3Q8Hsfl0rfBDrIbYGe4EhxfSOm6TxmGSqEJEy/I/oMES0Oqk9eenuUc1D+5EBRXrxnNIq2kr/CnacvgkwIHUWt/dkRfv/UV83nNEv8hpjYI44ycEkoYxK9/kkNst8VzN5uMZC7p+V4fzVafHBtXlBv5JFvNSryaG/a22Sq0JKUhjDUFngK6skdovEhfPnF6HTgpyx2T6j+n6Tpbs4XpQuMhQA23B6RRXmk+FD58Z9PJE8AIrczcPz32YcVhNHsSqVGYDjVhNQOnQWIv69mGfQrpqFrEpU+Uq516viBwwmR1Blbgknn9MLAiaA/BWl4Yb+4T0id7foRwmwC0yOQx0Q5wpleZJnpZa6X496RMUn9fzFbs+UcxqbrtB8ktulvaVya95bYVrxCCZCmFI19HfZKH4VMxJcMI6vRw5gPCv5GZoX6YUtBtjvRHXSPHBpnoxsG+/uaHtTZeGm4q5RNo45En5CiZmOL+5cYzWfjs9YxBmdhAY4PLJDq6AToYtxXzi3BHgbgZN9oXDQZ/lkbPJApQoKQzkyOWFsDwRgXjNMWcZlLCBnqknPM4mHrim4YQelEiurL7sPewwsM28/Cmx0stt5gdXh7LNjftScj2KYEb6ea8UahE4rjrORA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(14060799003)(82310400026)(35042699022)(36860700016)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I7Kvx5RsqSNEqGGRoQfQTMQBdmdWD6+JUH50eKjWHwpLqnwKpzz2FmylwqeVUqleOAAOTfe/Myxrsqtup41oMxpeztQyBDcvDxfiSI9+2V4eyDmpV2WPx3OujohFzH3ANMppi3BpMJjpj60rElQIjDTL3qn1mjg6OIaqi9UWJSzWNAEdl7nmVtzs8lD1w0PTRlkB+mX5EK5+j8r68aIBHVWuNFXouv0gXakDdYnTOjNCLufPXD5pbyR6sQXuTS5pr2BXcAHQKQ5/1i8pObIdUq4nJMnHVS/JB1oVd84y3cOrgdWSUlIf+/jDFtnfPHir5Or8uvNigRTuLSuNUMhpHodPV8FydQMnKJu+PdcD1RMy1Ibdgvbj4wu2jIrXDAhERE9Bofo4kUAy0k6M/EHroCC35jWlv9BY1QiYEJhegxYJ9cOvYO9h5gp5YcFCJ9d+
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 11:01:10.1106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 931564b5-109d-48da-587b-08df1fab4d0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11411

Currently, if there are no registered handlers,
cpu_cache_invalidate_memregion() returns 0. Callers are expected to check
cpu_cache_has_invalidate_memregion() and return -ENXIO themselves, instead
of calling this function. If a caller forgets to do this, they may
erroneously think the operation succeeded. This is in contrast to x86,
where cpu_cache_invalidate_memregion() itself checks if the operation is
supported, and returns -ENXIO if it is not.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Bence Csokas <bence.csokas@arm.com>
---
I noticed cpu_cache_invalidate_memregion() returns 0 if there are no
registered `cache_coherency_ops_inst`s, which I find counter-intuitive.

From what I've seen, there are no in-tree users who do not check
cpu_cache_has_invalidate_memregion(). However, IMO the better solution
would be if the function would perform this check, and not the callee.

Furthermore, arch/x86/mm/pat/set_memory.c also implements this function,
but actually does the feature check, and WARNs and returns -ENXIO if it
fails that check.

This patch that provides a low-overhead fix.
---
Changes in v1:
- Rebased to master
- Collected tags
- Link to RFC: https://patch.msgid.link/20260922-cci_enxio-v1-0-00bade212729@arm.com

To: Conor Dooley <conor@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
---
 lib/cache_maint.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/cache_maint.c b/lib/cache_maint.c
index 9256a9ffc34c..132d2816d6b1 100644
--- a/lib/cache_maint.c
+++ b/lib/cache_maint.c
@@ -59,12 +59,12 @@ static int cache_inval_done_one(struct cache_coherency_ops_inst *cci)
 
 static int cache_invalidate_memregion(phys_addr_t addr, size_t size)
 {
-	int ret;
 	struct cache_coherency_ops_inst *cci;
 	struct cc_inval_params params = {
 		.addr = addr,
 		.size = size,
 	};
+	int ret = -ENXIO;
 
 	guard(rwsem_read)(&cache_ops_instance_list_lock);
 	list_for_each_entry(cci, &cache_ops_instance_list, node) {
@@ -78,7 +78,7 @@ static int cache_invalidate_memregion(phys_addr_t addr, size_t size)
 			return ret;
 	}
 
-	return 0;
+	return ret;
 }
 
 struct cache_coherency_ops_inst *

---
base-commit: 551c722f40809618230001baccf219193e22fc5a
change-id: 20260921-cci_enxio-f3d31d9acec7

Best regards,
--  
Bence Csokas <bence.csokas@arm.com>

