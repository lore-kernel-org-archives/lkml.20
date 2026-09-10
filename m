Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893A84AA3FC;
	Thu, 10 Sep 2026 15:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055746; cv=fail; b=Tn0+fShVw7bGNzYBlw7gxCHVX+1jCfdkEps0yOq5x1cenhafbqiu5xlfuQaKviIpkVL3XqFVIBaN//FY5Ei1XxZerXK/ze479+dijJZGqOq588DUWeM1Q2DJQNZBS9pX5dLuAX2ZNkeQhGlULxF7ayuSk7l+BXYgNZplxtncOck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055746; c=relaxed/simple;
	bh=bWsSM0OhTn28UvHPAoRFbK9GgJO8dCV7DBVDSak9ZBs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dS2uiNs8IunoyJwq0AbdOj5zlKcr+XEBqMDY5yH545lW7XZ9kGlnBjcgkuDff3f4aPpI4ek1+h7e/j7bW7hScUXmDJZVXdJqoXzP+IMcivlkM2qaF5M4v+yFXnQ8/PuXLgGZ6QjQD6pacsmuu917GqOWWbCT5xJODK00O1Kv4Ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=UJuLmwzd; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=q5FYkX5W; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="UJuLmwzd";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="q5FYkX5W"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68AF620R1430972;
	Thu, 10 Sep 2026 10:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=liKFKTuXhw6KkGc3KA5ciF3P44uDAIqoruMQRx6pb
	Nw=; b=UJuLmwzd1EfLVelOAXBnN/K5w4/OXSLM/ihkVilIaw/g3DrVQ1cNpY62J
	ybrfuOiw0IuDd2lCfxATK7i+JHSBKyU2P3Ra6nFPdSjNJVUbv+qUiz+PeiYIG0h2
	QXi4bq9tQNd0MD8181V9AnVVA/BPQ56/K9N6wVDBbNcGAZnR6OBxFijBiGZHUE6V
	00JJyqGz5iK6hg1YdeXubKMxJtHaZa7idZPPyM+0FvCFS5Y1eI3zxVuIoUdvfJ6o
	Wwjc28XAu8IcBObKFVqqf6w1sjztrVcYt1zY20Q4Vhw8/Wd4IEGUbs4OR6njvOnv
	UY0NVAv28e359NQc7ChkqfBxgOT+A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012018.outbound.protection.outlook.com [40.107.200.18])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxgejbf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 10:55:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPPUM+kjzqiYF+hJSYRMjyIrWhk3mkMo2ycYHnaM7whHIM6Wpvi0Sey6/WMM5OdPmYbx0ypxe7EwhMzUBWLefkCq4H7dq7Vt57g/LszAZ+VpiyfbLJt0Eg4o6CqUbqN9cGPAZ+0idfAwaILDj1K9U74afwFvH2fDGx8d8wPdym2gDEvA85FVDFtvSYI6ojkDFkQ50edYdnajqomGf1E4p405Sv3DEETFyq2IvRrNBRL6Z7WLoAadNlsYj+BQRnT48KPGxZqPrFtZpaV7wah++qC6xPo02k7c3kx5RaqFovKU/e24wsj2wFx7ke6kmG+uILMxWUVbG6eak0omvXKhZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liKFKTuXhw6KkGc3KA5ciF3P44uDAIqoruMQRx6pbNw=;
 b=bmr2RZWxBE9ix1GU+PmLHVH5DJMQSJp5ZCSzHQBIRW4OwOmHkcEF5LV8R4tvtaq+MpXak5UR3/8aab/BzSL2iqhjjFvDFF+FiBxFQJmiFKZzHU6o84dFU3p68kzgeYqP8/MHNXQBFoJ9aB7OPZVvOcs8zK3oTvpvQA01+soOOusPy+86PId49HSfcUv0KxxC6Y9BjxXDTqBQYVxIfFcpBwfOV/ybjGpLu80LdM9WvbEJWEOT5xyhE5N6RH3PI20iSsEzb990vOmpQMzd16hLDX1iRytGl+3qw6TFkPvE1TkunsTYhj7W+Sn0USwKVnIKHhMD9JmZaOCxKaGN2f4/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liKFKTuXhw6KkGc3KA5ciF3P44uDAIqoruMQRx6pbNw=;
 b=q5FYkX5WYaxxP7cdODLOA77kihX+T0tE3OU/I9Vqz2dj/f+ctgL96yU57cNTbKS0WGICTKqLIQCmi4x9ymcCdIWZ/4A+wdO7FKK05zBbcdnU995kCfE6mJm4BzU705uYGH9qZEKc/CeuK0i6TC8quUAsAlQrdnl0Mv44JOokjk0=
