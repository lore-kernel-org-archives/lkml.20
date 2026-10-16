Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8BD3B14BC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146556; cv=none; b=eT7kQCcNIHcO9NBEZiPHRH8qyIZ5EqMgZS/zK6DNtC6bk767WZkI25Sxfyr1v715G5qdkWW1JsHJAtu2IyQ3a5zypQNlZ493REpnd5CaJX7RgdLxR366rElXXqb0Sq3rNY4IVOvlLXY9X+jOGjsZzsJIdWY4jGTaKrgf1wTUGwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146556; c=relaxed/simple;
	bh=ky8tbCpPvao+mkrMxdXaQUfmuiVlu+rOqwSCcj+wrX4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Ysra9h8RcSwB32Er+RFcoNr9WzUBc6jCLTTiFrknytqwZCHxvMNSxtBCaDphAchAFvkO4kMKFcYCr3alZxmmPhXIBoGOR0WBdx7xO8q/kg8RijU536b+25qTs247zuRTcqaylqI3QivV6uE8YPPcqMsK0LB5TBjQfc2AUKaZebo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbtDsfpw; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbtDsfpw"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so649910f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146553; x=1792751353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opHOuUGGTALSPReuuheLADgvOm4sgED9zbXGqnbAz2g=;
        b=bbtDsfpwGdX31Yo753LvbOJhboMLz8iCgSuQMlmHwk8EscuIvIKDmShxkIBD9RSADU
         P/t4kJJ54/Y+BFhPG49Y+t5JHt6001nWbPAAm2cJsuij0iqd4er7Aylu7YASdC8YM6LZ
         o2zKSq05VxE4Non4yRwS38X2XnEEKuWMGZ3BxKYwbTHAdEOOZ5mkqkhbH1YpCYzrF5xO
         /dZftP4Q9jo3nZ/3aL4Ya2/PG+/X9jFrDWxLyXPloxcwK3fSZDftqTvPQEXggX1+DVI9
         EX81JawETYsPLNALyw/woq3cGgHgxw3Tv4JbvQeTQAXknq65PmJDJSf1RfujKaRCWZCu
         aDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146553; x=1792751353;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=opHOuUGGTALSPReuuheLADgvOm4sgED9zbXGqnbAz2g=;
        b=kMGzIJRfcz3sbb3WKlds61KDeeRSmMViISYD1GHREHVI/Y8lCLBr7SoZ+GX+xu4Y71
         ZqkhuHwKJUz5YN7ES+y6Rtbwh8f+jRgJZVR41FC6RtSzT+tBPq8nbXNLwJ3JmSvON1/m
         6h7vZvYcd+j9Pj9+76QKMT5U+9tweDWGeO36bYsELAOt85lR0FDaztzKJx1Gs5s3Its2
         MFMksPVihe7Nb/D6t9D7JphkLVSiurPJkzNtpY0Cs2ic79kmgd73Ej0NUoR9BMYlqjCq
         /XjSysWXXmzuZRIxAzXg7ZIzXGY7fNtjMA4lTAIaOBuiUl8EisyN07Z8quZ8udPUjEpl
         /yWg==
X-Forwarded-Encrypted: i=1; AKwUvBxb+Kwdba8Sy9ggPD4S9DtqHsiTeOGONVU8wcb+wPPIRXwLKmaaWIRJO1sqHJDfigjf0n51B7jUyiMkDmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1J83GzsppVSOJ08R+GaXwqhSj5Q0bJtH9V/E7SgbRgNPZqUm9
	LN0hn5Ond4VYiMW1K1JoTfkr0Nhb7ByXIKy6kIz2klMcXEWZmTSPI3ee
