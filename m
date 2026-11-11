Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794366562;
	b=sNbP7siOhKe2eMhGkTbSuCnLxVxgIrGoE/R1if7PzwHPNOHxkP5gPTmtKH+rjEGQ8t17
	 lOjUtmT3QH2dIx/SPddoXkCI6WzY493ytxjzOc8N6Na/OSmaK88m+RHohb7fIYE6ZRLa0
	 z4QqJtetoQkMTS4ROQdOnozW3PFtMZIGjgNK+mJjEPBid+q6UUa6CdzzwYmJ17Qg9maX8
	 fugbwHzJXgRbzqoKbOxgXsDokr66qoTL53cJ1cQ/PLRhEINxZRMCRLT/SqHo/CxioBa02
	 9HbBQmiuybQRCn5HooM2iRr0ZlIa0GEE3G1e/oxhhPDSYpacqT2Gr96fNKrUrbrn+wQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366562;
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
	bh=GyCibCE3AGxRDMG6Bz/W/z+0Uxg23s7Lb0U2X1cmJuE=;
	b=yiu5grGHJFDTvWn+tjHJzA71pSMiQ0HytFCuzIsLEuanAuXpGpWoEivhDsYl32Hzp5hw
	 nm+gwdbUx2su8Fhd/Bohs/Zx4l6farQ7bTIMies9McHwQJjjKwckCSU0EgqvQY+zCxkQN
	 tyegW+CzJ1i2bfH8d5WBHlpqQO2Xk565DEqI+N6TIzczLju98bijwea1UuHudOso8uv9x
	 ehQ3RsQluaEvctJWWXz2DZTVh1lpJDp3zIDnilMygGiy+6GRz1d+5Gm7nwNmRqj3pkePs
	 wlxIyb9zk/9CgK5aofO2BbUDRR7BPptCCa3FGWxz/xP1Rjf/30k9+xKMZeCee48cNig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.122
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022122.outbound.protection.outlook.com [40.107.75.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4988606A31C;
	Wed, 11 Nov 2026 03:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4988606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnvYnQEc/K1yy5jn2kHAU3Wm5BexrPruccSQ1wahbT81V7D7MwH8yaViHJihD2E99PppuIJAidxJM3l4vjHL3+fr5Dy70EKCFOMH/cZuJRJICm+gzvMrFbxsNnLnisnahApkovqgPnCug5pvQ9W3zTzT6DPdwO3Ql3UxJqiIeSK4Xi/pZ8DfH+Qpej5BOxP4sFqhpzItBS8BbDbbGmQWKvkHxQRSde9abrsBm91HDs7s9H9y0Wf9H4zXqqnfgHKMXM09UrIKbsSQx+B6qrNs3ZWnJqde/drx9uTvQa2QnFoAR6JEvJ1qC+Ggf8GA9QRUVvVW7FK/VM2WtjSjj917Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyCibCE3AGxRDMG6Bz/W/z+0Uxg23s7Lb0U2X1cmJuE=;
 b=sEDxwoinJOFcEjDVWrg4J7HmSpUgPS9hJuFRkCbnV8zA3EL4t5ejvq59oZV1N1GVozMYXvxpQsm/VGVj4miAZoxOU9TAcYClZxT4kXoxvQhtH85472HxPudE03jFfHqVQrPCk0UFfUec3BHvoLnf2ID/wq+JZNGzoYr0nWkwCDv95bjkiiy8fZqA1g6tuRmcAbVxIPfM7lyX+kjVbvLB5HIRXouklaZtp7oPLhmxxUv83KDkg586ScVbmZMr5ufoIEhShDedmks3K+kIToOYrWedEmnx5tbHIxgfEPWYjPRWnxC6ebGpTmX5PoVdDJhfA+te8+uhodCCYG5njTRYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0039.apcprd02.prod.outlook.com (2603:1096:300:59::27)
 by JH0PR06MB6438.apcprd06.prod.outlook.com (2603:1096:990:2c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.7; Wed, 11 Nov
 2026 03:09:17 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:300:59:cafe::70) by PS2PR02CA0039.outlook.office365.com
 (2603:1096:300:59::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 03:09:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 03:09:15 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A8FC740920E1;
	Wed, 11 Nov 2026 11:09:14 +0800 (CST)
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
Subject: Re: [PATCH v6 0/3] phy: Add CIX Sky1 USB3 PHY support
Date: Wed, 11 Nov 2026 11:09:14 +0800
Message-ID: <20261111030914.2954368-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105-illegal-fervent-swift-3c05c2@quoll>
References: <20261105011751.4058411-1-hongliang.yang@cixtech.com> <20261105-illegal-fervent-swift-3c05c2@quoll>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|JH0PR06MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: d7e4eead-25d2-4de0-5c76-08df3fa12ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|23010399003|1800799024|82310400026|10067099003|4143699003|261022105027099003|261021121427099003|261026140227099003|261028144727099003|56012099006|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SsIPt8B8K21f40Y8J9oPJmP4mvNpP5GZefo1HRUKbFy+EG4OfnMLZOoXrbAg3EVEy/qsXhhz8kG5nnKukXk8wJo5g4maERArt///Sz3Lkv1KU6nR0iXYNYM/kDvBJ5zOnzl5dfUIZQpD09T7eWc0wgDMKv79WnUqIbhWzGK92nIEPowz22Bejp3tGUUjRosSJ8p3c3bW2gaTzaFSZfIXTIzE5WRBbCgmenNcvc1gWoyhzn7/MRr6JpoCJIUPrfTrm1KSwlQoOQMadointazOLyT+6W7Bx9KvZbc9GC98TypkHCJ27Y9V1Yxe62UoEKn0JdiLVvcHYoVyYtkZShOiaXyy3maSVmrUEU1vZtQ84ZZbUy2x1Wwqk9wHqV05y1zCyV7ZKOgT1edkMWk/XxzIzcyegVwwbDSJLWktFyyfDDSPeYeLWTQuEx+10WSyNQND9E5ZHRP9Fa9UIqY+TFk6VL/vZ08slvk+GxpMm/5pn8h0n87vVRRO/FnEXb+X+y24F3Yxpl8Pl0Sjp7YZSdNUTA6t1P90NeJzoFWsC4xzh6fs/PTnAqpZleQDrP1KRsS9jPx5GlLMYrDzQa8XDZRE8QhwpIuC5vNwRTpn/B3RldelxWf0L0Qgfi0vwBiZve9AebZUIJ1mtKwM38DgAz/fjYIkV17VUADZbhsspC1cHhsK4l0VJsxjsqCdjSD+6I80gq8ovAsPchnCi7OVLfjRPw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(10067099003)(4143699003)(261022105027099003)(261021121427099003)(261026140227099003)(261028144727099003)(56012099006)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GRnKAs6Ww2b1v68P1p1YcH4EQALSeJ3YigdJvlCDIegkJ23nSFLvaSMETclsbdmSx7SjVmI4qfwnuQHNUgUnMQixfO1W9jnD2WzAzP8hps0Sx4bGFs4tY13wDssypDIFD3Kegvjfk3zB7KWquH6ZxsMwt4rhAK/V6W2EZu+ONI2I/Hmf8bVG/3Cge9g1UTuJuFrSq9ICa4zzgcC6BtT12ggj8DTCaUmIIRDxC1Jg3bbtAHzOwZBGB+q68y0aLgQZ6hWXue4g0tpjTAAW25t+RiNZHeIgOXfb63elHYiYJHiiY/71XZHJNPeRQ7gaAaiyuxxI6uDLGbUq0pL4Mc1MH4EvFxh68pIvra/WNAnYEFdLvutyvfVNz5D9hJJqs7PQh51Ce9VFXqp8zfmHH7BvUzCV5w2UF9m/ZupxgjCWQ7q7EXzhJinnxqfaCIKXNLpG
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 03:09:15.8758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e4eead-25d2-4de0-5c76-08df3fa12ba0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6438

> > Corrected the mail sender name: v5 was sent with a non-ASCII
> > display name in the From header, v6 uses the plain ASCII name
> > that matches the Signed-off-by.
>
> No, you did not.

You are right, I did not, and the changelog claim was wrong. The From
of the v6 PHY series still carried the non-ASCII display name:

	From: Hongliang Yang (杨宏亮) <hongliang.yang@cixtech.com>

The mail system rewrites the display name of outgoing mail from the
account name, so the change did not survive the trip to the list, and I
wrote the changelog entry before checking what actually arrived.

It is fixed now. The USBSSP controller v7 series, sent on Nov 6, arrived
with

	From: Hongliang Yang <hongliang.yang@cixtech.com>

and the PHY v7 series will be sent the same way. I will check the
archived copy of the outgoing mail before claiming it again.

Best regards,
Hongliang Yang
