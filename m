Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885284399CC;
	Wed, 23 Sep 2026 09:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156225; cv=fail; b=A6ta7mEbO9KLsubKP2xiWqDMTsDRGUXMbzsWWj77S/NTFEQ5KLl0HoKTZZpb9fLrGfTzjCUDu+TpG4XuSNCb5BbdFikfNOBYPLOlsuASxZCCBMR+RYCZGpjus3MuPHgNizpFC0TD7Mlj+3mi6Q1Gr4Z5CYPQ6a0wHpbIIO8jLSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156225; c=relaxed/simple;
	bh=VYL9vX+m80yN8N9QpGokgB1B07KWZF4ouXsRmPjBKc0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m8AqH9VEWxVx6X9+CKtYYEDl3CT3Ucu0rHNiweb5Ewn8WQiAJ1b9qikd4TAdXT24rFC+xXBIy81KWPaUEOmwFbHXt/d9Wyld4ima/G9420mkvp36pRmwKefFbarkszHgabBpVI5/PMv/sAwItA318ka9vvM+2HnbcOe4DiQYEQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=G+t8Crmm; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HG5OqIm+; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="G+t8Crmm";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HG5OqIm+"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JCfN775597;
	Wed, 23 Sep 2026 04:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=SaVEl1o3AphvHj0TyeFGjWJmOSS8dpH7muXfwy7Pz
	WM=; b=G+t8CrmmTBEQODO7WxMc74dnwvtZYR+dL6DyLGZ4TTBQQDTEm5LEU2VxA
	Y4zykbEVU/cXL0IKIkUO9kwQYgY2LKkedP7tP9SGLWujkAeOT0EuR1hJKPa9vb8j
	HD2MnzviBYvdo66VkKH283dVfjP8prOVJd541DVD6WCh+XcINx8BggIA1ExFc5Jc
	aLub7QrZaX3fFc8AAu1tSFskz0i/HUO4BVUArNskhj/Q7XezXRUIs9eZxqHrPLsr
	v5HTtx15a6ve3wr1Tff7h/vXYc796qDqTh85ICasqeeFru6vJw5G6I5NDCpRQzX9
	BWlafHvkLWbrwGmlFe4RDKIuxuPeQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010013.outbound.protection.outlook.com [52.101.201.13])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycu2ge-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:36:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNZbFzjCnO1YprU5v1xOGBtoBoqVAqeK9E1c2czIihs+1i1S2D5jueb8r7ZIAkmRzyXlIVXVgkS7IlgHJeQczzZdC3XDEiMD/CixbfHrq1XPWW4eWNJZaDezJRotsCqDa+pvS+fyB+VUZo9tFgZK7AEUew6r0p8mYel3YU+3bjdtL9FGhtyE6L7eyeufXcFw8+rtNpCm8/EZ3s+Hebh92TFq9XgTId6I1DvusfUqzJoe7fsiNONCiGrGhsj+lS3B5ZbftVHhb/KBkgF06SnVJOnmzZbd0NlFOUBMwXBkRuwg9IKpNWXxCWJyqGFxzj9PQ7d4fH39QzDMU/Sx6rdX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaVEl1o3AphvHj0TyeFGjWJmOSS8dpH7muXfwy7PzWM=;
 b=X40UQKtLs8l3GfyzNOcGoaADvH5VdJvlJ/RBMpYj9k1Jf4cBWNQENAOerwre55hUN3Ql7nzD+syarbuZY2MAa0C6CECEI0q6cfA/WflowrLW785g1KPSofmOrkx7xxp8gyIP1ZC3wzZTIol/R7XHkDFQb1gaE2eYzmTznc6dkPHJB9IcaLRjgWuLrcmuNGb9rJW6fcsN0FitqDdUEiWam6nJ3G14OquE0viX5ixRr+LPvRTmRs3QCW9GX5DU0ZnJQ5BqHYH7mllQy+fAutx2b1jY1Rss7ziHcS/d/rAGlfBh+JOukUELVUKgG9i+G2T/i4AfQML1jtOoFcU+eaaODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaVEl1o3AphvHj0TyeFGjWJmOSS8dpH7muXfwy7PzWM=;
 b=HG5OqIm+FRv4ukUGujBjkomdvcvtvlkfhVahog1nVD4PtDDmoaK8EcnmoWXPcZD0Frn+x1h054TFmL8ke+Gc3I43bjcs/NTyGIJ1zeVVYhzKTX7oxW5YVjcCCCPX6Aa5uYxU2I7iEt9a+IMN0qGnGBDyG6o+qWkwUAnZTxAVAsY=
