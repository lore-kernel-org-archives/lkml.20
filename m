Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F2B51AEF1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907026; cv=none; b=l7MVagBH3V3lTeoOxmGkNkt3DW7DO1lXphX5o0AcbZ26N3BLQtMLLhPVL4aie02u82oBedFT+YW9KFtqwDRDVgWb5bn1JoZCeaaNBHJFaU0ugr5S9GO4sau7K1SnMLDO5wpNf4G4ZFx9wQ6O/uhy/URI73SuD1ttoOThnSW7RAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907026; c=relaxed/simple;
	bh=MnswUPZ0VQSjA/l20kQNmqe7pQbiGD3aNvzl4PUEOV0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pq8qpHcIn0zm57kfs2JZO3AEIarlM7h0/fiiZ+70Q96zlApMPCnGPJaeWp9FbYI7rICSA4lB9EoaBxfAa+gFAreCJbHlrUVJfz8Wmv4+6/NexKQWWLiVTVzP07GNqG3D9B29M4cB4JHbp7TKAulxRGWVA8Ffo7bjN6m6s/jA2yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4e778acdbc6so5420150b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791907024; x=1792511824;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qWDulPA+RjVWRkoBuQohrpzz5Ilcc8Qj/ziaMykwjT0=;
        b=0eBFb2XHyIntvwdQoh8wavOXVjLjXW17UcnP+tREbpiiDTdwCE8/c27YJ/CpoTror8
         U1jbn5Al9LS5rfYzZxplqNbSNoV3fyX5Zvy7VtrwX9k/rzlDCiqENLkOxHC3+M7G5U33
         +aSmcr8o3LVEdi2981IKsSbY/IvDSzIVGUJmIuTWaQ71Iipe4ha3LUUKw9BqUMnq+/I8
         C+nUOGbFO3mAX4JqTibyhcQ+9M6ogNc4JDeK7NwQZSTyQzPmN9kkuABQqWAApbR7HUyO
         O3X39Gmw5IsudZUof+VmylGdADAIv22ZZvKns5wBmO1GGuLs+4UiMK6LYmIWcJW3FAcS
         aK5w==
X-Gm-Message-State: AFq9FYIkhcxxrMF5ogXqm+ONDosS7Cw4WDH34QHKa4wyXbn4g5citIUs
	vpJreBjNsXN+ghh8Ghz3B1z3WMGPvy5spRoovFZMqaEw5Y9JUGBzggJxkKWuj3FYpJK1/VkEIRB
	eUSvOrKpMkavkGmMMg7Q1Bg3RTe318CrCJRMbD4TcQXLVAcfL23FrKkqt4JI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:182a:b0:4cb:f21c:a79f with SMTP id
 5614622812f47-50c516defcbmr14319865b6e.39.1791907023745; Tue, 13 Oct 2026
 08:57:03 -0700 (PDT)
Date: Tue, 13 Oct 2026 08:57:03 -0700
In-Reply-To: <CAEfrx+AF-unHJQ8mkPm9usZRSJMmNYY3VSRZzMPz0NJ-HjafZA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ace54cf.5f317f00.247b6.000e.GAE@google.com>
Subject: Re: [syzbot] [wireless?] INFO: rcu detected stall in rfkill_fop_release
From: syzbot <syzbot+baad8fdbfa4129f93db6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, spannme41@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

init/main.c:14:2: error: ASDF


Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=859f36d9ccbeaa3e
dashboard link: https://syzkaller.appspot.com/bug?extid=baad8fdbfa4129f93db6
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17ab467f980000

