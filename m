Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A275355A3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189573; cv=none; b=gbwXO6JlHzxn2diN11vsC8ZKqMPQHltW0J7qc/ApR1PI6MIVqRa67GqmTC7azx7QDMzro9eIs6qaCMH1cuccbpKcSD4UmzqZOZY+nfq+vfLpmkiMbo5Pa2Pqyi/Ma7klrpSJ++35v88HoUeYfwIjvP3fgqXjyyezZvdkHTe+X3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189573; c=relaxed/simple;
	bh=Frm43ufNh8qqB/Bw6xfF1sMT8C8/aL6tF6RXXphvCaI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qe3ArDCYtQla1GCAYDvd1uo3DmZ6bUE0u31+ynqkWTbt4SQQrS8fYBKyTS02hDlxu4Y5+8HGwntCvmqpX6JqBobpHf43HtkSB9IgNUUPTcjB1gtXyMcEqkAgf7a2XOPqI4hapgCnuTpKnK1GxVXCfP9C3cnreWxaXGE3NeUYKyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9ee20bde0so5344514a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189571; x=1788794371;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Frm43ufNh8qqB/Bw6xfF1sMT8C8/aL6tF6RXXphvCaI=;
        b=QHp7vJLD6St5T495GCr5vFlOjqC5CqqO/MAd0EYFpQIzhCAr0Dm0dLhpOkwweLEy8M
         dtvUwnbNb0A+pE1naYpt50e+769cjfa5tQ6/pqoOmTl0c281MO57xscP7CbMoOkBmskQ
         R55Y8jq5miJvR1bCogZMgviEUbOxSZj19/4uXfMRGO79NbBJ3JuRHivSzXv07UTvxzHD
         eWZhlJ+nr8G5aK9ziDDsmmdGUJ995tbQzYYwR40P3JvyxUGLEo0DDACPcmv1UPJpnmlB
         jP95AXtNnshz2oEdB8PKjSXdX/uJVJQ83iNDQ0eCVsvE6glytAH2TbtSOHfpLboP5Rt1
         c7rw==
X-Forwarded-Encrypted: i=1; AHgh+RpvvvYAu5KjBuhe//L6KVPS/drZUqlYhzhhsLfie8cz3zc0uXOynpLWR8XliSYSkiL+qC+7zj4sok8ciM0=@vger.kernel.org
X-Gm-Message-State: AFuF++lngipNmSH+Mx+p3CL3hXN3yvOZJV6+YOCei7DlpG31eLnA6LdG
	7ZCsMCXJX2PqBy440h23UhcHBha1gWR419mTCigXI9PYTMjEJiM7x2MPGiGFHu4iN6p6Rz9k7zb
	Fau/dTnBtvRl4VN+gI4Jn6An+SIrhanRUTkU1JE1GGoydwQb415u+f02bIpo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:60e:b0:6b1:b867:1a1 with SMTP id
 006d021491bc7-6b372d5c4dbmr1423741eaf.12.1788189571050; Mon, 31 Aug 2026
 08:19:31 -0700 (PDT)
Date: Mon, 31 Aug 2026 08:19:31 -0700
In-Reply-To: <00000000000034ae0f05e9f94c79@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a959b83.04428c52.29b18.0000.GAE@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in jfs_lazycommit
From: syzbot <syzbot+885a4f3281b8d99c48d8@syzkaller.appspotmail.com>
To: dave.kleikamp@oracle.com, jfs-discussion@lists.sourceforge.net, 
	kapoorarnav43@gmail.com, linux-kernel@vger.kernel.org, qianqiang.liu@163.com, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com, tristmd@gmail.com
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
From 7e1a0b91e9efa8bec40fc5397ba6c4e683d72df0 Mon Sep 17 00:00:00 2001

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=885a4f3281b8d99c48d8

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
