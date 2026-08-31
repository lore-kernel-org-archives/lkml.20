Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7D43C3F6E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788173675; cv=none; b=jqj/SMvMFith5s+5y/+Z280ZXN+CAEKHSt2ZX9mtqrHlXEx1AfZFd/81msjFCZtJKUbDeY17GkOThIYWPFtFZSOPe2pGBqE1lDDeGHWM8sbGNIj/m/Kn7kbasXR6+QTptFmF6qQ1uV8KNJVWmLvJHqI3+F/y0MReshS5fXER0Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788173675; c=relaxed/simple;
	bh=TFNu8EnMdDhDnRdTdI6WOtz4htgP2HuJyYVuuH2HnXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W4ZkavpXWsXwQ7MJ/BOaN1hHAjDe4/wOIqBUfSbo2GRyksQ6owKWFVw8O7ak2FI00qtAyv8zdcojL5zGjPJBFZFVW4HQ0SOYqHIK5SGijXwQeCXx0dlVjRrWFWqCAU5bYi0zmTzgJ2/Zwmn2Wqfm3nUP4cgoi/e4B8AZkEpasj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nh1jxoc0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nh1jxoc0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caced6038eso32970555ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788173674; x=1788778474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQNiu9TZQ10x49ZJ9yma2tHLImqVrjgDfm3we0pmhDw=;
        b=Nh1jxoc0GFdrB387iS4sRPYIjzAZhEpqEn21a66J7h9MJspyfSy2vB/99yo0dE6/xi
         fQQqnElTwzpC9T3NPPcCnCe0HewSLwwaoMwxe6fo0D8xgvHPzKp2lyG7GfDY+0U/gxfI
         nMGgoI19q1EIRFw7mepFqAAztSMwAFq1VMtVgT7fL9rD8qN3NaE4gdeiEI7x/GyXvukE
         oIsRdYt+frqrFbMcjBdI4s8Q7r+nxQlh5le/jAdTuV65aZtOryJlfD5Eed/JcLY3oveS
         zV2E5zd8cRl/qn6su5W5z0b0iRedfAsuVf2zasm4ZP/Vhadbv7iqUOpkJ/GnqS2NAq7B
         iB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788173674; x=1788778474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQNiu9TZQ10x49ZJ9yma2tHLImqVrjgDfm3we0pmhDw=;
        b=Jmw0dI+JjjjjhGuH/iY14BsgB5/h6/5McxQ67CKsGVsUtxbnCafbMp6NhlsNloT6kT
         lAQ8bJxAzp8zvP8A4KY3sp2/wJSiQ0uJbmWPFehc08kCkZX3xH2kbedyfsUjOhqLVtGr
         IdB4/j4YKw1l3M2nZEcvN+uMWCNG+rjUUAewDQxS5MvYtFy/LDzZCqYT/ModYA600U4B
         pkaFQR7NAAQQzYJ/2wsXhpzF0JhJ+BqfK0Gz3dOJazA3aCTZSxrFRhS6F5lAxAXW0LJQ
         WVqp4ARE/3N594SK7CpFvz1bgoSxQIV3ieTcpcXr1NAwS2M7yl9F9YOzqmrov4FJjn2H
         EDSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUzM46QF2rQOBI4z0ZwUyMMG5tJGvuJtSK/bwQ4197MMT+CWtjLPgbaoAAn+sa2ZEcjQMD6AqNTYvV7yA=@vger.kernel.org
X-Gm-Message-State: AFuF++lJNq08xxf0blKDOxKOqx0s69YUsVEb1GrybH0+zK91NUvlJUkg
	gwlvaHzKTjia2T2FTtvfLrJHFnArBfb5zdGpEklMGbyAfw6rT/psP02m
X-Gm-Gg: AYBFou1aaIYIKivNS46CGQz/+jn/N5O/hsOAyBShSDLbQU2y+xiarFuT18XUhnENNGR
	WA9APcCcCYynmJCdAZPp1LpgrwrpS9M2BDosgQJ8Uyr0odr+FsUYQwkUb4QhlaUTfp5jM+0WiXp
	dTx4CohuZ0objlE2U+r5uF9GO6PQzhAB5w2qcLZF4OxJYjY1IPnIS6F+QyjfWVjHHwPLWHNEUHh
	TqILaLuk7DUX+Zvp8eMicNiofQEyqqjCRUUWp8jek1gOW6hZ+tSFWzg4GyGwEZYP7mP8zGs64Vv
	4ag54eq4gx7Tsgt1Gqme7shCHylFzlrsS+HUYGEHxo8zZC5fKnB5dvu0/5mULVY56OrlitZGBvO
	ANJoKFWX7OIjhpAygmuYWuHM9FakK7rvVwCpm2qxXm8I23cITIBUmPUbSF7ky3nfUIgkQpnJ6J/
	ZM02aW5ZB0EOgboRIRnzAJ5XmZiJpxdRxAkAU7kwhvxxrp8p3/05kn1B8CstNnJwI50hDEJY4=
