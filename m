Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104438;
	b=PP0MrCZxgrxCyz0Zw6nijf98rZZH5fwXLT0929rGaLedpPIQJ1VphqoRJYFvZnDmvlUF
	 P0Z/vYXfUUA1nnSwX5iXqciYzNOVwYxQuREW0qS/CX9LRzJZCfSA47PE4Ovr8SfW1Q4he
	 lrh2cF0fkZpSXCYhhJknl/BHal+9HTQdk+rEX2ETMFiZAZF8Jq9ZDn1COWsoSzctxR6Dt
	 mbMB5dV7ZQmWMBvGFcEjNT34aG7XCgi3ckQwNOiZbkyZrFzMqZaJMbmBbjA8pxymXtoOI
	 baHjQYwB/rvVpv/co15/2bN6worQeyat8TM1yR1YTp30s4WHYWGwMEdHY8DmF/zV6Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104438;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=/LIwi1HI6or2lffhXmb5nx7x8QsMdBgyQvDtC3Qx7hI=;
	b=xwrKDvVpBLRF/tz2WPRQrvBMHopMJATSDsqmC21G94TQCsRgVFYhALh/EFpQAWqVBlaW
	 ME89C06EWQQAFjIcW+oV25Wpb/zqtmXJ4sJa6l2wyKCB2h9oCv3cbD5Zjuet4AHlVV3aB
	 vfKsk6fpM9MyDGoDqLkhxfLaC4sIER+kdIADLk8jpEw6yuP8gC3Q6WZJGM4fvJRP2NTPh
	 UOD7Ny5Af4dRLpGnqb6dNDdgcDY4s/S3v7gEDKfE1S4CBQsFpoVCgiKxz6rakvbM2vWWC
	 Fg3lXUXQV5wES8YhhvtCm+vVALtRw0Ko0RZVtqtg3ByqMxnshYU5RHhpPUIDh0YNAMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11783606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11783606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cc89e86e9eso5840639b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104437; x=1793709237;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LIwi1HI6or2lffhXmb5nx7x8QsMdBgyQvDtC3Qx7hI=;
        b=sqlVqLzwSSnytfXT9oPIeFfx4dsIiHYXIQ435r9Tk3Tl7jDjHuMNYQ6RvZJjMOfN80
         IvVYke/qvvVYh+Ure3QJK+svOk3GGFBjQejePkGrRKgeV8lMnryP7ATI52LUI1J6hCvb
         4JZ37h3NpfqIZ7px5FpfNZErCb57tvkZngnLCEYKkJTgkpFE+FK6LvkWKA+yFRNWa7Db
         B/Hk4bEE60x/YhsZykMc3r8eSooRGZWdf7HygKH2OOFHMr+6EiX2sYByYR1lVPce8t1G
         ng/6uE5kMoZ/9C7DXezWymATXuQe6w9WTb80KFfthOQ657/jffgu6GrZg8Cp7QJ61tN0
         Amxw==
X-Forwarded-Encrypted: i=1; AKwUvBySTz5/7w7NK7lVhg8stbVH2N+iEQusqxAD6YOZ6OHQle5adxyMiNPDoWdfD2S6lHoZgR3n0SOKG553bb8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrbB2qhl4Y1z9IDLZEWhYsaX62dJFCKw+bRnU1cEmjAYpIOpuL
	0Sf0VtjHROuxpLJvyySsA31fsHuZxAJORQBI0EArvBtoeDFjoVrXt24eHZg4JjHlbUQuBxq/I36
	4LgptNtLYdCBGmzKuKJDoHvBGhiW75zItBsG6hJkuNOTNpJWcaD7Y+BctB/c=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:180d:b0:539:4d53:170b with SMTP id
 5614622812f47-55c002412dcmr7087748b6e.17.1793104437009; Tue, 27 Oct 2026
 05:33:57 -0700 (PDT)
Date: Tue, 27 Oct 2026 05:33:56 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae09a34.f0fe5aea.79aa1.0092.GAE@google.com>
Subject: [syzbot] Monthly nfc report (Oct 2026)
From: syzbot <syzbot+liste730699f000a7bb75adf@syzkaller.appspotmail.com>
To: david@ixit.cz, linux-kernel@vger.kernel.org, oe-linux-nfc@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello nfc maintainers/developers,

This is a 31-day syzbot report for the nfc subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/nfc

During the period, 2 new issues were detected and 0 were fixed.
In total, 13 issues are still open and 34 have already been fixed.
There is also 1 low-priority issue.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 347     Yes   WARNING in port100_send_cmd_async/usb_submit_urb (3)
                  https://syzkaller.appspot.com/bug?extid=89f5f8143d8e62af2b61
<2> 9       Yes   INFO: task hung in port100_get_command_type_mask (4)
                  https://syzkaller.appspot.com/bug?extid=3decf7252f8521fa80ff
<3> 6       Yes   INFO: task hung in pn533_usb_probe
                  https://syzkaller.appspot.com/bug?extid=8996fbe184c5b84f89d4

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
