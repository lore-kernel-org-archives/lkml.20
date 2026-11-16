Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.192.105
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794839877;
	b=eirNRPjaM6Ra1B0KB/X5tzQaCR9jfyRxtla+MU8y2eBedqArq8+AIISU3ip69mNcsL4+
	 /j1L8EO63Dan/OismrpM62lREchQoo/etecwLNrpAZOSRFq9dMFvs6+/srvzWHFiCAkI1
	 3Eave68M6C7iX1CcWfSXRaS+Pg1wlfzqgzPeeRgkyRM3MGtAkXs2G6dC6yQhIxgaeiXjw
	 blAaamGviUy29H7HOLJ0xZBP8/TMU0b928LNm7FwKobiI5xPOwtldziOWmhlfzP7dRGRs
	 ifvjTglukt/BwUagUM0Ii5FSNabsQHesHnSBszVQtuw/P4hxxsTXUKcmJhKVFmGM/cA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839877;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=Gkvrff6Y0rlDZ9hQxxXquqCprn3loDa2Vjc3yW/bqCA=;
	b=uV/wCO+DSjXMsxtwPXb9a1urwJrsZ8g85S8JN/XOKCnGewODGMcacmTfPZDIcH50ZrJ3
	 7SbMBKozQfWYkVycC6L2qsHc5zxrpOt1O9HFNktmVscjr5Uih/SHM6SqF0O/QQud25xPv
	 W3Hr3xcZux7eTmoYxYlf6xrJSGsZiTlnEYO/5Oc21BLaRb8O2ylgynJ4AMYCt20S1oEtW
	 UZQiiIx39/jqEyG6SxNoGTI8o++xd85a7619wlSj8qZjA1N6/feY42W6ILEWgaocqC8G1
	 8dSEQ+XMzQWTtt39pE9fGgIngQQJaqJi9pJBs4Jt6FxNh4ECcoF1i2L0xihfYGIBYZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=telcobridges.com;
	spf=pass smtp.mailfrom=telcobridges.com;
	dkim=pass header.d=telcobridges.com header.i=@telcobridges.com header.a=rsa-sha256 header.s=selector2 header.b=puU2CrV2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.192.105
Received: from YT5PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11021105.outbound.protection.outlook.com [40.107.192.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E414606A323;
	Mon, 16 Nov 2026 14:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E414606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=telcobridges.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telcobridges.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=telcobridges.com header.i=@telcobridges.com header.a=rsa-sha256 header.s=selector2 header.b=puU2CrV2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyDuwlCcCukC7S+ZqlqlF1x7oxfJ5EdTCDqqBMeYAY2AfAd3noKIemAC/W2Rr1pdRbjZezv2rghnGUHVcwMXaWyvp5ihpbJwOhcz6i7gSqwJsJS8gB9TF3aazJZuxyzcdcNjGEm6OUtNINUgt9yAtb0gsYlt4/HwmRrBFfmbdJT/6iYZkpJoU0JUASUyhd/XuIvdDLJ1wPlslYk8IMg1NpeM2CzTR65s3nu0CpCgvJfzKEqT/hV0S5aOyvZE85t2TmzUp/qFtSPtkIkn289IInCEH7eafN7cGk2XmM212Ez7hSqCwW4jT8MoCpO3uvRq7QNUvWnzDfZxknoDZefQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gkvrff6Y0rlDZ9hQxxXquqCprn3loDa2Vjc3yW/bqCA=;
 b=FA785FlAVWi4JAhGqr1/8KJOKonXcF4BTrfm8S9xt6Jo2leRGYoPmLR/QJZH+h+LYiPEkibyaYjVcMioVaYzm3dUMEPU8IGSytR0nvJyQfjGXnAElNrQfCn5vl7YWkx8T2HgLTwcAjovGlqM7YIRrEFpbc6/XuaR02AKbhl/y3EleAPmGUShdYBXU0HDXixQwXDRJhR6QH4mIRaVWeorm57zKbrbROyZ+mE/MkdeDMJP/52sCe4rsaab03SrRm+fwPVNpnPNdws46AriO9eh0wSD+kXsT0ws+XZf2/KZ7UJbh+BGwpoWMpsFVvZE7kwdccSgjH28LVgquehMkg1qUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 142.180.224.216) smtp.rcpttodomain=davemloft.net
 smtp.mailfrom=telcobridges.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=telcobridges.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telcobridges.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gkvrff6Y0rlDZ9hQxxXquqCprn3loDa2Vjc3yW/bqCA=;
 b=puU2CrV2KitlYfs8jr6YDPwPj9gtkIxlLP+mf5YXJs5W7FfR+WDZ6ShmBG8SjKAKCOQrdl5yr1lDMvziY1OyhNpRnAdEnj7LCNBxZIxoK56BTlOql9I/w6a74BHWNq3TxBtKvNAPAfRj0t70YZlOQmrzXG1KRlygH+jMB5GUFJw=
