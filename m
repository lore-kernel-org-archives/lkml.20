Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371166;
	b=Zl4NSQeBq7m1L6Un25Hb37wd4Xbe8aKhqy0jSsqNyQMAqXbRbCjhkO6q5BzfKMOPwtk9
	 +fcK8K8Z9NOOpLEy0DHxuui0s668pm1Zmckq2wQ3BQhYuasVbQ9hWE9f/smNdjbtoFh+f
	 9npqO4bXxNPlPXGeSfZvxmFejRnUyFlsmiC77HSl9BXxzIHNEwCIZmUzGuyz9dpWN8kdb
	 L7LoXeWK43swKiXjC6qjbhvWlGxsDhNQsmj095h5A/OLFKrLWOV+JHiiKbjpXJQJG9red
	 KToO0z/ZZ1KIqj3OEtnpxb8iQN/ivkIIXdpTxGANqCMerJIlNKEPb1YhmZ4MAhBTtcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371166;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=Oz1VcDw31TaWCB3Soy7LUiOkmA+kBRE85VinwQZFgs4=;
	b=JsuRYPE+PfQndzFfZ8HQpO/xKvXi7DsHvyjepxuvI689gR/MBwh/A45WFrtBYwIk1Ahl
	 +KZb5VHD8greouXKZnQ0+pwDMZBO+Y4czha0OOmcryABlIjAzz554ZKQeBgRqIhE/713P
	 ThcbN7TY0DpWnyINHK48e7S5Qb6ha1ZO8RSpPUE/4wGWdXbyOQtbcd2T91odzqDLc8KkM
	 AEuzbEesLNvHBr/mgk+F4rcHjFTiDLLc9ycIJVeMY9RPsEXqPju6NQIBL7GFhgON8Id3K
	 PxnCshBLQP4mGur8TMx6IorKvlR+lgmW/Nz3Uzlpb261iYRMvmB7BRr+2uGeWoCXD8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C8A606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27C8A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-85a6d046af0so3494577a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:26:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371165; x=1794975965;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Oz1VcDw31TaWCB3Soy7LUiOkmA+kBRE85VinwQZFgs4=;
        b=lsZnV76QVY2z5OBmITUeSpbReOhdsxLo3JKz5Z8wLwXL0cePNdvcVVmghryydlOqh3
         /npgEHRf1mNYcBSVldyPtd8Hgecnj5Ldt1znmXaSFo/jr034kvFYycODMo1CJ4amNqA3
         dNVb08kovVRWGDlMte/wl7QvpRW0wcv/V7F6bURtjPKqw3rNkRJ+G611v+o7BGF0lrwX
         XthG6FdcXWb/e+G4JK9Qb7ezYpdu/UWQbb6UtJ6TU6RnBDBLrxGqxcGsO/YCVzj6thjf
         /gAf7vCA0iyVfN3kh7WvKFzrcE3Dx9Rw4IaokAk7N3Ut5kVooHzcr7eTIr9+LyzsxKJZ
         0bVQ==
X-Gm-Message-State: APuU4Z/2fB6gSepThpKnR8SKBS3U/jjZZzGBG9dm4Vk0EXNUm3NvowAj
	lwmn8A25VF8qnYSCWh2xf5Yu/Tytil7ErkVal0l9e0xIuYdky5xnXZNzmAIc/mTz/MPnMizJTZb
	ic3GC2+YKoc2V+iyyEHRqKWFyEDSN+phGp2gKq0VYAW1k2rnd+KclC8vF5HY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c40a:b0:4d6:90f3:74a4 with SMTP id
 5614622812f47-56b979090c0mr1064598b6e.47.1794371165006; Tue, 10 Nov 2026
 20:26:05 -0800 (PST)
Date: Tue, 10 Nov 2026 20:26:04 -0800
In-Reply-To: <CAO7_G+wivY7+jm_JWMuXMa1+ttqNEiQ25iOdUyT=_CrnSEKGNA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af3ee5c.5a88765f.2cb6a7.0000.GAE@google.com>
Subject: Re: [syzbot] [block?] BUG: unable to handle kernel paging request in blk_mq_complete_request_remote
From: syzbot <syzbot+2e3bf0bd49acd9b21d4b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nenkov2004@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 29



Tested on:

commit:         58c1eb84 arm64: sdei: Preserve the interrupted context..
git tree:       https://github.com/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=a58b6b4d667e7a61
dashboard link: https://syzkaller.appspot.com/bug?extid=2e3bf0bd49acd9b21d4b
compiler:       
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=171ae03d580000

