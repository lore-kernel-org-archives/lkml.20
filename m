Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C76624468C;
	Mon, 12 Oct 2026 11:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803854; cv=fail; b=DbyXA0abbZNuyUhGWa/AYNH75ocSH0KAI6QjTzv3JFU6/5R9tyk1eLUKHBbKkMSeYs05vwHQW6lagaKcG34wf3TWhtF0XIMqD/bbvQlj4x4ul5GGHNPrp8/RSK9mEoYvzmrt3NoJjpCz5HMobEVeqwq9TwzNpbNNzzMgbtKOqIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803854; c=relaxed/simple;
	bh=qXxH51YFgUjaMfxerCpkmNsIQH4EPBEOc7MyYqGXCds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YB3kaXqQAakntqGqowHAGNeM6shLv3YWSmkhHHR45HH7C6mPf1X9Id8ZLAsx1ipS9DpyA14z16c9UdW1Y7FAgvUEWYK0Oj1eduCjtl/7qmwAECJfB1QRm3r8nt3WSAV6pyJt9g+XD/hgWlvGjrajycEgZFJ9YqPvBpjnAo1gS1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LQMihluy; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=E8O/06LM; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LQMihluy";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="E8O/06LM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C1MHaF803622;
	Mon, 12 Oct 2026 05:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=7t3e6G6WcWvLcB/v
	/Ofh5ll63hNZhoF/H4uMRPJwdM0=; b=LQMihluyj+CZQ9bS1VHtZ3EiwTcxeajj
	DznHN4yi9UoLFEOk81WyxMxPPb5egcANysoFPxXWACOrA8mSNslcXpTfn1p5MyoX
	7z4DBroRwfNbpvrpJhWmYMXSAK4TmASIdxgnYyj1kiBZczldiVu+LvizJsQX9Qmr
	f2Ru5rqG5/6pU6eN6M3s4BMJiqviNyxMx8mO+bR9kfzC3VgYNvwtVkKD+WOfOpuU
	jaNAFpFhr4l7U+MW1S+vYVPd9KywvmBBiXrqqhLJpVzoYzRMzy+IyqPQCHecsHOV
	I0VufFxHcrkrLUsPU+ESS9sXI0w3qPY0D/AUn3k0OLxRai8KGPevFA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023127.outbound.protection.outlook.com [40.93.201.127])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h7hsg22rs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 05:55:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjzlcosbJdckC5QOSYtHlPBwtUp0x28Mr3Sfyl6/wuRgg+dvHX3JWLOSLw7xfmn8Lv1nIPwtWIKUUoLBYDjOLz4Svss3eP2O71iMyf93eRLJQPEjLm6lWVCD9rpAf2QAnD8LH+FIsfd6J3OxaB9lbqxkCEL+Z6SxVhfj6zZOtb0Fpd2F7ojxmTUZXiBq1FJu7ViE8ifPIbK5BqjcAe5YqtNrStG3ccbAZA1HMFPaw2aD0oAOcTdGbYrj/EYSL6vd7xuysbXzimQHDkBj3AMcLLif+v84p5Aj/1HdSMyl6S4hrNc7/fwDdJ6ZZCDWQGz6qWj9macE3taoW88Shojtiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7t3e6G6WcWvLcB/v/Ofh5ll63hNZhoF/H4uMRPJwdM0=;
 b=H1lgk4zwgYE4tvRWD5RhNDfnnwbC1RaNfCiHzwsTklZr/1xYrVBcOxLqEUe5Jyipbb+7iDos4tIZCGQjkfGO+VLacNajTEZ6MzGi+uEdnXUI9fGycUFqu1NTLhL4xs1vb+idxp0iL7C24lZRPccBMB2jU8COJZN3kzgCnEJfOvpC+j5poj190mSsaE2AEhnJM5gi6/jywgZiuO6yjs84VCYX1ucN7hIHLuSrKsgYJe+7nPaPrYuEIf0htVsCX7Z0x5J2EMjHrXP9plRc8RqI8WLmh/8680RKNa68dUyHFPxaQ9lVZfXCMz66mm5HUfHRu5G46V9aKiepSkUuF/FZwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7t3e6G6WcWvLcB/v/Ofh5ll63hNZhoF/H4uMRPJwdM0=;
 b=E8O/06LMMlKYzXIoIbrK7SC6/S+8U8dLwSwl2PEvIdfmFNC9LYup4gdPNrBE3pBl4RHdE7t41e7hFUkNIBaM522wbGL/GGiHfL/VDzQqJxNJT6cgcIfFX/kOCDkgOh0heyDFe0q3i1RWy6Aof2Zj+zG+Fd7HrS+vlbQBs53BNkY=
