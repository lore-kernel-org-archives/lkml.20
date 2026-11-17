Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920400;
	b=036G3dSbz8jvVO8jR3EcdhgD55vEWHAV9pg2BXjnk1j/QzC0F9nGnUk/4Icb5ZRwSWYB
	 Lf4ZDMhOjRUqzxA0utXUoq0voLLnWq+C8kqqDXm1NFx5cv5Uoxzbt4ofqqDGCLT9jtT8O
	 uL1hx+7l05TqDALo3iJCikvmHLtDA/fNMjInqJyMHzQoRcEvC8oVOGZvjg0XmZJ9K+U0H
	 J0mJoWfZwGmN/18KPLTvRXh9NrlrgQuCYs59fDCQT6snrDjBmkvZLp3rbxHbSacM6e2nD
	 +1VdqLl+QVGvJWntkNLSEcOlSew3bniFXGd29l+UTucLY/nVPBVZ0RebfHGXS/kQ5LA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920400;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=U1ZtlVQ2iAfaswAuoQi6Rc9bKe9JK3dYOkVv0OC/I/Q=;
	b=KINuGfqOG9YWJrwBM8QliTBeV0HLHTpG14sEeLa/Lmc/ok2mL/WvZtJ+SrhIf/LNRROt
	 4BwazFMeaiK0G6lbBbyN5CGY4KNj2iWBnNXwwGQ3IyntV8qcDAjo9ARzjbd7gJ6jByGH3
	 rTXlbte0CoYm5ViC81khc/uuh1j3ACF/AYdcc3AZVpXPKoR1GO4UOsJSaNJ3BZ5L1TGRs
	 zKcTH/AdcAWcp4ttRarlCCI1+v3R29NoZhZst1nl6r/ez2/49izI0x98xnsSZTE/S9KIO
	 6+s7IDJmJBeJCUG3+YO6/EbAIYvclgp5aEH4DDjg0EfwCuyvjGrApiMvhogzQuWijnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=QA4EKfuM;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=gV9GQBo5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A00606A335;
	Tue, 17 Nov 2026 13:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40A00606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=QA4EKfuM;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=gV9GQBo5
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHBtYHX4106916;
	Tue, 17 Nov 2026 06:59:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=U1ZtlVQ2iAfaswAuoQi6Rc9bKe9JK3dYOkVv0OC/I/Q=; b=
	QA4EKfuMzzv+emhdWXrr9jbuWjCHR5xQmWbasyAFoa9Vr0kxVd0b1l76OHjzL+wg
	62X5nNrA9PPC6ik3eiWLjcSNoQx/KFoosGiTmfRs69eyjBGoxDvO/h1omVk0f09O
	DEz3U98k/dUR4FR82KksZFEmc04zH0m9sKbUivO+iTZR2zL9VcGD9M6/PphiAPFF
	GkEApSSsKfslugL9zmd0jBCfdTvQJaE7aYuzzM1cxpXpbiZbphBEHJk4slw9xaIp
	dgT8XK0DfhEZpyQut+owY7iivG/JdRGpGXStfSVw7cyr7Wkrh2epiowOLASXjB1D
	MKVFpWUr4Z4rbHgcWV2WBw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022075.outbound.protection.outlook.com [52.101.48.75])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j0kr509e6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 06:59:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6ZpcLqQiPIYg6gfMhE6zrwHSsiwdzk80y9jGW/Muvt0EwUC/QRaX+mnardLuE4ytGJPovcIi3MyNnwu3RSXqmuMfIcUWeimAQmXqDmmkk+H4wYsGTbWSmA/JMOGEdDXoDWnJHt4zCyySX8d/Fx0bjzfIRMGWkkPqTDSnAyqURhV7LmZijpYhwXdH+VK+Pw+VOQ3PO2Ecm7/HnoYlykR+QG/t9eKk8KZzCPeVmM6KIWmJz4JtdRWUzxVqtk3uoEE6ANdM1QkrcvxvW/+4DYK5ft1w4QWwF7sqb2nA0vIiL9td6Gi+3/e1Tg8z2J6pMbgw6MJGej0qW0lvAMmY3YKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1ZtlVQ2iAfaswAuoQi6Rc9bKe9JK3dYOkVv0OC/I/Q=;
 b=h6vHgL2cAGad2F2bxQUE4XIcAY17tfYmwmFFUTyJtBAzSHDfrMfZUDFfKsIM0fz172EdOyHk/o+8hl5SiJvUA9hfznJxXnxs1zzemDRoYHzsUozXLyzqofc1ZpR2n9d5nC8fiOs3+NAo8WI8abs4dVkPZmjcQgSd5/pB5Z6FZmwdXBuUj6+cu8asOnFgm+jsRQIfVQ7htf1CJewMebDjCXrpVCJ0Ooz5U5xndTydL8pqaUWvG/pTifemw5HFndEdQqC7w4uBoXrFlYjCWM2BWRPGytWdUPuUsm+Mp61nSuKlGVXLIB8Fwhe+C10T+IM1BCcQeGmVueKzkqQOIH8+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1ZtlVQ2iAfaswAuoQi6Rc9bKe9JK3dYOkVv0OC/I/Q=;
 b=gV9GQBo5ko2xfdk9f6/xRp/z3HILzPZfTD7CZyCT667hfHdOTjf2OKh7oq2sDjWdxnngoums5sQ7oSLLyhZK2xyBGi39B0NbFEM7YEYZDzLoI7o1L97A0Psu0PX69J+pjvbhu4l5e0KJCDRs8A+42b6Iog7xwlOkG5Yb3xPiP8Q=
