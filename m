Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363981;
	b=Ckoip+GYlsOwGVnGtj3e/7ZsKCzoBi6Tw7B07U+i/4lIyIkr+l2NptM0UhJKW5c8eCBj
	 O7v11F+vvAIZDC7TCmu2VGZNM4dQ3CMevdIcvxoY3DNHh2LDfSVDmHx+bbJPcRglVy4so
	 /gYez+LaIDlT0y28OTuKpnc0cYGbQxHFEq+5M+rXnhaShMx7Kw6fKoqunvX9Vq6SKEZ/z
	 Jfuks9hm9Ad4W3zk38AzTr4OsajTAWxyu/RHdrpQC1HmMLIXaWzhim8brJDXUcImg9sTU
	 iWrGltdk+aW69Zmmc1OoGScQSnuVWGqjj+1ndQxtKwlUnaXkhkAg/XoU09SPK37Jm0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IJhsxR/EvrWZJxL/r/ZQEHhwVLOVGsYzQMsdW4G1Luk=;
	b=EO2QYj5g5hipHoBdXGgguDDsmDjR2spntVMj+dTSrfLqh2pZ1nZdMPyCygvImLQZDSQl
	 vgTy0zfJ6WPHa/I8eIz9PwqCj4iLXeVqOaxmZc9qM7kH7ZxR/nHKwsnDQRT39lkFOM4U0
	 zVnpmwPGnYxYPPq8mFH/iy/DpbfSMfLhGk/ZpnIioCfyKBbDrydKIEZd995ODon3IxFaf
	 WovXNfdxuOmJlk7YyMgq0Hnk0vSkaiHtU/9535lwV1vBJHaSXEbuqCgYHapKJaLmVRps8
	 9uUwc5eEr+rfQfiVFd4QZ+K7/mPpHiCfvoBd0GL3ClSel11YP38XOKoPnGtO1DYgusg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DU95D8oe;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26239606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26239606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DU95D8oe
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdd4dafdce9so1105535a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794363979; x=1794968779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJhsxR/EvrWZJxL/r/ZQEHhwVLOVGsYzQMsdW4G1Luk=;
        b=DU95D8oeVGyJ7lGm1+klKR5Z6Fk/s7oU4yM7eiBkpTWsH1IxOX1GVxxgHbdKZlUrUs
         OK/irF6YkwDerURylq/X5tipLKhdMTKb9A0rfqQYuB1bsJzkYHMczJBFWuXyDwVnrhCr
         ls1QiHmNodL1l0XfMt6oscEkou/Yk+29qGiLsoGzeWdXwfD3lXhOSFm3kENJ1m/7page
         4Qw0dAFY0rAgncIo46JduGecIsZ8HLMxYD2QlFh4fxFQj4upwWUyhMgt0ARkMvyTuBdX
         NIuwub7SbYcZiS6J8r4wb8getSQbSt4yMSPrBC49uqhFe9n1E+en8lyVpcXBOANajF7c
         qRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794363979; x=1794968779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJhsxR/EvrWZJxL/r/ZQEHhwVLOVGsYzQMsdW4G1Luk=;
        b=RVqkjmrdg6vB5XQsZJ8QiJKaCLhTjPO3Jj//g8sU4edXzCe3Om8X3njyzLi4+9Enp2
         5M+OJ5RUJ1GDuiLQwNzYJ2xX5wPcUcgqWH+nwfkq4lVoj0JzlUzXkgHZ0fZgxQbjbwQb
         FoXlmD2FtO/RhSrY2At+EAeRwTDTxUKHxLtH0IYcED/YSonB8ebc2QpUNzrXt510fE49
         ZHzDgXQfJD8HmH1JgVGAEGVf3D2YEgEH6/VQawqLPyuKdW6z0GWsNkPjswCrEH10Q74F
         vv48HJVEhfP7EDSrYytrVUq+PMtH8LVSrL1QNjaYk/1OP0+8OzASlYkxqsIo1UWZck4j
         eQhg==
X-Forwarded-Encrypted: i=1; AL+hErF7y/coGvpEwl/h5IQmGxLQUuvXYdP8jZHSzP54/eyg2zDX8nKUF5/FWQTnVy6fler2MGeM+QZAYP2bb9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yA3tjinbRWlsumrhS/z6yZgBdg55mjxmPooMhowPt9GKtwp21
	QZlF4F6tZGIg7OmXaodQf3+4DEhbj6S85ft/79GTOB6JW8uUUlL95GqC
