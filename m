Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297607;
	b=47pAJAgD53pXfwNyr2YbKsKL60hccJJSq8P4PGAtx6VD6ww9+eEah924ZF336rTGmNFP
	 CWgWhunX3+hNW1wfg3wujWhmca+62wHQ1Xcn9+lL81n4yvqDCAPN6jf9oCLqT4ngpn4EJ
	 6Hr9u7ZOqJ1Ih5Dtj3e2iqOiqwIJGnJHfINmOnkAy2MMY9Eqhmu30fMSawr4Y4EJmvPPt
	 nCzqpgrbVO/5dp2gEdkJ7xqLm/+RDc8HYxNpABwlAkEycjucZVrURcbm9+jML5xZQb4a/
	 k9PyweLHl2p7cTEC/H31Rq4a9LeJAAZ+WAQfcbQ3YUy+wJKODyMUteLywECFgo+qcig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297607;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BZjkmYgWfs1QIh3GMhr+2y+GiVKeOOVF/OQnvJe075o=;
	b=RbZMpN8iOUFMKznjg0fR0pQtgFCA8x1WTzXYVAkvaQaVsbpP1O6g8IdYPDMjBo/JWjBh
	 LUvHjSYVuW/nUbD2ssca7WqP2LhHPUky1lAULabskictqnX36MSqeIoft+pD/9LroH99H
	 XGuXbmgBjhsS0pMLLhvWbyXNsaURC17UA849Ot2PRGHqvP9EjV6nDYBdjLRQmwjzsd0EJ
	 BeSQOGjx1SXAupbn15GY0DexeJA5sDijPfI0O3AgTvmp6ZMup1O2aGSTX+sny5AeqEfbC
	 6ntPW1SoS/UJEg+PpnRUtORcKZ2K3K8h+bPq1uPI16hNdmCtKBpX5FtFq3ICFls+nOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=EuqPa1OM;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=MVQxxnMb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E2F606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70E2F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=EuqPa1OM;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=MVQxxnMb
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDRq53224646;
	Thu, 29 Oct 2026 13:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=BZjkmYgWfs1QIh3GMhr+2y+GiVKeOOVF/OQnvJe07
	5o=; b=EuqPa1OM/pIZToc5WJHYPcqviqKmJexCHumfbxCVSNrqlT/CYH+h1IPxh
	xupk4jrFhsJEOFFLKEcweewaE9+3K2w8UhNtcpPoCBBLN+VnDSasnfFBa1eJ22T9
	C+XBX9s/LsgM/33LkCm+P/czAfwePD+cx5GXeG0AT+xRy/oy3bkaq+FWLR1U4pVS
	nPXXrdxw7yeLBx73KuymahnZ2jLzgW753Oh/SPrVTZXgdxbB+rUUB8++Z1KvqPs0
	6K5potZbT+8AuCwxRzsha/HAj05BB0C1Ewb8KFa75BpjjRdIGF0DgS7xzzBPMYkR
	qLENkTLxMhLgsWeCc01vz/yQn+C+g==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hm3h7kkm9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:13:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yq6H0z1geJQMlK3VqecTpiUsfMgIW+YsuKR8d4qWazuddVuxv+rkEJh1nskxixk76xOAKqpfju4YCmpINxO1aXfEXX9I/FbSSogZnG/LWk1wt5f+b3wPlwuGHo7HlRxTg9pxz5jmN0TPg3nrIumMa8hfq9Ph+iVTDFpjh96lF26RFxxnfJiBFOX1XdfVsm+AR5WleOH3JvGTx2hZZYl9VR5RROgoy7zXDrBTe2kJ/rOugDp/9uhZbZodqVrBEKaVZZeaws87CAgh7lwC7K6TvWxeofCjWkXYUca4SAsHmqiV1dN8B4nhKejkfoaRyTEmBzoszOaTE8mBLYB3mm158w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZjkmYgWfs1QIh3GMhr+2y+GiVKeOOVF/OQnvJe075o=;
 b=p6FZMfqJzVO31wtovUtkyMrkjYwMJ1cD+IaVNYzkTBcbn8+aEWLp2zIqG5LAb2JTKjWVyG8MWU5sqJXHdBLrk857kq103vzpa3dgbCvZmUcNiWuzy3YIS1uDUNJAmopx+e2Yg+nUZs621Nrg4PV9vvBaSHXaiyIaMPAir+puSnfYHdH73/pKC8VI0Iqm4iaizww6N+/KXtOecZUXpCqZUguXtelPEbXuUouvjlWJE/sdRzXdFHOypG/TCzKa9j8C0CB83OR+Eq/BkEV2hl/46ANn2qLDA0I1Fdu2BN+4jYXsNMECKkV58dRNWukRXSYAFwr2hY3cm+9OOBDsd6zZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZjkmYgWfs1QIh3GMhr+2y+GiVKeOOVF/OQnvJe075o=;
 b=MVQxxnMb/LNmWsLsA+XtvE6pqgFETVPV1Z3DBmz9vqT60jreiN+pqwCUNcHfvsGnaZLe/QmdDDatbx9ysj3P1oDswLUupMHdExZnyCyx7ahN6y/2eC5LUUaBQvXONx3yGaK0Obe9qWrOaESsJaguuMdPrDvrdgtmUx7SVHZrzfw=
