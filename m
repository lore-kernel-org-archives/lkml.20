Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97F35226A0;
	Thu,  1 Oct 2026 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867698; cv=fail; b=CdbV7jqI73GbejfztfQp1Pi+P/RAkSNwjLqlLspSrDBswyWzsfICm7jZpddpaEEMRUy3o9g0u+DD74tqr51fF6nZjC4GjDZ+WktJM+6X91M2MssZI8c04+N5fe/u11souFcsOttK9vNAqB9xNgplZouy24lpcRAI3oPZQkiUtwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867698; c=relaxed/simple;
	bh=xWGexfdeJU+BkfuGm0OidwsADPJz0o3pzdxLhPxtmJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rTCo90MxZekwPTIcu7vrmATiYi3HMuaRVk9piwPzNCFM3W56ooDP3sot1N7AYqyZu0y+SfJ3GNelA/B0uOqyPbCel+blumt6mUqViQ7raJJecQqU4LoQzolL7Z0+HL8Saa1Om7mtVGbC/gSfgZLElh26hvgLckrvaKV4bO8gDFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pjZVyYUI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TSXqyhJk; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pjZVyYUI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TSXqyhJk"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691D27ZY3843582;
	Thu, 1 Oct 2026 10:14:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=n3ivcgTWP6XVHNZKUzS7IekMzHgZPUSCNXZXzSZXbHE=; b=
	pjZVyYUI1/w5z8t+9g08fTqPWchVmVUgf7y2Al5XuygzSpEgTDi4/8e7KV6ufH5N
	BaH5Se1rvkSFQkKcGrd1xr30yH2ygmFSyOxmQUvqo2Bng/eGiPnj1RdKOwNLVkSA
	CrjXIfRIl1YiCR0+G3cxCDd8tj0/1ORVYfOvhpRRWRgEGfzKnS7LKvWAPYlkgzqc
	4yxmgFcOrupN8e+KZ3DlyF5ernhP6hA3jk8iOICwuCoUGHFHKWfCj+L5uQYZL0FT
	Qld8/6bSCTVrrJ3Zbxa12twKfpELVKgdvYLfEGs6jD+m5Mp96imqw/Qh+Ipyzp8q
	IZc7pcr8SsPNwVgiyVLAxA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021098.outbound.protection.outlook.com [52.101.57.98])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h1gv7gq1m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 10:14:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w90Evp19Qt9xPuMwCFrz+fvMCumlmioz3/tkFeX9ieRxNVs2Tze3yVvPPV4gk4iZ+PMmADxqDIK7/sJxP778hOH8huPX2PdBGjlQuXbH0bnEwvrPbc8QSRiSlue12EnQGPERSpSjJ+pFEuvYKOW2olzS92MN05Tfh3h+UvveOeRs6yBdtAa+EI8vEzRTaLXXCVZbMGceS5pDVt+voWcJmSYAPDjMtomvKnoUYFdFc2wuaUkyBuxGPEvsstRLpvxP0Zrg0TXBZ+Bh1ZVPdtph31EmFzqFKNJW/yDeCH/IlaGwswmzHQvOY5fYMOg7FVRJDiD6vCeVuxEl8APCPuvd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3ivcgTWP6XVHNZKUzS7IekMzHgZPUSCNXZXzSZXbHE=;
 b=FwEhDfYgCJFvWi5B/evLWlAslzNco/mjN/hBwYgbtihodnCpTttyWqAcIlexEMc7n1SabhvOUR5Iuwehj/hBueMRQK8+to/KOcQBirFOIjTvNlcsGuaiO4cdhqrN9UFrbzI62Sgl+XYQ66fgYp5dFTbfAQAX55NfMZicpOVrve13wmD3niU20s4NNdl94PeFeAbtiV0oeRO9agR66cqrCLc6Kj0MG26eEzFtX3pmUhQpRO6M8mUzAYpxdJ0oEl0Nxyaoc/9XnZrWNvUQj62uvdloXOqfyxi6fxcYsCFlpDHo5HqpV/zcE60deoYwJJQcITz9VWQCg5GD93zgzI1yvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3ivcgTWP6XVHNZKUzS7IekMzHgZPUSCNXZXzSZXbHE=;
 b=TSXqyhJkCqPV4/g2wf/eYLaS0HW89aG8P+DYqiiQlNguoMPDcPDf/fln97NL4JIP7GEfG4RXRqT63bnRk24SexpXhmWr35gDiuqIdE3NjU2WPQRp+BZCO7UfOKiR3XT0i+JpfJ6Fz86phWHSlFXWyuukDFAxS0hrmY/BT4dB+8Q=
