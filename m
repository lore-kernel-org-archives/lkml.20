Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010039.outbound.protection.outlook.com [40.93.198.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC4E52268A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098727; cv=fail; b=NZt2FAT9PSjuEMw5uH9jTfwekEsvMy9HElEbFlaogJNMpSMxOYwmvVpkT12wyK0KAFHpoRj1PyVl9iUGaHxAXhHUPmK+keob9SrjX9znjH1FBsMTHWLg58FV6luizPUdp47XxC7hVanJ+VXp3h7Rpab44zvPwKP2nBn2HhnISaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098727; c=relaxed/simple;
	bh=rSHwjfxfKYP8s3mitpHh1ciIwHsOxAGe8ktzlVvBAyk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uJTsIbafx+fQBr8E5s3eK2AkgOnzrWSaO2VQWW8TdD+ZISFXPnN38ZhzeivAMXsgUGjnyBoOIW8BwhYC+TZ+5hH4RjTBSc9l9eoPQ+14oo/wqO5Bhc53UnseJEKmE0pRuzPOCxz0r8nQ/r9EyNLSxM77jfQ9p87LQvpPt9Ch3oQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=d5swpgj1; arc=fail smtp.client-ip=40.93.198.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="d5swpgj1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQCGkwu+PwWcNquykC63Zz4EmWMVy1Fc9z7SJSTCdjdfX04+OcmxYZEx/Ckx92GuyNgGOF9QgboH/jYuMMsRosHnqxIXUwSbw0pcyI8IcB3itnWsPLp1d9plLGPlMPC6tzfufXzOFguh1FcxzGSP/gDZIU6EwlHxgz41rM0vvvteDQOb5db9QcxHs8i0IK5d8U1DFSz+6BlFwhSV/LHaeSlR3p3LtzG7Iz6GubiwijdrlkO+MP72EaxPitEWy7/Fs+zGtCMNacFOlC10KeR4OQnYITSg8fWaoCF1NirtBNx7CVrjLy3hjSZ1kQjavItm+C2aUbJDl56mdltzEvLXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vre+OISj635JgQDKg31hknUoV1WsC43lutc23lYCfQk=;
 b=aXNckg3MqHiCru7QfsF+ncF9U5b7K81zA4xQKIWnyNR8e48ivEApskO4Pdfzhs1WKH+tdyk/pwNpGIYhlhTqWJxYhwVTxbQ5dO3Nf1EPVgZhumomk/J6V5HIe0Ll6y5SOHSR5EwtBfBAnPc2tX8weMO8UwDnLcaCmTDLFg/1h7MVwTgZxtW0E5hLPxWhddPxaTQy3WvYUBXwRl6KX1Wg0620qpQI9nfQrkR4YxI0VbWUFj51QTVyy84zpfMLwvGll/YuV3bYBvdS6xfm1xubelIbKTv+ko7qbdwIduCnvZKdm5YCCQXb3fXabKIy2iZXPo3mGRbCb6XOOA0ixl0BVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vre+OISj635JgQDKg31hknUoV1WsC43lutc23lYCfQk=;
 b=d5swpgj1IJOTeiBO2D4Lgh6U+piNocOUuNh8cicxT95iXf5LWrT9lIgRRoCK0pMgKeYLL+p8ZglcS8nYnEQFPReU5qavdeRcjUk8pZwWkqnIXfhPUaBbYBRrBS4WaxIcLdS6EFmDsdpPzjcQsZlmmR4YkEe/fIChRCp+fwyeRhRMHpVdu6VfzQZDBjZUk9x1cuw/mzsrfF4LIcINCtCRf/13V3yOLGqth5bnOERNk0nH03u7pkJuOmdq7wHyitAgsRKqH+q+MI+7A7k74zQ6cBX74PpYfnupHF2RfqxvKH4lZvdU4g34BvhgGJ0kP2+pusaikog+7rB5NFQEjen+GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by LV1PR03MB989680.namprd03.prod.outlook.com (2603:10b6:408:2cf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 17:38:42 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%3]) with mapi id 15.21.0428.014; Tue, 22 Sep 2026
 17:38:42 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH] firmware: stratix10-svc: accumulate up to 4 FPGA config buffer claims
