Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793090296;
	b=uye7AIQFNW/5px+RI5mu0EM8sgDNy+1k5l2nWSvHqP+8uplWL5BOyCO6SA3hY8LZLbfV
	 jdNaEOgHysX36x31FXribM2v+BGw1HsRZZMiPSmNn+HF10FUeStpAM+0LrfLbAphWV+Gc
	 DBeR6LwVi3uZfNlwBC+PzjOOPHn/RR6snQgvwHFECt/QJgKHPTQ/u1VPNs33T/EtkvsKU
	 SWr/mYN9K5liWAO77BvrpNPko/+SQb/r+vn7baHR3eCzgtqgdzk1fp56zZfXGD3SlwqHl
	 +v2Haa/eKfSbOxkl1fq34KA2a4/8UgDOU7f6i7vs4PLOqUHs4IYJkpTNMj+Jo6jq9OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090296;
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
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KOt+9tU2EZsGZPEzWCu6djmctq+V3rHPFhYqR4eVhY4=;
	b=KqnVIcFvz5hlUiItiUSLAlg9j+EA8nMa0LgKjiPKNDNMaOpsop3986O8ZcNOloGnk5dX
	 3vEZ27hoiW/CNgsrU/NlG6EtGVg45WRda9f94NZHryOHDc0ZLU90Cc5v6su/Omxb73nke
	 pBCP86wNS2UL51MkD4Nmm22ooD4emh7Ey6mEvOWEfTuCAmLjd9hY0zrjjFCtB/txZpZtc
	 3R8dy+uUpWEeCwhXgFNoxe7tgKxB5HcN+Zz13GewzzO8wFA3jtSHjyJWYByodoUEzJtx1
	 9yU+KzkFtEAOo9vyJRAyQ4akByCtg0wcPvsay++n3qYhwi9Exx5ptEPPS3QMflM5sAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b="jrU0t/Nx";
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=PVdscANg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BD7606A331;
	Tue, 27 Oct 2026 08:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03BD7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=jrU0t/Nx;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=PVdscANg
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69R5XRxX265841;
	Tue, 27 Oct 2026 03:38:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=KOt+9tU2EZsGZPEzWCu6djmctq+V3rHPFhYqR4eVh
	Y4=; b=jrU0t/Nxbc/i09cnU/3UNZRlAgYP4ATWCz3xY1Ggkjj7Pbz8Cd4rG8nr5
	lVBWdXBF2JBBC6AiFfYk1uoI82iDygJUNLTz9dljQMz2XtcCy+2mFnDa453HW6SD
	8+3L+fDWnZk+u+DzszBawCoZRWaWyRX3pnjmyyl58mkLXiZ0JqOTjFs/aOH3O3r8
	Abi0tHvUGms+douPjA64hgFr1bZeryschqHF6wjxiZTkc1NF3D/Gzdgq9Vl+f522
	orQZD0ZPY334hafbB14SvryBE+SPmwcHdFrWv4P/wqUIqsxNzO8usrNB/X8xELkq
	QoRedOehSJ+bQo45XHEIZUm27HTkQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010049.outbound.protection.outlook.com [52.101.61.49])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hjh77jpfr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 03:38:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwKLpHaQ3hpL0bJLDbfkuIsFFT0QMLq3dVDFob2wmKhzmcr1jEJzTKHTG02szEQpOuwjWFp+HPaKMmdH5uMy0PpHpKpmcvyYeaOpfvT4K5/BfJOm6PxK+LR0mdj1RjpMJY49Fx/HfJUpYY/2yOLRtQXtchYJyYJ4gsFOf9fCTxas5yEFhSM5nT8XX3UJxztILltHYDAtbf2BaYPp2hIYSAIYLbSmhkmUvsSunP9QNJeB3glmXhPKO7v5lMo9gk/8vS1q6iJe2XDkGiVFEOiYp4JIDvvg+sdBp/Ji0+uzpj+oz3qTenSZtgOFsnWGxp+oiiXzVozx2EjOLUeI3/WYYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOt+9tU2EZsGZPEzWCu6djmctq+V3rHPFhYqR4eVhY4=;
 b=T7CM5SmjQhU5DOkEuQj6JAu9wiydpgLcZ3heYPcV16kLAqp2eXNESee0K+s+r/vhK1/cxpL99uRRP7E23RDE3mtmr3AZZX6o3qc1ZPXwmZH7d+tbWyDdIsKcP4qXk3w9z6znnIjcgDDrc4U1cSH6Vh4Ijtgq84c5m5v/LEdQBlIGbE8sRe+Y8IgKyTtE20C1JxQvRIb8P4vrh4kiUAmP9msOHOeLgDNXE2TdELfef53MiePNaaABig9Mko9VEN2VTCBriLRUej06jgHWf7y/9B86nRRlEompFyYyk1S+P+69EbRaorBdNDBk7mfMDIJzbYLk+s3QZG3T/wwgLRb25A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOt+9tU2EZsGZPEzWCu6djmctq+V3rHPFhYqR4eVhY4=;
 b=PVdscANgN2zpwRDaybe6AkyvKILA7IREsnwFB96xDtc6PCZ5Ndb1C381lsSvyV9vRwWHUYEDJJhHfObpccZbgbFaAo6ehkGZ+XWexPb1987bztnTX6YoPAYQBADLsIHqLma2Y0q8mXl5hcXXo0wyw3nAIDLvcPLPvIfTM/2lBe8=
