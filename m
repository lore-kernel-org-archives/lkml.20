Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1C4559C9A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957426; cv=none; b=sj10QGepZldvUzti3Cp+Ny6ukK/Kh6iPeGT7oiSnzhOslEHFk4iDynNPgspeu8pGfdvC7HHvVO8alThxdhg4sXs3RCe92oGaj9K6u3Zogpnhe0gQP+lZ6CyVmVGSTbnN5vjBe+Lz9xWqO4OWCFFuP/Xrbkog3LUiCFt5qWStRJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957426; c=relaxed/simple;
	bh=jx6BYIQOtVdMcJYEZANHBpmlnTN0Rn/IBOGmH8OK9Ss=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mlEC9yxYu4gLKHU1Wrjpi01sWrI+jerqPkDT/q0mnXLOeN8APEAZXftDzTWjp/KueB/h/iO0tQ6lqFb+J5lgLsbpOZ2aGZ1V+TG47/sHes3yZCcdUfzWryjc0kBEpX+QizrHh+K/zuXbnLePJRSelLEdOGbcuOYzQ5wNz8jADwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6bc3374cb0cso1200058eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957424; x=1789562224;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZGMDUjloGdJwPOQ51Ob0DgRc+ItQRl9Cf8JL6EgMeLQ=;
        b=LPUsUNe3reJWnnNRzBm0o4GIHFc9ms7ts7vwO7sC/0UzdHMXKA6nMogNxQPhg75eAI
         jJPNRNcN3w/azFx//oj+KsXKLWcBNa6lRWLr9N8blZ5epAYDv7kJRugKweLNB1u3ga3U
         GiFGoAdgX8Mk0WuWGVI8+dFW77o5yyCizjOek0Tu8edkd8MZRh1d1JtNW1kSQAksIAj9
         p28o8pK0DPKLLBSmjucpwieJ9p7dsCnjaFfs663+3UHQyiUPzB5bNZfQjxPgAP5ZOmn+
         KXzZ2OStIevxoKJtqAwHnXHoqM5aOsUdQX9d5A2vCo/VrXsVK6cqOV0JK0rvVLbyO4jS
         1Q9A==
X-Forwarded-Encrypted: i=1; AKwUvByC4G9U/zYEQP79aAjOYYImbZ/Ra8elZSYGVlCfdKtyvzri1+s+b8C5dvKyy2vZijiLcLUpzp4FL/rZKzE=@vger.kernel.org
X-Gm-Message-State: AFuF++ntOkcE09f/RTog0bVxYIwjCcqApYOlBHxTDEJV1RYOmDGh/6Ho
	TTN2y2CcPs3vkHEdGXeBV8qg2mAmnkqzKmixu8DczkG7N/PHEAh9Z4R4vV5yPpllLYlNxV7zEwZ
	bYHXVB+YF4Yf9lvr110mS+tFsOtrZKf/vTKu2ka3NDYvIF5VCaddSIJBDkWE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2008:b0:6be:7d9:b14 with SMTP id
 006d021491bc7-6be07d91136mr2427627eaf.4.1788957424348; Wed, 09 Sep 2026
 05:37:04 -0700 (PDT)
Date: Wed, 09 Sep 2026 05:37:04 -0700
In-Reply-To: <20260909113839.172663-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa152f0.f2639fcc.29487d.0004.GAE@google.com>
Subject: Re: [syzbot] [usb?] [media?] INFO: trying to register non-static key
 in as102_stream_ctrl
From: syzbot <syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com>
To: adrianox@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com
Tested-by: syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com

Tested on:

commit:         893e1178 Merge tag 'x86_urgent_for_7.3-rc3' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1357aa15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e618aabdc2dca7e6
dashboard link: https://syzkaller.appspot.com/bug?extid=2a3de29133b40e8f69f3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=131da6f9580000

Note: testing is done by a robot and is best-effort only.
