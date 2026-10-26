Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793050590;
	b=YgLg0meNAFtu+/cdVnQe+W4LiMLaG8yzuNLnkrbSSxVUriNntATmA+G6LPZeqyNh0QQD
	 kNIEEtgA+VSbECceQCd1YFKf+EEMkEEQWa7dPnpVAuav3tD/8nzYYFpfN/j+h1Scutf9D
	 +pe1QiU3+C7Z+RksqHEGXebC3jcPsOfp7CzZvBAsZYAA+WHeJyONnVQoJll9/tA01JMbn
	 xoJ2rrh59eN9mUPFg+C0XQlJi4EPITwnmvZ1N/SsgWu0wq4fmyN7jyXCwIeZJgAV9c6ku
	 EdVlJvhQcuEhCky1QmOE2C2pYfi0Sk0dXXG4uz8Haoikyyos1HFm2XExbFng5KQXxrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050590;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dDFWPJ5XjzGS4FuGMJGtbP6vWBRuxVwEHY2kwulZBI8=;
	b=RXrHxCWmSTQgd8nSkdAQZMs/62yxTIPIVk26Sbbn1MvkMvI/b7nKXrNNW0XacUcdNoD5
	 iHBF8ySlYNPco8YrGX7k+gEHRzynMwfDku+VjS+gqJTzJCRBrJv2QLKrXEHVpFkxQVut0
	 dNg0sdMnr2zYPw61Hx9b187uKDES8Z722Cbn8IjzIMJwD4BXCZToqj/8ee38458Tq5Rup
	 eU4a6gsFoT8tdHsAO0UbBrL2lLLUAuh8WSQbtH0Xghwdni02lD/c+FsbSL/U0GO35pvCi
	 SxVIlT0qRY6RmUor74h7rJAfznN4nPWgQyzUUzdt4NxLy0o1Y57X5ZuM1IxaIxCZDTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hackers.camp;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3592606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3592606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hackers.camp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a215344409so6098515e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050588; x=1793655388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dDFWPJ5XjzGS4FuGMJGtbP6vWBRuxVwEHY2kwulZBI8=;
        b=jqcVSuW9IkuBRvelrVPr4vzvK3hN5T1ObTcTiW38gCbN2MCbYfTr85IsM5dhUySlVu
         9rxm6IOQYblHoRj6rmiSTnwdM7NTuLhCn1MlsDsK70QZWK+687XbnceWDhF7Wj9H3kPp
         03+Xi3c+yWsTzOEOQ5uDFuwTc6dVa2y6kaNB/0qw4YZsaFoTwHO9pTxV8uBKENIc9LUV
         zdRmT0WX4URAxeqTNkNnYGXwo1cJToSYHHJ19bSDsZ5PRxCLmybWFSs0br7lAPLg1Z4L
         L93/I4UYNr7bpXffOVMxru+nuQPpfxM3ijHRQ0h7y/ppgAH9V9Nyjon1v7LtqIP/hSv/
         cILw==
X-Forwarded-Encrypted: i=1; AKwUvBxGn4O0F8JyhlsMMB2CWS4ssxNVO/5qmQOxxHbnR1QdKhjw7bylbCwLJ4wTEzi1moFQHxUlnMCvslLNWB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+b9gI4ayjGiri0GWsX0t07hiqf/LaEDw1booyhjHsrp/zcdB/
	0zA6f6Ep70k9szHVyskyI7o39lYH33L2OzmvDtSrqNWODRxJmxDrbpTJ
X-Gm-Gg: AYBFou3J1p3Y6Nucblqf6Humgwpc6IWnhV50eQkPVA23s2qQVvOYJO2Hr1GKKSD+fLi
	cA/JkfBtuRQuaBHeD4bMKwd9XdrvedCatWlOTaFoTPAfZU1/6jDLFkpnQnBcJyTSyS19uFQiYGs
	J8Tkx9tk5uq6BTcR4qTP2fD7f13jtzebjv9zBmGGzXWwDm8xAXOLSaFSi9prBMXiJSGLK3IQMx2
	PJL+ngStMMs866QBlq0nNB6A5KEvFOn0lBHwshQUAG6Quxv7EDmKG3KT0vMJOh/R7AphQML7p4c
	TWwSx2cOIxEHTjIz6dR+BCghNHAIG3cg/KV1/a1Eu/TZNB8EjXKPhP4vdjBa648GO9qBWgTtIyJ
	63zzBGaEb8GJnMW7ttCkKEgI3RbtNlwZO7sUJCbKmOW2hwDlP9Sw+1HrmJE8wHt63patSmfzEz1
	ZjIIxXjfpyjAHRAJ2kSlWOgMr8RlWaF3HZN526QtLeNt6kppfUNCAIe6wUnLgslnbQSeStHNedY
	RG6LFl2JApowx/BptR4BUwXL4RhLBjDqzJLUYw8U+72t8YvzgBgu7WYyxfmAlcqbyk46v/7jUFW
	0s6Gr5Bt5+ud7rsHsw==
