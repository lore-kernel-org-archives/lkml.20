Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012066.outbound.protection.outlook.com [52.101.53.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C792548641B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460797; cv=fail; b=LY2Q5ghmlyNt31WUNAiRbcHI7dXKkpLmsBqPFU7tB8VeUH2B1mK0Ua425eOp1521aLErOTY2/yWaeJQWuIpJmu9kuvlB/qBcZbkVV0tRyV1bUf2IZfIzzaclW+rk9cXgQfgPVit3SO0kG4rzF4133t8pM/CET2dA4u+sTOOCufA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460797; c=relaxed/simple;
	bh=7/as1yeVlq+uuy1QUfgeyc0jtGa+zGdHO/cQz9fc5Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d3hVCPRFTQqhbFH8LIWSo4rA2idvLxTMHIRfMNCpsPYY/WJfsyzSa4D7QTzMbIKKD/y7RtD/BNgjdAYx4haG/BA1PIL0GJmldMjppCxBSG/mr/j94m1qR2MPTj1v1wc6zcYYrQGVN/Nz7fETd6ZZ204xUi3tnmiZgHR/tnZ5BkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=pIFEQw4Y; arc=fail smtp.client-ip=52.101.53.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="pIFEQw4Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oo2hRKlbw02FqCrDaWNAEmoAK9a3pj+4sqnPCFNV93kGFiUCRLz0IGKuN4hyzG7XiCc51iJHdIFy0wheuGmoTeU76YYxQF8ve6eaZMq8ZP573IBURxjzNzA0y7Ag786ds7Kwmxa42gECROGsVV5jFQxxCbsQWeO20AW9u3Ndnl0ikDiPpoVA1OgQFNuA7wQ/e9hhV4po+eOq+7bQc/8V+n4vO+OHylRs2Mh2XRiceEDjftGQiOKLPZ+uFX2Hw+xj1Q2Ypyf5FXeB1vbEEAHEl8oYFAcUXb4DhFRjA1o8t/UuY/3n6b+thYSV59IMzS3Tpelx3VM/+caAAERmpikwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfOHK1+28qr5sHuZXiKf4eCUKtjxgVbjtV+7Y85Ding=;
 b=RRHpOX05hftor+DR4OBCOzxbfEGV2dtmkom69m6n3ig2ZKa4Nlm7QuRvZ4tNWeRrYWbfoBIQ8niDgq1y2W1JUfX0zDg0NtuwFaTkOQUcmEWMVEr/22cKLtfumf5J12DbJoKztmq9CkSoUpNQwcDqkcdUFbSlK+yPUjSPHoObaqhC6sEUYLOW+cQLec4le1a6PxL/HCNJ4bjGqqLpGnG4JFZQJRjBOzYOqUTF34MT6UIE9i54gBILu2cexDJEkPMpC+GZ0evXc5PLeIJYiGq4oFCHuXKKu8r+UnS4guPMd3vZNS4X7brb7fOwpWPUprERSe9KEDrYceLIw8Z6X8eKZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfOHK1+28qr5sHuZXiKf4eCUKtjxgVbjtV+7Y85Ding=;
 b=pIFEQw4YzCVnTB9FHwXJ/0p/HnX7aa6a2FrDEwsm4+cPq/jSGQS2NZwAIMaa7mqKKplVj+Xehg3eUWmzzoPFe5rcfY94EZdyQmQEMotnyj91Lzc/S9PlwEWaSBG1JCISibR8++X2ZkfiX+JpPGuwVSF/40ccVpjayyBL8vszHGmRtmRTTuS703Nl4z3vAW/n5AzaIvf16boOXgxIgpyn53l2bEdPIdPdq8vfSajG9PgruiWO7QQN4Lnt3BCXZDHoiDK60NXJnNuoCkCIK5QBRNbzfU7tEvvHLswvIXbbEPDeevHB8EERf6Ts85bvMKdvF4dgaXzOYPv3osnxtERp0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MW4PR03MB6555.namprd03.prod.outlook.com (2603:10b6:303:126::12)
 by SA1PR03MB7121.namprd03.prod.outlook.com (2603:10b6:806:332::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 08:26:30 +0000
Received: from MW4PR03MB6555.namprd03.prod.outlook.com
 ([fe80::c8e9:5e5d:afad:5eaa]) by MW4PR03MB6555.namprd03.prod.outlook.com
 ([fe80::c8e9:5e5d:afad:5eaa%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 08:26:30 +0000
From: hang.suan.wang@altera.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v5 2/3] firmware: stratix10-svc: add FCS crypto-service commands for Agilex 5
Date: Tue, 15 Sep 2026 01:25:44 -0700
Message-ID: <7c566ebe4024ef5c827de37a26c950ce9c202769.1789448407.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1789448406.git.hang.suan.wang@altera.com>
References: <cover.1789448406.git.hang.suan.wang@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0210.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::35) To MW4PR03MB6555.namprd03.prod.outlook.com
 (2603:10b6:303:126::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6555:EE_|SA1PR03MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 1514f113-43b8-47d1-e861-08df13030b4f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|55112099003|18002099003|22082099003|3023799007|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tfYKxmtoMiX0cLhxra29aW96NS4yG0Lz2d/6Tnek4jtAF/iDgjecmIYGm4pW+C3aSiwNX3KwlYdt0ex4EYSrZKP/iZdlJyfzc0NMaPVyLBmfb1vcFK/hH5RHttELPAMTqwmCtmu0kXWJA41KivaxE/sy9ETFWIRZTp3qbfgw/+JFgFP8pT0qdRwM9LQhCvsHKucmVLTWVweqaj3/sD+OIT9k8OoXG4cfpsqBrjUzzfp4+ZKRuoZOYVhquX8zoQhMn3IL/zRX1nwSz0v+5g+IO5hdguROJp5rxjgYG5iJuGdECp4gB4A+bUnQINQey7D1SsN6a+xioIdwPmhULKyFNu0I1hSqjjopvp/puZCTHopukrTXLmjGXS7mNfT3H/nfr4DoBkNKZBK+H7a1MxdAIGe6rw7SVsTtOqoNssleYW27ZDruTMXmvLarkhDiS2gOjy4IG2mxEtzdCpZd2XjzmY1TkL3IQgt0uY6qaSu+3nthwLUDTJ0ku7VFpQciy3gt5MejTs6B6L2lFwhp4/GhakHi+mi3ZqjeNYvPY5Q6Ipc8wdQpx2AQY/kanUlvusFi5OdN6OwnENDBynJy9OTq0a5lFhaWYsYcDGuaAI0h5QAfpAc8GuOpuDLuwP/WG1S91N3QuCqnCLzWV/o+VZ4WY9hyzLKmFoIu1/OuTbMglWI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(55112099003)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XNJbJw3VnuMjQX9mw9yO7lAWrcPvjavL3xqVnCQq+3N+USsuKuPbBgbYW7em?=
 =?us-ascii?Q?nfVi0iNXQun9GVnIWS8BKIBEZ4jegkWeIWoefRj6hN5CS5+avQd5iiPOEAc1?=
 =?us-ascii?Q?e2fMWhAeRrN4QEG+fr7xwOfdyi9a40XwBI4lBXUpxvi7uRxnnkVMHc1e4bOL?=
 =?us-ascii?Q?6HBygJrksLyL+Rfnig+UTZO1ebM4bjBPIyWdrQC3oUNpSpKrQi1Wy4lzL3X+?=
 =?us-ascii?Q?A4qzc5rat4hlXQ/oM5mhiNfSG9aBGiPbAU6Q08E1KNTMkmNuBX0pk7PbuWEf?=
 =?us-ascii?Q?vQoUeeUVttSnIL4P0ukTKhnObxX25BLxcwv6A8YDPDxKol8UZ+dTEIMcjix+?=
 =?us-ascii?Q?ltjql2GBlPl9/ZvcDjgraJu9FjaKvWx9gN0wh1NJwaeyeVBIQgGrRkN0Wdph?=
 =?us-ascii?Q?lb/KYDEkiIQQeKi5caUjwZHh1vbcGpSu+a3yyU4ssbN9RkNnUwArSRAJ0QPb?=
 =?us-ascii?Q?U255qKRDEH1horF2khXhLBn8/H20hoSbE+G7Jgjgp5z6M8bmVY6+4cPiVN+D?=
 =?us-ascii?Q?bbgkdBUpJ/A0/ikUMuierBgjGbozsMmbDnAM5yXXdfhSZZM57gGAW+fQdv34?=
 =?us-ascii?Q?6pH1H25NVRhTxTjfi1wH+u2h16vho4XvllW1cq591Umrlzjp64Bveh+n/u0J?=
 =?us-ascii?Q?TWUdofYTMZ5YynwghCXfjmzWy8G13PbZpU4OnbCfrB1uiu1GBkcipFOqLwo+?=
 =?us-ascii?Q?b4l8cG2hLrmjZslu+axeD+XtABxhPGkak/xy8hFNil60dW6OIJtBKFF1Cnq8?=
 =?us-ascii?Q?pWOgkXluQWvobsd3DXutEhWsbs7gObHCNeb8AppnhxM1sdm0B3Ap8fQ7kRmT?=
 =?us-ascii?Q?YIX4NjGrqH1kI0b7dBxgtzpjzpzaVTVKSbvAfIptA+AhmcnQ/0twWTXIFjmT?=
 =?us-ascii?Q?Rg4g+9vamvfAcfQVKOu5/cpdCRD+G6Umjc6qnfeerrm9U26L2Z6SUdavfp4m?=
 =?us-ascii?Q?pnKZYWu+QW496DrvF4SN5SSVJ8pCv/ZAZGhPaVmtFA0Kj4jnT7Gd5KRQgh6l?=
 =?us-ascii?Q?y0UUZ3YVnVlMv4Nz2ZBSb9hMebdlDP2tbH9JQxN2fkT1WSRCgcJeLoJ3+h5a?=
 =?us-ascii?Q?9KgsI7TSjzBi0KGKIa2AUKnC85RNAQmV8/x4vVvAaiVyRw7yxhiZTr+8TqXO?=
 =?us-ascii?Q?yypBq7cjPadBOLCLfu+kmrytptZmG9T0d1LWzYuSufxnBEVrWkZQr+UoX3on?=
 =?us-ascii?Q?3ubvUKi4HkleTgSWwR6OzIG4xF/K5zCRfDlqVF1knH2z9X1eeCCDXRnXSx/n?=
 =?us-ascii?Q?PKxN8UE0iJL0dJTEFnjkkM9tjBaTKZ0MAF4rFeB+tT3AnztxVEB9FbMcP/n6?=
 =?us-ascii?Q?fGFy5c3cILbrB0pE+8VkWjwdGGQGUTBEnogUxerDEAqUOlvOQ+MqoSx++2iN?=
 =?us-ascii?Q?JyMON85xm6QOz0oOMpZjNrz+Upu6aWwFuf7L8f7Xrgu2zaieqG5XzP7N2jLw?=
 =?us-ascii?Q?7ofVO9v8T+FCaMa5c0ifP6d3BJl1SjyUUzPh+BrEYbnlhbFydNqf5J++GFvp?=
 =?us-ascii?Q?fNkxayatFIh7lbEX89Ynjn2cnqWPL/kK50I1y8oM8YoF6YR59q7X5eWapEbu?=
 =?us-ascii?Q?zAScv7vgeMjm566v1PqxYtWy6YX6E7OgguW4RMIZsiIo+wLkGq57JWpFvJdi?=
 =?us-ascii?Q?YVQUd/1SXM0SZN6BVadMD3a/XbtvBceGsArG1YMXfPBbO+DvjapFf5jCnmTS?=
 =?us-ascii?Q?NswBVUSQ8tNI2dq56BE7L/pi4gqniA6QcYG77aG8eetztXiKBJnwl5LNpHxi?=
 =?us-ascii?Q?0P6t/sTuAA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1514f113-43b8-47d1-e861-08df13030b4f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 08:26:30.6639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9A9RXttz/bbPZYU2xPgbmnXeVmoiuqgTXASiQ73kjHbDNssIsb2YZnx90i1jDq1qjUjggMOrGFcnqXFUV24+dXAkraECLxPyGEhwo0dI33o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7121

From: Hang Suan Wang <hang.suan.wang@altera.com>

The Agilex 5 Secure Device Manager (SDM 1.5) exposes an FPGA Crypto
Service (FCS) over the existing SIP SMC mailbox: a session-based
interface for crypto primitives such as SDOS (Secure Data Object
Service) encrypt/decrypt. The service layer has no command to drive it
yet.

Configure stratix10-svc about this interface so an in-kernel FCS client
can use it:

  - add the client command codes COMMAND_FCS_CRYPTO_OPEN_SESSION,
    COMMAND_FCS_CRYPTO_CLOSE_SESSION and COMMAND_FCS_SDOS_DATA_EXT (all
    asynchronous)

  - add the matching asynchronous SIP SMC function IDs
    (INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION,
    INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION and
    INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT) with their register-usage
    documentation;

  - match "intel,agilex5-svc" and register a "stratix10-fcs" child
    platform device, mirroring the existing RSU child, so an FCS client
    driver can bind without a dedicated device-tree node;

  - dispatch the new commands in the asynchronous send and response
    paths; for the SDOS data command, translate the source and
    destination buffers (allocated from the service-layer gen_pool) to
    physical addresses and pass them, together with the session/context
    IDs and owner ID, to the SDM.

The transport is unchanged: Agilex 5 reuses the SIP SMC calling
convention and async mailbox ABI the driver already implements, so no
new transport mechanism is required.

The SDOS SMMU-remapped address slots currently carry the buffer
physical addresses; SMMU remapping support is added in a follow-up
series.

This is a prerequisite for the SoCFPGA FCS driver, the first in-tree
consumer of these commands.

Signed-off-by: Hang Suan Wang <hang.suan.wang@altera.com>
Reviewed-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/firmware/stratix10-svc.c              | 59 +++++++++++++++--
 include/linux/firmware/intel/stratix10-smc.h  | 64 +++++++++++++++++++
 .../firmware/intel/stratix10-svc-client.h     | 16 +++++
 3 files changed, 134 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 07345efeef0c..8ead4a3c4a1b 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -46,6 +46,7 @@
 
 /* stratix10 service layer clients */
 #define STRATIX10_RSU				"stratix10-rsu"
+#define STRATIX10_FCS				"stratix10-fcs"
 #define SOCFPGA_HWMON				"socfpga-hwmon"
 
 /* Maximum number of SDM client IDs. */
@@ -106,10 +107,12 @@ struct stratix10_svc_chan;
 /**
  * struct stratix10_svc - svc private data
  * @stratix10_svc_rsu: pointer to stratix10 RSU device
+ * @stratix10_svc_fcs: pointer to stratix10 FCS device
  * @stratix10_svc_hwmon: pointer to stratix10 HWMON device
  */
 struct stratix10_svc {
 	struct platform_device *stratix10_svc_rsu;
+	struct platform_device *stratix10_svc_fcs;
 	struct platform_device *stratix10_svc_hwmon;
 };
 
@@ -1398,6 +1401,30 @@ int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg,
 		STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
 
 	switch (p_msg->command) {
+	case COMMAND_FCS_CRYPTO_OPEN_SESSION:
+		args.a0 = INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION;
+		break;
+	case COMMAND_FCS_CRYPTO_CLOSE_SESSION:
+		args.a0 = INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION;
+		args.a2 = p_msg->arg[0];
+		break;
+	case COMMAND_FCS_SDOS_DATA_EXT:
+		args.a0 = INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT;
+		args.a2 = p_msg->arg[0];
+		args.a3 = p_msg->arg[1];
+		args.a4 = p_msg->arg[2];
+		/* payloads are allocated from the svc gen_pool; pass phys addr */
+		args.a5 = gen_pool_virt_to_phys(ctrl->genpool,
+						(unsigned long)p_msg->payload);
+		args.a6 = p_msg->payload_length;
+		args.a7 = gen_pool_virt_to_phys(ctrl->genpool,
+						(unsigned long)p_msg->payload_output);
+		args.a8 = p_msg->payload_length_output;
+		args.a9 = p_msg->arg[3];
+		/* SMMU remapping is added later; pass phys addr for now */
+		args.a10 = args.a5;
+		args.a11 = args.a7;
+		break;
 	case COMMAND_RSU_GET_SPT_TABLE:
 		args.a0 = INTEL_SIP_SMC_ASYNC_RSU_GET_SPT;
 		break;
@@ -1495,8 +1522,13 @@ static int stratix10_svc_async_prepare_response(struct stratix10_svc_chan *chan,
 	data->status = STRATIX10_GET_SDM_STATUS_CODE(handle->res.a1);
 
 	switch (p_msg->command) {
+	case COMMAND_FCS_CRYPTO_CLOSE_SESSION:
 	case COMMAND_RSU_NOTIFY:
 		break;
+	case COMMAND_FCS_CRYPTO_OPEN_SESSION:
+	case COMMAND_FCS_SDOS_DATA_EXT:
+		data->kaddr1 = (void *)&handle->res.a2;
+		break;
 	case COMMAND_RSU_GET_SPT_TABLE:
 		data->kaddr1 = (void *)&handle->res.a2;
 		data->kaddr2 = (void *)&handle->res.a3;
@@ -2004,6 +2036,7 @@ EXPORT_SYMBOL_GPL(stratix10_svc_free_memory);
 static const struct of_device_id stratix10_svc_drv_match[] = {
 	{.compatible = "intel,stratix10-svc"},
 	{.compatible = "intel,agilex-svc"},
+	{.compatible = "intel,agilex5-svc"},
 	{},
 };
 
@@ -2107,7 +2140,18 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 
 	ret = platform_device_add(svc->stratix10_svc_rsu);
 	if (ret)
-		goto err_put_device;
+		goto err_put_rsu;
+
+	svc->stratix10_svc_fcs = platform_device_alloc(STRATIX10_FCS, 0);
+	if (!svc->stratix10_svc_fcs) {
+		dev_err(dev, "failed to allocate %s device\n", STRATIX10_FCS);
+		ret = -ENOMEM;
+		goto err_unregister_rsu;
+	}
+
+	ret = platform_device_add(svc->stratix10_svc_fcs);
+	if (ret)
+		goto err_put_fcs;
 
 	if (IS_ENABLED(CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON)) {
 		svc->stratix10_svc_hwmon =
@@ -2139,10 +2183,14 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 err_unregister_clients:
 	if (svc->stratix10_svc_hwmon)
 		platform_device_unregister(svc->stratix10_svc_hwmon);
-	if (svc->stratix10_svc_rsu)
-		platform_device_unregister(svc->stratix10_svc_rsu);
+	platform_device_unregister(svc->stratix10_svc_fcs);
+	goto err_unregister_rsu;
+err_put_fcs:
+	platform_device_put(svc->stratix10_svc_fcs);
+err_unregister_rsu:
+	platform_device_unregister(svc->stratix10_svc_rsu);
 	goto err_free_fifos;
-err_put_device:
+err_put_rsu:
 	platform_device_put(svc->stratix10_svc_rsu);
 err_free_fifos:
 	/* only remove from list if list_add_tail() was reached */
@@ -2164,9 +2212,10 @@ static void stratix10_svc_drv_remove(struct platform_device *pdev)
 	struct stratix10_svc_controller *ctrl = platform_get_drvdata(pdev);
 	struct stratix10_svc *svc = ctrl->svc;
 
-	platform_device_unregister(svc->stratix10_svc_rsu);
 	if (svc->stratix10_svc_hwmon)
 		platform_device_unregister(svc->stratix10_svc_hwmon);
+	platform_device_unregister(svc->stratix10_svc_fcs);
+	platform_device_unregister(svc->stratix10_svc_rsu);
 
 	stratix10_svc_async_exit(ctrl);
 
diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/linux/firmware/intel/stratix10-smc.h
index 366309260121..75a39e7190af 100644
--- a/include/linux/firmware/intel/stratix10-smc.h
+++ b/include/linux/firmware/intel/stratix10-smc.h
@@ -669,6 +669,70 @@ INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FPGA_CONFIG_COMPLETED_WRITE)
 #define INTEL_SIP_SMC_FCS_GET_PROVISION_DATA \
 	INTEL_SIP_SMC_STD_CALL_VAL(INTEL_SIP_SMC_FUNCID_FCS_GET_PROVISION_DATA)
 
+/**
+ * Request INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT
+ * Async call to perform encryption/decryption
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT
+ * a1 transaction job id
+ * a2 session ID
+ * a3 context ID
+ * a4 cryption operating mode (1 for encryption and 0 for decryption)
+ * a5 physical address of source
+ * a6 size of source
+ * a7 physical address of destination
+ * a8 size of destination
+ * a9 sdos ownership
+ * a10 smmu remapped address of source
+ * a11 smmu remapped address of destination
+ * a12-a17 not used
+ *
+ * Return status:
+ * a0 INTEL_SIP_SMC_STATUS_OK or INTEL_SIP_SMC_STATUS_ERROR
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CRYPTION_EXT (0x12F)
+#define INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CRYPTION_EXT)
+
+/**
+ * Request INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION
+ * Async call to open and establish a crypto service session with firmware
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_FCS_OPEN_CRYPTO_SERVICE_SESSION
+ * a1 transaction job id
+ * a2-a17 not used
+ *
+ * Return status:
+ * a0 INTEL_SIP_SMC_STATUS_OK ,INTEL_SIP_SMC_STATUS_REJECTED
+ * or INTEL_SIP_SMC_STATUS_BUSY
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_OPEN_CS_SESSION (0x13A)
+#define INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_OPEN_CS_SESSION)
+
+/**
+ * Request INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION
+ * Async call to close a service session
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION
+ * a1 transaction job id
+ * a2 session ID
+ * a3-a17 not used
+ *
+ * Return status:
+ * a0 INTEL_SIP_SMC_STATUS_OK ,INTEL_SIP_SMC_STATUS_REJECTED
+ * or INTEL_SIP_SMC_STATUS_BUSY
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CLOSE_CS_SESSION (0x13B)
+#define INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CLOSE_CS_SESSION)
+
 /**
  * Request INTEL_SIP_SMC_HWMON_READTEMP
  * Sync call to request temperature
diff --git a/include/linux/firmware/intel/stratix10-svc-client.h b/include/linux/firmware/intel/stratix10-svc-client.h
index 9bb46c3cb0f8..ffc1ac7c9785 100644
--- a/include/linux/firmware/intel/stratix10-svc-client.h
+++ b/include/linux/firmware/intel/stratix10-svc-client.h
@@ -7,6 +7,8 @@
 #ifndef __STRATIX10_SVC_CLIENT_H
 #define __STRATIX10_SVC_CLIENT_H
 
+#include <linux/types.h>
+
 /*
  * Service layer driver supports client names
  *
@@ -122,6 +124,15 @@ struct stratix10_svc_chan;
  * @COMMAND_SMC_SVC_VERSION: Non-mailbox SMC SVC API Version,
  * return status is SVC_STATUS_OK
  *
+ * @COMMAND_FCS_CRYPTO_OPEN_SESSION: open the crypto service session(s),
+ * return status is SVC_STATUS_OK or SVC_STATUS_ERROR
+ *
+ * @COMMAND_FCS_CRYPTO_CLOSE_SESSION: close the crypto service session(s),
+ * return status is SVC_STATUS_OK or SVC_STATUS_ERROR
+ *
+ * @COMMAND_FCS_SDOS_DATA_EXT: extend SDOS data encryption & decryption,
+ * return status is SVC_STATUS_OK or SVC_STATUS_ERROR
+ *
  * @COMMAND_MBOX_SEND_CMD: send generic mailbox command, return status is
  * SVC_STATUS_OK or SVC_STATUS_ERROR
  *
@@ -190,6 +201,11 @@ enum stratix10_svc_command_code {
 	COMMAND_FCS_RANDOM_NUMBER_GEN,
 	/* for general status poll */
 	COMMAND_POLL_SERVICE_STATUS = 40,
+	/* for crypto service */
+	COMMAND_FCS_CRYPTO_OPEN_SESSION = 50,
+	COMMAND_FCS_CRYPTO_CLOSE_SESSION,
+	/* for extended SDOS encrypt/decrypt */
+	COMMAND_FCS_SDOS_DATA_EXT = 82,
 	/* for generic mailbox send command */
 	COMMAND_MBOX_SEND_CMD = 100,
 	/* Non-mailbox SMC Call */
-- 
2.43.7

