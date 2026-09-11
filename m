Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6463F8220;
	Fri, 11 Sep 2026 16:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143576; cv=fail; b=BDhPv9B1Yz+Ji+iS4B50Sr9x4Oe4fllnmkoQAxBcQYbsp3HmB94XqUAHvys1B09vH53ziwF8bPC7A4vXMDV7DAeMYadQE4Eiug3zurAskUpnFXdzbgGf+41fWtqJwtUTYiOuullo5zCaBC7MO9gaA4xtGhbN3XyvLySxdT9mM+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143576; c=relaxed/simple;
	bh=mwPBxalJSiN5dyMSTqi8oI5QWDyfLHo97ngfMdOs+QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgHXRJnCPhsuaVHio7OI0QuHTuwx6gO+bhMXyT6dfPxSynQpFAKdqRjUhSJPzhSe4/2J7T1lAMiDTS7esVTPDtobzyt6ylqZE5f7Eo6V6dv8/wXFJmwc/zqsL7E3jSzxG0STqz2S7g7/qQEqTnfno5IVhQwkf2GgqgBRJM5I70Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MNhbAFL7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fifOxL1R; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MNhbAFL7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="fifOxL1R"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFO2T53275305;
	Fri, 11 Sep 2026 11:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=jfOCubqIivFFUHbzbZPj1w7FOqI3391sTOUvGBsMz1A=; b=
	MNhbAFL7VSnpnZ7h13haYWXSx/grLYT74uOQnmlnWF/2XzEk7TzKIDxOEHw4b+wi
	IKAAxsMpIXC2HGEK4/gCriWFszq3zJvRAZgvP0882S9Kr+CmVc9w2aWKNSBuRI0R
	YcM5f9fW1VUQo5UJoZvXWGsod/RQSf62GZRnHIs+sfV5UX2hg7FOsYoDOeQrcWK+
	dK1sPqcBnWzEP5WaxPff+VqgaBxGKi9udCqUe8UnOfo7fLDQN4wBsljhKf5aVwQc
	M0hm2ZuPh7TSRpCU5Wsw7vonJpAQ/yYsLBYBy3kz/mbTg5v9TVOenaw9EUAPWIur
	nqr6D1KyRQtD5ZYOaspkLA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022112.outbound.protection.outlook.com [40.107.200.112])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gkcypb32r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 11:19:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/YCNRy+9aIBApUI+lzEabNkc9O1OnIHIIKzQ+gDoho5EuAEuoaSK7YQJ0QmbJRY+G2c+6iXdp4cDKsuvi76Qyvu6jTkgQsOs8riFw/bNMlIJoLGFeCDHd02m994hbvoEAxROefRZI5Kn/g861Ptr2pzD10X3smQxmbvo9w2p6DmXiu3rGxuVGArwne7/VUL8QV5g+2BO5tmU21MiPRxo9FKI9AFAsQnLfr4Li4eleOh+Ewh9FFp/7tLGSaiGqob9g6sZ00VIkrobtowKwKFH2+QAX/lB7oIa7Kftod2W6/h0uxj5l+JbSyMC0lzXcDHPUns+qUHWqEfD8xt0MkGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfOCubqIivFFUHbzbZPj1w7FOqI3391sTOUvGBsMz1A=;
 b=HMQeZi1KA8OTws+cws6XTEEW3M64mNEi0UbX0Ajfuy5WZYORcnd0TH9bGQac3A45vGQYl/gWxdcNsMDR1mAS5PeCyj8OM7V6Nw/zbMuuzaEZO+3fA23Q5vGdJG7h9wwK/A10f5iyb+VnVExodYKsUu8yHi7o6m7XS0jHYigsWUNwilzGwY0KMP2ZiXFLxyGYzhhUNjb2DKi69XI01hf69Rh6ACuw95+/uPa9cLHPRZq2tg2QFdXzlyPn3oF88PXiK4WTZhQhr8MT6RMFcx8PfAJ0nvrGYHCpZjHR27w2urNXTFJx3R0dcio64TlJ5G/HBCrYc+7l+a5rKBahZ/wNnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfOCubqIivFFUHbzbZPj1w7FOqI3391sTOUvGBsMz1A=;
 b=fifOxL1RLDc8t59rCvxURqtNV0bosaEGkibF5okSRL+TMxg1QQ/9xTVXvnfwUVh00YP65NUiHvBPRck1r2EXSgFAUinAPhP8SRhBtIKRXirSZoTccYQTyHS8jgXKWpGJd7IhZ9BZ3glTedp+T2zwYQJNjVBpfI3MPGFyJ2lgw3k=
