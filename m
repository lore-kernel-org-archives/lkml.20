Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A0B46F484;
	Fri,  4 Sep 2026 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518386; cv=fail; b=nGTghs4Zj104nwhwzpRBZEaVf6q2Wrobymping3HEDPNMlVzZs+52iObn14hMZ/J6Y9UD064RV40yr1WwrL1NDKWk3GrFlkov2uyHAb4BNZWb8UMsW3fb3McudNeAfCIU8rQh/uNGYDd6nd7C6FlGdReo4HYaX4e8zuNf4aaZKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518386; c=relaxed/simple;
	bh=7+2ArChG0mqwh2kaYpuZstC/krgsJuyPLFqOUeAG5t0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hV0sOQhqkSWi4BBo85hZiiYJRI14NW+7bpMFHvs/jKbdDYosHMvx88AKaaIi99+oZ5inTDJXTgrwmoZFRBuK5lC0CBIYsmh+KpE9oQnFOe0OGEcMX/Z35kQb5wZrlhsxVf6TJQpnWVRHmeRViYaWLQ21DKs/pspB5iTwomXnmzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qPrEAwkK; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cImtnqCT; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qPrEAwkK";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cImtnqCT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6844HUwH2479378;
	Fri, 4 Sep 2026 05:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=iKDb7Fao7SBQCy+S
	VvBruDv1pNXTIVf0Qdd0IL+BY0A=; b=qPrEAwkKqhd8uQBUp9aN94NK/gTXd8EX
	RLKa4C9f094yKgW2FQ/d9FIMidjZpr+BcHEIEQvV0XReXckb+DECVp9Z9EOsy6VQ
	BrP50C3UilPlaHRf/620oq4dzhR6f2l9BNToWo6F3Kr8N9We6gqPzIalT3/yqKtP
	NtGvIumwW/EsFbtDZwysaXwj//lMFWIAFs/a0ynT3gpBQk2E/GJjj1E0n3DvkBwD
	HV+04DlXouNBFU68K96YppNcCighXTnbF4l1O5GRjBllyTJ+CX2PlIli+xsF6F5J
	8E+q069nsYp+2m6F1rtfA9H8yRAhwiYgVGAoVWSA160nOKB0Ewrbew==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022118.outbound.protection.outlook.com [40.107.209.118])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4geyrqj63k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 05:39:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJ1+KHfgnYbaacGCy1UOb1fGrFo4dpfAwlGEV5GnpawFkXyQ0S60Tn1wxecVHhTcMyY4j9bT/0uyJqydmDIqRDvQhpmTmB/gSErTQ/uKjxPRw6fcfQmnOO7TX1bbIL0vchyCyjmwDV3gRXM8NwRlgcK62ULH3hv4I57+K0h9GKAQBPg53ce7yCTHJJfNN9VVWWfMBDxkZbc1eDMaTs2go+21pQaug2VUkmdcObZSDhRQCMqBiaN1sb3SLgY7vQPqXC+kYzKydXxPtBacnK2wkGvzOTlkZ0OmkcrOIEmXwr7+6EgkiiyoPzlpQNRB0ksGo49drFhGfYu22iE7/7yFbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKDb7Fao7SBQCy+SVvBruDv1pNXTIVf0Qdd0IL+BY0A=;
 b=YW0cMiLFTXOTCSlt75SMQ/gbhER2uBrO/asaL3SdKz/Cb5lXh5aOI/Rtc9DZAnwMA5haEavHxpr4hjGabBU1j+GvcJRwsNOdnlI7/9G5yEeVVlQa8oKPuTTDkx5YBu8ZxdxqNBLrTTpk0QJnbxV7FlvmXPENETOBMYgEEMtP3xMNeD4y5Cmw5E5LLvmdZSe48faDYUgX4uO7MLrUqGlDkinrHNpwrXCqtr1FNwxbx/WJFE1dbfWAfERENJ8Kg0SRIErNf9xznUEsN4OugKnWHD4MHgCqHtkn1CP8uwMpNEzU8qeOnbUI5SarXPUSs0NHOWNnigkN0KKIsbgLK0kmBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKDb7Fao7SBQCy+SVvBruDv1pNXTIVf0Qdd0IL+BY0A=;
 b=cImtnqCT/4J0Ea9XtOyPh8GiNqa+5rb3b86iYLgsqEctPW/zJ+143zRFYZr5FjeX2NgjUcatkLPlm/1/AyTYoSIZ74pyMNsShlAiMJmjN0pkJhwt+FPZdhipxf6eDIg8Yy7hpzJEnqbP+GIFxVToU4hkh6v7LODy2Q95oStqkvQ=
