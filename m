Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00C72BD587
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788834320; cv=none; b=npu/7GtTgsmd58xBSWuas9Cb1mfHgqkMpy3tlU2UikcMsJYpElrFsjzYceXvFYjW17OC5CH/87wUsASkyJhV2FlhlDpBhT8iz6QyfG4gXz6BxLqarpx4N7OxmDZgiBirCQkNAfaTTF/PwO6JX5MXgqMQ7xkIvG8oFWQB4YW1/ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788834320; c=relaxed/simple;
	bh=iLOuf9rwYIO6ggMsR96CjWRTSEzpaISz5aF34PnMfL8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CtWmRcFQuseMsAG7muKRRBSDctOV8O2ilNodXzSYJMWxDz8UEqu/uGTY3WogCRQVnJMXL/TFOatktPcAuKYleut+whQVeZm20o5Qgqd2oMqClAz2LMOvZrO1mXGR1qaH4wUAb6IB3VPM/0NB7r+l3DCtlOf8/y+rjYyFzsDGQ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IPA0AZuv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IPA0AZuv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F36F1F00A3A;
	Tue,  8 Sep 2026 02:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788834318;
	bh=kyC6PIbuT8dlKX659Wv2R7Hm4MyHFdmpIgRaeCm0t0Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IPA0AZuv2jlRq1y4r1GyCbstGQvj1i/43ql3kFZp5AnOXOfX69Hgrr2Bo2b8RhRfo
	 hozPxnQnfO2D65PE8odXXjG8zu/XhnUjjA3gtr5plBy+QJZvL24L7Jg+2sgCKezZvU
	 U1PIitXd6oQNaU2FcYZnDxU/PsgovGsg7HQpWavI=
Date: Mon, 7 Sep 2026 19:25:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: syzbot <syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com>
Cc: jannh@google.com, liam@infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, ljs@kernel.org, pfalcato@suse.de,
 syzkaller-bugs@googlegroups.com, vbabka@kernel.org
Subject: Re: [syzbot] [mm?] WARNING in vma_add_pgoff
Message-Id: <20260907192517.564ea15aa8c9d47669b3a81f@linux-foundation.org>
In-Reply-To: <6a9f6315.6e6c5f9e.28f11f.0002.GAE@google.com>
References: <6a9f6315.6e6c5f9e.28f11f.0002.GAE@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 07 Sep 2026 18:21:25 -0700 syzbot <syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com> wrote:

> syzbot found the following issue on:
> 
> HEAD commit:    5445d6419962 arm64: Don't read GMID_EL1 when MTE is disabled
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=1517ecf9580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=56ed23170c168d4c
> dashboard link: https://syzkaller.appspot.com/bug?extid=c6879dc677a017f0a21b
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=147ad125580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=127ad125580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/e8b70e3bd109/disk-5445d641.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/e5227e56ac93/vmlinux-5445d641.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/54905f78be59/Image-5445d641.gz.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> WARNING: mm/vma.h:277 at assert_sane_pgoff mm/vma.h:277 [inline], CPU#1: syz.0.17/4912
> WARNING: mm/vma.h:277 at vma_set_pgoff mm/vma.h:283 [inline], CPU#1: syz.0.17/4912
> WARNING: mm/vma.h:277 at vma_add_pgoff+0x50c/0x700 mm/vma.h:314, CPU#1: syz.0.17/4912

Thinking Lorenzo already fixed this.

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 35b0fb391b0df57383bc15985bb769f4555c97ba

