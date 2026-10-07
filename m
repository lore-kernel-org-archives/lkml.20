Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BD44E378F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 19:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791400691; cv=none; b=X5DBAPE/qSFyrXE0U0F+VydSjaS2i0PrNXfHMuF/7DYBQUwNhwUROx7btvmFUgXWYL2qESyQECa5orq+JUt7TbLouNQGbsWEiVVsDMpJ1mRIriFRNL0VEunD6iPbSWLEH5vWaMdODpiUmnJZ9COmlJJWuHrr39BZ5DzHqam9t+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791400691; c=relaxed/simple;
	bh=lsQAjfV+3P+xAcyrX37a7ih6ZSwqcu1+a4zz2puC0Bo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dmOxh3qR9Lfv6XlRLKIMUkEJMRiAvcvmi9AMK6TaLtEcaMGF0T3LPnHDRdLVNwwHCAm83EDMvinp3MsqWg8Kw6m3RV042SWYxs8xaZuxFtj2wegYrUBRTew3io06UXFSNcGfWrSw1HijMnsn9XaT5fJHY3ARy7Daf6CPWYfmHpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4d2f0f77124so5429961b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791400683; x=1792005483;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nvhZnVum2509nPPcWxaJ+INevggVVj4KBtTKGoAHINs=;
        b=UbATJkdYB6uYkPxDbEY07EXCrI8nt6J92sxmWU10vTuCsXbDU4Mmw9US1Tgs4tCwKN
         J9u1oyVlpghCAxMGT2rGg56Sx2l/S1Q/zOVEjMZmBr1gv28QP7wRUQ23zPbLGY9lO5PA
         QHs6FreE8s6zejZ35Bw+KRIcRp/y8mdXeiw1IZClTmc8N90ksFbk8gov5mo5B1IE9LgG
         J+hU0tUUwY8RfvdoAFlcwZ9X3mMQL8OmEAz3955DiKh5nI2IUE8KPzn49cFDpv1bMMxO
         WO1sGaZfXhjLfaqsiZvRy8duB9rWaD+RSOCrna7fYAqqMTizBjpWRYEhHMZyFW2jpDpU
         cmWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGjOPKBKVd230Ge2Eecj1diW5cF6EsvCz/TsEcEWWkBlPhhoxaWr3ngqViPdfw9S2ufxUcygyEYgfdOBE=@vger.kernel.org
X-Gm-Message-State: AFuF++nn1MXyHwUJycSjn5bNBT1bZM5vCXssHFM+H+xJI22Z/1stubEA
	mgUkE3fXkdi9l4+SYoPzrCFjhBYiH833mQGdL7Nln5a7WbHmjfZ+/qbvVfpKd/vM5S4Xbl3FdeT
	apJUgWsj++ybizeyJhjaKTMUIIC+llqFpjcEO5F2uPFyFeltrmK9RprESZjQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f88:b0:4ea:4207:39a0 with SMTP id
 5614622812f47-4fc4647ee09mr3150665b6e.47.1791400683188; Wed, 07 Oct 2026
 12:18:03 -0700 (PDT)
Date: Wed, 07 Oct 2026 12:18:03 -0700
In-Reply-To: <CAOWyW_45mWwgSpjpQvXyUp2DkqX_pcTM12+etjuTwqLNuAH1NA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac69aeb.d03902a3.74d6f.0008.GAE@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Write in utf32_to_utf8
From: syzbot <syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com>
To: j.bhargav.u@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com
Tested-by: syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com

Tested on:

commit:         7b63ef2d Merge tag 'for-7.3-rc6-tag' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16e2e715580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=341a98f91c13ec9
dashboard link: https://syzkaller.appspot.com/bug?extid=a2748ba908c108e7e525
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1633e00d580000

Note: testing is done by a robot and is best-effort only.
