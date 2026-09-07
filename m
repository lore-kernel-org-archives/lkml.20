Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD4F43F4B4;
	Mon,  7 Sep 2026 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769767; cv=fail; b=V8GarX1ZV11Y4OE6Sfavw1itn5VNIYrt9GYt2Cb/JgUM0uyNwbTElS2wUl42l3TLkThsnXnGk9JiAf3JXdLMthzMgVstJmULb86bZ3adMhLVst9EWyvN9Kgb0uCsZLGxZ6qsgQttN7k2eyC8EgtXlu8XDjUH0g2msubcNMiVLZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769767; c=relaxed/simple;
	bh=XRVXUxyAnMc0hhWUhZNT78+5r/f3ay05rAaKiajLGCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DdxBaAil8wFZuRWPIK7OK74nEKl1g/8yRsCfxFhluOTpjbNzBvqaZIWz34yGJJBZnOqQOK8fKTPwSMox2JHpGy/jH0m43HRAwXZR8gHFsGWRCvK4xFnaLVKjzkpLNY5Ee2h3aB/Zxz8BhWF3taYjZbpv5GHMgMlZwkA3RzIHQwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=m41P/T9P; arc=fail smtp.client-ip=40.93.194.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="m41P/T9P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTZdRKGOZZ2iHYLCzwu5h88l/lVz95Esx9Sg6g18a6AEq2P+MOA0cdimgzOzzPN1EFhvsUuUKbip5XqjwbyarrEj6a+1TQ9L+nEcJDHwgv8cbFqDv1kIPQ+F+Wdq15FILh48+pYsZCqvdFKoULlislz64uC4xyr4ShlHrahxA6EIpwSc/Dao8JA9mm1dL+qGMDo2gYaB84FungIugXVtc1LsUpqJt4HWLWssTH3ZancvdN2X5sq2z4oOiIyaDazUKGg1RpDcwAoewkKre6ypJGI5QnE0bhiT0mDO7YXmwW431VbuVFpQop2mGbOeOzF4ZlKee7YXJFRne7xYir2jIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNreuDKCs2tMIEHis2Ja2R3m87BYrE2POINsZEvpEkE=;
 b=vDS2hW8D9EoS5/w1KPYAPpGO7xlw6a4IJm48as2+f/bm5YYP1Up7OII8O+TMMWEM1oDCUbdc/grLdjpezmy/tBAjd+yqo3FBN+v7LdqLQE5h0hcdvp2XAt+6QbM89Or4xqwk6P3NrgS+hKUoHJMn2zNU05UES1Xrg/ooGzgzZHBryLRkTtfpcCYDV3BixV/JVWOUC8NPytVy3L+Y7flIsOcih9PsWSjeAPqOfnaoNI/oLU8GOUFFNHzWmKrF4/L6DGuBDM43/zo6FezW80qKRObdTLkZuNNeSPN+sxwfGOyeBK2N8kmjSwU5z5rQYM/u0xixCheYyqwvqhzphIJUeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNreuDKCs2tMIEHis2Ja2R3m87BYrE2POINsZEvpEkE=;
 b=m41P/T9PSoGL6G7hIDcxlHFBAv5aODB15C49FxEcRECdNqLD2h1ZvKeF7araNtJyJu8gK3BM2WfW5oAuXm73DCGasnQYvtVeg/8SMJV6uazyBtu1hjvXzN6OMZbU7bj5BYlmJisKcnn1WylNVCZ6mlOWwUld8ESTBJDvfr1JQm5doid7yu1Ku+OyThm70NJV1ph9utZmvlRKOcmaZOuC2WiHj4F7fWgtj+gvlyg+tXuhrsdtlfdeWlL9vsWP4HoCzFCsaSsflnPLVlfmz6Gg+wgsAjn9lyZjhCPDFjkZ8Vk/LOqsVUbEXS2TOM95sMnVIRitr6Jx1NQ6SN9kekrMDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CO1PR03MB5777.namprd03.prod.outlook.com (2603:10b6:303:9c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Mon, 7 Sep 2026 08:29:21 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:29:21 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 2/4] firmware: stratix10-svc: warn on unmatched free in stratix10_svc_free_memory
