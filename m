Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED423932FC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436342; cv=none; b=k4hzmJet/gv0GXCRTlmVRtHEo4pDzpAp1Gsq1DiK13mwHv6Gv9GRWGyqaQYV8bHaFtWCn/kxJlkIjN5ZMv2+32Ht3xePeISsOdYKHfhhUe2lWrnAvKmX/ozcLJPEHqyX1tikdgK6szlPzNnuMecV9PMlPSQ60wniYxT8/9xHBIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436342; c=relaxed/simple;
	bh=TdPvFvRrxaLZ1XfC8y9acLHD0yliAEy9PagP/3CIiCE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XwJ08ZejammQLiDUdIl9ZJJzdUMX3A4xcD+fsUlm8G35ED1Cy2SnCQC+NqqmTPw48GU5UNmBzImtj/XnjD86Y8d+VQVR23lgytZQlLinWEjANcgiI1IATCVpRMBT1JAdtio/ZYzgL7aMJIcf/tOhW99QBv810kVNV5u7PYwgK4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2f2b8d88fso4902267b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436340; x=1790041140;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D/5gEYdAGR9/npM3EOzTRdwMBDgQ+wEjs/n1L+JzeeY=;
        b=uqjJesamznyMBYxAf2xc7lQjvrP+MZsfvxlx8746yBQInAt87oyFQ+WWlSzGjqxfqr
         WaWB2jgzbsLBEHfR9feqpe0+MqKOCQt9RJ9xkXR2rpU4xbxJLN6sWNAHHtW2a7Z9mXpq
         BzzpWJlUakuUhsdml6pEjheXWmeSzTIDF3i5S4iGaebS8GHaZJsMU0UvwRi0v/QP7zle
         W4okgqJWIbyRVkCPaDg3b3btLSWi1NBgyxSt40xazhCjNg1s89MwAre24XuHNb2qVurk
         AFwMqrEbobAnL0XGRVftiP2jVARLaa4vgXTm9h58wLXqy+loX+mQoQyIcru/RzVaFjQQ
         +W7Q==
X-Gm-Message-State: AFuF++k1iobnSPmKlgWjY6btkbmbjXg3CVv8WUjnaP1GwAzoZgx5HtJw
	zFy2nvKQfasX/1pyr58s9DUYp9NaqbtJ07QwvI9L7EN6nVFvAGybv2yUXUukAsFqTSX6E9Gn3gz
	3HB514Drd4SRbS9SJOH1C7Glcz4sfb8cNYbukQsgHtbPF8DuXTrL0o0sXGP4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2013:b0:6c3:3f02:7514 with SMTP id
 006d021491bc7-6c53fa6fb02mr5556973eaf.5.1789436340454; Mon, 14 Sep 2026
 18:39:00 -0700 (PDT)
Date: Mon, 14 Sep 2026 18:39:00 -0700
In-Reply-To: <6aa6a091.f670cee1.72fc4.0012.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8a1b4.f81106d8.2ab401.005b.GAE@google.com>
Subject: Forwarded: [PATCH] UBSAN: array-index-out-of-bounds in super_90_sync
From: syzbot <syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] UBSAN: array-index-out-of-bounds in super_90_sync
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

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