Received: from SJ0PR13CA0177.namprd13.prod.outlook.com (2603:10b6:a03:2c7::32)
 by DS6PR19MB739108.namprd19.prod.outlook.com (2603:10b6:8:418::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 10:39:31 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::15) by SJ0PR13CA0177.outlook.office365.com
 (2603:10b6:a03:2c7::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.4 via Frontend Transport; Fri, 4
 Sep 2026 10:39:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 10:39:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0DD6E406543;
	Fri,  4 Sep 2026 10:39:29 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 00122820247;
	Fri,  4 Sep 2026 10:39:28 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] mfd: cs42l43: Move cancel_work_sync() into remove
Date: Fri,  4 Sep 2026 11:39:25 +0100
Message-ID: <20260904103925.292708-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|DS6PR19MB739108:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e4f5adbb-478a-47ff-7323-08df0a70cd84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|34020700016|61400799027|18002099003|16102099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Oyxn3o09DE1sNLbWBrYdz67b/rNj6seObm3RELRUvL/qKcHpvZnjNqR5Ii8oF++FmzIh2rlA2xv4+hawCSoDnUGcX4J78dKVa635S3shGg1iWi7DInKKF4BSUrp9D/Xyq3SqPE4qegm/3DtYsvLgEy/BnD2JFT5nLaIkIhiEH5oBb7ZoeTe15OvvW0edCthrw9Jf5b/xSyrvDb7DLretG/QgMqG7UdI3KNQOXYQKe9sWwQNUV0CFg3z3rS4edC4D2jlsa5tvccpBt9xFKZXzGgLwlr9pXMXn1BVWeXIniFgfR5KvnHYcG2LZTg9JwlJ4MpEGrHvs0Q+U64vSENLwK8TzW/COmHwgWG6evnPhu+Wo2ADb1G68ULcAM63lWYrGjuOH7lFzjqF4yMdtkCWMS5YumydONJr+w2yeeru3aKcoAe5MX2GLFcPxRenSC7tWtShspvsu1OjfcAHU7CmBK2x4PRJObxp58bYQlvgZcTBrtffPkxv8R5o5mi3rLKOTxiVmMvhCz2DQQpEF1Fg4Klkq2ar38jCt670kxmb50G/pygYplLe/Ebj6Hyj4q1AsS42LrbTRFmO3MrRWr7tRMvN/clviGrMSi89Xunr61Ouo7gQzlZUTsKhx7+KneiGCLI023B/DxHo878n6NusMZzO8JuivrtZNvkN3o8EaqJLcrpVafniZr5Xbo1Bp1qEURv2HDP4Qps0jo4WZ8XaUug==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(34020700016)(61400799027)(18002099003)(16102099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4syGyqv0QHUSbGxZDbAKJYj+UwugGzXtB1L0jaPaE59o7vbfqToJyXHUrsxpaJUR7fD3QNvU8dKMYWwSCaKKEWzPja7hYgGbYANMAVa0rhRL07VfnBDxiPmteDuSYD1piD44Ff7TPK1QiSKY1XhC5SyNVo6pHZby7mQSXIaKCIirDXUu7q+svwyE9fIx2TF/R3dHvbGpBWbbIelFm0zGpdMoHKORjQ9nQBtQItSuvXEOONMez99zT/xHvNpW8DqJOUjwUoCHmCL3w8P7ceNL8566Quyc/dIN3iIT9zwi9+pltr3vxTAB2Z7rx8ZGWizUksaObrwJATxTaZ+7T1vtbWFqw+XNkuvjLvfbyl6bA4znj8kz3nqwhQh4EuwkcUOczWgMj0JAo0Dsz0n0umVrbiO6lCSFzDg1qJUKk14NHX1oHc7OL1chTM84kELqdrO0
X-Exchange-RoutingPolicyChecked:
	vsQX1QX7PFfZ7GwHzy7fTUa564452qVBeOc1aaFwqN01xzQmd1ndUybgnIxlS7uFDxURww8xsKAaEoQuVNoqyKLJl8dUzVjYaFK29F9XcenSPrEdV5y3p7Z1UDQm2kovsf+S3/rUYAg5OqDyIDxBbVAI+I/+2E8NtAnA7b340DI8dI48Xw/5iz8eyyjvuLHKNxgBxzRwdmP5Fzuvg5C4SfDp4smdVklf5vSVELTHNxWaVyYRT4MUmRVVPw9I1BKZb5nUNwResyxmv430x9gl2SWI70CKrIH6LgyHTthagDy1hE175PbtR/qKb58wyBdu+MZlTnqhnwPWSt/LhmpdhA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 10:39:30.7189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f5adbb-478a-47ff-7323-08df0a70cd84
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR19MB739108
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA5NiBTYWx0ZWRfX82Z+7o8zFgG5
 kpBgRXpDW8zVF20W97P+bSAL7Oc8zHWIzDihQxYF8qxVEPLd1n/5AOsX33mTNg7suMfqAXpXkmJ
 14ObKlLvxsRqVcIPukPdQKJpnHIUzwGOpsoHbMTtLt4Btdsn4RMrYgO/sckwVtxr6+5ZTu7cAfO
 s1UYlGwWj78D9K5IJ8pYxWNjRPYMFD2cITQm0Epjroj1ppUQfDCbHlXm2YcX0KY4LToME5vaDDN
 DFqY1gAqGGHBnnspI7vW2ZZzkyLPeloPaZ0bG7CH0sCHuuZ71LQlEJ+HvEiTqdB0zJN6bRC1Q/c
 CK/j7H+maIvB1goc8QOqGyg/zS3B4YBt/iLFUxQC8n0tNdidwH/dEVMeLgO7YgEtPcqGCDohVEw
 +Vp0zl/Zscpma/gEmD+vOwXy0VcIk4ZCqC9KOBC57oLDDuWkS6CWHUwq29LNw32rKkP/uJRKKtK
 wjSb/kL2YWarMTu9Now==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA5NiBTYWx0ZWRfX4DAE2cSkr+wN
 2z5SO1WoTesyM6Y06ZG06BDDoLBNxXGOiMgJkozENNXfbvr42IzzIJG3kbRmb9psoNTIpHqbxSW
 NJOJkD+GdBL1o3CoXBrNus2uD4byk6g=
X-Proofpoint-GUID: tkft9bTPS6WajOlgEssi5gN3F7B42jqq
X-Authority-Analysis: v=2.4 cv=A8Nc+aWG c=1 sm=1 tr=0 ts=6a9a9fe7 cx=c_pps
 a=X0DbKXi7RYM5x2NUiypu8g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=kGWwXdSU071aZW05i-gA:9
X-Proofpoint-ORIG-GUID: tkft9bTPS6WajOlgEssi5gN3F7B42jqq
X-Proofpoint-Spam-Reason: safe

The cs42l43 driver kicks off a work item waiting for the device
to appear on the SoundWire bus, once the device appears the
MFD children are added and the clean up is then done through
devres. As the work is synchronised in from the devres clean
up this could lead to new devres items being added after the
clean up has started, if the driver is removed before the work
has fully completed. The work should be synchronised before any
devres clean up is started.

Fixes: 0f35dc4bd50d ("mfd: cs42l43: Use devres for remove as well")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/mfd/cs42l43-i2c.c |  8 ++++++++
 drivers/mfd/cs42l43-sdw.c |  8 ++++++++
 drivers/mfd/cs42l43.c     | 14 +++++++++++---
 drivers/mfd/cs42l43.h     |  1 +
 4 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index cbe05c3ea9100..36c5b03bae693 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -54,6 +54,13 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)
 	return cs42l43_dev_probe(cs42l43);
 }
 
