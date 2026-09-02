Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40774AA59B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367506; cv=none; b=B8aRX4s1NY9sn0gTeV9erlXa/GM3q09AYoSj8Gn3VPQv1IX+qqek0IMXCfk/h9gUdPLk8xb70wHz3oBCSH8cuzAYETJRTZNEpXpXWwGRxr25o8ysSEhxiOf7ZFjV41xffU8cI3KGT6fbPHiy2Yx3X6J51cQAI3LI64GqA9bqULg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367506; c=relaxed/simple;
	bh=tzb+v5osj1EIG5WMEBSnYWYoaoCoeZk9x2SIfVlON2E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=U7GNM9h87QxKOsNxNVXjbdJWK4yzQ/pkDYogvSy95yhCcE2POYtIY+P3R+sSK5BVsYTkhq46ryGBxn9G2BkpzDJYM2xmFbZd/VZ+0TT+bbPAqtMAncM0jnLStYaepbp3bodf0UXhg0jMRiX9b5Qee0yP8V/YDvQiwXFCE+Q08QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e7624e584dso1706680a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367503; x=1788972303;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iFtHwbRON14VfsHEOuz8W9c1jfrdpfx3eDDbLyQQp0Y=;
        b=csl/zByi9CcBHMDXjpDvPnQnBLu0k7TvxF6cnHNL6Mj2hafexj4mt6UwOeKuuuYLPP
         MmE7OLktxe1qD6VsB41GAfGNqRDfzPcTAPjviUb5aq+6/EOhx7sLlO69NRFg98E7bCiR
         8rOKJnG0RGpZ6UWE8b/UqNPgphW88SnLCnPxFyuRgn3mhT7f9mnSOcz9kIoVz2OjD/Pv
         6U8ZTfWABu+x16t+L6T1pNsTEImkW/JsdTG94pUoLijekz+W3FO8Sm+8mHn1tOuZiVRN
         /+BlUmsIowftdo1SrnB210ZbXOs/qksie2NufAofF8fZGDJlEPiihqsbnnE+2miFvcCg
         czqA==
X-Forwarded-Encrypted: i=1; AHgh+RpzE3j+6hSuDDyUoMRlSTUAXnx4ILwxJLKDamZ6WpjYeo77NqvvkDocI6N7gObg4iDdeAKm+O2u7fPVrRo=@vger.kernel.org
X-Gm-Message-State: AFuF++l0obFMsJ9bxR4lYmKaJS7HLDClMKJkZyptD37e3LidWxpulO7E
	gcIfS+eVfr+IEDYFUuziIWrlMpf12arGR4nwV7shw1XPfDZVZgZ3MK+Fo1RKaejNLE4jO2dFiej
	d+HI7lE7q6FHEp6VxeQ44toUpVuD5Lyu8Y+MFahedCSiRSb8Cxn71gx66B/8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b09:b0:6b1:a11a:eef4 with SMTP id
 006d021491bc7-6b47c6ba9d8mr5226638eaf.14.1788367503624; Wed, 02 Sep 2026
 09:45:03 -0700 (PDT)
Date: Wed, 02 Sep 2026 09:45:03 -0700
In-Reply-To: <20260902162441.72668-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a98528f.27a413cd.1e878c.000b.GAE@google.com>
Subject: Re: [syzbot] [greybus?] [usb?] KASAN: slab-out-of-bounds Write in gb_operation_message_alloc
From: syzbot <syzbot+2fd6aefc361af86911d5@syzkaller.appspotmail.com>
To: adrianox@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+2fd6aefc361af86911d5@syzkaller.appspotmail.com
Tested-by: syzbot+2fd6aefc361af86911d5@syzkaller.appspotmail.com

Tested on:

commit:         edc15184 usb: typec: hd3ss3220: Add support for supply..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=130520f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c451f9f64434b622
dashboard link: https://syzkaller.appspot.com/bug?extid=2fd6aefc361af86911d5
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10476f79580000

Note: testing is done by a robot and is best-effort only.
