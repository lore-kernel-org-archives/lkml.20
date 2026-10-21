Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792564631;
	b=JZwz6rCBq0ylERd2aWHxKNRZM09MVfLsjJzDJWUX4ljUcLpUPGTYwZiJq06oFMalJZtf
	 bUnhpDkSoV/HEJOYUYErIDocONVh4eiET2UzAO4CFbg2LRC30LBJZK38mGtSgzsmja6kw
	 bqVdPWtoKywD4ubYpFzA4a4G17o20h9tXT70G1a/aHhUFxscVOL1nHSTRLD6btocIlicQ
	 Bepdh9jSKOohZzH3hjBToHQACtrF1H4sKFN/e2CYlEcEUf1KCYCMqGIKz8Xt/9PTY7uZx
	 RyWrwHAk4RtSt0fUgZMYzVgNb4j5lLWDhKLmfTPsMX5+NVoTIwYxwQkf7RCTA2hWzWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564631;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ULXrJa3WNZcRG19tDBaKKrdU7u9EalB++fU90eJSDRo=;
	b=BfBIK1qpU33CLHts7ffQ0Nw728QQUZplGec3eBqSmpqjllwm/gRkw4ZXn/AP+dfqiAh7
	 Cfvk8a7r70gqT/RV+0YvtWe7PPoPFT0BxG9d4h5aCLWfrSdSFtFjDsK9M5Ry4D6GjWqug
	 J9hb3qXmTBi8cjANsk2MLG4Y1wTzT2HqedDKhjliq1P0cxcaKerlJxVqksjiLcGbWuPu9
	 aSErHtfpat+QDAJqZpniupEbwtqrh600a1Hy6jVOdrUNjdwjGHOeCCkjtpOpzE+8efC5D
	 Mxzt95ftJL79jdtU+aXuZQNgrfq7ixVKzJ4+WdgG49uKGg6ecn9XomGpBr9NkJXv2/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=A4S7ybqK;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=ijp0iaIz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4C4606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE4C4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=A4S7ybqK;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=ijp0iaIz
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69L5hKFS3643517;
	Wed, 21 Oct 2026 01:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ULXrJa3WNZcRG19tDBaKKrdU7u9EalB++fU90eJSD
	Ro=; b=A4S7ybqKytgd9dwaB4H58T27WDDl/v9E1OOjNucppCIB+ehfKh2TGgsTq
	FgUXDEwNB6dS9UKz1Wi/TDILWMOyoJgez2B+rcppAl0qrBIBqGksIjJJViJVipbP
	PsmQcanX5xs8YTl5yzzTBGh0sNc8zQc7FWuTOhoQ0IVtoSzWDUDoWLl0Hkgo6gsb
	aoUkj6v5HhIbTaL/ZU1Q6mKjC1ZxaC1XQ49KI9wZuzAUWDX4SWqkWAP6dac4Zf7O
	fpVQTIilCuLpo59NBRsyKPtQX90yF0nOX+5VeCzcfauT7bxOpKHDrV9we8M3lwA5
	P79X3jqHFecfyt1U7IgzNUgSb+xQA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hek209kjt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 01:37:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBEnqE2eLhOG3eDmsFfFuoAd/aT5WCs/S0+RsJ9fdhg2p/UnSwoXhplx1X9qqgit+aQQYluNVXsjL5XfwiB7ogxQNoPbtavt7b9uDty/SMnWXVDuOcU2ournr3LzMEYTacETr8B4b5o0cW+OxDAAun4cyovQNNCqRsHEVChVwpM0vBcmE/XIv+pXwb4DouyXyWDYvXClnqib5XMhGJ/K8/aYwFtVAdwroCdd3k/kvyd4+t41uEW5fNuhn32/65AzXqgLRvG4bDq0xp9XJRaFsv9II4cZYfdRasFd4rxQray6Cr0/TInxWJNRJ4HErGp6SAxlayWoPXOymhJhzlLsEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULXrJa3WNZcRG19tDBaKKrdU7u9EalB++fU90eJSDRo=;
 b=BtvB7uaHYfdLot2mUAwMBMU5RpDttZiq0+rOD8HK9dpoD7qMuebqlThmzbR8fuUdNwAfurBTH80nbgyv3qpdQ5xXyxZPssl708bWLmip9FlVXJ2Er9gLVHskE65iBIDwlUIsHxspF8bG6Y6Ak/bbZTGQ1ONhlfA29q078dw9+qpjs55Bg7OQ5qLNlyAkcfDLjsyGKac/6EnIKwTvNGU+y8LSSMBepUPyTd5HHGzp/mxEfTv2CGZtYuulOCWdTw+l5Cu4gRC7CuSoudd2sg6aO8L9ccOJ/F3Do9NyqlqQWlnDSQnjC3fiuK+TeIE0wPuYRoH94DQ4WCF9borhnih7xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULXrJa3WNZcRG19tDBaKKrdU7u9EalB++fU90eJSDRo=;
 b=ijp0iaIz+yFYg5R3JwMIrciA9sUdBJSnI9vD+0aZF6/fVn8WIWWKvj3gP3GglrDBUKe0QOBjX0yOdQw6HD44JpTC9+kmFkWMbhQU59625AGjP/b/FjWMaKDm5aLP0tfGdEJFUvvlcHPNdmUGD/j+nUkt6dzDn5vrkC6wD3psOF0=
