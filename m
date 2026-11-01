Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793517293;
	b=F+M8aQc3IiTgak4BregBPSt5CyOwPWO0vQZnef4kL2D/10/OwUy+hqdCSPXcy8tAF/KL
	 iuRpwgYzdNG+NMqTal2Z33HVKmWZeImtYnWkjbRNxKu9aUSBdj08PYtGXqCuogGFt/UW0
	 fCIidlR+mClqWN2YOHy2p/8c+zb00NScL5C5XOdAF4zkSRY0Gdk44rUvF++i56zL47ufo
	 JUG2Ugg6dNuwRK7etDIYr/ola0SOlsjAcY2h6xSsVxwcGVjj5yTbvY73dPHKfcAw6NUvs
	 AcJaU7YfPriE3xazbN1MHBLFvGCV7avqrC8Y8hiUjC+lG/uvDUyWzk8efKgdU7xOGMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793517293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yk9QxCaKNnBQ8oh8luvc3kRXvhxo2lpzgt6RtHaF6AU=;
	b=BvJbwyHCmSS6LvCSAxOTUFN/wGVCbTErSftjPMBas/98e8GNJLt5BR61L1nPJlzyQFvQ
	 ztnyPZzMcLuMflaFRy8x3Ss36f2cCd0lHVfb42vvczAnEAfQIZxX4lc/QjWX7wQNBeCLP
	 IKoUCgZEocqPX1Yswz84PjbhitrGwD1P0gg/8hD8qOS73zwBqZcoj6PlGR+VwF4PJiHtw
	 3ZC4LXKQR7PKSFtlW/AgVAVXdO/LXPgaQkLHFBLhPEG60RkYqm1HOWJXxtMra7CUhatVt
	 puPyIUxAX0ZkFh3L95T4nQ8A4HaNpEc9Kp/VZGYTEvYmtHE/yr8QNy8oiRHePVaqfdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zCK6ZVLc;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9786C606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9786C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zCK6ZVLc
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so1975212c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 00:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793517292; x=1794122092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yk9QxCaKNnBQ8oh8luvc3kRXvhxo2lpzgt6RtHaF6AU=;
        b=zCK6ZVLcD2RVVaUGjof5FMJeAPYSBuqRExRpEv+YsiVBt5YL0uVzAcFm1siDT2UAuX
         U9DeI4VlWnSS1YHwr/reN87PTHmFd5nzPtJh4MT1U+AIaVlnaKvH+kBr4V425LXe/LT/
         2/UQXH+6Qp6+1ZY7Grc8SglkFyhc8mFjA+coTGhTMy4A+M2lScY8p4C4r5TBLMMno2kz
         +K3bje89mIlAOyJSYCYR4AHtYqGyG40UYhQmO3hKxui/D8KzI4o5J/hy8G43lwmKZebN
         x3WsVMNph2MSV+DrRtlWmNdRN57ZJiS76HzCodu9OSUY+poMjBDC5FbHG0qsR7DJrqLQ
         +xCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793517292; x=1794122092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yk9QxCaKNnBQ8oh8luvc3kRXvhxo2lpzgt6RtHaF6AU=;
        b=RCYwPN/i8reKVU8K6UWyG3FtC3Nv9e4QVAfveMd8ClFDUUdOE7IMfW5vIPUuNZes3x
         ZW98IUeNbaJpMKWSzu/mw84uPZ+ZbVpo3WwB/qUWO0g51GuXyU7w6bAaIdfkizqFNtUL
         IFU22RCX7SM1lf3ZuLvGwek4CM/HvX7SR4wEKeSqTdw9nDkMt+kkb+skdfg13tshrjtA
         ZOpumFBngUNtOTXUF70Oe0t7sX0sl9jnpbr6CtNY18M3vppIzaGtkWfGehH63cC+W8u1
         napgl9OnKmfemJHCAu2iltGzWPahrUcDFpd7Oj9oO/+NkBcC2PKjukZW3pkmDD+na1wq
         E1iw==
X-Forwarded-Encrypted: i=1; AKwUvByOzOWFaxW3LmXadt435nVeRMzOB0EPOGHsG/AtEbq01+8WCi1dULBPVtBRID2CT+wcVCsElXM8VFLvU0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2ldCh/WLymORmTwIYWpv4Ejh7b37yExcUDP4iyLJH/wNgkhBx
	abm2PVN7mVx4EtO5PEkfCsussE7aqWLLPphznHKSJvOh3WGH72nWeyWTBCpuprbS
