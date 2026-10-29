Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793251343;
	b=bA7InwunbWFiH7JE4N1wtrvKjDQx6yhuDEuNrPNXufPKZoAWaz7HwmKpej/aR3kfr+mQ
	 AkH1SnFJM3uWZui1GfdJA6VJhYuGxGdyL5ajdafqOgUIWneoAPIkkfldTkxpBkBBoEqJq
	 OfJJnqSN6dFA3PklBpxBhsSg9ni0Sk/X2ZBTzETSqIVmPEU/+zyNbcDp6chVQnUKQxKZ+
	 p0NWOBVd5lZwfEu/oMu45x2WYCNxE4sjdY8OWelH8V152pM1WLnFba50gD8pDDm8lTUdV
	 3xofs4hYEpIPQvcQldby6Wdb0EFOCaUP791tQgmmTAGe6wTDvUNB2ceiGnMFfKEnC0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793251343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DtBdbryVCQZJwqxQX+yRKPENpGCAPSn/JZly+yP2sLk=;
	b=sQoVdEK07nNPtAYqvcfmLZn2FFsE2wB6k6+f3PPPUV8ScyCCw8Uwbc7kbQkrp9pMs02v
	 S7HPVucmWQ0ygIIMky2uMMe+Wh+l1PPqUrZS6QyvB0NqP2fZa2G7RtG2uq2AujVlUyfnh
	 CB+NJL1Mj05fTMUhSJxlRTbsM+GkwQBz1AlxuPqfJK66Vto/A1oojVVvS7DIPpOJ1g/0u
	 /xs8ozCcNxylad4wVzvETsKXWv9XnltlIuvWsRVmsar0iFnIPaGb65EebuC0O+Lrq4X/r
	 LiYkgx5oP4bg5dYG2ebOO2zOWlSrfr+YEOBMECLzrqLGehktygNalZdp0nvpRSbmXfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FEP1BhMG;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC62C606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC62C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FEP1BhMG
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so1575492e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793251342; x=1793856142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DtBdbryVCQZJwqxQX+yRKPENpGCAPSn/JZly+yP2sLk=;
        b=FEP1BhMGQvm8+cq0tXbO5ZsLgPAvjefHmmnbKcA/rAMzbbB5cozIryqkFxBXnvXESE
         KC6/As5v2mKzg0zxPuZeWK5Paog6FebQ3DplF43EQdIuE3yB+64WU/2SSK8bas5Dh1Cw
         atTp04SDAbFQCtgN5aKMRbfa5vTfcnzkGddkl0UfvgrRep6lLVF+vB4ll2g0ZqGysij1
         bcUOuuMf8+Ry9qQB30m8X7HTl/DFfbCIsuxVZYjUSQLGe49OSvpEn5wht/IclEcLI6sH
         grPWKJxzkSrHQKJ1qT+gNxpIJbIGZHMLpSlrNKXEa5A+uhbwiDOzM1CwRIYMTm0J+dRx
         DoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793251342; x=1793856142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DtBdbryVCQZJwqxQX+yRKPENpGCAPSn/JZly+yP2sLk=;
        b=LSoMavac+09zLnCuGNR1Tx6Zj/fyCUFnDj0ExCJVgG2emrxTZUpE0CBQWHd3ZliZXK
         4sjOKIuw++L0llKikl6dhHDxoGns5EaHb5s+c3EPhtHOUCsrUqPxIoQ4NtkY3XxfYrd3
         8NKPb81OtIRL3YTGWKeO4FeTywYzunO8KQBCNzK/eCsTTqJ6j6Enb28jhZikSvAB4MtY
         hDSKziLDxURncvdQX0XRUqjauA2a5d6FzwpaFPyBAI1u45EMvekPRmXYj0s+HgdU6XPc
         mX56RktH4YTg9A7H9veyCre+f3RynIB/69yC7jYnW5Tfwb+IRWTxaf1b4Bv2EHfb4BMX
         9Mpw==
X-Forwarded-Encrypted: i=1; AKwUvBxaLbf5LKjin0x1Px/ex4SfN6owP/VUKZplPHvuk3gdhWzmNTg3XVzJ6vmqCGx7Uz9CWuefUhW7fb89kXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/+YJYhFXqtp5B+xy5hygVbWkhLKa/sA2XCsi6EkFajDH/kLMn
	FchlXFHvpA/jFHIze3q1boWiK/s13YYOAhZkdlXOGtGwnAelnrSzO0og6yiZsev68ws=
