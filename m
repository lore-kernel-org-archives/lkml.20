Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927522;
	b=d8PS9nbW6FLQUl1FuHNUD7wuC9O0zvgI47GUX2Zx3o1nsHrrg6jG5W7cL1h7usKoTGq3
	 3aFBI7UOKlu1G16rdHPXNpwQ+hiW49wi/qzPubW/P2iQTNEafo1J9Gl18mSZ82Y6slFC+
	 /FH8GtdQAJai+2Q9x6S7VOSqEkeAN9w3HWmLB4sjp+q8X91fUpgFYIBH9EXLP6h7GbZmo
	 4tWhVeaCNPbuNPDe5DCfjnsUvvzWyOv4YcK1Ew9UYB18qpftiIvAYvqYgpjKdQvADMiJm
	 d4e97CtJw6GbSf4+oXoTjo/LuhzAQgjrEfnpsYVzg6hJY8HYp15je5JVXLLpAVLlt4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j8h+fbCcAHktdAk9o4fEVE0qSmIF6dWv8V2qc2pMyUY=;
	b=uCEWY6kNiUmVmcolGlEXHch+VxaqYBLAcyHWBM5IG8O4DoNHXcYpEvTPWJT1ke3pcnTI
	 +vWJfAfhCgRTCBHhNzN7k+yTzBcHHetg46KEkvWYHdhld8ahjVgo46D68XDTK3GmtyPsz
	 2TyK6Ml5fpDDLiETFAdQWxNOsF0vioukF0hUCzB78l6uw+f/AsDiJ6fbo4aIAM7ibpRbl
	 1l9iomjDvvQL4gqStM7EyNXWdJrJGdEcpyh1pa27DpOUqaOK/8xRdZlMuoBml/gGmhZ5z
	 zv32Don5dRrkkfkSpgWSkIjFE6Mq3KCEWkG5BrLl//I7DhDzfhWRqbAmrJ3od/D0YkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x27kYLnt;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CE0606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95CE0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x27kYLnt
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e47347279so2409282f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794927520; x=1795532320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j8h+fbCcAHktdAk9o4fEVE0qSmIF6dWv8V2qc2pMyUY=;
        b=x27kYLntpM23GUGUseMHlz6GLIICiJL3IoXQgblLs7bPDyGQepvL7r6j7bgBPHfU4B
         W/6YspjEex2YMtDUw307qH5E214AvTB3vzWhc1MyKd5Pq+/1+UmT2mVvk5soqYjX/szj
         o9a44f/Qkkuyoe0sv2SIrAJM1tqae7V8ll5swxr+MgOyDvSUDXep80U6z5doHD14jwzy
         vYboFJ10XVjMWfcMMDXWNLJrHNf4+Gmal12ofm8ypd2/orVC6oOEOCYYx27j3c/bVmJS
         p0TObLu4Ni5Vo2Ftse2KMqOU81YoHQ3Gu6+9OhH7B5pBlclf4E2B99Qt9q/NpEENfT5P
         vpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927520; x=1795532320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8h+fbCcAHktdAk9o4fEVE0qSmIF6dWv8V2qc2pMyUY=;
        b=nHFUVqLP4ZkPoBnwWbLmapVUOcvwUUYwKAo9HthtA6dgoY9uZHuWfCYnjekSE1mmLG
         bmSTfHJSG9ei7LfhHy0sIDVZuX1qh4eCH6pBdhfnxXy7YMnSAMeXwHNr3w/ZjH6I356D
         g8SszKrngG7pFoWbGRCCRFPlVFN6/Yt3vx+hfAyKn26hVdoJHveo64OJYyAL7ac6y+cP
         QiHcSXTj56E8xYxFqpJS1FwHEexBMqV+lcts4tOnXl5WUKGdGW1Ht4ikEq9WgLCV8Vt0
         zXeIJakENQjZw3jFNaflQ2Cq9PUnpWcTwVnP78smmziRxYhSoHd4wk+1Y1st0g+WjT6g
         qABw==
X-Forwarded-Encrypted: i=1; AL+hErH/Rsvx2QrpyYR8cPkdSJd8LxABFtIrWDpgflwtdOJoOBtHJteKe5IXVyzOu9LmiEeYgIum38T6xbFHfG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h1D+LkjXmZKzZM7O8LHF94A+ZytCz63+SCAXWM2Z7D3N9BZ4J
	/2fhL4z6ANHPsCaPFaTUDSmvLs2XUsmAQGGOybmUcLv9+k8btIcz/BGpqOGvu7vhzmc=
X-Gm-Gg: AZFdTZdMjX4GXUJs7BqzKOF1lTrI+ZNl2AC22vkJOSuWO+cETmvR2ps5GGTq0Ka2B+7
	fIDSW6waoJZorkDc4QBE4atH7BJN5oieoI7cfnu14hdzflAhesLeDx4Z2//bVmg2mxmxbWulhVP
	WLvceacPm4axNWhkTY8FEE04qS1/TnLvyOyjFWbBEed6Ot9cwr1yxYnOQyCfzL5UyJKCI2+D838
	jZqIL50lLNAigw9avnTP/oC0rQLOpsq3lsE2mZqIHrYw3DxJg7D1eOxFaOoWuLBnZR5Xxn/u84n
	0SHUNbyWihNaoOL4zkl4A6IVh9+LdlYy1JFZN9SZ4XC6RiyrV1hWGkcUnOIVAdI7ZnV5gLid004
	OH/rQPpEyyzODe5dsCmCTS3rSNiOnn2LtowCfx9XkcKSY120R1iQy0o+pLIyEojJH7nkCrTc7m6
	xTG038zfPJmVM7WlvzVesC/NjdKCKDMyTGJhQIBhFUYNNCDjKQxtgcMrwaaQwepWMTNvI4HBkRE
	6d+/bxq3jgxSD4L3fXI/sNa5ShlPjTVDbePz/2Dj2vTGJeFaR055hsNnXr1bnhhImFrux/3gYpw
	8v/uLaqBWPswKq19fz+dcfkW6xFFRly1H/aX3QBqJYkxCsmEZ7GSnnqjd2G+x9nZQePjUSKlxGe
	EwhFhmGKz086Ys0pQ2gp3O5LQGe/8gxWdDK8yssQ99Q==