Received: from PH8P220CA0063.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::27)
 by LV3PR10MB7914.namprd10.prod.outlook.com (2603:10b6:408:21e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Thu, 29 Oct
 2026 18:13:07 +0000
Received: from BY1PEPF00026957.namprd05.prod.outlook.com
 (2603:10b6:510:2d9:cafe::41) by PH8P220CA0063.outlook.office365.com
 (2603:10b6:510:2d9::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 18:13:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF00026957.mail.protection.outlook.com (10.167.244.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:13:05 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:19 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:19 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmM93408718;
	Thu, 29 Oct 2026 13:12:16 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 09/22] firmware: ti_sci: Fetch info struct from handle inside ti_sci_do_xfer()
Date: Thu, 29 Oct 2026 23:41:34 +0530
Message-ID: <20261029181147.266771-10-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026957:EE_|LV3PR10MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a93f3a3-e50f-4284-5c4d-08df35e8473c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|10067099003|22082099003|18002099003|261026140227099003|261028144727099003|261021121427099003|261009223027099003|261026121527099003|261021123027099003|261009220027099003|261009223327099003|261022105027099003|261009221227099003|56012099006|261009221727099003;
X-Microsoft-Antispam-Message-Info:
	hry70B66QY5cRnVuN2MWJ9AoEAEXkncYuwXYD+wgGAS3KJYUjd8wtH2Lrv6+3DMKEXYcJt4yfOR3gN3nf9mnLqdSWCRScQzp6uKgjKyeNSAwSDVU96ujLzyteloVojt9Vsc1DfE40b4dOGeFZB7ULMtoz/mTl1/DMojj9dUwJeUPv6ao/yYQ0crX7YgQY2ho8ODbLXEBAT6m6bvpajzZx7PQUOt8IcYSbr+5aoF8QT7aUfLB05YL46KRwqcrr2to07w5gcvs1hUsYqGkzgWqYKMT85TCpj3ECidJIBQBr2T3TepJi7vF4laxyeIV6WAEr1TLp5CLf6YuxRV39B2nQREU9+T1hpryn1cOWP3CmSlruKbIfQu60Y9TQZfqdjx8juc4+x77xFWwSuUl4skYhaWZDZFfHpO6UCofqMYJdLeYZOaDxOqd6BLR/x6n/1rm0RyGs+VGmoHN4rrvXaTQZM7tSx5RVVY743gCfDz69w5GkiZLjkIZzDdfqrajt1lGvhZmprziPxzWM1F6z/CvsKTGaU1cHBDZNPcjrb4TS8ZtwqEVQPh/JR5Gl5Ek/eUguqQ/PifOmQtT9PZttEt8a45dwmDheaFFJavhWepSn1d7ndvhiTOufz7tZQNL2DqOdGiEd7jMrErTMN7qyowzxAg0LhkJ+fqWArt0/0n+cn0=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(10067099003)(22082099003)(18002099003)(261026140227099003)(261028144727099003)(261021121427099003)(261009223027099003)(261026121527099003)(261021123027099003)(261009220027099003)(261009223327099003)(261022105027099003)(261009221227099003)(56012099006)(261009221727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rsdFzgiYLJrRhO8e8HAEsEVxTzRniD82FjKD7RssuCCc323n3iCFnXc1CXTg8uvXRj50FPAqZn2jvud6Kw/7qFBsG4PHPM9AaKsQlQqNKl5tWFcJXMqen4pDioLJvKhologQYdZV70IGVT+5TWcLEppSqDnh+jwilWiEf1Me9EoMjBk3WeSFS+wVx9a2y3qv92mCM6hb/qoyyYAeZVQRs3z2ALXmYyP0X0ZO8S9tVuUHL5JKWCn6ILtiQI72klbaaU2SnpXaB7V9c0d5iXBXM2ObeTMd9YQ210+fQFN6W6iLCUiTLuGh7xtmNJmhjRWHZdPXkizWrHnJaxq8Du+m4Khr67u/hXUgNmVhHamTMm5Kqr7F9oqLhljrxN6HuFuG05tOfQe4sb6LN5kVOPrNj87NOkyCvuh2uZ4a3mG2fRHH0sHobvDxHfXY9yw5k2eK
X-Exchange-RoutingPolicyChecked:
	qzpPSJqZE7C3JuD+YDyHIJCduJOQWxYNHwCnUbK8Bprlruq8L11MyF0zKj2slHqeeF1ya+u/eQIl7I1BRj/LqtzNQExyHQ0yX0sCumyONHvljNhmmOBeCpOHI/bQdWt7iJZRFu9Yh/Zgssxkc6q98NorEPcoo8vdELhpKdw2a5xmaOW//pyxY2EWXbR0DZJHBgrRME5x5N+JyrRaUVPmw2A47hBa5nDBiDi/Oj1zI6drd9DauO4GnNAvceTafBptpvOZVKj+4FNrNB71PRETHGFdCdhMwrwc29lBWCh6wTZKThWPci1hf4f16B3QEyVeDYLRPZMt7CKdUQZYbpW4og==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:13:05.2414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a93f3a3-e50f-4284-5c4d-08df35e8473c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026957.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7914
X-Authority-Analysis: v=2.4 cv=fv1J914f c=1 sm=1 tr=0 ts=6ae38cbc cx=c_pps
 a=6Zlfg0iwFc/B+5Yb0ubQ1w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=we-QN_a4EPTVeeq35NwA:9
X-Proofpoint-ORIG-GUID: 6KzI3yrvk-VF8_O_xEu10SW02_wIb4Mj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX2BNsK0m6BHtG
 xHJbzr0UGtWGfduJY+56MAu3cNLMHYqTpSxuqEpyK39QQqrpKWAJN+bPVB5X/OffUnAwS5GYGI7
 YfoJyK8v/2J0Dyx5X/d02BB96GLG3V//iKMtcskwY+9JTXdixvCiuTTkb9q285osiUV5G39xfah
 kK1c5WMQyAnk7UlbgasilXXKcR1GvPCka8uIOeVnVEoimVuR8BNMcdPkxD7c4Mt1itKIp/L5p8V
 RhRKgjsu80CBKaYOXMUmCdNUQfHn3Iyn34LyeMeRBVw2sRn4WYD1Y9pN8Hlt78FCyH1ohenNTB6
 xJ06F9RPWIryqWNC6BETU287PiLGhsq9aKXv2JDKCYdQPiRIVJBwI0NucUIGM139kb/2FF1cUEQ
 7W0haPp1hn6LH9loIRKsnCdS1vMLtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX8bP+x9BZNtb6
 RWzg5TJKbl/V+rt944S7puzPxLMNbjTbY0EtE/x+zNrIC2Lgu5zoaYhZraIYfICecl1nIIRGdze
 7KtJOzkvrr1zu3IApBvSffXDhCOkfaA=
X-Proofpoint-GUID: 6KzI3yrvk-VF8_O_xEu10SW02_wIb4Mj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290071

From: Andrew Davis <afd@ti.com>

As the only use for the handle is to fetch the info struct, which is only
used by the ti_sci_do_xfer() function, move the info struct retrieval
into that function. This also allows us to move the handle validity check
inside also, saving us from needing to do this at each message function.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-10-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-10-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 306 ++++++++------------------------------
 1 file changed, 60 insertions(+), 246 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 6d0ecb77d731e..dbe192142bf17 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -435,7 +435,7 @@ static inline bool ti_sci_is_response_ack(void *r)
 
 /**
  * ti_sci_do_xfer() - Do one transfer
- * @info:	Pointer to SCI entity information
+ * @handle:	Pointer to TI SCI handle
  * @msg_type:	Message type
  * @msg_flags:	Flag to set for the message
  * @tx_message: transmit message storage location
@@ -443,23 +443,26 @@ static inline bool ti_sci_is_response_ack(void *r)
  * @rx_message: receive message storage location
  * @rx_message_size: receive message size
  *
- * Return: -ETIMEDOUT in case of no response, or
+ * Return: -EINVAL if @handle is NULL, or
+ *         PTR_ERR(@handle) if @handle is an error pointer, or
+ *         -ETIMEDOUT in case of no response, or
  *         -ENODEV in case of a NACK response, or
  *         corresponding error if xfer allocation fails, or
  *         corresponding error if transmit fails, or
  *         return 0, if all goes well.
  */
-static inline int ti_sci_do_xfer(struct ti_sci_info *info,
+static inline int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 				 u16 msg_type, u32 msg_flags,
 				 void *tx_message, size_t tx_message_size,
 				 void *rx_message, size_t rx_message_size)
 {
+	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	bool response_expected = !!(msg_flags & (TI_SCI_FLAG_REQ_ACK_ON_PROCESSED |
 						 TI_SCI_FLAG_REQ_ACK_ON_RECEIVED));
 	int ret;
 	int timeout;
-	struct device *dev = info->dev;
+	struct device *dev;
 	bool done_state = true;
 	void *caller;
 
@@ -470,6 +473,14 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	 */
 	caller = (void *)_RET_IP_;
 
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+	if (!handle)
+		return -EINVAL;
+
+	info = handle_to_ti_sci_info(handle);
+	dev = info->dev;
+
 	xfer = ti_sci_get_one_xfer(info, msg_type, msg_flags,
 				   tx_message, tx_message_size,
 				   rx_message, rx_message_size, caller);
@@ -551,7 +562,7 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	struct ti_sci_msg_resp_version resp;
 	int ret;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_VERSION,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_VERSION,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -579,22 +590,14 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 				   u32 id, u32 flags, u8 state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_device_state req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.id = id;
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_STATE,
 			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -619,24 +622,16 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 				   u32 id,  u32 *clcnt,  u32 *resets,
 				    u8 *p_state,  u8 *c_state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_device_state req;
 	struct ti_sci_msg_resp_get_device_state resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
 	if (!clcnt && !resets && !p_state && !c_state)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.id = id;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_DEVICE_STATE,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -905,22 +900,14 @@ static int ti_sci_cmd_dev_is_trans(const struct ti_sci_handle *handle, u32 id,
 static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 					u32 id, u32 reset_state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_device_resets req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.id = id;
 	req.resets = reset_state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_RESETS,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -962,18 +949,10 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 				  u32 dev_id, u32 clk_id,
 				  u32 flags, u8 state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_state req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -983,7 +962,7 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	}
 	req.request_state = state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_STATE,
 			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1009,21 +988,13 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 				      u32 dev_id, u32 clk_id,
 				      u8 *programmed_state, u8 *current_state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_state req;
 	struct ti_sci_msg_resp_get_clock_state resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
 	if (!programmed_state && !current_state)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1032,7 +1003,7 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_STATE,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1222,18 +1193,10 @@ static int ti_sci_cmd_clk_is_off(const struct ti_sci_handle *handle, u32 dev_id,
 static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 				     u32 dev_id, u32 clk_id, u32 parent_id)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_parent req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1248,7 +1211,7 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 		req.parent_id_32 = parent_id;
 	}
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_PARENT,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1272,18 +1235,13 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 				     u32 dev_id, u32 clk_id, u32 *parent_id)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_parent req;
 	struct ti_sci_msg_resp_get_clock_parent resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle || !parent_id)
+	if (!parent_id)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1292,7 +1250,7 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_PARENT,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1322,18 +1280,13 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 					  u32 dev_id, u32 clk_id,
 					  u32 *num_parents)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_num_parents req;
 	struct ti_sci_msg_resp_get_clock_num_parents resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle || !num_parents)
