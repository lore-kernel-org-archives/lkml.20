Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972477;
	b=zgaLMmOZ07Yi9OKPnimg5PIxdX0IUYwbNvlikIqVZKLYESkqRPDMy+bmi/Pt2vdkbSyN
	 Egj1f49a2Zo+HamyNJZ30qbEgGWgud3TP4U1OLAVtuZQl/+rnOhJJ1tPIBc5WqwdGPkhy
	 vCmtpqRaSpf0LVZ0jvR2zwD8VPtTMwVzVFdWvWF1EmalQny9WjPqYLp77vEnnYZPacYzf
	 L+A1oFjL/Yp0QYrHPaBGYTPKAAdVoMDYsQXtjrKmDX17x/+YAU9X+G16zaA5LfOS2d1kk
	 BTA/p0YcOj6gT6XkWJjKvfjPfOPnitvME2lEY3uvmvEZTbCtCGM0M3JKe0/CYKKRySQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972477;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=HHFIxXCaPKga6nPstJLsXOx0R+aPE2/7Ghw2d3Thvuw=;
	b=hxkJUcty9vZUxpfBv9H2wyMsp7KTzXC9dqzZ4cnEjT3idsmtjnmdY3e52SLKdD+be+xT
	 Uw9INo56wuKj3nRHP/xxFfyQlUm9/ww3NqCsruTuIVUjKYNwoa6/GoXfEi6jncnmFdPmM
	 MJB2jbgixLXnpC7oLzgToOAiD/XM4b83KE7+lh057X53iiSBa0bEkielanEqZoubw4O22
	 l8/4SZFCMj815JblNiUbh+3manD0lwha/Ts/GnpbxqR1cEJxC+lxMmTm2vme6J+wqnmX8
	 dgzMFgSXE1/oJv43Nx4cKL72XIjCPDnUAPX8C+Fw1nLDpbC3i3VllQz5AzTkKT6IV6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ohy/Uv2X";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE86606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ohy/Uv2X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAC81F008A2;
	Fri,  6 Nov 2026 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972476;
	bh=HHFIxXCaPKga6nPstJLsXOx0R+aPE2/7Ghw2d3Thvuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ohy/Uv2Xn6cZr1BQO04HDnuf9F9hXH4bbG13mgGK+uEaX99pzL+8LGjEaZK9xonc6
	 dcj6+HU/7U83GKlsug5UpdM+5OOaBLHZMAKDa5G/iKf2ikGdT0sFZ/OgD5vhaCGJUq
	 ZJMbJ1buuTF886+naEextcTxGecsTV2+AMbInBtm21McjG0qvbkEfMKxts1eRXDriP
	 LzRUV28F+kSdxYqNQWqJG8boUDQEVVvO6pK9RPfxaYUBw4koy1WRXhBI+Bc1qA24aS
	 K4QiG3QEHfNqcfrXDqWfbPg+1h6nWV2e3gKrWUn9RClP6IE/UUKgkxOctvbSSdMCN8
	 5FIXRFLz596Ng==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id 0C615198003A;
	Fri,  6 Nov 2026 08:41:10 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 06 Nov 2026 08:41:13 -0500
X-ME-Sender: <xms:9tjtahZPGgf_7Mahm6dyFWAiSzOyaPpJy0CJdd2KQR4SLi-gJSQr2Q>
    <xme:9tjtak3xGIlKg3ClGZx_nuLlEK-8f8vHVnOEbsvt6_mjfnUWH0YRMeNNfa2AIwbH_
    exb4qCSdi362NzQOfR2Eo3Qw0qqwd1JZfRou4W8qissDxgyEyCAuFeEJg>
X-ME-Received: <xmr:9tjtarM2RAzkloEnmJErFCGFZPTJdgRBXz20R1fjUAsMiOKwgdL64BcDjpo>
X-ME-Proxy-Cause: dmFkZTFVFaqrxdMA0Rdrdmsp+IP9B9mG/dxHIufxIo+xMkIcBSnN5hVLhkUBVzyjEV4JdK
    Bq8Vi7aogF17ZTGXov2XvAZgFCDHIzZ1XEMCali6ZPDPHgz81JW+gZfwpkmHRh84E617rC
    ahx81ZCaxhS+gJdFDJHUghjaitiOxaZlDtB9yoTdxdwNZEwU7fgFbA0LirO/asuE/CuRCW
    9U41q6izoAvPbSw1lF0KFBqKm4Q8PzBRTNxmqm/BVcpVogZmMFoTujTVS4zbZTjDyjc3bw
    v61ycqyrVpQGPm8Q1YhBM79/LSXec2moRI22lkXKfGd03YJNu+S+2c7N0OvVF6uO48jTrM
    fFIL9grvdTdMUrD2C4QZUqgAWZCtyLtK9B2jZ4goPrhuzTNJUFDDE7ZcFLlTg1mNZAPs1p
    +X7thflt3GXGXPKYGweuPvUhOtUGHOvsnPFXPnl/LS6whsO77murx4EIu/9cMeqg7JG6+c
    of/qkUbAzxKd9XHYtpZHF6l4M2cYrAc9bnBsEqk6PCiT7YfcFvCeMW0+BXLs7LJV7sMh3z
    5UMEQit26OJygfOSJtXIOVP78gP7LsNPGlN9dvAeB7IwvncyiDGYLJLYjuqqaqVYRdUocr
    sTna/nVF3l+i7zzPA3K75Sl+8L9syB21FOm4TZNdzoYe5KTaE8phGK5MIqEQ
