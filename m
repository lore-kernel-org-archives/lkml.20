Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772DD485508
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372196; cv=none; b=LUvG8tAMqLKcT/j/dYRocggPurKZd82fh8xt1Fz2YR8agkeLqSbeQ0jnIWIeVISTugBSZ507km5Y+yoIJuQlsPf4KWhsYvWl6WRJT6y416jR9MdhfVBXsHV7xvYb5UC2mdhk28nefe07uCtRz3PCcpx3zZJZP3qHwDZbhodtyS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372196; c=relaxed/simple;
	bh=gJn4QOtoHvhrbW7akpCrWeEECzAN+PgZfCQS4O+FXGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=paPMPZlkPCarIAYSDTWCp1ebpYVPBF3rYh1UUYAtii9oR21E7Yh+nM2TzM8JeQWJSLtK7KgjgzfI7+ACvOghpz75d0/mfp1rlaoXzsupN/e0+VGEviEP9zmrKEe5AYVwiJQpWDYY0Bscc8W6HORG4n2LyBhtEvjP167Gyq9vHoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMwphcwP; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMwphcwP"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbee846deecso2815984a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791372174; x=1791976974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HFWSfdj5IMHDuOqt6PlC1JPh2KrPx0JuxidahroXzNo=;
        b=jMwphcwPIuMG7eC9CfEfk0U8pE4TtQDvwnGIhhedKamTkHt0ezBUuMumOllMEPYJmT
         eFG3QvrYmGRsX6NnFT1wjOdvSwcVO3/v7fYIbrU33fxsJxlaX/8vvtzJdHbtJfST2l0D
         tXDCcAOK4YrsisP9HrOsIu1weHs2VcoiPc7jrRt7kT9t6w7RLRmVIRnuI6KJRpwf8c4o
         0WsBubyZxyvY0YCM9ywuYR7RuTBiI2rMzQwX6iUkZZNYbhm5fsvl3S8qSSgHKwwLntt1
         NIknXMPFxUSUz/dyQZ4GOR3JgfFSCf7xqVCxqoTMVqpKXP4ygHm71Owga6xST22FwjVv
         x6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372174; x=1791976974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFWSfdj5IMHDuOqt6PlC1JPh2KrPx0JuxidahroXzNo=;
        b=lKT13UvkcZHePLoRPo+Y1NGJneu0lfx5wAI892paCc4xWfIGUtWRnPH5dkdiEUZJqf
         FeL9S0kMkXu9OT+/JO2NA4JpPKUZy3np3Cj4xYZIZnfRDA5k7+EaZUcvc+vsAtsNbFpM
         afuOHZm9Aho2z+LZYXgcYUWS7i8j0DlxStlcy8wWGJf8k5PKbqBjgErm39UZq8C/KZ8I
         Qbh6mL0Xg8MakyUM4Q8BVPDWYOPq9XAKajL3R5iMtuLZs7p9WMn5Q9AiO9DRWnHML+4j
         /uSP5PlrGDAYxorZ87hC90J+ToCEgvoZ2yH1oq3+DJSFNL6bKz6c5ZEVarN/l6Vcwn4y
         6Jzg==
X-Forwarded-Encrypted: i=1; AKwUvBy1LmY0bUoRDArXnUnFxcorJiAiOvtg/V/HxgucaOJao/fmUgXqtJ6bZKV9a6IVgRV01dBh+Bx87DnW4ec=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWE/efVXzh7pTEqJhUYJ5DEQ+tLDQ5uyF6wa9+GyCJF0kHai3Z
	RH1nfzj9l7LcpgEjZ88jQMlqesi31SI+bTX6vdowP85kO0s9oyDl5vFZ
X-Gm-Gg: AYBFou2xgrcxAsZfDPx4b5NWIVJ6ekQkvZjmZjVz0yVRNggnsGFBjdYNJ58eqMpcbkS
	KqBjteeGgF2F2hpG2hj9x9uKDGIccjWG/ObFkZekSAakqfFCv1JXoJpGMWgdv6BbvVoB3bDkEtF
	ZFHdqByjrrPDY5fTAD3i+TE9WCVsu7fwozNuUmjgB/JRhwcpU5TxnOyH/9a/3MwnYtntDT/d0NS
	TevH0jm5YMGUbXUk2ckTfjCQuzcBCoiLzm9qvH2bFbcVs05kOxNICmnSD67USxcZ0C/FFNmZniV
	Lb6MG09KvmhuWbrQG2OpgLhHZxjmdfA9RwZ/5twsU60W04/egMAUwX54rAc1QKjzG5H/43Kleol
	EMl9W1c0FqMcPCzBCOCEH3/m6lh+FcsRcAgcSlpHFYZfMmaUpnAdI9kJUEhDdwWpvIqNOvPe/Ns
	YDqnq0M3x2yR4XMidpVjHjQNyv0KVP2/a66K46YFHLDGYocypvvcmOLEejamEyd5zKh4t1/+LCF
	k8yJw84Rr7G
X-Received: by 2002:a17:90b:4cd0:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3a8a17f8db0mr1702620a91.15.1791372174383;
        Wed, 07 Oct 2026 04:22:54 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89d5e19c1sm1732592a91.0.2026.10.07.04.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:22:53 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] fs/ntfs3: fix out-of-bounds read in ni_query_ads()
Date: Wed,  7 Oct 2026 19:22:47 +0800
Message-ID: <20261007112247.2518924-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ni_query_ads() copies the base inode's named $DATA attribute names,
newline separated, into the caller's iterator:

	if (vbo + err > *pos) {
		size_t off = *pos - vbo;

		used = err - off;
		done = copy_to_iter(Add2Ptr(buf, off), min(used, bytes), iter);
	}
	...
	*pos += done;
	if (done >= bytes)
		break;
	bytes -= done;
	vbo += err;

The guard establishes *pos < vbo + err but not *pos >= vbo, and off is a
size_t.  copy_to_iter() returns the number of bytes it managed to copy,
which is zero when the destination cannot be written.  *pos then stays
put while vbo advances by the full entry length, so the next iteration
runs with *pos < vbo.

For two streams whose names are 40 and 30 bytes, the second iteration
gets off = (size_t)-41 and used = 72.  min(used, bytes) keeps 72 and
Add2Ptr(buf, off) resolves to buf - 41, so copy_to_iter() reads 72 bytes
starting 41 bytes before the kmalloc(PAGE_SIZE) buffer and copies them
to userspace.

ntfs_init_ads_node() accepts the query_streams name on any regular file
(fs/ntfs3/inode.c:540) and ntfs_init_fs_context() leaves ads enabled, so
a read of file:query_streams into an unwritable buffer reaches this on a
volume with two streams on one file.

Stop the walk once *pos has fallen behind the current entry.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Fixes: be310476e886 ("fs/ntfs3: Add basic support for alternative data streams")
---
 fs/ntfs3/frecord.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index bead01a953f3f..5a88c875cb2a0 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3430,6 +3430,10 @@ ssize_t ni_query_ads(struct ntfs_inode *ni, loff_t *pos, struct iov_iter *iter)
 			break;
 		}
 
+		/* copy_to_iter() below may have copied nothing. */
+		if (*pos < vbo)
+			break;
+
 		if (vbo + err > *pos) {
 			size_t off = *pos - vbo;
 			used = err - off;

base-commit: 22430ae5d90ab288b0ee2ad99ae941f4a666b694
-- 
2.43.0

