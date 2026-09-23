Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362A4443AB8;
	Wed, 23 Sep 2026 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156243; cv=fail; b=dulWq3keCCAvn3uNJH87yqTAoDu1zdX2avjDTAMSfZrPOVMo1s4ydLczFn4khCQdhd7yjBY7HJfPteAR31h6MhAt0+IcXG6Qt0eksSC7Uq3Qed3/obnGsKT6llShXps1wohZj0++bMqyIH3A3o8Yq0d2/67yLGLsfvq53kGn+uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156243; c=relaxed/simple;
	bh=pAqAfQxZ9O7hL5oPKIwdPXnaKdJTVRLSZi+Taj6Ud9Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Joq24SMBRjPAos+3n0CNsiLNg6M4ghbZoNK4aQ/Mkq9wYN0YO8+bKMtInnumFU9CRMaDyv5vCpThP6TpTBK9k8CAuAGAdTZUVVZEzvVjgrkP4d2FuYbjfrhvFpZW1L7JLkBqmvU9gV75mRLQGoQ8Ikq12BARweruvP53eUzhUws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=c9ttOiTf; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cq7JoudA; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="c9ttOiTf";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cq7JoudA"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8J98m299789;
	Wed, 23 Sep 2026 04:36:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=m1JTwNbyIjKm+cihzhINxKHhMqzaCYYppmYfh3HA7
	qY=; b=c9ttOiTf/2TTdgxM9A1/hgL5c8UDM4AcUg9NuUVscgNtcccfHbw5XKkCR
	Nlyh+RDVitVPRD43hlkd9zJnXxhHMjprOfanl3rxoX5TaHO3HzK8gE2zyhUEcsGV
	TtEb7o8vJH4BKefS+Kl7k9j+HTm7R+irIPUDwLdoAc/NWNHvM0U4YvGZs8UeGrrs
	nC8BEsDnBpbY0AOt93gf6TTf5zVVv6FQHvLNnthgv9lWTbPvvYxH9gsddLyTPBRR
	v0yckFp5cxw+xBrgR9bi4gaQZ3MUvmG0sBMoCWEKtdvnPdAnwvCflr/fXiV3oEYE
	QhKHZyFEZJTSudXF3mZ2IusRxZLLg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010050.outbound.protection.outlook.com [40.93.198.50])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv54tjcn0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:36:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyYowTEmYP+22rtkf61MD2RwQG1BITNsgEM2/TkBvhUAqZePQke9GrJ+53d4QmOCuFrUsmlHEd8jOzKDpl98RnGcCmeCQAtcYwutXb4YP0pQDXgaaywdXQmgIN/1RSLfVKILTOxds4WcUW+m2K4SlUrfrbUjKc8EJwzTl1IatrYpVb9ZqHVVAtlbvBleuh6s4JEvP4qyDVWnZOmW5Z6pMSBPvTG58mE4bZ6Rs97Y78IuULlV2PMRReoZlo0oOBxr3YSY/vOJtaPCZLXprCZfWVOpYkIEkx8onOLIEhrSbPbUz2yRXkeDVLrAbYvYJ/egdEYBGGnzkxkVVGJUdr4bsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1JTwNbyIjKm+cihzhINxKHhMqzaCYYppmYfh3HA7qY=;
 b=SuTN3AwStEmgBo128ooGlZahoHKmC8BpUC71nKYJOWcx6HBPZ8KIwDm0DwBQmf56ToqgTevnBnjIGdwtNRV8LSG8BGbO8qvIp5H51IyScbIA/UyTOXdIQD43oKbAHGVKYpltrh7w5m103EfZbGWkCjaIggU52hk20HqJwBU9Ue8kwHWpL2ZctLbin5qSYEGfEKpnNVsHZHZYEZNkVfr0962c5U2gQKYPp+9xJ9zOWU7JI58t21pKNP1heYNeMxM0YOwD/+NaKcADDH0+4T0BQJ2hYZyDsnUiFY1geCor4d37tPWFN9xjL+My9tDyj1weGqiZlCDRl6BHMPzGrsSOKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1JTwNbyIjKm+cihzhINxKHhMqzaCYYppmYfh3HA7qY=;
 b=cq7JoudATpb3lHFJamXC5fXHLo2USkv+mVvjQ7s38A4eYVBwVCSOy1mZi6EGu2T+ALFhinzx0VNk7RgC1Mpg15mdX8CZG8SDKwu6YlL/tMeTFeBsb2CSMpoQKFaUgzmcYgm1df2+LF+CW8bSsumAB5DNMbHYnkuJd9Cf4XSdgZk=
