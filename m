Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4733AE6E5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789635; cv=none; b=NXGywYW4UFZlQGYSLxp6nwGBBrpz0NSzpNxY+NFCHoZF7frMGk9jCEuXozq5trwRIBKTdJ2wZGf0xDymIPlsvJMNULt1b7tQt2ekWMVqSt3VJnUfYS3TH0bcIRdCwfhBpmlnewunzl5mOhCmNA4vsJlE0WoZYyC+NeU/BEkdQIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789635; c=relaxed/simple;
	bh=zyQn5w9QkO+fyQFG+fHkXsQXfomKQc8tYhi8uC3G+bM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=b7raXs+WdfULiLHRKf1s8pP9g9RwroKQUXI4tOAyw8B6BYx+b9gublwyY5i2f0GPBwO8p8a1LKIEmnHVy3hJ+B4LtltShXLBelPMb9kXBVETk8/Wzexqr3A9u810iP0KaZTaX0UGZNgFbeEv04VKKd/4PqJg+1StfqWDjY30bUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28deb7ee3so3196731b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789632; x=1792394432;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zyQn5w9QkO+fyQFG+fHkXsQXfomKQc8tYhi8uC3G+bM=;
        b=W+LkRKzT2s34iNBOB/RiCkYS/eGYgrLM1yjwVCEEIYdR8wQ241jR+IAD7GdY5Q5omQ
         LvVScAOjRmNVMPNYZuhx56eE9aY/rewpyr7oY81fF09AgbNkD+g8OoY4Ssi/p/7EJwwE
         SGFd6h2xGMb8TiJYrZoPsPN3QguK6Pjn5RnWgwklAbphB0VKG0jyv/UzMr8OnuroOObR
         CePneHmsxAgtMtbVcAXq7mAY+/5jIROl3pCvECiyvNsIBMbgTxHMY8UAJEfs3inpqlTG
         jW9xII1NVzqCYPQHya/VZp4C0sw7qE6ecA7OVlKhBp0ihnuD7uBjNChRxlw5Zr5qAS90
         CMCA==
X-Gm-Message-State: AFq9FYK9WNUhSzm38aPIWubW0Rs8K4eYuphLbe8yO6NFYXj9cWR0hID7
	vsylDHHdXClVC8E0j8CKMQ6SEJZLssQVAyQ2fl5WjiFT8xGCi1v4NIqU1kFDWAJdPrIosNS+B2i
	cdlbgbWQ0nIqZjqvpeknVIMt8yEjwpmWPtqU3ZPU5JsD71X1tUMdux9GVXzM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:ecb:b0:4ea:4207:39a0 with SMTP id
 5614622812f47-50c5416ab1cmr7434291b6e.47.1791789632345; Mon, 12 Oct 2026
 00:20:32 -0700 (PDT)
Date: Mon, 12 Oct 2026 00:20:32 -0700
In-Reply-To: <6a84384d.ae6ddae5.3da009.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acc8a40.8cdf6287.1eb53.0116.GAE@google.com>
Subject: Forwarded: [syzbot test] mac802154: Cancel scan work synchronously
 during hardware teardown
From: syzbot <syzbot+19cbce4cc656ecd4febc@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [syzbot test] mac802154: Cancel scan work synchronously during hardware teardown
Author: aryanarora.w1@gmail.com

#syz test
