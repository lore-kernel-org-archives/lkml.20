Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072504A3844;
	Fri, 25 Sep 2026 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343088; cv=fail; b=gCk4e5dWJ/tySyR6QM5PSqu5ZqDrcZtfgH9tKJLVPQgCX02zUakjwy7I0XBcdQW9Nl/L3ggjL9cTdNHjdgVIrEW7ntBPMFAe7A3Mtojk1bI6TrAy27y3aT8vInCryTIhJIJ3PMI4gksyRg29T8gb7I6vA/hrr/mCC9Q184YNofU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343088; c=relaxed/simple;
	bh=twwPLCuXmthShqgXK1YwyGtJngmb/UFE8rMNAzeySTY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X3JCfb589Taf752rBeKfxgseZS4gzjNpsHg1laoCxn6a5PHct1ONqgnU9xnXYvcAdFWUabuT1ccO58dnGwzSDCkEU1aw+43M4tSeKiZetCA9sCkSIxi/K5YS8svkaiCY/a2nMll7FTWtBje1qyW6Rig53VE2EC71k/ImJxn7z24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=RVx+5Ait; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hFvmtKfH; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="RVx+5Ait";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hFvmtKfH"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PD7mKi1848571;
	Fri, 25 Sep 2026 08:31:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=aiJfOovEGtm3GAgqmGUeTlOS/1DYwOJDD0vC04FCs
	m4=; b=RVx+5Ait6WUkHnxojhI4N+P4aycNEvyo+RHi5JkRJUqp7bn4p7BzLPSTN
	uUncnZ2c5LO1KYHd07DmdC7QZX9XCl+xTvpODu0jC6k8FkOF+Pobrnf6DVRuqsET
	67kXRltDNPuwZZbDfxM4aqq+RH3jYLuCbRqaN9jaddfyWAOj71uO0ForbARqd+EM
	QW0yzuUYa1iFPdkrbsPSHPr+wB/nNe3i5wuBmeDFwAgmaL0bpocDVJvtotAI8jDa
	EiAu6zJZdeYY6yxq5shPLcYsv3WwjOWiTqVjc/mN8NUYsuaZ4nKZ/DxA29fcnhs4
	V/SrMqWZd15Cuvm6yLrMiYOeY5QZQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010068.outbound.protection.outlook.com [52.101.61.68])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gwkhra07j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 08:31:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgxDM7UxL/oFgpsJ/i6+27jg/8ZLqCnKq2luF4CHh7t6+SA+/zBb6FlyAG0IeSsiAPT0lDUVE0EeoW2o9dgfL5cTU5riu27Xd8+pmjUNEom4Fe5lSElgr6/fQJe9NeOqZGszelXCEgCjJsGffC5jrq571X6/gOHJR721D6M4l3HEfW/OHbadzoPWITdSPwDDzyJAAlaMr3hmfvAhL6Tdaazeg5IFkVd3udpRX/YROdbooOgFfPEj2JKCWUn34hBL2b7B7KCE4lCDFj6jl/p9DLOxOSNfx8RtCzb+IbPUuEpQc/Av4K4e51xpolkQ2QaMqV6UlKhh1bY3jxOaFNuJ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiJfOovEGtm3GAgqmGUeTlOS/1DYwOJDD0vC04FCsm4=;
 b=HB0lF/ilcJljSVkj8sgQ7HrYPiMNvNZ8hIZxZxxWA++rg5DBFmOUJ+8z07/nWa6m+rZVuEDFMVzUgcm2ZFBPjqKmgFpto7bxlnfTXKDFs5kdSJ8mBADj4bk78jt2nz0otWDrXeRebAemtS00EWKRGU44ClYzsg5A+krEJbStdvMAUVRlkeKyNnzON+GbpATaH6OrlqwZwFv/HIbCwndP6kUB0thRDNwpwMjGc0y4tZBirH3LNe9bde/8QtAQAmaQ2mBnlarjsW5wRTW5HUosThJqJUtfLhey825ZEUVvWcHRKP7myqFssadu0Qb3AKHyDL29hqPhTxG04cai2XhClw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiJfOovEGtm3GAgqmGUeTlOS/1DYwOJDD0vC04FCsm4=;
 b=hFvmtKfHoY5l28s5Nejerg0jXxhy5m1MoDmwPAnfqa8ycImGpdbbA2IS3Cw18vOMtn+7mCp3rtz+xUhNMtUGmq9xnGqic4yQq/LBmDgaROaIatIRGYoC1GbzwC6iCgU7a1L7RF96LoIUexg9g54m5ym5FZk7pPL0NjYZTLLFEUE=
