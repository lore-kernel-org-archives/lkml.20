Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E44379C39;
	Mon, 28 Sep 2026 03:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565782; cv=fail; b=Nu5DcGlXo6i05npPXCQuNdhX/XER8H1DvUhevQDgEtGANPbsi4iVRm8C7jDiGBg3bFc3g/NvYv0UUANSoQgLmAu9F6BArAPw+BRDP31opRFJ8p9M7o/0S23SaBQdfpz6Uaod14Y1dx+m9mO4RXiQfwnrVQk7wwGOU3dondhI+88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565782; c=relaxed/simple;
	bh=IMBBkW2wD9BnJohZLF5zR4W3Nt2BtzDai1UX+6jbvm8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sEEZEc4/kEmGVkvDkDlhaaLQPLo4wiQOmhRI1RSFrUpy1VskDz635FBwbcxBZgRSTZk3Jj4yhT0f7UBWp0S5chixh5lZyvU35DU8h93rtUlOlfkzzfd1faBV8HKDCMwPGhtXj5WebovdJtNAtU7N2v8KlL/60EC4i0gnR30mFwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=F4Ga3pmN; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gPCsuHta; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="F4Ga3pmN";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gPCsuHta"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68S05DFt3708738;
	Sun, 27 Sep 2026 22:22:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oJjxDRkuQv4FH9IwK8cXsQNNcPEcx/YhHAyrRmeub
	cg=; b=F4Ga3pmN1GulM7g12Pn6aTCSQ6bMgpspAkrsXQcwZMN5TGmgDu+h4Ti0S
	/QCeIGKa683VVSSReRldeinPtUg8DiDJ9kBWT40HsmRKS3J++jcAQoZA+v40YNsG
	V4nWhE4/ZhrglgQ4ZfzEAlg544b5z6tbxX9Ph5PvuJWIXOtPPkBjIzKKo/SShxmv
	B2pM6o9JvTNfPMnmMpI7dC+ATosKlcS6rrhJGAMzWk7kUmZ8BEzrw23Y5U9t8JwI
	xXCU9TWd9W94yFvanskTa44mGPvRWguKeT5BsXGhFTFKLDRXl4gHsrlv62q/9dXZ
	dngmXIUmVC15L6LrJroWUFsuyNzYw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011014.outbound.protection.outlook.com [40.93.194.14])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gy00nb4su-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 22:22:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRKyy2lnYWJpko8nZa2ztfUfHCshQQpWM3hnRH2Oauqmwtf4rOEtpiOuiXKbnHZ6zDEN5jRQgzBHL9KH6tKIs1TCps0Qbno7LF79R/2cacvdCiK+MKrVhrCv7OupkHRLCaPVrz7Tuauu4Ow5NfcDcQeuWTUIYO4txwB49/edZhw4B7XGI2sseFEn888T/+jwOzZsuL5Vpqimg2ijKGzNwmjMw8+eAVRqklnlV4UcAEwvebVOo9Jnef93WlOoLv3kkWXLvu1UvnIbzri8Wslqtz5vYia10emF769/QpRejDVQr0ruiNvWXJWGERdZUs/LU9FT1bAsB7fmygmbMnI1Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJjxDRkuQv4FH9IwK8cXsQNNcPEcx/YhHAyrRmeubcg=;
 b=gBcl1Fsa0odKbuQlfQ3hze6F761ctViV04xNcFoMw9g/r7P9VQQ/UeW2fWUAvSQai0tkQm0kF1l4Ol+Fd+mO02FP2vUlQUy6kaQmL6AR4gx2gyrKZQocf8dk6ZNU8ogxkdTxz+W5gyAZWK9zdb+lj1KOglbVDO0bFNJ6NFUzj10ugxIbLs/JPtm/PigOWAnuheM9RLjeYDe5o0DzBvQ/ws9TbJNrG6pLgbBkFRnSFzQC4RDGFwTS+gVMMxIGGqWLryY4IOxDRoUonFC1NTDlpbbESeSbDb3UsR/LcXmeZpKnb4oi8BA0Lv9FSc6WHBOm4+kaGXzWUYPS2Mdij52nIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJjxDRkuQv4FH9IwK8cXsQNNcPEcx/YhHAyrRmeubcg=;
 b=gPCsuHtaCtGHcyxWH300K+Ll81iYuNaGkDjyaK/op/B5n/fAMpHaI4NzK5cpbT+KhmFlFD7pzwFwyJB3LoG1zSDBz0Vkpfxb5wUVU4CE2IkVGq8QbUBPnLyaPKy9TbbK6oZVmPBvj2HvZUEowGcGpDtQr+eqIR+8wvDNaXSxBBc=
