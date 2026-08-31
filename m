Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADAC352032;
	Mon, 31 Aug 2026 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177455; cv=fail; b=d+GqreTKOZcTzo7TIpmC6NqA05i5RLQdBB55tn7DHYBNRgT0o4O7G3umhaiPWfOhiiwEGbZ70GAsuv//rehGawrDhBkqBhghJQFwEd1naT8IZkj49VU+YtepOlwuNn5YGxp1EQ3O48gVOE+9ixFU6t7LS96FXo2SljHZ6aOthDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177455; c=relaxed/simple;
	bh=gczhz8urAbFCmBsXEYSlYIkPYkfCfNM5B2IblfumEFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dDV2ptf7O/86bbGfA09slLlKMZxwUdrAKcyfVg3Cypu8LyyXjsHqrlcsuxDMiKQAFH1OaGQfErY/GKHPdn376cNYH6yNeUj/PqNfMeZljHKYqX7ayMZqgZtAK0Zpo2JEiX7YxKRcEtofMZJj208/u8Qdy+rky8k63RSt5HWUASg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AgEhi/nU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=sNX5LjMR; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AgEhi/nU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="sNX5LjMR"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V63TAN4037069;
	Mon, 31 Aug 2026 06:57:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=y8b+EUwC1oHjqCfO
	vCr/7deysf+M3I1xfqj2FFBWu90=; b=AgEhi/nUvOM20ZsNhkYDI1GlC5wuOlYv
	Ltw3HlWnSIPDmCT7KqYvuGxN5nU+dAQ0Z82/im3KcgbuF8wj9OgIwMKOUCBDKcwC
	pz0Jvpsd5hocK9sEetvzjvcl9asvKjTbuYz38KBxYtwyd26TW19gM/n5/O8IlhS8
	e39rBhMdSC/PEVkEF7dAowH4RlmnyrMwSE0gm7VDtCfG2XMHv2PKKFOg2q5U+x4e
	eUuqo/AtY26nbPI04QO4c/v1L31UjZ0tOZWk8n2o1+diKy9MwEz40WGVAu6JBrjL
	3IVp9OTNAXN+XW8cUxSD3v7IHUAThtX0vEL/jfJ3544uoY0pcG9CYA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022111.outbound.protection.outlook.com [52.101.48.111])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gbuuh1x8a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 06:57:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7ClgxBP0WxI3F4cVjmRltI4nOi0idNeve7dR1Tpxo5ML3QJ8y/vZre5foztjUmDUhYeXQK8aYOpKpmQyazyCFsZTuRIBN7RGmZ6BwXedv4T/D0nP/A5RQLaWLcDCWR5MIYrtBVuOrkx2u/h+utzixIvnFfFumKcUvlqqSF60O0Vnm3njueiWDgR/Rc1r0pJsgB/kKfkySFRkOvZmaiL5wlb3jexInOeXVGJ2avLTikNvjQ9DmAWM0SsVXIDy00+dQqZuBJ+QJ+AensjIsVfFURhvEFaxblRyIauOGG3/a9PbrblOVFPWPYPvYXKjVq3fu8NHfLMdMWpInOKiOO77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8b+EUwC1oHjqCfOvCr/7deysf+M3I1xfqj2FFBWu90=;
 b=gn+KGEmW84t2gjax2JZ/1ObWW3miX1iHWLNc7MBqstiS/DOsirtxCWMiifZI56OC1Tgpk0n4U3SCQ59LU87V/0PREYNKgKueN4RSJqpbpSj6Kzho7pT5WrzWgdQUQezjqfaT2hBpiFba+2RbdDdyaXUO7GDy1Z5ACwE4tgqqz3O/dxt/+7+fkfMd8ZZxx6zuP2moWzY5KeqAlAce+B+fygLprz8+dnnMx8lzBHcEAHE6Ng6efPc1u/MpxVKZDQMcw19lcnTYj/Z9YKgZeDwEoukFTE6Ufjtg+PUWPetIefX7srASBw3MWQl/WXHUpTN6rm1NxDrQ0Yi5MssF7jWNAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8b+EUwC1oHjqCfOvCr/7deysf+M3I1xfqj2FFBWu90=;
 b=sNX5LjMRbx5sSFFgQRDj2uRuYcfxQJh7c/aK9qw9QiJptuEZcXfaLuULJ5QbhEJHMF6ekRVhQWbpmy9WUCcbKxfAnT1tw2k1mLM2CW1Z2139xRlHQ5NmC89BGiz4ToJmGP8Ok5Kl52hnZauQGELqoNyLpWuYFuaNXWMGt7FClY0=
