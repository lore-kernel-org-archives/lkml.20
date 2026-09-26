Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D449D3403E3
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790406703; cv=none; b=cbaEhpzO7aktmrf0LjaZKurbKKRCHUfpzqhQ76nP2kVX+8yBflHawHuuxqWLHf3qbOfHYKhMYdUzUTMyOGbVd1h5VPUQR63B1CZnX2klU3sGLBy5NIFl5n5l/ZEO+lL9bVJ2Ur2EqeDrLrHHFMa0uMbfoir7x6OAHIo76zLJMTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790406703; c=relaxed/simple;
	bh=PtlgsNXnmfis3ceY240pb1ELF3pamHCPllFSka5A5+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvRSsvGD6lZBxHi9Yl9GVVPlJB6cN0SPV7IYtdsU7GiVp1LxLU7UJ2tTigRb2uuEd/Kp5usPuWtot6hw3prk/Fi5qaGSq5j5zXVYBM19HKpgo4JRoDVGttNVWtzM38I4S3Mmj3A5bujdptubxW6ZfO8xe3i0p0ymOxnY3bw+0ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnlhIxjb; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnlhIxjb"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-881d9da69b1so26366b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790406694; x=1791011494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1uflVYidz7MNBUBcoHSIOw+jh4ssEiqibOfcA56ewY=;
        b=dnlhIxjbeka0hiFEsy6IJsk6y0sXeZ4a7i+9tX+GS0hO61X7cJ0MVk48JjuAkKH19X
         9ZDxu5p+fq6xnO6CtNqdRVeaMqjhC/AQmihuP7UJYHCSqbG4gH75Po1NpSNtiPbl3CMR
         zghf1iKF8ibP+YogLazMlaXXBsyBHPoDMyRQ9lPAXBYLm8OAGiCrumL/R5Z5wBkRtCEe
         IGoJa6hmlbTrjk0sKUGVWaMHey0wwOq/KigstkHqLm4NTz2twS5K4t0YGj5DC7NR2Ix/
         EmE2mTzmFllqcXPZaVe97W8/Gysd1KTBDWFSmjG/lGrko4pa+eJXiKTtcGIgbeOLRzPp
         H/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790406694; x=1791011494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1uflVYidz7MNBUBcoHSIOw+jh4ssEiqibOfcA56ewY=;
        b=ax10pqQQugtDbA/m4ZfFp/OP3kOzouM3ciscUJJ8XTp96kZ3unGNLSlAvC362qst/G
         uF65KMfpHgLX4d0TDhm16mAU0/ZepFHhR6Q+WEK0+EKdeA42QceJPZNOl+6BDToZ4pGE
         8r3LROP1a1x6mda6ZAJ3/iPi0Vm6b9+p7ZerkwIgaodDbndhwvI01u9nnN154L6PwiON
         /WtEuj9Oh+SUsfDQ9PMxR3mTu5FHGlb2jiWVY9zMDRT7pZHgGrLl09zBd23BG6zN4n6e
         J4yaPFrajnLZMy4hrXnC574BrCqkPxJE97l/lWoOGHLtkabMQUHPBIctxRx/vS9e8A7f
         4MoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjyPp0bVt8ouFlt1ufEuoYVh9G2F7wyQvyVJhV5uRd0rbqUpLWYVO0XJNdzsuXR4SmSvj+bPHLqap3uOU=@vger.kernel.org
X-Gm-Message-State: AFuF++ntwIzMNNa3zVa9Ap9kuFYTeBVdBilojPJra6rVQIJGIDXesI1X
	RLUF8p3wVOFCVEw/5bxw315FnK79/gR8pdZyqfq89fJC04uqMxot01s=
X-Gm-Gg: AYBFou0A/7Q52hB3DreKcYeMXYZdME0GkMx/MKPrzgBD7Qan7XADQyA3LyMLEhspPUp
	Qv7UC7RLg95zPQQeKv3hZDdtPpxkvrekdW8Rwy/J8/VfkoueiUxp0KBtq+bNvkTd1KSRuR0qdcw
	ulWii3XwBpJHctYCrBmRpTRarfx7M1yhZAGxlJhRH/ZbwwAskgtZBx6KyoI5jy5uGLIqXmMRK5f
	q8Ej8jUf9ZbdLtD2R5Ol9qowEDuhZprKp0i0FGPw4kVYb5z84j+vWs8lNE23bLq/kdsBoJbfzxZ
	adCleLQ/qZuPzhCQlEy4GTQUKjRCq47BcZv9KDP8baJvvJL5AYhHGOroiBZIdD6ys0Ku1yXXYNi
	poPgXdyXk2JcdfwCu3Pgt+dNE31rDnOy38zYA6edQr59qZ6x5Fcxeb1ObtVM/8G/7wVQAyWzRGR
	/gbaT6mKJz1pol05aEjtD022CamX9kndKb2B0lNAxQleLvOOo+RpBJiVb4v2KA6IMtFBkZMU7w7
	2+wy/rwLAPAUQy73Y6naZng
X-Received: by 2002:a05:6a00:b904:b0:881:79ec:a65d with SMTP id d2e1a72fcca58-88179eca7c0mr762226b3a.32.1790406693845;
        Sat, 26 Sep 2026 00:11:33 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feae8d827sm1971825b3a.36.2026.09.26.00.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 00:11:33 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	kirill@shutemov.name,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Sat, 26 Sep 2026 16:11:26 +0900
Message-ID: <20260926071126.2869041-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <8f60eae1-31ba-4ff4-adf9-951240561f13@kernel.org>
References: <20260925042907.2330519-1-donggeunyoo.kernel@gmail.com> <20260925042907.2330519-2-donggeunyoo.kernel@gmail.com> <20260924214811.19ef8af417d37071ed8338c4@linux-foundation.org> <8f60eae1-31ba-4ff4-adf9-951240561f13@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 25 Sep 2026 09:36:26 +0200, David Hildenbrand (Arm) wrote:
> It would also be helpful to describe if this was actually hit in practice so
> far. IOW, how relevant is this in practice.

Not that I know of.  An LLM found it reading the code, and I couldn't find
a report of it on linux-mm or lkml.

> Will this trigger a kernel splat later?

Yes, with CONFIG_PAGE_TABLE_CHECK.  When the moved page is faulted in at
the destination, do_swap_page() copies the uffd bit to the present PTE and,
because the destination isn't WP-registered, also makes it writable.  A
read fault is enough:

  WARNING: mm/page_table_check.c:202 at __page_table_check_ptes_set+0x185/0x1e0
  Call Trace:
   set_ptes+0x67/0xc0
   do_swap_page+0x990/0xfe0
   __handle_mm_fault+0x7d0/0xeb0
   handle_mm_fault+0x9c/0x250
   do_user_addr_fault+0x207/0x650
   exc_page_fault+0x65/0x150
   asm_exc_page_fault+0x26/0x30

That's on 7.3-rc4 in QEMU, from a WP- or RWP-armed source; with this
patch applied it doesn't fire.  I'll put it in the v3 changelog.

Thanks,
Donggeun
