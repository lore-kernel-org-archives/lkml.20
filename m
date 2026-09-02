Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C184AD4D5;
	Wed,  2 Sep 2026 22:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388096; cv=fail; b=tisa6C16PH/xi9ZadOiI7T95GpjtzJv59wkexk0esyXdZzR/cY0ix7HwK8lnnwmOTIb/uw6EMC3Y+aSyw4NOMCfQrWzJrPeDLo18kfT7HWGXt73srVSaV6+Jr5dVM3efKD7Ma6BMGIRot0q5wNvHid3BlXB5d1+JJc84RJVI0vI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388096; c=relaxed/simple;
	bh=sOsfsvOZoUB2APmRJIZpsCQ1VCuM5uSuhns/YVyvgII=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kD7s/srwuQGs2FEm1iBvbX82BVq6t3TPX5VDEOuJ8INt1v0npo9yuyfi38tp5hEzOAcr3XCamfNyHzt6mQT+kD808lXS3yL5L00fk2GLffxyi3CDJQm0gvBJxocOScbGWj/WmcTsOwZBWZLHK3MZmGBPTyYjN7gPhtLgEZZYV8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=inST8DDy; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nqaYtTkc; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="inST8DDy";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nqaYtTkc"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHXsd3028215;
	Wed, 2 Sep 2026 17:28:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4z+5btk3rYPJxgDWCq7/qwOPlLKj2LwGgyB3CWtxM
	9M=; b=inST8DDyfkTbCcHU4DIW5Y6bdG2fyvRA1sIWlAMAK8B4q1f2TOw7/w9RY
	NvVecjIwXhEod2KhsZp0Mr4YusRSPBJGiOakhdW3aPqKICKw5ORcJmiHPynBaCKT
	1trrOApFDid/QCn230dQDa+VSwZoOWGZN7CTBXq1miIdplJ1KYMGLvunog31oNZn
	8lWj1CaNDMvpEVpm/tHWwSxSxPunlUUoonm4JrLQM/LtwSbPoLXYhMPbMU8LE1S7
	kMkbLAJN2BN8QOCHg8LSQn2pgmc63G8fvIREcinJLd349JfbE5yQchdtC85LwwnN
	BnzFFf22hzW5Rgyheq0CjynZf9pQg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013002.outbound.protection.outlook.com [40.93.201.2])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gec5nejdm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 17:28:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQQ5bhTBGsi6ysyvZgN7vEmLdhrExnnGzFR7ILvxQl1wd01iFzAmA1kBSBm5b1FnoBd9vGPRTcCttnzyZmOmapZ+geBGh8fGu/2wlHvUwWARTOHKC/jHE1ybNWnrHvFzu7xJ3ykXpq56T7p6fS4yJ/lUbCHK2g8q5HUZMMVuTjtPrCb34e+OOi0t88drtQjfaoKuJGI42h+QDcdGOCwgjd16Dj/omo4i5rhpl0pWZeEqxV6ATF+1Yx2p+dUL/NE/yIpVbTZVaJN40lLMdzmzDyv6xS+NbAMCIW0mHgZaM0KRLduwtPEY7mZUQ50h/CfVbFI+/REScLR3sQXIpVoctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4z+5btk3rYPJxgDWCq7/qwOPlLKj2LwGgyB3CWtxM9M=;
 b=YhHJ+zR1T3CR/29M4KZjmDoPvKG4tFHMHtw4QDYXtvJYTwHPIuGYVT2PgTF7gp9Gzuwc/0UvjTF4gE+MtuDoRBer1YAcZ28R9nFTCamMCRm51RCzmKDjnkXKrLBRM6babejBKWG6eCHmLf7+g2B+R7DZ6VYXNPGA432oF+DWcwtMGaDw45wAVm48HmotiPv3P4XHoGY+iT+oWTIBZb+sq7E0xnbktOrmtGg96XVvh5El6tkjzwUj099BYXZLcR+0T6glVHJsWx0l/EI0K/ovX7SUq5s6E0DpL00pD7GEDPKr5W5e734YTlknzjnuTFmM7Qc4qO3lx4rwCKBI8dJEYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4z+5btk3rYPJxgDWCq7/qwOPlLKj2LwGgyB3CWtxM9M=;
 b=nqaYtTkczBnyylAl9CXSHpLCDNKU2bwjG8cO8Xz7C/8mtBWBNIfV0tunrxxMFZSggdtcmyDk3hI6W2QPpJPytQ1aJVuGan8VLpwa0xFJn9u6mqwzWt+YILSTyhjnBiK9kMYwAKBe3JUifI4QhpAzfWlqRAAZ1gRJpiFn5uDtmu8=