X-Gm-Gg: AYBFou0acA+zIFiaoMGQQj+zOGCzRY5h06uh4EPE1pfb6ikvqtda/Lsg/lxEJ+5Caag
	upFvtGCum0LBdrj1apezw3wQCy/Yb2StkHpjwUPcA7uqiIOaVfDWV8pDgPeBn9R2oTrNX2utmrz
	VSd4gQPh7DtTM9Xq78Me3iIasxk+VvgXBWJ4p6WHyL0RQZ+eX+r8NCSVlYmLQq4G7YQyVFAg83q
	tgTY9accCKGcw8Ug41/ORmxoUCRx+F0eN4GhM8fPKpDEfkiUNF0eXVMGl0vtw5caseeu7mdpg+K
	4GxoWS6BkinA4YEEW9f5EZrSZIXtgA1V8MW11Blmm8JC7/cvCzMhFbh3z/8NtPa601Nufy5KAp4
	in6g8mVM/V0XMP+e4nPVOcvkZhQ5PVWoNoIkiyvj+TZLtGMpME40j4/cJQng0pZg8UQmCZg5WNh
	Zu/ZT85wD/xzuCGIZuSWuGhQlq/p9auaNsqx8DHDaZJB0DVz9RN4KyK21xsWyuhFPF00LweU7rq
	n6TlLyV5Vv00aAiFShWBtU539wlCDNLvuxWgQGysImiKdqE++9Ftx6f+Td9d84CVmDuir1AfXfP
	5TQPrTH0IHkYd1vuUETzvLpPCp4y2NyVuTDEDLDJ3yCDZyZ3+F4e0EECt7QZNVaxdmxo
X-Received: by 2002:a05:7022:f116:b0:187:7514:47f4 with SMTP id a92af1059eb24-1ac5d1cec2amr8941445c88.46.1793517291435;
        Sun, 01 Nov 2026 00:14:51 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm25123406c88.11.2026.11.01.00.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 00:14:50 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>,
	Qu Wenruo <wqu@suse.com>,
	Filipe Manana <fdmanana@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cheng Yongkang <teel4res@gmail.com>
Subject: [PATCH v2] btrfs: handle zero num_stripes in btrfs_chunk_item_size()
Date: Sun,  1 Nov 2026 00:14:44 -0700
Message-Id: <20261101071444.1853699-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

validate_sys_chunk_array() calls btrfs_chunk_item_size() with the
on-disk num_stripes before btrfs_check_chunk_valid() has checked the
chunk. With CONFIG_BTRFS_ASSERT=y, a zero-stripe system chunk trips
ASSERT(num_stripes) instead of being rejected:

  assertion failed: num_stripes, in fs/btrfs/volumes.h:714
  kernel BUG at fs/btrfs/volumes.h:714!
  RIP: 0010:btrfs_validate_super+0x3ce7/0x4210
  Call Trace:
   open_ctree
   btrfs_get_tree
   vfs_get_tree
   do_new_mount

Drop the assertion and compute the size as the chunk header plus
num_stripes stripes. The size is unchanged for num_stripes > 0, and a
zero-stripe chunk now reaches btrfs_check_chunk_valid(), which rejects
it, so the mount fails with -EINVAL.

Tested on btrfs for-next d1dca33127ef with CONFIG_BTRFS_ASSERT=y and
KASAN, using a crafted image whose system chunk array contains a
zero-stripe chunk: without this change, mounting it hits the assertion
above; with it, both read-only and read-write mounts fail with EINVAL
("invalid chunk num_stripes, have 0"). Mounting, writing, reading back
and unmounting a normal filesystem, and btrfs check on it, still pass.

Suggested-by: Qu Wenruo <wqu@suse.com>
Link: https://lore.kernel.org/linux-btrfs/d2ee0cc1-674e-4447-88da-d346122a43a4@suse.com/
Fixes: 2a9bb78cfd36 ("btrfs: validate system chunk array at btrfs_validate_super()")
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
Changes in v2:
- Fix btrfs_chunk_item_size() as Qu suggested and drop the early
  zero-stripe check from disk-io.c, along with the comment Filipe
  reviewed.

v1: https://lore.kernel.org/linux-btrfs/179328314071.648427.12527832319954042748@gmail.com/

 fs/btrfs/volumes.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/btrfs/volumes.h b/fs/btrfs/volumes.h
index d5fe5cba0..891bc2432 100644
--- a/fs/btrfs/volumes.h
+++ b/fs/btrfs/volumes.h
@@ -711,9 +711,8 @@ static inline enum btrfs_map_op btrfs_op(const struct bio *bio)
 
 static inline unsigned long btrfs_chunk_item_size(int num_stripes)
 {
-	ASSERT(num_stripes);
-	return sizeof(struct btrfs_chunk) +
-		sizeof(struct btrfs_stripe) * (num_stripes - 1);
+	return offsetof(struct btrfs_chunk, stripe) +
+		sizeof(struct btrfs_stripe) * num_stripes;
 }
 
 /*

base-commit: d1dca33127efacd86ac550aa86352f8ea9f29a5a
-- 
2.34.1

