Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011017.outbound.protection.outlook.com [52.101.62.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A863E49C8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184235; cv=fail; b=EIlwNcrxo2VGOq3ikIKY4X912F42SBqrHfPWgRLcwZ8rGe3qui2XBnW+fbOJgKmsb712FxGuDCvF6/MjUp9WWHxhf+mPQbDjZ65/ecFEoU3VfrBGamiKe2MWjOPZbKXecigFOrZvNA3peX90LZIthwu1jq8PkwQ24YxRjm8gvPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184235; c=relaxed/simple;
	bh=7/as1yeVlq+uuy1QUfgeyc0jtGa+zGdHO/cQz9fc5Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QA1PwbdOhUBtQE+yK0lyJ5CXQkcgJA1xtwT2saQrqrNyhwJxTsjKhsyVsRPa7RVqcMYZfipd9+Y8ztPTgeKe97VbW6N3HGY1Mxqa2IecLhKPa0Nxgy5aGdhMXHF+8tBzlEbrPxxSpAO1klfQAM4EBT6gsrCc8N/sozOTsId6wMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=lmNbcCrR; arc=fail smtp.client-ip=52.101.62.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="lmNbcCrR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/xlcABX2sOJKOLz2TiTdf7J9vzn3nIlQeWYcOwmU+go9cvYU0npfo72oUEvGPBKsJs3hos8yLrUqDxb0XjrdNugDADWQyIrfzbSGgYZC1OIXL5N+sQfGEObB87GyQ21N6K7AxrJMBBV9nJsA9ahQmXih69O4dEfYy4WIPcdXb1gFvR/sBCI8bUZxOafJ+6seLN614zJ0AUIn/5mfqKLYX9mNQaDLaOxTnixeg17pDgAK4Gekd8kJAaokwlgBcdSh8mZj16jwyzPIM9lQ1xB+XL/D7L3/CVhkuXDjr1E+lqfrp4GFdWn82sfNwgaCa26ceGpSjTQZMb5u2ZYPrkXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfOHK1+28qr5sHuZXiKf4eCUKtjxgVbjtV+7Y85Ding=;
 b=ZagM0zEOuDd5HUCVoLXCNLzXtjoGLn3K4Vstmyr1a9kMGCgZ8Z0YHL7Ba0tCabsFVEJ0HNgD0YoydqnmQ97cu0JUExGQ2yb2RjmISBlYYOGDurp5oNf/+RcX8bUqoYtFwpPjurskHI9/bRQT5w5+FFEFK+BqIOXZGoUvDzqovaECfIlxKZc1F6LPqykrew3R3G48FU/FMmvxLLIjTEkfXZ27DfwW/ymk+klE+c5FRnboA7tRHw/yjdw4d+N3IDavtn0Dl1aanFlq5mLPTXgLG97lnIaVLYn9EEyMTQWX+b++bKZ6Og7HYpDfo7SEIsKR4tczX/BQyZWJvSQxaeI5Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfOHK1+28qr5sHuZXiKf4eCUKtjxgVbjtV+7Y85Ding=;
 b=lmNbcCrRIMugFLuiHVzJRwo+ggtOU00XnBMR9TBbLnU85NZh4Vuuol5KKOqQLS59NA4NotsPWdzoqeK7SMfeW8quBrjY+KFk51E4MJkuE14eA3aXnRlnk9g0uVLaRw4De5d97KoHZ62/McQf3oZ5GgzMqsbQpRLjN/65uIzcSR5mPsjQeeqWCdxXTo4XAK+U+8K1I23u/RjK87p9ywgm7foAnBpPNyRgDsyvU/peZ+WCigST1qmCBl2Uvo0R3q+aqBBpIHNJvqbHxezdjUrY+Mx2UgKPV+l42acMbRxDvuTFVjt5SnR1CawBCv8Q2ilYA6npJdr6S+kQYjS99PAkPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from PH0PR03MB6560.namprd03.prod.outlook.com (2603:10b6:510:b2::12)
 by SA5PR03MB8402.namprd03.prod.outlook.com (2603:10b6:806:47b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 17:23:48 +0000
Received: from PH0PR03MB6560.namprd03.prod.outlook.com
 ([fe80::5364:bd7:85a:f07b]) by PH0PR03MB6560.namprd03.prod.outlook.com
 ([fe80::5364:bd7:85a:f07b%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 17:23:48 +0000
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
Subject: [PATCH v6 2/3] firmware: stratix10-svc: add FCS crypto-service commands for Agilex 5
Date: Wed, 23 Sep 2026 10:23:40 -0700
Message-ID: <3ae33440d87e3bedca95048d7e798e5bab7871a0.1790183375.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1790183372.git.hang.suan.wang@altera.com>
References: <cover.1790183372.git.hang.suan.wang@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::27) To PH0PR03MB6560.namprd03.prod.outlook.com
 (2603:10b6:510:b2::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6560:EE_|SA5PR03MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e9dba01-8e11-45ca-e629-08df19976d94
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|11063799006|6133799003|3023799007|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ggLWsBrkRBQXPt67dUhN2SJaXmQnSFFoxmh1lHJcwGE+pDl8XV7Nh87PmmB8Xl1VWQOMN6yvrwMVnq2FeTkvXPN0PPX+ekl25yCSmycA4yldLXaWh94tSVHodLy8lhuG7P37Hp/jdnaIUpa3C19mDh+Myfop931U8V8qW0y0w2l8N9fMN9h+/Wj2Bho8jsPKE9SBQPOhoz73iwFCxY6BtRbro1msNmgaG1VIY0HB6QWsutREwjbu1W3LKfzWjKcWmto6lLAP9bk+bjSpPjPs5tXjMO2xYaJbNf58U8LuOMmiWvAUuiZU2P4vvVF74U8cvcu0jbngOuPEEn5ejfs4RJbkRGgl1TT96Iqm+fyEsqyCHKJOXLiQEfT31X75l73WMj2ahM7UQJ8NZclMO5zc0JQSIeEuiSQ8AVrw3CYSklcGMZJQ9HqLIMF9gE4RKHydevkHB/zA+6sW8Vwm3Dl5W6Y3jJDkc+2V4J23ltPdvHc6P6DirWw9mQFXtyAly99+15Ug7Al7eoaMw7AtrqDIHKcXGzoyX/cH+BlI51+/aN8l/GSVczBTxgi8pTYayjCI7aqJtwNhb61f5z8JY/lxf2rU65aETESR3gzqn/o/nZQwgYWsaPbu0vJbBE0lgyNRhBKvF1w+I/h+I0+RhghikWSh1Iew/ev4rTM0dbYKCRQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6560.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(3023799007)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v2EeGFbZrR6fvU1DGoPceoF9bbB9INvuvp/fo4gAGQtbe3mT/M/PklSovv0f?=
 =?us-ascii?Q?UgWdnFW09hc/ShoOYZhTtN9urZ51B0Wr0zhoCy5Ab+bu/H9hV6fnuhYghywB?=
 =?us-ascii?Q?MD8ShfzgRG6JoKc9WrHmVYaIZCraHlNpn4lvDojBXzT6JIRIqE6edo+l7MSD?=
 =?us-ascii?Q?cwru4x2ZPT8M/iip27xXoz00zbQ1LEcvs6epQ15NCDrzEz/0QJVui/76/tC9?=
 =?us-ascii?Q?6ExQ/wFwls3zGZsceJ+7eL0DpN9/hS3HN+VXOwNlz8J+NggApQRPFU1OAhDH?=
 =?us-ascii?Q?lGVWf7OXe35Yqa+eCey07q7zc8Q+AQ4TfM+OsgLSR6mLBAJCFdqJxBMO0tBS?=
 =?us-ascii?Q?XDl8a8xGSgZDaj3zrCcdJspptWIUJxAv7f+ynMUJHnQGQ6HS5c2U2jnsPCLu?=
 =?us-ascii?Q?avWUtYqbzhVNZSgErBhlKglV5asQw9Dq4oL2D7mHY0rUCp8r/AWxPWS14tM8?=
 =?us-ascii?Q?YBjYVE+p/BcIL1ElzLWi7e11JUsRcJqBYAe2BwNcZfBW2KY56o6FbIL5LJsH?=
 =?us-ascii?Q?3op6GG92yTj9vAFbLHLcfDqCnZ34EKz8kl1Zn/aaDG3x4tpcpEC1acOodJVW?=
 =?us-ascii?Q?2VpLLvaGu8WHtzCv6++O7bXZO2po+A0X7GqxWi0e2yEYbp2/J2pOV1IMGaMX?=
 =?us-ascii?Q?r1iDgSPXgo8NhbnKhG72Wzh1UZUV57Zqhh9E2UKqIBRLt9F3Qv2wUEqnO+t0?=
 =?us-ascii?Q?osaiIcHPZghQgGAR1dLPJCu6+LrzEx9VYgOMSv95Nhfvvpdnhvq5rN968fSV?=
 =?us-ascii?Q?QlsuQK3DxbIesQT9J6d//AXYVZG6a/Ju++Od7YRNKMal1huxHIkXcjxlvwj4?=
 =?us-ascii?Q?6UvdVnXLh95tCJuaJvVCHiHiiG1uon1AbObt2UhVrJWQZa4FONHj33bwf3vI?=
 =?us-ascii?Q?gcX1cCkdyBQLMQ9xGoZ36jYjDMmLwepZvC/3it1kZUp/cA3J8WUUXOIBwb0U?=
 =?us-ascii?Q?dPpDAZ1Ieeux8e6K74SL/uJ8alb4bDk+mhld+UW6W/Ue/xfi1syiNxxCMlWp?=
 =?us-ascii?Q?Pd19fmaYsBhCRfClEieS+tUlyZJFSDHWJIfthUfVonK26uxhplU2g9OT2V9w?=
 =?us-ascii?Q?FSraawq9W5y1pxF3TSKPBtU7Lx8JT54SpJm427UevrhYgXiVkjw3xjV1OqPB?=
 =?us-ascii?Q?nCCwz7Qmh+MROvLefEuQp4OoZ8C676nze1kK6cjY0/INrDtokbhqlBABMXnm?=
 =?us-ascii?Q?qhsYWBw0gnX56OpVL8xYRU0E//YEeR0yGBBABbnZG41vBj4faRIc21DlMD0k?=
 =?us-ascii?Q?tV8pMpwhorraK/pY7s4o6Ism/itQK2z/5SKCEPcFIg2sR+NzRNGAQ3uBouPm?=
 =?us-ascii?Q?vIdk6uVIVlx3AVNzopqqI+vZ6PNObhWeVWDiOBTEVRp5l7O9rKGQz0eHnsAg?=
 =?us-ascii?Q?GZa8lBXwYi5wZeEK/wWOfuGcaY9E0lo8lcUSpd3VzexxapDbGm4CFgcwpmgC?=
 =?us-ascii?Q?NrZ3trzcRRPyaJ169DC3j6gxkn7C+FfdJc8wwB4FmXpNoLmoZVmYiZRIRa3Z?=
 =?us-ascii?Q?pruBwcKuXqElgaPN28lp7koz91PEFqFumWcYqXns+W8RZ+fpAoLbg0otgtbO?=
 =?us-ascii?Q?Bss21OyxhojJGtRlERbjcOqH2uEbaUY6kHVE4+OgqizN7yXWRfcqhJ9Ub27F?=
 =?us-ascii?Q?y4OhrTWsS2hl6Wcuz+AhUAzaQU74uQN6KPRZPFRjtQq8vLhY3KDFvZ/UJumC?=
 =?us-ascii?Q?QbH8t4WriwuI3EaRoilBS4JoMlVzhwIbUIwnZ24G4kV9/JHHF75YKd86IkMD?=
 =?us-ascii?Q?jyF67RHhcXYsV2fX4nkjxh9DctwAwe4=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9dba01-8e11-45ca-e629-08df19976d94
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6560.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 17:23:48.0022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeqiCbtSV+NQyCKt7lWozgk8DvcEzBswNcsP/n+9YqLOMlrBOXHJZb1GvFPPULVBxTSL2pzwycZslmFTbwylPPMwGJ6TzF5J0+0CGRBUZ6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8402

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

