Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6D647D951
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790888767; cv=none; b=dyQwjxlT+wwogbZWbYjxnZGQMQWfVuyKk86/Akllcf49QmrlBmlkYg7NDVV6iRa/uAR6IiNjtx/rSoh4qPxQKxIrU6sViI4CxJNaaFbHi1Bo7e5zOM8x8DWDjRhD1mhbrj/erS0VT5JLXpLxC4nfx4ApPBrFuqYZODbkMzbpHxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790888767; c=relaxed/simple;
	bh=gEqEy1IvBNvHq9K1+2pk2n7dpBrS21pwJwFJkJPERUA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jhoAQlzv1l1Jxv7R6+Eri4Xb8eHQDWjn8lY7srNxBMwYHFnvkW2eXXZdP0ZObwryFO4F/JvtVm3vZ1d50DY4mtR2Wv8EDg2JQy8Er8iQYKUGdN/GvwSnrtOkezAQoQhqthzLvs25lrQtOYaxPiQsAegMEhDjVqy0MikEgeHt77Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4e778acdbc6so8959879b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790888765; x=1791493565;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6GchM8Ae/BRSmkFVQE7ui2cHkvGg90ANeE0g6FbMWh8=;
        b=ZYT2XJ5eeS1IKGUcvE31GleiXcVMgezHPDDfI2d3Sn0ibYmbti1SoaqKOHSav4RKm3
         eIYFqnVNFW3lznv2/zoE21v3BifPXi4FBxP063CjLrOaPxwLMkeoeUbQNMBiIljo9sf1
         XnIPG+WRfAcp1rdgjVcTF7EeJN27AZmEfPrqC0WFHIcSEHPjIoy/gPnSofsyF2DjkAH0
         TPA0SToJqxby3IsTT2Rrcg0rZOUpEtBDV0hUUWjXLn1Z5WjHZcFS4AcYbxFbja75kJTF
         7kxpZAlDB18Qwc4DjNQ/6SgWwe1kMcbW/u4VjCSP3WvwnGAVkb8JW6xW2pbi6S94Nf2o
         FlEA==
X-Forwarded-Encrypted: i=1; AKwUvBzCczMFM3JZijM7Ox2LusBlJ9YnTNBhbo836GuqcTXmohem0D/Z6IGVv5+ulOELaJ/ThDIFfUsAwAc05UU=@vger.kernel.org
X-Gm-Message-State: AFuF++nmnxyvKtdRwvnolpiRZIKDl6J+9z/oP05Q7EFNFCCZgRHT4AJg
	IazfuDr954hHp2kmPGgNbOmzJHb5yTkVmpWRjREDiPTIpfSIclmS+wVdSNTShRpTbB88xqtTvMA
	OWRL03qDYXY5HNNJfMIc4CGD8Pt9VQLzKhijESftEZMxnBEKse9D61TTjjZA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f88:b0:4dd:18c7:544d with SMTP id
 5614622812f47-4f52a156d64mr412055b6e.31.1790888765295; Thu, 01 Oct 2026
 14:06:05 -0700 (PDT)
Date: Thu, 01 Oct 2026 14:06:05 -0700
In-Reply-To: <20261001203431.1291004-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abecb3d.eb639fcc.2b981.0004.GAE@google.com>
Subject: Re: [syzbot] [ext4?] KASAN: slab-use-after-free Write in do_split
From: syzbot <syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com>
To: adrianox@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com
Tested-by: syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com

Tested on:

commit:         d24e8ac7 Merge tag 'net-7.3-rc6' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=165673f5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=718e346eb0b8f38
dashboard link: https://syzkaller.appspot.com/bug?extid=09bec78ee77613a3efdd
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=113953f5580000

Note: testing is done by a robot and is best-effort only.
