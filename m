Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827589;
	b=UODH1b6Z6JsAXdJ46Kc9dJkGLibC6+lLL606Hsf1mMyFUbRznczkwtXhT+9zeIKgLkCn
	 GHcChTAcyS5BIG1zbEMGRebAxouwsSzfuBjwmIKSLHMzPK0+RPr+2l23H/T959DtDT2o0
	 frXE2+MAzm4z2URPa2ADtVhqeo7iq4A9M6Jk3m+2tU9s6kPb1hJoo7+7HESppQ54AYFUD
	 yZv/PmoKz2C/IxH+eruXj4/JHXEANjPNgwVVQeH3+745UvG4NbpwUuBYTO+3+m4JklmBF
	 1FcDQy7Lw0gVKXTV2TtFURLmK9hJdHqbaUN9BEvAEFO+MPqF3SC0+jpvwE4MTXmbeNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rROGYk1aEiWG91xI09CLyS+cm7Q+TGC8+ehzSxVtxO4=;
	b=5AlEx6urC3UANdzZGNL9utBA1xaTWa26QLX++epY2GNAtnbqpdgpsHNxthCBILgGrVD5
	 4TDK6ToeAo2a3Y4Q2HrPOuSCedC1M65/BxdvmDwoRab1ih1jL4kbChMxWbk2iWm0UNSFm
	 ZEL5OobpbMmW+Q5W/F9abkOTNJpgRYdfiO1MQLEOPwmNQ4QtAiN9kNasI+vQ00WK3b7Ge
	 XtawpkHN8pwyzfi7Z4QbgpQuQ0wXVRAA/rkEFh3q4OiR8tPGXXEolQw3onYU5T27m8tDI
	 cE1ylF84P4XgsBng8G8tRVO0HQmq3Guv0JMkplu4Waik+FGFixfjbTwwnHGuBAxVdHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sv0YrJHa;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9502C606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9502C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sv0YrJHa
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso1890604a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794827588; x=1795432388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rROGYk1aEiWG91xI09CLyS+cm7Q+TGC8+ehzSxVtxO4=;
        b=sv0YrJHal6yKIbHCL09EvCkmGX1nNr6Oz3Eo9+cwRe4qV2BQB5IX6/WdaOVtxvElTI
         Qf0Q8FeIIDU4oGJQkBviViZXVimGGETKdfnjEChfp2VrnGcSQB0KoHCYKEWv472Itoxd
         ma431rEX8S2KcYPwCgSJIEXskkOe3CUKKk3TyXSd6PAeFXA2GdNx82VEY4ePRfrlmMMp
         HQI4SYzAIpcTYVtT8R918YaptPLYAFzn8nKE/WmX0AzT0kd2Tsun8b7IsMMQkRkWcdwV
         +F5lyKhqk4lX5X0PANjiKu7zziPr0o8xr52n3PQPoGsvNR3QH8xZbqSkrhFSjIMqZfZ3
         2lbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827588; x=1795432388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rROGYk1aEiWG91xI09CLyS+cm7Q+TGC8+ehzSxVtxO4=;
        b=TIx/d/4MhcKGZlBtmNUB2wExqOvI1cJtJWQ8ElT0EypiUQwuzpEnw6YDvRtLBFPv1x
         XP6PcI8vsX2x1DgFxtUUOO+7jsWLOR+UNdQfjJZWYxpqgD6lQRUGopzVQogrc7EbfMtV
         fcsx82wmrYS94vrPafcT3XFm+v8TGRohLnXQKX3ZBnnp8n7LPQtjAhT5LjawuW68Csyg
         1Ufd+RvzyP/k4EuQ7NCcqPVXSIxO7VojKcXL5TW8ngYz8Tle1YSsq9gsnS8q/iVTRFJ0
         oUK3aLKzYz7idiiz484Lxyn+ggzNZCTa3/81knulKL7nQUd46CMpbzYnzgwACpnTj+xF
         5UZQ==
X-Forwarded-Encrypted: i=1; AL+hErHDpuAk8YRzq7rJ/oOBEQWQLR4mBaM50Oh1E7YSLNGrfHE8uSFZ4JB9tuHKAKnHsgVfjFFy4iVtg6hhaUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jhud/Rrvw9n8rNx4CDyUKTIV+qm9UdaHhbhY+W7+/MMYaGKAK
	cY6N75dnANVYP96Nv1xZ0t+OZfnRX4g2YUJYxaDs/eFEjjEIaAuc1e7r
