Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DAB4457B8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 19:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884093; cv=none; b=P4Sbg1NKTbMxAjVsdthnag0sWbX9CwnMGeIphClkyNF1q5ihJxk2gK8J5Hmms8c0Fh+lha9u0rVv8/RhpHqWqiZp+WFT5EdnF1PNJ5xVg4RrsGEioKdyYud2737Ft+iUzSNB30UyKmx0mOG8guqOdtFpZ5xeL6883/PRAYylf6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884093; c=relaxed/simple;
	bh=OC8g+z++Kk+ZpBLTZtaSc42VafnXHwP8FePidhhEOMk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pSCVwdpkJ7N1Y99YqYDm8IIqrgYW9g3Y4461vJ66cakcIrTxcWtQJ5u6ibGw9IiIrCZtkcH8w0T7M78DlXZaTri+Oi8rOMgOiI8Rby4AF+dOsfILQzmi0aExMwiY7CsnLKag+B4sMSZTOAEV3VI2GC1zNyT1Rz2ImVjIAbBbk3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cb254da90eso10816817b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884090; x=1791488890;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UT5hQSDyo7e5sf4fDIjWx8yoWKJnuwiBm+XTY0162ZE=;
        b=BHRw65CMeg3XxuR9YJ7M9J5IH4YyDQ+kIrBtmjdxafSO3C0t2Gcgu1k95Py5mu8ph7
         pciRW076smsWjmg4gutNOEvsMYs6uiXqrVmgR/Xx01IibEtwxYmpavPFInBiY2e135WX
         Cibg/j+VUBMihig+BzVDm0OqANmqSHLpcmPNjKHMTmWnWJ8e+0HCwfY0HUcPaN7C+dUw
         YY5W40Svissy8XUuwNyajhHpk1i0/mvmh4tdbuamemyhtFb/RRFDB8l52Dazv5DT1XK+
         SdRUDHkSZ/yfi0T3jxJ2OxqYIjfw+R4h/dChTA38XPkQDjhxpV4ohnAB0kR3mgVRL1B9
         n9JA==
X-Gm-Message-State: AFuF++m0g1+Ss328pRRJLQjiZJ8rneQSCcAVULPdWQ2zHfn6U/swnd0L
	FRsZqqRKvRULuwhdLWPB4tmQ0j9Mundg9UXulhwDrgKJoC0UzvlZakkBkCWkWGZmCDDIKcBmz2e
	aKOQYmwcWyxCYB+p28AKrMTJ0vwOGiwY18bVWZwt7ErQZ6KGD2chOcszdqpE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bc3:b0:4c1:3047:9d23 with SMTP id
 5614622812f47-4f529c281f4mr210326b6e.23.1790884090534; Thu, 01 Oct 2026
 12:48:10 -0700 (PDT)
Date: Thu, 01 Oct 2026 12:48:10 -0700
In-Reply-To: <6abae226.69bd487b.a6f8c.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abeb8fa.7503fbd6.2d3f6.0008.GAE@google.com>
Subject: Forwarded: [PATCH] ext4: validate dirents before splitting a directory
From: syzbot <syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] ext4: validate dirents before splitting a directory
Author: adrianox@gmail.com

#syz test: upstream master
syzbot reported a slab-use-after-free write in do_split() while
renaming an entry in a directory that is being converted into an
indexed (htree) directory by make_indexed_dir():

  BUG: KASAN: slab-use-after-free in dx_move_dirents [inline]
  BUG: KASAN: slab-use-after-free in do_split+0x1241/0x1e90
  Write of size 90458 at addr ffff88803b38ac6e by task syz.0.17/6003

do_split() builds a map of the leaf's dirents and then moves a subset
of them to a new block.  dx_move_dirents() trusts map[i].offs and uses
the rec_len found there as the length of a memset().  With a corrupted
or crafted directory block, a bogus map entry makes that rec_len
garbage (here 90464), turning the memset() into an out-of-bounds write
that can corrupt arbitrary memory.

Validate each entry that is about to be moved with
ext4_check_dir_entry() before using it, and bail out with
-EFSCORRUPTED if the entry does not lie inside the block.  This is the
same class of validation already used elsewhere in the directory code.

This is a filesystem-corruption hardening issue; the crash needs a
corrupt directory, which is why it is not reachable on a consistent
filesystem.  The syzbot "introduced by" bisection pointed at an
unrelated btrfs commit and can be ignored.

Closes: https://syzkaller.appspot.com/bug?extid=09bec78ee77613a3efdd
---
 fs/ext4/namei.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index a6386c1d237f..b2ec222b15e4 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1951,6 +1951,25 @@ static struct ext4_dir_entry_2 *do_split(handle_t *handle, struct inode *dir,
 		goto journal_error;
 	}
 	map -= count;
+	/*
+	 * The map is built from the on-disk dirents, so its entries should
+	 * always refer to valid dirents.  However, if the leaf block is
+	 * corrupted (e.g. a crafted image), a bogus map entry can make
+	 * dx_move_dirents() read a rec_len from an arbitrary location and use
+	 * it as the length of a memset(), writing far out of bounds.  Validate
+	 * every entry we are about to move before using it.
+	 */
+	for (i = 0; i < count; i++) {
+		unsigned int off = map[i].offs << 2;
+
+		if (off > blocksize - sizeof(struct ext4_dir_entry_2) ||
+		    ext4_check_dir_entry(dir, NULL,
+					 (struct ext4_dir_entry_2 *)(data1 + off),
+					 *bh, data1, blocksize, off)) {
+			err = -EFSCORRUPTED;
+			goto out;
+		}
+	}
 	dx_sort_map(map, count);
 	/* Ensure that neither split block is over half full */
 	size = 0;
-- 
2.51.0