+	if (!num_parents)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1342,7 +1295,7 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1381,18 +1334,13 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 					 u64 target_freq, u64 max_freq,
 					 u64 *match_freq)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_query_clock_freq req;
 	struct ti_sci_msg_resp_query_clock_freq resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle || !match_freq)
+	if (!match_freq)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1404,7 +1352,7 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	req.target_freq_hz = target_freq;
 	req.max_freq_hz = max_freq;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_QUERY_CLOCK_FREQ,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1438,18 +1386,10 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 				   u32 dev_id, u32 clk_id, u64 min_freq,
 				   u64 target_freq, u64 max_freq)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_freq req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1461,7 +1401,7 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	req.target_freq_hz = target_freq;
 	req.max_freq_hz = max_freq;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_FREQ,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1485,18 +1425,13 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 				   u32 dev_id, u32 clk_id, u64 *freq)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_freq req;
 	struct ti_sci_msg_resp_get_clock_freq resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle || !freq)
+	if (!freq)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1505,7 +1440,7 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_FREQ,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1533,7 +1468,6 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	u32 msg_flags = mode == TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO ?
 			TI_SCI_FLAG_REQ_GENERIC_NORESPONSE :
 			TI_SCI_FLAG_REQ_ACK_ON_PROCESSED;
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_prepare_sleep req;
 	struct ti_sci_msg_hdr resp;
 	struct device *dev;
