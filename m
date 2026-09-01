Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE49420469
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249306; cv=none; b=AOKiFQeF2KwuTdSytEbjcDxyJYV06EhQOvSL7kB7NCR9k9vYmfzdg1eY6yj+Jft/mvN2ofyWu0zixeXq5MOif1moP+NRoM7RXqMjhdFme6zLk/reOjJAU3+ALsxhfrp91FRp3yJwVbkF4nGFQuDER/bPyf6jfcLKOBuQfAshYeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249306; c=relaxed/simple;
	bh=0qqL/hLIDvQxXrmdbtiWTD76gcG1bwwIUuxvO+J2TMc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dE0ybLJaIVsr8drZD+LgY8pedYRkOTjDQJOagBoQknyDX/84hNqAIcFbanAjMflGnTGdRpVMP0X5yHcHFs9CLwDMsP6ma6owORWiXGA4ZVqbkTjoamoTFnacxfMOQ9nhNw+KRPRHj4O7o02B9PtwcKIi0dG8Mk/R2eA4DnvUU+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1b7932ec2so573622eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249303; x=1788854103;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4CmDFTRfa8f29ltAwrzLVpQX8Q8Svkmjy42jwgV2mHk=;
        b=i8K0tXeYyB1ZFy+Yz02SEGoSRukocsjg6xaQ/J5ZWe7bpcXKWu4TjHmR1S6mh5jy+w
         LDlsAhLPChLY0/qUkSHQRnz8SYxNYFXsVHesc1DzXuXFiW204Cmr4TLKqLpkqbam6sDI
         4O7PYmKN1ufWqZUuz0YNRgW9zHW0d/51lW/92IDoNZSLqCd6QGkZL+DCTNr/YRDCJ1tm
         m64DjjE7pumwqHNtF5OE+Clpx3JJCXoBD1m+M4yrwRa3Ic7yw5ZzzXm6KtzrC9jUcXCV
         mYjrCyUvO8zjFSlzh6z/oHF2LBTBdOqxwA+LhQIZh/i1t607Vt4T+gLSVGL2kvgujmm3
         9K1w==
X-Forwarded-Encrypted: i=1; AHgh+RpkbB6TCXdtdtd5riW4H6q9IOOHgDl3oCqCM49opIqqAMPZLrZ+mbFsEl+IdbooQuhLGTW980FF3QZ4M2E=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ56/9twt4zzV5W2rSvWs73ymoFHBWdNh9mCifXaL8aPKRZd7b
	h7dPrm6jaUwLiL9pD65POGxxzwaPi25yD1eSFtOO/WnhoOC7ZknDrw5QuUfRdjVmhF9r9iTS1OZ
	7x5ysz5uAih8AHRP1Z3jn7rY8AsgX6UHnsCLeuazCL+TY+b1PGdmkFR/WGGA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2204:b0:6b1:5865:a95a with SMTP id
 006d021491bc7-6b1c66e0e4amr28953455eaf.15.1788249303616; Tue, 01 Sep 2026
 00:55:03 -0700 (PDT)
Date: Tue, 01 Sep 2026 00:55:03 -0700
In-Reply-To: <20260901014242.417011-1-junjie.cao@intel.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9684d7.2d75a5c4.15ddf4.0003.GAE@google.com>
Subject: Re: [syzbot] [mm?] INFO: rcu detected stall in sys_munmap (2)
From: syzbot <syzbot+8785aaf121cfb2141e0d@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, bigeasy@linutronix.de, davem@davemloft.net, 
	david@kernel.org, edumazet@google.com, harry.yoo@oracle.com, horms@kernel.org, 
	jannh@google.com, jhs@mojatatu.com, jiri@resnulli.us, jpoimboe@kernel.org, 
	junjie.cao@intel.com, kuba@kernel.org, liam.howlett@oracle.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	pabeni@redhat.com, peterz@infradead.org, pfalcato@suse.de, riel@surriel.com, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz, vinicius.gomes@intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8785aaf121cfb2141e0d@syzkaller.appspotmail.com
Tested-by: syzbot+8785aaf121cfb2141e0d@syzkaller.appspotmail.com

Tested on:

commit:         abdf623d Merge tag 'wq-for-7.3-rc1-fixes' of git://git..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15b33b79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9cc692b98d9b4fdb
dashboard link: https://syzkaller.appspot.com/bug?extid=8785aaf121cfb2141e0d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=100b3379580000

Note: testing is done by a robot and is best-effort only.
