Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793090278;
	b=bn+CzZzmLpyean0XQ43MQc3yoOGW9QCL585IpANFASrAMjK0+kbTWZ8/6cR58mInPfdw
	 4qcdNQFOgsENZv8uyRQk+tbnCsLIeAFcl8+B1imwtLWCD58wlNhiNXPF1T0GOmZjVBUtm
	 ItcrcIm+utVEpMvzPRUJdPvrMuZSIXwkQstP6l8ao/P4ZD3GQ9PcVejW2GUjtc0YUa91o
	 +rShckGxdNO2m93c+BXfrQlAmATAM4i3ri7Sd7Z4KNMyDqeCJcX1v5TK1x6AF8mICHPXj
	 J6UKXnngzj7oNm9jSTR5oizwipe35UUhMhue3gV451VEwxigeGbXLTDDe3YSCOTt7uA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090278;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YPeGlwt/Jg1WgszRpGAIDnD32Jdwvy9myiqGxccB72U=;
	b=MTPSct8xp2dIBLLT1qcPD+y6rIIlOtCN/cWTHJiwA4aIZjsM7KLKjecG/Vt289lSuKxb
	 niKvsjRVJtZ7tR51PmpMdRSIcvoyOxVnWeaddEI7996h6UFVohHUwyegcyo9Qzr/NCZAP
	 wLhWHLrmVL7VWwqyC+9TXkNxOnwbTRJCTNsuVpAd6pQT30+9ItLC2vozILfGz7sSGGWia
	 D4o4uiGty5ga3TPcLOY7SU0+Wm09EXHpAIvCWezOeBcHD9pFV5P743LCiKnaP+iZPzQc2
	 ruoLh+nuYwsJTSK/Fvpg70IM7MU8j/fv+L8Z2N+wAVsnR0a6p7PqWu0z9e1xE5IcX7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=FDAPL5Op;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=mfgYWaNt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03163606A31E;
	Tue, 27 Oct 2026 08:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03163606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=FDAPL5Op;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=mfgYWaNt
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5j4Sb485457;
	Tue, 27 Oct 2026 03:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=YPeGlwt/Jg1Wg
	szRpGAIDnD32Jdwvy9myiqGxccB72U=; b=FDAPL5OpHKHNCEHULAq64NNk2OSUF
	aD2W4UcUQDrDeRPqGuWvOlXOrH/4L4Xd4r8kerNVUDyz9Oq9i6E9dlfHTE9S+CJU
	tlCpcLFkxMHeoWyByOfr+P85TqHopiX3/qn56E4hWi1pvWG/QFa/DF1kC7TJXgA2
	scCnJX527OE/JEZugiANrqDOw7x68FtbQO75/OAW0LQUe8U4nE1T94NoU/Zff48q
	kD8oAeZWA+uQHYRkR2SXaHaCMZORfjRTdmHs1SkNsqMNCyNWwjFghSJ21n9pC/3E
	LvQkN2IjvOg2+nT4G9A8vufZfbR23COC6ZOp0YVV0TR0GLQhYPTGHHXSw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010011.outbound.protection.outlook.com [52.101.193.11])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hjp2ygy12-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 03:37:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyBQkSgOwyF/HzoabvMTudZfZ7D9BE99XZAvLovkt6DiPGLTGeiun+esHqjfr6DM2P5Q7N1cIRg2+AVhKby7JfGk0+/ngSlzlT2eY74/O58Y7Z6DduMFPAroKtWUqJNE0SqoCaB9hv+Dietuu2TbSZfreCF2Jb6/RxHNPkfi3lK+n8BAW3lCDzdnUQtS6jbiCLW3Q/l3mIJesdIbxsrp490I69IaBx7cbHZy5+iFi3vx1AJaH9IOxPYoJtytk7FyNixWWPIlPNMkl1+MDPZV0uLSOBsVPQj8SsjXjLzqytGO1I2cfUF9UcO7ROVCmUVuDV3BysD97SEjYKGFShHbvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPeGlwt/Jg1WgszRpGAIDnD32Jdwvy9myiqGxccB72U=;
 b=f7VKiBzMeofV/saftISa7xrldS8hIxJPYvj7TQS2h4N2N01REP5EjrJiJCA2UmhSbJGwzIKQ9CHIIv7CW4ZCS34C0/DMxveqeFpCl8+a9kLsUif3qMMar/3kUZ5mNGQoqwSnkZXuaZBpv5aHP4zHT7nICBv0jNlBhA7VpT5HHwHC0cUoLsqhrWt1LG0Z+0OnOcf4Xcynd/WHRexQgF7cKDNFNGOEqx/l2htVmTKydFJbIpLMK3aNlaCUPu3A2zhG66rorpz1pnxd8eMvRT6KkKPWb7XEVoEnJTNwGCmKy+9xB06ePDRxXmc1RoZscL/HJyMJTOCa1+3riYqA2UNmlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPeGlwt/Jg1WgszRpGAIDnD32Jdwvy9myiqGxccB72U=;
 b=mfgYWaNtJJUzgtGnblihqYoR5ofNsc4IChfNlMjFbU5qSbRTzb1cOG/bTyAEnPbFLJl6rYkIL8shIpQfcqm2K4rkHvwiowZxc2O8lPcAmFQ9izWKV0tFyq8ewrBsUukcEzxLtEeIIC6EWBAv9UaVVPx8bypjHJu+pPIirADXGS0=