Received: from BN9PR03CA0530.namprd03.prod.outlook.com (2603:10b6:408:131::25)
 by DS4PPF897246553.namprd19.prod.outlook.com (2603:10b6:f:fc00::a31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 16:19:11 +0000
Received: from BN3PEPF00022BCF.namprd03.prod.outlook.com
 (2603:10b6:408:131:cafe::65) by BN9PR03CA0530.outlook.office365.com
 (2603:10b6:408:131::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 16:19:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BCF.mail.protection.outlook.com (10.167.248.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Fri, 11 Sep 2026 16:19:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1663A406561;
	Fri, 11 Sep 2026 16:19:09 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F07D782024B;
	Fri, 11 Sep 2026 16:19:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soundwire: bus: Don't unassign dev_num before unregistering device
Date: Fri, 11 Sep 2026 17:19:02 +0100
Message-ID: <20260911161903.419814-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911161903.419814-1-ckeepax@opensource.cirrus.com>
References: <20260911161903.419814-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCF:EE_|DS4PPF897246553:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6db0aa87-83bf-4ab3-ea0c-08df10206943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|61400799027|23010399003|82310400026|10067099003|11063799006|56012099006|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PbZXwgtKqZvFxskz9bWj0ZN5LCetcUAQLIu9uajGSZuR6V3M7QujjjI/KkCLnYF774MypA3uCu8xPXmfA4PCkeH33l6oJ14DDjTGSfzFnca7z+3ChzXAHnoP5yblIVmH6ujL2/WaCPpIxSQskILItMeRfzSiLnzYwLda1MXmH5Ys+5QLkWUdhbGe2MIdIAwCfGtKf0gYhqfWd02R4yhK4TsrK2Fcvc9nIDy85zUGYQ7mJfOb1LjI375Ta8D6wf7Mm/WVAbOJMD5FSLInelkKi6ABA6TlafMQq7PbYhPan1Sv72jX9tCBN00v/jX3FDwhsDfeLyBcvg+wjmZGpFyPA1V7zvv2f1XHfaVAauiB69bJIoIzLv3rGoc9RK/TS0KFaiOdJ2qz6MLLoUajHQOI4PN6LytsfLDCGrWjamOJSP3ZZvAAUieK+Br19aeHJpcCeBKohAjBB7xir+CqftsZmH6rqpAOHbTg1y0YIIEag+/+H0iIAjtj9kL2foVrpRg3Yug+PQs/jExOOGPZ4pLY9l5lLgSYo6VnbqFJuzNIZYZDkoPnAei3pd89x+htkH2Q6tiVJsVHoYlMlNksYI4EYF9u5fNo8d4n12qf2sDfZF0zJaoV2BcdHaV8gJYLsKWgSgQXl+Z4Y+ITazXT9FQg1S1fSIbm88E7Cb2xJ3/lMRAAfGuniDsWYxr10VJey1MOJvKoYjHtCmdi2VkiA/IrTg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(61400799027)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uDRWLln08b7y07ZErP5Ww1nkEwMdIlEwsEtW4W7qjul0YhecaepCUwAeR+nsGpnJOyPSFe8mu+KaDmu52zU116DqEjHP8LwhcB/cP9kccDHnmBCm5aKb9nJqVBbUVtAXvpqmeG+VlD6Yz62Vnsdw+jepttHAXoVX5k4ZEnu4a8Vnsb42qPhk6yX9GQE2b9lS8N6n453q7s73y16gi5Dl8pMAi4o+NcDuZeaSvxgxPUDR4ueGTpKhPMWho1nC+ama/BaGnNZWunQw6NIh9vEC/1fWwxkXESF9Nx/JqCHVQTgD7dYPkoVYhmroFDBAFzr+SDqvkRo7tYtZbPB86Dr/2G9btW4CZtsPV1uMUr9xEes30bGQYmPyls3ILgTyVjWkKWqZUZpvzSF9uwSE23F58+BQWEri5VWY7ee8//5x2bLRl8bAbzp4Jlpsb9l9BT4w
X-Exchange-RoutingPolicyChecked:
	Am+U22sWPE+nizafD7Hv3+tRRXw6JiBZ1KQg5qsj19bSAQ8V6rrWfHKEu1WTu0Gkv7EYAeon+QjGiU/COLsIXyyVzyYhB6+B4WulisZaBZSE2Q7hBPqW2eoe7e7ucIPJX1XRebK3khW4kC76vLJR49GkZDc6EUmGpA6RnFLo1Np3zXLN3ebmvcVBstr1um5UFMOOJSrjWIWV1/JmJ7AkCpIe2nl6dvNFbu0W0kLjHeYkbuQYY59PrfmNcAOCi78loWpt0w7q0nnj2Bk9mbwVW8qqzJFsHZfziNyINt1PNXCkYbNwTX/1X5xRf1kaDWosWgi8jUR5k3aVg1V7DikgqA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:19:09.8760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db0aa87-83bf-4ab3-ea0c-08df10206943
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BCF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF897246553
X-Authority-Analysis: v=2.4 cv=f9Xdl+yM c=1 sm=1 tr=0 ts=6aa42a09 cx=c_pps
 a=thPb+1yXIQ2gbI/xx6itCA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=tWmMKBFDTpIhrmAsSQMA:9
X-Proofpoint-ORIG-GUID: 3WzYzc5ts4K81_CyNRuafEGw6CuPQY8v
X-Proofpoint-GUID: 3WzYzc5ts4K81_CyNRuafEGw6CuPQY8v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIyNyBTYWx0ZWRfX73z7l5r3FsiK
 O/x40JvfmNqcrgXwatRMxMa33kUKvggNIiXTwCLpX6g7sycsvXDm1oZ+mwitgzLKFyuNISjkbNN
 CSuyEXma1msWgwjOyd9EbMTI3lDKXke1uxxqwDJ8AhFcjbjuHygfa+Q4S+V8TDZtOvhJfoeB0zJ
 vAEw8K05GARW+X4GPUVJmbBLr+fbpbPGQqbw7It4/vK6xxOYn5cC0kEi8IkKiyHnZGY6cIwxwbc
 hThXV5cT7fBQyH5DNkxQHXKRUcnvMVNhb9BA5lX9vTnMLd+fKKPizpNPoc3J2vFyeFPA2QWans3
 g21WTaXVSHdwfrz6dcKQttdFpbO2xSvamMKx+js3VsLf9oAd7Lt5UyqLEYLnfjN9y2+ekXeZ+GM
 NsWo+aKl1oUSi3ZXyyjQLo+oW8GGvW534uVvZ60ymyc1869igrczrBDu3/zqXurJK41vSPsHZj6
 OB4ymFWoGsVitP7j2Hg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIyNyBTYWx0ZWRfX5/HJ4WSwWC/B
 acisyyJawpeA+m4AXjkwOrOXd7aTBaJjHwlzvPcHRSiXY8K0r4f6DSSrm40Z75NdRMwrvVWC1gt
 gIr/bRlgbF10tom/p1nhnDVp9vw0Tgo=
X-Proofpoint-Spam-Reason: safe

Don't mark dev_num as unassigned until after device_unregister()
has been called. The driver may want to communicate with the
device as part of the driver remove operation, so the dev_num
should remain assigned until that has completed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index aeaae5a57c89d..b17718f4277ed 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -175,8 +175,9 @@ static int sdw_delete_slave(struct device *dev, void *data)
 
 	sdw_slave_debugfs_exit(slave);
 
-	mutex_lock(&bus->bus_lock);
+	device_unregister(dev);
 
+	mutex_lock(&bus->bus_lock);
 	if (slave->dev_num) { /* clear dev_num if assigned */
 		clear_bit(slave->dev_num, bus->assigned);
 		if (bus->ops && bus->ops->put_device_num)
@@ -185,7 +186,6 @@ static int sdw_delete_slave(struct device *dev, void *data)
 	list_del_init(&slave->node);
 	mutex_unlock(&bus->bus_lock);
 
-	device_unregister(dev);
 	return 0;
 }
 
-- 
2.47.3

