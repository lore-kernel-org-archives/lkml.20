Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EEE3BED6A;
	Wed, 23 Sep 2026 09:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156225; cv=fail; b=Q9/C7VDofYgMdN9tEfamkBgbWzP68km1n0cTCRaFxqqu9SmHpv34ZKK1tEIcZUnljBGyV7UEpZFo4fW/BZrFrRbsL7GVtiaqprjj/hagVqO/4T0zWxyqYNmlniYeXjLhkrrGAInnstLkW1tDmuVw0YnttvfmL5bMEVqDON3DD94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156225; c=relaxed/simple;
	bh=JEayCaMkBAUoTsKKX8dJG0hRdQPrneACY7Oo3+YvaHE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qkGxL22ka1LO+fYx3Itbjo+/mjN7qg8OK5k4791+D/kmJ2rDGVGRGyPDIzKu/tNfXYGRQ22nHhy/3ieoEH/IxxyeK1T/yGlZo0a2OsntkhTYwGUs5Fnqe2FzyDL5oaEOQjHX5pMi8zSaZ+tq8nrUZagmLQEWlu4NirYppeiIqV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=gJuCSHx0; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=D33X8KtY; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="gJuCSHx0";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="D33X8KtY"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JDTH775625;
	Wed, 23 Sep 2026 04:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+9qlCqDCWVBXsHMyx74yuOM0swawTq7gEeEgp7tyJ
	YQ=; b=gJuCSHx0f3pUc0e/XYDqFKlilx8hrMaj9m65vZteu7+i/s9bk3qxlBL7M
	yV/0q70Zp2OdrlClxcbltabGWG8YW2ZYpA5/gEddRioOkLYnqY9Tvxh73NMLkDCI
	kYknoFJJc22A4xHYkp9gcYJE3yGMA431PskPegxn0vMyEbrcbGWHYaf7NPRcN+9Q
	SNXxklmnOXdrNyZbWFgKSmfi1DvfSk+WjC+GmE6T6CJKqO8FLfV2nI/9OTaui9+S
	EggsyaMzl+AqBUB943AlP362Nk5vWjIlDC81jEWPPX2Uf8iYE1BVehvuV30cJ68E
	0zr4phjNTbWxZGokwAzUvOmr7WDfQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011040.outbound.protection.outlook.com [52.101.52.40])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycu2h6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:36:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDU06N0RT0z5Rd4qW7f/yY+KRJvviuNBBQNQdG0Iq+L5aSG8XIafOjy2995NLxNi5SPZ6yrbdKZZ/XifA3yy4rTdCppt6qjYMqVN1hngaeBBQvgzCAEi5GOjtuLgzO3IR7HABUZYhLJP1Xd7FbDYc1JddR1XipBTDz2UygTnVszy0rpzohnutXtS/BWCXV8Jtg6hHH3ZNkPjcF6qG/bXrMOjZXgWtvzvsjGNdf723mYhTL/pH28zYkznJmutv1rRtqNkdLC9s5Ixj7GB5T46UKBcd+EOUrMSvAxUJRAlTaj+2anjcZbrlCb/4CP6vfBh2dvu5j7oAGqab3pl1+2HQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9qlCqDCWVBXsHMyx74yuOM0swawTq7gEeEgp7tyJYQ=;
 b=Aizm7y8RBGD9mZHbJLuM6tprTp47M5tSWSZK7rxubQhubTV3Oa8/5bsthvXFMTz+HFIQlPqPm0Lh4l1NJhELxPNtNes7/kHxloiWy7VatFDQLGe2vcfxtiBOaf6kxwgdKFkugO9ZumctdobM4PlLypYoshU6sgufC0Qe0gRNhYe1zDqk/21l4TVkybYDycDQ7Up1n/S8VddX35VQKp9e1CK4ja7rF1CrNlbQ8iFi1AA05Sbl6WVsLNgrMK5J5JW5zEPeG3+C9bDOA4vJVzaYUeK5As2DLvJu0ke1IlMevzWsHBRsqVQt5+8lJE2hLKrfq8lZrbPnqznNOsgn0ye/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9qlCqDCWVBXsHMyx74yuOM0swawTq7gEeEgp7tyJYQ=;
 b=D33X8KtY7IJlahqv7iCWoPLUYB3PaRtVU/PGhuZsv8Bbq2JiTN2v6Htu+iogMOyOaz8O+9R2BfTwFqqKYa4Ico+1l0L9Ylne+twqZpVYhquIh45eGPkSR+X+zDGNYo60CBY/sukWrzDyOdh8Bt0T48vj4S/l+pD78ZmLo+3fjic=