Received: from BN1PR12CA0004.namprd12.prod.outlook.com (2603:10b6:408:e1::9)
 by PH0PR10MB5871.namprd10.prod.outlook.com (2603:10b6:510:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 09:36:23 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:408:e1:cafe::5b) by BN1PR12CA0004.outlook.office365.com
 (2603:10b6:408:e1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 09:36:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 09:36:22 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:36:08 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:36:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:36:08 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3WV1760658;
	Wed, 23 Sep 2026 04:36:01 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH v3 07/18] arm64: dts: ti: k3-j721e: Add overlay for fusion application daughter board
Date: Wed, 23 Sep 2026 15:04:48 +0530
Message-ID: <20260923093459.28125-8-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923093459.28125-1-y-abhilashchandra@ti.com>
References: <20260923093459.28125-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|PH0PR10MB5871:EE_
X-MS-Office365-Filtering-Correlation-Id: d979b502-735e-4340-d383-08df19562191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|36860700016|82310400026|13003099007|56012099006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zKSNfgNd8KUSR1qHSci8ZG+YgqaFj82JlWFkwhx2ix1kFSFDi/pYa0Jej5pNg7dY917xxM+in5EbccHMT7b3Jz6y82oBzUJekUsXwY9IGKBK/SBFwKyICZQGaBMeQVmN8jKI4FX7A8FGptGp5FdP3I2aJkRj8zY43QKHAqmS5K9AwuZPWVxsokIQ8nbspe17OLBf6DkJk7H7j1xHgpZGbR0QFsAlTDQ0y7VEvmBmhCZdK3o7y1paYQmX2L1F4MNIUqp4EPgWx0GM9qTUYLxt5VUSQieElYNsN2vjo+jnOZHuXE7tv90f6VW9HAI5seE4imJ9Pt4OKik1RNRobYxQv2bwU1thsOFx6qA6F5McGHRNX10BId1pN7cGxNxI0TNb4XTWqe9gyPqg74mpzp1PM6v1oK6pu1qwKuKTuh0vBi6ac9Asi6hD+0dKQ9Fz/NL02e6/X+gmFAj7JMnr6oIaNcZPFR5KiaY8lFTla/tnwfl/jQWwRTiR40Z24u9Q6LNw+V1P7XEWB+16oDgPy38u1ilXe3xXflXUcnbRSt8j6QKkVrTv9RxGaJGDTG9bLeC2JzTIpaqqOMn81GXX06groMxrLCqZnZsENCO1xtKqptUd9SsU6Moc5JrazOx7C5/pUnfXVlf9n8DUSBMuL2wqfg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(36860700016)(82310400026)(13003099007)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E/D5FLKWaY/SLYkfQh6YH0JU/0PMFnRVd42FFJ1QhLKDCH61MoBCQsqsmzVito13YsbinyVMiPU0Ri/i338aQgqitE2HYdCYv/XDfKEmbKDiPqAZ3fkc6wb3N8+CVOJQnHfa6447CjWeoDSmGp7+oERI09nDHKgK0u77DvAtZzfB5QegokKF/6XpQQYUcaxILrqC59ECDoVrmeTsa66IbFz8MQ+8NyARlR97AR7/6HGqb/iHuuujVLBEhr7TfjAg/IhfEp0K+HmvfjFOU3E2tf33qMkQI6XkydQVLRvySxRaw4+AFo6OVBSHpx9MgHCfSUFY6IeNJQedY0sbCGoaPv20QzAchQb2FlvM67qzT/3aFMMku/Hq9dHf3hFUIp3hKKZFBkvt9gXJhm9WT5l2e/Jbcs1yfajaT/zEou+uKZgsEtt/KSDoZOcHEIy7Yh06
X-Exchange-RoutingPolicyChecked:
	nvHSx1ColypjKTHcjzKoZJ7KseFsxbQGme4KGii5S4X6S3NDPuo7k6yU7CedcD+247YsEGQgiG/jznO0MBrVf1Edyjore7X6faktxem45znMruBJciK74DNMfKkjCO9cj8GMYYUq+zZ2u6upYDuxOvpLMBQ9xFcIoyM90PHzoM1+CfJC2dDSHs6FIjW7ow01fFX2+E4Ecubsxwg4aqCSLWDkOyp14N0IT8YIpCb8fGseIYNGZzS0pO2Of4Fke26do7fx1TZxrV5v0ycoPcxLuL/c2noAZMfWfhjSnEMuuF77i5dxHZ5Hp1b9W4dHPJDuUhicOFQkNG8iMGWmk4r9DQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:36:22.9686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d979b502-735e-4340-d383-08df19562191
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5871
X-Proofpoint-GUID: go5x34EIBbT9GgZR0fuTmvbJZd4qhtWS
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab39d9a cx=c_pps
 a=6WLOJMs9f1Zj6h4O4QgpUA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iY-8cndAAAAA:8 a=sozttTNsAAAA:8
 a=t8nLTxPk6ZERqU7PhUMA:9 a=spcmYsBHvreeK_59bKkA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX9hSzo5CimV3Y
 +jnv8mt80QA3wtghc0enwW/EcQJUawpEFNetye9V2BEoicnNFN5cMnYxzkRK3izFmtGJIlHZ29U
 8d//8MqM6w9Fkn3bNfwyZ/TT/6i+kWcF7+rxa28z2Bxy5zfzr616CdFrH9lHogzJObgzuOCYgxD
 UuBGPT/ulQYKR0aaJiD1WFlAZ8l9m8rGw3mm317ZwbVM21eFS0W0/nfaa0EL/eim/cfDBPeDfzY
 ycCka3rVrBaszIJuGAnM69rFQbnNcfD7un49UhvVolWZ/np7JXJ5T+KjfJoh5ouplSMqyfsK+S5
 uDKtkCBNOuO2i49REUm22k5frqOMNLrObv6M6wCDr1wFMxeTmoCCHlMItlz6RCZvBQaMJ0XMvwi
 8LJih8RX2q7llAVk6eYwTp1TdHj5KwHLY4t1/BZ6743+Okfa3OofyqqjBbz9CR4QxtNN2QwO9a5
 sYAmzgLPUWhLLrpPQAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX2PH/7G6Vw5qn
 lUMTEY5qPL4hZHP923NoEGcsh78OTWds8oJwPy2vI4Ll+1lIBGYSG3ylab10hSD70bD3RF4cut6
 TRxChvBAuWhEHhACdmz+y1Owr7q75Bc=
