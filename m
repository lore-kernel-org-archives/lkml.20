Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3101E4D0A0D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675306; cv=none; b=J4vW1C6b2eL7BtuVaO2ZMndudsdSTNndqgiRrBl+XP8CdXi+hR2akNfXeDJ9iGjO4utLMWpG/Xy5de/yEB0gzMVpKvLZOiGSyqF0sZcbEdDyx8sz629UfHr5t4bJq08FfW+FUiL+TX2oOGBc2dZ6teecJTLy6rHYBevhZUHveOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675306; c=relaxed/simple;
	bh=kb8hjY/3GbCIKHPmXiRjeyjyJtS8xD8BUXG7R2aM3sk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SDfQadD1WziO3OA4MYrOuAkqf4TC6ooxOEA4gmuJ71REI8XaggjKzq+Z2OXwM2AVpB4XiIfNnlp4dQ2NOKvga7H1JKC+1Is5+xZQ+jrlFRkZxoIYOmPhVRYLl9wSreaCoymf6jeKmj4B1YoIbpBqbd//nO9h97AkWGuLv3Y+1TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9fDjAYD; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9fDjAYD"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342568a5b54so1742022eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790675302; x=1791280102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hd2pDaQuHkOifvuoX51kyffsT4qd3/Uun46tkq8lzb8=;
        b=T9fDjAYDs/3PAClv3G8qeBFrijeSUvX7d5d3aLtMX97NghYY3mbhnLPnPLQxHbVpH/
         dE3lx+KXGxCDqb+9FuB+x/0w97QQixM9U2SOCFCc/jcxhYQc6e8H1FXC4S3E9daB1vU0
         8YMRFSYPDmz6XVjeB3KarnDetJjeltCz9/I8C/Q8rWOvx97une483VNtmE3DKOAcq3/n
         U2U8ykwtXFXgQA5j8ltETNSX6rHo5VYWq1nX1643al0xmlY8Go/PZyad+TxE7x5LQl6g
         sMnOqGLikLSLJrTqT6HIXE7E7f84UpZOaGJ1jVw2Kz1jUksH3EO7njLaCb05WTZ85rB/
         h6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675302; x=1791280102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hd2pDaQuHkOifvuoX51kyffsT4qd3/Uun46tkq8lzb8=;
        b=0kzuk+yey6R96ev3lDn8ZXibEzA4CN/PIElP6dFjbsZMo4z80I8bAmXLW2ly7hKe53
         TaXVcKYPVFF5InUle+p2d3ZO/vzteulAZXufDF1kCTCfYOLWecgq/YPuP93+qgSuQRsO
         kC0/zG3kyx/Tq3hNJMCl3rQONobjTVlHHcu+rKoTZWk9ERH2KGZPxAa39mYDOVFMb+l3
         jC1w6a0/nTqwCWzBnTkX/x/CMrS2TnWcOsadmrj3m2Ac2kJlzPt50Ey2xs3OtjHxoov5
         FPBhDkEBiaEzNrtqKApurUG2Wy13Z7HbcyGnbGmY1Y2AxruW6r9aluOelGYc9kr4t/+F
         V8eA==
X-Forwarded-Encrypted: i=1; AKwUvBz8BYzrYp+ZuTfywsvi1y9Db6KWE4rOA6u5Q69MWi0YVuM7sR1nPejHHu1r9+NJAPZfPdv+mcN5nvu/1is=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIPW1475alOM4X2r39RQLnmjQwqE3Dn5WlQfJDUngS1jWEyEDZ
	sEnvi263IOjNjPQpc+Kqvips1MSsX4VegVDCIdNGlkUYwuyCNgxoXOqu
X-Gm-Gg: AYBFou24jUsyUoI3izDWRkdLPGFASXt/rj6V9Oa/X7F87fvF3ONgLO4HLo/tvl04od+
	B8739T5a3FzLCWT0TKr6vA+nOQYfRIt6QIwN6kbW0N9VHYn3Y89DkjvAiVOXSf3TOqYrBpnzRpe
	8F2FeSRW3SH1ULagOM/xeF74E55yhwmmeWzbhLka+WQTMV180kYP0HBvCiLbDA2z9UMR80R8i7M
	93oKHMrKEsHqCnDptRbKieWUQM62YzfWqDjSZ62Psxspo96TAEENU+ED683kh+EbHjo9Pd5ZufO
	i1dzWMPLrka/l3o5AOoRpL/oAG7jk+OvFakKbuNBQLujpG+7NH+7FzhESCU0OFWAtk4QXgNm91V
	KJRyV3NyY3k7dfGA2i7wQbU96YDxYhF49Rbo6o/ElKrKwAO3ldFcgcM9gG/BkOqEpacguX+vclr
	qhSUnXXYID8e1DjbZbBKfbk1qqRf6+RJvfmED8/nknLd2YH/fBrQDsgO2n5KDiWH2RLKYKYgX9c
	aaEn5/rCvtnUOI8mv0vUa4HMMIy9l+5XwFKXuNeDTMgT8g6Y8UQsJqtoo1quJs+Y9glvQ96LIaM
	a9SP
