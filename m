Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793619098;
	b=ZAD4SgzLBHQwlbQdCzAcPeBRJ4fc/vg9HDlGLmW43mZVKwLYcg175MLyhrMQv2fcixhW
	 /aYK+hEJf5CO6q4Zd5jkvM25370pacnEGPJ72RGkqCkkWZgptIWRLy7WbA57g0cE+d9A6
	 AUa3t8BuG5Uunm7jOCCA3TC5SCgNLKZi8l3nQa2JiTtyMxlhULKfRQpeHtncjLOdFfEqI
	 sLPSD8lJMV037S+LLXZ+crQqkdEiCU0j5SZdlHkco+lXLj32hwx2+BBpSthlOS/VfLT0I
	 2pCD0kYZ9VWMaVX0kXFJ/p13wlgNHRFxjR8MttHqaRpu0/D2gNihHs1AFJmTxXVrxbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619098;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=cJhDMYNwBW1Vp+zQ5jiIgTWuSx4tHUWYR/pyCjaZtlo=;
	b=u2TJUEBobT1Ldorlw7yMILLAM8GKMHp2O3mQwcCjuSPy0mOgaxm4IMQZkruXTXkL4i1X
	 ZdK554wJh15bqJjyUEBZ+uuOPDtift+GFHQdu0fX30w1Q3VLiezDuXo3C0ozI2++Y67IA
	 r4oiXSBQS6KOQEhRipTqv8ctzu9ji7tyDtTYtrxQkWeE1/sqqnp9HpEJKHn3UKpCW1cG8
	 DUpkCjn7kqXcMQirt6lyNbcFduHR6LTlktARMhFNFaUcCPRHuGcjaTvWtxDb+aK3Mt77E
	 7nkEzb0gG8ZIvbUVRo3dLIV/Kq5a3CzqlidPqoIinpqUw2OMZJIScZyMcJhJH1J9ZhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=M1qESGBR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.66
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012066.outbound.protection.outlook.com [52.101.48.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9F460A2615
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C9F460A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=M1qESGBR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoTYlSS+Q7w4vDUs7XFJSfaC6SrjYDTx0f080nmk0JJ4YMwiM6/nM/OD6f2viVvL7u5+lXENIlABlBjhzqXtjylpsJSo7hHq5f3+oJn+Elcad6Wnl+pnB2kGUOA8tvM2hoTbfZLm948ebYLOOVCQ3uL4dIGP4/gcUHiZeiI/dsko2N8zFknNbVOt2xI60kBErk9vj9WgkT8BF4oHaLf64eW5cPk9kPCea62UfiKgX814gZ/j9gzps6F5abT7g5vFmhseZixJb2yDI9Ju2bj5zY5aEHY22C/patCY67J0GR2cdlkcVYmWWEfWnn5Rkxu+CVxyRespCdDPeLxrR4XuTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJhDMYNwBW1Vp+zQ5jiIgTWuSx4tHUWYR/pyCjaZtlo=;
 b=mp6XepSS3084GhdTGU+WiTerAHxoDgmkUauem6VPkYLnjqdzTc1FgCW0JwiVf+U62iKzehudGQ0Ad3F6qds4i9i9vv5KgiBxljggugV0zQcIarNmdBx8u7jZLhFsSDFjYUS40P5YIyXzNxihxgOi620B6adviet1miCVtyhSeAbU8beQ3tiJvsUn+2P9phvmlMvxzytJ5R24baaFCQT2wS75GsS3WkpQ2jrs5UlpJzYxHDg/IFiVsmLRzIJxDl+PLBJpy9+HGwiDKsYOfc3SVGxzaS8zd2crK7oFqDhW+nCwUkYdWFuMiCTgBzTUzqoH6wU0TiIRQ73S5hToDQkL9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJhDMYNwBW1Vp+zQ5jiIgTWuSx4tHUWYR/pyCjaZtlo=;
 b=M1qESGBRRdNwakvWMjwTfxB+Wq1AsIF/TjnWoWt6hq9nTvb00UZqgoExobBkqXtrD/soZTPQ9AcwD3DTqb3bRoyIgroPGvGBqMbiMbx9i/DwMnomL8NOqE5Fwg3x7VNpC1q2kLcGVGLa7TTNzZyrN1do2zYkzlFc1Q6Y9AdW5o8=
Received: from BN0PR04CA0142.namprd04.prod.outlook.com (2603:10b6:408:ed::27)
 by CYXPR12MB9339.namprd12.prod.outlook.com (2603:10b6:930:d5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 11:31:33 +0000
Received: from BN6PEPF00000075.namprd03.prod.outlook.com
 (2603:10b6:408:ed:cafe::93) by BN0PR04CA0142.outlook.office365.com
 (2603:10b6:408:ed::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 11:31:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000075.mail.protection.outlook.com (10.167.248.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 11:31:33 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 05:31:33 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 05:31:33 -0600
Received: from pankaj-M75q.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 2 Nov 2026 05:31:27 -0600
From: Pankaj Gupta <pankaj.gupta@amd.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>
CC: "H . Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Kiryl Shutsemau <kas@kernel.org>,
	<linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@kernel.org>,
	<linux-mm@kvack.org>, <Pankaj.gupta@amd.com>, Pankaj Gupta
	<pankaj.gupta@amd.com>
Subject: [PATCH] x86/unaccepted_memory: Do not accept ranges that are no longer E820 RAM
Date: Mon, 2 Nov 2026 05:31:27 -0600
Message-ID: <20261102113127.161823-1-pankaj.gupta@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000075:EE_|CYXPR12MB9339:EE_
X-MS-Office365-Filtering-Correlation-Id: ac219cec-f33d-4f93-40c4-08df38d4d909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|7416014|376014|36860700016|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	bbNiK9etZKgDbgmmZlMzqtRMvo9eEycoWdEoLnS9tC36Lga9NZ62S1M4viF6Od+WPVY5E03k4mg+/X6iKs+lP0NBb9y65sTWJ75W2UrTJhQk3RO/BxDuJYdkSxh+6H/3TLKJBMClSA8BeFlt8cn3MO4boGuYl626IDOi2hvuEy7ipuYYhpxnEBSraZVWCnM0Sj3phlY1vJZHDrmx+3oHvJXUnzj0iFt78H7aHqOTQ/WL388AyUQ4YUvZGgd1t4R3pZfQaGKya6XSlRUhU+DN1X8aewxjDDDOSCcBNkf1X0Y9l0FZ9bLg2j0K2MBVczmrRWyN+Jyo7aYU8dWMRg07DejAKBbhCVUjT+TKxRZhfQlCP+eW7S5Xi0ap7ANN1u7RWAAmv92c57MLWI/UaVYFQPk9UzOwwEp7Hy3vY24hCm1C+RUqpxOwzJ3GOwJYy6YjDfb09eC0xufcjnByTr4h8sqaBUfM28MrAwSBQIbJgUYYYBN7g1pansQt8HnE2s2L8zAGwkOzBN0AY2UKWtgFFXYdKZcd1Waz9dFYmuWLc9x8dhsnkhDeSkLozLmITbuOjSSzLn/jTf5hvSCVm9d2expZe+/LjwEDSFAZhb0JGsypJFOJdlwzQRjX6oAQv31CJpifbUiLdZY5lrZGhAyvIgQselEmPBwZkWewTvYEqlT27J9rOoP27/85yDbpiqahufxWHi3yib6r3RyV0778Lw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(7416014)(376014)(36860700016)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	74kZjZmgoeoiKv9+smoRJHS2ibNe3zy++qle+t7v6RvXMFgF1U6pwqQILtVzUBs9GXNyZm51+0H1Z4sElIu1v16bLycr+smUwt6SIzNvvH/zCo1zisNdKEokXyIsdONTDBJKhXwIWZhx2YRuOBTuJKEEkM3qrUhmDodH8vMVo6m/GdusmKP+a+DEscF+zSttFp4+aJvBCQLO7iuGuarini1lRsuBz7NrRSD74mzO+Quye/jQ1LwLhxHQ+zgc5hFR1zUd5GjXpZoPJe0f3ZUDPq1s3Frc8/iUlx7XCIvKQTjy3yw22aZsUbX3GXMEW1UvbX/CNP6kMfPqWYIuWrkNLRNB7TJ8cdoVrhFFNA2SkrdVnLfP+L4FLE63O8vCM5SNt/7gM+Ds0O9wLrYtN3p7K1P7JyR+Ec6Y7Y3GHsQwH2x5/6PbW/HxKtCDT+X5StlW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 11:31:33.4981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac219cec-f33d-4f93-40c4-08df38d4d909
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000075.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9339

The EFI stub builds the unaccepted memory bitmap before the kernel parses
its command line.  Option memmap=<size>$<addr> removes RAM from the E820
map while its bits are still set in the bitmap.

The removed range, such as a memmap=...$... hole, is then still treated as
unaccepted RAM and accept_memory() tries to accept it.  The hole is not
mapped, so on SEV-SNP the PVALIDATE faults and the guest crashes early in
the boot:

  BUG: unable to handle page fault for address: ffff8a14bfe00000
  RIP: 0010:pvalidate_pages+0xc0/0x250
   set_pages_state+0x41a/0x440
   snp_accept_memory+0x3e/0x50
   accept_memory+0x186/0x260
   __free_pages_core+0xd2/0x240
   memblock_free_pages+0x1b/0x30
   memblock_free_all+0x275/0x2d0

This was seen with memmap=2M$0x1ffe00000, a 2 MiB hole in RAM, on a 19 GiB
SNP guest with lazy acceptance.

Fixes: 2053bc57f367 ("efi: Add unaccepted memory support")
Signed-off-by: Pankaj Gupta <pankaj.gupta@amd.com>
---
 arch/x86/include/asm/unaccepted_memory.h | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/unaccepted_memory.h b/arch/x86/include/asm/unaccepted_memory.h
index f5937e9866ac..744f1a993352 100644
--- a/arch/x86/include/asm/unaccepted_memory.h
+++ b/arch/x86/include/asm/unaccepted_memory.h
@@ -2,10 +2,11 @@
 #define _ASM_X86_UNACCEPTED_MEMORY_H
 
 #include <linux/efi.h>
+#include <asm/e820/api.h>
 #include <asm/tdx.h>
 #include <asm/sev.h>
 
-static inline void arch_accept_memory(phys_addr_t start, phys_addr_t end)
+static inline void __arch_accept_memory(phys_addr_t start, phys_addr_t end)
 {
 	/* Platform-specific memory-acceptance call goes here */
 	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST)) {
@@ -18,6 +19,26 @@ static inline void arch_accept_memory(phys_addr_t start, phys_addr_t end)
 	}
 }
 
+static inline void arch_accept_memory(phys_addr_t start, phys_addr_t end)
+{
+	u32 i;
+
+	for (i = 0; i < e820_table->nr_entries; i++) {
+		struct e820_entry *entry = &e820_table->entries[i];
+		phys_addr_t s, e;
+
+		if (entry->type != E820_TYPE_RAM)
+			continue;
+
+		s = max_t(phys_addr_t, start, entry->addr);
+		e = min_t(phys_addr_t, end, entry->addr + entry->size);
+		if (s >= e)
+			continue;
+
+		__arch_accept_memory(s, e);
+	}
+}
+
 static inline struct efi_unaccepted_memory *efi_get_unaccepted_table(void)
 {
 	if (efi.unaccepted == EFI_INVALID_TABLE_ADDR)
-- 
2.34.1

