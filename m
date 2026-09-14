Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F17146983D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388925; cv=none; b=i8nD8LndTiH/w7DaMVVd7fOcpH8pSGvt5EUHiHYFiXitugkSG4lETY7ccs/0ATh15fNQfdd82lgc/T7BdnGYC5tH/gZ+AEMjuASaybYuwwFSaLLKN/P3kq1MxMQ83OO7Cm6BQvFLHoCQD8eSO17XsxctKd+y5soLNZ+KGIAccRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388925; c=relaxed/simple;
	bh=a8nf4Zr4O+YtuNMd62/AyvduLYHxTdwq6eOt6gjtERM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gtbdC/R0937WdwIWfYz0ZcmhMyP0v1aCpajBUwnq+RRW0xbMWxbhzFhyddoswjYtGGrVPwHt5vd39yNIZCanUDFUM3604AurKnWtcjC5l0R8nzEa23k/MydYID64uBlVlEwMlJSqLDE94pVUw/QhKIcISptAuqaGymZ2ttrjDmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c4a9a52286so900200eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388922; x=1789993722;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5TqYqHFQPabPQFmHT2gjx+K1prgr2XgPOY59OwnA5gU=;
        b=c+gL7RvzV2mreGhaLhTM7+j0KGmzWKgO2KAMKSF0176fhJbEh0oi9/+DlFry3mrWuy
         c+AYaDCGhULkD9ya1+1hwN8aXeZ8KW1vNqHuGZZsQyxF2SgL0cB2y+lqJtSl51ycuhZo
         nbcqIUfECjh/VmHWUxsYjtD8WiiUsKrE9JPopVxQjOHgMcf0yOIGuKvV8Ki2M/5CftMk
         cXvHeVpl34q12BDOq0VVrstfCLdgQ1epGsCnc5+gzdWQ9xyrSJGu1Lc8fA8v0F5cO0ql
         tl44VYlijKS/yqyOrcUsu8GHvmy6UoG3nqMfPZ5a/2NPss847TlWpJq0OpGwO+GM3Nkh
         jnpA==
X-Gm-Message-State: AFuF++nlvAivQ+ESNGH5pjV+GJPWdiJo+mP3H/Wo+IU86wd8d7uysqUl
	Vo1F9SAI9GEy7o8aAAGABoXzTY4GEPiiGKf/X/eBBXpkiQGKtrs/UxOzyixQvAZpTzEyYIai6VQ
	11Bzc7GdISMj0np72yms8X9OHNweKQTkRFc6JezGkut5MbYwKYBYrL3soo10=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:a09:b0:6b1:c6d8:8358 with SMTP id
 006d021491bc7-6c541c4afddmr1958343eaf.22.1789388922418; Mon, 14 Sep 2026
 05:28:42 -0700 (PDT)
Date: Mon, 14 Sep 2026 05:28:42 -0700
In-Reply-To: <6aa6a091.f670cee1.72fc4.0012.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7e87a.a211d2ce.1a5198.0293.GAE@google.com>
Subject: Forwarded: [PATCH] UBSAN: array-index-out-of-bounds in super_90_sync
From: syzbot <syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] UBSAN: array-index-out-of-bounds in super_90_sync
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 2f0c1cf72f4682178506f513bbf015e591b1aa4a

Reported-by: syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 680b34a63..1f84f2034 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -1393,7 +1393,12 @@ static int super_90_load(struct md_rdev *rdev, struct md_rdev *refdev, int minor
 		goto abort;
 	}
 
-	if (sb->raid_disks <= 0)
+	/*
+	 * The 0.90 superblock only has room for MD_SB_DISKS disk
+	 * descriptors; a larger raid_disks would later make
+	 * super_90_sync() index beyond the end of sb->disks[].
+	 */
+	if (sb->raid_disks <= 0 || sb->raid_disks > MD_SB_DISKS)
 		goto abort;
 
 	if (md_csum_fold(calc_sb_csum(sb)) != md_csum_fold(sb->sb_csum)) {
@@ -7926,6 +7931,16 @@ int md_set_array_info(struct mddev *mddev, struct mdu_array_info_s *info)
 		mddev->ctime         = ktime_get_real_seconds();
 		return 0;
 	}
+	/*
+	 * A persistent (0.90) superblock can only describe MD_SB_DISKS
+	 * devices.  Reject negative or oversized raid_disks here so that
+	 * super_90_sync() cannot index outside sb->disks[].
+	 * Non-persistent arrays never write a superblock, so they are not
+	 * limited by this on-disk format.
+	 */
+	if (info->raid_disks < 0 ||
+	    (!info->not_persistent && info->raid_disks > MD_SB_DISKS))
+		return -EINVAL;
 	mddev->major_version = MD_MAJOR_VERSION;
 	mddev->minor_version = MD_MINOR_VERSION;
 	mddev->patch_version = MD_PATCHLEVEL_VERSION;
