Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794328425;
	b=aZKCxTG/zQPBYv8BX5j2zIJJ/uA8EOOi7BcLVAMk5nTK0c0GdBfT4iQVF1Wo6gGIakDT
	 dfZ4sklp9rZyxzdDi5nbClkY9Bfy/sED/nAbZW5DCiYwxViICNeC42PwtrEBQSU54G1sH
	 4sfCvztZChXArc6tboitF2gLmn7yHf4LKBwSXvfN1mK9XjsKpRFXikONjovQb1YAEgtw3
	 VlN3Q43t9VpVG/DScCaNIQastZXFdrDGIjaddma2rsVFvv6FSzB6hDivVGIVDqWsywdBP
	 pzzUaPcGJ9hH4f8RBcHefUkzUGf4JD8qiN2xBJcRbnX1ZXQxdOVmgPEYU3yvADJILEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328425;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=X6S1+/lOPuUXlCiUEldUuAULQZkWFTPyCxxXfdQ2Y68=;
	b=gYBSAXlDJWOQTzXT+1Oht9q+4JObn57XtyoCTrxmo+31MCVPpPQYG4XgqhYgxUg9x0xN
	 L6sFjbomFsbUXTohK611+gRh/6iLDEZnU7mg9IX9QYe3qvQY1Xb+aF1WdslhZn/lRqp7F
	 aIe4r7HBolte0HxoLCJ4GdY+RZsTAA/8aIeFr1tOqCvLTTYrUroVJhPnz738fLcs6NKjg
	 2Wh+jbmobU2veC1CEg6SOTZW41CHJtUjikggLwJxnNM4PA/cQYV+6FqsfPlJS/IIrrzT4
	 hGlr7jq8FyxQW7jYGSIdwPWXMNsVAVwwGD/0lPB8LLJJpwujesuJFngG0lNs026cbDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=Bx3BiRgO;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=ZTwqEC2y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A737606A21A;
	Tue, 10 Nov 2026 16:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A737606A21A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=Bx3BiRgO;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=ZTwqEC2y
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AAEwCco3291787;
	Tue, 10 Nov 2026 10:33:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=X6S1+/lOPuUXl
	CiUEldUuAULQZkWFTPyCxxXfdQ2Y68=; b=Bx3BiRgOX+uwyT4W1zuoJxiYZ2oYJ
	kNqMZCInqPeS6VvWJuvOfrKB9FmIYUbDuH3tg6Q/LNu3IIlBEfwEToi/a/C891az
	Uf4IKKqjOBG8dsCjOyVJYJBRMWaiphhdgqHd9sAAAKe1aWV4jeDzloTZd173R5Vv
	A1D39txSryq2I/XA3lUBFP9lG2/YC8xUUY6sOSl3bNef0B5JTtB5BWwlDQbm7miG
	a2VoPWs9Lv0vJljmC+9m2ZGKsTpbjAOxg9maEGjSreyWRVt9q6+AKuoAYikj70ZI
	8bbcI4hm/8ST7C1Xdu4QdAp98417cVicRizpFsFTtDU96dyXgltVG0Oig==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010050.outbound.protection.outlook.com [52.101.46.50])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hv0j0acs8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 10:33:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yF7EzAPONQGu0MwIX0PnJ70fxOUNz97MCzWtyihus+dqwqmYOXtmQaS52kKgCYGgYmkkyNTzHiook0zHc3macY4Fx4nJF8Tr3LYuzgnNPSBWFRB1KKT+lLNPTPiEd0YQkCodmMScTEbNFrkcV8XEd0nApXrh9i4F1Bk5v20O9XMS5VF5OKTMGc25L/oyuYhL9JeyK/2kxDz8xu3CxsOmFtQ6WSE49werwctRG4QUycn1sy+sQzmQLuZWSYDYi6dvsTKsHLGQGo3SuOPiNMItUWHH0kVJ/4kHWYiyAWUKfpaZVFQPM2KUNGDfPVa7qJqawv4MabLDwxUCL5vcDEyuEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6S1+/lOPuUXlCiUEldUuAULQZkWFTPyCxxXfdQ2Y68=;
 b=N9FQiuvl571NiToyuffqspxqGkUcySETm5RszSlid96hGxFzvtmFoLpEx7StkAzgMDamtYoZmsa4e3zRWS23nBgEjfPEkUArFzk0MepGnEnVX2qrdnNb+sEKupEJBQLURkgoa6wEbn+toSX9ILcMEBaKt1hgY4UvBIplxXFCrPda7nRFEZwAKIIGxRN507QGX9TILG388llKm9XRs0TDByfAEDXsn79sgs9z6Mr+ycEGwFxwPl6B3tZWyt2QXr9WnRdtGaUliiQL3Bre0bAldew4n2fC2Qee4cTQUjk/kNpqpgJ2suoUUYTfrBkeylJhKNMut2J3A0IUI5/cTKsZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6S1+/lOPuUXlCiUEldUuAULQZkWFTPyCxxXfdQ2Y68=;
 b=ZTwqEC2yaxl5PAASZUZRHqHbpcaZ67vd+KFcr2QhVQmqZUF10GUNxWVSP+dwycv2c45e++2g0vOy9wh6KQrIAQR/wC+UWnHVofH6CcvL50GKLaeIQdyF3nkNUNFrlxJTNT2/OK0kbV8J2tAVWAtstSCyEcB03UE5icFA2b9Yo3o=
