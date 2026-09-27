Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DFE25FA29
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790525944; cv=none; b=K05jAhibnaQlHPx/l+GJ/DSGuCo6wF80NB6BnD49CJIiyWuv1YxqNLY1CfV5gfDCprc7ImXq0E6npRIyh40y2kINYmGldPy++zz4U3HK4f29l/0quddoNVs2xi//G1otjEWkg0szcIpN62OufYe8FeQD1ZIRGvHdqmmpgGAjMNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790525944; c=relaxed/simple;
	bh=o0lEc60CUbXKEtgGuT8robKw/kGZIDhUTlNiHDYChV0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=b6RXsrcRE/j504qYprSfIjOoW6D2ts4IIP++sqT0Wi/jrpFe02a7V+tPXyx5EQ9i+/HCAkdSUGTi7uE91wU3vF4EjhuHMBeYGICXIpT2MHVXrrAzcoD0DS4Dy8keb0Y+HpbS8RZoDpoJyz2X4c3KlA6ULbwFvTjpMsmZU4h0k9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-816cd7b7838so2873784a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790525941; x=1791130741;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0Qdfdl0dC8XqQggSPSjV/kHaU0k8TH2th4nsYdsFtt8=;
        b=1DsSBqoP3XvQQ1260WNe633zaCEEki/95nO6pGsSdO9D6oS0nuSfqgfXYAp/twSRlJ
         zx2W6nJIzgCPeQBGV/UdtmrNhNFgqhiWPoLIRWjFz/OwbdU3h2kS712RHrRlErg4Go5k
         69g5hfots6/w4xz5xu34yrplIbbNkXPpTKTK4kSnMHOOzKIt0FUmk/0RryHm/WdODEIZ
         JndnonvwEW7bRQ8YTds1DyduFOKrwU897ZpZhYCmmk37kk3IeMaeVPQAVQ1RhQhi07m0
         yOP5KpgnQB5Jf0hgOGw48KeMrQsGuZX2/BtMXNXa9HSA3dADE3a6US9zNrlArdOkew/1
         F5/w==
X-Gm-Message-State: AFuF++nY3fCgTdCv+u6wjZR1TsRsGWyQgJp+mTuY+UcHDvo0TWo8uajW
	6uRVKfS9y4RlUKNPtdfHAYmmcyHMYWOkJ4sSChAvwTS23H9c/OwI8GQ+w1/l9tEYMg2AUKDX9Ca
	km4fJeoeTeC/WT/CcKgOekkOvLQGQZZvgpo4nPXI0i60tZEvJfUtQAbt+U08=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4985:b0:4e5:a74e:d6c0 with SMTP id
 5614622812f47-4e5a74ed8cdmr3078670b6e.64.1790525941583; Sun, 27 Sep 2026
 09:19:01 -0700 (PDT)
Date: Sun, 27 Sep 2026 09:19:01 -0700
In-Reply-To: <20260927152009.7338-1-nsvatoslav515@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab941f5.80e1c6cc.1e8e5f.0060.GAE@google.com>
Subject: Re: [syzbot] [media?] WARNING: held lock freed in device_release_driver_internal
From: syzbot <syzbot+ed3ed4f52d1fb6a7367d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nsvatoslav515@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ed3ed4f52d1fb6a7367d@syzkaller.appspotmail.com
Tested-by: syzbot+ed3ed4f52d1fb6a7367d@syzkaller.appspotmail.com

Tested on:

commit:         fe2ec837 Merge tag 'hid-for-linus-2026092202' of git:/..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1166d315580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d4242cb1c54cdf7
dashboard link: https://syzkaller.appspot.com/bug?extid=ed3ed4f52d1fb6a7367d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11ecd315580000

Note: testing is done by a robot and is best-effort only.