Received: from SJ0PR05CA0008.namprd05.prod.outlook.com (2603:10b6:a03:33b::13)
 by IA0PR10MB7665.namprd10.prod.outlook.com (2603:10b6:208:484::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 15:55:30 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::33) by SJ0PR05CA0008.outlook.office365.com
 (2603:10b6:a03:33b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Thu, 10
 Sep 2026 15:55:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 15:55:30 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 10:55:10 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 10:55:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 10:55:10 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68AFt9FB3587197;
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
Subject: [PATCH v3 2/3] nvmem: uniphier-efuse: Enable for K3 SoCs
Date: Thu, 10 Sep 2026 10:55:08 -0500
Message-ID: <20260910155509.1425682-3-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|IA0PR10MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3032a7-94c5-45df-1ccc-08df0f53f096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|18002099003|10067099003|6133799003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	VpYuz8qurodgeOJxTaHGeVasV1mBylCTHWVljRqVgJUrqmSM2+kMnH44v84oTidZhS9fvtZ877gmyanEdh07yd8jMU9WQPgAu8H0GRj9puUTXxA6rk59Fv/id5WTJP8aUbTBgVXQG6pmHMQh6DloShOtzexS8TN5uMRwE56dWp1e+BtFY7PG3alXPLytVWSUqyMd2nzYDMn/iY4J6LpX9HBdaDucM9UaC45X09J7NhgkZIs9f/iO3avZ++PJaY6uUWz+5U2XEeQInJWX6z8yNXns+e0Ye8Gnt1VpPcOavbIfbjDj9M2iiyEz2ZM9N6GW5NxBSMKkYmRLzmPMh/Ac5mUFYRx6asj5E/blrEJlfwhS0g/9OPCeKux1ZpYZthRXw6/cY3h9MWCihzKPnap6GL46CtlbCdW/SKzUS0U5TOeAWF65hXuOSsvFaND21q+GrysPQ20vFBzu1TD0GIua2W5UQqMt8b1FhM0UCEwwuoLqtGKFtWijRF+uYZSiQc0JzzTQt0awMaadnncQ9jFG1AcpoXLOeL4DUqbPiUBWtSkQfVSG/c1gp0Y/mulFsVLU/kc1R8DsEJHVOZeDIY4IHlrZHrXH9FFAzqaCMeLxDZ9Rn9hWrOZaoyaUWaN6KWWEh/MzcD+U50TIIkRMCdoRvErTXq77TPMm+0gaILCn+Dxoaogi8XAfFR+5NXgEFLChbdQlE4h/Etvi/w9hpWpHUA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(18002099003)(10067099003)(6133799003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8zNN96ZxlTx4h53EWWkwOtFsnsrS7mVqgsevIGO6aQsoeggARRu3jQjVQznoltjgKjrl0rKYoVmZlopIak4mH166D7tYR0lHTrsbL+8DalW2ZkgnSSgMMaKEHZwhvDUnQBgNIWmkRjWy6zld+s6lMAcYHwGbX4PsHER4rcwC9gOeAVfZsswRi69jlSR3uoanFt7H0jD+mKWymyPpQnDI/tK93/Iip+4781o4B5Ro90ZyADSqMYQZ86yVuDIube5mGiRlVPXFNR5V37QAdNWtjxxWKSDSuxcWT3liAm+ho7gYwttqzDm32AJndEI0NPr4SCW8tcAN7zC/2ttVgqrwoPeI2KUH70UJtN7W+AqCeyfE1bDkCZoqy+wXkxcYBvlpezb5R/6D0mYho2RQa/v0NKAC0YmQ94oS/IUElxxviI75WCPKP9x+mihmlcN+Bz4V
X-Exchange-RoutingPolicyChecked:
	Sae4h8bYKOGpooxWVoplNta7qhmMLF7UXr4zTkDHzXQXdCiScoWN7JpWOykRTg6Q4y2zetaJnQLviyPLeKJ63Fvjp1hpyu6zQzUWLYFA+3yvjzGO4Wjo+B2mxlkY+jLIU4HnLUhMiC32eSiBhm65m79MZllUJoP6iiJ6JkwTUDBzUiNmtAKgP0ShIsDd8utwD6Y8HoAvwwAbYkCNwtVk5RxRfsp2lY7pIIm1TACHYVsEntWdrW0abLAdmUxAETQRigFCe/8gwoFL6eteCJxGWueufGhwfS7ypnCZdy6Nb08rg4zJKq0JxMIzjyDxIhLEoymS7n/Xp9LzMCImPFN5vg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 15:55:30.1626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3032a7-94c5-45df-1ccc-08df0f53f096
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7665
X-Proofpoint-ORIG-GUID: CzeOilH9_EHo6bLQbb2NlZwRyDztTrtc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE5MiBTYWx0ZWRfX8ePFk1pNQkdq
 gprNugJDyoe7DxiN+gFLKArjpav/2iMqPUtixKRDKm3tAjN5XHb0mQFDannnqFkDpxebVULtthC
 Y0GKGvKYfhG4w9EF22vPlm2u6yMnnp0=
X-Proofpoint-GUID: CzeOilH9_EHo6bLQbb2NlZwRyDztTrtc
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa2d2f6 cx=c_pps
 a=73h/HchST80NzqUzJRdbyQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=c-n4J4-pAAAA:8
 a=N6XEPEcqvzrH4d2WuBUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE5MiBTYWx0ZWRfXw3yFM1vrnujM
 hobIBfdTXelZaxyF4mP/PCBAhh6a5xJbQ05iuBoC2csMrSZHgcLl1DGPfgRFiIIBhRk07HgZ70h
 xYJo8E8Fq1kECtv/WlGDDB7VIKi7tDhmBU62DUV0ysdy2+4UDcagtatxl4xP1p3KZvM+7L/yw30
 8UmhuOT3M1Df/B1NgQYIxKbzyG4dA7OUAksvBvefKZo1/4D6RxdgNuCR9b8cmJ8oXgxVZMu71wO
 Q+bMpCvXwVIeR7XzzMY2YV6Io+2/O/5pwljZtviGFYFaxvhFU7YkCzdPjNHea0i3ysU51/jTTb9
 VyY3nMJ8/iXQDBSUzrEWQgNz+ffvdSgoLmeHhksp9JBvKUx2+cfHnbEeAnky4Sp8yj/f0agLjnS
 rP0px9OQrMgXuBCrY3u7Ij0Fb6NZzLYp4cmmlPxdzaEyjHjwKFq1aFwAcoWcZUsPGzKvSAJRIiY
 MkgeFhErY0ZvJRcGzBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100192

Add ARCH_K3 dependency and set to always build for K3 architecture.
The uniphier-efuse driver must be builtin to support early probe of
k3-socinfo during boot. The k3-socinfo driver requires the efuse
provider for reading silicon revision information on AM62p device.

Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
Changes since v2:
- Add Kunihiko's review tag
---
 drivers/nvmem/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index c36c2a4c2a0b7..df65e7ecfa212 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -541,8 +541,9 @@ config NVMEM_U_BOOT_ENV
 
 config NVMEM_UNIPHIER_EFUSE
 	tristate "UniPhier SoCs eFuse support"
-	depends on ARCH_UNIPHIER || COMPILE_TEST
+	depends on ARCH_UNIPHIER || ARCH_K3 || COMPILE_TEST
 	depends on HAS_IOMEM
+	default y if ARCH_K3
 	help
 	  This is a simple driver to dump specified values of UniPhier SoC
 	  from eFuse.
-- 
2.34.1