Received: from CH3P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::34)
 by LV1PR19MB108256.namprd19.prod.outlook.com (2603:10b6:408:503::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 15:14:40 +0000
Received: from BN1PEPF00018073.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::ac) by CH3P221CA0014.outlook.office365.com
 (2603:10b6:610:1e7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 15:14:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00018073.mail.protection.outlook.com (10.167.245.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Thu, 1 Oct 2026 15:14:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2DE7540654B;
	Thu,  1 Oct 2026 15:14:39 +0000 (UTC)
Received: from [172.17.0.2] (unknown [141.131.82.140])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DC37D82254F;
	Thu,  1 Oct 2026 15:14:36 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Date: Thu, 01 Oct 2026 10:14:27 -0500
Subject: [PATCH 1/2] ASoC: dt-bindings: cs35l45: Adds LDPM settings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-cs35l45-ldpm-v1-1-545787a5afe5@opensource.cirrus.com>
References: <20261001-cs35l45-ldpm-v1-0-545787a5afe5@opensource.cirrus.com>
In-Reply-To: <20261001-cs35l45-ldpm-v1-0-545787a5afe5@opensource.cirrus.com>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790867674; l=5628;
 i=rriveram@opensource.cirrus.com; s=20260821; h=from:subject:message-id;
 bh=xWGexfdeJU+BkfuGm0OidwsADPJz0o3pzdxLhPxtmJU=;
 b=nXfo0kyoozzSeon+4nKqnPe++PQjk8nXajNWQ4VYnpMV6iMquz5Y19pO+eM9MraJVMbq2POaW
 1FAvJjUJOu+CYJtalkreJA10jYeABEYsO7/EraGxDgaw0evLaURJlJa
X-Developer-Key: i=rriveram@opensource.cirrus.com; a=ed25519;
 pk=PWYAqW73jQepp6ORjx3V81remQilskf6ccMx0Wc1wUA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018073:EE_|LV1PR19MB108256:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aaa353f-2f62-4de4-1075-08df1fceb6e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|7416014|376014|23010399003|10067099003|260925021311599003|260925022911599003|260925021911599003|56012099006|6133799003|3023799007|11063799006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oWigJcL8/ZGdYkyFCIBLy7vUqnxUOcFpgjPViyKBT25/wrznyp1WQZYkSiv/qLnG3onJf1gcJZ/Cjaq0/PMv35zn+yqRYsUldUdGFl6d6FPjUVl0wtwK4haK6+I6YljtNNpK76/AxFCSFp9GqaCaxXxvaWebG1WAPKZ7M0+wcbf0RJEk7UXuAuyw4GTdBcY8ZHeHL77fbXndG95uubRNOupiqDDx7CmKZpXfiDutxcC7FUjd6YD/ZgMsjNJwrdhGzYl1Xz6nOC+UzjKZoCj7mhoWYf+EAq4hCkSPrt7cP14cKncyik9h7HE9260js9MztvGAVX0Hd87NQ2ZatdZolyyEyuEHHjjIoIX8eAm5WzDcXd027jey6Z9UaURCAZ+TJpFH4c/Bz+6EWxxd4aBopectdrenoaIhqXhMZzDz4JZT1Gt8J5i0VYXbT4vgic74+547dsi9bXij3yhz7orc3kZ0n81JFoOx9M37LLF/nlWt8rxsNCL86+Q56Xz0ltTTQN8P7FnHJZKcMbkvwQ7YlxfcW5bAJ5unvWpdJn1MrwVMr0FRFATIVbgEzTzbelZ2K19Nu8oFyKuVxzqNVB7qyguuxc7z7A5H2XrBof5QgGLBZk3m3oH0eGX9IUvkOzUlTpuHIFCCT85CywhsjG7PTL8eIHXT+37Hm5lXnA79Aqr18PA6NHDvFk0PrMfG1rTe4k4rDIW9TIm6TpUaviRstg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(7416014)(376014)(23010399003)(10067099003)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(6133799003)(3023799007)(11063799006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aRkqla8Ronn7loMtx7+Lh/UAp16+8XtuZ3aRjduOBnZjJSAYpL97q6bDrSQVsWL6kAGP3NWIHXvfLMSPcajWxatOBoMfUNgmU6d1bOr52rqProTpE4CCmHdGS32NG5UT1FKSy0mK0jQZBWaBqZpT6Q3HY6SRZ+VrdTYsXdM6JvwgKKgjvFinjZZEV2XmQigdVjHKFQ+a3ysl/8/FkVUzSLt+DR3jdJTYBNpi42sG2HK/NY/daHuO+xv0a3tUofJZUdWoCLPvU4ayI/H9mO23cqDBsXTxVJgYHSF7BBmQ8CWWrKG3lp4S33ZWLCSvc9KoIBN+QQJ1lv0W8bHHkhTg6wqkXbBwzugpwrxgR/f4dzzGxgowlielvm5/B3h1xyy1gu+cxsJ9L8/Jzv6ngDP5M4WIVTEVJ4ifISBCZlu4gvUCXeDMFV/IQ7dHLkPDuhPV
X-Exchange-RoutingPolicyChecked:
	tDcTlviMDs8Qm/LYpiDl1pjgLHqheoOcaqWNK+YD7KeAOs44OrIVGa6Ks+CYAyeggIEhkLGUF5A/2mxrwu3wgk2lSUFO9aZBPoPfrFnTa9q8r6W8hDdZ2zP2hXJ5HMcybWwtHF4huR8WthGqC6aBb5oY75Nqp66/TmIAIeMCDfuBMunBgp87A1VswSdRJydIxyDM/W5o2wgc3Zk6miZCIT6S3a310L1yeqxBcnC3GW9An+nXiX/fDW+3utCSUuAU9a2VlXp8bA7lSU3gnDf8mtpnlZtyQ5VUghGE1bS/jC5RI6FR2x6aMKiTwfxYbW+sVtKBkdIrSGi4jAmm0Eq0Cg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 15:14:40.0144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aaa353f-2f62-4de4-1075-08df1fceb6e8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00018073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR19MB108256
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6abe78e7 cx=c_pps
 a=zHc5ipMoJZhVMviFMUShKw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=Xcpt3CKX0tbDe7Y3ht8A:9 a=QEXdDO2ut3YA:10
 a=t30qsMHlJzOsgWiHt2r7:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXz+cg8azsPfOa
 K9C83sm6l1ZWm4SEfi/g/9TyLXdPajzabe06EbEsTRrgWMzdYoJIDCo/DMeBhBR9SnfackzeTAE
 YudqQ8by3YEIoy6p7gy2f8qwcfojP8gFOoBzI8cLVgy5zn0Qjpibjkg+EsagBCQV4zy6dOBdkss
 CWAr2VThkOOjdZDnKysRj03pmaG5Doj5S8A++NF3TuSgkM8HPfo2HZaadXQJlfh972+sYN+be6J
 bHFSyrjd11JioVUv8hsFeQOsq8HbfrOXO+/h0dC/rCGgGqtR/kjsOibaLlsLwcn+l1IZ9a/I12m
 1zqunHeZxxjsRmX6IA2y83lW/0E4PPGv+aIPcKWqiC7QU4OvzZsommKW0MX+7NWj5IYlaEiQdg0
 Wmx39Fqe3/PozAp2vUqjfT87x0H4ZrVnyv9ES52YqAYgrdyKRPq1/eKJ5OApZmC/Hs5ORRoLQPe
 pTfaQ36uagttHkxiZow==
X-Proofpoint-ORIG-GUID: VRsUJCzFvH4bOUzh4LGwYJ4TEK0iiae2
X-Proofpoint-GUID: VRsUJCzFvH4bOUzh4LGwYJ4TEK0iiae2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX0+6B5/MMbLdp
 9j80chVkEE7xo1b1XfuvQ7UC4eq1y8HMs6nPmal3oM659tNgvzjBF0rXIOzM5j9p7d05Bugu0Cc
 piZ3chGSwnAuifPdnRP+A8pnKyYAQBA=
X-Proofpoint-Spam-Reason: safe

Introduce devicetree properties for configuring level
dependent power management (LDPM) functionality.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
 .../devicetree/bindings/sound/cirrus,cs35l45.yaml  | 86 ++++++++++++++++++++++
 include/dt-bindings/sound/cs35l45.h                | 27 +++++++
 2 files changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
index 1ba809888a88..e674811b22b2 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
@@ -71,6 +71,58 @@ properties:
     maximum: 7
     default: 0
 
+  cirrus,ldpm-group1-boost-select:
+    type: boolean
+    description:
+      When in a valid group 1 level dependent power management (LDPM) state
+      the integrated boost converter will enter the configured low power mode.
+
+  cirrus,boost-low-power-mode:
+    description:
+      Configures the integrated boost converter reaction to a low power mode
+      request.
+      0 = No reaction
+      1 = Force boost DCM low power mode
+      2 = Force boost static bypass
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 2
+    enum:
+      - 0
+      - 1
+      - 2
+
+  cirrus,ldpm-group1-amp-select:
+    type: boolean
+    description:
+      When in a valid group 1 level dependent power management (LDPM) state
+      the amplifier will enter the configured low power mode.
+
+  cirrus,amplifier-low-power-mode:
+    description:
+      Configures the amplifier output stage reaction to a low power mode
+      request.
+      0 = Stop output switching (noise gate mode)
+      1 = Noise floor reduction mode
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 1
+    enum:
+      - 0
+      - 1
+
+  cirrus,ldpm-group2-vmon-select:
+    type: boolean
+    description:
+      When in a valid group 2 level dependent power management (LDPM) state
+      the voltage monitor (VMON) circuit is put into a low power operational
+      state.
+
+  cirrus,ldpm-group2-imon-select:
+    type: boolean
+    description:
+      When in a valid group 2 level dependent power management (LDPM) state
+      the current monitor (IMON) circuit is put into a low power operational
+      state.
+
 patternProperties:
   "^cirrus,gpio-ctrl[1-3]$":
     description:
@@ -139,6 +191,30 @@ patternProperties:
         minimum: 0
         maximum: 7
         default: 0
+
+  "^cirrus,ldpm-group[1-2]-pcm-threshold-db$":
+    description:
+      Amplifier level dependent power management (LDPM) threshold. Input
+      referred threshold of the PCM audio signal in which the level is low
+      enough for the LDPM group to engage after entry delay. A value of dB
+      -2147483648 is assumed to mean true zero data with an LSB dither.
+    $ref: /schemas/types.yaml#/definitions/int32-array
+    minItems: 1
+    maxItems: 1
+    items:
+      enum: [-2147483648, -102, -96, -90, -84, -78, -72, -66]
+
+  "^cirrus,ldpm-group[1-2]-delay-ms$":
+    description:
+      Amplifier level dependent power management (LDPM) state entry delay.
+      Time that the incoming audio signal must be below the PCM threshold
+      before the LDPM group engages.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 1
+    items:
+      enum: [5, 10, 25, 50, 100, 250, 500, 1000]
+
 required:
   - compatible
   - reg
@@ -165,6 +241,16 @@ examples:
                                           CS35L45_ASP_TX_HIZ_DISABLED)>;
             cirrus,sync-lsw-txid = <0x1>;
             cirrus,sync-sw-txid = <0x1>;
+            cirrus,ldpm-group1-pcm-threshold-db = <(-66)>;
+            cirrus,ldpm-group1-delay-ms = <500>;
+            cirrus,ldpm-group1-boost-select;
+            cirrus,boost-low-power-mode = <CS35L45_BST_LPMODE_DCM_MODE>;
+            cirrus,ldpm-group1-amp-select;
+            cirrus,amplifier-low-power-mode = <CS35L45_AMP_LPMODE_NFR_MODE>;
+            cirrus,ldpm-group2-pcm-threshold-db = <(-102)>;
+            cirrus,ldpm-group2-delay-ms = <1000>;
+            cirrus,ldpm-group2-vmon-select;
+            cirrus,ldpm-group2-imon-select;
             cirrus,gpio-ctrl1 {
                 gpio-ctrl = <0x2>;
             };
diff --git a/include/dt-bindings/sound/cs35l45.h b/include/dt-bindings/sound/cs35l45.h
index 25386af18445..5cb77d48b0b8 100644
--- a/include/dt-bindings/sound/cs35l45.h
+++ b/include/dt-bindings/sound/cs35l45.h
@@ -17,6 +17,33 @@
 #define CS35L45_ASP_TX_HIZ_UNUSED	0x1
 #define CS35L45_ASP_TX_HIZ_DISABLED	0x2
 
+/*
+ * cirrus,boost-low-power-mode
+ *
+ * BST_LPMODE_NO_REACTION:   No reaction
+ * BST_LPMODE_DCM_MODE:      Force boost DCM low power mode
+ * BST_LPMODE_STATIC_BYPASS: Force boost static bypass
+ */
+#define CS35L45_BST_LPMODE_NO_REACTION		0x0
+#define CS35L45_BST_LPMODE_DCM_MODE		0x1
+#define CS35L45_BST_LPMODE_STATIC_BYPASS	0x2
+
+/*
+ * cirrus,amplifier-low-power-mode
+ *
+ * AMP_LPMODE_NG_MODE:  Noise gate mode
+ * AMP_LPMODE_NFR_MODE: Noise floor reduction mode
+ */
+ #define CS35L45_AMP_LPMODE_NG_MODE		0x0
+ #define CS35L45_AMP_LPMODE_NFR_MODE		0x1
+
+/*
+ * cirrus,ldpm-groupX-pcm-threshold-db
+ *
+ * LDPM_PCM_THLD_TRUE_ZERO:
+ */
+#define CS35L45_LDPM_PCM_THLD_TRUE_ZERO	-2147483648
+
 /*
  * Optional GPIOX Sub-nodes:
  *  The cs35l45 node can have up to three "cirrus,gpio-ctrlX" ('X' = [1,2,3])

-- 
2.43.0