Received: from SJ0PR03CA0214.namprd03.prod.outlook.com (2603:10b6:a03:39f::9)
 by SJ0PR10MB4687.namprd10.prod.outlook.com (2603:10b6:a03:2d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Fri, 25 Sep
 2026 13:31:01 +0000
Received: from SJ1PEPF000037A8.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::68) by SJ0PR03CA0214.outlook.office365.com
 (2603:10b6:a03:39f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 13:31:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000037A8.mail.protection.outlook.com (10.167.244.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 13:30:59 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:24 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 25 Sep 2026 08:30:24 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68PDU1n82840014;
	Fri, 25 Sep 2026 08:30:19 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <sakari.ailus@linux.intel.com>,
        <mripard@kernel.org>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <mirela.rabulea@nxp.com>,
        <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH 3/8] media: i2c: ds90ub960: Add 10-bit RGBIr formats
Date: Fri, 25 Sep 2026 18:59:56 +0530
Message-ID: <20260925133001.2780868-4-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925133001.2780868-1-r-donadkar@ti.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A8:EE_|SJ0PR10MB4687:EE_
X-MS-Office365-Filtering-Correlation-Id: eca9e39b-246a-4a2d-0d98-08df1b093cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|82310400026|36860700016|1800799024|376014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9o16NcxWU5IG39KlWEOElkwKjGip5f4eX80yxaGY/1OeicgPB15KmWn1/v9RvIdkeMROXZzthh70JUG3mN7n8rjloEIsEODECryW5ti5yLdej3bPjayDG0yQnG+Uv+bTia02gSBNRz2sjAxIjsk8ZtcNjfdeDyd+U/aoFBmrks5Ny+ibb9G8qp3q/jMgde3CgNEfXFL8CoCDWlwhEijFMW+P3bIu8a9lCYjh+0+D9OreD/37FtY7rtyHOjbThawtmwnbW/6eLN7DXh5S+AG4tpTDiywZzoRNqpN1Z7ekiYUYEzCODHV9wqU7wDNuwegKXinR6pJSJtC25KD+hXdrnB0ST3YjTdSKcucX5RhxHx/oNlmikmbNYJCzp/TK2z5Fvvoqncwbp2Sdp6OYQr5/3wZos0ZoRQoG9odRVZ7FdA2Bq/5pRrS9k69FsdpNyJiEy7s0m9wJc/1JlVUoVsAdEnswrU/FeS9dWHDGU2vPDJoalw2ORZDz08h4aZ6G20byI67boOaZ22X3YJ5Oo9ve+/amJBh0XI1JnLNlWdxgieaoSlzPa97gUtyRPDbZ4EoXAN4Jot5UScT232+jsDVj6171QxVfwgYXsHt8VGty1DvJ7UC/Lz9UIkq92qsPbWOcNPVsNR2mJDQX6l+BR4vHsBrRfpIalXaXzrY9dUDXI5KJ7EYzAD6a82wHkrs8ilU1BJa6lrIWLO05uuzz3zjbzQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lZzjE2CVKGD/TM9hygUd5mfZv/QwaX/ZX86+n6pecDbyAJyZtijCwZfOuUJJrHkBW5O4lzCUragNLgxa9G8dkWJMTbyCr4PDF5vRoZUS0LvxNQQmqBMdTqeEGIFEdyL7tkvJsKmvQ/4JuewCpfj47sT2bIb74A/dQ0o8MRbqj5qkclDQo8ak5QyBBiDaL7LNg8I3kiy+QTW4CzQrmEfdXWdTxeYFtjjE0ey9csAbtfM30nohgig/o9N6Xjk8ToAarzohRG1tpQG2usRWmC3EL0SvaENR6ryqaA2HtUGUo+R1xz6FNjul8b1gxUso1FS0xqoAX9DMtuRCysfVYcq9jKIUXuX6VxTYnmFHsNn5R5PFpuruQHJzu9F8VMhaxN9bJbplPFMUrAsUddsN1SBDC/+BG5DkEbxoTIlb1/lckmJOsjf2kAIulH1QsN93FQh+
X-Exchange-RoutingPolicyChecked:
	NO/qm6crlUc2NdP0ItXgCTPZbL89PWUydFhRKH7GvF0G26RbB1uEZgQMPtt/sLi8gg39fjGR/6R5rFTGERqvRnEC5yrH2ZNPk2vewWCGDOgwvZ0aRXQChEfoXLQVKi7T8ZdD1Nw2oXNzpSIdjeqcRnoHBcbUbPCZlXXk1FH8DwP3Mkuqtg6GPGfe6aWz/BMbNz7Zwv5F3t22SLTsZUtWDLRsui0erZYts8yYtBmLUDVJFdrPfjnq2ylqyF5HYLO49EkqQG6rjKWdJyBKFf2zU9FUY6bHagPBicI2P5ixyT7Pg14pMwVs+L9AKf8gBy5xGt8jhJnYvphPKH8pcuBkTQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:30:59.7474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eca9e39b-246a-4a2d-0d98-08df1b093cd0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4687
X-Authority-Analysis: v=2.4 cv=Fv+QbGrq c=1 sm=1 tr=0 ts=6ab6779f cx=c_pps
 a=UdDD+omNl1Ext3Jod4IcCg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=8QvoPrtP3C4mnMn6ANIA:9
X-Proofpoint-GUID: o6JePAr3Fm02pC9KDAuRWNNVTn-jSD19
X-Proofpoint-ORIG-GUID: o6JePAr3Fm02pC9KDAuRWNNVTn-jSD19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfXxhcYdX4EOea3
 9IfF8fEenB3qbd/Ac0em97I4CgrWTyoEc8iEexNhm3EtMj/JzkKZipNBEh+REXHZ1jgiLWzlhUg
 QXrG/s2W3xGc79XWXer5jvqgULHcQ92mV6QhpYRqwXlEBjdfWK3TD3V7jTVT7kfoJBqee4j71tV
 R10musbotujunopise754I/mCXeI4+Z160wecjMMMBeipocqWYYSAiFBuzs+uFs6r7Sr7B9MvxR
 uCISEnsFU6KsK3F0zo4dRC3ujvTuyd0DtVKWtpJrFUDfcnptUZeDNtQ7hMXrCYN6M06dWiLGwOp
 16bCuN44OXngi+tYRugeSaIGOGdqyQT1a7ESQEvE34SIUKqRBPp6VytaJ3w36GhB3ZoTBU6z+On
 2PHAgF31nMr9yj4GZIHatkyz3L7WuDZr7sZ4LggHaiUtcTBoNRcxcfFbBTJIzPBuJVipq3/h8h6
 BVHQUYpX72ASrmg9piw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfXzfWjOA4LL6Xe
 lDNiSBcplFTbeEBZKrjMqtSr14Z6z8CillUxuv1u4AHQPpYxCWFOTCWzvqjPlfG2Pc+67twDXAH
 rhQPkCfu8/qeRXZELEasCE+pOT8jy4M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250053

From: Jai Luthra <j-luthra@ti.com>

Add new 4x4 RGBIr bayer formats

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/i2c/ds90ub960.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 7d7ba6d349fc..c86b18e0b4b3 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -664,6 +664,24 @@ static const struct ub960_format_info ub960_formats[] = {
 	{ .code = MEDIA_BUS_FMT_SGBRG12_1X12, .bpp = 12, .datatype = MIPI_CSI2_DT_RAW12, },
 	{ .code = MEDIA_BUS_FMT_SGRBG12_1X12, .bpp = 12, .datatype = MIPI_CSI2_DT_RAW12, },
 	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .bpp = 12, .datatype = MIPI_CSI2_DT_RAW12, },
+
+	{ .code	= MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8, .datatype = MIPI_CSI2_DT_RAW8, },
+	{ .code	= MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8, .datatype = MIPI_CSI2_DT_RAW8, },
+	{ .code	= MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8, .datatype = MIPI_CSI2_DT_RAW8, },
+	{ .code	= MEDIA_BUS_FMT_SBGGR8_1X8, .bpp = 8, .datatype = MIPI_CSI2_DT_RAW8, },
+	{ .code	= MEDIA_BUS_FMT_SRGGB10_1X10, .bpp = 10, .datatype = MIPI_CSI2_DT_RAW10, },
+	{ .code	= MEDIA_BUS_FMT_SGRBG10_1X10, .bpp = 10, .datatype = MIPI_CSI2_DT_RAW10, },
+	{ .code	= MEDIA_BUS_FMT_SGBRG10_1X10, .bpp = 10, .datatype = MIPI_CSI2_DT_RAW10, },
+	{ .code	= MEDIA_BUS_FMT_SBGGR10_1X10, .bpp = 10, .datatype = MIPI_CSI2_DT_RAW10, },
+
+	{ .code	= MEDIA_BUS_FMT_SRGGI10_1X10, .bpp = 10, .datatype = MIPI_CSI2_DT_RAW10, },
+	{ .code	= MEDIA_BUS_FMT_SGRIG10_1X10, .bpp = 10, .datatype = MIPI_CSI2_DT_RAW10, },
+	{ .code	= MEDIA_BUS_FMT_SBGGI10_1X10, .bpp = 10, .datatype = MIPI_CSI2_DT_RAW10, },
+	{ .code	= MEDIA_BUS_FMT_SGBIG10_1X10, .bpp = 10, .datatype = MIPI_CSI2_DT_RAW10, },
+	{ .code	= MEDIA_BUS_FMT_SGIRG10_1X10, .bpp = 10, .datatype = MIPI_CSI2_DT_RAW10, },
+	{ .code	= MEDIA_BUS_FMT_SIGGR10_1X10, .bpp = 10, .datatype = MIPI_CSI2_DT_RAW10, },
+	{ .code	= MEDIA_BUS_FMT_SGIBG10_1X10, .bpp = 10, .datatype = MIPI_CSI2_DT_RAW10, },
+	{ .code	= MEDIA_BUS_FMT_SIGGB10_1X10, .bpp = 10, .datatype = MIPI_CSI2_DT_RAW10, },
 };
 
 static const struct ub960_format_info *ub960_find_format(u32 code)
-- 
2.34.1

