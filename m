Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B0D40B116
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911990; cv=none; b=cyuiljyBfxUkw/DD0OxijRS00KnRAahbC1a+SJcl6gjxigI+FyQf3hWU7hIteBmz7FUjB1BJR9rqRVkRvPFG59Oo6gFszOAl44S/LZjvbujGTe4pTOjmc/ZTXPCOmm7SCgyA+PygrNwD6IDMnW74d7R5cfjBuxkJMAh13VvVapw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911990; c=relaxed/simple;
	bh=WRlyi8irz52/QLRxd2/orpRSzrjOF3Qe1lSe0O6S+XM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eBFtc+obL5/Twrfb/IwMr8swvY4uhwzgdg6gZPyMsXnOei7iz7qwbf+n4PZZ3USCi+7f3vNDJEM+7dlTfwnQki+WHl3quTYSbYZAf5cyNKBw3IxA1bBX7x01DpsBkhTAw8gk+jZ7SXLG3z8fGDJbkBvokA2ugzPnmUbDNFh5+nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7ec6685adabso1599679a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787911984; x=1788516784;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LCt6G3/boVboOzHwMXqtHY4o7nAHvC7TrV17dd3FiIU=;
        b=d5AdqVCPyRqoRQrhaMZcoVcDj/fyts9yCTrUJdYVKuzXC5cdZIhzjkZeNGzzP0uuPD
         xH44ht3+BDaBGHLjfW81k9uA1yeYwxytdvH07XtN07+BshnZHS535qdDIPJOPbfIOMss
         BERaLcBF+9KjLlVKbe/nc3zN/SOWyXVKQ35uLqKCATaf44i7LTDg1HgH5WhEWtuxxYGq
         bfGE2DhGLg7wPuaw3E0D8+3+UT5821qlxiFxZ3iyTv5QU8qtdtY/+zbQNis7PnpSnnii
         ZOj5i0TYV1aEylXCtRmPTZapO9ugpaPpvtvmsY15Dv2v7GC04nYhg+leVMDnSbboWszK
         9UBA==
X-Forwarded-Encrypted: i=1; AHgh+RopE9m6bTNmmsnbwS2vUfbL9gNeLR0I0MmTQ5oO3+4h6SWbuLJEKMdcQxJS4r+o0n7lPEqkVpvjreVyyg4=@vger.kernel.org
X-Gm-Message-State: AFuF++k8Zu7ER4w+55RFPGmhBfs3cDdMgNcraFBP3FbsLzcFzQ+GAbjd
	cxbxUVitf+26R+12msM4/6x6J1ky24Oi19EmeYEQC4iYpTptVNA4/uimSzj/EHBSBuDuimT8haH
	UVF1PgxqPhiMHZMuMj9IH9X/et7udVagerQbxy9HOjTAGXT0NXmkgeG0xFT0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c2d2:10b0:6b1:7ee7:8ea9 with SMTP id
 006d021491bc7-6b1c67c39c7mr3838966eaf.31.1787911984600; Fri, 28 Aug 2026
 03:13:04 -0700 (PDT)
Date: Fri, 28 Aug 2026 03:13:04 -0700
In-Reply-To: <20260828092541.236885-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a915f30.1d9ded08.62e62.00e8.GAE@google.com>
Subject: Re: [syzbot] general protection fault in _wait_barrier
From: syzbot <syzbot+3fe892ea5fc292e1353f@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+3fe892ea5fc292e1353f@syzkaller.appspotmail.com
Tested-by: syzbot+3fe892ea5fc292e1353f@syzkaller.appspotmail.com

Tested on:

commit:         818bebeb drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=163b7625580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=3fe892ea5fc292e1353f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10937625580000

Note: testing is done by a robot and is best-effort only.
