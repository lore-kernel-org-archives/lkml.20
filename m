Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471677;
	b=OcT3GsRbjgezpQBkkaUJwPZt+wieScln4WTyAc2GT183NL6CnHy2RYXJ3HpStNHz6SPN
	 9pPbECcOHxQAn9QYb9BI3hHz/BwLIlOx/PhQdxb6g4an5DE1cJuuk5zg+rWdb50REMar3
	 t3blkeP3XXAPbiXieuxJpAdgRTbKbOxx+kpnuR6epuuEGjoJMxx+ylM8Tz+fwQ6wrEUnf
	 xHG5I6YmfJ1gZtQWAj1Wkhq3QREb845OGKJWYYow9KTdC7WPell6agz0EhwM4lQgACGeW
	 B6I/P+YJ6U5pgPEcRjMj9JkITv9tDtG5OArfc2F4BJ5i+iqIDnkqhBz7L5LT8kxe26w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471677;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=e4LILQ0oDyxIIfLvvUdZA5CSXKsoR90I44cO0Par/ZE=;
	b=2masYUPstdwC9WRxE3Pl1VB6qDLtvF7y6VLvRd8cLazdyhg+3eUClwjfCHdC19P5P5j6
	 gZz6O01xHhLtT5BwqnW4jGR4M1jF1DGsnhDDCg/iNWtSWyxVT4oHWdBSTvpjoOmiQA/Sp
	 1+mowee8P0Amh2Zp1RDhMWVWEOLleMrwJ4i620Lz8pCJQl1qR+A9r/sSrl74kELwItqKc
	 a2FTWEmCU/8mIH4Kk0/asm5NQjaKcVfLKbhtUoLYooXOKsbStSM7FeK6viwicZb0G+vbr
	 LG0MYO3oMPgmN2En0B+6O00TJGgb1yPb88jcPWA+wQk6l5vB+VJ/2Me6/x2QehuwDkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=G3ehzeG4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.56
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010056.outbound.protection.outlook.com [52.101.56.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743CC606A32E;
	Thu, 12 Nov 2026 08:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 743CC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=G3ehzeG4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0sOyoZ6ziLDuPWsp1p44E/FEikwoGQ6gJ7EiV/H7V18Ho81iBpAk4cNpFb61HMTpUFk/WVtUuu0pNyaBrSs9BDuPWIW2EX3t+w90WJVgQgmEgg4OTlHS97U8ctPjCxAwA8jWhq2bzRlOqseD0DQ136uJkt+EQXBDiEzEWus8wzE6qZxlwSqub43ohp5st3DBlSsZHFl7C3OY5FO8l4wfeYg/M2KWAthHK0dzD3Zux+tsASNSUqOxbw0kVGrwuZxMxHjy3MhtWTrz9RtK0BdCyGxaRRfXa8iV06WH6AFRoe3sKM3Jnl42lhAx+MxE6oLp6ElJyuNE8fjK6fnnw8W6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4LILQ0oDyxIIfLvvUdZA5CSXKsoR90I44cO0Par/ZE=;
 b=wjkr0XL3vSxwPePrDmLQLwN4MIz5JVyM2xYoFmFoBMWCBDF+qMvg6DPoY5NWXlCsCNnlFS0QDAi4hcwtLplbyFEn1p7sBnZZFD1YvMsB9K+YXMjkFnfzVISjQhUOu+VeBnNKG6IIeGAq3TMuSdIoGcy8X329L/io1w4iNEtVZk39BMLrf5mIcQlGz14KU+G1ngxc7b5GKsz4LqbCRHSwh1bBynm8Vof3NEYeN1jjEaK3mrvkjlKDc1N2mb7rqsCWSIPUb/EdsygZ1KXfrSmWV5cHHbjuSQqRVRHZu+JIV9dixDFEKQez7ud4JC+4ZVkH908F5W1cwx9TDdi1zQMJjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lunn.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4LILQ0oDyxIIfLvvUdZA5CSXKsoR90I44cO0Par/ZE=;
 b=G3ehzeG4SWAxGrFOUbHjWxQlJ5fz3hjJyTeaOqnI1vnsoiu/ZccTbQZtKYkw1qJmf/flODKZ3yrlu2T9KFu3Uuayots67XRgNbVAi6sdfsylpjYvr3o99JVcB1JBSg0ETU13YCAj/Wxe+VYzV3qEg78bFC1apXYCdNSTGM7fgiY72ELFKTCn7QoA7kowuZ7DAbIlYBcy2/pde5twdMXrF4ajlgYS7ZPhafmfHpcTgf1gkjkaFViNEVrSJQbJ4HWXv8cB6DKxfpM5jU8I63X8izDBn/d0OqGbNPzsSsm9LHQxXWaL2DthJE0C5U9/qDz1mnLVyZvRaVY27Vu86/NTbA==
Received: from BLAPR03CA0148.namprd03.prod.outlook.com (2603:10b6:208:32e::33)
 by LY0PR12MB114387.namprd12.prod.outlook.com (2603:10b6:404:231::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 08:20:31 +0000
Received: from IA0PEPF00000037.namprd03.prod.outlook.com
 (2603:10b6:208:32e:cafe::7d) by BLAPR03CA0148.outlook.office365.com
 (2603:10b6:208:32e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 08:20:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 IA0PEPF00000037.mail.protection.outlook.com (10.167.249.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 08:20:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 00:20:14 -0800
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 00:20:12 -0800
From: Jacky Huang <jackyhuang@nvidia.com>
To: <andrew@lunn.ch>
CC: <andrew@codeconstruct.com.au>, <joel@jms.id.au>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <ryan_chen@aspeedtech.com>,
	<billy_tsai@aspeedtech.com>, <devicetree@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, Jacky Huang
	<jackyhuang@nvidia.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
Date: Thu, 12 Nov 2026 16:19:41 +0800
Message-ID: <179446463981.2115010.3419271617807766116@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9e83c1b9-0bfa-4a37-8253-3740dd7d0b62@lunn.ch>
References: <9e83c1b9-0bfa-4a37-8253-3740dd7d0b62@lunn.ch>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000037:EE_|LY0PR12MB114387:EE_
X-MS-Office365-Filtering-Correlation-Id: d116a03e-5141-4b1c-287e-08df4095d127
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 SZ93cp2lVfz5ALJNSScXV6k8EUovjESz7p/VR81ixhdtRvkuoz9w9TsB8eb57cQEuGLXz0jIGe+k3mTjJxDkNlm0SSff/JsTSDz84wvX5rwydR+v7V5CAbcfl2uIDu5nTBn5ckESdi/AbOdHYmYooERcWfpUcGgOROKDddW5m82+KnhkuOsvQd/p72MjrM1rxyI3vFCS8Y83sSYxAJVBwFGHmfCzF4WHk1bBKA4+0SKDwUzVrwW2r1UOUKembC44jpiaq3h3ETDR0GhsLzin27uIq13EqulJcK/Wjlt2wzNAD+l+vcs8tcJnDG5M+/gXaXMdbySyG1owNWC6ar2FbLX6cUQ99uHKrHU2m/l1fizFhZgWjQ5WxQq4/a64hP7+HcLjjJllA9oXDU2LK93MI2jL3PDMS+7rxxo41meZSDRbBpH3NdJoGFGN0+V3qUGpu3wSaziUXBstle4IkxgEn5JCz4mipHlb4BxTmYcxAYJOhMJAqoWmH0RAfBzErArBIS4yxMnWiMBIFoTiRAQ5UZr1BUgaT4N5576q8vLqcrvwNqbXxiEZZGV3xpljuohGR/zVe+dIlWB+7rqMZBelL8EQrZgLRwFYKTXvrXDW+EjYqIj2Z2onkk6p28KPxwNZCD1HMbatTNzFNfClcGEkuxouUYxL/djPtOgU2Hsw7J8+I6WmO+zIIy/rV/P04Q9owYa095AIY3nBwFAjm4+jXg==
X-Forefront-Antispam-Report:
 CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 Jr2faccgnFS/iFRtwdNuLqOqoBAM8dBF+tSMW7GYYy+Nb94bkUu+ob7P6KlJ26sV9x+akfSlETo6rNSQEDJEm0WJJntTsFgT0+zlM2Ad/92OLXaR+NYTTY03CM0jhAoR2sV3xlVGV/bewwQ6G2DvZhPa3hU6WiTS5x+wFmZTiD5Sh0RWLUCU1Z3dvFMzPlWktO+aVxA13sfcl9+x6VqEYadTPZelguParHMMt5NU0j1jQcuvUPHJ7xxdvr2aNSlKLhIFCEH/q1HE1x7efM5c3gATow3H0RrgzxApP/MdjmxwK32f6Oo28x0QYbda043vpdinD6RWvz6CaJ3fU9h0sCDn+Wh8QiltlGqsEhC88KzYQWHMdDIWPEi7MzHyrlrUsxGnN/9SycAJE3NMyts+jYv+XcfZchzgzX9UbshJsy1lVuopdobVfEBOX0Ipentt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 08:20:31.1532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d116a03e-5141-4b1c-287e-08df4095d127
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000037.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB114387

Hi Andrew,=0D
=0D
> This comment is not really correct.=0D
=0D
Got it. Many thanks for reviewing the patch. I will remove the=0D
misleading comment in v3.=0D
=0D
Best regards,=0D
Jacky=0D
