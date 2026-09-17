Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B87743E486
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628344; cv=none; b=FrpvgDMhcRor9tv+bVnScpsfKkub51zh4mUxaP2mX/nKA1R2s/hpZsLHbo7TjWY/J09aKLtkt4KQJuOjJ/C/cuRl9v+tze/RwHMohXt9GcKLwh7Qmu4CSru9MR1wh1KNr6QE1a2QSRkeSnWXx+lT8mWqmkJGxqox0GPJwD6Tmrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628344; c=relaxed/simple;
	bh=ocm1oz3D6bzdO8b23gwQ0fUOwUowt/136rgo1dwg4wc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hk5+eb/jYtXeZLxxRQJuygz4eK4jGhq0nYfN3SlyJLfPZV6p3512Gq2Eoq0gr9Vtezg8VEsRrIZphmU7uZzyiVue6MnNLaPUoN2ZgRlUv5IWQ6PuaYdzP0f+6Ghabt0TnkdW5H0E2dv8FdqmkwApswGJOHeUtiOCfsOwKNccii8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4574f1cac98so957710fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628342; x=1790233142;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RA/zTH478ZP9Kc/vn5sqCuMNo+mxE1VsaPGXCtRcBhc=;
        b=sMox/44SBLG4yG1b6ZP/FFlxRAzY2kCo/Zj+euj1i4BoxpcBcbwKv6V7Xc3/wgLON/
         wVFo5eknBFnQZ791scI4PPjpzSKovlmtpKBzUBwAmE5eYY6lPL40NxDJVbnK8KGCuuYY
         p+u5KThxJ8i9mwl71W2dx3jkvaCrdjrPVaqPmGdLOM/cvZ9MilCMWSRf1qjrvcjsMaMr
         2opnTj9fnsUUglAY+3XZ0OfRJ8WcXwPz8fmWpoarPhmEFR5/pXndCkgpUl7dU50Lj+KK
         c42sQTZt6DPzLbFClURXHy6Q0DNo8HAzNJ8MFoTgFVFTqrN0WqfbMcw47em9e2KVvxPh
         +9fw==
X-Forwarded-Encrypted: i=1; AKwUvBy4oJY/zHZpaSvsnVpeEqRDO21+TQ2g6oD8MstPgfeDwbzWZioSVZ9NIBcyEHFtyp2aDw3XqI664ORg448=@vger.kernel.org
X-Gm-Message-State: AFuF++nwQ5w2sDDFjJOZuL8A00hjsGIy/0PhbhPY6vCIliVhQpCY1UfI
	3XFaBnBIyoSNzvw4PTl52B9ERlKFvzzyA9+rxwdu85oFnGc5dTx3HK39a7r53hNLK69GJX8PqgR
	DHKiTrZgxgH4bV3YqtMLAXoVIqGHsSMX9/0bPEIubyiEgvN6fBzCrnu1udDA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2087:b0:6b1:4e36:fb80 with SMTP id
 006d021491bc7-6c7d1ac9aaamr5783579eaf.15.1789628342287; Wed, 16 Sep 2026
 23:59:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:59:02 -0700
In-Reply-To: <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab8fb6.71f81b7d.278072.0019.GAE@google.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
From: syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	iam@thechris.in, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com
Tested-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com

Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13824915580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=7cab6a19619f1b8efc00
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1493b925580000

Note: testing is done by a robot and is best-effort only.
