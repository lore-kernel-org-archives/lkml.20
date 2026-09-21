Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475314A68A2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002385; cv=none; b=j7eFCSIppB9FCnOzJmKRLXLx0jjxfXyIMj76nPEpMUzfsXuu0nE7NtOgNDPEHX1oXXuhkBHzLFI3b+l5dXqAkOw5GaBynrN4XbWU/djY+FqDL6FcOtIuzjApsmTGg/226v79YHOKJSQNdVGr1+f/ZAd2qwp+L/x31fQpIKp9O+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002385; c=relaxed/simple;
	bh=lphSzdexRJMJ108SXV4CpwGzuaatqzc5aFaZYR3G97c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UivKOlucEFKswwx3rrbuzj1ofrB8jouwmdEvOJqtkSwiQQixvQfdkyyaDLm7z7MFlFjHS2g/jNL92umkT9UL0pT0D4lSIedUh2RIWB230ocGEouFbuTC59nrcUb+R8hksCmm1AVAlnLaIR0dK1fqqGrjIBt7G1/lHdCbIJUi3oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c21c2859ceso2107903eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002383; x=1790607183;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PalY2J2tB7P81uddA9khVse0DBpTz57WNH+PnzkvVEs=;
        b=ci/24/qhdkK1m3If4W0EcJqYHtKBCF3jE/4+T/s6887zq3b4nZ5fu7gwmM2NYx0n6K
         EGKyay+Af+PoT0Psi8PcOW4LHjz2DL64Q66sPpJVmLgHFaPKq885tAV3J8O6FuMGYHFW
         VZQti/ST1daJ0hmo11wH1Xqkgu1dBrK126a2ntoutwJQ5wno4NWWCs6g4gFTMh60vtQR
         Fo5eqEhxhtdZI+OSTC2QvFcANnveRt3CbazxC8R8Ng0CsY7EN6VWGsz8ZuZtjdgtmRJ/
         7VxAQIYeDTxuWka8VH4S10HELeoPgoq9YvRfViXBnwdD3uttG6TIeWFcI4MWB+BxFR6Y
         f7OQ==
X-Forwarded-Encrypted: i=1; AKwUvByF0CPVALiG0ZHVIWt0R8t+csrzXpfWTtwLCQNfx4DPR5VBZyOSpncrFRfOyo4sD393TivuWgMaQgAVpf8=@vger.kernel.org
X-Gm-Message-State: AFuF++kwfwtCsrsdbEDbl3kwoCjpE5fuZ6pIThWt3+T5JmIF7N0/MXrl
	lRluptv2fTFgH1cXhztU3s4cq6YLKWfk4v6wnSGpmsj1k/6Kp34fJRCANL4H2CHaeCkknbGstCE
	mtPnxN372bhu7r88z+MBIFtwC9kEZZTLIUSWPGPUGAcuvYVGQ7qM/Z2bU5O4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:a297:10b0:6cd:3fdc:a939 with SMTP id
 006d021491bc7-6cd3fecc5afmr4678833eaf.86.1790002383241; Mon, 21 Sep 2026
 07:53:03 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:53:03 -0700
In-Reply-To: <20260921140408.3258-1-adarshdas950@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab144cf.a6af0033.177e91.0017.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
From: syzbot <syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com>
To: adarshdas950@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com
Tested-by: syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com

Tested on:

commit:         93f51579 Linux 7.3-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1138f005580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=718e346eb0b8f38
dashboard link: https://syzkaller.appspot.com/bug?extid=3db654d91b471c4d7a7d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16723525580000

Note: testing is done by a robot and is best-effort only.
