Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320714;
	b=V83h9TMYJJnKI05AJRIT8EKUlu0r2aQb/OIDqv/AA1xUlb5n2SEXfGM43WV5nSwTN7Hu
	 0jg5t0H1Zoqk9VxDQs62bxAFTq8/UaIHI9LIMCrU2igrQu/oY36Q2k7wY/wanBSls+1DZ
	 FWFU/Jo6yBGY4FT3UIoM6cbUfbLBBNtmMehreq3Io1Ovr5Fan+k+pSqA+5r7CPC8VoQCv
	 3Z7xURe2cv7UkKzoLa6MEAHhOpg67duxnB6dxv5IcR2h2ce9OyE6HCXlp1Wn7XjemmCEG
	 yTvSmzmege+whKfQOQtBm1XEmdW2n5InSR5IwjwRADUajfJKz81ElFtKBTSf1clBkWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=inwjjj3ubMG5WJ+XtAtEKVOvNIrYIBG+8zpVgeYTF4U=;
	b=PMPcpfkP1E3Hd3HPtd7rIrp2nTuafkAT8zd4lEOOvJVuQ5FTwny8DiaRb1BvZwsV/T7t
	 dhrK/3xkpiZj+T8BiZ1oZYd3W2L2g3JqrVBp1Efw/afLJQ8zAooMUZbFg/MCLZOcK6wi3
	 wwdn+bvswdqF7fkj01YIKFeohsAGuUoFr/GXVZMbPOCR8wzk5XihnfG64I2vUNPNzC9dW
	 rZBOt8kbohT1MwZ92P6Y5fIzbATBKExqYBFkoIwziRlY5woeFS2kGvDHjVOr3XgzsxncB
	 VmLa3iAB2cUT8qFqmyYtKm4wUNEm14Fn+hIXYpHmTYXC4F+34RlQUZCNqBSm4DHowiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b="bdXQVm/1";
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FF360727E3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FF360727E3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=bdXQVm/1
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso20564456d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1794320713; x=1794925513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inwjjj3ubMG5WJ+XtAtEKVOvNIrYIBG+8zpVgeYTF4U=;
        b=bdXQVm/1r6LGPidnUqsMUnLvzkg0TZvss5wFLBMtnHHus2yskdSUmmCgrPZxIqEXUi
         l7cMiFIxgZ5SZPhi4q8SeUmX88oUnt2ucjiPQbjoG0SpaVZIfmwdwuYsdFjPkIogtTVU
         40/F+EF2ULPkXhDKZDeXJBeE3kDIlcd7+d/SVd+Wv5en/U+agfFOe6DWYFe2V3plVRCm
         +kkXnE7ma4xhdZqPzVXCBdrK6MAv298WyXw0vwfFaHmOkiApOlJ4+8rBCMizTOMR0ZIH
         kakMGYUknM/Pn1pYYJL68gOoDQmI1EMW00hp4xCNVvr4fmtUKIAP4M799zJxy2ppixaN
         TKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320713; x=1794925513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=inwjjj3ubMG5WJ+XtAtEKVOvNIrYIBG+8zpVgeYTF4U=;
        b=oYuzaSGvVslYmGO/Sxg7cEQkBCQ81z9D1hMz9/JY4fbmC8w2uzRNoaQZpdmIsrGT06
         RLr96GsqYZHWVNFV8dE77plQ9aFcfjPXcT01fzLhyIPmF48fHDM7sNynQIftvDExg85U
         zR/VPCB3jh1S0tRGxjoYCaglMnBYEz6JtChDwzF3Ca6JYff8OX4n5VHcqgDW/6wkxdEY
         i7/BUo9AdhCTF6Bvi9MxZKZwNwA2j8o2+dJUYMCB58QGXg1KkCmHseC6EoeCW8thibli
         NDX3MhRs/heb24ILRb96CA04GI7FAEMa8F/HrfOhptgIpvQlh7PZW1yFi9qw+G7nEBeK
         TqKQ==
X-Forwarded-Encrypted: i=1; AL+hErEeVIL+dUd3AVOR+YkaBllZ/ll2iPcCBKH4S+87wAU2cizYp5uYeZ3mq6ZiNARNjTSE72mtdArZs7LBrh0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8poE6Xq5xg16f0ym+yUOZgGs1JTCbFD5wGihXimoOnWl2290y6
	9ngXSUvgS/MUj8xM5AhlDpvgpZPSG2ClCxUozRe/YwuCCPt6jGu5rS7hCEgEov8gr5Y=
