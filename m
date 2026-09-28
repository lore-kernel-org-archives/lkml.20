Received: from mta1.migadu.com (out-230.mta1.migadu.com [95.215.58.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA4540A926
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583367; cv=none; b=ORsJVgaCZPAAxy/Eyf7HvILkiXZJK5a8mZbuQZAhRx6FP0s0U6pV/UsNoxGhxFDcfpbmBeYy9BnhJlVbgaYn6ZCgEFI5y0cL/5X/mxiG/dUSlQqL7RgWsipkj5N+hvJICjSg9sRtF/mJnKUkzvC9xRePgVaDYmZwKsFgep1nAIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583367; c=relaxed/simple;
	bh=4nfGVGrts9wIIS/qPwNM+5g6z35RooC5Zn4qvOag/3E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qu1n/wE/Tf7j+4SttjbN+04HSZ+ayZpQuCslIg7H2YhdMLaCF7Ck1hc6wb+ckATLRuChldV2G/Db9gXFxorddldAtTBtaX55hsXFFBxwN+Rpvy7c8/zjHzJ7kxuX+taTzMCEY9k/nC+YZw+ihiquUdUNgF3jxovobd5L73JbyvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T37fRs8f; arc=none smtp.client-ip=95.215.58.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T37fRs8f"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4nfGVGrts9wIIS/qPwNM+5g6z35RooC5Zn4qvOag/3E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790583363; v=1; x=1791188163;
 b=T37fRs8fq5/mX5gQRy7x6R6/ukmUf93gbnnc8xX4WuTmamR7NTFykLhfLqExMYKJlhYgYXHf
 7fpqpd6r6co0iXOP/S3X7dct847lSuq29LqVNxD1LZKR7qhdnuoDF2xwRdmBx2NUZQArmNEDLge
 546e3wfINp2bvP4Rk0MHHMPY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e3fae377f424b059;
	Mon, 28 Sep 2026 08:16:03 +0000
X-Mizu-Trace-ID: e3fae377f424b059
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Subject: [PATCH v4 0/2] mm/vmalloc: fix vmalloc_dump_obj VA lookup
Date: Mon, 28 Sep 2026 16:15:53 +0800
Message-Id: <20260928-vmalloc_dump_obj-v4-0-6f288a431edc@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADkiumoC/33OywrCMBAF0F+RrI3kZR+u/A+RkmSmNlJbSTQop
 f9uIghFxOWFuefORAJ6h4HsVhPxGF1w45CCWq+I7fRwQuogZSKYKFjNCxovuu9H28D9cm1Gc6Z
 QsZpVSpWyqEmqXT227vEmD8eUjQ5IjdeD7TL06XvUkM87F26jf74fiDyX/mxFThkttVZMgBAK2
 n3vhvtjAxhJ3opiAQj+AxAZkK1FIxG4rb4BuQTUD0AmYGsAUYKWpZFLYJ7nF/ZNjz1RAQAA
X-Change-ID: 20260916-vmalloc_dump_obj-d80908447369
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3

vmalloc_dump_obj() has two bugs that cause it to miss vmalloc
allocations.

  1. PAGE_ALIGN() rounds up, pushing last-page addresses to va_end
     and outside the VA lookup range.

  2. The function searches only one vmap node, but allocations
     larger than 64 KiB may span multiple vmap zones whose VA
     is stored in a different node's rb-tree.

Patch 1 fixes the alignment, patch 2 fixes the cross-zone search.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
Changes in v4:
- Patch2: Simplify find_vmap_area() to return va directly.
- Patch2: Simplify locked_vn initialization in find_vmap_area_lock().
- Link to v3: https://lore.kernel.org/r/20260924-vmalloc_dump_obj-v3-0-5bdee3da37b3@linux.dev

Changes in v3:
- Patch3 drop.
- Patch2 Extract find_vmap_area_lock as a helper to simplify the code.
- Link to v2: https://lore.kernel.org/r/20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev

Changes in v2:
- Use is_vmalloc_or_module_addr() instead of is_vmalloc_addr() to
  avoid filtering module/BPF/execmem addresses. (sashiko-bot)
- Link to v1: https://lore.kernel.org/r/20260916-vmalloc_dump_obj-v1-0-7aa402d224df@linux.dev

---
Ye Liu (2):
      mm/vmalloc: fix vmalloc_dump_obj address alignment for last-page lookups
      mm/vmalloc: fix vmalloc_dump_obj cross-zone VA lookup

 mm/vmalloc.c | 110 ++++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 67 insertions(+), 43 deletions(-)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-vmalloc_dump_obj-d80908447369

Best regards,
-- 
Ye Liu <ye.liu@linux.dev>

