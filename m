Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2A12F8EAA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787926804; cv=none; b=EdmZGlY9hlkM2Qs/XmIatw/iAxD9qszdyqIiU8/dMQ67PomEtsDjxMEZ/YhC34gbtpMDDEnTPQbDnClALL9mHDjBzJ1hp1LB65mc2cp2v5sP8q5sJ/QwIgS3ENc2Jg+QLInx/8Xv5vR/E2h9eSJEPcr4AdF9/lEtFovthyxGF3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787926804; c=relaxed/simple;
	bh=Dtei0Q0DVYXKDgscH2xqgQXXr75JyW1PMC8df+Y+XP4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Es8HMkmW35tneE5iHi3+Qz803/g8YQhTExjtQftm1ObZDsmmwDafVeE0AH9R+tewxPLXKoJPgWMXjtwu68RRZdUjjGSzBXM1KCV0/c8/zbC00VbzHiUBNpXXIcGur+7X0L/83PKfqkklJ+lAoa2JlHBNXf4+FP3jJY6Oj2ukSxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-456ab1a7f2cso2122415fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787926802; x=1788531602;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QkNQuF+HTncNTf9v0fNYbdxqYXnPhQHseV/NE/n7x7Q=;
        b=VixW3zGPdAlQSUnt4+wfOdnHjjVcm0Bo9tVrTgurwBfpiSDm/qrgvvwUrcOGQzN3QY
         P88pN6/hR5f5gLwpiBK+jBIUnmdhjoGRpa1JGRtv4po3yHpF4Qd1hCztqJOcGcUT5XgR
         1qV4Z+vIduskim6uYNw2TwIWzGfJPu1xPVKRAK/l1SuDwXUIbpbvsQU6UOE9tsTlQbNf
         STAw+uDbs8fdylThrDyApr0iK8UbVh+QcEBa6sDQKWc/fZ71lRi0oZekvRYX2aF1qcYk
         2Wqaaqk0MCYAftlIqsC+1OrKijHW6YqdhhS5aWxew6/ihy8H1G1Lfwfa5pUwaudIw/J5
         /x/g==
X-Forwarded-Encrypted: i=1; AHgh+RpwM+hivGXFfNSmoNN5SdhDmKhD8eBLksDKfyODrC8+JgmVJS1b/u5xLHV5/dPyoL8THg3FudxyEbDefnI=@vger.kernel.org
X-Gm-Message-State: AFuF++m1z4dhzgNm3QdVNPcVUGFPF/glgJsvIFx0L3UhvxyPK1UGbgcn
	kemjkEjf1lAxWJqd7AtyroghSvMovkhsBFZGA3K4ziIXa2SRJFdHdauRbPRUv7e5nCF/YfaJq/K
	BTI1aAJaDNAfPaYpOcvcVtWD6VdpvTRjWWU+QYBitRbeUD+PBYu2yhUWrIi8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:189b:b0:6aa:e13e:ba26 with SMTP id
 006d021491bc7-6b1c67d98f8mr6532674eaf.33.1787926802059; Fri, 28 Aug 2026
 07:20:02 -0700 (PDT)
Date: Fri, 28 Aug 2026 07:20:02 -0700
In-Reply-To: <20260828140330.134760-1-jeffinphilip14@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a919912.1d9ded08.62e62.00ee.GAE@google.com>
Subject: Re: [syzbot] [input?] KASAN: slab-use-after-free Read in atkbd_set_repeat_rate
From: syzbot <syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com>
To: jeffinphilip14@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com
Tested-by: syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com

Tested on:

commit:         818bebeb drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=126a6d79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=1e2ef9bcb29af666b2e6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17ecf625580000

Note: testing is done by a robot and is best-effort only.
