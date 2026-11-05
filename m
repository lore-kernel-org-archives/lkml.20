Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793849914;
	b=IdwlS8rlirYl77hy0nnXA0zNtEjO83vJMXMh+gm15RnPSxgMLBCpmEpLfqno7R+oHwl7
	 c9EafkQGQyjpDzvORPyK8a+mwnF1ST2GkzJ0tgQlRITJUfen1mVhIemxrbhZ75pq5605o
	 Fkis+ZSE7mI+VyW32OLWJx60Ge9rWnJzu4XtC+rfwyo8Oy2NGBNKNgwyH/MKWTmMLwlK9
	 Ck+kdA/u0N8PY9jvXvigODXUJjS4EMo05r973ynUNRKuIQVY4VVruV0ypJjnXqUWp4csS
	 OeQ9sGq3uueprgwCbIZuaSIbjbR6Zg2ZCGRjNxbdTZ33sDy1SA5MtCZrFG3XQrwV1ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849914;
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aofu+YF+u9fex9PXiQhmE9ORXXKYW+Y6mz/BHqT86p0=;
	b=HYXrgp+9UFqDqCauSTi6S2uRnXidhA+Uj/87ylsuGynk5qrucolki8Pk/9Qq9mawxE+j
	 T7mLJhi1A3/ZL442YrQ/wiZUVmLdy2mQXo+mW/4oo4a5Kt5HSDZPR9pFvWxeBBNm/Tl8Y
	 rujZpiJfjhm56joROUsp4fkbYnAMTHNRGIJektla6/rngx/f37H3ZzLEa5F6Hlidy3An2
	 biRNAU53Up6Zi5oGGccVPSZA7WfeJ4W5p1ja3Rn1BcHSSRDl1gV5OH19VCSS4pk2Y2GhH
	 j72SAYFCFaAkDwEul0LMUt/AMynyS0x+KbqXPVvTp8IT/MyWUwJRH53LLET1UulNIUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=aY68+vry;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=WNIJa8dc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E92606A31B;
	Thu,  5 Nov 2026 03:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41E92606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=aY68+vry;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=WNIJa8dc
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A522mgt3750872;
	Wed, 4 Nov 2026 21:38:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=aofu+YF+u9fex
	9PXiQhmE9ORXXKYW+Y6mz/BHqT86p0=; b=aY68+vryStRwei05APiiK+z0+JFZD
	vLkHxe902clEVk/KTbvQ7Vu+ZmbexZX/NjRruY+RX06FMpnuaagYYdlwLV+40znd
	saJ6oTnBS2BJUfyMx29lE0LdMHwoXNn3nUelopLXHSEz5WLUuFHVpMkDEjIBzIHa
	gWjDgYJDhULO5/1ndnbzB1xVafIpgmKfbfQWqxMr0WDokVCaQzOBpjsHyQxd00EH
	73b+VyFIZNdj96Xs+MWsFyka00yddKCGJj+LORwPQdFT8557sriVopcR4AvjqJzp
	xObF7nkLJUtv96xLiYgkDPOWqQEq4XvxFq8o0DTyg9ezxXcyOJxdCUlyQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011041.outbound.protection.outlook.com [52.101.52.41])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hrgp1gfsu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 21:38:25 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sysTYZyMrWjxG5A03N3PyTQD6iS0nX2ZzpeqxBRGXju/OAHs7Ux+6hJL6s3iwOMXZ4nH3yeriD43jwAHyTU/9myMxZs7XSOHka85GixoHJRD4LNuYTWs/NKIzKFLS1TsHX8jfQXwNFfc4eMXvgQ/QJDCUJVrcdoa7xzScMo3jWAvaKuV4d/kKu1VBL2HYukVsYTat9ra9x8KLzM8oh36sWXROS3DJKttOMgz7PL8/C11/lXcksPnSrJSFuX0xNvr3Ias5vNuQR7Zn8T1vQ4nM8z6HSOKKJ5pLWseh3s2fgkWv2V42YJb75tBUHfBiPbA8p+6WWWfR9SCMMLy+m9lUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aofu+YF+u9fex9PXiQhmE9ORXXKYW+Y6mz/BHqT86p0=;
 b=rwaZGXYQ3LfNSZEsYXVF5n7c/w7jXML1/ylZL+aO7GDKHxfJwy9y5yqcOr8cFbfdU1R1rA8dmmk3QXGZvvfEavTt1LotjKLf3ShMkP3DxiDln75V/gw6ZHFeLNSfajpnDNbYwVlJ6lH9EOZmZPnT3/4yrUjqDLz5M5pt5+Dq646xJSF8LWBpjNfy3LijdS4B+AckDuTPpdoaEE+8viZ3rf1mOwJQ1cAAk//VWSPyE6bJrcI71GhsTW/BQMpPN3jQtrcQsB2f+rCM5DmSJLqrnMELrv7xPDDKVWEOb0K1Ts/f7I8hxIRqZ2drq5yNetxM0E6eeD9grQXBPoIaB5nAaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aofu+YF+u9fex9PXiQhmE9ORXXKYW+Y6mz/BHqT86p0=;
 b=WNIJa8dcf4X1v1I9R8fvkdXCzGvegpBtKUbg6shYjme9TY5Dx+xJXl5QwVKaEWW0plfQVuZzSVxfI9C0DHiu2Yk2gPGLTUuwl0DuF7FV+yzdstDh0SV2GS7SZX2SrqnJYl6BTa0+3ZRwSfSElhbGxGBrKUdNp2tu7c1N2lzlJ+w=
