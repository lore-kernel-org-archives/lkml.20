Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823809;
	b=FuDcf375xs0rWUzCJnZfoSYgHh+TXC+n8wqUf1Tdhgx9y5cjFPow7vvA0NsFV6oe/7az
	 5yV2+0Ur/iueQ809dQuuacUvYMj9eEpN5egH1tc8VtFbHPwjTSyXbZAZTMQpSMkQVdz6/
	 hhhJTXZwRxQ4rQNQi+yGU2HLiQw1NdrPVqnv0HRSWGOva9g6wsjJiGHnWt4mUZKLH2f3T
	 MTiIEEnNtnYwbh+P3MWOFgWC66E8yFNmI2/tsi96RJZhCJRtffstc7Ns6ZXh/BMTxzp8o
	 jam/LR3mG9jLgvVJPX0fXgyuKC4DK0r4BYtQKNqFsi//DKME8omF6ImhTwLX4nVv8Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ww1H1S9hrHisj8WmixCX+JG9UibSCui1VAe7NK53FuE=;
	b=Ww9NtlbbOt81LcSnZqEXJ2ek0Qlu19ifcRQXszju1RFMQL2Ed/1Lal1F2qu2zHD6KBSi
	 w+2e87vhYrdfuasebmW0OUq/kon6raKBImxoYOH1UW5e/b1kj6na+dsgoDOhbx61t+/qL
	 b69tV21SRbc1c+P9WgoGXhs9GZ7JhukPAjqjFxESWOULCHJJsl0OleKHNVQXubfY/FhFO
	 mFBE7Y7byqZbmyd1YayPId3JXslGAseZzR1l0D7q0NeLbZirgtRXlM+VATtD+kwAn6bUp
	 bznMYjxOet2oB4v0HXwsHcTS0ALbenjED65/mp50SVqFVupvdYfHjHHhJumWkAhXMTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n9+SAV2A;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F79606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78F79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n9+SAV2A
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so26037195e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794823808; x=1795428608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ww1H1S9hrHisj8WmixCX+JG9UibSCui1VAe7NK53FuE=;
        b=n9+SAV2AeNM1sBkSKO/QF9jwB4wshL4PVR/ptInzb+/xQz3IvnDg8ph7q9TEk2kR27
         7wz5kwTO30lGDsVkrzVBC0H9j92Ef/DCzR80lHdpuBYTxd0nOlAvV92+5jDHUyCWkB0s
         0QF3Kj7MBGGb6T0IOm+E8y7piX5FS8km1Uc8oTIs1mf0lkYqDBB+ucWxIW+ypYmM4Zfa
         3cmZFGZ59TROHzG2jyOROjtfVUjSyMScHoF+SPsQRt9mNi6y123iFBYM1+1DY7oudlBH
         kGpqD3yufz50Z8Z3PTMejLQi834N0xVXVeo6kFqAgD2Ex3zsxrcd8d8CxKn5Q/I9vHuD
         ukTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823808; x=1795428608;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ww1H1S9hrHisj8WmixCX+JG9UibSCui1VAe7NK53FuE=;
        b=uc2oP8ezuHlDRZaEMW4z33enM2K4ndtrEFLhRr/fq/8Wo+fXZET3DOU645SYLC8z/W
         BkGzqiwJ3MXsxaCHSOVU0OordZTYEGSs+HQcTvIiIOJ572IiAZDQ2MRNQw7BzCQ3UxhW
         68Lr1O3j6/7cVgEwLJXh+fAarC7c2iqoKQ9dewk+LGdL+FcjHM65QZEobnKBbE+BON5o
         PzdUNXVvlGvigEc/6lJPmho8x+Hw68yUSRZSCc02A2mshxE+rK8tvfw+K0adoJzMUEvh
         4xZWwRxvjk2pnahQYfFbK7j9nWmuhL7RtL58b/DO/wtAuBDCUMwUTz56Jqa2/UrWbLiE
         1pOw==