X-Gm-Gg: AYBFou3yIuIVHYr7ZXtnf8UgEuKLSTtNa06PnjPBzgEL1WBrFAVviFAcFSqRwBcnDgi
	p4iq8LZW/kN54P1yL0yaqXYDJLXu2Rpspljc6t91f1e20rdm0YzaRnKfPP7S8EJzdQ5z4wihjCS
	/wNTzAMdNIip5sWEKlY5W0OIeM6pc31BxWxU8gjzR8U+z8bOGErHDXcMBGDK9wb6E3ODoWe8YqW
	2ASKppvLNwzr0tj/kzPuupXJXBmupADvWsgoeYJ2uqixTMNnZpCHg0Asj6JS6Km7gDFtRhgZudl
	XTarW3OVwr459yqGzmy2tlwjt+PsBJ5fao5CWmib/b9/yn/RPrz+86es/Y84osl4EH/LMNsmTdQ
	j5uAUdBRgXu2MuR3rFylLMqqGw6NlVwi71DmFYkOg/erhByHVa2IcR8ml59Q5ZB84eebZ2K11gM
	x1o9QOzwOww8icVxxpN+XuHIddzB4ThNhovFGE5Od4d9IZOmcgyw/TQoSAtPdS3kL/NZ8AMFbrC
	/ShMd6SZo+HWZ8PhePxaGsPjAmSgJYhxeud85qe+Ml8bd9VEvP5vMpefs7rkCqVWA6tkTvvK/BI
	zB5YaQN8LpfZMKbclGuHY2TpUFZzVIm+C4GZmruSbUHMNry55Rz7IqzmPi87uKCTHAhoSByCNwT
	MFlf7l+RJENDaUraLC7Go0omsG20/AHaphRzVWDMcxGSkePH+DfeTAGzYXQuEPS+A8OBksPesSn
	/UXw==
X-Received: by 2002:a17:90b:35cf:b0:3b0:96ce:104f with SMTP id 98e67ed59e1d1-3b182dea718mr974216a91.5.1794363979444;
        Tue, 10 Nov 2026 18:26:19 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db56c7esm2040066a91.8.2026.11.10.18.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:26:18 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH v2] uprobes: Use flexible array for xol_area bitmap
Date: Tue, 10 Nov 2026 18:26:05 -0800
Message-ID: <20261111022605.66010-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The XOL slot bitmap has the same lifetime as struct xol_area, but it
is currently allocated separately.  That adds another allocation
failure path and a matching cleanup branch without buying any extra
flexibility.

Store the bitmap as a flexible array member and allocate it together
with the xol_area using kzalloc_flex().  The bitmap remains
zero-initialized, while the allocation and error handling become
simpler.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 v2: add Acked-by. remove Assisted-by
 kernel/events/uprobes.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 853fc952331c..876c3cfe8031 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -108,7 +108,6 @@ static LIST_HEAD(delayed_uprobe_list);
  */
 struct xol_area {
 	wait_queue_head_t		wq;		/* if all slots are busy */
-	unsigned long			*bitmap;	/* 0 = free slot */
 
 	struct page			*page;
 	/*
@@ -117,6 +116,7 @@ struct xol_area {
 	 * the vma go away, and we must handle that reasonably gracefully.
 	 */
 	unsigned long			vaddr;		/* Page(s) of instruction slots */
+	unsigned long			bitmap[];	/* 0 = free slot */
 };
 
 static void uprobe_warn(struct task_struct *t, const char *msg)
@@ -1760,18 +1760,13 @@ static struct xol_area *__create_xol_area(unsigned long vaddr)
 	struct xol_area *area;
 	void *insns;
 
-	area = kzalloc_obj(*area);
+	area = kzalloc_flex(*area, bitmap, BITS_TO_LONGS(UINSNS_PER_PAGE));
 	if (unlikely(!area))
 		goto out;
 
-	area->bitmap = kcalloc(BITS_TO_LONGS(UINSNS_PER_PAGE), sizeof(long),
-			       GFP_KERNEL);
-	if (!area->bitmap)
-		goto free_area;
-
 	area->page = alloc_page(GFP_HIGHUSER | __GFP_ZERO);
 	if (!area->page)
-		goto free_bitmap;
+		goto free_area;
 
 	area->vaddr = vaddr;
 	init_waitqueue_head(&area->wq);
@@ -1784,8 +1779,6 @@ static struct xol_area *__create_xol_area(unsigned long vaddr)
 		return area;
 
 	__free_page(area->page);
- free_bitmap:
-	kfree(area->bitmap);
  free_area:
 	kfree(area);
  out:
@@ -1826,7 +1819,6 @@ void uprobe_clear_state(struct mm_struct *mm)
 		return;
 
 	put_page(area->page);
-	kfree(area->bitmap);
 	kfree(area);
 }
 
-- 
2.56.0

