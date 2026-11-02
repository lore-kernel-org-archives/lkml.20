Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793637737;
	b=0dHQ1wGR6NoIOJW9l7AF2bCA6Pa3/5seXzVmNLdRgqa9bfszMnOQGi2U7pyWR1tCbNrG
	 kdEm/RG3iixEcgEMjVcxloOTwHzFLclPwWM6dIgipG6NzbtW0EXle0v877AbvM+sGgywZ
	 vd8hsRisfPAoY4MV7n8VgxI7eetBC7I9J3Jw0CnV193fWtvRfhAJh13MlAqJIWtQ1cPHz
	 639ZcMmxcfkzvgPEQ+knq456SuF32PE5hQcQah3X3UIMPB66K/UDgnUF/b5dVKFZDzo0t
	 8q65yPl01QROJ45FwcRMa9LwXYF4h9OOlqaQNDdT6pqMMgj9kWQ+Tb8+yUHYHJ4ijDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=/fHs7WtxjJhYAERrEPh1RQMlg3/BgKmEk1uiEXhuQ4M=;
	b=r9vm4nyAI3P+ILIaJkcrfGDBw0XHmL7YzkAQvknzJ5jX0MOjjktZ9oao3rIqSUXBx2qP
	 n/uA/UyVnkBmnSzqgxF6KO1L/Sv1e+Joidyctekx/LuDL2bS+lxovorSX1Uaa/dEYu8hn
	 83zQBvqoB5K7OQS+pxTdbmhrD93hL5y/xyo4bPMZEZApaNr/96RpkwzIW0LhzxZN8Sq4Z
	 kqcVQUeVHVn+o5ngl5You0HDMmKE7GrrfsmioI8yTkqidO97LqF71Mt0XK+C60vocUy42
	 B5PhgidlHimy9+qTmVZONvx0Jb2tNHH/kGLELZ7yDpJs5LtFqTPZP3LLeHuNiAakbMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=WGZ2OGVM;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Epgd0Iyy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B12A606BA4A;
	Mon,  2 Nov 2026 16:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B12A606BA4A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=WGZ2OGVM;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Epgd0Iyy
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DPBpu2776587;
	Mon, 2 Nov 2026 10:42:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=/fHs7WtxjJhYAERr
	EPh1RQMlg3/BgKmEk1uiEXhuQ4M=; b=WGZ2OGVM72LgNtau31ZuL5G174GfEX50
	6duVpnT+S7qNMjMEP7Fzpw13b7/Q4+yOVl3DnuNXhsKRae1D//sdEUGDUKz3cvYu
	woALmJHdTyQ3JaVgigRKrqXiPX+9lgI+mqZoKUP8PE+oO/U5HWSAGu9DR3O9DwKu
	XI87clRt9UiB1HkdalkuTPvHqPz07ni4BSi+S33WbPTD+FFdcekd77lbhXNmrWPD
	cp8Waz6hpqm3FVL5Fp74p8VIQjR9B0Zt9Xu/Z94e/DoIpGGURQUbEEWz8rgs7K1Y
	J2Ig85cnOhZl+8cunR1nny3bXzb7MiS0QMjH4UjV8RHSz7eeX3AvVA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020129.outbound.protection.outlook.com [52.101.56.129])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hncrft98n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 10:42:08 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPEsv+LxhUYJ3pW8RpPjSk3sUhosxpxQ+hhC9Hh7Uxsi8FLNFnSw7blgvN0jlFrmFyOhJORt7ixW53vGYBciH+drdPkgezxeeQ+1/cEJMqJ3z85qb1yEM5MwoAV7l+G64ja47o2uUlM95Ykdt8V4TSGU0uLd0UKMilnsvFKw/Gi9T5iHoVsOkMO1iJvMsdPd/TWnK5Rsueq3IO/4V/N1zGmtnvhYbYEIMUPV0OyHuUrip+2MmVBtKv0rwj2oaitMauqjOSOnjMsoHgJtk9w+X5Wq4c34xpZKZNFCrTobnNhp0c7kyVz3RLwlknlQoCn4hovOWNjBpq98/zLRt+7bmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fHs7WtxjJhYAERrEPh1RQMlg3/BgKmEk1uiEXhuQ4M=;
 b=M+0gdPHRnp/wMrQq/4oYEfWcjddAkcDGtLgptVpaWhNQBf3WBaS6hbrt0SoF5FAGlKgwLXqpd6lxWXWUKBDYsL30KzCPGJspmLQH6YjwoCOs3i5vPe5tFRbveKaZn9vxUyjiwHFSXohMew87PyIzs29C8ju5Od13mab/N0Xp8JscGrRIheaGrOncoeSQDcn59VnXi7cfusPKno16qPJBcRGiTufP2NV/VVte6K1s9pC4XW6s78+GbhHTo45DrU96jUjwlTxJyq6tselR2dcjS2fERUEAXw+Rz9swR4SH1YFxv0Fot48rhi8AvAbtDi5WWoQetXrqgscYkTun0whgYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fHs7WtxjJhYAERrEPh1RQMlg3/BgKmEk1uiEXhuQ4M=;
 b=Epgd0IyyPTZYF6krkpEzTnIBaQmnw/qIeFWPQWT0GMlYc9Mfsg7lJI8Tppqda1/jBAUkN42xERG7A1JfPCxfl7YGC8anhS7ppEdf4+d2RzeH55f6uvXJzhEp/5PG7aA/mTgl5GQHDAnEDgkmH0AnmxM5auKyCjjYvyzh/oVhP7A=