X-Gm-Gg: AZFdTZdPJ2qmgZGnL7E2KwOdVBoFCiL5OdruzMVVqfpLGX64RQeFlm3Vwo2gS4Dbmqx
	rlU9GaLwvfDEuWzxDAtctYnyBsGVEf3Ajw3ymenHL5q7JRtYoD9uBNZ4+QVk6JMoZrwDpNXpM0c
	vAHJ37+otEQ0es8v4nj3IvfgWOV0s/5auKaR6pVcBh2qvsjzebvZp7quvtVX15nhcBPikE6dBA6
	dHh3fJh5ZfmWlBkVKinONpWSLvd0N9PwVbVYw9T8HMAZN4rxmOxJKU8vcl2g8kuhu95Uwo04UO6
	JXCeEtlGltT57vs2XAxqfag6X7Sm+i6a2MdVU54xYxVVdGvTG7S3WEnHP5wM37n5NVl/HT2wAac
	mauyWrTV3zdPpMpODSQ27vx3Cg3//p2aDOHSSSHuBHeJlT3pkp5wz13dNoM17xFL+WtDuN85vhz
	AOE9l26pCygkMK5NWzsZEuS1Qmx6FJObuqIoLmShVXiFpWOActx/idWRihv95hMiMT6gyAQ9UIn
	X5yTmkwHakhi9xgFg2JYB49zob0cEEqo7yXjUJbdaR2RZP+55ClHJkkbB1kQRkI2F0qWvL0iUJa
	dTRHwIueo+ZdK6JbJIWXpkOahSoHNfjEHgBSp4uoSWMlZsnnaJaRlUmvp9wGp2KBcP+c/DQPeFX
	5z9rbd41BRBr5ctCImTHA7zS2q6ByOp9EtvCORO9BaC5jHzU/Yok9OkBuDe/I2xRuXQrfN9Blu7
	2dcb4uVLRmqt8NRogf0ZgF7XwJSkw2cQwKGWVHqmmt9KNr+7YeGZSdEMyDor4ETkpGTu6DHwQmL
	jE/5rzB0mcnbB8SrlBO6Zjw8vX2mVvIieONxDmKNz7FolTiiKAC9WR8VJjnHTEdjg==
X-Received: by 2002:a17:90b:37d0:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3b1b0a0d978mr10900837a91.26.1794827587617;
        Mon, 16 Nov 2026 03:13:07 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm21525599a91.8.2026.11.16.03.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:13:07 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	stable@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/memory: mark unshare copies dirty to fix MADV_FREE data loss
Date: Mon, 16 Nov 2026 21:42:45 +1030
Message-Id: <20261116111245.28871-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MADV_FREE in one process can make reclaim free an anonymous page that
another process still maps and never gave up, which then reads zeroes.
It happens with a page copied by an unshare fault and shared by a later
fork().

MADV_FREE and lazyfree reclaim rely on an unwritten rule: an anonymous
folio whose content a mapping still needs has a dirty PTE in that
mapping, PG_dirty set, or a swap cache entry. madvise_free_pte_range()
only checks for other mappers on a folio that is already dirty or in the
swap cache. Any other folio it covers is marked lazyfree once the
caller's PTEs are clean, even when other processes map it, and
try_to_unmap_one() then drops those clean PTEs and frees the folio.

The copy wp_page_copy() makes for FAULT_FLAG_UNSHARE breaks the rule:
pte_mkdirty() is applied only for write faults, so the copy has a clean
PTE, no PG_dirty and no swap cache entry. Unshare faults come from R/O
pins on non-exclusive anonymous pages, for example process_vm_readv() on
a page shared with a child, or KSM unmerging one. If the process forks
after the pin is gone, MADV_FREE in either process frees the page under
the other.

Mark the copy dirty with folio_set_dirty(), as ksm_might_need_to_copy()
does for its copy. pte_mkdirty() is not suitable: on x86 it also sets the
soft-dirty bit, which this path carries over from the old PTE.

Side effect: smaps and numa_maps now count an unshare copy as
Private_Dirty or Shared_Dirty rather than _Clean. The PTE is unchanged.

Fixes: c89357e27f20 ("mm: support GUP-triggered unsharing of anonymous pages")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
---
Tested on mainline b3dfbde62cf1; mm/memory.c and mm/madvise.c are identical
in v7.4-rc3. x86-64, KASAN and PROVE_LOCKING, 2 vCPUs under KVM, no swap,
as uid 65534, with only this patch applied.

The test gives an unshare copy to a child, has the parent MADV_FREE it and
a control page it alone maps, then waits for reclaim.
- without: "test page in the child (unshare copy): present 0, 4096 of 4096
  bytes wrong"; an ordinary shared page freed the same way stays intact.
- with: the child's page is intact, the control page still discarded.
Same two results on v6.12.117, there with folio_set_dirty() placed earlier
in the same function. No KASAN or lockdep report in any run.

Two other ways to reach the same state are known and unchanged here:
khugepaged collapse to a sub-PMD folio in a non-writable VMA (covered by
"mm/khugepaged: mark a collapsed mTHP dirty"), and a swap-cache-skipping
read fault in the stable trees that still skip it. Checking for other
mappers in madvise_free_pte_range() covers all three and passed the same
tests, but changes MADV_FREE for every shared clean page.

 mm/memory.c |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index ec3d9d99ccee..49f6dc92c020 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4130,6 +4130,14 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		entry = folio_mk_pte(new_folio, vma->vm_page_prot);
 		entry = pte_sw_mkyoung(entry);
 		if (unlikely(unshare)) {
+			/*
+			 * The PTE stays clean, and pte_mkdirty() would also
+			 * set soft-dirty, which is carried over below. Mark
+			 * the folio dirty instead: MADV_FREE and lazyfree
+			 * reclaim may drop a clean anon folio that has no
+			 * swap entry, even one others still map.
+			 */
+			folio_set_dirty(new_folio);
 			if (pte_soft_dirty(vmf->orig_pte))
 				entry = pte_mksoft_dirty(entry);
 			if (pte_uffd(vmf->orig_pte)) {
