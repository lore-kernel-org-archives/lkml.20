Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC60636E468
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787944477; cv=none; b=tZR0agui1slScJX64NN4wrNOfGDrg/YbdcfLlRiTzsoLm2DBeOsZCI5DYh6Wrn9Yv0B5kOnMiMaJAKKAK3L4lkuaG+WY1ICjyTeEc/q/iU6KkhKhRcMMfwd5cO6oOAEDvnCxS4So3huyQhvNEV/19zGVWa3iArPHHXf2WRfdH/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787944477; c=relaxed/simple;
	bh=XB1IL20iLLZB7tF2/Qm1OLBbaKlWR7yUOZPnQ7f20Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZYSy9HgMDWY6ZrXAzi2qjYWS1yg9O/1Gk4UfzZWWpvR0wdtR1dVOFm1i4iKyc0Yi3xMmsNztLjtLguIQ2Un9deVY7V6Is82144GCyJNdnaa8ZAM2i5UV4q4cKI3iqYlTa4IpG7tWTYwUPXYAO7uFuJ71jQgCZbIlQiHWfAAhQDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePSCFbe4; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePSCFbe4"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f4e6b5bd30so1916841a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787944474; x=1788549274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jpwie+QQslO3AtQo1vwzAm2YZpOmk97PIG4zVXiE+Dc=;
        b=ePSCFbe4JC/CzB315VCK/HIyI6kjx2yXMppiiVT7THLDDglh31Q1+HxdyHSu61dtyj
         EiVbOBprgmBKkUUYT3BQs42OaPDLh8Xy9B8t3joY+/WE03lz9FQRquWSbs1oSZVxMhu0
         UJL+kDclWltc/WZ4cXyz4kuH/12LnqxCaubKX2CUMxQSl7Met9XoR4FO++NVdGngPzas
         IH5r92f53/Udl/jgTn21+Lq+dS/PX9RkxO2g+zC9yMkDoi1o5t8fjaB7JKckUM1r4ZvA
         2D/YE+oc6qXgNkTQHDT6sMKSJbGI9RA6B3skd3YLbZopkdQUi7+tDhPPQ5UQ81050pWS
         +1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787944474; x=1788549274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jpwie+QQslO3AtQo1vwzAm2YZpOmk97PIG4zVXiE+Dc=;
        b=A09/HA71xUQu5YQW6owze2ZZz6Y6kjA0JEo3YyJr9+IU0UFgzGcQenAsVLmR/m+1AU
         ITazIPDYIMXqk8gmOehpoOOe6Ru0DuKxkqimmgoaM1jupG+aWp1aYduw7Oli1mlIHRax
         mGV34/nddstYfO6cF1x1xgGIu7dIUHwCP6kl3y+aANVgrvxZYb8cQhRLTKspWHey7E1o
         fVth6gkGJpB7jIttt6ndrQOki9jhuN/qAyVBKvwqumRrf3P48RZ33PwxkGGHC/cglWZO
         /ENDTczA/1aYK5D9yfqim++qQ37xbB7sQZqqc0o6rwoBnlcU/8yq4ZnSXpyGmHkWutXm
         f1Ww==
X-Forwarded-Encrypted: i=1; AHgh+RoQPSF4eFQVFDdRfmoeZDDZEfr0dzdRsK10LzkQCehmqIn6v9KMmOquVledERUe9+8F6DPHzvjE0+z1m3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++naUHSYa7fun4WLN4bnAaq3stlT+XeqftxILd+cjotjGUposo0Y
	ANzf/0y2T9MbNaebSWTveYHex0OtR8x/VsY7n0pwncc2tsIIXE9pSxJj
