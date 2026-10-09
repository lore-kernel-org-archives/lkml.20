Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9CF4D0CFD
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791561964; cv=none; b=jLOg3jvI10ME24/O5REPPhaYuuFNN0oHEIB2t4lpczQRNtg3GzOIGjDNXWrCwN2EiplSgoLVkGOp+vYb5GaTKELURx2J4jjIjoOw6NGZQJhTwz/V4/L5biTE3TwXhyx6LlOS7u8cmGcGjl3BfZhytLwhAuLikRnWkVJ9/D9/2aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791561964; c=relaxed/simple;
	bh=rMOuNE5mTYqfEoN+JVlYEO0NgHk57jynmmoqgUCO6TM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kCGAUTQsvu39htPU2d78I9+UgcMOuKZW2V1+mlf18jSEH0cy1hAtqr5JXDZYNg+2HJgStFFaDljM3jq8pl4pl29NfXrx8e1nHKHjAdmk9Kzl4QiDeknxUd76iRJuQkBOmWjGB2VQCXdP/yN1vPIjfzmGUuchlNRmf0vO/fS6pWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b2f2b8d88fso10070276b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791561962; x=1792166762;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J0T9cq58B3MsxdTousRWp8aOGMplN4hrt9xACcIvtng=;
        b=1Lt+6IRlGuIsuxGLCCfmy9JnfDbU+BY0ztw0YeNlOWJ0q7KVN8dbO57kgH5vUl5Z2f
         ayeweBIUEMefpFac6LF/0EgwBjOQ2iOxMjFfgqvyVE9Fm6088/MgSVLDqrfgAfYkk8eq
         I2SgFO8Jk8V+OLSzAWZzOkkBgzAyOVe9u1yjYx6BTKO6ezvvuYuYh20uXlQ09zPAxsa/
         /RahvjVpV/aWuQJsko6S4CjlqS1KUvv+kBXblmoBqUWA7gV4XgefuRih772oev8tNoL7
         x5UXnQZM09eUufW+u32hNtiByaQmI1UhMzVlJ8hHrEVuCvKmAVazwUF40pYMStTHfEnU
         ia/A==
X-Forwarded-Encrypted: i=1; AKwUvBwtsznyKAMZSnoeVkriESkEpr6yKzeOYZyRjmYmgHiaSAUkUG1QUdkRNmqmw+tRL7cNLPBYMddnk9nqraY=@vger.kernel.org
X-Gm-Message-State: AFuF++kVvQBaVcgx7XuU/wkPa8979PM/xS2R+oQhrMnNlWtYUHRhCO23
	lppLQ/Y6Dg+I038DdqHiqBCFiz08QNbpK9bk8u8m6NN0lNnzGwUtVv+jbaRiVK0Yz0dq6RUmyL0
	k0VGFVf397NB+8KTv8ZuEeelzk+kQRyFlBqQ1E7XSQcGQI1IjhOy79tpuZuE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bc4:b0:4d6:9252:48cb with SMTP id
 5614622812f47-50c54efaed3mr2076743b6e.55.1791561961783; Fri, 09 Oct 2026
 09:06:01 -0700 (PDT)
Date: Fri, 09 Oct 2026 09:06:01 -0700
In-Reply-To: <20261009102822.249608-1-krishgulati7@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac910e9.8cdf6287.1eb53.004a.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in report_descriptor_read
From: syzbot <syzbot+bc537ca7a0efe33988eb@syzkaller.appspotmail.com>
To: krishgulati7@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+bc537ca7a0efe33988eb@syzkaller.appspotmail.com
Tested-by: syzbot+bc537ca7a0efe33988eb@syzkaller.appspotmail.com

Tested on:

commit:         bdab5605 usb: gadget: uvc: fix dangling pointers in uv..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=125dfee0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2ca5f2f2c4197664
dashboard link: https://syzkaller.appspot.com/bug?extid=bc537ca7a0efe33988eb
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15546a8e580000

Note: testing is done by a robot and is best-effort only.
