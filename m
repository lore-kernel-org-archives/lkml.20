Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824666;
	b=fRWnWrdGFxZFvy91hLLONIl2HI5YzbygtgwCEg1MVc9RnI6kJfIIbAXiQJizRyN1qmYw
	 j3qR353sBYilNpOu0iIHUTo3mQ+uqPwuwmzt5dBQkCskRKtFZU8IC8iVvBGrH0WO57j4j
	 QOtL6bc2jEwqyI0/VBhawsse1iJG4R6xEHJqk+C5oQYL8fiwuYXD5bU5Z6y+71NzV85e2
	 rk3cI89Vsgpim7Bt9vxt09mAsx7nBAx6vXiqE3XPO+9Y0UjHkCG93ZmEDRUxwUFkgPHvh
	 S+EDmCY1u7pcvSMMGTXYMxiHYJnveBU2tP8TDywZyXjDLc0PfdIq4IF5Ub8HtwruVkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9w5+uglXN8MeYO7cbfvDu6Yr/i7whWOWfDCFVUzQ/lI=;
	b=fCVXXim1cUr892GsoSByi47X01iSJ9VZlEJApU2TfHEtX0CixYZpsjZL1vX5yCYvkpOT
	 maZWHo4cMaWI+WSpzShGIJJTNXgNaVd+NYRg8Kro+YISvvLf7SzBrMf94HNx1pkk4Nr2U
	 TYmnb7hjIqylksiPoDt9z5aK2x+o5MBWmB3sSUt/Hr74X0VxRFDp0x8EecelrW7upiRgZ
	 TONe3AlhUkjd07gpfj4PPAAHJqEd7sePx9s6Y5kH/Bvch42f5FjtAXvwLQjdn6hVLd12x
	 J35rucZa7PcIgIc5LrBheuuycJpUG30MYNs1pK26x1s1Ixj0XtMHyY2JIyb7LqwB5EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e7jQ3tuy;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCDD606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CCDD606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e7jQ3tuy
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so33262115e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824663; x=1795429463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9w5+uglXN8MeYO7cbfvDu6Yr/i7whWOWfDCFVUzQ/lI=;
        b=e7jQ3tuyVlS2RTuK8llltk8GsHFeKcYBPGKIbGVzrTawX4qSYVi1Nncil1+SOrLmCh
         7YBlmuYE/tfh0Vo10s0nnBX1APjph2Iml6CdjQVt5tpuhRDQFzH1UdZ2k+oiIHWhsOTZ
         BEbcKxR83hhr7gsSa/dU4sN2VCyJXxAKcy0tlyjjDO4S/kbLO/Mf0Fcu553gc8Ylhhbi
         8GdtX0AutLEKuFvJIQ8DAq0zgF/uvWjCKiHKu/oXO4uq2xiFigFECwqKKl+72+ICZFxl
         lDaJVWgF79Uan9sMtpB54vo13yh4xxt+iKWfAGpFo3kGl7Qv3FXFMpqdLe+y9rK3j4Lv
         UWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824663; x=1795429463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9w5+uglXN8MeYO7cbfvDu6Yr/i7whWOWfDCFVUzQ/lI=;
        b=zUBsDeraA0hE0Y46fZ3H+eWRs6pM1fEJiOkOzCSY/TyHhZS4Yekv2bwRaewRaZ9plF
         SJeeCLoghzBdT3Ul42sVMYuHpD+jJgRfSad+g36u/YZraGmhS5Mjo3mmJN+atONucHCH
         nmfsZ6DbfnzBI5EJxuLavwFSkiArL0R5ZynR+2l3X7JOPtWUhO4PGLlBxNqzcXKZ53/Z
         0zLX9lMPIFUzfZh5yPjAbtELXWKIttTgw3TGAFFSD1/XWN89wU+w13sFSQHhFnRsXqk5
         4dLNuBlV7A6isavOSBeIRk0+7xP9pfKfQXYnQmKpF3jikqFxS7fVoeFqNSKnCHvVwNsh
         IWug==
X-Forwarded-Encrypted: i=1; AL+hErFeRD++j/rJvuZHo9WOoheqnl3b6cRVzPCNoK4po0zCU8bqWeybM/f/REkyttXqUiub/W2J9oeAWD1zhjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BAB6gVBaNbTiGavwQ02iDVXJcdYTEkZZ9OgSGZrmfS/0aMOxF
	R+xqImUHB2yVVOGMsVQpq3qgIAJLwx2MXTtucxD9QGo+kJzUp8w7JWSK
