Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794389596;
	b=KIHQNJlwO6xqMBvwDheYOXAT+F41u5yybMY5drXRcT+d3uzUKS94M9gndEEnyhHxoqz7
	 O1yaPKBBcpLjLeH3nYXod43yJ/cpoFSqp7BSM1LY/GGI1x6qCx7U80jvcZ3w/qewczk+6
	 uFix6HUDqcHRHx0QpMKrY0gIuvGN2lILzy1uD41yn1ODK6ppJt0Sd8kousuH5liiMoCLO
	 fzYLVDDsfmz0d0oVW2gsrePC9ZpbaeccJt4BG4nyKY1Ytc0B1A1mWn+G+RXWZHM/GVaWF
	 gTDqZv6Nb+0gElH7f1GhTUB+9CBeYtjIeatJ2NSq4LETqnCYGxV0hcU5AdknCfbV20Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389596;
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
	bh=g4zrxnTD6clFQg6ZGzIK3ka00uJSjzYkFoU7/oubAgw=;
	b=EFZEeSMikP0LYQnVMdyY0KwN8mUH3sutqF8Jg6JkM8Fy+XyYBI4crMOH+Ez92osHcfEI
	 E1EvgqVIrQ3LrU5DJLO0rm4K5mxGTGcUe1d/hXwphD5WXF1MX0jehP3e1QLpcZtLXW/Uo
	 s6xffVDXQjirNteVbb4zuEhUFuIiQkN/+mdKex0LHyzPtpXkwjFQEjx27YeNFjQsGZZll
	 exuuGtqqQwsRb4cs+D0E9MUR4OOMoZ5QavIiM3slGDXq167rQPb0oK7angAOmD+PSVRhp
	 3MFnP2mJBLokpvUH0X2NpsWU2OxrRnjbit1JIE/npfncMGa3aXyZF4FhRrzepu4hDwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=itLivLbI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.1
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013001.outbound.protection.outlook.com [40.107.201.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE68A606A31C;
	Wed, 11 Nov 2026 09:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE68A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=itLivLbI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pK5oAzxbnyD1dwaPQFJLEE9BKkkMfzRwRjUP5TRl94RJgq1whWftguO61Y2ZXeaxXItPI3h1D9qvN0L0g/KcpNNOiKsRHnt4R90fpudNQ8oGwLhweYXvK79EFFH7NG3vT6Doxzow/kqcQL6nkqqDZDjNQA5wJIfuO0P6dFxmvGV5cHHbrGmdSwe1zGMAPPWiaQJPIY0xPHzVuKHPmWFO27U74nPs2dGC2GVzSfVazKgwVMv5OvLCPZ1gQhiy+EXTg4kkvEnvvr6A6fM1CINU3abqcaNLo5UGetZjxxGo/E2tTNFbpl4Q26lxOp/ES1PuLzYLgw6kRjCR6eH5+Zrb5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4zrxnTD6clFQg6ZGzIK3ka00uJSjzYkFoU7/oubAgw=;
 b=MRGTmFlH10qGBy7jJkM+FwuHi8RJLfyvcNErhqbYkW0grXsZFyYAxZS5dvfvZvi7Vm3GYADlN5jexGX1tRyGRla1tuzx6mcarir6A7WCV2apRg8Q0UHw+2ee4ASJrKF4qT36k4ejBW9eJX2uJTrGc1FaQTXaw/US5yyRTWizy1eLDNsEn+SrhxfdtJSC0sYeOE/VC+lERey1xT3Y1Ea73y1PhovwOgTVFlpgeNZJpnUn63NS0MsS7QOcCf441fYl8dBiTyuAFDZgBRilYkbqstTCED4qhi6qSv9im5QhSKd07ZZRjdDypaB1D8BKo1eUy+0S910MJA/KN1bdsTR1lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4zrxnTD6clFQg6ZGzIK3ka00uJSjzYkFoU7/oubAgw=;
 b=itLivLbIwiJ4mO4iuZoTfYRJgFHjk6wLQ8tqqOyuNRmfEm1onGi36EbI1TV6FYcaGT9tdrGZfKJDWysrLaI7vHpvi4sKjDNw/3cuRjnjr5mlcD3D4Fim5dwrs2IvXQ0qhpWj/8XVqtT71EB16F5RJkBS6xaZP0X7KXSDrdJe/HJqdgi3ZICJNNqbE9iWbeqwuIb31mqvuMKeT7O1Cz8L4DnBrqoAZQaFoZP02qpjKTZR7AhmVofP8jiYjCuPPf2FDqKklwnGXQG9NeTpC6PaenD8OnTr/y1BDF84oxsnayFF2+s1AbdMzJ6nIe8x6QM+0d3Tn6M/aMleMOmYzsHXBw==
Received: from CH0P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::27)
 by DM4PR12MB6616.namprd12.prod.outlook.com (2603:10b6:8:8e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:33:09 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::31) by CH0P223CA0026.outlook.office365.com
 (2603:10b6:610:116::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 09:33:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 09:33:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 01:32:51 -0800
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 01:32:48 -0800
From: Jacky Huang <jackyhuang@nvidia.com>
To: <andrew@codeconstruct.com.au>
CC: <joel@jms.id.au>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <ryan_chen@aspeedtech.com>,
	<billy_tsai@aspeedtech.com>, <devicetree@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, Jacky Huang
	<jackyhuang@nvidia.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
Date: Wed, 11 Nov 2026 17:32:28 +0800
Message-ID: <179438627442.2016371.12057101111349178921@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <91edc3ed1d65a6765530895c6574714bfd76b8d0.camel@codeconstruct.com.au>
References: <91edc3ed1d65a6765530895c6574714bfd76b8d0.camel@codeconstruct.com.au>
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
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|DM4PR12MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: ef72ffe8-f055-4f3e-ac28-08df3fd6cc0d
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|82310400026|7416014|23010399003|36860700016|10067099003|3023799007|261102123227099003|261021121427099003|5023799004|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 nYMTzxO9VjxK6EdjaLe14ZFJFXDg7054NsBwIOSPy31MLTCJz1FcSvo/j0XflDIh3bvHGIH5w/bkZj4MS9HSNx05hca+oASrpD5/VqLgIs0ERD0VDvN8gJvkECyILsKXyXin5+7hF/2SBqftySCRS4E+Cg+2Ld/G+0yKWgwmmHJwWHfu/tUvp514/EXxa9htyXpP9UUHTwXgXoqMmLOjc5X5YoMYB/HxXnLcU4ajvq5fuNUVOgXCN6jtnpmXTNrfQr25aLscwm8GUPKCZzHoQ6MhqrMY1st5vApHbmaQfOJHvMAmfzscI+FWYJYnG6DHsuJeEP/I4TOKvM5E2sm9Js8+hB2OYb/L65gySsDJY4rQd08SPwsRtor2X3GX3kQv79B78Dpnyy3NJfu31ctNQtib/4EcuR25SXO3LgZyAiu1OxeyjNn+Q7F1g1MiyJVa4ChqDvHHePOJ+PQGb8rBvRIPzr19RW/1qoYkWJUI+cf8dixZ49eckGnziFYX33HJrT5ZPtEtqNy1TT/Mp2YXi9HRSZDgXiNiMtvqxFR7G1tZ22MFfKE+gJXZiiN57BFTtehvEiD704XWuHxQhDOiWlmpuqi5hDhStRDMsUSHzdSnYaGqvfNAMaYsfGrlhtM8RHF00ekKi/gtXZVvEadxeMLKHk19bovOqeIdYzXGCQIXZF+RhwwDYzio/ojsMGobXERuxX41Xhbc85iUgozEmA==
X-Forefront-Antispam-Report:
 CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(7416014)(23010399003)(36860700016)(10067099003)(3023799007)(261102123227099003)(261021121427099003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 alv4sFMQKU8BqkccOrbhjuuAMj1LGYEuM+f099Ucq01Mak5QS2W4B/G4NCIBth+84+odMOh0H0hFl8qZz6rAmXwQXlTJ8UmML5gFgAzZX/uHrx2oHpj91hSxZUTSK7zHd896Nssb5Dl/NSV6cmPeixqACixucTC/1+3B+CumxLtATfXL8mkRuMmMEzjs7xzkdvTdhCY9w387WXhjEPQXGCutTfjYqOMr8FgPU4nBwiXXVm4ShU9vhg2qBYyPKX71vsCd+BtMjk+9B+WUyHmmDnZAYkRT2XwNM+tarTnDnvFjj0gBmW+R4Mcn5eU64WCd6zFjVWZZoGTFyHvfs/QbGQQ0b9BmBElfV8eDTiRO+xNaQM/ys6h42if4sNmztKt0/W1br+RAnFeHaa2nMse31CKR4nPbnXebkhBkp+CixHqRiQ9jjDR/x9TpM8Y6HKJn
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:33:08.7495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef72ffe8-f055-4f3e-ac28-08df3fd6cc0d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6616

Hi Andrew,=0D
=0D
Thanks for taking the time to review this.=0D
=0D
> Can you please expand the description of the platform? Why was it=0D
> designed and built? What's its purpose?=0D
=0D
The NVIDIA MGX Vera C2 is a Vera CPU-based server platform. I will=0D
expand the description in v3 to clarify its purpose.=0D
=0D
> I assume the -{I,O} suffixes refer to input or output. Are they necessary=
?=0D
=0D
Yes, the -I and -O suffixes indicate the intended GPIO direction and help=0D
distinguish inputs from outputs at a glance. This follows the same naming=0D
convention used on Facebook SanMiguel. The suffixes are not essential, and=
=0D
I would be happy to adjust the naming if it's preferred.=0D
=0D
Thanks,=0D
Jacky=0D
