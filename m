Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD634D9566
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784435; cv=fail; b=bwIxibVJWydd3pM6JbdGAMWXdPMM7B11SFpjXj8gUn6T2T0lSAasW8pmchhw7u8TzsgPzfNBD4Oah7vtCPkc62T/ITIBUAuWX9n8JeBiftW1tRS28ubAzUV86jxWlmxApew/YKSsCxc/awdQDiMfLApEHstBWsXtiUbAlZFOxkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784435; c=relaxed/simple;
	bh=aEe+0qf3vKqgzIxrRw7trxH6zYGR2jMwGWDB6DOJ/Y0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gm3kLhlNoMcUQMh6ACJowVnG9R6rQxrqNzmoWUVlIvvLg7D22cH9+nx/axmP2Fe6DeyBmlRIBDO65s6jcGXLGvRxmSQYvd0Pf+bf3isuU/IAfMJ1vRVzSMXeD7byCrsnxNgvQyLtmfoV5RoSpBxGmrrcdGXMUyHK+xjaRrOqYvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=MP/Qy1zL; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=pk3N8MQI; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="MP/Qy1zL";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="pk3N8MQI"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1KlG3057453;
	Wed, 30 Sep 2026 11:06:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Dry+MoENvkThXot9kK0+5haTd1CN//HcF0Jl2mc0H
	yA=; b=MP/Qy1zLMKq75Okx3t4/C7ec9/Qp/LpQ35o39QLruWI91mDPpIB4Y67os
	eJY1NETblf19oVFJfc80WOhLZd0mPAONVG/G5T2FxHSx/2Dvf8d/JC1o5hrz2HWg
	EzC+f+E1UtULdxESo7MYEJeAX2AyP7EvDr690X35fhdFYzldT1S04HQiwMBYqfKg
	CgrvX5ZTW71XuDM2tYV4E+hyGoKeXe0t2AsXJKc/GA4G+8cRXWKMm7Yid5yfz2K2
	f2gQucV6RWE4CywaoqEmPybvN2WKBaNreL82AL/pe7MLXXCdn5q5bDrHBFjVgyaV
	lgiOQE6nD2xxJZUg2rSODWceL4/zA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010029.outbound.protection.outlook.com [52.101.56.29])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0m9fehsy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:06:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YP24ML7pcjeUoaasHfggD18YdEWmzyc/RwV20W78FC/o6uqiUL45bUxKJd0rzzehVRA8daXFN1nm8daVgr4D0oDEdowcXp0uBrLIkCnog/0SFvR80Ie15WFcr2MCJHVpuS1x5ZdpBM43JFL2WlHJcA9jScI3cHPxEQapxWjoAUeSwK1Og8UeRTeUBb+7LGxg10ApCUzmExDngFZ7ifUmEnuK2NITKP2ENI23hleqPL3nNFRwRcZJ0HlD6O+5R087/ZHvDexM4UlRHQ8EQq/5Rvz+ASpWChpGoExXp8244p8zfgABSCPEHpoWhl8pA+ppr2uClRleKkUG4soyRoJ4oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dry+MoENvkThXot9kK0+5haTd1CN//HcF0Jl2mc0HyA=;
 b=o1hhxMNfhwCSfWzycixhPQW/6fwhltI8RL8lDmcA8SrNUimK8mxN49L+czTngACm/C1Hl6zDQ7N5mzwExSaUNQYyO/YCx58HSWczdcOsVmD7FrnT4YlZ4NMj1RwgUCoWLNgu9sREqrEFVrUe69yk+u+FTOvUcKSrDQWuxHHOwgg3hCh1kI5mAs0MrFTQukuB0HI4I5LS8YDuBpzJN7U1R8nxpnUDmxY3UTpCnqcO1vXK8PMHM4V3Xbaa2QfV1i8HaDSAhdO4CkpLvFjDZrcJ0fjbLP4ngABiruvBL7W6JHiCs5K0lJpzQBJmBOvMEGuiW+HBlqknemcX7ewAGhNPqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dry+MoENvkThXot9kK0+5haTd1CN//HcF0Jl2mc0HyA=;
 b=pk3N8MQIlOSlu08uCPIVEa88N2KsMQi9FZN7ZEtnnxb1NENQjBLtBtg1A4bMouM1ZFhBSXlYLkruh1Kqul5Tuq6PXN5gqKTSNDa9XqO4tTLqQQFXlC3ms8WTPpCbsk04FCXARCwxRKVF/onbNdZaYcvTmbdysm0hm8r3veA1csw=
