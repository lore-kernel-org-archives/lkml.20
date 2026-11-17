Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794932802;
	b=l4BtOj62NiRZsjq2lgimnLCjxDNTt0Hj2SedtcDU5J4W4H95tf+B5Mj+tDY8QgUeE6/E
	 cK8PJWMJJ/nJzf5KTRLIkkgo2EBenKuW82jzoJ2Q8xzmackQPslJf6i1D9fQ2mh65mnvs
	 4XLJ5f9IIvQU6qPhUtFwEFpQ2PeSSEgpsuThKJ04WArZvdVtWzAaFp670kqYsNEswrbfr
	 RkKCL6MaPfuG3JuoJHODvPJwkh4DbHHdcTjFuwSQiUPDF2jojiv/TShgJklrnwWFg00PR
	 FLXPEU24hjF/GGiz1ufXnojtmffyp7EdfzWk6deogLswl1eJ7hOKtpmOUqcnbXHNQog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932802;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
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
	bh=CRX6/8jSTyoplS7t9Xibi95mJz7CUHjkZMs9HSQC49c=;
	b=iaklNqozBDLK9hs9F0Zc1AN5iUlR0waFuz+Hp8Dl+nVAdwrmf5rMGIOyyDOseMIBd4W4
	 G0N8YPOdlL6glncjGwoziawQ0lXuK6GyvxQvBTh+Y+eJs3BUncSpSncABhVpSUvDY7gvy
	 ATR6CyNuQcJyDtU9793np1AWMT8Dh9Fvzsv03iEC9ojspJU7R2lc+Ar/rxwiu4ZqrK0y2
	 4DiIAkplHYsKBWpstvVbFJiNj3ylr9awgsaDRyhchIsaP8VcBuBZpBFM+bsjf1NqkT2nq
	 pFpG+g/5s2pfWfMKHP1mnVm+54fmvHV81HnftdpI5g1b/0axHj55Ec3VJyuUQ/Crq6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LfXOIZBP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.31
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F79606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F79606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LfXOIZBP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flXfumyxyYwHb8mVZT1aikS/5VnfvPNVk4wN/E7/QFqL6/9k2OdLpHLgE03xhHAIgTDPx6F9itfFXebMDtxbijnADTLQRyeVOZ57A1E6SqTTr6bMlbkyna3Uv+lbk6oTP2QW3enBzH5+MYdwG7inK5wPMWeDN+4b1nKiCXhsAIOPB8EFw7LcYACvc1u0+AlqlAI1z6+Y0motzfQC8mY6l0eweNJHfSPKz5M604IkUDPF5a5AYk8/Pf5ZCyLoJB7PULzuqyrALLCyIvBVpMJYBwUL0v+3qG8t/Xi9MbQSqZKiHI1LmYCbDu4yhemTFElXVpG0C8tAlHQoyG4hXqSSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRX6/8jSTyoplS7t9Xibi95mJz7CUHjkZMs9HSQC49c=;
 b=W+cnwqg2+XFwW9cWTzmKtM7y3ImhcXm/Ocze8FRflVXWE3jv4DZw+uE9uIp7LqCiQyMKBJ/CPBtyY+m6kccuhIbKu7Hi7WleoFc0m9X8zMheRxN8CSCsKlvMeOW3wN2QYqv7Uw0/5ZsmwICCy5g0t1W1TtADUtwc/mzPk9PyUkxnHzd0T2actm/0Mxd3crAB7rMU0W1VXKL0sfsp7pAIFQTHVBtMZvZwtyw4dXcvcLV5J3mRJZxAwezojDYz5DNeRnH9cUi9umJbsJahdg346BQyDbEJCwYoj5KQhkbcY3AJXQq7rGJ3cj2NH1s9aYy/NDNks6qbxBDquhWtHUPsDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRX6/8jSTyoplS7t9Xibi95mJz7CUHjkZMs9HSQC49c=;
 b=LfXOIZBPB2VjY+LABUxgdlAW2nibPvbdv5GgNmPdXarrnN3Gm1MxwZNzilyXfbzpe7OyqugoZ39/Fi+7Qgr6RKh2SXbXewSP/3cRVBVEKu+2OLjobGBirbTkHvSvjPKUFgDfkzdaoxvcoOSqxmRDTaCHG0ybGMwERJhF9O23SIw=