Received: from YT4PR01CA0373.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:fd::15)
 by YQBPR0101MB5927.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:36::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:37:52 +0000
Received: from TO1PEPF00005345.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd:cafe::84) by YT4PR01CA0373.outlook.office365.com
 (2603:10b6:b01:fd::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Mon,
 16 Nov 2026 14:37:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 142.180.224.216)
 smtp.mailfrom=telcobridges.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=telcobridges.com;
Received-SPF: Pass (protection.outlook.com: domain of telcobridges.com
 designates 142.180.224.216 as permitted sender)
 receiver=protection.outlook.com; client-ip=142.180.224.216;
 helo=srv-code1.telcobridges.lan; pr=C
Received: from srv-code1.telcobridges.lan (142.180.224.216) by
 TO1PEPF00005345.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server id 15.21.639.5 via Frontend Transport; Mon, 16 Nov 2026 14:37:51
 +0000
Received: from srv-vmware-cmcburney-tbos10.telcobridges.lan (unknown [10.0.0.68])
	by srv-code1.telcobridges.lan (Postfix) with ESMTP id 6ED1D9628;
	Mon, 16 Nov 2026 09:37:51 -0500 (EST)
From: Curtis McBurney <cmcburney@telcobridges.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	willemb@google.com,
	toke@redhat.com,
	linux-kernel@vger.kernel.org,
	Curtis McBurney <cmcburney@telcobridges.com>