Received: from IA1P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::15)
 by CY8PR10MB6660.namprd10.prod.outlook.com (2603:10b6:930:52::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 09:36:51 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:208:461:cafe::a8) by IA1P220CA0001.outlook.office365.com
 (2603:10b6:208:461::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.17 via Frontend Transport; Wed,
 23 Sep 2026 09:36:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.5 via Frontend Transport; Wed, 23 Sep 2026 09:36:49 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:36:16 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:36:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:36:15 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3WW1760658;
	Wed, 23 Sep 2026 04:36:09 -0500
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
Subject: [PATCH v3 08/18] arm64: dts: ti: k3-j721s2: Add overlay for fusion application daughter board
Date: Wed, 23 Sep 2026 15:04:49 +0530
Message-ID: <20260923093459.28125-9-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|CY8PR10MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: c44e1098-4380-4093-fac2-08df195631a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|7416014|13003099007|10067099003|3023799007|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	alew6eCyklwJ9IMgk7nQIyUfcUhz846iQIQ5t9RVq3E8BIloCMKlyABYwXupZiZHg4HcPOBRCgKAV+1m3GHPvaH4f1p4/q9nlweAo0XyPEp1pzif5obPR9gcpyjRiR9xS9+q3ytKgN85h0XThquFZ4ZRirhedI3ilVDoaXIF1+AcW4YaOiqjwZ62j6AzWQXdYrPF2Xz4nxDxoWuU7us/qvXkCFDpl2ZdMjKg6q0GBoSbK4h/2vh10P689tO2hP/x00CcpXK7S0n7fms99ymRbS1opmhrg3wsTm4ZRkdPU7glmeTaoOQdiANZkIrWsQkEV5lHoV+Fz2dDJ2cSvVIE4SAFI5Bp8vjuZRN9cBAltr9ZHv8xSoekT8NrURAcfOZmzc0xfP5VXHH2bgJ/Q9Rzga6nRzc5tCIT/I5+sUGkPw6oU8K6ERYO+rbHVn2zgZrE9IYKNvELFuh10i1L4Bo1sykOHYLEz6JJqmjEtYtS3fOIaz/sJb1JF/QC+5P+dd3SYQYg9HxB5kcMf3fpSuzUX0YENvN4GX3QEazcbCvWJRu6O5alHWOPZjZw3IDCZ/hUIkU2rrrwZ2f7YiQejWUX9+7PnhcpXdCiOACx7lNXUa7nScqUyJwnGFM/3FHWpo1hHo48FspURnjk/tRs8fqXDw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(7416014)(13003099007)(10067099003)(3023799007)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eFE8JTg5jmsoZifvpU7Yf0bU6KxMyAmYr7BioIxnRGJn4lZeCKRP67ZYyUskmxbFrl6u1PQZYOh4BG2d/4aKDeHt/JD/yzbcPJbXiClO2o1naFJhxDDwtUaWlcxVdtOOqDZ9nHlpBjwpa857RCl6C/BwXp+XiFav232sYGPQUijgb26YMskKggmgeY3slepl5ajThbFKAKSvOj/qTibwgCSMfN37Mh9G4aWHRvih5Qv5nPVugA6xCLirbtE9ANoROXjnuhYD6Llx7Rb7uVj8iccTdeOxXLt10rDalB/o8KJUAT1pWoOr3zNtjeBiR7nJLrLFcaFCfGTvfLI+4hYAY+SY+5vbZv5L136ANCG2LIFDEnudUUGR2wlQSieQ6ZVs0TfYRVv9ZzOR8JDeibanaUM5Y76/w53mLCEqWfXFHpu5e0oeFZgVSP+zOZ5mS3xt
X-Exchange-RoutingPolicyChecked:
	Wy8CUxd53mNsfise0hD3ULe+8oFhIpMxL9amJPfYoOhgQEnhv3x5G1eUgnyEsbvCj0Y5P8G2OYqvRQ4XfpsGjPyZkGbWRrJaDFxoxV6zPEfhkiWorpT0P9fhi9kJVn5/Xzh3YTTomcaoJh7WrnhQ5s8mB8R8RKcleuC72KfgMCGXV4caabH+3+YJzUjmbubkOqKqJ+xAOFU4ykRGQJODHtWarSBeTrfIssvUMs0R6JLMNX6LcAOOo0fpGvvXkOb9dDf9jGr/I5WIWVzd0KNhK7HyjHkuNHmdZwuDecnODTsrL/GItBHX15Oo/9pKv5Be4pVCWkh2E69sZ16r+RJ/xw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:36:49.9507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c44e1098-4380-4093-fac2-08df195631a5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6660
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX0k1grnQm4Bfw
 03IzKwDWLvldZ85v4pqLADsn/ZcSKTbq9X5eAKrPeMsTaZUVSGTQX0O1i9WGaZP4n9VpjSHZdVz
 isHuBpk2M6vzmlvn7XkEY18N87lwZwk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfXwwy7+ARv3Gly
 xP7c/Dhj+1uK3Dtpa93LuGqYk7IYFWprLRoa54ldxJvuXF7VM1kWLGvltjZKA5BWLMRzvhglZ9v
 /HWjkMah9+4ywCkDpZ6KK2KSYVZSUtQKdbHUNLta0BWBNbAdLz/PKauHw76AiPLQ/Kzx08V1GkC
 FCgFKfvaU5rR6xj7SPq0vHLZDHlIe2/LkZxyI749A0VMyh7plAaVBlLKYOZ/Dyxe1ns7m8Qk15i
 lC42D7MbNfLybBPIuvgQUox9tvmI86PAFWqe9KiPiwJs3zruWeWIMxOKr8ttN7M8Ra7ujIuqtIu
 xm6nQtaOB1xOox4DKBnHl9NvLjRl2Rir9A3x5E+VpNY/piYgcoAdBWZYD5U0bx/aR6tF67Z/lee
 ckSqyAJUNxcyiS/iqdFpuL1znj4ygkX2b0L+ek9wNAx+Eu8IWYVu62uY8onwBj2pjgBwLPA0kSo
 fbnxyRnXumVLq2nbtmw==
X-Proofpoint-ORIG-GUID: jH_tF2Fny2wS-RnNRspoGPq-fMQJQ6gj
X-Authority-Analysis: v=2.4 cv=TpFzFzXh c=1 sm=1 tr=0 ts=6ab39db7 cx=c_pps
 a=xOrz19RqOvhMowGYDVTMqg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=iY-8cndAAAAA:8 a=sozttTNsAAAA:8 a=JFaIKmMPQViuOQAtcpwA:9
 a=spcmYsBHvreeK_59bKkA:22
X-Proofpoint-GUID: jH_tF2Fny2wS-RnNRspoGPq-fMQJQ6gj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230038

From: Vaishnav Achath <vaishnav.a@ti.com>

Fusion application daughter board [1] can be used to connect multiple
FPDLink-III based sensors to TI EVMs. The board has two DS90UB960
deserializers, each of which aggregates input from up to 4x FPDLink-III
sensors. Up to 8x sensors can simultaneously stream over the two CSI RX
ports on J721S2-EVM.

CSI2RX connectivity on J784S4-EVM and J742S2-EVM is the same as that of
J721S2-EVM, hence the same overlay can be reused.

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
- Use board name J721S2-EVM instead of J721S2 in commit message (Udit)

 arch/arm64/boot/dts/ti/Makefile               |  10 +
 .../boot/dts/ti/k3-j721s2-evm-fusion.dtso     | 172 ++++++++++++++++++
 2 files changed, 182 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 3f18a4c17745..f0bc771da0fe 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -194,6 +194,7 @@ k3-am68-phyboard-izar-pwm-fan-dtbs := k3-am68-phyboard-izar.dtb \
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
 k3-j721s2-evm-dtbs := k3-j721s2-common-proc-board.dtb k3-j721s2-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm.dtb
@@ -411,6 +412,8 @@ k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie1-ep.dtbo
 k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-j721s2-evm-fpdlink-fusion-dtbs := k3-j721s2-common-proc-board.dtb \
+	k3-j721s2-evm-fusion.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
 k3-j721s2-evm-usb0-type-a-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -419,8 +422,12 @@ k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
+k3-j742s2-evm-fpdlink-fusion-dtbs := k3-j742s2-evm.dtb \
+	k3-j721s2-evm-fusion.dtbo
 k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
+k3-j784s4-evm-fpdlink-fusion-dtbs := k3-j784s4-evm.dtb \
+	k3-j721s2-evm-fusion.dtbo
 k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
@@ -508,11 +515,14 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
+	k3-j721s2-evm-fpdlink-fusion.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
+	k3-j742s2-evm-fpdlink-fusion.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
+	k3-j784s4-evm-fpdlink-fusion.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
 	k3-j784s4-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso
new file mode 100644
index 000000000000..17ddd325cbb4
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * DT Overlay for Fusion (FPD-Link III) board on J721S2, J784S4 and J742S2 EVM
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
+&main_i2c5 {
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
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
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
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
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

