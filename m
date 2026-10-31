Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461466;
	b=N0a4IMC8TkU2gaWBMJJ4Pb4vYYOLXcgLBBmz0HlWGiIkWrsv/sVRpsXqjRzMRC8ynvwg
	 uvVYf5OqB/F5SP7lqHysYnqlIxlTYzztah8JkTyUaf8epL4u4psGLJagv71MTU2NNdcYQ
	 XTUK0pMNxCDbpwg8q80DQLr1r6QnfRNRZEjZPDHhEm/lAfpt/gV+WHDkXYLxqRZ6F4XHz
	 Z6j23JM2VYoCRRbt0W+CZcW0CR1aQnuI8n5TqXawWDaxh51njhUNwgybLdmxbFQ1VCQrO
	 Ac1/LsSRN+SQHyjYtI1Fh85Ot4uY/2lEve1UNAykj1R6dZMv93pj0DXmptp2qmiRDHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=56Jp62HZwbl/bs25PK+pXtbwrUN07Joj+4AgiDDMgHU=;
	b=j33d1r+fjRwF9QQXWcsOPL4UjnrDVnA92i0GkGlTLIcZWTErHxp1iJswfmLdL5qoPxUe
	 pB/g2gSGcTgGdzUu3OmczuPY6JwTpYlAfVZUVrour1yQtjbrWv1xZwOwbBUwM7ibHLEVX
	 wCVvJ9MYD7tQGzEGHEKfapSuDQLZ77DZTTo9BGJeku5zX0aEwPDgfB2b5G7o2pdCF2sMl
	 AlydJJ+XzJs9IrsXqb5a/mPjgsO04i9wK2DH80CGRBW10BA8b+pAb3YDvB0tTckD8gvVr
	 5DoSwaq6wIDOsqBmGxcp135DqX1GP2RVaEgpDZNgwXjjcg/xmEvxRvlVBhtG4ZDmINg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JlB8oX09;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B651E606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B651E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JlB8oX09
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-745497ac8fcso649021137.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793461465; x=1794066265; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56Jp62HZwbl/bs25PK+pXtbwrUN07Joj+4AgiDDMgHU=;
        b=JlB8oX09+gQ0HkWyOkRuAVVACNCbNqN1h+iW6a9AR/dEqjdMo4CpJs8/c2wMjxEcmv
         MVcQKdECqWy09zVNJNVw/UL9n1lOVxoHChZpXhuTB6ZDt+SUF8IvdzZpIHCGMMmsNuZL
         hlYpdSKkXWy1qm3KlZVVkcJnPmlPvT01IJLy2jTGirQ8vpIpuhHJFJ8MpQ6i+EflmXCF
         ME3BqoyVJbaCtHOl0fcKRIeg0dRQcez2+u2d/SYj3ZScC83t7rsGS6trFbjevxA+by3m
         9X/NYcjXd6PGxwf8MC/yn7ntF16SjRfeE7rj6JvFUf864Rfr3N6PTQMROVum8IE08lzR
         9bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793461465; x=1794066265;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=56Jp62HZwbl/bs25PK+pXtbwrUN07Joj+4AgiDDMgHU=;
        b=IWXkXXXzj5LSUvGNLZXBV3xkX0bOXUz0uOMhCqEsijSCX7ovSJ066jjubxExBt4Kt9
         U/GD5PWdA35FsVvtbvdOgZgGPC1n45sfT9oj7LRCD8l4P1rtkcx19SslW9rmqzViqSNz
         Z3mcCAdblTif9+ueJRiMCUHtMv3mx1Och6EvPCXbDC9ZV059Ahwp+msg9e1BQmMPQ5JO
         ZFwCpvm1UXFAYgjy1t0Box5AVO422pgIDkFfMB6NJaxEovuhK6Gr6HfyDJHaB+B9CZfy
         xDC4JEibfdn/4+fdSen3g0H7pjW8wnjHayjUxdEgwhBAZYYU6xyLOvCtDQKfpm75lP6V
         5YmQ==
X-Forwarded-Encrypted: i=1; AKwUvBybyztIbKkfCMzz6mM8qkCTtoivvsDALJhht+yD8T/lzm+BF88nYCwaCIdBlL92UeZ3xMEB6LyX9hexAGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYITMev21dcySjjc7E1xZ2HTV3fp3xMi7wg8Y56lbm8M2ZXaUw/T
	bLYIQa6D7HQl40+hdb74QI1H9XhsiX4st59LLoN44s5c+mh3poCpot8f