Date: Mon,  7 Sep 2026 16:20:25 +0800
Message-ID: <20260907082203.2639395-2-adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.v3.git.adrian.ho.yin.ng@altera.com>
References: <cover.v3.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:a03:505::20) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CO1PR03MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: 15cdb9ca-2f56-49db-8200-08df0cba1dc6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	2A++Y5GECqBx6kopa2BPKKBw8L/kCSsK51TecI/9YMYmh7M2mDd4FX8YrODrQoyM05ZXuLAFJr4HVA1d1m7XI2pBQrUu6XzQII3/GKlBu5+B6KVGGSXkLjSK1sNyz+whMplZXdnCAyAWjoHpm/ECvFk2GjI7AAxKqfW03Y10c/yj9n8x3ib5eoXt+XoawuBNsKmWoNa+EjQ1hb9Jh+zBcVFzFcXm9wULqQc9haYgcjDgevMl8qh/JqiMo++5bxyIrZUBsQO17QruOmVuF61YhjXccz/60MJIvyW6JtH/uHVo0eXahWt1CIEkbqX5WjdONL7QpD30J5f71ObaQKGcaYTps5mKclssiTtRfxhn2fr7JVyKmQRJe8MHwL60UeySrhEccA5sj3OZd7dsMYDd79VlrKCzs+snxtRUuagcQBgqYPxlp3tE7K7m2BI7AcLNoHLyi9LGwOLyVs1WShbMi7cOr9jcTgEOUUz9Ua9u3dZi73k1WekfarAnD4VcujyEKmyIwKtcVAGBRn4re4coDMWMVtjqI3EOwFXTJc+8kUAcIEVgO3jsI4Xhj3fcg56nFI9h5C9QdoP6TLKNAm66uTjv317tJDMwopxDSlD5TWBScdRDZEC0MV/Wq7BO4roxktHUx2tGIOEX2pRqD/y/ZIfCAscVmarUPVLrNU+dcWM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NS9IFHJZL9A1WKmEzBZpwr033jnPY+WVZmibq/mzscqqQPY8clfWyheNOlov?=
 =?us-ascii?Q?6vRD5qZLTYeFiCyZfKIsjAqHNTd3j7S6UVRqewyiM87FPBR++OvN0Gy1P+ZP?=
 =?us-ascii?Q?3Gs0B/BJUu2t8D69szBtmvJfT1OkWjz3OUZlpchK9wNEHUoIYdKDO7ul+xoh?=
 =?us-ascii?Q?OeOGithgx809WN1l0bjHGYITUfsq+r63c2mwhKXItPC7q/TOPX/jDhaUCsC7?=
 =?us-ascii?Q?F5DrD+tsScj2sqWqA0s36/xpXmG04OYrHYA1POeTC3ibQQj0aOXFBNwePgma?=
 =?us-ascii?Q?4bOh51ouwoEGmSl1ccLLRsviR5Po+OHmc0Zhmf+iKl3nTuSgP1jvu8PTIbP1?=
 =?us-ascii?Q?HOP2GlnnmKZB7mKddfPhSd9i3HdJb4HHqC3Qb6R8ZqN1C2toZZl+CZ2O14q0?=
 =?us-ascii?Q?WbiqCruThATrr2tkSr/BPcXwzwKrVdpq/PQnk5ojupvtB0CqsatONBMRiy9M?=
 =?us-ascii?Q?Ro57GuGA+PIM4A5+nBJa+Hy5r6AdLmJbXiy244NCmYgnexBLwCq/ckZtqy7v?=
 =?us-ascii?Q?82/DvyBtdiOEtWSsqkf4iRuTC/UZGQfaTptehvXM/jil4/0CEhVvPv9JFiQ2?=
 =?us-ascii?Q?6U7BWxi1/d5OJ5wZkxlgWM14XmBPg9MIDFojG8TshU6TqhzId/Tlb2AtFPbs?=
 =?us-ascii?Q?sj7/JtHvpeWUKlLTS/5WWP9w9V+V63Wd6MyRv3UwbzLdXXF/mPBeQDbVv7+S?=
 =?us-ascii?Q?d35bFSG0MDXCj7hdq51avWvlgnRGqNvz2jbh6BJVDWAVYPYDbGEXlUj2MM99?=
 =?us-ascii?Q?9OFMT/AglnkAxx9dCCGzzhYp40OGTv0QwPFfBB83cebw4XgcNZsZVInsK6JA?=
 =?us-ascii?Q?qOfWfQbjrp8+iJY+gElgfpCFb5/UVpFY8/+pOMV1cvxfaPOb4lzZug2CBdGs?=
 =?us-ascii?Q?RwmhwUH7tNuVcyFS1z63DT55sk0SkksouV07sOsAr4cgTPIw0aZQgZ+QUUMt?=
 =?us-ascii?Q?W5KhdG3qucS1U78uBWK8ToaX2gmTEZvLq0cz0FN4zKyEJH8i2lhKq1ZHlJNG?=
 =?us-ascii?Q?5l5F0yqxWb/xQLjcWnJUcfCoCk1GxpzlSblFakWygV/I/95hPpwcdI86sOaU?=
 =?us-ascii?Q?ZrWy3DvYSHaiXraYdpjxQ4511MT23c8L7qJG78lXxD17RDkY32xUFdYqh/Od?=
 =?us-ascii?Q?gTbgMy9sOk9QXQwuO9uyqMtbh3rpY6DUXVeJ6XOst8U6RBg2EhXs86jJSdhM?=
 =?us-ascii?Q?AfPpC9xn0uISuYAc7bWLZUCEcLP7Ai3+IylBh7OuPAmihsVGCLBBAmntvyTi?=
 =?us-ascii?Q?oF/3rzwIdYNw2Q+JbSLDCoZ0/uj0QKjS2Dy0gLss4mxyFR9GCILlg/6+F0w6?=
 =?us-ascii?Q?jtm98TxkliNQXJ1txRkI8zEfaJJprGuB6yyVIb8dFof4qotDG5CHJEgHq0Lp?=
 =?us-ascii?Q?NLViE7a2FuYIx9RqNAx2syvfbN+NUg7BcWKS5iDp147XLhR6C4j+6IhUlGX3?=
 =?us-ascii?Q?/990ouQ8lfhahWXirUa6F2pnUyr9XA5VzWqvLrid5pay51bRCOw5yTi8WezA?=
 =?us-ascii?Q?xJbPeatbDr4scfXg6mYtq0XB9TYTaZgzDBCzvywCQ+0cPjAM9ZBy31sJZ1xo?=
 =?us-ascii?Q?T2II3R7Mdy2YVZPjcIHDbLTJ/T5QdlEU13vcx7nfIvYCJ3WVyhluAlpQIBCP?=
 =?us-ascii?Q?iulw1GDWE+bwIYpUeuH4yyPAhcDuSJxltzeEcg/69dU/z4gpWcFpatxf1xMJ?=
 =?us-ascii?Q?s++EseL3BUy0n9ufn6LBZ6VtjoTWXI4ibizxOjNliJUiIL1N4IJkyVA7utIf?=
 =?us-ascii?Q?TQju2/3TAGX3g6/TvQmbF9TX/fnXt1c=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15cdb9ca-2f56-49db-8200-08df0cba1dc6
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:29:21.6520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PESzpG49r0ers0jw/10SBvUuTOLOrCW7baSOKqgKyTBHtslzSaQgJZ4ohGHt/+vk+dVVcRnd5UoQoqfCnVTPM4GOG2CGEFFdxt1T7gA0GUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5777

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

