Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792994980;
	b=uLRHPr3Mde4iFjHsBopZ7q9zs4HSzZ4pbO4JUczDeQMOeaqgg+PsNfAUpSphkODlidFU
	 pKP/eD+XKYWX60CuK0VADNeBkADAcvfuSor7+xisn+dugp7HCufz6ayKQ50FBmk5BIBAV
	 i45o81V5dDh3fBvSVlZVjeHushMZqTl0glh9q/GTkiCnJPL5zjT4rW6XJi8yXiisasZ63
	 J13LO5Wf4ZdhHC+UXsg1fIkwLKFQhj59ua3GECAlTFeg3prm2g7tRUg2NR12qV8G2ihp+
	 FG9iUl79JTYmW3SBGwKn6CfnH3X237R/P4NR2JEa2RsUMKjECvA3xRHsZT6eaAmR8aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994980;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=4YF1uuN8vSqlU2rOKHVGJs/CBUWobe7SwbzRynZeYYE=;
	b=2dmFvwFhM+x6+8jPoAptCIcgZH8lco7BSLxR5smx+IWVfSbdbRxYV/l9iM7xPVSJ34Ku
	 zedWdZtH7TylB8xdgHFvHyVbFQsxbwoaj4iDIPD9SoWwPrcgwdPxm+T/D7Bw2kdzgiLoX
	 rjrOxmOlNxYqOYKWMUgMiRgCWCQ3Tb0WOLTUqS4LJO1uLucQFH7IqGYaJMbLTKO7jkqSO
	 wHMiD+kKJu43rKKZHCXvdI9ChPc8R+apKtbmWdWO/OWdqNyr7ZCzeKXY200U2qUx9wHJy
	 rYMabGQlDLOCTTMCwvzYooJ8TDJp8CtQq4cuauVHZnyUxQSXE3MciXYD71CP38WaDUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TkiIF6yu;
	arc=none smtp.remote-ip=91.218.175.57
Received: from mta0.migadu.com (out-57.mta0.migadu.com [91.218.175.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EA8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33EA8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TkiIF6yu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+Gh148DE2VMFS8ATJDVgo5IPfM8B6qMQjDKrc8U6oj4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792994977; v=1; x=1793599777;
 b=TkiIF6yuVJtr6nAf2/USF/K15C9zdPNVY4ELLntSEfEjQ/t/ZS0GaN0fB/nfjQDDaTSJmQS4
 VPLOK45yx5wMU7TfeCBV7ibNU3FrEBxcWLJfB2HOoQoL8Sz6mZF2+o9AdmEMadIGE9N5sYtOYqz
 URk7lT8s5lqCy9mPZI+S3uUQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 68994bf62ca272a5;
	Mon, 26 Oct 2026 06:09:37 +0000
X-Mizu-Trace-ID: 68994bf62ca272a5
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Mon, 26 Oct 2026 14:09:24 +0800
Subject: [PATCH 2/2] mm/vmalloc: warn on NULL page in
 remap_vmalloc_range_partial
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
Message-Id: <20261026-vmalloc_remap-v1-2-b7a907814e90@linux.dev>
References: <20261026-vmalloc_remap-v1-0-b7a907814e90@linux.dev>
In-Reply-To: <20261026-vmalloc_remap-v1-0-b7a907814e90@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.17-dev-39d60

From: Ye Liu <liuye@kylinos.cn>

remap_vmalloc_range_partial() oopses if vmalloc_to_page() returns
NULL, which never happens today because VM_USERMAP areas keep every
page mapped. Add a WARN_ON(!page) to flag a break before the oops.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/vmalloc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index a888eca016a8..59ba203a4eff 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4906,6 +4906,7 @@ int remap_vmalloc_range_partial(struct vm_area_struct *vma, unsigned long uaddr,
 		struct page *page = vmalloc_to_page(kaddr);
 		int ret;
 
+		WARN_ON(!page);
 		ret = vm_insert_page(vma, uaddr, page);
 		if (ret)
 			return ret;

-- 
2.43.0

