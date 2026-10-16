Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648AE348C6B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185244; cv=none; b=U8ebLt9wMZeM7ozS3teIhGURIM1g3uiSKJVqbzc+yiADPppChidQTGa7vgxe7lD63UVE4ylstVLrUvq6DWdvEb+pwf3ZKQVMz5++P1zyzYkJmudyxbT2iIoy0nn/2EJmPAz7Lgc5jpovEi+Tc3BQZxlYq8EMvTQO+vVZFxsdSOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185244; c=relaxed/simple;
	bh=x8zF7ssZRk4C1LfWpKfMEKBTDGVxN0yPrxMVHWCtVP4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RWE69nj+5JpR/6S76oOsAZyts40CXH8VXZHRWxXQZY6zkeAUwsFMITB2HZwnmD6MwMgYsMt3uY6Kcm2RWOmtGbK4z3botCqfwJ3zpkdGd+794jyICej65GAFHv+eCDsuqc10QvG1bq6JZ+3XedWMknzW2uEjqyhSsOV62YL13oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b37620eb73so691065b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792185242; x=1792790042;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qYO0cPAjr2yELPdH2vaJ41E9lef0IfSfW1IbfHqxq6o=;
        b=Ur7Dc0RlgitXZNt+ekFpmO9zINAFUKT4mrOmchj5aWX5xU3EY5fhCX46eQKKV9kQYU
         VTiOEaTjFl2X9LS8swaaWAPvMV5dnfuLWlvufoYIm+604jiF60w/Pay/MLyBxLu/meZ0
         9xKngIMjBNosXQe8ZCMe+rrWSYoXjbETVseU2m3h1erH2sfWkj7VC9A7HE50HS4QTK/q
         6+6tnUgwRDNkCZG8hG4J5RTVjazLzkhygomOvT4an57cb4dIKSqKwbCV4x6VlH0Ozppj
         k9LVvCVzsUKRIVTETenrBE40glfFjiBozUQ4KRSlxoWUjbmbg2tnzOMbm2sEnlpNZl19
         6CyQ==
X-Gm-Message-State: AFq9FYITbGML08vJlWs4XjPB/YdzEmehDCFPr2xZuvuFy6um+ztdglZZ
	vy9LRXgsOK6ltxEmIv8gbBikewwukK4xwTeA+nRfNaMcjNdMqWVHZdTV9qWJEktLHwRTVc7wwiY
	6UNLZcN1Zq/+0DxEXELsYOKEqRpeIxvTWELti9BrxPBQt3QNPdXgzvCT8f20=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:159e:b0:4f5:e13:95e2 with SMTP id
 5614622812f47-53cc2aa8af8mr1091295b6e.9.1792185242354; Fri, 16 Oct 2026
 14:14:02 -0700 (PDT)
Date: Fri, 16 Oct 2026 14:14:02 -0700
In-Reply-To: <d6cdf0eebe5e351e4c4dbbbf8ffea867@inf.ufrgs.br>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad2939a.7952420f.283480.0353.GAE@google.com>
Subject: Re: [syzbot] [input?] general protection fault in input_ff_flush
From: syzbot <syzbot+788733b16e87faa63deb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, matheus.aalmeida@inf.ufrgs.br, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
general protection fault in input_ff_flush

Warning: Permanently added '10.128.1.14' (ED25519) to the list of known hosts.
[*] Reproducer for general protection fault in input_ff_flush
[+] opendir /sys/class/udc successful.
[+] closedir /sys/class/udc successful.
[+] Using UDC device: dummy_udc.2
[+] open /dev/raw-gadget successful (fd=3).
[+] USB_RAW_IOCTL_INIT successful.
[+] pthread_create ep0_loop successful.
[+] pthread_create ep_io_loop successful.
[+] USB_RAW_IOCTL_RUN successful.
[*] Waiting for Logitech G920 to enumerate and bind...
[+] Found Logitech G920 device: 0003:046D:C262.0001
[*] Starting deterministic fault injection rebind loop (1..100)...
[+] fail_n=1: bind succeeded, scanning /dev/input to trigger bug...
[*] Opened /dev/input/event4, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event4.
[*] Opened /dev/input/event3, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event3.
[*] Opened /dev/input/event2, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event2.
[*] Opened /dev/input/event1, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event1.
[*] Opened /dev/input/event0, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event0.
[+] fail_n=6: bind succeeded, scanning /dev/input to trigger bug...
[*] Opened /dev/input/event4, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event4.
[*] Opened /dev/input/event3, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event3.
[*] Opened /dev/input/event2, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event2.
[*] Opened /dev/input/event1, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event1.
[*] Opened /dev/input/event0, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event0.
[+] fail_n=7: bind succeeded, scanning /dev/input to trigger bug...
[*] Opened /dev/input/event4, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event4.
[*] Opened /dev/input/event3, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event3.
[*] Opened /dev/input/event2, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event2.
[*] Opened /dev/input/event1, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event1.
[*] Opened /dev/input/event0, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event0.
[*] Tested fail_n=10
[+] fail_n=12: bind succeeded, scanning /dev/input to trigger bug...
[*] Opened /dev/input/event4, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event4.
[*] Opened /dev/input/event3, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event3.
[*] Opened /dev/input/event2, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event2.
[*] Opened /dev/input/event1, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event1.
[*] Opened /dev/input/event0, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event0.
[*] Tested fail_n=20
[*] Tested fail_n=30
[+] fail_n=31: bind succeeded, scanning /dev/input to trigger bug...
[*] Opened /dev/input/event4, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event4.
[*] Opened /dev/input/event3, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event3.
[*] Opened /dev/input/event2, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event2.
[*] Opened /dev/input/event1, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event1.
[*] Opened /dev/input/event0, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event0.
[+] fail_n=35: bind succeeded, scanning /dev/input to trigger bug...
[*] Opened /dev/input/event3, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event3.
[*] Opened /dev/input/event2, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event2.
[*] Opened /dev/input/event1, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event1.
[*] Opened /dev/input/event0, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event0.
[+] fail_n=36: bind succeeded, scanning /dev/input to trigger bug...
[*] Opened /dev/input/event3, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event3.
[*] Opened /dev/input/event2, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event2.
[*] Opened /dev/input/event1, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event1.
[*] Opened /dev/input/event0, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event0.
[+] fail_n=37: bind succeeded, scanning /dev/input to trigger bug...
[*] Opened /dev/input/event4, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event4.
[*] Opened /dev/input/event3, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event3.
[*] Opened /dev/input/event2, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event2.
[*] Opened /dev/input/event1, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event1.
[*] Opened /dev/input/event0, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event0.
[+] fail_n=38: bind succeeded, scanning /dev/input to trigger bug...
[*] Opened /dev/input/event4, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event4.
[*] Opened /dev/input/event3, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event3.
[*] Opened /dev/input/event2, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event2.
[*] Opened /dev/input/event1, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event1.
[*] Opened /dev/input/event0, closing now (should crash if ff teardown leaked flush)...
[*] Closed /dev/input/event0.


Tested on:

commit:         70dd4ee7 Merge tag 'pinctrl-v7.3-3' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10fa313e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4b098695335c89f
dashboard link: https://syzkaller.appspot.com/bug?extid=788733b16e87faa63deb
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10df6fd1580000

