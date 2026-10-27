Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793090278;
	b=GRkyMy+nes/WN9Rj1kpwSVH/ukOwFskVfzz+89UL5/DXyeLsqeI6Nh3n8D5volkeB33d
	 EsSftpje9f5HrpFzP1DLXAwfQ+Psja0oJzuFw4Im9DuUjUNUEqbr+K7u9HN9HOFGbRkrp
	 BmlH9U/TSYZLZ1fgtntALfgqP77OP15H0U8gi/isKManW/uKknTyRbXLQ0kt5oDXlx0xK
	 0jUN2YKxeYS4YghjG9pH8aTT6XX086GrFRlZ2qcrGMKwZ3Rr/7/d9KGKsQmncLbV8O6N3
	 Pt3/VDWtr9HZIPfcs/CHOzdxoegWDGPhkFCK8GPrniSXnwx39AspGRVWbMk+vUfhhAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090278;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=21cKorImqIxAoOe3k0UPqCqrgwXzfOKOAMH49e1C3xI=;
	b=wGGZ/VmM+r1g6XngEw8GaHpEOOyv2LjiHpeUeN3AujSkc9Z06cIWh+QrZcFvZFpoHDfy
	 9r8LwbiVrChIW1suKduyv0Zi9H1wxnjtCdJ6Rt2tBzm/GiZtLQzce6tFaOPo0CueCqP4p
	 F8msMH0u7inLIgY6QYWVqy4pAz1ufdfNGp3qk1b5/RkTjl1OHyHKxO2ErH0U+juBenaXT
	 78w++1BHJ6S1SgA729+lV3OpHrMnxBJMtChdel15WLZXk/CaXlGxdedulvT6Ea1ok4fib
	 FqX9cWxy8PHbYjF4PsuhdzXvLFzxNkdR2uMVCkKg1qfSiq5WnSYt9qNUhn7mtPPyKNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b="qvhp4f/a";
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=AXgy8zxy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E28606A31F;
	Tue, 27 Oct 2026 08:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8E28606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=qvhp4f/a;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=AXgy8zxy
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5j4Sh485457;
	Tue, 27 Oct 2026 03:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=21cKorImqIxAoOe3k0UPqCqrgwXzfOKOAMH49e1C3
	xI=; b=qvhp4f/aek0L+AABJVWLTVi4JaLfVMcMrVOd3mAF0vpezzTLraO9DlwGh
	vW/qdMtrB/OWX9IsNwznDlJJkrqPumpSE6uAGqZDjISEx/4WOq/LOQe/dNGXHY7G
	HKoBsaafrkItIzQSlylAKkqD8GS/oCI1Ty8AFJ7rqPFcFVhh7DoBuHnif8/2uEC2
	PeB4FlQL5QH14TH/sfoedYsDo4NYLN803wsDB4GAt91q3A4ZJu9Zc09CvOwXo241
	8iJykaTFVzxR59W1Phlpi2df3Zyp+cYV4z1saQfXbTkCd6QtTUMDuNZPfuIEHRjs
	022gZ5R0i0ThogjsQatxcCVYbpkBQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hjp2ygy1x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 03:37:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sE7nRSQVopoTHvDkIu+ZpKF/izU7VOWU0eHEPEPX/3cMvjniQvdYf7rtfnzHfg7yLMXYB5bAePNz9vA9L3C8noRYIwYJpbxLYv4j3AjDJLwzEUgkEAgAcqlecRuEf6sZ/D0rZbZJkoqZGoI0GJE+uwALq7fTKTI5gvmP13QSngVKYf2GIRirHR+ulppxdh35MqnG5vJFPwo5vxnKWyYAzsuqqD3k3OTRoohy21E1w/rRAAzHcWrH/7kCCY0OLJ54znic4vaCE0bfMqFGDSkNOYH/mT6qgEOHdpSMIqzTsReXKduwG3t5xbkxb6eOyc8MAOKZ0ENTAwirjSJeMfM+kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21cKorImqIxAoOe3k0UPqCqrgwXzfOKOAMH49e1C3xI=;
 b=TMyKUeZ+yw+V1YMJooGyflIzA8DJYcAlaGjQSfFxCNMTeNE25YDLzAy4C2NPkJbLYi+cZApMNBY1JyMquCmOG0WcGC6o2u4LuQE/2ojeRRK76gHYzNzhWMpTUQDHiGXk26/dGb61B5XdyVM/JdqFpw0kgtuxSdj/VI6NWe4FLgJidVyjmkq4BzNBumRoSp6nwcl+sK4B0JgPXb/Fr/oPt4bt2buMEbRgOfGxO5XlYVhVDGg7UzwxhsMn2OrDIa64xYU3L7G/0UpTWk88d7KCBvIldoKw7+kMwJlqbepBePnxajHC7YlQEHhVAVSqRNKigXMcHP88fQ3Jp9n0A1rMsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21cKorImqIxAoOe3k0UPqCqrgwXzfOKOAMH49e1C3xI=;
 b=AXgy8zxyghIb83K9lHHUpwzwKwyzmNN6iQAjFUFQw6wx4Mfaxa9xFk7tQ9DWoR0lm9+hh9770ek8qu3bu7JZwUYg8gLn9oX1/6YQERHdahzaeV4XSxSn01ZW6tH5v4YNS3pqCRr7sjM5mxeJh8Jsf040o1aGgpHPfXNdd4tbjcg=