Subject: [PATCH net 0/2] net: keep txq->trans_start on repeated netif_tx_stop_queue()
Date: Mon, 16 Nov 2026 09:37:14 -0500
Message-ID: <20261116143716.367451-1-cmcburney@telcobridges.com>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TO1PEPF00005345:EE_|YQBPR0101MB5927:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 42458f28-93b0-4233-14b9-08df43ef3196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|82310400026|36860700016|10067099003|56012099006|261026140227099003|261026121527099003|261028144727099003|261022075727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	d0Rku7BTjFFjkNY2qCe4kvX5Yc5l9BHW0ZDwRSJTp6qdcr8T5+KeVONyOGdc1ypWItrCVJDrjkzRAkqjp6KqzHgUt6434wBEnS0clDXn6gAt/zXDulDHPU+CzRKJ68b2xxsM5DxWzy0Gb8FisOS0m8jKUa92swPTlVUfIsKeAZXfZzoLEyOZwrHs4TLWZkl+OviM9sB/hdr1AcXgJxycoI8Igkto+gWm1sDiKdGBkoRum1xvuG3lkDv/d9tahvJIx2O2n0hoMsg7rujYMFHJ6RjMW/zXaQ6an42qSes4kp7BMYAitb5Kz5IHISLoPRkdgvxObYQuGniTjDEz/+iF2lj2KRQAPAlIYJMDCOFThdDx71Ilab95I6k/2BAqRJJUfKhsmNMNGwQSS29weu8pDFQGVarQMw2LmhkY2G6T9FohiX0z6mitkAsORxBGPDiG97Fd7/9bXZ1q6ZGRSwsBo06igOFdrWeobNEBvjUu3WqSFweiAFiW/iPEwRvPWJY6oEsvKYz9H01TN6kCqwVrPI2wa0duHHrkaBKxCJjJXPg6/PgsGm+SHjomjWRs90JHCDZDy7F0SnUqI7kTeWmJALY3hbowus11K2OHDDu8S99bPIFLYhOUbq8ETzgCiFVJNtPblfBWGUQH+MFUwkyy6q/N/LHI7+vbHCn5cEJSBNSojMqLMnz8RdmmhC/xRFDQ6Jtcoaliy3ICPsAmi60dnQ==
X-Forefront-Antispam-Report:
	CIP:142.180.224.216;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:srv-code1.telcobridges.lan;PTR:ipagstaticip-a30715f8-af06-ab92-2e59-6516aeac2c90.sdsl.bell.ca;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(82310400026)(36860700016)(10067099003)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FMSPvjhQ8LKV4XGzaPL2lVuft7QkM2xKuuRZUgB6IcU8Jxb1UuV38nVq+BicJVYJMv++OKx4xC3AHnJYE9SPS5DjR8zCrHNolJLXN8KBcB6aL64a8bK7dsg2z3bfoEEa4/zaKkwbjZaQ4g2a/KekO4G1uvfTcKE2QhnezCAVw7TFfKF+/ebScTwdSHRMtcvi+QtCtvrbUF9Wsmxgg1nLx65NURH2yG0dfY6OpCTBCiIV4Bdiuy08YcYSyeU4sMCu+Kd7W1+4qsSBKO2xdzJFXzQenfggYeqL/CKkecO5LVr9ASvFCtiQWkBqIx1CILJKbGa50yjtFgHlUaXEz6PekiUjE7sgP11WNHT9pVT4VrFqw8P5Shos/+rSWDui3pXOkUAdUu44pnVfYIdG5hNO6N98QDk4wqnc30spdR2ro7EZXjEHrbCst/HPEwS2AMhg
X-OriginatorOrg: telcobridges.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 14:37:51.7053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42458f28-93b0-4233-14b9-08df43ef3196
X-MS-Exchange-CrossTenant-Id: 5dc833ed-bd96-4d5b-aaa0-0d8be83ae4e5
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5dc833ed-bd96-4d5b-aaa0-0d8be83ae4e5;Ip=[142.180.224.216];Helo=[srv-code1.telcobridges.lan]
X-MS-Exchange-CrossTenant-AuthSource:
	TO1PEPF00005345.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB5927

Since commit 95ecba62e2fd ("net: fix races in
netdev_tx_sent_queue()/dev_watchdog()"), every netif_tx_stop_queue()
call writes txq->trans_start, also on a queue that is already stopped.
Drivers whose Tx hang check stops the queue again on each run (e1000,
e1000e, igb, igc) keep moving trans_start forward, dev_watchdog() never
times out, and the hung adapter is never reset.

Patch 1 writes trans_start only when the driver stops a running queue,
before set_bit() as in 95ecba62e2fd. Patch 2 adds KUnit tests for the
four cases; one of them fails without patch 1.

The issue was observed on a system in real use. I reproduced it and
tested the fix on an AlmaLinux 10 kernel (6.12.0-211.68.1.el10_2) with
e1000 on a VMware-emulated 82545EM, using a test-only module parameter
that forces the e1000 hang check to fire. Patch 1 has the details. The
KUnit tests ran on UML on the net tree.

I wrote the fix. Claude Code (Anthropic) reviewed it, wrote the KUnit
tests, the e1000 reproducer and the changelogs.

Curtis McBurney (2):
  net: keep txq->trans_start on repeated netif_tx_stop_queue()
  net: net_test: add tests for netif_tx_stop_queue() trans_start

 include/linux/netdevice.h |  11 +++-
 net/core/net_test.c       | 112 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+), 2 deletions(-)


base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
-- 
2.52.0

