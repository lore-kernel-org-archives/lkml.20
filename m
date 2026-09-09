Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA9D3BF698;
	Wed,  9 Sep 2026 21:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990526; cv=fail; b=iWZWrKVUorpt/MOLYOOzognXLi2HAv4uunbgcpwCI3B/ERGrk4xM3t6dyCxEJJJKdBHrUNfVSZjBR8/MhWhnil60zJ07AFe7yNza6g1sBnOjOo45mARmUxQJW9ivSRiP6OtB042tc1cpOh61B/AweTlL+jWI699gAkpdDVvpF+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990526; c=relaxed/simple;
	bh=z3GfJpY1ASSy2ZTGyTSimX5MKfhwzXBoShZ8jLILmEk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r26Ai+jdLLXjatE3KFOpwVnolXtp3R7T9Q84skMVQ++GX7FbcGcSG5cNxPaFpfs/WGW/TOakV7bPgp9WHISxJdRMdB5UA4izK9KmlJlym/7xtUkmpb3O3fbD01eYHx1Hv8N+dsekVE+1i3WVI6YPyfjXPG/3UX1A1LWkCtSrrpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=fUsVx1bi; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=R2VqpJYp; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="fUsVx1bi";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="R2VqpJYp"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689JFvwt3382309;
	Wed, 9 Sep 2026 16:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8KUOdez+MLVlqYl8Hsucf+jpA/UDnriuj6P8Rmy63
	Wk=; b=fUsVx1biDbjfH8ZkjkS57m0thgIrEYCGaAJNplKsmSZNoq9swgAgQs/gl
	XTufnvwpoLAUIpi/MrHZwiUfJ+/CptAvXyjw1GaGs5FxSgjam4bgIYen/ZkcWG+A
	koOCIgq3w4Q6Birhnxvxvac852o+bM6staLltSbgEMQhqiXKRcxaNOItY2LmBXP8
	WzrryNxglVBNJDtIj+tD3Gh5tQCbxM/YLkSX766BB5ypW/VVnwZ5EIhvoW8Q6yoB
	iU16qodO9G3ddJF5uDn1WgUhESlXVwTi367+i0nAaBLHRqE7UY01d35p7XTvtYJk
	d+WO+aQEMFKlfePHOZWDcLOo0rThw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010036.outbound.protection.outlook.com [52.101.201.36])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxg92tc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:48:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqSuMMeXtkdOuw8l6h/fCZieuFz/L3qsbmXV4w4zx3kZJvpdr8Ni051SQb5D+PFSxOVaf5Og5dDfjehmfdkh+sBFrfw6Y6AE6r9m9A0h7tKNR/1LjuCIG3mnN6KxHRwHhNNy07JbGTexs2uQGUvigam3oI8QfKvl6xCxePpKLAkRmOQlQ6kAPBvJgrRKh6Ao23X9Tb/d6AWwBt66G4YqS/EKxwrB5AfoPZvMuJWiRJqliLzIpSNJzkJ6n/eX8CgiyfMWC1Kalo08BTQpyT4jEPMg6CVHxZhI2TLIuFaoTdLo+YYmOSzDpgW/X0alP1loBrYpsMDYaetjR53tUrdWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KUOdez+MLVlqYl8Hsucf+jpA/UDnriuj6P8Rmy63Wk=;
 b=auKT6VTCGO7MwYPIxzBClpRITvdzstThBS+s48M6XGQxADT5tR3ah13Z8UeLf2oG01ZI3ljvs24Og/nXVv+HcVOf1/f1M7zDj2GNwPRPmm+tZ6Pcuv86rV6fX0HGXfVFgWRZwU/369S8p6rjsNukSCkkIDAYvaZ/ZqmLedmBXTvRXk7IjPfq6ttgFeR9UmTxQZxnrmjx+83xGP7fxht56iEEqu8sMXs9vax+oOiwYfwdRKE9eWGtl4qW6RvRBbicTQPFiSklIx/eqUUXPH2acup4TCfS9wHsCAy5rRW9PtV/epo4oaS8GH6xsLXTonAmSAMeSDWzoUidicvr5r+iWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KUOdez+MLVlqYl8Hsucf+jpA/UDnriuj6P8Rmy63Wk=;
 b=R2VqpJYpIrRsbG7gn80fHacpsEtAxO/1KoRuVHwpRqhqndkM1TkwsC3SkVbhyKhR0cu0PlfchR6Q9JqR+Ap+Tg3Lzf1cbv09iBvR650te4MVy36mx2rcRWgC9YyK2QVgMLRRVobewpHmoIHtvAUMyxgQVs6F8XVMx/xDhJzBk8c=