X-Gm-Gg: AYBFou1IzB0JKKcqKj5rmgfXxukF+VvOC8v7XFzSJ9nhIHrIJlVuQsTFXNRtzAEUMpv
	1t1nBr5k9hW2h5dew97iLaPoHMxJ0/26F2MiC+Mv6il2Y769jgFtKR67po/pKn01lLUYX315kQk
	mHaUcZFNM0MolNeqp4FwZrpJ9OV4/YxeMgotJuSB7L4fIaLStEPxGhjqPRLsLL8PdU5zgqyaytn
	uCBZmcNyFQ/7WMI8O9ng27IeIlh2xYnEAitVk9UhMxZG0YdC0jaR1uQoRvQ4X18Ep8c4l5Uyz4q
	yo22J+HipgHSnlS8crOcIMkVkCmeXPpW09870upQeItCguEVjKkJG0wZo18kMxgaCElFMQHqtsT
	iGSf6fZIK2nQmbQbfv2teZx86VukmxS9IPygzJ/RBJpbnHa7bFlYxbStbvlu5s6sDTdUx/XoTU4
	nzDt3SaaofIf7nq89LctmtsTX2uuWWnQCYaDs/NaNkhAs3KrRWxqwbov9ORh7/0FTprT3Z/WPVv
	2JsC82k6uETO2MGO9K3jyKjdY0asShaca/6zj1MvM3TQXYK9QcZj7AgkaJLlct7M7sPb2d6b2V6
	iL9yluL6X4jTMD6XGuDfJKFCgxMu7uNaHOYK7IEJeYRN6w==
X-Received: by 2002:a05:620a:319e:b0:93f:633b:ee1f with SMTP id af79cd13be357-9479f2b50c8mr464025185a.28.1794320712437;
        Tue, 10 Nov 2026 06:25:12 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73a8fasm232894785a.7.2026.11.10.06.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:25:11 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 10 Nov 2026 14:24:56 +0000
Subject: [PATCH v6 8/9] ovl: report failed upper writeback in syncfs()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-b4-ovl-containerized-sync-v6-8-43d1be16a4d6@toxicpanda.com>
References: <20261110-b4-ovl-containerized-sync-v6-0-43d1be16a4d6@toxicpanda.com>
In-Reply-To: <20261110-b4-ovl-containerized-sync-v6-0-43d1be16a4d6@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1794320698; l=2851;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=I6Rii/Ix6PL0KI389Zplr9G5UjzXx6xnHabJY549AWo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKFeT3tU6qZCjIbQWxxAIqAF9LlAoQ/+NDW8wxYmNIajIuI+qGNUY5QkWBu95totv9VAUARwy06
 dPDgzo8WK0ws=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

If somebody else writes the pages of an upper inode, like the flusher of
the upper filesystem, and that fails, syncfs() on the overlay returns 0,
unless the mount is volatile or has fsync=off.  mapping_set_error() records
the error in the mapping and in s_wb_err of the upper filesystem, and
syncfs() looks at s_wb_err of the overlay.  That is not new.

With fsync=relaxed the error also comes back at the wrong time.  AS_EIO
stays set in the upper mapping, and the next syncfs() that has to wait for
the file finds it in filemap_write_and_wait(), after a write that may have
succeeded.

An overlay inode stays dirty while its upper inode has pages that are dirty
or under writeback, so overlayfs still tracks the inode when the writeback
fails.  Check AS_EIO and AS_ENOSPC of the upper mapping before the overlay
inode becomes clean and record the error in s_wb_err of the overlay.

A cursor for wb_err of the mapping would not do.  Checking it marks the
error as seen, and an fsync() after a reopen would not get it any more.

This is best effort:

 - Whoever checks the flags first gets the error, for example an fsync(),
   a truncate or direct I/O.
 - The flags belong to the upper inode.  An error from before the overlay
   inode was dirtied is reported as well.
 - The flags are not ordered against the page cache tags.
 - btrfs records the error after it has ended writeback.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/overlayfs/super.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index f38c6dd2ae47..a0fb85405f68 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -368,7 +368,7 @@ static enum ovl_write_mode ovl_write_mode(struct inode *inode,
 static int ovl_write_inode(struct inode *inode, struct writeback_control *wbc)
 {
 	struct inode *upper = ovl_inode_upper(inode);
-	int ret = 0;
+	int ret = 0, err;
 
 	if (!upper)
 		return 0;
@@ -386,8 +386,22 @@ static int ovl_write_inode(struct inode *inode, struct writeback_control *wbc)
 	else
 		ovl_flush_lazytime(inode->i_sb, upper);
 
-	if (ovl_upper_unfinished(upper))
+	if (ovl_upper_unfinished(upper)) {
 		ovl_mark_inode_dirty(inode);
+		return ret;
+	}
+
+	/*
+	 * The overlay inode becomes clean, and syncfs() will not look at
+	 * @upper.  If somebody else has written its pages and that has failed,
+	 * find out now.  filemap_write_and_wait() clears the same flags, so the
+	 * error is reported once.  fsync() goes by wb_err of the mapping, which
+	 * is left alone.  An error that the write above has returned is already
+	 * recorded.
+	 */
+	err = filemap_check_errors(upper->i_mapping);
+	if (err && !ret)
+		errseq_set(&inode->i_sb->s_wb_err, err);
 
 	return ret;
 }

-- 
2.55.0

