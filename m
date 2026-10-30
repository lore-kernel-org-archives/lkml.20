Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793329765;
	b=COUucYEgd6GJKfu5KR/YJS7S0WHihUe92uxTY4Ygi0wHCXCNNBGYSYoA5KlGKa7HOra+
	 pIcgx/m14418jBWBgvg7E7dBzErM+QXm/8dKCVW/nB0jnYpnH/GEUDTJI2iU4wJ4ObD7i
	 7cQJMY14QoE7DWajSN2wxutmKwnfyUhW8F/F+O1IEJfuB55QyzskPTqi3ksEcPfWxYpSH
	 toKVTJZxcc052GBn2E4gbEYEiBHOopIvwgd3dKhOjDty3N8L4NgnxT34G/IeL+bnLU/Sv
	 PAoyjyFh7N3GEmIiKZ7vkEFcFVk9TqAjJail+k+4uCOeDOvZ5qd6tmTcNYmnjPkKwEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793329765;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=xIzYGlh3dkjKXMrOC6R+W2N3dmc9mwEuwgXjXrJHlpg=;
	b=i33ljEEDLbpV/cKavXJfsqVtsRrZWEs92n2NI2Bzt38Et3z+Oy5BDaGufc3nMq8I1Aar
	 I2duEHCgMJAm/pt1K5dmCYqjWtdl9XPZJZlPUa3PCzYU0LsoG2+xDSzpgKy1BNFEw0HHZ
	 iOdFjLJi3CiNQX9L22EhhzYEVDpm0p1mXLPtf/o2JIQ+h0ko2juHOF7J4RYlJVa1CjhFp
	 Q0+gmbfQf1GlUTK5NJjlumFWyBc1NclBt5mxzEWUcqY+r/ZcNbCNvv6FbaqierfjF3wes
	 WuZU975MTtukr+FyfyeBXCv2HPWbzSS9Lk4Eg/49NLiqLe/i7VxSoX3tnfSWMbeh6kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8DB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E8DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-54d6281f6dbso284651b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793329763; x=1793934563;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xIzYGlh3dkjKXMrOC6R+W2N3dmc9mwEuwgXjXrJHlpg=;
        b=YOGtLsJXqfeBjPzh8gVxKD2QdwlXNZsp6h3rDOslrX9SamLRtdojIkU4QZHXDAPkqX
         /fZ5hgJ/2CFiB4nm68GOLHzNJVywLopTrpol3f+n+Jevh+yMEzbyf82B56O0CuJgBPKb
         CpmHtNxbEW0Hf01mJ8jtNu6x/A+XuUd8hkqDkzMdiRojsbQ7xgGZnIO8oXE13Dix9GJ1
         /xiEhiRBrZaja6pwdz2wEnVI+oQWHxHJEZwjIR5epfjZOrFEh5UdByWEi0QH6YTQrcff
         PN5c1PDdwsSYVb6jP4k7x5dB6BnFfLhyQmdakiAChP+d+4P5q8Vf9Dn7Ji7jNlFNlfhc
         62Ow==
X-Gm-Message-State: AFq9FYJD/EZgTy+Bn1OxVzCh+nbyJ37uTSgXtSL0o046EmG83jdDmeNT
	D2MQyYXmkc4DpMplpvCkDUSU2EkZzZej3v5L85um9ecgTf0OiUkOxj0BEJse0gz9nqHTkeDwzv3
	N1UH60q43pq7w+zbzOdAv63k33hvo50gt0Q4lbK7QWjoHevR6GySYH38164A=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:11c7:b0:4c4:d8a0:2773 with SMTP id
 5614622812f47-5640dcbfefemr837528b6e.32.1793329763740; Thu, 29 Oct 2026
 20:09:23 -0700 (PDT)
Date: Thu, 29 Oct 2026 20:09:23 -0700
In-Reply-To: <6a8cdbd6.dbb3a75c.7844.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae40a63.b7bd089a.283bc.0001.GAE@google.com>
Subject: Forwarded: test the patch
From: syzbot <syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: test the patch
Author: gowtham398gs@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index f0646fb24371..1cfe983167de 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -48,6 +48,13 @@ static void allow_barrier(struct r1conf *conf,
sector_t sector_nr);
 static void lower_barrier(struct r1conf *conf, sector_t sector_nr);
 static void raid1_free(struct mddev *mddev, void *priv);

+/*
+ * Version 1.x md metadata keeps a 256-byte header and then 2 bytes per
+ * device in a 4096-byte block, so no array described by it can have more
+ * devices than this. Arrays created through the ioctl alone have no
+ * on-disk limit, so apply the same cap to them.
+ */
+#define RAID1_MAX_DISKS ((4096 - 256) / 2)
 #define RAID_1_10_NAME "raid1"
 #include "raid1-10.c"

@@ -3051,6 +3058,11 @@ static struct r1conf *setup_conf(struct mddev *mddev)
  size_t r1bio_size;
  int err = -ENOMEM;

+ /* raid_disks comes from user space and sizes the allocations below */
+
+ if (mddev->raid_disks <= 0 || mddev->raid_disks > RAID1_MAX_DISKS)
+ return ERR_PTR(-EINVAL);
+
  conf = kzalloc_obj(struct r1conf);
  if (!conf)
  goto abort;
