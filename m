Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794326331;
	b=l9Si4KQ95DXLMrIZRgS0oabNs4Kkq8fe/BNo7WkQ2AtoGKQ9AdDlobOU7aJd7HmcoZEA
	 WdC8xxa4BS7fM29PxuokEacOroOsAdCtQuWb8upAWs9JN/iak34D3O9t390GrrpRYjOBO
	 mi8sSsA3AHdS5JDsjhM3MiTkXhBqCFnNX/mp/xwaBNgCfN5uxl0/rEEtVM8DDm75ZP9wL
	 NV9YPtSaJY4FXe5/0w7E3W41VPqpBSaB+N0l+EZp8hHGp/oaFCxDwnGmycDwBNXEzDr7+
	 9R+8jq9jtv39JI/MM8mpQar9VLy/9RjBPEDgTC1cP+KZ8DuhfJEWPYoAI+4cop50XPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GVXyasBrEOY3qWtcfZCzwrJMRX4+XgLztno7hjkpsjM=;
	b=aaqOyYzbfEIPFkKrYZv9hk0Zej4QXrsIEq2w51Omu104sVpLWLLNjxmCLIdwmqnKxGxa
	 fOfIGkwMzrTvA7Ew1b6eayE9EvRkCO5qIJSlOy6oRUHeTRPfkbQbvgA+YCXvkUhKudXiT
	 ZCtxU73EXp3O72PGRzspZRqbxEvtAuTXrhX5HTCSvdT8/oOE3oFokqzqv19/eCV2Kpnou
	 AoKkVUwsFOLZRHRpNczF0ArT/2uf6UJAshvM5sfTpasR8qp7XIrIa92ddmZaofJQw91Ry
	 PDXQ/8Z0DtgDWtVDeebf3Kntyd2/RFAjARJj8SPDuEWqSs5RFvWnbkNQNqq9yzrPpMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=P+B+B2Im;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=TFRLPBr+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A67606A32E;
	Tue, 10 Nov 2026 15:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8A67606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=P+B+B2Im;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=TFRLPBr+
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAEwXpj2295683;
	Tue, 10 Nov 2026 09:58:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=GVXyasBrEOY3qWtcfZCzwrJMRX4+XgLztno7hjkps
	jM=; b=P+B+B2ImIVK94q58E9mM2HhfdwxFTmXfA4TPuA6TX0s5jBgGnSzmld2Hb
	csPtDdGPx3ewMUPWSVJmnJUviSZFfiIn0HMefRRNZDg+EnwCXZfL8BL9mN3LCE7I
	KZZ3g5tWpH6+g5ENkn5hNaUL29ObZx75fUuhDkyRb+2ihSAZp2f1/2JSNuav89sG
	uTY35YTmQkyauOs9JqunwvJ0pUXeMdZ/FRvzOd9eb6O9Blz7Hdr6/HehIAynR3jC
	/yCZlcdxpdKPathp88KH4KbNsiW2mghhYRVUJ//Bq9t3Uc/2xc/fF7yv7YUbvT3b
	OYjBh38yC4qK174Qx94KNuH+qXMBQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011046.outbound.protection.outlook.com [52.101.52.46])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hurcj53en-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 09:58:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvMjbsOmZacEKOtIS/bfP93mjjb31DDtYxvHFmyzBRtIN0n2c6d97WdW80l+DkjCHGu0m8lxw2yx6XWOb949sphzRYtHQ/9j5ImY32HDmI+33E3URcG+8joeoPvaTv+/pQrwWH/g51yd/2xWbQmr6q1v32/3e2tdzqjZzmGibHDP6EKXRWfhLP13tNxh0a8cwaPLCkrzubwRfc8vgsfPAb6y8e4eo0yV4+C8KjVaRsxwXgjEjJ7VHVkqTp0rpVFSfIVoxmLlj7n/maknj8WkMwjcrbLblcKhfsBVXc/S+1Wfdcw0TCZJc3em81OtmfsOCpbqZA7P7qhgXopnVd1vXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVXyasBrEOY3qWtcfZCzwrJMRX4+XgLztno7hjkpsjM=;
 b=c1A/1mBCKhMngj0OVeNqc2hBZmSGAK054mWkCZtxte99q+/gEtsVERRdAnLi1+3xDU8s3OusZK/6xmqRomB7qaLPVVfC4FoIEOUhUcHzzluOYCl67aTkXwzjPgPbfJDnzwxoFRD25zk1Hidhqr2gae8MCdApTf2MiM13pSHzUYPyxItOKxy64g/oBlaQQJzvOo2qd8GPmXE4S5NOIwuBdbg+YI/c0DgP74mT+cXUNS5mXskm/lox3H7Jlj2rtq1E7+wYUrLBIkVNV4sP07RJU/+Z5SvjzHgBW9cUb39C30N7/nCECThlDSWguJ+PBC7HGH7TBkCvdclsE024iZziFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVXyasBrEOY3qWtcfZCzwrJMRX4+XgLztno7hjkpsjM=;
 b=TFRLPBr+hXeoli2eL/9aSxG6v7n8/FPx2WsO6kyvjkgabO1qYUaYZpiarZ2+pKK6EKYYnvcsOStWx1bkudOldPQk14LuOrlbgQxJcEO0wHkm4+wihrI08lnOFpcMTY8x0KPHzMhM8DdaKLLSCcEer5RzMbOVl/HU2dmJyFqynAk=
