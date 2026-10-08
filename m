Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B2622157B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488842; cv=none; b=A8ZsFjSXzNZWnq53nvRG+ZpXtoyDss7hEzycZe/uzQC5tjvGPF7FBlA5iP4ypYV0FETcs4UCpZxfrRYs0SPXBl7psyI0KQ7+R3BFbZknVblWVxbNWpi3+twmyhmf5kM0YlkbQxvxpPpd0PlM6YIlZGm+qLPCvK68ARPHDNTsOrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488842; c=relaxed/simple;
	bh=SOc/V947bqgPfUt+7TNkBZnano1Ny2EIvdcRrWgekSI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jFgGe0Vzf2PdkhTmujYu007rmWdsfl5bcblqv6/MdG4AlZdAsNCPTYEehElHHOcStELu3Zcg+sae6/M2lrGfbG2aWWQNae8zqAh1VzFEM0FMDI4Hq4NEPtGpifJmXgs8kJP/HW91pQjlT1jWv6IWiivZ6NVmmAsjK64NdzR5isY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28deb7ee3so8351485b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488840; x=1792093640;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SOc/V947bqgPfUt+7TNkBZnano1Ny2EIvdcRrWgekSI=;
        b=IoAkgoldHCnZjJeRfJOuGqkgJRsyL+fw9GcjItbVbsPk+A/2raom9nEo9B7ibTniFl
         sSxVSqky64qj6qyiRGAwMj5DqzQ/XvhV5sIJ1V4mNzN4s/C20EeWERnkyxzE/fcF/GTb
         1q0gKhhmF4iqDULw2YUvhU2l6RQp4gH06CVkpSeQLD2nLDslSjmb94MfDjPhqYLBKI32
         gagkmooY71vnSJKRnSX5QuyKnv1F3iDcQLT2WeGTloD6f34UgZs6lR20teWQ0RDLueIq
         EzJ3CssogZpEdK2a0CXdtEfhwm2JpK59dBxLQKHEN7C1yFl8zT3tEAjo3WQWkKd7GOd7
         2y0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzT+9Ml41bVvpH6kk7Kr6iUqRehZfujachNe7uJMakDeN2qs23AHX3SwmErMtiReD7+A+13WktMRQDYJEo=@vger.kernel.org
X-Gm-Message-State: AFuF++m+5SlIUSibXmRCNk+mSXVmmbCilBpHR8enqBGhe4F1Oxd3tbKa
	LnXdQSCMni3KHardvxvyaIFadRiqfc7XGXJPmkBn+u7mIaxbmhWBL0XrZm2ABc8t9OiLT1EKQg3
	8AzLbOTsSwRY/+x2d9bMjIgYlNWY/YqJ5lFJ8Qd/iSd8yllOSsM79fQp/m2g=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6718:b0:4fa:4b2b:5869 with SMTP id
 5614622812f47-4fc45e59737mr5846445b6e.38.1791488840332; Thu, 08 Oct 2026
 12:47:20 -0700 (PDT)
Date: Thu, 08 Oct 2026 12:47:20 -0700
In-Reply-To: <6a2c4b8f.be3f099c.2836ae.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac7f348.8cdf6287.1eb53.003a.GAE@google.com>
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
