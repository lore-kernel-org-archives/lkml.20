Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1E82F8EA6
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789803101; cv=none; b=NQp74bLVtEPBh6UCqjCDeZyNB06fbKdOEfEEjjPu9MLyYfiihXJyvmANrWOrvVPnpYQN0EXB8VSpHTLeHpCA9rUs7joiW+4EQBvw6QpejhFPMfGDlhjARuh5qcNa9Na3bLjZ3VUjN9nkarnsu4ryukHCGnnq04fTZASjVDgjtDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789803101; c=relaxed/simple;
	bh=2MYchSZcJC+1dhKB7VGNheMMau7V9rlozpiUxImzcTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZoiQScDcgI5Z+xk6ceHZaZkQXHdPkp5s2AOTDKqu4W51aOW2HcLIUMRy4UPcaKnwD1qzdsNFL+8jsNgMApaTN0+wvafJEbtD9ZaB/lMy2oHNXVUE6xwk4OCT+aR3445ruth/0lSEb/V08OozNfUPdK+pWMrTqMb7riQrbyuXL/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvV31kXA; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvV31kXA"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea34ef4so1630660a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789803100; x=1790407900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgex21lQm0G61YS9FJDDkISfh7R3E5d66BHmejgp1dg=;
        b=LvV31kXARXFVH3wlFkzwizP4uJ0307/P+OYM92o8RmrD8/drLkdtTfsEDRo5wsDVPM
         fl6WKoNzWaIRkEto5P41Oq7DXOaSmyZCPAtF5AEgUGc0FD5E9MUMs+T2pTEVTtJ6+M28
         ocEzObT8EYAZ11ohmzxgFNS0AqWZ8j96EmuYhNiN/sfwsinZxQpdwU8k61awFEwMMabo
         MNcqXVG62XOAs2/8zF7yUHPdajOIahWvrJDNO9ArEbtoFxCNY1TFiFzj1UmM3XzIOwXp
         WqRCYH+KJvHuNR9GMgN2N8JRXG711Kjyn9HXTfu3bMuxCVSAaBy1lhsQJNP3U7436YAS
         ncoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789803100; x=1790407900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgex21lQm0G61YS9FJDDkISfh7R3E5d66BHmejgp1dg=;
        b=hjyG0fqRS2A+ooD5ocvoj/Uek6JJ/zg6M44PRvQ1zPBQpM4mqSfZZ8oGR9YV6EFiLk
         zDRk2qCAAFQeDkXEVbJIFl5opAJOI0qGz+DzbOJpTQEZos9Dr9BjOXP4ARo6HyNoxhMj
         jtw9c/FLZtD+YR5JtXN5lwKldPmMDResPgNu34B88Ytd40cUQQdZ8hSJVZHjDfJhK5dS
         GNZfGPt9C65SsM+yY1Z/uGR30cESnzOUblup8vbhsDre5LhkyHKs++op2+loLpzFeIjj
         v0FKbOU7nOQcGGd848+hbyw8mQw856Wn2wLTEBWeCDe52k0srxnw8wynvBU2GH8KN9qI
         i2og==
X-Forwarded-Encrypted: i=1; AKwUvBwmCs7V6JDrPQsrJN1u5Yl3qiy3a+G9yKbE57WNN2+4uBvjZt5GKFQchvRxp+zkqfaJXCwAtefATeet38o=@vger.kernel.org
X-Gm-Message-State: AFuF++lABqdJJUJC/v6t7lpQrZX9XJJcRERSpLjb/qd+fc5tHWZIEmhg
	sIj4e2jr7FwbYTerkWT/qb3xpCL/Bb4NuY+5YDvtrWlaGtRK4PoTITBK
X-Gm-Gg: AYBFou0ZJfPjJ4FN1tvOnA4LjiY5r1xzT7KREHW2GSabiIz7vDYtTzsxgUfYoVBup18
	1BBxV9jEwaJu+V2DJJEPvZSsdFHBD/IWpCq5ofIKCOBoux57aOcQ5uh3UEzsmLq5ZY6Uhj1r5Yi
	BosB7o2bCqnGaMx4k9f1zaEjwGFxMVHZl5QpOQSudxkHbq9LpCfPZXzXtvmfeHrl7F2Vvvro42t
	Ny4ripIiDuEVT55D9rCtnP5vUIXDvbIyp8n5gajBE1unJhouHMJliSMlGEyLthKCwhw/0QyhNPj
	UzPJhUIY22QNpG7ce5XsQfgGlRqvjm8rdJzX7hM1vwMguiY+XLdBQVjxw83uwpDd3RFlKXzliCC
	AF2wKjDK/3P1+Ejw7qIyvuN3m6YFExFX18/07J67DLLYAWpP8GAlWIfMC874uHUoUJ0d1FYGYL9
	aVwZwFgsi6NhDbDjS/GI/wuTwxf+CUGZNn/+LJ/Iondt7h1fjMV2SqOY5B1nZ6NWX2M6CgErrgx
	OC1gf4NOM2RS4BYlGihhJz26FrvaI2Aycp7XF/QieVe7v+wdV+aB0pYY4WWP0HiylDEvU0EmOsZ
	6hagppnkqDMA2F6uGMjk0IlmdA==
