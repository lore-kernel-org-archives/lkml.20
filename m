Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C80039CCFF;
	Mon, 12 Oct 2026 11:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803854; cv=fail; b=P7eRFNHXY+A4sekLU9iGurYAHesykIHzP4+a220QQtDmjHS92fAp0d1ZENk9mfESGg3/q4P5KQ8vhOUMJSuLUoYssRL6VuS3zsl7UkYtQP4dOvIT7nGFnXTv9xDbLCvN+zoAdcEAariXAAbIeGc8LHk692BVerL2YOJYyO48g6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803854; c=relaxed/simple;
	bh=Y4tqbCZgGH+f5leSX5dFoTkKIaG0WHmbetuDHFz6OGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kcq3s3bl3xk2Wh+aaSTtikmGRwe5McSuszHIBRogMzt45x3ULvqAPAghbxuZH9urpr3UW7orw06+ABzeatAwZ4qS0A4+UQjUCsazveXKEo7GNdKgGKbP0OuS77bvyzcXQu4RXub+x4VtceeFHAJMwbh94UQl1a1o2lDcQWJj3Jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kPZRpiWV; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QhCxSTYs; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kPZRpiWV";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QhCxSTYs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C6h7q21342112;
	Mon, 12 Oct 2026 05:55:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=YgHwi0bTAHRgZAqOS2XmipXwR7uujQYeVAI+V1JycOk=; b=
	kPZRpiWVZkdt09wmASI8/Pt3eS3VeWg19nfzn9j8N0Mn0l7oWxwOBHI6FGcF7cpW
	SH0+HXx8wHTNGqZj3rY7VWtuzrsJKCpZS3zGMXRR6ZKUvnAEc6xXLMTpxkxUB8t+
	hKWEns2p8oFUn9Cnxtzk7kEzrQHVH6VBOUzUvc6ZPzgNzaz9Wz+m3wAcgxERiPMW
	h8KaRo0NNk7GJXwk54nG5S1uB5zotVEHDzVsyzB1AzxZmm65Jr2okqGdMJgMs54Q
	SL63GCC2PuQ4kSNVbtvF2B6Bi+SRqaxyIdu4TnMy2kc0Jy40sewx6Dby3hBVcLi3
	ppKeQrRZqQfo4c4dleJb/w==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022134.outbound.protection.outlook.com [52.101.48.134])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h7hsg22rt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 05:55:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uomRpojRd1xaSdCof+ubsjicYySeNQEgEUZkkkOk8PDzDu6Dwi0jr19XfduynZ8Hrfg/pUHOru8tzgZur8BKaJiGn/8k/rVGuPoUjAu7tZHvqUmv81Eb7W5BrjBoudRWWu/WdTuIXg1iR75B26QIRxUSrwjKUV8rVNbj35PRkTqw6gPNbUKvbyNYbjwacyTCP9NgK20E2VvedlO/BzLhouYp1uccRtSW2Cv9xUEDt7MQqO/BdZLedLPsZ7IXBWK2FlPYGqgsRa4Lr6NYL9AllhxqVEjAdm8KHuThSdUP2xB5/KGBNBtCXSzsJYhSufc/onAjUwqAzr2HkX/rwM9lpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgHwi0bTAHRgZAqOS2XmipXwR7uujQYeVAI+V1JycOk=;
 b=QvTuKn7mLCnukNX8YqSu3ZVK+TSpDDQKFitjWcITxSkq0JwLsn81Dgf3HxRZf/RHxF8xycQpV7kw3bGqiTVFwbw7mdhoOz8+o2lEcCWn//X1odoLxgMc4aOsZXYFrhbyGZeUQKZLIWj7zOANVykW3VDWHnEZr/40zPrSF8YsFTl8tAlhYXiX0gxP+bnX+Xu0XGCJKffbdrJ2a9ASP9bFjTL80XZxuwgwrjXAiemMGs1yD+o8K1Db3tM4Fc4cGY1iL0c5N+xvyoG8eST2CyepGd35ASuzzXAtxrlKmbzFD/KMYTtXpx3ytd6ML5O9Cb0JeeRy4ynjE/fjF9XpB5mtsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgHwi0bTAHRgZAqOS2XmipXwR7uujQYeVAI+V1JycOk=;
 b=QhCxSTYs1iQK0JwiLtIl31vZMkIOoJIYY0s6sYHl+8xZSQvo7nbA/9i/Pu7vOi7F0K2SxJ853qGzWUP4N0EtYIMc8v77KioaSbDDUi+9cOOzZQtjxXmQorBxv0jAutPzjhGtUPm6GhY10H4824kETI4nXkk0E7h1fBoRo4NW4WM=