Received: from DM6PR05CA0062.namprd05.prod.outlook.com (2603:10b6:5:335::31)
 by MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Tue, 10 Nov
 2026 15:58:33 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:5:335:cafe::37) by DM6PR05CA0062.outlook.office365.com
 (2603:10b6:5:335::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 15:58:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 15:58:32 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 09:58:14 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 09:58:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 10 Nov 2026 09:58:14 -0600
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AAFwDIW1079577;
	Tue, 10 Nov 2026 09:58:13 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
        <sebastian.fricke@collabora.com>, <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <k-willis@ti.com>, <jai.luthra@ideasonboard.com>,
        Brandon Brnich
	<b-brnich@ti.com>
Subject: [PATCH v7 4/4] media: imagination: e5010: Enable autosuspend for runtime PM
Date: Tue, 10 Nov 2026 09:58:10 -0600
Message-ID: <20261110155810.18521-5-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110155810.18521-1-b-brnich@ti.com>
References: <20261110155810.18521-1-b-brnich@ti.com>
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|MW4PR10MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: 786bf76a-af62-4fe8-559a-08df3f43789f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|18002099003|22082099003|10067099003|261028144727099003|261009223327099003|261026121527099003|261022075727099003|56012099006|261026140227099003|261022105027099003|261021123027099003|261009223027099003|261022115727099003|261021135927099003|261021121427099003|261009221727099003|261009221227099003|261102123227099003|261009220027099003;
X-Microsoft-Antispam-Message-Info:
	Gp7yt/nDv9YR3xRdCZgU3ziql/9YhnRB3yEGI+f76t5wRmB/4r5hh8bnMl/zlzmY1S43FPgoRA4D1v1emylq2i5+Ow2QX0vnW9D/VxGhFr25tWd1br/2sxDmH5EbyxrsH8fejcuaAJBYMmJucEV8QSeIYbwtlqn3f8wnhq4vzU/THzax5wKsRhU1jD84jVAvsJIE6PYQZ21MbniZL7zC255LgJvG8hF+ZfQQ2apQVQl4fPlZccw00O+p9Jh3xxA0McDR5Fh8kpbz5u6PjYwbSG7/elRNgRtxfFBozZoljYIxwSvfTdtdVwdUtSIjnFS8hZOFLcCVitWOnrSF2EK0gYHc6bIVydiV0aZgBA/0m8IZg3j/U/MsIUxj9yBBVRgvgX1ZQMqV4j8S5JEGe5rr+iLJ54BwK3sHG2++6sHbV82jnGDWTmwOiPrvGomw5Yuvwp/j9MgJcUP5j559revNbSTuhWJljZpwOJm1SPxstsVWNy6Z1l8lhuBxdE7Pig4LW/xLAuyIlk+N30LKZfFRjM4u54DSIA+v8A1UU9FMR3W7bmO/2Y77DZjr3VUiOeT1Q9MQWzbgZFwharbqgiGUDR2eRGbSIPXgRUXqoU4A3X4trygShw349zDAJt2x3uhHxYKvJ1UOx1wL4sxKGnth7NLSS+mNxkElxOaFhI9ehe8MhDRpa7bhzwaAqNzj05ECZA5LxUJFg7Je/XAqfpjwAA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(18002099003)(22082099003)(10067099003)(261028144727099003)(261009223327099003)(261026121527099003)(261022075727099003)(56012099006)(261026140227099003)(261022105027099003)(261021123027099003)(261009223027099003)(261022115727099003)(261021135927099003)(261021121427099003)(261009221727099003)(261009221227099003)(261102123227099003)(261009220027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	muWHnZrLnGEiBK3/dzJ7WifyhS7etmwojlJw5wfW3glhYHMqM8bWtt3ThO1h5ZCD8Mft9BybsFVIAhG0d9vZNK2XbNM2DbnqFdUTQXdwDLgEzvYdgRY4m3eGqF2iNlzKQz/bbprCoEepit7RCdeRjR/261YmADnvzaTm04FFgnhJUdXKljHZl9PvAlig1YypoZvnH0a5Rk6S1JNMwiXPXbAXP+4Z/hbw1mhDg2NmUGaPSKST+IOL0XiucsG5YULtV/54WYJd6XuQW7ZUKi33pHDcRfX/QqD08ZggCk00ARiT9jM8kZ0rilwMU+r2DLGTQjjI+mjcYRNIov2nvW3Q6D+r2sV2c3oTyqbSWch/DdDluJXOTCRp+CNpnI9P+7a5mxIxVSyMoZyNvPTO7wHEmngB/Sd7UB0FegvTYj8mEsHtCI3rseT7nPmiWjhvDsa0
X-Exchange-RoutingPolicyChecked:
	f3UW/mew2z5ICEd0dFYXgkqlsvy58h8EXaMQrkNJMKI7Fo/wKoyeMt5ZkWJ9o50/Zbc6y1v1qmlsU0bVAvr5r0zXu95GmMy9QzB0zDnwNhYx3QhNFNnY/Hke31+UAJpiqE913xln87jeAAW2DIbgvXS81Xhi7cJNWk4QwvwDy2TK6YXJ2k00QvvMM7Ubuf/JJI8ALCdTbSLNSkMNIwKeXUXkK3z8Clq7xVgHCSCSjqMR2YtsrBWNQxH7pbS3Sb3qgtQMqxsIUlcLOd9TP3HJoevM0cDqn/WQbufkFxke3AMFsqfg4aIEBkI3DtUOUSnf5SfMCkVUVkP+3nDg5mO+NQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:58:32.8051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 786bf76a-af62-4fe8-559a-08df3f43789f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6608
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2MyBTYWx0ZWRfXzYzz9vgHLKv5
 hw942K66C10CnHZtYTU24fjx1s0tSxJ85EcFDD4ErDbN0iQ8DJukVtjVCCOCK96H5g217h7OepZ
 MIOPV8xa318x3nLKy4BQU+X9ThuFItw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2MyBTYWx0ZWRfX0wVMRX97LsuB
 B5jbt2wjLYURc6Ce8nOtSzYh+ZWjB2qoTaB2EPWeKIzGUgWeURdNSCExyACkj2ZqLOQTyAXhg+W
 d/JYNiXbP9KKJg6n8Aong2Z6hpHT59hmJLYGI4WkGvc2LlrpbCLUWYtHopmuUzbjHOj759/HoNx
 ShitaPxCjUrFG6Lh6euj4bWGjcGVeH8NL83lNDXq+B+0HWW2m1XNJ8DQHDrUXkBhmqwCSAhYkUI
 o/2Fp5pOAdqD+ySqLtdkbmCG1XS8kQl6eudA5wES+9/a4mUZ5P/caaOQhO6mftu4i3/P4TBpcSY
 nnnSPq6Fump/cbGEtkhlnvjSDWKq20mThsvA26NHLVYu3u5iH5/bbq/+iuqlJ0dGb755SBAWazQ
 051jQRkg8JVDJ5WkdT1O072r6/x81iWgon7klrsLXNi55Hh5AdotbkiJ78NLBbH9l13NgsGHsgM
 MiVIYumAnZfwweLPOAw==
X-Proofpoint-ORIG-GUID: zkckO5GWV6Zdnj2BgvHwmU2eTpBfWX5a
X-Proofpoint-GUID: zkckO5GWV6Zdnj2BgvHwmU2eTpBfWX5a
X-Authority-Analysis: v=2.4 cv=TNfQ2Fla c=1 sm=1 tr=0 ts=6af33f2b cx=c_pps
 a=bbY6CEmM+CWjO+hqT4zsvA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=aRswYXHNUpzWL3HiacYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100063

Current implementation only has one call to turn the device on -
start_streaming. This can waste power of system as the device can be in
STREAM_ON state, but no buffers are actually being submitted.

e5010_init_device is tightly coupled to runtime resume hook with 
autosuspend addition and has been removed from start_streaming accordingly.
However, there is the case where runtime PM is not configured which would
leave the device permantately uninitialized. Add call to e5010_init_device
to e5010_probe to account for this case.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 .../platform/imagination/e5010-jpeg-enc.c     | 48 +++++++++----------
 .../platform/imagination/e5010-jpeg-enc.h     |  1 +
 2 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 4e77112b59197..3c7c5f121a32f 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -976,6 +976,7 @@ static irqreturn_t e5010_irq(int irq, void *data)
 
 	v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
 	dprintk(e5010, 3, "ctx: 0x%p Finish job\n", ctx);
+	pm_runtime_put_autosuspend(e5010->dev);
 
 job_unlock:
 	spin_unlock(&e5010->hw_lock);
@@ -1101,6 +1102,8 @@ static int e5010_probe(struct platform_device *pdev)
 		goto fail_after_v4l2_m2m_init;
 	}
 
+	pm_runtime_set_autosuspend_delay(dev, JPEG_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	if (!pm_runtime_enabled(dev)) {
@@ -1109,6 +1112,11 @@ static int e5010_probe(struct platform_device *pdev)
 			dev_err_probe(dev, ret, "failed to enable clock\n");
 			goto fail_after_v4l2_m2m_init;
 		}
+		ret = e5010_init_device(e5010);
+		if (ret) {
+			dev_err_probe(dev, ret, "failed to init device\n");
+			goto fail_after_clock_enable;
+		}
 	}
 
 	ret = video_register_device(e5010->vdev, VFL_TYPE_VIDEO, 0);
@@ -1123,10 +1131,12 @@ static int e5010_probe(struct platform_device *pdev)
 	return 0;
 
 fail_after_clock_enable:
-	if (pm_runtime_enabled(dev))
+	if (pm_runtime_enabled(dev)) {
+		pm_runtime_dont_use_autosuspend(dev);
 		pm_runtime_disable(dev);
-	else
+	} else {
 		clk_disable_unprepare(e5010->clk);
+	}
 fail_after_v4l2_m2m_init:
 	v4l2_m2m_release(e5010->m2m_dev);
 fail_after_v4l2_register:
@@ -1143,10 +1153,10 @@ static void e5010_remove(struct platform_device *pdev)
 	video_unregister_device(e5010->vdev);
 	v4l2_m2m_release(e5010->m2m_dev);
 	v4l2_device_unregister(&e5010->v4l2_dev);
+	pm_runtime_dont_use_autosuspend(e5010->dev);
 	pm_runtime_disable(e5010->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		clk_disable_unprepare(e5010->clk);
-
 }
 
 static void e5010_vb2_buffers_return(struct vb2_queue *q, enum vb2_buffer_state state)
@@ -1307,31 +1317,13 @@ static int e5010_encoder_cmd(struct file *file, void *priv,
 static int e5010_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct e5010_context *ctx = vb2_get_drv_priv(q);
-	int ret;
 
 	struct e5010_q_data *queue = get_queue(ctx, q->type);
 
 	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
 	queue->sequence = 0;
 
-	ret = pm_runtime_resume_and_get(ctx->e5010->dev);
-	if (ret < 0) {
-		v4l2_err(&ctx->e5010->v4l2_dev, "failed to power up jpeg\n");
-		goto fail;
-	}
-
-	ret = e5010_init_device(ctx->e5010);
-	if (ret) {
-		v4l2_err(&ctx->e5010->v4l2_dev, "failed to Enable e5010 device\n");
-		goto fail;
-	}
-
 	return 0;
-
-fail:
-	e5010_vb2_buffers_return(q, VB2_BUF_STATE_QUEUED);
-
-	return ret;
 }
 
 static void e5010_stop_streaming(struct vb2_queue *q)
@@ -1347,8 +1339,6 @@ static void e5010_stop_streaming(struct vb2_queue *q)
 	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx)) {
 		v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
 	}
