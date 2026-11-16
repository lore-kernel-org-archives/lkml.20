Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794827375;
	b=LoI5lOVw74hjAtRPKv1ywyGfjLFESezpwWbl1mMS6Fiz8PDuQQ/dxhnv+0O3eZNPv2OO
	 8lKArxJnu2cnWRPp9FsFfAGcD9lYxnIlhOOx0Bu7t4H5Zh13nO8p/0VroGHhJ+Pt1uJ/z
	 0PWndr0nU1LtvrpDX4EhiZ8/fLplsLxGFRleCC6Aoj6cMU2E8fsScNOnG9CsUowFjWI+p
	 4H4DM3hJnOzoYW1E6eb6fZlCb95Z2+Gl73nmyXlnWfTlPFVIKwJqT1WFA1VmxEKbLZVKJ
	 UG/pd/jjtekgLr2zCloNM05nv3dU4ivhv61COEyPht1Yd67klvLWaLpLBsldNz2VhCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827375;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Reason;
	bh=SihuKXSUKXTzq05k2vNCnz2uLa7HOk10+hGgMlKlWXQ=;
	b=r1ooFGTbPJa7BVPGkzaqfufUN41ng3i5SAT0b5DKI53RKy2XWKNKX4yWJyVZvws1Acth
	 gghriUSCJarzXqVJX3ZUrw8Ns2LGwJ2SuWyCOOFdW4blIpbNKiXk3iaaAp22uuuRbJKLD
	 bbFyQhPq8EyVwX4wuYqOrZqOQC1QfCueiAqag/EuEXhbgMryNMKFeLm79XZs0+7y8tb0+
	 G7/rbUY3zfgih3NniTRU4n9bV2PkaK3O2OYzvl7vwutSd6CuDSBfNdKz5QC04+z8vUCx6
	 BuKiZ3n4x1Sxsx8pZWgqKDsxn0qVNRoZVJdj+rypDIt40878BI2oZI/RVU3Vjj+xK9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=RZuO3CSx;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=DIiHv7I6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C76607A8DD;
	Mon, 16 Nov 2026 11:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C76607A8DD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=RZuO3CSx;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=DIiHv7I6
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGAuDRn1673352;
	Mon, 16 Nov 2026 05:09:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=SihuKXSUKXTzq05k2vNCnz2uLa7HOk10+hGgMlKlWXQ=; b=
	RZuO3CSxxB3ve39s2R7nea85FIKzqYnXM3cHUieZLSY1iA+lx4yXzLzIzW5pxO2x
	FxY+M4C1+je2SmH9wgXGQVX+cHB9J+8J+6vsizH3OnY2tBY2qI46X6Si6K2e04oo
	Ui5IawQNFtVocQMLN70FjgZKgA716WhQ+cY6o6fF3EktWuy7xeqlkX4WyEQ+et99
	O2WGV3/t/gAWB/QcfMW/atADUK6Y2sfipqtYiqT8qfVWOGB/qkiNYcllGSt3M2HY
	b/Wqr+SRsu4RkcX3oTwNWBlwGr5qoMnbHvbSXaNTCrQ7brnps+0dac8cVpbVD2O1
	Qw7dmrlm61wQJTHBagLtww==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020076.outbound.protection.outlook.com [52.101.85.76])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hxnxehyu5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 05:09:22 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sssRyTzC79i8yvNtcRsj1EWJyR5R4cJktT8Pl82i9HdidbVwClErOkY8+ZmggF6My3TxdsdaHHMlpoHDzhr/jU1+PtRREfbNShaQIKXj6TKeHm5wJiOOPVh2fx4g3ew+I2fgBV5+ybRMTAQ7BiXSNNe01Gk41LAfnMnqCjHlFhZY5lC3mnDd3gWgszgTGaYDZDRG6U06vmvs54hvAXKqhV+EnhyavvMRODa2SZM8/aYrfwP0x+9BsmDWE7g6LBQjb62XLz7s25loLsNIFwtoONtHPoWFiumz8g4HZco4fHA+yrB/2XLn9Pa5wc8ALs6WIU13AoVONLhJq9X1I76mnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SihuKXSUKXTzq05k2vNCnz2uLa7HOk10+hGgMlKlWXQ=;
 b=aSDt65sjzTTsnx2tO0/pZPNY3oV3Mki2zTA5jNBDh7rzT8oCdtb2GxBsLJgS1+AD/rITMIH2fUWuq/cb5oEakHpmx49HpmJ/J43Gh6Ad0Hy/Ltd37aNfVobpnYoGugefRF7MJ6Bfp7Vt8a7JmgI58j+W+KGPc92HWwhyouZKJ7ohb/jcfCdAepKB7ATyNLjsbGUSOY17CWKLSr5azrWDQIEf3K5w9pXvVH3olOnp5XIRf2woGtB7PAi+6i0NFlaXrtcU1QS/4Wtw0lM72aZAzL6f6ddKP9Ny49kWGAK6lB7EUx1abELpyyQH9iGPeIMFQgBYKFGIxH4dPyrC7xrhOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SihuKXSUKXTzq05k2vNCnz2uLa7HOk10+hGgMlKlWXQ=;
 b=DIiHv7I6v+I47fE+VaW5c1+0fqG+BbAtJhVjy3C4U5Uaejm3UCuStFaFV8Q3TnG+0aKnKp4SsZ3IeErRhJ6wUKXzqQDqKEOTGuNEyxeG3WPhcRPSpiIj4wDytq+4EHd+bRdf5QHTfhvNBzrK+QKqAHAwWvWsNS8R0jzefxPjby4=
