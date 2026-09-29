Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B67B3D9556
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713127; cv=fail; b=TyoOb41th9Ie+5wKkhouN4RSPqnWf+1VuuEMbm/3U7UHzp73ATayZsvc+uU5xMtjlUWOPQkNtOZ1IaBr2tEPU9bIy8uOfD07c4JOL57/OkcvRQOxFOrzqA1iL6C0PWd23+gKR3dijF+7XFvLbisY94I4gp7xyQi+LPKqJDKKakU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713127; c=relaxed/simple;
	bh=hhadM7XJv8uwURkPQvq/uNp2FOsQZmCvxZhKHCVKqWM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hKCaK00FiejF7CJtOkKR/qTRVDqN9rU/QUd57tz9jSUQ9l/5jxga+7OGmx0pVo0e14w4Ugy5sUN+5VbRTG8ubxn8/4oJI55tQqkIZ4lAIWrPFo7qpCyhNNPAzPAVRYsmL2nyetgK6hLJDOuXwPv+mx4Xd/4Gb2PjROiv06875S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=UAapAxG8; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Njmz900b; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="UAapAxG8";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Njmz900b"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TGJssY486747;
	Tue, 29 Sep 2026 15:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=UN2lScsKsm7KP
	VyGw7mq02R4zb8ZEpveytlN+PKmJWI=; b=UAapAxG8mYLa2r9yE6AYm2/x4xCFg
	dfKf16SrX4jQo15SKPNrFYABAU4L2cc1UbSYgQXMHUaJAfZvYj+A2x27XEsEmEBA
	u51Z8JBZhj1NgKcTuzUGtSSZi5Q/0tmqraksh80MkNJ5AUk7bE11uQKbFRiA4bF2
	tVeX8mhf539fDuNIZxWVHjBCmPYIzlK3vgFC2uQsAbg1GfumhRxshDTLtXARnaED
	K/2SRFuGMwsyVsZRe3BqMsgXQ4Im88hLUuIN7JlT/3a237O+0+/OCZxjwuvIXR8k
	n1m+syojdxWu8FxyPaHwZKzDRcCoQT6bHV/a6SjT23HHm2+huw5A3Iqsg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012031.outbound.protection.outlook.com [52.101.43.31])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0cpc39y3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:18:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCdugbvtdfE9ly7niyGTueVa+v7AKc75jsNuswzWR26tZDArei91Ij6ZzTRgDa99pOLHCKb48Tzeb3LuzK43OuK0Cr0leoNprCTNaFiBZhjWoCNcyBZ8U9zHJrnEE6mFbnwA6k6oBWYzm+tj6B4gIxQ7OkBC5YUx4+MO7Ux0MWNFWsfAj7Bzdj1jgCNFdfqr3id4s3zLPkcLWL+YiiZg7tdE6KhAOjAHG1WsqZh9lcnYt0OAlr8yZ4J6CnQe+2nM0V4t+9WI0CCssoDS5TrsXenGl1rhWK9Hgss7+3hT+PK2PWiuBE2uDYbeb3wPrnwuNHkOahlcPkA378MGP8K1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UN2lScsKsm7KPVyGw7mq02R4zb8ZEpveytlN+PKmJWI=;
 b=LYv9YjZ3y/fiXDEuiENIjL27WZdoGJWqCkDDYJDVyA1NihPKnL03x9P5MkynakgezGgXxsoDKsWa5sdqh0xgdfzwXtqu6ONuTNmDIVloxuU8BlR166vBwTlkRnD+Nq/ynko32eDeheRD2GgsjFxEm6tdF1x+WcvTxcwNcgYLSqTRfOLCHgvjn9NAK99YHiyU0IKhI97bSTEyZ3Ro9DlmoYoDneadtjOR03RM/dRNAb78RYj1DPW1XgA0+2krzfhVuZOCHda/8DG7JBfmEHnE5UyFEmBYt5pl4WQSe1T67F8uZV00p8WKxbSJYxjrhgZny34NxnXkuMISmx5B5TiL8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UN2lScsKsm7KPVyGw7mq02R4zb8ZEpveytlN+PKmJWI=;
 b=Njmz900bIxakuUtf10LJSb6WOrpXSswyfakuv4VJ4f2YKgwmPIEo+TMXOCpB7GDdmP+Q3XKjzKOpkJ4KeGeRsY7qX10D5wOxQQMr6xj0ciu3HYSYY8HUyUh+M059v/zuQvQxvTbyv6oiu6J6XZemi9lPPPHLSUtY5frnvypcLx0=
