Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297595;
	b=DlsgXRy+su7zPHS3rQr1GSukgdCgn0dSMYipTCC+EXBID+1gFkekfI5UR5GM/DICv3PR
	 nvMrduI+hr9JZCSVrS4TuA+wDBtmwkiGjI9HImG2WNBhzpwTqYeSz6Hd+zgLxODTIy0oI
	 FXUkyDtTuw9CaKVxSMXpRFVEu8wAhubx2eskvX2h9VhrF9b+JvznwNfRoT6xoTY4WadYh
	 Un5e1OWI7Fot0wT75Inuh4tRJluVoNXj1TElImgiBveUQEY5YuRSP5GtG8XvTXyaxrv3R
	 shPRGhHql4oLGK7e7DL0Eeob6XSaG5WWG45Hui5C+7cm2QqXFS82lvK8q62hVW2tRFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297595;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jT/M0JfKpnGMDBTuAFazBMQlX049x6X1y9DlRsqIR9g=;
	b=2CDhw1RvLiJ58Cp2eqwzsOywhcyFT806+y1smjOde5ryWezIDL6+rxyTvNPioQKsF4UG
	 xtmNsFTd0dm2EPFZD2j2wDSrzAfzNCCUf3aV+tyjl4tR37fJF/qZkhI9Ue4Db30GHLSBv
	 CIuKoZA/e3TFFxLOUXUbDQorPf4FATHCF7r1O1kQXkSKWdHUcPs/qHQ2XUNc/PzHUA/i4
	 AtKEF9smhh/BotlxrlxUqwFvK5lQhnWWxCm8bvrzk5ieyW9Mr8jHiS86OibwqCkXadH8U
	 J0Fgx1id9g+byYa/H+R99ehSsIJ4yaWTl5BdJdlTC/68+N8App71N151kQla1wP0vGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ChcGcypn;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b="Q/i5CiAa";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314D1606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 314D1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ChcGcypn;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Q/i5CiAa
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDii42604277;
	Thu, 29 Oct 2026 13:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=jT/M0JfKpnGMDBTuAFazBMQlX049x6X1y9DlRsqIR
	9g=; b=ChcGcypnEsSi0Jxs+eIQxVgem5ASM9ocPtdialbvNTbTpkXuTUspxDJaT
	zHc+/cTwkh/233/uLC+SqZqutJb0lnZxkXSAdmrfo0KB93nQNu4d7QKgSlTaaWJd
	r9ZH0UagXph0b9ntAIF2+zO9+A5kWCKl+b1DpNhgTvHX9DSQ9Ifalbhpb/AHuL4K
	cH6Kyl4zFgV9mQMvWxczKRuy7KTOdR+qJMZRsNwG4BEpQTQe2F9DsxdMGpwE5+NF
	u9iaLKjZAu2W6Bs2RKQmfHa/T7K147O7B0JyZhe8HZOIUtC0qHphFQahTNxHtFlL
	NHlfIwzm/VXKGUc6Qf4dvn4a4ml4w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010021.outbound.protection.outlook.com [52.101.201.21])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hm55ak3pn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:13:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLkzHKHiF9jMTjSV1EV9EoGb0QiIoRbSCqB1pdcBIkETnN6l35I4Vg9RSKenLDcK6FVxBtCB6Jq01e/FPxVrcX57XLCi11BoyPT1MZSRFZbaneruj4PSAOit/4zVAN8je+AeY0dA95XPVX6C5gxlLTv2PuATjMeLH/+jo09ZvqIRVzVnFmzHkMtuxA2ocOe5C/nkzXElLmMHuzuhi+S3n/XfUSu399OXZk1qSKGiAThtdWETCu9FUB57tmxeDMGFMIOpLoA9c/uery2Re+ZlzwyJ/T3GSuYrwxCVRrdGibhMueWQWZ6pCkGKd2Ut1nmCBtfaOkugLn+bPdMRQYl3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jT/M0JfKpnGMDBTuAFazBMQlX049x6X1y9DlRsqIR9g=;
 b=ppiea/Ta65rAqTWF3b5d5tJRcv778QpyWH5OHkE4/GKCavNVGMrSY3+HT76y3M856pGaoQw3s6EsuTNmqYRKnghxr33kc8x2KOsOyurDhK2Hop03lntRMKId46JBjz5jTwtc81eWvzvIylz19adD8jN9Rb4bo0n8m4BUIGr4K2tFKotIyi1ihaQo61ObzhGWVo37R3hCWnGVXzX9PYr2FbrNicFCYprHQuvC/EhPQEwUEcrJazA8XcKxZYATHL0BPhK00ZEyIf+3xzASE007pg5abg0xf/irS/d36X5l0UX2dc7Ea2cLgWlWQ3dnLR8OF/Ye1TW1G3v4l+83Ed8vEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jT/M0JfKpnGMDBTuAFazBMQlX049x6X1y9DlRsqIR9g=;
 b=Q/i5CiAaJnOOFX07xNPDFd2asGzq6GoEJCeq2aWvPYOjM5NW/gQ2jqEyQFwA/YAcoWLtoC6WrQnHEvfkG03LaCvxvUiP46H8dF9rVfvRIHn3Cf46tiprULIm/UfumY9BrP0ePbwiouEiJzLyf+7jlXBz8AaiTEQxJqqXpDraoNc=
