Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C758733B97D;
	Thu, 10 Sep 2026 01:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002456; cv=fail; b=jgMNNNEwDRy6AapscvOg6Gsnw0iekNBqDuBqml/ZbKfEqwytVCF3e9ibD7ImJWOmh4YzdQUMknjdq1192JJz1hO+j6CR81I5Efz+5jvaumxpqWztXSmDy9YOiRa3yNkusn5X8NqIGB35oDECRonHPrbK9ikqAabzZWVv0MXb1OI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002456; c=relaxed/simple;
	bh=cFN+L2SSs5YEL4kfbdxsfRwqOfngMJ0RhNplwApa55Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P8Islb16xyHq+cxEvFvP33har8PtGSQ/Uo/ShVOOgdKXaLDgOrqUx0Hpct1wxO8S8TWpOX1OSrtL/YuebtrMD7r20AKyGMPyg/q2OYRDiu7Q/xspxQCeYmBu7NBU3U0Tdlw9btUCo3BD5HwYawNm4rPArrftXq6B8KRr+37H/UY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qbjA5rFE; arc=fail smtp.client-ip=40.107.162.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qbjA5rFE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylIUs2uhnTXrLNqIdjgi+6YLlrUtDqu3K0fUYodfk3XTBS/2c+nlEIP3nGoi56S5iQh1VMeewXbFCa7zcWQP8zYjLDOW5bZomdiCIK8tj8oxTihRn7W3DmnD9/IhOVPibv/jlYtgLOQedXzNwkxorYNqOpG70LGBBbi+sn1w1DO4FUpzgxir/kc+M0Bt03Y0XglD+Xpf5PAeFxTw7Jp1C6fumuXqsn+FF10bb+CmaUcy7q2By16MR7Zrfb43SZX7/RY7YghHaeWFPgIRLZIU9r7ohFHH1Mm7zyFRvD22ll4XFTL4MPv1T0PaZs4NgXcmSmlBFVysYZMwIew6sdXrAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbDoSsZTBucmdkHoqLkjsBgxA5cOnMb9FMVAq8iN6tk=;
 b=Z7c+/lRpgScYAV6EaOowrG0Mk3hoIbyoz4FXvKuttfP53qtUV2WpSp8FsP0pbicHQ38NX9qLBzrtl12t3RIdiEkZhYXI6OrridHYk33BqnfK1Z93SA6SryCvtSZyGnJaKLI2PzcEDN7aD51FqtEUbkWYitk/pMIjOpk9OIRQXEx3Odq10VWJl+2tdS8xAXwPIiD2WIlLxgGDNF/ph5Cf1V2PgNHcw/4VKKdE9Pq6EMk0riBOprGXZbDRMZ8aeXTL+TQAYj2Wir/vZKTEtrSgNF0hF/+pBhwsiS1+t/nhpm07wmmwzkEvJ7obZA9g7+s1cXUG4pkL9MOYcot3syQEfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbDoSsZTBucmdkHoqLkjsBgxA5cOnMb9FMVAq8iN6tk=;
 b=qbjA5rFEqXD6nVXm2IGbUrV4tMVfwSlA1SJXyh33vwikhrfpa0pXfR6xRB3GmxF1HO0FhL3hVycbEgcxtj5D/eE5l/slBjhdTSkdu8g2I6kuG9FVtR5Z4rYnMLbzbzG2ZRMoEtdobnDoFsRnjdzVLw0ukIQtPuLwHIXxCLOmryF11wiILaYCfdzs+1UQofQmRKkaQqykHcMBdhHpImTD52pFy+Xsvw30FYaUJEC33NDOjrlR+Lnty3Fp/yzZ4Sk0asfX3XOQ5m1UDUF6acjwF8PvApsGLhRjCXZ3FxtLGrfHdh9tiO7GLIisrZ+bE31OBGNWLiQCCagDuoOhmfsAuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by GV2PR04MB11739.eurprd04.prod.outlook.com
 (2603:10a6:150:2fc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 01:07:30 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 01:07:30 +0000
From: marouene.boubakri@oss.nxp.com
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Sumit Garg <sumit.garg@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Subject: [RFC PATCH v1 4/6] mailbox: riscv-rpmi-message: add TEE service group definitions
Date: Thu, 10 Sep 2026 03:20:55 +0200
Message-Id: <20260910012057.106966-5-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910012057.106966-1-marouene.boubakri@oss.nxp.com>
References: <20260910012057.106966-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR15CA0004.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::15) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|GV2PR04MB11739:EE_
X-MS-Office365-Filtering-Correlation-Id: 667d044a-3aff-4ae7-a919-08df0ed7e31c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|23010399003|6133799003|18002099003|22082099003|56012099006|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	bIXsHQpJkokjNhqC+yIoDSJf0j7lW0kX91vpheXDZ6SpBXkrgeFDxT+DFkjPCe8wNblRP6H8Bzshsuog+DlOrFqHtxOp5ZAznBbb6vzCTdjePLiGvsu8Xa7deyZPyEv6aQ6ow35y8Uw9BkuhsOwcbKlNNZ0WizmxKMIQAhnQxqA2b2V2IubZMRmBKp6A17SyT+Qy0s/oA+6BfBOgjSaihsgPWqxDmkg+QoWcPU4ut7BTkD5uy+0SXmHxU/ax9rZvzJzgd4Lm2ey0Y83pYBgHGqcWz7eN6TgK14FpGvptiY4lWTDvvpJMOjj4BZUcoDnMuinMM0K3FMDCcekZb/K+0KYNM+Ik38L59gXzjQcuM20cqzZfTIC3Okjus+goTBsNNpGPk6TtXGus4rCbOsCObnuxz5n+Mqv384rR+XxMaeSGZE+pu4bQTqJMWGZTl11iKQmiubjf8Fkxp+/VUXJDU3tywy94I3G/L+3uIawHdcx/F2axgqY4DWNHw7c8teT9UuDrPZGsCWRslDlsVvEwoKnoHNbZC4lfiYFP9eC9nXky6rJ/VDBWkTwDdaJUNSnOrx4TlGSlAVqlwhnyd7f8uakL/+L03vn+4ZqJFhvhAp4Czaxb3LpUEFckZTx7PeKX4ah3Ozq+ljt6SMNRwKcjlxlOybgSdlgfV8CLvITJpok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oG9A7lch6spNHCHkn8Mkpovqc38QY6PivYBgP/B+bDb75/FK/s214v8Kv5R1?=
 =?us-ascii?Q?aow/ys9n61PjEo8TxxnD0LvS1SiLr+WRw1xqNu00Jzb7X8zMe0mq3wawD3pK?=
 =?us-ascii?Q?rqbqkwzxw9DMqvHNVZFYUNU0vkVNflxLAqwFoS6U6CGCxDQMkUlg5lfNygUl?=
 =?us-ascii?Q?vS0vuoTTkbQWuCgZI/LYWiTGtlm7P+zqfRtSBWO1++JX+VmUalQ5gmW3zh1/?=
 =?us-ascii?Q?A8/Pg2BshZk8/jR6lQngQd+mujyfOAWO6jRFyGGG+nXsYdzVfin/dKwVM9QG?=
 =?us-ascii?Q?LpFwLzJuVbx1r5XyM7GvNCOCH5CdmQEtsX+bu2NHRhDtOKz1xjS8FTrVIv/a?=
 =?us-ascii?Q?JC5SXIkj8tMmCX/CsUIcAFjY3wYgILAJKvx3op2TzJcz8EqyZchTmmyNGyFJ?=
 =?us-ascii?Q?G2C7iuq/HVETV5KPRLFQYeEUDYANcfpKo7ZPi8dWyJ+QkM1ozzO2JLQMOwOa?=
 =?us-ascii?Q?p/sHVYgaadFdQPxW5ihTFbvzUTnvOqTY/nEz40aY0aGUR1yAcEP+/HK5H5D8?=
 =?us-ascii?Q?v3SZidi3ETEzP4b04h0+3TRUvuXO933g5K1B5ToLZC8YbU5vpQBFSrQh07Nz?=
 =?us-ascii?Q?RU2aKQBICrjcAG4IvMLb/67Df2ftn9HICZ87yutOIkrPI53eNjZK0LFDswPs?=
 =?us-ascii?Q?6k9NmzMM9pk2J2mvhGybBEcBF4ioj6Et7GceyzCYO7YRHdrsIDdftJEWRhMC?=
 =?us-ascii?Q?163Hexa0VVLBdfgI3W74Kr1ONgFMBdHaLhAZih6JelLerLlESKcP/ttkmr1Y?=
 =?us-ascii?Q?uhax13Jn3q6wRwgaKfLFAO4+pEgBQR8DoxNNt+TVXar24Y+ODwg1h+JIgLQq?=
 =?us-ascii?Q?oMT2DsrLtzM6CQ3Yw9kqaUMbE8qnsbnODVSP/tH4cXDIMZrf2NZ7xcteBML/?=
 =?us-ascii?Q?zUIBWA2nsPLVWmMOS2BS3vlllcUgJeT+QT5eOdnpZcWSeTnWDRIvZQ2sVcJV?=
 =?us-ascii?Q?Q2srgKfdTLey8/E8dQ+CvVoGd1m06QxIK1mgQKG6aI6Srq44Vnfpng5WOuV+?=
 =?us-ascii?Q?eqcDzGGoKKV7hkAoYltipM+sKStZh8jSvzSdYWIglBY1ZaF7Us9KUlNT4emE?=
 =?us-ascii?Q?64jt9cOd3By+YpOcbJEwiIBOsK4yzo8G8luvHel6rjwedHTRBBCmanObGXrc?=
 =?us-ascii?Q?yUG5kVQ0soDehkETdPqrTEoXBviLgCZ2Izk2uYGWXJfUrOLvHrlW3WQ6XAnG?=
 =?us-ascii?Q?6j4u3Vy8mQkg0S/nIbxXWan8BG94o+ZW6daj1jcMleyNme9HGg11qfAc7O0r?=
 =?us-ascii?Q?c2xlyXl2aFOMWt00qQy0EODyXl59dxt94u5RFSgi+ZcCGcQEdplG4lilgIf8?=
 =?us-ascii?Q?UEYhfRLeiLj54JJBYYsSXhToN92QmCdYkpbu0XLFGh5IRE7mnZcWWwPmsAf/?=
 =?us-ascii?Q?kxN73CVzPTb7ymUkvGuSWorjxHAsIiDkkCItUTHI8240tt8kB74jRshJyoeg?=
 =?us-ascii?Q?K9OYouos5cn2KotlExN0eiNTLWqlG8S6IcdexeCzGQgnjNvtA/qZTVJIMPOW?=
 =?us-ascii?Q?ZtPkIQNKwifd/pnVcQc/57n1OET6xpAnMEcYSXRxWgIDdq7imy9ln30lGnqU?=
 =?us-ascii?Q?LKfVMe32mBhhwFh7Wh438LqEOcLhvSEnGkWcuKG8mo2D+0zvnzLsYLtEUvvS?=
 =?us-ascii?Q?+WwH6rSvItqcrCNQts1Nea82nRbF8ZtZdto+KIjl+LmbsK1sS3sDMKGQlS2W?=
 =?us-ascii?Q?OlI+oQdSu9bsPpsAdmNTo2MhVXElmEfGGm8aAJ+XTPhywxDT4B95SiAtFRWu?=
 =?us-ascii?Q?QcxO0u2ieCxC++RhDPyMT9vteBOnAvBGAyD8FuXgidWqj4d5hP+OOqG8y5Fa?=
