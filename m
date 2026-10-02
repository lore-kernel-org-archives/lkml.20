Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB692F9D82
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952553; cv=none; b=Ko0/rtfh9FmP1463cMpaX/vwF4KMHsWm4Hs557Pd/sBub9se6V/+jdRHH8vJnjBOWpvt5XExO/sY4ANSbM7V+1S7el5th5Y1E8MW8aMRhnd1P/0bUAQVVf5XfNoDNRMu4VnAcVwP9tPG3ErgqnKrlJ50vFIkEQDVhn5TQZFNWfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952553; c=relaxed/simple;
	bh=uGU/UNB+Gdnv5PgxdsRAO6uFb5Ob7DSUR19aYS79m/c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JL7Ep3c3CmpndYhPHIx3oU858lrsYLTvSX29ZQTk6FgO8cG8iaYXEKOEXO2K8M8dISIEwiuTZYZoxou5zSFvTk+sGFN8/fKF00Pz4M3wEdFNDy7C81y8SYqQOIboaYoljBdO4m4bLonPmnoV3YCyTUIJ3+PVckB/yEQBQVlDX8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-448a12ddfb4so3164872fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952550; x=1791557350;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XyIrMZJ4sElWfT20xT9SrUZKpfu5sxniOe3iW1yLA4M=;
        b=SJOl78bQe0YraZO4Mr3+oSgynAO8Q1MZfXRPzb4VraS375DI4N1rbKumQk4u4i4YlN
         VOuRhUPK9OLansnwivD9CxAyafmi2UnI2q+ma7qfFRfilfkUBE9332Qo6heujo1aOZAO
         te0x+M+L5Mq2Mt6C6QrTinrwVQWNuAvaW8aNYwf2t4SGcOOQQbXT6ziAq1t68zY6ndlF
         orG+VPRC3N+uJ3Zewl2aP8uHk2odTjbQ3CMFdLWgyBUwn65EgIXO9K/JiQ+BNezMBA69
         ZOn9CtQzX7mvsAnPtTZ4sgXJ+UlO7WBQFovUZRGPKnE0J1Gg1gnf1Tv6OZoBXRiN08OK
         dXhw==
X-Gm-Message-State: AFuF++mrKfHqpCUCQVHWcB9pLeMBKLtNC1L40WDRq15KsB3W8omiOEP9
	2LvVq7LsDZFbjnJWESqPYBLZAB6rEX+lmjtKz5mQjYSJQy9vghMKgId+tLM7WPepyXeonFnoIOy
	c9XiMIRg3+q6dWYCwb2tNdf+KKKYLA2lLi574fng/d+GcZURIsZhF6oW05ao2RA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3442:b0:4f3:f7da:3e55 with SMTP id
 5614622812f47-4f52b4b7ebamr2212068b6e.62.1790952550270; Fri, 02 Oct 2026
 07:49:10 -0700 (PDT)
Date: Fri, 02 Oct 2026 07:49:10 -0700
In-Reply-To: <6a396a65.52ae72c2.136ac7.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abfc466.7503fbd6.2d3f6.001e.GAE@google.com>
Subject: Forwarded: Re: [syzbot] WARNING in can_finish_ordered_extent
From: syzbot <syzbot+085adc3f91549d11066a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] WARNING in can_finish_ordered_extent
Author: adarshdas950@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index d7600e5fa3d9..2117b2a80edd 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -1895,9 +1895,14 @@ static int submit_one_sector(struct btrfs_inode *inode,
 	queued = submit_extent_folio(bio_ctrl, disk_bytenr, folio,
 				     sectorsize, filepos - folio_pos(folio), 0);
 	if (unlikely(queued < sectorsize)) {
+		u32 unqueued = sectorsize - queued;
+
 		btrfs_folio_clear_writeback(fs_info, folio, filepos, sectorsize);
-		btrfs_mark_ordered_io_finished(inode, filepos, fs_info->sectorsize,
-					       false);
+		if (unqueued)
+			btrfs_mark_ordered_io_finished(inode, filepos + queued,
+						       unqueued, false);
+		if (bio_ctrl->bbio && bio_ctrl->bbio->bio.bi_iter.bi_size)
+			submit_one_bio(bio_ctrl);
 		return -EUCLEAN;
 	}
 	return 0;