X-Received: by 2002:a05:7300:cc1b:b0:327:e68e:3230 with SMTP id 5a478bee46e88-342702c203bmr16200118eec.10.1790675302090;
        Tue, 29 Sep 2026 02:48:22 -0700 (PDT)
Received: from Mac ([2401:4900:88cd:edb4:3499:f422:21b4:55c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm31447320eec.10.2026.09.29.02.48.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Sep 2026 02:48:21 -0700 (PDT)
From: Tarun Khandelwal <tkhandelwal32@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	virtualization@lists.linux.dev,
	German Maglione <gmaglione@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	linux-kernel@vger.kernel.org,
	Tarun Khandelwal <tarun@supabase.io>
Subject: [PATCH] fuse: propagate SB_POSIXACL to submounts
Date: Tue, 29 Sep 2026 15:18:12 +0530
Message-ID: <20260929094812.93374-1-tkhandelwal32@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tarun Khandelwal <tarun@supabase.io>

fuse_fill_super_common() always sets SB_POSIXACL on the superblock, but
fuse_fill_super_submount() never does. Submount superblocks are created
from an fs_context with no sb_flags, so the superblock of an automounted
FUSE_ATTR_SUBMOUNT directory (e.g. a virtiofs export containing another
host mount) lacks SB_POSIXACL, even though it shares the fuse_conn, and
thus fc->posix_acl, with its parent.

Since IS_POSIXACL() is false on such a submount, the VFS:

 - fails setting POSIX ACLs with -EOPNOTSUPP and hides existing ACLs,
   without sending any request to the server;
 - applies the umask itself on create, so default ACLs on the server are
   not honoured for new files;
 - skips ACL checks in acl_permission_check(), so with
   default_permissions (implied by FUSE_POSIX_ACL) access is decided by
   the mode bits alone and restrictive ACL entries are not enforced.

Copy SB_POSIXACL from the parent superblock, as is already done for the
other superblock fields inherited from it. It cannot be set in
fuse_sb_defaults(), because fuse_fill_super_common() checks whether the
flag was passed at mount time to decide fc->dont_mask before setting it.

Reproducer, with virtiofsd 1.10.0 started with --posix-acl and an export
containing a nested mount:

  host# mount -t tmpfs none /srv/share
  host# mkdir /srv/share/child
  host# mount -t tmpfs none /srv/share/child
  host# touch /srv/share/rootfile /srv/share/child/childfile
  guest# mount -t virtiofs <tag> /mnt
  guest# setfacl -m u:12345:rw /mnt/rootfile           # works
  guest# setfacl -m u:12345:rw /mnt/child/childfile
  setfacl: /mnt/child/childfile: Operation not supported

With this patch the second setfacl succeeds, ACLs set on the host are
reported by getfacl on the submount, and default ACLs and ACL-based
access checks behave the same as on the root mount. Tested on v7.3-rc5
in a QEMU guest.

Signed-off-by: Tarun Khandelwal <tarun@supabase.io>
---
I wasn't sure whether leaving SB_POSIXACL off submount superblocks was
intentional. I would have opened an issue first, but since the fix is a
one-liner I'm sending the patch directly. If there is a reason for the
current behaviour, I'm happy to rework this or drop it.

 fs/fuse/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index e9552be36..ef3c7fac4 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1629,6 +1629,8 @@ static int fuse_fill_super_submount(struct super_block *sb,
 	WARN_ON(sb->s_bdi != &noop_backing_dev_info);
 	sb->s_bdi = bdi_get(parent_sb->s_bdi);
 
+	sb->s_flags |= parent_sb->s_flags & SB_POSIXACL;
+
 	sb->s_xattr = parent_sb->s_xattr;
 	sb->s_export_op = parent_sb->s_export_op;
 	sb->s_time_gran = parent_sb->s_time_gran;
-- 
2.43.0