X-Received: by 2002:a17:902:e949:b0:2d6:dcf3:b754 with SMTP id d9443c01a7336-2d91afa062bmr62301885ad.7.1788173673289;
        Mon, 31 Aug 2026 03:54:33 -0700 (PDT)
Received: from ustb520lab-MS-7E07.. ([115.25.44.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d8f6a92239sm23720745ad.70.2026.08.31.03.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:54:32 -0700 (PDT)
From: Jiaming Zhang <r772577952@gmail.com>
To: agruenba@redhat.com,
	gfs2@lists.linux.dev
Cc: anprice@redhat.com,
	linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com,
	Jiaming Zhang <r772577952@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 RESEND] gfs2: reject oversized dinode sizes before i_size_write
Date: Mon, 31 Aug 2026 18:54:25 +0800
Message-ID: <20260831105425.622254-1-r772577952@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A corrupted GFS2 image can store a dinode size that is larger than what VFS
i_size can represent. gfs2_dinode_in() reads the on-disk di_size as a u64 and
writes it directly into inode->i_size. If the value is larger than S64_MAX, the
incore i_size becomes negative. That negative value can bypass the existing
stuffed inode size check:

inode->i_size > gfs2_max_stuffed_size(ip)

Later, gfs2_quotad may try to sync the quota file and unstuff the quota inode.
gfs2_unstuffer_folio() reads the negative i_size into an unsigned length and
passes it to memcpy(), turning it into a huge copy size and triggering a
out-of-bound issue.

Reject dinodes whose size exceeds sb->s_maxbytes before storing the value in
inode->i_size. Also make the stuffed inode check use the raw on-disk size while
it is still unsigned.

Fixes: 70376c7ff312 ("gfs2: Always check inode size of inline inodes")
Closes: https://lore.kernel.org/lkml/CANypQFaF6bvORKKbRALvEL0k_epFaneFiOQqco4gjdmKVbdURg@mail.gmail.com/
Assisted-by: Codex:gpt-5.5-xhigh
Cc: stable@vger.kernel.org
Signed-off-by: Jiaming Zhang <r772577952@gmail.com>
---
 fs/gfs2/glops.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 28f32424ee64..8c5d257451d5 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -393,11 +393,16 @@ static int gfs2_dinode_in(struct gfs2_inode *ip, const void *buf)
 	umode_t mode = be32_to_cpu(str->di_mode);
 	struct inode *inode = &ip->i_inode;
 	bool is_new = inode_state_read_once(inode) & I_NEW;
+	u64 size = be64_to_cpu(str->di_size);
 
 	if (unlikely(ip->i_no_addr != be64_to_cpu(str->di_num.no_addr))) {
 		gfs2_consist_inode(ip);
 		return -EIO;
 	}
+	if (unlikely(size > (u64)inode->i_sb->s_maxbytes)) {
+		gfs2_consist_inode(ip);
+		return -EIO;
+	}
 	if (unlikely(!is_new && inode_wrong_type(inode, mode))) {
 		gfs2_consist_inode(ip);
 		return -EIO;
@@ -418,7 +423,7 @@ static int gfs2_dinode_in(struct gfs2_inode *ip, const void *buf)
 	i_uid_write(inode, be32_to_cpu(str->di_uid));
 	i_gid_write(inode, be32_to_cpu(str->di_gid));
 	set_nlink(inode, be32_to_cpu(str->di_nlink));
-	i_size_write(inode, be64_to_cpu(str->di_size));
+	i_size_write(inode, size);
 	gfs2_set_inode_blocks(inode, be64_to_cpu(str->di_blocks));
 	atime.tv_sec = be64_to_cpu(str->di_atime);
 	atime.tv_nsec = be32_to_cpu(str->di_atime_nsec);
@@ -462,7 +467,7 @@ static int gfs2_dinode_in(struct gfs2_inode *ip, const void *buf)
 		return -EIO;
 	}
 
-	if (gfs2_is_stuffed(ip) && inode->i_size > gfs2_max_stuffed_size(ip)) {
+	if (gfs2_is_stuffed(ip) && size > gfs2_max_stuffed_size(ip)) {
 		gfs2_consist_inode(ip);
 		return -EIO;
 	}
-- 
2.43.0