Date: Wed, 23 Sep 2026 01:38:32 +0800
Message-ID: <6eeb2d279133ce2c032ff8f51368f568a3e403cd.1790098359.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR03CA0003.apcprd03.prod.outlook.com
 (2603:1096:4:297::13) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|LV1PR03MB989680:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2cedc2-359c-40eb-ebff-08df18d05834
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|18002099003|55112099003|3023799007|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	9shC2n2lvZ1VEjU+b8HZVNOBu9/dxsehA8Me1ZHa6TVdpCF9eSS9DN04MtAfjYjy/Hv6pd4ylwpg0B+mjU3AhAWZbM2yWHYkekPF6vCTpHyzfA2euMiolDGLf8ZT5jENgdfsTrhwtKuZi+aYudGmpP0pweKXMbWofmyd1ZqmhD+CO0Uba+KqiID/JnCPD4PJAFxQvJ2XrJ4tNcKkjguvqovSVGLSpHSUturd0ikoLBzx0hasbTcgZXAfId1c0/c8C8jpNVDo7Z5u7+Se0svrp0RfQ+EoEJRG4vl4RNFa2pcAy3yZuP5Vz4UEzUyuSR0LZjTJnyKyZEDdHyUUVaUJp2496lI7Rg/7wGNq5LL4KmmuXXL81xDh/lNf9vS1Lb9fvTJXWnjxWyFAznEZIKwFkbQVbYFnMlrQJ6Hn8tyVotzUR9IRHlIArk+9C2KgK3pugoG3lfrhB4FCbVYMQXjM4Xp/E5wcLdzQqDHQCZkqMMqxzcv/3MxQrd+5zotS6fpx35AbCliuRu5aiSRbCVxQO9VjcRK+3T2ZTE6qyLagILOgAtB1qAewQyH1wdNNKku5fJYP3i8KSSeK5eYeDv7P+QFW5j1KNxoixGzWQOjtEod9cqe2Kq+I17j5+GmS9m/nocl3J9geFik8kWLYIBdC01M/oeg106GaeFEJAtAUaro=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(55112099003)(3023799007)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XuHBN8WThXr03nDSNoUhnb+ksxfhMkU4oDSwY+KgSFrEYiXos3SqWdVJqaGV?=
 =?us-ascii?Q?gj7aNgqeRnIAZmVCaazrVkbIeHyEIo8M7w/ssaiRRq87uoG2KWva0DSABGtN?=
 =?us-ascii?Q?/XSAtLPDTzEMrJt9+0wUDqCACuFoa50OWXpkzlbB6VVDXPhOwBuky7BVMZN2?=
 =?us-ascii?Q?p7loSSyqO4bD53D75d5qttjC66gm+TDakR7wy6d4y6gD2Y2j3KelruNEMWF8?=
 =?us-ascii?Q?Xe5v26XJaHmxf73nFmFNego2ZXklnRk2uAygjR9wqacbYGq8hiUzlUpDB+Ca?=
 =?us-ascii?Q?p1EzgrYutJXvXwQmHxh5phjQxUe1DjnULg2fbdRwAY+JyxCNLSQsOVR59k/H?=
 =?us-ascii?Q?KC0iY+188lGfs+irMVk8mAT9+WOYJpEf1pwRh3Vcf1EAlAEZf7MrVu6DP5YW?=
 =?us-ascii?Q?iSeCAQG8loAVhmZvQ9oyHtTK4QS/++TsHRyJWxer5B/rwMNDoWiH2OpRLAda?=
 =?us-ascii?Q?+eRo/sz2FlziNGMEPVU/LOYcLeWNNvlO40fFNH58KaCgfuzmlyOPZjkKqDpL?=
 =?us-ascii?Q?zkJRssHccop+jarcfZ+qnDrs7BhBMeUBtmp+IJCukkgNtkJNr8aweS325gen?=
 =?us-ascii?Q?uzqq872FXhYfgGbmwAZrvnp2kpskprLvOUBDQ7SDnUKomP1NT7wujXZOlhaK?=
 =?us-ascii?Q?yUjd8dBzdg6ynoOvFRCEPUheQi51Gkgzk/vrl+6eXKn44Tp3k7pq15Kb7ISh?=
 =?us-ascii?Q?Sjcsf0HbnKup6syZIG1qCQ3K/2qENX6a0MYoAVMcHSAkblZHSD4yXH7jEcVJ?=
 =?us-ascii?Q?l3WWzG6l2B4kQ/kHpDvGeHnSYJIDKFpeoRSrYhgZqXzU0RMhKK9dtjFpJ/tP?=
 =?us-ascii?Q?GUGObAChFEoHhgGCes/T9vCFDLQtdq9z3JN56uU5PQziiJOFtY80x5NFyart?=
 =?us-ascii?Q?zDKDjZhUWNz2jSK2b6wU1+ANJkX5N0QgD3t/tzCr4G1+7dSZu8ZnUavRpRvy?=
 =?us-ascii?Q?+OSodcHdLojXw3mCo03WI0pROed5kyu3UsQh8s20eb713p6VkybQ7MEz3nXC?=
 =?us-ascii?Q?9ACAeSl6NbFuJEZEKbsbLSvIC/P/tGz+9++FUUvkxq1j0noPdusnnR0rEdJ3?=
 =?us-ascii?Q?xVOLFFhgzgzjkGl8UIJjphAfHO21slfvDJuGBf9OPTO3mAuI2tfn5iTQW0rg?=
 =?us-ascii?Q?KfNiSwKGOx8gcap89NtsWyDCNB9Rcol9E+cz7Xy3Tpa2sC/Xa5emgzbSdolF?=
 =?us-ascii?Q?d84X/Wk7HbcDjRBWuG/raHDO2Dm78nbgKA4IsdUjCrjt31isVoBrAF3CqM2i?=
 =?us-ascii?Q?If4DHhCelJf1QowGWBEvaBT1GpbkbA5YCXo3YkPE6YMc4Q0LupeDo/y6ZXta?=
 =?us-ascii?Q?pksx+gkw9TQeloUzfuaNaOYXBRF3u1+D7nASRMFrpZsmPZ5MnpgqraIiEuF5?=
 =?us-ascii?Q?Xs2LC0XXU3rmnH0LYm2LFL4xB+doDMTZJSmWpKLXSGQP7mmAvxutpaJAUaZM?=
 =?us-ascii?Q?jyx1RwnPCfxoaPLeTiicg9IffX0e2Jc6F/na/WdrK8cPSY99+JkXfIn1QRgD?=
 =?us-ascii?Q?iAhu9v3S3q9vPSNkoAmPQdXXbEC+qO0TxZYFaP71VzW66QWKJRl5S2OhVQ5q?=
 =?us-ascii?Q?jjbiErna9jn1bRoiat7GNj0pHDswaemQlcnJU0Pu1he75No+Us/Eh6QF911l?=
 =?us-ascii?Q?cbqMU9iOwN1LJqfyLLH162KrqTnJDbFv1NPsDUET42PArQOYP0EDyG+CX9EJ?=
 =?us-ascii?Q?I2VpW/3j68iSfWzjPm3xmz6CWG2T6nbvJpntpnS+c1K+HTxY1BAlhugQp0vm?=
 =?us-ascii?Q?dTjuhywl3dYhrDnXAqx1xx0rCwn1hD0=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2cedc2-359c-40eb-ebff-08df18d05834
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 17:38:42.4128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Alf2rwU1hHFHyXMte54eKGfoZFIotzYYhaI7buTYeearrzEaLa/DaDzYwe1JZEn9p13oZoww0+Y5OGSyHKjkHNFxCg3fpMMpNh8ldFfsXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR03MB989680