Received: from MW4PR03CA0293.namprd03.prod.outlook.com (2603:10b6:303:b5::28)
 by DS6PR10MB997874.namprd10.prod.outlook.com (2603:10b6:8:464::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 18:13:02 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:303:b5:cafe::a9) by MW4PR03CA0293.outlook.office365.com
 (2603:10b6:303:b5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 18:13:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:13:01 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:38 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:37 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmMF3408718;
	Thu, 29 Oct 2026 13:12:35 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 15/22] firmware: ti_sci: Use pmops fxn pointers in suspend/resume hooks
Date: Thu, 29 Oct 2026 23:41:40 +0530
Message-ID: <20261029181147.266771-16-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029181147.266771-1-b-padhi@ti.com>
References: <20261029181147.266771-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|DS6PR10MB997874:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c83cc89-73a2-470c-c8c6-08df35e844ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|6133799003|22082099003|18002099003|13003099007|261028144727099003|56012099006|5023799004|261022105027099003|261026121527099003|261026140227099003|10067099003|261021121427099003|261022113327099003|261022075727099003|261009221227099003|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	uUmfpqN39ou9cK9LpuBQXUwrPZZR9X4FbBL2ABpmluyFtyZ2jH7u+R46n4sWnQPrgANPvEX1ov37E8RHBRvlDHVKj/2H1zZxDWLDSVjsnNSRvIdsFvWrvcx1xMNkGQhWTo0Y6udTs8Upi5ERZRmnwufxXxLiE+1VwNokyX76ribx/+7j3AHZrKALQzMgx16F+ZAHgQbAbeou5uuyKVdUp7xMrpY/ErKDZ5tPgdLqYFgOOYJ3E23HMd3Z4LZ6HgdzYb+1SsKsYkSQIErxO/LJRoGSCJP1iJrIXk289Ozhxur+XRvJCF/gMIVNvGXA4Bs/Cio+j0UivfVxGBi+6g9h12sRlb87I54dQH6P4eTW511h6D/RnTZZzvoEtW/iH+vu6WTPkNY6iDIYTwiXqMIk47kpnVSRzr0rbY/TLbGz5GLGheGEReQrWdE2bsTC6HcNI/Plfcc7lCmee1KwbpIOcjaQ8eWRShTkOCz4U+fFoUIUm1eQO8DnN11mVYXuAnH5lIYZ+UbfOzYrBS6gCOV0e6IZDVtPbes8fKsN+HSmux0h6VwC7xmPiSuM0LrPYZHT/F/nCpi+UCnuIjFU3L0ekrSQz4aF23+iVV3loR7Vvhri1eWseLLPWCQ46WCXRr+drbCDEmgZxM1Qf4NIamLaVNSEW1TQZsoxZaGrFeGHPmQ=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(13003099007)(261028144727099003)(56012099006)(5023799004)(261022105027099003)(261026121527099003)(261026140227099003)(10067099003)(261021121427099003)(261022113327099003)(261022075727099003)(261009221227099003)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OJ+x6q3g828Rt/ran+Q3mZwK1/ij+UAhrDw0yVyBzLYe204mjiZf5e8IsivdDw3JoBxbJpiydKr5W8ZachMLQ7uKhAfzmjqK8gOnr08/SQH6ZOV58xyFRzMnioOb7B3XStoK+omJCY6SjMT87NaLFskgAVZl1fRcUqBuUwNgFMhr9QVjCwkbyMIFav+H+oln3h9svkcUMo+KL3uzpnNa0iYbHcI1AYFAJb3IQV08au8jwMgqvhQxAqJWQ5wRheDULmtf1y/v2wx8n/rYyRyiOrlQG+wTtdhJ47/PtvWO3kloYA6Nk3OB4l7AsC6wc7JgrGIOb8FZqbWsVM6hYzo0mCnhF44EMPMysOFXdGJXNlxkkqOelz+84ryqnP1INafUOjs8ZB5JFbaMQkFx6k/2O5pTrxlRudL0ACuZ2x9nRrr2MSDPYSdaoGa/R5Xtf0BP
X-Exchange-RoutingPolicyChecked:
	Z/r1CVrw4yT7RXFRqCXPAdWEWhUP6VxrML1RXJHvcEwdOr7Gd6FTy+kkRLJ82IrLnL1+d9Q3bufSyBZePTI7KKfs/IPYGEuPpu0nIm55DZIxmgH2u65QJ29MSHsmZ7Xy5wBwSdyoD1T68w6YGJZEiK4n9BVNdhXuyfUp8c+doZ4BM4BdfjVY37OZX5WpT+lXQD/UDJnNSFamvIj5ecR88yYJG5UnZxjjk718ytbTj+L4l/btS+wYt8BkejF3bNMCB85T4cToBOvWYRda9LqvF2Ba5sbrcmcTHnZdgIY/BMhYfd6mbR7Xo9QK2ZSJAaKrPFhR4edE3ckKrTU6iKeY7A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:13:01.3614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c83cc89-73a2-470c-c8c6-08df35e844ec
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR10MB997874
X-Proofpoint-ORIG-GUID: amrHTAnfGejwXgNQ9sH-QkSIH82CK8Pg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX4c+UNgoPS2TF
 lmN70lo43IeFxGZu33e7TDRbE7BhKHsEUScV7sU3PI1OpTJcprGXMD3IguRSONKuwn7leWhB9CO
 r/8fvFwzyGw/pJ6DkkWonDVs3G6rySnmgd+F0qOaQpbQGaFkaLcmgVOXpqscAGJbkSwSr6a21/T
 56cD1/q1Da1jMIxetgP+tfNvDs7V3uFifc4SMsNRWem/aIn1R8CqsDKw1xXaWslFg/VaKlXTqbT
 rqbVVCC+krPqNuSF9qfOOiqrMsc4ngXgeTLfYfSosKls3K9zWjrl0X8y5Z4LAFw8Ldqz8WLeNdT
 f6Mk0JFLq1s83JQSJtm54ILaY9TAUaLxB0MAR5JbCqGc4PVFUKfaxy6IGo6NASufQvtB0sw9Ql0
 YwmCx+JmW0FTXhO528SyAQrijxJYtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX9C2b7jjZCstz
 BDuyjrsF8t2GJPmeGKrcOvUSHcp1gLIZUb0e84NDeJygXijvmWxL1Z8uq0OZteLgkdUc+wUt1RA
 AgV4R2zs7XRBx0FQpiRNaPDt/Ju72KE=