+static void cs42l43_i2c_remove(struct i2c_client *i2c)
+{
+	struct cs42l43 *cs42l43 = dev_get_drvdata(&i2c->dev);
+
+	cs42l43_dev_remove(cs42l43);
+}
+
 #if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id cs42l43_of_match[] = {
 	{ .compatible = "cirrus,cs42l43", .data = (void *)CS42L43_DEVID_VAL },
@@ -81,6 +88,7 @@ static struct i2c_driver cs42l43_i2c_driver = {
 	},
 
 	.probe		= cs42l43_i2c_probe,
+	.remove		= cs42l43_i2c_remove,
 };
 module_i2c_driver(cs42l43_i2c_driver);
 
diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 0a6999453f325..afed34d23af80 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -180,6 +180,13 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
 	return cs42l43_dev_probe(cs42l43);
 }
 
+static void cs42l43_sdw_remove(struct sdw_slave *sdw)
+{
+	struct cs42l43 *cs42l43 = dev_get_drvdata(&sdw->dev);
+
+	cs42l43_dev_remove(cs42l43);
+}
+
 static const struct sdw_device_id cs42l43_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x01FA, 0x4243, (void *)CS42L43_DEVID_VAL),
 	SDW_SLAVE_ENTRY(0x01FA, 0x2A3B, (void *)CS42L43B_DEVID_VAL),
