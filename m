Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593850;
	b=3UEyRmtH516NtBxsJaMW7TyJg5UrVLBMIGd40i8aok8goOsTmdDYhxUnECsCU7/ZsWLX
	 icU6GYbLRCF0p2kjckAbEGAuR8vOr3aKvCgBoCpKZ+dyepVW2rGIZAI9MBfAV9/aD5+F+
	 OiMyWhVxQEziPgWCkU7Y77wZWp2yngtaaCucKps/JP5gCuBZki+ixDVJLm/Xq0k3autDl
	 lXjyj4SFUbrLI6rtQTDGQj5DTWisygr6PbzjnSwHhooN3QrK8wKO8F7ijwIWe0GVBie1F
	 oNgZxA2eIYCS5aYuw/BJIPFyL7nq2NbP28WtOB4rG6v8PIRRuZL1BrEh9DGKxUfDLdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dn16KrRZCCLjU4kh4wrFSl2uI1lHcRx/JiLcVLvIn64=;
	b=FBL8Rk4k+rKLwWQAxYEVVcEJ1H11nMgjUN7cq/BXqpdODKsBTksyZYzu12byqYddv9hP
	 vT/rk2L0Pv/2GdUiFKZKCvz0AKHMCWtITEnOAvzdLVPUixHu9pqYi6wXGP4lWhLovk6ex
	 t7FHnZPREEXXHMG3lXAlVU+WzQ7/YWDEHOuv/tWxyYTo/kgqC8h2pPl91HcXqDHB8LhxG
	 ABnhRUL3bCLvaToCWG5eBqqI6zF4dm92xrW8Ku4x5FOJKQtgEzSh/Wx0PfJHBmkSX5iux
	 OzpgCBayVKGqGyKNpZCkEkpZozrv/GR7f7uyHZV/WTtV7/aozMX1+6SRHKcHc4HQ8wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ujqoiLao;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A3A606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52A3A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ujqoiLao
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so886362a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793593850; x=1794198650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:date:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dn16KrRZCCLjU4kh4wrFSl2uI1lHcRx/JiLcVLvIn64=;
        b=ujqoiLaozFfzl2Z1ESHmNIIS7IDVmdP0Tv92AFmh0RHnNfUH05voJLQBo5EqsOJs3V
         WL5AnZ+GQolsVtUgR+uvbDnRPz7Ra0O1TWP6vn8XEKCSo0ILHnxhGwvJwKATDTTA3oKZ
         4wKtO4ktj0uXiHgR+IdCgRlUltJjphabO/3vgn8hnn7k9xca6d46rP7Xm71G8ibiDuI4
         hjFBkvqLfrDqXDS4Y5j6GdH8/tF5Q1GoyNq100OiQbmrfFF1KL3QyGrweoL8Jnz8FTg6
         8WJqehpaL+/Ex1EhELpVLVUIue/gLlcZmVFOJXucV3B/v7JiAV0osnEFpQm3mg1CaDEI
         Sjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793593850; x=1794198650;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:date:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dn16KrRZCCLjU4kh4wrFSl2uI1lHcRx/JiLcVLvIn64=;
        b=rAFv+pIZzBJQb4ExAbUPCm4QLnL5uO0rNCmSECn86KAcZtLXHURdK3ZoM9U8/8eSb5
         1n9bWasmxpi06ipOjR/UmTJRMV8gv6AxRBMd6XaiWAfL6Wbqe/CYpuzAEm9qyci7jxvz
         n9WK2SQk3a/2IazoDMLmxojsZAJqfvFz4/CYpeO1QHSUNVDlNp8cptjzsexLWYKbkC/M
         p4M5mpfpjqvY6M5fR0CkleB0g6nod61q36A1G9JkZQPEayHgDVIKvwetkM7zq+LCUKyb
         t73BDMzkp1oPt7cY8WOswGfOIPhGQmEI8X1ekg2cubgItBwO4eceSoRWD85EuI0a0BBE
         Y5gw==
X-Forwarded-Encrypted: i=1; AKwUvBwj/a0PKufj+m8iSr6v7/qWayaAECpQOpDwHjtkuNvPoqqDT4z5OrF8Q0C5s7uFasWQYdYTgRe+jYRTz+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oik3EH9wT6gufscECyrfsPRC9ZuJXzj8F8DaraHpi05EO7bKq
	PkepPsZSajdw6RXFh/idn1J7yCrFcHFY2RXfQ/FMH6WoNPQofeLGELg=
X-Gm-Gg: AYBFou0v8EaU0atx2ralDx41T7N5a98PH+j3/KIa4ODE92TD2T/R2ueKrObAXLKZmki
	NPj6Sx9yTS22+JELjABp/Sos/nqib/0yjJNseux8Jbq/Rm7D2z+Q3HwDYXCTad6sRePQIqKi9Z8
	2/rWdv8DFNxS8nli4T+aIRlh3O9AYU+LS017+r02yEXckEgpDaMqw5sC3+WGf394YYV36owumOG
	jDtwEgabCXWVjahKJFdGxPfLWN+q7kDAQUc9V2KdHNeju8oZVPXFMB2VnF0Udg2AC+6E9xt/21k
	rXoA2TvfSvtqF9kglo9ADMsHZecFhF7BKc/W52isCW3S9dd8l7oFmtuNyskaktnbmvIgU2eup51
	rh4wTJa2H72IQ/5oH4TGOnUZEib1X5lezjlE/UOwy+4m0i3RtC1PBwuESWNBJ7fkUPSys5klOZt
	4CW3JgMesXqCga40rAbdxNdfj2dDNUY6GN+nIt/n/042XA/o9ceEs2ZLsF+rJV44Qa1HL0OSyk5
	8R7DDSa6TnZt+PDa6mVRWPxFS7wkU7Zy/Va/08oO6rXpMgyjlsSACoDhBrenhKBeRGo0VKUsK72
	MOv2qfhzTxfAFssfxhLhhU8Gpw==