X-MS-Exchange-AntiSpam-MessageData-1: 7DTmwkDmZv+0tA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 667d044a-3aff-4ae7-a919-08df0ed7e31c
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 01:07:30.2010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oE7Y1iIkFx+7xVQ66S+MfA0X4bqCCB+zHPlCdHF+G2ccPHnyQQUjwDi1OPjBvFyYom6al3HUTU3ezPWL3r17y19p6PqmdaRrkkBrYJl4BdOeL95lFkLTDqOWR+OUp9Oh7nsIRoU4VzjILHJxVwEh9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11739

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

The RPMI specification v2.0, currently in development on the main
branch of the specification repository, adds a TEE service group
(SERVICEGROUP_ID 0x0010) which lets a client in a Rich Execution
Environment invoke services in a Trusted Execution Environment through
the M-mode firmware or hypervisor implementing the group. Its TEE_CALL
service is a synchronous request whose target TEE executes on the hart
of the caller until a response is returned.

Add the service group ID and the service IDs, as defined in the
specification draft, so that TEE drivers can use them together with the
SBI MPXY mailbox driver.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 include/linux/mailbox/riscv-rpmi-message.h | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
index e135c6564..0530e1ddd 100644
--- a/include/linux/mailbox/riscv-rpmi-message.h
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -93,6 +93,7 @@ static inline int rpmi_to_linux_error(int rpmi_error)
 /* RPMI service group IDs */
 #define RPMI_SRVGRP_SYSTEM_MSI		0x00002
 #define RPMI_SRVGRP_CLOCK		0x00008
