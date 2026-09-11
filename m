Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5928D582BAF;
	Fri, 11 Sep 2026 19:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156431; cv=fail; b=fS4X5PNO+xdHuMDQRuE2pBoKTS6ikBrxG+dFHGOxenJ93YGcFcaaIbk+7P62pdgJGsVrLOl6vPLjApBj7E2lA6apeHzKrpkgx3fDEJpLeBSf05c59wSHJmoysuOyMZfeSz70PTDYdiszZUDmg8x/aHXS7j0DIY7Qx/T6og4+ezQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156431; c=relaxed/simple;
	bh=LJS0eZ4863s3xNkrmlm9xeYA5xixJb6Z+/LJTk7yf1o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SRjmqb2Uj+8c6Z3IXggWsPrqcr+g1yCXuWLK2eEGGc5vaVNL5NWf8dnmiR4PFS8KrDEBokHS24TnpYEqyViMbMcPifAsRzf6YBPJLW4poaGuWHGNQM9hAKtpbUsgKgStlbIN5iyZFUzWrgkXi3NC163LDqMCy0Mw6ivPl8s6J1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=CTTslT8D; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tDqFeMIm; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="CTTslT8D";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tDqFeMIm"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68BHUtIj213697;
	Fri, 11 Sep 2026 14:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=l5anzKz+zRyid9Cb/mHeJLy3SgBahQ0uHVZR5Y3G1
	8U=; b=CTTslT8D8VRcLdTRMhJ1gB38l5h1Py0Y0mkpwxv7GmD07b7kuNIF9rNv8
	5ynLV12F8hVU9aqMxo7WPX0CDsXlpqZETfkkyAkKtzsBSGyCGwGrN3lY7lo58/ye
	FkrWy3EbLWVrlzqiJHvQxBosxO7PIDROXIR7NiewifgAoDsxNZjfmD+Wc3zkfHop
	ZnSyM+2PNfi/h24m2rG1llFfSLZynloB7eyTXwnTG7R6a6bZ9c0PBJzspHwsI6DO
	J4t33uHEGa65qCEYzM1G97EGNd/MgIt2u561cS2oy2CnFe2KworotWl0EwvTWyDq
	oV1RgNBevKh7H10I50C3oeCFg617g==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013002.outbound.protection.outlook.com [40.93.201.2])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gm3yyy09t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 14:53:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soxjxHGastlUjeEgn/Er366IpX5v+Z3PCdIGOLBixBYrXriF3rGHU4kSrsiOrQLCoiJT6DhdZNqLyoWnPCe+hlSuR5dAxPD+738KifBMACVCeIjoHKZn2ywcQg/PfBNunesscYCKp6kaSBbbusCBjZWZI5te3eL1meY0cw5Mfy8rihOBZ0Wp66FcCFWucYyECW2LSzHbA/AzYTaWmzrVzAONQ5PfSftXOgdVjL6KBoNHm4dwyGakVI4LT7ZdUURxkBzRkB8C53O1ZmByZo2j7DabmCuIthckRusaLIOcL45fIoOXPmLhl6DiB2gllpbvVDhUUpFL4EHkiVXLeQzp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5anzKz+zRyid9Cb/mHeJLy3SgBahQ0uHVZR5Y3G18U=;
 b=MBg3u30BUp9ofvgZff/QAAQ4dxbjot3WAFR+d5jewiN/a53PuF30C6Qu5BJt8m5HF3oZIQhgSNLkEUkAgHTQRrf/P9eR83cufzgxukWk1PVWq8eZeyVWoNnmAGHHEiGtDHiQmAxU9OvsjCuGOuYOgmrL6j/BrMRO2SoPHObsjc28l2lAVLCkBl88BlhkvR8L/OyjQNDJX0EGqjIfquWFuky5L1j4O2Cfjqm3PbBbvz8DaX4ZHQVaC5uw0I33xtDG3UDXLXgMmUKnFzn6WPo6kILrvfpDgymq7f5e8HTyJvROb5SaXw9NWuBj4KcGKXKXuaz5rMPvGgFWMs22HlwSXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5anzKz+zRyid9Cb/mHeJLy3SgBahQ0uHVZR5Y3G18U=;
 b=tDqFeMImE1xnTCSRLUkiABcPnOWUXfCV1ma4gsmTYSGQ4nNhc0o01NSHkuZWyjXfICqh5yVqpGaP1FjPqLdf63Y4haoaYEBAK+lXnrqXMJ8NsUXic4PvpbU5EH6S70+U0FVV72u9Vm/BJVMcsg0AHgkCxupsUccpYVq5Jug51w8=