@@ -1544,15 +1478,14 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
 	req.mode = mode;
 	req.ctx_lo = ctx_lo;
 	req.ctx_hi = ctx_hi;
 	req.debug_flags = debug_flags;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PREPARE_SLEEP,
 			     msg_flags,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1578,7 +1511,6 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 					u64 *fw_caps)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_resp_query_fw_caps resp;
 	struct device *dev;
@@ -1589,10 +1521,9 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_QUERY_FW_CAPS,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_QUERY_FW_CAPS,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1617,7 +1548,6 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 				       u8 state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_io_isolation req;
 	struct ti_sci_msg_hdr resp;
 	struct device *dev;
@@ -1628,12 +1558,11 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_IO_ISOLATION,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_IO_ISOLATION,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1658,7 +1587,6 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 					  u32 *source, u64 *timestamp, u8 *pin, u8 *mode)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_resp_lpm_wake_reason resp;
 	struct device *dev;
@@ -1669,10 +1597,9 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_WAKE_REASON,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_WAKE_REASON,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1704,7 +1631,6 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 					    u32 id, u8 state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_lpm_set_device_constraint req;
 	struct ti_sci_msg_hdr resp;
 	struct device *dev;
@@ -1715,13 +1641,12 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
 	req.id = id;
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1744,7 +1669,6 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 					     u16 latency, u8 state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_lpm_set_latency_constraint req;
 	struct ti_sci_msg_hdr resp;
 	struct device *dev;