X-Received: by 2002:a05:6000:310a:b0:48d:ef7a:e59f with SMTP id ffacd0b85a97d-49c712ac8d6mr31599361f8f.17.1794927519691;
        Tue, 17 Nov 2026 06:58:39 -0800 (PST)
Received: from localhost.localdomain (cl-hedp4-wifi-nat.herts.ac.uk. [147.197.250.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c604ee47dsm28996090f8f.38.2026.11.17.06.58.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 06:58:39 -0800 (PST)
From: Zhiyuan Zhang <zhiyuanzhang912@gmail.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhiyuan Zhang <zhiyuanzhang912@gmail.com>
Subject: [PATCH] ocfs2: fix local_alloc_bh leak in ocfs2_shutdown_local_alloc()
Date: Tue, 17 Nov 2026 14:58:30 +0000
Message-ID: <20261117145830.59864-1-zhiyuanzhang912@gmail.com>
X-Mailer: git-send-email 2.50.1
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

From: Zhiyuan Zhang <zhiyuanzhang912@gmail.com>

ocfs2_shutdown_local_alloc() owns the buffer_head reference stored in
osb->local_alloc_bh, but only its success path drops it: after clearing
and journalling the local alloc inode it calls brelse() and clears the
pointer.  Every error exit after the local allocator has been enabled
returns with the reference still held:

  - failure to look up the local alloc or global bitmap system inode
  - ocfs2_inode_lock() failure on the global bitmap
  - ocfs2_start_trans() failure, e.g. on an aborted journal
  - kmemdup() of the local alloc dinode returning NULL
  - ocfs2_journal_access_di() failure

Nothing else releases it, so the buffer_head and its page stay pinned
after the unmount.

Drop the reference at the common out: label and clear the pointer
there.  The success path has already set osb->local_alloc_bh to NULL
before it reaches out:, so nothing is released twice.  The reservation
path is not affected: it takes its own reference with get_bh() and
drops it in ocfs2_free_ac_resource().  Also mark the local allocator
unused when the buffer is dropped, so that a NULL local_alloc_bh is
never left behind with the allocator still marked as in use.

Fixes: ccd979bdbce9 ("[PATCH] OCFS2: The Second Oracle Cluster Filesystem")
Assisted-by: Claude:claude-fable-5-2
Signed-off-by: Zhiyuan Zhang <zhiyuanzhang912@gmail.com>
---

Notes:
    Testing: QEMU (x86_64), local mount on a loop device, kernel built with
    KASAN, PROVE_LOCKING, DEBUG_ATOMIC_SLEEP, DEBUG_VM and DEBUG_LIST.  A
    test-only pr_info() printed the pfn and b_count of local_alloc_bh on
    entry and exit of ocfs2_shutdown_local_alloc(), and the page was looked
    up in /proc/kpageflags after umount, losetup -d and drop_caches.
    
    All six error exits were exercised, twice per boot, two boots per
    kernel.  The ocfs2_start_trans() failure is the real one: the loop
    device is shrunk under the mounted filesystem so that jbd2 aborts the
    journal.  The other five were forced with a test-only knob.
    
     - Unpatched, 24 of 24: the function returns with b_count still 1, and
       the page is still allocated at the end of the run.
     - Patched, 24 of 24: the reference is dropped and the page is free.
     - A clean unmount frees the page on both kernels (8 of 8).
     - No KASAN, lockdep or other warnings on either kernel.
    
    The leak is one page per failed shutdown.  kmemleak does not report it,
    and neither Buffers in /proc/meminfo nor the buffer_head slab count
    shows it.
    
    AI assistants were used to find the leak, to write the patch and the
    changelog, and to run the tests above.

 fs/ocfs2/localalloc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/ocfs2/localalloc.c b/fs/ocfs2/localalloc.c
index 82d290cf4432..d8d81cef92fc 100644
--- a/fs/ocfs2/localalloc.c
+++ b/fs/ocfs2/localalloc.c
@@ -462,6 +462,17 @@ void ocfs2_shutdown_local_alloc(struct ocfs2_super *osb)
 	iput(main_bm_inode);
 
 out:
+	/*
+	 * The success path has already dropped the reference and cleared
+	 * the pointer, so this is a no-op there.  Every error exit after
+	 * the local allocator was enabled used to leak local_alloc_bh.
+	 */
+	if (osb->local_alloc_bh) {
+		brelse(osb->local_alloc_bh);
+		osb->local_alloc_bh = NULL;
+		osb->local_alloc_state = OCFS2_LA_UNUSED;
+	}
+
 	iput(local_alloc_inode);
 
 	kfree(alloc_copy);

base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
-- 
2.50.1 (Apple Git-155)

