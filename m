Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1710F437136
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536453; cv=none; b=bIVBbg+KUUW4I+etTqpX4B+/juyiUYxofxnXTrlS5KL/YD2u+CayF8yekEvNfHFG4m5lwjIwITsQo99Ydpp9p3Ht72YZUx8ycW92lkOY/JkMJ44P2OyIbddmvKFmvhmVlihVkcgkB85hEFViWSdUfv/J9qRmTzS+LhuzCrdSwKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536453; c=relaxed/simple;
	bh=huH3z/otBMatTKw01bpo1hxPY4/B+otQqB638hIXXmc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FCDlpRbMNPJswBk21vMyxrZjpN4qJh2cf9B2i8uKEsSOiZN9oO2FKBE07okHfl+0kVNK2R5cW9VGVpN/3BVjmKlvwnuFC7mwe29+WYx2PFbHL8eFZIG3FJxYK0yZi5HOs2RLJlSogwn/x0sXco5mNz71hR0uDiQ5U6iDrJSxdRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkiSJKVe; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkiSJKVe"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so13946455e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790536450; x=1791141250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R7ZbDsxBKqvOhL656Ve4BDXMNH+w5ltqPH0IQmusM7k=;
        b=IkiSJKVeBeYalHfrN47S6XZ+T+o/eOKzTn0OaG6Id53uMwdCxUTy08hXFjQDuxI5DG
         BGEHURKx8EEJ2iHPoWfStwmpMwfDv493hio7ANur/y+9XNW/1cN4D6W8kWsTUsYb3kC9
         vOx7DxFqktGLRwT7nmnfgQL7Uw0Uae80k2FotkRXf9x7gFbFepwHAIALZI+VES7tbBO6
         zPRYYhwvpNgYvzYD7pdr1wJczMOaxRGybLtvRriDskE+BmPWQX8uDNlQoeI9G+2Dxya5
         UXMygERcc4YROEj0s6nrvB4585wLat0EjLhRPahzkHw4NxY/D3znhEzkOvRKKM241hxH
         K1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790536450; x=1791141250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7ZbDsxBKqvOhL656Ve4BDXMNH+w5ltqPH0IQmusM7k=;
        b=TTRrBF6YC44/zbCD/PCZ6so48saZV4EtTUm1+ZFGUxIld2jr0eBHChiCTg88ayUixW
         psYkDGvem+ycU5E9pj6l3JUaMUqPUXFRBODyAYOudVU1IYaTYXQl0Z4L/lmTQmhamqd+
         vMCzQKq5Gl6UZDmAhAuJhW365e3+nXhQRQyOfukiKRoD/u/w66AfObVoNOzJRU77GhFc
         k3Q17Un2CLcv7rcqreyKsWX9Jm8o0KsIqur0kJ3+ClFpzuwzjMaYzjbaPcRozWQy7KTq
         Fs6AL9dzbIyEvEPQu5uA44qMF6/FcLJDqc/Ata4r+l4tGCPyeGbyG1Uq1BcoyznSlb22
         Q9zA==
X-Forwarded-Encrypted: i=1; AKwUvBx7uTkm9RGH8L4KWqj3hHsLA3rP32PDKdDA1AXJ0+C34JgJDmfXqzjE57QG5QIr6KjavfbiPglalCCL8Xk=@vger.kernel.org
X-Gm-Message-State: AFuF++k4h5UaezQeIabeBWAhJoUH93qkPwoNSZ16shHYaYqTlChBeB3A
	0xgy3w7md80Z2+pL75YzY1IXJFFEUcCWwxY1jTaD7Dt7T6RbYWUNQOb2fj1iSA==
X-Gm-Gg: AYBFou20tCQ74P/fgyAS1YYdxL/RpRRNftrjK/BFSvyBS6k70AEHAQ+aUfULf10Bl5P
	ZRMcT/Q4J8wpvw5QrCOQ1DU/tVGZebgHrTkhUlGSXwtak9G/3U+eWWmQKR6HVfC/fH1il6831uP
	xvD9FWp86WTzB8GWyA+5YJqB9hHroV6LOtV+mbNXPbzk/5Y2P9UpYYlKpPI5TZcQ6rz6hDkx6uU
	xTafLCYwru42a9rfld1AiVrESxC9u/CM99N4AA0HinpfJLjPs8Wo1SzIaEcItgufULtJcSAqRHd
	F4Tk1WVr/VVQO56h8FZ81+O160OoQG+rh+OvddXjVac7El8rngpeeeCYlyrSFjpp4u+FW91d3Je
	405zJThRywIc//V+yPvyB7ZhOi7988q3y1Qjaadhte57f7w7Zkm6kssDt1S1kmkVLeoLwzaUDLy
	2mu91TzJXyjq9NZnyAnZ1mlR851hd8wV/TCpaAj5SfnXJ8/Xxc3CkfWYkiuopJQz+thSBvPL2CS
	ni3cpcn2MDOFpWJ94bT36hJ+/rKFkXAxUIJDSL3/r0O4aAG8Z8Txg98uKJ9HJZ0rHTOe2v9DwDG
	AVz+BGblRUwEQIyt5Yo5VcD+vVsZaZ30rneYsPAMz0p/QAQiEU7ZC6kTEJBR3s4FsEwHvVvcAaa
	m32MFRg==
