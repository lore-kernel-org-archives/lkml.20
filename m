Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793942320;
	b=gOCev3Znmx9BjgduyDZcKyqocXkEaFXCN85mh3XGbm4uoSCMJkLDrj3oK6aSJV9hqRms
	 ZNPF8PcX6wXQwDkbIt+bRw1R0CngYApfqCIT567qbXOHJ55TIOy3AanW3d2bKZrqq1oIW
	 iL2dyJVvqPO7MkvV4fxrmjcamc91dB2+qvx+WNVj0/R2AW2Y2SXAZqLUglB4Dr0w9mWmL
	 ykSpNTA/Ra8qiTDbP9cvUKX2f3mYFtb/euzsjhv44N5jPZg3JoDI5RAGkOfNGEMnGaoRn
	 WtA6Kgwiqs8rEL1uJHRMzQg5j62DPFKkys76Sb/2kTd21OdQtXoVWjld5dslGlkJbrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942320;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
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
	bh=NFcGSM6IHRhT+d/M5ngdBZA3GA2KC4FMNlMhuX3/zLw=;
	b=De48foqxq2EYBu88HX/wt2s666Qin7GAadOii6xes+UZGTlk+EY/j4YU/9KLOiSQHwWK
	 CKSSE7ZYpXltR6lD2Aqfc5JF8geSFZpd80tljklZY5QBagIhNszvHqaFN2HR6faK2b+kA
	 sYg+F535tjr3HLeRGhAK/sq8o1o7e3PJhxnQqSakSWzkd0xbtq64qOpRVxrU3aDOY0P9c
	 mM0iEe8+cJ/+rRoTO8kqkAYq0KpKCiNLF5Jry1kjPmX5S7hqR8ULLJDcFGUa5uJrW5lae
	 ipofOjy+s7pp0AUUGS0v+AVT9o4PK6pj4UCFXXfSx+SCqDNPrWFOM6xDMUDbY70dCaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Pl733Eap;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.41
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CB5606A333;
	Fri,  6 Nov 2026 05:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98CB5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Pl733Eap
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHShqh7610qy80I1zziwy3c+yJJDuW8M4jKQCk5T9WP2ec1BeCovkwiG0/UKfNexI8f1+xBbRsOpxtRkbxc+cZnNcUSlqmx2lrDxMFBUTyMedyBQQONG+V+t6XjHGFp2H7PSx8XtoGUyeC2/GFylRweeXg9gojWHd74v9NasIpniqBPEubvPPf5EBZUIBGyjmTAwmp3DwIPF2/+R51UOB3hYNrBP6z5h8qSLEN5MU7f2/KrrEy9ifSKLfaXmxX7ArDNdJEP0G+cK6MPM1nGi3n1UjWWxFLmtVqJnPg6+vrvH+5iRWWmfBmg62L3xZLgtm3lw04l9AXAFS1n0ZF9xPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFcGSM6IHRhT+d/M5ngdBZA3GA2KC4FMNlMhuX3/zLw=;
 b=JMW3aawaNcj2GMmBzVPT3WyC+gDTwlz7XLTfrRQhZjWSGv0Ovyu3HHZS/Xzgibt4g/KowgsTj/u/Yaf9zHS6q7LWP/TklWEWnwQy0G3eP3Vpybb2L433OVVz2MHf701rq1e3fy2XL2062hMTqZjD8M6MeSbRJIZSFsh8hl8VwBGInX5JVq8eJPuQ+b9CagbOq8hipAdlggJxIsIYTeKkK0pS+6H6FmegPNVvZaNMoM6gqDtX+1AYc0Sf4mbauHCGgiUsFv5NbPzBL8hhBwGEGsRwIvxsAicf+fUQsVgRsAwoQRF2Lp8LSam4JaAleswpRrUQr2BcW0Xqd7HhfpFndQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFcGSM6IHRhT+d/M5ngdBZA3GA2KC4FMNlMhuX3/zLw=;
 b=Pl733EapiJocXJrr466b9ynKPy1xoSHXibovvfFYf4HArTseW9agViI4ECej20ZbQMj3ZOm9PrSW/gbwG294x9VqHAoNrjrw+iYxvxN5OlmffoflJAHNyh9T6qpMnyIqkkqaFVkLUqL1Sph8r5wBSYdXZRFr49AxpwlBfwRcA60=
