Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9256420490
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291548; cv=none; b=GZetYCDfakLtjMN4U5oGa03iqtnqdWJ6knz1vWtPxlpzkJQAtnBYW1J1jRU7mo/PpNZi43vMioibMj3nyJ55Z72cNC8omhqiHVQyj5USKUeBz2uNBWcYyeceCl/QA0DdA4WlLxNMNDgntjj0xnQGvpWCkT7va+RbKzIMXKZbOjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291548; c=relaxed/simple;
	bh=MgWAwea1MBQjQ6iZeCZdEffwq4LQ4ofw/92P0MY8PNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gw2fAATHGcaAIxdinJS3/xHyLm6wObcXrqA471J1x/SkNlQ46PahyAQhLzlzZT29Dz1K/8m1RWojLXyyZod862u6L2trwjTcIRU9n+y/kpJxBOIOZyJ5700Mg2FD1gM+EPQ/p/wF1TsE9aLitWmLad0HdeK21MJPbw4Z7YAGqnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwsW6yY0; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwsW6yY0"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so1304594a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791291546; x=1791896346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2xk8Z03Jvlehme5HkwczAWmfFVokFO0rBq6AUapVGQ=;
        b=LwsW6yY0Q+cRi1IoJuWWyymVTmHup7hn02Q37Aa8feaogXhwcPK4muPu1sOaKbfGMH
         dHS3dFK4LBjWPnFctVRvPkab1Lv1ePGLsg9gLIcDoXBrGEJ2Hz+2XujnANdhrkmeO9L1
         vRRhNz+6XjLuzkgINbf5IW4Loqc/84zByNrqFNhwQ93WNYXORkRFMCuczuVVuR+PsI2L
         7Q+hJ6xbSROqwAZk4Qst3kEu2jRQNUZUJv60NcKl7/FI/oPiSPVC4VEqwaNZSytu7ckd
         1vgnsTj6q4JN1bj7omz7Qg5XWKe0SW8eWBOOc1VdBpYM7vh/863LVqS7cAv80pleBMTO
         Fgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791291546; x=1791896346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2xk8Z03Jvlehme5HkwczAWmfFVokFO0rBq6AUapVGQ=;
        b=MolhMex2KWtQ+R3dQGI2OTyq+rvbpAx2WdLt8LTzlDCiAkeAN3jurhgJXQGuFjvRM0
         s/dvd45OwsznED+pRjrAvMbvv/0kCwZd6PPy6LIqk4YtOveQH6EkSsFCxqd7itvVXpbm
         1/gQglfC+pnatJeb82pgEXuFHz2ivR6Uvcb2zL3aGN4d2iC/kCaWZWj6zP7qsRyQLmbY
         izyUYH1DZyEl4OFI3dMB3Qv9mrfo0T43Io8hg4S7ckLj9pmijiGcGjmvMeyJBAdMikOb
         AF1xWjPgyO439R6PB1oCNr9iw3E7YuAYC2zTppa3bxLod+ZguR/R6WZCX4atn3GlAD9u
         l1jA==
X-Forwarded-Encrypted: i=1; AKwUvBypp16M8oVqS9vW47bDTvET8Hl7Mb0qJLri46FXpdIcMMj46/XgciTRvHBt8bHIWqiJxMx+BnhJ+/NFqC0=@vger.kernel.org
X-Gm-Message-State: AFuF++ls9plC7OzsxU/IcxB+bNsVqQHYnc08Sz4NfMHisKeq8zqQD43t
	HbC+pHJtDzq2sibgNaImC4ePWEUyGxpTOgQuxWs/4T3xGc92O8CGi5zW
