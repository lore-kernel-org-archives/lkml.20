Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778686;
	b=aER8ik4a1hK4Fcn59HhgJjtK1uvqYIYZv02tf0blk3lwaxkPvls7JbNR3HL4lZHwIfwv
	 cGGUZo++Nl9ZoUmPIN4BFz6KYihzPu6uAv9yLqD6pD9nTwXctCzhPYQ46p4bMyW3lXqCO
	 oIjBdZIC5KxLCdhwqRCQe/vMD0jYYRHf6eosFFgTowAc948i+H0DF0U7gBw8/vgQuKs1E
	 Bcxqvy/jsIm9Q42gngR2N8CrAuktrTRwYkPaFaZ02cEC4GKJng5q/w9ImZrBDX4aMom7g
	 huYz4+4zKYvdq1oPD/fRtTbJxKOKIDd1gr69W37r46iWojsE1EzJxnamw2q3aRQa27w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778686;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=YRu/RxQ5e2cFdQgSe6t8vIyiqi0YMq2HuIJRVZsHX2k=;
	b=cm9nyVnMt1pwAtXOcST6vpIpNI7cV/IfSd/YuRdsEYgkCt8ZUxQVCWxwG68ngkpX/PhM
	 WYdJQrAXntVZDYHDAk6i5SI/sLwxmtFZpY/iU5pyTQboeTtsCsLhBzql85jYPxRevYr2n
	 b+T8RT4a4u77WbALv/NvzszjzTHGLxfHKkPVoCqB4G6qfJz+zLtjhkHsjQAY3wYqmF5iq
	 khYoPfsLG9AiPZAQxZquCL4+Sey0ayZ+kBCpuImAhYtktrs5kJbIXb/XhH/xGmhLtLrc6
	 hE8lAQsthDBNiLWrmSBvNRUQj8p/STGM2nB6EaXbumqgMJn9o46k9DJMe/fxChkRbzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA594606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA594606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-5587351d419so992498b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778684; x=1793383484;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YRu/RxQ5e2cFdQgSe6t8vIyiqi0YMq2HuIJRVZsHX2k=;
        b=UD9XfqQpP4fCUvj+pdBOfXgozscK4DS8sKI4HN6cKrsHpTJReu6anSlI4Fhu7FvI3D
         nGyp2Yeiny/6C6Xc+3xS3IPl+0GPRBXAxpskiQGeTfU8DvikF6YBnVcVOnp6FGVtAlNz
         NZW6/vvFFLWQshMEFmw7uwCl59rjCxjRmkqzHZRycZfxG3d+LJ5CmohWX/eNlWNfsYTC
         mltdyeNJD0I7J7lefWnyx4GXNLC0E4mESYwVwx1i+PqytzgnzkvUh2+8H3FAsBIH4PxQ
         JyACJ0xGLSPARgBAq15p8/6qjOT8UyDQNPpa8vtLOv/45U30KlvMFi6IQQ2UqWTWpuZK
         hU9A==
X-Gm-Message-State: AFq9FYIEoz1yjrZN7w/miPYGikdmK2A6jYuFJtbe10hpQPZATjxV9JLk
	Og9c+C07Wdgx6AAQCRwHSF8iij/eowmC/v6VEj/GuqX8tOwl/sKqXKUVTbcpAqXQVp4rj9CFHeU
	ZWtAd84RTDyhtFYcn1PS7XEx+FYP7RMkyHb+lxHEqA7wsdA+iIa588//ehV4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:11d0:b0:4c3:db9b:3ead with SMTP id
 5614622812f47-55bfffdb0afmr10983b6e.3.1792778684729; Fri, 23 Oct 2026
 11:04:44 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:04:44 -0700
In-Reply-To: <6ad2a01a.6814cce4.34c49f.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adba1bc.5b36369a.12654e.000b.GAE@google.com>
Subject: Forwarded: [PATCH v2] configfs: fix slab-UAF Write in config_item_put
From: syzbot <syzbot+63336d70e1af377d7388@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH v2] configfs: fix slab-UAF Write in config_item_put
Author: drifabdelmalekmohamedsaid@gmail.com

#syz test

diff --git a/fs/configfs/symlink.c b/fs/configfs/symlink.c
index 89178f5d371a..7d746a10c369 100644
--- a/fs/configfs/symlink.c
+++ b/fs/configfs/symlink.c
@@ -196,11 +196,26 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 	 *
 	 *  AV, a thoroughly annoyed bastard.
 	 */
+
+	/* Put the reference back, retake and check after relocking*/
+	config_item_put(parent_item);
+	parent_item = NULL;
 	inode_unlock(dir);
 	ret = get_target(symname, &target_item, &target_sd, dentry->d_sb);
 	inode_lock(dir);
 	if (ret)
-		goto out_put;
+		goto out_put; /* config_item_put on NULL, no problem */
+
+	if (IS_DEADDIR(dir)) {
+		ret = -ENOENT;
+		goto out_put_target;
+	}
+
+	parent_item = configfs_get_config_item(dentry->d_parent);
+	if (!parent_item) {
+		ret = -ENOENT;
+		goto out_put_target;
+	}
 
 	if (dentry->d_inode || d_unhashed(dentry))
 		ret = -EEXIST;
@@ -218,6 +233,7 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 						     target_item);
 	}
 
+out_put_target:
 	configfs_put(target_sd);
 	config_item_put(target_item);
 
