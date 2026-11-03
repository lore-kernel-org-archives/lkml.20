Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687709;
	b=2nNu9pch/MJaxPm8+LQ3bghclmTcYd07A66G3Zi8IIUR2J7epCId8Y/hg1o7pZISSF5z
	 H5wHtbxl5zSZWgS0b12CVyXpqPIOFtHT9xXhzt3eKwqse85i0QQqqyRERVQ47DT4RjpxO
	 zr3lGLUsMV9oF2wsGc007Hvn6k6PrV76k/S+q98NIEKewExQYzaOJtO9n9aLAcpgZyGrv
	 OEE73ov7yHrtrLIOFYV+HZ7/y9s3jyAmc2suoaNO7wwFuO9SwklLZt2oe2rSlhJStcE4T
	 fui5f4KK9nvxvv75Gz7pNtIWyN5MOLhDfqiEfQ3O9UoNQ1ndqFzBqD4j9r/Z5vJFvwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687709;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:X-OQ-MSGID:Date:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=yAZOZJs9KcIFFtegfeWb7c/pQrDj/UhaRfTWHv2xopY=;
	b=FIduf6glT0SaY0kTB4sqCUdMHAQ+cBHWEmWSuzRdHoMIygr5UgevlgtYKvpI1REEr+lu
	 61pd+HrAzcdFx+VwOG736T1bvLBw6eFAsnoNEdBo73WRMHn32+nYj2/6AoFvrtxP0mBHr
	 qy0VC+lThrxPNLU1kIrYKS2vXXThjAvmbJzpWEMeGQ47JrHsO5cqu8vqCUATDZ3XP78XT
	 19kULm1UVxDEGBJ6qZU/atNJSkWQ2Se1llCki9QlPqys0u5xboQQ+4qamPRDyoGFO6dm/
	 lZh2evKxe9f5y3EsiPnN+7EXXtZGWJElS2sVhbX9qmmnV+P4D44+gJWgZfpnmz21IxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=U0z1YiP3;
	arc=none smtp.remote-ip=162.62.57.87
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABC4606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ABC4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=U0z1YiP3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793687702; bh=yAZOZJs9KcIFFtegfeWb7c/pQrDj/UhaRfTWHv2xopY=;
	h=From:To:Cc:Subject:Date;
	b=U0z1YiP3+zQEbzpsdILd7lN9lKliz38qZomj5oti0jgH409LhjksVx/lW1hv09sn3
	 aMfe5Ii72WIGtWeApJ6mkw8Ite+qTpl4xe6rLxXkJ32hTvuTXzxUo076PbgLti51wL
	 dEToCdTUBK9ZREfLMETTHg8ON9CstNLe/Y0y7LTg=
Received: from [172.18.4.77] ([61.136.26.103])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 8C007267; Tue, 03 Nov 2026 14:35:00 +0800
X-QQ-mid: xmsmtpt1793687700tfraguhhw
Message-ID: <tencent_B367A2067C2EA3845289BED747449C264D09@qq.com>
X-QQ-XMAILINFO: NI6TJc3opC6F7/qwgER8n2ajpIziUYrbt6OBeYaBbDkrO1CtCBgNYItxZoygtg
	 IhX2seLS5oPW6AKdB+KhI85MkHwjkrqYIZzQIv84qtgseD62H6H9pLQKmT/ElNGM2ZdbXpTuHKmi
	 GLOYcQMgb3N5vERuK3MgZLICHqY0EL4qQ1HKEXEyWNBI8kvgNnw/6BMbigty8ztQCNMeB3CvCS4a
	 IsY9W95PpJQum8qbYVq9wVz3TiwqjL4mszEpPmG/quEQP3SFccClbY3NXN7io7a2wy3aE+cn18UQ
	 /y8EkALmVSBfxk9OA9ChVAiuNHGoypjrTk2EAxRRaLOsU2AvAtByw0UmlQpju3jhI/5VI9jcv6xn
	 1QhAFTef2EKADWIwsYtoXxa8aO5SEsH/YWNpE/+jPy/rLSZrbHjjMy/BPrDNlTVGU2Y4cJz349UJ
	 yokZbCHATwdhYNiG8UUmwrL9iOPrwFsfnMoptArTwiYfI4g2E5eKs7kPHynQw+yHqoE1nG7pyI3h
	 rKubWpAQQufzTZQ76xOh3qUYFSu1u5axeruo4Pbq87dIzYCQYL9/+QqI6xu64CgAWqgarO3pFL+x
	 bv1/91JRaS5CMpqWIq1BsYWXMR3p0o1q0QtrPRu+PO/MYkloZ/1hxJRf3N84mbcmD4/oopRyQSKx
	 5vVXHdohEocq4L4wSnV+ZUdtGyhfmuYxlXnNhpXZd31yMjcKsUdkNcqzSqnIzjrjcW3z9huWCgt7
	 hOTdsSuprZdG1f6kXe/p8C6qoav/ZycVquJ2rgYxESnHBMpUO0qiCYKOP4U60CMjdbJTb9eBBRM7
	 J9Akn5Y27+7C4POpr+CMAo90nP8VfIleWad9hcXWepF22YdiA+MeP19dv8pPAepCYFkLT3tU1HEs
	 HFuT4iLq89P5KwG4OMBR7mB4RRA6oYLr5gFxjJ9gODY58fh+Y1KBBwaUtgzqT0hrXWmHdY2WVLox
	 S6apXKCYTVHW2xflnYNIqxZQgD+gbRc3IUvTkSH12a/yJLItKdclU9wv/dS6S2+DnKk6f7eM4uKO
	 XZDzjNDRI4rsLA/XRe1rBE6HU3o8KQqhbuXFFo6w==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Guikun Yang <yangguikun19@qq.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [Bug report] gfs2: unvalidated lf_depth causes shift-out-of-bounds in
 dir_e_read, dir_split_leaf and gfs2_dir_exhash_dealloc
