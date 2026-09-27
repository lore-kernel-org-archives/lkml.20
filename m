Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDF4340283;
	Sun, 27 Sep 2026 18:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790533541; cv=fail; b=QyKJ7b72/ShiWeQoaorzAjoIeg1j7X0juqSLkeFGNbAT/tdpXvPvMMdXSjRm5JmmzASHsLB14k8IC/DcA/jTkmOmAvq2mR8tCHo3ZSuxoNgFaQeM6FndZw6nGot4jF+o3hKWfFTRhbDu+wsFOu3pX3oqtPkcOQtubYGLGZXxFjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790533541; c=relaxed/simple;
	bh=4vTefUJDUOkM1bl7n7p9W5j8CuA/CrMDrV/8KsvFgwk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HrTrM3WyWg8AkscFtyYLC+s2J9jub3+eeXKck0qZRj+1ZNO4PWLoVeON+pEuQg02u6BpAE2qZnDvb+ABihlghphuEVfLfWsSYMDF6axi7N/3c7aq3+jJeAJFKT8WZW7YX9Nd83I1etyO1zBwTD1LQPCSCaGEXkJHF+C0621mFRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Oarkepeh; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lS2+liK5; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Oarkepeh";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lS2+liK5"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68R5eQw22284521;
	Sun, 27 Sep 2026 13:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=eLLHH1rpEoLC4IoC5L1tgytpv35vq0s+OgujZG00G
	oY=; b=OarkepehgVj+Hu0yfWBtwl4xcIbiEktLt8wio+R37ZHywZ90tmp1THbtW
	/F5ylaaRUam6JHLZuVpgj1s1HLQNF94FfneIO2u2HWAyKlBXeB1Q4rk98ivtpLej
	8itepcMTb8eGeQ6FCMMXPWQ00bm0oulbLsF76gkQ0jbGMBmHO1ehiv8hSbG2TCt0
	/7bHO6wfeLY3VOqCx+ucwz23NFI8ALWOzc1IioJ4H2cq8EOcvS8Y+UwSmhga5wip
	uTTjAQ5PO/WRPCnLT5aEdJtwaJyO9cxRqcf9l0w+JRjL+grI8swC7Ms366XXa1l0
	U8tjYPq2xpY1uEeFqR/wpMs/nGsIA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010008.outbound.protection.outlook.com [52.101.46.8])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxw6nsy3t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 13:25:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bi7JByrAqWX353n8D8fPUvTvNr49P953D+loXbTUMZjeKisNsGU/0W6l+nb6/4EvQD8saSh92Z/ZIY/v9jIbqfJlssLVswBe5hSR88AwsOiGTTcCusqh8XF73YuNcGghmTICd+ct6UyuXZ62Zn8CUmJmFHF+54YvtqOfzD7cr4u07gAQxI5tpzTgfTKFT1qZI9ZMxcMIp1f6QtjuixF3p/J6UJR5CyORoAhy5xWWWP+ZH6ob/W43tLHbVd6BkAeccp11OLixubsJZkl0p2P259o0HHNH9Uavb1ZAG/NVxuXZKOYjaubQbuhX2tOsHbUxXtQUDh23SIBtsdP0gJ/8YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLLHH1rpEoLC4IoC5L1tgytpv35vq0s+OgujZG00GoY=;
 b=CxFsFTpD4Qkq6FM6kubzJdQEtM2S9JXTiQfqMpxbzOY67jhkz5USsZDubDcM+9QBYKKN3JOytn/Wn5ssP7PmOirmjybPPaPjhhrET889oUiTcSx1fzGG2XkowpL26Zb3ExluiuEMYsWg5cimtcxxlCyaGLeofqPMBiSO3jZKZ+CqdBJIr+WRYGcvy9GIWAbWSWHMAcBhkFPNnSOiJnoEMkTtf+ZR2cVkFBzHXG/HzUzXamZ+prtdt+aKgYQLdebSZs/uJKJd9dd9e2Ohs4euVcwDDs0rSMcmwbrny599Kf4bqxutQVaUobxZJJEbwzM33B4UqacL1vxLR3AzsXuNoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLLHH1rpEoLC4IoC5L1tgytpv35vq0s+OgujZG00GoY=;
 b=lS2+liK5oEP2pHJrBsJ1Ed2GfTH8wJsGoP9+AhU1Ba5fDuEGH4zW8wkmPlQXFpG7hdFXXMqAo1bSdExcdW180p1ILg0DHe/fk0JNB5jwtTS526ASnNQYYN/5CzIK6DMSLMDobrwDLvDb5q0TXzNGhcbYjg9SdbBsehzNezr3tcc=
