Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640979;
	b=1AiPCDb9r1nZ62EdfzMmIqY6NxPZdQz7cJR4NvhNQK9TR8zM3rPXX0K/LDpIZh26EftT
	 LqgMuNClR99ROQF+UssmpkQd0UwwcbL9KvApUE6/uohHHUFM/e/6ie14AhGuelcyAkIXA
	 S1rbGLkL50/9HjXjg8hkCDe7/EqTkBKPokweVOfCKYde5SbPezAtvu9H0gV8A2gadjom0
	 w+AgNS7dAEGGNjdbxyLWDiZniz/rRt1WX1ZLuJw46F9Q9L29jrUVy/PPYet2BmTgPPwLs
	 FKQ8Zm6Bugu4MYQXwo9G5KXt3DbV53CYC2kK4uJxVPBVbgj4Ltx64lEH0S/kEoytEsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ElUJWOdoo11axaVjJS7g+O8dXrqVocWR0XYxanpNOCM=;
	b=ZjCUndZgV/Lnq7M8RmorxumrlqDGc/tJdbd2kh0TW3aYyylKejFPX0BJ8kHT/BbU5KDI
	 hFiezQVjpRMIKM1xzFkOt2OSiZPCxn7B/GAA7cOyOYvqlMxJ96kR0AakIANx4wB8Ie4+e
	 gPGRnFbIqT7xF1kLbDLrGPNhnMtXTAx5L7xUeN+5dJ/DXpytiZO7N3Tp2U4n3+VQmjBA1
	 97DsoQhUZ1QvE54TTvG/YOt3/DmcJbAWOYugS9eKpadxzad1SXuLlfNV7l0apkxNmiOZ+
	 cto0KmMRehgDgRtNweFcuXrfNsVqsx84U82fXdDXfMw0ogJUxgN1mne1VIrjBxutJVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yzKch8es;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2E0606A5A3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC2E0606A5A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yzKch8es
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ccca948203aso1221249a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793640978; x=1794245778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElUJWOdoo11axaVjJS7g+O8dXrqVocWR0XYxanpNOCM=;
        b=yzKch8esjQrEKcQH3riAxIKTubwAXtuBXQ97tW7DzgL1hPoMhkQAtm6Y73K0Q1w4vY
         dsdxc1zMKGFC2G0Y9ZVpNLsi7IVSB0YXDlsKPMXF7AOEAnk2g+N7wBS8jfdWCAQXzbQC
         6QxrVW9Hy1uOjOrxHtXFN2wG5+cpH7YY2uh20LhKP0mPTwYj7rKPFDOBAjJmIfB3KHHw
         eSp5xfyqeem0WBpEvdHEKXWBkVzTXCplcstPRNXjKlGUTePvi+N3bRq/pdoCOfBUY+yx
         ern1LxJ5vKnTbk21x+H2jHLeSpv1DzMH84/LQjb+vcJJjesGh3ciX9hn33fT8Gu+uCBd
         Pl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640978; x=1794245778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElUJWOdoo11axaVjJS7g+O8dXrqVocWR0XYxanpNOCM=;
        b=LGE9ZsZ2ot9790c5a+tZ/n4sjDHvvLXpW/rkzbaSLB8i8/ogqZUwebdHFms5cO+L++
         32nuoybNf3DPV1MoGk6IKax9Yxy/xTvhdtwatR3o2IAY5VAzNixAurGTqBvXKpQjpnyd
         dH0CStT5bpqKU6ICJXJqxTZH+BD4qC7mD+IQ3PFL1bjT0lloh/eXQZoEJoHKGpc+7mAO
         9PRTXzbwz4U9xvuun+iA0cm1GZIAeJHXacL0fZ3ZxviKn59YN53aSc3Qkb2Y4Q5xhse8
         WjG4ZVVE8I6OG3nneJOZtdOHfsIPo05WfhEetc3qpam0lMFXv1fQEZl8fz8HTD/DDB/C
         fXuQ==
X-Forwarded-Encrypted: i=1; AKwUvByl+B2/vv/KOHOxRpM8RO5ehBeZ/LPcUJ2S2JzLJKbYoj9UJHJF5tWfIgWR5/Z1N+tmDxfowjr/3Tk5NWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Flx6OqDMLC1UyS0cZgKYwoY79HhGPf2n6+8u1QJAE8ulhi6/S
	pF+H2oFdV/bqXWstJ33ky0VpfkIIYixSN15JjStZ8uIlrbERWKXyC587
X-Gm-Gg: AYBFou1Y7ZLqJuSGswATuPoZtz8/HClQ/y42vhL2mUdsinFbo3JR5EL3Y93ERWjeLAe
	fdIN3/sge6qS3lxvKs8Z/BdWQLWthT4xT4gQthwPJyBNqpGhOY6MLd6iv83GNWtEY6utNf6POMh
	muu2lt2wvKHW+xhdA06M635833sGQMB/rwZJpzJo5Fu/C4EZwVpTXZFef/YIvA91vJPYItvpkB/
	Lj8TvdTdRsDKu9ZhZ2bVMRT/I8+xl1ndYZl8icJJxwjdp7Difg07aYoyQXbvliSmIN8Sti1+X0h
	8KSudbfw8XOOvfieuIl5wh6OF7U99dnQmYJkvLezUbjaGTVUTvfrcm6b7CQlfUC5QadRDfmEwYc
	xLHIFMMjYMyRI4o/hwSzqaRbrYtpGzZQN50J3WR94Yf2XVegI5M3Ay25QHGrCQYPAvkqKbGV36n
	aO8Z9ewuWYDnFSDNrBFrmT8/M5e9uPpx0yXwz5cW20XkHRHErx/t9IbOfrnbZjKA2cj6DlCgnDG
	QchY8ZcBZ2/Q9NjgONz6xAD6q91WQbcga3hsDSJ5AmKv7laKYIQB8vYDyV44TexOh2ZCya0g5Oj
	s8f9uz57RyE4zwRslledI0mAbz2FTvjVJsPmiM+kMExB9pmaR92dlkOSnWdg+Eo3Uw==