X-Received: by 2002:a05:6a20:c901:b0:3dd:a197:edee with SMTP id adf61e73a8af0-3dda197f7b9mr2964150637.61.1789803099724;
        Sat, 19 Sep 2026 00:31:39 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (36-232-198-121.dynamic-ip.hinet.net. [36.232.198.121])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72ae9e9c8sm654498a12.17.2026.09.19.00.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 00:31:39 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	liam@infradead.org,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Barry Song <baohua@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mm/memory: reuse the whole exclusive large folio on a write fault
Date: Sat, 19 Sep 2026 15:31:31 +0800
Message-ID: <20260919073134.639-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918064238.868-1-aa9736195201@gmail.com>
References: <20260918064238.868-1-aa9736195201@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After fork() and the child's exit, the parent's write faults reuse a
large anonymous folio one PTE at a time, although
wp_can_reuse_anon_folio() has already found the whole folio exclusive.

v2, after the comments on v1 [1]:
- Split in two.  1/2 handles an aligned block of 16 PTEs around the
  fault, the contpte-sized version David was fine with in the 2024
  discussion of Barry's RFC [2].  2/2 lifts that to the folio.
- The earlier discussion is linked; the changelogs say how its two
  reservations, the latency of the individual fault and how far to go
  around it, are answered.
- The bound of the walk is spelled out (Barry): folio, VMA and block or
  page table, each PTE read once by folio_pte_batch_flags().
- Changelogs cut to what is needed to judge the change.
- Same base as v1; 1/2 + 2/2 is the code of v1.

Two points from the AI review of v1, both done as mprotect() does them:
change_pte_range() does not flush_cache_range() before making PTEs
writable, and it makes clean exclusive anonymous PTEs writable without
pte_mkdirty() (the dirty rule is for shared file mappings, see
can_change_shared_pte_writable()).

Controls, unchanged: order-0 pages, PMD-mapped THPs, the COW copy path
and the order-0 and cow/fork/write-fault modes of David's
pte-mapped-folio-benchmarks.

What does not get faster on x86: stores to pages this CPU still holds
a read-only TLB entry for.  The fault makes the PTEs writable but, like
mprotect(), does not flush, so such a page takes one spurious fault,
about the cost of the reuse fault it replaces.  That is the case for
pages read since fork(), and for a loop that only stores one byte per
page in ascending order (David's reuse-byte mode): the CPU runs the
next stores speculatively while the first one faults and caches their
read-only translations.  Shown with kprobes (135,687 handle_mm_fault()
for 8,457 do_wp_page()) and an LFENCE after every store (4,100 faults
instead of 65,400); the untouched PMD-mapped case behaves the same.  A
flush_tlb_local() in the helper would fix it (that loop 28 -> 4 ms,
memset() 38 -> 21 ms, +140 ns per fault), but generic code has no way
to ask x86 for a flush that stays on this CPU, so that is for later.

Tested with DEBUG_VM, DEBUG_VM_PGTABLE, PROVE_LOCKING and
PAGE_TABLE_CHECK_ENFORCED: the mm selftests, a 12-scenario COW test
(child alive, vmsplice, PROT_READ VMA inside the folio, soft-dirty and
uffd-wp counts, mremap, holes, pageout, FOLL_FORCE), a
fork/pageout/mprotect/vmsplice stress, NUMA balancing on numa=fake=2
(protnone PTEs left alone), and arm64 under QEMU for the counters.
Cross-built for arm64 4K/16K/64K, i386 with and without PAE, x86
without THP, arm, arm nommu, riscv64, powerpc64le and s390x.

[1] https://lore.kernel.org/r/20260918064238.868-1-aa9736195201@gmail.com
[2] https://lore.kernel.org/r/20240831092339.66085-1-21cnbao@gmail.com

Yuan-Hao Hsu (2):
  mm/memory: reuse 16 PTEs of an exclusive large folio on a write fault
  mm/memory: reuse the whole exclusive large folio on a write fault

 mm/memory.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 2 deletions(-)


base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.43.0