X-Proofpoint-GUID: amrHTAnfGejwXgNQ9sH-QkSIH82CK8Pg
X-Authority-Analysis: v=2.4 cv=eM2GH3p1 c=1 sm=1 tr=0 ts=6ae38cb4 cx=c_pps
 a=6AoXFOUR/bGkQ75sV68CBA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=RLINsKqJX5YIWHV47koA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610290071

The suspend/resume hooks invoke ti_sci_cmd_set_latency_constraint() and
ti_sci_msg_cmd_lpm_wake_reason() functions directly. These functions are
already exposed via pmops function pointers and pmops is available by
the time suspend/resume hooks are executed. Therefore, switch to using
the pmops function pointers instead of directly invoking the functions.
This also helps in a cleanup later.

Since commit 60357991f6b9 ("firmware: ti_sci: Introduce Power Management
Ops"), pmops->lpm_wake_reason is only populated when the firmware
reports MSG_FLAG_CAPS_LPM_DM_MANAGED, but the resume hook bypassed that
by calling ti_sci_msg_cmd_lpm_wake_reason() unconditionally. Guard the
call with the same fw_caps check which should be the correct behaviour.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
---
v3: Changelog:
1. Carried R/B tag from Kendall.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-16-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-16-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index d22686f9346ea..5d3151571ac33 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -3154,6 +3154,7 @@ static int ti_sci_suspend(struct device *dev)
 {
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	struct device *cpu_dev, *cpu_dev_max = NULL;
+	struct ti_sci_pm_ops *pmops = &info->handle.ops.pm_ops;
 	s32 val, cpu_lat = 0;
 	u16 cpu_lat_ms;
 	int i, ret;
@@ -3175,9 +3176,9 @@ static int ti_sci_suspend(struct device *dev)
 			cpu_lat_ms = cpu_lat / USEC_PER_MSEC;
 			dev_dbg(cpu_dev_max, "%s: sending max CPU latency=%u ms\n", __func__,
 				cpu_lat_ms);
-			ret = ti_sci_cmd_set_latency_constraint(&info->handle,
-								cpu_lat_ms,
-								TISCI_MSG_CONSTRAINT_SET);
+			ret = pmops->set_latency_constraint(&info->handle,
+							    cpu_lat_ms,
+							    TISCI_MSG_CONSTRAINT_SET);
 			if (ret)
 				return ret;
 		}
@@ -3209,6 +3210,7 @@ static int ti_sci_resume_noirq(struct device *dev)
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	struct ti_sci_msg_req_manage_irq *irq_desc;
 	struct ti_sci_irq *irq;
+	struct ti_sci_pm_ops *pmops = &info->handle.ops.pm_ops;
 	struct hlist_node *tmp_node;
 	int ret = 0, err = 0, i;
 	u32 source;
@@ -3262,11 +3264,14 @@ static int ti_sci_resume_noirq(struct device *dev)
 		break;
 	}
 
-	ret = ti_sci_msg_cmd_lpm_wake_reason(&info->handle, &source, &time, &pin, &mode);
-	/* Do not fail to resume on error as the wake reason is not critical */
-	if (!ret)
-		dev_info(dev, "ti_sci: wakeup source:0x%x, pin:0x%x, mode:0x%x\n",
-			 source, pin, mode);
+	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
+		ret = pmops->lpm_wake_reason(&info->handle, &source, &time, &pin,
+					     &mode);
+		/* Do not fail to resume on error as the wake reason is not critical */
+		if (!ret)
+			dev_info(dev, "ti_sci: wakeup source:0x%x, pin:0x%x, mode:0x%x\n",
+				 source, pin, mode);
+	}
 
 	return err;
 }
-- 
2.34.1

