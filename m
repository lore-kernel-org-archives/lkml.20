Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2E551CF6E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784503; cv=fail; b=DmTrRaczEPfhxQYM8lkXZHkfmyHvWIBlp48VOtDqqgMrGLaMxkknp4QAm/H1XHMDjvRxuXIZRjs608ehadXqhgb/lA7gp22x32NCf4k4co9okdUmAtrOiXxyaI/GtpWXGNH7Th7hNdU37BEgQhAkBvHP2yYr2ai8zW4OWmXoMlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784503; c=relaxed/simple;
	bh=6JK/7mKZhy6LrB71txu7gDH2STSGZ8Xh92OKkIQ5qWQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h6IE7Lb+vNrv7WzR9vuuYLJXSS2u6bp2UrDgAoak0OijNGDfVjpiOnx8U+35d6vrOkl1kcaHhyB4H2P5ELZMtgbcTh3M67CvpIM6/rhNbJ8lHqCCsp++ObeFg3IN+fQ792UYUrGtDGO2g7+9Bx2FupjKVlpzHOVKPkfCxygQcfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Xe6M8sIf; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=gfmpg6qk; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Xe6M8sIf";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="gfmpg6qk"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1KlQ3057453;
	Wed, 30 Sep 2026 11:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3Jd3UL4cIMk+bmJXREikGqn9FObassGfIIDTLfVOI
	jw=; b=Xe6M8sIfyZR5/hUkPWT++Q+vm07ARz+9s5ZivqyTISfjVdmP0cVG5N/Yr
	4Dd6gJ4ZaTaKqF0K3buMNmkJOMmMDblRmTSxO6h5wjtAj8v2DQJ7N7T6UdtwZYmj
	JlO0vum6YKEXYmTORzhfzFiYRCS+EuTOgVYnbUsbDejfEeX9OYz/dfkCHc2Mr3aD
	dE4x0Jnxwoy0UK2WHvupMFuGM6fPQgpgW4JHBvsDCRwzF/I+5VYcy0Sh5ozHriRp
	XVTDxcWgwpEt6iIE6mG2bvYR5XSixxaGugFbG5y5isO4T6W8Xbo6uGaBmp3DxjTO
	YRC8SUuWmk7lqbNXXeq7un6zWoLUQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012041.outbound.protection.outlook.com [40.107.200.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0m9fej2h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:08:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9uNxn+PEoudzM82m5p1wADgnD+Y7oECoebCtO4KxkCpM82FnEbZ9x/0IdV22pw2ADeSHkaTbL7Bgse9FSMZAgoQvQaUYDXj2UvcJfKaAP/+KRHPURGrD01DCA10WxHQszHM4/PPu85sAuZWmUgvvkYivREezqplZ3CtQl99kt4tKqvi/YTWMzIUaHMxzVmH8tp605Zw3bRWp0muw0tNt/DiIhfjwcxB/z7GS3ILdUDmi+70Wwb0m0eBq/JvseWNEqWn9Oldefq7klY4FWZp6WTjQ+XK9VAU0mcCOrDYcFN6A9BQYoTHuNTiXX5lphcsDBTgasdwF7jRLK6lpQwrfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Jd3UL4cIMk+bmJXREikGqn9FObassGfIIDTLfVOIjw=;
 b=WM+X7iuxVLWZsQUP/KjSBtnVUX9DYoqQR3aM7NMY6h+dhq44fKc6JdyGWgpWrGGU/tLDZTXPDy1VLzhyXUdFbYBkd1p5knGWUoxNnr8or6frA6L3hS5VR01Ih5ZKdIy1/eTN8JequOk62WyEHMtWIpdBXp9a919PsRZlVInF+cYYf4nWi8NcDU+80WVl6nEIJFCWj5drp+UZRhq9vvrsvDS+ktqUaBp05SLrIXkSo4zcjLaTFZ652AVXgeDIn7eUG20ae19AIboTTC0BJ0yq2FW9cqxML2n3R1P4/p/LYJUnWCzbdTA7x8yM73k9qpaBku2ZF1wDzCpM+XnDSjLbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Jd3UL4cIMk+bmJXREikGqn9FObassGfIIDTLfVOIjw=;
 b=gfmpg6qk4jS41Eak1FHyXPQS0E3Q+ilmVnLmKbXMCQdVQ8y3qsvnVeAocehBfkLP+OcivAoZcwM7XZjXFK1KtwhBRWluEiOaECIbCDeYcRTloBucHXIJz0QmqbhJo/CfZAL3oipN1SnQWyXjmKM6Uot0kEexnU1rgsTjH1TEM7I=
Received: from BL1PR13CA0362.namprd13.prod.outlook.com (2603:10b6:208:2c0::7)
 by SA1PR10MB5821.namprd10.prod.outlook.com (2603:10b6:806:232::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 16:08:00 +0000
Received: from BN1PEPF00018549.namprd05.prod.outlook.com
 (2603:10b6:208:2c0:cafe::99) by BL1PR13CA0362.outlook.office365.com
 (2603:10b6:208:2c0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.8 via Frontend Transport; Wed, 30
 Sep 2026 16:07:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00018549.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:07:58 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:07:01 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:07:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:07:00 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68WJ3425232;
	Wed, 30 Sep 2026 11:06:58 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 16/22] firmware: ti_sci: Move the huge ti_sci file into its own directory
Date: Wed, 30 Sep 2026 21:36:01 +0530
Message-ID: <20260930160607.2674980-17-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018549:EE_|SA1PR10MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: e2862271-c0c4-4500-cba9-08df1f0cfeeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|30052699003|13003099007|18002099003|22082099003|3023799007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	r/KVAtoFzd+iyh77MoiVUK+na/TxwQGVofxwbI69MxTatvB6vYWw3eKFPB5AvrPb7PJYfROylZDLjx9WCnEwuRe9IDX064XLZ3wDqKyUlawGxC/TFcFxYHhEbafxqSEN01/5oYj1KcShn1nPrlK89L1AKEyRBQPMGZ9z/be5fGMjfUKKBhkZ/Pr2m8dRuR5/Ue3n/Z58Zwm8ZlOE1kLPpHEt2X5yDyAk2Sgx4YW7b4BtMhHVhCQgKZMosbn1l6OcOYIunqM7Uecrf+QBycNhWwE48k2OzWPWfoQOgLlBTx7Sv5+EBeXhqI/VgT5tDagSTMoyic4miRcnadz8YE7qOWwusp/dgfThLGBEyXVTz629nS+MP/v2bs6o+7TqLWn5eU+D5WVVfiF+NfEuovN1jrjdDwoHYifFKFY2GkV3DLPh+J0HDNutXMW5QKQtr15gw9C2/0MFM+/88GTSSEzubUQsv5PQvhLZkNq8czBgJYJ6yOaWh8BWwyjudRv1A21msLnBYvQ/8tfBFXPOXzJKLHlauJrMBx66OliHSnHARwhJcItkgXFnO6yaFUNf+KsQA/eyyO9wQ016gcRg1UMTtituvb8vEEn7dBy37DBIbpI+OMos9SGOvKc79+UIomjBo4BykbS/qvOZ/Vb/BXqLGMNHMPSRDXp+tn20VuDIKRfG3PZoiISMTpJPqH90nFCqUJZzxXGrByvoPFkLkAV6Yg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(30052699003)(13003099007)(18002099003)(22082099003)(3023799007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	94+DiQHruDblvKt1UwLoOt62Ku6RIj2r9fpLDxiJD1DUrFDICA4BHVSnSM4EMRRkDSqeVUOpxahTGQ4EhQToNoql3WfmbkKz5DuKXTyuB9zENoA5sWVveUuwZVpK30zq2xlwbwffOZzPRD3R7dPQTE4EuNQPnkFys3K/vY5y77asgSh7CMDQt4Mk/IbnBj8emwOzMLXdGfDegvAawNUi5pACF4zFiNAEJcmsxgPvzlPW/9pGDNlgfz8bijxR1GGmuWB7hEtfHQ1U8+gtGFtKRkf2BlBt9LP7QWcoM+kQYiwAr4JnekCnYG0gYHeFj4Z+hUQ6DHHO6z0uTaKDcWReD6ImNQqrt/Je+sEmhjH9483DlgNR2Olfy5Strd1LC3/mbJXNPiTTpxZoJLFQqGbHrgUth+mmFCECMPyMFzrDeBf/nZ15XQIXCELAR47O246c
X-Exchange-RoutingPolicyChecked:
	XDho2JafFJISpp2UMPXYxY2Y3GAr+2rszbh/ExyhHUaC9A5NM+mtpgaNooNxlUIrxW3dVqIACVT2iTripKaFKsbSNEE1YnHCnmCabiTH6z34u3W26YjCiDOljeySuTacr6ZSCgNrQs6DXQsvfJGXMAmnmGCMdvichGMKPXrM2UPDG69N3kQzB2rpjhCbNCXw6y6u8qTuFObp5iVSPBR6VVqnog637/Aqy0qBMtxhgeFWEeDpn8B+6EO/MoyMzeF73CeEd5iBq/wAeexXnhEaMwHpiEa9k4FTB+aOwADNkr+P/EdQsqQKP7bWo6tM+2acF2WcgqlErOOAryVVFNkp5Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:07:58.5587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2862271-c0c4-4500-cba9-08df1f0cfeeb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018549.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5821
X-Authority-Analysis: v=2.4 cv=VfRir1p9 c=1 sm=1 tr=0 ts=6abd33e9 cx=c_pps
 a=kwEYnkRUmkAH8qI+i8sEWA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=TvPnFieDHSlyjeEufecA:9
X-Proofpoint-GUID: zJq4WWHPe8GakQTbtTPFglBrb7brINx3
X-Proofpoint-ORIG-GUID: zJq4WWHPe8GakQTbtTPFglBrb7brINx3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX/5dfMFM9Rod3
 ILu4DBsboGdaiSUAzQujSNcwx8/Sj8wEVbssyayeXMyftV0wpu2CZb1S04EOo9dh0aCRF/VpnpD
 L3QKgxKynX0Kvc16pVNbl/cNtxsVm/J+XOXDy5ryR2P1yqreNVKy453d0ilkMs2SSDEZQdtq283
 xVCBacmpbeyTl2YYw1A/nM1Quasm+uRNTJG4mOxzExgUrv48CQXsb0lrb9MFJUpNejVgSgWHn/4
 ekDJxQfSr4b2Lh1qFu+OowNxTCRLT0Zh9VGhuh4WnzOwyZTrtrcGr9r7ZeRdJ1p20DUt233eSiy
 JHNZOpksfaUHvmk4iZqmt69900N1nqgQF8B8AK5+2skYUf95K2vHFlPzvYeKVMibW9ywL0E2mji
 tYVWsn8AHkV9XfEJ0y1DVUO6hRuHdY86dqXRnh1zyw6U/BdR56/x4zWVaERYdN7nnqwTFm7HrOY
 oOsCzvf+Ri4Y+r+bz2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXw1Ev89U3GV0D
 T9iC9DVo0bqFDj4xjkLIFSyufCTtBfehHAGcCLmkpw8Q6Da3zmmmk13lFS5WttGgeDhOPrbWt2c
 DAfRSoGzOl8RrH3LUiPO1u56lR1+cfw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

From: Andrew Davis <afd@ti.com>

Move the huge ti_sci.c file and its header into its own "ti"
sub-directory. This allows for cleanups later where this file will be
broken down into smaller files tied to operations.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-17-b-padhi@ti.com/

 MAINTAINERS                        |  2 +-
 drivers/firmware/Kconfig           | 17 +----------------
 drivers/firmware/Makefile          |  2 +-
 drivers/firmware/ti/Kconfig        | 17 +++++++++++++++++
 drivers/firmware/ti/Makefile       |  3 +++
 drivers/firmware/{ => ti}/ti_sci.c |  0
 drivers/firmware/{ => ti}/ti_sci.h |  0
 7 files changed, 23 insertions(+), 18 deletions(-)
 create mode 100644 drivers/firmware/ti/Kconfig
 create mode 100644 drivers/firmware/ti/Makefile
 rename drivers/firmware/{ => ti}/ti_sci.c (100%)
 rename drivers/firmware/{ => ti}/ti_sci.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 30c1cdd0fb385..fe53e152f2249 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27517,7 +27517,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
 F:	Documentation/devicetree/bindings/reset/ti,sci-reset.yaml
 F:	Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
 F:	drivers/clk/keystone/sci-clk.c
-F:	drivers/firmware/ti_sci*
+F:	drivers/firmware/ti/*
 F:	drivers/irqchip/irq-ti-sci-inta.c
 F:	drivers/irqchip/irq-ti-sci-intr.c
 F:	drivers/reset/reset-ti-sci.c
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index c183d98c1e8f5..69cce12ae8651 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -233,22 +233,6 @@ config TH1520_AON_PROTOCOL
 	  the kernel through the Always-On protocol, using hardware mailbox as a medium.
 	  Say yes if you need such capabilities.
 
-config TI_SCI_PROTOCOL
-	tristate "TI System Control Interface (TISCI) Message Protocol"
-	depends on TI_MESSAGE_MANAGER
-	default ARCH_K3
-	help
-	  TI System Control Interface (TISCI) Message Protocol is used to manage
-	  compute systems such as ARM, DSP etc with the system controller in
-	  complex System on Chip(SoC) such as those found on certain keystone
-	  generation SoC from TI.
-
-	  System controller provides various facilities including power
-	  management function support.
-
-	  This protocol library is used by client drivers to use the features
-	  provided by the system controller.
-
 config TRUSTED_FOUNDATIONS
 	bool "Trusted Foundations secure monitor support"
 	depends on ARM && CPU_V7
@@ -309,6 +293,7 @@ source "drivers/firmware/qcom/Kconfig"
 source "drivers/firmware/samsung/Kconfig"
 source "drivers/firmware/smccc/Kconfig"
 source "drivers/firmware/tegra/Kconfig"
+source "drivers/firmware/ti/Kconfig"
 source "drivers/firmware/xilinx/Kconfig"
 source "drivers/firmware/arm_rmm/Kconfig"
 
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index a855d36961732..309145992ee5d 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -20,7 +20,6 @@ obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
 obj-$(CONFIG_SYSFB)		+= sysfb.o
 obj-$(CONFIG_SYSFB_SIMPLEFB)	+= sysfb_simplefb.o
 obj-$(CONFIG_TH1520_AON_PROTOCOL) += thead,th1520-aon.o
-obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
 
@@ -38,5 +37,6 @@ obj-y				+= qcom/
 obj-y				+= samsung/
 obj-y				+= smccc/
 obj-y				+= tegra/
+obj-y				+= ti/
 obj-y				+= xilinx/
 obj-y				+= arm_rmm/
diff --git a/drivers/firmware/ti/Kconfig b/drivers/firmware/ti/Kconfig
new file mode 100644
index 0000000000000..07d7968f9cc8f
--- /dev/null
+++ b/drivers/firmware/ti/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config TI_SCI_PROTOCOL
+	tristate "TI System Control Interface (TISCI) Message Protocol"
+	depends on TI_MESSAGE_MANAGER
+	default ARCH_K3
+	help
+	  TI System Control Interface (TISCI) Message Protocol is used to manage
+	  compute systems such as ARM, DSP etc with the system controller in
+	  complex System on Chip(SoC) such as those found on certain keystone
+	  generation SoC from TI.
+
+	  System controller provides various facilities including power
+	  management function support.
+
+	  This protocol library is used by client drivers to use the features
+	  provided by the system controller.
diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
new file mode 100644
index 0000000000000..433b108782fbe
--- /dev/null
+++ b/drivers/firmware/ti/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti/ti_sci.c
similarity index 100%
rename from drivers/firmware/ti_sci.c
rename to drivers/firmware/ti/ti_sci.c
diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti/ti_sci.h
similarity index 100%
rename from drivers/firmware/ti_sci.h
rename to drivers/firmware/ti/ti_sci.h
-- 
2.34.1

