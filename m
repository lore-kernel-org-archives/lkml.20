Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792861573;
	b=yeCrSG3nbv3klf834OHOkHLlnhdnsAFyy264tg98lxAPySZcz0yZY0ctq1djRumfDmVZ
	 MxEbw0fuRiJyM1G4NSexBjHcNodJS4mCZETpTPbojLYY/3FeDYvrsbdp2N1o7UrihanfY
	 +vgnduT+KCB4raddZC4Eac3eFedAwJC+H/JRI4oWDHkrZYsVpt38ir+bDmvAGw3lfLxqR
	 XE+31UEkDxq+YehJshNAULrALBk6mwUMTkcDR8Wdna1B/xI75x9fazF8+g3C+iYyMA5cF
	 C0EI4UcIpFBSAR0viqv7sIbo2TKiMUolcm0PvMzKJhheA1bcx9+UFVO0vfWE1h72FFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792861573;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VD0DJQifxWqmFqvxgKLhw5iI9/XvTtH/bBB6CwZQaeQ=;
	b=QPQx13zS3rdgla62KVa1LNfMC3qzRdHiLWfQjbn4nvX3z5H3Itp63GsBRZf+W6YODYAd
	 10xWTybRo38Hj+rlm8A+OQV4A6dNXeyLKu2dw6bH3lKu5pYe/eXa2Gu8XwSbSKAMB7MM7
	 wO7T15cmfG5au9/v2TqHlqJb74vT1im3pd5ELIqbyLsW/CzIUYljStstd+cHFi714j+KD
	 Xs46eUvKskezvwr7SvAon50yCuudYE8qwUoybl625WUF5P/X9zdMi7bGTOQeFgQBVq6c4
	 waneK2L7i/FjekeahjfWmE2+hhfc+WHZx6/IfIPVMgMsQfDWMaI/NMP8NKQ65gqNCBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hackers.camp;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FA8606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0FA8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hackers.camp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a005aa0838so2183565e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792861571; x=1793466371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VD0DJQifxWqmFqvxgKLhw5iI9/XvTtH/bBB6CwZQaeQ=;
        b=fOGPy4K+vJ8gA5HWo/VtDS77yOXiv77GbEh9l6bpcLe2yy1OeV1yY4qPoXthQjud+T
         gf0f4pZvNC0GCdCQNjYOI0iUpavZFubo39eOndAtwvv7Cg+hD/qXY60awBgYCspmC141
         97IsQiXjTkLOwh3QbQO3fPoUxS35N6HMH/aRmWTIKC4mTHjSh5/e+9P5IUk4yFI7BnQN
         yCAD78qrIRto1dxpXBE+JLwbpxuOcgUYt+YKwubeCYHFOsbQaOQaWQntDWtXgxlQ7cA0
         4gJfBTCnrN8UC4XrNSGDXN68vKM/b7Olln3CIFiWz5ddt9Z0P73jYmm/XQxdsxdvzZ2j
         7xGw==
X-Forwarded-Encrypted: i=1; AKwUvByIlaTG4isIL9b2WKGgbnxjjLaHwyozkhB6i2QrvlRAQj35bia7eDEH5ycdpEfkIonUXo96NDTVG0/xTig=@vger.kernel.org
X-Gm-Message-State: AFq9FYLH5WawErIZWz/ilHcHBfuXdHGh0YNNoeg3yJbB4YES1hY2Vldp
	5X0x7e3tgfPaKKSkmCNWcDSKRS76TgEifZ3ExfMErUL415xtbU76aYXi
X-Gm-Gg: AYBFou2Lf/TCWLK7DJfoGIg/QBPxpyhsM4NEr6PIAe4+pWLHBSinpFPh2AHIiIQisse
	tSbHgPHw+f263zyl77A6wE5BpQw1l1+cz/N2ZZkiZPI4wb9kgYLdogxyQFVGEGlgbIt017oXJp8
	9iVuvUvMRcKZhtAJGpqZdQO8oRYI38g+nMc6J02X/PXkWdbnrFAJMLGX1uWroptAVa3BP/Qi6rG
	TaFiiWOBGj79a+rqb5V0t/GkPyokia2LlC6PxeLyguXoxzthGNtTjTjInxY27/F+GBj2CZdNV0O
	eHnGDOqqtNZF6NjFasPgCevGqqNy+o/QiJkzwM0v0PqPQETmDmGj4iTO58T2+pPYQsx6xOYjTn2
	9RIchRwmm7jG4KNSS0/35ajuS5hKS4TLWuAky0VlITn2sOMrtFtiBJLxqPyHMoP+nO+GrkFTNyd
	eqp/xAmGCI+ZEcJymLz2EhfP9ZhxUWms9Fo1gC1j/XDYcVa2ZH0PbYM5hMTZRlpgFzpnVq7JZQv
	nRiVcb9iV4yMFB6QtM8YlirCLHJKOv7jijW0BlTbqmPQ6LAUABASA5x7dX6SpTV5xZEozvB0u8J
	JIT9EZBXVL6NcAKYaA==
X-Received: by 2002:a05:6000:2905:b0:48d:f14a:9186 with SMTP id ffacd0b85a97d-48e3eb97829mr4555971f8f.6.1792861571101;
        Sat, 24 Oct 2026 10:06:11 -0700 (PDT)