Received: from BLAP220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::16)
 by SAWPR12MB999165.namprd12.prod.outlook.com (2603:10b6:806:4e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 16:26:38 +0000
Received: from BL6PEPF0006C3DC.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::6d) by BLAP220CA0011.outlook.office365.com
 (2603:10b6:208:32c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 17
 Nov 2026 16:26:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0006C3DC.mail.protection.outlook.com (10.167.249.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 16:26:38 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 10:26:34 -0600
From: Shivank Garg <shivankg@amd.com>
Date: Tue, 17 Nov 2026 16:26:18 +0000
Subject: [PATCH v2] mm/page_ext: remove unused page_ext_iter_get()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261117-unused-sym-page-ext-v2-1-900f4c3c6856@amd.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQ5AMBAAvyJ7tolW0uIr4lC62IOSLkLE3zWOk
 8nMA0KRSaDJHoh0svAaEug8g2F2YSJknxh0oY1SRY1HOIQ8yr3g5pKma8dy7KtSGTdYayGVW6S
 Rr//adu/7AY6vYXtlAAAA
X-Change-ID: 20261109-unused-sym-page-ext-3fb8316ac777
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
	<liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
	<rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
	<mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, Brendan Jackman
	<brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Luiz Capitulino
	<luizcap@redhat.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Shivank Garg
	<shivankg@amd.com>
X-Mailer: b4 0.15-dev-47d62
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794932794; l=1564;
 i=shivankg@amd.com; s=20260518; h=from:subject:message-id;
 bh=r4dP+OQNvDE/PmEeoe3sdWcNribjujq5FuwHUJbJp5k=;
 b=KZp7VbpuV6eJZAAhN4FjPTWZ1r+wdkxvdnfKs6eqj6n68ROSYhjsxAhapDhrsHFiQrI+4vq19
 zPspBABipxvBKc8nL2AZPhFHw4vNCGcZ4xQJocPq/nt1q7RjJB833At
X-Developer-Key: i=shivankg@amd.com; a=ed25519;
 pk=2l2QGTeXuGkZTtfmx0nPQU8iFZfjYmX/ymMojitevx4=
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DC:EE_|SAWPR12MB999165:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ce710c-0555-4996-8cde-08df44c78e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|7416014|376014|18002099003|261009223027099003|13003099007|921020|11063799006|56012099006|261028144727099003|261021123027099003|261022105027099003|261026140227099003|261022075727099003|261102124527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	MgUTGCyJcBB02k2wY1NsqvlO85JjyfbveKd1KZgwabYZYBMsGZBZqevnXyczshPv0nkaco4HP8sVVd4B3HCrvAgfjBgvoP9J9vrNcZmi5vjFRSY2wBLRkhGMBz84FxO7RA8htRnXzsMHO8ipdOZj5BvcLwLCTK3CJB7WUivB65TLZ0EqQRxk/BIfglJkw5b4DdbpN1z3+yjyAjU/dW9hAovqcj1ST0Tw+hbnlxrOqPMBMSrUA0jaYi1Rdgxxp5ilOnfVj8fW62kxTOiSZthRqsQHFYu5WElRCqNpt1ZuJIvUbFkbxZogOpcq2mBGReJkTs7qqk0Emadzd5hWpVPXAiccasPXL8VZHuwDacO3yQ2ZUL+yM+PvY9sR40F6yUyMZRga83oMrMjnqh47GP9JYAHIXoHs/eJpMcKClq4nS2u7ppFZtBZpEJpsIf4OjeryY86kojC4Zz3EVzlbDYpR/rQrxx3meOTvxKAU4xkUPRZhBRNhrwJ6sM5CGfvxVHDAZoZhZoYNRuB4rjV5bTgRoOAXzv2bhVZyRTO0UeeGRiVYQ3DVXoYYVMS1nFByPCw5d1gTVDm4UoQxD0cGGQclTVDVTP3rKXp7I8yNmLH5MOvAzZg2BX+tnjlM8BVt95+Cuj6Sz7qPeZN3Wz98WjSO261vcngEssBbm33QrE+VOjiHS8RpC1xNF3dHdOLXUE9V
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(7416014)(376014)(18002099003)(261009223027099003)(13003099007)(921020)(11063799006)(56012099006)(261028144727099003)(261021123027099003)(261022105027099003)(261026140227099003)(261022075727099003)(261102124527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CmhFSIdpT8dayGpT2AfjmDpd3fALgB+MUhrnlLZMFrFpN3p8FDpZ6haQVYzjeNgww0L/P2ttPpy0yETedzBxnOV+i7sCNvMPT56iVBu77iHghh/0RPN3oHFbxcn6J6FmrBHqKuYPgAezSqyDW1jAgd4GIn8+cZPDj6nTaW/T2DTLW8tfHJ0QfgU5G1xmSdBk06eNMJlT1+FewEnBtwyQbz7oMOWB7N0TRNHU4SJ81cu4e43dCjLoSjccY6TD0/p3OHb8lOr37ta0JomIlqZCvpaXXBfBtDiDqQQv/FJDl8LduiHs5gWr3/BnHsasUyiDSKRn59XMkKYMn9YXPmnW7w8Bp6iSSOykOzC3HGjDEG3EgPQZrN5DsX/ZzXy51kMU/iCl2O1/ic7D1l9BKet5rmxG1vKFgHbM+Vy9Wl3wdmnZpCrjK6E6cX7KoANo9mQE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 16:26:38.5813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ce710c-0555-4996-8cde-08df44c78e49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3DC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999165

It was added in commit 9039b9096ea2 ("mm: page_ext: add an iteration API
for page extensions") but has never had a caller.

Signed-off-by: Shivank Garg <shivankg@amd.com>
---
I found this with the kunused scripts [1], which I wrote with LLM's
help. The v1 cover letter [2] has more details on the scripts and
how LLM was used.

Changes in v2:
- Split out of v1 [1], as David suggested, and based on
  page_alloc/for-next. No changes to the patch itself.

[1] https://github.com/AMDESE/linux-mm/tree/shivank/kunused
[2] https://lore.kernel.org/r/20261026-unused-sym-v1-0-82ca2dceabe1@amd.com
---
 include/linux/page_ext.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index 79c53ec45dfa..52a8b70c525a 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -167,17 +167,6 @@ static inline struct page_ext *page_ext_iter_next(struct page_ext_iter *iter,
 	return iter->page_ext;
 }
 
-/**
- * page_ext_iter_get() - Get current page extension
- * @iter: page extension iterator.
- *
- * Return: NULL if no page_ext exists for this iterator.
- */
-static inline struct page_ext *page_ext_iter_get(const struct page_ext_iter *iter)
-{
-	return iter->page_ext;
-}
-
 /**
  * for_each_page_ext(): iterate through page_ext objects.
  * @__page: the page we're interested in

---
base-commit: 3a99594e62fce8c646e8aac01d38af16d6833a40
change-id: 20261109-unused-sym-page-ext-3fb8316ac777

Best regards,
-- 
Shivank Garg <shivankg@amd.com>

