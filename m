Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012036.outbound.protection.outlook.com [40.93.195.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E224921B7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141952; cv=fail; b=QphddZ1/Y9LZxOLzni47UGCSQ8Fe9O0xGKpH1tFIqhZm2Ja3ZBIVIvO994/6BG2E3x/8XdqgQXuLIlyeKFfZT3DO8Un/CePG8XOMG7qkp5H6BoHV0KBATs4bNeCznj1E86vWSZ97Hoquuwyyu3MmAzi0Pui/SBRl7v8zElwf5ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141952; c=relaxed/simple;
	bh=anO+rE+hm40yfhkn9duKR53qPXQmgurFm9vOZ69dlLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fPfd7i2KIH0QbTgu9+GGAieaL582DmZTSibqlOn/rXHrS4VzJXKBxAn62otIf/Ghw4XN9Gqziybowb+eYvs/DEBmrdvvEcp6g6qO4Q5jwqw4670m8UVdL01ih9Mx1LBXW5AuWgY4ZbHzLFu+gojor9z6P0gYqMtOMAWLpNUgVAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=NhNpRAb5; arc=fail smtp.client-ip=40.93.195.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="NhNpRAb5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3UueAhu7m5TRKmvfQCPFKrTuVuAbPh/1JZZzCEZ7v4QhIWYAAxHwV6PbxHJUCELmgyf00dnWAMBgQR0yY/eYbLmThNBnhDY1T2tcT2+0Ko5eCgvV0VrrETI8eUzMBBvJTy95/RPwMRva4zrQGtZA2kmYipy5THbYmLySb7OI5hyC9l0/h3eIPhIqUZgzVbHAALvEEA890e+A/Abyk5a43TbSoQa8BFKwfvn8hcpFZ1m+YNl+36LBsvUNuocND2jFJWKZOW13QqkE0gOLU51AB29lPLSQNAfSx6x762tjN3CrST41uIbr55ID5fubFFrsPIKwFr6O3gR/v1pSucM5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3bzUsapDjR2tXc45g2nFPR2xUnOWDadGf2qzLehDJY=;
 b=pWaYDlRF+51eBfw7TMuRcMk8XQ9tBoIPm8/gMnQqi/R7svsRfvXXaxn6JAvZZ9rZewE7pQDaEbHw0EMW7+yLwFPMp3PIsKGHZto9UDCnxZrDR3NlkK1DJzH8o1crbhTr1AABaq+pAStBrfmAV9WdYEKsyfXwBjQy5Wy2+tZBRTJ6uLsFZca+il9zcAZx+Pbftq01Ks5Zn9R7bE4JPGDoE8bHpZoiy866WlEqIWU/ILh4qyYCz719wyBzddBrrU8+PpHZiGXqBwYRiGwz8rqWjuEGDAZ97rRNI5f5zVVWO0sFiW2bI/Vpso9WPA19dEqEFEYiDDedKZg96vPcVtd/Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3bzUsapDjR2tXc45g2nFPR2xUnOWDadGf2qzLehDJY=;
 b=NhNpRAb5OBu5RvcipM5XkWtGHYui75pJ+XtU7/iRqxnOGMORh1dHgn5WEfZFZDnBOzA27N6q/WK9uhvAmk9/Wfxa+mqzjd3GC1UqNQANhaf53WANf1Q59j4nrDLLNLpUuPnP75EEyULInA/nYz1NG372OtzKnQBH4txayPmPRPW9IwWBPOEBMSnipOygvBTp+k+VVdLjpKstb65wnn42bxvZ3ySTkPd9Ovke/HN0boMkLOudL6JWmNpqGYJzzOCsF3WqwC/R3q9kFSzFHnwNfssxXkGJv7ZmhXRI2LZb8ybNIYVvzhtgIWRysajmUX9wdn30qQL0ODxQqvlq4P4Wlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SA6PR03MB7878.namprd03.prod.outlook.com (2603:10b6:806:42e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 15:52:26 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:52:26 +0000
From: adrian.ho.yin.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v4 1/2] firmware: stratix10-svc: warn on unmatched free in stratix10_svc_free_memory
Date: Fri, 11 Sep 2026 23:52:07 +0800
Message-ID: <052c8153d7ebfac43250dc0cefa0fe8f658aff91.1789141361.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1789141361.git.adrian.ho.yin.ng@altera.com>
References: <cover.1789141361.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SA6PR03MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e050b08-7d16-422f-ee9e-08df101cad6e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|55112099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	cgpL6gSp10hTbYl2EfAJshK2x06UuDBH148wqoqAsndAEY4DH3E7e94JzGkjVovkCZOOBc5dbMtiubVC6r8RiYY2eaYSikcIbgNwtioojhI3rOX4fTjNxCu1YYyh5Av6xgJJUZ+eD/mqN9VkIwS+cOYR1o+d4fcXCTJ/Jc5Wx6eTUlhfz/h50Mg2KIZh/f2enVuqTgKoQ3FUtsw90quZuaHk2s0tYro/Nc6ehgY30qbQhDPmw8RHW8W6bCGEv/+/lJIM2JIiAIxVECECy2CfqQXC/2FsNSAPUyN6FY4gfirAXy3UcDa8OwD4DkjRriUpE2Ia1OEvqhGI4gdwUa5q4RL3myu6NSKh5IJuXUlc8/4+OWVYfUifQAlPIi2xJPWpIyfEX4Lru6p8O8/SwHXVCWNifH8ykzn1B1gn0IzHy3Q7dtxoxFARI4f3zuYuWIqRK/vwDxOtTYweYlcsPfX5oK1XpctXBsCLySZFLTreKL/GaQFQHt4lUqvP/tbfJbCMwghR3sTwbQv5HaMjp4TrMJZGfUl3LFOlrmYt1ho3fvercWf4byldOOU4sWpDqxQubBBO5A/1IRqV9vtrozUp9fn5bwD+fqNM/jekV6/k0l+BPDOsBBB3WkIbqA9KlQW7O5LgM5zQePtXJKIIqUxqDuFejAf9g4XvxNBmSOY9VPA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(55112099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VAiByqBmx2OhVaYaXehxLMSb+eBVws9RLdfqJFiMP9yrEPq++bwJbpNEkbAM?=
 =?us-ascii?Q?A7z8p4VasFldouHKjN0KY6sEriclyqdsGZuIcONyiSnqtEKYP+7/u1gWvT0Z?=
 =?us-ascii?Q?pJGWqWvtjjOndZsJV7OIsHHxAqkxcpIYIdTRBL8byyslCdzeGC66uA18EMwF?=
 =?us-ascii?Q?rUYsGyy4b7jdpZGJz4SheTBWkMGX1SCsEGNBX5FXc/VzrPeAK6BaJzbRj//V?=
 =?us-ascii?Q?gbvwjQ2eoUAWfppWxJG+xWz0FZ8gvcRlBoClSy0ncxXTr55zeZmehIHrAxul?=
 =?us-ascii?Q?P0A0srmHUmchqsmGSDbgjakMCbn5lIZxj5kQd+wh9M1C3j4cBaTvPFY41qjt?=
 =?us-ascii?Q?hfRIDcZL31NfLLzsza+flhtWVwes55Eh8Ni57WmWpGG88p5uquMNf5cfxchX?=
 =?us-ascii?Q?IZmYWNeJ+/gN5OWmycPUP2JQ8BbnTgHjcMmAffXd272UAydg9wzs7zjf82e/?=
 =?us-ascii?Q?23lOcsBXL9B4k2jZHFFvcWu1zDuhNN39hQ9pKguIE4lQJHADGhvGy52pgZ/A?=
 =?us-ascii?Q?i0F9Cd9OZWT9teYIlLTHX3/Q147qntO7rQCEiMabvoj0juyMHHc1v831oIyj?=
 =?us-ascii?Q?MI0F72/b5MLzGjURSKUMSA6ahuhg9qTZrq6qUGlIvlDNmDSnQ3GSEyCPxqm/?=
 =?us-ascii?Q?GcvGLzjSiZRAtr4Ocwuv5nc/IWHU/InC0ZZyvJlohCYtthuYgXwX7nUfGJfZ?=
 =?us-ascii?Q?j6wPVQJ0kFMCCYR72ckymAcmbnFWaRqTS99PjzrwDJIg/H+U5zJAk4lf2DUR?=
 =?us-ascii?Q?8rIKBdVmqHSCP0rwo8MzTswqfHHAor5sKnjyXXnshDYBEGll7PhK8BydTONJ?=
 =?us-ascii?Q?IqDhEE5N44uH/RgVkAuXddJeXgMCFzFSx1jv0JBz53tGCqilmgSHRgRT14bi?=
 =?us-ascii?Q?P9lW2k9rcBFX9y32KcM/ATNSV1wu8cyGxdIpKUMePX8Ibye5djtnFLLBCzXB?=
 =?us-ascii?Q?P2SA2KMQMXg3iScjmXYBM3qZ67Anwccx4ZzLMyK8kqV9J+uuOK1BuKS9aiuQ?=
 =?us-ascii?Q?BCN7KaoRLR/O+VfNZFwjpS38OljBku18XxAZST7wgAjFwEKoXBbAH0ebcas+?=
 =?us-ascii?Q?NJ36ecKWkNfwm+3p0kKondh2IXaPkJk92e02QtbWN4nY6W6xT1/BCy/zpsrv?=
 =?us-ascii?Q?1i2/mIJ3y5dsQRzrWjnqrxo3zw9J3pc/9HhUudb7HxOSmDTvcEHxFdnlHm1Y?=
 =?us-ascii?Q?wjMHXaMa8eXgPgn6jhEJF6Q05/k43PMvP8tUyXNIAL/1c6YA1IaC1EalwN1N?=
 =?us-ascii?Q?0EP3C5jt/6o9y4WN99J0R6JX/m+2F/dqH2bdbyQEEB8f0Zo5J9eWgTaBpVJz?=
 =?us-ascii?Q?gM2RVlVp91S9fjSbija2Z75qaIkJZ96hzJvKQeGp3hvssuSSV1C5pJJHVQAA?=
 =?us-ascii?Q?7U347nvOWVg8fAv8xNmH3QYcMXxwElxhiTbhU1K6lKzFy6z3w3AhlZY9grFO?=
 =?us-ascii?Q?iSHDxx1IXMMRJYmaUHeQf+1nBnLd+iBY9Dg+RHFWJ4yChznijZvbY4GnlekG?=
 =?us-ascii?Q?YoYbVcskLfCn4Fm3E/9eK/B/UYzS+xhT4DZFHZ82Yd7j2/op/ZM7WFB9QD86?=
 =?us-ascii?Q?GFSbbrUw03/w8QHwa19ZD13rYhhQ/oPo+68alo+fcTxize7TMlC5j/9Ue918?=
 =?us-ascii?Q?hVxZu2lAC85hduv0otApgESRQGHdRlhtn3WRmwoIO3zqcuWkXz1HO6Rw3jWZ?=
 =?us-ascii?Q?dmoYPktvIjxKHegxCRucYFNadlH80OEJJ4R3FURj3mn7UtbByViQ6v7F2qpI?=
 =?us-ascii?Q?RaJNe1UhgxkaW5RWuAhBC517P6lPSQA=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e050b08-7d16-422f-ee9e-08df101cad6e
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:52:26.5925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDck5KOTu1xWOKdx82kKhZvmQ0g2nunlA0CPtVnxfc/D6VopBt7njvECOBK7A2PqJoRqxDO9pAYjmsSObMkLG9nsCPGP4s3irD7WZt3gEqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7878

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

After commit 9119ceb76e98 ("firmware: stratix10-svc: fix memory leaks and
list corruption bugs") removed the erroneous list_del(&svc_data_mem) that
corrupted the list head on failed lookups, an unmatched free still
silently returned. Report the spurious address with dev_warn().

While here, refactor the loop to use an inverted condition with continue
to reduce nesting. Add braces in svc_pa_to_va() for consistency, and fix
a stale "physical address" comment to "address" since paddr is not
strictly a physical address.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/firmware/stratix10-svc.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 34c591d7fd58..643cc008808e 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -338,11 +338,12 @@ static void *svc_pa_to_va(unsigned long addr)
 
 	pr_debug("claim back P-addr=0x%016x\n", (unsigned int)addr);
 	guard(mutex)(&svc_mem_lock);
-	list_for_each_entry(pmem, &svc_data_mem, node)
+	list_for_each_entry(pmem, &svc_data_mem, node) {
 		if (pmem->paddr == addr)
 			return pmem->vaddr;
+	}
 
-	/* physical address is not found */
+	/* address is not found */
 	return NULL;
 }
 
@@ -1997,19 +1998,23 @@ EXPORT_SYMBOL_GPL(stratix10_svc_allocate_memory);
  */
 void stratix10_svc_free_memory(struct stratix10_svc_chan *chan, void *kaddr)
 {
+	struct stratix10_svc_controller *ctrl = chan->ctrl;
 	struct stratix10_svc_data_mem *pmem;
 
 	guard(mutex)(&svc_mem_lock);
 
-	list_for_each_entry(pmem, &svc_data_mem, node)
-		if (pmem->vaddr == kaddr) {
-			gen_pool_free(chan->ctrl->genpool,
-				       (unsigned long)kaddr, pmem->size);
-			pmem->vaddr = NULL;
-			list_del(&pmem->node);
-			kfree(pmem);
-			return;
-		}
+	list_for_each_entry(pmem, &svc_data_mem, node) {
+		if (pmem->vaddr != kaddr)
+			continue;
+
+		gen_pool_free(ctrl->genpool, (unsigned long)kaddr, pmem->size);
+		pmem->vaddr = NULL;
+		list_del(&pmem->node);
+		kfree(pmem);
+		return;
+	}
+
+	dev_warn(ctrl->dev, "free of unknown buffer %p\n", kaddr);
 }
 EXPORT_SYMBOL_GPL(stratix10_svc_free_memory);
 
-- 
2.49.GIT

