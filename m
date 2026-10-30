Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.91
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793324318;
	b=AyQbU2JlPLiFx0aLfCmI50B8DkYwWKv2EAODwQtAMv87W6a5LaFGVFwpIlbbbt0ic72L
	 c7yU3d84KqKb1ofqBZsFmnoisp1XTqsKi7t/zPpL0sqCUB84CkH7ztZjRN2ZW0UJa5U/N
	 bPaLs6dDOBZ5fP0rvk+bjqDCgLmO8VLkv3TNLHSDB0T1lVT6Wv2UuXgrCoHGf+RZHzStf
	 bi5WcAEDVMm9TXIqxRJs8uQtOCQHGeHdGiRoEyzk3DTXsKDk9yq8bm9n0jgUvEU8FwGX4
	 Hx2ym1FGtuku3Kvz9r0JY82kQurF4gmYbjTX8gUKnE0X6U0OJkRIOqasRQk8WRFcNNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324318;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=dcfWpdfxnrQbAh7YNamsBvyWAa5kLyrF5h9q4pn7x48=;
	b=JxTxEfTeECd3lySP/AiZ9RsBB2sYp1PtmjDnRIC5lTRMW/9On1IP68xg2Xyp48Y8Imm7
	 L+7gckJLQYJ8CC6pQiY33nBCnWafbcF2a9TgaiCQZ+MB9QTf+vGzvlAex/P8touva3To+
	 WL6e2ek0/Oj8g0d9UZD90BSEGgp8mbYNSvy639wCeAkbL8oVIxf3jHyyQ6OHj8dDMZW3Q
	 CRkFiB3G3hH6iCRzSrGHWdvrVdT7ZVn6R/bewiVY7j8q5eqEevA92ALWV5IUg8Qxz1kkc
	 +SEPQYEbzmwPrDSM2b3qPeJP4f1NEWNUTI9IQ4qTPMIOMmRpCxhDVfFjobNjARWifIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.91
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021091.outbound.protection.outlook.com [52.101.95.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B08E606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B08E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUxxXRiDBMnyRX0zFW5aFZtrsjx2SSjahxXLK2QuVfs/TYVaWPDMBTBApB4uJMbjwFcBs0mpEjrvniBapyNoVuH4+ZSIRMkwljFg4/DNEtr083JhhIA0zDD3vTvd4N0f1EQj9Ed5e4/edyr6Ot6q3EcLDJIln61HRR1vD3VX/hgIOkGTQhkhjxttMH+nVE2W8hwZ/1NjrAqHS74OGF4D2A4NMxWUTI6W6TFESo8LCR9u02BMcMX406m60ISjOz+4bOMVYv+84uURmqyeOL/dD/npfAH8gO+1Bumo0A+A5MQGBwv3Is0gwDRl3Ghm9W3CA9OL7ZwKTRURpKZPLT19YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=dcfWpdfxnrQbAh7YNamsBvyWAa5kLyrF5h9q4pn7x48=;
 b=r1ak+HVrmMyg3Eo8qgRUtPrIqxLKIOTOmSOkB7XdUKvrW7stmxiksH6HDBm1ZjYc5wBQ2hK7MSMClHhKpuq4s9KvliP5U98UugfHCu+GT+io0Vo1egg1g+ZF+ewoS1/ASiVFII1hvX4MhIUdtRgMf1pKbndNC2dwk46ryxwj1DMzsBXNZjukAUbAyf+h19M8xXUtuOMzBCcPV6ZwMUXYlY8VPObhm4u6UxA8sqxkKrQH4bklwDdNZ8uR04G0p4/nrJV//qkdFqel7G+RcSUk9+cbdgZb8WI7PphiR96FK59hh2C4IN8rUPwvbElMHqy5/RJZ0XC09UlxkoeRnpIoig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO4P123MB6323.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 01:38:35 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 01:38:35 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: paulmck@kernel.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	zhanxusheng1024@gmail.com,
	neelx@suse.com,
	atomlin@atomlin.com,
	chjohnst@mail.com,
	mproche@mail.com,
	sean@ashe.io,
	steve@abita.co,
	rishil1999@outlook.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 tip/sched/core 4/6] sched/debug: Protect p->mm access in sched_show_numa()
