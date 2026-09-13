Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CFC184
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 00:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789257954; cv=none; b=bm1omutx4F3P3hQWvvLgsgXxz64tusqsq9udS+ZqMcoK0d0tJ3GmEL1pY76mXjHhfpgBQalMvN4R4LtmMd8zwY5sbDysiNZv/J226VewFoS7YqWtTsAI+uZNg7vo6vMldS4KLoPk/5ctBGYmMiJ1+iGZ4R3r1VD3aZgrVvFtO0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789257954; c=relaxed/simple;
	bh=soSVvu882ur4gHwbnjSkaVSHvtFTrlKyZLnJU6qRmC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unD9mti30tYXyA9zy/w4Y4llLr0QhLz2T2yyyvGtEGj9pZntmNpKxXuYeWJ29Y7vRnd91MJRjVrsOaaoCSn+xLkwoUTDbevAevnEWN4SARH8y0rSSLEuXqx+lwN+ooJA5UPPT46PGv3fET4nd9hH5g5KnYNo561AsHreMHFpBSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERaSw/b5; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERaSw/b5"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910ad2273so99529685a.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 17:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789257952; x=1789862752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtDrgayZWHV3rgFLZVw/6lppQCotHhXm5qxr/q5oXn0=;
        b=ERaSw/b5xbawgXevqAtS24lWFk0d3XBSm9LoMmy0m7EHVV9CaUB+VvRi0tmHpJHs0k
         9Xdh5dEsEjZOxYFyU1MaMiVMPDnAAemM5+e1LWlsg1D6w6tEz5C7QZu7FugtCE/gbTy7
         0BzX8ni1y+BGNsEPfTMbzAfbJ71+4bNzxYxovao9jvnKmVweacWNTJdSKkGhGGsALjUk
         XMKgg7awz4VmqeK02IbkmbLwtovYxL7oPThKIerh+aY3Mw55ld3ng6syh2cxYtkqomNx
         zyqF260DSIHkKt09g2R4zmqloM/zCMQ57tLwE4Tm3vhNiVvjVNnVZYyvmk9rJf0hZeY9
         u1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257952; x=1789862752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qtDrgayZWHV3rgFLZVw/6lppQCotHhXm5qxr/q5oXn0=;
        b=aVsqC9PB5101zbEY4I9820EI87+KjGYtuOkvXMzg6kr7UZfYUtHJ0J4cTlVMC52pYN
         iWyO3Wg/P2/d8MLCTfQ27GO9Cw621A1VF8YVQ5oO+0quZYoxp2rpuFilOr7TW0TaV8on
         xwsLhGL0MeXH43S8tx/BJTz+vFNMyA6uoW3e+DsTZ6SE+EGY20G8s+AlAfD4VAL4L9K9
         WVw8ATr3ZSz+iG9fxaNG6x4AqK0u96CBOighnzPOfbENpF+pyApFWeTRTEbdZ77XIggZ
         1Fa31lBX3WCcgDMk00lE5oyDSTuN0lZCjd/rLxrVVgQ3ZvR1sbEcBdXiHBpulQa7p8p3
         N/qw==
X-Forwarded-Encrypted: i=1; AKwUvBxyyNsAeUzBPBCCWoXsgb/EWNISDl433kDnOUeQuLVbWTdm4YhFtPZE1If2pwReaZ/SHXQCQDnOzzYXzSc=@vger.kernel.org
X-Gm-Message-State: AFuF++mopA4e5zSP1/k+j1s27anTzB3Mp/uw1fZGk+zANylL249wiknU
	yNRs4z1LkXbp/EGmSk6HLzxvSXPFWCnQ3RB3BTENosmtmjKDZ3hvvjCKedUGXGNz
X-Gm-Gg: AYBFou1a47UM6E9WlkY58lL5WhCUO5HVT1MYU6svwU0xcIXk4kRK+9T8Dh9BwtfA8QY
	mrZivt9mU4dvyyZD39/LAcZBfCzYCJntvgtsJuN1zWesCgBbzwe5hW/FQ4u2lrJARcLq6elJUWn
	ErQQ+s85W8JPWl309xsX7Qy5l5s7VrmKXBo2nLGIJ36jeLtixIQwi4evB3GkVI+eBvf5iJNCAHb
	UF0Qv+ky/69yCyxoJRDJO6ZxAJTFMcmMwms116kABNuGBmSOfU+9uZXui6ddie4jSdFPJvGXTte
	zQZYWHAEQPhJ0f+9xkoi2mXHGHpBeAG+WWVmnFAPE8UrJQ6nOqTt8941LBrc/Rn9M21Zk/CJLen
	WjFwj7G9HjpjGpoLD4m9MeSDVZ4plcnDXjD9dVCeZttbUPv8AUPX535L1cDi9uX4X2UAyR9Qz68
	+PScy+LhAqUYY8J69aV/QXUXWmWfOqxAx2yML401E8+tCZCJb6F5O/6/HhxAMV0f4E/PIwbotfn
	fEwGloDGRdP9aUloFR8
