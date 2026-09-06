Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010050.outbound.protection.outlook.com [52.101.56.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13C6154425;
	Sun,  6 Sep 2026 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788700802; cv=fail; b=SxQl6XY5/ozMRGGFOUbc4/iTAdWyTDkVYk97fNOYVD7XQARZgt2NmXmn8JKW76DWQKvbklwhneeInvdJDIz4BkWLU0j6Xp0xoJNYnvjCrSEh3F5O51XnCNeD1wKFrfJzN/2qB9XNYReSLR1vBn/xr1QbE+HdrOa4UVtkaj+pSZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788700802; c=relaxed/simple;
	bh=OnVwfAhJqMM+Y4HHpxrBi/6omiOCxVZS+TyABOF10w4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bOv3/7ZgbFcFz95nNPkHL+5JWT4weJWX9Ey6pV7SnqNMWAgNgfXAmBQFhgWEDNXs6Fymcsi4eymWLO6cg86iKBCiQio7CnCg/GZFFgUhoIvZko8Kd9McNK5T33qQVaiADbYuN5iD/jIR/ODA2tkDlgmCuFSLECpOmUIkBa98xlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sT84WhiM; arc=fail smtp.client-ip=52.101.56.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sT84WhiM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3BF8C4qWvb4TuWuizPV8RTOHq4YpzkDXx/snMLkiutacqHUulX/X1Y5dfpfu1GWdNUP9TgKDUGhDlZsrOURLoLUdV3AxP+XdJ6YgSwLiDFZJafx4lIwBkaUwnDLnu0uTC6uhn+Xu8QfdzS1FZp3Vflp6CdzJ/mdqB2klt576meGaOp9UHvvmEr12rwHVeYqkYccoTK+UyRw+IdPU3C1fg6xyIxRlBPIcKx2cmRzOAWy+52GxIrP9pHxdmydQqxAPF1TTCBVgy+9pB4v8WgA3QGPfyX59h6eBaCEJFPf143Wi9Ns9CmL0na+CrgW82rDuUY7zY2RxRjBh/DyUBoLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ngp101TUiB08ZPPwIR3vQlUxtAb4LjVKxEhpstGb9yI=;
 b=t8bZlLidH1sBFmRpubKKtLzVK65eMnHsO9tpLIqtpgKWGI8w8IWH+PCAnR10s7HOBjkrVDFeD04cSAyugJ9mjtwk33RJeL2BAz3tKt4d32ywRzNrWSTKoubit2S4aLUfZFDIIiJ3ZN9Nqw2QZlYS2aJsdpPx4AMlm6feHNhKsXYEnrUzvG3fw2p/ma2Qwje4nPOO83MK+EqzbUgraK5v6v0zqq81SWJBqx/6CWq/iwceo2za+bhfXO0gkxTuFDeuemv+RcJuC5eZ8dOlBBGnkiRIbxBYXCijI1M+jxToKzgzOB9jrhwV1wNN3DjyjkNUDjR2O0YyLJ7UuGz4h4/DTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ngp101TUiB08ZPPwIR3vQlUxtAb4LjVKxEhpstGb9yI=;
 b=sT84WhiMeQCV5EmWoYCtwdyEDA6JEBBOg8Z8zUrIyXJmBzmojEgnvuE6mK/4JdRJ/+7yk2p11X5DlB5ncPxpjH7Ocv5/z/faEdQMBZ1hBG5tAufxFRWG8gU39TPzjNkzIoJSi7uWGflplljWKIkFOQvcJCtbiA/e/hSZPVtOcE4=
Received: from MW4PR04CA0259.namprd04.prod.outlook.com (2603:10b6:303:88::24)
 by SN7PR12MB7418.namprd12.prod.outlook.com (2603:10b6:806:2a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 13:19:56 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:303:88:cafe::5f) by MW4PR04CA0259.outlook.office365.com
 (2603:10b6:303:88::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Sun, 6
 Sep 2026 13:19:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 13:19:55 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 6 Sep
 2026 08:19:54 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 6 Sep
 2026 08:19:54 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Sun, 6 Sep 2026 08:19:52 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>,
	<sven@kernel.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Radhey Shyam
 Pandey" <radhey.shyam.pandey@amd.com>
Subject: [PATCH v3 RESEND 0/2] usb: typec: tipd: fix uninitialized typec_partner_desc on stack
Date: Sun, 6 Sep 2026 18:49:40 +0530
Message-ID: <20260906131942.83153-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|SN7PR12MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e60993-864b-40ff-493b-08df0c198acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|56012099006|11063799006|5023799004|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KrJXSuUx6Q084Lmo531MtyvdoLca0ho7y/THAJbPKtazLPwqbyMfzPIvjGY2Vtn107bzpnkzg1FO9PliP1lqvSn2NzKRYCS6ZpJv/trkfj4NSyErsrtan37/IXysLr8+BZ3et2tZajvAvmZPJ+LvqGgYWZZRygL2FRBA4HIePyWw6r3Fm1jUqxhw3wBYdytKbku2pS7CGo8rc/qp0GZ5lCn/ccJRQHzc+N1csuQLgqkEI/YZlRnHPII3wOeDUPjghVjhF66a+PcWYsVTW+a5nU7cOFwb6rCg3XYXWbvD9Ke52ox+JRB6DuU1oUm0kfWtghYCdbvMykmDkDnyJJconX5FKBo+WbMNKvMW9mUl2yPWLfRTDBQ+YkdGZOiZ78xrjc93viXTl7yUPhPd2zCmYMpK9QXr+qCCQGla15NY/mebfv7C5x7ZsQuhNGHqTVAodvxqUfSVXDW10pnRRs2bXEhLfJSJN0DQ/33QgkCmsx4R9tBaPSCd+tyucBdlLCCBhiNlwwdva3OHGTCOhkFAUZrz+22daAf0dgeGeZf3yLmKrPv8pM+DfqdB0d0Xv/VIg5tOraWQqFEbbO14+siqd35G3Imbv329XitQdl79GTrbZbinPaouIcJefDujttJJ4hrJeOOZTlAGT5txDFePsctuG5jj8PUeNNy2ZtJGUXTKSp2bUIhhHnXsrw6ML286sk4SGp4eTf6wTLpoIIchBQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(5023799004)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OJRFpsOK2n2VGamnN4REgpSf7oNXyxugCAIQsm4qlCBpWieoRPx6J0JK/wYTcQbzazfGriJaRWm4qYZDm1bPugNTZKaItsWcVkL/BJ2UNBhYM2ZTTKKj4NEtAxX1nRLFkJfBR4iKBNgZg5n9SuvwDVCuP88nskhHJYr+QpHXivCXMYpUVJo6ELUZuAG76xHvGSBmpTCAfD6kXw9urCFDc5gZTm8aeHG2mZap+RzB231x1lkClEtM5TtE5cJmgq5GLOpxU902nM7+xb09ufZQA53iLNgMsRBRjxDBbz2KUeKKJC0gy5mc0LA9R78aWRATxw4f31xrvVxm3EpQ2bQNTyBv99lSkv1vbZEekvqFQSsyZvHE//+QSZ6KAj5V58C5FYyz8wET56vwHQNGJ/WL6XURNAOHU0ktZPi2qHeoKMlzO81q8kJ/wssCuLTr1STv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 13:19:55.0849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e60993-864b-40ff-493b-08df0c198acb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7418

tps6598x_connect() and cd321x_update_work() pass a stack-allocated
typec_partner_desc to typec_register_partner() after initializing only
usb_pd, accessory and identity.

typec_register_partner() copies attach and deattach from the descriptor
into the partner. With those fields left unset, garbage function pointers
may be stored and later invoked from typec_partner_link_device() when a USB
device is linked to the port. Uninitialized pd_revision and usb_capability
similarly leak stack data through partner sysfs.

Zero-initialize the descriptor in each call site so optional callbacks
remain NULL and the remaining fields are zero.

The series is split into one patch per function so each fix can be
backported independently with the correct stable prerequisite:

  - tps6598x_connect(): Cc stable # 5.15+ (core.c, v5.13)
  - cd321x_update_work(): Cc stable # 6.18+

Changes for v3:
- Split v2 into separate patches to simplify LTS backporting.
- Add stable Cc prerequisites per patch.
- Drop Reviewed-by tag while the series is split.

Changes for v2:
- Add Assisted-by tag.
- Remove explicit identity = NULL.

Radhey Shyam Pandey (2):
  usb: typec: tipd: fix uninitialized typec_partner_desc in
    tps6598x_connect()
  usb: typec: tipd: fix uninitialized typec_partner_desc in
    cd321x_update_work()

 drivers/usb/typec/tipd/core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.43.0