Received: from BL1PR13CA0323.namprd13.prod.outlook.com (2603:10b6:208:2c1::28)
 by CO1PR19MB5077.namprd19.prod.outlook.com (2603:10b6:303:f0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 11:09:18 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:2c1:cafe::4a) by BL1PR13CA0323.outlook.office365.com
 (2603:10b6:208:2c1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Mon, 16
 Nov 2026 11:09:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.0
 via Frontend Transport; Mon, 16 Nov 2026 11:09:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B7925406544;
	Mon, 16 Nov 2026 11:09:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9F66C822561;
	Mon, 16 Nov 2026 11:09:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 1/2] soundwire: Add a helper function to indicate a device will detach
Date: Mon, 16 Nov 2026 11:09:12 +0000
Message-ID: <20261116110913.3555209-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116110913.3555209-1-ckeepax@opensource.cirrus.com>
References: <20261116110913.3555209-1-ckeepax@opensource.cirrus.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|CO1PR19MB5077:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 321b2205-7be0-4841-3946-08df43d20ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|61400799027|23010399003|82310400026|10067099003|11063799006|56012099006|261021121427099003|261021135927099003|261021123027099003|261026140227099003|261009223027099003|261102124527099003|261102123227099003|261022105027099003|261022113327099003|261026121527099003|261022075727099003|261028144727099003|22082099003|16102099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	N69f+HaaFATzZdAFtBQw0YY85jYQQuZlFm0+kUJyECtobtPt7EYVGHwsSgurLe8AG2xCloGcrARJtIjK96XgxE0JMJWyZc8azKxKsX+Yi2jvzadIzhj4Q03tez41b+U7yK5wPOwmJnN+bXWooBAui/OKzAkP6yUbOQohUmddndW9PTWBDr+LP6G99pkRRrA3AixQyfI+OEnxy2FD2y6kIiO0dOWnyd+5q5UJgdIkE5pwfzTKTFerz6V5rqg2A7T35IN728tv6/QK521SNpQDkhi5D51U9o1gabZumSxF3OsYfLBB+1rIA7NQ29399meeLwy6Y++bVUewSGR9/3Q9NKg8X3YegPooq1cIEGwoGmqa9xkz4iZ1F8TLnM2HCmgQs5YgXDcuWGeZLdgTCmYxe9cOh9o+qx8pdthHaQaji7uLZO7pWGnjuoU+FynwVAhE7pkyaSFdlqMUc7tdKh26OzV0cNyiIe7krOff4wYyg9a304rXMv2NmM3id2wxtNGVRy8T6ZqlmjZ84M/Pf5qEJxgWpZvBj4M5Lxl5Ai22z7YR2Uw8hLczlmDNAYIxEdarnQLbmVTh8nQoS8ZVf5p742Fb/G/s40LZPI84lgDWzPvvGg+Z2dVYi1EIFsgEHAbl/t8lIsi5EPrjJ5sYpd7qd8dLcVpT1Z9bPdPkOkpspbSyY4v06DHbYbmCSDSdBxxmJCFG6sNinnCBY7SDhWARww==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(61400799027)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021135927099003)(261021123027099003)(261026140227099003)(261009223027099003)(261102124527099003)(261102123227099003)(261022105027099003)(261022113327099003)(261026121527099003)(261022075727099003)(261028144727099003)(22082099003)(16102099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9X5bj7vxJ83oVnbQsQvOnj6CGTAu9tsoQNC9DunqHQL9zgT4zyTcIBswnUVivrl9UayWEAdfFq/7vmyEu+Q9+08xIqv8Z3pMWPOF1AvoFQ6w5zhN7JpKpssiyZkn8NLiEd56Mw7ri3X21Wup0c8x6/a/wylFLM0T2r3oFbMWPHdO70FYYxXBnzRsd2yxopt6mKUdCQy9MDsdP+oa3xYBOx6IM/CCsD1tKSlfSkCl5+LVwZBr+1UvEZBkc+wmM8eHc0SGP/HMzQ7SrjU2S2IBsWl71zU48sB8qTkMBL0IIUojxMOWpEs1kQHLqlWYDNgM1MXCTBhq/MGaEF6iINFITQrJX62LWHzsG4eZNWV9o+GJSTZW+uM7sP89ENa/WMZ7NFKFpDHWfLtLVZdSRlonZz3UlmSOXvdpqra5mXAIpKwyxcj+I1EQvWCUCtnihqV1
X-Exchange-RoutingPolicyChecked:
	vlWmLshboldcB+KrrsbboT6HKwD/rFLDuvRYVuxWWuFtoKTtWg8vil2/cCVxPXrmz7m4Wd/AXakDKr1esdD2KjtPkMBrZ7qlYRK/d8pSu5whU5glZAh7N7Onq4/T9f49IBXFt37ZVtgmb46HD6S9OJqkRCsuBWmCQTBTBV8ykH6iZtSq/kebgXdmU8kxOSrzvEn+qPKu3FlQNaKA4ym3zFhAH77GV7oKXhvrtsuX9AWZ2CEw2SpFCt/c+PSFwf9hPn3e88I6cwI5um6FukU2YpL1wpvV3LyFYydJNGUlBIraiV/ZdwDy8UHfvVX7KjK/AQ/SSARWb1CUzJjr70iIfw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:09:17.5605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 321b2205-7be0-4841-3946-08df43d20ea4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5077
X-Authority-Analysis: v=2.4 cv=KNbPn1Fo c=1 sm=1 tr=0 ts=6afae462 cx=c_pps
 a=PU2v30DqrLDYHXTVxoobRg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=8GfHkCRbLTLxf0Ih6UUA:9
X-Proofpoint-ORIG-GUID: RxRh5UK6faXC0rylfP0sBijlKPkjXSNA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfX4/GbTM6PwO1t
 auVCp64dFosWeDbw4BWpgycchLJkw2/X4gMSRpoWdIdxNdGQaRr2a7swGAVeKahdfZkYoRRS5O9
 yEcqcIWE/ZInhy1plfP4USoCccQJ8dVY0Btf3B5uCRr6lul6LZ7cBozJFj9XyedGaiMXksffcU3
 o6qYldHPLfBzArpAkzoPixgHpM9I/yQqWRQrMzSmG96wvhnh+DbHiwG41c++p81x5Rqnt9DEbCw
 wZ6jUpLW26l4JN07xuURyXUl/tp8/HYPqsCmm6OMO/VwQurVQtWZj9SAZmVu++iN8TJJDPbTVOe
 /nrk6d3cSIrrFWsmhqRwvd13UENKoglS1ozp8XuSY0RDYUYkZkolVSy8Cd6jnf1a69Chhzt4wNu
 hXbtGDQlINzgARbgvo36Cb5EEoINNjO0f+kuTFYUlW6Mis/53JK+TZHO4lRK2KHHIi+C0kXt0lh
 V1MDFy/NNlRwv279c9w==
X-Proofpoint-GUID: RxRh5UK6faXC0rylfP0sBijlKPkjXSNA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfX51S9/n/tS2on
 J0fBxlWFiQSuB2jn2cquiV2o+q8L4FOdfc5gS9uhvCo6XOlJBIWQqhLRyCSufGZd9O++cL6TNBr
 g/GBcbrTQiOb4mq2sf0uNr/0eN4c6sg=
X-Proofpoint-Spam-Reason: safe

SoundWire devices will sometimes need to reset themselves,
typical times might include when taking over the device to ensure
a consistent state or after downloading a firmware update to boot
into the new version. Often such a reset will also result in the
device detaching from the SoundWire bus, in this case the driver
has to be careful. Naively calling sdw_slave_wait_for_init()
after doing the reset could immediately succeed if the bus hasn't
seen the detach yet, causing the driver to proceed attempting
to communicate with the device whilst it is detached.

Add a helper function that a driver can call to indicate it is
about to initiate an action that will cause the device to detach
from the bus. This will reinit the completions in the peripheral
for device attach, ensuring that the next sdw_slave_wait_for_init()
will not complete before the detach has been seen by the core.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Acked-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 drivers/soundwire/bus.h       |  6 ------
 include/linux/soundwire/sdw.h | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 44e4f51939176..59b6aee0ea6eb 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -231,12 +231,6 @@ static inline void sdw_fill_port_params(struct sdw_port_params *params,
 int sdw_bread_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr);
 int sdw_bwrite_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 value);
 
