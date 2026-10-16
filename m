Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8AB2773D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148767; cv=none; b=Efco6PJ/QJvuxDTeyvyTRrzyt+9X0IORiGKfvbbsnP5+GwVfBvyaBw22/6zpGR0TSzSLjddMzzdz+9SlpYcOHYFAn5/hdDRvVBUQeUMOBT9ExGZIAFPTOJoJr+oC160LLyz/MydbFUexcX2u2cynLfAaZr7zylbyeAR4yjNtirE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148767; c=relaxed/simple;
	bh=6zx6ebPiSKu4bZOxZfdyAj1xiUtwRz/HddTsbnQwnDQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=F6xKoXUc5FZ0MWdLN1ul4CaZjTbfsAXgRzNL3rZnUZSlBxKxy+6S7kBz9/WnGqRCaNPrWws0CegArhUVDnS05cqxvKTEyFnIcDLhpM1RGX1E3aRXpotL4mZUViXA4TUZFe9GQjAF3K+71Pv4ncTD9qJ8a3nmEC60d5NpOATUG8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ea2c058e67so3406433b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792148764; x=1792753564;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XbqljobtPvXwxM+4jMBYTZJW1Lk51MQBZHu71314vx8=;
        b=NvHudzgEsc0v4zEm+wlRDnQ89wFUXUWwennn6ZwDuipm4fQFo8UbCykAcABgk8fgR3
         NOfulAix0QjSySps/mf2xGIL6Klehqhm4orKQE45UXNbT+kZOjdkDySC9MV+SVFPOv9z
         sVaS1kyY1liBvBHk/hcmWX8KnTD3Q6AKnG63p6aJUSa1UBXSnKy3LDCAOE28WOlK7fXk
         qjLdg8bA9Rb1oHbHJQf/+pLj4me7LlVe2/htlcJqnBY/yF7bqGNGlSkO12GzqBePiDQA
         bFKZJZG1J/rxjM+GEes3O/bOEWt2N0UuidTechdRzXx3BbdZ23s8BX3bO677Iw7H5dko
         9UjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwY3ucBjdaT/asz+/t0lr6bAbfyBeiJ/kr8W7luGiGgOOGXvrwiFYzn+mPNfwzMldYqlVv2dJFW0evPRvI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh8LUVCG8XWR/ydmsOiYM+JD25uv5S9Y3Wf943LoyDFmKONG7T
	D0Cmg/bGE7nnJzOl9LTVfS7jT4zeREUgBbBtB3IcuzgBLYdKfTKWx4x4IbK+mqaVDE51DLjz+pl
	FiyIkS5EfhokBW1cAo6HyrobqgtMf576YmAyStyaCwqAwVoS12pzt1KLqcr4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:199f:b0:4c4:8ace:cce8 with SMTP id
 5614622812f47-50c4245dcc9mr23519533b6e.8.1792148763856; Fri, 16 Oct 2026
 04:06:03 -0700 (PDT)
Date: Fri, 16 Oct 2026 04:06:03 -0700
In-Reply-To: <ce2adcac-9f9c-4b38-8551-39d380cfa7fd@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad2051b.7514cce4.1ece07.014d.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in roccat_disconnect
From: syzbot <syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
SYZFAIL: failed to recv rpc

SYZFAIL: failed to recv rpc
fd=3 want=4 recv=0 n=0 (errno 9: Bad file descriptor)
execution of simple program fails: call 0 failed with errno 998


Tested on:

commit:         b0a42af4 HID: roccat: fix device access in roccat_rele..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-7.4/roccat
console output: https://syzkaller.appspot.com/x/log.txt?x=16d5f701580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bb0b3468a2190916
dashboard link: https://syzkaller.appspot.com/bug?extid=c492a9e154f81127551f
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14bd0121580000