Each COMPLETED_WRITE SMC returns at most three addresses, but the ATF
FPGA config pool holds four. Calling receive_cb(BUFFER_DONE) on every
SMC races reinit_completion() in s10_ops_write() and can hang until
S10_BUFFER_TIMEOUT.

Accumulate addresses across SMCs and deliver one BUFFER_DONE when
firmware sets res.a1 == 0 (end of reclaim). Empty reclaim skips the
client callback. On early poll end or claim-array overflow, return
already-collected addresses with BUFFER_DONE | ERROR.

Extend stratix10_svc_cb_data with kaddr4, unlock it in the FPGA manager,
and clear it wherever kaddr1..3 are cleared so the reused cbdata object
cannot leak a stale pointer.

BUFFER_DONE | ERROR requires the fpga stratix10-soc harden series
(ERROR checked before BUFFER_DONE).

Depends-on: <cover.1790090287.git.adrian.ho.yin.ng@altera.com>
Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/firmware/stratix10-svc.c              | 109 +++++++++++++++---
 drivers/fpga/stratix10-soc.c                  |   1 +
 .../firmware/intel/stratix10-svc-client.h     |   2 +
 3 files changed, 99 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index f7928ef6b6db..9dc621b15cbf 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -46,11 +46,17 @@
  * FPGA_CONFIG_STATUS_TIMEOUT_SEC - poll the FPGA configuration status,
  * service layer will return error to FPGA manager when timeout occurs,
  * timeout is set to 30 seconds (30 * 1000) at Intel Stratix10 SoC.
