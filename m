Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7612472AE;
	Mon, 28 Sep 2026 03:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790566282; cv=fail; b=XTD27qoEUSTnJibqB2esyEMmxeQuhGW8Vu0rlHTb2KZZgUgZHZqFJedo34daR2iP9YpVoIhph4dxmAiFqN+JGyUvXOnMmGzzohh5of7St+/7atL+154pxp+OA6NEGEvsyNIyZnVZwW1Va1vSKLeqVJya6GXEIwlzdF25kD/34us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790566282; c=relaxed/simple;
	bh=l66x4Tq3ojzXRo5JUDIPUPfuJjxT2z0jAuhd8URw0co=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pb0p4garVChXA9YN0H/T5gs6/oei4nBSCUc/yqbfzoiD24V19kVaHDbDUoU8hCiUTNDXsCZa1+En4lUH9BuyWGFMJzgq0eHsrrA7BzrYUVFgtjxhdYibOSBbIYYCMPo/lM4HIvl9ZfCeiF4GZz6Y8KzPx1pCzAFN+3B74vmzxu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=dzbHptnh; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=teIAMQhj; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="dzbHptnh";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="teIAMQhj"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RKA60j2283027;
	Sun, 27 Sep 2026 22:30:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=DK7pQilpqOjnBbKjwfZeMQ3L0yqj4UL5+0eFQ5m1Q
	mA=; b=dzbHptnhiNyJWrAhSRTBoR7QxAkFTwQ9ZOfKQ1KgMwckm1YyUw897BjFh
	bpoHM59htcm4m1mGgX+8eFEwKgJI+YzY/KbXxj4hrvkrgTiAml6nOgOiYfPgul+7
	5WYIb9FMtZHB0S0onwzkdlrUn1ouWOU5hfPLAjuCV1MOJ2F8187LCvQjFgw4TeQK
	jQX27xqWut8OpPsI9GkltT4CMSlUtRgOXhishPS8CenQwJR8McLujmA9AObvoFtb
	cLyOD4dVfTpoYbo+L5KfDGeHN88pt3M50r4oevDVMjEuHo17VWexNokuhSW+OFyP
	Jb6v3spfvwpJmv7KtX9OUzi1UpZ0g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010064.outbound.protection.outlook.com [52.101.46.64])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxw6num55-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 22:30:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qs9aL6eC58bN8wt0LQfLco2wGiLEhV+pXhk7+gwWrwRU/XZE4ryY/q6YV1o88meHJOg/SfmtEBN4ZpnQWb9N+AM5wLQ4K9eXTiOOfstqgQ8zvxfkyl4h1lOliBTMw1Fyb4zw6Ivf8awCjHyjrxSGV/+GxWNMsXdQ6tW4mPB6wVptN/rmuYgm2G7dE5KHYNg3ymY0kA3yKZLEYjz2azmwHDoq+U9X/o1+wLR5gyP1Ne407CEU7qJkPgoDX5Arhm38EoZ2vVUMzpGBG2riKNcJzREHbwtR2GY2lxKqLqLTBiTvz2CXMHEcwgEbniYgLY3VNcRAkwkKzdO2ChIbXTdu+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DK7pQilpqOjnBbKjwfZeMQ3L0yqj4UL5+0eFQ5m1QmA=;
 b=nShqYUjq6UODh66lxpuPHIL/rcc24Wn3CEz73DXqDVs8RZn0tO5WDnP70X7EtFC98D1xT4JVokLjH6ylpu9sHYirx9ZPsxpyqFdpuVdOrPQhm/zeeiwaFz33uNHac13SRhXktvTkRzVym+bsVrmsmi4oWth9lr+tBGG9xOR220kfYZw+RRssZAXWEbjI1KhXzn0mnf/vvZe8h4ngumQC1P5KyyoJMvsZn/DZQdb3hm3N0MbbF0NB6Q3eL9MrsoK7to+gDCBj2IQZFa7OwjsD3Qh90Ax6RTVT8NsGv7VFJGtavIUUFCkcfbafIwtwXiuSm+OBqdsAmuEUXXvS9kpKdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DK7pQilpqOjnBbKjwfZeMQ3L0yqj4UL5+0eFQ5m1QmA=;
 b=teIAMQhj33kmkTQBan8171nnWEMIi58m0qf0MbIME653Zt2t8A5RJBp3Zdu/QAzKrI5JyT6yFx/coDXX4gG0eK2SWkZTQ1P/BTNGVTRGyDsjXswE3v69z5Nf/G87VRL+nkIOGEpup52001e7NeObE03Yay4hM2lTsoOpsZ6wONI=
