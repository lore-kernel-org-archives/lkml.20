Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.136
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794385646;
	b=e5Rw/7WlEtLimtS+lhrbOsyDSPVSuX49V/WBsZae8To22Jj8UC6YDIls7hS+xMbaREHi
	 HHNfgiLXfIoLtWD7aSzojpKMrojrBO00GGTwr7hYjy7iMqozmMcZGyKe/7WFufN8FAHR5
	 0xvh5mpoD/T3flP+G5gnXcTybBR88x5qolSRxZOeC0Tcoqrf54wBA1aWVoioipHrTAn8E
	 30xwt06scJxOLbFAfnKPh7ezuHMa7ZPH4BOD91qQi/Bqfj/EFTG1qjQhbewlSCC9hhOuY
	 zKryx/nDJW1Os5pw7WgKOtq7katXLfQRK7jn25XyLSZmDKkM8l1XNbS1KsU9yTZ/e8A==
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
	bh=mTfgj2CmwI0zwXIIcxpk9MzLpnvv+ScbPhRUi9Au4K0=;
	b=hWC4LXkYgDvTiNnq7BC1YRyYAUZQOiWpRk9HA7JB+V1iurqHncGYU6w6+T14wJhJqf4G
	 Zte2oovgazf4xgmJk9KBQ9LBhZgZRRxJ18IeI/qQ+XV0FKc2oqsUTujj/Jd2GP2vAiwpf
	 p76RnxNtfcsPQf3t7snF67wh0ZPBrF+3EQQKhxehLZ0a+TkYsmKX/YsTfVjOXRqdwPKCN
	 wtF2LXXtzVjcp8V8h6wO3iYP6rnQ+8K0y3jqTHU1hjagaY5aJVBTBX4DT2mTUL5WKv6jR
	 f2jQRT6wZkcB0RSrF+S78W4J/cHkdtpLJ/fQpT1PwpxJLBTotAUnWNpRp3dtdic2xLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.136
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022136.outbound.protection.outlook.com [40.107.75.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F112B606A327;
	Wed, 11 Nov 2026 08:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F112B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGJ5ZoBiFUwR1R/m1MLm0WyPnFyQ3SP6TnDFZ0sao4LaRJpUUtoNtj3rVcmDpoJebqq9abwlMd6Kgzz/Fb7QN3JwKS+qSfcDtdZGTaNTXCIGOme5iv9hggXsQkap2XA9djGBu+zOJzKQCMkq2vzWtaY7ldG+Bbjc8UlK8ZiDFauPCW7JX2uuQHljkLJ1Ja9ZZX2GbtTbCh1fZRt2h27ouw3eJc67+Pva1AKxwFp0jVvjxsr4zhEBJyF08P+nzdPCKVAYjwLRVTl4baqDze9DyB5WxX+TbYKwevK9fHMx2XdAgSI60TnbrRjPh3dQQS9rzWa2c3DLxegbU37g24EZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTfgj2CmwI0zwXIIcxpk9MzLpnvv+ScbPhRUi9Au4K0=;
 b=KTghf0+UK7NUoCP6LgrCLIuYjb749FSyXUe1CWO1x+iepkPMGZ5maEaKuK5OONmBRjpF97d7xdJSTL6wk3sOevqTOuIixzee+sbhGzBJjlXi9aq4PTuBLU7T0HY73YYmDGKdlH/KDLZyxk0adjb/hRrEM6Bg0orIc0A5O2HrqXme8izZ6TxtcTPOB7qhXYBZlfgGkmGpm/N6uYSoMw4cO62sDBGqDRoaLhgNUH0c8jBF13h8swm4UBoWUyKa5I13MPMywI6Z7QZnKlWCjhdSM8YyYxRh2Q8NTVryDfQDiyW1BHvuDPqXSpNgxKnWsBL7a13Lv5CwyrCGip5kSSom0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0040.apcprd02.prod.outlook.com (2603:1096:4:196::6) by
 KL1PR06MB6347.apcprd06.prod.outlook.com (2603:1096:820:ce::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.8; Wed, 11 Nov 2026 08:27:21 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:4:196:cafe::9) by SI2PR02CA0040.outlook.office365.com
 (2603:1096:4:196::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 08:27:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 08:27:20 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CA6174102E65;
	Wed, 11 Nov 2026 16:27:18 +0800 (CST)
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
Subject: Re: [PATCH v6 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Date: Wed, 11 Nov 2026 16:27:17 +0800
Message-ID: <20261111082718.3425848-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <66d48a6d-00c8-42fc-889d-d0901c8d85a6@kernel.org>
References: <20261105011751.4058411-1-hongliang.yang@cixtech.com> <20261105011751.4058411-2-hongliang.yang@cixtech.com> <20261105-kind-macaque-of-enhancement-ee0365@quoll> <20261111030926.2954510-1-hongliang.yang@cixtech.com> <66d48a6d-00c8-42fc-889d-d0901c8d85a6@kernel.org>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|KL1PR06MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eeedfb3-4d62-47af-83e5-08df3fcd9b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|36860700016|1800799024|82310400026|5023799004|56012099006|4143699003|261021121427099003|261022105027099003|261022075727099003|261102123227099003|261026140227099003|261028144727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	kkKQth1kxVxQyY99IozGlLtTx+y5pk4Tp/BZQjtqVDbQJq19Cl29xsTUJ9bo9fIeaexv96/1ACE38JEEJKzUqZ7l2Kc0MItB82DiA776tDvGYjGSAigmxxmjCVXzEwv7x61W16CdD8bImS67LplLJdDiLlLh4Z6cfA2UcAOzwr0uCjV+d33kMQvEZa/SuSQM4iD4ZVIRkeTTNvcJ2NgY3qVQXxRU0k1bHZ+jtgwWGexgfH03ZVUgUPlY6Qvz0es4RgriNgjPxdnJ43sB+rzNBErwACoA3vOopBDQXOy+CE8BGKSHCvz7OUvS1nqNsaTygcDZKX0Ak1Oj9Yg7UUvkmLJyWPOOTSCsS0Hyrrm64S5peTF1OYfeQzCnlnezuBCR/y7f8PfvsXtyP/DbV45doweg4MDA56Q6KOulx5NGmbTs+U02yhKhYGv/ee/uZqPb3I4/cljrYfryPEz2FCKpzJ8rmklucYmu5Cwejb7uEBIfx3bfvMX71sRNTy838ssA0AP2iJ6s+gRjWQI6Px9hiopUkIHY9xyd8kGmnrPLrDFJyRT/EhO9V7fRuKTAwthGdP2sG5WyMHMqg19YDPozsJvIB9JzjpMvsRCLZPVD6ACtQS/b7eK6lE8oYfzgTvbMiIfrAlGdCkgYV/AF4xCB3KnayaUomoCQhjbd0E26XbvPKU0UhUlPshhVXlKeGZ3fovvkXr5/HstVkU7Owy0MWQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(5023799004)(56012099006)(4143699003)(261021121427099003)(261022105027099003)(261022075727099003)(261102123227099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4MVDXGSkPeew5wYd7G/TmMu88KuIxtyV5XmFzgeqBU3DzJHiLx3dnwsQEAzYQTsHHOMP9SRvoRMHinTk5g0aTrlkWjfiXsQmCjIU0QgmhNVbnDCmHyKbftILA+X7E9mlMzGPW7yarKGMr/3TxoYwrtFNfy6fln6pi/Ra6zm3SuneUYa4jQ4sHijTUkDTSZDXJsbYMZXMJZZDFpWF0BBAI6RUCQ27MPYlX407TpPEZvOOnNDkFshqvsds950VaoPnFaWrYi17XvUa9bqkkJav3j5IeFMOuuj1JMYLZa+3/Dl+f1LHcI/Y4Sxsx8LgUWYEnDrShHoLG7tTg5tmC8APeZzIWiTpZ9UMgMd/CUJncCvYtdcqTlHGhlAklkQio3jEc7ZxkEH7dhhd4c01l9B8ul4zW9FGU13TxJJpT0/o0Ca3u1Fq48jahfjMoQntm5o9
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 08:27:20.5637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eeedfb3-4d62-47af-83e5-08df3fcd9b02
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6347

> This clearly shows two phys - each node with cell=0, means each having
> one phy. Two nodes, so two phys.

Right, v5 made two phy objects. That was the bug: they were the same
PHY.

The block has two lanes, one per Type-A port: USB4 uses one lane, USB5
the other. Both lanes are programmed through the same register block,
with the same clocks, the same resets and the same init sequence. In v5
the driver created one phy object per child node and gave both the same
drvdata, so the second object programmed exactly the same registers as
the first; the only difference between them was the of_node they were
registered with.

v6 removes that duplicate. One phy object remains; both lanes are still
programmed by the same init sequence, and both Type-A controllers still
get a working PHY. Nothing was dropped.

Best regards,
Hongliang Yang
