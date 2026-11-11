Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437172;
	b=BcUEdfcrar4ew9Jq/2EiZEXwQ8q4sOmrijBQlRQAAzAA2nVvLDhW3O5sYWGGQQK9eo3S
	 qu2hIj+SOx3KNUcdJtsdFaxJGKsgbthTET4hkqI06OE/WafhOsSHvpq7Lu/POSX9Hzb5Z
	 /JyuqG9el8mcf/bKDWma1sXoyBsun3vfI2fJOdgi6yHQcpHyag6BrcfXErIQu8FHHwlm5
	 dWd05QSCiReCcxOBhm2m79+lpd/yJrB/kuL1AfdxVoePpkHcEJudzwCquIZeWmbiwvVaC
	 j6ln+CJyzCax6SGJs9Ly/vGKh3/qpb1jEFaE/QvNpJnxIKNHlX9P9H9hC3h+Castupg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437172;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=8NF8wqHL/2ERE1gP8jiwdICOCcYA6IfqRRcpkrwML78=;
	b=fnyuHyLmLlJTpAao4q9JdZuWMUTMA6Y91eWNKqzN8X3xoJNMVK3CaXwbUlX8Zy0nArkM
	 Aqc7i/9aG429ZUfPqmL7PeMHTwsj8NwVfYRve5TFGk+rqKM3cQRiGs3qp0wFXxfndnaa8
	 WjrpUVFkakQkdkk+hPZmPy+mGblhXsWGIh62YUTKmdFC944TDHOooxTjq2Wqaw5p/kHWv
	 0hcjrOzymVbAmuKNkBLRhg9nWMLURnrFqPfikAMY0BZhE8U77ALH5/OmP6/ajBxuXuCPT
	 fbeSmnZZBeQJnGEvP1e30fBqdhZSGuezrZZoVon+dtcwJDqxByWW5mo0eGru11uPobg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TtdajDtk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.14
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB537606A8B2;
	Wed, 11 Nov 2026 22:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB537606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TtdajDtk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GndBQtYa2c6fVw44EnRE4S5H5sSizEqs0ESnKvnyUtWtFSm4M8SRXvTjpUFQeerlD7fs+88pSCQwZj+Z64gz8VlRIx+NN+cuy9vHIRGTom584MxH4yyuAvd6KkTb/h9sLfrcdyYMl0VRTVhfJSG9TvWiQJf9tZkpwESAgAsKZgbgjla4Y4NssOaYqDZLTQyoBHhn5Fd2RZS3fLoOUq/ZUbOsoZkeYDnGseUHrZMyD3NAM5oyWN5BktHsuGq3Dz2EG97JFMG8hE++RX66ch7l4PkgazRLPlBrpK807rG8bZEQ698jHKvJvIrYIqtCX/NLncZPLX/GfwuUNmSoJHtdaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NF8wqHL/2ERE1gP8jiwdICOCcYA6IfqRRcpkrwML78=;
 b=StAMmFs8ptMxu4sQkQpEIEGdNfIdRWtgvHxjokoCDTYppjBtNRoiAJNEgM9b8jxksdOkqyCAZ2JdjhTpYY0v8MbkS1Wmt7jOeRVyKYeZCXvSDnRQYsJ0ep8eodvFpqx4n7yTRt/tYnMsbQ901c88zeBOmiEQlnx8cYmfYOmf8sLpQyqRp4cwY6MlQtkf1WSLBCV2wSIbImx6vr7jYM/Xa2SGTW6sgHfsuphTS6xznb8GiWc4ERdPW3Hf1pyy+SQtOFyKexy9Bql5POvpnoIs60f1KpRK2+qgneSVu3PE0h6HuQURF01ZtEbF/1/Joc+1JEjSnGWdhdTbtG3buZv5qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NF8wqHL/2ERE1gP8jiwdICOCcYA6IfqRRcpkrwML78=;
 b=TtdajDtkQAuJJWfb8K8HmIHdM5WA+7fTXx/TUFZCPQ6TVwm7xuUzeT2Lhvh3hF5eyhl6pIaFnMfBeXw3FTjtakMV6g2r8gRAx6A+v9zyPLLnYpzdePj4aXlQzwERr2+duRBeQiFNQcqng58f4Y/zTFic2cLFlZYFe6FunuEZR0U=
Received: from MW4PR03CA0067.namprd03.prod.outlook.com (2603:10b6:303:b6::12)
 by DS2PR12MB9688.namprd12.prod.outlook.com (2603:10b6:8:27d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 22:46:03 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::74) by MW4PR03CA0067.outlook.office365.com
 (2603:10b6:303:b6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Wed,
 11 Nov 2026 22:46:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:46:03 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:46:00 -0600
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <ben.horgan@arm.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <bp@alien8.de>
CC: <babu.moger@amd.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <x86@kernel.org>, <fustini@kernel.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <rppt@kernel.org>, <arnd@arndb.de>,
	<kmehltretter@gmail.com>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<enelsonmoore@gmail.com>, <jlayton@kernel.org>, <seanjc@google.com>,
	<ewanhai-oc@zhaoxin.com>, <binbin.wu@linux.intel.com>, <nikunj@amd.com>,
	<ashish.kalra@amd.com>, <peterz@infradead.org>, <superm1@kernel.org>,
	<thomas.lendacky@amd.com>, <prathyushi.nangia@amd.com>,
	<kim.phillips@amd.com>, <ricardo.neri-calderon@linux.intel.com>,
	<darwi@linutronix.de>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v7 09/19] fs/resctrl: Rearrange top-level files in info directory