Received: from BN0PR04CA0168.namprd04.prod.outlook.com (2603:10b6:408:eb::23)
 by SJ0PR10MB5833.namprd10.prod.outlook.com (2603:10b6:a03:3ed::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Wed, 9 Sep 2026
 21:48:03 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:eb:cafe::4f) by BN0PR04CA0168.outlook.office365.com
 (2603:10b6:408:eb::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 9
 Sep 2026 21:48:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Wed, 9 Sep 2026 21:48:03 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 16:47:44 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Lli0J1072162;
	Wed, 9 Sep 2026 16:47:44 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Garrett
 Giordano" <ggiordano@phytec.com>,
        Wadim Egorov <w.egorov@phytec.de>,
        "Robert
 Nelson" <robertcnelson@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        "Nora
 Schiffer" <nora.schiffer@ew.tq-group.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>
Subject: [PATCH v4 06/15] arm64: dts: ti: k3-am62-lp-sk: Set eMMC clock pins as OUTPUT
Date: Wed, 9 Sep 2026 16:47:34 -0500
Message-ID: <20260909214743.899477-7-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909214743.899477-1-jm@ti.com>
References: <20260909214743.899477-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|SJ0PR10MB5833:EE_
X-MS-Office365-Filtering-Correlation-Id: c136910a-cad2-46ee-ad8c-08df0ebc067f
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|7416014|10067099003|3023799007|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	mqWR3bkwAjOQ6dOwJ9CSPjuJzOMyfMSvrY/LA9s/xNOzb47d2fAUKWtyTlI8x4Rw4EvBtco9C/bZ7kQV9gXpmg03Rm/AA0P1BrEUfJh/nx5RrzjhLnAd72ed3MkJeupgOrDC0wDqgQq52Yc9hSnmpbGMhtI2f6OY5vd5Airu26GZgpf1aCHBNAI0bjIKet/QRl6M03XelKYAtmGYMM+PAi3omxUWdzF1cdge0y/dWum1QPSCk5188tSKouqOa10ymmiXx0NqVT8MMPwkdQoTKsyX+0/mu9/v9nFCCEWhGBU3/ZPpjKE70x2b/zzPFXQiSEgVs/zOyH84o4R8qxfNW6jlnOTLlUAEl3WE3iR/D1hxjWS0sRy3vESt0O3pgdHlGdPWYDxljnpaWHP0lEKxM4j91QO/mYXO63CoNxHKf6JX7mIcclhMkCXMdfbMt3cfS0OuNZiV7gSVFV6mmZIeSySdwsvugfm/7SJD9HLJJ47VcdX/ysfYqwYWrf8vEGOEFVj7iShTKrfwQztTm0mUhFEhLNZp8JJ43saH450AyHeXEbyZ9FXIrLJunYNLczsxaspT9imdUwQ5iqMfSwq8dNndUOw5IFKA7SaXuaD6MqUGuY3Ey3aGZxuae5JbP6wBmxotHQrzWK6R82BXM8p0XVY9Z370Qi7HnwD+Ck6gESk=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(7416014)(10067099003)(3023799007)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cffnGGsch0i5sDJF0QllpiJ53d/athroVHlBz0Icj2hHwCDutZo4knu8C6XyL3ixY0xzggC5/fxTHRu9K3prGg6rhdOhDvbkVEWaRTm0Y4NOEKfCApUCryIDtlBZt/BHt5TLUdRP8JnlQPgasuIdVEvJ8NeCGV1OfJ9vrr6ME6B0yyGB2F9z3a66E+ikTpwrtBR9I4dWHJtdQYfKYi+1PDVIOKWYjCpo27WeOVONP94ubOf8orGqUC8toGprqufuUL3gkwkFEcgxuXt57BW44+4yXF61LFnjib2i3ao/PKZYxfizjSsjL9/KWFPP/Abek2W76Nu34IOdQfvr1VSrXrN5VLVehpvGGRnxhd1+BzwdULFaZXcxtlY0tNxa5vfUs+0WyQ3g09MPJKQRB2lZDdTTVreqVyuUyfNEYQ6DsXNC7uXLbaWIcpd+StQPGIb3
X-Exchange-RoutingPolicyChecked:
	BB4zcZXTHIJEpjmvbZST9nob8ClE12esBMQUvon8ohcgYKBOeDUWe8yj0KVSzdd6ETP91PQeb1GeegHjIeZa+AiI2jq0GyTeiM4PeUF2i32SUT9ITEyGet0jqhGlyPxLd3lcoNIr5Iq6j4VRFKRnOOPIrNCWnd7IRSP7ZRv5mXFAUYxRP7u0N9JezN4xBV6EZmycRBt/QXRgajdcOjtrY7kIyuJnSt8oBPd2rHGIR4NDeFBV7Sq6OEbo9NOVIyUxxaqJVd5Ggj4r19T/85DEeEJQPkuC/HY22KNokKzKGCluW6xa1brX8JKRXs4hOAgTN8tK6c+5elkhBHz5CadrOA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:48:03.4332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c136910a-cad2-46ee-ad8c-08df0ebc067f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5833
X-Proofpoint-ORIG-GUID: v_ttlI-9sEtoE3ml6ZB52jAH5AVLjjnl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX3t2WVLdYr553
 ad8fSPtVD8LZhadLS+EuxuHasNZBj5uRgphyc2Grb0umYwKRQQEogx1lt9E21P4hQIyUU5Va9Xp
 kLsMxXfn6yEQUGp3GOZhMykMId6pu6I=
X-Proofpoint-GUID: v_ttlI-9sEtoE3ml6ZB52jAH5AVLjjnl
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa1d416 cx=c_pps
 a=0/XwxnXJ+7qPZvmcTWkk5A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=Hb25ql7m2tuVCdhrNtgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX9uOGYat//xik
 w3wl0d8aXeNo6SbOWBz8+puBtxwe5ZkeuWyFjNziR37Ka2X+b1i8ahYwmurEip1ix/RWKsUZ2u8
 Eer0DOyL5d9vs+0Jr6U/QgDTfxuvxRrFkTn0V4dyOoU4evzt194MFjI/gJeySC9j16+V8MNkpcl
 5/QUFb9azpdtxKGzlxv30wKO3XAkvGd6uBZmdSgpSAoRgYxCoA9eeRzEDMvvpGsgftEnmvNI/a7
 PLNxE/4kOGv1J2ql8SdSsKYnv+UWaLA5SdNDwc/N4VF++IQqcQsZFj1GH68GjgqSi/zEkPjzTT/
 0QwvNfDlljCwg18hk5RRgZPgId8rogxBZsYim4egSfQEo9HXDbEW+x8h834ywx2s/c/6emcDm1/
 tOEYATWRWhh43RTBZSzxV8ch6ZfVs9ULHti2GHbmYRPhLfwsnN1uABOvoD97cVpnX9KivNVrvjX
 hdkDru2Oet8osvZ+89Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090244

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

[0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals

Fixes: e6a51ffabfc1 ("arm64: ti: dts: Add support for AM62x LP SK")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index dfd65c00f5b95..7fd508f4eddf1 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -86,7 +86,7 @@ main_mmc0_pins_default: main-mmc0-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x220, PIN_INPUT, 0) /* (V3) MMC0_CMD */
-			AM62X_IOPAD(0x218, PIN_INPUT, 0) /* (Y1) MMC0_CLK */
+			AM62X_IOPAD(0x218, PIN_OUTPUT, 0) /* (Y1) MMC0_CLK */
 			AM62X_IOPAD(0x214, PIN_INPUT, 0) /* (V2) MMC0_DAT0 */
 			AM62X_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (V1) MMC0_DAT1 */
 			AM62X_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (W2) MMC0_DAT2 */
-- 
2.34.1