Received: from BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::10)
 by DS7PR10MB5101.namprd10.prod.outlook.com (2603:10b6:5:3b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 16:06:51 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::9b) by BY1P220CA0003.outlook.office365.com
 (2603:10b6:a03:59d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 16:06:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:06:51 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:17 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:06:17 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68W53425232;
	Wed, 30 Sep 2026 11:06:15 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 02/22] firmware: ti_sci: Move error message handling into ti_sci_do_xfer()
Date: Wed, 30 Sep 2026 21:35:47 +0530
Message-ID: <20260930160607.2674980-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930160607.2674980-1-b-padhi@ti.com>
References: <20260930160607.2674980-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|DS7PR10MB5101:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e0374e-f763-4a49-d40a-08df1f0cd6cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	E/TmZ/vFSBYZBvbYGO5Znbw3FU5gFbipIxY3yzfjVCN+r8m0R4EKfaF6N8O2yIkevSL6ZquIZTOQABjwOd8JnUeRC/NBCC/Jhk6eObiKLbusMOn/iyYrBFPyTsfrCxTC+VUHJjtuBCxWqw1d7nLc06KY0HCLhbapHNEihW4wRh18/3d0Aawpnl/fq5YA2x4RR0PqhJyoqXB8UT34ZQkvM9lKMvN8MB0Zlwkre8tNY+gHX/NSeGIFdonl/tVgN7TAc2FOH4zJ3G699h5nqjolZISu7Xo5bIPrAUJ5KHrP9JqOdngfZRDplSPRr9RNq5mz64HqZK8SZh35NuZTh4SdOxNU2NdjwP7n/1O/7HQdddXnDWzH2WOI/sv1Z3zFVYSv6RtHsuTktJLQaQ6A3Cr/qLWsi9C5ZxHUmLpmF7NVKc/5PIUFnwgefkHnY4o61a97090d2K6NYSlcc57BI/s9YdBTXuKEZ1ZQpv1YLNj/E3RrmGjEzTEnqjc4J/lCHN3bhyPmJ6UlCG3e8jshJJuhpQikCmDyPGyuDN9ttw0Gnqy7JWhwdmVzzZTWAGcZG8CUD7in4iAWESAWGDUXgKrPEI75gHahTMpYn0pt4bhEFxuvwrYHNXkAKAbPujU4kxW0Lm7Yk3kzs2DQqF5tkLsKU5m3HgUILh+sgVDw7mg25RhKcwFuL4Yuajw8hSPpUgHQ9exafbipCXE0Kz0W/1PnkA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0E6gRajybGcChwcfWq+G6z7/pYjlLeRsWwYbynf3Q94e2S8dUeTAJ7C4u85w0S3FcitlFgqJUcZeAXGRh5BzMebw0oREF0oUfpbMrgKm6I9fshPJg+59eiplu3AgRWM4c2hkE8XslupOblPBqHlcLvcM16/3xc+DVJIxdxS8ckwRJr/QS0NRMt4oXf8z6B0RB79JjLd/R0eNTq0ZqxWkjN6G9+tmyIuG2Huf1tzYAHnais3Ikguw/1wsmuUr8PSsiwifo7AnJbLjW8ZyhpVBnPklJh5kMiV08XKVEi+2XbM90SHqOtfDmp38Mz9llZa+Dw3BkwANSxh5kcPXi8nM2DfshmvwY0VIgrsAs9g9fcuzy+Z16pO4xXaIuMAYNH7c1R3UTdQBjOLSzN0I9Qqde1s/j3ZOfwi3e0RjkyUzUs1gXLJ4LVc0+JDjHme+DJ0R
X-Exchange-RoutingPolicyChecked:
	T6RFiUufvTvq+WoAm3en2Aruayq1y8CFhS6lXuUQUt6emq4yk9FVJUPPzlS3rHgBAzjGsJMbyAznB2SwclJEgob2ftr/67G93vrU8I0AJh17GPF0l55j7Il08BiWghjHbKh1kFgXXBkLoB0Igq2T6/cyDxULjLPJ2AI8pP5q6w5AOpbW4hFC/5PU6nvnsDoI9RJCrtETs5jHdVxzn//M+QLjzDpXvQ8YKQ5SEOH+XKwLtPFUp2Fm/RcbmDU614btDzFp6WkaxVIXexwwOGmMoPKRdUJgQkzNiSl1s1/fk0hhaHFYjS49YCpfU6Osw5Ahfde+gZScpdpnthl03rWugw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:06:51.2536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e0374e-f763-4a49-d40a-08df1f0cd6cf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5101
