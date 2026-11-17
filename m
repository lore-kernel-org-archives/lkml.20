Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794904454;
	b=JtZNNZ4r8u9CsEhWG7vp5GhmPVbpz/qWuQtIYVqSkdoIRbUVJJMGa0DSIA9jHHxMVYNf
	 +rBUnzwLU4bCQI2GMf1TiXVh0+M6Gvn2gD9zSXrwykwYXJ3dQjpGwr72WdnTPXW41CspD
	 e8ZfgRXvs9+V6wedUocCXPiZRu8Iw2EQwV6Q3Uikc4cIaCr5/nfMIWP1iLlBAtLX5DcKU
	 tiY9+w85Jiul2KelHpEHVvA7/27kDY7Jzm5cQNp4GtN0u/f55UFMeADIHkPdPaCANW07J
	 AR5+bh2vwQUCwKEDPSVAqxgI/GDDUrzvLyx2rVbemI7eOsS0Aw1xMc1p48X9tXkbtmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904454;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:CC:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=i+cbThRTNxjogyv/ww4TVY1liYXgI6h7G9/7+Mzzb+Y=;
	b=vCwEja9/WrAfnep6FopL7/Hn2CujeQ5EuXP1XtfgyRgxNRoSHOyqcAEZ9R//VSM84pdN
	 mteROZXx0Z+HZxuLoIzg8OAePyh1lxYCGam0VgcwsZFSw27B1iqCLIaZ/KPU8XInzZsKY
	 CFAbo9x9A5a4mf/habWAx4zpSeoviMZ0rZKQl4XxZLsCXn4jFdT9BSuTf7xU0QHnM6tld
	 CLFNK3Cv2JtFTxjT0cPFcAS0han6EspuXu5uk3nj2K6tGB+hnMVNxjByv29HhP1/4MhHt
	 8Yp7jFDUaK4BSs7ml2DzYsHeM8LOTTquneVljkxMbtQW9OXkYfH0cmX1oNlrVCnze3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ayUx2cCu;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=nmKMi2L6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C479A606A8A4;
	Tue, 17 Nov 2026 08:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C479A606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ayUx2cCu;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=nmKMi2L6
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH7vI0D2497886;
	Tue, 17 Nov 2026 02:33:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=i+cbThRTNxjogyv/ww4TVY1liYXgI6h7G9/7+Mzzb
	+Y=; b=ayUx2cCuodKSwbYwo6N6U++bSGMHruDFJQ7UUcm+AFRCW+qQ3pmZdP0zs
	XbVgSjX1h5cA7plx7ZLWVGUVpGPH+klq5LaMbk1NB7+uEZUpgr7qIT4+dmL0PzQN
	mvAv851kcx3ioH6X4ETCvV9RlP37JzZqCjPxgL77KBqNasK5mzOr7oPDLK8JQtZu
	5YYvQKHYKRyH8G9YAk/6ibDLLHLT/xwKywxWK0+3K5LML8tOia8uQmGF8pA9EtnB
	LR/cWT0WlZYQTmUIV77mEmPNeQmFeYWMr8ddcyoocNuNAqVtzZRryoqt5ihGljFn
	Z80nq4YRQ6CpMcIw+/rg8vlrDLn3g==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012059.outbound.protection.outlook.com [40.107.209.59])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j0cbja72q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 02:33:52 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8cSid9pI4AoVniu/1Q3bokZ1t3NeZMnVy2npj0OZOD6RKoGpKGGNYAv+X1V2Pc85p5NrL1XrhR6ASZCdXswGO4QIzFRDoHE8b3+yPBDjy2+NmLcEx3v27+/MNSM/Cd0wpT9DFlqy0hZM84/EyuiPWU5hd9Oouq4tIYfOIa2DBHjhL9KtUpVZel15dP+p/19SZ4SQeth5CyLhKVv0WzbL+DJteVwJF0J+fudQY+qszQFVvxDBOSxAHH0IL3kaKsjxlORi9unx8sar42R7ZY4BJYiF9UnWSfi8gcmp0VvclAWSwvTU7cOK3N6h3lgzdxkuxOBRYPQH1R+uGIYYrCFPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+cbThRTNxjogyv/ww4TVY1liYXgI6h7G9/7+Mzzb+Y=;
 b=xuTgPUuY76xLl2iFiXHYj0J70ToEeaeRfHFZelePEZvuStBxq3O2UDEliG371kRn81O+J+yFmOQe9Tfe9Pxlm9qj/qMnAiJvxfUghNoXg5MhsUOaEjsgHSUDV8dxd2+B1TYFRq+uuEpzlfJpSQoP2ihvwJ/GTPvxpXCfcTHL4T7jYI3Scb7CGuf6ByvcZdWMnmIqK2TSetT6xSYLhmmpxqGQA6+M0nXDzg2Z4x3wZGvhJIkoKj8WWWq/4Pa9hSIMJtHpkoPyzivp1y+GYkx88I4+0ZoIBLbQhRxylPR1rjVHTJKfu7dgELtIotfmf8rNY5qsVjr+aVWw0DcmjkaLzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+cbThRTNxjogyv/ww4TVY1liYXgI6h7G9/7+Mzzb+Y=;
 b=nmKMi2L6IOPsxjYm26bIacxAX0ggMst3jAi1oJZudUzTlHQlbQgvpgk9fb6C9HMe1gqaXcehab0kEohgPEff8mL911hkz/1OQp6BD9vIJ1YN632cEoQ97gNeZHaheHF/9jCwUcfb/jS1sO9tDQAmFhh78LZ0MI0NQ2NYj7KNsm8=