X-Received: by 2002:a05:600c:6206:b0:4a2:6ef:d1dc with SMTP id 5b1f17b1804b1-4a35ac6fe89mr141539865e9.1.1793050588225;
        Mon, 26 Oct 2026 14:36:28 -0700 (PDT)
Received: from spartian.home ([2a01:cb1c:76:ed00:602f:c5f4:d108:b925])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2c0458sm218806205e9.11.2026.10.26.14.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:36:27 -0700 (PDT)
From: Aurelien DESBRIERES <aurelien@hackers.camp>
To: jack@suse.cz
Cc: brauner@kernel.org,
	willy@infradead.org,
	viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aurelien.desbrieres@gmail.com
Subject: [PATCH] buffer: warn when a buffer is attached to a second mmb
Date: Mon, 26 Oct 2026 22:36:26 +0100
Message-ID: <20261026213626.301480-1-aurelien@hackers.camp>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <q472nkbfcfdumbxm3cebfnnmueqyl6uhhnper5t6e2cxajpvtu@7prjjo7k6ia3>
References: <q472nkbfcfdumbxm3cebfnnmueqyl6uhhnper5t6e2cxajpvtu@7prjjo7k6ia3>
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

mmb_mark_buffer_dirty() tracks a buffer on one mapping_metadata_bhs at
most. The per-mmb lock does not protect a buffer that changes lists,
and mmb_sync() clears b_mmb for a moment under its own lock, so a
filesystem that attaches a buffer shared by several inodes to each
inode's list in turn corrupts b_assoc_buffers eventually. With
CONFIG_DEBUG_LIST the list_del is refused and mmb_sync() spins on a
list that never empties, holding mmb->lock: seen with beamfs under
dbench (xfstests generic/241) as list_del corruption, a soft lockup and
a node lost to the OOM killer, with nothing naming the filesystem.

Warn once when a buffer already tracked by another mmb is marked dirty
through a second one, so that the misuse is named at its first
occurrence rather than at the corruption it leads to. A corrupted
volume in which two inodes claim the same block reaches this as well;
the cmpxchg below keeps the lists sound in that case, and the warning
then says which filesystem believed its block map.

Suggested-by: Jan Kara <jack@suse.cz>
Link: https://lore.kernel.org/linux-fsdevel/q472nkbfcfdumbxm3cebfnnmueqyl6uhhnper5t6e2cxajpvtu@7prjjo7k6ia3/
Assisted-by: LLM
Signed-off-by: Aurelien DESBRIERES <aurelien@hackers.camp>
---
Tested on vfs.all with beamfs, x86_64 guest, 4 CPUs:

- the module as it was before our fix, attaching the shared bitmap
  block to each allocating inode's list in turn: the warning fires at
  boot, 8.6 s in, on the first truncate that frees blocks of a file
  another inode had allocated, long before the dbench run that used
  to corrupt the list:

    WARNING: fs/buffer.c:639 at mmb_mark_buffer_dirty+0x46/0xd0, CPU#3: S01hostname-cmd/111
     beamfs_write_bitmap_block+0x191/0x1c0
     beamfs_inline_free_blocks_from+0x64/0x390
     beamfs_inline_setattr+0x127/0x4c0
     notify_change+0x33b/0x520
     do_truncate+0xbf/0xf0
     path_openat+0x8c1/0xaa0

- the module with the shared buffers on one superblock list: no
  warning at boot or under the filesystem's own tests.

 fs/buffer.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/buffer.c b/fs/buffer.c
index 1dc933ba6925..e503a7ed9c37 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -627,6 +627,16 @@ void write_boundary_block(struct block_device *bdev,
 void mmb_mark_buffer_dirty(struct buffer_head *bh,
 			   struct mapping_metadata_bhs *mmb)
 {
+	struct mapping_metadata_bhs *cur = READ_ONCE(bh->b_mmb);
+
+	/*
+	 * A buffer is tracked by one mmb at most. The per-mmb lock does
+	 * not cover a buffer that changes lists, and mmb_sync() clears
+	 * b_mmb for a moment under its own lock, so a filesystem that
+	 * attaches a buffer to a second mmb corrupts b_assoc_buffers
+	 * sooner or later. Name it here, before the lists do.
+	 */
+	WARN_ON_ONCE(cur && cur != mmb);
 	mark_buffer_dirty(bh);
 	if (!bh->b_mmb) {
 		spin_lock(&mmb->lock);

base-commit: 2c3ba1f1cb416b81d617b92a24a4bcaa48d574e3
-- 
2.55.0

