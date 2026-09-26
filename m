Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037E619D074
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790421904; cv=none; b=HfWe58exbBnn+VTPwWOqC0bLsdL1TZkcIu3WXDyE439+bY/YGFdLhmKL/jrRbdzG/jPGnw2XQGH4sbo5Unqrc4k7T4/7QA97uSmQoPEPrGIaDJrcSpqiSxz60xC7/nU4EqoN/B8/qMRPa9gI4r7zv6N7QIMSuP0rmuDvCQzmwlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790421904; c=relaxed/simple;
	bh=edDeV8IkdKZyB4f3UazoUcM9khWy+C3X6h1mRSlGPs8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Lar/CGedcZqgTnTRXBqJSRNfsZ71obSqYlwKB5JrGVzNH8YLnMWY46VKt7DTAQMctSMuhEtHsGEXvZdHMmmckeLjpafBsEd0JhtZrq/8HavwSHhoY1GnJwY+n5x2c/OE9696tT27NqNs2+/oFQSXhe548/jDCyqk1Fq5sxZI5zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4e778acdbc6so152860b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421902; x=1791026702;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8gAIhTxCuX1CeFAsM1C8lpItug+WMMJnr9P6rv4ALks=;
        b=Vw+qDaCkmpFvTi3q3yV5C4kt90gArPie9Ps1s2I3ef5u5OVLY5ZmrcnyyvKVpjwo+9
         vZF79ACSwoQKX2ykUfV9fHils5KQrm8jEjzapuxWDERFGHxEKgcjN6U2NTGOk9vE3NdH
         19Jv6wrxxA8hyejZqfBHVqOs1imo1AJ4VoMDyuiFCfyWAkoTCI34s+2PSu33faogdtQY
         YtiNVb+vDigMzvBLVM+s0Ej1yre8+42oA0OAgS0V6IFoRoM9l1ZKGOMx4lLWSSuN8FJm
         JXzjgjY2aFrwogv3mPNmZnfI4jXOg2aV2KeTZDXS75usr+cum4giPu4n9K9PGPmiKvI4
         ji8g==
X-Forwarded-Encrypted: i=1; AKwUvBxdhwpnptGzH008cUvySl3mkhFWWwsJvoL/lAznegIDnTjuB+iUWXZsIzAv7KLLXTGBRtIphzSZib/z2T4=@vger.kernel.org
X-Gm-Message-State: AFuF++nD61DwCNZOpCQ25zNecfxpAkVqMzmW5YrmBShU+tDdT3veSSu+
	77p3UGyNpo7sjrCTo/czW8YunbnFpSG9HSHxe6R1ErjWqtgObc4euoBowqrYbpeTtDNPHJABgNE
	DZNac+PTpPbZ++kzdy1q7KkvM+tl2w/9AKk1T7KN6VjP7M8WXfke+3TAHEm4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f0c:b0:4d7:17d5:6c9b with SMTP id
 5614622812f47-4d728c2564amr9465633b6e.9.1790421901941; Sat, 26 Sep 2026
 04:25:01 -0700 (PDT)
Date: Sat, 26 Sep 2026 04:25:01 -0700
In-Reply-To: <CA+xk8n9mG-FZ+0Xg5L-GSL2y8KJ+6CBvkXVKCvyJGzgeX+_qFg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab7ab8d.80e1c6cc.1e8e5f.0043.GAE@google.com>
Subject: Re: [syzbot] [kernel?] memory leak in dev_set_name
From: syzbot <syzbot+87ce68d9f48eca96a84a@syzkaller.appspotmail.com>
To: drifabdelmalekmohamedsaid@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in device_set_deferred_probe_reason

BUG: memory leak
unreferenced object 0xffff888126289b00 (size 64):
  comm "syz.0.305", pid 7769, jiffies 4294969835
  hex dump (first 32 bytes):
    67 61 64 67 65 74 3a 20 44 65 76 69 63 65 20 6e  gadget: Device n
    6f 74 20 72 65 61 64 79 20 74 6f 20 70 72 6f 62  ot ready to prob
  backtrace (crc 2d586e63):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4696 [inline]
    slab_alloc_node mm/slub.c:4996 [inline]
    __do_kmalloc_node mm/slub.c:5413 [inline]
    __kmalloc_node_track_caller_noprof+0x40d/0x560 mm/slub.c:5545
    kvasprintf+0x6e/0xf0 lib/kasprintf.c:25
    kasprintf+0x6b/0x90 lib/kasprintf.c:59
    device_set_deferred_probe_reason+0x41/0x70 drivers/base/dd.c:235
    __dev_probe_failed+0xae/0xc0 drivers/base/core.c:5096
    dev_err_probe+0x73/0xa0 drivers/base/core.c:5156
    __driver_probe_device+0x185/0x1a0 drivers/base/dd.c:846
    driver_probe_device+0x28/0xf0 drivers/base/dd.c:898
    __driver_attach drivers/base/dd.c:1292 [inline]
    __driver_attach+0x10a/0x200 drivers/base/dd.c:1232
    bus_for_each_dev+0xb8/0x120 drivers/base/bus.c:383
    bus_add_driver+0x122/0x280 drivers/base/bus.c:763
    driver_register+0xb1/0x140 drivers/base/driver.c:174
    usb_gadget_register_driver_owner+0x69/0xe0 drivers/usb/gadget/udc/core.c:1752
    gadget_dev_desc_UDC_store+0x153/0x1e0 drivers/usb/gadget/configfs.c:300
    flush_write_buffer fs/configfs/file.c:207 [inline]
    configfs_write_iter+0x10d/0x1a0 fs/configfs/file.c:229
    new_sync_write fs/read_write.c:595 [inline]
    vfs_write+0x3ae/0x720 fs/read_write.c:687

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


Tested on:

commit:         6812ce4e Merge tag 'drm-fixes-2026-09-26' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=133592c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5006f84926c45769
dashboard link: https://syzkaller.appspot.com/bug?extid=87ce68d9f48eca96a84a
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14146a05580000

