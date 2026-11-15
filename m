Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794746010;
	b=M3YxeqRGbNUubM0snwfl8skwylWRA4dPvCUprZNGRgqz2T/OLhXZlQa+ast8waVKSQMK
	 qHkduGKwaUiI0R3tJ8vonh4XM90z/us5GkpWXAR96UPll+qEf4GT0oIYgI1xcEDuPuu79
	 B3d3k1nwcA1cTEEg2XXQZhMsIz3J4WDMhm/JB0BJ6VrIxclpph/4X7NCbT1qKKCD+cWKW
	 h6fBY/aawed3C8eanBBooZ/eVHCG7JuHWSjuT3s7QFUnHmdm99JuiEWGj/Jb6GbIXxCch
	 sIfh85OTBrrXNGjo+g36OWJCHMWWxUJkt7NLhuZ14WDeQM8tLCkiRGlye06jfAcKTHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794746010;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=P0L0ftbj+kIt53ureHmiQ7Y/IcbNESkfV8kHEr8QUa8=;
	b=gGVWFUbTpeO54op7OYdVtoU3r/6xF+tMc7wz5/egsY6SIsAVa/AaHqZDJFlU8dG+LUc6
	 JDAH7IiD2ldppuVCqKLqn03YYw0BlTHnANI4Ya5vR+2xXdyNTYmdjgGHwZ/U/neLccXCt
	 9RZ7NkLKU1FtmCeblOef9fkaf90K081AkGudgUibpKTjkVoJ59hlU7WT1jWybz0+Ak5Cf
	 deSkR/ficp2f+QaR/wa5//I2zGQ55XnELzfcHw1HWY0oBT29HdzBgbYpwGWG0vJC2Qy8t
	 BmYdVlBCIgSTqYTDvCcdRv5BqJrMUcZL7vZEUfcO5yv/8M1u8qDowUPWuLmwNCUk1nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A74606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A74606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5735cd94235so314541b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:33:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794746009; x=1795350809;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0L0ftbj+kIt53ureHmiQ7Y/IcbNESkfV8kHEr8QUa8=;
        b=egUViNr1B2ZPRgeUypuE/eKG9FXFKrRnpvQ2oZeiWd8Ispy03GEBz+YQ8JwdE+8JiG
         CGXhCvTDPIywXpvv78qkUQ5r1JSyAOSSAfw3VNZ4jDxwuj4OnTW1DL7G8mvFB+ad9T6J
         hknTwMr7Iintt0ASaHvgVdT0jSFtOMU+LheUBgQWnE0LNqnmwGUIva3mPOMrvTV7iUIJ
         pfDWgTpJuq8hq3lFoZFpAIgaROLyTJ/QVWTVxCLQcRGyqHphMKHViYxgNElHaM+K2u8V
         2pTsVMyB4ICztJiqfJzum+vbHGvl7WWZlhc+ba2gUfvfwV6uL1cyGEpFGmaZNrYqoGCK
         u64Q==
X-Forwarded-Encrypted: i=1; AL+hErGVfmmquHmQkRkHciYffOWvVyee4Sa/rvJhcxW0MfYyeqBw8SNspE09dPrZP6RqF8gIuz2Ze9wWCOz90rs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nIHp4bwihicocsmf9vg8Pqio+4tQ+OrhFnseBfv95JaF23mS2
	u2sshPQxCSaMS3S1glXNqHD36J6mqWphEnqF/MrT+Njmf1WJInc9Qh4R+GAr1+yd/CMGmhaG6X2
	MvHRStUUsyG3ev5xXgrFdXla5ZrG3/orIelb6LaGySgRAqSF4dIkiSjxP3M4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:e88:b0:55c:8ed:4db8 with SMTP id
 5614622812f47-56e65a413efmr5878322b6e.62.1794746009242; Sun, 15 Nov 2026
 04:33:29 -0800 (PST)
Date: Sun, 15 Nov 2026 04:33:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af9a699.78cd6c47.117a81.0005.GAE@google.com>
Subject: [syzbot] Monthly wireguard report (Nov 2026)
From: syzbot <syzbot+listd270b2ab9f81057c7dc8@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"

Hello wireguard maintainers/developers,

This is a 31-day syzbot report for the wireguard subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/wireguard

During the period, 0 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 21 have already been fixed.
There is also 1 low-priority issue.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 111     Yes   BUG: workqueue lockup in wg_packet_encrypt_worker
                  https://syzkaller.appspot.com/bug?extid=ce2a09d03fdc079a46e9
<2> 60      Yes   BUG: workqueue lockup in wg_packet_decrypt_worker
                  https://syzkaller.appspot.com/bug?extid=d0d2f1a65f45b319d25d
<3> 21      Yes   INFO: rcu detected stall in wg_packet_handshake_receive_worker (3)
                  https://syzkaller.appspot.com/bug?extid=48f45f6dd79ca20c3283

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
