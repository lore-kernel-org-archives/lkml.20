Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B2739890A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790136542; cv=none; b=cI7iIlarJQUmvFzJ8kEN9ITooqr2Wl50CQROtLF3klHWL5XTLIX5v++2jIv9ipo8C7Hi+2+SjTIKod/sNT2m1i4hNb/vzYq1fokxoDMcoO16iYpjr1HKXmDDX55ZiFaIYjK5PzZa3zNCSM9mx4ZeXNWTttEv/QmcJTNGAJ+qBG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790136542; c=relaxed/simple;
	bh=UdYjKDzDlHBRYnAci/gcwRWY29NM8kWdW52jHqyTvSk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=soMjnsvIonumwfyqVLtc0B2/IPYTnaDabaVPUncbpD/g/Fgv060H4FjVyvCsn2HW3Na30myW+ZWuQ7W03wr82tBTLiybg6IXmHnirNeNM/N7eaqppUXEB0hH6VWUt/j5zkqFYUXZY6x+KswNps7SNzJvZcqNuHfM7CIQwFli/8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-80621874eb7so1159281a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790136540; x=1790741340;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q33Aspzqh5MXyn9qpWkXTrAp46anpV1MIRvDrWkhXVk=;
        b=xLlu8qvwG+SB7Rt282iUV9EuSh5i1EjaF6bPmd3oc+1fSujOec+VtnLW7QHKCZ9kXC
         YRi3j+TEkn7IGhAzyMcUQFlMMbNlo4Xs4hs0MdPLXMQJHKCz+aqfZNeKR00uiRzl9XE1
         S6WN8y5nwY2KHHtymwe3mIoiP5iBWoExwRevqspcthHjEPXaM8rbV6WHQ5xdJS77NMZ3
         LlBFG4UhZ8TsE3iphMy0zwcL6jFCD23Ys62Z0A3z9RinvmWtnLyiEa8DVFFBjIZmQMHt
         o/hsiEti6+qKvxa3tHJ4XFbRYI2k0FcJooub3fFo5lrxGBYd5hlLBgmi4v4v4o2QQ8zu
         13NQ==
X-Gm-Message-State: AFuF++kGrTS5hm3s3n6XNGLgrfRcuP0S97crypX+JvPAWqEc6ByXP8b7
	qGWmqFDY0U4wn3NJf8D+NBU5B3aIXytn6BOa1dlC4JGDsCIUzBpYTjxqK5sf/lq1/bVwpBk8y0I
	FmKc4M201a1lJWAkjDBTRexDA8ec23vdKhzFwfTZHxmIfqgADpD0jqVeAzDA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:168f:b0:6cd:3fdc:5ffb with SMTP id
 006d021491bc7-6d2d2b14bbbmr1412201eaf.76.1790136540202; Tue, 22 Sep 2026
 21:09:00 -0700 (PDT)
Date: Tue, 22 Sep 2026 21:09:00 -0700
In-Reply-To: <677f567c.050a0220.25a300.01ad.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab350dc.71f81b7d.15fa6d.0048.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [nilfs?] INFO: task hung in find_inode (2)
From: syzbot <syzbot+6646318bbcf419411bc5@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [nilfs?] INFO: task hung in find_inode (2)
Author: konishi.ryusuke@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 89a312991dc6

Prevent the log writer from being started from nilfs_evict_inode(),
which can cause a deadlock.

diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
index 34e6096069ad..94e309f6bb2b 100644
--- a/fs/nilfs2/inode.c
+++ b/fs/nilfs2/inode.c
@@ -895,8 +895,6 @@ void nilfs_evict_inode(struct inode *inode)
 
 	nilfs_clear_inode(inode);
 
-	if (IS_SYNC(inode))
-		nilfs_set_transaction_flag(NILFS_TI_SYNC);
 	nilfs_transaction_commit(sb);
 	/*
 	 * May construct a logical segment and may fail in sync mode.
-- 
2.53.0