Received: from DS7PR05CA0027.namprd05.prod.outlook.com (2603:10b6:5:3b9::32)
 by DSVPR10MB997871.namprd10.prod.outlook.com (2603:10b6:8:45c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 06:37:01 +0000
Received: from DS2PEPF00006E20.namprd05.prod.outlook.com
 (2603:10b6:5:3b9:cafe::10) by DS7PR05CA0027.outlook.office365.com
 (2603:10b6:5:3b9::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Wed,
 21 Oct 2026 06:37:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00006E20.mail.protection.outlook.com (10.167.23.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 06:37:00 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 01:36:24 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 01:36:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 01:36:24 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69L6aKAS3005851;
	Wed, 21 Oct 2026 01:36:20 -0500
Message-ID: <fc306acb-e9ea-4b5b-804a-4d6eeedd9066@ti.com>
Date: Wed, 21 Oct 2026 12:06:19 +0530
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
Subject: Re: [PATCH 3/3] soc: ti: Add TDA54 SCM configuration syscon support
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <vigneshr@ti.com>, <afd@ti.com>,
        <a-limaye@ti.com>, <y-abhilashchandra@ti.com>
References: <20261019080736.944127-1-m-shah@ti.com>
 <20261019080736.944127-4-m-shah@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20261019080736.944127-4-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00006E20:EE_|DSVPR10MB997871:EE_
X-MS-Office365-Filtering-Correlation-Id: 0430c97b-d270-4341-0481-08df2f3db65d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|4143699003|56012099006|261009223027099003|5023799004|10067099003|261009221227099003|18002099003|22082099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	dMiN94cH2Mh7fGTIi6IepmjID+TslhDYDHzWXNvtNNt8R+sSw8UW1QB7wEQ7RQZ1Y2YG3dZUlzqOW1BEJ8AcG3s8tvfOptQeziNLnETdBBxEaczp54etk5/vo2tjK0pJ/jm1m3FjL80I6lMrUw+/BDfQpPZiyBNIG2iz8PnQVERpUkO5C7MqYu6cm6fWhy9hD4NIb35keBV1h62nIIXVBzHg2MRkgTKxwmdURpHC0q5aCKLPMebNnMXVU62Xajj7mfJbMAT43f0nr8UIVMSTvsE3x25Q512jGplLpF5ebepDXFF93IFyjTwqZbxv2QB49cmCf3764bUkTxByrvZks1nbfiSk9FI7bOK3MGQwoaSPNTc4Y4NYe3tUQY/fRfb8JYab3y0G53/WEAd0mD2u49AE5vqSJ74BnhC3vVe2fLeerOFIElRgWFYgPWuOZOD7ro6HCidEBB8WoiWCAbAYZTvZPlwRRqG9SJqcnNH/o70v/QhmQ4ZfyaOQAat/nH+H7FoPxJpU/KoE65JCNUPfpwU0uDZtbQzLRG8/WPhPhPwrg2NydlwkncpbBDwuAoueoI26TL9SfGcq8xrxmznjDLu69CHAizJAmyLe7thdlptNNMgQWpIqoGqLiXAy+hEpVRhkb4jkiN+PNSB1wlNz+w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(4143699003)(56012099006)(261009223027099003)(5023799004)(10067099003)(261009221227099003)(18002099003)(22082099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BZP30gOyUkf0pLxFujW+euuw4sf8ACvbxlV8bfluyZUPaDAO3G5TvOpR4GKwzYz9iTprz6Gb47lW6EdPdGOFWORw4klprJDF7CaLZFYxhqe5uCXFjPtI9EAo0RblHj92zBFeLp4f3sz3VI4ORhe2o2h4OmXbsFqmvUgjdnGm5GH+lb36ZCVfx4SuohORU0cyXBodAPfwb5HaO0xrBSVQhxWYA8rgNKPal2XLgYNxbHrgxz/h/mhaIm025K32c6v/BUzQ2KkCm81UL6/uogXS1dZcOEXEwVYgRSw2fMM/91PbA2jFoyrRW+8vwSFIdjCm8XacBgHUK7Zgw28Wb+z2qiRxzIXFR1e7CXrhOCybqin+kb1icCI1etF1IwdbKtfWmHWw7HCA/seuYhiKFtB6sO+aW+b2tlrhACc4N8nfOA9otU0GbntVRTu7Qe2Yw60Z
X-Exchange-RoutingPolicyChecked:
	QLzuppqT9mhqAZsdLNuui/tKB0w/GBkibVhbk+tH1Gaus0qv8AJ99DhAbEPyJmK7B65bUFrtcN/PKshzrKq/XREs0bzgGoqVmiUpEt25PlR6oBULJjnH2YRG3nkezsvaIPY37ICmzHQ6EgREhx1aNDa+8gnQS0wJQ7gs91upzgfOzmVaJj8YtIRhcuZxe6QPl8ZslJH3bWWBYqDsFw4nUyX/ZFZhC6DIwNpzuckA9r99G4AkOoW8Rkq2Ep57YiaMmpyI6VS8Wd5DRO6Z/9xJBS+fPePLW+eSD2sAfHHlsJTuw5a2OrH+xQjCXbyVB6FASif7S77HV0dRpwAN5Fwhrg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 06:37:00.7974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0430c97b-d270-4341-0481-08df2f3db65d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00006E20.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997871
X-Proofpoint-ORIG-GUID: cyOWc5n0AW6FtxP4CQOZaR41Y7g3jgcB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNSBTYWx0ZWRfXyCQB9YncOUjk
 Ziuz8AHepyF+xG/WorMeNCK+jUDk+gHIqsUcOTAZxRHgsD7lZDcu1iV24KrlGH/6GVVlvYPoqDq
 Nb/YxTdMlWIoCD9N/80a4phCkoFsWRw=
X-Proofpoint-GUID: cyOWc5n0AW6FtxP4CQOZaR41Y7g3jgcB
X-Authority-Analysis: v=2.4 cv=B98sQ+tM c=1 sm=1 tr=0 ts=6ad85d91 cx=c_pps
 a=htKwazZePKloe4WR6Wq9JA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=c92rfblmAAAA:8
 a=ixABmuGL66X7GOlbhUIA:9 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNSBTYWx0ZWRfX9yIX3/r0Gh/9
 WDYNwedoqAXk1HtVp1+77WIuUkNBk+NvEAj/8WXgWmXbeS85nftxZboPDH3pJENNNMkAE+Cmykg
 aeMsTjcZBjc/I5cAcuUTnVB0EJTtYdnR/+um5dLJIeGnaKmwg+IJaQ+yGvD5F19G4bD6kIa6epq
 NsEqGO7zTgQMmrghhm0Oss7+0ISo4X6j4VUg9vF7MKiVdNOVd3xGt5NG4IX1MLwfpWEAEoV4hO9
 j/Uqzy0Xp1v1La65YNTdUIAsMn0JsI5LkvqBHiMoBAXe9muT6wMOtJXr9aekYp95ndMJdJecPfY
 ojW7osYljlQjszOgZ6HuOJ0xdsmWYChtEh+viD/BOpz0+XwDLZIg9ooPk+AcRF6t80G0q7GAAON
 qgT9vJHHw1X/9HhR/U9q27PB6G+GLaoZUd0FREURRN0O/mNY8Izi/3a61P2NluPM7YdMfWhpcgh
 iULgJAiBQuOUlgXUygw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210025


On 19/10/26 13:37, Moteen Shah wrote:
> Add the TDA54 SCM configuration driver providing access to the SCM register
> space through regmap/syscon.
>
> The driver handles proxy-based register access and SCM unlock/claim
> handling, and registers TDA54 SoC information using the common K3 SoC
> info helper exported by k3-socinfo, for which the TDA54 part number is
> added to the SoC ID table.
>
> Default the option to m on ARCH_K3, so that the driver gets built for TDA54
> boards without requiring a defconfig change.
>
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
>   drivers/soc/ti/Kconfig             |  16 +++
>   drivers/soc/ti/Makefile            |   1 +
>   drivers/soc/ti/k3-socinfo.c        |   2 +
>   drivers/soc/ti/tda54-mcu-sysconf.c | 216 +++++++++++++++++++++++++++++
>   4 files changed, 235 insertions(+)
>   create mode 100644 drivers/soc/ti/tda54-mcu-sysconf.c
>
> diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
> index 163aadd589d3a..ea5da6722da29 100644
> --- a/drivers/soc/ti/Kconfig
> +++ b/drivers/soc/ti/Kconfig
> @@ -82,6 +82,22 @@ config TI_PRUSS
>   	  processors on various TI SoCs. It's safe to say N here if you're
>   	  not interested in the PRU or if you are unsure.
>   
> +config TI_TDA54_MCU_SYSCONF
> +	tristate "TI TDA54 SCM configuration controller"
> +	depends on ARCH_K3 || COMPILE_TEST
> +	depends on OF
> +	default m if ARCH_K3
> +	select MFD_SYSCON
> +	select TI_K3_SOCINFO
> +	help
> +	  Support the SCM configuration controller found on TI TDA54.
> +	  The controller provides a syscon regmap and is also the
> +	  hardware access path used to obtain and register K3 SoC
> +	  identification information.
> +
> +	  This driver can be built as a module, in which case the module
> +	  will be called tda54-mcu-sysconf.
> +
>   endif # SOC_TI
>   
>   config TI_SCI_INTA_MSI_DOMAIN
> diff --git a/drivers/soc/ti/Makefile b/drivers/soc/ti/Makefile
> index cb800a745e66d..33f4ddca32ed6 100644
> --- a/drivers/soc/ti/Makefile
> +++ b/drivers/soc/ti/Makefile
> @@ -11,4 +11,5 @@ obj-$(CONFIG_TI_SCI_INTA_MSI_DOMAIN)	+= ti_sci_inta_msi.o
>   obj-$(CONFIG_TI_K3_RINGACC)		+= k3-ringacc.o
>   obj-$(CONFIG_TI_K3_SOCINFO)		+= k3-socinfo.o
>   obj-$(CONFIG_TI_PRUSS)			+= pruss.o
> +obj-$(CONFIG_TI_TDA54_MCU_SYSCONF)	+= tda54-mcu-sysconf.o
>   obj-$(CONFIG_POWER_AVS_OMAP)		+= smartreflex.o
> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
> index 5fae03004e350..9869dd6358d1f 100644
> --- a/drivers/soc/ti/k3-socinfo.c
> +++ b/drivers/soc/ti/k3-socinfo.c
> @@ -50,6 +50,7 @@
>   #define JTAG_ID_PARTNO_AM62PX		0xBB9D
>   #define JTAG_ID_PARTNO_J722S		0xBBA0
>   #define JTAG_ID_PARTNO_AM62LX		0xBBA7
> +#define JTAG_ID_PARTNO_TDA54		0xBBC1
>   
>   static const struct k3_soc_id {
>   	unsigned int id;
> @@ -66,6 +67,7 @@ static const struct k3_soc_id {
>   	{ JTAG_ID_PARTNO_AM62PX, "AM62PX" },
>   	{ JTAG_ID_PARTNO_J722S, "J722S" },
>   	{ JTAG_ID_PARTNO_AM62LX, "AM62LX" },
> +	{ JTAG_ID_PARTNO_TDA54, "TDA54" },
>   };
>   
>   static const char * const j721e_rev_string_map[] = {
> diff --git a/drivers/soc/ti/tda54-mcu-sysconf.c b/drivers/soc/ti/tda54-mcu-sysconf.c
> new file mode 100644
> index 0000000000000..8598080f6c48e
> --- /dev/null
> +++ b/drivers/soc/ti/tda54-mcu-sysconf.c
> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TDA54 SCM Configuration syscon driver
> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/soc/ti/k3-socinfo.h>
> +#include <linux/types.h>
> +
> +/* Size of a single proxy window into the scm_conf register space */
> +#define TDA54_SCM_CONF_PROXY_STRIDE		0x4000
> +
> +#define TDA54_JTAG_ID_REG_OFFSET		0x14
> +
> +#define TDA54_SCM_CONF_LOCK_KICK0_UNLOCK_VAL	0x68EF3490
> +#define TDA54_SCM_CONF_LOCK_KICK1_UNLOCK_VAL	0xD172BC5A
> +
> +/*
> + * Claim registers start at 0x3100. Claim register i holds the claim bit
> + * for each of the 32 registers in the (i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE)
> + * .. (i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE + 0x7c) block, one bit per
> + * register, i.e. bit b of claim register i corresponds to the register at
> + * offset i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE + b * 4.
> + */
> +#define TDA54_SCM_CONF_CLAIM_REG_STRIDE		0x4
> +#define TDA54_SCM_CONF_CLAIM_REGS_PER_WORD	32
> +#define TDA54_SCM_CONF_CLAIM_BLOCK_SIZE		\
> +	(TDA54_SCM_CONF_CLAIM_REGS_PER_WORD * 0x4)
> +
> +/* Per-SoC register offset data (platform data) */
> +struct tda54_scm_conf_data {
> +	u32 lock_offset;
> +	u32 claim_offset;
> +	u32 claim_status_offset;
> +};
> +
> +static const struct tda54_scm_conf_data tda54_scm_conf_data = {
> +	.lock_offset		= 0x3008,
> +	.claim_offset		= 0x3100,
> +	.claim_status_offset	= 0x3300,
> +};
> +
> +struct tda54_scm_conf {
> +	void __iomem *base;
> +	u32 proxy;
> +	const struct tda54_scm_conf_data *pdata;
> +};
> +
> +/*
> + * Make @reg writable through this proxy.
> + *
> + * Proxy 0 is the default access proxy for all unclaimed registers. Its claim
> + * bits are tied low, so it cannot claim anything and needs no claim to write;
> + * it can write @reg unless another proxy has claimed it, which is reported by
> + * the claim status.
> + *
> + * Any other proxy has to claim @reg first. Registers claimed by a proxy can no
> + * longer be written through any other proxy's address, until that proxy
> + * releases the claim. The claim status is set once any proxy owns @reg, so
> + * read the claim register back to check that the claim is held by this proxy.
> + */
> +static int tda54_scm_conf_claim(struct tda54_scm_conf *scm, unsigned int reg)
> +{
> +	unsigned int block = reg / TDA54_SCM_CONF_CLAIM_BLOCK_SIZE;
> +	unsigned int bit = (reg % TDA54_SCM_CONF_CLAIM_BLOCK_SIZE) /
> +			   TDA54_SCM_CONF_CLAIM_REG_STRIDE;
> +	unsigned int claim_reg = scm->pdata->claim_offset +
> +				 block * TDA54_SCM_CONF_CLAIM_REG_STRIDE;
> +	unsigned int status_reg = scm->pdata->claim_status_offset +
> +				  block * TDA54_SCM_CONF_CLAIM_REG_STRIDE;
> +	u32 val;
> +
> +	if (!scm->proxy) {
> +		if (readl(scm->base + status_reg) & BIT(bit))
> +			return -EBUSY;
> +
> +		return 0;
> +	}
> +
> +	val = readl(scm->base + claim_reg);
> +	val |= BIT(bit);
> +	writel(val, scm->base + claim_reg);
> +
> +	if (!(readl(scm->base + claim_reg) & BIT(bit)))
> +		return -EBUSY;
> +
> +	return 0;
> +}
> +
> +static int tda54_scm_conf_reg_read(void *context, unsigned int reg,
> +				   unsigned int *val)
> +{
> +	struct tda54_scm_conf *scm = context;
> +
> +	*val = readl(scm->base + reg);
> +
> +	return 0;
> +}
> +
> +static int tda54_scm_conf_reg_write(void *context, unsigned int reg,
> +				    unsigned int val)
> +{
> +	struct tda54_scm_conf *scm = context;
> +	int ret;
> +
> +	ret = tda54_scm_conf_claim(scm, reg);
> +	if (ret)
> +		return ret;
> +
> +	writel(val, scm->base + reg);
> +
> +	return 0;
> +}
> +
> +static const struct regmap_config tda54_scm_conf_regmap_cfg = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.reg_read = tda54_scm_conf_reg_read,
> +	.reg_write = tda54_scm_conf_reg_write,
> +};
> +
> +static int tda54_scm_conf_register_socinfo(struct device *dev,
> +					   struct regmap *regmap)
> +{
> +	u32 jtag_id;
> +	int ret;
> +
> +	ret = regmap_read(regmap, TDA54_JTAG_ID_REG_OFFSET, &jtag_id);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read JTAG ID\n");
> +
> +	return k3_socinfo_register(dev, jtag_id);
> +}
> +
> +static int tda54_scm_conf_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct tda54_scm_conf *scm;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	int ret;
> +
> +	scm = devm_kzalloc(dev, sizeof(*scm), GFP_KERNEL);
> +	if (!scm)
> +		return -ENOMEM;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	if (of_property_read_u32(dev->of_node, "ti,proxy-id", &scm->proxy))
> +		return dev_err_probe(dev, -ENODATA, "missing ti,proxy-id property\n");
> +
> +	if (scm->proxy >= 8)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "ti,proxy-id must be between 0 and 7\n");
> +
> +	scm->base = base + scm->proxy * TDA54_SCM_CONF_PROXY_STRIDE;
> +
> +	/* Get register offsets from driver data (matched by compatible) */
> +	scm->pdata = of_device_get_match_data(dev);
> +
> +	regmap = devm_regmap_init(dev, NULL, scm, &tda54_scm_conf_regmap_cfg);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	writel(TDA54_SCM_CONF_LOCK_KICK0_UNLOCK_VAL, scm->base + scm->pdata->lock_offset);
> +	writel(TDA54_SCM_CONF_LOCK_KICK1_UNLOCK_VAL, scm->base + scm->pdata->lock_offset + 4);
> +
> +	/*
> +	 * There is no way to unregister a syscon regmap, so publish it only
> +	 * once nothing else in probe can fail.
> +	 */
> +	ret = of_syscon_register_regmap(dev->of_node, regmap);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register syscon regmap\n");
> +
> +	/*
> +	 * SoC identification is informational, so a failure here must not fail
> +	 * the probe. It is registered last and released through devres.
> +	 */
> +	ret = tda54_scm_conf_register_socinfo(dev, regmap);
> +	if (ret)
> +		dev_warn(dev, "SoC info not registered: %d\n", ret);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id tda54_scm_conf_of_match[] = {
> +	{ .compatible = "ti,tda54-mcu-scm-conf", .data = &tda54_scm_conf_data },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, tda54_scm_conf_of_match);
> +
> +static struct platform_driver tda54_scm_conf_driver = {
> +	.probe = tda54_scm_conf_probe,
> +	.driver = {
> +		.name = "k3-tda54-scm-conf",
> +		.of_match_table = tda54_scm_conf_of_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +
> +module_platform_driver(tda54_scm_conf_driver);
> +
> +MODULE_AUTHOR("Moteen Shah <m-shah@ti.com>");
> +MODULE_DESCRIPTION("TDA54 SCM Configuration syscon driver");
> +MODULE_LICENSE("GPL");

Hello all,

I was going by the reviews from Sashiko[0], I had similar concern before 
sharing this patch upstream.
It would be really great if I can have some suggestions on this.

1. Have it inbuilt
2. Remove the module_exit, make the module unremovable
3. Look towards a core syscon fixup?

Option 3 would be to add of_syscon_unregister_regmap(np) and subsequent 
consumer driver changes.

[0]https://sashiko.dev/#/patchset/20261019080736.944127-1-m-shah%40ti.com

Regards,
Moteen

