Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880844;
	b=OnkGb7CymyljwLlrOy76UO8C5aEdzR5AWVyrZstw9Mlh04UajZPauTyD2rudc2K4okM1
	 AiII3PfInvFcIFS8v/sxwkpkr8GtT8y76GKJDmbz+AScql2Q+CbRRpZIsl4mHrOmZArlr
	 4qB/riIPDDiQVbVRUmt51o/IzaGKjx+vRFVWpUGXmk58aqHRyjG+J7WTx/3QQ6Re0VS52
	 IkvZzcOXfL9odw/YcXlG6CsxlWOBKFpZLXNvQOIs1wntH6mWI9ebso5jJDBM5Q3C+rxU9
	 q31TMASjDuYPAROfU9tQ8wiS8E+F0KCPCHT8pb6ODkzamiN9K0/rfuGQsz+fShpWwsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880844;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=ex+CdXqayYrBZYE53eR17mVuCKO3C3P8gwSxFpMRD3A=;
	b=Ik0cPRGN+XqORMJU+d3g3UH24qA0+SfjiHJh2LVf2wuyFROmxtbLrGAgwq4eeTToFtoZ
	 zUISUtIbJzPVNPTfq1s+qYGcCKC4XQPYp7k/Tf0rQvFSraCnJC+P8Qd2hrjRNEwszZ9jz
	 FUyud9O2bv8axHVxR3O/u0mD40jHK73zdHgR5L42HWtG9BsVlEYlVqwocx9pWqPOqPkHD
	 Gctb3ZBob51opSs7ippIled27j0Z4PL0KY3OUUVmcH4gbZKe3iiC6J+YMbkWRsywjTIH/
	 IF0firtbezVUHjf5zNl+caTW9i/VkqYCqO1iYiCKgxsvox0yCirgsWRevz9qsgrb8RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625D4606D816
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 625D4606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5587351d419so1317344b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880843; x=1794485643;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ex+CdXqayYrBZYE53eR17mVuCKO3C3P8gwSxFpMRD3A=;
        b=MLEJNG3b1DpjuzSLxbJwUyt8jUsG/N3HmzHARu/UFTOuAaBSlcQcyEYc4ITcbVCNbI
         PFTAOE/a1lRZRpVGce2du0I69RBECZDomiIIeAA/hNKR4PqaLJ7MP71XFPAEiLKxzXzb
         PNFuDXOcw6LmSQGWDI0nKech9NRgJ6YsKxkVjQV4zJcSWXVe8/IyBpzZe2WM1VuNT6Fn
         mRP6D5MzCrRxK6PY/DWJckdKPI2Qw4o33GIQCdCZzV3f7ULrsJZbK1Zzd9GeQ/QTNTe1
         hZhQcXybRT/Gn8ESJyhSzP9Xt7ReF7pUUXPZdKCf1xfi/3gIeKcPkoVaJ+fsAOPAwYS2
         xD9g==
X-Forwarded-Encrypted: i=1; AKwUvBzeeLGWPSy8HbFzTrzSE2TYuMFCCt5IxuSpZT4vrcC0fMtUw80kD/q02QjTjYIH1cL+7ZfV+Dr9aeNl/qI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DZmw2EP8fDgkiOqVsNDRFrevqSVnY8BJx8+GlrD/4jnOy3e6M
	GqNHGLQj2hdcHvJzoImUSANgy1IzkZuO4I4KTkIGMDjU8bTQCysVzvpVPXNKS9KOV+EAjZsvVJK
	9BMU1eoViOiZUI4A70W4CQ1QWjvampbpJccivPtoS9Et5iVQOt0xLqm7bCqg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3099:b0:551:eea6:9397 with SMTP id
 5614622812f47-5640de26014mr15800476b6e.59.1793880843393; Thu, 05 Nov 2026
 04:14:03 -0800 (PST)
Date: Thu, 05 Nov 2026 04:14:03 -0800
In-Reply-To: <20261105113834.63912-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aec730b.aca85a03.3b899.0002.GAE@google.com>
Subject: Re: [syzbot] [dm?] BUG: unable to handle kernel NULL pointer
 dereference in dm_bufio_client_create
From: syzbot <syzbot+41e0d7cdfb1ecfc4a007@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+41e0d7cdfb1ecfc4a007@syzkaller.appspotmail.com
Tested-by: syzbot+41e0d7cdfb1ecfc4a007@syzkaller.appspotmail.com

Tested on:

commit:         abf8c334 Merge tag 'spi-fix-v7.4-merge-window' of git:..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=106751ed580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38f05ed2b645c41
dashboard link: https://syzkaller.appspot.com/bug?extid=41e0d7cdfb1ecfc4a007
compiler:       arm-linux-gnueabi-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: arm
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1228c98d580000

Note: testing is done by a robot and is best-effort only.