X-Received: by 2002:a05:620a:488d:b0:939:6dee:4b09 with SMTP id af79cd13be357-93a039802e9mr652219485a.51.1789257952159;
        Sat, 12 Sep 2026 17:05:52 -0700 (PDT)
Received: from KernDev ([128.239.252.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a00c1cc18sm327238985a.5.2026.09.12.17.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 17:05:51 -0700 (PDT)
From: Alexander Bendezu <alexanderbendezu10@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Bendezu <alexanderbendezu10@gmail.com>,
	syzbot+3a0d6aa450317f25e501@syzkaller.appspotmail.com
Subject: [PATCH v2] usb: gadget: f_phonet: don't call gether_get_ifname() on a non-u_ether netdev
Date: Sun, 13 Sep 2026 00:05:46 +0000
Message-ID: <20260913000546.99778-1-alexanderbendezu10@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026082242-celery-circle-dee9@gregkh>
References: <2026082242-celery-circle-dee9@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The f_phonet_ifname_show() function incorrectly used gether_get_ifname(),
which casts the net_device private data to 'struct eth_dev'. Since the
Phonet gadget only allocates a small 'struct phonet_port' for its private
data, this resulted in a KASAN slab-out-of-bounds read when accessing
dev->ifname_set.

  BUG: KASAN: slab-out-of-bounds in gether_get_ifname+0xda/0x100
  Read of size 1 at addr ffff8880091feaea by task cat/190

  Call Trace:
   <TASK>
   dump_stack_lvl+0x4d/0x70
   print_report+0x153/0x4c6
   kasan_report+0xda/0x110
   gether_get_ifname+0xda/0x100
   f_phonet_ifname_show+0x3a/0x60
   configfs_read_iter+0x2ea/0x600
   vfs_read+0x6da/0xa40
   ksys_read+0xfd/0x200
   do_syscall_64+0xe0/0x5a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
   </TASK>

  Allocated by task 189:
   kasan_save_stack+0x30/0x50
   kasan_save_track+0x14/0x30
   __kasan_kmalloc+0x7f/0x90
   __kvmalloc_node_noprof+0x1c2/0x5b0
   alloc_netdev_mqs+0x78/0x12d0
   phonet_alloc_inst+0x9e/0x1d0
   try_get_usb_function_instance+0xf9/0x1a0
   usb_get_function_instance+0xd/0x50
   function_make+0x163/0x340
   configfs_mkdir+0x47d/0xfc0

  The buggy address is located 154 bytes to the right of
   allocated 2640-byte region [ffff8880091fe000, ffff8880091fea50)

Fix this by reading the network device name directly with sysfs_emit(),
avoiding the invalid struct cast. The u_ether.h include is no longer
needed and is dropped.

No locking is needed: opts->net is established before the config group is
initialised, so the attribute cannot exist without a valid netdev, and
holding rtnl_lock() across the read would not prevent a rename from taking
effect before userspace sees the buffer.

It went unnoticed because the helper function is reached only through
USB_ETHERNET_CONFIGFS_ITEM_ATTR_IFNAME(), which is used exclusively by
u_ether functions, so phonet was the only caller passing a netdev u_ether
did not create.

Fixes: 83408745b202 ("usb: gadget: f_phonet: add configfs support")
Reported-by: syzbot+3a0d6aa450317f25e501@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3a0d6aa450317f25e501
Signed-off-by: Alexander Bendezu <alexanderbendezu10@gmail.com>
---
v2:
 - use sysfs_emit() instead of scnprintf() (Greg KH)
 - drop rtnl_lock(); the netdev cannot go away while the attribute
   exists, and holding it across the read would not prevent a rename
   from taking effect before userspace reads the buffer (Greg KH)
 - rewrite the commit message to describe the type confusion rather
   than the symptom
 - drop the now-unused u_ether.h include

 drivers/usb/gadget/function/f_phonet.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_phonet.c b/drivers/usb/gadget/function/f_phonet.c
index b1ee9a7c2e94..2c6558b1a2ff 100644
--- a/drivers/usb/gadget/function/f_phonet.c
+++ b/drivers/usb/gadget/function/f_phonet.c
@@ -23,7 +23,6 @@
 #include <linux/usb/composite.h>
 
 #include "u_phonet.h"
-#include "u_ether.h"
 
 #define PN_MEDIA_USB	0x1B
 #define MAXPACKET	512
@@ -600,7 +599,9 @@ static const struct configfs_item_operations phonet_item_ops = {
 
 static ssize_t f_phonet_ifname_show(struct config_item *item, char *page)
 {
-	return gether_get_ifname(to_f_phonet_opts(item)->net, page, PAGE_SIZE);
+	struct net_device *net = to_f_phonet_opts(item)->net;
+
+	return sysfs_emit(page, "%s\n", netdev_name(net));
 }
 
 CONFIGFS_ATTR_RO(f_phonet_, ifname);
-- 
2.53.0

