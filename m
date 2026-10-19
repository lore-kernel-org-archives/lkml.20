Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221934A64D5
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404437; cv=fail; b=sQ6lzBolB3pTEIK91blnYZordfdarNni0Rqpz6D6K5wI2AzMfXeah7wtbx2mSqxi/CvSBshW6Yu8PKFB0fCECdX6aLtUCZTSAoSVXrGKjqV25ow40AvtwIsYIuo+DNmhNjnq1OaaI3dTCTYE5uTfcpmJ0wR+fY46D/+W9G7odvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404437; c=relaxed/simple;
	bh=6iQx6KasaLl1kq58Kcqxmere8fMu7t7yefW75a2YvpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=bIeJ7sUmEUo9mc/kMKfcOxJTVUhpAEvNRBnbfvkA05hH0wgjNIzHFHnUz0JVXtec69ZulXu463VjSX8eBxGL6TaeVbdolrw3aMJr4A5pR1QSOfLoDMhz7DRLBj7b3F0FO20A0v4npoqAnEHg6sskp0xxyIw/6Gchm778C++p2eY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=w6pMnSp0; arc=fail smtp.client-ip=52.101.52.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="w6pMnSp0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiAh8HMZZ+VEgJ3N5ENhDI51RQYc59bxzOYIiMFizUi5so3EO6LqR1ZtRKULmvNZ/dq+B4XooTpCgYuU1JUcgk4M1XOqYzovQd8G6BQnPGqOZKu7t4UCo3a2qJoP7YcuE4vgmCd6YYCOKYcjyWocuGW0E5x2vg1oWVQrYeAXQhHRljJVgXeiSaBlh+IVRDxvZKicgHZz3CfLBR3uHlOtPHO4QFehRIAs0dSLOPslmxIbBkUZxar9+eIOLXTKZenpIehDt7wF39USUjWSCWutymk7YBtO7EQoLPRm+sDZYsR3pACPcXhxA7lw4tg1pvoFg61PeAMUzNMwUlYA31LOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yakViHTuIHYx+7xYz1UncR/GL4/FdYLSzwOIUDtzh8s=;
 b=VO4LOZrq7tWsQdXRVKvmmJHWp2yYmOHicsKea38rRf/RUObEk2mtN+Y1SBg2/G5sbbXuKowl09bRbQlYjGNuCTHkjbZB4yuELFmKOUH/lQ/CCONM0s4CSqJp2H+Lv3Sa9XR4wDo+8sjsAsTjoWHLaacmQjFw072hMC37OlUI5XskCbA88aQKbDCIEWP0OwhRq4pbIF4bb47h3L9xZ1SIOqc/FCcPFCrQyGlYxVmYMw2Nx5YoSjF9Rp4Y8JX5DBYPOlQel8yy57WHiAX0PdTLlVchQhE5JeFtjb19KPmenFYf/NCvd8+sGSsgRoaU7+pzGHQjQswtqAqw2mlB8yxZSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yakViHTuIHYx+7xYz1UncR/GL4/FdYLSzwOIUDtzh8s=;
 b=w6pMnSp0AScusqzuSOg1yzK0sIbqC1IKybKvA4zVb8Isi+gY/+uIvlb7JHnITcZkrJbXDojZf80esCNjYdgq3xyshYm6w5+66HzvzXH/cHYDWx+6XPICUshgnGMkRFJ+dgYzxKjGW0ErOlILdOGueUZKkx10gzKZ5jF/SiXZcio=