Received: from SA9PR13CA0180.namprd13.prod.outlook.com (2603:10b6:806:28::35)
 by DSWPR19MB137972.namprd19.prod.outlook.com (2603:10b6:8:3b4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 11:57:26 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:28:cafe::51) by SA9PR13CA0180.outlook.office365.com
 (2603:10b6:806:28::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Mon,
 31 Aug 2026 11:57:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Mon, 31 Aug 2026 11:57:26 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 86B4540654B;
	Mon, 31 Aug 2026 11:57:24 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 79D0C820247;
	Mon, 31 Aug 2026 11:57:24 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] soundwire: irq: Invalidate slave->irq before disposing the mapping
Date: Mon, 31 Aug 2026 12:57:24 +0100
Message-ID: <20260831115724.135619-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|DSWPR19MB137972:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0d04372a-055c-4db5-b9a7-08df07570688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|23010399003|34020700016|376014|16102099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	R7Cf9lljdCiVXIvQ4g+oCbTQM/WqJcsm8afqvLInb1pso0sC3AcuF/FexbB314UY5/4jqxi8Ax/MB9V4PI5GBtKIFVAFJlXeLiDm2CwkQFAATzg8rdzVgErh2PHxXPQQzbJyelUBja747Ez3F+u8gGGGVxVRouSmyfYvnvIzo4Pn089y8sFjiUzkywOybTQfaTgwL391r9sFMEkeruIcjf70rswWQDkhA+Sw92cak5uE+xj4cC6+Mdjwj65oxCuLlwNK67PMdsdFJ97Px3j4tR/z+z3i4AqdALSJA98fs9zbOeBaA48EFKk0D6E4ZOtt9Gq+SWRPGaDkDA3VbC8E9+BVhlErNGjiBQ1b34sU3gQ30QzrHUnPsQOBreh3QGLR/2badSLZhuGKhbN/+umyTSDCZICVodn6vWwJ4//v2j4wdRM7An5GEdSz9KKHptAXMglhIBCgg6KcWzZezxzfu03OjPr3R98G+PFkYPM9TvORtO8DT9bUW3OmYlnk5c1pA7N81diM6WcpqVS4zqmRA+YXGPc9iL6XnFlrCgFLlCmudAzUmCMnub1pDdyjk7DQshH/PRijNoDmF8Wdf1yEwJrKSUK/Xvw7rOj4KkbDLq2GUbB/9hZmSzfCTJ6ptzdpa+EOo541bkNWvF8nkE86EQct4+xlZ5EEO4q4DVYfWH1NuZ3baNObQsZrmG1NPaD0GEySpM1EIANwojIQLX1a8Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(23010399003)(34020700016)(376014)(16102099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t0AW8+cq9QHI9EKw6ZAk0/suavlSzQc95nRjlCGXUyVORk50/hY2suW9aS/Hchd/sfz394TP9FYYHAjLG2r5mraAkJ+VdQS3MwkfkozAGSkMNEzBIo3ztGA0eBGZ+btIp5rbI83+0uL2bTFyY1GTIsiIQyMC72cydPaiuuFfTjch8Tw72Ng0pic25qhZR2Q+AEKeKgSr0IbHXhQ0bvoajwI8Rzf1QYHjR/9UMfKlzhFiYlHp24SSiHQeu5dZETgKOJmP36ezplNLPOW8zQgvKJmIgRdleqpm4+wocYa1H04PuZ+tdPjEL7jrliak/ldoL5uGCf3fcaSJpyYLsfRgc25mVMEyoz0FTzCLI1CSLOXAyYu1bkPj8sb6TJUubPHhvwTJxJnA5u5MI5XWNJGajNpJ6wgqyVkn8CkmGH03QNmdRQ/GQg8SKBfTp2LRPTgM
X-Exchange-RoutingPolicyChecked:
	htbWEQk1LakmqWekoLwijfHPb0wH8Es9f6yS2+IH00UeH41126pfzRWABTTA85Aq6p1zpfgKpXsHSruRQbtnSDDkURc3KpfCaiPBE/ROK1KuxqyBXqqSZ3/ctejQvODS3XQiZscwQ1Ug+0P2erbuKGrb0LbF2N0mpTysuuV/Rw8jELdDHW/LcjYrdBeLfe58OeTiJ05rE3MTXAI/ew9npfuhI8eNXu4IdsIJLtz5tlNXeZX3ant98P5g5FJ3dnGXIh1EK49LEbCnAsF6AZ/Na4iGDckssJ9NGyZk9QT7JNBlsqdkb53Z6L65zng7AFay0kqZ1IZ31TN9tPS1dN/Xzw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:57:26.0365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d04372a-055c-4db5-b9a7-08df07570688
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR19MB137972
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEwMyBTYWx0ZWRfXwDefJtP8Of8A
 iWiVaB8NX1VXxL7CLee/PxHhcOI+8qYeApqGuMen+278Pig2YhkIaJs2pQpV2MGYuHP3ug68B5U
 MzUiEszq24j5zXK0m/BkA1M2nIyIOZiHJQ/+knUau43do6eEKmx8HivcjNCQ+d0CPaDkXewEMNw
 fk9Peo3G5khtNutIQAfhRJjrshfsNRjOrDAcnkBiNv8E4BivPIqDawkqBXmo9tS/MPEsm8XWgv3
 iqi4EipbRZXvNE+RSmnEwL08386RGWIo58wXLVS1g0+CNvcIGoNlt1vUWSkLiBKPO0NFAFYnHfJ
 k89Duc/GnEpAC9XP1J8uY+XxFdx/+N1YjEh180E8YNrNSC/Xq6CysHlR8A1op5dbxCBVXLGIXZ+
 ZrwYhogXUnSfUZosRZnF9htOp6gjsyraPZUDmxYeCAtkf7IGEsI8BnTHbwcBsRDBsIyHcvP3IyR
 Ar/vje6+OLR5o8XqghA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEwMyBTYWx0ZWRfXzyiKi0OuGmZP
 WKq6OpEBuYO6n3x3/XEwc4ON78v5qskC9c2aVJX9njoPm7sUvdTEcBQlBDPnq6gf27vRWTmZR8M
 nqXT6gW5HCw0oIENfh1UnxsVLx6O5IQ=
