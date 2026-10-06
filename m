Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855172F0680
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268444; cv=none; b=ruJ3KrLlLVV3lZiPJRyCbEMC8hj1Ntglrh8j6y1PyQZu5BFtTLQfCtLE2i6pAuZFpjaXGaU3yMfDvBwrdeCpCtFD+jyKa6vJddjS3ww59pCwgOMgbu/JtrfM0hB2KbSrXijrO7xt4CToL1K6NZJ6+ViY/b4wpJUEZPqSlObpqJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268444; c=relaxed/simple;
	bh=SPshNmueUhDbVIu/R7eKiKt/jSPQER1jwg8YHU1anQo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sS0IGzJIRP9v86ME0JQgrZrQoDolBs1i/hXD4aIe8qPy6s80Niy4+RkzG8YsmPYp+GJXwNTTuTQooFa3GIUM91CdSvbnoYQS1cwbRqk0J0gOvZgNqMHoII81TEEFNdy0ClbJ3L+fsnih58ESmlB3uodw+eCVJZoa07aos6BXF/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cd3e90ff97so1913567b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268442; x=1791873242;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7dx2vBMp7KbjjHCU2UZrjSo+JZxOCsuiRWfuzwhvvhY=;
        b=IrUjDlZBuVFe/bk/qjXYNyCbibB94ml9DMqjKn9fNsmyrmbRzdtXpldS/54qVIGABb
         9jlCOVDBHAFfTlQmzSafFJVeqm7XC2QZNgt0LXr3y2Q9HRAcrJ6ebmc2lNv4DhNM2jlZ
         jmu00afE1kJmxsE9FMc4Lwrn0dC6yOsdXOJXsb3Ss48LywCO7eXaNwfDh2qhoWNDuJ8P
         IiZ0Vlp/+nRUqmfkfJkrTUuJhJKSwzBByw2k0ryCcGzyrWEXTrLqNd5QKGMp7yZL2kz6
         cPMNTxD0qnj4lWF33Ux/x8OL3H0cP3Hnam8oys5U6yQwgQcKqIRyHZMW1ey6cJIy5fmn
         rpuw==
X-Forwarded-Encrypted: i=1; AKwUvByOiDB2SREaNgxpdE5vb2PcdMsUIg0urtLpl+28StSFLXnMCUnXhY/3FTQfQcjSRKfTkW6wPTY4CKLQbSs=@vger.kernel.org
X-Gm-Message-State: AFuF++kt6WE2uiBZKVdYiPwR2tqKVxIfHE7G9wReaS/e3CgyQs2M15wH
	RCdqc2YoesNxVePkYYueGPDeXT+xmlR9lkdacFfxs3RlBL6V5GIjPCIzfUuCbfQw+AkkFVfgkhT
	VFOZWR5VgP0wCjLHebopv4Q75gMZra3GyCVQXp4cXui7qW6j82I+0ozxk1ag=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:50a7:b0:4b9:a88b:888c with SMTP id
 5614622812f47-4fb413c5b94mr455047b6e.34.1791268442527; Mon, 05 Oct 2026
 23:34:02 -0700 (PDT)
Date: Mon, 05 Oct 2026 23:34:02 -0700
In-Reply-To: <20261006055317.10277-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac4965a.9ad129c8.3858c0.0045.GAE@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Write in utf32_to_utf8
From: syzbot <syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzbot@syzkaller.appspotmail.co, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com
Tested-by: syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com

Tested on:

commit:         2c3418ff Merge tag 'keys-v7.3-rc7' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16f1c715580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=341a98f91c13ec9
dashboard link: https://syzkaller.appspot.com/bug?extid=a2748ba908c108e7e525
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16686ff5580000

Note: testing is done by a robot and is best-effort only.