-/*
- * At the moment we only track Master-initiated hw_reset.
- * Additional fields can be added as needed
- */
-#define SDW_UNATTACH_REQUEST_MASTER_RESET	BIT(0)
-
 void sdw_clear_slave_status(struct sdw_bus *bus, u32 request);
 int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
 void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f710e5932b4b2..4937d1a2f24f7 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -25,6 +25,13 @@ struct device_node;
 struct sdw_bus;
 struct sdw_slave;
 
+/*
+ * At the moment we only track Master-initiated/Slave-initiated hw_reset.
+ * Additional fields can be added as needed
+ */
+#define SDW_UNATTACH_REQUEST_MASTER_RESET	BIT(0)
+#define SDW_UNATTACH_REQUEST_SLAVE_RESET	BIT(1)
+
 /* SDW spec defines and enums, as defined by MIPI 1.1. Spec */
 
 /* SDW Broadcast Device Number */
@@ -1218,6 +1225,25 @@ static inline int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u
 
 #endif /* CONFIG_SOUNDWIRE */
 
+/**
+ * sdw_slave_signal_unattach - Signal that the peripheral is about to detach
+ * @slave: Pointer to the SoundWire peripheral.
+ *
+ * Inform the core that the peripheral is about to detach from the bus, this
+ * is usually due to some implementation defined reset mechanism. After this
+ * sdw_slave_wait_for_init() should be called to wait for the device to
+ * return.
+ */
+static inline void sdw_slave_signal_unattach(struct sdw_slave *slave)
+{
+	if (!slave)
+		return;
+
+	slave->unattach_request = SDW_UNATTACH_REQUEST_SLAVE_RESET;
+	reinit_completion(&slave->enumeration_complete);
+	reinit_completion(&slave->initialization_complete);
+}
+
 /**
  * sdw_slave_wait_for_init - Wait for device initialisation
  * @slave: Pointer to the SoundWire peripheral.
-- 
2.47.3

