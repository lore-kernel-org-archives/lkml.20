Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792994972;
	b=ycYn5V2tAOr4yUQ+gsFUfUySpB4hh4qGJ1ApeRNS3dpbm9H9gx1VAKLIhVejuPWNExf2
	 o+1/6rVLG71wwMztGfUDMyfXvfzE/vX8j3PzDT+C3VtU/857Baj2z/4mjY4E0uqU4mEV/
	 jKL6WMjdLfj3A7SM/GXxNNLRePtCb4Yi0D88QVBI/Fp24SjwBhYHGwajjCBwVyf8QVbiX
	 pvEl4Y7dcxv86kNqgewzngQ2DVJ9vlm7NSDCtjlj1/ayyciZtV5/vuIfkRyG3ZTH8eYnV
	 lr0XooXZqn5V78h08jTDMOYtIxid7PLxETLNPVNmFkott/s4WdN1Wm4xgKMWAU9/4zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994972;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=9/nGkbV+fUPPeLqyGNZSPjPsYCz8iycYQbfenjHMLyo=;
	b=eipBgGO9c0TJIq2krNtzkmFYGYd56Ihvys3C9smfYumuIBuneHy7nKmiYLRExJjpu/NQ
	 aPVb/ahDjrLb+j5d9kKVOXMr1wOuPSFUues9l+iqun52eR7gW+LEgR2m30S0p3ynPIchu
	 an1VH745xHnuMNtXBbyZCSkO9uAIIWfydnoHOVYhC3DNnjJy62FfvXbKoGG+42Vl6aqHc
	 zGw0wyCw+NVHu5fI/tTLZ8NMd4o9dzRgzQE+8dkWQMxDq2MxfFUVGOHJitemGI6mOeoAe
	 kdUL+9HASS6Koxp4mC9xwLZcWHuFvv8nk1tRD+trmYwo8xXzmznkgZVSwE6NzZ2iUDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P7qrESev;
	arc=none smtp.remote-ip=95.215.58.195
Received: from mta1.migadu.com (out-195.mta1.migadu.com [95.215.58.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517EF606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 517EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P7qrESev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2v1X/4ZNw/k4n0QQySBSm3vuF3Ioo/pID4q6JpER+64=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792994969; v=1; x=1793599769;
 b=P7qrESevDfEBLBVoUte5Tp8c4MLoxJTAP2gUDuLPLCk4+eTBxSt7B/Nk/GtbAhDIjmUp0Prl
 OHv8KjaMB81GJ5BPGofTkt5we/sMwC7oYnbf/lHbZCId/eGBflwi/OBZRUPhT12KvmSvLRaIzk9
 zwpHzemitrIez0ZxjLL0uH0k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f1f0116670f74061;
	Mon, 26 Oct 2026 06:09:29 +0000
X-Mizu-Trace-ID: f1f0116670f74061
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Subject: [PATCH 0/2] mm/vmalloc: harden remap_vmalloc_range_partial against
 NULL pages
Date: Mon, 26 Oct 2026 14:09:22 +0800
Message-Id: <20261026-vmalloc_remap-v1-0-b7a907814e90@linux.dev>
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
X-B4-Tracking: v=1; b=H4sIAJLu3moC/yXMywqAIBCF4VeJWSeoREivEhE2TTXRDS0JonfPa
 nEW3+L8F3hyTB6K5AJHgT2vS4RKE8DBLj0JbqNBS52rOBFmO00r1o5muwmpNHaZMqitgfjZHHV
 8fr2y+u2PZiTc3wjc9wPSLN5scQAAAA==
X-Change-ID: 20261026-vmalloc_remap-012cf418c2a8
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.17-dev-39d60

remap_vmalloc_range_partial() passes vmalloc_to_page()'s result to
vm_insert_page() unchecked, oopsing via page_folio() if the page is
NULL. The NULL case never happens today because VM_USERMAP areas keep
every page mapped, but that assumption is nowhere checked.

Patch 1 drops VM_DMA_COHERENT from the allow-list -- a dead entry (no
caller maps a DMA-coherent area through this path) whose presence also
opens a NULL-deref path, since VM_DMA_COHERENT is not in vrealloc's
shrink skip-list.

Patch 2 adds a WARN_ON(!page) to flag any future break at the
vmalloc_to_page() call site before the oops.

Patch 1 is a behavior change (no in-tree caller affected); Patch 2 is
dead code. The two are independent.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
Ye Liu (2):
      mm/vmalloc: drop VM_DMA_COHERENT from remap_vmalloc_range_partial
      mm/vmalloc: warn on NULL page in remap_vmalloc_range_partial

 mm/vmalloc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261026-vmalloc_remap-012cf418c2a8

Best regards,
--  
Ye Liu <ye.liu@linux.dev>