X-Proofpoint-ORIG-GUID: go5x34EIBbT9GgZR0fuTmvbJZd4qhtWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230038

From: Vaishnav Achath <vaishnav.a@ti.com>

Fusion application daughter board [1] can be used to connect multiple
FPDLink-III based sensors to TI EVMs. The board has two DS90UB960
deserializers, each of which aggregates input from up to 4x FPDLink-III
sensors. Up to 8x sensors can simultaneously stream over the two CSI RX
ports on J721E-EVM.

[1]: https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changes in v3:
- Rename fixed-clock node to the generic clock-<frequency> form
  (Krzysztof)
- Also rename fixed-clock label to lowercase
- Override CSI2RX port using &csi0_port0 label instead of the full
  &cdns_csi2rx0 node path, and drop duplicated properties (Krzysztof)
- Use GPL-2.0-only OR MIT license for consistency
- Update copyright year to 2026 (Udit)
- Use board name J721E-EVM instead of J721E in commit message (Udit)

 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721e-evm-fusion.dtso      | 172 ++++++++++++++++++
 2 files changed, 176 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index fcfec8ea3165..3f18a4c17745 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -172,6 +172,7 @@ k3-j721e-evm-gesi-dtbs := k3-j721e-common-proc-board.dtb k3-j721e-evm-gesi-exp-b
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-beagleboneai64.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-common-proc-board-infotainment.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-gesi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie0-ep.dtbo
@@ -402,6 +403,8 @@ k3-j7200-evm-pcie1-ep-dtbs := k3-j7200-common-proc-board.dtb \
 	k3-j7200-evm-pcie1-ep.dtbo
 k3-j721e-common-proc-board-infotainment-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-common-proc-board-infotainment.dtbo
+k3-j721e-evm-fpdlink-fusion-dtbs := k3-j721e-common-proc-board.dtb \
+	k3-j721e-evm-fusion.dtbo
 k3-j721e-evm-pcie0-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie0-ep.dtbo
 k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
@@ -501,6 +504,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
 	k3-j721e-common-proc-board-infotainment.dtb \
+	k3-j721e-evm-fpdlink-fusion.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso
new file mode 100644
index 000000000000..b9fb93f3a9ec
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * DT Overlay for Fusion (FPD-Link III) board on J721E EVM
+ * https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	clk_fusion_25mhz: clock-25000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+};
+
+&main_i2c6 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	deser@3d {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x3d>;
+		clocks = <&clk_fusion_25mhz>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+		deserializer_0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub960_0_csi_out: endpoint {
+					data-lanes = <1 2 3 4>;
+					clock-lanes = <0>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy0>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_0_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	deser@36 {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x36>;
+		clocks = <&clk_fusion_25mhz>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+		deserializer_1_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub960_1_csi_out: endpoint {
+					data-lanes = <1 2 3 4>;
+					clock-lanes = <0>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy1>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_1_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&csi0_port0 {
+	status = "okay";
+
+	csi2_phy0: endpoint {
+		remote-endpoint = <&ds90ub960_0_csi_out>;
+		bus-type = <4>; /* CSI2 DPHY */
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <800000000>;
+	};
+};
+
+&csi1_port0 {
+	status = "okay";
+
+	csi2_phy1: endpoint {
+		remote-endpoint = <&ds90ub960_1_csi_out>;
+		bus-type = <4>; /* CSI2 DPHY */
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <800000000>;
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+&ti_csi2rx1 {
+	status = "okay";
+};
+
+&dphy1 {
+	status = "okay";
+};
-- 
2.34.1

