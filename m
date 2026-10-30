Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375795;
	b=YiVTBG1AprXFugGB0m6DenFxri8obDY+YFbQNJ4weJKowQXG25M7sola1L5l2UCDplsO
	 9BWONWS6hkSeAuRw0K3JqHiFiDhsEIiUM34/53loosOTzwRMtwzUiX7f4vZVIHR32uiGx
	 YNtmMa6hrV2DA8iCu1dekER8UEeWapVpl0Hk1GESLGDOruI9LqjWfTnzDm162SmHLMOgX
	 j4RrlH4/UgHTCEcyWGvOO5xqItSorpO5P3RRZDqzrO5W9/7NvHSJPDY/WTzQ3bb5CjmH5
	 tOlT7EL64dRGU8YOsmKDyXWYihrO6v5TYsQuC58njAL7TmXQPrx15jSI0Mj3Yac0bYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Hbkb5n4pBE+XUrjWX5DdGWczVnzqmasFLyCQvO57Eko=;
	b=KpML4VJh9BX4LZkelAOcqITt5hrqTDaJBeXWg71R8vF8XT6y9XZwqm1zfSZCFk5Npab4
	 DCaxn3LGnsrPdw2cF7/vi7oImks9H8BpLKA3JKtOpcCnT5HNO8GC2K4glGWQk5NyLtkLX
	 86+1hrjV/mgb+/HWfQUbPJ2c8JpTXIk3KtHp+HGJuFOkMCwqzY7BS0Z9lEEbHy0WPl5kJ
	 rG8IqV8UY0r7BzLwmRxahPKoeDXRJgGMrjLxx+RM3/HdHtef1LiO9+wcAGJBPbVy2GJRs
	 RV5OZ0ZhiVerWUO3/d7iOCosrjXY4Y6ZnnOKY3NNen4hEVEJ6Y35Qz2D+yqwBFHsO3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="C/J5YGhT";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26860606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26860606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C/J5YGhT
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e0d1da913so668777f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793375793; x=1793980593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hbkb5n4pBE+XUrjWX5DdGWczVnzqmasFLyCQvO57Eko=;
        b=C/J5YGhT7RwHp3MNX1xIxK9rWQalJFZJnya5v6SGXorbeFfivJddB7tQKFX1M1VoFO
         wBpKDuAs0RnuP5LMr7kSFe5RebjDSZwl9+t/rj/SIwOBAWS+x9bs6OGvinpTUwuxlalR
         d5wuWGhOJx7CLAKXSO9zG66bqbUesbYdovZ4QTk4ZZXgbdGzmSaobjprabx8eNlj0Z0z
         TDue5G8R4GDGQq2XSZO0MbmQlGCcEOsH66VmPIE4IcbWCR2oNV9nq0BbYfrAHcMiOJh+
         4IPvPw/ljowD7xFXumjC3gzOb4cc3Hu+SB5vYWMC3fLMSUi0h+1HKVLltCk135HHJBTw
         K1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375793; x=1793980593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hbkb5n4pBE+XUrjWX5DdGWczVnzqmasFLyCQvO57Eko=;
        b=mQyt7d+e9A1eQQ1lIgk+pb0tbRBz7waI3s1tHR/rVjNdbLeZIrA4QF9gD3Lns9Kz2F
         6F0yvFe35KfOS2uV0wXqVLrKKh862RsO7wVm6ODG/zeASh/c0JONNMDv3iLDkNHq2P9f
         1/CHMXM9LhR4cfMaexswaJ1W2N+2qN8vnnJZ6KfpZzN2KOskPIZU+XfCKuh8SWfFEcD8
         WznODSRSQ0j3jpTYfmqzjHJU4peom++nT6IYs2Yzp6ZMfZz4XkFAuqFpYlwG/10e11ic
         Nz1dTnHRwtCr8sssi23tn5vUbSm9M8+7Ag0jhyyhOQNq5CV0y/4anAhPXHBYlEuryUJa
         JmSw==
