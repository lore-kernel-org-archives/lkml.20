Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A414E66D4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545515; cv=fail; b=TJndim0GPLtjP1FauvDobq4TEFIS01g8KLkopAtNkdfPhe9FWxX5LBb5P4i4JXkj+5Q4CZ52Brai96wXaLKoBTFn9UTFYqCKUrOjYQlpBcvfpwwzs3DiMTl5yDtzD4YHgjERSLnWoXjHjJ0IlmFFCJds4c/MqSQZL3xP/MTdcVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545515; c=relaxed/simple;
	bh=7/as1yeVlq+uuy1QUfgeyc0jtGa+zGdHO/cQz9fc5Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=prpE8vQrcj4zdBW471SnL8dbeFnH696UiYNs1iqITgYKdmmA95zRuoEnZ2NFZ3qOQRPKA4fOvRElElF7rEZJQNCXToYIX81BcKg5hVYH5BFaX5WDgssqpgFHUQrEgchEzHtTTaC17cgJY3+ea24BLQzi32mwvlgYXq/Za1kGCtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=ezijAD38; arc=fail smtp.client-ip=52.101.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="ezijAD38"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HiGoAZ1oXvhJ7AyWCWM+mx/TnPX5gV+s0+4UILKN8XOMd3Ilsn8tYs6oMgg9Uq342PirHING8eKFQawh08MfLwPra8DHSo5oY29/IYg7aB/DFR85T7P5/jMJJkDOEj/OegNqqPLmuNZ0kvgFomgyptcQYGHQLj5qYG7iM+ZlUv5ei7bzf+wEHXeIuUSQxpLLO20TFO30OKkkYHXzPVhLTGq7OJKC6UNIw9m9BQ/nZTOq1N7YzUfwZv5iK90NAp4W3nczOyQZfxCPF0sVQJSevAWB5jk6hX7aj937AVoMfeauA8dHygpzJZgsUaKdjhLr8+2RqFTwo7BgVDpW8rjQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfOHK1+28qr5sHuZXiKf4eCUKtjxgVbjtV+7Y85Ding=;
 b=m3enZ+YVqZR+0yeONxAmM7G7Sl6+xhuq3ycBNS2UOelybh0PlVpbDXLuiktrTh0OT0GaaVmZKTXSRtABWpimSsZe2kO5xBJpk/WO+IcXwy0iR7IoCyrdpjE1jvlgFN30QB/vZwiSjGvwagH+alSQGBdN4bXhAmSoU8NpON7tpZ9ya1MG6YT58bzc79yvCR3/UwiFuLcecWSAhYCbNS8c7vO7nToVLc2iPPg0AnaO5dKS1RPuWfRlZLmNb1/KPPAbVEIzZy78UZMJIcxNEucWx2sCs2+ygtdA3GN8FZ83kawt75MpBjtLlgJj9XNT70OZM3MjbyOE18T24ZpAmUlIZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfOHK1+28qr5sHuZXiKf4eCUKtjxgVbjtV+7Y85Ding=;
 b=ezijAD382D5uNGdM1p6N78HxTHWaCK9NZh86dsHcBSn6IKlC+vlYRW/bElWCBkwAnMb3MORrlRbLeBRJMjILWmGJt3MbWJ+JWZrVfHSrCr/YLLav4PHsRBnimeKzQaikfQ6wX0QIGvtGMpdPMqJDv/SU2gpnneeofgpogTq1dMkbP1AkMOJlXMUxtRHW5QWIyZQ7tSo+Hg7+FcbEl/39vHfBebsE8zwKnJW+W50Sk66nLo4dyiyzcRPyduYoYGgKrfQ2sJyskz5ARaL627VaHVPeN06d+VeR5vpMMZPhaKlmQQf5efK+vltIIoMdcVQrNnmcfyf7WNRswPSxSnASBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MW4PR03MB6555.namprd03.prod.outlook.com (2603:10b6:303:126::12)
 by SJ0PR03MB6567.namprd03.prod.outlook.com (2603:10b6:a03:388::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:11:49 +0000
Received: from MW4PR03MB6555.namprd03.prod.outlook.com
 ([fe80::c8e9:5e5d:afad:5eaa]) by MW4PR03MB6555.namprd03.prod.outlook.com
 ([fe80::c8e9:5e5d:afad:5eaa%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 18:11:49 +0000
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
Subject: [PATCH v4 2/3] firmware: stratix10-svc: add FCS crypto-service commands for Agilex 5
Date: Fri,  4 Sep 2026 11:11:43 -0700
Message-ID: <61ee16df0b34c032f457ca4b833d0171cd307da8.1788537447.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1788537447.git.hang.suan.wang@altera.com>
References: <cover.1788537447.git.hang.suan.wang@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:332::6) To MW4PR03MB6555.namprd03.prod.outlook.com
 (2603:10b6:303:126::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6555:EE_|SJ0PR03MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b14e0b2-3786-40a1-b506-08df0aaffd19
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|22082099003|56012099006|11063799006|6133799003|3023799007|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VnjybxjfTNpxmxjyvGMFV+mnzqDDchxap9fso4tbw00LBbOQSfb5S00ZbqWWAbqWtj98rgO4561ywp1a6kBIem332WAR0c5PU3nv+7tQ3hTwtJOppwqYGBvJVsWPxl8/LUcc2jf38NMCpYpvNoZBvotDusvfFBb3RDvZ0RssIL6t0oEI4D5yf5OvuVymUgyopb/lpnajJwmkCc0KdU7DBPcYCcLNtZFl7BmExuUw3dKPZcWivZ4sQ3An795iZ0zAtK7cVZWxg3kFra84/0Cd5nfflEZ+OwAHK+FP7i+KEl1lQ2wEDMJhg+gnVPaFZrmiaytJCNRs0Ev5QbZdWwoLOSHtgeM1HNoc+7lyKbzAVHzPRx0NRHa99dRpXWRNxQ6Nxf7p/YG8sr+U2pSpbtMPQ0iPQP9yYY/zSGrAaIGdBup+VH5k62xzBDzjMpi8yW89SohIOhulNddsmdSkb6V/33aelIzzCqb0yuWT0OCkXOab4LSHuNW5TgPHFTADeNNo30UDvFdoCWcdYIoIUVESZWZ+TyQ4G7QP99L8f04T+xnNFhGRrxA3RB4+DChpq3xZZf1tPVUb+nHDYHiSaJe3gs1iaHQiUOMvoGVan8gblgGW6I6F2sg4GYL4mtkMsNVlk1RjcpfxK8l+lTDe9sharn7Hh9ILu8YCOvdwEHFSjBU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(22082099003)(56012099006)(11063799006)(6133799003)(3023799007)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QTF9MFA8b0VnO06zMCXodyJehIU/X6HyYuFl3sjuQ6XX1+2/nXJ//wBTarI8?=
 =?us-ascii?Q?zO9nIJAm8xIU4fbby/RiPs4H2zzr1IjOGQ6S4OU/bwsQBfqmJgYDutjwMx0I?=
 =?us-ascii?Q?+jGuL6hwGe/3EJLkLSelYkyIM1o+jME1gQygB6TJW+3KdlhAvi+AalnaCo7t?=
 =?us-ascii?Q?SVsBZvlp7udYDAEnKQMg0aLpwo141D+ixkKtVWYaVduW6DQ/Yl9EUvTxgMZ0?=
 =?us-ascii?Q?H8Je4JJmxqE+LPfPwy6CzARE3PJ3M2MPMyElEq8A5xTda7RlKcivzz4RbAcL?=
 =?us-ascii?Q?2OFOlY1qJ4S8Vo2fltuMKq1AL6sFHzxERoz10QMQeDmY586oYF5HQfZTB9q0?=
 =?us-ascii?Q?//PR3QyVnf14jCIG8ZCU0X4y/mjXDTRloe6KH5Z6kNDtIDw4Kc5N1PxPPpZj?=
 =?us-ascii?Q?EGk9pue0qAkUTC54p1LSN+0EdNUriCKWDeKW9wbondnoRYRT9sIQNli2N8VA?=
 =?us-ascii?Q?F74F9188L8Wq1hsNmp/z68xG83QUJORblf0i+1vr1ENfsqXK6uEX3T2gUabK?=
 =?us-ascii?Q?w2atafqs7v7iwe0BHiAduo+jjTBWMRlTW8LRUEsrazwxc0eGqJvyY8t5i2Bv?=
 =?us-ascii?Q?s2hOu9SiqgaQ4C6PwC1SnUCYtpySfGYJxx66cy1ZhANzV80NycDJhSfYK1n6?=
 =?us-ascii?Q?vT+flMex5ctYixsbcRhuyCmzi0d8eDfheOaKonvbzt+abYn+LqiIBl9KpeA5?=
 =?us-ascii?Q?L/dOg0KaeJdLPd6IwYvmYABO9cjRDJzSPAG6yQnw5Iu5swP37ZrV5g/SnlTp?=
 =?us-ascii?Q?O4vRksVBZEaP2dq6CguKmJniD4xJhv1TxIuy1NSbB1ekP7BBvUZ7uQtwXyZE?=
 =?us-ascii?Q?hbyBMlHD6Z3SB9ZlDJReRCcUrcyhRNiM0iccUlzXD7D1ERnvRCZd0FAeP+XR?=
 =?us-ascii?Q?IdXBYTEGJW8riHTTr43sUKDD9zH3Gx3eZwhr5TpkvB5XRBDjBRKeroRRyBlU?=
 =?us-ascii?Q?OwgvARqtShAid4u5X1uhGWk50bIupy78m5Se7rlKwegQ4zVpcNmbH3GkelSH?=
 =?us-ascii?Q?uf+OHvaMXBnLxO/eSCts8nyc24/amJNL18RL6x8lCSZo0H6wZmQ1slr5UG+u?=
 =?us-ascii?Q?6hNeBs63hBBJmUS10SJhfSFtD0CvDxXXoMhObjdb7gZ8UGRuwdt2lcLUCGyQ?=
 =?us-ascii?Q?IKWVqBgNLBGJKnY0TcKQnnPoJ8yRL9Ie/5voqyijGUFcPaGRMyh69QXBHr+7?=
 =?us-ascii?Q?n3blcEU7sUzalCmXtFWd/IH+FqnQDIAeEjnjnN/OPIsvvgBBA7dVMZNI66B8?=
 =?us-ascii?Q?Dj3JQNFDZc8F6fkM0TVPBXmT53JpYJYuC+yeVXd6tHwfA8ZmQnpSbOvpzi0S?=
 =?us-ascii?Q?biLtJ22knHd9Bx2AxkLAHoER9dFvJIk2Ul/0duDgNshSY3rY5cY+4g78GWYn?=
 =?us-ascii?Q?Zr9dXzSGgUhCN2dN9aw354NofIYUEncs/MU72/ZhvqY/sdYEGba08XPVuM5w?=
 =?us-ascii?Q?XE+trH1jayhGbQx/rBQsa+r5Oh6WjelPmOF4PUqGHFYbSXXy0sPISST7Hxy/?=
 =?us-ascii?Q?PBBOnqJpvW8jDvY2GIatRG/fga4pea+q2InVP1QmtyVDiuQInVr7Dx3fuW0U?=
 =?us-ascii?Q?6+fL7pYuCf3lAAT7e7M3If3dFMFJnn4gU4p/N29jwU5TRKNNxiAY4eMrw9VS?=
 =?us-ascii?Q?Bsa1Ai0Sftrc0cQ66CHk11HdQtwICR4lKGdLf0ma5ac6DqKXsHTQP5PFUnkE?=
 =?us-ascii?Q?6+GuYNUOjsvELtysRUpmwSAEZfvOIVjGdp4RJo3GKRhF/RmS0PcexmIiKRVF?=
 =?us-ascii?Q?cSKBV9fovqEAl96IkJeVnjZsW4YjROQ=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b14e0b2-3786-40a1-b506-08df0aaffd19
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:11:49.3696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6z/VX75sjICAaTU8OjYR3YtdrxuIWudae1rQJGlyIgBFSAcUfbENFS+9w+lkI7dOijFgW27u33zPvXeVk3ifc0uX6C4h8Y9/XrkmRWthgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6567

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