X-Received: by 2002:a17:90b:580e:b0:3ac:9176:e837 with SMTP id 98e67ed59e1d1-3ae89835172mr6722846a91.50.1793593849296;
        Sun, 01 Nov 2026 20:30:49 -0800 (PST)
Received: from [127.0.1.1] ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8441a6f0sm12221665a91.1.2026.11.01.20.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:30:48 -0800 (PST)
From: Wang Yibo <szwyb123@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net,
 linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com,
 syzbot+b547ffac63b636628299@syzkaller.appspotmail.com,
 syzbot+ce678add490179a73d5a@syzkaller.appspotmail.com,
 syzbot+fc1d5d9a7ebabbc27458@syzkaller.appspotmail.com,
 syzbot+23d1112901d0870bb3e7@syzkaller.appspotmail.com
Date: Mon, 02 Nov 2026 12:30:00 +0800
Subject: [PATCH v2] jfs: fix out-of-bounds write in add_missing_indices()
Message-ID: <20261102123500.35-1-szwyb123@gmail.com>
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
Content-Transfer-Encoding: 8bit

add_missing_indices() walks the sorted entry table of a directory dtree
page and rewrites entries whose index is out of range.  The loop
iterates up to p->header.nextindex (a u8 read from disk, up to 255) and
indexes p->slot[stbl[i]] with only a lower-bound check (stbl[i] < 0).

On a corrupted filesystem stbl[i] can be any byte value, so d->index
can be written far beyond the end of the dtree page.  For the root
directory this is worse: the dtree root lives inline in struct
jfs_inode_info (320 bytes with only 9 slots), so the write lands inside
the same slab object, corrupting arbitrary fields of the embedded
struct inode including i_security.  KASAN cannot see it because the
write stays within the jfs_inode_info allocation.

This is reachable from getdents(2) on a corrupted JFS image and was
observed as a GPF in bpf_inode_storage_free() reading the garbage
i_security pointer on inode eviction.

Validate stbl[i] against the page's slot count: DTROOTMAXSLOT for the
inline root page, and min(p->header.maxslot, DTPAGEMAXSLOT) for regular
pages (maxslot itself comes from disk and cannot be trusted either).

Three other open reports are the same bug rather than separate ones.
Two of them die in smk_of_inode() on a crafted inode->i_security, with
only the upper half of the pointer replaced by 0x0000000c:

	general protection fault in smack_inode_getattr
	general protection fault in smack_inode_permission
	general protection fault in smack_file_ioctl

That is a single 4-byte store at i_security + 4.  In struct
jfs_inode_info the _dtroot union sits at offset 728, its slots are 32
bytes with the index field at offset 28, and the embedded struct inode
starts at 1048, so i_security is at 1104 and slot[11].index lands
exactly on i_security + 4.  The value stored there is the directory's
next_index, 12.  The only code that stores next_index through an
unchecked slot index is this function.

Checked on a SMACK enabled build with the reproducer from the first
report: without the patch it dies in smack_inode_permission() called
from ksys_umount() with i_security = 0x0000000c27a22900, and with the
patch the invalid entry is rejected with -EIO and the directory scan
completes.

Fixes: 5dff41a86377 ("jfs: fix array-index-out-of-bounds read in add_missing_indices")
Reported-by: syzbot+b547ffac63b636628299@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b547ffac63b636628299
Reported-by: syzbot+ce678add490179a73d5a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ce678add490179a73d5a
Reported-by: syzbot+fc1d5d9a7ebabbc27458@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fc1d5d9a7ebabbc27458
Reported-by: syzbot+23d1112901d0870bb3e7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=23d1112901d0870bb3e7
Signed-off-by: Wang Yibo <szwyb123@gmail.com>
---
v2: add the Reported-by: lines and Closes: tags for the three
    additional reports, describe in the message how they relate to the
    first one, and add a Fixes: tag for the commit that introduced the
    lower-bound-only check.  No change to the check itself.

 fs/jfs/jfs_dtree.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 8ce6e4458cc2..119d03c410b8 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -2623,6 +2623,7 @@ static int add_missing_indices(struct inode *inode, s64 bn)
 	s8 *stbl;
 	tid_t tid;
 	struct tlock *tlck;
+	int maxslot;
 
 	tid = txBegin(inode->i_sb, 0);
 
@@ -2636,6 +2637,11 @@ static int add_missing_indices(struct inode *inode, s64 bn)
 
 	ASSERT(p->header.flag & BT_LEAF);
 
+	if (p->header.flag & BT_ROOT)
+		maxslot = DTROOTMAXSLOT;
+	else
+		maxslot = min_t(u8, p->header.maxslot, DTPAGEMAXSLOT);
+
 	tlck = txLock(tid, inode, mp, tlckDTREE | tlckENTRY);
 	if (BT_IS_ROOT(mp))
 		tlck->type |= tlckBTROOT;
@@ -2644,7 +2650,7 @@ static int add_missing_indices(struct inode *inode, s64 bn)
 
 	stbl = DT_GETSTBL(p);
 	for (i = 0; i < p->header.nextindex; i++) {
-		if (stbl[i] < 0) {
+		if (stbl[i] < 0 || stbl[i] >= maxslot) {
 			jfs_err("jfs: add_missing_indices: Invalid stbl[%d] = %d for inode %ld, block = %lld",
 				i, stbl[i], (long)inode->i_ino, (long long)bn);
 			rc = -EIO;
-- 
2.25.1


