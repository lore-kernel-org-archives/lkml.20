Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767743B0AD7
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018943; cv=none; b=u3Ixc2caVf2jJco/Ubnvb/qJNAbZNp80uIiQwiNWu8RXsPzXncLKKopY5RnhwYL2Ew6vRZhUzkFAA2UWtN9z+uFCaK0qioFZKtq50eU9lUk6r4QPC8kMmOjRqz1h1z6RlZP0TkWiyfVSPm2zSu+Uwd+LRgKoMa4KmXkLkxgZSss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018943; c=relaxed/simple;
	bh=bkCrhh/qGg/NwACg6eN51F2xROEtM97vIgrb5rIPEE4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=b7U6pS290AsJEOuHlFzWDW+3j1KRn56/xrkATRu6yzPsswf81h+2MImWH8ccmqlxJytF3NtwS9kAQEtL7TkoyRoS1rDAbMy/AkSZtO9OLyZZ/58bsXQmKdDu5+hjegaAtvcd8RN5z/oUJG3CfhEs2fIpWf1/5b+PmzcFXvFdLe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4eb0b989f0eso462973b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018920; x=1791623720;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p0KlOI1LvhnK8866yq8ewXB6nf6J4YLdcwa0UJVXMq8=;
        b=HZmkUQdC2P7w0dHFS+6RY2UlCj88mbI0v8lM0N540KQPDORdc0CljgXGdS60EuVj7U
         71Z6AMwGyUGc2CO9o8oZyxS6zsSdZP55YXbo58aaBRcOeaQtpi/WPP0K5DHSHWytO4Hl
         83STlK1PewCzfcB7V2ODnm4mNaiCTqyS5PeBy5z+ag/ozGEJbsYkjmEMK9yL0tSn8mnM
         MLbO/pUNq+fjdMSP6WOEkHTuNr/daA3fKH5RvhXTL9fPiK79fJVOgyevBHzJkFg2MWBr
         2I5IPyXFNtVB+BYYvvkTy4aoTAp0zo6Wf/QR3oI26C8eTdleq5O0jUWAGjwH4CUFlVZA
         Kd3g==
X-Gm-Message-State: AFuF++munkgmfWSCtZphvPVCuxGh8ixGZQLIecb0z542VugR5A+jqZQT
	S2WWBpJOtWU8NQZTTxdk5knWHskBgk3uAACfeYYgZtpcX82es2XnlMiL3+r19qtMstHXpIJYOMf
	UyY3/3R7TF5249pixza7IrCfQolffSMDmFFU3DX0XZjXI9PA++QfENffVhwk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2e47:b0:4f1:7609:3428 with SMTP id
 5614622812f47-4f30c7bea40mr6991902b6e.49.1791018920409; Sat, 03 Oct 2026
 02:15:20 -0700 (PDT)
Date: Sat, 03 Oct 2026 02:15:20 -0700
In-Reply-To: <6a791c94.01d0871a.3a0d52.0099.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0c7a8.9ad129c8.3858c0.000f.GAE@google.com>
Subject: Forwarded: Re: [syzbot] WARNING in btrfs_init_new_device
From: syzbot <syzbot+3bf3e110b2d406b8166c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] WARNING in btrfs_init_new_device
Author: adarshdas950@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 85ea9c5d4536..1517ed3da22c 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -3066,7 +3066,11 @@ int btrfs_init_new_device(struct btrfs_fs_info *fs_info, const char *device_path
 	mutex_unlock(&fs_info->chunk_mutex);
 
 	/* Add sysfs device entry */
-	btrfs_sysfs_add_device(device);
+	ret = btrfs_sysfs_add_device(device);
+	if (ret) {
+		mutex_unlock(&fs_devices->device_list_mutex);
+		goto error_sysfs;
+	}
 
 	mutex_unlock(&fs_devices->device_list_mutex);
 
