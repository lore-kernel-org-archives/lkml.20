Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297622;
	b=oH1kzj0Wfej107z7uPk7yVUoZQbvbIDUEP7FvCth6FgXlPuyi4nx3I3mB3TF/3q0BWYq
	 FBc68vDp+YH5609zLswk/1UQ4EH8A/8S8a0VKdRT/1eW602BXfPdHMrSIYawv76XMMEIb
	 6HCxYdMVUrgID1dW5HffCU+KXZiQWTvUqSFcTJUA5bzrX2C/vVUq94EtvAV7Bz2RK4Ydm
	 iYISBsVbSUZTqQLibrkec5+tyTL1TPYTusxp5pMT/OUaJSK3BIK5eoXGgj9z9QEc2SaZj
	 DjMn/WLx2iw8WtU3TGwusq0bqyumdMKTqjQL759k/kP6gcfRnWa2qlAN4fjdJkQsO3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297622;
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
	bh=o6ddcHmtw3v99+x0t2J4EZWc6j4FvBFoD1Jo77E7low=;
	b=E+enCw9i7rViyDmVrXKcJdv827e/XP8743DuteOTyw1LfGAIZ7AcyEQr9NpxEGSxAlrb
	 9VUnefTu4F/E/X1lut5L0aJdOtsQjNFTNNyFqIZXyxwVonOy3XjUDcYY7GdwUJKWGq20v
	 5cALk57hD/vEk78++kpC1rqT+6GbJ4NT7jhwDsip1MT/nmh0WamGYJsdq2gVQD709F8qG
	 bzpEyUkt20cblTnlo+01h3KoAtl90SZpoCxH13zIrhcPSAxDmpw82SDKZOvYMur6FnBPJ
	 lj/zllTLvBMxG9ULas2djDfM4eU0a8uVcJq3MJ3AGAGPOKFcSgt10x2qr6oJTom54Fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=czLnbiDi;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=lQArSvEJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DB460A2601
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83DB460A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=czLnbiDi;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=lQArSvEJ
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69TGDVcT1079174;
	Thu, 29 Oct 2026 13:13:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=o6ddcHmtw3v99+x0t2J4EZWc6j4FvBFoD1Jo77E7l
	ow=; b=czLnbiDibHTNtWzYw0yUXljXxeLl/wgQlRFja6UhaHFXqGLHqq/9ay/WG
	Pn8kVALDUyZvMi1LV8HaKvT670+pQ8f8GYVXKbKP37aZVaqvaV6PKfaWtQFN8y6D
	BnmxbwCWfMb+awuyGQSuQoG7I6QKIain3kbVj/015VMy1TZ22gcDPLBXlC805GZa
	IzjqPFN4DVC62qpbfdMF7zgqQVQNBsd3ZJjfv+Dz/6XjiMCR/mCtmR/ch7vGecEv
	NvrnXrcG7nKe4a6paAkZY7VkYe3gxCSVQjRuaCuMEJWe0ZKU7/vMoVcufMgocD5v
	kYBJ4RLRfMgKhZxfvSUYJiqGLi0Mw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012047.outbound.protection.outlook.com [40.93.195.47])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hkurvxas2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:13:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZl6KFCtqyhKIG7hb3TzHZG4vgFU2XC62MQbjLqMHQleN3fHYRV40zGqbXItaIUby7ls6y+rWOw+XtNIPHTjwng73ZcQ7FbfG6Kp2SJY3bxIzQrOGs0fS5fbEPiZeRj6nqxdGekwhKgb1fZTQJYhtxAUmfEAQEwjeUlB8/g5IOrRLdvLoILyol4iYf2EGyIQUTCaqAfllHqXHy66TIG3ktdApjLe0qyMmJzJcHUx/0yrNOOz0vDQYtKsO4TsF64KYheFwJZ+RqrkQYUD1UnyNVd7ohnN7RrzZIgNJeG0YbXaNtCmqlerWBDefNz5jnCbwH5Fb4PkOmcZS60/aNI2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6ddcHmtw3v99+x0t2J4EZWc6j4FvBFoD1Jo77E7low=;
 b=AMLaUW+hIOoz3/dDeC8u9OfIz+PIejHbrxtg4JJSTI4Ve2MJBVn097n7qLH/qZ/ydvXA94vmfzxrxtr3Bw/8GcbAYj4y/c2OGbbuq6YYWH4SGzEZ5gbBa2Kn+1Z1bRY1OKUB0r/w6JAEsqleRDdccic9wRAm2iRa+d5Rf5uVkfstQmEuRBRQLOs2N9Xw7rXnyMzj3aOqWSqefYNDJnVKqmTvLOiKlwwUcHP5RCcfZzsX2WT4gV6otZTpLdGWgN1io8VfTFkos/fZlL1MLcyyK88UhfA0nJhPoJ98Y4nuiDhxIdevG7JcLezmXfTjGaw0kOf+x2jysyFfYdIsuq6owA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6ddcHmtw3v99+x0t2J4EZWc6j4FvBFoD1Jo77E7low=;
 b=lQArSvEJeAw2jz+S5F4zuqZkURKREwl50t+iu/ZgKoTX7OVfhj3kG1lxEZC52YyzBQyfRo8OGh9HPf91Yh4jUQXqHSynWd8cBKRtwf9Rq9Au4o34kMQhZtRH3JaDApF9XRxSvmcCmz35jCrq4EB/qJBOzNivGE6UXNOMqnwkMIU=
