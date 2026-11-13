Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569294;
	b=pGH0QEKh9irwRYTP8hquc1JsvUhn3JDkibNL9WfcNhgVnrFVXb3u6gvmlageD379QX1T
	 KtVfB8H/0Yyddh1UTpFxirvpf335sYYPd22Bm93RoXW8OHagAVfbGfbJb6cOuFGZQWsz3
	 BUudjFJRniFknnuyFuhFbyEajviBbVDoCaAmfVzJWIVZSvDN2crEDDUePIsy1vWyVt/6e
	 8As63ZvJ5Pl3hX+gNlaPmOCmz9X1dejc9dargjEfQcV9IQuz4oaG5s0E15cdhcY2gcIg2
	 mc54G7dIvsBR1yMY9zMFx8k8lSCIrFuOehuJlbbk0JmgTXX1hf4ddx6XdjAT5WdLvnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/0hFdLUUBMubQi9ZZLh74tQ0C+rY0zzfWhh+F7mlSYU=;
	b=oRjjqCEvR6QpOe9jG3WlXCMSUZyv69nuGIogL4itovsOqzHlLERXhoMP9YMhJAxvfqna
	 Hra4M/OUJE7zi4WCUs8jRNuY4nOR5WhsB6hjKwT8/3ZYCcIK0QcQJAfAjdzwVA5xa1a5l
	 t2wNjQVl0j5dX7ssk9fa6SZvQwkScRjmx2dX+k8txKZBd5uZwMiY/oTv5X7bxvpCysBxB
	 ptGhqmThy4G6SN5pLfqp/Y0dIkZfD/gnWxvStOspGoY504fjjxKBhF3i0kNPJW7j82pef
	 C6+VbtBxu/VngeIDdwXpExH78LDskKW3VEJ/r/6KsGoqODhcOOk7Kqdx6898H/U0euA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Nb9Vr/jI";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CC4606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92CC4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nb9Vr/jI
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so5641885e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794569292; x=1795174092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/0hFdLUUBMubQi9ZZLh74tQ0C+rY0zzfWhh+F7mlSYU=;
        b=Nb9Vr/jI7+IuNc/+SwtDXA4rDxVd/FSO1D8SAuF3dNjS98p9gcQX29pKO9uA/isGTz
         oiWzIoZ+uLHtD/9s0flk2+s4YKkf2NfblXxSY2ZketonWfN7fNgUUeCA4A24mc8JW66j
         NSsqExUqDIZ4qQ10a1bZtAUMToInJUaWSZzCcpBF6lf6rQNUTxNdem0sDjLZlCLKomDY
         kGU76SxdTVCCONEMEwKLgqUDHqQkzvpE4pKuJzdHVGDQ+BlD983r+89sVTO/ilCvlQ8j
         4HAP2yNhQ5gpK7sy+kV5hc0Xd/1NT8HZdM247Zzra9gmzb4Ybaj907HYRG/UymSRYdGd
         rpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569292; x=1795174092;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/0hFdLUUBMubQi9ZZLh74tQ0C+rY0zzfWhh+F7mlSYU=;
        b=mI7YWDYy3x1OphElxuIxP8sIGKHEtfRYW9GzWfw9+/NSKLnZ2FEqWYo8PdEYaViym5
         /xOs9ppm0ARBrJTS8qcpAY+Dgm/dYiYOHp1X93Vy93Ci7ldwh4TPTj/IPa2sP8W370uY
         DalNrCyGE+ZORF9QWAhMtKWKbWNeMic0UHuqubfKbK9Z9qnSElX/HN/yPJKwnEgUe04D
         srk8rbDTfoEZyW+W0+LtlyqNB/qChrL30BU0xWA6qB0E8eRmaUNhIjHufG/yYRZac/t/
         IyQSjvDOCHh92sEfgxEy+ZPWa4vv/KMd2DP6OC91YTgBkXcJ7BMEt46oKE726Gvvac3j
         SkVQ==
X-Forwarded-Encrypted: i=1; AL+hErHdcH020Cishaz6sayd6MyrdBt/QfEnHiPMTdSB3O4xnfdynYzMwoCAZ5DIBm6S2Iuj0qCOAAaFfIvCzdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tV+8p2x1BpEE3u3p4Wm6lDldM606lPFM4SHASC8YN8jrJnN+C
	2fZYDgdHDxNlNVtZHnyyNRHusZsEQ3uGNRx8CoHXrqGvo7gH13VfYHx1
