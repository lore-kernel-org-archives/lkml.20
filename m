Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DD44766A0;
	Wed, 26 Aug 2026 19:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772879; cv=fail; b=FtVUUfg82y6ExqNsRETS1VYDxdpGjBoeQHifJeLNPHRaf0e5SOQ8WdAw7tMlImi6BuN7K/fR0MaiT3rJ8AAeQtCltKpnoGHJ0VeFSrNRGUsq6f5nO13E5wDJ9v+hAa9gB/EZ7zyJCGaLCC7MoexQEceDJkDB6sjwXIJN65pSiKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772879; c=relaxed/simple;
	bh=HPhr9Fj5bbyte7HJ9ZS157sxMFO8QlbK5zwpUnsb1xM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iwUju9f4hsQDKv6vKhItvnX+v8kG5jJaWrJMa6vM8QI0NShSchY/gxKVtf93b3yB1TK35lz5SXwq6YeGd+vDatB2y7lunO5XUJpskLcjQhcEWP0xgqWHfKR0dtFBJQOEOBBwpUR/WB8aBLvHrZb512k9aoIDFDqpo+y8z8Bs6I8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ggIyUz38; arc=fail smtp.client-ip=52.101.56.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ggIyUz38"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFU3jrLDxvvznMGOITtb26UVP5Xt1fkLmB6CsrzdD/KnrKEyXt6FSScX7wQh2ykneyxuEuByyU4gxCDr+aP1QOdnXIIAT7X74Yo4ewPfZ5Y770HkUzt8H6wqrbLqAFCCmURjBBoSIdAaBiZUKO/8f0xsllggXi+VJU+i4D8J+VHGmPvitXe3LCcWkGKRpUy4n287zBCmfcDiuvEqXR30kLZPtjMtmfQDQwX4SLEkZbyABZ0EaKbLqvpiGv3H7GXXyzS+FXM7v4LWGyper+56+yPHyRb/NUN+TtLqr4Ci653HLAyiu2tO+owOeWyfxgP714U2BUxXQ+f5zX4U6LFWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MRe/KMpfpn8/MBY4wNEfeORkJkutQqNVnNlWqU+JcE=;
 b=TL8kB/WfXofuiMQzE+11uk1ej4EkoMwenzC8w8N3b2mDr2MeomuCWM73HrcMfJwBy/ZDR9oQBD22sOGZJTey1AWcpW0gWQRYNnWbCylmqw/M/VQa54uU1JmNGV0SFRYEda2eRtMxpnWBOGeWQEy56FVwF4MmKOoYubAi/sQouJL8pIvSxK1BhGXSGedDJ5rNDSHy8vTVAOPqNZKrGTo6f2kCfsbYCRDSQ09Ok6xbCzH0FlJbU6Pv0FM9VaCPz2ZaK/JJHufrhvpcVyXySEL2z3mfSZK0vA5W3foEgDTmhSIdnZxZy0r5ZI3BkCatS4PrnN8lopuS+9mK4icQMsqr2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MRe/KMpfpn8/MBY4wNEfeORkJkutQqNVnNlWqU+JcE=;
 b=ggIyUz38neV1Avr7KMG/w+rnrC0330vRqMKKSb0rLKMQ/O948kbbphPr0MZbXqflGGs6WhpKtVVVOqNT9I2Og14EqZrnobPLlF3jQboVi2aty2y2QIuyh0RCnwtgRE7IXY+90aJczYtOOrgugma7a8x1uQOZo+vOJ5Vpu1NjoU8=