Received: from SJ0PR13CA0069.namprd13.prod.outlook.com (2603:10b6:a03:2c4::14)
 by DM4PR12MB6424.namprd12.prod.outlook.com (2603:10b6:8:be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 05:18:36 +0000
Received: from PH4PEPF0000B60F.namprd21.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::8e) by SJ0PR13CA0069.outlook.office365.com
 (2603:10b6:a03:2c4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Fri, 6
 Nov 2026 05:18:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH4PEPF0000B60F.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Fri, 6 Nov 2026 05:18:36 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 23:18:35 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 5 Nov 2026 23:18:32 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>, <gregkh@linuxfoundation.org>,
	<stern@rowland.harvard.edu>, <saravanak@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>, "Radhey Shyam
 Pandey" <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 0/2] usb: host: remove Xilinx XPS USB host controller
Date: Fri, 6 Nov 2026 10:48:17 +0530
Message-ID: <20261106051820.3414532-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
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
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60F:EE_|DM4PR12MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: b02ed90f-7a4e-491c-674e-08df3bc568bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|7416014|376014|18002099003|10067099003|13003099007|5023799004|11063799006|261102123227099003|261026121527099003|261021123027099003|261021121427099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	w+IqIudRBYJse3rXuhrdLleEzO4RZbRWOexe0Hm+FZs5RbGPGkxDFx1xG1AQH2BnVG21aGGKLvpZgnKJ3FY+By9zxqTCkt9qkc/nfQ6uuxAGnhY+zG+K5QweQgGnzfkiI9bJFDbXyUd9AlnsPsF+gOyfHiDgiZuMIqY37h8xO18yWx5gIjxiZxrQyO1wgTN7oWecK1zAuMWAE0dO37OrVp9+XyplRDd3TfMOHI+9NfHkYXOOB2ZD6V2BtLlOvyCUostBAEgNM1Tdl/niWFTXIlyzlbpTjNiaW8eN3fZf2/5SjKfexQN9RntebWsEQO12fGFlF6KRT83BNZ7EvE5PM4tVA3lT4qRN9XGoXgl17fbyDC6p5Q/lmr5479xNZpTt8bhTrZZxF27uVkoSoChtnYlGEft9zHVOH/yRg/gPbnboJFNf6zBBRx6GcGAmjwz3agzhbcUwugVNTakJlMQYqXVlTCagut8N5aWePcaxkQjm3zPgOZKjSXWBfj8FHozF84TxKs5G+xqHyS+sLqoDpjKo3fHkn6JCFRfZyPYUdyen61bIEckItXpfUscGuZQm9PvFVvPhZ8nWSKbhay/OBpnVs1SSgRi96XDLiIHrjLCZ4m20ERjy6w/P7ibw64SO19W0I46Mzdtr98Oh/jYVVA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(7416014)(376014)(18002099003)(10067099003)(13003099007)(5023799004)(11063799006)(261102123227099003)(261026121527099003)(261021123027099003)(261021121427099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tvQoSqI71zOrf+GTnsO491yRU8HJ1QKTOIXWmL9LHwOFieLYoyON8bAE1PLB86oyLw6f33z7yh+2tXtFA48ZTdvhgAGXBY2qHNnrv/EdxgSawxD3zFO1ABIDJaruPIbHoz4IJ8OsXAJGrJmLp501y/Y5m9SFxaFmPSb2Xo20eK0Fh3FYKNnuyL4RBJlB+qNIsNwMv0KKWqi9L/iDTkMEE6ASaeVJ5evgkQq33zA1hD2Y0O+xNhWl6QfRLxxq3oG5GJY75RDQP7mas9a72Tnxbu/Km5X2u5LJglwvaEdQjTsAE8L8NGe8RSJB1bSbgCXFe0wqeY9fGvUoUxDfEvS+NMVt28xpO9UoZvfI3TJ0XfA9bZE31ESYEvHAK2pM4w4C+qVDaXfFpqLtT6uubdYnOU+my2iXXylEYlJyDAFXynVvmxmhvNQ3MGn3kF2K3Gcf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 05:18:36.0748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b02ed90f-7a4e-491c-674e-08df3bc568bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH4PEPF0000B60F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6424

The Xilinx XPS USB host controller is legacy soft IP for PPC405 and
MicroBlaze FPGA designs, built with the long discontinued Xilinx Platform
Studio and ISE Design Suite. Nothing upstream carries its compatible
string and no defconfig enables it. Patch 1 removes the driver and patch 2
its only documentation, a free-form description in bindings/xilinx.txt.

Changes for v2:
- Add Alan's Acked-by and Michal's Reviewed-by to patch 1.
- New patch 2 removing that description from xilinx.txt.

Link to v1: https://lore.kernel.org/all/20261103181722.2174208-1-radhey.shyam.pandey@amd.com

Radhey Shyam Pandey (2):
  usb: host: ehci-xilinx-of: remove the driver
  dt-bindings: xilinx: Remove description for USB host controller

 Documentation/devicetree/bindings/xilinx.txt |  12 -
 drivers/usb/host/Kconfig                     |  11 -
 drivers/usb/host/ehci-hcd.c                  |   7 -
 drivers/usb/host/ehci-xilinx-of.c            | 229 -------------------
 scripts/dtc/dt_to_config                     |   8 +-
 5 files changed, 2 insertions(+), 265 deletions(-)
 delete mode 100644 drivers/usb/host/ehci-xilinx-of.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.44.4