Date: Thu, 29 Oct 2026 21:38:15 -0400
Message-ID: <20261030013817.753804-5-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030013817.753804-1-atomlin@atomlin.com>
References: <20261030013817.753804-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0101.namprd04.prod.outlook.com
 (2603:10b6:408:ec::16) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO4P123MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 2575a7db-4ff9-4123-6204-08df362683cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|56012099006|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PMCcO8J3htGewEr0Ujuvrsv9SHo4/8XQKzuVzZPtzlGwOdJ8ktQRNcWWRSXOlzEqvWL2PB6J4hLuf4aTYpdUIkycdpaZSWUeDoUh/iV5gYbx3Kp5QMJuiTfJir4wVxLkkZuqjqC/vGwxQ0vwVIbyY1NjL9BoYaaSEe8aCcWYwuhM6nse8/VBiOHNNOI/Zm93he+4h8WVPTv/8FKHX8ojT5oj0JCzJ4Jmrb7SQr+z2PqwgZO5EsdOrdf5dUC65cuVvfHBe8zcpeV3MqNlTFHKdE4JHzy+cu3K87jUC8sin4TspXLVcM2aSE/d3FT+9AXLP3evUjwHVetzi09X1p3+YBaYPciCmjHoDJQoVxoF0nN/ynm4gTjeHrsoj5JGNxuAdvyTA1/3t/3XFdqG4EbIKPFpTylUEL5QLA+gWKAvaUajg6QgdkcPS7qCjgJ2kf9fUJLb0zXM98pkD7mfgIFmRQ6ACBD3p1tN+OCMUPWHAeoF4hMDzpypXXgyMMZ+2aXv0REW6VqWABdvPyA1/VUM4o5t9Q4RuglYwTRR5mrpdandBR00xTu5m1eoCue9xt3gMVRp39Rto7mmHEhIqN8LWKj1jEOvYwANvNPcCI2zrbHxxlPijREXeMI24qALGR/hoti7qKdpJo2BtfM53/bbTvnp9sZHtjiaCNSgmN9enew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(56012099006)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6hDVISFSAD02tXitxmwDlIolo4dGpEDpUD0pDBixPe6YLsNdCbVL5mDI9/xO?=
 =?us-ascii?Q?LvnFvO8JWt07hdXBU6IXL197hFM/P5m2o0NLtiHJSzXsj4uDKXLbLfWZdgFn?=
 =?us-ascii?Q?3SiH55tClrDYbP7wsZTTt7TOKDvS4hDe5baGqq+60hWVfUVypCnjQ0+OiBvT?=
 =?us-ascii?Q?gX7o0jzbkDJfjhaOUwgqMBxCGFelFAgfUWvTRpeuaI+9mAraSC4mxHc3fvuU?=
 =?us-ascii?Q?D8rjx01SlcMpuGo//XnMscuM0D5AKpkO9GmYVsven3H5PdVMFSypT8szM2o5?=
 =?us-ascii?Q?MDK+76eY/qBiFj3EXM3Vq1gF9jBnI50cBTyG9tBSYZSoZJ8VbGwEbhkcAiWM?=
 =?us-ascii?Q?zGcELREysKlTzuOu8uSL6eOq+d6mKdFUFZQBf7YFKPCXzM9Uj8B/qT/X/6tP?=
 =?us-ascii?Q?UXvzr8gCQX2JRjnW/nMT9gBLHK1pFYIgDm3+Sf/V0iCe7d4F402zUiG4ucIE?=
 =?us-ascii?Q?9A22kKPYpY/471fiDLhbeSuuddVrRhK+8Ko3Mv0+To9AICYisbkDdiGmEa5V?=
 =?us-ascii?Q?R/DQVRJfrC2Lj1A7N1L2YR/9usN1NoZ8GcMGkMMOClIwJWYtLwz8cNe3hcEk?=
 =?us-ascii?Q?6unx65OKKHYjvvWjb4KexAaNoJcWyRkm3HYaUmpeW3RN1oQh8/elpJu3/sAz?=
 =?us-ascii?Q?7lJCe5/KKSdbQWzJx6ht19uDFdHvxEPzFSXGasZGe8rSoTH9FxH2l5x5+/VX?=
 =?us-ascii?Q?OIBIyvU60G5qOM2xvrjxqwx+B2u7jUPB9t4JxtkcNiT4IvPKpjYZGPXULYvq?=
 =?us-ascii?Q?orF863ZDUXv5S+MGdUos0yPXPYtIjgu+wQo5kzjRv7YptZfBXKY0iy5ghrCQ?=
 =?us-ascii?Q?rSsplbIxSZBUV3iBYeqlp3XDqjUJMmBacyGzsbsFVOx2ef4orXalLeFq4k9P?=
 =?us-ascii?Q?9HRoWlmrrt2hSVPSFQI5O0wrsCczXnshfVwOCPqYC9CdNBbBbczjcJppS1g8?=
 =?us-ascii?Q?5XSmixgC88fAJwU9Apl1jhEcFjgEJMyA4ydvIAjycaVC0sQgB1YbnTsM/GIG?=
 =?us-ascii?Q?vtWb+64rSXyfzrrEAxLDVGOaDvg7eSVmUh0AuobJy4FGJjnR7nKuSEysIyYe?=
 =?us-ascii?Q?S7i+VmhaxsyU65ijK+CLwqNFa0KznJyTblrQjk8cGsQEt6+TUfh3GHGjmA8G?=
 =?us-ascii?Q?XGxMOEuDh5u6ZpyzMBCPzyDojLr/OVOz6wguKC+TQChMkqouXWqj7u7vmx9j?=
 =?us-ascii?Q?G30Al3mZ8mUT3VS/uPs4wFUD+oI63Yvfb4yrZha9xy5xbeqs2vAqDjP1XnLN?=
 =?us-ascii?Q?80Shc+gBX/7IPyhVy8dJ6lYwc1MiuSNa64HKsUT6bRR/nIEHAYsCXponH9FF?=
 =?us-ascii?Q?/ZWJAkMgdo8esrTSEYQfMR2M1Jz/qvA7RJD0EpCQ0n1XrN/0qhRcLFrmFxCG?=
 =?us-ascii?Q?Gig4+UhNpfmrVIo0V76TuNbA88Mcts+MWMZnmikANsnf4CWPcQ4ssXnQAWNC?=
 =?us-ascii?Q?AXLw0IxCQmNFKrPp0upDbKuXDJM91hYl68xtY8o5vCBMAwNXltT47RvNBAoS?=
 =?us-ascii?Q?0sjXGgAKReZyqOuGSCF5HWHMw0YWT2wCUZHp70L9xeNToYLlFOVanLtN2GFa?=
 =?us-ascii?Q?v2AeGHAeDTsTabGNuE937zj3yH19dZH+eKMvm5DibM0dcjk2oP0jQbxbTXjA?=
 =?us-ascii?Q?DjBjMklTJMioCXPkxrAS6XP8h7L33zmP/IrVoJPN2v3NRp9TdkHESosPyH39?=
 =?us-ascii?Q?Mco1vM/1ueP+G/L3S309OONYSsfUNuw2mTnlqdmuBbolkIcJ2FCahb1D5D6o?=
 =?us-ascii?Q?BHYleUY1cQ=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2575a7db-4ff9-4123-6204-08df362683cb
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 01:38:35.8478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7mdTYwqWUgqzkgluX21JTiMIZl/r2ICZmgig8OMbCNP04oNKyWXQIkwnQP6Eku/T/iV+YZthCiZa2NojYyRxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6323