X-OQ-MSGID: <c12-gfs2-lf-depth-shift-20261103@qq.com>
Date: Tue, 03 Nov 2026 10:00:00 +0800
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

Mounting a gfs2 image whose leaf blocks carry an lf_depth larger than the
inode's i_depth triggers an undefined shift in three places. i_depth is
validated when the dinode is read; lf_depth is never compared against it.

  fs/gfs2/dir.c:1560  dir_e_read()
      len = BIT(dip->i_depth - depth);        /* depth = lf->lf_depth */

  fs/gfs2/dir.c:1050  dir_split_leaf()
      if (dip->i_depth == be16_to_cpu(oleaf->lf_depth))   /* equality only */
      ...
      len = BIT(dip->i_depth - be16_to_cpu(oleaf->lf_depth));
      half_len = len >> 1;
      if (!half_len)                     /* checked after the shift */

  fs/gfs2/dir.c:2137  gfs2_dir_exhash_dealloc()
      len = BIT(dip->i_depth - be16_to_cpu(leaf->lf_depth));

Observed with a 4K-block image (mkfs.gfs2 -J 8) whose root directory was
grown to exhash with 400 long-named files, i_depth 8, 16 leaf blocks at
lf_depth 3. After a clean umount, lf_depth in every LF block (block offset
+24) is raised by 12, then the image is mounted and getdents64() issued:

  UBSAN: shift-out-of-bounds in fs/gfs2/dir.c:1557:9
  shift exponent 4294967289 is too large for 64-bit type 'long unsigned int'
  Kernel panic - not syncing: UBSAN: panic_on_warn set ...

4294967289 is (unsigned)(8 - 15). Changing the lf_depth delta changes the
exponent by the same amount, so the chain is unambiguous.

One detail worth noting: BIT() yields unsigned long and the destination in
all three functions is u32, so the truncated len is 0. In dir_e_read()
that makes index = (index & ~(len - 1)) + len evaluate to 0 while
index < hsize is still true; in gfs2_dir_exhash_dealloc() next_index also
stays 0. I have not measured the behaviour with panic_on_warn disabled.

gfs2 metadata blocks carry no checksum, so the image is built with
mkfs.gfs2 plus direct edits at two fixed offsets and needs no checksum
recomputation. A single forged image reaches all three sites depending on
the operation performed afterwards: getdents64() for dir_e_read, creating
an entry in a full leaf for dir_split_leaf, and rmdir of an emptied exhash
directory for gfs2_dir_exhash_dealloc (gfs2_dir_del() decrements
lf_entries but leaves GFS2_DIF_EXHASH and the leaves in place, and
evict_unlinked_inode() calls gfs2_dir_exhash_dealloc() when the flag is
still set).

All three sites obtain their buffer through get_leaf(), which has the
directory inode at hand, so one check there covers them. After the
existing gfs2_metatype_check(), when no error was returned:

  struct gfs2_leaf *lf = (struct gfs2_leaf *)(*bhp)->b_data;

  if (be16_to_cpu(lf->lf_depth) > dip->i_depth) {
          gfs2_consist_inode(dip);
          error = -EIO;
  }

lf_depth <= i_depth holds for every directory built by the kernel:
dir_split_leaf() returns early when the two are equal, so a leaf is never
given a depth above the inode's.

The reproducer (image builder, VM harness, crash log) is available on
request.

Thanks,
Guikun Yang

