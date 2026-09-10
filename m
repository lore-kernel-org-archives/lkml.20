Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68889583ABD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069577; cv=none; b=DUDB/fRs6GKBLLiDjq9vWtLUvqtjAbNLJlC/NYWXays6k72U2ufdzU1rFJHWQdXZiH/Fleh6v3SUrUi1J3WNuYFMboAWTxmDaYkL1fCVR+KNZzBZ8dW9G9kqy7GJhpK29FFrbzLOapX0YLCW5W7JHJoWn/z990YR1aAPx7dbX/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069577; c=relaxed/simple;
	bh=SOc/V947bqgPfUt+7TNkBZnano1Ny2EIvdcRrWgekSI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZOweKhEg3hPp7NmYV1U8QpsXHHe+vLvV5/yP/67VFr2kLjqii9SZWR+RVSm7/3TRzVxlVxvnzoN+6XhBeyN95A3uaneEoeu3ma/arLwoPH3xX1zpqtt149IGzouDr9JLdS9Ndtr3B76K0pQF6psajitxB4O/xXBYL01X0BWCbII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1c1538784so302670eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789069573; x=1789674373;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SOc/V947bqgPfUt+7TNkBZnano1Ny2EIvdcRrWgekSI=;
        b=IXAqEhUOCRzJllHvzxBjen0RITESrjnoCsA+tA+T+EIRqqYGQhD1791wJx3yz1dstq
         ojtkJ0LJYlJvflwwgK3kX8avCVuiGLU0b7TUwcjgfTwsAVjbK4VNj7zz/oT+4JxRXqIc
         AOzjPkXIU9mNO8NchfV3dN7xzoFq+Xx0CeDyG6L0X4WX35OqPwZDHc7k0i3PRkoc0bvm
         GTYJacBZT+TKqIQ8VnJnrGZipEv8qLFjDGiHNoFjPrZPAI60eSN2BOMOH32+v1F5Hvj4
         yVN4w3glhe79FGSR50HVVF1Y6Qo1POx262GehFAog/vHZqJ0976jNDLJuvzB9XgZ93s1
         6QMg==
X-Forwarded-Encrypted: i=1; AKwUvBzwDO9wdf6yAtV758AGBA3sKF96zPzSICLS1GzyJ69WsVel8MZVHpMkO9O3moMXDHOuPa60XDbn5h3QFi0=@vger.kernel.org
X-Gm-Message-State: AFuF++nHdHgMuW2i661OkmNB2HOBYdx01jznzB5uA6lnc9CdaIof5EOB
	OzQtKwDMVdh8uSzuEB8ZYsDwvcKTYlJsMZh0ddgm7JKSXn9oANwcHAWf7EcAtbHE/ldQDKHRQKe
	Q/kRti3LtOlql9F26erfkAWTemWnCfZXtWYkzzIT4aEMPDYJRXhB5kCsACSk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c8f:b0:6b3:6658:cb02 with SMTP id
 006d021491bc7-6c0bbce6b8bmr369447eaf.33.1789069573199; Thu, 10 Sep 2026
 12:46:13 -0700 (PDT)
Date: Thu, 10 Sep 2026 12:46:13 -0700
In-Reply-To: <6a2c4b8f.be3f099c.2836ae.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa30905.f2639fcc.29487d.001d.GAE@google.com>
Subject: Re: [syzbot] WARNING in update_curr_idle
From: syzbot <syzbot+e671c2192fed8645642e@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
c095741713d1 sched/fair: Fix newidle vs core-sched

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=e671c2192fed8645642e

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 11 trees can be found at
https://syzkaller.appspot.com/upstream/repos
