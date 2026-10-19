Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5271341057
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398245; cv=none; b=N14b6eKySLABtskdbcbgLHqskdCqgbvgALgvEgWabYriRHH/5UAAkYdvJ5D2HcZIeMzKKzuzFiZYVWjzxoAr+IDq48j2Nud1vYQB/NxbtSlQWEesS4foD87FuhSG7JtZrOpM0OD3CY2uJlJVGZ9dX5dfvKID+Ifp807Xb+E0ff8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398245; c=relaxed/simple;
	bh=WFLnp0hPlVy3erezBuIX5aX46rRbltxXyYIbUBfqLQ4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=S76EX69AdlrJb5Es9BuHQMsgD9RdD97Pch73ZjoQylh3QjRQOTCkJTB1HdawqdILTIsPeBLVV9etAfV7PRBvqoTJE0lp+tJ9NToPdjP6VIYyLmt3yfq4bKbq3CF0Y7fd4NaQc93tuj2rVcxao/460XMkQmry2FXZeVi6DJGIpEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4f8281066c4so2639140b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398242; x=1793003042;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R/ah/To1CIdpGARcS+q7GPLb811GQpXoClQOeYRwNKY=;
        b=NUsICfcXa+ikJYDYVNzio9z9MBLnpI3WhVasjGGsvSzW2MTpkrUo3Jp3cDvyra3vmR
         PcNQ/IJilOkq6kgK0XwxL8L7o7+8r8Oy21z+eT780EpDu72VydoNqg1McgyYsvGb7OaM
         xzbFcrPjLJ1y2Dp6LK7aewbie7c038AB7MMZUOaFO3SQZLGZJhnEyzgB45mbRx7B/02x
         9h9pi3nc+FT69laCWLHwGB/BElwu13VJphK3RuIsADOkOts6Zr917MtUAbAQun3qmDTc
         AZiGxe3rjH+O0qEr4YOiDnSPxO4mAANVGcNNWPdykSLkaQFdiQIhhifZhkcs9gPvKqI6
         CcAg==
X-Forwarded-Encrypted: i=1; AKwUvBxownDltpA1NfEgOnXIY0hcvgvNmXtwxgrnaFILCzaY+dRwOjEggAiZ4al61xQHWpNfm85tblqUxcnNqqY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGWch6OyFrZoU3yHKu2MFSkZczwU1HPIiPM/NmS5TFBXU69eTl
	ensR8p1mJxh7n7xYKkbFGiRFakQ7HpeJzNUTXBMKebnrhvrkAq13vJBMZyW4dZ8cSpHeR3VQRDt
	ttL/8uK1WCVpBHkV4SKTQVRutvp+vQ5HabMvF8EgVbPxUyVuUxZkKnvUJ/Lo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3a19:b0:4f4:550a:3a86 with SMTP id
 5614622812f47-53cd6a9fabemr5067101b6e.53.1792398242641; Mon, 19 Oct 2026
 01:24:02 -0700 (PDT)
Date: Mon, 19 Oct 2026 01:24:02 -0700
In-Reply-To: <20261019080458.821-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad5d3a2.6814cce4.34c49f.018a.GAE@google.com>
Subject: Re: [syzbot] [rdma?] possible deadlock in rds_trans_get_preferred
From: syzbot <syzbot+ccdb5058c3df2d94811c@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ccdb5058c3df2d94811c@syzkaller.appspotmail.com
Tested-by: syzbot+ccdb5058c3df2d94811c@syzkaller.appspotmail.com

Tested on:

commit:         70dd4ee7 Merge tag 'pinctrl-v7.3-3' of git://git.kerne..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1618693e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=44ac479246d4559b
dashboard link: https://syzkaller.appspot.com/bug?extid=ccdb5058c3df2d94811c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=150f4895580000

Note: testing is done by a robot and is best-effort only.
