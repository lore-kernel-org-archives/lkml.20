Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725364;
	b=Fjyxe6LGWfWEyZliZILzhuvNjvRTSOH8Dg7rA38xEwM9NtZEDHT1/YNY7f92+vTCrHdV
	 sXP9fBDmSEvT6vhPffTaheNuTdXFqVBUIZ1+ORIQsnOjlVKS9rwwGz1cov+C/bHBO0q30
	 qNU5ys0WoKaupenZYkxWIHFdQLKgLTFBlEGp0yjiZ5n1m4JE77blygaDKCok1wyG8ffL2
	 XE5rEpzQv4E3NW7hPp9uZylCQ29zUjU+GhY6c7Gx9p20qVQSZ8xt5G7UOv/khIjRJXf7z
	 cw2ZmpvsgliWaKfxwSNkvhkbbvCYtJ9CyDG229iZJ/iw1bxEOiK/XZwMxZAPM34BVwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WIZAEgnBwMpqlYT+9Xa4DAWnPrz+dUZjemGDsnG2tlY=;
	b=RHdnc+PWHEbB3n0MefFHFz6vnpSsZj8CkQg2eWIOFrojzKCH4XTtnDbqYG3hlHcDx26M
	 ScFoFxCYpuYbe+L3K9WbmGqCtIWshd7rQmeyAekSHb4FxUPktQVeDwE1a5SSzo9+xcz7Y
	 UOnu9kvdV1utqyHwbi18vYGG7N6VoavslMa6LNdmHeoB7qZpW1Tg9XEEyPrCkzPjWyvzQ
	 X3NyiuNWoYWQG5tQ6/CB66bUCqbr3vJKyaUiJuZLbyevprU4q4eqt7Z73f3ghjDn1jT5Z
	 Y6gJhNvGtqoz3fqGzGA2yNvXwz9nG+dcdHLb1geN8if8oDb5I4vuSJbACWk1U9ZiNtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YN6fhe2l;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05EB606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F05EB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YN6fhe2l
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a315ed211so1063361eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793725362; x=1794330162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WIZAEgnBwMpqlYT+9Xa4DAWnPrz+dUZjemGDsnG2tlY=;
        b=YN6fhe2lpKwCZXtGqCC7dv4I89V8tSwKuMRJx0tBrD3W7roulm8nKuUGmO9s/3/BID
         92VEJVTn9/zYI83ngNqn1H034DdDnfbKJZCgnqDQl6+xDgrnKgJF5OOwPQLX4uyuDPUa
         +80SyRPHsUN68gTZO/TjLjCuNIQmkkMeBVeoQwdEJ+RV/4zlFJAcN/6VWsDefoVlsvXZ
         54XIEaSR9A8hfI51L0SDKAQlbLiqmU4TIe5amFI//PdD3W9DXFGA/sym6zsuc8ISszcs
         kuJVt5MhoNzav3sZcwn0jfHd5VV/MpnvYADlG76ESsy4btPcc41693Z91gQCZ1gStZ1H
         MaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793725362; x=1794330162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIZAEgnBwMpqlYT+9Xa4DAWnPrz+dUZjemGDsnG2tlY=;
        b=ftxSW2UW7VJLJtkDozLWJVXXNUXrnF4hd70uleA3T6Itw/cAIDOpUNWQkkoon7mW1X
         QMDNfpTiHRgkS5RiaKdS74eI5lujSL6h5zEfvhSSznvxUp/fvKmoAd/EflPR5vs8m7t4
         dPr5m1+aMdC7UtTLSfXYrRj0kgmo4pFPM25Xlc1c7l2dHZAf5h470BMaWGUhMBZPwTDu
         YmsZSgwq6dKH1vp90XqG1MtNxbz3DZ4rAsLVO6MGxP5qy8ihLo4O/31Dt4htf+hu9FlO
         fMl9zTNR/IgIMrvhwWPo30tGMDbFobIauzgtZiVY3Jr1UlCNHby9lFA/zdV2x9wWZVry
         XPyw==
X-Forwarded-Encrypted: i=1; AKwUvBxl3TNnOurcfnR4BsFWX/fhJgmZFJCtdROXYDsAtr7AxF/IqLROVEQPEVC+Gm6ydhJvTYM2JP9xiHdfNpA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qIIWxx5GNFGsLDVg/8E2tmhyFdJYAKMmH7W8BJnz24J/dkimI
	TY/O7748eCDJrz2xzEbsQ3fw56hSNKJLVUEPehkr2qcEH4I1eLyEkmHj