X-Gm-Gg: AYBFou10j46BGye6Qe7UOftd4NUWZYtBE56KHUtA+EL81PSr2p9Rh+6UsMEimF+Ym6R
	gVqgbULAJots7cC0dDp2JLs0s+JORPN4YwZ4YOSyusi1qZacvJ+98wYekOlBDFGTdh5qB8ATkMa
	uSVGuI2VjsQiLl9ZtZ5WmdbfJNP5Bp2oZHZLl3k1S0alzowcJkM4rkh22b+HTr+4x5LAFD58Pkm
	JBNBHPdZjo74DPBjkVCLQtfTumSyb3kQSHXMnz5fNnV44lFAlPBslg6HHCLQ+ndVinjYhhmiW1m
	/YlwJRlrHiQtiQaXZiGj7YE2SPIWNGf7oH5nopTHFrW0YV1/fxskEt5CpwDXwvJrKfDrQsSBIAc
	pzK/N+uk7Hc/vZQ/+hw9lWLPrFeBLA8eI0VZo8mFtS8DJvG28vAtKC0w7TUSRtGOzAHIFtRw2wS
	PBPMe+AQOm/DyIo/f4AoxcedSXyTGE3SrAV+wev23/TAb2OxIaLY5PwdUJCSLyjP1YagRPYDzxr
	1BsgEjncP+A6pvnwuzkiesdmqcZW1/dndPu6F8jbXNugoRF2n1Oa3XlR+ljiVUa6R6/++N/tj/J
	hMppjeW9Dhf1VIYu9XrbdTjn1Aliq5wZVN3bv8JplV2r8yGU5nLvL07TRzbTY46NAy7duCWBeTF
	UAIX5U2BsIADu7apB163Y6Loq9vizzsnABCoj+SENdTis8ipCgHTrWubhthsZ7IQjZp8pUB3T5E
	s/+XKxaLHKDjF5Zeo=
X-Received: by 2002:a05:6102:3ec5:b0:7cc:2bb7:131d with SMTP id ada2fe7eead31-7d072baa484mr2303904137.9.1793461464434;
        Sat, 31 Oct 2026 08:44:24 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2804:7f0:b101:c5e8:f804:4efd:32bc:71d3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d077606b7asm5730837137.8.2026.10.31.08.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 08:44:24 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Miklos Szeredi <mszeredi@redhat.com>, John Groves <john@groves.net>,
 fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fuse: refuse FUSE_NOTIFY_STORE for DAX inodes
Date: Sat, 31 Oct 2026 12:44:19 -0300
Message-ID: <179346145958.61208.701521796030924197@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Since commit 2fbe4586cff3 ("fuse: add support for opening dax device as
backing"), a regular file is marked S_DAX whenever the server sets
FUSE_ATTR_DAX in the attributes. This does not depend on any INIT flag,
so any FUSE server can do it, including an unprivileged one.

fuse_notify_store() does not check for this. It adds ordinary page cache
folios to the mapping of such an inode with filemap_grab_folio(), while
the DAX code expects that mapping to hold only DAX entries. When the
inode is evicted, fuse_evict_inode() calls dax_break_layout_final(), and
dax_layout_busy_page_range() hits WARN_ON_ONCE(!xa_is_value(entry)):

  WARNING: fs/dax.c:825 at dax_layout_busy_page_range+0x394/0x4dc
  CPU: 0 UID: 65534 PID: 93 Comm: fusedax
  Call trace:
   dax_layout_busy_page_range+0x394/0x4dc (P)
   dax_break_layout_final+0x104/0x278
   fuse_evict_inode+0x2cc/0x57c
   evict+0x2b4/0x748
   iput.part.0+0x51c/0x964
   ...
   fuse_kill_sb_anon+0x170/0x268
   deactivate_locked_super+0x98/0x11c

With panic_on_warn set, this lets an unprivileged FUSE server panic the
machine.

DAX mappings do not hold page cache folios, so storing data into one has
no use. Return -EINVAL, as is already done for files that are not
regular. This also covers virtiofs DAX inodes.

Reproduced on current mainline (arm64, CONFIG_FS_DAX=y) with a FUSE
server running as uid 65534 in a new user and mount namespace, answering
INIT with no flags, LOOKUP with FUSE_ATTR_DAX on a regular file, then
sending FUSE_NOTIFY_STORE for it and unmounting. Before: the WARN above,
and a panic with panic_on_warn=1. After: FUSE_NOTIFY_STORE fails with
EINVAL and nothing is logged. FUSE_NOTIFY_STORE on a regular inode
without FUSE_ATTR_DAX still works.

Found by code review of the DAX backing changes and confirmed with the
reproducer above.

Fixes: 2fbe4586cff3 ("fuse: add support for opening dax device as backing")
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
---
Tool-use note: the code review that found this and the reproducer were
prepared with help from an LLM-based assistant; I reviewed the change
and built and ran the tests myself. Reproducer available on request.

 fs/fuse/notify.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
index 984e4945e..938440474 100644
--- a/fs/fuse/notify.c
+++ b/fs/fuse/notify.c
@@ -167,6 +167,11 @@ static int fuse_notify_store(struct fuse_conn *fc, unsigned int size,
 		err = -EINVAL;
 		goto out_iput;
 	}
+	/* DAX mappings do not hold page cache folios */
+	if (IS_DAX(inode)) {
+		err = -EINVAL;
+		goto out_iput;
+	}
 
 	mapping = inode->i_mapping;
 	file_size = i_size_read(inode);
-- 
2.43.0