X-Gm-Gg: AYBFou3VJ6SEaX/slQifBLeiisBgrhg8sOnWbdZbYK9dmKXZ57InQzjXFIaUmiLEssz
	uKoU3KS9cqNDUlEZO+CNA2NRM8sAoWrFueZdT/19EEdlTSYjjxw5/e+hIbTu9dYy6WFakdR8kYS
	kGfuOX7hdnj5nN95hwjGD96at6315oitQ54XvbvKrBYLLAKsLsXaHH7Br72n4p8nQvUJ79IZtZo
	bZHhtHgn4VUvijJ8rOtk7oCtP9hh8Hlg127XIhAMq5rqmdf0gFZNHyUYOrEcFGHULWZc3O6lo/L
	Ih1OCl2VOqgZJsgrCwLcFuwsNisiQtFlJ0RXcHiG60vYbxyGLYtKHIcby1tw6eM1HyTVQQh+J4p
	Fr42QqBJUFdlmupZei2IJl7fwOtLJX0R1jzhiQwOJVyIwT+TVs9YHrFI8kVQRdZbXDEGKF+FUK+
	Wc2wuVYt/V/juW3ssTrPO6Jb7PHBHPfePPQxJMRJpR7JWCZZLHL+Ptn/jmhzIhsboPOanl4qq1a
	nPdbkHj6Ri2Nj4l1u0GAKggi7pXdNutbR6oHQuNryTUg4UEE/JXOLs8RlsMTzJ2N1lAshNKlAxl
	LOZgXVMPuk6NBw==
X-Received: by 2002:a05:600c:3e17:b0:4bb:53e4:a7c8 with SMTP id 5b1f17b1804b1-4bb55aa27cfmr44169585e9.22.1794569291720;
        Fri, 13 Nov 2026 03:28:11 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56680ea9sm35107545e9.0.2026.11.13.03.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:28:11 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Peter Xu <peterx@redhat.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kiryl Shutsemau <kas@kernel.org>,
	Tal Zussman <tz2294@columbia.edu>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH] Documentation/userfaultfd: document RWP behavior when the PTE is dropped
Date: Fri, 13 Nov 2026 12:27:42 +0100
Message-ID: <20261113112806.109578-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"Scope of protection" lists only the PTE drops requested by the user and
says the range has to be re-armed afterwards. On shmem the kernel drops
the PTE as well (page reclaim, collapse), and RWP has no marker by design:
the next access is a minor or a missing fault, and the user is expected to
register for those. Document this, together with the modes that sync and
async tracking need.

The VMM example registers guest_mem with RWP and MISSING only, so a vCPU
write to an offset that is not mapped there can be lost during eviction.
Add MINOR to the registration and describe how the handler treats minor
faults.

Link: https://lore.kernel.org/linux-mm/856cdf21-7982-475a-b244-a7ceff4eb6aa@kernel.org/
Link: https://lore.kernel.org/linux-mm/avWnaR7VVEGa7yNp@thinkstation/
Suggested-by: Tal Zussman <tz2294@columbia.edu>
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
this is the first time I'm writing documentation, so I accept any
suggestions to improve it :) and I tried to follow the documentation's
own style.

 Documentation/admin-guide/mm/userfaultfd.rst | 65 ++++++++++++++++----
 1 file changed, 53 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/mm/userfaultfd.rst b/Documentation/admin-guide/mm/userfaultfd.rst