In sched_show_numa(), p->mm is checked locklessly and then passed to the
P(mm->numa_scan_seq) macro. This presents both a time-of-change to
time-of-use race and a potential use-after-free vulnerability.

If a task exits concurrently via exit_mm(p), another CPU can set p->mm
to NULL and call mmput(mm) to free the struct mm_struct. Dereferencing
mm->numa_scan_seq without holding task_lock(p) can access freed memory if
mmput() runs immediately after the check.

Fix this by wrapping the p->mm check and macro dereference in
task_lock(p) and task_unlock(p). In exit_mm(), current->mm is set to
NULL under task_lock(p) before mmput() is called, guaranteeing that
p->mm cannot be set to NULL or freed while task_lock(p) is held.

Fixes: b32e86b4301e ("sched/numa: Add debugging")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/sched/debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index be886ede0a1d..a22d64647bbf 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1389,8 +1389,10 @@ void print_numa_stats(struct seq_file *m, int node, unsigned long tsf,
 static void sched_show_numa(struct task_struct *p, struct seq_file *m)
 {
 #ifdef CONFIG_NUMA_BALANCING
+	task_lock(p);
 	if (p->mm)
 		P(mm->numa_scan_seq);
+	task_unlock(p);
 
 	P(numa_pages_migrated);
 	P(numa_preferred_nid);
-- 
2.55.0

