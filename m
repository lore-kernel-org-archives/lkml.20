Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021095.outbound.protection.outlook.com [52.101.95.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04573BB9FD
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131783; cv=fail; b=Hx/AsnRQ4snV76wMfgx5/QoTrPG+P2KRIpajRQNTcCTE1KdmnIMN9EnKUYPG27Tkp6FOhhaTkvoXU/1mvL5GLX6kyQFxxBVm84MmWsc4ruoNlil0qIEgPvtVxcjKAgLZNz9sd1YKQ6Ovahpn8fgVlAH35DLA1PfzM0CtE5k+cpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131783; c=relaxed/simple;
	bh=SX/MCy2l4GyqLldf1prpNKaXOYYDh4CWpNCMMtahxI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G1OUnr8c27+3vaXmvqAFVTq10YoypDOrmgsZc0b+VJ01YnW55v9b1OB4xj0ZRh9Stnd0+Oby+wcYmO8hUQpCLNjVs/yl3/bNXiC5QCDeQCUjg8aowVPRJePGqNSpZPLed6mjrpyx52s4cxLw05hXqW9EPJ/8JTZg+jtduqZFgXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.95.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cj2Ue9MDWVTU9ohmQ7A4erlVvNv1HQhAnL4zG98bZS+73aebYJVF3BSk7MeHqzkYBLCrr9QgYLtMwUzkwA8ywDdCXWITsr3ZGfcmfoyWNOwI/cl5l12K4fmOmL2sN9m1cdEqh4lxotPZrJm4dNY9liarm03Vi0gGL/EFWN+8zhva9HIAxgH8TZ1dwrYu6iq6waXFGm1vLA2/01wmdXjrKNxWtTO1Id9Fvt/ohUHnDBKlBRIZyPWBiSjrbb7jLlordqNasGTdbP7V6qq7a+Pfuu2Ig8xewHidVj07ixbzjGMrUAV8Tvup8ZHtX/1dmCqNX/6pGm/hl5U7shlsnqAXDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=GfSBTQCSgzbfO1r/2MTeiDdVPRgM6olqoa/lYkWHenY=;
 b=cMXwZMBbiwFy88hRYccw8tqjyb876R9Hh7vZSB3WFy6mfs9+G8UqvRcz2uhrBVn0cpm/NhwQXh/uPpX8VCkMKNlWQaQ0XUX4JtCUU25XIW28bSk0OaThItGb837BmX5wE61uQ6E766iSdvNIZYuM7wqr4ErmQy0EICiA9vl3RGfZSVcSnP0ss8HDVxPiOBoP4TTnl30IWqlRi9rVPY7aw/+CBlf3O8nJtrrSmup9TKhs2xmKwMaTTiXdRawtABPdpXMI0SgeNWm+sPLPW1YkGIxkJ3/uWR1S9lTVlPziS3zyxdP2FXcKVuCPSjFZUko7uKtI+xQ/vkvFlG57jWD29w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB6439.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 16:36:17 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 16:36:17 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: akpm@linux-foundation.org,
	lance.yang@linux.dev,
	mhiramat@kernel.org,
	pmladek@suse.com
Cc: linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	brads@mainlining.org,
	atomlin@atomlin.com,
	neelx@suse.com,
	sean@ashe.io,
	chjohnst@gmail.com,
	steve@abita.co,
	mproche@gmail.com,
	nick.lange@gmail.com
Subject: [PATCH v11 2/2] hung_task: Log summary line when warning budget is exhausted
Date: Sun,  4 Oct 2026 12:36:10 -0400
Message-ID: <20261004163610.413506-3-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261004163610.413506-1-atomlin@atomlin.com>
References: <20261004163610.413506-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIUP296CA0110.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:351::13) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO6P123MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: a6533188-a238-4263-bdd8-08df22359d13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|6133799003|18002099003|22082099003|10067099003|3023799007|56012099006|260925021311599003|260925022911599003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	rXgEX0AmGQwdTAl7GELgAfWp6dL3yNwqqGVDNhhQEyaR0d8O6WR5vsZkZhZcd3SRuFP3+K1jPRkq+txzrIeW7vpK7qFN+DMJM2YKPdWB9RtNRBL35uZYCh6UMddXtTBuc1ewOijh3NyVo4Og4Ympx0IdX2YL7dyQOMoIyH5VztWF5mbkwgA1GUYBNpv0FrIEOW9+FSYy3K2f+FYC/eK8I/g7EiIStUfe1DFh2g7ITjVOe2Ot0XtgVhTA8G061wtWMN+UromKLPpRRQGWqIVAzTXh3Qd43qzPvW24qrNwqwZFZVWOoEyEJi57N7wy8m3RA2n77XbmotY6+CqbQn/fivN/aRM9S4A6n2gGSNn7Z7PR+a9JcCn4AKaJHEP84YdY8MGrPQcrK6hMf08Sr/wtDmwCH/fPHYFJ8cwcieAt1PZmvocifEwDqYowiz1iw+8Ni2w5Ma1heklhs4hk2EA4HCaB4JA7Tdoe9MqIsj2Xw48/k6HxKjHW2tjDrnpLIYl4QMwRmnKugDg/UyPJdf/5CV/BeT9aYEjCSMVhVlwIbhD904F8TsTyDgOXKhCN3NuGKCEJR/9cW5SIVdpH7xhRA1e1nBd1Ox5x2AtGVBvsYrPt+EahM/7PK8O1HySGI3A0bSJdcoRXumx8wrEtJfkq8rGptcBTFJr/H2TQ6va12u8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(56012099006)(260925021311599003)(260925022911599003)(260925021911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3JJgk8qfiCZ6CjfwLfmt2GDK9pNv3Y4W6M4HjBtmQ1NXnapEplAchEi6MS2I?=
 =?us-ascii?Q?gbWOpggxy8SLMnZCuFYtgveDXXFvZ7vA6ATlGmqclALkUIHIXybWKxXikCWc?=
 =?us-ascii?Q?ALoffxUFGPnbKjJVNim0jYD40mZP1g2zHNKyHJIC1zYMwrCBTSLq3IRo7O8j?=
 =?us-ascii?Q?xFUEAtxqP2XgJ2CBmTPSrpvRSawm7PLz/zxg6TJHiWqkOZSIuXTR0UBiD0AS?=
 =?us-ascii?Q?U313C5QraHSmDDtXmGFQE/fe4ydfC5l5dwZy719XQMSGE6K/eRXV9T8nIoRg?=
 =?us-ascii?Q?m/UqclK80qV49y9zGyKnPaGqjwi1ngPBV2E3I23Mz+5RZLn1zzdU9xLw80VY?=
 =?us-ascii?Q?Z76BBGqY5do0MEAZCKRELUK2sju4nXD0R39K9oU/FO4fN0cwcPQbnFT/WV13?=
 =?us-ascii?Q?ReHA4YUAj3rOzmTePTom3BZxrOuF2uEzHTAiq1vGvxTeAO8tQaTCaRZTF6el?=
 =?us-ascii?Q?lChcN+/V+yD1h82V1c5wqEiC1lXM4HnXZ2aDGbQDW3doPl+Bk2hnA0nPQbWL?=
 =?us-ascii?Q?0ZsTR3t1nz0W1odyTbVMipvS+rt68Yq2HvdRNVeHBX1daaLXAfcwARKoWjb/?=
 =?us-ascii?Q?GvtSGsKR9FqnrFNfz446bUDvbWmNxZYU8/xQ0OT8+Am9xKFgmMrmWZQS4WFB?=
 =?us-ascii?Q?qXhjX/KTWABL0B+NvhAVlP0smYHfL4Gk49HC+n4XrQ8MITXB8bEjzrx5gDcn?=
 =?us-ascii?Q?Mb7ujk6Cju+xkU8mnT/K6b6TlkagFJ6aLOK+IAtRCXokGq2RUDcotznqvCTl?=
 =?us-ascii?Q?GXjOKl+cnE3anm4hxnNS8jG/d3XRPEjGID2sJl+knS7biukxCtVy3oqH8vY1?=
 =?us-ascii?Q?I8AwHP5FY+XCxfazMcO5b1UwHXrR53ZsNWBZ2Qe70zuyupsJiDP7aoYuYsrE?=
 =?us-ascii?Q?3j8xytshPVIglORNVrcYvSH1f5/EuqURmIAbvhuRlFMlaRMPOdHzIFtS3icj?=
 =?us-ascii?Q?utycBt+WFBTqZ9CyxI39BmiuS9pZOiTN+GhHHUS9/HvbVA5yD2gO1ubALOLL?=
 =?us-ascii?Q?gXP7YRBYPvC/furesJmhqHPB2nFdWvo1frXVKoPgZacPa/5plZRnkNxB7suA?=
 =?us-ascii?Q?82rOCe+9Mp9cAS3DsSsCD5f/GM12lQd3wI4RGDl1zZYXf3Sa1O34G6XObTSY?=
 =?us-ascii?Q?dbiUXMc9neddIN3IZljbBu1dDlvEjE9LNhQ+E9Le71iRwiAg5Se4s2/fIXTO?=
 =?us-ascii?Q?fxl2wSnDMOLKWQyo4Uf9oxv9yDJcz1pmU4BiICbYtgAUm3Q78DyQ9gZkAIsa?=
 =?us-ascii?Q?bzFv7bPrFrl3ddL1QAzJhNpBmVfV0PSFsIzdk5r6bZybNf43R+u2qz+V/2P7?=
 =?us-ascii?Q?EywmO8ZuSOGJDjjn6IIYuFvEsEoh7ehxI+bZOx2zOKpi/yGg4ZAvliXnf0tF?=
 =?us-ascii?Q?ob3+8MGyI4ox7GOjuN20j37AlHh5LSUCt+0jYTZBbXuOLV7qlvcuLFIRdXb5?=
 =?us-ascii?Q?n4LK2v2LmhzB7f8H0Blw5uouwxQXuzEyvMQbw1Gf981PZ/JFG698RoSRUSdE?=
 =?us-ascii?Q?+3kLyZa5RCXb4wM6WLvs6xKgO/LWOCJbwQyTeTItIVAYGQjPi7cjr8HziaiQ?=
 =?us-ascii?Q?Dy4vWOerwlqVGJKU7C6BtdBueMhOJ2DlqDFl6Msa2zPcXXHPUlQMFCdLvQnO?=
 =?us-ascii?Q?nmBk5i2Ns9ZNFI75o967TRUKKUJ9d8fL2IG+RBOenC+tSJpG23+KyIjPjO0a?=
 =?us-ascii?Q?rR71uE5rHmDGTOASG3am/gjLGAnvmOvFNgl1UBTMWV72tYG87pzjYzWle8gf?=
 =?us-ascii?Q?giYRTHvjlA=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6533188-a238-4263-bdd8-08df22359d13
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 16:36:17.4837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOu1hk0uPjz6v6SnTgir8QYGB/skAQCpwddf12mAUrwu7EQll7Kp+d6fDiSJmD1VYPSXmkkpwUqRWFbJOka20A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB6439

Once the warning budget is exhausted, hung_task_info() normally stops
printing per-task details. When panic is triggered, full details are
still printed so diagnostics remain available before panic.

To retain visibility without restoring per-task output after budget
exhaustion, emit a single aggregate summary line at the end of each
watchdog scan that detects hung tasks with an exhausted budget. This
keeps non-panic per-task reports budgeted during system-wide hangs.

Suggested-by: Petr Mladek <pmladek@suse.com>
Suggested-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/hung_task.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/hung_task.c b/kernel/hung_task.c
index a5043188456d..b8554aedc589 100644
--- a/kernel/hung_task.c
+++ b/kernel/hung_task.c
@@ -276,8 +276,8 @@ static void hung_task_info(struct task_struct *t, unsigned long timeout,
 		sched_show_task(t);
 		debug_show_blocker(t, timeout);
 
-		if (!hung_task_warnings_budget)
-			pr_info("Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings\n");
+		if (!hung_task_warnings_budget && !hung_task_call_panic)
+			pr_info("hung_task: further per-task details suppressed until warning budget is reset (see sysctl kernel.hung_task_warnings)\n");
 	}
 
 	touch_nmi_watchdog();
@@ -363,6 +363,10 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
 		return;
 	}
 
+	if (!hung_task_warnings_budget && !hung_task_call_panic)
+		pr_info("hung_task: %lu hung tasks detected, warning budget exhausted\n",
+			this_round_count);
+
 	if (need_warning || hung_task_call_panic) {
 		si_mask |= SYS_INFO_LOCKS;
 
-- 
2.55.0