Received: from DS1PR06CA0021.namprd06.prod.outlook.com (2603:10b6:8:23e::6) by
 LY0PR10MB154434.namprd10.prod.outlook.com (2603:10b6:404:226::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:37:36 +0000
Received: from CH7PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:8:23e:cafe::69) by DS1PR06CA0021.outlook.office365.com
 (2603:10b6:8:23e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Tue,
 27 Oct 2026 08:37:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH7PEPF00000015.mail.protection.outlook.com (10.167.244.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Tue, 27 Oct 2026 08:37:35 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 03:37:06 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 03:37:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 27 Oct 2026 03:37:06 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69R8b1hD1558035;
	Tue, 27 Oct 2026 03:37:01 -0500
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>, <johan@kernel.org>, <kees@kernel.org>,
        <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/3] soc: ti: Add TDA54 SCM configuration syscon support
Date: Tue, 27 Oct 2026 14:06:57 +0530
Message-ID: <20261027083700.1964371-1-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH7PEPF00000015:EE_|LY0PR10MB154434:EE_
X-MS-Office365-Filtering-Correlation-Id: 78621037-e584-41f6-b909-08df34058cdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|6133799003|18002099003|261026121527099003|13003099007|56012099006|10067099003|261009223027099003|261009221227099003|261022075727099003|261021121427099003|261022105027099003|261026140227099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	EYTyxTTMDfDRamjKBW9K9nGACQ+c02/TkgPagXiO+/8VV6aM4TlG/hxjiTs4gEN2/UlB1Sw2l1dlTEPLTcmy++P8oPZqE2EjK8zKfUc7PVCCLrKNNLAa/rs9v11/NeElSOfwYAcg9JyrX6Vmtp6mJR8eMkvzA46F+/4vw8DSc5UCLG74AeEjkp8/Ef/Au8Bl5IbW4vza6DotXvAbFIEMco09S00phePTAEd7DWVftmS6euPzv/wrfm5dJPwpkwmlzOELgVa8Wq5Rti+QmZzCa8sA3B3HVEI46AOVROKYWM72IVAFmqoGLp6Hy+KnF6nJAGjxYrvnKJcQba43QAYFZmWETlrOQe8nNbAuvl9QNHqFQTvZUdHkj9szcyY0VOIs9Te0GHR5mI/Qjx1p5mUnqarms69Z94z/4IMdnn3mHt4qBV6PElHqVZWMNREC8E7czhh8+n4jEpxHmR6QTFt/Mxuhrbe7ZA+jc6sLCsxBwgopmx6zWvcvjYeyDqZvRIkFgTp0XdqBS4NbKnk5j/DhNZcNuEkNGf7ckmy4t5NBsScZPEJMQdh/7wyDtxiWcWmCQYA3AjzaG8lJZcyGSMgaGSFHnyGUqlCCxoMpbk+zgOK14YkB4+xdUr7KlJf1y/XDemeMYS1+zCFYFQoBAVp/xQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(6133799003)(18002099003)(261026121527099003)(13003099007)(56012099006)(10067099003)(261009223027099003)(261009221227099003)(261022075727099003)(261021121427099003)(261022105027099003)(261026140227099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2Rm4T+cid7Tpv6xWEMnncbpMcIGSUb43p65a5roYi/z+C6MEmoIVB+xygu4Rvkqdpmeu05hyOCmMo4dPX1zWYGb+naSIKS+awZrBxnnDB1bkvnxhS8JmjsgChfbqrImRqnirwqqy1VvdI0r21uZLobtypeYp9cVDEk+/8bu3aSHiwPHNnuNYMuvm0Ot+xb8BfS/Q9t2CBL+WLWMXlfqBcbHJAe5aLzAAfFq48LIywEdbIGLveBoIuh7Gaa1i8Vp2FvSlnM28iHXajQI2liRCaImxBPd4MY4SpCg27uGcEF50vCV4r93NsHLZn/ztaBkco11XQtTdLs4rpTlx6IYbPyFYe4xkMymw79IWr/9iv1PPjIfIoxrgsuu+hVEPmXViVwRryWa+xHWoSwaHMqKikzdEPb51tYFjo9CpnYUwffXSyVw/d4bD2vLaMZEqeCZJ
X-Exchange-RoutingPolicyChecked:
	izQBEk3oaClK7ySZGJwBEnOwWi+h0GJVzMMdpJmh10gza/Em+ZgS3+WgkzD24BKY3w3zAFfsy9zx4/pnvJdssI3A4Vn28znx6gyLttbgRvE5QaavEQ/v/um0B7p94sVMrDPj3/lfwmmC0b27ZvJmo7OgnVvet2L9yDustVXAYsplTEynYCPj5hhdZp3DN1oJ7KZl7ktvyVljkk2V5pVRVVqZF/ZmwB/pavn710L3jExcGignKvjUCbdGDraqf9pVh+fR0k/6rjp25jDN8w7Fem0QbI2HR1U72Ji8gWmXp+2uLpNJD+VDhdeRa3nJA/cbjDMepTyR2+vY6BgIGzs+dA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:37:35.1782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78621037-e584-41f6-b909-08df34058cdc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH7PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR10MB154434
X-Proofpoint-ORIG-GUID: D8zn3S7Fp8JBQJ9TiGcWUS8ZgFUnP2Kv
X-Proofpoint-GUID: D8zn3S7Fp8JBQJ9TiGcWUS8ZgFUnP2Kv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfXyhZ6MGgk5oYJ
 05iDslcYsvANsEi/WGURnm6PWnTq22AmxH6+HYNGT5heL44fAkpwCP2IVXDNHdt3w3LQqL2GQ+O
 u/jNgaMRaPjymIufotsEfW4hqZTLJ9zW4XSFoPhIYve1ZaicSjv5U3XhRWXNydJtDh+kcuKzpKa
 cDSq4YMGz2Xgdy8Cl5BiNZ9I0pfc/gQMLxB0vzGulTNAsQIVyRQlqIhl9cTZEAZ3F9i0pUCOygp
 1Zizjq1eOskZXn8KUT7tmrwORCRcKaOzN6IaIyYwb77VdXhu30RU09yNYJ8nv5CFjcq5GwVstT+
 McH4OGtemWPBc3B8nle75HmAQEFADH+yb1E3+o/COiCqlswOHZaK/azYqKECKtJ/EaVIkSslh8i
 e8h7l3fGqodE8pc0bp18U38Bz1FKQ4uabI3Utwenc2WU4UxsKELD0XJybPZUMxnKR1BXJyDBoxf
 3ugce2fjq+ODWe0w9LQ==
X-Authority-Analysis: v=2.4 cv=FbaiV5+6 c=1 sm=1 tr=0 ts=6ae062d3 cx=c_pps
 a=OswsEo8IlqVTC7zrgcx7Gg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=UCzFRFlywXcFtRv7-asA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX0FIFbDi21biT
 ptnVovHv/tkF00OC6s5d1Fv5rFfjVs3bUOc5wegrqyYvgIqZ6C5dGobCkWx/k9UcMWbfe1Rz8Mx
 xjloZHHRFl5u6EAg+lqAhrxOlf+zAiI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270033

This series adds support for the TDA54 SCM configuration region in the MCU
domain. The region is shared by several peripherals, so it is exposed as a
syscon regmap for other drivers to look up by phandle.

Patch 1 adds the device tree binding for ti,tda54-mcu-scm-conf.

Patch 2 splits the SoC decode and registration logic out of
k3_chipinfo_probe() into k3_socinfo_register() and exports it. The helper
lets other drivers register SoC information after reading the JTAG ID through
their own access path, and uses devm cleanup for registered SoC devices and
their attributes.

Patch 3 adds the TDA54 SCM configuration driver. It provides proxy-aware
register access with SCM unlock and claim handling, publishes the regmap
through syscon, and registers TDA54 SoC information through the helper from
patch 2. The option defaults to m on ARCH_K3.

Changelog:
Link to V1: https://lore.kernel.org/all/20261019080736.944127-1-m-shah@ti.com/

Changes in v2:
- No changes to the device tree binding patch.
- Use devm-managed allocation for the SoC attributes and revision string in
  k3-socinfo, and simplify the cleanup of the registered SoC device.
- Enable fast_io for the TDA54 SCM configuration regmap.

Moteen Shah (3):
  dt-bindings: soc: ti: Document the ti,tda54-mcu-scm-conf binding
  soc: ti: k3-socinfo: Export SoC registration helper
  soc: ti: Add TDA54 SCM configuration syscon support

 .../soc/ti/ti,tda54-mcu-scm-conf.yaml         |  78 +++++++
 drivers/soc/ti/Kconfig                        |  16 ++
 drivers/soc/ti/Makefile                       |   1 +
 drivers/soc/ti/k3-socinfo.c                   | 121 ++++++----
 drivers/soc/ti/tda54-mcu-sysconf.c            | 217 ++++++++++++++++++
 include/linux/soc/ti/k3-socinfo.h             |  11 +
 6 files changed, 402 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
 create mode 100644 drivers/soc/ti/tda54-mcu-sysconf.c
 create mode 100644 include/linux/soc/ti/k3-socinfo.h

-- 
2.34.1

