Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B73E4229A6;
	Wed,  9 Sep 2026 21:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990546; cv=fail; b=H9qAqomyLSB4Ths7OfDy4KgP4evsulC0leRMPCj59JrZmDEEC+nvz9GW32fs4aP1uDVTWLFh3P1J6v4W0ErhSmgAkw5NZ+8eDvQf4TJA8SJLkDVA7suq86oEwh8N2nixQtAM87vfAh1XvL9HTxYruFWwCfCD8QCWisxg6FSxNaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990546; c=relaxed/simple;
	bh=IalUAV3e0q++iccSApfF+QTiCg1VFCnm5QeNYBeHMQc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sWVeh/AGb3w69j0xAPeztBNHdeuchGHPFKeUXbeBcUocyrGfmCMzhbp+HGEKfIIyIt+9i0aLHINmc7FLMiqGnIvGgs0WoBMUA3QywsurcEJdlvQpOF22/+nTFVUi2OxDv9/Geq54JMHzj2z9XU9560W8blYGkhF2wMm897Cwssw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=euli8bjq; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PWxMpXNM; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="euli8bjq";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PWxMpXNM"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689JG7us1158970;
	Wed, 9 Sep 2026 16:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=h+UzB3FVrp7Ua
	1G/o27VlkWZaNaXKqdLPTkPzj/oD10=; b=euli8bjqwWudcKh5Rv7RKJLHcuTpc
	NWjVHjGseiDxYufTPuk3U1yFd9t2JD1ID7KOB9TH/WNNFePN4MScA2qBvIM9g9gL
	ySo7Es6Ezqu5XES4/b+xlfQb54gaEgpjcK02JpIXY0KuOIj/KZu15lVlPPeg9TpA
	LURn8n5LjWNAZ6F546YLLZjFrPp+vWMUI2Y3nZk54BJvt4q68s3D1PCNEf8OiYHw
	RpPcw2LEs94ZWBcVCEjTNR935YDPlOHik9lAh1yJOONR4fuoNIsfQIE+aLFDeQUP
	y2VnvpF/qFhWEBl/pLJGNJMtnBWXLuyDg+uzXnBGryJHNMvfktqz8edRw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010067.outbound.protection.outlook.com [52.101.193.67])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gkcxes314-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:48:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdszUoXFatdQNEuGGPTszskPhHZhsy9rRLVXvcGKOSF3+S38b5FsAaGagOzo6pJQ1fWMzNHOMI5gtPE7p3b7cw2j3xDlIwymOzYG5dA7iRzFwdZugIcCDkjrZCieREg6baMbDRUKv3D8Y2WtgTsN9fmx2yAMgv/DVlkgL5IDnSkuzbXxlNbqkmQaqHt6bQl8dNjAmjnKm43VPplf5KY7dKrZQwKgaT8/42Y2Kpp1KH4zC2g2is4srd3WA4UK+Pb9SBdBcRCS/vVdCBpGWBSuGTx0iO/Y/a6C42YKRfN6a8miVPh3Lktj41J5Nu8Y4NnW+0IsQhv7P/a7xW+Vrb/goQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+UzB3FVrp7Ua1G/o27VlkWZaNaXKqdLPTkPzj/oD10=;
 b=Edipz2bGxIRY+uJ9EZf/APfdPJ8IgHhu9XL2fCtYNgly+PtS/TOE3qK6/3/bGw5kQEPzFMaG4neNtqZ+3UF/llvf5/CpNNBc6Dc1xAjO322+Hwe11O/O9zWk8oZ9xtZWUzQFwknSXyp7Wy7n5qraKqiNrMQSUzxQMmjla0YbsM2FVuzZvg1Ka3KfgzoWQxJT9oDuToz8UUKLCP7Gs/bO5c3Azb3Rb/LIedh8ZjVKOA7cWRfJYEyUVC3WxYzsChrmZcp1Oy3Z+7vFVn6zhE5XdLGa0IHYNZO/Qd8x5WTS1lUyKYWtk+fEBpFtCLuXby8vPnFfkwv4OYViV/apdmkjbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+UzB3FVrp7Ua1G/o27VlkWZaNaXKqdLPTkPzj/oD10=;
 b=PWxMpXNMsyOFG1E3fUEF6zvXg76rD/dKhPkS1+2XyalZIuY/WAJyPOTb3qat4s9cpDa/OBx7DPIwH9OZJzU2qIZsGYXVzuNa/UQGoXgwEvllZntBAYExYwgy75ewtHEmkYpDGkPCxS0gNXdvrMabHXZXvMa7HpXdBN5GzCpnDo0=
