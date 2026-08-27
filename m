Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF73353A87
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787827323; cv=none; b=lXimqYRL26hRzVtXVCJrMBlj4ho2gM6ug5CJfay233HDmVwN7fCBjIMb1N31A9X8dCByRUZHicKWQpuxkp4R98qzYq66EQaJ6xnRcRcUx3zZltOfhao0hhAl9pNdi/NGk/OJrfudaTmjklmlZpUnrSsM5yDh40zqgeu/1QhLCRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787827323; c=relaxed/simple;
	bh=flCGS/7PHk+0hoFqtcQUigtTrygkVNvcRIaWkVdKTrE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=I/lodiIvZLQEbERldmjCwwckmwpcPjHbZe0DA6rF4p4/mIQ5Cfkj3t1zKlo49c0yy+WPvm1vvvOoM84mQhwRr10LM+z4HvJnUzJZoKAuDIg5QgdmoKkh5lOJfQzVBv+mTgVG39GB30bCiQz6RoTlmFn9MUQj+3/fQa4IU3Y0yFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28d7ffab1so1711325b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787827321; x=1788432121;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d1gnvgJOAISuTZRMtpIvypONLcOhVuVvfZm8n7xlhSQ=;
        b=i1j6b1u99q7uxIi0aa6DZkUfHbPxi2WKGMKGHbo2m5csgWYmnr02dnqchPegh9pEhj
         u7ch9RiB1pByJKeFuEaPCW1FxhML0wUBo/u2IMuJ+H3vrHw2X48oxR+MRiDh7TRIBP27
         KCjA4yzwC+/EQ1advLrtShsSjgFZQGMaJwz/uNpwJrUDe7ZwU6BkQidCzPArekSoiMhl
         TE82+eyVrbhGafhbbt1NPtalBj4EI4RgJqKlKK2kordZ5K4eXCeorEiTCKoCWnT/oE3C
         /1vtDEW04XA0bago929yK/tlgHXFzuW5uO4t+Ez9zmJA01D/8q5ftn/uofo4q5jnxfVg
         wizQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpry4IEoI1zlvJ+NpmcEFcP2e8jR3bZsXeVKoyGTOnzpyf55spNjSnhP+XYDv839UiU5fXlnhkYIa1FCIc=@vger.kernel.org
X-Gm-Message-State: AFuF++nhYSK/kKLOrwCBa0EbbElFZh7KyCa61DFMjfL+Hxo2krq+voBI
	XHgbpARd0mH5yxJWDasqfA6wuCLABT4lzKNSvU21EBoqAondrgiNNwLGsinLdDcZKf77ow/kvF1
	ssPnZ2foMdyQ5e9Wenn2yaZEd6b1a3Q76XyTE96hv/VrKP8DWY53TgPSkscY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2222:b0:4b2:8e26:bdd2 with SMTP id
 5614622812f47-4b37cb42309mr5284504b6e.16.1787827321373; Thu, 27 Aug 2026
 03:42:01 -0700 (PDT)
Date: Thu, 27 Aug 2026 03:42:01 -0700
In-Reply-To: <20260827102831.21012-1-jeffinphilip14@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a901479.4d659fcc.734b4.000e.GAE@google.com>
Subject: Re: [syzbot] [sound?] BUG: unable to handle kernel NULL pointer
 dereference in snd_ctl_led_get
From: syzbot <syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com>
To: jeffinphilip14@gmail.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

sound/core/control_led.c:117:50: error: expected ')' before 'return'
sound/core/control_led.c:134:1: error: expected expression before '}' token
sound/core/control_led.c:134:1: error: no return statement in function returning non-void [-Werror=return-type]


Tested on:

commit:         818bebeb drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=b7fe2760ea6f1ee44b4d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11abd579580000