Received: from SA0PR12CA0005.namprd12.prod.outlook.com (2603:10b6:806:6f::10)
 by PH8PR19MB6668.namprd19.prod.outlook.com (2603:10b6:510:1c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 10:55:46 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:6f:cafe::90) by SA0PR12CA0005.outlook.office365.com
 (2603:10b6:806:6f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 10:55:45 +0000
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
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 19AED406544;
	Mon, 12 Oct 2026 10:55:44 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EF54082024B;
	Mon, 12 Oct 2026 10:55:43 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Allow SoundWire devices to communicate during remove
Date: Mon, 12 Oct 2026 11:55:37 +0100
Message-ID: <20261012105540.1686405-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|PH8PR19MB6668:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ac76fb3c-e435-4b67-dfad-08df284f5e0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|61400799027|6133799003|16102099003|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	EQ6wBp6H21aIdgFSmlytq3fFTmsRxw87dm9oaiJMgC4jQ2JVtApMnmQZavrkcFuZvXwyVxjw3cHSJZoCzjQzQnJ6MQTV8wK0Zgsi42r0xj5GkBsGXjaGjuqZRaCJHwbl/z/RZ9xDUvcOcWO3SOHmlG1h43bWLQrS0B41vF+6CedalWzj0p1Utf/bkN7YhA3yn51MXjyIpU50CdFOOIgisx/QYibL0uKIB4F6gmnrPOmFHKI/on0hl7csEyiaFNvH853PzHd8qc43Xeor2GTm6qpTBxtuo3raig3dODcpTN6Aqaf3IC5pdGX+segjuvs6FIA751KyM6vVhSHqE9lx8CRogaaSgxz/Dn2aSbpNLJhAk8YJMKNSLkHHSWwY6GXKQifDkW0v4qggQRSJlnUh1RkOBPPdyjjKDepLCdolDuIveaXrbk92EmpiUPSiBuhH39yrMRsvVvYfKQgTFRMjt7Pz4gH30Zo2ZesT+H2DIqmahY+Yy+ENIm5WUZbV/pqTdoxgjrT7/jrihcKesm0FCBhcir9luW+qreWmYb/6zeOR8n+ECc+BB7kKYD0gA+9S33sayy3BipzvJDy4wrAREIAba8dXxPsHKY2Sq8ymPTqjuOP+qRTXEd0TJcLFb5wbVgFF9hdboWo680hbCj8xgJo7kbG+k9lij48IDDlFsoMfNoqd3SsMawtrSaO2CWETib6G3c3FgY8tCQBqOb8hNw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(61400799027)(6133799003)(16102099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3qCXDb9z+3DF6wj2nYrHCccRzJ3IaRoZO0acP8KlO2MRwjSGGh+4IYbhVMHksu6AWg4qTtjz0xyzthblNZ55CKlPp3JlWTs7fkaRHY/5FGNymB3iQCyvmHSEwmi9+rl1uaIimSYMK8G8Xkvr0Urj+KGMqspm3409dbeIehdfrulHJk0l8QudDfaWL3sMiREEfHHMORmgF5odCsFUdyLqD4qQjEHaosW5rQMcDg0Gx3XN+yk2VAx6mnrsm56I8g17rICRcf4aabW0uE4Sff+3FUb8wSKcdp/EtkC5yoWnpOit1CBH3GLp9m9OySCBnLchNgEwKgSYjlndxJM9DLxVoQZtDRLFUUGPLUfY6yjzR6BJ9yomY9AKzod8EcvIdnq3SwHqpeFNPCko4F9ST190/+vEGYwIPgj2uMyHoqDqxJ+lwyCSJURKt66lJJVWorna
X-Exchange-RoutingPolicyChecked:
	1AzVJXJ+n8hSURnvEvLGUI+w9lPryQOnzL7aL+G81VLXk00Op7XFLp2/v2kKv6pLeHSwW1ZATereVZmP5cTdAztxf89mZbmHraP6p4dn8ln50xUC5VsrcVtZ2T7ULKCwNKQ6lNiHfEaoREo/iQISfrZigd8CAYieYu9w+6MaJAYU3FQ2kYwdRUaUM4DldnNdt7Q/ilRdK9pBHkjim/0SLV/xuSHS8/x79Dsq+VxFbRReURAC5ZwhJVDkjnrbSSTU+Trxb1VHtCn5v4jc736CGZp3A8jAhWYSeGxGkEkMRVt0X07PY+f8GtYbglO83gjJDhQr9gB1nHLzN52BPPAriA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 10:55:45.2583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac76fb3c-e435-4b67-dfad-08df284f5e0c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6668
X-Proofpoint-ORIG-GUID: bM2LCAajKtpvw1g6c0ODSzOOOX4rcZFr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MyBTYWx0ZWRfX5eHWpT1PoxFm
 S5P0E5KuTqUlooP22PwkRf90viucB7Dah3CsFuCoSj/ospYU6aBzIs+rFwv/aH6SOn7tulO5/Lk
 11Oh7Rz48mu3nLuHUi96N3++G0BqAiU=
X-Proofpoint-GUID: bM2LCAajKtpvw1g6c0ODSzOOOX4rcZFr
X-Authority-Analysis: v=2.4 cv=QufLTlyd c=1 sm=1 tr=0 ts=6accbcb5 cx=c_pps
 a=5ID28ryD/xQJfY93dtjS9w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=AMs0GybAEfspHTM54-oA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MyBTYWx0ZWRfX+L13NYSVMt9d
 UDL0ATN6wbpVWl2GVXdFxdRt9zS9GepNXN5Cidh3UH38yTa9+RQm/1XqL6vyEgF/YZudvM0OglP
 Uz1F9R4dngcqKzBz1O3TudF1SEhAZXUqbsFP6O/LCazUdT2+95x3EPkKEedNxjUHyWCQ93KOkQA
 djYI5+EkaNACQhgwzbzzTNYsOU1Vc62+Iw+lLyLy8B3HQGU1Q2aXJW36mVX8EhY5GeSdy6Wio+e
 lKPJ4IWkpZWux6wCQCqq46m18dsW67dZQEbvUMBoJ2+UIQqAKHkMP1fVzT15T+UUOJbN9C6nZFk
 ak8Sj5YL7qF5iUBMDMD2GSGI8Fl7CrkfQmO4nR/sN5oiVYuGVjpKPl58bUJi48TUC2DQp46Uuxh
 nl++iXf+r4OhQMphDpnXC+SfvyJblpaOOkqG1ew2TClA2Jt8PZpQIzcywKYsPIk2m1INQMx6NRH
 56CNjNpgk7FXsE720PQ==
X-Proofpoint-Spam-Reason: safe

Currently on Intel systems SoundWire drivers can't communicate with the
device during driver removal. This is primarily because the IRQs are
disabled before the driver remove callback is run. The result of this is
such transactions timeout causing a) a lot of errors in the log and b)
driver remove to take a very long time.