Received: from SA0PR12CA0030.namprd12.prod.outlook.com (2603:10b6:806:6f::35)
 by CY5PR19MB6338.namprd19.prod.outlook.com (2603:10b6:930:22::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.18; Mon, 12 Oct
 2026 10:55:46 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:6f:cafe::31) by SA0PR12CA0030.outlook.office365.com
 (2603:10b6:806:6f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 10:55:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Mon, 12 Oct 2026 10:55:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 21C6D40654E;
	Mon, 12 Oct 2026 10:55:44 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1011D822547;
	Mon, 12 Oct 2026 10:55:44 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] soundwire: intel_auxdevice: Don't disable IRQs before removing children
Date: Mon, 12 Oct 2026 11:55:40 +0100
Message-ID: <20261012105540.1686405-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012105540.1686405-1-ckeepax@opensource.cirrus.com>
References: <20261012105540.1686405-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|CY5PR19MB6338:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a1cbd5c0-38df-4412-3968-08df284f5e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|61400799027|261009223027099003|261009220027099003|56012099006|11063799006|10067099003|261009223327099003|22082099003|18002099003|6133799003|16102099003|261009221727099003|261009221227099003;
X-Microsoft-Antispam-Message-Info:
	EbGGdG5/j9Vsk4NFDHQuyhYCq/Z4n0zp7SCeN1sbcUfwslfOFQGI+uPcNa8DMBG9fbdssMExQrolj2+yjR+X2aMRr1ugUg7eCI/97zm7HP6ZFb5NNoi5diwF6FwCIwBsCKY9s08dstiASEG5CqjC8WGoc0VtDM6yNZceXN8fNr+jUh2kv24qW4zD1b64I4mmOW2VvdiL1tjGItE3G65028U5lg96Ms9LxY7p0D/spvo2UFxNxNgY94319mCePFGSupFIWdmPF9dEZHhSinxJWTXCsMx/PEYu26tVp7jzQ9YghF05m0IRwUcuOJDKWDHl9mBLkdATJNdaALhVJ941CPyPISKuZa56mFjQLmBDREfRJmCr6dRD6OfNg6pFPHLBF5zWMlkzX4Hq46/94WNnvFYg19E5PmYIAppyl6BnT+nzf8beTFB0UDWsOqThp65dLSrHB39QgCzF0mkKGH1XaSp2klsiolKX3MxjO+Mtnc5qt3BqgSsCODAvdXR89+fiHe4Jg9N3lIgz99HaH5i7BO75yvRkB/RXVa5zcLW1XI2ZjQWQe5YDygpJ8DLrLfErGASux/6rymhGcBvmIOVIX84iwzTD7xKuDXR7FHoSzdCry2frA9IsoTluWeZ2MRLO9EBnOK4Oy+uXDd1IA18k18J6rHLqSJs2fm7r6Ncixd9D8I+HAZcW/0zzlcNjNU/+fconKgtOr4mV48CbDkuw7A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(61400799027)(261009223027099003)(261009220027099003)(56012099006)(11063799006)(10067099003)(261009223327099003)(22082099003)(18002099003)(6133799003)(16102099003)(261009221727099003)(261009221227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GT+BEMlaCnAVG/nxjOn1HgQEFSeBcRztLZkFlHvRBg6NOaqQFBc7eM3yYHSM+p7ZXoGLs2ywYeWh7o2ynnlARg4VLelqU+k+Vcpc4jixfkhngDKH8EM2il61sezvb5uWqlVuN6j5UbqimoVkW+dP/c1j3wEMf+XoUq5AVrjZ8r9y6V4qtFiMFUpuUsup9bhCwkqKCtqNyp9LUQhdOZNNOcgG6VmMOYtwBojYKYXAhMhzvxNVsccx8aXAx0kYL9zNnbocq7CaqCyOgDkp8/Qh19HOnUY/e+nAIFywftJzFaG7XijLqhkPxcS4/i/JuiXHkLblKFHUZB9xmIwq1Y3jzqpKx6H646l8CbDZuc1+uQ7uwU0fkiGh2LnqsA0kcDnqGXxNg917lFcmaGFBxoqoGDs8bvA01SsoZgM+9HBHNC7THXoOV95jsuYpd8bMKf2S
X-Exchange-RoutingPolicyChecked:
	M4a2WS3T8Sui7nYaVN4aRQ7Hr7tYd9TvcAsDw/0QrXzVat0mrJfPd9XV8oSHjs25L38KH4Ap+tX5ApxnpfLXcNYIt31VgoXW3HG7rq3JEDuzPvi3Wzq7DZFFBcb8NFdBcDTmGzNMkR9HCUmt+tBwpsOFgHdGmWSLs/WkvpdrKsYSJmTGuEsTnThLHroa/iL49MI45sPSuWpJckK4e/wqDnQ6vd0FdVpuwb+EXWlXFv+WbgR75LSv8SFNxkkCcw5gMXheAf4ooiz5zIIruhzv8Kka9IBOAwx7Rr4n3B1DKZpmF3MfNhQlofaFqeMMssF50un34tM2e0I+NPbbhXKiaQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 10:55:45.2732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cbd5c0-38df-4412-3968-08df284f5e0f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR19MB6338
X-Proofpoint-ORIG-GUID: gUkmLVJgc5fdZ1fsnRK7q1FzHjtRR5xh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MyBTYWx0ZWRfX/lbM3J85/Q3Z
 trD+AiMdKu/MW/xbPn4rB8amx2hX+qkztIhQkt4F+aHewbMbNuSeGDrUwIm4y8LoZbj5yewthtr
 4/Yorn9QIVb+iR4UuNnG3GAUGCZ3cEQ=
X-Proofpoint-GUID: gUkmLVJgc5fdZ1fsnRK7q1FzHjtRR5xh
X-Authority-Analysis: v=2.4 cv=QufLTlyd c=1 sm=1 tr=0 ts=6accbcb6 cx=c_pps
 a=xo3zWrN9qLO3Lphhql2lSw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=rGfVdOg06a76RMjW3RgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MyBTYWx0ZWRfX+gMG/fiE3so3
 KnXIQ47isKU/uzzNcWueV+PNGdgC+5wBAVNP9Plq32JiSJ2SpLbeU+zDezahL9p/ARgwdAR99Br
 YoTMg3LLuvJLXSdN7uelyMTTqIasT3ADbO3oIbIet6PmhDI3BwlEexfDcpYiYNSA8cg/QNtWxgw
 8COBimxbegVcO016wFBqReVTgBa5mOz+KGGdgswWlMAbWU8nNC+yA4o/1jOzBxw/VdwF/iitnFd
 TUcC2A1P7PCj0l5i+snXHVMnlSV3g5cwoFjBQlEE/tAXiwYCR0bhLa0xWH1ydfSuiJ2Sor202d/
 S4oZQdvzoqZw6KRunF8S0uO/JyMDt+PrzsJiBGH93uY6spn+hNX0DB7XstUjGpZ0jRMxgIWIWuJ
 VGsKM+KjRrN5dGoQluqAI+gXIR4dRjeIoiuRHBQZyBczC3kmsGJiovu6K19wuU9xES5tm69chsi
 K+2W4v6TANDFRvCPHRA==
X-Proofpoint-Spam-Reason: safe

Currently the auxiliary device for the link disables IRQs before it
calls sdw_bus_master_delete(). This has the side effect that none
of the devices on the link can access their own registers whilst
their remove functions run, because the IRQs are required for bus
transactions to function.

There appear to be two things that currently block leaving the
IRQs enabled during peripheral removal. Firstly, the IRQ handler
iterates through a linked list of all the links, once a link is
removed the memory pointed at by this linked list is freed, but
not removed from the linked_list. Secondly, the potential that
an IRQ runs after the controller itself has been destroyed.

For the first problem add a list_del() for the linked list item,
note whilst the list itself is contained in the intel_init portion
of the code, the list remove needs to be attached to the auxiliary
device for the link, since that owns the memory that the list points
at. Locking is also required to ensure the IRQ handler runs either
before or after any additions/removals from the list. A new lock is
added for this, the shim_lock is used to gate access to the shared
registers so doesn't feel a super obvious fit for managing the list.

For the second problem utilise the newly added helper that allows
destroying the peripherals separately, allowing the auxiliary device
to disable IRQs before running its own cleanup.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Added missing i++ on error path for devm_add_action_or_reset()

 drivers/soundwire/intel.h           |  1 +
 drivers/soundwire/intel_auxdevice.c |  7 ++++++-
 drivers/soundwire/intel_init.c      | 23 +++++++++++++++++++++++
 include/linux/soundwire/sdw_intel.h |  1 +
 4 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 7a2e7e73ad632..ec82ac8d54adb 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -47,6 +47,7 @@ struct sdw_intel_link_res {
 	u32 link_mask;
 	struct sdw_cdns *cdns;
 	struct list_head list;
+	struct mutex *link_lock; /* lock protecting list */
 	struct hdac_bus *hbus;
 };
 
diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 5983fbc5725a2..d32941bc99fd5 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -511,8 +511,13 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
 	if (!bus->prop.hw_disabled) {
 		sdw_intel_debugfs_exit(sdw);
 		cancel_delayed_work_sync(&cdns->attach_dwork);
-		sdw_cdns_enable_interrupt(cdns, false);
 	}
+
+	sdw_bus_slaves_delete(bus);
+
+	if (!bus->prop.hw_disabled)
+		sdw_cdns_enable_interrupt(cdns, false);
+
 	sdw_bus_master_delete(bus);
 }
 
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index ad48d67fa9358..764acbffe43f7 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -28,6 +28,15 @@ static void intel_link_dev_release(struct device *dev)
 	kfree(ldev);
 }
 
