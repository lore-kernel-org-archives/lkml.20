Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980E83AAF55
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713110; cv=fail; b=VO+8aVKYIBA9sawoIaPFZlmnqknGe+RoIkVOmf8JDj2/0e1Drjqa8clP39ugvz2X9C26PMTJJsOKcQSc2gjkFe7ZO0aTWm5amEGHPOZMK8im9U4GX8kA82atI3m0qjDCGMG9XykN7CBTv+w7fofnFXjBegFIpdj/itXBaRAPjWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713110; c=relaxed/simple;
	bh=+X4rOGXtfokidxjQ7wFUhmst1WuBzYb0sUaeER1kNu4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oG9zBIxHt75EDlamYeiNmB9mvPlOmZ66cc7hd6H38qgQfnuTTO+d2IAmDQDPTtJcwVY5UDuxl29b3qBDCzLElKuSNFaZ9Y7ZNrGyIb4iP/OtXNWo0M+rDOBFYzWvfT6acEJP741aS51jffTVMxO7VsB+5IDnL+8amPE7DbR++tU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=N9o+xXQH; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Tl9BI/X7; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="N9o+xXQH";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Tl9BI/X7"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TFeYHo152400;
	Tue, 29 Sep 2026 15:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=IEUBMmRYJ689yl1O8X5AJD4sGmKuR6Jk4MmbUUjej
	70=; b=N9o+xXQHXP7ID6YZhxNimWNuDD18N//K25ZFlIzlmB909K+IcJwEmiJuX
	Qn4lYCGGZKZJafg/ytLLkjjZ7H1m227DhJAPK0bjrebq0a9GKIB0E54snp35JKMn
	/FS71gyYT/9u0cKcux3+6ma7XBbJzGDZxHlub/FkqVW4ddX0xErJ6hYRrmKLbW2C
	hBE3I0giJRNt/7ekPeKpK1v1KbTikKv+Pi/NtyfwInfpgSJNov8V6Jmhvrqu70bX
	w/mIkrsmaBPiflIMU5UrQEN2gfRkQw9wQZr49xZD/Mz/1crCdBxfRh1YwCJQPNfy
	SAaEnO3zxVNYcaZrijgxdcRdT/+/w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013024.outbound.protection.outlook.com [40.93.201.24])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h099y45fb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:18:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIZdyGVDQHn++Kzpxq06zL3WtGJ3KViWRwBLU3tksYFfacDlm6E52EsnDGcjjmJDk7MNGI3jRhE39tak+NYV88VtoZCkgwL2/tjIdwHtfFyyM4o0Jj2imZ8lAEJmkeg49Yv+UefqoBGn+y97qe8W5AeOVQ7jZVeGi16bcbIdXvmoj0+xavuADfbRrNqP9Zk6thdOz0eoeSj4hU/TsioSlZu8ORwOb3iXc1UeiZhB9AS9/UGu/uHbW/+coLCSak6gu29fKqsgyQ6jgzZBfKIgmZCCiR0Jo2U+S6I8wrAgmXSv/AC0y+1YCT4PCitgRXZ113I0/QzTOL4RdggsSRW6rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEUBMmRYJ689yl1O8X5AJD4sGmKuR6Jk4MmbUUjej70=;
 b=Yy/3WOr8+7o8oJzszb4ga6HfEqppCU+kMn9sfq586gtDMTs1uQXsZLTsLUR0eXPzezeB7HiJyRS+nggNAB+vY9yXQ2NvVP5dg4E4enbaDqZlquV4O4YL8tNENkGVrtPXltehYAGBRiWxmPeVK9KFcWNskU3x6dIsOMCdD0bGGBewiuMjgxV2gLdVSu5X/J4nu3gS9mc9Y3KQL46mEn0yJzgni374VgPhGwffTSTkoUiFMg1ruZLc4DVyHCYoAGcMw7T/gCEbGIgvW26cMjBxceQfR4aGDqf9ioCkSNCHwGVx4V2q2oTAsLc60pqAacxhYjnF/liVb1M7y4sS4hjacg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEUBMmRYJ689yl1O8X5AJD4sGmKuR6Jk4MmbUUjej70=;
 b=Tl9BI/X7Ji39BcBZTgC+u1kaF8njyiZs4YgerGC6+zMRrBX5BVGwDckjaewErcnrp+UIGpYG1FkZzo8JAAH5JEMfjw5+Z7RaKnJ8asZZeivgLihm7CXGgCkcQK5j2GB5n2z1tRWnKLm7RXMbaf1XyErxGRVTS2zgTrC/gcVLftY=