Received: from CH2PR20CA0009.namprd20.prod.outlook.com (2603:10b6:610:58::19)
 by CH0PR10MB4905.namprd10.prod.outlook.com (2603:10b6:610:ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.13; Tue, 27 Oct
 2026 08:37:57 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::3d) by CH2PR20CA0009.outlook.office365.com
 (2603:10b6:610:58::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 08:37:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 08:37:55 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 03:37:22 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 03:37:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 27 Oct 2026 03:37:22 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69R8b1hG1558035;
	Tue, 27 Oct 2026 03:37:17 -0500
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>, <johan@kernel.org>, <kees@kernel.org>,
        <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 3/3] soc: ti: Add TDA54 SCM configuration syscon support
Date: Tue, 27 Oct 2026 14:07:00 +0530
Message-ID: <20261027083700.1964371-4-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027083700.1964371-1-m-shah@ti.com>
References: <20261027083700.1964371-1-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|CH0PR10MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: 977ce67e-7be0-4208-8a3f-08df34059910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|6133799003|22082099003|10067099003|261026121527099003|3023799007|261022105027099003|261022075727099003|13003099007|261009221227099003|5023799004|18002099003|261009223027099003|261021121427099003|261026140227099003|261022113327099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	jV1wjvCddtfcohKpFjWZj27hBd0kcEoT0M5kRRh98/iOuWIU5zm92rjuq8nVEy4a4DNgujhE6JrvG0cNqXhUGjVAfhB/C8hFmYahsADlunh3KkuGekB3EiwDBBK8U9vqLUbYT6icQZJdFtlgosphmqrx6frxf/jPKvFRN0qOnc6IrUZEkZNvmf7WQOhsD40oaa5Gdan4UrL/wvGDtApT7z3akvHXxcpr55TULuGXSblpJy2dcpGTGF/3Ls76PtP5irnUszocR0wA5rveFzEsa6tzbxZHC9zPXgp2VUJEnZub83HafkSlzy2DitL9fKBD6kD8DsWMNUagqGUn1u+zeYlHEscxDOZbceeunNKFYI8ZZE4o+6T8nydA+pfh6z5WroGthZruD4rXVYzWLTY1/PUKwvxnKl7KWIpd88vJEuUJZG5hzXi4UxK9jmXgNRyPuLWIr8jDQkmpPCWKDjejWkDq1fwvys9bGapxDa61Ld3zuxXaSfiexLoZVIL8cQmjqizLGbqfAVVaf5PBLln9VEKqyx4C6tzbQQpEPx2McnUlg2RUe940wJvAf7JdhpHoXy1iF+/BV3s850NePbPEYwZ/jsDPm0U1mAI4zU/auWU3Z0U+i+brrQXEW7TVFT6WEyX/TXsrCOs5LehqRiyXaA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(6133799003)(22082099003)(10067099003)(261026121527099003)(3023799007)(261022105027099003)(261022075727099003)(13003099007)(261009221227099003)(5023799004)(18002099003)(261009223027099003)(261021121427099003)(261026140227099003)(261022113327099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nH0DXZ9s+sZsoyzasoMWMpc9dSfvlxToBK6OwFTcWHk+SeI9rKOn2VVf8hKzl4oMy6l0g0iv2KDKnpAlbJhX1xl7BeaRU8p9xs0dKgP3PKAZMVrXDY1+10rijQJQBTBY7A5Wl8Vm3lEU8S7JWFaixWJFN0SEyecdWx4GkLXZE8eh0NSglqL6Q+FjxNA4jwJQ7uap8/jdMF/EDi7pN6yc70Lt4JaMhSeEglbeTD+QDLBwxBon3yGEQcn+f1WNlPJVFhtcQ8U8q5GPveVUYfqFSYQQW90k3FHFSGFdpOguf2aH8z37Z2971maC2meu0w2cKR3eoyeW8rW3WlAbaijPn9z7LKfYCL3TinJ06LQzIlc7LskTHMbFec/rW4x4JjfyhSnpCD6eD0dqmoEM6I/Kjwn2lf1HIY+ELnCqlO1qfGtZdAsvh/cpaYxaWgb9mweV
X-Exchange-RoutingPolicyChecked:
	WRDO/8iOSEC5ss8qBKbJgiv9uao6g9t+cLHB5ppcZ3n5rzskI21/EXKUaiuj/Jh8FULlBnot13yWaTstVHoTi94UJd1NjjcPB857sLt79Gp/gHvhPsfuW6LwftlE4k8fnT0QbeaU7NaCWqTyIlu1wdaK+KSn4bqVusXFdvr3Q+sDIXQPHA29m7atsx36jAG+oM40hraksf2A9GimyxX42OzjLsU+If+VsWqPWz8ccL9j8plavP2fcPEQYNcalAxpmz5/ZezKMPO8BMT94tH3Cq5V12/3hoXPQZqQ3ACAaGJNeICwDF770MMYmc4NFLQqGfeQwvU+nyvyf5JtJF5iAQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:37:55.6392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 977ce67e-7be0-4208-8a3f-08df34059910
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4905
X-Proofpoint-ORIG-GUID: jCoBU2J4WbhLujVSK_UOjBX3--FEXpAo
X-Authority-Analysis: v=2.4 cv=FMeOVOos c=1 sm=1 tr=0 ts=6ae062e9 cx=c_pps
 a=Vharl4M+XVTaKge5CdhMZQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=hU-JDQfdbdCR0hOrdIMA:9
X-Proofpoint-GUID: jCoBU2J4WbhLujVSK_UOjBX3--FEXpAo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX1dDfKlh9nlBE
 qg3vkdGlWbyyZ1u55Ic4U8035APYP2AnkUagiNDVBVcjCxocui30XpipFDb8evUeebeYzYdY8gI
 bva8WQFXAZs0IQ2rn13kFHEtHNhWGoI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfXxhYb4AKZhqIR
 XXaiu/Dat8Oca3WLqp2LUQgWlSFJxdfZ99LAa5gVA3x8tbT33mdGahFk1igGIxW8XHeviTIcGI6
 5Ki94vbMom/q7Q00LahvdXzw2w9nUZN2qQ60pYlyvMsGENH6VigThmOVapZ7bAc0Ywxro87xWCu
 mbsITPGp6c0mceau/dyBeY2K3pWiE/hyI95uNjEeKaY5XGiQpuV+D6yQL1vLa0J/+6Bq7t1KOK8
 oQnp7uPmVBo6Q+J8EYiYnjJbdvPA4ydnxQ8lRiowa7GSfZ+S30/sjFery6YobY9I3SLlQydjsj5
 QgfNHlMs28U4HERUKxRB5Rzcb2r9b+/HWqkwmiPrWv6jUaHYFCvkq1AmnzpupGjC3cZMRwbtcnl
 Xv8Y3B7HRp0Pe7LvUab2B+RE1xSC4vu/qz8nqdTnMtWGlBaKOIXE3aGLkGN4SOF6iADIeNfQ4ME
 IJu1z3EGvhK/VRGnCUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 impostorscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270034

Add the TDA54 SCM configuration driver providing access to the SCM register
space through regmap/syscon.

The driver handles proxy-based register access and SCM unlock/claim
handling, and registers TDA54 SoC information using the common K3 SoC
info helper exported by k3-socinfo, for which the TDA54 part number is
added to the SoC ID table.

Default the option to m on ARCH_K3, so that the driver gets built for TDA54
boards without requiring a defconfig change.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 drivers/soc/ti/Kconfig             |  16 +++
 drivers/soc/ti/Makefile            |   1 +
 drivers/soc/ti/k3-socinfo.c        |   2 +
 drivers/soc/ti/tda54-mcu-sysconf.c | 217 +++++++++++++++++++++++++++++
 4 files changed, 236 insertions(+)
 create mode 100644 drivers/soc/ti/tda54-mcu-sysconf.c

diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
index 163aadd589d3a..ea5da6722da29 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -82,6 +82,22 @@ config TI_PRUSS
 	  processors on various TI SoCs. It's safe to say N here if you're
 	  not interested in the PRU or if you are unsure.
 
+config TI_TDA54_MCU_SYSCONF
+	tristate "TI TDA54 SCM configuration controller"
+	depends on ARCH_K3 || COMPILE_TEST
+	depends on OF
+	default m if ARCH_K3
+	select MFD_SYSCON
+	select TI_K3_SOCINFO
+	help
+	  Support the SCM configuration controller found on TI TDA54.
+	  The controller provides a syscon regmap and is also the
+	  hardware access path used to obtain and register K3 SoC
+	  identification information.
+
+	  This driver can be built as a module, in which case the module
+	  will be called tda54-mcu-sysconf.
+
 endif # SOC_TI
 
 config TI_SCI_INTA_MSI_DOMAIN
diff --git a/drivers/soc/ti/Makefile b/drivers/soc/ti/Makefile
index cb800a745e66d..33f4ddca32ed6 100644
--- a/drivers/soc/ti/Makefile
+++ b/drivers/soc/ti/Makefile
@@ -11,4 +11,5 @@ obj-$(CONFIG_TI_SCI_INTA_MSI_DOMAIN)	+= ti_sci_inta_msi.o
 obj-$(CONFIG_TI_K3_RINGACC)		+= k3-ringacc.o
 obj-$(CONFIG_TI_K3_SOCINFO)		+= k3-socinfo.o
 obj-$(CONFIG_TI_PRUSS)			+= pruss.o
+obj-$(CONFIG_TI_TDA54_MCU_SYSCONF)	+= tda54-mcu-sysconf.o
 obj-$(CONFIG_POWER_AVS_OMAP)		+= smartreflex.o
diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index e81d27e03c9d9..51493c7e10b9f 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -50,6 +50,7 @@
 #define JTAG_ID_PARTNO_AM62PX		0xBB9D
 #define JTAG_ID_PARTNO_J722S		0xBBA0
 #define JTAG_ID_PARTNO_AM62LX		0xBBA7
+#define JTAG_ID_PARTNO_TDA54		0xBBC1
 
 static const struct k3_soc_id {
 	unsigned int id;
@@ -66,6 +67,7 @@ static const struct k3_soc_id {
 	{ JTAG_ID_PARTNO_AM62PX, "AM62PX" },
 	{ JTAG_ID_PARTNO_J722S, "J722S" },
 	{ JTAG_ID_PARTNO_AM62LX, "AM62LX" },
+	{ JTAG_ID_PARTNO_TDA54, "TDA54" },
 };
 
 static const char * const j721e_rev_string_map[] = {
diff --git a/drivers/soc/ti/tda54-mcu-sysconf.c b/drivers/soc/ti/tda54-mcu-sysconf.c
new file mode 100644
index 0000000000000..3ef82e737d095
--- /dev/null
+++ b/drivers/soc/ti/tda54-mcu-sysconf.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TDA54 SCM Configuration syscon driver
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/soc/ti/k3-socinfo.h>
+#include <linux/types.h>
+
+/* Size of a single proxy window into the scm_conf register space */
+#define TDA54_SCM_CONF_PROXY_STRIDE		0x4000
+
+#define TDA54_JTAG_ID_REG_OFFSET		0x14
+
+#define TDA54_SCM_CONF_LOCK_KICK0_UNLOCK_VAL	0x68EF3490
+#define TDA54_SCM_CONF_LOCK_KICK1_UNLOCK_VAL	0xD172BC5A
+
+/*
+ * Claim registers start at 0x3100. Claim register i holds the claim bit
+ * for each of the 32 registers in the (i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE)
+ * .. (i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE + 0x7c) block, one bit per
+ * register, i.e. bit b of claim register i corresponds to the register at
+ * offset i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE + b * 4.
+ */
+#define TDA54_SCM_CONF_CLAIM_REG_STRIDE		0x4
+#define TDA54_SCM_CONF_CLAIM_REGS_PER_WORD	32
+#define TDA54_SCM_CONF_CLAIM_BLOCK_SIZE		\
+	(TDA54_SCM_CONF_CLAIM_REGS_PER_WORD * 0x4)
+
+/* Per-SoC register offset data (platform data) */
+struct tda54_scm_conf_data {
+	u32 lock_offset;
+	u32 claim_offset;
+	u32 claim_status_offset;
+};
+
+static const struct tda54_scm_conf_data tda54_scm_conf_data = {
+	.lock_offset		= 0x3008,
+	.claim_offset		= 0x3100,
+	.claim_status_offset	= 0x3300,
+};
+
+struct tda54_scm_conf {
+	void __iomem *base;
+	u32 proxy;
+	const struct tda54_scm_conf_data *pdata;
+};
+
+/*
+ * Make @reg writable through this proxy.
+ *
+ * Proxy 0 is the default access proxy for all unclaimed registers. Its claim
+ * bits are tied low, so it cannot claim anything and needs no claim to write;
+ * it can write @reg unless another proxy has claimed it, which is reported by
+ * the claim status.
+ *
+ * Any other proxy has to claim @reg first. Registers claimed by a proxy can no
+ * longer be written through any other proxy's address, until that proxy
+ * releases the claim. The claim status is set once any proxy owns @reg, so
+ * read the claim register back to check that the claim is held by this proxy.
+ */
+static int tda54_scm_conf_claim(struct tda54_scm_conf *scm, unsigned int reg)
+{
+	unsigned int block = reg / TDA54_SCM_CONF_CLAIM_BLOCK_SIZE;
+	unsigned int bit = (reg % TDA54_SCM_CONF_CLAIM_BLOCK_SIZE) /
+			   TDA54_SCM_CONF_CLAIM_REG_STRIDE;
+	unsigned int claim_reg = scm->pdata->claim_offset +
+				 block * TDA54_SCM_CONF_CLAIM_REG_STRIDE;
+	unsigned int status_reg = scm->pdata->claim_status_offset +
+				  block * TDA54_SCM_CONF_CLAIM_REG_STRIDE;
+	u32 val;
+
+	if (!scm->proxy) {
+		if (readl(scm->base + status_reg) & BIT(bit))
+			return -EBUSY;
+
+		return 0;
+	}
+
+	val = readl(scm->base + claim_reg);
+	val |= BIT(bit);
+	writel(val, scm->base + claim_reg);
+
+	if (!(readl(scm->base + claim_reg) & BIT(bit)))
+		return -EBUSY;
+
+	return 0;
+}
+
+static int tda54_scm_conf_reg_read(void *context, unsigned int reg,
+				   unsigned int *val)
+{
+	struct tda54_scm_conf *scm = context;
+
+	*val = readl(scm->base + reg);
+
+	return 0;
+}
+
+static int tda54_scm_conf_reg_write(void *context, unsigned int reg,
+				    unsigned int val)
+{
+	struct tda54_scm_conf *scm = context;
+	int ret;
+
+	ret = tda54_scm_conf_claim(scm, reg);
+	if (ret)
+		return ret;
+
+	writel(val, scm->base + reg);
+
+	return 0;
+}
+
+static const struct regmap_config tda54_scm_conf_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.fast_io = true,
+	.reg_read = tda54_scm_conf_reg_read,
+	.reg_write = tda54_scm_conf_reg_write,
+};
+
+static int tda54_scm_conf_register_socinfo(struct device *dev,
+					   struct regmap *regmap)
+{
+	u32 jtag_id;
+	int ret;
+
+	ret = regmap_read(regmap, TDA54_JTAG_ID_REG_OFFSET, &jtag_id);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read JTAG ID\n");
+
+	return k3_socinfo_register(dev, jtag_id);
+}
+
+static int tda54_scm_conf_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tda54_scm_conf *scm;
+	struct regmap *regmap;
+	void __iomem *base;
+	int ret;
+
+	scm = devm_kzalloc(dev, sizeof(*scm), GFP_KERNEL);
+	if (!scm)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	if (of_property_read_u32(dev->of_node, "ti,proxy-id", &scm->proxy))
+		return dev_err_probe(dev, -ENODATA, "missing ti,proxy-id property\n");
+
+	if (scm->proxy >= 8)
+		return dev_err_probe(dev, -EINVAL,
+				     "ti,proxy-id must be between 0 and 7\n");
+
+	scm->base = base + scm->proxy * TDA54_SCM_CONF_PROXY_STRIDE;
+
+	/* Get register offsets from driver data (matched by compatible) */
+	scm->pdata = of_device_get_match_data(dev);
+
+	regmap = devm_regmap_init(dev, NULL, scm, &tda54_scm_conf_regmap_cfg);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	writel(TDA54_SCM_CONF_LOCK_KICK0_UNLOCK_VAL, scm->base + scm->pdata->lock_offset);
+	writel(TDA54_SCM_CONF_LOCK_KICK1_UNLOCK_VAL, scm->base + scm->pdata->lock_offset + 4);
+
+	/*
+	 * There is no way to unregister a syscon regmap, so publish it only
+	 * once nothing else in probe can fail.
+	 */
+	ret = of_syscon_register_regmap(dev->of_node, regmap);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register syscon regmap\n");
+
+	/*
+	 * SoC identification is informational, so a failure here must not fail
+	 * the probe. It is registered last and released through devres.
+	 */
+	ret = tda54_scm_conf_register_socinfo(dev, regmap);
+	if (ret)
+		dev_warn(dev, "SoC info not registered: %d\n", ret);
+
+	return 0;
+}
+
+static const struct of_device_id tda54_scm_conf_of_match[] = {
+	{ .compatible = "ti,tda54-mcu-scm-conf", .data = &tda54_scm_conf_data },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, tda54_scm_conf_of_match);
+
+static struct platform_driver tda54_scm_conf_driver = {
+	.probe = tda54_scm_conf_probe,
+	.driver = {
+		.name = "k3-tda54-scm-conf",
+		.of_match_table = tda54_scm_conf_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+module_platform_driver(tda54_scm_conf_driver);
+
+MODULE_AUTHOR("Moteen Shah <m-shah@ti.com>");
+MODULE_DESCRIPTION("TDA54 SCM Configuration syscon driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