Received: from spartian.home ([2a01:cb1c:76:ed00:602f:c5f4:d108:b925])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb40733sm4164240f8f.0.2026.10.24.10.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 10:06:10 -0700 (PDT)
From: Aurelien DESBRIERES <aurelien@hackers.camp>
To: jack@suse.cz
Cc: brauner@kernel.org,
	willy@infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aurelien.desbrieres@gmail.com
Subject: mmb_sync: b_mmb NULL window races mmb_mark_buffer_dirty
Date: Sat, 24 Oct 2026 19:06:09 +0200
Message-ID: <20261024170609.125348-1-aurelien@hackers.camp>
X-Mailer: git-send-email 2.55.0
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

Hi Jan,

While measuring beamfs on vfs.all (2c3ba1f1cb41, on v7.3-rc7) we hit a
list corruption in fs/buffer.c that I think is a window in mmb_sync()
rather than anything specific to our filesystem, so here it is with
the trace. beamfs was attaching buffers that several inodes share
(bitmap blocks, parity regions) to the allocating inode's
i_metadata_bhs, so the same buffer_head moved from one inode's list to
another's. We have since given those buffers a list of their own and
the problem is gone on our side; the window remains.

The window

mmb_sync() does, under mmb_A->lock:

	__remove_assoc_queue(mmb, bh);	/* list_del_init, b_mmb = NULL */
	smp_mb();
	if (buffer_dirty(bh) || buffer_locked(bh)) {
		list_add(&bh->b_assoc_buffers, &tmp);
		bh->b_mmb = mmb;

Between the NULL store and the restore, mmb_mark_buffer_dirty(bh, mmb_B)
on another CPU sees !bh->b_mmb, takes mmb_B->lock (a different lock),
its cmpxchg(&bh->b_mmb, NULL, mmb_B) succeeds, and list_move_tail()
writes bh->b_assoc_buffers while CPU A's list_add() does the same.
The second loop of mmb_sync() has the same shape (remove, then
list_add back to mmb->list when still dirty).

The old mark_buffer_dirty_inode() took the bdev mapping's
i_private_lock, shared by every inode of the device, so the two
writers could not overlap. A per-mmb lock protects a buffer that
belongs to one mmb for life; it does not protect the moment a buffer
changes hands. The comment above the cmpxchg says it is there for a
corrupted filesystem with multiply claimed blocks, and the kernel-doc
says the buffer is added "if it is not already on a list": that is
exactly the case the window lets through, so a corrupted ext2, fat,
minix or udf volume in which two inodes claim one indirect block
should be able to reach it as well, given an fsync on one inode while
the other dirties the buffer.

What it does when it hits

With CONFIG_DEBUG_LIST, __list_del_entry_valid_or_report() refuses the
del, list_del_init() does nothing, and the first loop of mmb_sync()
is `while (!list_empty(&mmb->list))` on a list whose head never
leaves: the CPU spins holding mmb->lock. We lost the node to it
(soft lockup from 48 s up, then kmemleak and the OOM killer).

  list_del corruption. next->prev should be ffffa26a6e8d4820, but was ffffa26a63804190. (next=ffffa26a432e1238)
  WARNING: /lib/list_debug.c:65 at __list_del_entry_valid_or_report+0xf6/0x110, CPU#0: dbench/16440
  CPU: 0 UID: 0 PID: 16440 Comm: dbench Not tainted 7.3.0-rc7 #1 PREEMPT(lazy)
  Call Trace:
   __remove_assoc_queue+0x20/0x80
   mmb_sync+0xba/0x300
   beamfs_write_inode+0x45/0x190
   __writeback_single_inode+0x480/0x630
   writeback_single_inode+0x11d/0x4d0
   sync_inode_metadata+0x46/0x70
   simple_fsync_noflush+0x55/0x90
   simple_fsync+0x16/0x40
   do_fsync+0x50/0xc0
   __x64_sys_fsync+0x13/0x20
  [...]
  rcu: INFO: rcu_preempt self-detected stall on CPU
  RIP: 0010:mmb_sync+0xc0/0x300
  [...]
  watchdog: BUG: soft lockup - CPU#0 stuck for 48s! [dbench:16440]
  watchdog: BUG: soft lockup - CPU#0 stuck for 413s! [dbench:16440]

xfstests generic/241 (dbench) on a 4-CPU x86_64 guest, kernel vfs.all
at 2c3ba1f1cb41 with CONFIG_DEBUG_LIST, PROVE_LOCKING and kmemleak.

A thought, not a patch

The NULL is observable only because the buffer is unlinked and then
relinked. Keeping b_mmb set while the buffer merely moves between
mmb->list and tmp (list_move() instead of __remove_assoc_queue() plus
list_add(), clearing b_mmb only when the buffer is actually dropped as
clean and unlocked) would leave mmb_mark_buffer_dirty() nothing to
race with inside mmb_sync(); the lockless check would then see either
the old mmb or none, never a transient NULL on a buffer that is about
to come back. I have not written or tested that, and you know what
else looks at b_mmb.

If a fix is wanted, we can run it against the module as it was before
our change, on the same guest: that is where the race showed, and the
same test passes 24 of 24 trials with the shared buffers on one list.

Aurelien