Received: from MN0PR03CA0005.namprd03.prod.outlook.com (2603:10b6:208:52f::12)
 by PH0PR19MB997336.namprd19.prod.outlook.com (2603:10b6:510:3b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 12:59:40 +0000
Received: from BN7PEPF000000A0.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::49) by MN0PR03CA0005.outlook.office365.com
 (2603:10b6:208:52f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 12:59:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN7PEPF000000A0.mail.protection.outlook.com (10.167.248.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 17 Nov 2026 12:59:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E254E406542;
	Tue, 17 Nov 2026 12:59:37 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C52E1822542;
	Tue, 17 Nov 2026 12:59:37 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: cs35l56: Add KUnit test that widget init doesn't write ASP registers
Date: Tue, 17 Nov 2026 12:59:36 +0000
Message-ID: <20261117125937.658976-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117125937.658976-1-rf@opensource.cirrus.com>
References: <20261117125937.658976-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A0:EE_|PH0PR19MB997336:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 91220c12-b6e0-43d6-3ae1-08df44aaa3e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|61400799027|18002099003|16102099003|6133799003|22082099003|261009223027099003|3023799007|11063799006|56012099006|261102123227099003|261102130727099003|261028144727099003|10067099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	XhBqN6wZpEtIRgxzhPxjHST31MWYxCVD6uqaowtzCkkPheejvN9fmusY7PmA4piFO3E0Htne3qFSxbfjrc1asNgpP4oTU8sdFU/jgcTD7pVjosRvEKRBh7pJtJBnV+zA+WhWQIdUkkhsdiJTz9QghXqMQ0eRJ3qujWMRqdxSbbPQDmgCaFblttuZMKiel7DQSvApmJ4meCQaBnHLwhiHVj8k1XF1cXCC1sCchIYW68RdtKF+L6fKpnYZjSyZrdpU92JnzcqFb8vRfyPvPwsKU+oTE2CR2HNsV1nppuDtNWoi3/ArVzNOMBm1oaKWUW1Y6eaWmlXzoNBavQ5UBTQb8h2SXogTd4CepzHBx73kx7MIWK9m2FRoh+SeVla8V65C3WRKBhnU+w+2ga3JxS+py/m+n4Kb9u6nATFQPtCEXB3FG8Wws3924fYQE7yA1WxLV6YYoPMzntEM9ZdLlZLZuRx1pRJLNJa/3szXmXpj48whB32VhR5BZk63ucHU0a67Ok3wZeeqB+fUZeUso1RyX6GmR2R+8iXPBQCzgxrPF9ONbahXjhqsosy1AFpqq65NOPLsbKogxlFFw7erMGnqZDIJ8XLtM1AlgAEs56/NKGqaYWxwcCo8FfTn+J2Hdo7wKJrhpXoeenMFcXPCJss+3rYf2pR0g4HfR/y/7XQsn6qWsbfgboC25P5o73HcPju2UcnHp4zQhh7bxMSc8ipKgg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(61400799027)(18002099003)(16102099003)(6133799003)(22082099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261102123227099003)(261102130727099003)(261028144727099003)(10067099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B4GTgF/hW1FVCjACI/evDlc2WHxnqqcCVeZBn2Xnbc6XcqASBZ9ZdCC/Y8fRMUFdBJCHboLIgL/UjeyxUGc7rBilwyPobT3OSpyQqcqQSD0reTYFr5f7Ewy80qsqwNg4U1JkCdjO0Rc1FwlADEZdei0G06D54IGfdGYCSCnwMIGoizQobcbikbT57msIxAYhFp4RqJW3vWyHDx9lGV8+MJYBZwEQ2ReVV6655DHvUPdfTmxPmvJC1Qbn7Qw1ypShMqqPMf0v609wvJL2CdCsz7tfUxBHUytg4p1amxxN0MAzVK/LKUDfXDUnYNix+uyu+Rl5UpvAVssFziZ1kblkfpaOCf0p79+It+7MEP9cKzLk53awgA39vGuZxDRQVgUgBB7UlWR4pOtJWQnbAng4O6CxzzBj7UiF5nefBNmbqchL2sy/uR+0AYZn9nH02l+q
X-Exchange-RoutingPolicyChecked:
	bV5PbmfF3XRoa14NHq1s9D/U60vaq79NdJpyju+YeprUzvBiwPj2Hty3VMSCJ23Qje6oo3Z5N8EYjEk0SnUOdbkZ2LVtkzEhzhIJj2VqcjOBvhRIReojWR+AsgnFkzhdKBunnc0d1nHZFTtNJ3XJveYaozVm6UcGste5FzScms5v1u1hOxqZKhVUyRPIZGWxbn8fp+fdx4qkQ+wkziZ2r4YDFuAm8wbw1kaa018AQ6w2S33qPB2pPQ90MK+EU7UJ6uQerfTTUqkYnDtEbYB2QRvG0MGVxLPd88nVFxTxPqjIiRrmet4O4MfHpNeBrG/D3hyVnE23T7XNcNEf/wSL9Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 12:59:39.2535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91220c12-b6e0-43d6-3ae1-08df44aaa3e4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN7PEPF000000A0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB997336
X-Proofpoint-GUID: 4nNKM7gsan1GBeSaV0SVb0Vj2VCjqzN6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX/aN9HjGdXF2r
 aapP/kgiEo8xq0+CuANOJN9iDeo9Sf8xwWNYHz1bjIKDcQVrjZh0e7ZKFdl1lzl1cD3ouwp6MFZ
 Au0TudTE2XIF93UHWYN1PknExKUuIt4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX3TqzJAz3tksf
 SJ9lk1i/8j8y0wiDk7YmJoewNRVNy3WG/n4PHhNUyhNcfke4YyNnKQ/NJxB/1QiyCZQaWt/N+lC
 U0giK69q5kyxIEnDOJbnO2VRjdSMta9VkJvwfa9vO+3WKCf0U9wiLDRZGdXGxmeRRrzQkANIHrY
 Zgl1rYXmnVhYdsQQ8/MtkYQ5O/VQwzeA9iZWvlzrzXZ6BG+zc/EjvJKwRERoBnJQvzp3qJ+8Ms5
 rytb672jwu9WIKRVvXpCSoHDTy6P+5TPMerccDG42RhW+ZX5p9E/V+EsW4Cy8/TnAWzt5AIXGdz
 qDQqPC+pYP63advQAuVQ1srAq993thzeoFGKiVQFiddIA9EayFgVGGVoQ9FvV3ha8J9EXN7wKjf
 8B+TBdvc7XV0VAZQqtNofrr/d3i25g4T4fS/qGsv3tqUBp2x3Z3yq+XpxLcrkvla3KEU4EdQQcN
 H8iVVjk/QCneq8VzBIA==
X-Proofpoint-ORIG-GUID: 4nNKM7gsan1GBeSaV0SVb0Vj2VCjqzN6
X-Authority-Analysis: v=2.4 cv=aOllOr9m c=1 sm=1 tr=0 ts=6afc4fc1 cx=c_pps
 a=fPd6gtoiS7hCEWcJBHTTjA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=w1d2syhTAAAA:8
 a=vlvt5P3m60lq-KOx7fAA:9
X-Proofpoint-Spam-Reason: safe

Add a test case to check that the ASP config and input mixer registers
are not written when the ASP DAI is not part of a DAI link.

This is to test the fixes made in commit 0085428e834c ("ASoC: cs35l56:
Only write ASP1TXn registers when widget is powered-up").

These registers have multiple owners, so the driver must not write to
them if it doesn't own them.

A write can be inadvertently caused by reading a register, which populates
the value in the cache, then doing a regcache_sync() of a dirty cache. The
test includes testing direct writes during probe, and writes during a
subsequent cache-sync.

Some mock infrastructure is needed to enable this:

1. The test must supply dummy regulators. The automatic provision of dummy
   regulators by the regulator framework is a system-level decision, not a
   Kconfig flag that can be depended on. Not all systems can be relied on
   to supply dummy regulators automatically.

2. A simple simulation of a set of chip registers is done by a regmap that
   is always in cache-only mode. Around this is a small regmap bus wrapper.

The order of creating struct cs35l56_priv and the faux device had to be
swapped in cs35l56_test_case_init_common() to ensure that devm cleanup of
the faux device happens before the cs35l56_priv data is freed by KUnit.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-test.c | 322 +++++++++++++++++++++++++++++++-
 1 file changed, 317 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-test.c b/sound/soc/codecs/cs35l56-test.c
index b58df099bf72..eda2f8ae6f21 100644
--- a/sound/soc/codecs/cs35l56-test.c
+++ b/sound/soc/codecs/cs35l56-test.c
@@ -17,8 +17,13 @@
 #include <linux/overflow.h>
 #include <linux/pci_ids.h>
 #include <linux/property.h>
+#include <linux/range.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
 #include <linux/seq_buf.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/unaligned.h>
 #include <sound/cs35l56.h>
 #include <sound/cs-amp-lib.h>
 #include <sound/sdca_function.h>
@@ -39,14 +44,25 @@ KUNIT_DEFINE_ACTION_WRAPPER(device_remove_software_node_wrapper,
 			    device_remove_software_node,
 			    struct device *)
 
+KUNIT_DEFINE_ACTION_WRAPPER(cs35l56_remove_wrapper, cs35l56_remove,
+			    struct cs35l56_private *)
+
+KUNIT_DEFINE_ACTION_WRAPPER(snd_soc_unregister_card_wrapper, snd_soc_unregister_card,
+			    struct snd_soc_card *)
+
 struct cs35l56_test_priv {
 	struct faux_device *amp_dev;
 	struct cs35l56_private *cs35l56_priv;
+	const struct regmap_config *regmap_config;
+	struct regmap *registers;
 
 	const char *ssidexv2;
 
 	bool read_onchip_spkid_called;
 	bool configure_onchip_spkid_pads_called;
+
+	bool asp_config_regs_written;
+	bool asp_mixer_regs_written;
 };
 
 struct cs35l56_test_param {
@@ -79,6 +95,211 @@ static const struct software_node *cs35l56_test_dev_and_af01_node_group[] = {
 	NULL
 };
 
+/* Some mocked registers need default values for driver init to work */
+static const struct reg_default cs35l56_test_mock_reg_defaults[] = {
+	{ CS35L56_OTPID,		0x00000003 },
+	{ CS35L56_IRQ1_STATUS,		0x00000000 },
+	{ CS35L56_IRQ1_MASK_1,		0x83ffffff },
+	{ CS35L56_IRQ1_MASK_8,		0xfc000fff },
+	{ CS35L56_DSP_VIRTUAL1_MBOX_1,	0x00000000 },
+	{ CS35L56_DIE_STS1,		0x00000000 },
+	{ CS35L56_DIE_STS2,		0x00000000 },
+	{ CS35L56_DSP_RESTRICT_STS1,	0x00000000 },
+	{ CS35L56_OTP_MEM_53,		0x00000000 },
+	{ CS35L56_OTP_MEM_54,		0x00000000 },
+	{ CS35L56_OTP_MEM_55,		0x00000000 },
+	{ CS35L56_DSP1_FW_VER,		0x00040710 },
+	{ CS35L63_PROTECTION_STATUS,	0x00000000 },
+	{ CS35L56_PROTECTION_STATUS,	0x00000000 },
+};
+
+/* Trap the entire ASP address space, not only particular registers */
+static const struct range cs35l56_test_asp_config_registers_range = {
+	.start = 0x4800,
+	.end = 0x48ff,
+};
+
+static const struct range cs35l56_test_asp_mixer_registers_range = {
+	.start = CS35L56_ASP1TX1_INPUT,
+	.end = CS35L56_ASP1TX4_INPUT,
+};
+
+
+static int cs35l56_test_mock_registers_read(void *context,
+					    const void *reg_buf, size_t reg_size,
+					    void *val_buf, size_t val_size)
+{
+	struct kunit *test = context;
+	struct cs35l56_test_priv *priv = test->priv;
+	u8 *buf = val_buf;
+	unsigned int reg = get_unaligned_be32(reg_buf);
+	unsigned int val;
+	size_t i;
+	int ret;
+
+	KUNIT_ASSERT_EQ(test, reg_size, sizeof(u32));
+	KUNIT_ASSERT_EQ(test, val_size % sizeof(u32), 0);
+
+	if (priv->regmap_config)
+		reg -= priv->regmap_config->reg_base;
+
+	switch (reg) {
+	case CS35L56_DSP_VIRTUAL1_MBOX_1:
+		/* MBOX must return 0 to indicate that the value was written */
+		put_unaligned_be32(0, val_buf);
+		return 0;
+	case CS35L56_DSP1_HALO_STATE:
+	case CS35L63_DSP1_HALO_STATE:
+	case CS35L56_B2_DSP1_HALO_STATE:
+		/* Driver zeros this and we must simulate the firmware rewriting it */
+		put_unaligned_be32(CS35L56_HALO_STATE_BOOT_DONE, buf);
+		return 0;
+	default:
+		break;
+	}
+
+	for (i = 0; i < val_size; i += sizeof(u32), reg += sizeof(u32)) {
+		ret = regmap_read(priv->registers, reg, &val);
+		if (ret)
+			return ret;
+
+		put_unaligned_be32(val, buf + i);
+	}
+
+	return 0;
+}
+
+static int cs35l56_test_mock_registers_write(void *context, const void *data, size_t count)
+{
+	struct kunit *test = context;
+	struct cs35l56_test_priv *priv = test->priv;
+	struct range addr_range;
+	unsigned int reg, val;
+	const u8 *buf = data;
+	size_t i;
+	int ret;
+
+	KUNIT_ASSERT_GE(test, count, 2 * sizeof(u32));
+	KUNIT_ASSERT_EQ(test, count % sizeof(u32), 0);
+
+	reg = get_unaligned_be32(buf);
+	buf += sizeof(u32);
+	count -= sizeof(u32);
+	if (priv->regmap_config)
+		reg -= priv->regmap_config->reg_base;
+
+	addr_range = DEFINE_RANGE(reg, reg + count - 1);
+	if (range_overlaps(&addr_range, &cs35l56_test_asp_config_registers_range))
+		priv->asp_config_regs_written = true;
+
+	if (range_overlaps(&addr_range, &cs35l56_test_asp_mixer_registers_range))
+		priv->asp_mixer_regs_written = true;
+
+	for (i = 0; i < count; i += sizeof(u32)) {
+		val = get_unaligned_be32(buf + i);
+		ret = regmap_write(priv->registers, reg + i, val);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct regmap_bus cs35l56_test_mock_registers_regmap_bus = {
+	/* Always in cache-only so no handlers needed */
+};
+
+static const struct regmap_config cs35l56_test_mock_registers_regmap_config = {
+	.name = "cs35l56_mock_registers",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = CS35L56_DSP1_PMEM_5114,
+	.cache_type = REGCACHE_MAPLE,
+	.reg_defaults = cs35l56_test_mock_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(cs35l56_test_mock_reg_defaults),
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+};
+
+static const struct regmap_bus cs35l56_test_mock_registers_client_regmap_bus = {
+	.read = cs35l56_test_mock_registers_read,
+	.write = cs35l56_test_mock_registers_write,
+};
+
+/* Simulated device registers using a mock bus backed by a cache-only regmap */
+static void cs35l56_test_create_mock_device_registers(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+	unsigned int devid = 0x35a00 | cs35l56->base.type;
+
+	priv->registers = devm_regmap_init(cs35l56->base.dev,
+					   &cs35l56_test_mock_registers_regmap_bus,
+					   test, &cs35l56_test_mock_registers_regmap_config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->registers);
+	regcache_cache_only(priv->registers, true);
+
+	switch (cs35l56->base.type) {
+	case 0x54:
+	case 0x56:
+	case 0x57:
+		break;
+	default:
+		devid <<= 4;
+		break;
+	}
+	KUNIT_ASSERT_EQ(test, 0, regmap_write(priv->registers, CS35L56_DEVID, devid));
+	KUNIT_ASSERT_EQ(test, 0, regmap_write(priv->registers, CS35L56_REVID, cs35l56->base.rev));
+}
+
+/*
+ * Not all systems supply dummy regulators for missing regulators, and
+ * this behaviour is a system-level decision, not a KConfig symbol we can
+ * depend on. So we have to provide our own dummy regulators.
+ */
+static const struct regulator_ops cs35l56_test_mock_regulator_ops;
+static const struct regulator_desc cs35l56_test_mock_regulator_desc = {
+	.name = "cs35l56_test_regulators",
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+	.ops = &cs35l56_test_mock_regulator_ops,
+};
+
+static struct regulator_consumer_supply cs35l56_test_mock_supplies[] = {
+	REGULATOR_SUPPLY("VDD_P", NULL),
+	REGULATOR_SUPPLY("VDD_IO", NULL),
+	REGULATOR_SUPPLY("VDD_A", NULL),
+	REGULATOR_SUPPLY("VDD_B", NULL),
+	REGULATOR_SUPPLY("VDD_AMP", NULL),
+};
+
+static const struct regulator_init_data cs35l56_test_mock_init_data = {
+	.constraints.always_on = 1,
+	.num_consumer_supplies = ARRAY_SIZE(cs35l56_test_mock_supplies),
+	.consumer_supplies = cs35l56_test_mock_supplies,
+};
+
+static void cs35l56_test_create_mock_supplies(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct regulator_config config = { };
+	int i;
+
+	if (!IS_ENABLED(CONFIG_REGULATOR))
+		return;
+
+	config.dev = &priv->amp_dev->dev;
+	config.init_data = &cs35l56_test_mock_init_data;
+	for (i = 0; i < ARRAY_SIZE(cs35l56_test_mock_supplies); i++)
+		cs35l56_test_mock_supplies[i].dev_name = dev_name(config.dev);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test,
+				     devm_regulator_register(config.dev,
+							     &cs35l56_test_mock_regulator_desc,
+							     &config));
+}
+
 static const char *cs35l56_test_devm_get_vendor_specific_variant_id_none(struct device *dev,
 									 int ssid_vendor,
 									 int ssid_device)
@@ -611,6 +832,83 @@ static void cs35l56_test_set_fw_name_preserves_spkid_without_onchip_gpios(struct
 	KUNIT_EXPECT_EQ(test, cs35l56->speaker_id, 15);
 }
 
+static void cs35l56_test_dummy_dsp_work(struct work_struct *work)
+{
+}
+
+/*
+ * Probing the component must not access the ASP1 registers. The driver does
+ * not necessarily own them.
+ */
+static void cs35l56_test_component_probe_omits_asp(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+	struct snd_soc_card *card = cs35l56->component->card;
+	struct snd_soc_aux_dev *aux;
+	struct faux_device *card_dev;
+
+	cs35l56_test_create_mock_supplies(test);
+	cs35l56_test_create_mock_device_registers(test);
+
+	KUNIT_ASSERT_NOT_NULL(test, priv->regmap_config);
+	cs35l56->base.regmap = devm_regmap_init(cs35l56->base.dev,
+						&cs35l56_test_mock_registers_client_regmap_bus,
+						test, priv->regmap_config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cs35l56->base.regmap);
+
+	KUNIT_ASSERT_EQ(test, 0, cs35l56_common_probe(cs35l56, 0));
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, cs35l56_remove_wrapper, cs35l56));
+
+	/* Prevent real dsp_work */
+	INIT_WORK(&cs35l56->dsp_work, cs35l56_test_dummy_dsp_work);
+
+	/* Simulate first attachment and re-attachment after the soft reset. */
+	regcache_cache_only(cs35l56->base.regmap, false);
+	KUNIT_ASSERT_EQ(test, 0, cs35l56_init(cs35l56));
+	KUNIT_ASSERT_EQ(test, 0, cs35l56_init(cs35l56));
+	KUNIT_ASSERT_TRUE(test, cs35l56->base.init_done);
+	flush_work(&cs35l56->component_register_work);
+	KUNIT_ASSERT_TRUE(test, cs35l56->component_registered);
+
+	card_dev = faux_device_create("cs35l56_test_card", NULL, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, card_dev);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, faux_device_destroy_wrapper, card_dev));
+
+	/* Bind as an auxiliary component so the ASP DAI is never probed. */
+	aux = kunit_kzalloc(test, sizeof(*aux), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, aux);
+	aux->dlc.name = dev_name(cs35l56->base.dev);
+	card->name = "cs35l56-test";
+	card->dev = &card_dev->dev;
+	card->owner = THIS_MODULE;
+	card->aux_dev = aux;
+	card->num_aux_devs = 1;
+	KUNIT_ASSERT_EQ(test, 0, snd_soc_register_card(card));
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, snd_soc_unregister_card_wrapper, card));
+	KUNIT_ASSERT_TRUE(test, card->instantiated);
+
+	/*
+	 * Flush cache to ensure there aren't cached values for the ASP registers.
+	 * The first case without regcache_mark_dirty() tests flushing when
+	 * hardware registers have not reset, and requires a dummy write to
+	 * the cache to make it dirty.
+	 */
+	regcache_cache_only(cs35l56->base.regmap, true);
+	KUNIT_ASSERT_EQ(test, 0, regmap_write(cs35l56->base.regmap,
+					      CS35L56_DSP_VIRTUAL1_MBOX_1, 0));
+	regcache_cache_only(cs35l56->base.regmap, false);
+	KUNIT_ASSERT_EQ(test, 0, regcache_sync(cs35l56->base.regmap));
+	regcache_mark_dirty(cs35l56->base.regmap);
+	KUNIT_ASSERT_EQ(test, 0, regcache_sync(cs35l56->base.regmap));
+
+	KUNIT_EXPECT_FALSE(test, priv->asp_config_regs_written);
+	KUNIT_EXPECT_FALSE(test, priv->asp_mixer_regs_written);
+}
+
 static int cs35l56_test_case_init_common(struct kunit *test)
 {
 	struct cs35l56_test_priv *priv;
@@ -625,6 +923,11 @@ static int cs35l56_test_case_init_common(struct kunit *test)
 
 	test->priv = priv;
 
+	/* Construct minimal set of driver structs */
+	priv->cs35l56_priv = kunit_kzalloc(test, sizeof(*priv->cs35l56_priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, priv->cs35l56_priv);
+	cs35l56 = priv->cs35l56_priv;
+
 	/* Create dummy amp driver dev */
 	priv->amp_dev = faux_device_create("cs35l56_test_drv", NULL, NULL);
 	KUNIT_ASSERT_NOT_NULL(test, priv->amp_dev);
@@ -632,11 +935,6 @@ static int cs35l56_test_case_init_common(struct kunit *test)
 			kunit_add_action_or_reset(test,
 						  faux_device_destroy_wrapper,
 						  priv->amp_dev));
-
-	/* Construct minimal set of driver structs */
-	priv->cs35l56_priv = kunit_kzalloc(test, sizeof(*priv->cs35l56_priv), GFP_KERNEL);
-	KUNIT_ASSERT_NOT_NULL(test, priv->cs35l56_priv);
-	cs35l56 = priv->cs35l56_priv;
 	cs35l56->base.dev = &priv->amp_dev->dev;
 
 	cs35l56->component = kunit_kzalloc(test, sizeof(*cs35l56->component), GFP_KERNEL);
@@ -653,6 +951,17 @@ static int cs35l56_test_case_init_common(struct kunit *test)
 		cs35l56->base.rev = param->rev;
 		cs35l56->feid = param->feid;
 		cs35l56->fev = param->fev;
+
+		switch (param->type) {
+		case 0x54:
+		case 0x56:
+		case 0x57:
+			priv->regmap_config = &cs35l56_regmap_i2c;
+			break;
+		default:
+			priv->regmap_config = &cs35l63_regmap_i2c;
+			break;
+		}
 	}
 
 	return 0;
@@ -902,6 +1211,8 @@ static struct kunit_case cs35l56_test_cases_soundwire[] = {
 	KUNIT_CASE(cs35l56_test_set_fw_name_reads_onchip_spkid),
 	KUNIT_CASE(cs35l56_test_set_fw_name_preserves_spkid_with_onchip_gpios),
 	KUNIT_CASE(cs35l56_test_set_fw_name_preserves_spkid_without_onchip_gpios),
+	KUNIT_CASE_PARAM(cs35l56_test_component_probe_omits_asp,
+			 cs35l56_test_type_rev_all_gen_params),
 
 	{ } /* terminator */
 };
@@ -942,6 +1253,7 @@ kunit_test_suites(
 );
 
 MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
+MODULE_IMPORT_NS("SND_SOC_CS35L56_CORE");
 MODULE_IMPORT_NS("SND_SOC_CS35L56_SHARED");
 MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 MODULE_DESCRIPTION("KUnit test for Cirrus Logic cs35l56 codec driver");
-- 
2.47.3

