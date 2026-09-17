Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6953B2F8E9E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610705; cv=none; b=BP81zzZvqaQCDWyKjGgmJM5cT18jT5Qyxg/txZ5CvFvkPqUU+GKR9Sbs6GOhdooRWfiUMgeIJx+FDXCgekf1IDEpy6gKT9RhlC4dmje38UUqLRCnuzchSy6G0Iksegc+6PrLYXZbrc4m6ZIik7w4OrVI6ka9idQbWUektCfDD1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610705; c=relaxed/simple;
	bh=NJC34z8R3rZXRjQmTRJ8zhzZogwLckJPcT67zuj0oPo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rZWuBg8jHmgMG3laAStTqucws9/C0qz3bgUc9zlYSMedfTUq3XL2GRxY0i3bxOhRq+jLfCDolu10N6gMEIDa6Xf60NPueuVitwzIX53BAIZoO+AOmugTccbd9I/CPCiLgopYTvjrotOWP6YDjTFMyY4GnWcl9hejwT59XiJflRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1b8b593a4so447820eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789610702; x=1790215502;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V49j0cejcOuDsX1an4kfQ4ghEPLQ4rho3VEVPWqiJ6Y=;
        b=rH2gJwtV4QQKz2tLPyb0udAfamF5KfVMU5O5lKCLf1Tf+MGYdPzzvjqKldJl9kQ5Zo
         vkO6yopmYYOIyNEdJErJ2NWrygU0FetEnSpwh2T0TKrbZgZTNqqw9CKbD1IA6ZRmoZF0
         e54HLrGFna+XO+13oECZAJBUfXFXQbTNp4KTW9Cz6cbbmR6ZXHbAlYhH3WOyRWsaHMdR
         ID9fV1J4MuDWeRRzwJTlYddD8MPxtV9j8FE4m7G6RaQ2ZeY4Hp8ZRehUlr5ryTREfoZn
         iNetJ9zRd+W/WdrqJzoLCg/wCS7Ppg/zmoSnBlvQywXjoEo7ym65KG4apviDc0fjKm/p
         aaRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxarv7TCUtLw6BSymZPbbcXiHoAJMxlbsCXVSWlzO9KwGjw5Dy3uPTO7epTTVWf85F7wBVikO17YDMTIeg=@vger.kernel.org
X-Gm-Message-State: AFuF++mpq930lgVNQcf77W5e1wfzNZAd5CJWZJ08s2hhq6PJkruzGCJD
	3LBe4SbraXWpX6kF9dsoTdfFMwike0rZhdZrIj/awyc/PfONFu+PxRT+rf/yzrpmnzJlxvBFw4+
	YBdBykzPf1FaJOaBUgJje6eQTuGSDU/TodeapYFZjj2Xq7ZRxzQ3rqx7g2JA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1507:b0:6ac:b6c0:2bf6 with SMTP id
 006d021491bc7-6c7d0beddfdmr4857309eaf.5.1789610702401; Wed, 16 Sep 2026
 19:05:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 19:05:02 -0700
In-Reply-To: <6aab41f5.bf2fa351.1abf44.516aSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab4ace.b398a7c9.1f86be.0008.GAE@google.com>
Subject: Re: [syzbot] [nfs?] [net?] KASAN: vmalloc-out-of-bounds Read in rpc_queue_upcall
From: syzbot <syzbot+d5c77cabf7a3492aa650@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d5c77cabf7a3492aa650@syzkaller.appspotmail.com
Tested-by: syzbot+d5c77cabf7a3492aa650@syzkaller.appspotmail.com

Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12eb93f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=d5c77cabf7a3492aa650
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1646dbf9580000

Note: testing is done by a robot and is best-effort only.