index 97daea83b7f1..19bdac668f93 100644
--- a/Documentation/admin-guide/mm/userfaultfd.rst
+++ b/Documentation/admin-guide/mm/userfaultfd.rst
@@ -384,17 +384,45 @@ normal missing path (``do_anonymous_page()``, ``do_swap_page()``,
 the population itself, co-register the range with
 ``UFFDIO_REGISTER_MODE_MISSING``.
 
-Protection is preserved across page reclaim: a page swapped out while
-RWP-protected carries the marker on its swap entry, and swap-in restores
-the PROT_NONE state so the first access after swap-in still faults. The
-same applies to pages temporarily replaced by migration entries.
-
-Operations that drop the PTE entirely — ``MADV_DONTNEED`` on anonymous
-memory, hole-punch on shmem, truncation of a file mapping — also drop the
-RWP marker: the next access re-populates the range without protection.
-Unlike WP (which persists via ``PTE_MARKER_UFFD_WP``), there is no
-persistent RWP marker today. The user needs to re-arm the range with
-``UFFDIO_RWPROTECT`` after any operation that explicitly frees PTEs.
+Protection of anonymous memory is preserved across page reclaim: a page
+swapped out while RWP-protected carries the marker on its swap entry, and
+swap-in restores the PROT_NONE state so the first access after swap-in
+still faults. The same applies to pages temporarily replaced by migration
+entries. Shmem is different: reclaiming a shmem page leaves the PTE empty
+rather than installing a swap entry, so the protection is dropped along
+with the PTE.
+
+Operations that drop the PTE entirely also drop the RWP protection. Some
+are requested by the user — ``MADV_DONTNEED``, hole-punch on shmem,
+truncation of a file mapping — and some are initiated by the kernel on
+shmem: page reclaim, and collapse into a huge page by khugepaged or
+``MADV_COLLAPSE``. Unlike WP (which persists via ``PTE_MARKER_UFFD_WP``),
+there is no persistent RWP marker, and this is intentional: once the PTE is
+gone, the next access takes a page fault that userfaultfd can deliver, and
+that fault is the notification. Which fault it is depends on what happened
+to the page:
+
+- The page is still in the page cache or in swap: the access is a minor
+  fault, delivered if the range is co-registered with
+  ``UFFDIO_REGISTER_MODE_MINOR``.
+
+- The page is gone: the access is a missing fault, delivered if the range
+  is co-registered with ``UFFDIO_REGISTER_MODE_MISSING``.
+
+WP cannot use the same scheme — a minor fault would trap reads as well as
+writes — which is why it needs a marker.
+
+Without the matching mode the page is mapped back silently and without
+protection, so what to co-register depends on the tracking mode:
+
+- Sync mode: the access would be lost. Co-register shmem and hugetlbfs
+  ranges with ``UFFDIO_REGISTER_MODE_MINOR`` (and
+  ``UFFDIO_REGISTER_MODE_MISSING`` if the file can have holes), and
+  anonymous ranges, where minor faults are not available, with
+  ``UFFDIO_REGISTER_MODE_MISSING``.
+
+- Async mode: neither is needed. A page faulted back in is mapped without
+  the uffd bit, so ``PAGEMAP_SCAN`` reports it as accessed.
 
 **Fault Handling:**
 
@@ -486,10 +514,16 @@ never traps on its own ::
     ioctl(uffd, UFFDIO_API, &api);
     if (!(api.features & UFFD_FEATURE_RWP))
         /* RWP unavailable on this kernel/arch -- fall back. */
+    /*
+     * MINOR: an offset in the page cache but not mapped in guest_mem
+     * would be mapped back without a fault, and a vCPU write between
+     * the pwrite() and the hole punch in step 4 would be lost.
+     */
     ioctl(uffd, UFFDIO_REGISTER, &(struct uffdio_register){
         .range = { guest_mem, guest_size },
         .mode = UFFDIO_REGISTER_MODE_RWP |
-                UFFDIO_REGISTER_MODE_MISSING,
+                UFFDIO_REGISTER_MODE_MISSING |
+                UFFDIO_REGISTER_MODE_MINOR,
     });
 
     /* Tracking loop */
@@ -550,6 +584,13 @@ progress. After ``fallocate()`` punches the page out and ``UFFDIO_WAKE``
 fires, the vCPU retries the access, faults as ``MISSING``, and the
 handler resolves it with ``UFFDIO_COPY`` from storage.
 
+The same holds for an offset being evicted that is not mapped in
+``guest_mem``, except that the vCPU blocks with a
+``UFFD_PAGEFAULT_FLAG_MINOR`` fault, which the handler leaves pending until
+the page has been punched out. Minor faults on any other offset are
+resolved with ``UFFDIO_CONTINUE``: the page is mapped without RWP
+protection, so the next scan reports it as accessed.
+
 This workflow targets shmem and hugetlbfs (both support a private
 ``io_mem`` mapping over the same fd). Anonymous-memory backings need a
 different inner-loop strategy because the VMM has no way to read the

base-commit: 31a696f9c37defab0f28f774e00ac7f135889ec3
-- 
2.56.0