Received: from SJ0PR03CA0249.namprd03.prod.outlook.com (2603:10b6:a03:3a0::14)
 by SA1PR10MB7815.namprd10.prod.outlook.com (2603:10b6:806:3ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 03:30:53 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::22) by SJ0PR03CA0249.outlook.office365.com
 (2603:10b6:a03:3a0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 03:30:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 03:30:53 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:30:42 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:30:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 22:30:41 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S3UUvd2302035;
	Sun, 27 Sep 2026 22:30:38 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-adivi@ti.com>
CC: <hnagalla@ti.com>, <jm@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am64: Set MMC1_CLK pin as OUTPUT
Date: Mon, 28 Sep 2026 09:00:18 +0530
Message-ID: <20260928033027.1077689-3-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928033027.1077689-1-s-adivi@ti.com>
References: <20260928033027.1077689-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|SA1PR10MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 6506aaa0-1d98-4c7f-9cee-08df1d10e67b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|13003099007|921020|56012099006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	immzrge96tYV5inaoPW/KMttLT5p6AozSe9Hts3VNNjz9qrhoKHhzDspxNeW4Y+RnfnEocDHSjY92mWJwzFmuK1JOS7qodsrhJ4ha7EiXKfU3aZBQ45mScGAxWqLVYxsTuIVhVn2vFL/hFkGf0ROv9alWUdbmlQ2RWjrxSY7W10749pLJeB2GLURWwU/gXl+0RWQ9gDe+enXHsp69X0E2GVlMUu+2C/Ts0LAltaa9zq+F22izQZw1LugoSCm5eoN4nQD8yGTSJRGsxjJq5X/5ZD8QrLmjGIQ8/bqVXv9auHrjWBS7EB6aQy3oTub27LSxPI8rylGdFIA63h4oIkkv4iBzGr+xbO5/E7HLiibAHGD34TcBazf8gMOGOZ5Ay4WInOVtGsVjBejVePvojETflCsew9r1svftWk+Wszx/n+v+xEFFp1gDpktJt0WtN3zRFf98Vqz1tt4sbU/voNValu+590VOMMdgiVoaJyIdVqLSrPZJ+X3QyrLM0ppx9Qd0VgulTIGOmOKd67GoiReoiuIMET39DfO5TcnvLa8oXM+9XGjyK+prfYxXdaOZPT9o/lQU8WjcY7ub8sD8TK2KTHpmC1GvxKN14ykT66HzDzpv5s2IHP2L+N93dzFIOSCR7ObtaohAYnqO2dIViTW565n/sBHXE2cRlsnR3xjon6OwyeER6qy/Fb5F0nBQHyIUHOSt9VDbF06huKxSh8TRWOWcQezsyZT302xs/BVV0IjK4OkQV6e0PmRSZdEFtND
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(13003099007)(921020)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N3wUeN9v+iu0Opn83rlgpVJljlws5DwSaq33S0p1R/ObH4p/WkOQFKIyKj9V4a5GMpMbta/ek7Lxzy5mUDFEwgRIUb071JsjYgy/NQNg38Tn3yNbdap4IqfjZ40Fd8om/ITUEVPQeth/3cpP3cna+TyLl8h3hw/RLzUfTJ4vY9M54hWJueReuQoRZuGGIOGE5ZJ/T61XycpFstdUZR3sNrVMMP1Aw23XsuAZGDT+1GbFX4zSQ8qnhizf0nTkiN7aIjUcnivWf0z0/hre2E26tCOvQUqSOfJjyT/eUOyCDpVGoNICVw3/r779u2+j4j8KkVAzGqrisO+42TdR06+N17vnkbytKDJmT1X0l5/nv2pNUfa5KGT54Z2JmNMab/V5Cx/8S3oCeKOV6hCOpsUOJkc+jW35++7OzQ6LaeNL+abfbeNBZcRYAi9u8dJXR/0G
X-Exchange-RoutingPolicyChecked:
	B02/0JOJkBhx2g0oM8YBBPR93+2iMYPrm8ZBOv7lJ+e9BQP7Pmy6J2Co3kmF5byTSIoyeap1vPegW2hAIEmHPxaRrqJmWbjTOoD6u7w/e1skl4KLjfxExGv5ENn7SAiVWM411T8hvaTl/9z8Bn8Dg1gGaSa9ecip+77jk3Xo1op0gAO6IiqwTNMtogC3NLMKHtk/1zkzLwXqmYCwXf2Sd5LHRyqwE+B1xxkFYBTUuFfnwJGuqMUVr81D7jTF6CL3nxB9vFaqv6QMB/A8Q/CY67b7ocFP9aA/wN9hqm1H3JKBtfmekup4LOfxix+4Mb5DhS0ZgD/aMTl2+eAyuPrH2g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 03:30:53.2152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6506aaa0-1d98-4c7f-9cee-08df1d10e67b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7815
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX94MxmguzsHuf
 aTBOzsay3XXLMeXBopiHNy8eogC/SUl2toRQvWnO3uoIItpJ2IcJQrBr/1Ed6WEXijBkwHgNMZ+
 KvKl/PKpM6Gm9ignkUN07IZfm/SQ1hs=
X-Authority-Analysis: v=2.4 cv=dbkVTnXe c=1 sm=1 tr=0 ts=6ab9df73 cx=c_pps
 a=UPJ12yLMGL5ZZCNrBMA7tw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=F2_UC6SYIg5Fnrnwk9UA:9
X-Proofpoint-ORIG-GUID: O4AnGQ6aOAOZO4iO-uMuog7scZ_A2Ttv
X-Proofpoint-GUID: O4AnGQ6aOAOZO4iO-uMuog7scZ_A2Ttv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX09LPFyLXyTII
 FncQjh2WeNKgQvpyed1H5p/XeAFoLm7C2DZHzxhr1uCKL8RJpThMFMXvImIESJsg+vi/Y4nXMRv
 vIFKxGb8/ABbEuuO2QYCFaepYOd4bTV6JZBQlYgX+O0bVflnT4marj2+tx9cjUUNbd4750+gEUT
 U5b7adUgC5maPCjIjW0RqkFxx6xzk6Zq+Q4otcqK3T4GBfLzHPBqtw6svmfYe0pDWyrJl6E/Xed
 mEYSPDmHVz8W2fM57OHh1exAHaikrC6t/w2MFKRE9UcNfC2TbcgdkupduPkdr7WnjvtwjBpNStv
 45dMNZupyY+fqVfLSzBsaQZl9Dxwl2J+fFtqvQ3mzilHMhxkhmbbDsZYvHxjeoP0ISBAa7axi1H
 5nkDs/QWRTFJ5rZuruKZguyigsH+NYGQQ0sNU5PQjthkcGXk5kXygt6MaVeCOcD55LwPfg+4qLb
 5Nlbtxa0pyQkhnpcvhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280013

From: Judith Mendez <jm@ti.com>

MMC clock pins must be configured as OUTPUT-only per TRM specification [0]
with receiver disabled (RXACTIVE bit = 0). Change MMC1_CLK from PIN_INPUT
to PIN_OUTPUT in AM64 device trees to match documentation.

[0] https://www.ti.com/lit/pdf/spruim2 Rev. J: Table 12-327. MMCSDi I/O Signals
Signed-off-by: Judith Mendez <jm@ti.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am642-evm.dts | 2 +-
 arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index a8c256269859e..677b7ec7c7dae 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -253,7 +253,7 @@ &main_pmx0 {
 	main_mmc1_pins_default: main-mmc1-default-pins {
 		pinctrl-single,pins = <
 			AM64X_IOPAD(0x0294, PIN_INPUT_PULLUP, 0) /* (J19) MMC1_CMD */
-			AM64X_IOPAD(0x028c, PIN_INPUT_PULLDOWN, 0) /* (L20) MMC1_CLK */
+			AM64X_IOPAD(0x028c, PIN_OUTPUT, 0) /* (L20) MMC1_CLK */
 			AM64X_IOPAD(0x0288, PIN_INPUT_PULLUP, 0) /* (K21) MMC1_DAT0 */
 			AM64X_IOPAD(0x0284, PIN_INPUT_PULLUP, 0) /* (L21) MMC1_DAT1 */
 			AM64X_IOPAD(0x0280, PIN_INPUT_PULLUP, 0) /* (K19) MMC1_DAT2 */
diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index 6b50997780448..ea85be05a4111 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -201,7 +201,7 @@ main_mmc1_pins_default: main-mmc1-default-pins {
 			AM64X_IOPAD(0x029c, PIN_INPUT_PULLUP, 0) /* (C20) MMC1_SDWP */
 			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
 			AM64X_IOPAD(0x0294, PIN_INPUT_PULLUP, 0) /* (J19) MMC1_CMD */
-			AM64X_IOPAD(0x028c, PIN_INPUT_PULLDOWN, 0) /* (L20) MMC1_CLK */
+			AM64X_IOPAD(0x028c, PIN_OUTPUT, 0) /* (L20) MMC1_CLK */
 			AM64X_IOPAD(0x0288, PIN_INPUT_PULLUP, 0) /* (K21) MMC1_DAT0 */
 			AM64X_IOPAD(0x0284, PIN_INPUT_PULLUP, 0) /* (L21) MMC1_DAT1 */
 			AM64X_IOPAD(0x0280, PIN_INPUT_PULLUP, 0) /* (K19) MMC1_DAT2 */
-- 
2.54.0