X-Gm-Gg: AR+sD11LiC1SsKtghR7kZmP9RLGbc69HO62+kTko6k7aaWSx3cngo0tFtsj8fwTJmS8
	ulhv4z36gPHHP8yMMDuv5uLFHJPEpg/2hFUNbhIxqKjIlgS2tnbA9dzMf5Jp1raq8wg35hwqeWm
	0f+HEJryTk4gz1y3mvKBy93pwksgPizZihTOZbvERAkpUFsms+NlhX5x2xmT4iHWBJrCAXEuELe
	fcCE2Zqnxz0CofvpuGnekqkV2cFa7NcK46bHsO/gBQFE+tz0f9fCsbI2CGTnE+Dx0Dx2LJlpPeW
	XO0oohg62hUuYdnBBo3e1eAzCuluhRcHzvbUhztPRg7lJQav5HM8GRiVc8XYiOzgRNWLRGtlfg8
	UXFrhXFu/wGuQvhek83zvy/aGSihmzF1IT900CZP+DLD2NWysGnOGaWWzV/1GKULgTsNrwWcIeI
	GJS0ssaaI0wM7zZSt/hGuq+WUwwvb+SxoaRDluNGhP8XWihnXzvEGV8eUgdqAjmUUMBt7toR3u2
	xIqwMtI+Q4=
X-Received: by 2002:a05:6820:f00b:b0:6b1:d085:d9a9 with SMTP id 006d021491bc7-6b2fcdd0d6cmr1760722eaf.0.1787944474457;
        Fri, 28 Aug 2026 12:14:34 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:56::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1ce359f82sm2363780eaf.14.2026.08.28.12.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:14:34 -0700 (PDT)
From: Nhat Pham <nphamcs@gmail.com>
To: akpm@linux-foundation.org
Cc: chrisl@kernel.org,
	kasong@tencent.com,
	shikemeng@huaweicloud.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	joshua.hahnjy@gmail.com,
	gourry@gourry.net,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm, swap: fix SWAP_USAGE_OFFLIST_BIT collision with real usage count
Date: Fri, 28 Aug 2026 12:14:33 -0700
Message-ID: <20260828191433.3304458-1-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SWAP_USAGE_OFFLIST_BIT is embedded in the si->inuse_pages usage counter,
and is meant to sit above any value that counter can reach. However, it
is defined from BITS_PER_TYPE(atomic_t), so it is bit 30. On a system
with 4 KiB pages the flag collides with the usage count once that count
reaches 4 TiB.

swap_usage_in_pages() masks bit 30 out, so whenever the real count has
that bit set, every caller of it reads 4 TiB low:

* /proc/swaps understates Used by 4 TiB.

* A raw count of exactly 2^30 masks to zero, so try_to_unuse() takes its
  "if (!swap_usage_in_pages(si)) goto success;" early exit and swapoff
  tears the device down while pages are still swapped out. Nothing in
  the rest of swapoff aborts the teardown, so those pages are lost.

Independently of swapoff, the collision also corrupts the counter and
the plist. On a device in normal use, a free that leaves bit 30 set in
the count makes swap_usage_sub() see the flag where there is only count,
and call add_to_avail_list(). It clears the bit with
fetch_and(~SWAP_USAGE_OFFLIST_BIT), leaving the stored count 4 TiB below
the real one, and calls plist_add() on a device that is already listed,
tripping the WARN_ON(!plist_node_empty(node)) in plist_add() and linking
the node a second time.

Change the definition of SWAP_USAGE_OFFLIST_BIT to be based on
atomic_long_t instead. Note that the usage counter field itself is of
this same type, so it is still a valid bit.

Fixes: b228386cf237 ("mm, swap: clean up plist removal and adding")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260825153238.2695446-1-nphamcs%40gmail.com
Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/swapfile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 53bf01d5f7f1..601979b97f95 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -156,7 +156,7 @@ static struct swap_info_struct *swap_entry_to_info(swp_entry_t entry)
  * This bit will be set if the device is not on the plist and not
  * usable, will be cleared if the device is on the plist.
  */
-#define SWAP_USAGE_OFFLIST_BIT (1UL << (BITS_PER_TYPE(atomic_t) - 2))
+#define SWAP_USAGE_OFFLIST_BIT (1UL << (BITS_PER_TYPE(atomic_long_t) - 2))
 #define SWAP_USAGE_COUNTER_MASK (~SWAP_USAGE_OFFLIST_BIT)
 static long swap_usage_in_pages(struct swap_info_struct *si)
 {

base-commit: efecab401cb15fd3bb9bc05990609acb6b267ff2
-- 
2.53.0-Meta

