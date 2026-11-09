Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794249754;
	b=B51zJFEs1q5Ozpq25GOAwCPMtuQQK+603BLs5cPx8tiVdMp30gym5tsEjxZ11wsxHgLc
	 VddksNZTxn6Rq0Lu8FD6gxbj8qI2H5G98H9FCoqghcI7DBfXie+HKdSW+KVMXcqlhxzE7
	 C4dlqet3pmUYdGxkpnkG85YeitbDgrD1NCEwS/kyhQ8WLWier7CbWEaucxH08dQiLTwxh
	 F8vGbZPaeO1Y73hduKdshdLFrtkWEK++47CvPHyzjlxWxLjn6uEkIVS5l9ewvyadNQ8zk
	 TueVOeouVqdjJHqz9QTBeQsItu1SjvrI+Dnwl/rXKazF5E8btH6qq0lTGiLPEClemMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794249754;
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
	bh=dlsxZYtEeSMnirE2Mvec6rLsfZCL6OAYGtkZw3q5YHk=;
	b=teDb4aRMCoa5D+Bu9SOQuUaaID0IilKSwtaD6AfkeNx/vWNRNyDymTrTAi+onKVkJ2Hy
	 rKjVfsy/QLjBb1sHeIMYfqY9BquenYgpeUOzlGoJXHfXegfAW8PdlrpCtI6fCakKk5tMV
	 P4kvuvw73lujKK23G8z3Wp+lD0ljapBSxxwRju/Oa/OP7peRlaa9C+Zb7pAeFT/zZM4+o
	 7g48zGoeTSPRRc+ds72kGWKZu1wDScACFbBJQlQx8avfyxrt7+QbrDsZan8YHOjF82Lqx
	 QxEnwaorZbOUJP72cyO17H5XD4n5uRMDopYYHMpASJh2z4kNgCLFpZH3i8NHGZXDbAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="RbP/W4Sa";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.68
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012068.outbound.protection.outlook.com [40.107.209.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB918606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB918606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RbP/W4Sa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ops9pJpy0jxJvU2jf+uczuBQ+3P6eDwMoyIUGVfrZgwZ6ZgTdhgdeln1TV7w2wD/MnP2hMzn6Eo/23WmnFz8iRJJj9RnvCg2t8zzpThP6wMHZAd5EQbsYy2GY1gilFTHefIpBxgCqnuOVA1smOBDg2BYVbKLJqeVqR0KN0AOVdY8eJSkCdRMgU16qu/A+zBC0IoFyS3xL3j+mofCpYsJms2L3cpcutqSZhpY0AKEyQfgjXmIV5yWco/z/5ebk9PkxOch22R8Hfi4iiAKpeC7+QwkwQybOLSOujMK73AuFh1ZvEuF5UNr/QipRjoflzi9Y5+Dfp6uZhIiUUn1SYxPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlsxZYtEeSMnirE2Mvec6rLsfZCL6OAYGtkZw3q5YHk=;
 b=q7DhnkB8VNh3lWi1e244Vy5TXm1Bhw4VDhmwKT1CbCHiZjv6N1qi3eYX9yBQQrzeJkNWySuHfdJDrj1QZSbSItGa0N+irrM+yLm77pU+b4cmuezoEzVN4II2Q3OJZoT6EPaFl5KKIim3fIAG47og7gXTLm39WYi6wwhTBvqpT59R+lIRw4FG2WDaqSKYquZ9pIbHwHA/s0XQfzXOvLhNfMtIhCjjckqzGAwAmO/6lIRIfYWY8NNl23CYEr87HMZhZO8TiVRBeNJrX9dDo0LEwdUV5E4VR6I30dGXF/+ghWME3NMNQOaiaWkXRkNf8e4ojHiNSK6XzZZa/lKB66WdFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlsxZYtEeSMnirE2Mvec6rLsfZCL6OAYGtkZw3q5YHk=;
 b=RbP/W4SalaaKMrUzpJPYHeTS0WfHt0gGwx+LyiQwCu+4YagGIwy3Dw56CffEixCzNF0Nql8aIJqa0n9XHPLeppRk4rBhmEa4bJlqjI7f0m8vaK6b6MMVqbcvYINIQQHMaqmbXpXyTO7q8b2fYyU9naAiu7H/jFnDjrWWNB2nrl4=
Received: from MW3PR05CA0010.namprd05.prod.outlook.com (2603:10b6:303:2b::15)
 by SJ2PR12MB8011.namprd12.prod.outlook.com (2603:10b6:a03:4c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 18:42:26 +0000
Received: from SJ1PEPF000037B6.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::22) by MW3PR05CA0010.outlook.office365.com
 (2603:10b6:303:2b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.7 via Frontend Transport; Mon, 9
 Nov 2026 18:42:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037B6.mail.protection.outlook.com (10.167.244.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 18:42:25 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 12:42:22 -0600
From: Shivank Garg <shivankg@amd.com>
Date: Mon, 9 Nov 2026 18:41:55 +0000
Subject: [PATCH] mm: remove unused clear_flush_young_ptes_notify()
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
Message-ID: <20261109-clear-flush-young-notify-v1-1-b37fbafa2686@amd.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBtIqciuEi3MxhoIDa0opLsnL
 d/i/wSRAlOEvkgQ6OLI3mWIsgCzarcQ8pwNspKtEJVCs5EOaLczrvj40y3o/MH2wVmbbmpq1ZK
 pIed7IMv3vx7G9/0AKsxO4moAAAA=
X-Change-ID: 20261109-clear-flush-young-notify-dac8b5496ec4
To: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Shivank Garg
	<shivankg@amd.com>
X-Mailer: b4 0.15-dev-47d62
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794249742; l=1810;
 i=shivankg@amd.com; s=20260518; h=from:subject:message-id;
 bh=wxWmapUOhxu/6jc9xLT927AsGRcrXYc4JFalOogWUCA=;
 b=KNFZ6QCPOiqiQTec+hroRFvtSQKAt3Tdvy0kK6Aa9ax6/K2DFXn276d7XC9gCBt27DFYqJWsh
 23Kh92D7la+AoCZsfF1KYoKB6eegvHZ8VljYDcekOIGErW1AjuEfAtq
X-Developer-Key: i=shivankg@amd.com; a=ed25519;
 pk=2l2QGTeXuGkZTtfmx0nPQU8iFZfjYmX/ymMojitevx4=
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B6:EE_|SJ2PR12MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: 6015d7ef-cbcd-4cbf-6a93-08df3e91332f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|7416014|82310400026|36860700016|260925021911599003|260925022911599003|260925021311599003|11063799006|261009223027099003|56012099006|261021123027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CBZyXrba/nyf8Ab9uTTmPMGc4TJek4qyphphyzGMRIPtiAhXNDUxRhnvPBUNzMruBEBlLrDm931iapGOHoxjEaJqT2rQpCzL9xHgloHhSMRT1kplGhtRm9sQWqOvvClGRkmZt+AvJS4yM88FxVG2SQuUiz5k5RuWHKbdg0Xx5gEeCiJwKliBDmdnBFUwPcUUiZdyA4nON9y3vudMiNXdQ57hUR4T5K4axJp6fvPyK7U050vcc8lKpZ1JSA1llb/uRWXy1JbTtqBKTWgdVzdVKg2N8YSp5c/G0VYPB+a0qT367ny+jJBI/k+Ctz6BzFFUfgmxykbQt6ScaI3JeI5/Ps2NU7pKt83VPj+DCCKnHb/H+ZnBl0uc8MvD6CvL+/9424dQS0PzUYsa5SbD/ta82yPGTHaMPR0cSXzHBuEFhBu0ZX/VqwP6QGz3MpxDa8/OVSd77svI5Qg+vFuxlbxvWWD34wnaGB3EU35bHRh8Be41Vp1lBER+aUr5nwai/tL+mGDofQwqgCal5b430Mcw/752YtPYtxoIbOIZNobGWg8vgla/8Hky63XqnpgGYfipNClomNgZSfXq0btabemve3jxwEK4PGsYVL1gQdcpYFLAwDejL15gbFQw5ZbxUSSTSOuih+9xiyseenufjg9U6M41YH3bPWEvtppfT9DooJ0vtzxiSaFiK64cWdFuLjPLBPOLkbADjojZ08ovR4/uxQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(7416014)(82310400026)(36860700016)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(261009223027099003)(56012099006)(261021123027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1c+tFXoHWa12xaB7bqQagnR0jcKlwCYEUj61S6SjHSyzwzwmZJ7FLP+wjXIQQJHoDr1OdJfkxaS75vFwPkwTXhobiDh7WL9Fxv774K9mJoU+5n7VAlYHzp6IeTDD9FQK13ety03vUdMH3h/RKw8zlOd0XeAwxNiC5dtjzLqyNhjz/9BheCPXaOjI+9MvG7xrY3AuYb6S6zFmAFeCDSBXU9E3z1MRaZlRYAPDS6p766w4QLs1WfP0PjMSynJZUN0ODwGkDJbUq6eWTYTRnoHjCycot4ocQEu8HxpCE80R1IfvvaPavZFAqz4I0SkOJXcoRxcMmtxMbN/WFRJtGBm0eyG9ijCgjVDIVtyNntXoVYSygC5dCo72musjDxeadqQFIWPk2f/DMgZm5L8CHQCUAn8yj2opygvYm1y9IETtvOCxDF6KMaDNY+XrwTtLpygp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 18:42:25.8537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6015d7ef-cbcd-4cbf-6a93-08df3e91332f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8011

clear_flush_young_ptes_notify()'s last user was removed in
commit f3c493d2f42b ("mm/rmap: handle device-exclusive entries in
folio_referenced_one()"), which open-codes clear_flush_young_ptes()
and mmu_notifier_clear_flush_young() in folio_referenced_one().

Remove both the CONFIG_MMU_NOTIFIER definition and the
!CONFIG_MMU_NOTIFIER alias.

Signed-off-by: Shivank Garg <shivankg@amd.com>
---
Applies cleanly on mm/core.git/for-next.
---
 mm/internal.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index b129510b92e2..b1f3a1a59bc0 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1598,17 +1598,6 @@ static inline void maybe_rmap_unlock_action(struct vm_area_struct *vma,
 }
 
 #ifdef CONFIG_MMU_NOTIFIER
-static inline bool clear_flush_young_ptes_notify(struct vm_area_struct *vma,
-		unsigned long addr, pte_t *ptep, unsigned int nr)
-{
-	bool young;
-
-	young = clear_flush_young_ptes(vma, addr, ptep, nr);
-	young |= mmu_notifier_clear_flush_young(vma->vm_mm, addr,
-						addr + nr * PAGE_SIZE);
-	return young;
-}
-
 static inline bool pmdp_clear_flush_young_notify(struct vm_area_struct *vma,
 		unsigned long addr, pmd_t *pmdp)
 {
@@ -1641,7 +1630,6 @@ static inline bool pmdp_test_and_clear_young_notify(struct vm_area_struct *vma,
 
 #else /* CONFIG_MMU_NOTIFIER */
 
-#define clear_flush_young_ptes_notify	clear_flush_young_ptes
 #define pmdp_clear_flush_young_notify	pmdp_clear_flush_young
 #define test_and_clear_young_ptes_notify	test_and_clear_young_ptes
 #define pmdp_test_and_clear_young_notify	pmdp_test_and_clear_young

---
base-commit: 2683df3b7eac1d91380194955ad0c9751454610c
change-id: 20261109-clear-flush-young-notify-dac8b5496ec4

Best regards,
-- 
Shivank Garg <shivankg@amd.com>

