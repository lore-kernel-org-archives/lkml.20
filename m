Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB48D3BB677
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 03:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790825767; cv=none; b=JN/5KpEjjJmORZwAb8qro1aDMDPpCLeeZgrBd2hUlBQaayMBPUkKEx4eUaunmZy1iliBhXG830crWs2E+M31j7kjFz4InU1+dqpR+7njG/kyJvA7p9hQmGI4qXzKC5UfQ1Bca23fIcnmIyZx5q4Z3hmkPQB9SutslSGcS4wmgFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790825767; c=relaxed/simple;
	bh=F+cE99e/IoZcBiqybvdTBRrrEvhUAZGIkEo/uvhm6uA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mJQcJgnKUlsr4FCIJgAJ9ldSVdM+A/LGRsUheOUll3U30WCphJWRNetsfr7QS1yJ7HoIba/0nX283l8XYdylPT1NuNmMocvKJdTZPEzLKRMBEsI9HcWOL/0fMGgJmwoAvU3u0I6SlnuYi1pFYQWcwTa5JGfTJ3iRolDBVe9ZNnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a41f46d629so10250810b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790825763; x=1791430563;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ArUdhkCHBvqLujlWUFMyF2icv5EZv9kWUaouQO4XIP8=;
        b=wwK5cvxEuuJLVBNNrR75u20CE+0KEBpqLqO67/gWaFBejlzW/gLuZhZ+S+04JTG4NI
         BVFYOQxNmXD9CNcULGxYubXhlLSL/mfsqUL1+wEJ1yWC5AvZOnKvEL2lAR680087rshd
         Gkp7Fo8MW2uYeb/cwhOkBsdwcuTsUusPKhJiNYvGXGt1K/y5eZVXgnmaUmfDvxIn02+7
         und1OGnZ6dD7R/pzPmI9F0umTAfpcvVPz6EHmL2n7FFG2ifSueDY5TBOqL9q7CNSX+73
         j3+dZ0/aBuyM3a18oQU1WfcR4l5RJDFWFFzP3RfhZrArmxK55IOnH3SC76V9W3yZRq5G
         /58Q==
X-Forwarded-Encrypted: i=1; AKwUvBwsl40EKLCmRj0Q6c01aY9n40oTWvX4iN0kZgAql7ZSQWYJJ6MSDyDBdpVhIBUza+akuwW5scda70t5pTg=@vger.kernel.org
X-Gm-Message-State: AFuF++n/vuCuVcqgzTvlARxP6Ah3SbO+PvkLc9hsC7moXZ/0NT8+xHUM
	pRrSetH1tyRZ3UTvPGa9gvAglvNFZub5ZCnZgXGGRERU8+sPmjlOi/ByHDO0fGqQXYS/uoyl/I9
	Utkgd8pg9yQuc8sCSg0E8ZDW1WikSn5Fcch6FZ16hWmBZnxwvGpK80vafuEc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:221c:b0:4c3:4e34:c69e with SMTP id
 5614622812f47-4f1b2e33ccbmr4286287b6e.8.1790825762867; Wed, 30 Sep 2026
 20:36:02 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:36:02 -0700
In-Reply-To: <6abd40af.fac9d4e5.17396.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abdd522.f32479dd.202a09.0001.GAE@google.com>
Subject: Re: [syzbot] [openvswitch?] WARNING in set_ipv6_addr
From: syzbot <syzbot+4cc63fcfb3845e149969@syzkaller.appspotmail.com>
To: Dai.Ngo@oracle.com, aconole@redhat.com, anna@kernel.org, 
	chuck.lever@oracle.com, davem@davemloft.net, dev@openvswitch.org, 
	donald.hunter@gmail.com, echaudro@redhat.com, edumazet@google.com, 
	fmancera@suse.de, horms@kernel.org, i.maximets@ovn.org, jlayton@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	neil@brown.name, netdev@vger.kernel.org, okorniev@redhat.com, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com, tom@talpey.com, 
	trondmy@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit af81cb247ca94e4bcfea31ea862cf3aaf955a503
Author: Jeff Layton <jlayton@kernel.org>
Date:   Wed Mar 25 14:40:28 2026 +0000

    sunrpc: add a generic netlink family for cache upcalls

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=120ae3f5580000
start commit:   47a144672573 Merge branch 'mptcp-misc-improvements-for-v7-4'
git tree:       net-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=110ae3f5580000
console output: https://syzkaller.appspot.com/x/log.txt?x=160ae3f5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=88147dd7e4cb6a0f
dashboard link: https://syzkaller.appspot.com/bug?extid=4cc63fcfb3845e149969
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12c35e05580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11908035580000

Reported-by: syzbot+4cc63fcfb3845e149969@syzkaller.appspotmail.com
Fixes: af81cb247ca9 ("sunrpc: add a generic netlink family for cache upcalls")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