Received: from SJ0PR03CA0214.namprd03.prod.outlook.com (2603:10b6:a03:39f::9)
 by MN7PR10MB104148.namprd10.prod.outlook.com (2603:10b6:208:637::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:33:50 +0000
Received: from MW1PEPF00018892.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::12) by SJ0PR03CA0214.outlook.office365.com
 (2603:10b6:a03:39f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 08:33:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MW1PEPF00018892.mail.protection.outlook.com (10.167.249.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 08:33:48 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 02:32:58 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 02:32:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 17 Nov 2026 02:32:58 -0600
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AH8WqE23540590;
	Tue, 17 Nov 2026 02:32:53 -0600
Message-ID: <047068ff-1a5b-4051-bb8c-5c781c6de0d4@ti.com>
Date: Tue, 17 Nov 2026 14:02:51 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: soc: ti: Document the
 ti,tda54-mcu-scm-conf
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <vigneshr@ti.com>, <afd@ti.com>,
        <a-limaye@ti.com>, <y-abhilashchandra@ti.com>, <johan@kernel.org>,
        <kees@kernel.org>, <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261112091027.1601122-1-m-shah@ti.com>
 <20261112091027.1601122-2-m-shah@ti.com>
 <20261113-fancy-trogon-of-saturation-16fc66@quoll>
 <699420d5-28b8-4238-8fc4-3a4e762265ba@ti.com>
 <a96974a6-fc56-4e05-be9e-9eb3776cc4fb@kernel.org>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <a96974a6-fc56-4e05-be9e-9eb3776cc4fb@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00018892:EE_|MN7PR10MB104148:EE_
X-MS-Office365-Filtering-Correlation-Id: cc203f40-6463-4709-50af-08df4485804b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|10067099003|56012099006|4143699003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xLzC5wCZnTLHwvEeJBCyAX3xeWqJVR1Vpp8JNUzF4osy42SEVaBzmqSfwoi1I2BxBx9kGoBxllPuLerncPWEsDDPH8fcV1bR+ANV9TP42uc+DWwAN/zxhGuO2+b4rLQJM8DK+B2xcqPNl6qNUXAlLtPcOV6ugzJcIK1VgvT6KPHG1uJKdw3zI2K/XhGSuEC6UAfZYZQp8jk0W7WAK8xlXBEqHZb/IgZP3tT/xLLvQmNsy5pj+WJIQ1YNsTwj/nOpMg67MwC4dLc3B6dR1O5ZizoE6hmkdeqJ5WfXV1lC7mparxQ7HY95+BcvSnGqEpxZSygWN1fUlzOnNDbseYNS3MhzkbYrw7s1L3VtuohxqllROlBt4xc/bR2s+QrBEMYMoVsHajtU124QFHK2kRoFMThBNdpGpSoIHntMl7lJgt3jIrT7mxNQCtP2f15FvXFgJx9Dbi+3qoCdQ7UKNbMJawBNJhoDAmXRWn3lAsovTsre5bd80r2qu1xX0jERhk/hTiVH0eLq1A5NFgGFP2mqGyo/9HdOhMekd3wnNP9Xeec5s6gbbheYjbNBoKgDh7v6iofqrknhmyuN8jI23XxlizctE37Tb9FsfRr2zIwVur3ZSMyvjiFhFOsFkTDyIurVRG3BKzBlmmI4adtxhoYoClnbQcquCMH3THRv77homb7xylDqimsrP0H8zBrLSYX/UCm8zFdJZZnf1qKju1zbag==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(56012099006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IRWgJBGoLkq6dltXplLDKIoQTvqb49tMiMYgFkCzLRoHF3CIGCV1zFYPCRNuUBrL2MKYWF8T0OM8Z7T/A9j3NN9ucVXyizvvnFcC0ZpTKmrl9WV9L0+vyWg5jM+yZMVS+VuQjWT0Q6WHAccC522alVwGDiW9qPo6uRhBDgEqIHeOFFXzzlanKqwYGTlx4TA8QZ5WO4vUDC2hJjgWW+oP4tNeIu0dFhyyArDrY7xl/38NvWiiwusflGnxCi4ICCMnAgvUdxvKplNGVGeUSIbz3UA9n0W1EN8UD5mRXp6l9hSM5uAdV8LeHp//sRKCIGNVrj9Of1t73iMk1XG3u6NB2c7vWJnc0I+PA9cW01tp7yG8xY+bP9Hy2PtKn7+BSIDnTrAyG+St7s+uIGiCq5cqoygeimamAQlz2lCm59Ou/j4tC/2pon9M64O5h5MS2iUO
X-Exchange-RoutingPolicyChecked:
	RSVTUHqkwhM3BtokaaxWpFksgupxl6tLJMqgECjbCedOUJI4wsKL7STtlTcbVR8LOVymyMT+mZlJPlnczBMxnBblh0kX9tybogCq/D7eqVRMzBHukXXAb56cd0kAvMb3oxD13PZS2a4q4alrB0HB660Y9whL5BWl3DOrT63FiF89NSH0oCcc1vzPvTpzwREauP2LMbugh+IqyQIwYLZBsm7K0c6aysQy7v1tK0NOnztPwH5NkyHahNDn6RXZy5rJV8e9a4bpeue+JcFn9eRlfkiI4ZllJJxijT09wjTjes/hoCYY61mmY/fMS6E98fsuJA/AnKrGEoM9vNStKvCa5Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:33:48.2292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc203f40-6463-4709-50af-08df4485804b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00018892.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR10MB104148
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX15uF1xN/TcbV
 OcRZNv3Whcah+qCjfDU8mtiH7IAogcZHZk9g8LMJLH4bZ0n9LgrAJFpajBvCmKVq+l64GIt2tov
 rh+boGC+/cQVllOH2qPrlieTzv2UuuopmxswECCkIRtSTE5Zyk7f40ZnGj6cRqwpKnUy4Hwh2IW
 Ctb2piJMGwqh640PF6HIFFwDmc9RRpXIrrszZLdDqb870WXnvAqRZ8nWsAa3R/uJ3H13M3kKxW7
 8SdJmLhG5w0P3WVFk62LRSooXNy2YGah/t2ZcN3xNInhazxebDX/agfZaOANMswkTEQy3haiFBG
 6hUTZM7Tf5x4bkk3KEHPeoYsU+9W99oMgXyFcRozsUpNqq6gG4kB+T2q/hDCCiqje3N5nmhdthM
 SlxdPoA1Se49NjrRx6EQLjc1difo0Q1SKcfBxwLTWZja0Lb9qQNU08BooV3nIKzXQVGql/00hdR
 xkjgPixPt5MOlEsKjBg==
X-Proofpoint-GUID: N8nle48fHryavImwJoGMRZJpTJPbItyA
X-Proofpoint-ORIG-GUID: N8nle48fHryavImwJoGMRZJpTJPbItyA
X-Authority-Analysis: v=2.4 cv=F7fC5ahN c=1 sm=1 tr=0 ts=6afc1170 cx=c_pps
 a=e24IK3jsPB00aLvKg+wNHQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=i9cz-9LAP14kPR8UPK0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX+dAFXsPUm7Th
 sf+b73bqO91bPdn2nqmChSO4a/zdt7TZIsUe90Y8l5FupVCkk1mPmE2I8ELglXt44RCq/W/Q7Qj
 K4+lQK3dBubLi2CVOXn4CGc67Er6D+s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170033


On 16/11/26 17:52, Krzysztof Kozlowski wrote:
> On 16/11/2026 12:33, Moteen Shah wrote:
>> Hey Krzysztof,
>>
>> On 13/11/26 13:26, Krzysztof Kozlowski wrote:
>>> On Thu, Nov 12, 2026 at 02:40:24PM +0530, Moteen Shah wrote:
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  ti,proxy-id:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    minimum: 0
>>>> +    maximum: 7
>>>> +    description:
>>>> +      Proxy region (0-7) through which this node's clients access
>>>> +      claimable registers and their fault status registers.
>>> Partially continuing discussion from v2, IOW, device cannot access
>>> entire address space and you need to limit the address space to specific
>>> window of it? At least this is how it looks in driver code.
>>>
>>> This looks like the MMIO space is wrong. Listen, if you claim that the
>>> DTB represents the host (or VM) view on hardware and based on that you
>>> add proxy-id property to restrict the MMIO, then why do you claim that
>>> entire MMIO is correct for this host (or VM) in the first place?
>>
>> Thanks for the review, I got your point.
>> One thing I wanted to clarify before sending a revision: a nonzero proxy
>> sets a bit in its CLAIM register to claim a register but for proxy 0 it
>> shouldn't be doing that as per the hardware. If we choose to use proxy
>> 0's reg window we just have to check if any other proxy has claimed it
>> previously or no. Are you fine with having a property in the binding
>> something like "proxy-0" or alternatively "ti,claim-required", because
>> the driver won't be able to makeout which proxy it has the view of.
> Dedicated property for proxy0 is fine. Maybe not calling it proxy-0 but
> express that this one is shared with others so first you need to check
> if it was not claimed.
>
> But OTOH, can't the driver make the claim if if no one has claimed it in
> every case? IOW, why for proxy1 you take the claim unconditionally, but
> for proxy0 you check first?



Proxy 0’s CLAIM bits are fixed at zero, so it cannot claim a register. 
The driver checks CLAIM_STATUS and writes only if the register is 
unclaimed. For proxies 1–7, the driver requests a claim by setting the 
bit in that proxy’s CLAIM register, then reads it back to verify the 
claim. If the bit is not set, the claim attempt fails. Checking 
CLAIM_STATUS alone would not tell whether the claim is already held by 
this proxy.

About the property: does ti,unclaimed-write-access sounds ok?

Regards,
Moteen


>
> Best regards,
> Krzysztof