X-Forwarded-Encrypted: i=1; AKwUvBzYLGvttPQ+29T6HomOwEZdOuZ0+c3fxBWJ8xLwBoPsQzofn9z6GXUo4x0jfirrDuPM6O0S5eqB9IoMIJ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKi08VRr7YqrCo4l3Jeft67Agzj9C3k8yOBiMcS+EqtkLsR1pvb
	aFoCSo+zVXCrnH/qzplDQnzUmN5YwPgcizpE7Pan7zgPNyXR2qVUjfj28ev2J2zhDfo=
X-Gm-Gg: AYBFou1lerfx7BOb1IKYQXBeCRzm8bbFARv0dWJot5L9wr8Ysfd+owvwMdwNI2jXmyF
	PAt0l78goPDQzletlPaNTw/B3cq0Qm58Anv8dFtGHTFFMk1JL2Yt/azTYMQrB41QlBMuOwCa6ob
	WtUvaxG0W6t8PMUmMZ/KvKxLUdUtTbOEuUidxWxtxcN5Nq1qBwp2FwtFU/1RmJoqA+kkXt19Ba3
	/2wbtuxcsF7h+USuuJRTF+4iq2SECjutYxeYOwZqrSOJ3YkjN+oHsup1W6gcQog1frNXAtE+BkA
	2bKzU2HXTGqDyNar9bBdjIMFRyIKexqZxksTevL8m/wqPOEDGgjJJgAYiGj8jl6p0jpuAQ4d4aU
	UuBmf+KFxQFC7lD48KxLofgzM9dKkEYKwNMEH/Elvb3kEtuDJ4xlux/EBibIxtaqx/MU5fRJO7p
	cl9sll5FAgf8lyuexOrPDuLSyqZldrnEmNWRLe5OmTKbHtAgQGywZRWndGECj6NMziWcZiovRH8
	Hfzn5F1VkshLtBX4o4Q3nywzO1BxO6qUl5J0anDkUYN35MxW4bQA0/2X6KkGgLgTOYXEmEws33G
	WyZBnJgXIVTtGP2KVHVt2xcgHiO8SbwSppZMiN2FTCxG2SjOSNgFEhoH6fuF48b3FngwSH4=
X-Received: by 2002:a05:6000:4910:b0:48c:69b3:6114 with SMTP id ffacd0b85a97d-48e6494c24fmr15895958f8f.3.1793375793295;
        Fri, 30 Oct 2026 08:56:33 -0700 (PDT)
