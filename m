Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297599;
	b=xy7cv2Dy4u/vsnjexOyDnVhFMa+6aaEb233L0eZo/Oc/+5Y9aBB2hnehbA0mqK1hwss7
	 jiUdzx/dIk9OnrcT1kp7Pw9sJDRKhjMM/yGEfUbs4kAXGwO/wfBI48kPdVIRUlN//WAOY
	 PXs6B8jcYvq60X35vXKKj2evyqv2waBdalu3YRbhaL6gSy4xEcjFI3JkMuxdJWBo1mNjp
	 33SkxOPzcVcavCHBAhAUqPrpHkLfw3ujP3SH3WAMPE+iD+yxMPdD94v/nYAayfnytmQzW
	 8FwUaiJG231prdjPQs8iDmlUo0yPI/ScpOw37FXT6MaEooNmIDf+395fk4CoREifVGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297599;
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
	bh=F1SDsLbYRc0SsshG6fwm41fTdF/zJfMeOPeS/rcA50A=;
	b=ZPzG2XaXfBwajalbOmTgTjWyY6YLkc5Fu/3knoNTZV/2GP6m4xVFrVaK4lMfsDLtd2qx
	 nzPyhKV6WaoEXfwhQQ83eihKjHauP62qgvcV9Y06QvRQEiLE2B6rVxhwyALWHza8ZlYUb
	 3qlU/l1jKhx8tO56lslkMFesYpBCcIEAwCUf3zR/qI4/nddaVR/XUtnewKl21fzjpfeeZ
	 UcNVMvW7En4ewjpdln9YJXfBr1ThF+U5MBhjHqhB7aPhbm4B9yYHwNkBZ29MkRM72eg4m
	 caNWeQ7a8DKxXH0QtrW1pjHhOzDYxwAV4j5pEGRcjJxl/0uk5DMnoSNmI6jOWStC1HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=XcIjBmY0;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=X3+Jd5BL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C46606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99C46606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=XcIjBmY0;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=X3+Jd5BL
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69TGDTgI1079057;
	Thu, 29 Oct 2026 13:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=F1SDsLbYRc0SsshG6fwm41fTdF/zJfMeOPeS/rcA5
	0A=; b=XcIjBmY0LhHzKDkPHrLZgm3LvDksPno++Cz5lC5dIyQyQ26/Sf8pkO0mE
	K39EWcvfdYp7+rMSbffKvcl7ysYVqutaAbw2sGUJ0YBzHhznv58qsYRvdgrvqd8v
	QF2HTDN01RM/+TwSzchSKldBah+Qqq1bubblWhKQ3J6KA/ZFDkvOmtHCP4FwlZ0q
	KQygTLk+kmbV13j3oI173FMJun1AY+s3djMNSv8u0ijLNgaabPiOjbdsck4UiFNs
	ZdVvAPipARFeo97nNUFOFHzJU722OS70tE8tJr2ZMZHrOELMgqtmj2hAOYZCuB41
	80FpOBs5VUnQzmQfW9qvbPvXpvTEA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010031.outbound.protection.outlook.com [40.93.198.31])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hkurvxapp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:13:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nj/ZjWxgm8q4zbfBjATw+b3zN2A9/qAL+zXQAWh3tnQZqKxilJab1gY+eT01RpqHz8RapZFhLN/NVrlSxgv6b5WPg0/pEu0lQgkB+IiEFbgir9udtPxEgWHpYJkCR7f3kO84TImQ0j/Lx6o3QECpZFxZSmiRoaOqllUxFTbw0sOJnJpl5+U9Kh64OuKiyhHxWU5QfdA3zAJ/jAitgooH1Ubw+99vShVxYg/LsyRkKyJ6q7bmGH8Yf914Hdds1JphNlxeL8xks5R5yknANXiJLYivc/IVCQd9fBT6ECKLIBQ1oc8DrTzJia/7ysUumhXNU5VVyJ0ycpYgoJ7OwX4Cfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1SDsLbYRc0SsshG6fwm41fTdF/zJfMeOPeS/rcA50A=;
 b=GOeMi/m9x635jIfQkfxYlHXt44cyV5cmiSkvHWjVlHK+//UJVCUeAKkKMReigXVqwZBWrMK3g3wwreXsO3ABqw1B64VVpXdTMxG+3YySrcS0h7Mtic47Njm3wKjfAUT/n6XccyicRQzHeF/D/dQT3QejYdil095ddeWIcNV2GOoT8QZoXbIDS0/YulIsu8K5TCTzxnYykkxe5Zfw18rVN41YgPQCHk59IRgUFDlotucNQCGuyBFo0O6fc+1PqU8ZFct/vMVgONgM+/cMM8d177FCDvONlkFnMnjKunn/Kys0dYKDTppOdRGvBOdXTEzS33mP1c1OSoVU1BRDjqHJ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1SDsLbYRc0SsshG6fwm41fTdF/zJfMeOPeS/rcA50A=;
 b=X3+Jd5BLkc2GbWfal0NPRTUuH0IqKYd2BRO7bTt9GXCZ9AtZ6BbzClStuvdDBZnTMNtvNbPVwK0q79NWExAY47CtabbnvwDCZc3yBiXoM559fYyQ/lr1Yp11ZTi0jMnYcTw/lEsbLD0qTDGDafwBubb4K+LAnFGT835WSWrUE9E=
