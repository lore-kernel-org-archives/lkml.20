Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771F8188CC9;
	Wed,  9 Sep 2026 08:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944132; cv=fail; b=fr9dNY26uXLXaucwH2NuwVbz291SZi0gtbkdk2asHuVGO+AO0Lm9/2kelKL5rbV7E10odBFQmAqzCImRfwl+NpXNbF5PQFohUI19CpCbUILgnqqpe6VNakk6hL2jsIXTbD0CScmKcqplrtNc7o++oTDJVdjESBVXIJ5ycN8oxtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944132; c=relaxed/simple;
	bh=7Sitc86L4alTS5ejMlXAQgVWDlVhWTeT4XALevgJh3M=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lDtcWXZfHZw5iaJ3WiejzhAZ28TWctqAFYyZoVZ5PpeGcPdwUmPeXmz9GyjAdLmxU2Y1YLuSS7F+EVMB7HvX1lyZEtChjK5sw7ljDC+Bf06utg9y/5zBsagO5UxptecYckVWz5qdHc5yjZiPDxGdwfWizB6YzQMvZx919OSzwSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wam/A9VC; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wam/A9VC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjhOo8uEnadH+kytIovaBd/StllVvc7J1urQ7O8qFEejIV/G5VYvfKcJWaCFAOkqBi6E5Pxa2UjzxqvhIsSkzO3XEKHX94m5aufzzj4fA7gAMoal5i5itdvq/E8A9RBl44nxzQj7k5LqRzHu8G6jNBSq8am+U7FJgF3cdA5HLtPNBMXWfbFVtM+O8dhVL7ONW2gWHGtyTpJwhCyo8PKJb/5px9pj2Gx5jqhEOS5lU2jlpCThg3kyFT3aoTFwKlrVcjl2up5hvck7GpE+yx9MynCjU49wFHnBNaFG5YCVIBWsU+SRL46CTk4aoKv9gvThbw4CYCK0x2hDwdy/FzimtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwRFc31OOtZLBqgB6Ygjncv5E0bZ3fFKwCitCwdCB3E=;
 b=XAxCWP7VVz2gt+E5qZxuIWGJMTSbQWnQQrQm0CClP4/iIM/TyDSrn94hsB/sDPHTNl4cJqyoIFvLj0SkE4FovSPUKzxar9VfzqTo+SCP93ZBs/54x0DMCv9OPXPU7nSRGViYZ+Bnrr/XskOxLpAw0trpPL5ywG8HIjbsYf1AkuYsZtdRldC0ZgDJ3S/8qHlabpFAH1txIY88kW5nc4+QPePASoQRqoMZHVFy7lnoiLVBrIoswbmMD2dO2xyWs1iEAAoqT1e5IZsVCc9AfhNMDINQupBots/fmiwbpptauSKeIbxvlgZsdNow2PZbAcoN80OyVyDTymTKvFTR7mI8Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwRFc31OOtZLBqgB6Ygjncv5E0bZ3fFKwCitCwdCB3E=;
 b=wam/A9VC99f+DgxmUNXCNqjTGircfWA5U3O3whhc5vutOjy3ebxLIyzan8JJNMM7nTyfnWfdq1a/X/zF4737/T3uMYc+Rcik+NFlpXGrK2O34fwQkgxRLfzgYJQ5e4Q1BGuecCFwC4iibDy041d+TSFuOZGCcT9+csOjFcegb2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OSCPR01MB14425.jpnprd01.prod.outlook.com (2603:1096:604:39e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 08:55:28 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 08:55:27 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Add USB2.0 support for RZ/G3E
Date: Wed,  9 Sep 2026 10:54:57 +0200
Message-ID: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::9) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OSCPR01MB14425:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a019d1b-ee16-4c04-ccee-08df0e501822
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|10067099003|18002099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	fZt8mHLiJqswU08FN+uzfafVLLEH2PaeZiggS3hDvPgOQkf9jbMjTwKonn4mMUAeiNknGPIqDVQmc4kz/FD6Xef8/rPIXXPx4Q+vXYxwCwl/hxiVCwE4VdxuFIG3HiOTRdHTCc4K3MQDIt6WP4Kt/WznNqyF1h4Opfql38TDyDZkIHUJwq7oUE274aKMre7sQP68szTQRNsmTJ2E/0gYtAaRoBTpDrOFTqDkjklQY6e2w8NASpQO8zF54Wr0PGUhWrc/6NlMPixLeR6zeNM/PNS4ziZ//YnfRglBRFrRcM1UWxMbfkzKY7IYZGXLXc8CeD3Jk1lIZyZmefvGElqCoisER0rz+DnsGz6/w9TVz4fmczGgTysHieD617rlnkblaJct4Eglnzyynmbh+/Kj7Pny7aLbIKqioOMAFIYIRY4vo+zh9zcS56HE09EafvQDA/lRmNVS1XdDCDMnfYarrvymQMUK4XwhiusvgRZc1bCFLNnjwSmx94CFLYHHfzAN//rB/9Dc5oSlzRHZiALk2SRco6mPVnxOTnfriibxKO3j9Fd7h7XVZEmzR2wiekHPee9b0v26Kj4aeJmpZUlfNtApJQ0Q7rEoPJjUJzQVF/jpi4tRbaBxNbA6d7dai+v4J8rKCuoEHKoPsu9hMj7myOz+HUUV7JD6ID6u/YF48eXnrbHJGbPk7hQVswN1GwTpmbdvD74w7rnJRldbvrY8yAVADYhJ92Nn8x0bkhsB3kc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(10067099003)(18002099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HxzNNl3no86WSjpbdGZcMPASk4oEF2prGAbKUcZYFun+JPKvQb7zx6Pdhbtg?=
 =?us-ascii?Q?HCvMJegGdh8udZdsMyf3cuYFYfz8xPGUvBw4H1damhQ0nPOKNarhiRlGmD8h?=
 =?us-ascii?Q?dOiYdBoynwpU3QYLHug1tsVhCSXXxfdXjQmVf0U5aRddWjGklKHZfKlZf3My?=
 =?us-ascii?Q?DrMRo3+2OfNn5Giudi6lndCu03xAcyrds+kQKuiLUmrj16OvaXE82KNfQxnj?=
 =?us-ascii?Q?IZBQlvIj0o32cI9YJafle6buJvV7vpsbQeCFsiR9yM/G2l6zTzBVRmQ2maH+?=
 =?us-ascii?Q?gtOTSsXi8z3Gceg+DXpFfruJrCkXoYCPrflm2jyQszZyWipsdY9XEIcW0GLE?=
 =?us-ascii?Q?xoV0emx2yITVG4vyPf1bS0zHpYGGY0nXNSr5SW3FsrrbK7a7dwpEs47tl3pQ?=
 =?us-ascii?Q?dc0VrA068G6KkO28cu1/e5wWzYz0Z2ec9kdJKn7CVB3t04XvFcaRF2rVqrPN?=
 =?us-ascii?Q?pLbXMDoimYSOeTeHigtqfRN0jCZ8rnC0jouwWOnfvUcks45u6g9IjV+AJzcU?=
 =?us-ascii?Q?biPmXZBNiLOsobjosvUStJZtvvbNS3jRWkPuGTlOq8VU8gnJaYkBsqc1alyq?=
 =?us-ascii?Q?axxVtQBcJ/iBRuer1z1XcqHw+ucHEM+sOj4a4a0axDpVXH8639VaKpgkNpa4?=
 =?us-ascii?Q?z2LocGUDOUIU/J8aAPJmCwKf8Jv9FWiT+w2WBe5WNz3IJpKvfx2jxkROvYpx?=
 =?us-ascii?Q?X4xfhS6je+xf1YKE+F/OX0r1Grzxg54Ycf5np3YQLc8bkSxbsefCnooy+Ytu?=
 =?us-ascii?Q?0ujIf6zofH57tpB7lS+mo+pb8hmq26yXF4DQQPud2bH09aJ25X7W8EwNB/82?=
 =?us-ascii?Q?LDlEN8+IwbdrtVFo0URrKaW1WHwEW67/M7zwgQyvc35pNda8AfnqFxCv3K8R?=
 =?us-ascii?Q?1pjnxPlAb/XppbBFziZDw6VfOYTHfPNtJGrTBJg0yG8QT/LYJkIZwWSsyg5w?=
 =?us-ascii?Q?8UHyT0Xy+DLTnTC9Q1Cw7p/mPwukxA9qL5PNCSRwgde3MThh+rqX2LYwhCGY?=
 =?us-ascii?Q?rrzyAMqysEgLXSFA9LHROEaWsMV+N4N/lbH+gr3X5iInEq4Wd0Vbidq1anby?=
 =?us-ascii?Q?z9No6WKcnWmDRhGfnwaBpXw01J3iSKLJ7gzSpH1KhSQqMqry/LaneL0dB1Ao?=
 =?us-ascii?Q?Xbsboy6NQafHoMmDhAs5ssTvwxbgIjC/3luYtdZNUK5pWScqf8mvwhf2E7qK?=
 =?us-ascii?Q?WzuWKR7Zm51fzl8SmtQXc+VUAZX3P3mBVDs3p5qrcblL2tV0PJwgeSji1y1q?=
 =?us-ascii?Q?Z6gf5Q+JwSsNI1a57arvr/jh1h5NVrwH7Fm4uru3ijqnR9dKhyPjEzO1lIzg?=
 =?us-ascii?Q?lhRYWJUdDrfpHHDf0PV9kQOWWS4B9W6b6ratZCPIfvFa6QM0AHcVpfUEH+vm?=
 =?us-ascii?Q?OOkEmf31gdLK1MeSslZqr8Lt+XZTvi7pDIarfXEJTPguXW24x73q4THYL3BU?=
 =?us-ascii?Q?K3XsIVXCzlVTNmS90mEM8WWHdOhcVUGWXLxHlBdORfoEgR3utRk1b7T34pf3?=
 =?us-ascii?Q?fjt2R5q5f7eFW++QD34mCJOu3ymUSWcJmbSWBhoFJabcy6CvFfSxLJvQ6HtL?=
 =?us-ascii?Q?X3IcJRsgSmjuP/B+f+357n4+fPRgc0SvNVLoA/1Wbp41HO+CeSBHdMs9VQ4A?=
 =?us-ascii?Q?yXcpgsamdE4zjyIYHXAHuLfuW7AD3t9H+9fxLtZMOz0Moji7mYn4bk7jUJ4n?=
 =?us-ascii?Q?MJg+ODr4a9TVrSsP8IU5qv8cY3OtwRe3/v6QU4ZhkjN6qkhaxlNqQeiym6Ui?=
 =?us-ascii?Q?Vqf4LLdXk/zyVR8fVNL9l0OtHccEQUqqFxnUYO53aH9NoNNyRKXp?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a019d1b-ee16-4c04-ccee-08df0e501822
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 08:55:27.9242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzknDEJ7le9jdL2gp38j0GMB/nMaH4TmwtZH7n4A74PH39xLRQYVPoxZaZpQwnhF3RcJQC7V2Mvf5I1m0BrN9Os2wduMOANVN65g93KhjcICZNCLNyGBjm9+u6ScVOwZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14425

Dear All,

This patch series adds USB2.0 support for the Renesas R9A09G047 SoC and
enables it on the RZ/G3E SMARK II board.

Kind regards,
Tommaso

v2->v3:
 - No changes just rebased on top of next-20260908.

v1->v2:
 - Included PATCH v7 7/9 and PATCH v7 6/9 from
   v7: https://lore.kernel.org/all/20260812141940.246223-1-biju.das.jz@bp.renesas.com/
 - Drop placeholder patch
 - PATCH 4/4: Disabled RZ/G3L common nodes from r9a08g046l48-smarc.dts.
   Update commit body, and improved usb20_pins, usb21_pins comments.

Biju Das (2):
  arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
  arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes

Tommaso Merciai (2):
  arm64: dts: renesas: r9a09g047: Add USB2.0 support
  arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 142 ++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  20 +++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 124 +++++++++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  45 ++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  25 +++
 5 files changed, 356 insertions(+)

-- 
2.54.0

