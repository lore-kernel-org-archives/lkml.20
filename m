Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013062.outbound.protection.outlook.com [40.107.159.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF6D3B47CD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.62
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799835; cv=fail; b=WI6lZ6KTHz0CkfopVlCYi6dqFrJ/6yn5uYhNc35veGQxVzAbHiqMH68PEESVD9g0Nk7qn4TsF89RnZrzIckRCf54vnFE/2DrobKa76tO4Nkq2LiyIUCTbKuQO1PCFb1A1YwUHveXEBiTVbXoI1ASGphxBWEUD8EmgJtbmJEyRl4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799835; c=relaxed/simple;
	bh=vazuMQPESBtkTGvNq5oSA5XBfyEUc0PII8702CDFkjc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZnH97oVqK8X+2/RVz95ayx9Vquo3H/+vWdvohJwunDnhydECbCJP2uZO9wx2MFbLdnkU1nbdW1ip6Pj00u2VHwohSmIOCkhN3FafZpM/iFBWR9B/OiWvlYIblrvLjdjI5fSDA4IXGyW0cknk0f5n5BB2krL8tly0U9K0AV6rAiU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XSaTQMdz; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XSaTQMdz; arc=fail smtp.client-ip=40.107.159.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XSaTQMdz";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XSaTQMdz"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hZT5dfYjouXBALDMiWhqCk8IrWnWI/eeqU+iGIw0djovbUL2iOJZA73p3YvkcSL4f05NMhTs49zISWmka3ReaI79dq0YoXj6BvjcrpWw/wqaUd9iYWzGqMHqePoZZRF3DvHHQx6tC9BaJcjEKOV9BXdD2Nqas822VZvi1DP2XldcyClntHspvfizfC8cataoFYYh2BQ9lsQ0Z4IVCW2VyOFPJhYCi2rFjOyaUdjs5VhUHqdmGVZ3N/fosL4ZyS02JZECFWmMIPi7WwPy6U1dM4dNNLZekI9OwIymqZCjTrBFJy3r+JNLh7vu0ioXuqkyFt0ozme50+hFpTflmMQu7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdKe04+vNDlNrmwJc6CjCps1YJQkUrViWRjFFDGZun8=;
 b=ahNTTOGJ2Z4ilndikVsrZMKHBmR0PgZnH1NN6JSkjoYztmUJlOghZ30SP/vP0Fn6J5C5SN0cmnNFzQsmrOBzbtP9vmnuKCcjZ/+TTB3SKbkICdVqaE1tbW//UArsVkbSY6x32z7uExNsqR3lKz88y7XMXI7scudbfygwdIJsYuTcLh7tBem3hk0ha4++lR5ynQTAb69HYWYrKT7bhUDTUlA7BIR+VyAMvExfffzUhJNkWeyNhmIP/Ju5Dx9Ruqwjhln3vVueQypLIVhxxBGOklbGAu7LmY6p7G74G0872dV5HNLvHhHO7FNVMxRUzH4XfVuORvqx0syjt5u42kCIUg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdKe04+vNDlNrmwJc6CjCps1YJQkUrViWRjFFDGZun8=;
 b=XSaTQMdzUaAiuYSl0vlhgrnM2vWntXDljcjbQkeDvkMsg2etivSOiuIsGJqAboHfzk3tiUHZHDh3q1Qh3vb+n50b0LLMNmCK7IRgjR5Jo5VEVszk+UKC+L9JVHn+2pEEP1uiE7EuBatDpVI5Z6ItMNSFyei/NWUgCMSd8Dl6bTI=
Received: from PA7P264CA0116.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:34c::7)
 by DU0PR08MB9608.eurprd08.prod.outlook.com (2603:10a6:10:448::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Mon, 7 Sep 2026
 16:50:27 +0000
Received: from MI3PEPF0000847E.eurprd02.prod.outlook.com
 (2603:10a6:102:34c:cafe::1d) by PA7P264CA0116.outlook.office365.com
 (2603:10a6:102:34c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 16:50:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF0000847E.mail.protection.outlook.com (10.167.240.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Mon, 7 Sep 2026 16:50:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcILjVYwT722HmqrxHBUVpNC2r/3Ijiv6uISWAtScmmDaQpF/4AqPQztBa5dteEco4lVcwmmTmKTmyx2gJRO5vhCZSgmz2hh2u5I9pmWRI5lIIz9rgwzEfu6qAVV00cxuJApZNgCDX/TbBczQCugYF2RrbhHhFo9bjUWf1RKPIsQY7+PwUlYCvws+StY1zdoCzlhLwH4Ch++Y7dYX8wE8ruvyePpCMhndArLnTXXInapnUulARz2vh0NjDvKC1HnyXhUtUS1CK+3DM61aKUsJQNphKQRoSlKjIqJp+WXc7oMiP3L3OpKynEuwcIzSU+Po2JL/lHLj7dNEH8doNkvpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdKe04+vNDlNrmwJc6CjCps1YJQkUrViWRjFFDGZun8=;
 b=uEW/lDq2lCJmphpKzQm6x0I8B5jiMVfNII2WbgfByNCdx89pc3+ZO/kbndXQWZp7UMAW+DLg2V6NgYOU4qs9iH/UJlnqAGz3f4zyEbhV7OKnYGN7Fb/jm3uPQguz3wZNGl4E2Wd6B2bzShntrru0pL3R7+NO1djXoWtQGKjaKboPAWMdzreLl5o0qGV3WOUhQn9xdGy9dZ4ZMERKawMjgezAuBpwPqTX9mLNwyOd7pI1vORzFo8NS3anhWncrkjLkRIaL9M7pMEwDMz+6EunrssdMrO9mNBbJNitGY2KBxZieAPUIgLCUAXEJzUnQhvpFFMmgBbYx7PWloBV/SnmbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdKe04+vNDlNrmwJc6CjCps1YJQkUrViWRjFFDGZun8=;
 b=XSaTQMdzUaAiuYSl0vlhgrnM2vWntXDljcjbQkeDvkMsg2etivSOiuIsGJqAboHfzk3tiUHZHDh3q1Qh3vb+n50b0LLMNmCK7IRgjR5Jo5VEVszk+UKC+L9JVHn+2pEEP1uiE7EuBatDpVI5Z6ItMNSFyei/NWUgCMSd8Dl6bTI=
Received: from PR2PR08MB4889.eurprd08.prod.outlook.com (2603:10a6:101:1d::23)
 by GVXPR08MB11424.eurprd08.prod.outlook.com (2603:10a6:150:2e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Mon, 7 Sep 2026
 16:49:51 +0000
Received: from PR2PR08MB4889.eurprd08.prod.outlook.com
 ([fe80::8bda:5986:a1f1:cb7e]) by PR2PR08MB4889.eurprd08.prod.outlook.com
 ([fe80::8bda:5986:a1f1:cb7e%4]) with mapi id 15.21.0382.007; Mon, 7 Sep 2026
 16:49:50 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "tglx@kernel.org"
	<tglx@kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] irqchip/gic-v5: Preserve ICC_CR0_EL1 state
Thread-Topic: [PATCH v2] irqchip/gic-v5: Preserve ICC_CR0_EL1 state
Thread-Index: AQHdPujmqB9zMyF8YkuaTgwxXLvOXQ==
Date: Mon, 7 Sep 2026 16:49:50 +0000
Message-ID: <20260907164945.714545-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR2PR08MB4889:EE_|GVXPR08MB11424:EE_|MI3PEPF0000847E:EE_|DU0PR08MB9608:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eea6e59-8dc9-486b-b19a-08df0d001e7a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|6133799003|3023799007|18002099003|11063799006|56012099006|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 EzXwudB8pWvsKgmu3Nqb5cRsZIwrHZYOCiE1K5DTNbuVPVHOkO1kSTQwCKYI5aIOjygbGSKR+rBBI5lHRNY0QkOq0mkROQKNecAN2G4X05f/hjwGzW5lrZbKPROQI4hGgQxBtvdxQ9qWhl04bELuZY/XPyp59EbMKKiwf3NpswwMhsM8Ikfi5TGdhfzRtpzav/hCoxuOoQnJTg+8tEZ1wL1cOp6C4IvWEcJVzbrgu9Ji4oNuu+NN12mDHEylpUEarK4FQ9QoBB5qQubB5NpWbshJLMdrB4PaE5pm7K8hmDkcgqa2yxmK/gyCR0LwI88YAq1BORwpPVCW8JuxX5tPwLcNstLc65FrA5TaeXDMbbc4gAVVzV7NJmxXziv3VvLfvqjps5lEr61KVa/ba/QDX3rf7qOavSTeJESih+68spn4ZEhgcXYeq/wYK+t1hKxyuuVsMSvE6OnG1d7xxrR5SLOZ7dp53g004xysJrAwfMqTQYzHbTdyldZGSsmtcycuq9LC4t/vabLxpxbAZ5+C5jiJv0jhs8tYZGqdwPVm1Og6BBklAHjVZVy1iambUY0Elv7N/h7clwuFkpvXyVDqQHudD2mkIes2tBA5/2c6k46iKdkF91j83QKN03D86oGcTvVdU/ytik5tOXbJ6d0RdIQgw5ia29a4px8AvNMXSWkKuRa4l7ZaTtWzhmR3qCLXQ1n/9hiW7HoPFhoulYKW3emrTx+nnOtEoTTal6GjaVQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR2PR08MB4889.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 hmalb7RXnW+3hyup6k2859KLMeyQWnMA8mXgs7wJUq5qjITOoh4fhrPCI3RkpOYNCKCcTHLLIEZQfJmnX1N/cgvN1/YP30B/+NWFtncYseMU4pr2fyTlvnXQN/FKPG9hMz+ATmg4qpbN88tHu8DteEEdvFIY1S6bnoi2Bl/sSjKQLCgIl2nFHfE7paWqsRbNDx5i0u4vGC/nBnaQMts9+gcfzxZTBnV0gTNJuUhukI45HKNM4OmHxhZXyvY2GTIG4Kiz4wvpQ3FB7+1Qc7sUo8P+M108lA+fshUIxqvyVkzM/c1A7FcraJ+dLe9IYV6m8aZCL+lC9zgBvm+906yG8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11424
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MI3PEPF0000847E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d76e0fb5-b28c-4f3c-437c-08df0d0008d0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|36860700016|23010399003|1800799024|14060799003|82310400026|10067099003|6133799003|3023799007|56012099006|11063799006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	RkV87bnbKdq8c7bqz8P539PBC3bJF4ra10BdZF8MQYyP1QN20s+IDg39N+yUSCLqFnVktWc1OdpI1oYFKduH40PcouQ1agnnfGkVv+xwy3p3SR0UDKDikV+paTZd7Vc5yTPTnAalpHL7DCPNzEmZ4IM3SUkiegQ24gwijEkyvO0NW4XMAPEHbpWXmUWnFmMQHl0uQbvPRxiDtmN7RGTDn+zE/ONcpjQU6aSaOHus3lloBu62VxLK8er/08o4x6fYIWZmZsQlAxnuvFddB+ZBinVneq+gQAX57VXlXqfOMTDibjHzfvNCNmo/uCVLoEJPxn0ARB38ZMvO7weNSGFbQUCKJ0n6707/vevCTaXZu+2dcWalmmgsZbyCmMEqXHMCAoKmi7yM5FLuByahcqYIJKiMeNtQy4c4wxTbGUgaPj3JIRL/ZdCcU+K7FvW6WghiPrDsZ+XMntDdOHJNoqygibERQuKXXYkm2STGPImtpckuWAIlFdt7TOX3FKEBumqkexoMyRgWnL+05oIyBpcJIDZiKBuEN1Fo+lPSrcRKgntIZuRT+EL5eOQBpsy/wxIK1Y5Sujsox2C4oozDPALgj+1cZQ7eREt9D0uvQ6xdAIEl2rWewTEJl5KKPXdPFmAzNSnD0msCgXAfX9Txk/amh4HceGtHpjkwCt1yn6/8nhU72c7bO2wrqD4SljCfHvTL4uTH1yA2Z3TpkznbxCLpjg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(36860700016)(23010399003)(1800799024)(14060799003)(82310400026)(10067099003)(6133799003)(3023799007)(56012099006)(11063799006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pTlTIu0fZF7kZn1bJfm9xIUNw2feeY7blvjTmSb8ZeoNdNdXYrCOZ3mi2iZ7vyjeHBozKLUhnGWdIFdmdYEBPbWxbv2lahXSFdfvTYXdqQojfEeCSmnlYTIrRfeIY4msfqkqrGMaPWz2sQim6qhnLg6128F+0h9pkqbY3CPB1ZCUDR1hpfxyNP5kXckP7fpmHhPwAeQzzoTbBWmXxbPTCAtBRCjDhZfwZxtD5ozutXVARh3xPFAMZjztLhBrHMyxcpY3Od4nZFzo3IMHRMBf1A4Gq8PkyksDNqirkFrTkTthimZt5iZ4DifFTfZQuLRE9hI4xHmoUwd473Eld1m2G6DofofkcM+wPzNzERvB5FqD5uRwaZCEiKSSR0JHJK4+do2IIlKpWyOZL4zstP1RDLY69Q5f3lRCvSzQn0jeePLPzojnQitGtjqv0qTj8oOW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 16:50:27.0803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eea6e59-8dc9-486b-b19a-08df0d001e7a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000847E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9608

In addition to EN, ICC_CR0_EL1 contains other fields, such as LINK and
LINK_IDLE. The driver only needs to modify EN, and must preserve the
values of all other fields when enabling or disabling the CPU
interface.

Define the missing LINK and LINK_IDLE fields, and use read-modify-write
accesses to update EN without affecting the rest of ICC_CR0_EL1.

Fixes: 7ec80fb3f025 ("irqchip/gic-v5: Add GICv5 PPI support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260807121703.D4B7A1F00A3A@smtp.kernel.o=
rg
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/tools/sysreg      | 4 +++-
 drivers/irqchip/irq-gic-v5.c | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 94bf065c8ac7..e2d37ee221b8 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3761,7 +3761,9 @@ Sysreg	ICC_CR0_EL1	3	1	12	0	1
 Res0	63:39
 Field	38	PID
 Field	37:32	IPPT
-Res0	31:1
+Res0	31:3
+Field	2	LINK_IDLE
+Field	1	LINK
 Field	0	EN
 EndSysreg
=20
diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index ac2d423b1723..5f2551cf077d 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -974,7 +974,8 @@ static void gicv5_cpu_disable_interrupts(void)
 {
 	u64 cr0;
=20
-	cr0 =3D FIELD_PREP(ICC_CR0_EL1_EN, 0);
+	cr0 =3D read_sysreg_s(SYS_ICC_CR0_EL1);
+	cr0 &=3D ~ICC_CR0_EL1_EN_MASK;
 	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);
 	isb();
 }
@@ -991,7 +992,8 @@ static void gicv5_cpu_enable_interrupts(void)
 	pcr =3D FIELD_PREP(ICC_PCR_EL1_PRIORITY, GICV5_IRQ_PRI_MI);
 	write_sysreg_s(pcr, SYS_ICC_PCR_EL1);
=20
-	cr0 =3D FIELD_PREP(ICC_CR0_EL1_EN, 1);
+	cr0 =3D read_sysreg_s(SYS_ICC_CR0_EL1);
+	cr0 |=3D ICC_CR0_EL1_EN_MASK;
 	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);
 }
=20
--=20
2.34.1
