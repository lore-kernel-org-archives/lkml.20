Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B3823393E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789613173; cv=none; b=SgfQ9ZtPglNeiOKoWCOaTkNmHe6zFItsmcmoq4lKwAKInBc6GLeYQ458LVVOFxpqZPqqHbHaSXjTsaqOVW4WWXk5gTZjZfEjOMafZFxjfg+I45JImNUTsJ+lA97VqYYKfPtkePtUvDST6YONt7tlCTEjjPT+RMSGiQRSHccUzec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789613173; c=relaxed/simple;
	bh=J8ihw4Zb3WvNx4P3vVS5QHNVXha69jk/2xIyuuQUg18=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=B87sIZAGt8n2Oe2MjBNCFWb7KxcIS94In0j9+LrvFo6puA33f6SSJ1dHziHKhwQTOCbQbmh6Vbj5bDCOWzCPWEbujQWX1BxJq6PMAIP2QakoTYywIRvStcrWW5FYHgYHPMzrpC6oRvKr1BMZD+G8ve2eON8pdm6vmDdwXa4Wi/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45e45d32bd4so366060fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789613162; x=1790217962;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zEpFGRTgYhEo8BLhWSukhT25CaAVhIjGXwWFhEcuCb0=;
        b=IOVDXW17rNnTXT+g2FoaWua4BulSr8mcztFdXp3sCcIYWXmRjnZKX3PD2p7STI9Ymh
         28z9/R9KNcMs5ZHRxmxvxguH6cUDmQV7OAAZFwrNQC8uZtCLogrqrcxzwinuKcGk9Xih
         PGPxBXWz5EesJ3HPLzsaFSjXJx+qFLyv87PIddfVU9c613VnfMuTCp6Nb3c78pq4kjIJ
         ADIGuA8DEfwkqZ9kjaSsLgiDJ33UHNOMWsblZiYkDyif1FxghsWneQ9h4Fx27t24Y3N+
         yUASvsgPqfGva1posA6J4f5OnYxE3JXDPnaFLCl4cW/n0MMtILYCXqgvS9nvnEnviGCN
         lCkQ==
X-Forwarded-Encrypted: i=1; AKwUvBydSsr0VzCujHS28X4blWoVrT5WuhiI+v0gIdcoXti6uDxkh9gfyTllDuY6pvZY9WqantN4eeCLV60zQWs=@vger.kernel.org
X-Gm-Message-State: AFuF++nnYziI0aiPg0ZbU45LrA/1fAZdW6DdAJSOXcIU/AUMMjTpFknW
	v+kTjxwG7vPlx0fn8tAuMH7j4L+mYKw1gqiCJWbo2YBEX4PpQxllxizAT/c8TBedCCozQG49Lxd
	pBx8EkugqHPrtBkypOKc+Tn1VY1VA6BFswVOn/DSSuCyPuIytaryarV0WDB4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1f05:b0:6b1:61b8:7ed5 with SMTP id
 006d021491bc7-6c7d15ce269mr8274393eaf.1.1789613162739; Wed, 16 Sep 2026
 19:46:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 19:46:02 -0700
In-Reply-To: <6aab4247.6a263bb8.5ba9c.4b18SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab546a.87c06881.1db2b3.0007.GAE@google.com>
Subject: Re: [syzbot] [raid?] UBSAN: array-index-out-of-bounds in super_90_sync
From: syzbot <syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com
Tested-by: syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com

Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=101793f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=9e3014263a35700ab49b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=150cebf9580000

Note: testing is done by a robot and is best-effort only.