+ *
+ * FPGA_CONFIG_NUM_BUFS - number of FPGA config buffers in the ATF pool.
+ * Matches NUM_SVC_BUFS in the Stratix10 FPGA manager. Each COMPLETED_WRITE
+ * SMC returns at most three physical addresses (smccc res.a1/a2/a3), so a
+ * full pool reclaim needs more than one SMC round-trip.
  */
 #define SVC_NUM_DATA_IN_FIFO			8
 #define SVC_NUM_CHANNEL				4
 #define FPGA_CONFIG_DATA_CLAIM_TIMEOUT_MS	2000
 #define FPGA_CONFIG_STATUS_TIMEOUT_SEC		30
+#define FPGA_CONFIG_NUM_BUFS			4
 #define BYTE_TO_WORD_SIZE              4
 
 /*
@@ -396,6 +402,29 @@ static void *svc_pa_to_va(unsigned long addr)
 	return NULL;
 }
 
+/**
+ * svc_data_claim_notify() - report claimed buffers (and status) to the client
+ * @p_data: pointer to service data structure
+ * @cb_data: pointer to callback data structure to service client
+ * @status: SVC_STATUS_* bit mask for the client
+ * @kaddr1: address of 1st completed data block (or NULL)
+ * @kaddr2: address of 2nd completed data block (or NULL)
+ * @kaddr3: address of 3rd completed data block (or NULL)
+ * @kaddr4: address of 4th completed data block (or NULL)
+ */
+static void svc_data_claim_notify(struct stratix10_svc_data *p_data,
+				  struct stratix10_svc_cb_data *cb_data,
+				  u32 status, void *kaddr1, void *kaddr2,
+				  void *kaddr3, void *kaddr4)
+{
+	cb_data->status = status;
+	cb_data->kaddr1 = kaddr1;
+	cb_data->kaddr2 = kaddr2;
+	cb_data->kaddr3 = kaddr3;
+	cb_data->kaddr4 = kaddr4;
+	p_data->chan->scl->receive_cb(p_data->chan->scl, cb_data);
+}
+
 /**
  * svc_thread_cmd_data_claim() - claim back buffer from the secure world
  * @ctrl: pointer to service layer controller
@@ -411,6 +440,10 @@ static void svc_thread_cmd_data_claim(struct stratix10_svc_controller *ctrl,
 {
 	struct arm_smccc_res res;
 	unsigned long timeout;
+	void *buf_claim_addr[FPGA_CONFIG_NUM_BUFS] = {NULL};
+	unsigned int buf_claim_count = 0;
+	unsigned int n_addrs;
+	u32 err_status = BIT(SVC_STATUS_BUFFER_DONE) | BIT(SVC_STATUS_ERROR);
 
 	reinit_completion(&ctrl->complete_status);
 	timeout = msecs_to_jiffies(FPGA_CONFIG_DATA_CLAIM_TIMEOUT_MS);
@@ -422,23 +455,52 @@ static void svc_thread_cmd_data_claim(struct stratix10_svc_controller *ctrl,
 
 		if (res.a0 == INTEL_SIP_SMC_STATUS_OK) {
 			if (!res.a1) {
+				/* Firmware: no more buffers in this reclaim. */
 				complete(&ctrl->complete_status);
-				break;
+				if (buf_claim_count)
+					svc_data_claim_notify(
+						p_data, cb_data,
+						BIT(SVC_STATUS_BUFFER_DONE),
+						buf_claim_addr[0],
+						buf_claim_addr[1],
+						buf_claim_addr[2],
+						buf_claim_addr[3]);
+				return;
 			}