Received: from SJ0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:a03:33a::25)
 by BLAPR10MB5172.namprd10.prod.outlook.com (2603:10b6:208:30f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Wed, 2 Sep 2026
 22:28:00 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::2b) by SJ0PR03CA0020.outlook.office365.com
 (2603:10b6:a03:33a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 22:28:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 22:28:00 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 17:27:59 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 17:27:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 17:27:59 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682MRxUR1403959;
	Wed, 2 Sep 2026 17:27:59 -0500
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
Subject: [PATCH v2 3/3] nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
Date: Wed, 2 Sep 2026 17:27:59 -0500
Message-ID: <20260902222759.736124-4-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902222759.736124-1-jm@ti.com>
References: <20260902222759.736124-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|BLAPR10MB5172:EE_
X-MS-Office365-Filtering-Correlation-Id: beb6529d-03f6-4f20-07d4-08df09417269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7XaxjGxZkxdZjHJs7VfeAtXEyH5lSzLbCWwvTRji1JyIyty5N1lYUlZ1nc5K+U8Fvvsd2YHQgXQq4GlWa9v8A+RV9ng9t15L17psDKCvltN+ySNjBUUh5yjcXbyrC8QJCc+nM32k/kIjrhrDoExijFBNQLcsW/6hOo4niAhYbrt87t7VPbHYf00LRimY407Pv47wW1aIad4wLFu/Ghz6gAFHYzwecHEc+VIQl7qGsnAZ7icBVmwWSEomzeWtGkvpby3sNaCM9aEvmR2sXHeVn3BufcMa4Vjq6OovNzcxwgObsYGhOlA6282ycXNnSR4iFxLYYuJSwzTMKugVrFknfSkc7z4pJdyQ+Jc+26kAi6aN+APBA1QFCxQ8uPfTexFFK+nLVZLjZqH/4LCytOJs4/pIvpmEs1oh++r8w93imu5UiLSpmF0kKLhcQeXEdJ4SMIhGs3NcXBs86Fpx6e01dtW7eyezv6fS+CkjHoM63AbyamIPxivbk5Qr3jDj19jdUUfCkJLwjnd0V6m2fsQ5ws8YJtKk09mH4llUkCfQ+5UtKLwn5EMzJ5xvyYkp2BXIL3frY46oEIPVU2Rf0kd38xwHGqj2hPODs72ZLGI3bJGUu1KDcymk2bo78ocANnUkWYxaZ8OucR/lGqGg28vvtEcBcBByq0O/46UKEE0MZ7NZ/YpLNt7o6333VQH8nJjdkwIbqrH1ybL0hAFvchRFZw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jieedz/QL2NiE5NDahYYvezo79I9xPv/aepM3o1MD7wXECComeTOfMYOtDNAMC/9L0JHvLgdsgjG3OO+THRDPOd7XyfXREIX8HFQyVi37xXLcQA6Zp5c4vJISxEMiHWjszyLbBqOCSRudxaQmScagRTx2peEmvMQIqoU+PEjrI7Yhs6KndhaAJf0PMfL8smuKQwUFY57IJ/O1sHkX465KyDB9Hh/x7cV+1DpJe799LP+FcV6r/LtnZmFq3i9q+sGpw8QJyLOg6Q9W8rIwfyM3NEqA5Kmy6VRbZM8O6pMl7AzPsGxX7AVOaGWM8TG1qGe3pZ16FrBm4XnGPVfb1GCk75+16T8cNqogJsZX4t1gt5GhixitBOfSCZD0BRLNdWmF+Eba6Owtw8mCXDEaS32oM66btvO29abIYpnIgAgnSBUJUvc8nj4ITj2x4y6yKIn
X-Exchange-RoutingPolicyChecked:
	qxBnicA6RjWGsE9T+VOA4YuIAGCRXYaOCJBZL+3RUckx3uAk7liG4iyxvegMX8AWYB7QS1qH60pseKe+ves0ZQfwpk41DErToU+R4gG09SQf5vASWKYJIBECst4dkBgpZdde1ZkvITT8e+YUG1VyyUAP5plaNgAM4fl8Il6Majp3I3GgyuJaSsfdiZRUEyUzJ256Uv/qIK5Qsf3lEOdbNP5BJM7esV5hkxQgEtrTd64Xhnu2XxoSNKKVbZXa/ayE+vpPHJnggch/gftk7RUgHjQ5qIRK8QiDd204N+4lZ+pitUG7lamsJu9RNdt5dkXMyV6705Zbd05EvLN+BZkyEQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 22:28:00.5528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beb6529d-03f6-4f20-07d4-08df09417269
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5172
X-Proofpoint-GUID: X_rEo_USbR3RjOCAf55LDFmFNC7kaMLW
X-Proofpoint-ORIG-GUID: X_rEo_USbR3RjOCAf55LDFmFNC7kaMLW
X-Authority-Analysis: v=2.4 cv=NPflPU6g c=1 sm=1 tr=0 ts=6a98a2f3 cx=c_pps
 a=IyT5loBvHZYA5YPQi3EYsQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=ZeIETjE35kWDaaLuBhwA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE5OSBTYWx0ZWRfXyXPto+gHmk53
 lrjerI6YkJ8TvasGPibH2VqTvNBYm+R5C6JhnUFZK9hoSP/2lDe3by/OtFn+0Wx78yCMAwccMOn
 ci15nD3Z4aX3L0u4CxUsS5runv8spz8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE5OSBTYWx0ZWRfX9HVzlj+42ajN
 Ew4kV4n9kflzjpffLymD8VaRa7xpBYz69FExaaUGDGLyPUbUVYke8da/JIvZOqtvdB2Kw5LRI2W
 CJIhwdj54L0mvGhb+PzXxlGZSxMDuvnQQPzVZYUHQBq0/vLekhJcoqO5IA85jjN8s+rKgDXEofH
 IaTHSn9powjYZ6LjPFyih4PKigKrMKo79xBgZ2x9pyqlA4WEP0WlKJyRcgoR23htxt1dLX5VmXo
 wPJcAFYFe4jnrP9yz0F4xG+55LkbM6tea9qCOUwgBPVEiCJHQbaGHqTcAMUMELlvtMD4B2x+iVy
 JOYSp62XPuKb+PkwmSy+UjKlMjhwB+EB+DVDYNtuotP7L5GvgqUhk7CD/SPOtdhFEsg8h+YFq+o
 YGy5WyQVI/DBAM4t6/onkhrDAPjtJGuo/keBJzv6RmvG+yI049RrUgeF5jBp2GeA0TTdSEjeP6r
 EmaKNxMx9DwagWZLvsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020199

Add ti,am62p-efuse compatible to uniphier-efuse. Leverage the
nvmem provider to supply silicon revision information from GP_SW
efuse registers on AM62p device.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 drivers/nvmem/uniphier-efuse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/uniphier-efuse.c b/drivers/nvmem/uniphier-efuse.c
index 85f9372fb97ca..d0953b99d7e18 100644
--- a/drivers/nvmem/uniphier-efuse.c
+++ b/drivers/nvmem/uniphier-efuse.c
@@ -59,6 +59,7 @@ static int uniphier_efuse_probe(struct platform_device *pdev)
 
 static const struct of_device_id uniphier_efuse_of_match[] = {
 	{ .compatible = "socionext,uniphier-efuse",},
+	{ .compatible = "ti,am62p-efuse",},
 	{/* sentinel */},
 };
 MODULE_DEVICE_TABLE(of, uniphier_efuse_of_match);
-- 
2.34.1

