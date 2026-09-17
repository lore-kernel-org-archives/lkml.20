Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA6F48FF71
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634324; cv=none; b=uWsuz2zrwRIrZk8LIR39Eiaw/qy/9iOyZud6ZoKCioWw0ujXFSDXCqAQgztpdDcAe8EOiqknQemJY4J2/8lvEudeLJTgpVSLLlgTgK4JV3jVDuBZhdyK0BA8XKuBvxk1grF2MpYLEXDIubD4PMRhHFP0FCoEJZhtvBv+M5tRRVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634324; c=relaxed/simple;
	bh=k1GXYY6A7y0hQF32K0VwcwBXakkSSyzeWdLnCM6RKV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pIRcQmMkXXtPbzcUlM3asYdqeZL+jr+KJ/tjtUxQaxN4UYasVKmnR6MnpmzHD7Rvm7wdtHvB8uRkP6LgDCDB9kFi+BkRBNNugXIBdVLWaJiPYjhvfgN/lf235fXFFsnKnaoODPrsijZcdQcz82IZCh8o/c+Vz5sYlVLr9HPSA5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+0HqudH; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+0HqudH"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b350c6920so491977a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789634310; x=1790239110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u3HdJDUDcBvt28oPFTrWwWmgVt/98a4ZJvXsfBuXjA8=;
        b=G+0HqudHOtBZnJMs/74IJOorP8EzP5UnSzvuY7eYderUpdjSFlQBGWY4tnZCdCSlEn
         lWY5V79PJWf9IGGc7bLo0db+9KAMMernvGA073By7zRTBAUE/dbYYc2f9RTbEHDIACuB
         3f2873isAtM2z7r4tHf3ENQCyv3PXveWXtiQMVGJlE1oByskw12ovhH2YjptgrsRjanQ
         yXombypdiBp/i/37+tWnEXn6PujETBU/pTSnvSLTrHdm0HzvI0jGJrCrZciANnjkqL4V
         ue2IlIZXFtwmhiFZjqa74FtsjC78gXpgdRNXLB+WLdOrymWo8lUEaCzcRaYInq5ssG4c
         cppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789634310; x=1790239110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3HdJDUDcBvt28oPFTrWwWmgVt/98a4ZJvXsfBuXjA8=;
        b=t99ySnDz1EyuEsl7UlOYBlDTprqLPKd50cKx2TC3nLu0jMPAgLIA4h0EPcBu2bE6yG
         qgDqVRYl0JMBzzDcGtw+76WUXuhKqNnCRbD7Y61aWVsCFYCZDRRbvPS8+7awyQIBEHdd
         6XIIBCuaiftWwVtdbMsP/11Lam2UN6JzQwCJt0m7LteN4MIs06YCl5EZ5mhBwKK9JqWa
         fkLG5sJpRmKO4KsiFxXeu+TiiLSKccxW9gBscRgl7EaLA+f3T3rHdH9+42/L2vjwpi/T
         1l4AFG8QYEFZ5YzMCHwAQxh2e61c8a1nw+yhP3bfRJsd7pEjRdy4hM2MVhnIqPYuknEi
         xMpw==
X-Forwarded-Encrypted: i=1; AKwUvBxTxjKNWPQeliCkrbP49EKq4+AV/dVJPgpRPuux13T6f7185tp9hP3CJV1yYnTSZxe5JFJ2sRw91d89XzY=@vger.kernel.org
X-Gm-Message-State: AFuF++nkKhYkzOqGJ/sAeYUUvsVA2RyTKFVy85dKdz1lcR/XxPnN7Max
	ho3IDhKvQZgXavTb5G3IfK6jNX9EFHZYCYbNPtPq5hLSM1SkoQp/YHFe
X-Gm-Gg: AYBFou2esv+On0KMs+18IPzu2OH9lqu1jbE+vyfnZ3ljcE2ErPTLcO3oW7WG+lV5or4
	22jHkYkeAwi1GUU71e6V0NKB1bDtSzdC0B80qfz2MeD6Oknu5MiZE/pxQBY4bvIoJztPzqw0aON
	SMzX/mgvaAKXrJOG4ZxAGx7eXTInG9PGF6H8B/gebI2yBgYlCEKO5cr2Nuz7R0Ncv8r6CTan3pG
	c/eOVGTivC3MmPONR0rYepIva/rvAG/+z5+0d3wDEaHapm58e3a2+dXRnud+fFhFijICYQQ7YWA
	m9u/WF6GjajOaFumoQnX5LQlOv/NUJ094kSy4wYpSd7cNCxDPUbah+1eJYLqQgrGkbOR0QpKfYC
	NK4EUL4NS6Z5BHZ07BgxAgVfusODEANKRfG/MEohvCO176WflgaNn1ROWwc2wAWAAHSwnQLSirK
	CLO8/WaCu3VRGWjv9GyEPoDyu/kuItiAe54fzwJJyPK2oTQUczxjwbtQqdNkNonPDUt/m8hRaUd
	nsn0pVNUyoqfBm0w47zAygH0ecU