Received: from SJ0PR13CA0167.namprd13.prod.outlook.com (2603:10b6:a03:2c7::22)
 by PH7PR10MB5698.namprd10.prod.outlook.com (2603:10b6:510:126::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Fri, 11 Sep
 2026 19:53:34 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::ae) by SJ0PR13CA0167.outlook.office365.com
 (2603:10b6:a03:2c7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.5 via Frontend Transport; Fri, 11
 Sep 2026 19:53:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 19:53:32 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:52:47 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:52:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 14:52:47 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BJqkG81696705;
	Fri, 11 Sep 2026 14:52:46 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <a-christidis@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Michael Walle
	<mwalle@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: add am62p/j722s GPU node
Date: Fri, 11 Sep 2026 14:52:45 -0500
Message-ID: <178915633875.2344015.62989865468618068.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260831-am62p-gpu-node-v2-1-69945a2db2af@ti.com>
References: <20260831-am62p-gpu-node-v2-1-69945a2db2af@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|PH7PR10MB5698:EE_
X-MS-Office365-Filtering-Correlation-Id: 591ddb86-a48e-4fe6-edb6-08df103e5c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|13003099007|22082099003|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	z/hCBtVenabJJXZZjohDjO5OZqzzKw5vmWsiMLbaRPhaNCgP3gmxQzKFaUDInJsCrS5G4n6gKkVBdJ6BsIaLLSCCPCLx00c9uF5be8LD7c84S0ShOeELKV5Kc6mJGiSg/Gg8mq7xc61t613HQhdhy0jksPmWwpG0NNGHUs2Mc7e861fjDds7wttxMyQdfBXalFh4JqUNDYivipFoTudeS9ZKCMQHTYKFio8EoC8mQXMLD0J9WxZAPmlc2LKHGF5ode17ywXnPdsKVB3i+NGnyjNBP/KiHT5TffJJh1Lod3jPzKYbvWOegBSUhjhoVBmgKztfKPmSsFULjbl0vmccz5K3eMY59g9ysjfYpQarfKJrAJ1Ecsm0nK9h5qk4TTtGjTQPXUpyHL6I/HUdNK23C9Gu63LKNtedRB6KjmTnDdJtbrtr7G6TfzmDH9Y6xcaqhH93SQT7VyXuJbbzlue3gz6IV/nefRT9yNi2HXsTtRRtCGcxZuZ/VwpcfSS5d36bJ5/P2a8ffD7H26SMKOsUTsKU/SEEJwEaS0nMN/EBzfHyZMS8PGMvCK9GYRUglIR+g1QCBTxL2VH+kZ2XGqLlb5+MJXk0ciILEDmcChmyo0Qf9H75RldwVcfIJJPQ+o2RJbdtRU5LI0XcwGSvGm+KhSV+U/Y2CG+oQHt0zogAe2SSfDe3dDVpnAeiAh83wk/o518IEvx4LZHtpoUSe5Qj1A==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(13003099007)(22082099003)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RHFS1c2CCCpcRlKrPpgiLpU7wWoovKN7VT5OtcLHgMWAskzzIjlvRZIHqXXMeqiLLIENnItH843oY8wSl6vpV2WYVDnlYOJsslMMRqhUcf5RJQafjmfPYw5hhPgMdAAKW1uxnlKalqTgqGZtlgoe7g5/OxbLXCdV+KOq9+7tb4H8cSxLCejjUjaOmJXGrjPqZpaE9rsw1dffSY4DAOeL6tRD1y6VtvulhU3Cak19gcReiBZxu3qgGHm/TxZE2DQqOxk9rYzwsaYBHAry1PKb6AWpPBm1YwXW18dKdDZ+ddqST+t2uZ7+8kl6liDgj8lMRmSebcQK3RAvmsV3Efny/Bsib9EIToW85LfPBnxLVYlrsZoTl6bAngUVAdpE7KvJSOLHGiZIWdvG1nJLJ1Bu068E1egH+I7oXJ8RhFGQ9nurR51x1xiTpNiXhB6v39Kq
X-Exchange-RoutingPolicyChecked:
	2LY9Muw53BAbFibnVkQmfiP8mVi1/AW/IHG6BRNGECBauVHSj0UvJQSq0bNFwcRG3btaMb9NUdtpA/indYblH1KZeMb+wUtuyPi5P1Yrt3wNAj/l71EIIhU4xpNwrbVzsqulsCdX3FqlPqTOyXaOS+EQH/i6SkyZLLRq7DYbiKBFR6SGsSwcGTQde2UQZsVrxDXzmeIAwnqNOPgGH1jyLhCzCkG6N6liRGzs1eR6ssKbCpLeGUZs2yi3wRqW+yRfTwuMpwEdE/6Ij0XgXDT5mTHEJVgaBWZ3Df8dZcaAtKIOLrho8TzeRbdxflZ775yyTxexx3X9mdbG1BZCU3Kr/w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:53:32.7715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 591ddb86-a48e-4fe6-edb6-08df103e5c18
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5698
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI3OSBTYWx0ZWRfX47Tgz3hMIDJH
 kkH1MgJ0Z73J+/uRGGn8+vthOK40ar1CVWIsQEt4oepSZTnyT0gWrNZ8vGfYslQhklnKYjC4n1d
 t8+sfOn4Omu2B5zlIldQthNZ3B0CiHc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI3OSBTYWx0ZWRfX9CxdlZvkOTuY
 HNj+WF5C3PeyGWWUXJ23IMtwDr3sJ0C3pRh3kF2bOJOLlCI9JGw39MP7wB4hJRkM9X1At2wZIyg
 f1eUExEyCKPjefgppqYbt0ngeemcKyy03CReaI1uKN4/pgpYZ+Q54Sf9K50Xs6I83y5o+wmnY6z
 0UTWsH8j6ZTzRplDm4xoNC8ljBnfzGNwuon59W4/pdRT//3NktoUNNMDL99yYZn/MWFXTYnH1zm
 3l+ruGQgkWSVtd6pBgo/mJkYBdbDUAr5Z5E7W36JMgMSi43Er1je3xndKMhFb3Xq4xQ7gMpd/8b
 UH5MwkBZaqQsnWhDgUzNcOjIZzml6s5u7WTmrKF96vR2k4gLycNUypmnR96hrGn1B90vzuM4CKD
 fakpPzFFAIeAGv2h9xiUezR4X0SbbpO3ya3DqdZDkD133QKGYsPYLXWZblRMEPkUFTKNdbkPJZn
 XgqylDOWMVleNpGWUIA==
X-Authority-Analysis: v=2.4 cv=Y8FtIReN c=1 sm=1 tr=0 ts=6aa45c40 cx=c_pps
 a=IyT5loBvHZYA5YPQi3EYsQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: VwXVIl4uVslNga9g0XaPBIBu_6XbbVBl
X-Proofpoint-ORIG-GUID: VwXVIl4uVslNga9g0XaPBIBu_6XbbVBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110279

Hi a-christidis@ti.com,

On Mon, 31 Aug 2026 13:09:53 -0500, a-christidis@ti.com wrote:
> Add BXS-4 GPU node for J722s/AM62P.

I have applied the following to branch ti-k3-dts-next on [1] with
slight update to $subject.

Thank you!

[1/1] arm64: dts: ti: add am62p/j722s GPU node
      commit: 9c8d40bfa6026b662c8f2254dc21f4c11b5e0ee1

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