X-Received: by 2002:a05:600c:3150:b0:49f:fd2d:23d1 with SMTP id 5b1f17b1804b1-49ffd2d2627mr69934935e9.27.1790536450093;
        Sun, 27 Sep 2026 12:14:10 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e6-5301-2072-0420-f831-ed4e.310.pool.telefonica.de. [2a02:3100:b2e6:5301:2072:420:f831:ed4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001904513sm113458955e9.10.2026.09.27.12.14.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 12:14:09 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sh: intc: sort the prio and sense lists after filling them
Date: Sun, 27 Sep 2026 21:13:59 +0200
Message-Id: <20260927191359.6144-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

register_intc_controller() sorts d->prio and d->sense right after
allocating them, with hw->nr_prio_regs and hw->nr_sense_regs as the
element count. The lists hold hw->nr_vectors entries and are only
filled later, by intc_register_irq().

On SH7785, sh7785-irq0123 and sh7785-irq4567 have four vectors but the
SoC's eleven priority registers, so sort() swaps 88 bytes in a 32 byte
kmalloc object at boot. slub_debug=FZPU reports "Right Redzone
overwritten" in kmalloc-32, and v6.5 and v6.6 panic in
__kmem_cache_alloc_node() while registering sh7785-irq0123.

Found with a custom QEMU model of the SH7785LCR. On it, v6.4
sh7785lcr_defconfig boots with SLAB, the defconfig default before v6.5,
and hangs before the console is up when built with SLUB.

Sort the lists once all vectors are registered, with the number of
entries that were added.

Fixes: b59f9f9775e6 ("sh: intc: optimize intc IRQ lookup")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Testing, all in QEMU on a custom SH7785LCR model, not on hardware:
    - v6.5 and v6.6 sh7785lcr_defconfig hang before the console is up
      (gcc 8 and gcc 14). With slub_debug=FZPU they boot and validating
      kmalloc-32 reports "Right Redzone overwritten" after the object
      holding the entries of sh7785-irq4567. With this patch they boot
      and the report is gone.
    - v6.4 sh7785lcr_defconfig (SLAB) boots. The same v6.4 built with SLUB
      hangs, reports the overflow with slub_debug=FZPU, and boots with
      this patch.
    - Current mainline boots with or without the patch, but reports the
      overflow with slub_debug=FZPU unless patched.
    Testing on real hardware is welcome.

 drivers/sh/intc/core.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/sh/intc/core.c b/drivers/sh/intc/core.c
index aa68fe190865d..ffbe60234eefc 100644
--- a/drivers/sh/intc/core.c
+++ b/drivers/sh/intc/core.c
@@ -275,9 +275,6 @@ int __init register_intc_controller(struct intc_desc *desc)
 			k += save_reg(d, k, hw->prio_regs[i].set_reg, smp);
 			k += save_reg(d, k, hw->prio_regs[i].clr_reg, smp);
 		}
-
-		sort(d->prio, hw->nr_prio_regs, sizeof(*d->prio),
-		     intc_handle_int_cmp, NULL);
 	}
 
 	if (hw->sense_regs) {
@@ -287,9 +284,6 @@ int __init register_intc_controller(struct intc_desc *desc)
 
 		for (i = 0; i < hw->nr_sense_regs; i++)
 			k += save_reg(d, k, hw->sense_regs[i].reg, 0);
-
-		sort(d->sense, hw->nr_sense_regs, sizeof(*d->sense),
-		     intc_handle_int_cmp, NULL);
 	}
 
 	if (hw->subgroups)
@@ -357,6 +351,11 @@ int __init register_intc_controller(struct intc_desc *desc)
 		}
 	}
 
+	sort(d->prio, d->nr_prio, sizeof(*d->prio),
+	     intc_handle_int_cmp, NULL);
+	sort(d->sense, d->nr_sense, sizeof(*d->sense),
+	     intc_handle_int_cmp, NULL);
+
 	intc_subgroup_init(desc, d);
 
 	/* enable bits matching force_enable after registering irqs */
-- 
2.53.0