X-Proofpoint-GUID: 94Q587WyddJXTr66REYtBtuN_nvV90WV
X-Proofpoint-ORIG-GUID: 94Q587WyddJXTr66REYtBtuN_nvV90WV
X-Authority-Analysis: v=2.4 cv=d4nFDxjE c=1 sm=1 tr=0 ts=6a956c2b cx=c_pps
 a=ucmUxximRHcyFXWH+Z14eQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=kDuRvjTBYswMveZ9EzwA:9
X-Proofpoint-Spam-Reason: safe

In sdw_irq_dispose_mapping() invalidate the value in slave->irq before
calling irq_dispose_mapping().

This fixes the potential problem with the original code that slave->irq
was left with the value of the disposed mapping, so it looked like it
was still a valid IRQ.

Fixes: a5fef9baa87f ("soundwire: bus: Move irq mapping cleanup into devres")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/irq.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/irq.c b/drivers/soundwire/irq.c
index f18be37efef8e..f0de5a5e5eb43 100644
--- a/drivers/soundwire/irq.c
+++ b/drivers/soundwire/irq.c
@@ -49,8 +49,12 @@ void sdw_irq_delete(struct sdw_bus *bus)
 static void sdw_irq_dispose_mapping(void *data)
 {
 	struct sdw_slave *slave = data;
+	int irq = slave->irq;
 
-	irq_dispose_mapping(slave->irq);
+	slave->irq = 0;
+
+	if (irq)
+		irq_dispose_mapping(irq);
 }
 
 void sdw_irq_create_mapping(struct sdw_slave *slave)
-- 
2.47.3

