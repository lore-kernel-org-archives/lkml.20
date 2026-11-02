Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793601646;
	b=hPFYYpQbC65rQWxsSn8v1ix3hLFbYXOqm/HpfwvqrKUuhhNFdi+KJdeMDe8r4UJPuAAS
	 alaLn+Gli6r0MCfF4nVgcJ0COldrGl0Uq5rjjXJZjdGVHnuQvqKf9sqoZNttbA0wSP7Kj
	 Dh+yK4l1qivw6OtkBAbBNwJNOuHc1+wwPJWwG8s9L1ml49w8tRy874WvrMBftQhu6m4zB
	 B/K4A16YnHFV8GMwHQi7ko0vZ07pYhFRhIk3o56+itINgVIXVLuxny3UStcD9/hQHud90
	 ju/fV/vnMq7XbltkdbvVcSXhhtM325KEs1tU5SviYLXYzIhDzln6g11CwpneEB+z99Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793601646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=zX/OOJOMsice6nGvDy+yeA+vQDsuwQqSuMeNkiiRCZ4=;
	b=t74WvGHSOK6I4MdPDtClvntRu1mqNnGUDsOwoOvFU/QexbGMqkOm1X3hfCfhTsQVfnPl
	 DR4gPR+MiGCCeHdAhk/PfyNSww5c3y46exq8TSLkkXdE0+JZ77vS6m6hzCdtzTW5NnnXY
	 p7vQkzwiF2LEsflDMcxO0HM/A5frK/j9Q+6LI8JVj3TOEReXRsSZXkB3s6HyZ1HXE4qlh
	 O6Vun7H1+MZEXcBHB9wHF76aj19vZDjJW8FWpMZOvXK5ZS6od1sDViTHOIf3ACF6xYjBF
	 IPSolWTapK0jD6L44y6L+Pk+SBRwKgLYjVuZBWQghySTUyHcEXiZg+6+fhRX1y9c+JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlSUSMtY;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D8D606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19D8D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlSUSMtY
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so2080706a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793601645; x=1794206445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:date:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zX/OOJOMsice6nGvDy+yeA+vQDsuwQqSuMeNkiiRCZ4=;
        b=dlSUSMtYQhiiFD+PIomzjDWkEnRxyVeP2Qzhm+hLE7AGCcrJkvxivQ8FfJXXaHEL2d
         Iz/gY+HZ3aPRO8Ji+cpp0Odi3+eQxhEYgKMYS1kC5PZboZToKeTY1jcCksOr2kUB9oHi
         7QysfTZo/30HK3ozndr/7nHW4FnwqsP5X+7Pry/C2ZIlQ8Cq+KtRG05HJ4uDw2n+FpdC
         Ts14/EhkkSfubC4XiyXCq0yW2GW0RVgjyek0xjlHMT84jJMTFw6wRrHMZ7iSoLfx4VKU
         Gc6lhdGm/hdiyzAb+OYDzZb2f0nFV9r8gKECpaYXPJF2RBZ06RMOyxWtuSjzKR5M00iG
         m0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601645; x=1794206445;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:date:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zX/OOJOMsice6nGvDy+yeA+vQDsuwQqSuMeNkiiRCZ4=;
        b=V7VVJauWVxHVWp0PuDN8FkrPk2KdD/T5MabAbjcSG/OCTbJohW9y8ahI8YDvwxmVlV
         nCjyflmH3jp7fgcx3bw7BCBc6eGh6N5kg6NjbD6IJ5S1K57fGgvW2BN0ZkP5oY7lg4BF
         6AB/4u6iJ3oiERj5zF6RL/0UD+uLbFcGtnYbmOnFbAG86TavXEZkAQaPRmflpS25EWRo
         zFkaoQykUMglI+aTBHqjFoNPtHLdfWPiWzea9rDp1eR8ASjUeKCbsYnBI+82kjo2VYxK
         CZfzXNx/mgQWTklsMP9DNDI3MKqKWfUjkJR5crpI2AM6wPd4/OAnEy+G3UrhWsSsYECS
         a6TA==
X-Forwarded-Encrypted: i=1; AKwUvBzGUSbK5zl8Y+v4oyBOmbtNIGk9WgTvAoV2oHqY9UYjXQ6bf08RuJEYFoKiN5RwGAnKi+oldi13HI4YtaM=@vger.kernel.org
X-Gm-Message-State: APuU4Z++QG0g8vjJ4istwpR5/Y7j8Cp7Qs1EOkt46hCPLS78k0svFtlg
	+8GxnKcbekzj5KkqCleg35R5WdLXmZVbVM2rjjuO13Qhn7lA8/YGwVo=
X-Gm-Gg: AYBFou3LojF7PZqgAi9ZCZRHIsXzYB1bXqMg2lpflmCiXvzGxMivoXKkmjav211jdY2
	t9+LKMeJvevqxhn9NtqQsGLKi4sTwCZA0spmntEE574eefRtZtZ13Vzo3feGVlYRQGcKixAFDG1
	LRihbW3YzQyODNjNp3s0Rvm5NvWfD9S944hhRXvIhKZ0k2pApfKjKhlQ6v1zjwa8Vs5+RKkh9he
	WWCElsnZS6B/a0X+gSQTp4ELRYCdG9shQyRlq75kEOF6VVSd2xDWgJ6I+I5+bkQx36ylv2YKYmF
	HzbKQ6fdiqV1EL0BgFlaxBA56k3WUWJyFw2p+tk8n6/c/3G6IYqyrne6TCJJHh0zNfpNXBj2uJR
	QkTvJ21NGl5O1ed/+kM+V3iyVMkIObHWhWZeIORW5Qw3s05yHItKfs5K+YD98I7OpMLrwsciNLE
	bPPe6TutitpJrhryet3eWiab+gdM7SJBF3QLtzjCy7s4U3sXaHLkn3+Dp+SaFonI9bSqYaTGADN
	Pdk1GLSHxihZ6IrqmsEjBJIEmeV9BaIp+97Bx5YFDp0bJ/6goiNYm93s0neZjRoe04fQGtDJyQM
	7eJk/jkc5aTyQPUpdCkzvWO+Ug==
X-Received: by 2002:a17:90b:33ce:b0:3ac:8897:7b92 with SMTP id 98e67ed59e1d1-3ae89866572mr7168986a91.57.1793601644988;
        Sun, 01 Nov 2026 22:40:44 -0800 (PST)
Received: from [127.0.1.1] ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87fc548fsm8008246a91.4.2026.11.01.22.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:40:44 -0800 (PST)
From: Wang Yibo <szwyb123@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net,
 linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com,
 syzbot+b547ffac63b636628299@syzkaller.appspotmail.com,
 syzbot+ce678add490179a73d5a@syzkaller.appspotmail.com,
 syzbot+fc1d5d9a7ebabbc27458@syzkaller.appspotmail.com,
 syzbot+23d1112901d0870bb3e7@syzkaller.appspotmail.com
Date: Mon, 02 Nov 2026 14:40:01 +0800
Subject: [PATCH v3] jfs: fix out-of-bounds write in add_missing_indices()
Message-ID: <20261102144001.36-1-szwyb123@gmail.com>
In-Reply-To: <20261102123500.35-1-szwyb123@gmail.com>
References: <20261102123500.35-1-szwyb123@gmail.com>
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
v3: drop the Fixes: tag; the out-of-bounds write predates the
    commit it pointed at, so the reference was misleading.
    No change to the code.

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


