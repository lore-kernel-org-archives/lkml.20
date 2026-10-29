Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297578;
	b=WUZJe99iSQ4sBvgXMaEHGCJBbCA8qG3fjLXRnWOYrYbMhvoZjyXyUF66CE/7CTrKNq0m
	 VJQ+y/15bbfMS2U5LmjvKAapLYTPK/i6FPkrcXL0BV2taG49Gn2pjnjfpiM3QUuWcJBY6
	 PA+ztlYZZ1p6dgfpuoFbbp3BcZMYg0tZlSExBVImwKvACNp4vofjJcxjq3Tj4/+okRH52
	 mdocHcIvibhwyCs6DWZ/QAPMOjlIiM2v+hB1TEfuIeOQZB5nU1QDj48uwSSkEsE6E82Nv
	 IdCq16oF2zSWWypo/HtVVSCjnkSDlmCx94RxPcOR4xvd6OmEqNJtxGoqgaJeUu8CgHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297578;
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
	bh=X3UUcJQn9fOXseU8MxDGpSMFM35ai7++fjc4u+F/nms=;
	b=Dyr2upXeeyFKlvKadH6gUi2005h4kfmKtuCrZgNpXXtwBQc1rXeyb6aB/bjzPVIoFLGB
	 hbPLqGRmY4cUsIyAJf+rIdi2pGrBzE1fLaW0DOK65UhPVnHAGUDFAyTMnd3942Hygs2Cg
	 Xo+ezt0RpaJwcNXH/i3AW2UWpbxe75fB7c+7lsvaWJFxkh30l3i8AJs7OTZ5qSFylIZVq
	 4kCcyXQ/W1Qo/eEHhtexkNM6ygX7zUUlg+ObdEPBGuE47l0XYB7/qGFjIpEkID5TN2rLX
	 u49AnByBNmfk0SG+hoG4yzj8hm6xlfC8w1P9WfVImA1Vco8l1M4YWbvtI7j+z9Rta2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=NZkeQfH8;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=CQw2hB2B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07418606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07418606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=NZkeQfH8;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=CQw2hB2B
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69TGDTIt1079046;
	Thu, 29 Oct 2026 13:12:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=X3UUcJQn9fOXseU8MxDGpSMFM35ai7++fjc4u+F/n
	ms=; b=NZkeQfH8Oi8p76YFSijrB2XyVmfhFJW+NxgHIslRFBGNcEQyqMkqcBdG1
	kKYglFjAMOqzD3zpgNLxpUkoIXdIyAjNYLymzuQjFXYL1Qd98wa4+NCgaiWxpnsm
	eSOtl7U3BMX0kk7peAkVTpkVEJzikb8sLDd1Lap/0GJAr0MANWo6rZ5CqRmwET1c
	slOo3iufdfBg32PFBd2pn1GXDJ0d4eBifjDdY4Uk6Ff8woKoY3ggk7TnuhUibfyk
	KX0enCf1Un6V+vD30ExZQ+Vc7wnQD7EpzuOPmbzBLIzNfcpNBv8OOPUzes6P2ESv
	BH9KsTpzgB6YnD7GTSF3xdU/s5jGA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012008.outbound.protection.outlook.com [52.101.48.8])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hkurvxanb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:12:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgw0WusJ0o2F40H8FOSdi58qlwZGbHdKte2llcmH6E2hsUkqYyKmTYkmTVWgrooUDZUd65LnsxvPG5ux2QXCkhink7ZTIfKRxss05zvu7xlSbCKyh3jFgZmMr09QW+14qRSTG1AAKyzhgm5kUBmVjU8OdjetDVE9oMQh+W4/E4YEdFKJal8amZntRpIdaY2lNtCUYOLeAJIrNUSUwdh3Z1XcWAK7iztDgAYmhRzMyEMiZPVPsKJI3uk9eid3mzs+NYCou6FDOT6U/3RUplCGUcmDCtPjMSTe6EuWyYsoKykMm0TgUnz7hjK5sD1G3fRlkwlyg5JIkECoGAeWFyQY4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3UUcJQn9fOXseU8MxDGpSMFM35ai7++fjc4u+F/nms=;
 b=JR5rmSjXF2lBEZFnk5LPbgixNCI5bL9ku3lA/WcD1ndNiQeSQkaX8PMkPZveG33N8SYfjk5/4NT0lNgqZXoX3jBGnjIWzLb7PkRL2LrzBCCCJgZg002NSrGL9Xl0bqTNaxZOi/q5l1oTFhsNcTRmdlTnxeszLkjp8XSk0IC47/4gNvP+1HsneIBjHMj6uq/UwfUb4IJPOFjyq5JWEKPQOTF6Gex1o7vSoq+L7Memsw+08wALrErAqUiKlSvHGawResIqJMIb/6jPu1kmxhECmknhCgvDxB5ou7+Eq5Kh1xZJyvC1jldynVTrX1uD/lrXM4kL33a5d2vkg2UG4d2VPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3UUcJQn9fOXseU8MxDGpSMFM35ai7++fjc4u+F/nms=;
 b=CQw2hB2B2qNinthq7BlXZmZZI3ftWQr6UfL8ye/OGZ7mbFEAMylJuAfFO54zk16nNCR/27WX1u693ylUD2oISc3rOGPQEeO2X0c0sR7brA+Xo4OVtJDwxOeFD8eCM9aXIl7O/vZpWBvZC6/c+fOmZcKTXUB/gKIHx2RDEFx0IOg=
