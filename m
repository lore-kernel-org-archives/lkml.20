Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793654206;
	b=4s8xj2d9PPJcTdoV5FYvFtqR6/D2SDRV6LFKwgSIPfTtzUp6dIhpUn4xQTFGjV1sB8NK
	 Osi7oMUxBp/+eOgcDY4WVyFKNJ9AsDfuK9hk5gKA6L+gXkTb5XRJG8Mxu5A7oySwjdsyR
	 ImuKIkpbwykvBfqEA1jgQMuujyzKeIqv24r6vVJmVa/LyhV8zoxU/L6scYxLEiQb/As2c
	 YvsuA4udhAcEQN9WusH55N1wq82HPp5ZAsTE7rUu3jyI0Gy9yDPM4/MB/97LydSH5Yb8Q
	 Kj4CHPyaJZKWK4rcUZxhQ9e+zZ+rbmFVPt3HzgdZvaNfWZ8w6J8FDreWLnsFjmOT3+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654206;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4cZsv1APFUd9S6y78p+pmSJaPwPYQn2DcAy4Pvz7MuQ=;
	b=iBnn/Rqk/8bwDAJEzb18EapTKIaKsVrdVICmAYfR6WG/saN7/41y/Rtzd6HpemE3LhKj
	 aErFuImYjDwgHcEmmrqu1F/G5A7O9E69hLftakMIBSY8v2nyvGXLDwg/vp2yeAUDsFTx7
	 ZoNJ0Lbun7FzEH01Ox28OllbXWCyeVVpO8oDnsSTRtQcIt2XhbPYYgdf38IcG9e61c1ay
	 gsdA5CYMFmZzXyat1im+cTM6kEtETCgpkRsaUzWrHj111W3QjJw2QRUGhPs7BQNeNhb8g
	 EgkaQfVerBAypcQduhOupWHlOeHZfM0lFR00lUbxqX8DiYBnnM8t1IUAecPpy2IArRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=hM3oiHZx;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=RjGmGyTx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF0C606D806;
	Mon,  2 Nov 2026 21:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CF0C606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=hM3oiHZx;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=RjGmGyTx
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K7r5u1872527;
	Mon, 2 Nov 2026 15:16:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=4cZsv1APFUd9S
	6y78p+pmSJaPwPYQn2DcAy4Pvz7MuQ=; b=hM3oiHZxMIXu8dnmb0wwRTLaYXMWZ
	/BX3hPL1aoTTD4fmpR3FE3/BbphvkhkzAV0b/b9SEfMvxYm3UVE5UYLemgAmjAez
	cvXZUxduP3ekcJnizWzhmOvLiwMvKl1XWWOIJuaUxUR9sBOwDXiFuaWNmBycOsIK
	ZH8vz2pDyDLTFZbSZyhyD1LFK6vcdHg5Xwx1qn5ZLzILg43KVj0hhPzgJRjln/Y9
	IOdedQbZ8SEnrIHx9tXLRXjDjr28WzzkeSMOSSALuK6zLFC2tedcgR/r+i+UUZcB
	TZoY/tBTZbf5q9peU9f07KOPoyAE8AM3WZNovs2gIpyEieKueyr7ph2kg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012012.outbound.protection.outlook.com [52.101.48.12])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hq19kraqj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 15:16:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQtY3odu//ar9NXuvi30ELKl0qMz277UDfSzEnAcwoxPqh64ZGq2xafM2kpgUtjFDT8X4yuM6eJ3mVeiAAQiaOY/F0NImM/dW1OoCpFbOYmIKl1XK6gBT2jtjimE+piHe6BXg52UWpjCJMzxm6oXPecqkk3axUv5ipL0jz9yqKBPRVZ3hWrGzngo6bXDz61HPU4xplTb689lSdUoRKQVIsX9/uR0ZZrh1+NZE4ZTxeyzcNM5WbV3UJSV/amy6V52qT2PAT+fUgNZ1cmM8wiOuqsZAcVbmw37cX5/7aaw6DXMzZN+pZ52ETha1wcEZkiIJtcsORAfK65K322VkdqiZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cZsv1APFUd9S6y78p+pmSJaPwPYQn2DcAy4Pvz7MuQ=;
 b=Uad/k5/Nlrv/zq/LZbMsaPgWLI95RridWXXbS9DugM3np4KW2pGerJrO70/oq2OJOeLz7QLv4t0GLou9InMmopwxJH1XFQI8Y74TCNr+mXen6wP34qGWhPzRxUiKF56RVggFiYKXneux07BDVyRsFZmSTQQb1vZl7cCBMQ+HXAYUDHS5TPumUQ6Q8oubIuACnu9xplXuV1VZZ0efG8mN2Lho0oJHw89bqrOepBRWXevnMSEvAdUNk7i7MwMastGe6n0P2xycTuTrIThimnEjULivqRP2LpGR9GY9cGlOpdThpZhJHJWKMaG9pMqVmMU7GD1Q21ekB2Acy8YN7XN6Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cZsv1APFUd9S6y78p+pmSJaPwPYQn2DcAy4Pvz7MuQ=;
 b=RjGmGyTxzVei/C1WRZbpbuWKLbmZUtECsuQ5T0sjtawWB+c8s9rF1nP/pAZ7qha/yvXLSUuBAgPDRY+tiwdxaR12VU6maAo/+9Itq1Y98tAwlQWXNGLoxD+wCoyk0abj/HL3/DW2mjqMNNzYiTaJfil7Ege8go1HIKVMZrn+H6Y=
