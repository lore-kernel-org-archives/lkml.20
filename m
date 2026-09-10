Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3EB4AB1BC;
	Thu, 10 Sep 2026 15:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055772; cv=fail; b=KfPM5pnjl9y71KGvxc5KlDtOT3WzP1meRzBKXSAmZ1/T8NiQdfLQopkZrb8Ix2gtzjPekaSnlako4EtYrqNppnd8CHmaODfu8i9waTT8/wtlLL1c9QoHYUCT8QOokX2Vps9rY5YIsuls9JcCi3n5+7ABlLg1yBLGjcnHqknkinU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055772; c=relaxed/simple;
	bh=YrFKTYOkVpVCsudzB1oPPXTR7EX8drmSAF0RYPDiBNE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WFcJlJTvv2myf+4G7g65PDmajnx4E2oIbkVl7BXhZORmf+IEPYGL+sbVyewb/PNOHZ/zhySliadak7D5/1fmIdtOmpLEBFpecQ8u04y+SFR/8nhcY+O6R9RfL5SPSh9KHUb6YqruP3abKN1dBazxs358seMdrAnTK4qc5slcZ1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=TGV5peQ3; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=W5naLrfn; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="TGV5peQ3";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="W5naLrfn"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68AF66Sx3467965;
	Thu, 10 Sep 2026 10:56:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7iZQ/uLrTyI+rc8QA/VE9spgpC0o9RnjYkeMSEwp8
	pY=; b=TGV5peQ3/OfSMPs4bB97wgcFNJV3+T5dX453aKbiIs6ck2v2BR1gXq0Xd
	TRNhJNnb4sk80f5d8XQdjjFeXjrEGxVHKCDirvj4wefutnjB0x0qQ8Xa+sleGigG
	RxNRvINCbcIbkwTOHpa099ffaxForpN3URaPzrU12+RoynEw1imHfmRsLLD3iH1s
	4lyuvKZ7mJovvkjMPwQzUWOR4ZIYCy77WhuO4WhTyn5a6fOQk7hKiMZ+KVHo34Cc
	FTMFEe0WCoCzYejXUUuwrsJ5bFRbhNySDGaKXVlIcSUTJPDAfLcLG6S6cQbDMdma
	7K1rI5p7vKKtSKdehULNpBadgAdXQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011048.outbound.protection.outlook.com [52.101.52.48])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gkstvaaf1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 10:56:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZZP8UV/mRk7aIcBh16Xora3TTTynGsaj12/hlWrduIpXywq1iEckvjUIVGbQ5DMbz8TnuvgnLYgtHkX7iUC9awcHiAI+NsQju8f7M+jNy5KBeSSbvZsL3QTTKYUVTVr9aBBoLCNSQqQxOxfdzJN3vUAlHwvAIYMZfn7bSy9GKg5D8e4F4/Ei/9DMP0RfzHdUaOm0PyDhI5eA4CtcfqVaeGS2lhRcrj/r+JjyPqHlt+7D0M/tt9qgjUdlKguMk2j7QLX1B5CbOorTeGnbAsE0s8e1nm1eFAxsHo7MUpe/qlJYCX7eGtq0dIgMoMMbMnjWVzkSY8cJwpN1dKbQI0t3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iZQ/uLrTyI+rc8QA/VE9spgpC0o9RnjYkeMSEwp8pY=;
 b=IhhyxoyUMqDNEQGCrymP1E1xjiRUOzEV7NAZnjV/Sl7p1zty6ekQfRkPVvN8WXQbCGDZahTzySoROtbNPOKOfnd9EgD8FJfA9q/kM4rnaFrvEbMVBPdRPYcY3IvE547E6gS6nMwS6jhDFpjV8dRcTU0VpRnVmh/8ME1N2nbdiea/NcA7y396GqVu+svBhXZyYJ999jiJGjd2DMB9svbr+Kqq28JNQablyfW/HkdfaIimq9UCTnUH2Rl53t29siwsOhjhgmbVbZdC4y9HXCgYycjwITuqG1RcyE8xelDSuGeRuhpfHCCTUWLlckYeXjUL2fK4H71K0V2Xz3mbqw/40g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iZQ/uLrTyI+rc8QA/VE9spgpC0o9RnjYkeMSEwp8pY=;
 b=W5naLrfnlIzDnUPI6+fbfp91O8Pgaryvvl3Lm1zvGXGQI1LMKomG4gLDgQh0Lv9xmQaKjU1/OQ5knNDI1AcJvi54qVmnLGN7YlSfdb06579rbvLGRggkAEgafPMTo7zQ3d7Q2zDq0U9aH7vTSPgReyX6A2ley/y7cqBlOTlysFs=
