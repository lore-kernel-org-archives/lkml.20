Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793942330;
	b=e0cD6yUoEeqfAMYgegwUdK8fI51bznNUXZyeR/Cu3UslAwoKm/72VBs/dUUqiY25D1CD
	 1DAkzYne3j7cRKcF6ESP30tzTlixpbnnsbIwVj7xj0mZzp0EFW+cyh01d6qv0Zmpyeao3
	 iYEZF2qD02oo1+ZiCL/yzBHRq6tWSsa9okf8yaLccQnzlFO7ZATYjbS5CKqVHvBCZjHFL
	 ySyuK1xNHaf4TDMZBv7lWahfB24Ndkw7SivtihfW6h2JZqNCnyXwbVOuT3ETOAntGYUbm
	 4vjG0UHqS9dUrSqvruIm2H1EyH6xz+VUNkVborMKURvoWAyXMmOBZYXcsAr6v5gczaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942330;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=a+0UpmdUZtnEfJYE9ks7kgqGlnpYDh7rsQ5F3m+q3XM=;
	b=gqryETBcF2Dn4+C+KERBoE3H7BCWQ4gBkjlFJQXV1jwDvC7kD4VuaN2xQ/i0W4cUxkWv
	 GMxFwfHodo0Y8/VYW0OssrwrzXJuEb5gtgEthYJHMxMKV/ENIHFyokkpwm19aM4nZp/T/
	 MO0LG2lxTdDzsy5zHrmXvlTMoEVpRJ1Zcq+8rMcGAZa9h3GFN7NT1bulsQitjpUaTgeZ/
	 KMU16y6+nuJGV/JDylzv0B+O4dUQEMwl29XlY8SjJPEnGG6NCu9eFbVnIVN0DwtnW40kT
	 m06PLtzxHthxjqNB2yqt6lye5N10jHqUdKRPWU6MfNHWqUJhYnMYJsXJAJQsU4wP2cQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ssIjqEwe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.56
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011056.outbound.protection.outlook.com [40.107.208.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB712606A328;
	Fri,  6 Nov 2026 05:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB712606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ssIjqEwe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSvRbexRPP4dVJ9x/xE7ObGgG/oUIx/MAAu5JpBHF7BndcdzSJYhXaWIQh0nEHedjLEB2h+FFHld7HUSvpN8tNUbm037fyLOZT5AoGpCV2+jRfvkU6ja1krg1r9Wq4wfnH1vAJA7ofKQeWtJ8VWY25C/a2mLr7RYtUFauxBCEqwaP8JQ85/c8PIpTZJYaqAS+CiPN/7uJiHh39bQ/BkfbXa6z3kOR5Int5Mz5FBABWkh00w37/EtaVrmbWLq8/H7xb/GqGkOxHC7EWYWt4Uzei5vYSfwlOqr5dKWo0mLxOhDc0eCMdOGm90DqHsyesv60OUJaW51HxdlR6NfrbDQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+0UpmdUZtnEfJYE9ks7kgqGlnpYDh7rsQ5F3m+q3XM=;
 b=rdFWvLyPEhWDbsLif2omdDsOLsor3CEECRYyMC2yKy66Es4/vRqPvD3LlQ/DT8ZL92whaV4tDuRy8sbUdpJll+nkhj9FAk3Xz+UCwePt0JSwoVugS5dAGPUri8jZe/Wos4a8giX/SKD8aDxBWE+J9JlV8gKzIRUBMbIFz1a+97tpMntYiNnKz8w/WbWxWX/Ncghq4bIO25GP3aLNpcvPz1q1KC1DCN3m0Ym4aX3VK02YoSQ2begqZe8u0+zSpiTaVYy61c1rT1MIkohyctaJ4nEcYr8ssbMAWF7UzXiNuGh2Jspa8SqHs1BGX0pAUKPHKfUVtIJ2eptY2J7PHGoi0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+0UpmdUZtnEfJYE9ks7kgqGlnpYDh7rsQ5F3m+q3XM=;
 b=ssIjqEweCggbuxSo7Bzg/spd8lwmzK73vATnJKTtQfW4JNSLW2fKQre2qTvQvfM842uYI1wj+se3RH2J5Fd5hpALafsKe2ulZIElWI6Hi0PcMxGhgkJmMZl3+Nfp0D8w/rilwMjbi7D6nYReU1zKa1kTfUaavmyFETmcvhU9Tbo=
Received: from PH8PR20CA0006.namprd20.prod.outlook.com (2603:10b6:510:23c::11)
 by PH7PR12MB6465.namprd12.prod.outlook.com (2603:10b6:510:1f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 05:18:43 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:510:23c:cafe::36) by PH8PR20CA0006.outlook.office365.com
 (2603:10b6:510:23c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 05:18:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 05:18:43 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 23:18:42 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 5 Nov 2026 23:18:39 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>, <gregkh@linuxfoundation.org>,
	<stern@rowland.harvard.edu>, <saravanak@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>, "Radhey Shyam
 Pandey" <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 2/2] dt-bindings: xilinx: Remove description for USB host controller
Date: Fri, 6 Nov 2026 10:48:19 +0530
Message-ID: <20261106051820.3414532-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261106051820.3414532-1-radhey.shyam.pandey@amd.com>
References: <20261106051820.3414532-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|PH7PR12MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: bba9f79a-1aa4-43eb-2fdf-08df3bc56d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|18002099003|22082099003|10067099003|11063799006|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261022105027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	PbRlogvT3xUr6Ywr8oWudv2VOsP9cXrsEeZ6Qz/Npk/Zdq2Vds+RZSmglG7onwA7eoAkJ216si5RTnDGplHZZSckv057uob2QWGk8OchVC9P0GfSEfW4tCGt1/u3MoQYIivn0hcxDG4YuBx1xCbSscNvmRhlbwT+mgj3kHlC5NmPqknJQv7C6hdfriiHHRpCYFN48iGIe0s2FLUwWgM4iQelwInqpJKfsbKf59TVV7TkqkTT26T9R3ofo3niarFj7CE+R60wRZynzvcRI+NWwk4Xso75dciRYh5j0cLeUaJk6LQjbNN57GyblfYaIhPKCJo5qGVsGObvQmos5wNI44HifEu20ttQOL6ZMO5Mjkun0fmEi8oke9tivq0EGC5vFDJYGrSPyvJWCoj3SXuBz5nQyKk968pDjRq4Z30sTpQyhokh+sWmhqVWua9eZy4aBj+oZrx5cpmqy6gndMGZgVyus9/8ukX4znQuWxaAvIqhm+P/57ki/m9v+lN9zxr1EteugfOvNp7NUm7H6pF21sgspumtaw7U9rAN7eIGOHW7KNPP4PtGtJoff9I5mMT59uIXvkoaeEeIbsBDO+NFurloGMtBLj27/gGZ4E6Bs2YuiEdehSX93bMZk16924eHKf80xcMV78VVOpBvGNfy2xqk9nuZzusIOkawarmuhCC+/wbjotXKeaRVHbpp6bqEpiTNVRbljGvuDbPJxu7sow==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261022105027099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QobNM+6nz6fQIGPKOtm15D6GS18mQzrSvjNFTj+DijkdjNSUMTdXwQmOqeBWU1/AldWTUgsrxJ3t+DNJLZ7k5UdjGPjnTB7qjnjjKwElvMnrs3AmqFxpG8NbRnHYQrPGbjavP9oT59VqY0by4tLggxeh/Ps5nwvULZUGffEStSR/HGXPoJA9ziP60X2HO0VyiSG5FeQUIvSUeLuov077T0l6B3Afmohb5jw8iFlf6BERiow02TM2FHi52af/1f4nLfmniuAwyffSrpKVLC9tAJNVA/F7u/uh3m7vwqALEJl4PYflLxLJpPth4x6PGaJOcjbOFK7cx+vRlfgoQtU62ma9EXaXeff4oxVIBKZ364x9MdnI2qSKT2Pnv0UmAZkHvcB0h9COf6Wsm3RYunbdjFosAC5eicOH6DMP6dtGbCdbhDjqJCpy30puuyY6t882
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 05:18:43.4057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bba9f79a-1aa4-43eb-2fdf-08df3bc56d20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6465

The Xilinx XPS USB host controller IP relies on Xilinx Platform Studio
and the ISE Design Suite, both of which were discontinued years ago.

Driver support for the controller is removed by the preceding patch. Keep
the bindings in sync by removing the corresponding Xilinx USB host
controller description.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v2:
- New patch to sync binding document.
---
 Documentation/devicetree/bindings/xilinx.txt | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/xilinx.txt b/Documentation/devicetree/bindings/xilinx.txt
index a1a2cde7b7d8..5049af6ff4cf 100644
--- a/Documentation/devicetree/bindings/xilinx.txt
+++ b/Documentation/devicetree/bindings/xilinx.txt
@@ -29,15 +29,3 @@
 		- compatible : should contain "xlnx,xps-hwicap-1.00.a" or
 				"xlnx,opb-hwicap-1.00.b".
 
-      vii) Xilinx USB Host controller
-
-      The Xilinx USB host controller is EHCI compatible but with a different
-      base address for the EHCI registers, and it is always a big-endian
-      USB Host controller. The hardware can be configured as high speed only,
-      or high speed/full speed hybrid.
-
-      Required properties:
-      - xlnx,support-usb-fs: A value 0 means the core is built as high speed
-                             only. A value 1 means the core also supports
-                             full speed devices.
-
-- 
2.44.4