Received: from MN2PR16CA0058.namprd16.prod.outlook.com (2603:10b6:208:234::27)
 by DS0PR10MB8080.namprd10.prod.outlook.com (2603:10b6:8:1f7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Sun, 27 Sep
 2026 18:25:19 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::94) by MN2PR16CA0058.outlook.office365.com
 (2603:10b6:208:234::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Sun,
 27 Sep 2026 18:25:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 27 Sep 2026 18:25:17 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 13:24:58 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 13:24:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 13:24:58 -0500
Received: from localhost (ti.dhcp.ti.com [10.24.51.125])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68RIOuei1628988;
	Sun, 27 Sep 2026 13:24:57 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Devarsh Thakkar <devarsht@ti.com>
Subject: [PATCH v2 03/14] dt-bindings: display: solomon,ssd16xx: Add Solomon SSD1677 controller
Date: Sun, 27 Sep 2026 23:53:18 +0530
Message-ID: <20260927182329.4193961-4-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20260927182329.4193961-1-devarsht@ti.com>
References: <20260927182329.4193961-1-devarsht@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|DS0PR10MB8080:EE_
X-MS-Office365-Filtering-Correlation-Id: ce05ac4f-34bd-42c0-3f7c-08df1cc4ae91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|36860700016|1800799024|10067099003|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	QkGiAmSUPU4lGGrtzzwpRH5m+v90tsvaHl+YSsvPozVM3FmTRBm8ook8Wv41tnztuIYEavMwrN0kfA+Sgt3wW610O9IuYCQ7krSgaBM4vImziODIieMX8C7MLafSg+V3GXYnBq66zPcI6I16ATn+C8pUhABOLwBkqURnEStovR3vjOzbek8+w/LNK8Wy3btAAyuJNbSb5p+00gWvdk0nkvKWvGzEVG/O0CXOaojZ6jhpAWHDxmo1wKY15y0qhocMp7PPP+cWJXXwIiLk4GgSQkNwfnuUI3Pfuip/fHDakgBUsSu1512FyekwWQibluPUB70+1IdSDfIm76bKihVKx4Tu0CJ1rqkM3fPIvxJsqQkgwjulLs6snWOR8kmokElwmYIJ0W3pH3NXgNy+S95y6li0Upx7nDUHFCcYJynjGUW7TRq8F7S/dpsAu933E24D+1zrFSicnhKaSMMCw3yPfo4mmHSl9gnyOPlzHjmgYQTIMBMiQ60ZpzVxi7L+Q7cVt/JX2m5+XnTv1A9hsnzYTYe+jzeqFj5hb2tZ89r3PRyM8ztM91rLC/Jc26OJCqRHt47Xz/fCWsrLr0Fdtr9rh8Pcfe5F7QdNpLuKi2K5Z6w/d8E6ue2MGlmPapZQP0UOAhDR7PRPRyHlq19/+H0ugWW38BiSEHyy/XEAKmjRxvm7LOKzXFU3hxPFdUtsgGTIO5M9jsRImF0on2OaZ6umeh7n/G6/Pe1a1uEAVsHbnYDD6682x1uw3k36WpvxaPh3
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(36860700016)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Npn5NFi20QGCNUD+qVr0Q3B1Mfy9Ax0dl74qJupRBkVMOPCgFUB4Y2Gn7S3w3Y0niXX+sDlwEHsAkAGKupXtdRhjDpThvaKifL/3uOG2Q94NWBinzFMxHUvK8CFHP84EAan9Wpc5sXgNyMFLvxSZqYn5KZOWAvQr/O2U/aw2KuYCo3YQMFcnYfaquuqHH2lj6TEWKwbqmswvz6jQ8SHRB1byFCPrP6P4iC18oia/GJ3cJsMGsID1CfiG202lUFfGw8jgKTzQxbaru4T0sVyY1/+vdftxuaoF1YQp+Xmqpp5j5bpunw1qG4Oh/jut1fP+wanc5Q7Pd3Rw2g2aNC9oUFAIODRwQAbH8lz2qStMAnBq8owrxV8JiTIpkwDFBVFgy6wHX55ZgDwk9v40AMYPQ41E9l3X/VDU6EKtkj67uNUPFBTbKL2UlEYgUF/X/xGy
X-Exchange-RoutingPolicyChecked:
	cDYof+sOYDSpLlDGQD5i9LDRgaEkbqsNRElMBKjrnJjl2T/0zCB20IV6udz8bQticuScWG6WxUYZFCQwUpeetSny5ANk9ei9xrUpkAdIuUjD4w4LfxRw4joaMvpHiwyJsZebADwYssKtSIUik+/hPZu0cUzFqxFbxXds2QdeAwirSvS9IULZZoI/cIO2VvPmOxBtIJUvQtfqYTijrsMp6/BfSMpdhMBE/As0Iy7u61ElqM6HgIOoYTuIw/zJRT3qmwrUpwF+Owl7pEow3fv1muSCgEc33F2xWq/KDsUzpEygZShSN5dONZR3nGNvehDFjxkFjMoqa/xkUeOEHFRN3g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 18:25:17.6589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce05ac4f-34bd-42c0-3f7c-08df1cc4ae91
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8080
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA3MyBTYWx0ZWRfX2PGXeGGfIGeJ
 wjpI7kWRoYfqMknckgU5jOWNwGU3xe2kDNb2/mo1u6MlFiqoSvkAh+nMSObzRVBFqY8GouK8GHV
 RZFXWFKvlzZhlATzQwo6IdPlfTOCkGg=
X-Authority-Analysis: v=2.4 cv=dbkVTnXe c=1 sm=1 tr=0 ts=6ab95f93 cx=c_pps
 a=BRu7lVsKyHj15bVqb/Fc8Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=vCvBjx8nneoXTcRTK9oA:9
X-Proofpoint-ORIG-GUID: 8Tcdnvbs2ow0iNkddWZKyFGK43oKHtTD
X-Proofpoint-GUID: 8Tcdnvbs2ow0iNkddWZKyFGK43oKHtTD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA3MyBTYWx0ZWRfXxWPJWClQtWbQ
 sNyphDRWHNWF9xQ2R3wV0XqI5xroAzccHTW38/2FNQ/FyQepu9Hu7kZxALHxPoFF4TdgGT6YEKQ
 kwWaVUOwoepud2lmsitpbroHwU9KuToxpuRl+dYuTEsy2ZlyZ3TSIeGtWdwV+mrre7are70beB9
 GjviB3k0sIoo0srJLU0JjvEWT4qsIxRM3C7uG8+tZ2anpUXZLbWzaj4krDryvyn04ZrsiXdqvFZ
 KATanr9MUQn+bfgg/ZuL9NblwageBm9rcQSefU1AuPT+cJJhpJmyM5GH8JSi+8FPhC7aaR4w2Wd
 G7VyrPE/mDm7mkT+1LsQSkH1/ZYjwz5utmk791SH8lS+aGNXxBTSmqNJLNYwJ17G/ZwGEWfbT6B
 PMWuVjlhtxibFX34EpAws6ebG1VFNY4vbQH4SesVevFsxSZJzk8MortBQb9FXWG6LUIXQV1Pysm
 PG9+5sf84pfe7KBAnFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270073

Add solomon,ssd1677 to the controller fallback compatible enum.

The SSD1677 supports displays up to 960x680 pixels with 10-bit
pixel-level X/Y RAM addressing. It shares the same command address
space and GPIO interface as the SSD1683 but differs in addressing
model, deep sleep behaviour, and initialisation sequence.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
Changes from v1:
  - New patch: Added support for SSD1677 controller variant in bindings

 .../bindings/display/solomon,ssd16xx.yaml           | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd16xx.yaml b/Documentation/devicetree/bindings/display/solomon,ssd16xx.yaml
index b31fb862de04..1a94ad9b0d94 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd16xx.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd16xx.yaml
@@ -24,12 +24,13 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          # Good Display 4.2" 400x300 monochrome e-ink panel
-          - gooddisplay,gdey042t81
-      - enum:
-          - solomon,ssd1683
+    oneOf:
+      - items:
+          - enum:
+              # Good Display 4.2" 400x300 monochrome e-ink panel
+              - gooddisplay,gdey042t81
+          - const: solomon,ssd1683
+      - const: solomon,ssd1677
 
   reg:
     maxItems: 1
-- 
2.39.1