This issue affects cs42l43 and cs42l45, primarily due to both using
regmap IRQ.

 soundwire_intel soundwire_intel.link.0: IO transfer timed out, cmd 3 device 6 addr 5d len 1
 soundwire sdw-master-0-0: trf on Slave 6 failed:-110 write addr 5d count 0
 sdca_class sdw:0:0:01fa:4245:01: Failed to sync masks in 5d

As regmap IRQ is torn down it will mask the interrupts that are
removed. However, there are many valid reasons a driver might want
communicate with the device during removal, others would include
disabling jack detection, putting the device into the lowest possible
power state to save power, etc.

This patch set attempts to address this problem trying to locate the
reason interrupts are disabled, fixing that and then leaving the IRQs
enabled for the remove callback.

Thanks,
Charles

Changes since v2:
 - Added a comment in the code for the splitting of device_unregister()
 - Fixed missing i++ in error path if devm_add_action_or_reset() fails
   during loop over links.

Changes since v1:
 - Add a new helper to destroy the children on the bus separately, this
   allows the IRQs to be disabled for final cleanup.
 - Split device_unregister into device_del and put_device.

Charles Keepax (3):
  soundwire: bus: Don't unassign dev_num before unregistering device
  soundwire: bus: Expose a helper to remove devices from the bus
  soundwire: intel_auxdevice: Don't disable IRQs before removing
    children

 drivers/soundwire/bus.c             | 55 ++++++++++++++++++++++-------
 drivers/soundwire/intel.h           |  1 +
 drivers/soundwire/intel_auxdevice.c |  7 +++-
 drivers/soundwire/intel_init.c      | 23 ++++++++++++
 include/linux/soundwire/sdw.h       |  1 +
 include/linux/soundwire/sdw_intel.h |  1 +
 6 files changed, 75 insertions(+), 13 deletions(-)

-- 
2.47.3

