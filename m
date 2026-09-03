Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFDF3F7A9A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418205; cv=none; b=BfFA2QK35NlbUd498erJ/b/gRzIK+RrzRPUo/yGPai5Z5nAGvV6vO7QOrUiKFHhV+5EGZmDQ5pd12zzZ5ha37ZBV7eVVC6t6MfwtCu1euER5gNkyvaoNTiGq2Tu7ZO7RuL+3KPjzZ1tEXtT6lRArmZh/E1UNxaHX8Ls42isDKY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418205; c=relaxed/simple;
	bh=ft1gtC0QetSSntSYdXmQqql2Hqav5wHEE/IRWEYuc4E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cgvQDQXs1t64o+UqcYbpjimAKBm6JM3xqgGY2A6Bt9J8H/q9stQJAYmkkaRTcZkaC6wuAk2+Q2pwbS6OXEu46YMJGin9t7jJCQY9muCcNUJKGl1iDqxq5zRwFN1VBHslxPFyIb3MdUz9+qQWavW/AUSwLFRw30miu4rav4iom+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b34e5453cbso1854144eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418203; x=1789023003;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MwItvHPZhReuMxx2SxHV331iFuchpsXPybuJjFE1Bbc=;
        b=V/CibSkTSWKfd7irXnXHoiNNmy220d8TVCWcVXA+teiTOT63X+AlTFpxzTO7VI8jLb
         j6idlkwz7ZXEikKfmyECk2HeXFfnlS9Iu574WuCfzLr0TpuGj0blRe+ZvEircZEsKiia
         XrmSJ+Dl8f3aWZSJqC2ctc9lW180ecBIGjiUt1aZgkGI+owg55d0Huyp5MkyrVIIZZ6v
         +RiSRm0c4Lm5Gc+wSz1cYVMhJ6X40Yq/kktYpwKrR30Z9DdFHC2iKaxmwUswvZGtCjNx
         nvgJ/OZrlsRlmcGcErWdmyZWiTE/BQG28I25sDc+WX6iAMtqkCtvDep+oXtJNTfxKoLM
         T5ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmwfU0eFIQM252f2ZlWLSOnei8sY2hjdzSYe55LQTa69uW9IdP7hrz1zD0D5hMYxoPucUxi7Kh55M6LIg=@vger.kernel.org
X-Gm-Message-State: AFuF++lYG+PUnimCk0vtVvf9WHmzjOpooDHENhd41rOHaN6vDw/hSB5x
	pYs5QnvQROJTEjPCaPUEU7SX8SyDhU4VD9RUgPCdGrCMM3g7R15I9NHS0yRkHNE85NxeAYxgRFX
	odUFYEg5u/3lBWV4OSoWqLxgynpzAT963j+q8FRfupfeExzs1uEE1ObsAENY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e908:0:b0:6b1:afc8:3162 with SMTP id
 006d021491bc7-6b47c3b49d5mr8563925eaf.7.1788418203314; Wed, 02 Sep 2026
 23:50:03 -0700 (PDT)
Date: Wed, 02 Sep 2026 23:50:03 -0700
In-Reply-To: <CAEe5be60wb+oz2oJcZ_spAZHaMr+cK0hVxKWeM13rUChayb=Ww@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a99189b.94649fcc.25487e.0004.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in bus_remove_device
From: syzbot <syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com>
To: khiemtranzo532001@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 6



Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17d78b49580000