X-Gm-Gg: AYBFou2r08jZB58cSHYebpfbLlQV3fGsvyPweXPBEpBYm+8knGJwn3ehkwEr1EBAIWs
	2PfTcg/zdunozlR6cLfsIAcPxEY/LOdsMkA1DhAgCcBfl7rjMds59/t8LF5u5z+0vAxTgnOLL7B
	gMnE00FL9XL/dBzSB+/FbISJwPrAfgANHeL+AiMRYAZoCz8WEXwnqWSHWqk1YfebMopc7gImwrp
	/J1J+lBPIB5kGFJGqOUOu/7dvVOLqq3+oers02gcByf6DLYjCA94ucB4ELrR+d4hfbHLtoYuoU5
	SjHS255bE6dNJ9527jMY+9Oa4P+dmf562VcSWJ4fMuFYi1NHR30H7r/N1XNB3INju2LoSwBcs0u
	PfYZt016YikywXoIuX8zpHkH77nkwSZXnjOPKUx2gfjHPp1EZOuOuloIU5Pe39BFWJNTNmKDPRB
	NicdS3xKhuiJ0PvglDp7YvhcPpgN2xiaMqZhFCaBT+itEKqby8q6phv+ONadvZaWLsyMokWXjkB
	LzeDrpQUmyX5HXnaDg2YOf0cjQP4kM3d6PnPK2OSjvi2SVW3nlKU0HqV4AaoqhYQDCyWKt2XApm
	6LvEnurZsl1yf7/fGKC1+tdOlnLeopmJcxurDBpaLlaSGZg+BIqcQpuOv8gQ2kk0RuoLu14bvaC
	8rci9
X-Received: by 2002:a05:693c:80c5:b0:36c:a165:4d27 with SMTP id 5a478bee46e88-36ca165569cmr229531eec.18.1793725361698;
        Tue, 03 Nov 2026 09:02:41 -0800 (PST)
Received: from localhost ([59.176.91.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm47809829eec.8.2026.11.03.09.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:02:40 -0800 (PST)
From: Amal Rockz <amalrockz669@gmail.com>
X-Google-Original-From: Amal Rockz <amalrockz568@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Amal Rockz <amalrockz568@gmail.com>
Subject: [PATCH] fuse: don't install DAX state when CONFIG_FS_DAX is disabled
Date: Tue,  3 Nov 2026 22:32:36 +0530
Message-ID: <20261103170236.2100236-1-amalrockz568@gmail.com>
X-Mailer: git-send-email 2.56.0
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

fuse_init_inode() installs fuse_dax_aops whenever the server sets
FUSE_ATTR_DAX in a LOOKUP reply:

	if ((attr->flags & FUSE_ATTR_DAX) && !fuse_inode_vdax(inode)) {
		inode->i_flags |= S_DAX;
		inode->i_data.a_ops = &fuse_dax_aops;
	}

fuse_dax_aops only provides ->dirty_folio().  The rest of the workflow
relies on IS_DAX() to keep such inodes away from the page cache:
fuse_file_io_open() refuses to open a DAX inode unless it is opened in
passthrough mode with a DAX backing, and the truncate, fallocate and
fsync paths reject DAX inodes explicitly.

Without CONFIG_FS_DAX both S_DAX and IS_DAX() are 0, so the assignment
above still replaces the address space operations but the inode is never
marked.  Every IS_DAX() check is then dead code, a DAX inode can be
opened and read through the page cache, and the first read reaches

	filemap_read() -> filemap_get_pages() -> do_page_cache_ra()
	-> page_cache_ra_unbounded() -> read_pages()

which calls the missing ->read_folio() and jumps to NULL:

	BUG: kernel NULL pointer dereference, address: 0000000000000000
	#PF: supervisor instruction fetch in kernel mode
	RIP: 0010:0x0
	Call Trace:
	 read_pages
	 page_cache_ra_unbounded
	 do_page_cache_ra
	 filemap_get_pages
	 filemap_read
	 vfs_read
	 ksys_read

FUSE_ATTR_DAX is a server-controlled protocol field that is not
validated against any capability the kernel advertised, so an
unprivileged FUSE mount can crash a kernel built without CONFIG_FS_DAX,
such as x86_64 defconfig.  Reproduced as uid 1000 inside an unprivileged
user namespace.

Do not install the DAX state when DAX support is not compiled in.  The
flag is then ignored and the inode keeps the regular address space
operations.

The bug was found and the fix prepared with the help of an AI coding
assistant.  The reproducer was written and run against both the
unpatched and patched kernels, with CONFIG_FS_DAX=n and with
CONFIG_FS_DAX=y.

Fixes: 2fbe4586cff3 ("fuse: add support for opening dax device as backing")
Signed-off-by: Amal Rockz <amalrockz568@gmail.com>
---
 fs/fuse/inode.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 1341b681d0ed..cf5fefb83e20 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -418,7 +418,13 @@ static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr,
 		fuse_init_common(inode);
 		fuse_init_file_inode(inode, attr->flags);
 
-		if ((attr->flags & FUSE_ATTR_DAX) && !fuse_inode_vdax(inode)) {
+		/*
+		 * S_DAX and IS_DAX() compile to 0 without CONFIG_FS_DAX, so
+		 * installing fuse_dax_aops there would only strip the regular
+		 * address space operations without marking the inode.
+		 */
+		if (IS_ENABLED(CONFIG_FS_DAX) &&
+		    (attr->flags & FUSE_ATTR_DAX) && !fuse_inode_vdax(inode)) {
 			inode->i_flags |= S_DAX;
 			inode->i_data.a_ops = &fuse_dax_aops;
 		}
-- 
2.56.0