Received: from macstation (109-206-198-198.host.skynet.net.pl. [109.206.198.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm4157944f8f.55.2026.10.30.08.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:56:32 -0700 (PDT)
From: Maciej Sadowniczyk <m.sadowniczyk@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: fix ENOENT in indx_new() for blocks with unloaded runs
Date: Fri, 30 Oct 2026 16:56:31 +0100
Message-ID: <20261030155631.953779-1-m.sadowniczyk@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029172655.432752-1-m.sadowniczyk@gmail.com>
References: <20261029172655.432752-1-m.sadowniczyk@gmail.com>
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

indx->alloc_run is filled on demand, one $INDEX_ALLOCATION segment at
a time. When the attribute is split over several MFT records (via
$ATTRIBUTE_LIST), a segment none of whose blocks has been read since
the inode was loaded may have no runs in alloc_run. indx_read_ra() handles
this: when ntfs_read_bh_ra() fails with -ENOENT, it loads the runs with
attr_load_runs_range() and retries.

indx_new() has no such fallback. When indx_add_allocate() takes a free
bit from the index bitmap that lies inside the existing allocation, the
allocation is not extended and nothing loads the runs for that block.
ntfs_get_bh() in indx_new() then fails with -ENOENT, and so does the
insert that needed the new index block.

This was hit on $Extend/$Reparse, which gets an entry for every
symlink. After many symlinks had been created and some deleted, and
the volume remounted, symlink() started to fail with ENOENT and kept
failing: the bit is marked used only after indx_new() succeeds, so
indx_find_free() returned the same free bit every time.

  ntfs_create_inode
   ntfs_insert_reparse
    indx_insert_entry
     indx_insert_into_buffer
      indx_new
       ntfs_get_bh  <- -ENOENT

Creating regular files and directories, which add no $Reparse entry,
kept working. Other indexes, including $I30 of large directories, go
through the same indx_new() path.

Load the missing runs in indx_new() the same way indx_read_ra() does
and retry ntfs_get_bh().

The missing fallback was found with an AI assistant comparing
indx_new() with indx_read_ra() (see Assisted-by).

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/ntfs3/20261029172655.432752-1-m.sadowniczyk@gmail.com/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Maciej Sadowniczyk <m.sadowniczyk@gmail.com>
---

Notes:
    The code change is the same as the untested diff in the report (only
    the comment now names indx_read_ra()); it is now tested.
    
    Tested on the ntfs3 devel tree (ee1cb3443cff) in a virtme-ng VM, with
    lockdep and KASAN enabled, using the reproducer from the report:
    
    - without this patch, symlink #14940 fails with ENOENT. The failed
      symlink() leaves nothing behind: after a remount b/l holds exactly
      the 14940 symlinks created before it.
    - with it, all 20000 symlinks are created. After another remount all
      of them read back correctly and can be deleted; ntfsinfo (ntfs-3g)
      then counts 20332 entries in $Extend/$Reparse:$R, i.e. the 20000
      remaining a/l symlinks plus one end entry per INDX block (332).
      ntfsfix -n reports no problems and there are no KASAN reports.
    
    In this tree the reproducer's readdir (find -delete) trips the known
    "bad unlock balance in ntfs_readdir" (syzbot; "[PATCH v2] fs/ntfs3: fix
    double ni_unlock() in ntfs_readdir()"), which turns lockdep off before
    the indx_new() path runs. So I repeated the patched run without any
    readdir, deleting the symlinks by name: debug_locks stayed 1 for the
    whole run, there were no lockdep or KASAN reports, and a function
    trace showed attr_load_runs_range() being called from indx_new(), i.e.
    the new fallback ran.
    
    The failure in the report comes from indx_insert_into_buffer(); the
    indx_insert_into_root() caller and $I30 directories were not
    specifically tested.
    
    Starting from the function_graph trace I collected, an AI assistant
    located the missing fallback by comparing indx_new() with
    indx_read_ra(), and drafted the fix and this changelog. I have reviewed
    and tested them.

 fs/ntfs3/index.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index c06b36760..2b0f2a6bd 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -987,6 +987,23 @@ static struct indx_node *indx_new(struct ntfs_index *indx,
 	}
 
 	err = ntfs_get_bh(ni->mi.sbi, &indx->alloc_run, vbo, bytes, &r->nb);
+	if (err == -ENOENT) {
+		/*
+		 * A reused block may lie in an $INDEX_ALLOCATION segment
+		 * whose runs are not loaded yet. Load them, as
+		 * indx_read_ra() does.
+		 */
+		const struct INDEX_NAMES *in = &s_index_names[indx->type];
+
+		down_write(&indx->run_lock);
+		err = attr_load_runs_range(ni, ATTR_ALLOC, in->name,
+					   in->name_len, &indx->alloc_run, vbo,
+					   vbo + bytes);
+		up_write(&indx->run_lock);
+		if (!err)
+			err = ntfs_get_bh(ni->mi.sbi, &indx->alloc_run, vbo,
+					  bytes, &r->nb);
+	}
 
 	if (err) {
 		kfree(index);

base-commit: ee1cb3443cff5a800948b662756f75b17ca63fe2
-- 
2.56.0

