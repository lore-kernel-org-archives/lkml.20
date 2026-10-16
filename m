Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EB8356A38
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164784; cv=none; b=mqtWuxkCFg7iCE8YGsfOPMcijFH2jI+qJqVFJ6HrhnHlz7DGLR6dCQj7MtPSJsQzrdGLUDOWmZgknMLnmBCPQfEZAKb0h3EH4p7tyRnk5nulz7KifGEeZ4XcG9Zj7lteayorHeQZep5wRdOXL+XsyAEtf+QqxrLOCu+uZCM9T0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164784; c=relaxed/simple;
	bh=IkEf7hcd7xmiCaOfj4ybcXfYwJN77+97Ixf1NWnSZ7Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kUksRbjGEvVFrT7MTzCQIDIPlh9iiY7SxfMBd6jCjhsJFaXOh9YYoB3wm0sDnfStN+5Sx0tsFe8+6EVDiHEKO0V6MqkmwQ2EhsiUH1LE9/XK7PnGDpPwaION+Zt10WY7KqF0j5pr7DIFnMZ1zYBbeSfutUJB1IFGaT7o/UWLCtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28deb7ee3so183716b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792164782; x=1792769582;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sDd4NMourxnpaYXorUdib34lbUvZ74PbKJ7b/bvUB5w=;
        b=o3k/Nf22+89Fn9U8VZpWGElRpFYhf5tk3NV9ik3BDPEO3VpfTtgWsmJTnGHsg1FCYb
         5u7Y4MxaCH8nCkrBUN5d8N2C8VEpUBRfMV37gw+79wd68hLoOWvLYNNqSuo9g/kkenaw
         ww+ALq9wDphRqFQyPQeO+qz4PICyJHUQpZ6o+WT29pPH5cO9KoP6EGL1whrePz49k3ue
         zxvixMGUdqfwnnLYqykoEkO1TVVPU1UJf19EtpAu3xqz5LqIsNH1YUmDCHgdqHMtp0Pq
         qPrnP/4dUBZ6ZpM07cq2wIDmfFNfkEdcMOz4LWAAF8WKdV28JFi3tIjfzORboBCBiRam
         khJg==
X-Gm-Message-State: AFq9FYLWksLXf0e8YMmtRQ/PaWl/c48aOh+7rLaayU0e9By0W1NpZHRj
	0Fa+/ztfjAVjy7ChcYVrTGRvxR6ZYjPDgNv0TGZnN7XPZWteJ54+m0uT4X8nz8YhqZ7Fjl3PAzw
	L9OL/GvnvnvJAkhfPnG3CjfvzNhjwqVZgFKxxAyuKcJ3BZjI6hkjy+2Gr+qc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:30a6:b0:4b9:a8ac:481 with SMTP id
 5614622812f47-50c50f298eemr20622877b6e.31.1792164781751; Fri, 16 Oct 2026
 08:33:01 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:33:01 -0700
In-Reply-To: <CAFJkwZwxN-UtRzqpg9z6EMQzUnmAFgtwG_vbNmh4oZ=pE_7PqQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad243ad.7952420f.283480.034a.GAE@google.com>
Subject: Re: [syzbot] [nvme?] WARNING in nvmet_fc_portentry_rebind_tgt
From: syzbot <syzbot+be62d4b375542ecebd17@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, neganhat@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+be62d4b375542ecebd17@syzkaller.appspotmail.com
Tested-by: syzbot+be62d4b375542ecebd17@syzkaller.appspotmail.com

Tested on:

commit:         4056b3c9 Merge tag 'nios2_update_for_v7.4' of git://gi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=164e1621580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=be62d4b375542ecebd17
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17ede971580000

Note: testing is done by a robot and is best-effort only.
