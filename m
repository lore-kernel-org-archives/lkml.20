Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297191;
	b=rTMC0ev20lNmPpz6xvA1reA2ngL1zGE3CayC+G5nk3o5qLu4YIR3DI7MorMzXwuCAfy/
	 wIxgNJ4SXFQrqKiO46UC7HSF1HEHBq3inPPRGBS3iHtdsGF3ptUFRYBxxY9m2W8yTT6oG
	 xPQlursbDQFB3PotykQLKUbCgpoYUF4UwSemZgkyrruC7nYPPBYnjkXGbnNoX+ptc9JCo
	 E5eRqqP98Z7wex6p8jwrH95MvsKmr3fJ4Lr2fueEQlPfUaNPMp7rfwQt5EWJOO+vlZYHS
	 OGQgLK3UzH3tRQWbXxlv/iTKxedyK/PxjXzly7OSCUqWgphJcDEAb9Fx90gRB63MgTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297191;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=AxcroBGlK8QZ2IRuwjXcGk1mH3puIsZj5MxBoEspkeU=;
	b=lWLWlVBqZwhoqt0d3m+bWm9kc9VEsnVvoDSnv2COnv1fhFrPsRFb8CkweSNGAgDk4dyn
	 X6TSJLULEckAb/HoG+nJNW+Au3yF1Y1NmjpamevZX2aI9sVg4KcapvvRNZZXvN+tTRFAf
	 VT0CJwxdeCKY74xZq3NAGavt1i1iXJjaUV+ovifiT9HvTajSX7vMB4/pk3vRSUrsKhjJk
	 JS0AF3BGalsZGjY6LdziS1ljyRifSl1w9F6IsilkkSKatghYEBddtA+SgtgklDaIDMnLK
	 UZtK8m1poNYOM4QXwI+dpoHI+lNi2kyhi+tvXRQBJpLgjMjknXC32oBM/0528OunBzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385A9606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 385A9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-82169fb66c3so5380005a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297190; x=1793901990;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AxcroBGlK8QZ2IRuwjXcGk1mH3puIsZj5MxBoEspkeU=;
        b=V6WcsJHScVhvhFsTd2p/wpLRc3TAsqw53UWt30Vclh9XfsG6Xt5H2fO5MgXsAL5bTa
         FtsSwLQSF56NfHsSzcgE8YYCB5i6BAmhQFSpT4GLSmr7Iaybjs26hskiNb+hJ6x4uYO3
         KwWvMB6xpXOkrXIL3mtU2Mw1m83L80v+MPpdGLg+uoJ2pKkUq2AqkrYMdeT7PzDUb5KT
         JRSgwmpgK2esuvq/NZ6l382vc+yQosYk3OcqUTd293D2v5v92l6zlsqlAcrMkfcAf5kL
         KHViRpxeVqGJw8Ppbaepakv+9qpRcz1RgDZelH9LiW0h/U+auEMRW8y5M6VgJO20ao3t
         fsnQ==
X-Gm-Message-State: AFq9FYIjCE1VTbM6VlWE6I3AFe+Z/VuKCFkbwOjJNhNLWrvM1UWljTVC
	PzHvpma8u4MHDBzM71Ea74enXUZDFURuOunTiFNhPpABivNFAAZnPxpyorM9j/MjulN4m25ohmO
	DDSuBIA73jCpaFXTYuxnhr1uEkpF5Q2cv4yXP+179J5Kr7pTAqlfpPiMoYnk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:309c:b0:55c:8d8:6997 with SMTP id
 5614622812f47-5640d62e9ebmr59107b6e.0.1793297190294; Thu, 29 Oct 2026
 11:06:30 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:06:30 -0700
In-Reply-To: <6a8cdbd6.dbb3a75c.7844.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae38b26.f57e0135.1770dd.0072.GAE@google.com>
Subject: Forwarded: test
From: syzbot <syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: test
Author: gowtham398gs@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index f0646fb24371..6776e10ce51b 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -3071,6 +3071,11 @@ static struct r1conf *setup_conf(struct mddev *mddev)
  if (!conf->barrier)
  goto abort;

+ /* validate mddev->raid_disks before using that in kzalloc */
+
+ if (mddev->raid_disks <= 0 || mddev->raid_disks > MAX_RAID_DISKS)
+ return ERR_PTR(-EINVAL);
+
  conf->mirrors = kzalloc(array3_size(sizeof(struct raid1_info),
     mddev->raid_disks, 2),
  GFP_KERNEL);
