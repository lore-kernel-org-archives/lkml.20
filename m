Received: from mta1.migadu.com (out-52.mta1.migadu.com [95.215.58.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3CD497381
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996665; cv=none; b=KEJYSYpXzpRsGGEfwzB2utSuztzpY1EXtbMjGNL24dBJvjfCQ2H7kaPb5n4P1g812VLndFqtR9gcqTbz1lhuVxYWxTDW9JABmKYkVN7A9+/3td6M49SsC5BQ4JHPUcIRVz3K2fZWMnBtQgGVZjOH9Qle4zp+Qq4kaz+pkAh+v3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996665; c=relaxed/simple;
	bh=XGKeaZZkegvCape3qQBQEln+i9bC30nsXnPlSXlaifg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nsMlONZ0hHOjOmMhJ2ah2N0wLY958btuLABCJPrM7xvM8kB+Xfu5gDwuQFGPAQ6LTI3EHfee8/IMRcWR2gPcIo9xA/SxJzx5/CxBtl3imIxVxM+ldNpj26eFWcmh00cj+Xnpqwyqjx4stZ/MYak9spWW6KGgAI/XGO2FUDkR6UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EWfXz3SF; arc=none smtp.client-ip=95.215.58.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EWfXz3SF"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XGKeaZZkegvCape3qQBQEln+i9bC30nsXnPlSXlaifg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789996660; v=1; x=1790601460;
 b=EWfXz3SFxahkBrxnVvRXGkVXmPA/DSmsYBjLNUX5od6izbSpmcQS8L/z2W+rZxIQclFpAkU+
 8sxXxkmD+VJrP8fqPP4l33KVqQQgqIczhQZqkg01seg36/eqkgxqQuOi56MqZj+0REpHG/CU/6b
 AuUSZvEdYJGJaCufn2pxtfEI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ba4558021e9b6db7;
	Mon, 21 Sep 2026 13:17:40 +0000
X-Mizu-Trace-ID: ba4558021e9b6db7
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Subject: [PATCH v2 0/3] mm/vmalloc: fix vmalloc_dump_obj VA lookup
Date: Mon, 21 Sep 2026 21:17:20 +0800
Message-Id: <20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGAusWoC/32OywqDMBREf0XuuikxDT668j+KyNVca4omktRgE
 f+9Uei2ywNzZmYDT06Th3uygaOgvbYmgrgk0A1onsS0igyCi4yXacbChONou0Yt09zY9sVUwUt
 eSJnfshKiNjvq9XpWPurILXpirUPTDUfRz3eE6ogP2r+t+5wHQnpIf7ZCyjjLESUXSgip+mrUZ
 lmvigLU+75/AWLiVEvPAAAA
X-Change-ID: 20260916-vmalloc_dump_obj-d80908447369
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3

vmalloc_dump_obj() has two bugs that cause it to miss vmalloc
allocations, plus a minor optimization opportunity:

  1. PAGE_ALIGN() rounds up, pushing last-page addresses to va_end
     and outside the VA lookup range.

  2. The function searches only one vmap node, but allocations
     larger than 64 KiB may span multiple vmap zones whose VA
     is stored in a different node's rb-tree.

Patch 1 fixes the alignment, patch 2 fixes the cross-zone search,
patch 3 adds an early is_vmalloc_or_module_addr() check to skip non-vmalloc
addresses without traversing all nodes.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
Changes in v2:
- Use is_vmalloc_or_module_addr() instead of is_vmalloc_addr() to
  avoid filtering module/BPF/execmem addresses. (sashiko-bot)
- Link to v1: https://lore.kernel.org/r/20260916-vmalloc_dump_obj-v1-0-7aa402d224df@linux.dev

---
Ye Liu (3):
      mm/vmalloc: fix vmalloc_dump_obj address alignment for last-page lookups
      mm/vmalloc: fix vmalloc_dump_obj cross-zone VA lookup
      mm/vmalloc: skip vmalloc_dump_obj for non-vmalloc addresses

 mm/vmalloc.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-vmalloc_dump_obj-d80908447369

Best regards,
-- 
Ye Liu <ye.liu@linux.dev>