X-Authority-Analysis: v=2.4 cv=VfRir1p9 c=1 sm=1 tr=0 ts=6abd339f cx=c_pps
 a=cIeYbKhGSB7Na0nkMajj9Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=KzVFh0hEau53bWtobz4A:9
X-Proofpoint-GUID: MlZBDlNylKpnWn8k94vO_7YeFASoP4KO
X-Proofpoint-ORIG-GUID: MlZBDlNylKpnWn8k94vO_7YeFASoP4KO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX1sjCUgAIrKux
 9sWHNZPnbpbrDboH3oqgeMS0tfYnIh6Y4/1ay2lexvtk19VDIw4NNMrow/yy40oqJCDxdU8Phxv
 gZIVN5/dz2rvgNCMQMhX7zosIFa0HqxYb7kml+RqD2EjA1iUwg+bS0wy1TewvhKQWrrjgtMWRSc
 PwUlPMafy0AyBDa8w4307Ypm0ewQXONIgxz/MMoBTijMNrmsHJGdczpevmojRl88LykhAYvXkT0
 j8v/ANbITiuvuqj6xhwC5n5Jb9FVB6RO9Lpk/wMbRdzpzW2VGC9GbqidkOfJHgJ5RcjHpLKq0CU
 hvm+35+16VPwpqQGopeeaMcuirDoIGx1H7wj7NpaG34LGC9u9Nvnxrn5CnplTX613Qn9kgLmmdB
 MN21Znb6KgBMR2HPvAozfKT99RSH3aOlHLx+sQvMDLtb8oIpHWhqxSqdVaxdqrMT5L61XZkPePm
 gdWmP4P73NKRD+xN/qw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX6mQtNBCw+Gkt
 8JOQyhmWlQH1tycTfRMWXhj5BdDul0rpNx+yRUc7OjsU2JC5N3/CJbp+71WdhBpx0QrHnW0VrO6
 xAumFesqdVyouzptzeaKQnPubGpEAb0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

From: Andrew Davis <afd@ti.com>

This allows for more exact error message than just "Mbox send fail",
which might not even be the correct error in cases when the send works
but we timeout waiting for the response. This also removes redundant
message printing code from each call site.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-3-b-padhi@ti.com/
 drivers/firmware/ti_sci.c | 187 ++++++++------------------------------
 1 file changed, 37 insertions(+), 150 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 5e7d04754913e..3b58fee07c257 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -431,8 +431,10 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	bool done_state = true;
 
 	ret = mbox_send_message(info->chan_tx, &xfer->tx_message);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Mbox send fail %d (caller: %pS)\n", ret, (void *)_RET_IP_);
 		return ret;
+	}
 
 	ret = 0;
 
@@ -477,7 +479,6 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
  */
 static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 {
-	struct device *dev = info->dev;
 	struct ti_sci_handle *handle = &info->handle;
 	struct ti_sci_version_info *ver = &handle->version;
 	struct ti_sci_msg_resp_version *rev_info;
@@ -494,10 +495,8 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	rev_info = (struct ti_sci_msg_resp_version *)xfer->xfer_buf;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	ver->abi_major = rev_info->abi_major;
 	ver->abi_minor = rev_info->abi_minor;
@@ -539,7 +538,6 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_device_state *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -548,7 +546,6 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -561,10 +558,8 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -595,7 +590,6 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_device_state *req;
 	struct ti_sci_msg_resp_get_device_state *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -607,7 +601,6 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -619,10 +612,8 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 	req->id = id;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_device_state *)xfer->xfer_buf;
 	if (!ti_sci_is_response_ack(resp)) {
@@ -898,7 +889,6 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_device_resets *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -907,7 +897,6 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -920,10 +909,8 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 	req->resets = reset_state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -971,7 +958,6 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_clock_state *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -980,7 +966,6 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -999,10 +984,8 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	req->request_state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -1034,7 +1017,6 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_clock_state *req;
 	struct ti_sci_msg_resp_get_clock_state *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1046,7 +1028,6 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1064,10 +1045,8 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_clock_state *)xfer->xfer_buf;
 
