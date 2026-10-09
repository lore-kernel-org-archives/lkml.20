Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DF44F052F;
	Fri,  9 Oct 2026 17:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568121; cv=none; b=jYi3K4KhQMSqzgavPQ7WWoe/p45y+WSiebeSxVqG3c7YP7m+WQzXhphH3Pw9y7RPDp/zsNXGSFvCqx2HTJwl8jc8dlsB5L40wtjnlP1bAO7u/V4/ZLh7mtrZXtn4d8YwlwFWhHWfLyyjEevEusy6Ur6VmvhOsBcd9PQi+Y01WDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568121; c=relaxed/simple;
	bh=4GAV9kLVXIxKRDHOBNdVt9kSpomhifWqD421pyvWtVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uwDeDRobCXa+0ncUm+qskMaYgijq4tpXMopTX50nXNiXSQVq85o1dx8e/tXOhGgJq01alkxlIvABkcKJwWFxFeSwaB8J77TIjpdAnhtfIJ5a/pgEfhXYqTXsz/VVU6+aTVmlPCi5M5rHQADke6joR0xKsFLfOCm0oU2zlkkWXDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4Jj/QVt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4Jj/QVt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB031F00893;
	Fri,  9 Oct 2026 17:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791568120;
	bh=l6ugf7gz9zuVuodjdoCPy2c4mSgizuDlEBC2ZN5Pyws=;
	h=Date:From:To:Cc:Subject;
	b=O4Jj/QVtuNmGY5R04gRpIWeADOlf+bDJiGIiG69cXbIH3CK11s3RlxPPrylXebO59
	 EEGyEYGdsnlSCy81mvU44Pp0Y14vdkzujNcDoallcfcX1jNoTEiQIXZtGwq8ACHFcg
	 utkZC85bCjoCLQ3ybCRyqOQAv1MgziAtfF1zzeD0XCvquXgyuxttrmdqddePczAyNf
	 5B4e4fXPzOP4z5MWAQ77wXJ+oz5Rp5wbrk4BtU7MK5bS9z1MBtEItd7C1m8pDWn5sQ
	 21dwFhTeRado3vZUEYfeAeBkwoEKOofVBO0dpGp3sXVr/EvztBqoUJleFAxTA/IQL2
	 qLt4ZYHiu4uKA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9AFCE1AC57D0; Fri, 09 Oct 2026 17:22:27 +0100 (BST)
Date: Fri, 9 Oct 2026 18:22:27 +0200
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: DaeMyung Kang <charsyam@gmail.com>, Gael Blivet <gael.blivet@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the ksmbd tree
Message-ID: <askUw5AgDKVrohPG@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/smb/server/vfs.h

between commits:

  8c329cbedbe15 ("ksmbd: use the existing xattr name for a named stream")
  9a4c5d1700381 ("ksmbd: look up stream size by exact xattr name")
  26a14db500b82 ("ksmbd: copy stream content when renaming to a new stream name")

from the ksmbd tree and commit:

  16d90b57d8439 ("fs: port xattr to const mnt_idmap")

from the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/smb/server/vfs.h
index dedb103316573,67cc48e583c81..0000000000000
--- a/fs/smb/server/vfs.h
+++ b/fs/smb/server/vfs.h
@@@ -109,15 -108,10 +109,15 @@@ ssize_t ksmbd_vfs_getxattr(const struc
  			   struct dentry *dentry,
  			   char *xattr_name,
  			   char **xattr_buf);
- ssize_t ksmbd_vfs_xattr_len(struct mnt_idmap *idmap,
++ssize_t ksmbd_vfs_xattr_len(const struct mnt_idmap *idmap,
 +			    struct dentry *dentry, char *xattr_name);
- ssize_t ksmbd_vfs_getcasexattr(struct mnt_idmap *idmap,
++ssize_t ksmbd_vfs_getcasexattr(const struct mnt_idmap *idmap,
 +			       struct dentry *dentry, char *attr_name,
 +			       int attr_name_len, char **attr_value);
- ssize_t ksmbd_vfs_casexattr_len(struct mnt_idmap *idmap,
+ ssize_t ksmbd_vfs_casexattr_len(const struct mnt_idmap *idmap,
  				struct dentry *dentry, char *attr_name,
 -				int attr_name_len);
 +				int attr_name_len, char *actual_name);
- int ksmbd_vfs_setxattr(struct mnt_idmap *idmap,
+ int ksmbd_vfs_setxattr(const struct mnt_idmap *idmap,
  		       const struct path *path, const char *attr_name,
  		       void *attr_value, size_t attr_size, int flags,
  		       bool get_write);