Received: from MW4PR03CA0274.namprd03.prod.outlook.com (2603:10b6:303:b5::9)
 by SA1PR10MB6447.namprd10.prod.outlook.com (2603:10b6:806:2b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 18:13:08 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:303:b5:cafe::47) by MW4PR03CA0274.outlook.office365.com
 (2603:10b6:303:b5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Thu, 29
 Oct 2026 18:13:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:13:08 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:47 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:47 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmMI3408718;
	Thu, 29 Oct 2026 13:12:44 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 18/22] firmware: ti: ti_sci_device: Move device ops into its own file
Date: Thu, 29 Oct 2026 23:41:43 +0530
Message-ID: <20261029181147.266771-19-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|SA1PR10MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c64662-b411-41b0-f0c8-08df35e8492c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|56012099006|261009221227099003|261009223027099003|261009221727099003|261009220027099003|261009223327099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|10067099003|261028144727099003|261022113327099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	QBDV1teFLOxcGaVv5rQ8vg/URtKIOJyzuPR3sLH49XofSHlVCbgpc3RDYQRfP6Nug2rDgG1bVryLmYx3skzXNfxYlX2R2gB6gYJ10ZYQaIK12RpsiTNKu1vVTVZTKVNNDJjBVLlO3EJJiXu1xE64s9A2kWtk97zsfL+fU9stwbAwBxFe1Mc1D5dEVErrs9e8iw8FCtjrhqY2JvMCwEMMnxDAKKXHkFszMcZRnwoUE57CWX0gep5sOUHArR+SGP7bNwVdYzSm2kn/MMEwqMtNe13F/8Kcpytv2VqvzkOtGZ+MMQH49+ykxkJSlLiEKWeiLFcA00cQR5AiPT+kKJww5cjgl5GDfxVztbwjqFU0DUaxBXVjyfqeBXicvDY3u+G6KFAC1P7Wb6QqlJlhXTCRvTr7ot+RP78PtwKE3e0Nu8KeMwa+4KJuyB+pLOkTjiHu/EnwdcR+do3jNTVT4FUrYrYfILtN9T4NYtWAIyabqHoaKw04hpiC83j02wwceNomPnHigernbZTW7ZbNPDd0RJk/+nltyakwGIPXykorBZ9ltIck6kPRHnyC0RNrNhJQb9KTqhKFaFUCX1i1OkZd0QiI6jqnCPdkdqq2z/H1trLrvxwEY73/4VbsS/uQJnOtH159478anzIyLRenmffQfQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(56012099006)(261009221227099003)(261009223027099003)(261009221727099003)(261009220027099003)(261009223327099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003)(261028144727099003)(261022113327099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BWUO6jnOMzTj6ricBvWuKhuz4aBjgNz4RMWSSH1u4kKn2EtIErvLY9xSciXQ6cIJJELhNVNNsraNXiwz8BwYc5YeTrJ+kQsMl+jTlOFTBxxfWIhjVdx3EP+R/my+ywE7QI6h9U96R8mj9NilLyYZX03EbzhtGEbj9vXdiBXHQ7ezReh69DIXvVsbZdm30sz3CzCSS5AIVk7yVmHTXpfa4CJXTsJUOm6L0MD3T+VSgV9QKUxcOr1ohOYg9vtGUnmR7KjqmGrkZZHsj4l9/aCliiS5BVTtYD3xFhc5vX5+DUnDazuHaYwBLUF9qu6T/3FaoWJrGmKH5zPTFYNugQkEi4dGDPL2V054quNm9+OC2ku/lsKa3VZHDAISiSsGXld34xvVn1J5prgwLZvONk262TpJjlx2KKUtRjzNlWfwl2jiGiwBhhYV9Oywxef40QEC
X-Exchange-RoutingPolicyChecked:
	xWef+xA9Io/RTvSlghlTjMxhdoKn5WJYmT66Ve+fwMkWe3Ahi3lNd8+9Lzyn9niy/uetp1vjAw7qTbAQsJ6jjgcO2wvjlUryxSkuQ9T2sp76GoNDtRYQdNVKmDWeDNP7BXnCO2zJVuYsS4suS/+7tjYg/k0iGyg5Bzl0jtR/qz+a3pmayokWoURYB910jdQsqhtf6qUblbG0cq1fzcC8Te4vG3f8gYJTIRrLSVih3Ev8hxTHpBhFunKG34YZXtfIYXWTuDmTc5TpLl89j/bgQTKggWenpbmigqgf5dxDLnA6B4NW6XMfXXh+JlVKEnJ/4NDTPx9SIe1QtPbFtyRrtg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:13:08.4995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c64662-b411-41b0-f0c8-08df35e8492c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6447
X-Proofpoint-ORIG-GUID: crA6aKrPjaBHrtF7tdnxeEWSyxoyExOh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX9WEnQGPg0CPC
 xKxIU58kSgz6fvUyknD3Q/E9yEa2OBvz+x4ejItLDlIt7b+dacStT/Y2SUTf9kuBCKgWE6oHAd0
 EFB0PedWyRk4ER7XJhAKIupzpELwkbPQ8O4FqzAZBh2DnIUgtugdK1kn1mmqg4Bh/+wQjPPVtPV
 0rOcv3HPW4B8xrUwRn6f0PDC4zJvfSlhrJtWxvrYdQ6ZnRAzVwysgaJLaKIXCxejdgXfzu15LCB
 /Cb2Ftomnte/bg+1EP6GwF63Axx+nnJMpWnKmBNIIQN9KpdCTKiofbFua+RRhqpjTYh9mPEbn4t
 2w2Mqb6HVZN0lVVj3jHVLGdsCFjORxcz0Ix4JNViCMHxrNsi+XqxPk7kEhAoh1aTQIJfV2i2yno
 sw8D9Vs8qcRihA6pSk+eUtOG9wE8rEzAvEmYR2NmfEw4Mm8Xc4WNydnmOA3jMCzcFezWeJCwnYF
 OWILC0lmJQVv2PwK0Kw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfXx5ce6nQYoqdK
 gpFoinalDxD2E0/t5mfs4p5JKNS8dxXOrFiljlx0k1bXIbnfscBTiJEZaZKOrPzSk7FzXFu/SgE
 1DS5/TC/ich0EC/FBKlPIgCuwG/taPI=
X-Proofpoint-GUID: crA6aKrPjaBHrtF7tdnxeEWSyxoyExOh
X-Authority-Analysis: v=2.4 cv=DtrDa2/+ c=1 sm=1 tr=0 ts=6ae38cb8 cx=c_pps
 a=urLXRHf+rrcNZWEu7FangQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=ClwRLDrRHDBltJ_IRj8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290071

From: Andrew Davis <afd@ti.com>

Extract the device operations related functions and services from
ti_sci_core.c into its own file. This breaks down the single large file
into smaller logical files for better readability and maintenance.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. Update commit message to remove ti_sci_core.c file renaming as that
is already done in [PATCH v3 16/22] now.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-19-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-19-b-padhi@ti.com/

 drivers/firmware/ti/Makefile        |   1 +
 drivers/firmware/ti/ti_sci.h        |   7 +
 drivers/firmware/ti/ti_sci_core.c   | 378 +--------------------------
 drivers/firmware/ti/ti_sci_device.c | 388 ++++++++++++++++++++++++++++
 4 files changed, 401 insertions(+), 373 deletions(-)
 create mode 100644 drivers/firmware/ti/ti_sci_device.c

diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
index ca54cd35eaef2..a3a056eedd9a5 100644
--- a/drivers/firmware/ti/Makefile
+++ b/drivers/firmware/ti/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 ti_sci-y			:= ti_sci_core.o
+ti_sci-y			+= ti_sci_device.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index f2f17bcac39e4..79f56699faf29 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -1560,4 +1560,11 @@ struct ti_sci_msg_resp_get_status {
 	u32 status_flags;
 } __packed;
 
+int ti_sci_do_xfer(const struct ti_sci_handle *handle,
+		   u16 msg_type, u32 msg_flags,
+		   void *tx_message, size_t tx_message_size,
+		   void *rx_message, size_t rx_message_size);
+
+void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops);
+
 #endif /* __TI_SCI_H */
diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
index 5d3151571ac33..e98bf3c5f9dc1 100644
--- a/drivers/firmware/ti/ti_sci_core.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -444,10 +444,10 @@ static inline bool ti_sci_is_response_ack(void *r)
  *         corresponding error if transmit fails, or
  *         return 0, if all goes well.
  */
-static inline int ti_sci_do_xfer(const struct ti_sci_handle *handle,
-				 u16 msg_type, u32 msg_flags,
-				 void *tx_message, size_t tx_message_size,
-				 void *rx_message, size_t rx_message_size)
+int ti_sci_do_xfer(const struct ti_sci_handle *handle,
+		   u16 msg_type, u32 msg_flags,
+		   void *tx_message, size_t tx_message_size,
+		   void *rx_message, size_t rx_message_size)
 {
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
@@ -565,361 +565,6 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	return 0;
 }
 
-/**
- * ti_sci_set_device_state() - Set device state helper
- * @handle:	pointer to TI SCI handle
- * @id:		Device identifier
- * @flags:	flags to setup for the device
- * @state:	State to move the device to
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
-				   u32 id, u32 flags, u8 state)
-{
-	struct ti_sci_msg_req_set_device_state req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.id = id;
-	req.state = state;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_STATE,
-			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_get_device_state() - Get device state helper
- * @handle:	Handle to the device
- * @id:		Device Identifier
- * @clcnt:	Pointer to Context Loss Count
- * @resets:	pointer to resets
- * @p_state:	pointer to p_state
- * @c_state:	pointer to c_state
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
-				   u32 id,  u32 *clcnt,  u32 *resets,
-				    u8 *p_state,  u8 *c_state)
-{
-	struct ti_sci_msg_req_get_device_state req;
-	struct ti_sci_msg_resp_get_device_state resp;
-	int ret = 0;
-
-	if (!clcnt && !resets && !p_state && !c_state)
-		return -EINVAL;
-
-	req.id = id;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_DEVICE_STATE,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	if (clcnt)
-		*clcnt = resp.context_loss_count;
-	if (resets)
-		*resets = resp.resets;
-	if (p_state)
-		*p_state = resp.programmed_state;
-	if (c_state)
-		*c_state = resp.current_state;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_get_device() - command to request for device managed by TISCI
- *			     that can be shared with other hosts.
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Request for the device - NOTE: the client MUST maintain integrity of
- * usage count by balancing get_device with put_device. No refcounting is
- * managed by driver for that purpose.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_get_device(const struct ti_sci_handle *handle, u32 id)
-{
-	return ti_sci_set_device_state(handle, id, 0,
-				       MSG_DEVICE_SW_STATE_ON);
-}
-
-/**
- * ti_sci_cmd_get_device_exclusive() - command to request for device managed by
- *				       TISCI that is exclusively owned by the
- *				       requesting host.
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Request for the device - NOTE: the client MUST maintain integrity of
- * usage count by balancing get_device with put_device. No refcounting is
- * managed by driver for that purpose.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_get_device_exclusive(const struct ti_sci_handle *handle,
-					   u32 id)
-{
-	return ti_sci_set_device_state(handle, id,
-				       MSG_FLAG_DEVICE_EXCLUSIVE,
-				       MSG_DEVICE_SW_STATE_ON);
-}
-
-/**
- * ti_sci_cmd_idle_device() - Command to idle a device managed by TISCI
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Request for the device - NOTE: the client MUST maintain integrity of
- * usage count by balancing get_device with put_device. No refcounting is
- * managed by driver for that purpose.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_idle_device(const struct ti_sci_handle *handle, u32 id)
-{
-	return ti_sci_set_device_state(handle, id, 0,
-				       MSG_DEVICE_SW_STATE_RETENTION);
-}
-
-/**
- * ti_sci_cmd_idle_device_exclusive() - Command to idle a device managed by
- *					TISCI that is exclusively owned by
- *					requesting host.
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Request for the device - NOTE: the client MUST maintain integrity of
- * usage count by balancing get_device with put_device. No refcounting is
- * managed by driver for that purpose.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_idle_device_exclusive(const struct ti_sci_handle *handle,
-					    u32 id)
-{
-	return ti_sci_set_device_state(handle, id,
-				       MSG_FLAG_DEVICE_EXCLUSIVE,
-				       MSG_DEVICE_SW_STATE_RETENTION);
-}
-
-/**
- * ti_sci_cmd_put_device() - command to release a device managed by TISCI
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Request for the device - NOTE: the client MUST maintain integrity of
- * usage count by balancing get_device with put_device. No refcounting is
- * managed by driver for that purpose.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_put_device(const struct ti_sci_handle *handle, u32 id)
-{
-	return ti_sci_set_device_state(handle, id,
-				       0, MSG_DEVICE_SW_STATE_AUTO_OFF);
-}
-
-/**
- * ti_sci_cmd_dev_is_valid() - Is the device valid
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Return: 0 if all went fine and the device ID is valid, else return
- * appropriate error.
- */
-static int ti_sci_cmd_dev_is_valid(const struct ti_sci_handle *handle, u32 id)
-{
-	u8 unused;
-
-	/* check the device state which will also tell us if the ID is valid */
-	return ti_sci_get_device_state(handle, id, NULL, NULL, NULL, &unused);
-}
-
-/**
- * ti_sci_cmd_dev_get_clcnt() - Get context loss counter
- * @handle:	Pointer to TISCI handle
- * @id:		Device Identifier
- * @count:	Pointer to Context Loss counter to populate
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_dev_get_clcnt(const struct ti_sci_handle *handle, u32 id,
-				    u32 *count)
-{
-	return ti_sci_get_device_state(handle, id, count, NULL, NULL, NULL);
-}
-
-/**
- * ti_sci_cmd_dev_is_idle() - Check if the device is requested to be idle
- * @handle:	Pointer to TISCI handle
- * @id:		Device Identifier
- * @r_state:	true if requested to be idle
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_dev_is_idle(const struct ti_sci_handle *handle, u32 id,
-				  bool *r_state)
-{
-	int ret;
-	u8 state;
-
-	if (!r_state)
-		return -EINVAL;
-
-	ret = ti_sci_get_device_state(handle, id, NULL, NULL, &state, NULL);
-	if (ret)
-		return ret;
-
-	*r_state = (state == MSG_DEVICE_SW_STATE_RETENTION);
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_dev_is_stop() - Check if the device is requested to be stopped
- * @handle:	Pointer to TISCI handle
- * @id:		Device Identifier
- * @r_state:	true if requested to be stopped
- * @curr_state:	true if currently stopped.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_dev_is_stop(const struct ti_sci_handle *handle, u32 id,
-				  bool *r_state,  bool *curr_state)
-{
-	int ret;
-	u8 p_state, c_state;
-
-	if (!r_state && !curr_state)
-		return -EINVAL;
-
-	ret =
-	    ti_sci_get_device_state(handle, id, NULL, NULL, &p_state, &c_state);
-	if (ret)
-		return ret;
-
-	if (r_state)
-		*r_state = (p_state == MSG_DEVICE_SW_STATE_AUTO_OFF);
-	if (curr_state)
-		*curr_state = (c_state == MSG_DEVICE_HW_STATE_OFF);
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_dev_is_on() - Check if the device is requested to be ON
- * @handle:	Pointer to TISCI handle
- * @id:		Device Identifier
- * @r_state:	true if requested to be ON
- * @curr_state:	true if currently ON and active
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_dev_is_on(const struct ti_sci_handle *handle, u32 id,
-				bool *r_state,  bool *curr_state)
-{
-	int ret;
-	u8 p_state, c_state;
-
-	if (!r_state && !curr_state)
-		return -EINVAL;
-
-	ret =
-	    ti_sci_get_device_state(handle, id, NULL, NULL, &p_state, &c_state);
-	if (ret)
-		return ret;
-
-	if (r_state)
-		*r_state = (p_state == MSG_DEVICE_SW_STATE_ON);
-	if (curr_state)
-		*curr_state = (c_state == MSG_DEVICE_HW_STATE_ON);
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_dev_is_trans() - Check if the device is currently transitioning
- * @handle:	Pointer to TISCI handle
- * @id:		Device Identifier
- * @curr_state:	true if currently transitioning.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_dev_is_trans(const struct ti_sci_handle *handle, u32 id,
-				   bool *curr_state)
-{
-	int ret;
-	u8 state;
-
-	if (!curr_state)
-		return -EINVAL;
-
-	ret = ti_sci_get_device_state(handle, id, NULL, NULL, NULL, &state);
-	if (ret)
-		return ret;
-
-	*curr_state = (state == MSG_DEVICE_HW_STATE_TRANS);
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_set_device_resets() - command to set resets for device managed
- *				    by TISCI
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- * @reset_state: Device specific reset bit field
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
-					u32 id, u32 reset_state)
-{
-	struct ti_sci_msg_req_set_device_resets req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.id = id;
-	req.resets = reset_state;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_RESETS,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_get_device_resets() - Get reset state for device managed
- *				    by TISCI
- * @handle:		Pointer to TISCI handle
- * @id:			Device Identifier
- * @reset_state:	Pointer to reset state to populate
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_get_device_resets(const struct ti_sci_handle *handle,
-					u32 id, u32 *reset_state)
-{
-	return ti_sci_get_device_state(handle, id, NULL, reset_state, NULL,
-				       NULL);
-}
-
 /**
  * ti_sci_set_clock_state() - Set clock state helper
  * @handle:	pointer to TI SCI handle
@@ -2577,20 +2222,7 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 	struct ti_sci_rm_udmap_ops *udmap_ops = &ops->rm_udmap_ops;
 	struct ti_sci_proc_ops *pops = &ops->proc_ops;
 
-	dops->get_device = ti_sci_cmd_get_device;
-	dops->get_device_exclusive = ti_sci_cmd_get_device_exclusive;
-	dops->idle_device = ti_sci_cmd_idle_device;
-	dops->idle_device_exclusive = ti_sci_cmd_idle_device_exclusive;
-	dops->put_device = ti_sci_cmd_put_device;
-
-	dops->is_valid = ti_sci_cmd_dev_is_valid;
-	dops->get_context_loss_count = ti_sci_cmd_dev_get_clcnt;
-	dops->is_idle = ti_sci_cmd_dev_is_idle;
-	dops->is_stop = ti_sci_cmd_dev_is_stop;
-	dops->is_on = ti_sci_cmd_dev_is_on;
-	dops->is_transitioning = ti_sci_cmd_dev_is_trans;
-	dops->set_device_resets = ti_sci_cmd_set_device_resets;
-	dops->get_device_resets = ti_sci_cmd_get_device_resets;
+	ti_sci_setup_device_ops(dops);
 
 	cops->get_clock = ti_sci_cmd_get_clock;
 	cops->idle_clock = ti_sci_cmd_idle_clock;
diff --git a/drivers/firmware/ti/ti_sci_device.c b/drivers/firmware/ti/ti_sci_device.c
new file mode 100644
index 0000000000000..cb9888ca54a35
--- /dev/null
+++ b/drivers/firmware/ti/ti_sci_device.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Texas Instruments System Control Interface Protocol Driver
+ *
+ * Copyright (C) 2015-2026 Texas Instruments Incorporated - https://www.ti.com/
+ *	Nishanth Menon
+ */
+
+#include <linux/soc/ti/ti_sci_protocol.h>
+
+#include "ti_sci.h"
+
+/**
+ * ti_sci_set_device_state() - Set device state helper
+ * @handle:	pointer to TI SCI handle
+ * @id:		Device identifier
+ * @flags:	flags to setup for the device
+ * @state:	State to move the device to
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
+				   u32 id, u32 flags, u8 state)
+{
+	struct ti_sci_msg_req_set_device_state req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.id = id;
+	req.state = state;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_STATE,
+			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_get_device_state() - Get device state helper
+ * @handle:	Handle to the device
+ * @id:		Device Identifier
+ * @clcnt:	Pointer to Context Loss Count
+ * @resets:	pointer to resets
+ * @p_state:	pointer to p_state
+ * @c_state:	pointer to c_state
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
+				   u32 id,  u32 *clcnt,  u32 *resets,
+				    u8 *p_state,  u8 *c_state)
+{
+	struct ti_sci_msg_req_get_device_state req;
+	struct ti_sci_msg_resp_get_device_state resp;
+	int ret = 0;
+
+	if (!clcnt && !resets && !p_state && !c_state)
+		return -EINVAL;
+
+	req.id = id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_DEVICE_STATE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	if (clcnt)
+		*clcnt = resp.context_loss_count;
+	if (resets)
+		*resets = resp.resets;
+	if (p_state)
+		*p_state = resp.programmed_state;
+	if (c_state)
+		*c_state = resp.current_state;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_get_device() - command to request for device managed by TISCI
+ *			     that can be shared with other hosts.
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_get_device(const struct ti_sci_handle *handle, u32 id)
+{
+	return ti_sci_set_device_state(handle, id, 0,
+				       MSG_DEVICE_SW_STATE_ON);
+}
+
+/**
+ * ti_sci_cmd_get_device_exclusive() - command to request for device managed by
+ *				       TISCI that is exclusively owned by the
+ *				       requesting host.
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_get_device_exclusive(const struct ti_sci_handle *handle,
+					   u32 id)
+{
+	return ti_sci_set_device_state(handle, id,
+				       MSG_FLAG_DEVICE_EXCLUSIVE,
+				       MSG_DEVICE_SW_STATE_ON);
+}
+
+/**
+ * ti_sci_cmd_idle_device() - Command to idle a device managed by TISCI
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_idle_device(const struct ti_sci_handle *handle, u32 id)
+{
+	return ti_sci_set_device_state(handle, id, 0,
+				       MSG_DEVICE_SW_STATE_RETENTION);
+}
+
+/**
+ * ti_sci_cmd_idle_device_exclusive() - Command to idle a device managed by
+ *					TISCI that is exclusively owned by
+ *					requesting host.
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_idle_device_exclusive(const struct ti_sci_handle *handle,
+					    u32 id)
+{
+	return ti_sci_set_device_state(handle, id,
+				       MSG_FLAG_DEVICE_EXCLUSIVE,
+				       MSG_DEVICE_SW_STATE_RETENTION);
+}
+
+/**
+ * ti_sci_cmd_put_device() - command to release a device managed by TISCI
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_put_device(const struct ti_sci_handle *handle, u32 id)
+{
+	return ti_sci_set_device_state(handle, id,
+				       0, MSG_DEVICE_SW_STATE_AUTO_OFF);
+}
+
+/**
+ * ti_sci_cmd_dev_is_valid() - Is the device valid
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Return: 0 if all went fine and the device ID is valid, else return
+ * appropriate error.
+ */
+static int ti_sci_cmd_dev_is_valid(const struct ti_sci_handle *handle, u32 id)
+{
+	u8 unused;
+
+	/* check the device state which will also tell us if the ID is valid */
+	return ti_sci_get_device_state(handle, id, NULL, NULL, NULL, &unused);
+}
+
+/**
+ * ti_sci_cmd_dev_get_clcnt() - Get context loss counter
+ * @handle:	Pointer to TISCI handle
+ * @id:		Device Identifier
+ * @count:	Pointer to Context Loss counter to populate
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_dev_get_clcnt(const struct ti_sci_handle *handle, u32 id,
+				    u32 *count)
+{
+	return ti_sci_get_device_state(handle, id, count, NULL, NULL, NULL);
+}
+
+/**
+ * ti_sci_cmd_dev_is_idle() - Check if the device is requested to be idle
+ * @handle:	Pointer to TISCI handle
+ * @id:		Device Identifier
+ * @r_state:	true if requested to be idle
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_dev_is_idle(const struct ti_sci_handle *handle, u32 id,
+				  bool *r_state)
+{
+	int ret;
+	u8 state;
+
+	if (!r_state)
+		return -EINVAL;
+
+	ret = ti_sci_get_device_state(handle, id, NULL, NULL, &state, NULL);
+	if (ret)
+		return ret;
+
+	*r_state = (state == MSG_DEVICE_SW_STATE_RETENTION);
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_dev_is_stop() - Check if the device is requested to be stopped
+ * @handle:	Pointer to TISCI handle
+ * @id:		Device Identifier
+ * @r_state:	true if requested to be stopped
+ * @curr_state:	true if currently stopped.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_dev_is_stop(const struct ti_sci_handle *handle, u32 id,
+				  bool *r_state,  bool *curr_state)
+{
+	int ret;
+	u8 p_state, c_state;
+
+	if (!r_state && !curr_state)
+		return -EINVAL;
+
+	ret =
+	    ti_sci_get_device_state(handle, id, NULL, NULL, &p_state, &c_state);
+	if (ret)
+		return ret;
+
+	if (r_state)
+		*r_state = (p_state == MSG_DEVICE_SW_STATE_AUTO_OFF);
+	if (curr_state)
+		*curr_state = (c_state == MSG_DEVICE_HW_STATE_OFF);
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_dev_is_on() - Check if the device is requested to be ON
+ * @handle:	Pointer to TISCI handle
+ * @id:		Device Identifier
+ * @r_state:	true if requested to be ON
+ * @curr_state:	true if currently ON and active
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_dev_is_on(const struct ti_sci_handle *handle, u32 id,
+				bool *r_state,  bool *curr_state)
+{
+	int ret;
+	u8 p_state, c_state;
+
+	if (!r_state && !curr_state)
+		return -EINVAL;
+
+	ret =
+	    ti_sci_get_device_state(handle, id, NULL, NULL, &p_state, &c_state);
+	if (ret)
+		return ret;
+
+	if (r_state)
+		*r_state = (p_state == MSG_DEVICE_SW_STATE_ON);
+	if (curr_state)
+		*curr_state = (c_state == MSG_DEVICE_HW_STATE_ON);
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_dev_is_trans() - Check if the device is currently transitioning
+ * @handle:	Pointer to TISCI handle
+ * @id:		Device Identifier
+ * @curr_state:	true if currently transitioning.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_dev_is_trans(const struct ti_sci_handle *handle, u32 id,
+				   bool *curr_state)
+{
+	int ret;
+	u8 state;
+
+	if (!curr_state)
+		return -EINVAL;
+
+	ret = ti_sci_get_device_state(handle, id, NULL, NULL, NULL, &state);
+	if (ret)
+		return ret;
+
+	*curr_state = (state == MSG_DEVICE_HW_STATE_TRANS);
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_set_device_resets() - command to set resets for device managed
+ *				    by TISCI
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ * @reset_state: Device specific reset bit field
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
+					u32 id, u32 reset_state)
+{
+	struct ti_sci_msg_req_set_device_resets req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.id = id;
+	req.resets = reset_state;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_RESETS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_get_device_resets() - Get reset state for device managed
+ *				    by TISCI
+ * @handle:		Pointer to TISCI handle
+ * @id:			Device Identifier
+ * @reset_state:	Pointer to reset state to populate
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_get_device_resets(const struct ti_sci_handle *handle,
+					u32 id, u32 *reset_state)
+{
+	return ti_sci_get_device_state(handle, id, NULL, reset_state, NULL,
+				       NULL);
+}
+
+/*
+ * ti_sci_setup_device_ops() - Setup the device operations structures
+ * @dops:	pointer to TISCI device ops structure
+ */
+void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops)
+{
+	dops->get_device = ti_sci_cmd_get_device;
+	dops->get_device_exclusive = ti_sci_cmd_get_device_exclusive;
+	dops->idle_device = ti_sci_cmd_idle_device;
+	dops->idle_device_exclusive = ti_sci_cmd_idle_device_exclusive;
+	dops->put_device = ti_sci_cmd_put_device;
+
+	dops->is_valid = ti_sci_cmd_dev_is_valid;
+	dops->get_context_loss_count = ti_sci_cmd_dev_get_clcnt;
+	dops->is_idle = ti_sci_cmd_dev_is_idle;
+	dops->is_stop = ti_sci_cmd_dev_is_stop;
+	dops->is_on = ti_sci_cmd_dev_is_on;
+	dops->is_transitioning = ti_sci_cmd_dev_is_trans;
+	dops->set_device_resets = ti_sci_cmd_set_device_resets;
+	dops->get_device_resets = ti_sci_cmd_get_device_resets;
+}
-- 
2.34.1