@@ -1755,13 +1679,12 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
 	req.latency = latency;
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1786,7 +1709,7 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_ABORT,
+	ret = ti_sci_do_xfer(&info->handle, TI_SCI_MSG_LPM_ABORT,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1798,19 +1721,11 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 
 static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_reboot req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SYS_RESET,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SYS_RESET,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1840,21 +1755,16 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_resp_get_resource_range resp;
 	struct ti_sci_msg_req_get_resource_range req;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle || !desc)
+	if (!desc)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.secondary_host = s_host;
 	req.type = dev_id & MSG_RM_RESOURCE_TYPE_MASK;
 	req.subtype = subtype & MSG_RM_RESOURCE_SUBTYPE_MASK;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_RESOURCE_RANGE,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1943,16 +1853,8 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_manage_irq req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.valid_params = valid_params;
 	req.src_id = src_id;
 	req.src_index = src_index;
@@ -1964,7 +1866,7 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	req.vint_status_bit = vint_status_bit;
 	req.secondary_host = s_host;
 
-	ret = ti_sci_do_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+	ret = ti_sci_do_xfer(handle, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
 	if (ret)
@@ -2250,14 +2152,8 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_ring_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR_OR_NULL(handle))
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.index = params->index;
@@ -2270,7 +2166,7 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	req.virtid = params->virtid;
 	req.asel = params->asel;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_RM_RING_CFG,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_RING_CFG,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2295,21 +2191,13 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_psil_pair req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.nav_id = nav_id;
 	req.src_thread = src_thread;
 	req.dst_thread = dst_thread;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_PSIL_PAIR,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2334,21 +2222,13 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_psil_unpair req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.nav_id = nav_id;
 	req.src_thread = src_thread;
 	req.dst_thread = dst_thread;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_PSIL_UNPAIR,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2374,14 +2254,8 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_udmap_tx_ch_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR_OR_NULL(handle))
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.index = params->index;
@@ -2403,7 +2277,7 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	req.tx_tdtype = params->tx_tdtype;
 	req.extended_ch_type = params->extended_ch_type;
 