Received: from BN9PR03CA0438.namprd03.prod.outlook.com (2603:10b6:408:113::23)
 by CY5PR10MB6166.namprd10.prod.outlook.com (2603:10b6:930:32::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 18:13:32 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:113:cafe::65) by BN9PR03CA0438.outlook.office365.com
 (2603:10b6:408:113::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 18:13:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:13:30 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:35 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:35 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmME3408718;
	Thu, 29 Oct 2026 13:12:32 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 14/22] firmware: ti_sci: Do not export reboot control
Date: Thu, 29 Oct 2026 23:41:39 +0530
Message-ID: <20261029181147.266771-15-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|CY5PR10MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b304d4-51c7-448e-0fb3-08df35e8565a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|261009223027099003|261021123027099003|261026121527099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	pqALgLU3/fMQkcmKYaud/P36z6hF5NQrFClGtzBAI5zi98t86CVrsHRxb03unk54p9WLDTAAu9SR8bR2lp0WRQBzCvXVNEzrhl6dr7FSi4wVbXeOS9Ns5WkZhYcd5mL6JZphFOvZhj9eeEuadCCDSu/OetqM1Wy8nkJvVXij7tDTarls1oPCtWd4oS7tiFz0DaE0MRUrYtcqmh16V8+SV+07T+zRTHGpNmYaUKNFl6zEA9eZ3nDErUTF4/Ftkh3YXQszseW0s6CQarZ2bINwZC3PwSo4EEc5ZUSVPwEbIeHnSibEdeHN9s/z+TXRLTGx43vm6akCFUgoMB9+nJS66N1se5CpIhd4tRg0oGHZ/0chiAvwI+dESTvl25ddJlO1TFjtgsS9hfAMfya7dBEYdwlLAtf5vtDtbJuKkIdaGa7ON+BTqLvSnCRlell7aqtenopct7P9Awn7fDxJ/8XRr3h89AmL4nLjwQ3GtheKFt1zSiZavs71sc8wjB8ZxsvLMkWJ9BsOEFvKJXSGo8LujJVxu7Ro7VyLiT9coK7j1EPVonqTQWWcHxvYH3QfZOEWOLkUYWlUivNr3avwkX6OtzSUmeFmuX5fh6n3rXEjFE1yjlTX/HE70Ix+ddaIkn97UgR2hEu++CloLqI+PIHRKbXrmDCsuKx8bnJ3u2Vmrzs=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(261009223027099003)(261021123027099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bRdGUL/m62ulvAvt3TZ5sTaxVreJaN1NZxAt4vrUjhmqT4FYIlMNsDY4RbiYt6V2m0xy26Ha4g3wYotGAGpyuuFux2ufQrdZbI6n2mG2eUcR714zwqooZHIXoWmNAgQbn2bdnbxza20h4emDPhXbMTRdLGXadqXmT4aq2OLcQWbEg45UbMGSh7H925AomhPWjeFYupmm6cI9eo93l55TALtlnt3h1mRRO+Ct1Znen5DHSViextJqRIXDDV6ze/ixY3L7oYGTSq2DW1XmVEvJErWfAL5TUeA+c7zhfDe4+wnl8nNAKutE/+pJhMDchD5CgU4LhaSy2VeFDaS5DbK+qArQO6Ttj9tDJzD0uzccbAMEcnUgTmYbLo64oogXx9iCtx4WKsOZGJS59YUX1PVS77CbF4TryAkH9WjldjDqrXxNKV2uoSg6tEuAaGpRQOXn
X-Exchange-RoutingPolicyChecked:
	20y+xDFzrimmAeshb3Jss5MhDHUYBPagqwkfH9/0Ca1wpWoiJvwmDaW8bDC02A6QihbgA3yCPAlaSNN7Untnlci7PS4swawnO240rSFYu5V/efwNtr2ikyuRXRzJGsOCnUzwYxFxLY+Qqa5moNYtqp27YHvf9pSpvvGbmoYBIx2Q/gQwqPJx3ErZsK7q37W9eNAr6z4ntWv9j+N2gL4QwyzbEUNTa+VaII77ktGXJ4bU6q5qkWAhZhpSvww1zOp1PcD8x1v+OP4k3tw2uTKM4RrAz7m2rZ0+Xb3fkZtBnqrAUxmo6/Novpea2445gQeY7qGDqz2cXrk7UIyB582sfw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:13:30.6080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b304d4-51c7-448e-0fb3-08df35e8565a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6166
X-Proofpoint-ORIG-GUID: DUDAQsh0HBMc5V33TOoC1ZD7hpJ8LlHh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX3ncYN/EH4vMf
 dEIvbJRVPnLj6NyU+oyvAK4+KDz00wi9JO0hjGhnEmTi6HU9bqXuVy35qdu+6StLx5a9FMK3E58
 S1wm/jfNlOC9vWCyUHnc6BLSUbATGtOKt/yMR6dxcVA/n0+jyv2j/41PXCydXljjjcGkW3ZNQ66
 yPddM6ynzMJmBfZr/tjMJk8EJz+lOiW/PRj1ZK+dPF373/GiPIMVU6m2qQpzJBDPMr0Gk859Zpk
 +UqdX7Q7WoSucFV50jWTdpuke4yFjSnv4hjgQEXq9COG//XUeePPdImMx9/RiF5AfUvs2C1eUyF
 RngFBSdZj5UyAw2j1QDPzQX612F3CYKO1LBjs8qCoKisD6ykeloT3O5JsqfdEOXlfE+kQS5Nb3X
 2pNHmTqUu8Nec62QsqoSlN75ZcLgAHOgx5tBekvzhZ56r4SAWWGglrGl+IEReUPJ99qWOCDUCmA
 U9WkbcxACQT4PxYTo3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX5d4G7HqFX2uz
 eAEgGXD4nLECm8BUWxSSj65xCUWJgX2WB36pC7HBfJHXOzo6zy46yuIt2UTgiM4XUoHHkgbLgCY
 BHX5GXW5YxhFpOnspQ7vMT8UyWVY/LE=
X-Proofpoint-GUID: DUDAQsh0HBMc5V33TOoC1ZD7hpJ8LlHh
X-Authority-Analysis: v=2.4 cv=DtrDa2/+ c=1 sm=1 tr=0 ts=6ae38cd1 cx=c_pps
 a=9cGrGZFDAlRO1ZcMJRSO2Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=4y9GCjRDMv2ZYqE5liQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290071

From: Andrew Davis <afd@ti.com>

This function is only to be used by the TI-SCI driver itself through
its registered restart handler, exporting this control to any TI-SCI
consumer is not needed nor probably a good idea.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-15-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-15-b-padhi@ti.com/

 drivers/firmware/ti_sci.c              |  3 ---
 include/linux/soc/ti/ti_sci_protocol.h | 12 ------------
 2 files changed, 15 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index fef7028d40e39..d22686f9346ea 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -2567,7 +2567,6 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 static void ti_sci_setup_ops(struct ti_sci_info *info)
 {
 	struct ti_sci_ops *ops = &info->handle.ops;
-	struct ti_sci_core_ops *core_ops = &ops->core_ops;
 	struct ti_sci_dev_ops *dops = &ops->dev_ops;
 	struct ti_sci_clk_ops *cops = &ops->clk_ops;
 	struct ti_sci_pm_ops *pmops = &ops->pm_ops;
@@ -2578,8 +2577,6 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 	struct ti_sci_rm_udmap_ops *udmap_ops = &ops->rm_udmap_ops;
 	struct ti_sci_proc_ops *pops = &ops->proc_ops;
 
-	core_ops->reboot_device = ti_sci_cmd_core_reboot;
-
 	dops->get_device = ti_sci_cmd_get_device;
 	dops->get_device_exclusive = ti_sci_cmd_get_device_exclusive;
 	dops->idle_device = ti_sci_cmd_idle_device;
diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc/ti/ti_sci_protocol.h
index 471f5580787cf..d8efddc1d4ca4 100644
--- a/include/linux/soc/ti/ti_sci_protocol.h
+++ b/include/linux/soc/ti/ti_sci_protocol.h
@@ -27,16 +27,6 @@ struct ti_sci_version_info {
 
 struct ti_sci_handle;
 
-/**
- * struct ti_sci_core_ops - SoC Core Operations
- * @reboot_device: Reboot the SoC
- *		Returns 0 for successful request(ideally should never return),
- *		else returns corresponding error value.
- */
-struct ti_sci_core_ops {
-	int (*reboot_device)(const struct ti_sci_handle *handle);
-};
-
 /**
  * struct ti_sci_dev_ops - Device control operations
  * @get_device: Command to request for device managed by TISCI
@@ -905,7 +895,6 @@ struct ti_sci_proc_ops {
 
 /**
  * struct ti_sci_ops - Function support for TI SCI
- * @core_ops:	SoC core operations
  * @dev_ops:	Device specific operations
  * @clk_ops:	Clock specific operations
  * @pm_ops:	Low Power Mode (LPM) control operations
@@ -917,7 +906,6 @@ struct ti_sci_proc_ops {
  * @proc_ops:	Processor Control specific operations
  */
 struct ti_sci_ops {
-	struct ti_sci_core_ops core_ops;
 	struct ti_sci_dev_ops dev_ops;
 	struct ti_sci_clk_ops clk_ops;
 	struct ti_sci_pm_ops pm_ops;
-- 
2.34.1