X-ME-Proxy: <xmx:9tjtamI4ieZk2t1h2e7TrdxSr8WRa0nkLNU6y9HkZOc4xn6p54IiOw>
    <xmx:9tjtas5yULsRxxSgzHZEkdMMZNXYy6NCoZQYeZQAQSbgmhCIou9o7Q>
    <xmx:9tjtarTszdhzO2TYo4wyeMrDKRgx39K026_RI1D6gGbKDq5bU0pcUA>
    <xmx:9tjtand1KXXf_qlaCXE5vPXegDRYcgMQ20CkK2kpRZTN8SVwogP7sQ>
    <xmx:9tjtak1wrj_BF14J7-J0wDrZQD_zvCfvlmvdV9QWVsVih_sWxdRgb013>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Nov 2026 08:41:10 -0500 (EST)
Date: Fri, 6 Nov 2026 13:41:09 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Hugh Dickins <hughd@google.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Zach O'Keefe <zokeefe@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Chris Mason <mason@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] mm/khugepaged: don't map folios that are not uptodate in
 MADV_COLLAPSE
Message-ID: <au3YD92l6BwCQIPJ@thinkstation>
References: <20261105-set_huge_pmd_uptodate-v1-1-a78d8a1b7117@kernel.org>
 <au3C8lNElGg4LnR1@thinkstation>
 <254c6f0a-9353-4806-a5ab-a071cd59c64f@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <254c6f0a-9353-4806-a5ab-a071cd59c64f@kernel.org>

On Fri, Nov 06, 2026 at 01:29:31PM +0100, David Hildenbrand (Arm) wrote:
> > Separately from this fix: nothing on the mapping side catches this.
> > Every caller checks uptodate on its own (next_uptodate_folio(),
> > filemap_fault(), shmem_get_folio()), and khugepaged was the one that
> > went straight from filemap_lock_folio() to do_set_pmd().
> > 
> > Should do_set_pmd() and set_pte_range() assert it? Something like
> > 
> >         VM_WARN_ON_ONCE_FOLIO(folio->mapping && !folio_test_anon(folio) &&
> >                               !folio_test_uptodate(folio), folio);
> 
> I think so. But looking at these hard-to-trigger but in the end very nasty
> problems, should we actually reject the operation and do a pr_warn_once() or
> something?

Yes, rejecting sounds better.

Not in set_pte_range() as I suggested, though. Fault-around only gets
there with folios that next_uptodate_folio() checked under the folio
lock, and for CoW it maps the new anon folio after do_cow_fault() has
already copied from the page cache one.

Checking the folio ->fault() returned in finish_fault() covers PTE, PMD
and CoW; do_set_pmd() covers khugepaged. Both return VM_FAULT_SIGBUS.

Something like this, only compile-tested:

diff --git a/mm/memory.c b/mm/memory.c
index 6fe0b7dab927..ff2f2deff761 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5674,6 +5674,22 @@ static vm_fault_t __do_fault(struct vm_fault *vmf)
        return ret;
 }

+/*
+ * A page cache folio that is not uptodate holds data that was never read in
+ * or cleared, and mapping it leaks stale memory to userspace. The callers are
+ * expected to check, so treat a hit as a kernel bug and refuse the mapping.
+ */
+static bool file_folio_not_uptodate(struct folio *folio)
+{
+       if (likely(folio_test_uptodate(folio)))
+               return false;
+       /* Driver pages from ->fault() never get PG_uptodate */
+       if (folio_test_anon(folio) || !folio->mapping)
+               return false;
+       WARN_ONCE(1, "refusing to map a page cache folio that is not uptodate\n");
+       return true;
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void deposit_prealloc_pte(struct vm_fault *vmf)
 {
@@ -5714,6 +5730,9 @@ vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *pa
                return ret;
        page = &folio->page;

+       if (file_folio_not_uptodate(folio))
+               return VM_FAULT_SIGBUS;
+
        /*
         * Just backoff if any subpage of a THP is corrupted otherwise
         * the corrupted page may mapped by PMD silently to escape the
@@ -5849,6 +5868,16 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
        unsigned long addr;
        bool needs_fallback = false;

+       /*
+        * Check the folio ->fault() returned. For CoW that is the source of the
+        * copy; DAX CoW has none.
+        */
+       if (vmf->page) {
+               folio = page_folio(vmf->page);
+               if (file_folio_not_uptodate(folio))
+                       return VM_FAULT_SIGBUS;
+       }
+
 fallback:
        addr = vmf->address;
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
