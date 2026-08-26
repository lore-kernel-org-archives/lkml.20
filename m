Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013038.outbound.protection.outlook.com [40.93.196.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F1D3CF05E;
	Wed, 26 Aug 2026 19:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772836; cv=fail; b=W7MVAWx2D3DaWm2V7HZ9IJzgTHVQ3rNcGvjq9SC40qrV2fE5Z8h0529/soQDmGcTWrmX9LpUK9JqzT6DI7HEgPmYTYV/MVu1UMtfMimONXI+3Fh4pAJmthEk6JdLIBjMkMzWu7vpqxmVXgwFFJe31riEtCArfanXvuV0290tYd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772836; c=relaxed/simple;
	bh=KK7RPO5aWATwWwWcVU8z+Bb8hRlU1PRK5a3hZ9CA8/c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bhdJbS2GGCWq7xty7UhQ6bipCVw9sIofoFgtRFMZyOwKie5g9FjtS7JbhoBFREUlDI116DZcb4VPJz9Krzw7tNi248iwujvuRlWq99BAMyBBZVBa13R6afobqm4s8D/Bj0jC5Kx3lKgwCYg+G4zhjMYcqxSwS57M2iwKLgzSjcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gs1ZShId; arc=fail smtp.client-ip=40.93.196.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gs1ZShId"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWp7fEnxlHqUSkKuRWB+8TXiWtI/Q09qQMI9a/rT0UDxmBvdDyNn/vxMofpJxnpn1XikNLn0dbGePVEJmB2n+7SJ9FckZZr1vd0SlTo/ufdWgugAFks6dHdAVbyYfkTs8lstphKF8GUmg4h7DCRSeVT9TvTNJwECKn1pYWG1Y7k8KgPNkq+jJKb7DUDQjf6lXsLVDcRjufKR6s3GIx+9D2y61LclH9QtSihms9YbF+yqDGL7JZO6bkMmibaXI85XInzl7fxzyHhJI4EZkMNGYPR5ekk43tybL5j7DdznD7XzkhURUH3QY3g0fi58CmZ6/LmKVzRpHkhAlGa8eB28jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgdQQmAkTkY5b+enWgAE+yOBrLTDrxdeacXplOhKhOs=;
 b=R16Jhe5WRn4Iw0tZUS7lDs0TJyxOuIuLn4M8QIgShtzWk4EC4RWVnWcBNlnuPlabVb9C1wBveifPGMnLtdVc9M7jGk6BKofLxMjoDf+zbZe94XDPJdCz55Qc9LkAyCvzSOtXL8hLKUci0iVVtxPZPH2wiIg+yl6Pyb3TNk00eGRCn6unTHspmffLXnfiHUcJxYB//y/v/IcH9/Np1i0a8ghaHIaE9JcRa287sgidQvVbGvwsx9h9sCZdOsdVdV9hf+PTY/u0lAWQRneiBtxz4yuA2UzNamR7v6Y+YRgHJGadjCZWBB+FOaG6XNT3TXbto7lqFJOhTCSeJ8AUZNtrXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgdQQmAkTkY5b+enWgAE+yOBrLTDrxdeacXplOhKhOs=;
 b=gs1ZShIdleD1dQhwsOSwOWwaao7+Gs02q3ANqolS9k/0CpYJd/zE9MEWSgEsf+U6l2DCI+TEy6Zt32/r6bdEJRqdFLy1+EwQOPl/xLa5FFtvU4YfAsv7v/NDBKPqH6rZm0xO2a9cleLteEavWuSQxucDhG3SbA500Nwyyj0u7OY=
Received: from MW4PR04CA0076.namprd04.prod.outlook.com (2603:10b6:303:6b::21)
 by CY8PR12MB7586.namprd12.prod.outlook.com (2603:10b6:930:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 19:33:29 +0000
Received: from MWH0EPF000C618B.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::32) by MW4PR04CA0076.outlook.office365.com
 (2603:10b6:303:6b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Wed,
 26 Aug 2026 19:33:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 MWH0EPF000C618B.mail.protection.outlook.com (10.167.249.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:33:29 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:33:26 -0500
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
Subject: [PATCH v5 04/16] fs/resctrl: Introduce kernel mode policy enum
Date: Wed, 26 Aug 2026 14:32:18 -0500
Message-ID: <a4fc2a485b26b94b8ae604ac3e82dcf33e39684d.1787772750.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618B:EE_|CY8PR12MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: b9a38662-07ee-4ceb-96c8-08df03a8e809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|1800799024|82310400026|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	mJ28aVh3t2GMZbYGXnCDpc1mEVuNTXF+Fv/FY03oqAYYrqWiQaElGgK+BsW+HEb8D2NjqM8Du/264YYIaUXXx3x0Hjeyc4M7DD+UhbeiyuRDn/ok99oFn4muTC6tltnOLpVq7juk38Kevm4KCeB2c3sfJvim7+xl90s8hpwMPtQF4P2JELTOevwgj1zwDzgjAJMeH8b8viJno0zyW59bqrvKUW2KLyvoCH3cTa4E4O62PvvD1pWQ6Be/7gRgefxIjWo2o8W7Mtw+cbCaoCOHVahYPVcGGIj4fLhs9cmd0HA3t8wQb1TnRchM1pX6QvqwseUCeoPRfCBuKgCyxFIhmsqK3Neoq79uSXQu2pOFPmUfqMLjX1OXd72cy7VAIVRw6/eCA9n7lL4Xc+MM9grVkAmqm25pP8IN/oYQx+mP4z2iudQrxwtqGKuDuBCxY6Ea78dodKmSqoS5Mo5V53GsHGH1B+cm+YOt2acfaZrOZX5BT4h69VL1kBCNSAAKpX+5xSOD37rMdFCBcMcJ46PHK276/cP88AeoPYYAsx7KOqis4iiJcRUviPDnmjOYAkn8aZ/TGWoeXl0XPpcCL6cn8de0PhR6gevZAT9xysvklC00mN/jTHwItLvwYkKiLG2yXcCSClREKk8ChaefDUn/G+VtwzVjW0e+rtOVKRdye/qZ6akl8/+p4LbiLaSvkmZBtu+JdoeWDXnM/fhqOSBuiw==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GIWcHvYaba7o4mW71g97u1/ja9q94fvQcKBknsyopw4JmiB9xv/SVtuwUFSvz6IJmRE9BVWKlJ6tikzf2/Nkgd+CfNs6hmiTFSLdMEL5teve5UywK8Buqp9B7k6yY+TiLBQPa/LfxRPBiO50MgzQQo/6eTzvh4Z5G2WdaKp500I0Dt78BUf/oYfclNvZxNG7zmKzoOHwTTmlFpLSuukLEmwE7yEgrqo3O7TfMiIbvAagw/HqtgodQ86NnCjxoet7D24HG/1FBazxcHWKDRyVJR1DXsOGyG6xV3B5iAZG3Ft5+BEtwbAJQkigOealBov7/qGGe4GunhIlaGQPrkpNuFvFje/+fC3mXINhZBbKya7Ed3TWA6+z1AkWJ3jyJxY61FxALa6Y3sMSchFsnj5IS7meyyTduuAQ44542RZXK1BuDNIonm2NlePZzbt1PLTB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:33:29.0915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a38662-07ee-4ceb-96c8-08df03a8e809
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7586

Kernel mode traffic can use different allocation and monitoring
associations than the originating user task. On x86, Privilege Level Zero
Association (PLZA) enables the kernel to switch to a different CLOSID/RMID
when entering kernel mode.

Architectures need a common way to name kernel modes before resctrl
can report what is active or what the platform supports.

Introduce enum resctrl_kernel_mode:
  - RESCTRL_INHERIT_USER: Kernel mode inherits allocation and monitoring
    from the user task.
  - RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU: Kernel mode may use allocation
    and/or monitoring associations that differ from the user task. On x86,
    CLOSID and RMID can be configured independently for kernel mode.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: Collapse the two global-assign modes into a single
    RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU value. Update the changelog to
    match the enum names and descriptions in the code.

v4: Updated the changelog to be generic as possible.
    Moved the enum resctrl_kernel_mode to include/linux/resctrl.h.
    Updated the code comments to be generic.
    Removed resctrl_kmode_cfg from the code. This definition can be fs
    specific only and architectures dont need to know.
    Changed enum name to resctrl_kernel_mode from resctrl_kernel_modes.

v3: Removed resctrl_kmode definition.
    Changed the kernel mode definitions to enum resctrl_kernel_modes.
    Used BIT() to set/test the features.
    Added details to changelog.

v2: New patch to handle PLZA interfaces with /sys/fs/resctrl/info/ directory.
    https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/
---
 include/linux/resctrl.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index dd09c2ce9a0f..4245d1e65ccc 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -704,6 +704,31 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
  */
 bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
 
+/**
+ * enum resctrl_kernel_mode - Kernel mode control and monitoring association.
+ *
+ * @RESCTRL_INHERIT_USER:
+ *     Kernel mode inherits both allocation and monitoring associations
+ *     from the user space task. On x86, kernel uses the same CLOSID and
+ *     RMID as the user-space task.
+ *
+ * @RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU:
+ *     Kernel mode may use allocation and monitoring associations that
+ *     differ from the user task. On x86, CLOSID and RMID are configured
+ *     independently; either or both may differ from user mode.
+ *
+ *     All online CPUs are included by default. A subset may be selected
+ *     through the resctrl group interface, and a CTRL_MON or MON group
+ *     may be associated with this mode.
+ */
+enum resctrl_kernel_mode {
+	RESCTRL_INHERIT_USER,
+	RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU,
+	RESCTRL_KMODE_LAST = RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU
+};
+
+#define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
-- 
2.43.0