X-Received: by 2002:a17:90b:3e89:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3ae895362e9mr9184522a91.4.1793640978092;
        Mon, 02 Nov 2026 09:36:18 -0800 (PST)
Received: from localhost.localdomain ([61.255.248.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c666cdcsm142858a91.11.2026.11.02.09.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:36:17 -0800 (PST)
From: Song jeonghak <thdwjdgkr123@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song jeonghak <thdwjdgkr123@gmail.com>,
	syzbot+250fde257a3eebba4426@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] jffs2: keep alloc_sem held when a write retry cannot reserve space
Date: Tue,  3 Nov 2026 02:33:42 +0900
Message-ID: <20261102173342.314251-1-thdwjdgkr123@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When writing a node fails, jffs2_write_dnode() and jffs2_write_dirent()
retry once in a newly reserved area (jffs2_write_dnode() does not retry
for ALLOC_NORETRY). For allocation modes other than ALLOC_GC they first
drop f->sem and complete the current reservation, which releases
c->alloc_sem, and then call jffs2_reserve_space() again.

jffs2_reserve_space() returns with alloc_sem held only on success. If
the new reservation fails, both functions return an error without
holding alloc_sem. Their callers expect alloc_sem to still be held on
error and call jffs2_complete_reservation(), so alloc_sem is released
twice. syzbot reported:

  WARNING: bad unlock balance detected!
  syz-executor317/5670 is trying to release lock (&c->alloc_sem) at:
  jffs2_do_create+0x1ae/0xe00 fs/jffs2/write.c:474
  but there are no more locks to release!

As mutex_unlock() does not refuse an unlock from a task that does not
own the mutex, the second unlock can also release alloc_sem while
another task holds it. This follows from reading the code and was not
observed in testing.

Take alloc_sem again when the retry reservation fails, before f->sem is
taken again, so that the lock order documented in fs/jffs2/README.Locking
(alloc_sem before f->sem) is kept. jffs2_do_unlink() already takes
alloc_sem without a reservation in the same way. If the reservation was
interrupted by a signal, this waits for alloc_sem uninterruptibly, as
jffs2_reserve_space() itself does when it first takes it.

Tested with the syzbot reproducer on mtdram: the warning is gone while
the failing path is still reached. The jffs2_write_dirent() path was
checked by code review only.

Claude (Anthropic) was used to help with the root cause analysis, the
reproduction setup and drafting this changelog. The fix in
jffs2_write_dnode() was written by the submitter; the assistant adjusted
its comment and coding style and applied the same change to
jffs2_write_dirent().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+250fde257a3eebba4426@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=250fde257a3eebba4426
Cc: stable@vger.kernel.org
Signed-off-by: Song jeonghak <thdwjdgkr123@gmail.com>
---
Testing details: next-20261023 with lockdep, 128 KiB mtdram with 4 KiB
erase blocks. The warning was reported in 6 of 7 runs before the change
(the cause of the one miss was not identified) and in 0 of 3 runs after
it; in all three runs after the change the failed write and the -ENOSPC
from creat() are still seen and no other lockdep report appears. A basic
test on an empty mtdram device (mkdir, create, 20 KiB write, rename,
symlink, unlink, remount, filling the device to ENOSPC, remount) passes
before and after. Not tested on NAND flash.

Two pending patches, "jffs2: Fix a lock leak in jffs2_flash_writev()"
and "jffs2: fix wbuf_sem leak on summary failure in
jffs2_flash_writev()", handle a failure of jffs2_sum_add_kvec() inside
the write-buffer path in wbuf.c. This patch is independent of them: it
fixes the retry path in write.c, reached after any failed write whose
retry reservation then fails.

 fs/jffs2/write.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index cda9a361368e..0ac3220e7b05 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -147,6 +147,13 @@ struct jffs2_full_dnode *jffs2_write_dnode(struct jffs2_sb_info *c, struct jffs2
 
 				ret = jffs2_reserve_space(c, sizeof(*ri) + datalen, &dummy,
 							  alloc_mode, JFFS2_SUMMARY_INODE_SIZE);
+				/*
+				 * jffs2_reserve_space() drops alloc_sem on failure,
+				 * but our callers call jffs2_complete_reservation()
+				 * on error. Take it back, before f->sem.
+				 */
+				if (ret)
+					mutex_lock(&c->alloc_sem);
 				mutex_lock(&f->sem);
 			}
 
@@ -299,6 +306,9 @@ struct jffs2_full_dirent *jffs2_write_dirent(struct jffs2_sb_info *c, struct jff
 
 				ret = jffs2_reserve_space(c, sizeof(*rd) + namelen, &dummy,
 							  alloc_mode, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
+				/* See the comment in jffs2_write_dnode(). */
+				if (ret)
+					mutex_lock(&c->alloc_sem);
 				mutex_lock(&f->sem);
 			}
 
-- 
2.43.0

