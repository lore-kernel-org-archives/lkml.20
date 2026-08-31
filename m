Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020136.outbound.protection.outlook.com [52.101.195.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B27463B6D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200165; cv=fail; b=tdFn1BjHk+oUv1e7fPT/WqBGc+1U9EqZ0VIWa/hrna7BzfJxGb2HII2TfayFheJwWEzV1ed/FBSj+cgdoRReitNSelE4qjiJSzqsQeOgALHR83IKHToHYFW6ubkVM5DS6y2U4lurn3qJDuH7kDd50GItpouaSKq59ebioMmgzmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200165; c=relaxed/simple;
	bh=JepIf3wkGGPmfxdnv7pF68gAuRmFf9dx3biC+4YJ0uo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Qx73rbnIyl8jzN7jAZ0bLPtAkf5UoDv1MiuwcIWoed48APuUStf06+St/Lgkf2Mp0g6UlGoyFm7yXkIFdd934bcArZ6kAqt6ckc67D8iSq8x7NQP+14t1LIZyWuxE0LWnBSMn+6fwT1jlwNYGyZXrlhwo6KwDVFOrSat6fAyF2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.195.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItsSmh5KkhsTYwVTpYGCFF5tWBDO+q276HcRmVqskNTxzelOim3JYJ2FvBJUTU8QpkYqh+XRYYKbCbao3nJG7AjQIj7o4PDLG4JbPVUX0IcC2D9vuAzey6CIBKXt6/dustDK9m2TNinYal/T0Hoh+AWxaI8LovHWSFVHCCPJN1VleQdfmIUremvCh/wwLDgb7MU+R/5Oll6oLmzROepj0rYxfYKsT4TeZfbdtx9AzuZWf6JF3Hp3xgP5NHZV+fVMwc0ugwITQJg+omZlW42OI7bTyl01GpH+kVL7/cwTxwp/SRfWOfz5uhKsstLBuuQYc/fix33qhS+M+4ik0VTNdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=WKLUZvWXzA2IsnBNBwGRHtWBRECyI7/KjHA5bac8RZ0=;
 b=vnies5hHWEiYqRZH+PQW7RmDZDRTipd1Qsm9QhUFKARZ5tWS2WPAUwkJFoGcekUVTnvcX+gQoM+WyZBeT2uSwp9fjeOYxgeCWURPot15mC3ZYt2sdEWNx2nF/aHu+LNuz0NAZX61IRanTSwWDPf+xAywwd/aavDC1cKwngHrbDYaed8XMInOOKP/pDvTDIJrMnNVJx7Gmy38QHnH13cqWAl4b/ixG5slkLQeJCQWXnxLmoMvkC4JaUfjkaisjJ8KrV346CXnI0XaHy9Fpx/NRXWLB1YIPILgT8IodLcAJOxQK7bMDr/CIYlHIyOkV1rJ8Any7K8Ocmt53kjSlAJxwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO3P123MB3339.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 18:15:59 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 18:15:58 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: tj@kernel.org
Cc: leitao@debian.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] tools/workqueue/wq_dump.py: Backward compatibility and live worker inspection
Date: Mon, 31 Aug 2026 14:15:52 -0400
Message-ID: <20260831181554.117795-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0683.namprd03.prod.outlook.com
 (2603:10b6:408:10e::28) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO3P123MB3339:EE_