X-Received: by 2002:a17:90b:2585:b0:39d:f351:8f0c with SMTP id 98e67ed59e1d1-39e1e48b580mr12652726a91.13.1789634309950;
        Thu, 17 Sep 2026 01:38:29 -0700 (PDT)
Received: from localhost.localdomain ([183.194.144.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35e56298sm3871317a91.9.2026.09.17.01.38.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 01:38:29 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Cc: Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	NeilBrown <neil@brown.name>,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zjamg <ndaugoing@gmail.com>
Subject: [PATCH 0/2] md: fix bblog_size-driven OOB read in md_write_metadata()
Date: Thu, 17 Sep 2026 16:38:18 +0800
Message-ID: <20260917083820.57091-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series fixes an out-of-bounds read in the md badblocks log (bblog)
write path. The on-disk bblog_size field is taken verbatim from the
member device superblock and used as the bio length in
md_write_metadata(), without any check against the size of the page that
actually backs the write.

This is a different issue from CVE-2026-89557, which fixed the
bblog_shift overflow. The bblog_size path is still unfixed.

Introduced by commit 2699b67223ac ("md: load/store badblock list from v1.x metadata").

Mechanism:

  super_1_load() reads sb->bblog_size (__le16) from the member device
  and stores it in rdev->badblocks.size via super_1_sync() (md.c:2316).
  md_update_sb() then calls

      md_write_metadata(mddev, rdev, rdev->badblocks.sector,
                        rdev->badblocks.size << 9, rdev->bb_page, 0);

  (md.c:2944-2948). bb->size is sector_t, so 0xFFFF << 9 = 33553920
  does not wrap. md_write_metadata() passes that length to
  __bio_add_page() with a single 4 KiB page:

      __bio_add_page(bio, page, size, 0)

  __bio_add_page() is the no-check variant: after a WARN_ON_ONCE() it
  unconditionally records bvec_set_page(page, size, offset) and bumps
  bi_size/bi_vcnt. bio_full()'s second clause is
  "bi_size > BIO_MAX_SIZE - len", with bi_size == 0 and
  BIO_MAX_SIZE == UINT_MAX, so it is false and not even the WARN fires.
  The 4 KiB page is recorded as a bvec with bv_len == 33553920.

Downstream bvec iteration (nth_page, bio_split_to_limits, etc.) then
reads past the end of the page, into whatever follows in the linear
map. KASAN reports slab-out-of-bounds or slab-use-after-free, and the
data is written to the attacker-controlled member device.

Reproducer (CONTROL/ATTACK, only bblog_size differs):

  CONTROL bblog_size = 8      -> 4096 bytes land, out-of-range stays
                                 at the fill pattern
  ATTACK  bblog_size = 0xFFFF -> 33553920 bytes land, KASAN reports
                                 slab-out-of-bounds in
                                 copy_folio_from_iter_atomic(), and
                                 ~33.5 MB of kernel memory is copied
                                 into the member device image

The harness creates the on-disk superblock by hand, attaches the loop
device, binds it to a new md array via sysfs, adds one bad block, and
then writes "writemostly" to the member state attribute to force an
md_update_sb(). Both runs share the same kernel, the same md module and
the same code path; the only difference is the bblog_size field in the
on-disk superblock.

Patch 1 adds an upper bound for bb->size in super_1_sync(), matching
the existing guard in super_1_load().

Patch 2 is a defensive check in md_write_metadata() itself, so that
any future caller that passes an oversized length is caught before the
bio is built. Only one of the two is strictly needed to fix the
immediate issue; I'm sending both because the checks cover different
layers.

I can send the harness and full dmesg logs if useful.

Thanks.


zjamg (2):
  md: fix bblog_size-driven OOB read in super_1_load() and
    super_1_sync()
  md: add defensive bounds check for bio in md_write_metadata()

 drivers/md/md.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.53.0

