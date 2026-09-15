Received: from mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C883DD847
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440230; cv=none; b=GoYXmtlThpOVfIlnqRiCLVERQFCAWosc/AWNqxj2DjIA3YdY3Hr+XLGQtvWX1nclwPS4m3JvCjXYOTMVxQC2huQuJKcg8zT4xDIV7fv1RZ9f1UJ9SXRnScUe7xMSIj8MDo9FuLM2CUjgJWCxKVE0qQWHbGHh2EGiTFpztuttkBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440230; c=relaxed/simple;
	bh=m2TNnslMOJm74BH1oK0RGdEaDDffaGOdJpOrKHOeGS0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hgryzua1RvfIaRNNPMNbAZxDmdBgS3SHdSjUDHaf6P3c5rnLrIB5tvHxvz+1Uvui0MMBnTdOdFJdmnKMLEefNtAj3TTkpFUqqADNIo2XXvcyRt0AwysDllXowEy5pRRuQc7ht3cnzizH4RjJxRsRl4QXUjaztrP1CoL5HafcjH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FjhZH6q5; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FjhZH6q5"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m2TNnslMOJm74BH1oK0RGdEaDDffaGOdJpOrKHOeGS0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789440224; v=1; x=1790045024;
 b=FjhZH6q5/++5RhX+BFEpDgQkfRNl6jBvLp3ejdv+DjLlWeS6CKbSc9QiWSrLyT2Gy+GyHN3j
 t+RxqeeXcAXvmttBV/pGbNY8YgiY4tM9fJnlCNq2cXfqbHBKQEUCMuHg1WOkVddHp+YPVIcMwgg
 ACJykYRAx9PZlDvj4yhjDDfU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ff7b2e19b41e7456;
	Tue, 15 Sep 2026 02:43:34 +0000
X-Mizu-Trace-ID: ff7b2e19b41e7456
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Subject: [PATCH v2 0/3] mm/vmalloc: minor cleanups
Date: Tue, 15 Sep 2026 10:43:29 +0800
Message-Id: <20260915-vmalloc_study-v2-0-cc4dfe635e22@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANGwqGoC/3XMQQ6DIBCF4auYWZcGsaJ21Xs0prEw1EksNKBEY
 7h7qfsu/5e8b4eAnjDAtdjBY6RAzuYQpwLUONgXMtK5QXAheVdeWHwP0+TUI8yL3tizMtiopmq
 NGCB/Ph4NrYd373OPFGbnt4OP5W/9J8WScVYLaWRb113D5W0iu6xnjRH6lNIXT6evnaoAAAA=
X-Change-ID: 20260914-vmalloc_study-b3fe7c738f2a
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3

Small cleanup series for mm/vmalloc.c, no functional changes:

- Group xa_init() with the other vmap_block_queue field initializations
  in vmalloc_init(), instead of after the unrelated vfree_deferred setup.

- Extract vmap_insert_free_area() helper to deduplicate the allocate-
  and-insert pattern that appeared both inside the loop body and after
  the loop in vmap_init_free_space().

- Extract show_busy_info() from vmalloc_info_show(), mirroring the
  existing show_purge_info() pattern, so the top-level show function
  only orchestrates the two data sources.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
Changes in v2:
- Patch2: Keep space after (unsigned long) cast per Uladzislau's review.
- Patch3: Drop the NULL initialization of counters in show_busy_info. 
- Link to v1: https://lore.kernel.org/r/20260914-vmalloc_study-v1-0-526f68559706@linux.dev

---
Ye Liu (3):
      mm/vmalloc: group xa_init with vbq field initializations
      mm/vmalloc: extract vmap_insert_free_area helper
      mm/vmalloc: extract show_busy_info from vmalloc_info_show

 mm/vmalloc.c | 56 +++++++++++++++++++++++++++++---------------------------
 1 file changed, 29 insertions(+), 27 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-vmalloc_study-b3fe7c738f2a

Best regards,
-- 
Ye Liu <ye.liu@linux.dev>