Received: from BLAPR03CA0022.namprd03.prod.outlook.com (2603:10b6:208:32b::27)
 by DS0PR10MB6918.namprd10.prod.outlook.com (2603:10b6:8:136::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 20:18:20 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::8d) by BLAPR03CA0022.outlook.office365.com
 (2603:10b6:208:32b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Tue,
 29 Sep 2026 20:18:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:18:20 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:06 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:05 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMd1688208;
	Tue, 29 Sep 2026 15:18:03 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 05/22] firmware: ti_sci: Name response variable resp for consistency
Date: Wed, 30 Sep 2026 01:47:29 +0530
Message-ID: <20260929201746.4078803-6-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929201746.4078803-1-b-padhi@ti.com>
References: <20260929201746.4078803-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|DS0PR10MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: c97248c5-131d-4dfb-47e6-08df1e66ce5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|10067099003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yJ6vklzBE9Mo55F0hfTgIetgWtpQhPo3W1xXyGwYe9b0Z54Wax+OtIuGjND5ayZ+A4zI8UilzWTvlHXl0L60fHKOdRBK+IRY4pFZFANfC93RQPwSRuqzaTJXMksdIK2eDRDhof02KLwlb0WR+JZyg3MpyZUWDeqWlBGatyXGSHAkj7l8+ZEtPbPbjJ/E51e90NqC2PlzRgLJ67ZZpIE/hepqsLhXPii91Jjt2S5jQRBPuHvFfQv1T2g86Dnn4Hk16u2o8GowQiFiRYFwwIRDvsC4tXCrwYcaBSzj5BI8MmoAusb2GYN2odGS0xU0fUxyksQMQsF6EF7/MAcNMJYzf9HBmLOI6yYh1TUZCINgQsYIFaG1JYHJf3fFQbHfLEmWnfhWMVn4aq9v3nTOjRKIQbvItBiyC9PFooq7DGFVbC2qnUkF1XCysnVONnNWEVZYjWYc1J5QCwQS0hySKeq3LHY4yGnH4Ra9L6hDuRb2eqs8bUOkObCXiCudu2+B1Ctww79TQ5UEOskwIh/mvw64BEJhmz8ir+dSdM8MF1pg3EpXUCoEdWWHwMm0at2WHNHWI6XimjBGIuS2vukTS7dMW6+rW1d6D/fZL7YkuftV4BO2eU2jDZEoHbUWF+J+J9RWsL8Gh16SrGJVeA0LgtR9yBeGozGueD5wQyHjaPirViBTOGPYKkbnIWnaTgpBmxsB1JwhAIanSDGX17ieGqnK+A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nZt+OdhLXVG/519qVXcTt7GDAh0AzaNR3pXpCZVL4SYmcY3fHFPxSHE/OjNy4jNPpWIHpmJBbkupfchD6MtByXYsVOZFqNgjcbOE73E+QPKc0G9ctobZvzNwSJGZGyCg71Eu1cmCK4ApjJ0P2rlF6jcg2D4JfKVxsgi3V+P7sYgxsjlUCg+JocZTXXrsiWSb1Tf72edYWd/I5xrShGgj1aVsr53Ay4hYD607z6VyJve89k27paGSOBxizVLzdULBJAVVtpmV87ZDsPPc/ANTkbDtcIkg/XuIPNHnRET4SOlvfBnfaeTtFO2eGYdsjiTHO6z7K1VW3esnXKKcOCZ8GhVoNVlyWvblqWPjh3XF9F+a4Y5/o4/wH9bKPLNI4LBrLVjNlLAAPe/4rQNKHObGM1234hZ2jvCSknA0hbBI0k7S8HxP+/YvI+a2RMMexHmf
X-Exchange-RoutingPolicyChecked:
	ooNDLmN3lpHVE2bXorXFFkxdQCqW65LZ9gitfgzGrrPCLZpPfKFet7ewFqFTXB1elfldd3IIsHDHkv2qM4Wp4jeq9KMDPlqgRXN4bCMcvDlhujzFFg9N3FgXem7t/PyhpADeLNVahyU5UWz5o1FEikTFvoDM2EEqEzG9hqlu0KlJxb6+2JFdEBloNtiFoP0qmcYrVCBLHB8wn8Sr9RUhQqlgNNwHUIgR7zgfDX2pqn7QVnGTmYPzRz27r+ef2p6M5yN1eTiTFLWIzdjXU3wWAIv8I1q2fbTdB4Cc/9dbwI1GQGqJ6V15ZZqxWWnzk2S5ZMRkov4VQw0y81RNbi6QJw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:20.6381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c97248c5-131d-4dfb-47e6-08df1e66ce5c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6918
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX4qFudol5l6sz
 qIhH7UWHHQ5CSlreFqGJ9A/mdMdX2a1EzqTC1/Q2Sm2VJSm/X7VKcEPKWOVKBQ76dsCmrkxFXi8
 zSu6Jchp+t8YJmteaqUjBe1QRJKezFjamd1dZFG7CFHLNYkwGmoIWL00rWJ3HHyouG5pQeG3mEn
 5dlwHXvMbx3E9UDLJRFhqEpYVjggBTWNdJUTl7rrC+BdyKudx/ZuR9iHgYKui3z1xHH7eepiFVl
 WO+hFwyStw37Y132P9aaAZl3TFkPsNmsDQft61xULCmzn0YxC9phtU999YPeeYUA7EJYX2OPPMk
 2jA4Cltof2N2urZ8oRUGUl49joN3IaLq4zXFnf2KoTIQqIX+C6Jd2jptQj5SNjLmaF2VzVDJj18
 r3G7pODUbfj4ZQLk8xIh+BD8WKUC3rfiLKMF/HOUmYTgIR+1P8n8BfcEH+hssGsigy+qyAdRwb6
 dWk1fM8kzDBdsPFk3AQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfXzbbEkb4ZuzSU
 XO9kAfBRdnTt44VqkOuvkv1K8tcgmyOifZYnOkGW2YZpTC1DMyJASZRUfC414icG/oguI/HEZDT
 pLbAKIPA7Flew74m9Jk4el2Ix6BhCQ4=