Received: from SJ0PR05CA0076.namprd05.prod.outlook.com (2603:10b6:a03:332::21)
 by MN2PR10MB4223.namprd10.prod.outlook.com (2603:10b6:208:1dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 18:12:49 +0000
Received: from BY1PEPF00026958.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::15) by SJ0PR05CA0076.outlook.office365.com
 (2603:10b6:a03:332::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.4 via Frontend Transport; Thu, 29
 Oct 2026 18:12:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF00026958.mail.protection.outlook.com (10.167.244.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:12:47 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:07 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:07 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmM53408718;
	Thu, 29 Oct 2026 13:12:04 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 05/22] firmware: ti_sci: Name response variable resp for consistency
Date: Thu, 29 Oct 2026 23:41:30 +0530
Message-ID: <20261029181147.266771-6-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026958:EE_|MN2PR10MB4223:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd4cefa-b414-44bd-65f5-08df35e83c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|6133799003|18002099003|22082099003|13003099007|56012099006|261022105027099003|261028144727099003|261021121427099003|10067099003|261021123027099003|261009223027099003|261026140227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	ZkyFPrsivCbRnSnre+Dz7kUMeznl89PBmQPPdGBlCAmlC8GQJXJ7Ddg535hk/wHT0zS/cexv/GLA0FmE3GtCF4LIS11tnb6ovuQYEV7ztIp3A/hor6mmGZ6eDpV00q810RbF8AGLdGNuMOImvI8yTzpGSOKv3fNGsZJh1kUPBHnSaktugZy62XAZMGzslYmA+dJNSW3AM8QBg00gnxLbskthCCGzaxwPF+t8csrVEDEFfKVqMVOuSyqRdVCpngXBEc259qvAWAiIupKwt8FLSdbicxpzOLQegoicVcGPfSTIvKJYXJlnXAPmSWE+voJ8fDxb0Vqa7IJssHD8kHlALYLmdBZIS7HW7+dMj6m7x6TpNuq4mpeekgkCTBmtcyU+x0wXsJIltYFxuBA88iDaQLioxNE+jx0oe8vxaBb2eD1LhzQaOISbx32gkqjUU0sWpmO5wFxbWr1VWBYP919FfAamiBtCKHcwMSx3hSGQ9kX00686YWFQzNDM7dZUpPgh6nhMqVdB8/EXWIL5s1ewpWYjgGZ46lM6FcceRMkIurgHV4qwk4z4aisbchkOWQcwVd/opm7MSgt1FSTAsXdxDfdfnkIICY80AKu+kOOUvnkrQmNtdTt29Zwc8AsEsGnpMd8ucKKI1rtbLWcYYCAtcblc95ucFjo1sZLhBxWXibI=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(13003099007)(56012099006)(261022105027099003)(261028144727099003)(261021121427099003)(10067099003)(261021123027099003)(261009223027099003)(261026140227099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rt7Xds7rhZYeVd0OIYzAKvLP4g6vlOJqlZIIlMWMjyiV0V0/JJwa3sJo9eVPheNqLYmDt5cLF0bxbKFTkJNe2l0ZqXMbctLIxyvsYMP8JuFRTt70ncjmbqFhxnyZ+rrb1NZN3p3s3ETVhRN3ltPVkEmDVfkko8XB4dO78ewx9gsw7XpEPLlRfKgmcVuXRCkV5eRKoPV9mIX8yMgkH3h4jdXclY8gX4c6Zf5gTPdkll8QIwf3U3jiC416edxD1h7m+djNV2yQrlnrJCQdY64uxmp7PknfuN1NTErYk1joiv/z6VWKCnM7hOARbmgo25CEPYZXQOp5OCmb4K7UM1mKDbjivrBO/xtt4TphI54RfnTVKyGKD1FA4szI02/AWZOR4oCa2NsBVwNzEsP5m3tyCyvzVsn2o8F+wraCWcsc3A8OduUffdkUwvJQ+5HjaJHj
X-Exchange-RoutingPolicyChecked:
	RFVjvKYTP/fSOGRrQrXxMyn7oAzv6APSJhEy8Ixeovj33pTJ+IXPogs6BXZeXLJnnnnaEglzH34dAsdC+JdvqEONxspcldT3TIv7pfgkUb6ikB3MeCKdztu6ZAo23cc+W5/KSV1V2Pm9TffYbokvSgitpO/Y/9j69sz+g15XxShRxtZ5cL72ww0PICEyRiGWdEcqUBIc+QisG94F91L+NcsXckmMNozNKAwGhTMcx/Wp2DXZ+Xrii/fbXFcDRo/6zmRAL5Rjy4rWIOT5aR6uUbTxxigzR24g0b3uco2WKDgj6j/P7MkJoGDmPHsayp6EXF9SlWSEAIkgMUaMF5Z15Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:12:47.3212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd4cefa-b414-44bd-65f5-08df35e83c8f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026958.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4223
X-Proofpoint-ORIG-GUID: AE7iTC2QlyUaieESPdzhOdutzmq6gRYH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX9UKcOzcynOE1
 V18teBTeU7YjDsE+YtSxDv01yxrpee0GfTU7Eq9jLjZlK82Te/olNjubIXrF0Ka3lxvskZjo4EE
 2UyWbijOTJiuiVuow5TkcOVui7ju52SGyG47IkvLMxG3tsG9Zf8ebrFsWoWbbjVn0IheUZsHD5x
 CJ8O/CiOzy+8xrnsPyyCvQU0CTudn6lvjv8G0Q1iGlgoS4+om23KjuC2QitSk4Ep081cjWk1XGE
 VAgryS9885wUt26KncriY2cNOKX2/M5LtdX3m0s9FS3vxnxpXM0jCbYjbMtt39mixQciln8Nw7Y
 7l3YnlUgIBcywon1nvX0hFVIDKmCOxkwUbv+6SrNWzv5syQ/vVcjBhs0RlF+2+1T5b79jeQAwG7
 1b+l8vvQ1+y4/gxqOASvBwMw8Uclga6RQZvt10WpfsQPIA/ldpmgBiG+Ao4fTahvHch6SP60+pa
 xN7Ji02UK9bEElYdA+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX6gVy54fEf8me
 GYVBpiRa8TNWBe/vF12THrvlg+ZaCtdmFKxQf3YiS0mRjbDV9X/EgeB4OWl8mo6Ddir/+h+sz1Y
 BMQLnhhuIXemv8chPFxy10LFmPAcVng=
X-Proofpoint-GUID: AE7iTC2QlyUaieESPdzhOdutzmq6gRYH
X-Authority-Analysis: v=2.4 cv=DtrDa2/+ c=1 sm=1 tr=0 ts=6ae38ca6 cx=c_pps
 a=XFLf1xCRaRgjZQpZvgYG5g==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=M6PMnVrZl0hevMvwL7kA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290071

From: Andrew Davis <afd@ti.com>

All other TI-SCI call functions call the response variable "resp" except
ti_sci_cmd_get_revision(), fix this here. Also get assign the response
variable pointer after the transfer, again for consistency. No functional
change but does make later cleanups easier.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-6-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-6-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index a91db923c8939..9081288bd133c 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -507,27 +507,27 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 {
 	struct ti_sci_handle *handle = &info->handle;
 	struct ti_sci_version_info *ver = &handle->version;
-	struct ti_sci_msg_resp_version *rev_info;
+	struct ti_sci_msg_resp_version *resp;
 	struct ti_sci_xfer *xfer;
 	int ret;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_VERSION,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
-				   sizeof(*rev_info));
+				   sizeof(*resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	rev_info = (struct ti_sci_msg_resp_version *)xfer->xfer_buf;
-
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
 		goto fail;
 
-	ver->abi_major = rev_info->abi_major;
-	ver->abi_minor = rev_info->abi_minor;
-	ver->firmware_revision = rev_info->firmware_revision;
-	strscpy(ver->firmware_description, rev_info->firmware_description,
+	resp = (struct ti_sci_msg_resp_version *)xfer->xfer_buf;
+
+	ver->abi_major = resp->abi_major;
+	ver->abi_minor = resp->abi_minor;
+	ver->firmware_revision = resp->firmware_revision;
+	strscpy(ver->firmware_description, resp->firmware_description,
 		sizeof(ver->firmware_description));
 
 fail:
-- 
2.34.1