Received: from DS7P220CA0045.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::26) by
 SN7PR19MB7471.namprd19.prod.outlook.com (2603:10b6:806:32a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.12; Mon, 2 Nov 2026 16:42:03 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:8:224:cafe::58) by DS7P220CA0045.outlook.office365.com
 (2603:10b6:8:224::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 16:42:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Mon, 2 Nov 2026 16:42:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2F867406544;
	Mon,  2 Nov 2026 16:42:01 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1CBD682026C;
	Mon,  2 Nov 2026 16:42:01 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 RESEND 0/2] Add SoundWire detach helper
Date: Mon,  2 Nov 2026 16:41:55 +0000
Message-ID: <20261102164157.4010002-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|SN7PR19MB7471:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cfb65e71-1753-4baf-73a1-08df390038ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|61400799027|10067099003|18002099003|261102123227099003|16102099003|13003099007|56012099006|261026121527099003|11063799006|261022105027099003|261026140227099003|261009223027099003|261028144727099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	udLwbykFPEs4XbUXdg/d76u2rUkzTAni2i3IVCpFadpkhjo2aGtojGcFvbuofETwpoZs6tkceMnWwu5FpYJ/yUSpUrsj2jWdLKNHUd89EeanJWZFA+WDIKQcRCxOFeCgjQFEgAOCUSYF3Z+RclBo+PPTEEmCaFBMC6Qe7+D7n2yHvtOVBqwhZr/gA5UquKUGJ4f64R1i9z/pxnGm2aJ/xLStv7VI+E/4lvq+Hj/FgvG5JRjturzdfNFWoQEyIHEJu0BvrRhnGzIzyXjnRCCuI+p8vSkJHc9f6xDUFyK7wqF1VVr4W2DFsgel7eVoPghM+NwUOs1/s985KG0rn++4O5eNqu3Fv+b/mM3tAHIcXQqUTHT4eE49rvJpMprcOx1aYOklPOAd7XEFuPLGy1DRdDmio+Q7gI8wXQNWWHxm+XhkMA3TK8H4WsAEFI9sEGKpA/Kk8eiLaEoJbeVWoge4ltpWIftlmadaeWBseoYzzvTOjjkzuRUMB9htiAjUTogHZVMaYLTF6TLYAmwV9z8+5BiYkMZPPCR0vrytlndfHRR12GSMyJ01UEi7j3m7qijblgn+Aig9KG6fXKDAYJVwmy4cQPqCC+zCPL1ojnFuKN9JzGd8lgu65+jEtd81CZSxBvKRGVI86tpPQqc5QxTqPl+pqXSUce2dOnT7VTxnJVU=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(61400799027)(10067099003)(18002099003)(261102123227099003)(16102099003)(13003099007)(56012099006)(261026121527099003)(11063799006)(261022105027099003)(261026140227099003)(261009223027099003)(261028144727099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PQ2aB9tgBfoXi6QYZ461+lKumHug/Hd3EXxuaTP5jf5CnqEPdQq2a5VE5g6elhxyHtrtKiVQMPH/KW9j3Lk0GTX3pNNj0zcOXNWEU4NabrOmP6zzZecA2UN07rjIzALKzMjWSRAsKzvyEU1YjzpJJuuO0O9vYS9zJ6icdGg/fWQHjuX5VSbO/txLcfSCsvY+vbkDm5hOOwbbZCvr4nPf+kdm69zHOIyA64wjuQ975Zm0ljhXqOn95r0iI9aQf+y2t6r2QJFuiGN0b7/BNnOIQB9ITVDLRi/s4hM5qQHq76GbCbnmWNErQRvwfzLvbWVqskM7jDE9M99SnQ0Jhj9JfXeTrHMD8zNDiN2J3/qAC0vTjtwNuD2cXnYGxcRF1TKFTCd4Nrnbv40whV2l9woF0aW/lWaS1qJIITvRyMK07d1aOznFfwrbnBDiC6rVGK52
X-Exchange-RoutingPolicyChecked:
	fZBmWfsfIaJehDlfgT8pCoaIYLAOHQtC/9rEXTCJ7cdGsIn2lpmRh0yLEfl+sX5HBfIIMdJiYtPF/EN8b4Rviw/RRCO0zuSfg6FzqX0pAGylHatr3S0Q7zPh1TTmoIrZTJ6HMbw872ejo6bgKSiQvcvjbUrpAXPJ3otVyvCRo7SE7cwY060teuxUPKPhDVDWfYbMULvClObqoWEXadd+f8FR3vOehQTS9i/Bck3G35IThAskpQtYkte+cLyAhrvkI7EYroU/z/SN9qXaVrx6zLCCPEbtsmRXSWp4QcycAbZZySZWZczrVAXFCtn/vcDZD/qp8pxr/6kuJoI0kMOALw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 16:42:02.5509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb65e71-1753-4baf-73a1-08df390038ee
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7471
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NiBTYWx0ZWRfX8NyRGXXR45X9
 FgWvA5ROXyKXeIrgpX3AHsOyqT1akPuYbh2puyVRHx6v5mB7If/PLA+vvbJ0a5VJcotJQbbB1qY
 T4dj+dLSv6dN6elTl2g62R3ss9DHkW4dqti21OWlMvzSt0kMfvcp0Td3QVxL5RlMCr6HI1diym5
 YAh0trAorajOQZ97LRFkgfMXi8ikPCT3y8pB8h7XlL1+RkpVaLLgUp4eR/Iy2k1pm+CS495yM10
 NY1qsoDY7Y5XbZiiWqhAH+sQuQ7HZFbNpARFJ4ueKJAuNDCB8CMAqiAlGV8t8toj1+NmsGxhJPG
 GUl6gChTye8tuFrL2I7JZXyB5avTei838hzyWtfeKyCuZ1AtCKOHg0yOBEQrQsj8u6U5JhtqN4M
 sNyQslvHewZWSlVI1kakjohyWztAWOpvE+9dj+pGOGIuVeeUx7Vl6/ZvdWRY/mgfdWvAFjr4Cgg
 2fKA1cOgokgsb1nGPVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NiBTYWx0ZWRfX+JFlFwN3VH18
 e0RGP/tH9oN8MiLmDB5+ZQw8zi/4BvAxUdQT7zTOCvWW4ZzObrU6tZoyR8BjAPKdjeoqWicEBWu
 luoJWEVt2nOLxU32B44vT7/G4KUHCuo=
X-Authority-Analysis: v=2.4 cv=LtgHWXdc c=1 sm=1 tr=0 ts=6ae8bd60 cx=c_pps
 a=68tMKWLL5ro13Q+0o2tD5A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=cZtL-XUxLnsMaWc3fMoA:9
X-Proofpoint-GUID: z5G_IRTOgBt6T9owCKldFWgNlnTYiRv9
X-Proofpoint-ORIG-GUID: z5G_IRTOgBt6T9owCKldFWgNlnTYiRv9
X-Proofpoint-Spam-Reason: safe

Currently, if a SoundWire driver takes an action that causes the
device to detach from the bus it needs to be careful. There will be
a period of time until the detach is recognised by the core, if the
driver immediately calls sdw_slave_wait_for_init() it is possible for
that to complete before the detach has been recognised. Leaving the
driver with a device that is potentially not ready for what follows.

To avoid this race add a new helper that drivers can use to inform
the core the device will detach. This clears the enumeration
completions ensuring that sdw_slave_wait_for_init() can't complete
until the device re-attaches.

This is the third part of a longer series of moving these slave
attach/deatach operations into the core:

https://lore.kernel.org/linux-sound/20260512103022.1154645-1-ckeepax@opensource.cirrus.com/
https://lore.kernel.org/linux-sound/20260608102714.2503120-1-ckeepax@opensource.cirrus.com/

Changes since v1:
 - Correct kerneldoc

Charles Keepax (2):
  soundwire: Add a helper function to indicate a device will detach
  mfd: cs42l43: Move to core detach helper

 drivers/mfd/cs42l43-sdw.c     |  2 --
 drivers/mfd/cs42l43.c         | 15 +--------------
 drivers/soundwire/bus.h       |  6 ------
 include/linux/mfd/cs42l43.h   |  1 -
 include/linux/soundwire/sdw.h | 26 ++++++++++++++++++++++++++
 5 files changed, 27 insertions(+), 23 deletions(-)

-- 
2.47.3