Received: from BN0PR10CA0027.namprd10.prod.outlook.com (2603:10b6:408:143::28)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 03:22:54 +0000
Received: from BN5PEPF00046989.namprd02.prod.outlook.com
 (2603:10b6:408:143:cafe::75) by BN0PR10CA0027.outlook.office365.com
 (2603:10b6:408:143::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 03:22:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN5PEPF00046989.mail.protection.outlook.com (10.167.245.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 03:22:53 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:22:31 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:22:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 22:22:31 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S3MNu23209268;
	Sun, 27 Sep 2026 22:22:27 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-adivi@ti.com>
CC: <hnagalla@ti.com>, <jm@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am62p: Add MCU SRAM node
Date: Mon, 28 Sep 2026 08:52:10 +0530
Message-ID: <20260928032221.1072316-2-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928032221.1072316-1-s-adivi@ti.com>
References: <20260928032221.1072316-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN5PEPF00046989:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: b4cc7661-813d-411c-4eb4-08df1d0fc86f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|921020|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pY/6ZIpAHAWhA62CADWX2zKRV/GiMA3vWBKxPwOUMiJbIYADPJ7wTWrrGRQY4QmfL7cxAMkNFhQQne1r+shbmVKNP+1J3z2AsA5AwZ18AWr9sIOzvuzY6Qs8teKlcVPrVwXsiWjIqyBr7ZWa3f7AnQOtT828g+i6ym1mW10fHKRzSPFPvT15MCREu6EEay5IFd3n3vMDPVS8O7jwV4VeTmmbb3FTnV7gJQyM/4rJkp/92q1XbaapY+ScAiNpFLA5HUP2p9pH3Upic/Wwm9bhNd0lsPgDfS3oVg4YOSLrUpjMsm6a/CBAyURue8TLlJxKVMMlpKlQHf5pZ2YPd9/MBAIjTkFjXcT+gmYk/+dqD8cZNMq8KvQFjErYXSzmK5peN//jnrzm30aFvT42tgDQFvqJJPSmfMZ5IjHKvPg6apTuspK7d+0mUvapUwCA+emaIsdgBmVr7vQ9FZfd8/Sq8m1wd08lzbYO6izgp56WyDH+pEZLp14TK4m4Alkq+wXubwU0chWHSEIuI2X0rT1KwucIzgx+9dCauvYv0O/lFfl9KHkxRHsg12T7gp6Xqxsk4JHYHDGZaEFL0SOwU/TSTj13p5HaHt5MfMEIYlfD4xOqQ1a8NKpM3DQEbDrk+KEdwTv1K2JIp+vNyzr5Fp45OedyfQWwHpRk/Yotd9e+yiFMDOwsz6sCoP6WvVPpqXe6kWoUi4T+qViT35/WReHQfhfFC+yYxons4dubNuiKnZyKIwL802NLLii0kSbzl175
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(921020)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y0UINL3iyhJ6X4usnglQ2h6dy+zf8BSuR2hXlPCkpiFIQyebZ5Yh4fT9OiKB+n3Faog01y/iyIjMS6BPwk83AGkiEvYdKCuHggDrA9BUW/YuAG+1fwtphqjzTJg3lejrmvmONVDpGHyKeYaFPj63+V0kslBzv9Hkn8wBDkZ8xyr0B+Nm7izKBVcEgqSF31oXIaEWWHkfjZ42C06Fi9yW1E5nvCEwGJ9Wwvw8F3sURyG6sAe/S8MDKJD2XR5RSYgkp/ISA51GH62b8Tfwzzo+ITzIYV+n1hxotgNlr3gGbIHtbDjDhTeqIEuxMIkr+52WiS35ckG/0tn/lvLJkpptGsDz5kaygotncvvf9DyY0rS8W27zXZmSqDQXwRAGVK54iwhMGKHo8mek1PJ/kIDiz+lSxyDp/TJfKAX6ZUc/15g7p5vixi/Q5ZMSXKEDUMzj
X-Exchange-RoutingPolicyChecked:
	1n5KygtqRsTYIrNtfTGzw3co1lrJq9z6SGd/dYlzFNe0AlcvCTk2KCZ3f8LFIAmCcVSs7iw8Mvzi1dgKz/JhOQDmbNJhplKCFLRdNADlTil9XUEvI1md8bVKfIT98XPPpzEbzUi0vNrbk/sMKT7W5ujeAIhkIGcX83hFNRB6T3UXefhpFeTYlgW94H7t13YFqkidS1k4zBfxYEVj9qUm6COnWmynsqAepZpqfZF8xnuKgjGqAdwnkNt3FDjt1JrPzO2OTsO1aqDcGi0AAtI8qoqKv3h/vru5DeF0FrE20DscGXWwd9NZgM8WN2rURK2XalMgLDiC8JEogEsSYRalJw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 03:22:53.3177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4cc7661-813d-411c-4eb4-08df1d0fc86f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF00046989.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-Proofpoint-GUID: fZKpfsjKuG8Y2lChwDhkgNCnhZeeLoNQ
X-Authority-Analysis: v=2.4 cv=fKysTpae c=1 sm=1 tr=0 ts=6ab9dd91 cx=c_pps
 a=u5a0R1DJIqwdmu/eAz29vw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=kggGP2yNuq7Axv9sfgwA:9
X-Proofpoint-ORIG-GUID: fZKpfsjKuG8Y2lChwDhkgNCnhZeeLoNQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfXzd21uLMtvNdU
 xMMWbbF+f3X4+9e6aR/45DO8E66p7PRCArCPWGVF6O1ppIRZWKqoYKXb6s7QPVj2fbQIcuxl3Gn
 K3vRpp72Ia1ylvixcWa+sywfTH1sG4k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX56Wn4w/NoVM3
 0Aasqd0GhIq9qM068wLkpGbZ+vebjeXlK9WyZhkVr4wEiZOhSxzKsfSDv/qCrgXLkJv+e3wNK1u
 GwpevgUltCWXK02lweqvPdgG0YU2BGGZ2J8Y858vi1ioUOMormnAGsaU0vJcqR/AH9msjmwUBlk
 6D5ji/DJ+JqhT/VdB3w5W3PFdGGlMa9hDKm1xCP2wE8x7IVkTOpyLprCwKI2PMc++ZaofIfLzlN
 0Nvxp9jyuFe72ZwNKqTQgnafjxt+Y/ohgfprFF+2jKU9bZTXEUAVGBLrTUv+SgOsL13FZcsh0DR
 sj1gvWFDUo8HPm5A/cqp3U8Oj4eLvAmO9dZu8frrFhRJHq3hwadullw5ZTTgrR5J+iEil+LDH23
 R0uoIgYESLfOK1F4oQj/uqL1JppIHuBMVlqBO/BfeEVZkQuC3vwBxpgJJlW8hIqrWNrx9AqPxos
 en9cozZ5mCBJpHyNV9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280013

From: Hari Nagalla <hnagalla@ti.com>

AM62P devices have two banks of 256KB each SRAM in MCU domain. This
memory is typically used by MCU R5 firmware for low latency accesses.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
index 2394a4fb5a94c..278404cadcd98 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
@@ -6,6 +6,18 @@
  */
 
 &cbass_mcu {
+	mcu_ram: sram@79100000 {
+		compatible = "mmio-sram";
+		reg = <0x00 0x79100000 0x00 0x80000>;
+		ranges = <0x00 0x00 0x79100000 0x80000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		mcu1-sram@0 {
+			reg = <0x0 0x80000>;
+		};
+	};
+
 	mcu_pmx0: pinctrl@4084000 {
 		compatible = "pinctrl-single";
 		reg = <0x00 0x04084000 0x00 0x88>;
-- 
2.54.0