X-Gm-Gg: AYBFou2UvK+1tS4bx5ORXw2mBd9MdbE/DlOUcIQKbgdx9VuObYSO6KjA611ZDZehbEK
	bzqOSp642PSxUl16Frx31by3U6M/zdplYzBtvhslNiGYWc2XnwAkjG93JL/alTRVLiWxiLgr+N0
	mquo9nChUpUnU2ouPzLbIkxG+Mc03xXVdrcuO1KvLSglxZfIzVW/paFQdOTG0WvinNmV10kKp/x
	iu9KS8GFfkx1QcCGOXUK2zOiZXJovAoNn44sfrnwLIpuONAkwHZkdAW1MTn0ROWYFdd1iRRds8N
	swvMV5et7wuiPdz3TzgvkDbJHsYYdnaTUTSPOc9U+dXSDd890j7Aq1cczWJhlKNrFDlj6cLLHFy
	kdtVxvOkZK9OKdZ9GR0hOxmF78AhkI3i/JRX+8WfJQHtME3tibt/gsQi6mjkmGXnXMyrkj6qbM5
	gJ1o+1cc/DSrjgDVeT99ElilYPgcZy1LHWbfKptkyORvX1jNN/p3naEiWjgiu/iJq7h9Cnc1Bjl
	XJdXLMMbqo8Q7lc6tjxt//LHDC7PsGratq33kjnO/VqHA00cHFWc5Q77n7WjuW1hjz2B8yIsCWq
	Xi49mkboxj5BtiRvmQbe
X-Received: by 2002:a05:600c:1989:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb66fdaeefmr125267505e9.14.1794824662652;
        Mon, 16 Nov 2026 02:24:22 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm191536225e9.3.2026.11.16.02.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:24:22 -0800 (PST)
From: Petr Vaganov <petrvaganoff@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Petr Vaganov <petrvaganoff@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Su Hui <suhui@nfschina.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10] fs/stat.c: avoid harmless garbage value problem in vfs_statx()
Date: Mon, 16 Nov 2026 17:24:06 +0700
Message-ID: <20261116102407.81232-1-petrvaganoff@gmail.com>
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

From: Su Hui <suhui@nfschina.com>

commit 0fac3ed473dd2955053be6671cdd747807f5e488 upstream.

Clang static checker(scan-build) warning:
fs/stat.c:287:21: warning: The left expression of the compound assignment is
an uninitialized value. The computed value will also be garbage.
  287 |                 stat->result_mask |= STATX_MNT_ID_UNIQUE;
      |                 ~~~~~~~~~~~~~~~~~ ^
fs/stat.c:290:21: warning: The left expression of the compound assignment is
an uninitialized value. The computed value will also be garbage.
  290 |                 stat->result_mask |= STATX_MNT_ID;

When vfs_getattr() failed because of security_inode_getattr(), 'stat' is
uninitialized. In this case, there is a harmless garbage problem in
vfs_statx_path(). It's better to return error directly when
vfs_getattr() failed, avoiding garbage value and more clearly.

Signed-off-by: Su Hui <suhui@nfschina.com>
Link: https://lore.kernel.org/r/20250119025946.1168957-1-suhui@nfschina.com
Signed-off-by: Christian Brauner <brauner@kernel.org>
[ Petr: There is no vfs_statx_path() in this tree. The fix is applied
  directly in vfs_statx() by jumping to path_put() via a new out_path
  label, preserving the reference drop and the ESTALE retry. ]
Fixes: fa2fcf4f1df1 ("statx: add mount ID")
Signed-off-by: Petr Vaganov <petrvaganoff@gmail.com>
---
 fs/stat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/stat.c b/fs/stat.c
index 04550c0ba540..74a774dc4eb4 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -195,11 +195,14 @@ static int vfs_statx(int dfd, const char __user *filename, int flags,
 		goto out;
 
 	error = vfs_getattr(&path, stat, request_mask, flags);
+	if (error)
+		goto out_path;
 	stat->mnt_id = real_mount(path.mnt)->mnt_id;
 	stat->result_mask |= STATX_MNT_ID;
 	if (path.mnt->mnt_root == path.dentry)
 		stat->attributes |= STATX_ATTR_MOUNT_ROOT;
 	stat->attributes_mask |= STATX_ATTR_MOUNT_ROOT;
+out_path:
 	path_put(&path);
 	if (retry_estale(error, lookup_flags)) {
 		lookup_flags |= LOOKUP_REVAL;
-- 
2.55.0

