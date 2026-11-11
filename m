Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.137
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794385646;
	b=pXqqanvR+K3Rp8dm2IyXRIeUplLm4rY57+AwbvBsD1rW/miMIDcLj3c/EIegAJQXBapF
	 jq/hb6Ypapbd4bpUjL5oUSNk2/019Y+f3u00MXZ88HiQlipEMAoGf913Jrlm0GVhipqS1
	 9Ri2P8zEtQIYyfJGHabGqKNhTawke9p4J61aACfRSr6gs9QFGj3uyZ5daNthWGcxCeUxB
	 bNyrAVT34QI4MNKHbEpuoSYtiyvS0itgRyM8Vx0mVcoPAvkrDJLaKkkjUHLCnCtkIEpMi
	 GbxCJJFZGfpO0CnVfwWs/Zcf+RkMPR5WZ3IJKpX9BuXXIq1Z2f98ZncvsNTX8ylK2gQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385646;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=BOwotnidikqQf0wJI/t7ZdfX05IOsYgLhRdRnw0c6TI=;
	b=DDXeP0uo1PV8p6AwEsEzr2GZ+jh/kUmNvoGtc2lY7Tcf2p7Rw6rnONlAC4aJ0F3DUHh+
	 OUtxpZh17XrAdxHxE4JuyPFSuzQMa0AYdL9F8rL4J/nCZwy8Z57AN/k04x5fdUYQbyKTk
	 G0DpPoMAP5ghjWwvZN6xvVVoowaQi70mR6xf4oD9urcP2M/LVcC7Mnxn2/VZxN+Wzp8Lw
	 JDz78/1KkEHnXhD+60qbyizuxO7m9HCYusv2fnEfpzuQpuXSeskLvspMfjmfHnCi+Lsi5
	 fGGKf6hEQiNUW8e9H/Bq/kUG6OBujpotNyQUIffE17M6QOQXufQeNxpjGzzV1RyFAng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.137
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022137.outbound.protection.outlook.com [52.101.126.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791C3606A326;
	Wed, 11 Nov 2026 08:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 791C3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lmo7mDpME0L2w+DQcKnmuEfaB38gxSqR++a8kuCfZSTw0xE92MiyjwNLy7cq49c/B0ZVDSe85414U5u4G7yxidTOMDlgkSJHKscLDUWdzd/ospUhcPDsE9LqXff1t48flUjH0wLUhWzqS0KjNM7vkc46RuSn5keuWsL4oCH68yrnsiOE3iuS67gwMmtbEYuJM6YYfwch3xzWTzonvts5mnru4WSov4xLskMaV+qrxi4MIqY45epbg9rwmXt09bjL/Zsj5S3tgWNuvyVdsIgGjWdCXWBCuyACwW5V/cVFBfc+brbu6c7bGlYuuscw8tKXg7LosapDFXIP6u9cNObIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOwotnidikqQf0wJI/t7ZdfX05IOsYgLhRdRnw0c6TI=;
 b=IgF8QpvkHlKP33wRhdu7jiaAZXYl1vQQ73TYN5TqfZvaXvfv1xQXzQKYxGv6gM9O8Nan7d2+Q9QZw+GLg+sEJBIRKoIqFRmzhu2PVDAJMI1R3P2v4lFKeTvERXfmhPVGxUvwz5aBDV5zCvNc1Bg2kR1FcUqjUNhgz+bAenhfc0K9AiMC+9OdKguIf4wiWYQTqUsWL9zS5xPAqFQ1Dt+57O7vK2MlVxP+og4G1sHX4UcpeSUlxmzzZ/+zcdn59Ur/y1Z61mwpnSCXy9Ip8njKgq8jmmgo7AvzURal2iJR7M3mKlF0B0fqAeQLOmeALe8Pt7FlySr2wh0L/Tj3FnHllw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0164.apcprd01.prod.exchangelabs.com
 (2603:1096:990:7::20) by KUXPR06MB8029.apcprd06.prod.outlook.com
 (2603:1096:d10:53::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 08:27:21 +0000
Received: from SG1PEPF000082E1.apcprd02.prod.outlook.com
 (2603:1096:990:7:cafe::2f) by JH0PR01CA0164.outlook.office365.com
 (2603:1096:990:7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 08:27:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E1.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 08:27:20 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 41CDC4102E73;
	Wed, 11 Nov 2026 16:27:19 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hongliang Yang <hongliang.yang@cixtech.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Gary Yang <Gary.Yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Date: Wed, 11 Nov 2026 16:27:18 +0800
Message-ID: <20261111082718.3425848-2-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <5fcaf2c0-d38b-42c7-96fe-52dccbe87f14@kernel.org>
References: <20261111030937.2954646-1-hongliang.yang@cixtech.com> <20261111030937.2954646-2-hongliang.yang@cixtech.com> <5fcaf2c0-d38b-42c7-96fe-52dccbe87f14@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E1:EE_|KUXPR06MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ff3cd5-e479-4eb9-bfbd-08df3fcd9ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|7416014|376014|82310400026|10067099003|4143699003|56012099006|261026140227099003|261022105027099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Eqeu6UWRyTYp0yLI7DMLFwnQ6sHi8U2UtjfpTUgNwXNUp5sLvp0A3o8Bg+PzK5bSYMI9vuIFoX4PzTLW6ctFRQjkQByDZsf4H3dJLIZC6BkNnr759pPJeyBTkMpWJf11N0MaOV99w+9ye5b+evcoFlNPA0VnWBom1EagkCYWInwoTTPWZ9I8A+rx0bW/uxvr58lO50ZYeFT6ZSzllrP5One4jlJ70ZYrbmfxuQ22QdbfI2pjY2MX3gzQNw4oJpO8CA162AKXsotwiWlYQv0OEvBcr7FGP6znbSutRblLFYII/lB6URDDYv1cPQYYFryZ8HJhEYmQFy4Et2RYz63fS0tq0JdDq3KMbh1ed9I9fgvBkiw715z2etRkzM0vcjCf+V8N+oVtbtTXtQuGN0017/2SlFzgDQ5dQJr7c8iKlR2I2X4yZ18eMICCJbhoOGpUIds2XKQ+iS1SFb8yFj4bgqX4w4qN3GzSc+J3t2j6WgNL1d5quCYRtBvpDSGRSOpIlclwMYaqN6bjpV9vAI+I48SK9u8TSFoZ4ESaQmsXI1WRWHp6CyD9RAszPGofFIbH8snfZL2t8N4d4rR5BFuLM0j0+9MvORUXr4YPtwz/8zjHPKjnyvkVUhasDuaLTHW3nIYt7kCpf00omAkryVCTujPGZisZpudj7sdL13X1hGchpFZPs6GOeNRR1ShTb7WxE2fBafcH77ZE5xAmldSoGQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(7416014)(376014)(82310400026)(10067099003)(4143699003)(56012099006)(261026140227099003)(261022105027099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DAbbFTuPLQ3VXtDlNuP9pC9Fn1xTUheCqcA7tubiw2i84NTiM+c505k6oxKcyl+E3aipHH+3YCu3mwzSvKrM9xn74xergDVE1wNUQ07xvZDDe0XkzrLXc0dlNYciBvDlrHXdK5W4Dxyrr3K9UlJ/sPtVaq/1rgBRp+w6sKE8iH8qcQy+eF22ITrXuil/puJql1LEru1+Q6uyxvwSHZG0ikxwq/04YErsgoFn015HSNmMTlAMz2IBt8/dGfUp99mt0NJabUePrPG6lKuKBmbL5OavdP8VJD9drFozm2jxcC3F0n3AexxS7p2kY1/gQ5r8XbzumCKJbTDfD3c4Y7D4vsNI4rifKcnOFXO6ZtAJ+8RBhsukQVEPQI4VEZZ4xxhCcyWRfCzYpmDeMtGM6OHsJVEqy/225Z5n5cEbQinabhpThLdbJV1+zZlHXQmOAk1K
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 08:27:20.6376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ff3cd5-e479-4eb9-bfbd-08df3fcd9ad1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8029

> You gave me exactly 0 minutes to reply to your answer on v6.

That is on me. I sent the answer and the new version together, and I
should have waited for your reply before posting v7.

I will not send another version of this series until the PHY question is
settled. Leaving it out of the patchwork queue until then is fine.

Best regards,
Hongliang Yang