Received: from CH0PR03CA0338.namprd03.prod.outlook.com (2603:10b6:610:11a::10)
 by CY8PR10MB6587.namprd10.prod.outlook.com (2603:10b6:930:58::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 09:36:30 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:11a:cafe::59) by CH0PR03CA0338.outlook.office365.com
 (2603:10b6:610:11a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.15 via Frontend Transport; Wed,
 23 Sep 2026 09:36:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Wed, 23 Sep 2026 09:36:28 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:35:52 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:35:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:35:52 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3WT1760658;
	Wed, 23 Sep 2026 04:35:45 -0500
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
Subject: [PATCH v3 05/18] arm64: dts: ti: k3-am62p-j722s: Add multiple channels for CSI2RX DMA
Date: Wed, 23 Sep 2026 15:04:46 +0530
Message-ID: <20260923093459.28125-6-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|CY8PR10MB6587:EE_
X-MS-Office365-Filtering-Correlation-Id: 498bd2ae-e81e-410d-cb28-08df195624e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|36860700016|376014|23010399003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sak7duId0k0cLvwPhuTKb+Tb5BL7mcOoSFxwXVGTgcrjSSaFogADnOdrVKcjtgsjGX6BtQA1QC1Z9+8InCAZOCaEv72cmqJKOH3lZ/6PoeCM1avrN0+XFz63OumxXs/5zJRWypQ34VUvzQ9UiiohrTmZbmp9cXfxHBhsNMSh9ncxIfQkxrlUheQNdBjFQW1rg7k9dec9n3Z3zhWPqdrIhzTm9ut48z1o25AwrjHXQ6+FwKve1iJL2CYbw/aY+WYIeDZ3nQODxWF3LAmfeDj+TmlEpbu1OUa52yCkJRD/uRYKTBUtRB6AFK/EpDbKYh7BEb7bPXRaQVDgV14Lqtd1bs15+LxkeEONcdpw8EGswKDUhs2nPHe6QQmtdy4EQ+ploRGCz5e7mtWCcqc8zMkTKAGQRsh2sbBfVbg3YqIOXQ+M61Frz4EGIIqF98HfqZubVbUXy6eTe4cUlHFihzEW/QQ5GSfR9YeAt6fgDp3bWmEXFcPbkFxTfRUaEf4E5Y5GwQ3+VXAM48GrT5k/LB9x2JVqmOsIucWmvmJh659N2iHHko+TVHiPR5fNIPVHw0LBnvutXrTufsUkhu/gbg5OeO4Yri/jISrH0+inyTHZxQZmccX5AWAScAXbZvLXzdB0AAVTIJRox3t1rb6R2NXQgxjxWfRgSpydH/tHy1T28x/jc7n6HAhyI9CR6RETDoERmT05ZIGCNDzvrgiNsMtPWA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(36860700016)(376014)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DJE7k5cIIFbF45h577tEt0YCjoWZBkSpZx6PXg83ykUoec0GbA6iWYrvtO8Pvxc53HfYrbT6c9DP4HKqy5COmlCzZuhupjtNRCLC2an+7EyjYkSLI/G5jY+xokIQvpAPo9Yu9gFf+6/OE5BkqhgGxej0FQFswoaZMMYgh+xyS5X4THX3/ngnT8euUKdhulh8b87RkF5IvGwAcf7tdxYstk+FGsrev+qhvPjdhj0UokUGmHnom/5hUZpZXj4fSpapE6ScCZX3PSBC/VlNKxyygIRypdl26ZNWHEZJtiMaHZT05SWauZJ5UQsT+jtCI9TJazH6GvkLmRaHoj3Znufq5BzQm3n2c5JppVtb38zfRs14/aceiwS8HaYnFFKZ6XrJJlkK+YITxdJyuK2BfmIgg3Ka8hTVNlXd0JesTLCV591WX8uXL23pgeHBpZNlnsAd
X-Exchange-RoutingPolicyChecked:
	MvO/R2r/U/zB5SR2ITszet1neXdZLAj4gHbqKXmFUeVHH+mia57dAwii3Ar58FEA9GpXLOpFpkbnItbY04KFLb3o5BvTxfMNhNxME2Ecm/3zUKvr1RYmvzRAB2E7qqbnVQGYz16Xw7vI/43AgWEktp8SqAiUzBFvTZXEdDCwPvGyKIjo3BIr00dtgOtKlQEg271wZYXsEP6W1ZhIl0lFkCfRVdNLf+/aNXIN23uNOA2uE6oL2zSjFjMFGldspbmzNpXnO7V5iF6/yEgrUlSEl92IiSpo6w13eQ55NAb9Avdv+GX/mn9l5pUjc5yGMtVoY3j7JpedmOaWjaNIvRPtwQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:36:28.5760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 498bd2ae-e81e-410d-cb28-08df195624e3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6587
X-Proofpoint-GUID: 6_N5QWaiEHR6dHewpptuWwF4Lo8XHva2
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab39da0 cx=c_pps
 a=u7dnV0yUwpVRNDUrCOcuvQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=E-roaWRQ3u-TegewmaQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX4f5hkFPxSejS
 D/pMs0sQnUXD5oKNJW2sZeFDsYbODYaAlKGniEsovqVMDzQWxy50jRWPhr1zWCr/fyOkqlegAZN
 LI2WsQQQCarrhDcNS8P1kct4n2szxfxIzdhVa1cj0aT9g3ojezC6kxhn6a5KSyN2WxnjtAUyQ6a
 v45HVf2khhcnqWrSamXXoydvraIbHwxSvukkxj5gyELY5crE4AhrujRAW45a99Gm/v920m8AbXx
 zwqkxmyRAuhreE8YYk4/6VrruNv554qBaiBd3kLWl0/CZmcUibMEyvhOuoQJRn+z+ck7UgHhE+c
 L/wxFvj4iKn8DMq0pV1jVgxhqBX/Muyug0DEkxt6+7oAmoZsf5BMX+nMbT+MrqLqDQkzRJTYiud
 YP8mi0Qx6ebOeMY9XwrPdxdc+mG5rGWccGnF4yshhRJB42ihhTdwzH1EW3OEYnrTONn+8Grs7aK
 1Jo9DV/VbTFe4vBQ2rA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX9MIKr0jV96Jz
 Cz4CFwAKfQ6e1InkR4Nb8ZHhICnwC4pmvu/aVQEJOGWISFn5hDeEaV9z/opHrrU/ect544vA2KD
 4Q+btWBahSw1jTaA9DjQPNwfBi4FQWs=
X-Proofpoint-ORIG-GUID: 6_N5QWaiEHR6dHewpptuWwF4Lo8XHva2
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

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts.
Add additional DMA channels to enable multistream support for CSI2RX.

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index e36205eccfc9..4b2d6c9abcbd 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1053,8 +1053,10 @@ ti_csi2rx0: ticsi2rx@30102000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x5000 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x5000 0>, <&main_bcdma_csi 0 0x5001 0>,
+		       <&main_bcdma_csi 0 0x5002 0>, <&main_bcdma_csi 0 0x5003 0>,
+		       <&main_bcdma_csi 0 0x5004 0>, <&main_bcdma_csi 0 0x5005 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5";
 		power-domains = <&k3_pds 182 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
-- 
2.34.1

