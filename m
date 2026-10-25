Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792941243;
	b=zDL+0jrZOh+7FlBRfZzZIJtsbMc5XaJPEma15m4v86d7tr6AIqzHhCVlXGMUbFu4Ov3u
	 liOwKi4BHxkWxsIyMjmu7NT7qdYkpftq7XG4+hoDOa7fv0AAMr/jBcqUU50b3ZTNq49Ys
	 8lWptvRjC/5WTOWXdehWFXo+y8BGufod7RtpXA559j9g56bwZSLwUA/YO/7HDU5tMepa7
	 VkoIHcIVNfyjlzb93mDqqvMUAlzWdyD0Q0SnP7trUv2JCXFzoYNUDzq7vg80AD872f0rf
	 ok+oCrwy84pWhszKjyPKsNI91GbmhSCXw23324EObz+6Ms3sQ5/UvnIPzAB0wOcjhfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792941243;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=O8hK/Ym3kZBG/eBEO7me6+6KirPfgVeFu9ZCtwqeq2k=;
	b=fA1d8ow+sVUVCeB6BiHL4jMQcirLdnDU6GBrHMPr9rWUVtv32SPGd535XMl57RICUF/p
	 2uXmhVkicWCj2L632NgEdp7HjuWPdwc3RDpGQDqm7aKLrCzjyuEZTuM3+iQQDmGc74c7U
	 uUcwJo6hOlVWb4pjeEt/JPKtG8XCaDV0/hxbLB6Mh3snzKyoMxZqws+az5iWIf7AtFWCD
	 97kYT7knDDwXB2rV0FsBUzL1Gc/iJzPHY3V2a5LZHDW/JqZgOaZGwUmtmMqqvTv4g01aT
	 ZzS8AeN7YZSHyToGbmitbCZncENYnj73kFoz7ASWXg5H9jhcqEi9YqLat/BkvjqpedA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE62E606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE62E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f4612a1a5cso4159824b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792941242; x=1793546042;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O8hK/Ym3kZBG/eBEO7me6+6KirPfgVeFu9ZCtwqeq2k=;
        b=P9bJJWpj7RT6uB9O37ToN4YRMtnLp4IaKSVmNW+ikY6GT/8X33+WsHVocuXDUEwtYr
         OoyFWzlxgHaHMApBJKIZt7YbZ+u5eNri4l1cgyoqg8cTcu9/cvlJ1P4XLqOyFaHkeSXb
         EiSs5RKlKz5UNI7IDwP2PM8xm/sCTIZyYtE2mV6rMptHAnXLFObbpoTVHEdVSZuIwbU+
         K/EpMcQEZBQDPoBcA6bxwhh45BA9V3Tnns5mh1YADQAm71IP1IIqycg9BUu3aNmrsaCx
         9nJF6AFiY/p+qdTfBBCnQ/iRO5+L86C1SCUj/oWObkTF7D6iLs1BbeMpP+PbyMgYWWY9
         eIJw==
X-Gm-Message-State: AFq9FYKDr+xi05UmMtnqxYec9Fn8BiZ9NexoSY17pj4Qb6+hHJoHE4kT
	YRLalP0n4swyhGPMvMgQjRR4k5UnR8HjGk78qcm79uehETZNnv/P4B6sCwYQzWNzbReRhC4nYau
	YBF3Y227tK63Z/rXImbfunC4P0eB8n+W6I3AbtyuXoNyql9TTcorQ1uXKJIw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:e82:b0:4f5:1b84:8cd3 with SMTP id
 5614622812f47-55c0034a1ccmr1900697b6e.24.1792941242039; Sun, 25 Oct 2026
 08:14:02 -0700 (PDT)
Date: Sun, 25 Oct 2026 08:14:02 -0700
In-Reply-To: <6ad2a01a.6814cce4.34c49f.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ade1cba.a6443767.132891.002f.GAE@google.com>
Subject: Forwarded: [PATCH v1] configfs: fix slab-UAF Write in config_item_put
From: syzbot <syzbot+63336d70e1af377d7388@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH v1] configfs: fix slab-UAF Write in config_item_put
Author: drifabdelmalekmohamedsaid@gmail.com

#syz test

diff --git a/fs/configfs/symlink.c b/fs/configfs/symlink.c
index 89178f5d371a..7d746a10c369 100644
--- a/fs/configfs/symlink.c
+++ b/fs/configfs/symlink.c
@@ -196,11 +196,26 @@ int configfs_symlink(const struct mnt_idmap
*idmap, struct inode *dir,
         *
         * AV, a thoroughly annoyed bastard.
         */
+
+ /* Put the reference back, retake and check after relocking*/
+ config_item_put(parent_item);
+ parent_item = NULL;
        inode_unlock(dir);
        ret = get_target(symname, &target_item, &target_sd, dentry->d_sb);
        inode_lock(dir);
        if (ret)
- goto out_put;
+ goto out_put; /* config_item_put on NULL, no problem */
+
+ parent_item = configfs_get_config_item(dentry->d_parent);
+ if (!parent_item) {
+ ret = -ENOENT;
+ goto out_put_target;
+ }

        if (dentry->d_inode || d_unhashed(dentry))
                ret = -EEXIST;
@@ -218,6 +233,7 @@ int configfs_symlink(const struct mnt_idmap
*idmap, struct inode *dir,
                                                     target_item);
        }

+out_put_target:
        configfs_put(target_sd);
        config_item_put(target_item);