Received: from CH5P221CA0019.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::26)
 by IA1PR10MB6807.namprd10.prod.outlook.com (2603:10b6:208:429::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Tue, 27 Oct
 2026 08:37:44 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::ae) by CH5P221CA0019.outlook.office365.com
 (2603:10b6:610:1f2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 08:37:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 08:37:43 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 03:37:12 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 03:37:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 27 Oct 2026 03:37:11 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69R8b1hE1558035;
	Tue, 27 Oct 2026 03:37:06 -0500
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>, <johan@kernel.org>, <kees@kernel.org>,
        <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 1/3] dt-bindings: soc: ti: Document the ti,tda54-mcu-scm-conf binding
Date: Tue, 27 Oct 2026 14:06:58 +0530
Message-ID: <20261027083700.1964371-2-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|IA1PR10MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb02cc3-7d09-4c01-7f9c-08df34059193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|6133799003|18002099003|22082099003|261026121527099003|261022105027099003|3023799007|261022075727099003|13003099007|261009223027099003|261021121427099003|261026140227099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	KzPysc0GPZHvqb5WWW9MiJKiHuA/fP9lBWK/SijMbohNtJRsiDBN47WwpO+LrGckJSmqtzTN7ofMSPxCA+C/DobFHA8elLinEaSebId+f25SedNjdILxf8u+X+nlf9CUAE1iJ8TsqVuLp/PL1OSBG0zd5TXR2MD4J+Bhru4m6V6HXCP/k/wvJeo1MnBRJ2QnvwMllhvzYoVN4E3t2LalO8yPOjpKIu13SyLRTnlnAYd3AzNsK0SzRYuiTCdf5DZrqyXIAeN7WeoVYX6MoqEhIc0Yb7eSgHQjEK6ZCjpFZIoL38TTI5KgXAgcaHG+ZunOKt5wuXV3gs+UkpYDWb2ZoTYmXGaqcESUMfoKvAINU3CY1M4rv27sewBxSm8aXHsukkgV1vaYMW2lxvZs+0RICGxWl11GixXvTgZT/cBLrhaKvs/d+uqFJImmpRhmqy3w7ASA6SE6NU/FheBA84yMqw06ivvMcl6FG1ODfyLxxcDahlUim2jtPLzrJ0QTVk8ZUMj2ALpMJEO+ojwqZDYQT+woz4DYnVB4u+d3DwtkbeniN15yWhGCTHGBcqr1NktWB4WTbdNOt/U/ar6ZpQhGGqAVh7CPZdtDLSh3LzdG2DiWdaIltYcWtzXAjgz5C0JsIeHgX+dZmVwiNdZjBB9EnQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(6133799003)(18002099003)(22082099003)(261026121527099003)(261022105027099003)(3023799007)(261022075727099003)(13003099007)(261009223027099003)(261021121427099003)(261026140227099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dJ9VR9X1eVrD7Ork56lwuutPFBopghcVe+o1K2S4GgU3ol4I0k9uEsIPoPq22eAfdWP2ptDOe8M2vxFg1zs1ruS3LNa+MlDCI1+jCHTQG2A6RP+SLXoX4+q7u2TCMCRIcVZfHhcrTGo1Kh0G/bDdPzDhMRcuKjk9ai++nekz95s8SKodtBKHiQkZn5gHG07XM/nz+Ojuy3+M806HqeIQSXRrf3tFzf90Ex0iEAykX7FVltoAtYQQRUO2gLfs0M6N6bdy7lwAoJbhOfPlSisir72w2xS8MLFUyUotKzm5DuQRcYlPHdLvDU4uKcnrgneL6iRsGb8kPLZGCFcDY09MlnlH8DcOg4JUsmpJtNGxe3RW6R6Zu33K8LSMs+IU0A9KeB+6pCTZNhdLPG2eK+piONm+9XmrjWQdBNge3TQ1iXlKVSL15BLC9u0tjs7cLWzl
X-Exchange-RoutingPolicyChecked:
	kUQ3DX3DVBnQSZLUWpKGjN0RP6NvnUgD5+NCiF2yJc86SoFah1s0+4mXU/YT4uRNBc7GkpMZ2FSzI4jJAZxBN/qDH2uMAgZuJIpkoLlLOkOOwHKolzVUV7LbHfg/Ub73iOyzxXaipWOOworC8nMlqFDaRC6yi8DzXgWPf2sc9VSIJj9a+8T5Kw95dsBWuvPXsRJLw/Iflt26mqoEhVJOU9epMRChjAIHYCNjBC0seKMk+E26bud9swdPgOC0K7X/JJzj4sLZkGwqHWPYRhKeVms7RIOB3Eh4pRiKZik+7InjYUVSq8KbUXzHOJ2U4NOAt84M2hqpgp3kIonT2eppYw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:37:43.0790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb02cc3-7d09-4c01-7f9c-08df34059193
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6807
X-Proofpoint-ORIG-GUID: EEoezybHesm5nhcLOhWGT5ELyUzedIHu
X-Proofpoint-GUID: EEoezybHesm5nhcLOhWGT5ELyUzedIHu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX/seAPigBP5S6
 GrZS6uu8aQKiFLimffpsYK2ICP769shLhYdnSyxb2EMKWiT+z1svdccTMK/jC6UKjMP70sgcS0F
 hJPageTTyM6aQ0QgVbFqufOLaZzvG8v3i/Tw3yoXuPAeRdJQG1G5eB4vmi3WHhmdZyyIs0BmTkY
 Z8DneKEj5ThU2GgM4G7bW3qJ/8pn7jazs6GQt+FBVTahgo2yjCQz2LOOWLJYP58kV87cXjf6ou+
 6eW+4vSqSNF8bhpPULq9IfR8HtThH2A/QZo1CHuF7H0PbytQE4SQW1hJAXEvmj1ity6mOQCWfMC
 uiVDO4JVDmAJikxbqiefcRGPRagSQdzLMWM6mDrhjUHh3D7uBw79CydKUvayFdreYI5bgyEHs0t
 mDod4NntjR2dCwv1qB3Cso9rMgPYS1pnnCvVAHJdBdZ68/Et5x3TmknaWfX3OkQKJHDf2s/gAok
 WFobGK+r8jFoOoAby/w==
X-Authority-Analysis: v=2.4 cv=FbaiV5+6 c=1 sm=1 tr=0 ts=6ae062db cx=c_pps
 a=jJEkL6Umpl9hNhu6gfQ4Mg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=cuEB9orMtnWyPlDtN_AA:9
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX0j/P7LBiuExc
 w0SIPpqnKIMhSedT5V69gn8VLXrynTWPiQmxk1UyXFzEGFHJJhWOsdKtt7st9GtanfTlH59+duY
 4GXanKJrYWB5MvMII082gokxoDWjSvY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270034

TDA54's MCU domain exposes a shared scm_conf syscon region that other
peripherals, including chipid, access into rather than owning a
dedicated register window. Rather than a bare fallback entry in the
generic syscon compatible list, give it a dedicated binding
describing the region and the proxy/claim/lock arbitration scheme
that gates write access to a subset of its registers.

Some of the claimable registers are gate clock controls, so also
document the required "#clock-cells" property that lets the node be
referenced directly as a clock provider for those gates. The clock
specifier selects the ePWM time-base gate by instance number.

Co-developed-by: Aniket Limaye <a-limaye@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../soc/ti/ti,tda54-mcu-scm-conf.yaml         | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml b/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
new file mode 100644
index 0000000000000..111cbb739b5f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/ti/ti,tda54-mcu-scm-conf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TDA54 SoC MCU Domain System Control Module Configuration registers
+
+maintainers:
+  - Aniket Limaye <a-limaye@ti.com>
+  - Moteen Shah <m-shah@ti.com>
+
+description: |
+  The TDA54 SoC's MCU domain exposes a System Control Module configuration
+  register region (scm_conf) containing miscellaneous control and status
+  registers for MCU domain peripherals, including the JTAGID/device
+  identification registers, boot configuration and status registers, and
+  device feature registers.
+
+  A subset of these registers is write-protected by a proxy/claim scheme:
+  each register is mirrored across 8 proxy regions, and a host must unlock
+  via LOCK_KICK. Any proxy other than proxy-0 must also claim a register
+  through its CLAIM register before writing through that proxy. Proxy-0 is
+  the default access proxy: its claim bits are tied low, so it needs no
+  claim and can write any register that is not claimed by another proxy.
+  For example: Proxy0's CLAIM0 register sits at offset 0x3100, while the
+  same register mirrored at ProxyN sits at N * 0x4000 + 0x3100.
+
+  Each of the 8 proxy regions also has its own fault status and
+  interrupt registers, but a fault can only be handled through proxy-0.
+  Hence, interrupt/fault handling is not described by this binding.
+
+  Some of the claimable registers are gate clock controls (e.g. the
+  ehrpwm_tbclk gates). This node is the clock provider for those gates;
+  writes to them are still routed through the proxy claim scheme described
+  above.
+
+properties:
+  compatible:
+    const: ti,tda54-mcu-scm-conf
+
+  reg:
+    maxItems: 1
+
+  ti,proxy-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+    description:
+      Proxy region (0-7) through which this node's clients access
+      claimable registers and their fault status registers.
+
+  "#clock-cells":
+    const: 1
+    description:
+      The cell selects the ePWM time-base clock gate. Values 0 to 12 select
+      ehrpwm_tbclk0 to ehrpwm_tbclk12, i.e. the gate for ePWM instance N is
+      specifier N.
+
+required:
+  - compatible
+  - reg
+  - ti,proxy-id
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+
+  - |
+    scm_conf1: syscon@5e800000 {
+        compatible = "ti,tda54-mcu-scm-conf";
+        reg = <0x5e800000 0x20000>;
+        ti,proxy-id = <0>;
+        #clock-cells = <1>;
+    };
+
+...
-- 
2.34.1