X-Gm-Gg: AYBFou1EaxI71K+IoWP66Yj09QGngvXmfnUpgG13rnaI4h82bio9/k0SHuLq/6iHtPd
	wZNJx6zHUqSeo44vdOsqMZ1qiwPE5jO2MjhBP7gqrM04gBeBs3xOqYN6JgwcGe28ZAvJNxyfLZw
	PfIOFD2WeF7geGzswJ7SigPjsrMsTyk73YC7F2BBZD1jy+EI55F8yFn4Jb/ytAANvv50e/WFNPG
	yjt9KyoELNWZUoEoLJ3DaSL88CIPVjB+6d+pVEidPmrRWhPlfo03kkOKiuYBosZeY8H/hEMCd/f
	fKJLtWQOZoV4Bd8JtW4oZ9r56PATj7Kf7cGu1rBFGF9z3UtK5SYaS3uZceaMt6JT3gbGCAyIVOu
	iQ/DIjxGQQwxM7m/unNc06DvVtrlw3bwgAzEW+FZG9VotcCqaMggFZRQ6B4iegkNc8q06WSlywR
	s5NiVCrnMADmPOHwqp8sNYOLevboQgrQTOeFbPWqbLFLUjOz6IM/z06X6qSftBYDEi60Gc7E/2F
	SpoI9z8ZATW1CfD
X-Received: by 2002:a05:6a21:d8c:b0:3e0:c3f8:4821 with SMTP id adf61e73a8af0-3e124890dbamr1163921637.41.1791291546091;
        Tue, 06 Oct 2026 05:59:06 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([2401:4900:900c:ec20:d139:f8fd:7043:7eb2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm2415225a12.11.2026.10.06.05.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:59:05 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+609c80047e3e808b465c@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] PM: hibernate: skip offline memory in mark_free_pages()
Date: Tue,  6 Oct 2026 18:28:49 +0530
Message-ID: <20261006125849.1998-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mark_free_pages() walks every valid PFN of a zone and calls page_zone()
on its struct page.  A PFN in an offlined memory block is still valid,
but its memmap is no longer initialised: offlining poisons it.  With
CONFIG_DEBUG_VM that is caught on the first such page:

  page:ffffea0005400000 is uninitialized and poisoned
  page dumped because: VM_BUG_ON_PAGE(PagePoisoned(page))
  kernel BUG at ./include/linux/mm.h:2402!
  RIP: 0010:mark_free_pages+0x49a/0x4b0 kernel/power/snapshot.c:1266
   count_data_pages kernel/power/snapshot.c:1417 [inline]
   hibernate_preallocate_memory+0x14f/0x750 kernel/power/snapshot.c:1859
   hibernation_snapshot+0xd5/0x3d0 kernel/power/hibernate.c:416
   hibernate+0x28f/0x680 kernel/power/hibernate.c:813

syzbot's reproducer offlines memory42 and then writes "disk" to
/sys/power/state; that page is the first one of memory42.  Without
CONFIG_DEBUG_VM the walk reads stale page flags instead.

saveable_page() and saveable_highmem_page() already use
pfn_to_online_page() for this since commit 5b56db37218e ("PM/Hibernate:
use pfn_to_online_page()").  Do the same here.  Offline pages are never
on a free list, so the second loop in this function does not need it.

Fixes: d33695b16a9f ("mm/memory_hotplug: poison memmap in remove_pfn_range_from_zone()")
Reported-by: syzbot+609c80047e3e808b465c@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
Built with W=1 only; not runtime-tested.

 kernel/power/snapshot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
index b209712cb2c3..0cd8f05c1395 100644
--- a/kernel/power/snapshot.c
+++ b/kernel/power/snapshot.c
@@ -1256,14 +1256,14 @@ static void mark_free_pages(struct zone *zone)
 
 	max_zone_pfn = zone_end_pfn(zone);
 	for_each_valid_pfn(pfn, zone->zone_start_pfn, max_zone_pfn) {
-		page = pfn_to_page(pfn);
-
 		if (!--page_count) {
 			touch_nmi_watchdog();
 			page_count = WD_PAGE_COUNT;
 		}
 
-		if (page_zone(page) != zone)
+		/* the memmap of offline memory is not initialised */
+		page = pfn_to_online_page(pfn);
+		if (!page || page_zone(page) != zone)
 			continue;
 
 		if (!swsusp_page_is_forbidden(page))
-- 
2.55.0.windows.5