Received: from DSSP221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::17) by
 DS3PR10MB997702.namprd10.prod.outlook.com (2603:10b6:8:346::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 20:18:29 +0000
Received: from DS2PEPF000061C5.namprd02.prod.outlook.com
 (2603:10b6:8:3d5:cafe::54) by DSSP221CA0006.outlook.office365.com
 (2603:10b6:8:3d5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Tue,
 29 Sep 2026 20:18:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF000061C5.mail.protection.outlook.com (10.167.23.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:18:28 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:17:50 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:17:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:17:50 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMY1688208;
	Tue, 29 Sep 2026 15:17:47 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 00/22] Cleanup and Refactor TI-SCI driver
Date: Wed, 30 Sep 2026 01:47:24 +0530
Message-ID: <20260929201746.4078803-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C5:EE_|DS3PR10MB997702:EE_
X-MS-Office365-Filtering-Correlation-Id: f86c1062-b28d-4adf-0fb0-08df1e66d2c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|10067099003|56012099006|3023799007|6133799003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	imjNENC2kt8W8Nfsltb0l4FhvguLQujoykoopLaGueTj+/VPAe8Mp6rRM87waBixOXqu363Yu1xa2cLWkiW+xGEMBTuuykaM1l+N12/lLoDKu0v0ODvO/oKz5nd6wvtcVUYim4DJUr+daV3J0JCe/ZKjyUrNQutLi/9HxfqU83HxoVvYG+vPOZYkVq44Xafi0JViQc7Et+lL7L3AATFKaMTTzwzH4fR0ukG6KlExzXffJlX1TOpdhdCPB/eCvCfjcKlK63U99DD0KleNlNndndYp192PgGgJJ1Vfrrk5seEtQXBmhxmZsfLf4H5SQrL6hn9AiF1JXg3Ky9hSAqPftawiAdM4rOOD3kqAMAXEc+rD+/2K8l4UP4E2mE3AWxSPUNXyxuK8/fwMUXQix3dYbFpiexjUNw5cZnro8pJKAbvPkdf+qdapuQofMk80Sb4r8aVmwIJzlY1j/Mlo7dZza5HRJosfeHgCHy1mpCUB6J9bWHu7H+MYBitefZZJqnT16C7AIfjNYPvp5/qnYnAn+WI2jNgKbpDRKmEWC7dYZ7R2FOXa2zY2rqyJizadIyU5LqXQcVj/z1kCk0nNl0aMXfqeP6EYl8gGsc4PDpCJQh21oXYElrBnHDR8K+9wpJQxyT7sFq66RvM02yvCgUIByCIEr4aASYzbuV4Frr7s8RgpZprZ7IS7lFFJrUgzaZex4quE1C5D6nrjmemH4VzQgQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(3023799007)(6133799003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/3jL5/olYoI1XHQnhsPcYTLFRc0j/eDkABQaEuNEaVxtV4y+VKeVQeRGSjOWM9HurZ4m5+LjcqeZ74FcrbiWVHPHtlegHQAbH/jylYIHe7WaYXxmqYhh8MkoPAoXjbcPsHOO+lU2d7leKAAIUdzRITMwR5rPV9tvPn8wq1XM6/XXx5x8Zxk2nYYZ6oxML+eWntKhVG50LSZs9nmgpWE85P37esOcDZEqO+RZOA13EZBI9aeEhUQjDgTkNiQJtj374LAkmbwTmeUh5E98tYBRnY6JQqDLHOKsHs0huEyjvykG0Z+Dl5M+gYCrxS/brVpnwiehekkHCm4qQwWYmUrIP7U8CsiY47v7MKXcMQ0EDg4F5wW4vSStlA6RZG2zwu/EKYWKlV4PeV2bc/ldRxyQkajkaGmHi5F0+Ir+xsSER35TBL/0YQH0qO3zD7N9kJ/U
X-Exchange-RoutingPolicyChecked:
	i28Dz4MtIKXqUvZKSvCRRzTvK9CQU5xD9eSOYWXRMJkz26PEXr78PGPCoylMoRSTx7g15tvG4qLnJY4fTR9B8LUineaYgJrRmchGo0D9oikZMQvdAt0WLfVewQjl0T8wkEW1cGglKr10ZG+CIApqQ19gwIJqhVTaErBsmxyHnjW1YIxILrELa3DZe7/qnbKgKt204SO/tmnz5aBHoG9h6QGmW7skVeOoCFIZ+hNHQYrCYDZQ6Ux109UxlxMMTjDOqpNOSsH4ILsa1CRllVthAaUSgWIF2DsI4wjStEoULWOvoZfrs5g5TgjQYyfTy6p4OKqOvqCzK9KxAweXZ6kbWA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:28.0418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f86c1062-b28d-4adf-0fb0-08df1e66d2c5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997702
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX3A7uz79mn3Kp
 2MbWWZ0o6Aqh0dlEjFyZTTowTwn125IlNZE39jmeyHLlHImEYbaaqsbMjAgQt47WyL8/ETZy9Mx
 BUMprT0ztXySPctv9Zz4IzzJp+k5bRc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfXwTUjdxNMPOwU
 1D6Gd6zMcQkwcESfCUpdSKBQ1T1NVHdjQzC+Mgipw2xdeVJcJCqSbMTu9jf6aOBjMZ4c1PvaFka
 T8oTuiG3rq9NbIa2kG9dVUu+toADB+0lPX6diq+fvsWBdwwMaMptDLLbejMNqz73xo9C/TAGBgX
 hj8Vnvjj+CiPzJWP9qsLWz2XLQQfOL+5ERr60E9Uw1uyuq6lIIrDCe4rvWpBKBhabsm5yBMQIBv
 I/TC+gzkgihzLOYVJA/Zj43c5oZqC5r2B0ZqwQvD4kpxYuwSWkDtzpBNPwhcCGxXnv2857EZRaV
 b8zG2YhMU0689bA2VVmnhUWeseHdalaiivQwTGasMFlzvEWJwkY/u6c6sD2qsEwn9ZQdv9dvKln
 JAoTh85hR7rV9HMIqtxHOyA3kPX7OcemXgzb/YiPtdksFXHKUtxgSOap/gFSpVjGo1Uz//Gb6td
 xAMjSNMWn1MAWLLvOHQ==
X-Authority-Analysis: v=2.4 cv=Y4xtIReN c=1 sm=1 tr=0 ts=6abc1d18 cx=c_pps
 a=qV0RoXYxPRq0QxHYvE7eUA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=FQqB_tFWpP6lRHZUUu8A:9
X-Proofpoint-GUID: SCkrgvKGGZWzJjzBeh6nO8-mJHsNcAwN
X-Proofpoint-ORIG-GUID: SCkrgvKGGZWzJjzBeh6nO8-mJHsNcAwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

This series does a lot of cleanups and refactoring of the TI-SCI driver.

Patches 01-11:
The first part of the series refactors a lot of common code from each of
the TI-SCI message functions into a single place (get_one_xfer() and
do_xfer()). Result is removal of net ~740 lines (~20% of the whole driver
size) without changing functionality.

Patches 12-15:
The second part of the series does some preparatory work for being able
to break down the single large TI-SCI file into smaller files.

Patches 16-22:
The third and final part of the series breaks down the single large
ti_sci.c file into smaller logical files: ti_sci core, device, clock,
pm, rm, and proc. This allows for better readability and maintenance.

Note:
Since the [PATCH 10/22] (first part of the cleanup) now passes local
stack values as part of request, the following[0] patch series
in the underlying mbox layer is ideally needed. It is better for those
patches to be picked to avoid any KASAN warnings and possible duplicate
message resends.
[0]: https://lore.kernel.org/all/20260929200159.4033010-1-b-padhi@ti.com

Testing Done:
 - Boot tested on TI K3 J784S4 EVM.
 - Tested some of the Core, Device, Clock, and Proc ops with remoteproc
 - Tested each patch for no new warnings or errors.

Thanks,
Beleswar

Andrew Davis (18):
  firmware: ti_sci: Move error message handling into
    ti_sci_get_one_xfer()
  firmware: ti_sci: Move error message handling into ti_sci_do_xfer()
  firmware: ti_sci: Move check for ACK into ti_sci_do_xfer()
  firmware: ti_sci: Remove out of place RM debug messages
  firmware: ti_sci: Name response variable resp for consistency
  firmware: ti_sci: Handle xfer cleanup inside ti_sci_do_xfer()
  firmware: ti_sci: Pass request struct into ti_sci_do_xfer()
  firmware: ti_sci: Combine xfer allocation and transfer functions
  firmware: ti_sci: Fetch info struct from handle inside
    ti_sci_do_xfer()
  firmware: ti_sci: Use tx_message as message buffer directly
  firmware: ti_sci: Use rx_message as message receive buffer
  firmware: ti_sci: Do not export reboot control
  firmware: ti_sci: Move the huge ti_sci file into its own directory
  firmware: ti: ti_sci: Add missing includes for self-contained headers
  firmware: ti: ti_sci_device: Move device ops into its own file
  firmware: ti: ti_sci_clock: Move clock ops into its own file
  firmware: ti: ti_sci_pm: Move pm ops into its own file
  firmware: ti: ti_sci_rm: Move rm ops into its own file

Beleswar Padhi (4):
  firmware: ti_sci: Fix some kernel-doc references in structs
  soc: ti: ti_sci_protocol.h: Add missing documentation for structs
  firmware: ti_sci: Use pmops fxn pointers in suspend/resume hooks
  firmware: ti: ti_sci_proc: Move processor ops into its own file

 MAINTAINERS                            |    2 +-
 drivers/firmware/Kconfig               |   17 +-
 drivers/firmware/Makefile              |    2 +-
 drivers/firmware/ti/Kconfig            |   17 +
 drivers/firmware/ti/Makefile           |    9 +
 drivers/firmware/{ => ti}/ti_sci.h     |  258 +-
 drivers/firmware/ti/ti_sci_clock.c     |  553 +++
 drivers/firmware/ti/ti_sci_core.c      | 1320 ++++++++
 drivers/firmware/ti/ti_sci_device.c    |  388 +++
 drivers/firmware/ti/ti_sci_pm.c        |  145 +
 drivers/firmware/ti/ti_sci_proc.c      |  214 ++
 drivers/firmware/ti/ti_sci_rm.c        |  907 +++++
 drivers/firmware/ti_sci.c              | 4259 ------------------------
 include/linux/soc/ti/ti_sci_protocol.h |  389 ++-
 14 files changed, 4118 insertions(+), 4362 deletions(-)
 create mode 100644 drivers/firmware/ti/Kconfig
 create mode 100644 drivers/firmware/ti/Makefile
 rename drivers/firmware/{ => ti}/ti_sci.h (89%)
 create mode 100644 drivers/firmware/ti/ti_sci_clock.c
 create mode 100644 drivers/firmware/ti/ti_sci_core.c
 create mode 100644 drivers/firmware/ti/ti_sci_device.c
 create mode 100644 drivers/firmware/ti/ti_sci_pm.c
 create mode 100644 drivers/firmware/ti/ti_sci_proc.c
 create mode 100644 drivers/firmware/ti/ti_sci_rm.c
 delete mode 100644 drivers/firmware/ti_sci.c

-- 
2.34.1

