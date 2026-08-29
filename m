Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA63125A0
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787997662; cv=none; b=MhpxSRWlANMdUbIFFD8dFsHzxFplWklvH481o6rBErHTBiPFdx8SSzrKNKEc3Vlzf/a7ntEnTFLX/OAsdlABQ0vcsDMngJg5lFhT07+aPUfBsC8umNuQis0mb++nt35pNzvICZJsBMukMe1HC1NUCcvQCi14nzQsBTAXlP1ZIlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787997662; c=relaxed/simple;
	bh=qrdk3G3nw5UpXUNUxEzxzrpu5FaPbiLofOwcw8s2J0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SRR347mArKPQ2Ave+G4lN0cMPJJqAIIKf0C8xY8h3D5mR6i5JAYxyFUvscl9QfvbUM9NCAL+o3PbbC2YBZORVeh+Z1dhsv1m0yT99P9HgOFJBgdPGJa7Gl8ZAuVQ9fRRmjLjpXo1Fc/ftuF+U2XNHgrYRptm74Non2OYgwji4zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCY9Gp54; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCY9Gp54"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d6d28aa26cso13449815ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787997661; x=1788602461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IwFd7o8UMmNT+Gk1IhxdOOfmqQSINyznJ9kzHzL3VGw=;
        b=TCY9Gp54Nizuq/g/Jaa3p52eRVy6UNkekGtxnvp1OKgB+V/+O+DemeLDJuvQ0h/TTI
         EK/2OXyQuFakzevFWXnJ1W75miaEdnKxAjBAmwistyYCBTPnCQzZka2d93esody9KE2u
         +/iWLDj5atC6BEIiFPMMkimEmYiUKHs12YHR2o1exlUSUrJccjBE7+YqFVnGOdN88yo7
         cGonMtcRAisMsggqlDo17y38yAChStnfUrHSmk3w6oG/OLhObGqSWq7aCjDoV7W92eFJ
         q8vIZrTNOIwVGL9UF8oEvYwWO2VtD6lKbGfDBEspP7+Hz+BCOLnTqeAhShbmxkXw2J3h
         UWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787997661; x=1788602461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IwFd7o8UMmNT+Gk1IhxdOOfmqQSINyznJ9kzHzL3VGw=;
        b=sFP7J9erZnbp/UU3K2pJP94JgF/lSkY8HI8/9g2K/sCo0uyPkquJ+yTpmc8eqCzE9O
         D7efvVjzuT33l4Jo3/MzGNvLiMol1ILEq4vpBbrTOyk1N8vaM667BDp4Il9jZNAAJpUL
         8/MblKacn4d/mBIRuMYSrMAO7pDsV5+DT0Olz2a7NQ1DI9qpgJprTAWZKJ+uQHgIUVr6
         jr5ZG/h7N+kiZEBQrJVjBLNcY9NaPC1kxWBUDciD+u7aZGMJD46clBw5Mjzo6uy9AKoH
         xchwmtriw/LjWOSU41aI2STB9oy2irDz6Kwvi4Rprxj+M6QlMvYRBq3S6WHVfYtqVqPe
         HTXA==
X-Forwarded-Encrypted: i=1; AKwUvBzY27dmiwEb+JOaHB2O4ZCYLG1//qIQfNNJh9oiiLEcxNN0HKW10x0FZOYUGCJOLq0pxcNX/YucKOaFpLA=@vger.kernel.org
X-Gm-Message-State: AFuF++kjw2MAyF24L3GrhbgnO+WQ7tj+rySsqJEagOEMZsZI8xHR32Uu
	lM6Iv9fQolUmFbe2NBnynDSx+imA1HtppmX7+iwvzzhRkmm1FcapAj0c
X-Gm-Gg: AYBFou0H0w31ui2qetNqDPgscSc+0zYib4Wlh6GAsSuRKxRfd2gI+ekR8rKB+9pGREp
	YQcHiPAI90qlEAma9KOCV9FHAZuw6L7G8wpISfhZB9qDu8Er1xm48UTU2jdBsnCNsgnqc3IzeIE
	ZBRPypiDZUFF9PbBKX1HO1lKR/kf4Vh0I3UbGB/mbiW4SRS/bEP0admwiNfirHS42hAO+DDTLqI
	637VXPOh+Uk0IDyomEE1KIh13kbp9xmwcM61KjVoTqMT0pOKYxEdzsxRaQsMyRhd6fubnEp/4mk
	/+w8cIQxtlmkic92cy3trWiUK81yagNi/rBO28ZLvwZFjorB0hZwDnTQFT0KGRaul1MpPmDmZZw
	1I0FqcqhjJnVGGGml7yyA4mPYjbhn+6Aky8H9/uA6S6mTlbnuLhWy1o5ttD8vph6mmc4BEAnmte
	GukjboZ7tK9SRxWCC4RbOJdSwItMXvI5Jg4VUG/+uGy+lrQxNUFUvkgreGf1Hd1+ok6B6RNLmKC
	JiNnHNvDTgbSLQCSCPjOpc7lvLTiFV0ffCWEw73SjE=
X-Received: by 2002:a17:903:1a30:b0:2d8:d4ce:9f32 with SMTP id d9443c01a7336-2d8d4cea3demr80305115ad.16.1787997660341;
        Sat, 29 Aug 2026 03:01:00 -0700 (PDT)
Received: from fedora ([177.21.143.191])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm1598051eec.4.2026.08.29.03.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 03:00:59 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	riel@surriel.com,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
	syzbot+395b7abe9696862fc188@syzkaller.appspotmail.com
Subject: [PATCH] mm: fix the race on huge alloc failed
Date: Sat, 29 Aug 2026 07:00:34 -0300
Message-ID: <20260829100034.423064-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The race occurs because the reader (__vmf_anon_prepare()) checks
`vma->anon->vma` without holding the mmap_lock and withou the
READ_ONCE() macro. Since the writer (__anon_vma_prepare()) is holding the
mmap_lock and updating the pointer, it creates a data race as the two
access are not properly synchronized.

Use READ_ONCE() on the reader side and WRITE_ONCE() on the writer side
to tell to compiler treat these memory access carefully and not to
optimize them leading to inconsistent read.

Reported-by: syzbot+395b7abe9696862fc188@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=395b7abe9696862fc188
Fixes: 164b06f238b9 ("mm: call wp_page_copy() under the VMA lock")
Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
---
 mm/memory.c | 2 +-
 mm/rmap.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 6b8280cfc1db..33c1fbd30cdd 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3820,7 +3820,7 @@ vm_fault_t __vmf_anon_prepare(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	vm_fault_t ret = 0;
 
-	if (likely(vma->anon_vma))
+	if (likely(READ_ONCE(vma->anon_vma)))
 		return 0;
 	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
 		if (!mmap_read_trylock(vma->vm_mm))
diff --git a/mm/rmap.c b/mm/rmap.c
index 1c77d5dc06e9..9d64d776b8c5 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -209,7 +209,7 @@ int __anon_vma_prepare(struct vm_area_struct *vma)
 	/* page_table_lock to protect against threads */
 	spin_lock(&mm->page_table_lock);
 	if (likely(!vma->anon_vma)) {
-		vma->anon_vma = anon_vma;
+		WRITE_ONCE(vma->anon_vma, anon_vma);
 		anon_vma_chain_assign(vma, avc, anon_vma);
 		anon_vma_interval_tree_insert(avc, &anon_vma->rb_root);
 		anon_vma->num_active_vmas++;
-- 
2.52.0

