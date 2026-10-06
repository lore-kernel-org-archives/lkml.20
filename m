Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE6F4A3D2C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 18:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791310954; cv=none; b=ge3tmjaWmUXt0zDaV9M2hBwg45UjUAu3nt7yFcE5+4DIW7WBk11CYJ79IfqXqRwm8Ml0B0n91Qkt2ZgSSggb2Pl/tJw8F1PTaem4Z4AXqM6carWN9nkv+Wn3TjEiye6yzO93992Xq9+A+n1Ok+j5BreatSvH0QSSUUpTQoCFFTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791310954; c=relaxed/simple;
	bh=hGPSpK7vOKkuBZAIYhJaDSFiXzz8tS0oLa+g+i3axgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EFGHF8GKUUZP6jnra8E4G9KJajQrpE89WPfEvFTyYMO7r1EO5Ms9u2KlzXn3P0ku0/fpQW4WbBT21f4uWfWvRSB0ntnFyLR9uqLJkVs2uJJcOTPqWcS0BJicuERInW4tqBvTo12vr7Dp9NdKwBhrmJUwaqgiDFSahlQai8cZ34E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MN93rvxq; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MN93rvxq"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b0f534161so362755f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791310951; x=1791915751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYOmk7tdofg9jpf4CztLkT/sa/eQdR3c/+qRIcJfM1s=;
        b=MN93rvxqstN7MA0rAkbc5wfzFoSwvF+VNhwvf8cXmT3oHlHNmVOjKsMina6Lg6qJ1B
         MTaSbjr+7R5fMUDc9afYIVsGuz0UO+hJfka7GdqLFoj3+BuLwWwZ0fO9UgmjQFtKDea2
         bO2bSOwgbywc1uIzOa3oAfM0v21akaDrUsxcRxCSUBsnyEgVr1wjfIsu1CVa2MgEKk4J
         oB22F4WQdv6tF1skgVTTettcof82HKqU0upOOEG7MpOpaQ6aHTIVE++Y/9rP8q+sqLyx
         YpUJfQ+XMYW2cka+V/xvkunGXpAwDHVAJM7QqVAsFYdkOwkXLkFPfyS/ODcFc+Gk97L2
         DMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791310951; x=1791915751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYOmk7tdofg9jpf4CztLkT/sa/eQdR3c/+qRIcJfM1s=;
        b=mve2/A6S+sVIgxrl35VjyCw6/JGXJBxmSPU804YUQX2iDsCyZaO5nRv4DzXv4nvU1p
         PhWCXezxmACA/Awu9LuG+KDP3gSant/gmsg7aQyj4aa4vBRviTeLQy2oZwSjkuKPJ2x5
         W9wG9I+EWLdIJEYFUcp4qE4z47tNumNPUttaPswb3HUNnjdvOndu7Fp0VVAqsigCt1Zn
         WBWLKiHikET7WbvIOYLYUxgU1aXf5iVwGVA5l1UbfF4vAiMUcGkIz5Tg83Vosl07MzNg
         SGYHY9iSk7qRbaCueUjCC7Dsb3iSL4lxO5Ha+2lqcSf/ufIFM7Xd24XrOJ3UkTLhdK7z
         sCTw==
X-Forwarded-Encrypted: i=1; AKwUvByN6jAv/Ci1tmCcfWjqm46bydlziA+vyLfrCakhlBoGXCQ8h1znK4n5khWhfhi8hiOKiXh3M/hmv4Y/YEs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfWtxOkyqbmMb/ZzC/JwACbIuhmpzuyA4m2tBDHRApjUcseGYQ
	w6nH/Z8WPAL02jRV26FydBECfmewK0DjcCPq/fQFoGLY7HVH0s9quSbJHwI9GYEZVvwXEw==