X-Gm-Gg: AYBFou1jl5E1CLhbf2tnGKqVtJBoXuWY75JqI4tvuvmZmjpHZk4p80BRwEaz45tmH2c
	MWZGwQhk5rMI2XLfX33cVEHHEgtT2NTi4jrbzx71Z8ZYfHX3nXFJkEWYX+qkI+gfYKWxyYW5d+M
	qmaPH8YKH03WIbIl2n28fOua6evbUU0u6JVPmsZ+AI314YGXk7/1ypehCVnHXL8UOH7MfJYihkD
	uYLrV4osHYr7h/jcyC4XtIECcyNuU7OblQXBmzkLSDe+v8o1bynz/eH/WF6w9ZWWH7C1bB71mYA
	pQ+tOTJbx0RCdjSvuQ4ENJZMtzpSMbKS/nBgBRAd0OWR/SBa2V1A3phANCmL5tg2bmK+MLjIenn
	uTO/AASawB993YubKr0AyhWGrhxmA4GYNoPUp+dHg21Fo0dpuMDXG/10ePzGyEw3NFjUfU9TRzb
	uRMJRFUdYztDgGK3AIu1PGfedLXIKMnmCgrpNY3lWdd3jIDKUEZwRUXB0QTdTEZcNQi4tFXXAY8
	T+SN5bs++LidepwqFkZKAccdeIk5fleHho9BfTdD1dDK6MBeFIiQTdkhgnk6K/F5/1RPfaZ2Z6S
	YRX3djC8/ctspKZZ/TtSrQNXXPp3Mv2XBJ02yTr9VB15lvXO09HRAfyPZlGkqUFEvO8ZLyssxzd
	OjOY=
X-Received: by 2002:a5d:5f92:0:b0:48d:efcb:1fea with SMTP id ffacd0b85a97d-48dfaca41d1mr6649319f8f.0.1792146552674;
        Fri, 16 Oct 2026 03:29:12 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de. [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7889sm4059906f8f.24.2026.10.16.03.29.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 03:29:12 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Mike Rapoport <rppt@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: mm: Pre-allocate module page tables for execmem
Date: Fri, 16 Oct 2026 12:28:47 +0200
Message-Id: <20261016102847.96530-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

RV64 pre-allocates page-table levels for late kernel mappings. The module
range is guarded by CONFIG_MODULES, although execmem can use it without
modules. BPF_JIT_REGION_START..BPF_JIT_REGION_END lies within
MODULES_VADDR..MODULES_END.

With CONFIG_BPF_JIT=y and CONFIG_MODULES=n, execmem adds a mapping to
init_mm while the current process retains an empty PGD entry. Initializing
a BPF program pack then faults:

  Unable to handle kernel paging request ...
  [ffffffff78000000] pgd=0000000000000000
  ...
  bpf_jit_fill_hole_with_zero
  bpf_prog_pack_alloc

Use CONFIG_EXECMEM for the module-range pre-allocation, as powerpc does
for its execmem page-table setup. Both CONFIG_MODULES and CONFIG_BPF_JIT
select it.

Fixes: 2c9e5d4a0082 ("bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Björn Töpel <bjorn@kernel.org>
---
Changes in v2:
- State that the BPF JIT region lies inside the module region (Mike).
- Add Acked-by tags from Mike Rapoport and Björn Töpel.
- No code changes from v1.

v1: https://lore.kernel.org/r/20261015033643.84972-1-kmehltretter@gmail.com/

Notes:
    Tested on a BeagleV Ahead with matched LLVM 18.1.3 builds based on
    v7.3-rc7:

    - unpatched: a native XDP attach triggered the Oops above
    - patched: native XDP attach and detach completed without an Oops

 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fb37b0b67efe..d92342c162e2 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1437,7 +1437,7 @@ static void __init preallocate_pgd_pages_range(unsigned long start, unsigned lon
 void __init pgtable_cache_init(void)
 {
 	preallocate_pgd_pages_range(VMALLOC_START, VMALLOC_END, "vmalloc");
-	if (IS_ENABLED(CONFIG_MODULES))
+	if (IS_ENABLED(CONFIG_EXECMEM))
 		preallocate_pgd_pages_range(MODULES_VADDR, MODULES_END, "bpf/modules");
 	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG)) {
 		preallocate_pgd_pages_range(VMEMMAP_START, VMEMMAP_END, "vmemmap");

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.39.5 (Apple Git-154)