X-Forwarded-Encrypted: i=1; AL+hErHikjNUOJXB4uolte1pu3h3H7tI9Qhog7mKpBtjmODk3WIMm2abDqBZ4oY0RWG0+Yp229//1Gp8qvwVpR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z99Qx7BanbZJrV5yGCZ1XHWoRDO5NnjbWNlmrD1HhOofFEO3fNC
	abLLYL25gMVgNUL0a+9b0qHECjIvZ+3HT3Oa4UO4oGzy7HrGlBTpecHB
X-Gm-Gg: AYBFou3ts/0ssay9sWKRQUtUJCEWOs++5iy1gV0V1jdFfFKBO8O6eVjS4gqDCu+V/Ub
	PqHMbjGmViyoOd7KTrzV/5T9QoHERzfe8pzq7MpK+Gjw0mErHcUl8twW85Ce7gIDJWe3DcbHVNU
	JmKN4HwyygPIPpRKpzFZbE4sQv9sCvRRFF3e3MnsMBMa4GpdVVQKA8tJvRvvKD5TPso4ae3943C
	rXmhfen2bjaRJ1wvBFXLk7cJd6nlaaXt188lA+Bldn8bhNE+ctJWho825P4ibFonogFomz8vHRr
	BbQjiY5scw1t3QcV7PxE6gjkxUueP2BoqJ26qxxnCbHRklGGNqYeab8UbsG9OZ28bIESykHc6HO
	BaEMg39Kc7riPrjvkeNplXAUbzWXCid7vBAHEcrFW3AmQLnOylwNIwqEKf7EODgnAiQq7NE3VUz
	inlpm69xcwzEHFzeDjeHKAE9joWTWhfBwDZowlGw/3vsv8BbMcv8meTSXqi/50Mw6QKpG2mEVyZ
	jnk9bQztorLIlCFckhIx5siHEkLIkxYCYuMvQThqVNk+pCREuaLNf+ZwIt0CavYThcKSxy8lQHP
	ufdBOSqBk+Sr0wZgE7QM
X-Received: by 2002:a05:600c:544:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb55a662f9mr135927565e9.10.1794823807538;
        Mon, 16 Nov 2026 02:10:07 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2cd05sm19224289f8f.31.2026.11.16.02.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:10:07 -0800 (PST)
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
Subject: [PATCH v2] Documentation/userfaultfd: document RWP behavior when the PTE is dropped
Date: Mon, 16 Nov 2026 11:09:56 +0100
Message-ID: <20261116101004.15322-1-azpijr@gmail.com>
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
says the range has to be re-armed afterwards. On shmem the kernel can drop
the PTE at any time (page reclaim and collapse are examples), and RWP has
no marker by design: the next access is a minor or a missing fault, and
the user is expected to register for those. Document this, together with
the modes that sync and async tracking need.

The VMM example registers guest_mem with RWP and MISSING only, so a vCPU
write to an offset that is not mapped there can be lost during eviction.
Add MINOR to the registration, describe how the handler treats faults on
offsets that are being evicted, and fix the step 1 comment, since minor
faults block even in async mode.

Link: https://lore.kernel.org/linux-mm/856cdf21-7982-475a-b244-a7ceff4eb6aa@kernel.org/
Link: https://lore.kernel.org/linux-mm/avWnaR7VVEGa7yNp@thinkstation/
Suggested-by: Tal Zussman <tz2294@columbia.edu>
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
Changes in v2:
- keep the migration sentence out of the anonymous-only paragraph, it
  applies to shmem and hugetlbfs too, and say "uffd bit", not "marker"
- state the rule instead of listing the operations that drop the PTE
- say that a context switching to sync with UFFDIO_SET_MODE needs the
  sync registration, and fix the step 1 comment, since minor faults
  block in async mode
- add {} around the comment-only if body in the example
- make RWP and minor faults on any offset this pass will evict wait
  until that offset is punched

v1: https://lore.kernel.org/20261113112806.109578-1-azpijr@gmail.com

 Documentation/admin-guide/mm/userfaultfd.rst | 88 ++++++++++++++++----
 1 file changed, 70 insertions(+), 18 deletions(-)