@@ -194,6 +201,7 @@ static struct sdw_driver cs42l43_sdw_driver = {
 	},
 
 	.probe		= cs42l43_sdw_probe,
+	.remove		= cs42l43_sdw_remove,
 	.id_table	= cs42l43_sdw_id,
 	.ops		= &cs42l43_sdw_ops,
 };
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 4212ebcca60b5..ccb68f7ebb5a4 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -1099,14 +1099,22 @@ static int cs42l43_power_down(struct cs42l43 *cs42l43)
 	return 0;
 }
 
-static void cs42l43_dev_remove(void *data)
+static void cs42l43_dev_power_down(void *data)
 {
 	struct cs42l43 *cs42l43 = data;
 
+	cs42l43_power_down(cs42l43);
+}
+
+void cs42l43_dev_remove(struct cs42l43 *cs42l43)
+{
 	cancel_work_sync(&cs42l43->boot_work);
 
-	cs42l43_power_down(cs42l43);
+	/* If the work never ran drop the pm_runtime reference from probe. */
+	if (!cs42l43->irq_chip.irq_drv_data)
+		pm_runtime_put_sync(cs42l43->dev);
 }
+EXPORT_SYMBOL_NS_GPL(cs42l43_dev_remove, "MFD_CS42L43");
 
 int cs42l43_dev_probe(struct cs42l43 *cs42l43)
 {
@@ -1153,7 +1161,7 @@ int cs42l43_dev_probe(struct cs42l43 *cs42l43)
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(cs42l43->dev, cs42l43_dev_remove, cs42l43);
+	ret = devm_add_action_or_reset(cs42l43->dev, cs42l43_dev_power_down, cs42l43);
 	if (ret)
 		return ret;
 
diff --git a/drivers/mfd/cs42l43.h b/drivers/mfd/cs42l43.h
index a0068f6572e2c..862bc6fb68cb7 100644
--- a/drivers/mfd/cs42l43.h
+++ b/drivers/mfd/cs42l43.h
@@ -25,5 +25,6 @@ bool cs42l43_precious_register(struct device *dev, unsigned int reg);
 bool cs42l43_volatile_register(struct device *dev, unsigned int reg);
 
 int cs42l43_dev_probe(struct cs42l43 *cs42l43);
+void cs42l43_dev_remove(struct cs42l43 *cs42l43);
 
 #endif /* CS42L43_CORE_INT_H */
-- 
2.47.3