Received: from MN2PR03CA0003.namprd03.prod.outlook.com (2603:10b6:208:23a::8)
 by IA4PR10MB901375.namprd10.prod.outlook.com (2603:10b6:207:10e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 16:33:33 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::94) by MN2PR03CA0003.outlook.office365.com
 (2603:10b6:208:23a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 16:33:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 16:33:32 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 10:32:50 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 10:32:50 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 10 Nov 2026 10:32:50 -0600
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AAGWoH31141135;
	Tue, 10 Nov 2026 10:32:50 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
        <benjamin.gaignard@collabora.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <k-willis@ti.com>, <jai.luthra@ideasonboard.com>,
        Brandon Brnich
	<b-brnich@ti.com>
Subject: [PATCH v8 0/4] E5010 Probe Cleanup and Adding autosuspend
Date: Tue, 10 Nov 2026 10:32:43 -0600
Message-ID: <20261110163247.48712-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|IA4PR10MB901375:EE_
X-MS-Office365-Filtering-Correlation-Id: d503b8c8-346b-490b-48b7-08df3f485bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|56012099006|18002099003|3023799007|10067099003|261022115727099003|261022105027099003|261021123027099003|261021135927099003|261022113327099003|261021121427099003|261022075727099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	tItyclEIPr2KBvI7lDCApMe8sUBVCfDylrX4KYqijomVwDjGMkxSYdBQzfaOJqps4X0VhDpk3ZOzz5NQZxiknncRPQ6iPgZbey0v4kHSlKRt+xBWFdrkfTEWdkTTj4npx4rHFSGgi/hHltEhuTBda48Q7z4GIAryrDtge0d46dr5w/vP3IY6r8Qs99Uk+B751o/iBrWMZfPIX/ZfDSMlDA/0jmcTlATRynm5NrjIc6wpLtrK1StkPx6k25rBNC0pVxsAPa3sZEKXfEOs4IFNqFI0M8ouXwFW6g0t+kGzHLXGT/0ZmzkCZOB71sehOefVjndpHQSumWWQKN+9T6SfAkB7c66lELy5TRMfvOupT6eLh+6y7USsjwx21acHmYadUuxIJ6SK1nRjcDpZ79p0/v5INOBwbywilRRsMg8Tp0lhlkrplic5th71F3TYCr/On7HiQF/EQJ1l9nUU/jY/56c/bBENRJ62+5Qk+233LRZcwRqjHB0926Ry/hIEdHfAiQ+1ilxERTp1DRxYaG9itxvnI4SlNf2eGBHWk3cqkbKYx+TU9Wpvsai0g1a+30z7joNIomdJUloqouUlc1FW5zAFP5g9EzIHY8cTD+aixQP/oh1X1bpTU1HAcQXUNmfMD0Z6dEoPsKe+8/CHiKuVpw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(56012099006)(18002099003)(3023799007)(10067099003)(261022115727099003)(261022105027099003)(261021123027099003)(261021135927099003)(261022113327099003)(261021121427099003)(261022075727099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gZ3mSaoG9dPzu10NK58ZQtEiUUd/C1yF4zOOBNbhrM01icC7zp0Y2cV663hXR+IdDv1Qs6nrImXRjwqYWQ6D/HFJmDIcPaocpRR3Ldzk4VGxWBjpnKSut4D5lH0wI8UN7bIbmytR7Q/VceOKOPeTKw0AeeCWh67JTwekq5su70hoheTd4njlFUwrhyQdoz+iwSN5iZ+dNmou5Txajj2XXNuiu6kJdaNrPVvJ+xsUjOvOPAZF4gBbLtKxY5BAkdgjJ1i4AuZslmFDQ+Yg6tk4vFUjOO7VGU06T0+em9T3CjzCHeIBTWgrkHFnhLTOt4aH1r4girvDADKz+q0d+oEBfW/kW5yjTcrTL3oBdMXOirqwYf9pao3xWdABxaCjSLNLRzDbWH9oHUXwyJNShltnHiA/ILi7y+ZcSSZplQ6Dtfd6DGXy2j/BxyFDFtgkixmw
X-Exchange-RoutingPolicyChecked:
	oRcN9kLQAxiadriUgRr3l/JMdgsAiBwqBmwRmb/twrWvG2sNAlw/r6P6QjPuReP6F9nKM7kWlzEJ6+umOTyVZ8bUhXHCgPeGu0ajYqyp0r+p7IthFaSWjmdSQ0Xqi5bG3MiaTlqdk0OYUtQC10lbBFCXaN6yb4STs4MRbJqfQNaV4AmzrWWbv2SlBRT5D8CWv6kRxyMttKzinIPwvd6qMwMcf/PVF2mu70kXsPZxX796jV3Zk/WBJ7uYJbxaTnAGv61p++SWyOKLEWL0HpO5e3XDwUH0lMJxm401DM8miTdFqoprGhFmoQHCGG4bYrGd66x2SrQQxFqINUn84Cweuw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 16:33:32.0204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d503b8c8-346b-490b-48b7-08df3f485bdf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB901375
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NSBTYWx0ZWRfX9uDteEFpbGYg
 ldBM3BPDkiwK2pyxNLAJmJ/ot0jzAIxyObhLB7m2lv7t/lkLr9I3MiEvJAhsaWzKv+JqQpHDxI6
 agNHXiVYKZNs5VFqWENoQOONDca1jpxcd9oPbGucTBmB1eBDt1IAaDcedejXTc4i2psaJ1RHYjS
 lHlpWUl5pd8EGtd25NEy3njMHkVqkJIdibEq/3UBYZMUuSMLX6iIhajkpX/OAbNoGHSGR7upA7Y
 egayYZJYk6AYNqFJu+sdrp4Rh4rdJu1uuzA3W7UWNBXXFaw49es2kijQ5dz2ykjdgp4InRjm3Ws
 teK58XbBXwhK5QN89Ws5tA9nQEJf9h3oT13FbPr1/gs9XxzCNgPdTgTKZ332TygkC1fKcqEC1Zu
 AYdM8Z3FPNBo3mykWSXPVEUuvVFsV+owcbO+SevFQ4QsWoBm0nJeQs26HLuGLf5UYvuUdee1wiG
 GpHKDfGE+AlHiGvoDeA==
X-Proofpoint-GUID: HAglwNLoPiKhsVw5aX2__e4CcLj9_jtj
X-Proofpoint-ORIG-GUID: HAglwNLoPiKhsVw5aX2__e4CcLj9_jtj
X-Authority-Analysis: v=2.4 cv=BrgIUoX5 c=1 sm=1 tr=0 ts=6af34760 cx=c_pps
 a=MMVmnpyRbxvAcRc6a9dgEg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=bhPt5b0YHANfMn-v9gAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NSBTYWx0ZWRfXwoHjjJmkiQ3N
 I4UPneN+3Dg7AQ1QHl2DxhzwycbzMugFVSHXDR+IxCESL4XhgfBuYnO0AEstti6Fo4EKiTToOwQ
 vKIjF62p4HA1jiqKWAyFJM6DXbegNDQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100065

Hello all,

I noticed a report from the intel bot[0] which pointed out a valid issue
with the driver never calling e5010_init_device unless CONFIG_PM was
enabled. 

While looking at probe though, I noticed that the clk_enable was never
properly called. That has now been fixed with a proper remove path as
well.

Lastly, I cleaned up the goto jumps in probe to fix an issue where the
m2m_dev wasn't being freed.

The rest of the series is setting up the driver for properly adding in
support for autosuspend. Last patch adds in autosuspend support and
moves e5010_init_device into probe for cases where PM isn't enabled.

Changes since v7:

- patch 3 subject wasn't formatted correctly after I updated it so
  wasn't properly showing up

Changes since v6:

- Patch 2 changed order of calls during remove cleanup. video unregister
  now happens before pm disable
- patch 3 was updated to account for the case where a reset was called
  and the device was never properly reinitialized
- patch 3 has moved setting the last_run_context to NULL as well to
  always update QP values when device is turned back on/reinitialized
- removed the r-b by Kendall, Devarsh, and Jai since I have made a
  slight code change requested by Devarsh
- patch 4 remove the last_run_context in runtime resume hook that it had
  before because I moved it to patch 3
- patch 4 has updates to commit message to accurately reflect why
  init_device was added to probe
- patch 4 has updates where disable autosuspend now comes before disable
  pm

Changes since v5:

- Fix patch 1 not properly removing all references to the
  fail_after_video_register_device label

Changes since v4:

- Change authorship of patch 1 since Myeonghun sent a similar patch
  first
- addressed Devarsh's comments in Patch 1 to follow similar naming
  structure as rest of probe function
- Moved the clk_enable call after pm_runtime_enable here so I can check
  success of that call. If runtime pm is enabled then don't enable the
  clock here
- Patch 3 no changes
- Patch 4 I added the macro requested by Devarsh instead of using magic
  number
- failure to power on now goes through the existing no_ready_buf_err path,
  so buffers are marked as error and the job is finished

Changes since v3:

  - patches 1 and 2 are new in v4
  - patch 3 remains unchanged
  - patch 4:
      - updated goto to match changes in patch 1
      - update PM calls in probe

Best,
Brandon

[0]: https://lore.kernel.org/oe-kbuild-all/202608140323.qyc8mKlp-lkp@intel.com/


Brandon Brnich (3):
  media: imagination: e5010: Fix clk never enabled without CONFIG_PM
  media: imagination: e5010: Update e5010_init_device Call Sites to
    Ensure Proper Device State
  media: imagination: e5010: Enable autosuspend for runtime PM

Myeonghun Pak (1):
  media: imagination: e5010: release m2m device on probe failure

 .../platform/imagination/e5010-jpeg-enc.c     | 91 +++++++++++--------
 .../platform/imagination/e5010-jpeg-enc.h     |  1 +
 2 files changed, 56 insertions(+), 36 deletions(-)

-- 
2.43.0