-			cb_data->status = BIT(SVC_STATUS_BUFFER_DONE);
+
+			n_addrs = 1 + (res.a2 ? 1 : 0) + (res.a3 ? 1 : 0);
+			if (buf_claim_count + n_addrs >
+			    ARRAY_SIZE(buf_claim_addr)) {
+				/*
+				 * Protocol violation: more addresses than the
+				 * client pool. Return what was already collected
+				 * with BUFFER_DONE | ERROR so the client unlocks
+				 * and aborts; do not issue a second notify.
+				 */
+				pr_err("%s: buffer reclaim overflow (have=%u got=%u)\n",
+				       __func__, buf_claim_count, n_addrs);
+				complete(&ctrl->complete_status);
+				svc_data_claim_notify(p_data, cb_data,
+						      err_status,
+						      buf_claim_addr[0],
+						      buf_claim_addr[1],
+						      buf_claim_addr[2],
+						      buf_claim_addr[3]);
+				return;
+			}
+
 			/*
-			 * The firmware COMPLETED_WRITE response returns the
-			 * raw IOVA (without dma_addr_offset). Add it back to
-			 * match the key stored in pmem->paddr at allocation
-			 * time. dma_addr_offset is zero on non-SMMU paths.
+			 * COMPLETED_WRITE returns raw IOVA; restore offset
+			 * for pmem lookup. Zero on non-SMMU paths.
 			 */