Received: from DS1PR04CA0019.namprd04.prod.outlook.com (2603:10b6:8:243::6) by
 CYYPR10MB7569.namprd10.prod.outlook.com (2603:10b6:930:bb::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.4; Wed, 9 Sep 2026 21:48:17 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:8:243:cafe::5c) by DS1PR04CA0019.outlook.office365.com
 (2603:10b6:8:243::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 21:48:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 21:48:15 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 16:47:44 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Lli0D1072162;
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
Subject: [PATCH v4 00/15] MMC pinmux configuration fixes
Date: Wed, 9 Sep 2026 16:47:28 -0500
Message-ID: <20260909214743.899477-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|CYYPR10MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a939c4-6c53-4684-4b22-08df0ebc0d90
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|7416014|1800799024|10067099003|3023799007|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	1ZhKV8JTiej60wuWinvbD9wB6pOFiBupTsQ8aw6KGyzG4X2P0ZnHVZCGMgM3N2qOooHGYXK2GmYltge9E1ThjdXywT5VId2LyKvphH9/gIgoUh/tbWR9/pjBiDgaeB31oO2VBl27z+C/HFrjMopVzFE8pAy+8CGfzmPnjSTmjwnbTIru6IoMKcIkiFUB6ZA1Shh6sqlloMlhbNQZq9nkyybmEabvPUgtjTTixof+kAU8wXhs2gSRDHB7B/mu7PZj4gkAq2cnm0lKeJx53jxjC+pfFW1N/y8PgUCSCiq6SvmtDZ9/oCnRvBXk/PZ5QhNIPCbKCET/QiW8EOrazpfkiFBKnu20R9YhWIygfYkio2qQxgKMdAc2uWQ6zh1/Jn7QHNaO1aZGq+ijbiXcAj/jBYsJA5Z/tevZ2zN7s19ceu9Mv62WYL+3lQqWRNrlsp5Kjo3qzis0xT9W247a7RgZivRGe4nWUzDvzC3zEj1n5wMnt6wZB0T6M8BBPX+xdSRqjaI5/7oWR2KLtFRkL1smfp23czl0UwrxKccfALh2nXv1B1Wv/PrL8IfXxWUcNmftG6p0U3CuIJDV1Fi9+ri3KEQjK+GE04Cj/8uJQoHNzc/rhCcY9uvHmuFc5ZWQdDvXIB6iQc0fUFJYh9nTCk58ZCSJU/E+tMnvptWFO9bpXFwluagjEZrfXCko5ZEHwvni7lfFYlgwysGudJADDwc5Aw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(7416014)(1800799024)(10067099003)(3023799007)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MubLQ/jsEISiIAGf+viCF14uTRSfF22E/Lg7+DKk/fXmeilU0tBj8tKA7N5SsfsWldSFCxIC3hj/Jg/h6MZYdslw/xjgEuhkOrwud0HRqxqTQYm9KXDKOon2XREVbjaWDfXOeMc6BkzL/PC9oHuHzvhyfrGF9wz8i4mNOYvU6y3890tmOWaCZ4AOfnE60IYrUB+UdheM/IS7JZkh7qnfawCTp2i4FqC4B9doxxq0pNnTmHiLdIUWljiv3saHsvGmZEp/Jw9QzACqMpFj9NWBdk772lrH+sJX67xWJh9fdNbIrOWCo/nHGrBXCfPn8HPW4cTVv7z9JyOPlTubPTM8HGOHakC3Iyo8h/QKa9dByZqscmigWzfDbpnTafwzSELwKcaHnDl+W/0jNN5roAlj23aM7F4mQ3c9/SnjTEa/FxvyuNCBtqXr35NWWM7rNjjp
X-Exchange-RoutingPolicyChecked:
	illwADwzlhsmJQaPa4GquZz69KpcQJqEZVHVcCUSa7ysuNi9esnn72TWUtoBZcIN93eos1VMdYc+PR+LfAuMYWqqkU3UnsHfk+2rWciMEH3hMGyscHkI9BhkLYSBETWvPJhs1plBw5lBep+RmPTvBIuXql16vW8fzrk5jAT30sSezmT8FmIK2D5dn+Yp0u93hjRDfUf8b3fCxiirRHJlwPztb0vVbwMjtptBUNF6CUozRhqlpomfTkh+fzwCZhODn3bw+X63uR6NB8I4iPO04l3n2WzsVT5VozF2Qpu/TISAS1Fcs9xsf0U+AZZHKudcMShQsE3GfWCVpGCP5n/0Bw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:48:15.3143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a939c4-6c53-4684-4b22-08df0ebc0d90
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7569
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfXx434QQLV0TQe
 lvbDaOvisnwiLepRPmiEYYyWqR4/bptzGL7SDMasd3lhR3+D2N5HNpnLqmg0XzsUu5qAV4bXid4
 Rd00JSCBdu0RtL/4M+rQW1mfFp6Wm1I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfXxVGQZHxoAMIR
 1ELb1EYPWhPSbc/h/10Yd9+GpDDMQFWB9kat6VBtiQMN6Hhr6OALd7uC3FlrmXy+XVKyNC7wjt/
 rw6dVO0yPsQjXLwnVPdpFs1kgOmv1T4U1lUII/sUBMAzWjCPsPlMW691F6xpWFlkgmubf4KDAAQ
 H2iHmbGKNAG/DnjhxXTOmcxmsWs/O9FxLaZAwm0Z+aqOeUi5IsoHNjXG+g9e+7uaYnWNfqrH7VS
 8RTsQ4TOMowU4NaTbKDOdEa83bRS2h9bxBE22l3XHQxz4WK1lNXkBUcLRRinOZMj4VQd8XJ8Qm4
 pnZ9tRsT4tgavr5pWYF9WWUBnrxUhs8UcCs9MVWyCYP0QcMvqva8DmG24OXAC3owEQBGZe2n/kk
 geGBSI8bK9iAdIJIDZ03AmZ2uyppX1ku0d51Eh4oBDxayg7UVpnjQVp/Ca61QtVPhPFBb81oJne
 iw/xAFQgLxPZTpwu5vw==
X-Proofpoint-GUID: VI25UcP0T0WBPwylJ-ZdOIKMCHtdBu_i
X-Authority-Analysis: v=2.4 cv=F8fC5ahN c=1 sm=1 tr=0 ts=6aa1d425 cx=c_pps
 a=4Gx/Bq66bxzCWlClXrtOjA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=8Z4x4moB9FiuHzkoptUA:9
X-Proofpoint-ORIG-GUID: VI25UcP0T0WBPwylJ-ZdOIKMCHtdBu_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090244

This series fixes MMC pin input/output and pullup/pulldown settings
across AM62*, AM62AX, and AM62LX boards.

All patches have been tested on their appropriate SK & EVM boards.
BeaglePlay and Pocketbeagle boards have also been tested.

Changes since v3:
- Include PIN_OUTPUT fixes for missing third-party boards as per Sashiko
  review [0]
- Split out squashed patches into separate commits as per Nishanth's
  review [1]

[0] https://lore.kernel.org/linux-devicetree/20260805230256.41AA61F000E9@smtp.kernel.org/
    & https://lore.kernel.org/linux-devicetree/20260805230614.521AC1F000E9@smtp.kernel.org/
[1] https://lore.kernel.org/linux-devicetree/20260904151335.fi5mvjpvziw2g3r2@exemption/

Link to v1:
https://lore.kernel.org/linux-devicetree/20260729195958.671147-1-jm@ti.com/
Link to v2:
https://lore.kernel.org/linux-devicetree/20260805004821.416613-1-jm@ti.com/
Link to v3:
https://lore.kernel.org/linux-devicetree/20260805225438.464184-1-jm@ti.com/

Judith Mendez (15):
  arm64: dts: ti: k3-am62a: Fix MMC0_CLK register address
  arm64: dts: ti: k3-am62l-evm: Remove unnecessary internal pullups for
    MMC0
  arm64: dts: ti: k3-am62a7-sk: Set eMMC clock pin as OUTPUT
  arm64: dts: ti: k3-am62a7-sk: Set SD clock pin as OUTPUT
  arm64: dts: ti: k3-am62a-phycore-som: Set eMMC clock pin as OUTPUT
  arm64: dts: ti: k3-am62-lp-sk: Set eMMC clock pins as OUTPUT
  arm64: dts: ti: k3-am62-pocketbeagle2: Set SD clock pin as OUTPUT
  arm64: dts: ti: k3-am625-beagleplay: Set MMC clock pins as OUTPUT
  arm64: dts: ti: k3-am62x-sk-common: Set SD clock pin as OUTPUT
  arm64: dts: ti: k3-am625-sk-common: Set eMMC clock pin as OUTPUT
  arm64: dts: ti: k3-am62-phycore-som: Set eMMC clock pin as OUTPUT
  arm64: dts: ti: k3-am625-tqma62xx: Set MMC clock pins as OUTPUT
  arm64: dts: ti: k3-am625-var-som-symphony: Set SD clock pins as OUTPUT
  arm64: dts: ti: k3-am625-var-som: Set MMC clock pins as OUTPUT
  arm64: dts: ti: k3-am62x-phyboard-lyra: Set SD clock pin as OUTPUT

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts             | 2 +-
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi      | 2 +-
 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts     | 2 +-
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts       | 6 +++---
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi       | 2 +-
 arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts | 4 ++--
 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi        | 2 +-
 arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts | 2 +-
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi         | 4 ++--
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     | 2 +-
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              | 5 ++---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts             | 4 ++--
 arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi   | 2 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi       | 2 +-
 14 files changed, 20 insertions(+), 21 deletions(-)

-- 
2.34.1