-
-	pm_runtime_put_sync(ctx->e5010->dev);
 }
 
 static void e5010_device_run(void *priv)
@@ -1361,7 +1351,6 @@ static void e5010_device_run(void *priv)
 	unsigned long flags;
 	int num_planes = ctx->out_queue.fmt->num_planes;
 
-	spin_lock_irqsave(&e5010->hw_lock, flags);
 	s_vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	WARN_ON(!s_vb);
 	d_vb = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
@@ -1369,6 +1358,14 @@ static void e5010_device_run(void *priv)
 	if (!s_vb || !d_vb)
 		goto no_ready_buf_err;
 
+	ret = pm_runtime_resume_and_get(e5010->dev);
+	if (ret < 0) {
+		dev_err(e5010->dev, "Device failed to turn on\n");
+		goto no_ready_buf_err;
+	}
+
+	spin_lock_irqsave(&e5010->hw_lock, flags);
+
 	s_vb->sequence = ctx->out_queue.sequence++;
 	d_vb->sequence = ctx->cap_queue.sequence++;
 
@@ -1493,6 +1490,8 @@ static void e5010_device_run(void *priv)
 	ret = e5010_init_device(e5010);
 	if (ret)
 		v4l2_err(&e5010->v4l2_dev, "failed to initialize device after reset\n");
+	spin_unlock_irqrestore(&e5010->hw_lock, flags);
+	pm_runtime_put_autosuspend(e5010->dev);
 no_ready_buf_err:
 	if (s_vb) {
 		v4l2_m2m_src_buf_remove_by_buf(ctx->fh.m2m_ctx, s_vb);
@@ -1506,7 +1505,6 @@ static void e5010_device_run(void *priv)
 		v4l2_m2m_buf_done(d_vb, VB2_BUF_STATE_ERROR);
 	}
 	v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
-	spin_unlock_irqrestore(&e5010->hw_lock, flags);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.h b/drivers/media/platform/imagination/e5010-jpeg-enc.h
index da57bc1baa464..807821ded127e 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.h
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.h
@@ -23,6 +23,7 @@
 #define DEFAULT_HEIGHT			480
 #define E5010_MODULE_NAME		"e5010"
 #define JPEG_MAX_BYTES_PER_PIXEL	2
+#define JPEG_AUTOSUSPEND_DELAY_MS	100
 
 /* JPEG marker definitions */
 #define START_OF_IMAGE			0xFFD8
-- 
2.43.0