+static void intel_link_list_del(void *data)
+{
+	struct sdw_intel_link_res *link = data;
+
+	mutex_lock(link->link_lock);
+	list_del(&link->list);
+	mutex_unlock(link->link_lock);
+}
+
 /* alloc, init and add link devices */
 static struct sdw_intel_link_dev *intel_link_dev_register(struct sdw_intel_res *res,
 							  struct sdw_intel_ctx *ctx,
@@ -79,6 +88,7 @@ static struct sdw_intel_link_dev *intel_link_dev_register(struct sdw_intel_res *
 		link->shim_lock = res->eml_lock;
 		link->mic_privacy = res->mic_privacy;
 	}
+	link->link_lock = &ctx->link_lock;
 
 	link->ops = res->ops;
 	link->dev = res->dev;
@@ -145,8 +155,10 @@ irqreturn_t sdw_intel_thread(int irq, void *dev_id)
 	struct sdw_intel_ctx *ctx = dev_id;
 	struct sdw_intel_link_res *link;
 
+	mutex_lock(&ctx->link_lock);
 	list_for_each_entry(link, &ctx->link_list, list)
 		sdw_cdns_irq(irq, link->cdns);
+	mutex_unlock(&ctx->link_lock);
 
 	return IRQ_HANDLED;
 }
