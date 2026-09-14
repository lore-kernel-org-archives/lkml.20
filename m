Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D46A384CEC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384927; cv=none; b=UBL38mVbeBEGlz2LR/K6ixL/ip+2VGgMQntnApeDsK4pN9hIuHfxBSo067uxmXInF3UxZubsugVAFhWvVdQkMyzzwxR8kJ7SNcifX/KlLu8BfIE+meBMEREnwBIi5O8EZ3au3Mg/Q4CdP/ZCOFv8ADn9K9uIhA+euLNLb0WXUmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384927; c=relaxed/simple;
	bh=CkkWk1r/2sv3z16Jbg0ItWIfX9h3HNa148ZoFfcxDBw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Boj47AOwAtixSNUO9OEEvj42C8uaCoD/KGEe2NIeiOp9ykLBgrQNqzSFQ5z+x9x7N/yu2JQJd7zhIF5VH0x+9tGS5gT1ewDLaG+XuntknmxDZ/5tsXVRe/1wALAQ1QlHDlO30jRCx65xxicsNk+8+aG2WCud8Jv63SB+qBSf62E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c1b7981b4eso1881796eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384923; x=1789989723;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fT+mkHryTc0fNmyYHwY7j1UMESwbpZ4XnWVIWwuNREg=;
        b=lMk8rnLdY6PgSdiai/H/TXapRI64qDALuQhUbqOWmyu227D/WiyNlTP7PN+9/oFFIC
         vm+w1gmAmP1mjHrYOzOWdYjo1OJdiJ13VvT3PBbttw6cH6LudZ0JwipqrUb/sbq3p7Lc
         A07lFSdXDDEWltQgLtq8GSSPUnfhzqBh5KLd0sddFkX8fBXQLV8xD/7nkVb5qmogbLC4
         iwdACoAirS8fGxP1PvCkHDlopm8bsnzbi/UklwITuJLhlScwWlnPwzYZCmdzxs8rN+IV
         B15L91YKIbKQ3Qf8cSa8cMMUxb47JmMvhmnBA0b28Lom5rBwS/+9LHgoKl/XEKqJN1ab
         qTjQ==
X-Forwarded-Encrypted: i=1; AKwUvByeqAUazOEpigZSy6EV821LCtZJ3el+WSxFdJerQYZ9Wchhs7o0/FyukurrTqo08WqQXhj2eaUBOFsJeNw=@vger.kernel.org
X-Gm-Message-State: AFuF++myU8iYfH9pFsM0vqavUMWkPz+FYZxLOtLCMRMtjpzhNa1d3P9i
	uTtGIXAbsd0xogrIQHvEc5mzZCIY6jiKCZmlM3lYPW7Okwnh08jCG9ubVPRI1AdtDtJ5C2qZZag
	yJPmgXKWSxVEa8hAKo0wsy9P8cZpzs80G2K3tTXkwQt7XdCbp/U4blO+vDs8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:827:b0:6b1:6c11:686a with SMTP id
 006d021491bc7-6c53f55700bmr853939eaf.29.1789384923577; Mon, 14 Sep 2026
 04:22:03 -0700 (PDT)
Date: Mon, 14 Sep 2026 04:22:03 -0700
In-Reply-To: <6aa7cfcf.a54eb084.21e427.6a1aSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7d8db.4c28b7d0.c1bba.001b.GAE@google.com>
Subject: Re: [syzbot] [block?] BUG: sleeping function called from invalid
 context in null_insert_page
From: syzbot <syzbot+95fdab36405e5ffdb680@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+95fdab36405e5ffdb680@syzkaller.appspotmail.com
Tested-by: syzbot+95fdab36405e5ffdb680@syzkaller.appspotmail.com

Tested on:

commit:         893e1178 Merge tag 'x86_urgent_for_7.3-rc3' of git://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14ca88c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=95fdab36405e5ffdb680
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=139242d1580000

Note: testing is done by a robot and is best-effort only.
