Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5CC26FA60
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787883308; cv=none; b=jvnBzeJNS8nxUik2hZFCVqSmguXZlpJRqPOKJY/LtU/OJvtic8Em33PgpQdwqjAalRf6/Pr/I1g1m5G9CXxtCLquCq4fUba5Biwcvw4CM7Pdy+YZKTTYruCrykaKmV5IHdLiN0+PqRK8eUGef6GGTU159V+g2ly2zC1f2gPqgFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787883308; c=relaxed/simple;
	bh=ipdYwpRNcYK9bpffDq6FEnVtmPfDZ89CNBFIY6IAMbI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kodpvaHxsPpMMc9P5i1x78P7ez8HcD/vKTiPEVqs6gExh0l852niKkaODm/dly01xkn+U1rtZ9Henzrq04LlF1fVXFV+350j9HIG/kACaHcHSPsTgiHBrs0FGJKHLs3iAyzjh29nOfdz1UqquPFDBUaRw2SwjW/e84zdHC64ff4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f36427abfdso400397a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787883303; x=1788488103;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ObbDGBk4b4nBa6eJPOpJn7ate8ITLZ/8pJfWPpO5IyQ=;
        b=dzyR56j+jGM6rCxktu85cPgFJfPZ715c2rBnUsvPnCgyu6qKfJiV0on5NqDtVbUD85
         yZ4Ue18h8qMnVJj8X1q2JutMnlKWqdH5jl2iiGUr3A7u7VlI3mJEZnKZX9/apJuoMllM
         VRS9PV5bDcBVttkUbFwUaOot6JXFR1Mlzj+tK2NVwHsz+z0fez1XnOTIzKfZkpG3CYxP
         zwQjfE/cm88Gbapq9pFOmMbn6yEcGYrbm14ZPMA4uRQD6kUt4bZS082qsDMAqH/8SHJ0
         US3U0X4obZGQvVt6JYyB4B9YSZPyLhl4BQgMaCJYItg+7UyWyFekYW8wwc482xapETol
         QUTw==
X-Forwarded-Encrypted: i=1; AHgh+RosXAKG7mW0OeLZ8J19ghdLMWT5wwaiGJ/fQ0FRmcBg9oGoT18i8kIh60oqf9Ul/WZ6Hr4aVyEZ7XyrsMk=@vger.kernel.org
X-Gm-Message-State: AFuF++l7TDXWo9dksjzmYfTOediNFwpHn93WLudwM9b5zXxboYFf8Z2u
	QnKZ9Tbo5QOkstcXSPmquLU/vtJyYdnI+uyC9Ug0tOZQJxuU0xy59pQqVm7RUwVICNiDw7ukf0j
	ud+KLy4ZIaskrxtIuLp8Lhsl80pGVj7jHTPxFfKpVUt63m5J8Qjgs1n345vg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e1b1:0:b0:6ae:90c3:32b6 with SMTP id
 006d021491bc7-6b1c63fdbdfmr2535918eaf.1.1787883302859; Thu, 27 Aug 2026
 19:15:02 -0700 (PDT)
Date: Thu, 27 Aug 2026 19:15:02 -0700
In-Reply-To: <20260827234547.1861-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a90ef26.27659fcc.2ceef7.0018.GAE@google.com>
Subject: Re: [syzbot] [input?] possible deadlock in tasklet_action_common (2)
From: syzbot <syzbot+b5d7ab56d43de3fd5aac@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b5d7ab56d43de3fd5aac@syzkaller.appspotmail.com
Tested-by: syzbot+b5d7ab56d43de3fd5aac@syzkaller.appspotmail.com

Tested on:

commit:         818bebeb drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15643625580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e3ca844744f0010
dashboard link: https://syzkaller.appspot.com/bug?extid=b5d7ab56d43de3fd5aac
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=126fd625580000

Note: testing is done by a robot and is best-effort only.
