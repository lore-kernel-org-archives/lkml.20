Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011050.outbound.protection.outlook.com [40.93.194.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA03B4B5413;
	Thu,  3 Sep 2026 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445283; cv=fail; b=MBC8WBdR6FhPvJ1tboba2Ux3D0AqRJ5c98jtYegQafd7Yv35eLOCMSYgGQL51Ki3Im8BvKfr+jYWSXAqizbLtkAFWyLB0OShq3sbrkOa0gagtq5YIP5wx9U18OiEuOnVFaL42iR1rfLbC4iXU4NVljYbwNzQPgRA6qjhEDH72OU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445283; c=relaxed/simple;
	bh=Cld8hW5s2QzxPGDfHU4NQ01BhpXDql1dxfi8SnVLvUM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QrXvlZZUQYKYQcdfZQrimBLS7cFSNYKFhAtYpgHpo1KEQ44kMrWuU2fwIuqhg6arooeatlyJLqsVkkJ/6cJY1+VYhY7LyYnIEIxJ+T9mTHmYI6fm1gegQXW+sgVu/QNntP9eIrWNz7m+WwdPzSMMm2MqGwPpC6Tm4Qx7aPn1cbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ysySQ9IZ; arc=fail smtp.client-ip=40.93.194.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ysySQ9IZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLaN/CFGYDRJftEviPF8I6otYC2T2dCZe1KDS066+BH1BWfyHTwX7UW6bgTcVidZv89tdvdEz6A82wjb4aRHnqHAavII2RfJTs6ARWWsc1GpPmaV7dEr5FlImD5lS88l5jKe5JACqRymhMTJk4qlCDmfxxD9B8r7nFvQxM+bDdBSLf9GjXsONknldJSXc6cWpICkXHIR39TecMBCKWY+j3m4eugLj5WEVj3CCbxfSvRogNuXV+dPdZOij3fPvtVsp/l9J46+YaGmlSEmYv/WVIrfnHOTI8Y+OZZV0oCUtUeds8yqWJ7pu326YlFpYy60JkB/OcwLfIvigOEH/gVL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lpxd7x00UMq98MfOveXOPeB3xw4sGlKhLZg794CmxAY=;
 b=ENoo1pux/NMIs3m/pMlay8IrZKKWqIi7Uu9e18U+3HGr7sSxQ+1Vm2vykhXe5qW9WJzt6kio23u6rsSH/TYGVnUP+bnxjd8oI8W9aXRZo9r9JhbbUgHlANzO1NnEYR/lGiVKgIKQi0t/mim9LSU7SxQvwKJfjKd30h7+JPgInLbgy+8Jb0RHogwkzOCx+z8XhY+BU+ue7YW9aHtToL22aTgocWAO2NFXkpNm5Dp/atATIkeiNRUcA46MTKIEONRdjpcVxl7KVUWjZzUIMBNboFJ66H8jk1zPY2k2qLNHX5YcgOx41TmWOvy3xCkabvH2H/BZ7vdqo0be6g6x+epJOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lpxd7x00UMq98MfOveXOPeB3xw4sGlKhLZg794CmxAY=;
 b=ysySQ9IZSsB9gtjHPk+mXaKOmKQxLm5fOIizVjNaevfdl2wxeAzIJpipkPlw+rwWf+N+GIik+5hq9yQNiFz4USouLdINpE5PeQuz0oHf2/Wy2ti0pcvJ6ZQVml53Et4FyCUAH+JYDz0HhHMWSxhqfa8HoZiJHtk9NV+UYfMgwD4=
Received: from MN2PR18CA0008.namprd18.prod.outlook.com (2603:10b6:208:23c::13)
 by SA1PR12MB7126.namprd12.prod.outlook.com (2603:10b6:806:2b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 14:21:01 +0000
Received: from BN6PEPF0000006F.namprd03.prod.outlook.com
 (2603:10b6:208:23c:cafe::81) by MN2PR18CA0008.outlook.office365.com
 (2603:10b6:208:23c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 14:21:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN6PEPF0000006F.mail.protection.outlook.com (10.167.248.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 14:21:00 +0000
Received: from quartz-7b1chost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 09:20:59 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <tony.luck@intel.com>, <x86@kernel.org>
Subject: [PATCH 0/3] Increase MCA bank count
Date: Thu, 3 Sep 2026 09:20:46 -0500
Message-ID: <20260903142049.4126599-1-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF0000006F:EE_|SA1PR12MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ddaa2b-2771-4d2f-3944-08df09c6941e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	b7ysJP8lYYD4zq5h2cKJr37nlmh2KLujRjnInIPYdh7p/TNLd3dvoGSNLklndPAn2trzaTZhlmpGbStBIWs1lbEWKQsLD+YYSdzxzZ1jZWw1l1kHAj98Sj46fKbkStSirAtvpTxdwr6P9xsHsPkxGQ78TG5mRzsC8lOV3nR+8FiWX92rcZk1P5AORiTJcFjkk8qGiioDGVpR1B8gJdQBYPDEd4jgr4rKZQbpX2lVHmhNuefl35+pvdtsxLLHg+SiV2CKmrBPd3XCH5SMOi/jbMAOpA04DGOeQuiYVM+vmrO8qkn/Gm6awlH+Uc/5HmCfbkx6JFb7ncutCQLTGB06c9awLjBKaEkMDRMKq7ztKRqUzG0fhuIf3+P7FDSFotez3odrVY8tvQUkdZ7IKlnu48FVaT/8OHHnRizdd4YA3YTdhf69MHX+hL/nN9yCAzfzHZqBSfIMI1h6vZzbQmD/8+11CSdAdz78mHS6PvcgI8V+PEVl3U984fnSzzIbRVr90mBClyXRCOAmngeTSriKiOAtRJ74T4PCSBwgLzzGmI6BdbcxKMZAFBcB1KKpK2Lq3KFRjtW6qsCugPHXr/9Tn/jlkMAsBVOSCiT/jmzKLHoEbiGJ6pik9UR7xLx2gPI7P7cyHQ6JNnDnHbBPVhuN4c3Xsy3K0bAlniyIeRQ8/LAEDPEo9gxENCOukw7Gjtkwn3i7f2OhFOvjOtMQj8jXkQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2yTI1F8T0vVtHAsgABW80Wfyfli7WI8Wsk4hEv6ewOtqqkxUdI8v9NBDu3GIWThPH2CznDcZRgt5gKDrj4++UHSKusnd/91JviRIxooDNKiZcKLrJ6IXnE3tO2Kz11AtCjucPynOV2xVF1hHyxXComHen/hOd7eUuOUwg+c1lFUfLTi2ErqpLyqUwtOI2/ufIcpE1wUPrSfmNr5rQKut77OxTpwSwLjF3btOT+IAMQ0rghziyOyJeHbQC0AYnCJxcnWNcZdpMVEZ+Bd+gbj6YZuohPR21Ep81Ta5phjauK05M7mJuQH6kp0fJpFmZQyNDTKMbwumaBPu6vxtKqzGYE+ZnUBOYkMsxuSsJate/jW4sDrF2EFnuyb0KYtwGBtp4MFynpmIRcNhdU9ztMWg/yBda+4sCBgp7dyiQ1lfoV92m8G6jbKsJDRWx+uKk0Kw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 14:21:00.2626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ddaa2b-2771-4d2f-3944-08df09c6941e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF0000006F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7126

Hi all,

This set increases the max MCA bank count (MAX_NR_BANKS) to the
architectural limit.

Patch 1 is a bug fix that came out of code review.

Patch 2 is a pre-patch to avoid a bug for systems with more than 64 MCA
banks per thread.

Patch 3 is where MAX_NR_BANKS is updated. The commit message includes
some memory stats like the last time we bumped up MAX_NR_BANKS.

Originally, I intended to include additional patches to consolidate and
dynamically allocate many of the per-CPU and per-bank structures. These
still need more work. So I thought to send just this small set to start.

Also, I figure a smaller set would be easier for backporting for those
who want the feature support but don't want the additional rework.

Thanks,
Yazen

Yazen Ghannam (3):
  x86/mce/amd: Fix bank lookup in amd_mce_usable_address()
  x86/mce/amd: Convert bank_map to a bitmap
  x86/mce: Increase MAX_NR_BANKS to 255

 arch/x86/include/asm/mce.h      | 2 +-
 arch/x86/kernel/cpu/mce/amd.c   | 9 +++++----
 arch/x86/kernel/cpu/mce/core.c  | 6 ------
 arch/x86/kernel/cpu/mce/intel.c | 2 +-
 4 files changed, 7 insertions(+), 12 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

