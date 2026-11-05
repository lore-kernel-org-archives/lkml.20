Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864084;
	b=HeGQj4eekUW7mcI5W5Khkrb7p7Yg5JEhPG8FjtTB59FzSiuQ8hZKwmChgtJoFAG96uGD
	 vpPAD0PYlVQgbyC4j9/qVwhZXzDU9Mx6q/sD83lUGBzWi/Jxw1DOr10gQPZbON4pYSUHS
	 J017BVSWRt80QyERmdba5q5QU6fdXz3KuHH+gXGF2GqaTmn4z63FksbY7l9JTh1GpOwYl
	 o2qXm56taU12IxJ4jd6SjrsS0msyV7fPhEHbL+9l4mgCsBScKqk5HWXFYoeAB7n0QCLvR
	 GlFMnwEbQVYK56XIpuabHlBFa8yi5K3Fc5raNp+VlDegWhDohE+Iq0xpklm+uN4EKmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer;
	bh=HJuLq57E7BPGIjqWOOCyxznSzjq43LL+ol+MdavMl/k=;
	b=gK9BBXZZpiPgPqpDpdzgkeiH5TMxXmAJfBba+FY3SZwYErYyJvd55CeAx310ofF5wX/j
	 hFAYe/JSho5rRzIbcWb/Wy3auy6QUNzcnoKaPXwFlB/UF+WpaX8x56spcHvAnWH7eZjKb
	 yVOuUV7qdBfxWXWyzgM7gF+KysZOkvMIYHgsUaPF91O28x18TG/LsNyPGtye4DgBtaYVg
	 OwfCNxIl3WHVwqWsIgv+yhlClx4UC3oH932rvJ0s7Y8+8kXlxuHOvrMI1eIXLJZtdTpRI
	 cyHLigztOZX3rnVgwPoQz46m1NXUluPsBaglg1tSRWF7wMClYDoWKBvC3Gatiu/3x8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvzSIrrZ;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D32606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D32606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvzSIrrZ
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ae93a86008so1049307a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793864083; x=1794468883; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJuLq57E7BPGIjqWOOCyxznSzjq43LL+ol+MdavMl/k=;
        b=FvzSIrrZB6TBBHXHnLRdGuXyb0NM1ozQxD9fH/kTR5Sp+ENz4UcRFvhjnWRQIpdIcj
         536Kk0W+Ysxl9cqHnYZqnzOvErSoOLI4eflCaaF4LI/635j3Y5V+H+tWekjunXum795X
         eJ2tv7M3Zm9z4DSvhe7Xy2Bmd5lo5xr7Pd5QbAmwvkx9HDbSJh8gP5iUIbZk3gOC9xAR
         7jRhOn58yJBjoNjje6OA0j3Vm7s7Y/ed34AgapnhemCAn7lh010KCqzBxsMJ+AG/Usdu
         YFa7NsIbrsQiXcFWS0p5KXRqzgBztoGPESMrTE3zmbcx8nhcy6mmTQO+w0Xs7OcUxkbL
         JU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793864083; x=1794468883;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJuLq57E7BPGIjqWOOCyxznSzjq43LL+ol+MdavMl/k=;
        b=xKn1gB8DFy81hov4vXVNgBaax1VDXRL+yNsnHzDrgP17CYJVEaWUwwtuZmGJ5rAeyO
         iOGdyHeRL52ebipZIsaLj2SSJ2YPXTXEl8dAiqEGN7yTuiXbzdmfZJNntdNmNNwZ2d1b
         51sPv8tCDyNiXvIqNp/Z64TOyiUqQ2iASlsakQRGdBAS6KiKAGIUQ0LP/qXOPtmdhXpB
         yS5MAgOE+REdEYTDIOt91ZOYK4/fsaVqcMkiZk9SYubxp6bbxmoIlE4e0fOtKeTB1in9
         rXIzQDL1cK2ulr7sTkkPhr/dmQ79JXkHh30VTOZ54EMSp6Svqd5Lk6Hdm8XXnBRUwDU6
         Beyg==
X-Forwarded-Encrypted: i=1; AKwUvBzGr9SdX1JnQHH7KZ1t8kBjJfgOP25zP4RS4q86PbvPXN5omGJOMmdCsgYI0u6TU8mKnv/RcRl86FCaQ88=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3SJI7gEwkpZ3qRos+BcTx5Rau4qX76CLpb7MNvbxqOhOv7ZS+
	iTxKW6t2nQIJFTXT3pjmOScK6JIrMacNW/+ezR1fBEfz5XYpLs9TLSI2
X-Gm-Gg: AYBFou1bAwl1IEnt/q0rnaDtk3ZCSybGj8hAYOJwYm6aFYjjGyfKKkMvY12Ok95May+
	lttXVMAQUuEVssYtdWemIdTKBOYi1O3d4IFILBwXoZ48KH0Bf+Cz04r5WHxhRzd51jc3jsd/F4B
	RqIQ4q7YqtoQtHOOsXC2dZ+oNhQ+lqOFFJ8S1tEkVPzZG3nzzQuYSmNThLiPiVVF0Jph28z6g/X
	AvWdVfpIYJF71uWeoQKCXpd9tOc6ZSuTTez7EDtjlFrxnZTxCfrFD64O30uxKYKpASs1SZShN3L
	FXSo+aARU3q1RjHtcb04YHuFJIwWSxiONIWhnzyuUuO3ljAQXfA5mt3HSd7QnYzWf9qb0K6h9/s
	Wj4NA4wbg9vQrlvICW1CC6kZzqTo7qxouwJ3RCZVPh22OeSZIBQLRX+2fXFASoG58Q8RveVlnXz
	UYxy1/C16Uy2DgmCkL3CiPRS/+NXL7J4uj/WigTYHC+wxaHFC9pekIjw0TGKpz01R1krH8eYYzJ
	YgiwLEDELq9E5CdSJpGBk244DBba0yR2xnkM1rVnQW2JPlpounUyz/Fz3aXNbJt2rV+3Jo9MDnl
	1MVLAWzKUvrKw/UERbAAhA==