Received: from SA9PR11CA0017.namprd11.prod.outlook.com (2603:10b6:806:6e::22)
 by PH8PR10MB6316.namprd10.prod.outlook.com (2603:10b6:510:1cf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Thu, 10 Sep
 2026 15:55:57 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:6e:cafe::60) by SA9PR11CA0017.outlook.office365.com
 (2603:10b6:806:6e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Thu, 10
 Sep 2026 15:55:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 15:55:56 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 10:55:10 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 10:55:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 10:55:10 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68AFt9FC3587197;
	Thu, 10 Sep 2026 10:55:10 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Srinivas Kandagatla <srini@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/3] nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
Date: Thu, 10 Sep 2026 10:55:09 -0500
Message-ID: <20260910155509.1425682-4-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910155509.1425682-1-jm@ti.com>
References: <20260910155509.1425682-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|PH8PR10MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6c0167-5b31-4665-d6ab-08df0f53fffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|10067099003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	BmRiH0RMe3qa3D0xn7qysNzVMa6UuAYf3ivqatXNS94oNqIVVGb2xBX5alNhnAkCnYL+s51ECoteASqpDNXSP24nYguYVSf6dqo2iQh+449Q9xPSuSSiovkIMl2U3DlBe41CIR9LZOCLAwSq3SbO7kfFAmNnyWAYpikE4nHGigVrm8CqxnaGL2oODdm+mhQ2pWsQJX4K/D10zX1ZK5YgmbjjJCPO1LOTxMz6OLWbniSzOj88umiQ0a/K8mT+S0RAfvBceZbN9R4Fxn4fO3W0UbqblbblsgYgAwhDPd/h+ZyWDhlpbcPYUVcPXwN8LSksX28Wwxk+HRzStmrmWU+h5ZViqaNX2MiiZnuwNp3zBMUifigSuh6dGhhQLtXEC6O4MsHfdSys/TJv0EkCP5/XKEUF2v9uHAxeHBMd50UgugwIaApLAV5oUxuOspzkMUGx1nBbL5Mvh6zLkDsFZMtTheNVWbyGD8DbHujA38LGrz6E44Am1KlOVbFjeySA1av2vD03ZDmmJtVMQO7lcH2lS17SYmnknIN8LBPvzcvVs78auX64oJSO2K8ZF+PLaKWIfYeyimJTTovLOyy5FOtwxraCzzR0rEK2MOlOC0Na9smknTM+rZUTpAiKr8L4JptBO89pSQoeso2wDpwaLLCoK7yD1CIY9dnFmMH4q3HckyXwUhiLG3Kp3E5v74katYuGQz/jDHTjeG3oFC6rGuIZlQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(10067099003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oMJOY9MgepByDrE7XnZMKu3mXE8dmPvc4jaY02fai28A+o6fSRhtqoFesKb9CMg3jdAt6Bv+FjgEgTh+oqSEjy6Qiffmz2ZP/fUslAy5+ZMCNPg/dzxh5yZ+3rHdbVTjQsuCcBzD9OP72kTiEYymL804D9f8d4R0BbPYXa8wyZvLnEDks2JKMiDmxnBsuy3Hfb58m7yx6h03pWlGhL4OVLPRtKHyNYHyaVSwZVr96mtEZN3Hix5bTLbSS+Ao5+O5OQYVrXaKMQxECb+EEiSg0d/TjltVHX7LCN0dsC5lU7uX49nugZ1Twk9ao/jwlnwT+VzAhUTOUM/d7uxgipqbNUhaCNdi3GM1MEyDGf/P5O6ksKtOLZVI3AI8F2KtxNHyMpEE1rN8SN8q2sXg8PVCxaLzCIfm8ARPwcKaN8hz8J5H/1wA4iMO8wLMA0zkSRpV
X-Exchange-RoutingPolicyChecked:
	pRO1S/hDunR7ejtNVmPGvy0DmQ1DR2BpMEto5Mp0CV5nRgYXfz5F8uyyh2g1mU95SKerUP7XG0ZHMjAkPnGgj5144jLedYED07ndNgCjbXPIvJPcV7x18+SS8aoCssI1RVXRGicjh17LTT1l8W1RDzf2JvHaAFKYGXNCv9GZCSk2fNjBN6lCWmXMEuHetk9EWtj1SJZO+S+PotWPLoHHlR4Ej51Ct8Pi55wdaspAinpnrPl1nA1W2PlRgM+o24RpOjyRACH6AL6uH9ex6yOsn+RkN5ohza40/pb1t+yC3/Eah54ZIR00q3fgg8Wd+k+wT+GtxsW5ip5WsSkoxPV3ZQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 15:55:56.0529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6c0167-5b31-4665-d6ab-08df0f53fffa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6316
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE5MyBTYWx0ZWRfX8A3RWtoMqChB
 4/P3pe2QP7v15tqOyJUaW8YbQic97p6sG68n1njaq3G2GugOfQ+8UVGoQ8M/6KagdpTWC/jfUg/
 yRDJPsbPtdDO6iPdMEmXRGZnTj/Kh28=
X-Proofpoint-GUID: cUAeEN5vEGo-OhWYLQ0k1ZEtzdT_y2fm
X-Authority-Analysis: v=2.4 cv=VvG2kO2n c=1 sm=1 tr=0 ts=6aa2d315 cx=c_pps
 a=SWHM+P2JNiUeaYpOZLdr7w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=c-n4J4-pAAAA:8 a=ZeIETjE35kWDaaLuBhwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE5MyBTYWx0ZWRfX5NvwPRshac2F
 s79BMd2sihhYt8dGiawOkZ7g41QYU9iY4JtUy2+FWfzi94DZei3CENOzM3CVNL+rujrVPeia4pt
 /H3m7tJBHKxJv4OYkdHAm6Dbrl/eW1JfdTKzDT5p91ukq+IkIBg3BuMKBIMdWTOuY8gi5lRrpwo
 ucs2/WIrxm0txXSuUrvr4E2HbXACk+O37ygAtKXlYly7XlVrSvw9dV1K++uI7GYHc3XgXXPDxVt
 MRZQC0nE+faPMDFpYx5YKxICCV3qksdhQzTiKindzhRGVheco/9eZkDSNFv8qPelNC/WcAuuGB2
 w6c+N/anfG0R5BsyKphlLFHMikxUV3SAP/FMjjZMO9mB95cCqc1CLzgJNXkb3YLrwLpPgorrVQR
 wjXuwkRykwsMtXwG5xPV9exEbjFSa7Hd53IU0v2yLuEnVb9ol/F9pBNq+RRA00g3u0ycmure3Ay
 638JWoSe0sJV8Q7R6NQ==
X-Proofpoint-ORIG-GUID: cUAeEN5vEGo-OhWYLQ0k1ZEtzdT_y2fm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100193

Add ti,am62p-efuse compatible to uniphier-efuse. Leverage the
nvmem provider to supply silicon revision information from GP_SW
efuse registers on AM62p device.

Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
Changes since v2:
- Add Kunihiko's review tag
---
 drivers/nvmem/uniphier-efuse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/uniphier-efuse.c b/drivers/nvmem/uniphier-efuse.c
index 85f9372fb97ca..d0953b99d7e18 100644
--- a/drivers/nvmem/uniphier-efuse.c
+++ b/drivers/nvmem/uniphier-efuse.c
@@ -59,6 +59,7 @@ static int uniphier_efuse_probe(struct platform_device *pdev)
 
 static const struct of_device_id uniphier_efuse_of_match[] = {
 	{ .compatible = "socionext,uniphier-efuse",},
+	{ .compatible = "ti,am62p-efuse",},
 	{/* sentinel */},
 };
 MODULE_DEVICE_TABLE(of, uniphier_efuse_of_match);
-- 
2.34.1