X-Gm-Gg: AYBFou0hv4pUEvHYd62QFdcUck7m9E0NNGCDDEruOJvXRb2dIcP8LBWa2KzLStO2Snd
	W3m6E/jKmkXDgNZ6qiIPqaqJsjFohopcYwWYspbGEYgXKmI/tmXqKgld9+U2MjQJcGDlA1TjK1e
	TpvIKvyzK5jkBhC/DjC57eKK6mqycJNZD2X33yP0Tz1bXC3RGrEYmD1koNkBKnevfztMafoVHmI
	XL8r6OfG8silEQkr5l4xu7+2NHlC2C46mWSpczHVdwgG5/DgvcMKlLsppk1CC9JRz3CSGy0ecB5
	1mRYSszUoBe/MV8Dpy7tyNIoDocQuq85LQkFi2W9tWsfI30osa9ygpJU3wXjfRJPXgQ3r8nyvXS
	CWDcLDQ7aT+vVBoXMljgT+ovlKl07D8pxO7vYQpUAl/JxkjLn8BZzfjgpK5Rbcg8qftswuXbfB2
	rIu2HagJrjos6D3RzE5yCQ83swXQJ7I4TNtj300lFvw3IkXb7b9ZwSJdlfGBebiYg/L7zGtVGRg
	LVZKERaL2iqmHhS2bwZe5wsG8VbGxZecrZohxarkf+CuXWDEHvt/nQfD1WRx9ecGRCCLZMRhRlk
	0E7JZqkW/ACRcVpqvjKQCneUyuWVXgp6SzlDejCIFCVHqPVZ7MC/ZugwiRJY
X-Received: by 2002:a05:6122:1b0a:b0:5ea:9ec6:72b1 with SMTP id 71dfb90a1353d-5ec4ccbce65mr2347697e0c.23.1793251341793;
        Wed, 28 Oct 2026 22:22:21 -0700 (PDT)
Received: from bridge.. ([2804:14d:ba6b:8339:8b5e:397a:cdcb:e1d9])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f5cebbbsm4360066e0c.0.2026.10.28.22.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:22:20 -0700 (PDT)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yun.zhou@windriver.com,
	syzbot+5c0ed4f2974a8b100ed4@syzkaller.appspotmail.com,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Subject: [PATCH v2] fs/ntfs3: fix double ni_unlock() in ntfs_readdir()
Date: Thu, 29 Oct 2026 02:21:02 -0300
Message-ID: <20261029052102.1585462-1-christian.aurichzm@gmail.com>
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

ntfs_readdir() drops ni_lock before each ntfs_read_hdr() call and jumps
to out if the call returns non-zero. As posted, the patch that became
commit 7a5aa6c45072 ("ntfs3: release ni_lock before dir_emit in
ntfs_readdir to fix deadlocks") used out as the label after ni_unlock().
It was applied on top of commit fb058ccff579 ("fs/ntfs3: take ni_lock()
once in ntfs_readdir()"), which renamed out_unlock to out, so these
jumps now unlock a lock that is no longer held.

This also happens when getdents64() fills the supplied buffer,
triggering a lockdep "bad unlock balance" warning.

Jump to out_free instead to avoid unlocking an already released lock.

Reported-by: syzbot+5c0ed4f2974a8b100ed4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5c0ed4f2974a8b100ed4
Fixes: 7a5aa6c45072 ("ntfs3: release ni_lock before dir_emit in ntfs_readdir to fix deadlocks")
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---

Notes:
    Changes in v2:
    - Explain that the bug comes from 7a5aa6c45072 being applied on top
      of fb058ccff579 (Yun Zhou). No code change.
    - Rebase on ntfs3 master (da4391c496fe is now 7a5aa6c45072).
    - v1: https://lore.kernel.org/all/20261023223533.686085-1-christian.aurichzm@gmail.com/
    
    Based on Paragon's ntfs3 master (ee1cb3443cff), also in next-20261028.
    
    Tested in QEMU with lockdep. A 128-byte getdents64() buffer
    reproduced the warning before the fix. After the fix, no warning
    occurred when reading root-only and 700-entry directories,
    including four concurrent readers and a writer.

 fs/ntfs3/dir.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index b54828735d55..45d6a41a7222 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -563,7 +563,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 		 */
 		err = ntfs_read_hdr(sbi, ni, &root->ihdr, 0, pos, name, ctx);
 		if (err)
-			goto out;
+			goto out_free;
 
 		ni_lock(ni);
 		bit = 0;
@@ -607,7 +607,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 				    ((u64)bit << index_bits) + sbi->record_size,
 				    pos, name, ctx);
 		if (err)
-			goto out;
+			goto out_free;
 
 		ni_lock(ni);
 	}
@@ -615,6 +615,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 out:
 	ni_unlock(ni);
 
+out_free:
 	kfree(name);
 	put_indx_node(node);
 

base-commit: ee1cb3443cff5a800948b662756f75b17ca63fe2
-- 
2.43.0