+#define RPMI_SRVGRP_TEE			0x00010
 
 /* RPMI clock service IDs */
 enum rpmi_clock_service_id {
@@ -119,6 +120,30 @@ enum rpmi_sysmsi_service_id {
 	RPMI_SYSMSI_SRV_ID_MAX_COUNT
 };
 
+/* RPMI TEE service IDs */
+enum rpmi_tee_service_id {
+	RPMI_TEE_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_TEE_SRV_PROBE_FEATURES = 0x02,
+	RPMI_TEE_SRV_PROBE_SYSTEM = 0x03,
+	RPMI_TEE_SRV_EXIT = 0x04,
+	RPMI_TEE_SRV_SIGNAL_BUS_SETUP = 0x05,
+	RPMI_TEE_SRV_SIGNAL_BUS_TEARDOWN = 0x06,
+	RPMI_TEE_SRV_SIGNAL_RAISE = 0x07,
+	RPMI_TEE_SRV_SIGNAL_RETRIEVE = 0x08,
+	RPMI_TEE_SRV_MEMORY_PARCEL_CREATE = 0x09,
+	RPMI_TEE_SRV_MEMORY_PARCEL_ACCEPT = 0x0a,
+	RPMI_TEE_SRV_MEMORY_PARCEL_RELEASE = 0x0b,
+	RPMI_TEE_SRV_MEMORY_PARCEL_RECLAIM = 0x0c,
+	RPMI_TEE_SRV_MEMORY_SEGMENT_SEND = 0x0d,
+	RPMI_TEE_SRV_MEMORY_SEGMENT_RECEIVE = 0x0e,
+	RPMI_TEE_SRV_REGISTER_FOR_LIFECYCLE_INFO = 0x0f,
+	RPMI_TEE_SRV_ON_START_INFO = 0x10,
+	RPMI_TEE_SRV_ON_SHUTDOWN_INFO = 0x11,
+	RPMI_TEE_SRV_ON_CHANGED_INFO = 0x12,
+	RPMI_TEE_SRV_CALL = 0x13,
+	RPMI_TEE_SRV_ID_MAX_COUNT
+};
+
 /* RPMI Linux mailbox attribute IDs */
 enum rpmi_mbox_attribute_id {
 	RPMI_MBOX_ATTR_SPEC_VERSION,
-- 
2.43.0