diff --git a/Documentation/admin-guide/mm/userfaultfd.rst b/Documentation/admin-guide/mm/userfaultfd.rst
index 97daea83b7f1..8d1aeef73ac2 100644
--- a/Documentation/admin-guide/mm/userfaultfd.rst
+++ b/Documentation/admin-guide/mm/userfaultfd.rst
@@ -384,17 +384,53 @@ normal missing path (``do_anonymous_page()``, ``do_swap_page()``,
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
+Protection is preserved while a page is temporarily replaced by a
+migration entry: the migration entry keeps the uffd bit, and the PROT_NONE
+state is restored when migration completes. This holds for anonymous,
+shmem and hugetlbfs memory alike.
+
+Protection of anonymous memory is also preserved across page reclaim: a
+page swapped out while RWP-protected keeps the uffd bit on its swap entry,
+and swap-in restores the PROT_NONE state so the first access after swap-in
+still faults.
+
+Any operation that drops the PTE also drops the RWP protection. On shmem
+the kernel can drop the PTE at any time while the page stays in the page
+cache or in swap; page reclaim and collapse into a huge page are examples.
 Unlike WP (which persists via ``PTE_MARKER_UFFD_WP``), there is no
-persistent RWP marker today. The user needs to re-arm the range with
-``UFFDIO_RWPROTECT`` after any operation that explicitly frees PTEs.
+persistent RWP marker, and this is intentional: once the PTE is gone, the
+next access takes a page fault that userfaultfd can deliver, and that fault
+is the notification. Which fault it is depends on what happened to the
+page:
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
+
+The registration is fixed, but the tracking mode is not: a context that
+switches to sync mode with ``UFFDIO_SET_MODE``, as the workflow below does,
+needs the sync registration. This has a cost in async mode, because minor
+faults are always synchronous: an access that takes a minor fault blocks
+until the handler resolves it, even while RWP faults are resolved by the
+kernel.
 
 **Fault Handling:**
 
@@ -484,17 +520,24 @@ never traps on its own ::
         .features = UFFD_FEATURE_RWP | UFFD_FEATURE_RWP_ASYNC,
     };
     ioctl(uffd, UFFDIO_API, &api);
-    if (!(api.features & UFFD_FEATURE_RWP))
+    if (!(api.features & UFFD_FEATURE_RWP)) {
         /* RWP unavailable on this kernel/arch -- fall back. */
+    }
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
     while (vm_running) {
-        /* 1. Detection phase (async -- no vCPU stalls) */
+        /* 1. Detection phase (RWP faults async, minor faults still block) */
         ioctl(uffd, UFFDIO_RWPROTECT, &(struct uffdio_rwprotect){
             .range = full_range,
             .mode = UFFDIO_RWPROTECT_MODE_RWP });
@@ -544,11 +587,20 @@ never traps on its own ::
                   .enable = UFFD_FEATURE_RWP_ASYNC });
     }
 
-During step 4, a vCPU that accesses a ``guest_mem`` offset being evicted
-blocks with a ``UFFD_PAGEFAULT_FLAG_RWP`` fault while the eviction is in
-progress. After ``fallocate()`` punches the page out and ``UFFDIO_WAKE``
-fires, the vCPU retries the access, faults as ``MISSING``, and the
-handler resolves it with ``UFFDIO_COPY`` from storage.
+During step 4, a vCPU that accesses an offset this pass will evict blocks
+with a ``UFFD_PAGEFAULT_FLAG_RWP`` fault, or with a
+``UFFD_PAGEFAULT_FLAG_MINOR`` fault if the offset is not mapped in
+``guest_mem``. The handler leaves the fault pending until that offset has
+been punched out, even if step 4 has not reached it yet: resolving it
+earlier would let a vCPU write land between the ``pwrite()`` and the hole
+punch, and the write would be lost. After ``fallocate()`` punches the page
+out and ``UFFDIO_WAKE`` fires, the vCPU retries the access, faults as
+``MISSING``, and the handler resolves it with ``UFFDIO_COPY`` from storage.
+
+Faults on any other offset are resolved right away: RWP faults with
+``UFFDIO_RWPROTECT``, minor faults with ``UFFDIO_CONTINUE``. A page mapped
+by ``UFFDIO_CONTINUE`` does not carry the uffd bit, so the next scan reports
+it as accessed.
 
 This workflow targets shmem and hugetlbfs (both support a private
 ``io_mem`` mapping over the same fd). Anonymous-memory backings need a
-- 
2.56.0