X-Gm-Gg: AYBFou2otuLcf/VgLxDTBkdIMB76Eaz0KvIrFGg+VZvzPyMHEOUUVGhQtmGDQxvRd5c
	5zJE4mP9vsTLDf8aaoi8wG+9adWuFIc8BGt1zTxdPata+vOxGakbxtFChBdem9cY8qT7thf3aZB
	YnSWP9zPZUpZSKUn4NUMmmRFkMyAzDx7q7oUt6ye2QPS22DnP6lCzUbM8gba9DW3FUqWve5kkGN
	pymW5ol2Sdg8zDdDIe+p6YiVJKp3BeHoGG51f9fnsZJIzcAaOxdlRGDev2rX+cv0SbP4ecwuIsF
	WmVhF143ba3AVQlGKDG+saTqn4nV/WaXj1JMmCz0EnAf8Mx6DYVtiw32+Rx1BHo40vHsl1AKDXE
	zwquodgV2XAY8RF0ZptbKyy5Ib4aEDQxSSAwvB6m1YK1XfsN3Vo9bmwLtsryXQbSIeA1vK7cIfC
	YKe+m8x7+JUHcaa+xF8WXKprZUMdSHgIesshVKMIDITDJh5z45v9C+HFf3kkAvpPQ=
X-Received: by 2002:a05:6000:2210:b0:48c:7009:fbf3 with SMTP id ffacd0b85a97d-48c72705fa5mr560384f8f.2.1791310951420;
        Tue, 06 Oct 2026 11:22:31 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::4:4701])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1fec3sm1055688f8f.37.2026.10.06.11.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 11:22:31 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Tue, 06 Oct 2026 19:21:26 +0100
Subject: [PATCH net v2 2/2] netconsole: read np.dev under the RTNL in
 local_mac_show()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-netcons-fixes-v2-2-ca652d55fd4a@gmail.com>
References: <20261006-netcons-fixes-v2-0-ca652d55fd4a@gmail.com>
In-Reply-To: <20261006-netcons-fixes-v2-0-ca652d55fd4a@gmail.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Stephen Hemminger <stephen@networkplumber.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

local_mac_show() loads nt->np.dev and dereferences it with no lock. It
can race with the interface going away and netconsole_netdev_event()
eventually calling netdev_put() and freeing the device before we
dereference it, leading to a UAF.

The window is only a few instructions wide, so I could only reproduce it
with an artificially widened window between the load and the
dereference:

  BUG: KASAN: slab-use-after-free in local_mac_show+0x4e/0x80
  Read of size 8 at addr ffff88800e990458 by task uaf/130
   local_mac_show+0x4e/0x80
   configfs_read_iter+0x187/0x260
   vfs_read+0x453/0x5a0

  Allocated by task 116:
   alloc_netdev_mqs+0x78/0x830
   rtnl_create_link+0x53b/0x5c0

  Freed by task 121:
   kfree+0x159/0x420
   device_release+0x77/0x120
   kobject_put+0xb5/0x160
   netdev_run_todo+0x420/0x850
   rtnl_dellink+0x259/0x5b0

Fixes: 0953864160bd ("[NETPOLL]: no need to store local_mac")
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 1fb846ad07d1..830262864da2 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -888,10 +888,17 @@ static ssize_t remote_ip_show(struct config_item *item, char *buf)
 
 static ssize_t local_mac_show(struct config_item *item, char *buf)
 {
-	struct net_device *dev = to_target(item)->np.dev;
 	static const u8 bcast[ETH_ALEN] = { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
+	struct netconsole_target *nt = to_target(item);
+	int ret;
 
-	return sysfs_emit(buf, "%pM\n", dev ? dev->dev_addr : bcast);
+	/* Hold RTNL here so netconsole_netdev_event() doesn't tear down np.dev
+	 * from under us.
+	 */
+	rtnl_lock();
+	ret = sysfs_emit(buf, "%pM\n", nt->np.dev ? nt->np.dev->dev_addr : bcast);
+	rtnl_unlock();
+	return ret;
 }
 
 static ssize_t remote_mac_show(struct config_item *item, char *buf)

-- 
2.55.0