-	ret = ti_sci_do_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
+	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2429,14 +2303,8 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_udmap_rx_ch_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR_OR_NULL(handle))
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.index = params->index;
@@ -2455,7 +2323,7 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	req.rx_ignore_long = params->rx_ignore_long;
 	req.rx_burst_size = params->rx_burst_size;
 
-	ret = ti_sci_do_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
+	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2481,14 +2349,8 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_udmap_flow_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR_OR_NULL(handle))
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.flow_index = params->flow_index;
@@ -2512,7 +2374,7 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	req.rx_fdq3_qnum = params->rx_fdq3_qnum;
 	req.rx_ps_location = params->rx_ps_location;
 
-	ret = ti_sci_do_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
+	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_FLOW_CFG,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2534,19 +2396,11 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_proc_request req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PROC_REQUEST,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_REQUEST,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2568,19 +2422,11 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_proc_release req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PROC_RELEASE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_RELEASE,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2605,20 +2451,12 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_proc_handover req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 	req.host_id = host_id;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_HANDOVER,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2646,16 +2484,8 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_set_config req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 	req.bootvector_low = bootvector & TI_SCI_ADDR_LOW_MASK;
 	req.bootvector_high = (bootvector & TI_SCI_ADDR_HIGH_MASK) >>
@@ -2663,7 +2493,7 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	req.config_flags_set = config_flags_set;
 	req.config_flags_clear = config_flags_clear;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CONFIG,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CONFIG,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2689,21 +2519,13 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_set_ctrl req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 	req.control_flags_set = control_flags_set;
 	req.control_flags_clear = control_flags_clear;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CTRL,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CTRL,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2730,19 +2552,11 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_resp_get_status resp;
 	struct ti_sci_msg_req_get_status req;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_STATUS,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_STATUS,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
-- 
2.34.1