X-MS-Office365-Filtering-Correlation-Id: f6a0f4cd-41b7-40a3-9ea8-08df078be829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	XxYMJ+nFM8gpRxcCCXXO7Ay6trKdRQKYW4GsojQQin804JbNSTipPwiJlGNwypv1sl6wOqljRGgXtbLNbe/0HN7qepzGBmXbHvwPn4UoBS1s29iQ1dn3Z1z/s9EflQ0Rkyg/stWDp5dup2o1ch2nN13q0P0k2aOOEAdYFgmTDeLJfc1kGuuA3ghU6wixsQGRQHQnq390Ph6JULeEpA1EjWs/d9DxXvCOMCi7ugAFylPpKE+1q3Z+NEf3h4AhxrcsR2yogDb32fdZoWIqyCzjYha5ojatkkuLjYkpm8Ajyss0mcv5Jp0/3qD+mpQohWzShDZlHXL0cGkqhO/g+Q9acoJgCJsd8aLfOVUZpw5FvKjQsn/Ezk2A96WL3tAnwYuggcBJJODbczHkeyJ5p/3xYjXGrBB7WDEpeM0wPCH6wblacOAFx4vj9OKB5ZNlEMvx6O22A6ocoNR1wSaq8tYMBO5j61p9br+3GYFUiA5EoFKTwSr/tEVp3IjfaUzGLFJi1keXKcW5iVfjZv98Ht/zPggp35gz3QuDVUUQNd4bS6zewcw1urcJS+RWsRQ84OQcZNLpaBgq8WyZyoiyZozA2fqGnbiPLLN1lhwxEA9iZgEXlp2QwBJA94hJyX4pBzr4Bho8ZY997dyllLn6Tl9sG7A+Zizgq0euENImMHDF2nk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AgP9box5HW1pCqd4ukPAkJCT2g0p0WFPkCqfC2vc+0nagXJ/9ocQ4/6t/AhU?=
 =?us-ascii?Q?EO2TETQv+SwfRw67Yry2K/nwl7GJ/fRG2F1Fxij6Jxt/i64XP6VIUdqq/Ibo?=
 =?us-ascii?Q?yOKQMMhbgHNZdzi1ZpL6W8Dk+KuF4KXyR7w4qjp0EPNV06m4g4pc+FXg0mMW?=
 =?us-ascii?Q?QP0l9jC4zJRWfWyCSnsc4FoL1BDCHLnfc2xPLi6JWRdjF7UbqrNH34Wuc4tm?=
 =?us-ascii?Q?ngccaSnVHMlUsSmvHISnxpSUkEwPGxO/iZlvmqh3mNKSyhjvYiOlxbYtQ8F5?=
 =?us-ascii?Q?pOPODLWbSYny+KQol8Mkn3SfXxndSAaVTlgOQsB8Z0NItlv/Mqu5GJP3tRgI?=
 =?us-ascii?Q?mvLjXS+pi8AeU5wJsCRDr0xlf/61KpDarBUR+bhBi56L//pfwyODASaMhbRs?=
 =?us-ascii?Q?7/5heNdqq2fMBKEj7phsDLOYBbM4IVJAy6ov5vv2KAkIM/tJhopSUSQIDVBk?=
 =?us-ascii?Q?+U8BKb+m5V14wSCPD/oeOFDOxi9NHm+AztqhKXc0dShkEifpRZZxConi1hwx?=
 =?us-ascii?Q?LSyV2jW3seBAHJMVAUfVfLdqt29g2DuPcoCXZZhNDpXNNTKflqTEvOT+fDPF?=
 =?us-ascii?Q?h9EXjyM+zwHbi/1eHjPmKTSy2UV5KFEt7R83Z8wzwHkU+yp8qBxfGSNkPMLP?=
 =?us-ascii?Q?iLqQ2ooGu09K9qKXhPNuTDhvTAGKLdD7obTVD/X1KuI55wU47OIr8HfDpUW4?=
 =?us-ascii?Q?MomL1v6QAWl3StRd8KeZrobSed13Sai8RWUV3HK5C4mAcl/jrrv24k9FKewt?=
 =?us-ascii?Q?7tD/MkQTSoNfDHAziuwinAzNF9rGazJyxi4RXx0Gr9m5uLVaydUXhpkNQe88?=
 =?us-ascii?Q?LBxc/Ha3TO59gmM34slmQzGaelHfKarXVLpBSYVzBLYybDRuOPO8Q9U8sgO4?=
 =?us-ascii?Q?LVvSHhOmKOjuDejT0hKciDjPzWU7Oa0Lzob8HA9EWFn04mXvRU4rz6G7AhFt?=
 =?us-ascii?Q?uZcoERawvfiIVhAjAUDW7/ajS0CL+uqIFQ8nVQT7YILzK4KW/wIygjiGNq2M?=
 =?us-ascii?Q?HlOvLD2HG4NNHx01O4AcL43mufWsXeKAWoXZuCoAM60GvoTLqMrVco+Px76e?=
 =?us-ascii?Q?+cpoehAHUjfntGFxjWmF2aZzgjM5w2/qMsHreizHVn5f7UONn6Z1BfuFCfQ9?=
 =?us-ascii?Q?ecB6OO2htDrDU2D6eGjhchHCFNMvl3fluAUF7awqSZ28tSD60DM91IGxNncY?=
 =?us-ascii?Q?f2BsnrAm2nka3S7E47K1By++pmoA8A89CubxlMbF9Sjks3iq/Lg7AkO3E7ac?=
 =?us-ascii?Q?muiyn0LqlqOWUgaPR0YhJxM/uuZSZXl5bb8L7b/KkQDp4JJWn6ZX1sND/7hl?=
 =?us-ascii?Q?XGCXBXUCIfgNk9ohl97c5eihdB3rsiLpNCBWYoBLeORcjj8g2LJx/hqvNZ2F?=
 =?us-ascii?Q?fOg8e8hP78fwJSXXCzmXUzulkP4K80zvN+xs+AFVjrEx3KljAu+lauSMqgMP?=
 =?us-ascii?Q?rekeFH3WW3gksvc9iNmCIbM9bgLwiyIRn3m1W70fqFtgM54Gsg7VkaONe4xM?=
 =?us-ascii?Q?RmouRRP/4sLshccdUHscajhKEX2J9p0N4yG3kw1mxm8FUX1H5hmEQGXnDffs?=
 =?us-ascii?Q?RF1Q0AdCbyf5HUyY1IgTwxIVA0DInWz63m4fSqVpQNP8unX1+za8lmcB9/+d?=
 =?us-ascii?Q?23dOHHrFN0vxh9zIWH+ZojDejji3TlUIJHuD92xJHJ2bm2Hs2zlsOi/2G42T?=
 =?us-ascii?Q?y2ohhNaoXFcqKSagJsgf+2UY4bTtaltvXKUBJJO9f+lEL0sXA2e086fHsTvQ?=
 =?us-ascii?Q?AuoqMo/dWQ=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a0f4cd-41b7-40a3-9ea8-08df078be829
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:15:58.8241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nZuj3+QMXrSDMlCNT1X2eXcj5grULOEVYWJkD5kDXt6o9xpby0qDFVaoTozR+709trRaQMH2Vnkv/1HVgpzvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB3339

Hi Tejun, Breno,

The Drgn program wq_dump.py is used to inspect workqueue configurations,
affinity scopes, and pool associations. However, it currently focuses on
static topology and lacks visibility into live, in-flight work items and
transient pool states. Furthermore, recent refactoring broke compatibility
when running against older kernels.

This 2-part series addresses these limitations:

Patch 1 introduces a wq_attrs() helper to support both older and newer
kernel versions seamlessly.

Patch 2 provides live busy worker inspection (via option -b|--busy). It
iterates through each pool's busy_hash table to dump active worker PIDs,
command names, workqueues, callback function symbols, descriptions, and
elapsed durations.

Feedback and comments are welcome.

Aaron Tomlin (2):
  tools/workqueue/wq_dump.py: Support backward compatibility for
    wq->attrs rename
  tools/workqueue/wq_dump.py: Add busy worker inspection and BH pool
    states

 tools/workqueue/wq_dump.py | 60 ++++++++++++++++++++++++++++++++++----
 1 file changed, 55 insertions(+), 5 deletions(-)

-- 
2.55.0