Received: from CY8PR11CA0037.namprd11.prod.outlook.com (2603:10b6:930:4a::29)
 by CH8PR12MB999205.namprd12.prod.outlook.com (2603:10b6:610:35a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 10:07:10 +0000
Received: from CY7PEPF000000F7.namprd05.prod.outlook.com
 (2603:10b6:930:4a:cafe::96) by CY8PR11CA0037.outlook.office365.com
 (2603:10b6:930:4a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon,
 19 Oct 2026 10:07:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000F7.mail.protection.outlook.com (10.167.247.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 10:07:10 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 05:06:56 -0500
From: Shivank Garg <shivankg@amd.com>
Date: Mon, 19 Oct 2026 10:06:49 +0000
Subject: [PATCH RFC v2] mm: introduce copy_mc_highpages() and batch copy in
 folio_mc_copy()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20261019-batpagecopy-v2-1-d75e7d0dfaae@amd.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDc0MT3aTEkoLE9NTk/IJKXdNEoyQTU0tDg1TTFCWgjoKi1LTMCrBp0Up
 Bbs5KsbW1ADn9hXJiAAAA
X-Change-ID: 20260714-batpagecopy-5a2b45910e5d
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
	<liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
	<rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
	<mhocko@suse.com>, Borislav Petkov <bp@alien8.de>, Ankur Arora
	<ankur.a.arora@oracle.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"Thomas Gleixner" <tglx@kernel.org>, Bharata B Rao <bharata@amd.com>,
	"Hrushikesh Salunke" <hsalunke@amd.com>, Ingo Molnar <mingo@redhat.com>, "H .
 Peter Anvin" <hpa@zytor.com>, David Laight <david.laight.linux@gmail.com>,
	David Rientjes <rientjes@google.com>, Linus Torvalds
	<torvalds@linuxfoundation.org>, "Teja Vojjala" <tejavojjala@google.com>, Huan
 Nguyen <nhuhuan@google.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	Shivank Garg <shivankg@amd.com>
X-Mailer: b4 0.15-dev-47d62
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792404423; l=7839;
 i=shivankg@amd.com; s=20260518; h=from:subject:message-id;
 bh=6iQx6KasaLl1kq58Kcqxmere8fMu7t7yefW75a2YvpU=;
 b=hp1w9hClg5UwIVAd6hhcwRpdpKsCYOraTjVmCGTXb+LdpZpshlpPrXnFNvGcb4wRWiJQnbiND
 HEZPNgYplBFAD4m0ViOM2pw5BrdVq8dOudGwKL9PHDMaUUg9qycHKlr
X-Developer-Key: i=shivankg@amd.com; a=ed25519;
 pk=2l2QGTeXuGkZTtfmx0nPQU8iFZfjYmX/ymMojitevx4=
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F7:EE_|CH8PR12MB999205:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb7a0ec-432f-4d41-72d9-08df2dc8bd4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|7416014|1800799024|18002099003|3023799007|13003099007|921020|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	brzgqzCXX+hRBp6P7SnMaQzF+l+s/Yhe8A3u1IXMomZccLffNzR5l9Ge1847uGqpA/fCez2pp8+8KrFWKgaWScGlrokpc2iK8HLzB5rsayqOy+6+xOIlL7bs3XemXEy8nDz//k645ise9/Eps8r+5kFfCV/1L8YC69J9iqKz8eyxguhHQ4TcyAYgh9KVRQYgS4+TO1kTSkunpycbCieQEq4Ni1EIECYwpI4zlfuMfI9Rut7uB4Qx85KE+hLBF+qYY7oBrBX9g1jV+WeTJHZNUZLxHzoyxcI5FompdgOaiC/ha4GAINP8FPSYeMAN5TKJyqmQre5Cz0IzK+YlA8EBV7KJ0/iqfiJLF87xBtvO0Mxlo8WHqWZ8i7jNjTVEbtvePM3x5Mk8h7mmz5YpWQ54BIPzU/fSeAD4VRHdJ4qduAC+b8/NeeELO1ju8natPc28DIs3qmVza1NVMVldwyw7ARajqJokMWJtN37orHDL+Xa3+pzq5jrP715r1OM0mESralOx9fQaIEytzLODC5fR5bFje5ZeN2CUmo5SDfl8evgCR3Yquu4P6j5CqGyWTenxQPX1zJpzLUXhA0naX+Ls2SDV+za0q2NAgQxjhydPqVM/5jMDGANjTw8828NZXtC7O+gHITrOIV/NRHsKIlCSkgFQLKnQtp2+YNt3mertfY5hxyY38QbdDO8bN6w5Gc7Wlyh3/nMyHfpg4HZt7Amaog==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(7416014)(1800799024)(18002099003)(3023799007)(13003099007)(921020)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R3iFvDzjpbg/xETnEIhqsORn187OjNLx1d4BZZhmQanIIxXh8sYFORU/un3BHny3cBYT2C3gusr66tPHDTy2v5NatjMoIoRZk5xYb+kAJ1ZjpbVjJh3ZkaoIw2VrPy74NzagvRQsk8pTlzYtEcD6e6QCozPd/CZjt4QYg6kR/RhVNwojZI/CsJ2I8xBm4yHseMq7hVgi9GFuKLCf8h/wQ9NxNHKDyLsqEjClZ44wPSllCarPZYSmneOkAq7cUq1WL6yykMCbPcYkLIba3uJeK1+nlmSD8CjtoNrwVAqiP1EzoTJW+SiJH6pyVrNSTQLqMmjJlO2+isHs4jMD2Ocnc7O+hiIUahW1BVvc7IJdJxdpp4HVONzWXqwbqiJPOrXWwe3p4dLCEwXQglZ1hqwOBYxY+s5WzF4zKDSqt36RWcx1h8EVY8uZ6xEUZovibkWu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 10:07:10.1683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb7a0ec-432f-4d41-72d9-08df2dc8bd4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB999205

folio_mc_copy() copies a folio one page at a time with copy_mc_highpage(),
so a 2MB folio makes 512 separate copy_mc_to_kernel() calls. Each page
pays the startup cost of the string instruction ("REP; MOVSB" on x86
CPUs with ERMS) plus a cond_resched().

Introduce copy_mc_highpages(), the page range variant of
copy_mc_highpage(). When copy_mc_to_kernel() is available and the pages
are in the linear map, copy the whole range with a single
copy_mc_to_kernel() call, so the CPU can optimize for the larger extent.
Otherwise, fall back to copy_mc_highpage() one page at a time.

On a machine check, queue the poisoned source page for memory_failure()
and return -EHWPOISON, as copy_mc_highpage() does.

copy_mc_to_kernel() cannot reschedule, so copying a large folio with one
call can run for a long time under cooperative preemption models. Add
COPY_MC_PAGES_NON_PREEMPT_BATCH to bound how much is copied in one go:
32MB, the same bound clear_pages() gets from
PROCESS_PAGES_NON_PREEMPT_BATCH, or one page on the fallback path.

Switch folio_mc_copy() to copy_mc_highpages(): the whole folio at once
under preemptible models, COPY_MC_PAGES_NON_PREEMPT_BATCH pages at a time
otherwise.

Assisted-by: LLM
Signed-off-by: Shivank Garg <shivankg@amd.com>
---
On a Zen 6 system with CXL memory, move_pages() gets ~1.4x faster for
2MB THPs and up to ~2.8x faster for 1GB hugetlb pages (numbers below).
When demoting to CXL, kswapd uses ~31% less CPU per GB demoted.

Changes in v2:
- Drop the folio_copy() changes as there is little to gain here.
  On architectures without copy_mc_to_kernel(), copy_mc_highpages()
  falls back to the per-page copy_mc_highpage(), which ends up in
  copy_highpage(). A batched copy_highpages() could help there too,
  but I haven't tested it on those architectures, so that is left for
  a follow-up.
- Add COPY_MC_PAGES_NON_PREEMPT_BATCH to limit how much is copied
  between cond_resched() calls on non-preemptible kernels.
- Rebase onto mm-new (2887e63d2e8e).
- v1: https://lore.kernel.org/all/20260427142036.111940-2-shivankg@amd.com

Test setup: AMD EPYC Zen 6, single socket, NPS2 (nodes 0 and 1 are
DRAM, node 2 is CXL), with and without this patch.

move_pages() throughput
-----------------------
A single move_pages() call migrates 1GB of anonymous memory, as 512
2MB THPs or as four 1GB hugetlb pages. Mean ± stddev (10 runs each),
in GiB/s:

2MB THP:
  direction         base            patched         speedup
  DRAM0 -> DRAM1    19.57 ± 0.17    27.51 ± 0.78    1.41x
  DRAM1 -> DRAM0    19.44 ± 0.12    27.33 ± 0.27    1.41x
  DRAM0 -> CXL      18.66 ± 0.18    26.90 ± 0.51    1.44x
  CXL   -> DRAM0    15.38 ± 0.59    16.60 ± 0.24    1.08x

1GB hugetlb:
  direction         base            patched         speedup
  DRAM0 -> DRAM1    20.34 ± 0.13    53.88 ± 1.48    2.65x
  DRAM1 -> DRAM0    19.10 ± 2.65    53.78 ± 0.55    2.82x
  DRAM0 -> CXL      19.53 ± 0.08    44.10 ± 0.19    2.26x
  CXL   -> DRAM0    16.41 ± 0.07    20.89 ± 0.06    1.27x

kswapd demotion
---------------
Node 0 is limited to 16GB of free memory and demotion is enabled. A
single thread bound to node 0 writes 96GB of anonymous THP memory, so
~80GB has to be demoted to CXL. Median of 10 runs:

                               base        patched
  kswapd CPU time              4.25 s      3.44 s     (-19%)
  kswapd CPU per GB demoted    63.6 ms     44.1 ms    (-31%)
  demoted by direct reclaim    14.1 GB     0.46 GB
  allocstall                   7427        370

With the patch, kswapd keeps up with the writer, so the writer rarely
falls back to direct reclaim.

Other workloads
---------------
- Memory tiering (numa_balancing=2) with Redis, GAPBS PR/BC, a B-tree
  benchmark and Graph500: copying 2MB folios during demotion is
  1.18-1.49x faster.
- A userspace daemon moving 1GB hugetlb pages between DRAM and CXL
  with move_pages() while GUPS runs on them: demotion is 1.43x faster
  and promotion 1.28x faster.
---
 include/linux/highmem.h | 59 +++++++++++++++++++++++++++++++++++++++++++++++++
 mm/util.c               | 18 +++++++++++----
 2 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index d7aac9de1c8a..e43459dc58b0 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -484,6 +484,65 @@ static inline int copy_mc_highpage(struct page *to, struct page *from)
 }
 #endif
 
+#if defined(copy_mc_to_kernel) && !defined(CONFIG_HIGHMEM) && \
+	!defined(__HAVE_ARCH_COPY_HIGHPAGE)
+/*
+ * copy_mc_highpages() copies the whole range with a single
+ * copy_mc_to_kernel() call, which cannot reschedule. That is fine under
+ * preemptible models, but under cooperatively scheduled models callers
+ * should copy at most COPY_MC_PAGES_NON_PREEMPT_BATCH pages at a time.
+ *
+ * With a value of 32MB and assuming a memory bandwidth of ~10GBps, this
+ * should result in a worst case preemption latency of around 3ms when
+ * copying pages.
+ */
+#define COPY_MC_PAGES_NON_PREEMPT_BATCH		(SZ_32M >> PAGE_SHIFT)
+
+/**
+ * copy_mc_highpages() - copy a page range with machine check handling
+ * @to: first destination page
+ * @from: first source page
+ * @nr_pages: number of pages
+ *
+ * Range variant of copy_mc_highpage(). On a machine check, the poisoned
+ * source page is queued for memory_failure().
+ *
+ * Does not call cond_resched(). Under cooperatively scheduled models the
+ * caller is expected to limit @nr_pages to COPY_MC_PAGES_NON_PREEMPT_BATCH.
+ *
+ * Return: 0 on success, -EHWPOISON if a machine check was handled.
+ */
+static inline int copy_mc_highpages(struct page *to, struct page *from,
+		unsigned long nr_pages)
+{
+	unsigned long len = nr_pages << PAGE_SHIFT;
+	unsigned long ret, i;
+
+	ret = copy_mc_to_kernel(page_address(to), page_address(from), len);
+	if (!ret) {
+		for (i = 0; i < nr_pages; i++)
+			kmsan_copy_page_meta(to + i, from + i);
+		return 0;
+	}
+	memory_failure_queue(page_to_pfn(from) + ((len - ret) >> PAGE_SHIFT), 0);
+	return -EHWPOISON;
+}
+#else
+
+#define COPY_MC_PAGES_NON_PREEMPT_BATCH		1
+
+static inline int copy_mc_highpages(struct page *to, struct page *from,
+		unsigned long nr_pages)
+{
+	unsigned long i;
+
+	for (i = 0; i < nr_pages; i++)
+		if (copy_mc_highpage(to + i, from + i))
+			return -EHWPOISON;
+	return 0;
+}
+#endif
+
 static inline void memcpy_page(struct page *dst_page, size_t dst_off,
 			       struct page *src_page, size_t src_off,
 			       size_t len)
diff --git a/mm/util.c b/mm/util.c
index 7f374bb8bf36..5015cfdfeaa5 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -763,13 +763,23 @@ EXPORT_SYMBOL(folio_copy);
 
 int folio_mc_copy(struct folio *dst, struct folio *src)
 {
-	long nr = folio_nr_pages(src);
-	long i = 0;
+	const unsigned long nr_pages = folio_nr_pages(src);
+	/*
+	 * Copy the largest extent possible to allow for architecture specific
+	 * extent based optimizations. copy_mc_highpages() does not call
+	 * cond_resched(), so limit the unit size when running under
+	 * non-preemptible scheduling models.
+	 */
+	const unsigned long unit = preempt_model_preemptible() ?
+				   nr_pages : COPY_MC_PAGES_NON_PREEMPT_BATCH;
+	unsigned long i = 0, count;
 
 	for (;;) {
-		if (copy_mc_highpage(folio_page(dst, i), folio_page(src, i)))
+		count = min(unit, nr_pages - i);
+		if (copy_mc_highpages(folio_page(dst, i), folio_page(src, i), count))
 			return -EHWPOISON;
-		if (++i == nr)
+		i += count;
+		if (i == nr_pages)
 			break;
 		cond_resched();
 	}

---
base-commit: 2887e63d2e8e0cf55402612d8996ce955a2c3e55
change-id: 20260714-batpagecopy-5a2b45910e5d

Best regards,
-- 
Shivank Garg <shivankg@amd.com>

