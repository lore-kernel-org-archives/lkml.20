Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34F53DAAB8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485258; cv=none; b=bNjcDuFTzPt3x8NdRwPB4lP9jR10dS+1My1ILawc+Fyudf6sMvim5FiUkOhNIrvbDKl+IW4EyUed5JtgPlqk9+mgC96wbqurUKPsnGJlI+FjlRLEOXUzUahahJrmDsYrbzv/aX4BWasXwrIQJLkBKsGDvKbGrQFjFuGS/hE8M2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485258; c=relaxed/simple;
	bh=ycfiJ0wN/gPOpzPHvEhz2H9OE1m9HLT0yriw3120bzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSqpe1ardeau3muykLx/h67keMF4JGb6adC0y8JU9S2wSI/8c2VTVSGG2SO7XgyjylF1Q8xQJyb8aVc5KuQ0L9+4EPRbhI+B4Woi6Ej/miUI09xuXxrohP93gsLCv1CGbDzUDxqT8MUILxMs75ae9agPlLheBCiQXq5489R4NEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QVMt8CU8; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QVMt8CU8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=oS
	GOZuIlLi/kWLWERFDika52b/inT5K3imQnR+07eJM=; b=QVMt8CU8GnRT6gyCY+
	QsEg19St/c65BK6C3qXQfV+DpxrA/Y9FUZL2zqUlrm3nZeUlfzSzCV9xOrvpxp4j
	5lP08J7yf5j8kRF1u1GIL/b1Izvh6zRmZwBk+UZXcc9GbVUHLt1nFZsRNZXeFT8D
	ywt8VrlQ5l03aJQn3TyklBOlw=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAn2xWOYKlqc0VUAw--.40469S4;
	Tue, 15 Sep 2026 23:13:20 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/14] mm/ksm: rename advisor_ctx to ksm_advisor_ctx
Date: Tue, 15 Sep 2026 23:12:16 +0800
Message-ID: <20260915151236.5200-3-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915151236.5200-1-xialonglong2025@163.com>
References: <20260915151236.5200-1-xialonglong2025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAn2xWOYKlqc0VUAw--.40469S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFy5Kw15JFykXF13tw1DKFg_yoW5Zr48pr
	W5ursFkrW8ZFWYqa4UZrn5Xw17KrZ8Gw40gF1jkw45Crsa9ryUtrWxK3W0yF1UAa4vvry8
	XryFgFyUtF4UtFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzUDJUUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC+BBBOmqpYJBV3QAA3o

From: Longlong Xia <xialonglong@kylinos.cn>

Rename the advisor context to match the ksm_advisor_ prefix used by
its tunables.

No functional change intended.

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

---
 mm/ksm.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index f637f3baea69..1e4d77852fc8 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -334,7 +334,7 @@ struct advisor_ctx {
 	unsigned long change;
 	unsigned long long cpu_time;
 };
-static struct advisor_ctx advisor_ctx;
+static struct advisor_ctx ksm_advisor_ctx;
 
 /* Define different advisor's */
 enum ksm_advisor_type {
@@ -356,7 +356,7 @@ static void set_advisor_defaults(void)
 	if (ksm_advisor == KSM_ADVISOR_NONE) {
 		ksm_thread_pages_to_scan = DEFAULT_PAGES_TO_SCAN;
 	} else if (ksm_advisor == KSM_ADVISOR_SCAN_TIME) {
-		advisor_ctx = (const struct advisor_ctx){ 0 };
+		ksm_advisor_ctx = (const struct advisor_ctx){ 0 };
 		ksm_thread_pages_to_scan = ksm_advisor_min_pages_to_scan;
 	}
 }
@@ -365,7 +365,7 @@ static void set_advisor_defaults(void)
 static inline void advisor_start_scan(void)
 {
 	if (ksm_advisor == KSM_ADVISOR_SCAN_TIME)
-		advisor_ctx.start_scan = ktime_get();
+		ksm_advisor_ctx.start_scan = ktime_get();
 }
 
 /*
@@ -419,18 +419,18 @@ static void scan_time_advisor(void)
 	unsigned long scan_time;
 
 	/* Convert scan time to seconds */
-	scan_time = div_s64(ktime_ms_delta(ktime_get(), advisor_ctx.start_scan),
+	scan_time = div_s64(ktime_ms_delta(ktime_get(), ksm_advisor_ctx.start_scan),
 			    MSEC_PER_SEC);
 	scan_time = scan_time ? scan_time : 1;
 
 	/* Calculate CPU consumption of ksmd background thread */
 	cpu_time = task_sched_runtime(current);
-	cpu_time_diff = cpu_time - advisor_ctx.cpu_time;
+	cpu_time_diff = cpu_time - ksm_advisor_ctx.cpu_time;
 	cpu_time_diff_ms = cpu_time_diff / 1000 / 1000;
 
 	cpu_percent = (cpu_time_diff_ms * 100) / (scan_time * 1000);
 	cpu_percent = cpu_percent ? cpu_percent : 1;
-	last_scan_time = prev_scan_time(&advisor_ctx, scan_time);
+	last_scan_time = prev_scan_time(&ksm_advisor_ctx, scan_time);
 
 	/* Calculate scan time as percentage of target scan time */
 	factor = ksm_advisor_target_scan_time * 100 / scan_time;
@@ -442,7 +442,7 @@ static void scan_time_advisor(void)
 	 */
 	change = scan_time * 100 / last_scan_time;
 	change = change ? change : 1;
-	change = ewma(advisor_ctx.change, change);
+	change = ewma(ksm_advisor_ctx.change, change);
 
 	/* Calculate new scan rate based on target scan rate. */
 	pages = ksm_thread_pages_to_scan * 100 / factor;
@@ -458,9 +458,9 @@ static void scan_time_advisor(void)
 	pages = min(pages, ksm_advisor_max_pages_to_scan);
 
 	/* Update advisor context */
-	advisor_ctx.change = change;
-	advisor_ctx.scan_time = scan_time;
-	advisor_ctx.cpu_time = cpu_time;
+	ksm_advisor_ctx.change = change;
+	ksm_advisor_ctx.scan_time = scan_time;
+	ksm_advisor_ctx.cpu_time = cpu_time;
 
 	ksm_thread_pages_to_scan = pages;
 	trace_ksm_advisor(scan_time, pages, cpu_percent);
-- 
2.43.0

