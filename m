Received: from mta0.migadu.com (out-250.mta0.migadu.com [91.218.175.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9711123B61B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789356854; cv=none; b=G+XOz45KMxZMU28/JRnjG/DTnJTPLIbYmYJ6U/jfIK1t4Ra5s3AUDMV8Bo7PrP3LuQ37GtsZs/0ON/JSemjUNoudFaOuJjvsK7o6mETf6NLHNOfFmRgDnzjOhO4eBEcfaG8fjlbvBCEX65Wpt8ZG8GecmjucQbgmUnKI87ye4eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789356854; c=relaxed/simple;
	bh=1JX6OxGw6Fen5q/U+UOj7/291svvQ/6DqcLx9AxyrxE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=naG5CsstNctj7ZuKYgj/4pp4l48F3JmHhA1M0NshQdU37lEt+TUe4o0UjteRGXpvKrf5Zs8KIirh+NntqRte4POONnxkFSwxf/NMaWCmP+bIwXfVrbHNin+Jv5fWegZWht6Yazfm2FCbJDUvgCzvMlXpVhFwW6sjXz723IsGf6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pk0/Pa+r; arc=none smtp.client-ip=91.218.175.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pk0/Pa+r"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1JX6OxGw6Fen5q/U+UOj7/291svvQ/6DqcLx9AxyrxE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789356850; v=1; x=1789961650;
 b=pk0/Pa+r9mOLiQQBK7V0hbCUvySlkwAqzNzUrObbc7GDWkGBCzm800KqmKT3ooULSdjR4ee2
 Mpcg/Fn5r92bk0Lk+7jLdJGWuhFPiGvIBd/z60aKIAzHwhYrOinUnMTTCIP3kBOkVYPLBSa5KQl
 QPPXaz4t44ohfzJiT8HCX1NI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 135d90a541b7fc0b;
	Mon, 14 Sep 2026 03:34:10 +0000
X-Mizu-Trace-ID: 135d90a541b7fc0b
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Subject: [PATCH 0/3] mm/vmalloc: minor cleanups
Date: Mon, 14 Sep 2026 11:33:59 +0800
Message-Id: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACdrp2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MT3bLcxJyc/OT44pLSlErdJOO0VPNkc2OLNKNEJaCegqLUtMwKsHn
 RsbW1ABo2iYlfAAAA
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
Ye Liu (3):
      mm/vmalloc: group xa_init with vbq field initializations
      mm/vmalloc: extract vmap_insert_free_area helper
      mm/vmalloc: extract show_busy_info from vmalloc_info_show

 mm/vmalloc.c | 58 ++++++++++++++++++++++++++++++----------------------------
 1 file changed, 30 insertions(+), 28 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-vmalloc_study-b3fe7c738f2a

Best regards,
-- 
Ye Liu <ye.liu@linux.dev>