Date: Wed, 11 Nov 2026 16:44:02 -0600
Message-ID: <fe6f1e9ce6d812c1801115266720eef07831d6e0.1794437052.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794437052.git.babu.moger@amd.com>
References: <cover.1794437052.git.babu.moger@amd.com>
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
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|DS2PR12MB9688:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d64f98-8e94-4799-cac0-08df404590bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|23010399003|36860700016|6133799003|261009223027099003|10067099003|3023799007|261026140227099003|261022105027099003|261026121527099003|261021121427099003|261028144727099003|261021123027099003|261102123227099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HIglSLWrlyoQIn9qHnHe1CctAOnVJjtP8iFNCnpo0yb8d32zgNKgvOqkIZf2XBstLZ/qet7cQnkVbTmc+NblJdLhVY2WD5h082fsIHZv6EQkMp7KJ4KOm9+1tLOTBqVw6CPL4mFme8t4kM0VWdyKei3iNWLrnfcDdujYDGzI9X4Jb+Bh4s4Y4DhhU0Ynz/1CFXXJ/Lfb6K/ad2FaIgSelCaImz7FpLH1EAt8Bj5gaAqr85n2+2NCxFKG8YufQQt7tewyWlbmS5d5QE7Ipl2djdPDbJeKmDtgBlJoniRKv3KdixLR3QfTNgODFBsMPcr6WsnYJQbD9CxVfHl5AenDxzf0p4dlgfh3rzwbnLkN/a+4ckFR6tMXl3YCHBA5tPc6jVBP5LJA87nAu1ATRyn69e9fi7Hf8MCeeUz1ixknXSsGISb4dQqEMHdEj79j3mJHhA/HbC9D/worQjetpZyNc6TLUt2BYy2WUvddYu6x9CgDxWhcyc//xLuPBrO6GO9srfz+DyoZrlZGJSf1wD5Hpa3q35ef5D2DmqcWdMHaQbksX1Vv9usjGr63zf0iWGBAeFQ9siSyaVRtyDTk02VLE0zkWb+kywvFLZxjB1WQeorTNeG6u9os/y/7/ly/hs0wDKSpVTZaSX0lg0Rd+uM6nxNeHjg6nN75fXqEVUrJrQOBZBo1/7psD67mA9Zkt+3OkzmY3vnTb2Ck4RU6rC2Uzw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(6133799003)(261009223027099003)(10067099003)(3023799007)(261026140227099003)(261022105027099003)(261026121527099003)(261021121427099003)(261028144727099003)(261021123027099003)(261102123227099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rdBiQtKPbEEyJKiFa5U4YTOytCN16C5ngVpETEE4Rc3L1GVur2lAls0dUiiEot+fRkmG8iwlDuN9dGzlrshPS2u4HksmvzQS939EkpY5pGMZc5LKeRXajtGDj1J/sCWzYREMnY+Dq0RI2Ipqf+V04NYkoRvKMp3IratgcVZqMZrLdaVPWlxRGg1AIUHcH1kYkMY4UiABi+x8ivrTV9IE4rDbjVTLJzwiibRfpU0tHU2Fbbxo6xFH+LxgU8lPGnIaedIs4Xafzt/mH1FeYqv7CjEIb2BwQUTYwkVewbZQzQmqMS9BZrFr5UBkGqQiVyeur0mo2b9tsoQpVX04J2/d48e2nofntdX1fDJ0Y8gmc2gLtxTSP3mos8XIh0oEM+pAIh/dnJ7gCgjOFV9eho2QWZngYONjmmlfGNgqwQIub0iuEYOzJHU3y2PLjRCIZkCY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:46:03.4144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d64f98-8e94-4799-cac0-08df404590bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9688

The "last_cmd_status" file reports the status of the last command
executed by the resctrl subsystem. Since it is documented after all
other files in the info directory, it is easy to overlook.

Create a dedicated section for top-level files in the info directory
and move the "last_cmd_status" documentation there.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7:  New patch to move the last_cmd_status in new section.
---
 Documentation/filesystems/resctrl.rst | 29 +++++++++++++++++----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index d13a4998ee7e..2d672bbb69be 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -529,18 +529,25 @@ with the following files:
 The upper bound for how many "CTRL_MON" + "MON" can be created
 is the smaller of the L3_MON and PERF_PKG_MON "num_rmids" values.
 
-Finally, in the top level of the "info" directory there is a file
-named "last_cmd_status". This is reset with every "command" issued
-via the file system (making new directories or writing to any of the
-control files). If the command was successful, it will read as "ok".
-If the command failed, it will provide more information that can be
-conveyed in the error returns from file operations. E.g.
-::
+Top level files
+---------------
+
+The top level of the "info" directory contains the following file(s):
+
+"last_cmd_status":
+	Status of the last command executed by the resctrl subsystem.
+
+	This file is reset with every "command" issued via the file
+	system (making new directories or writing to any of the control
+	files). If the command was successful, it will read as "ok".
+	If the command failed, it will provide more information that
+	can be conveyed in the error returns from file operations.
+	For example::
 
-	# echo L3:0=f7 > schemata
-	bash: echo: write error: Invalid argument
-	# cat info/last_cmd_status
-	mask f7 has non-consecutive 1-bits
+		# echo L3:0=f7 > schemata
+		bash: echo: write error: Invalid argument
+		# cat info/last_cmd_status
+		mask f7 has non-consecutive 1-bits
 
 Resource alloc and monitor groups
 =================================
-- 
2.43.0