X-Received: by 2002:a17:90b:4b92:b0:3ac:86a0:5766 with SMTP id 98e67ed59e1d1-3ae897fb684mr15091965a91.63.1793864082940;
        Wed, 04 Nov 2026 23:34:42 -0800 (PST)
Received: from hhost ([2409:8a55:3161:10c0:6a05:9852:2c87:88b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b312e45dsm3146052a91.3.2026.11.04.23.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:34:41 -0800 (PST)
Date: Thu, 5 Nov 2026 15:34:04 +0800
From: Xingyuan Mo <hdthky0@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: "open list:NTFS FILESYSTEM" <ntfs@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	Xingyuan Mo <hdthky0@gmail.com>
Subject: [PATCH] ntfs: fix out-of-bounds write race in NTFS_IOC_LIST_STREAMS
Message-ID: <20261105073353.433854-1-hdthky0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.43.0

NTFS_IOC_LIST_STREAMS walks the base inode's MFT attributes twice:
a first pass sizes the output buffer, a second pass fills it, both
times filtering out streams that ntfs_stream_unlinked() reports as
unlinked.  That filter is the culprit: it treats a stream inode that
is no longer in the inode hash as live, which is precisely the state
a stream being deleted ends up in.

When a base file is deleted while one of its named streams is still
open, ntfs_cleanup_deleted_inode() sets NInoStreamUnlinked on the
stream inode and removes it from the inode hash after dropping the
MFT record lock.  Nothing serializes this against the ioctl's two
passes, so if the flag and the unhash land between them, the first
pass excludes the stream while the second pass includes it, and the
ioctl writes an entry the allocation never accounted for.

The per-entry bounds check cannot catch this divergence, because
"offset > required - entry_size" underflows when entry_size exceeds
required.  With a 1-character stream sizing the buffer at 48 bytes and
a 250-character stream surfacing only in the second pass, a 544-byte
entry is written into the 48-byte kmalloc-64 allocation.

Close the hole in two steps:

- Reject base inodes that are being deleted before walking their
  attributes, like the other named stream entry points in this file
  already do.  This also stops the listing from reporting streams of a
  deleted base file as live, which is reproducible even without the
  race.

- Make the bounds check underflow-safe so any remaining divergence
  between the passes can only produce -EOVERFLOW, never an
  out-of-bounds write.

KASAN report from the reproducer (timestamps stripped):

BUG: KASAN: slab-out-of-bounds in ntfs_ioctl_list_streams+0x7a9/0xa00
Write of size 500 at addr ffff88800b1931a8 by task ntfs_ads_race/305
CPU: 2 UID: 0 PID: 305 Comm: ntfs_ads_race
Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x73/0xb0
 print_report+0xd1/0x610
 kasan_report+0xff/0x130
 kasan_check_range+0x10c/0x1c0
 __asan_memcpy+0x3f/0x70
 ntfs_ioctl_list_streams+0x7a9/0xa00
 ntfs_ioctl+0x3b6/0x420
 __x64_sys_ioctl+0xd1/0x120
 x64_sys_call+0x2a5/0x2220
 do_syscall_64+0x109/0x5e0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
 </TASK>

Allocated by task 305:
 kasan_save_stack+0x3d/0x60
 kasan_save_track+0x18/0x40
 kasan_save_alloc_info+0x3b/0x50
 __kasan_kmalloc+0x9c/0xa0
 __kvmalloc_node_noprof+0x2dd/0x800
 ntfs_ioctl_list_streams+0x57f/0xa00
 ntfs_ioctl+0x3b6/0x420
 __x64_sys_ioctl+0xd1/0x120
 x64_sys_call+0x2a5/0x2220
 do_syscall_64+0x109/0x5e0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88800b193180
 which belongs to the cache kmalloc-64 of size 64
The buggy address is located 40 bytes inside of
 allocated 48-byte region [ffff88800b193180, ffff88800b1931b0)

Fixes: 48996054b706 ("ntfs: add named stream ioctls support")
Signed-off-by: Xingyuan Mo <hdthky0@gmail.com>
---
 fs/ntfs/named_stream.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/named_stream.c b/fs/ntfs/named_stream.c
index 95a3c05f9821..70c589207713 100644
--- a/fs/ntfs/named_stream.c
+++ b/fs/ntfs/named_stream.c
@@ -1632,6 +1632,10 @@ int ntfs_ioctl_list_streams(struct file *filp, unsigned long arg)
 	ubuf = (void __user *)arg + sizeof(hdr);
 
 	mutex_lock(&ni->mrec_lock);
+	if (NInoBeingDeleted(ni) || !inode->i_nlink) {
+		mutex_unlock(&ni->mrec_lock);
+		return -ENOENT;
+	}
 	actx = ntfs_attr_get_search_ctx(ni, NULL);
 	if (!actx) {
 		mutex_unlock(&ni->mrec_lock);
@@ -1731,7 +1735,7 @@ int ntfs_ioctl_list_streams(struct file *filp, unsigned long arg)
 		}
 
 		entry_size = ALIGN(name_offset + name_len, 8);
-		if (offset > required - entry_size) {
+		if (offset > required || entry_size > required - offset) {
 			ret = -EOVERFLOW;
 			kfree(sn);
 			sn = NULL;
-- 
2.43.0

