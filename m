Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE394078C2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789586662; cv=none; b=qfAQy66oSPhArC1qDePBwSzuRSr2zLz4JkfdHq+/P7EFPlQueLWos1UZT4pWDxLqE9GIFXabGMQt2uFVfh4WjyAKjuP4ia8U7JK9ANBB8TaWO2zqVTZcpVe9/L2cPPEwKbjEoBnfZ4Nj7Ud7WZPFlgZlkQ77bfXJLi7SHKPk0Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789586662; c=relaxed/simple;
	bh=T8e4qFcoWW/dNathKMvtjSc8MmQ0SvJgeeAGEMDyUMQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EorB6PJNnb0X4+nxNgxDhkD4MORZ1wlLJZFYAv9FFIkT233oiJeiiT9Ejy1XmBs6I+l1PrfvJzTqSrPLbryzvGq92VJK/q9W8/2AlvJFQY70+rQ887CgBfsvl9j5Z20YJLCuAirMYfzTnk21QrMBGVcS9oQD6KdUEZZ+0S9jVhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c5a1a0b54eso214479b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789586646; x=1790191446;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gGav+E6NmhUVSh9XUjVdcV/Auw85chnTv3eOmsCDzNk=;
        b=yMuovW5UTh3XyIM2DprIs2T1xJl7afRSAN5WMEkYIATZbmieqIkUJ0JCjbsYr9jgcp
         jBYbr9Csll1XHaM4c6AfTCaQeEKyhZ34x0k5tF4nvV/W1EoUPgAOSdrkVy/kmpPxE0SN
         lIZCQxtq5i97u2OpRl43wlVq5y98yrg43LcFm+aYYLmkE3Vt/7WKeQwhJnz37H1BfSOp
         h+bn9P5yBEejRxpCnD3ZOz2idTbxwyWUC0tn4kx5+LWQTXQqd7YuxTKvQW4j9oaxHZv4
         Kz+82md1Xvsk8x5WEz2FO/Im4e0yUiTTgq2WHBzNRNR7sS12LDsNbMd63oCYDzpyvJ+I
         1z8w==
X-Forwarded-Encrypted: i=1; AKwUvBw2heU7nI/qyY8vky6xSuFaZboftycASdhcXZMMi3OC0Y2n1tF6th18610xGTvvh96porXP7c/48kvYmZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++m1ee+vVkbfVIlzn5oQDVibYSzhWShFHHpEwMlyVcHHF0rH9NzT
	xODTjtO2UnZgEGVHisuTR3UT7WSIERHpwaavPIHyLmmkcdc2Y9TaYb2U7ZwtDK5uCYMcIjQH10r
	+6WbRgbp0Gqc219gUhPMwNjBo/+Ujcvk2ygR9hcqGwXhIolop0953X8C5Ras=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a24:b0:4c3:7695:d30 with SMTP id
 5614622812f47-4ca4a1dc406mr4599160b6e.14.1789586646123; Wed, 16 Sep 2026
 12:24:06 -0700 (PDT)
Date: Wed, 16 Sep 2026 12:24:06 -0700
In-Reply-To: <aqrZMReaQPG0M9oV@gremlin>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaaecd6.4e05fbd6.392abc.0003.GAE@google.com>
Subject: Re: [syzbot] [kvm?] BUG: sleeping function called from invalid
 context in kvm_mmu_notifier_invalidate_range_start
From: syzbot <syzbot+c3178b6b512446632bac@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, bigeasy@linutronix.de, dwmw2@infradead.org, 
	dwmw@amazon.co.uk, kvm@vger.kernel.org, liam.howlett@oracle.com, 
	liam@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-rt-devel@lists.linux.dev, ljs@kernel.org, lkp@intel.com, 
	llvm@lists.linux.dev, lorenzo.stoakes@oracle.com, me@brighamcampbell.com, 
	mhocko@suse.com, nogikh@google.com, oe-kbuild-all@lists.linux.dev, 
	pbonzini@redhat.com, rientjes@google.com, rppt@kernel.org, seanjc@google.com, 
	shaikhkamal2012@gmail.com, shakeel.butt@linux.dev, skhan@linuxfoundation.org, 
	surenb@google.com, syzkaller-bugs@googlegroups.com, vbabka@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 7



Tested on:

commit:         9b87fdc9 Merge tag 'sched_ext-for-7.3-rc3-fixes' of gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=c3178b6b512446632bac
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15a16bf9580000