X-Authority-Analysis: v=2.4 cv=GdGCDgXL c=1 sm=1 tr=0 ts=6abc1d10 cx=c_pps
 a=i9oGDAf80PfF53tpRsLhyQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=j3GZ-1RxCUTCYdul9d8A:9
X-Proofpoint-GUID: uaKOxTIYd6vYwiDGPtBUFvbiL8O5zYQ8
X-Proofpoint-ORIG-GUID: uaKOxTIYd6vYwiDGPtBUFvbiL8O5zYQ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

All other TI-SCI call functions call the response variable "resp" except
ti_sci_cmd_get_revision(), fix this here. Also get assign the response
variable pointer after the transfer, again for consistency. No functional
change but does make later cleanups easier.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti_sci.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index a91db923c8939..9081288bd133c 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -507,27 +507,27 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 {
 	struct ti_sci_handle *handle = &info->handle;
 	struct ti_sci_version_info *ver = &handle->version;
-	struct ti_sci_msg_resp_version *rev_info;
+	struct ti_sci_msg_resp_version *resp;
 	struct ti_sci_xfer *xfer;
 	int ret;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_VERSION,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
-				   sizeof(*rev_info));
+				   sizeof(*resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	rev_info = (struct ti_sci_msg_resp_version *)xfer->xfer_buf;
-
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
 		goto fail;
 
-	ver->abi_major = rev_info->abi_major;
-	ver->abi_minor = rev_info->abi_minor;
-	ver->firmware_revision = rev_info->firmware_revision;
-	strscpy(ver->firmware_description, rev_info->firmware_description,
+	resp = (struct ti_sci_msg_resp_version *)xfer->xfer_buf;
+
+	ver->abi_major = resp->abi_major;
+	ver->abi_minor = resp->abi_minor;
+	ver->firmware_revision = resp->firmware_revision;
+	strscpy(ver->firmware_description, resp->firmware_description,
 		sizeof(ver->firmware_description));
 
 fail:
-- 
2.34.1