Received: from SJ0PR03CA0150.namprd03.prod.outlook.com (2603:10b6:a03:33c::35)
 by SA1PR10MB6614.namprd10.prod.outlook.com (2603:10b6:806:2b9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 03:38:17 +0000
Received: from PH4PEPF0000B60E.namprd21.prod.outlook.com
 (2603:10b6:a03:33c:cafe::88) by SJ0PR03CA0150.outlook.office365.com
 (2603:10b6:a03:33c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Thu, 5
 Nov 2026 03:38:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 PH4PEPF0000B60E.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Thu, 5 Nov 2026 03:38:16 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 21:37:54 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 21:37:53 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 4 Nov 2026 21:37:53 -0600
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.75.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A53brIn3465179;
	Wed, 4 Nov 2026 21:37:53 -0600
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: <b-brnich@ti.com>, <praneeth@ti.com>, <r-donadkar@ti.com>,
        <devarsht@ti.com>, <kieran.bingham@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] arm64: dts: ti: k3-am62x-sk: Add orientation to IMX219 sensor node
Date: Wed, 4 Nov 2026 21:32:24 -0600
Message-ID: <20261105033224.2880607-1-t-lannynd@ti.com>
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
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60E:EE_|SA1PR10MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: 1014a63b-50f4-458b-0506-08df3aee3a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|6133799003|10067099003|18002099003|56012099006|261021121427099003|261022075727099003|261022105027099003|261026140227099003|261009223027099003|261102123227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	yGvedluIyNV9nEGfSiiMc2HJlP4b9Cs0Y1oyVtBqIKKXVn8Hyrn/OvvVN3DhAEIsJBLBgTvnwwfqqn9QsvFCFABEkkep4qQaLaxgPN7p3qfJNWijzS42Jm3pALA1HVsXpHVyaNQ48w7N3gTkeW2giVBjWwj5VAEVvPR+wDgWcSV2eNRrsIBktgvuRRVCvOFLyMoRpu5pb5katXpDusWRwqyZYynmyQ4d0+8S3PQup/lGu91ImRf2QEsVgVoFJNU6n3ol9qDT0kC8cfzClkivpvU+8j2FphMP/WyVm9aaDrNukh957YFEzKPETQpMQJ85Hz1zHM5NJFMDaoDIgYMae29uRVYeUugYtU1Mt59fTIVW4NawnRKSBgZcMDTP6q4Triu3oMM/fe1xFcZ+CRggkUuaxifsWbCx56e6vEQ4DI59EmDbnqc3A5N+SyMGsHVLp7cySEo+e59vWf8JKkmbygL0cvJgMPoMCHlO8uXeCRXa01NPKBTAIh2FH1wYMjkk9WiK+9UendAZYcBcbjaxf0PtnmkgNBGkeNwI6WUORofb0WNiqOUCRNpY/XP1uUeJP9LpJHKIS6kJAq6amLC5YHZOWAZ/4BdC67dij6aa8KMpRQnI95VQJ8YcaN4DuxFSyVzlhKBk0URyEr8bYFuyGJ5UpTgS8a80Q6MDgVYrEl8CX2YRd+yyZIkNYDC22Lxf/bZJHoNYtdaLTClCIW0qGw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261026140227099003)(261009223027099003)(261102123227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1XleC4lKKWOmxnAeYLVy3+sOAb5yLKJ6gsxjp+RriPILeQedmIfmkm2Rfa3yKv5eUtwcqMmybryLK1jIY6bwnEkHPWJPuUEH85dzFU2XpNzkC/EQZwfh8lHKUaLdMEjpZ92Q54cH9OWaqHqIUE5G/vsSCBQdmlw0hwhOrkBcdD1psQifFcj/eu9ZQva+NbHrEOzW9pcz/m72n9JtLqKW0omG+3crVL2pnYoMI3QQTTUD/R0mULzkwdNDwPGsK995N4XVjQdi6m37Ygna/cxYshShuuXP8p1Ouk18iwHo1jfKyJMUsctPS/G2UsFWrnnf9fuI4tXUVhgXCZGMXgPSRLBfYclT2iyXTWGMZWP2mmmUYycNMT/84JE7IMAj6K/or32vD3DFDJ6St7RaXFUkktr5guUbBns1XUVR/+x5gr4EUwzQMCBx2z6wa9KDWzQP
X-Exchange-RoutingPolicyChecked:
	huQSqbPP4r2rlFc+5lUpKOsSLL3SSMLqG392986vWEBnSnTpWhK+9Ughdn4QKIAWpo9qQp7jyWonll+DkRniOYvmhHmisVHXMuH2KIowydRpFNUpZ6Pi4EE2n2/qII0kjb3YZiv554I/2Anuo7CR2WJPqf18yFunZDC+1l+p6uUnELiGVQtuthTxhkEy/L6VoR8iP65BftQ5Ace0ppREK6mYfUywUda8RBmK4Intx3iYf1yjDY6z54S6yJtLF+/IFym58rDn7wHCIiWFFmAOevHQ5gjOtifjaDIZU1Fyrh7S+HXJFLvJZ5jWzKXd1gsARFvaMk55WYTuGapYnZFGyQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 03:38:16.2203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1014a63b-50f4-458b-0506-08df3aee3a37
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH4PEPF0000B60E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6614
X-Authority-Analysis: v=2.4 cv=Ub/E26SN c=1 sm=1 tr=0 ts=6aebfa31 cx=c_pps
 a=0/xasGIuH+87ciDr1HSmcQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=3dYW9F_wfRP4hc-uYg8A:9
X-Proofpoint-GUID: O4fyekuLba03jIIaopflbkxVyUMhvt29
X-Proofpoint-ORIG-GUID: O4fyekuLba03jIIaopflbkxVyUMhvt29
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAxNCBTYWx0ZWRfX05C6mOmMI5n8
 V5TRL2J/A9DI6RYUz03eCaAafA2kcZqrNxYVQT4Qut7/5ZiWItW055Hi7J8VhwWbnn7YNqhioRJ
 jP+RYEZHxjvlXsDsBkAMiWUtsUDUsH8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAxNCBTYWx0ZWRfX0UwIg45F5SnZ
 m+3k8keWVU0syT9ndJhh1B+aDN8BlZdGH+ErjoPj+dIqpAPaiXtjaGD23uSOeyScNy1MH9qZTY3
 coA5t3uPMEmnoW+sALX8CeaDB6iLOI33TY4lOwGcGstcwwXC5YK5vv/hddEPniAFfHdEE171DUC
 SWXDz10V2F5/RCh5hsMryDGb4b24CoI8f9sUauX2QHlbt7Um4+FeKkGlycNWDzIOl0WB0wEd1fn
 QdMr/SYCKWShMdnPtbH1a48V2Pj+JU/K8oJQtiVD90XgjaGO4mkNdNdF83w70pPNapP5/TglM3P
 Zr2n/hTKFRiJ+iQCB+B2tmEKnxcOvWkQ6Z/fwL62aLXHV1VTTvPeZujMiShKqbnL2Wjtzv6upT/
 765zXumHMu8GxlG6toyCET8Txx5WaMjWiS0ifxEJhHf0LV5qSK9/NbQcSOlEPq3hd4T0u3RWKIQ
 FKSWk9cQKRkmaLJXLcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050014

The IMX219 CSI2 expansion module is externally attached. Without the
orientation property, V4L2_CID_CAMERA_ORIENTATION (0x009a0922) is not
exposed and libcamera fails with:

  ERROR CameraSensor camera_sensor_raw.cpp:465 'imx219 4-0010':
  Mandatory V4L2 control 0x009a0922 not available

Set orientation = <MEDIA_ORIENTATION_EXTERNAL> to fix this.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
v2:
  - Use MEDIA_ORIENTATION_EXTERNAL instead of <2> (Kieran Bingham)
  - Add #include <dt-bindings/media/video-interface-devices.h>

 arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
index 149c59c07182..70c2a197f1dd 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
@@ -8,6 +8,7 @@
 /plugin/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interface-devices.h>
 
 &{/} {
 	clk_imx219_fixed: imx219-xclk {
@@ -72,6 +73,7 @@ ov5640: camera@10 {
 				VDDL-supply = <&reg_1p2v>;
 
 				reset-gpios = <&exp1 13 GPIO_ACTIVE_HIGH>;
+				orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 
 				port {
 					csi2_cam0: endpoint {
-- 
2.34.1

