Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022104.outbound.protection.outlook.com [52.101.126.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835F8372EF5;
	Wed, 23 Sep 2026 02:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132323; cv=fail; b=ItnIe+sPzfCma2nWZxbeYicEj6D2KXCeWNAdS1LRJpZyPOeeonkbX4eQgkLxCrpw70VgtF6oV7WcVW7F+YKVry1z1NFAlg66WolrYxDHM/FFOzTWwlfe3hftjDc2kDpcuElyv/BBu1YvAvinv45bJFs7hpiPQwC29OWmStypg+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132323; c=relaxed/simple;
	bh=MkZQ04tP2NNFMCmVvm54ZQ/Ggyr92WEvjO4M3D7tpGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wg/4nlOsMCH7DvlGbtIox1VvMtPkPFgm/ezwdTRDsHfpOGTca/EJJa3+sQT/vZYuGYpHEd5w5XbxYWhVJIcAJ2mfpjKKgm+tiSFQC/lWNMtplxEeGw+8gsmFIAr4uECIOiYr5wk+Cu8ksp/hVvzn0EsCWL4pUT/+ezLVvbx/dOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmFvob1i6IwL8m0sZSw2Myd3akMvElHBslarqERKm5S6A6eGxOnKmWTHL7gA/T/ThMSpwlHpTSnceWkB4QJyaAiNmlJliBZ6iMeCI2H2N2mM+eiqbog0RJec0ecsy1HAG6IxeE9gvACjn1pu0FST6ZfUb3I7GBrS/OKkO8dWacw04zs6LObfS/aRZZ2t+4OU8wj4Enas8irT2Qndq11cZjghmxMHY/WQSmCpTBuvR20tdh2gz7gS0MOHwLb+1cyOVBIfkyjxVLZUcnVAHWftpZowoDGubvr5E0B7GfN61i4sJD89NqXnWaqLr3COkx6LbT7IbwrZp9rBX8Zsrzrw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkZQ04tP2NNFMCmVvm54ZQ/Ggyr92WEvjO4M3D7tpGc=;
 b=lVwkLbHF/iH5XemVLsBMujHFSEbmu+2Bwbc+z2HCBXMhNO9l2RvzwEb5qo5ClPHbUYRXCnkfBURCwkE3hdWnf4/WM3VvFfBVV8m3i/rJyDl/6EFj6H5sHSYyGg/T4lsjEZWq0wEMC/GIcGzWJ0/BeHOItid/mo2bXrAYiYFtSQiBRo+O98HTnc3TSoFh6zOb6Sz54zWI6Y49wpuEnakwL0GFKRIMzUwCv69/F53D+QEUpeCTFcplrgGKvxXCs/UvSbHdyyMAflb+KMol9XTJXRMji9SerhwLtSQQ8r8F33f2vOuzcaGCOQbDI8KId3Hxk9OOeg0LhrM52fKVMn8oig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0001.apcprd02.prod.outlook.com (2603:1096:4:1f7::15)
 by TYZPR06MB6095.apcprd06.prod.outlook.com (2603:1096:400:342::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 02:58:37 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:1f7:cafe::af) by SI1PR02CA0001.outlook.office365.com
 (2603:1096:4:1f7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 02:58:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 02:58:35 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 9FDEE43B1063;
	Wed, 23 Sep 2026 10:58:34 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hongliang Yang <hongliang.yang@cixtech.com>,
	peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	pawell@cadence.com,
	rogerq@kernel.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v4 2/4] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Date: Wed, 23 Sep 2026 10:58:34 +0800
Message-ID: <20260923025834.842467-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260910025227.2490151-1-hongliang.yang@cixtech.com>
References: <20260910025227.2490151-1-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|TYZPR06MB6095:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7d798a6e-a1cb-46db-9f81-08df191e8f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|82310400026|36860700016|1800799024|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	O8bzqpUYzXUm8P45/MMHRfNfL+jm++G9kpiEAFlcJNodCnOZNUKoBlatxJ5SyqXWbuia8fUY9xWQ+XwtltZM6nvzJKfcQjXvuyzsyV7tMQUSQbo5GxSWrgB7mX6Qfmlj3SuoKBa4X/FIycr1CrUlaMvPVsS5E+h4ArWQezn+tapKNOU2qhjp9917QmYoTB4CwGSu9xGQaNrYpsJA9YUKR5HH/AFlQikHSSbsonrEXSFC+ilVzjmjjItpIdNvMfO4lTiF2ljsX7Da1vz8n3ztb1fH7a0/IPhnjgtY4UonlrDnd7I3GPT/u2TAYPcjYz9NZsRfbdPfaMoG6V74gfK23qmMhLxTHHewkJeQuxy9I/Zm5G1P1P+PEvLGTS/YozLuDNx6nO9xXcLGaqv6J3QjKh00vcV1T5K8JrkvX6K/2oWUJqIA/ER3bthTqS7jQAfMo/w5ZBBxX8FnhUNKgPLl0SWjua1HtXsOHrxwrAS6U+BMer2LVBIsBpbiO0sW2fHfyI3zHncrzLCMeUqOj8oplo9sKaJyr3TYdRq55w1cUXS5MMhpxK6JRjjLRnR27L960WGEFhJwPVPvOdzyBZbrb+7TdCmi6EIUr4PX0J8+Jn1E+i5qCgDnjCmVGKtHfJEnxUVVdyML9Mby0wv3SnvMNxUjdMcX/hqeJNWY+2xL3Errcb69aEkqWeHBcDTQt39H0V+f47Xf40+N1fFUgiY3bw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VAs8fR0sXQUFtnJjFQlq0UOwqUtVKe4s4GU364hbwC8psCM2xO0Vy4JmRJLKseZ0cyBFI9qKBd+ACznUDJoHRZuCLDV1sZHhCH1tmcwKE+Q9cWENVk0nqTdVS4w7HonoAkEBykEImdBjdJgsKpLrv3+/24aoiwPSBwwGlVLB7sIUYrZnwVNBUBgltiF4RLqBRJ13h3t7waeKxn67795Ll29xHWIXppxOgX71Jb3ybNDkCn5n70braUaR3UD9KCRT5AjLhPAFjKING9s5OBByrYu7BIh1H+o4A+fMLo+uIzS9T5/eBlvUDx5z+Y6Xf36sovX/8HB5rXV5RgXwv8wDxmNTCzGzmq0Lpi8jPkq3yl68GqtQpxz/66W+U43rkl9Bxs4a67M9Ld3hdWh7VP3eYBDc/w441GTSIDYfbwl0dsbDuQD8m6Xq7BmkEfENYUJe
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 02:58:35.6613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d798a6e-a1cb-46db-9f81-08df191e8f94
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6095

Hi Krzysztof,

Gentle ping on my question below about representing the shared RCSU
region with a simple-bus container and translating ranges, versus
absolute addresses in reg directly under the soc node. I would like
to settle this before sending v5.

Also noted your comments on the missing blank line before the
Signed-off-by tag -- the v5 commits are created with git -s, so this
won't recur.

Best regards,
Hongliang Yang
