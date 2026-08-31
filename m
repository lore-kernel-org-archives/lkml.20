Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF3D3101A2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166326; cv=none; b=pS7c/h3ZWKJo3sHm6iq4F6n9AnSVhsmlaL/hv+1BWs7aGZXF2b41Vpm6rkKIALulE3pyiyatfMjZsVlxRkeXV+cg3AQM+iQP4yb3PMS+qraxrcOEn6mLKpmLJPWUvCW5kXiisZcFaAkCXNm0QdTdNwMCR/Ca38F2vJszPL9+I0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166326; c=relaxed/simple;
	bh=R8qjFK2IGqgAYpk41tTogNbOTCTQcMsUTBjFtG+rTWg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WD3O6GdNGnuHTtxPcbaaTqKAUta0yFimrkC+ZXNRwoAFJCCWsc/TZjbSDFpvRsjkSd90fKFjHiQ36qq1MYbyhObEo4KhHa7e7c0rY/eG6mN16m+nLrojJ1hOb/syjWI8WIdjoO3lc2X6woj76oR3L6ouqUxqdAWzkfy0DpymLb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28dafb8e1so4923805b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166323; x=1788771123;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oj+1tEMEH/rN4VhhjeDmj5ek7HeycIgG63Ilj+8wGbU=;
        b=W/d1qtXimCwwAR/dqrnVQUn1EhBX9+o6k2ZHBdIywBUrPZr/wlaiXIydQFNm75bmmf
         /YHbJWWRZ1wWoslKNxS53Lei1IgR7jTRlsCrS0ewcKo4cZp1QaokRK6dccLdflgubyTx
         eznsJb3HSn9bo55I0PDa84sLfWmqvM2qzzzyQx3WQdVRRa3ZnDFNMAnN7MtA7x+w4Ipb
         D1Y2IpSwJLrDCxYWBwIFsUQMBWpmQ6A2Ll5udRa6bSI8cKfbThrOppmlrk4VhObB/xu0
         kRcUaulqMLbiUFczW9lIknY/UZZCqXDX4bLf1IT8yGak4t5xmPZbhDadn5CQl1Ad1LLW
         9k5w==
X-Gm-Message-State: AFuF++mFLSTfA5cSGw+ptx8dfORrLngd/N30+l+mnr4VsSQL+c1j2a1R
	CPU1FG5cketf8XQxWdc8jK4+k2rxkFiB5Zd0kyE/Me2g2+5dZIwZQ6rR5+FhkYQUzjRpFyhbSya
	UcOIiOa0YguExQK1DPLiUn5k9NJQw6dZYs9oUnsbEwCOr7sBT6QXLzxL6nyA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14d1:b0:4b1:b83a:5878 with SMTP id
 5614622812f47-4b39824f060mr28254307b6e.14.1788166323511; Mon, 31 Aug 2026
 01:52:03 -0700 (PDT)
Date: Mon, 31 Aug 2026 01:52:03 -0700
In-Reply-To: <fa6dd7f1-5aaa-4aab-b016-3c16475cdcb0n@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9540b3.a8e469d2.cbf3.5615.GAE@google.com>
Subject: Re: [syzbot] [cgroups?] INFO: task hung in cgroup_subtree_control_write
 (2)
From: syzbot <syzbot+bb2e19a1190a556c01b1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tao1.yu@intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+bb2e19a1190a556c01b1@syzkaller.appspotmail.com
Tested-by: syzbot+bb2e19a1190a556c01b1@syzkaller.appspotmail.com

Tested on:

commit:         4b68c76c cgroup: reject controller re-enable while css..
git tree:       https://github.com/yutao-intel/linux.git fix-linux-next-cgroups
console output: https://syzkaller.appspot.com/x/log.txt?x=10236379580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=31bc85a68b5b5754
dashboard link: https://syzkaller.appspot.com/bug?extid=bb2e19a1190a556c01b1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