@@ -165,6 +177,7 @@ static struct sdw_intel_ctx
 	u32 link_mask;
 	int num_slaves = 0;
 	int count;
+	int ret;
 	int i;
 
 	if (!res)
@@ -210,6 +223,7 @@ static struct sdw_intel_ctx
 	ctx->link_mask = res->link_mask;
 	ctx->handle = res->handle;
 	mutex_init(&ctx->shim_lock);
+	mutex_init(&ctx->link_lock);
 
 	link_mask = ctx->link_mask;
 
@@ -246,7 +260,16 @@ static struct sdw_intel_ctx
 			i++;
 			goto err;
 		}
+
+		mutex_lock(&ctx->link_lock);
 		list_add_tail(&link->list, &ctx->link_list);
+		mutex_unlock(&ctx->link_lock);
+		ret = devm_add_action_or_reset(&ldev->auxdev.dev, intel_link_list_del, link);
+		if (ret) {
+			i++;
+			goto err;
+		}
+
 		bus = &link->cdns->bus;
 		/* Calculate number of slaves */
 		list_for_each(node, &bus->slaves)
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 9710f2dc04e29..7495d35ed2fc3 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -307,6 +307,7 @@ struct sdw_intel_ctx {
 	acpi_handle handle;
 	struct sdw_intel_link_dev **ldev;
 	struct list_head link_list;
+	struct mutex link_lock; /* lock protecting link_list */
 	struct mutex shim_lock; /* lock for access to shared SHIM registers */
 	u32 shim_mask;
 	u32 shim_base;
-- 
2.47.3