@@ -1266,7 +1245,6 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_clock_parent *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1275,7 +1253,6 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1299,10 +1276,8 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -1332,7 +1307,6 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_clock_parent *req;
 	struct ti_sci_msg_resp_get_clock_parent *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1341,7 +1315,6 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1359,10 +1332,8 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_clock_parent *)xfer->xfer_buf;
 
@@ -1400,7 +1371,6 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_clock_num_parents *req;
 	struct ti_sci_msg_resp_get_clock_num_parents *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1409,7 +1379,6 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1427,10 +1396,8 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_clock_num_parents *)xfer->xfer_buf;
 
@@ -1477,7 +1444,6 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_query_clock_freq *req;
 	struct ti_sci_msg_resp_query_clock_freq *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1486,7 +1452,6 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1507,10 +1472,8 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	req->max_freq_hz = max_freq;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_query_clock_freq *)xfer->xfer_buf;
 
@@ -1551,7 +1514,6 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_clock_freq *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1560,7 +1522,6 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1581,10 +1542,8 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	req->max_freq_hz = max_freq;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -1614,7 +1573,6 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_clock_freq *req;
 	struct ti_sci_msg_resp_get_clock_freq *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1623,7 +1581,6 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1641,10 +1598,8 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_clock_freq *)xfer->xfer_buf;
 
@@ -1703,10 +1658,8 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	req->debug_flags = debug_flags;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	if (msg_flags == TI_SCI_FLAG_REQ_ACK_ON_PROCESSED) {
 		resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
@@ -1758,10 +1711,8 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_query_fw_caps *)xfer->xfer_buf;
 
@@ -1815,10 +1766,8 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -1868,10 +1817,8 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_lpm_wake_reason *)xfer->xfer_buf;
 
@@ -1933,10 +1880,8 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -1988,10 +1933,8 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -2029,10 +1972,8 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 	req = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -2051,7 +1992,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	struct ti_sci_msg_req_reboot *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -2060,7 +2000,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SYS_RESET,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2071,10 +2010,8 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	req = (struct ti_sci_msg_req_reboot *)xfer->xfer_buf;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -2111,7 +2048,6 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_resource_range *req;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -2120,7 +2056,6 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2134,10 +2069,8 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 	req->subtype = subtype & MSG_RM_RESOURCE_SUBTYPE_MASK;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_resource_range *)xfer->xfer_buf;
 
@@ -2230,7 +2163,6 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -2239,7 +2171,6 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
@@ -2259,10 +2190,8 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	req->secondary_host = s_host;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -2582,10 +2511,8 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	req->asel = params->asel;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "RM_RA:Mbox config send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2613,7 +2540,6 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -2622,7 +2548,6 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2636,10 +2561,8 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 	req->dst_thread = dst_thread;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "RM_PSIL:Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2667,7 +2590,6 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -2676,7 +2598,6 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2690,10 +2611,8 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 	req->dst_thread = dst_thread;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "RM_PSIL:Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2760,10 +2679,8 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	req->extended_ch_type = params->extended_ch_type;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send TX_CH_CFG fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2827,10 +2744,8 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	req->rx_burst_size = params->rx_burst_size;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send RX_CH_CFG fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2859,14 +2774,12 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR_OR_NULL(handle))
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2899,10 +2812,8 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	req->rx_ps_location = params->rx_ps_location;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "RX_FL_CFG: Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2927,7 +2838,6 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -2936,7 +2846,6 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_REQUEST,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2948,10 +2857,8 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 	req->processor_id = proc_id;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 
@@ -2977,7 +2884,6 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -2986,7 +2892,6 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_RELEASE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2998,10 +2903,8 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 	req->processor_id = proc_id;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 
@@ -3030,7 +2933,6 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -3039,7 +2941,6 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -3052,10 +2953,8 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 	req->host_id = host_id;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 
@@ -3087,7 +2986,6 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -3096,7 +2994,6 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CONFIG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -3113,10 +3010,8 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	req->config_flags_clear = config_flags_clear;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 
@@ -3146,7 +3041,6 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -3155,7 +3049,6 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CTRL,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -3169,10 +3062,8 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 	req->control_flags_clear = control_flags_clear;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 
@@ -3203,7 +3094,6 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_status *req;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -3212,7 +3102,6 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_STATUS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -3224,10 +3113,8 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 	req->processor_id = proc_id;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_status *)xfer->tx_message.buf;
 
-- 
2.34.1

