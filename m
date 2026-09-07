Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174CC38A726
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788791649; cv=none; b=HgWwx4JVD/2j+P0ui75o2YYKbaUqpH3lHaWVWJHyIB3KKBgHL47PmC8Ooavvf/YzBoBNEk2PKIlHxQUPtQSNxXji0bPd7SanABhUl/OmFuf8Lv/VR8jjjTQJEIimLXw7kxMStmsVzUud4FYQTg3mWlZGS2Mn8Q1raEXne9vWDzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788791649; c=relaxed/simple;
	bh=RFN7y15re+8pJ8sNNUyA6k7ocmZZ6hBXwTSSbFMl2zE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dtJzDpEWmQgjNdvUUzZpyq032h8bzT33DUnLXvrFaqy4L0hSJrVLScpBVa3aDgucfk9OoCsTX7KQJy66xfEOY63jH6gt7wQOjkC7yKl4W6PY7aAuse0icq0IixJqEVvJockK4OhuqecHKj4U2RTUOgxSjRLMFAIwxSKf0HZoGwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45a07949855so5348817fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788791642; x=1789396442;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pri50c0vgFhLd/c2qPZqgylPD0Y6/kICKd2ubJTDt4g=;
        b=fzQMNSHj61ZJfEvCI+s75olLKMlQXOqa/devrqOjkmaqwTtoBFfNJBFPNgekbmJWvK
         PM7wScgizb1ho8TKPUmA/UTNLl9sDeCyYqqR3Z5aidiovqnO5hgo4uN9yOa+zgpV0gIK
         mKR+fBQRhKJgRkVtWdV4OZvgdk0/9cyfSRY0mzUYVOzmHjFGdehG5AQ32hBzTPRBVaIV
         kKCSyvzMbH/cAx60d8odRVJYb4L1w58KnkUkj5f4h1hamh9tO3A/uyZLeWcGfn1sXaf+
         hLJPG2vFNE+FHgdeSgZm61dT3uab55kQB2gl1Khbq8vIF4qSXd7ghg7h/IysisMg4tcj
         p3wA==
X-Gm-Message-State: AFuF++lpToN2c9mM3mcVBTRrrKQgs/E0PPMz2bns+hf5eKUezm7P9CyB
	SG48YOOFp2klX6SxclYylYEzT9NiC9C/a7YWBWqlZt7TKxo9qUTyJVGKm6Kc58/phvPaXABig2i
	fq71I/As7y0dmloO/Ttm40gn9Ky8qg4pWP2HrvXgtrUJVMXThCfNV4jAm0nc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f004:b0:6b0:5233:f69a with SMTP id
 006d021491bc7-6b6fdbca26emr14345981eaf.30.1788791642404; Mon, 07 Sep 2026
 07:34:02 -0700 (PDT)
Date: Mon, 07 Sep 2026 07:34:02 -0700
In-Reply-To: <20260907141323.4121-1-syedtayyabfarooq08@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9ecb5a.2bb5a69c.24b23c.0004.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in vhci_shutdown_connection
From: syzbot <syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syedtayyabfarooq08@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com
Tested-by: syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com

Tested on:

commit:         df290809 Linux 7.3-rc2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13bb6af9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec55b50193b453ea
dashboard link: https://syzkaller.appspot.com/bug?extid=31117fde582fe6a0cd62
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=167ccaf9580000

Note: testing is done by a robot and is best-effort only.