Received: from SJ0PR13CA0039.namprd13.prod.outlook.com (2603:10b6:a03:2c2::14)
 by DS0PR12MB9038.namprd12.prod.outlook.com (2603:10b6:8:f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 19:34:17 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::74) by SJ0PR13CA0039.outlook.office365.com
 (2603:10b6:a03:2c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Wed, 26
 Aug 2026 19:34:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:34:17 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:34:15 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <bp@alien8.de>, <ben.horgan@arm.com>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<akpm@linux-foundation.org>, <rppt@kernel.org>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <jlayton@kernel.org>, <enelsonmoore@gmail.com>,
	<kuba@kernel.org>, <ebiggers@kernel.org>, <seanjc@google.com>,
	<peterz@infradead.org>, <chao.gao@intel.com>, <jmattson@google.com>,
	<naveen@kernel.org>, <ricardo.neri-calderon@linux.intel.com>,
	<tiala@microsoft.com>, <chang.seok.bae@intel.com>,
	<prathyushi.nangia@amd.com>, <kim.phillips@amd.com>,
	<elena.reshetova@intel.com>, <darwi@linutronix.de>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>
Subject: [PATCH v5 08/16] x86/resctrl: Expose assign_global_enable_per_cpu when PLZA is available
Date: Wed, 26 Aug 2026 14:32:22 -0500
Message-ID: <cadd23d85f93e24458ac54927b5064a586bea69a.1787772750.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787772750.git.babu.moger@amd.com>
References: <cover.1787772750.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|DS0PR12MB9038:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e5c2c23-3863-41ce-cb7b-08df03a904a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|23010399003|36860700016|6133799003|10067099003|11063799006|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	57TDCz1/8M4sdZjmkhKxqr5Ma92ZHslAEjILNc2/YdPrdvFtJUvoGRdQCUQqWq5+2BxX5Z+mDiGswnYqj+AUrY9hV8XomlM9f6o1Mf0Tsuf2mowuQsPHIZ4MuDg1Bhiwm4MqKQbmmLyP8Sfa/v7hO67yJa9pmTM1mkSwH2D8KErgn7yW9I/cwBIE1d33AYoNtLfnKy/YqAnv5hBIUrtCJjYvZyX8dgSQyMOSITQQDNO8vq+owzxfgVMLYl5K9IGL0W/DMc95lybDKT892h8OnRXMTaDQTPaPVU2IoGtN+kNh28QwqswL+/60bCUql5BST6VE1jHVCSQpnBl80Z5WE1hm5Q73pmXTVVSSQezbNUtQDA/vpwXTSmiDkvC/pn7LDYradCxgmWsXece2/KW5zz+MMWCUhDYxXTtKlubsGgDExq46n7sANllREGuZR9sU1/+6EbIoQAZqe1A1LTKxr0KA2NrgAW09O0iMM++T92sFAO42rKL7qgmd/dgvc6lWk3F9P8zB/4+Kylys8MUre2jvSAn5bhMYieaY6zS3Fnj/vdptK9S98ww7zERE8ZRbfhf87QKZaFTRvWWhsEC/X9TVxrdcviz38TKdKkoT3WWKZ1lRY9vbEWrGPFnNEykredYIKzk6lY5DkKVjlK5yJq2+wWr7kBREVl8MgimciVnCmMoCh08nfInEvwkrThvmaUqz//Q4rNySOPBIY7w/IQ==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(6133799003)(10067099003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+0PjKchhEJTo2eSwvMw5kYrz/yymvta4Pn44PNWVtOOCcIAdTq0ZWy9F90nTTqyC5JW5l/4qHcPqHUTsVk6Ov0473Y2haW1LsoGiBJIveEZ7PYVvljdavkIkDwF0pgpCpm5X3lBJi/y935/S4BQJpKLSBJ3fnM+W2CM/46dp9tr3K6nEdL/ljGEnisQ04/yL7copb8HVf+xtsrdcc+HBIMoI9AeWv0lswx5RtgBTRju9I/G3l7AP4u+DRGERxXdwrc/xeznLAXWC1SlrLsUz+LAXjBB1ooHgamQAOKMMRzkQJLEfh6K58ee+kkdGtnGdj+AC5UsOVXNql3ap7FG5+Ki6wNc7lOcl2u1/wvA5PtccKcLcT6lmke6MPNIZ0O5y7Nw23kmcAQ8N5oQiaDWeuN+zOjy1RYwsKcdad5XwM9UmGl6xdr/8Zy8R6A3ecWPz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:34:17.1380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5c2c23-3863-41ce-cb7b-08df03a904a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9038

Generic resctrl exposes kernel modes through sysfs only after architectures
register them with resctrl_set_kmode_support().

PLZA provides per-CPU kernel mode allocation and monitoring assignment, but
assign_global_enable_per_cpu is never registered during x86 initialization.

Register RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU when PLZA is available and
resctrl allocation or monitoring resources are present.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: Update the patch to adapt new data structure and resctrl_set_kmode_support()
    changes.

v4: New patch to set the supported features during arch init.
---
 arch/x86/kernel/cpu/resctrl/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 4ca8bedeb995..39d6a2a60805 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -1021,6 +1021,10 @@ static __init bool get_rdt_resources(void)
 	rdt_alloc_capable = get_rdt_alloc_resources();
 	rdt_mon_capable = get_rdt_mon_resources();
 
+	if (rdt_cpu_has(X86_FEATURE_PLZA) &&
+	    (rdt_alloc_capable || rdt_mon_capable))
+		resctrl_set_kmode_support(RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU);
+
 	return (rdt_mon_capable || rdt_alloc_capable);
 }
 
-- 
2.43.0