Received: from PH8P221CA0055.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::8)
 by CO6PR10MB5618.namprd10.prod.outlook.com (2603:10b6:303:149::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:16:35 +0000
Received: from CY7PEPF000000EC.namprd04.prod.outlook.com
 (2603:10b6:510:349:cafe::97) by PH8P221CA0055.outlook.office365.com
 (2603:10b6:510:349::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 21:16:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY7PEPF000000EC.mail.protection.outlook.com (10.167.247.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 21:16:33 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 2 Nov
 2026 15:15:51 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 2 Nov
 2026 15:15:51 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 2 Nov 2026 15:15:51 -0600
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.75.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A2LFpZY2832661;
	Mon, 2 Nov 2026 15:15:51 -0600
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: <b-brnich@ti.com>, <praneeth@ti.com>, <r-donadkar@ti.com>,
        <devarsht@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am62x-sk: Add orientation to IMX219 sensor node
Date: Mon, 2 Nov 2026 15:15:49 -0600
Message-ID: <20261102211549.1011388-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CY7PEPF000000EC:EE_|CO6PR10MB5618:EE_
X-MS-Office365-Filtering-Correlation-Id: 17a2f1e2-9870-4395-701d-08df3926925b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|56012099006|261009223027099003|261028144727099003|261021121427099003|261022105027099003|261026140227099003|261022075727099003|10067099003|18002099003|261102123227099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	0bcdGRju1SwKHpkC+67Em/dLEppH34g1kC/dq6ZkDnbBwHLHRKfSNan+9Hs2nrjEH3eFB1KF0IjlPe3BD7ZTQu+s+0uBJUAD3QfJ/wUYU4EROaQKk2E8njBiC4lSL8PopNAaiz+Oz22mYCyGAVL3srXoyFP2yXfwn3+sL+bWrvXM6UWGf5vjAaYJsP8n/5x+4cxUbK/1OkdnhzN5mCKZqaFuEYR/03rG7qlcEBfiXJW+8JNaMwWz+SRy9Xl+NkRE2b2ejnetCimVEIWlsVJUWIj+mqwOYMaUQZ6oeCrwYI9OvEKzoH2VvlA1R8SqeP+iMjfBmduHrwwgEydEYcz1RGUxGaEhH6YxcEJ6g/sLTpe1sSIKe4y+QynADFezKVDUnFR8cnO1WUuM05WQ2jsvOb0pOOY5ZD2OCh9jObviLMLGzqSPFsJmLp8vNDukXgXsqOs78hNTI21law3fqjDbB4Wig308YwWVmP8k7+ZyfbVX9VJBy2t8bStwY3nvxuo1Fv8X1Xwh172Ovc0WWhpicN5su7ADxDyzK1NtZNf233pAHY1AwVNJ+tsjJg90gT0R+ABGE1t7FC2OkPWZ2dAV+5G6Kulpri5k7NZIZKpWq+pxcp7tgAU+yP2+FMEfPeUMCGtCdHQ20gTILRuFe4O5t1EAfScSfFQc+X5BMdu119Jvati3Yw8m6fbrSioVIQ19JGlmnKCfm261i5iUzQJv8A==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026140227099003)(261022075727099003)(10067099003)(18002099003)(261102123227099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/vfP7YitxaF8JqtIIR+pP68wFJefkBxcthPe+huyebTH5ROOH7cDn0IJUnlKtibQbzSXvdzeHC0dSQCLWRJRNXWANrhntHDkEOCQQCudVByYlh/U6G9lJEzMJyhlUrMIZdgR+Rw7PupwpKN408aXUz2yVL/l0iN6+Os/ycInSDSkWBq4NthOE6n0+BFS6LrPTq4nBUsDuLi30ay/opsOS7drdAN3IC1aeSXjG9GnOev5hC5y1zlIS0b9bMP1VniezJU2zrOGxRwbkW/6e0da1ItPnUs68EFgBR0ntXlwpkGMm6dONUAAg9WJ1XUDYUKqkafgW2yfwg+gxHDlzFMoKs8mzkodB/sB/z0UVUpNoJ+8tDFvcgUMkFTpN1Oak49kJs2TwNE3a/CdvvmXegjpUAQ+IBGm0ZliC7kBxCDx/Bkl95mmkoKoiAht9uzDygmD
X-Exchange-RoutingPolicyChecked:
	yuMOBBSmE8sYvZxX2utmwaoJw7rAQq8xOjsOenILOyBX/NCkfYaxu1rs5MDTFmyIjRs3wamC/0/z5vSxQJEVI+TUwuOCJP1oK7UIeTEaDTOJ23yw1Z1bece/NhUB0K177gLtbw7dTp+0akGLZsftRKHFA054649ZfYPo3k48WqFs+ePeeXmHLEIAsXqVrQQUvOyVkGbjJFInR/z17d9MV0f84EIT9X1UP7b7MtOKJB/takkM+I1cKKsQErbWQIabi/Q+XCPgNhjAeChPmwV6GB6H3yVaMuMpySMTYRcXsO+x+y+sZ89wVFJzBogPgUCqHuS3ZizfpPS192HGMHa7wg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 21:16:33.5989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a2f1e2-9870-4395-701d-08df3926925b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000EC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5618
X-Authority-Analysis: v=2.4 cv=c8s+0h9l c=1 sm=1 tr=0 ts=6ae8fdb7 cx=c_pps
 a=TVJYqPbIpBJCeYGeirASbA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=umez5S7xkfU_bUzRr-0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NCBTYWx0ZWRfX98SBbETNBcXL
 rCmHa9WBhbflT5TUtpfE3HFSUZ+9EhEXHBu/FGZ2AmBE2AkGuDuTWauNkoOAN4y9IoenloZs2N9
 7h3mqYJFU0IFtk7hmOEms1gg/TjJzAjII+Id9+ZdT4evTMKWMs+l7YrnwjJNJhUwM5d890U+hBN
 DuolWUMsJExAywCd0HgQY5k6fZ8dlpOvsaSecIIQFawQokB4NXa3ANV6CmRGODyJ0qfIZPw7U4k
 bGCdZhMbncXRCAHLZwnBDbE9Y0Qs26NbUlExCMilQCeGOC+RydD+zgehYhOxrmIDw5qwgjmywlR
 TqtBOzPCHzQaUpHbUkLLHM8/H+PSfJ6i8vB8lpKidOWvo7aPZescK2vv3iIBjVDlZMpYHmdGrLP
 xpO2KYBukDQhvN5BeE2Q41wznhj6sOAyAmqCNKT59PCf8FwHmk4SAl+p0TzZHSNvxDBq3Vqq2F7
 uhksS1r9MUnWAoXtbAg==
X-Proofpoint-ORIG-GUID: ReqiQCjjb1fo_g-7Ehl6uk2ZBrH4_RsP
X-Proofpoint-GUID: ReqiQCjjb1fo_g-7Ehl6uk2ZBrH4_RsP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NCBTYWx0ZWRfX1agkJwdDoDZ4
 PNuCeG20/9arEmAPdVg55qkIGI93RpvdxL3DcoanrewLkB3c1joSPg+UY5AlsssKiGIF4lOsvPY
 FM+k7B5M9PJ6UBdAKUAchC1ydg4pyuU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020084

The IMX219 CSI2 expansion module is externally attached. Without the
orientation property, V4L2_CID_CAMERA_ORIENTATION (0x009a0922) is not
exposed and libcamera fails with:

  ERROR CameraSensor camera_sensor_raw.cpp:465 'imx219 4-0010':
  Mandatory V4L2 control 0x009a0922 not available

Set orientation = <2> (V4L2_CAMERA_ORIENTATION_EXTERNAL) to fix this.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
index 149c59c07182..829ed98345dd 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
@@ -72,6 +72,7 @@ ov5640: camera@10 {
 				VDDL-supply = <&reg_1p2v>;
 
 				reset-gpios = <&exp1 13 GPIO_ACTIVE_HIGH>;
+				orientation = <2>;
 
 				port {
 					csi2_cam0: endpoint {
-- 
2.34.1

