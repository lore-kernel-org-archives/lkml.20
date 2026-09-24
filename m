Received: from mta1.migadu.com (out-13.mta1.migadu.com [95.215.58.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B52B2931C4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239912; cv=none; b=JDeVPS6tJlNm/hO3Cuy8xM093Qob7TB7DDGGI096U+3GsDWOBEnCJJUvHdthNX2PRpf/liAJXo9c8qyrresuBFVZgDeP8VXeFDUIRfPc9Yz7W1TDZUoxfJXfNk1LGvlUie4r76Oxrx60sfp3ILtlNYPnP7Sr5m22xGTu+nm1pqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239912; c=relaxed/simple;
	bh=CviuPqAogpjkevgINuLKWVWxQ4ifJ0EssNBV97Y1Xro=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z0wiCfM1Q7478N7OgqduNII+hgWDlbnCDjxsOSkagz9tjTYzDfnX54xUePwy11gp5Ur11cSMXSJ1pFFrEZx92DjWLNRaX7wGSJp7X1f1Lu9QVjhDZpUx3L/iVHqFzXnYYg4O8RSc9gPd5lPHCSqgqcDsg2OCi6eKdNyrU5Zm8uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=muU6calw; arc=none smtp.client-ip=95.215.58.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="muU6calw"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CviuPqAogpjkevgINuLKWVWxQ4ifJ0EssNBV97Y1Xro=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790239907; v=1; x=1790844707;
 b=muU6calwiby1Br8XuR8Q84GYSnlzEk5VF6WnxPInY8ntgCU8KvoaROa6p5ECmQ6fnQgBvEjg
 EqmWI6Nq5WMGoRmK6v+EviQFNo0XA9HOIKyepyjXJ6ntrzlf4URh0EKcT2aU9/TMUcRuKGihPZ6
 QT4DBXcQ3TOY/j6fRvFr0ydA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3762d0d9dc2c72df;
	Thu, 24 Sep 2026 08:51:46 +0000
X-Mizu-Trace-ID: 3762d0d9dc2c72df
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Subject: [PATCH v3 0/2] mm/vmalloc: fix vmalloc_dump_obj VA lookup
Date: Thu, 24 Sep 2026 16:51:38 +0800
Message-Id: <20260924-vmalloc_dump_obj-v3-0-5bdee3da37b3@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJrktGoC/32OzQqDMBAGX0Vybkqyij899T1KkZisNUUTSWqwi
 O9eIxQ8lB4HdubbhXh0Gj25JAtxGLTX1myQnhIiO2EeSLXamACDnFU8p2EQfW9lraZhrG3zpKp
 kFSuzrEjzimza6LDV85683TduhEfaOGFkF0Nf36FQ8bzT/mXde38g8Cj92QqcMloIkTFQAJlqr
 70203xWGEjcCnAIAP8RgBhIW4lNiorL8hhY1/UDBG2lphABAAA=
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

 mm/vmalloc.c | 113 ++++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 70 insertions(+), 43 deletions(-)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-vmalloc_dump_obj-d80908447369

Best regards,
-- 
Ye Liu <ye.liu@linux.dev>