-			cb_data->kaddr1 = svc_pa_to_va(res.a1 + ctrl->dma_addr_offset);
-			cb_data->kaddr2 = (res.a2) ?
-					  svc_pa_to_va(res.a2 + ctrl->dma_addr_offset) : NULL;
-			cb_data->kaddr3 = (res.a3) ?
-					  svc_pa_to_va(res.a3 + ctrl->dma_addr_offset) : NULL;
-			p_data->chan->scl->receive_cb(p_data->chan->scl,
-						      cb_data);
+			buf_claim_addr[buf_claim_count++] =
+				svc_pa_to_va(res.a1 + ctrl->dma_addr_offset);
+			if (res.a2)
+				buf_claim_addr[buf_claim_count++] =
+					svc_pa_to_va(res.a2 + ctrl->dma_addr_offset);
+			if (res.a3)
+				buf_claim_addr[buf_claim_count++] =
+					svc_pa_to_va(res.a3 + ctrl->dma_addr_offset);
 		} else {
 			pr_debug("%s: secure world busy, polling again\n",
 				 __func__);
@@ -446,6 +508,19 @@ static void svc_thread_cmd_data_claim(struct stratix10_svc_controller *ctrl,
 	} while (res.a0 == INTEL_SIP_SMC_STATUS_OK ||
 		 res.a0 == INTEL_SIP_SMC_STATUS_BUSY ||
 		 wait_for_completion_timeout(&ctrl->complete_status, timeout));
+
+	/*
+	 * Poll ended without a1 == 0 (timeout or unexpected SMC status) after
+	 * some addresses were collected. Return them for unlock and fail the
+	 * transaction so they are not leaked.
+	 */
+	if (buf_claim_count) {
+		pr_err("%s: reclaim ended early (status=0x%lx, have=%u)\n",
+		       __func__, res.a0, buf_claim_count);
+		svc_data_claim_notify(p_data, cb_data, err_status,
+				      buf_claim_addr[0], buf_claim_addr[1],
+				      buf_claim_addr[2], buf_claim_addr[3]);
+	}
 }
 
 /**
@@ -468,6 +543,7 @@ static void svc_thread_cmd_config_status(struct stratix10_svc_controller *ctrl,
 	cb_data->kaddr1 = NULL;
 	cb_data->kaddr2 = NULL;
 	cb_data->kaddr3 = NULL;
+	cb_data->kaddr4 = NULL;
 	cb_data->status = BIT(SVC_STATUS_ERROR);
 
 	pr_debug("%s: polling config status\n", __func__);
@@ -533,6 +609,7 @@ static void svc_thread_recv_status_ok(struct stratix10_svc_data *p_data,
 	cb_data->kaddr1 = NULL;
 	cb_data->kaddr2 = NULL;
 	cb_data->kaddr3 = NULL;
+	cb_data->kaddr4 = NULL;
 
 	switch (p_data->command) {
 	case COMMAND_RECONFIG:
@@ -599,6 +676,7 @@ static void svc_thread_recv_status_ok(struct stratix10_svc_data *p_data,
 		cb_data->kaddr1 = res12;
 		cb_data->kaddr2 = NULL;
 		cb_data->kaddr3 = NULL;
+		cb_data->kaddr4 = NULL;
 		break;
 	default:
 		pr_warn("it shouldn't happen\n");
@@ -677,6 +755,7 @@ static int svc_normal_to_secure_thread(void *data)
 			cbdata->kaddr1 = NULL;
 			cbdata->kaddr2 = NULL;
 			cbdata->kaddr3 = NULL;
+			cbdata->kaddr4 = NULL;
 			if (pdata->chan->scl)
 				pdata->chan->scl->receive_cb(pdata->chan->scl,
 							     cbdata);
@@ -870,6 +949,7 @@ static int svc_normal_to_secure_thread(void *data)
 			cbdata->kaddr1 = &res;
 			cbdata->kaddr2 = NULL;
 			cbdata->kaddr3 = NULL;
+			cbdata->kaddr4 = NULL;
 			pdata->chan->scl->receive_cb(pdata->chan->scl, cbdata);
 			mutex_unlock(&ctrl->sdm_lock);
 			continue;
@@ -916,6 +996,7 @@ static int svc_normal_to_secure_thread(void *data)
 				cbdata->kaddr1 = NULL;
 				cbdata->kaddr2 = NULL;
 				cbdata->kaddr3 = NULL;
+				cbdata->kaddr4 = NULL;
 				pdata->chan->scl->receive_cb(pdata->chan->scl,
 							     cbdata);
 				break;
@@ -929,6 +1010,7 @@ static int svc_normal_to_secure_thread(void *data)
 				cbdata->kaddr1 = &res12;
 				cbdata->kaddr2 = NULL;
 				cbdata->kaddr3 = NULL;
+				cbdata->kaddr4 = NULL;
 			} else {
 				cbdata->kaddr1 = &res.a1;
 				cbdata->kaddr2 = (res.a2) ?
@@ -944,6 +1026,7 @@ static int svc_normal_to_secure_thread(void *data)
 			cbdata->kaddr1 = NULL;
 			cbdata->kaddr2 = NULL;
 			cbdata->kaddr3 = NULL;
+			cbdata->kaddr4 = NULL;
 			pdata->chan->scl->receive_cb(pdata->chan->scl, cbdata);
 			break;
 
diff --git a/drivers/fpga/stratix10-soc.c b/drivers/fpga/stratix10-soc.c
index b8ec2e6f615f..456b30064395 100644
--- a/drivers/fpga/stratix10-soc.c
+++ b/drivers/fpga/stratix10-soc.c
@@ -163,6 +163,7 @@ static void s10_receive_callback(struct stratix10_svc_client *client,
 		s10_unlock_bufs(priv, data->kaddr1);
 		s10_unlock_bufs(priv, data->kaddr2);
 		s10_unlock_bufs(priv, data->kaddr3);
+		s10_unlock_bufs(priv, data->kaddr4);
 	}
 
 	complete(&priv->status_return_completion);
diff --git a/include/linux/firmware/intel/stratix10-svc-client.h b/include/linux/firmware/intel/stratix10-svc-client.h
index af13dacdf5ac..8872003cbebc 100644
--- a/include/linux/firmware/intel/stratix10-svc-client.h
+++ b/include/linux/firmware/intel/stratix10-svc-client.h
@@ -237,12 +237,14 @@ struct stratix10_svc_command_config_type {
  *	firmware that does not handle this command), kaddr1 is NULL.
  * @kaddr2: address of 2nd completed data block
  * @kaddr3: address of 3rd completed data block
+ * @kaddr4: address of 4th completed data block
  */
 struct stratix10_svc_cb_data {
 	u32 status;
 	void *kaddr1;
 	void *kaddr2;
 	void *kaddr3;
+	void *kaddr4;
 };
 
 /**
-- 
2.49.GIT

