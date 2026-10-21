Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592389;
	b=1Iu3IpF00d/7ZR/NHREY6XBHy2oREADmyo3RdkgCXp3oBMOaLVid5+0nvRNDSjf82kUK
	 IMNPiYLdMDb2WTIyG/XZ0emdnLRdOHs99ESf/QINqaABb1MuBaeRsFS/MvVFlvxtizktr
	 ge7uMjghqXU/LFhWdUiLIJJuCY2CcjNvCIwaC5zAm7aS3aFSAq6svZ1ICYXP+oftmf3I7
	 7zzpKmTUt+VK3aFagTWuIJKZCTl/GOs5Q8+BWxjdXtTA+fCA2RfwrNdWsG5/f8AcEsg8d
	 OUMjHMB/69L2mEGi6GVxzefnWWoM85JB0npJS/VElyXRbbKg49GvVAIsTl40lKWCDXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UzBAet1nTx5+JCjWlEVDo/FdC70Ip2kEQYD2LrqnUXY=;
	b=TWP3jbF9a5/+HJjh5OjNY/+J/maVfn/MFjoYCSmn/fd/+sq+tmpKLHjMDCdF4pQQ1/zM
	 F6zIS30ULcjZzPf9LDnsbs9XdDkD32V39lP8L+SA7lz0/eeWcGXEWvvMfUBsIoZC7sYB6
	 OYnvXBrA3HszF80UYMTmxQTdmkQRnd/RX1/3nnZiVtampr84ELtZEdHjl/8loRVQU+LCr
	 L+Ww78JnMPQIZFrX2HlU5UxvkxoAxSZO4jZWIs3Tz+9QoJlCYubyRptkRShkUgkYmtE2M
	 nhWv8Mlxi01J4ziMNU/0YuGv+tnNmW6AarfNrS1SSKNKQQXXU3UZQaDmWGFwR+ix4Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e81UIKRM;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400B660A260B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 400B660A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e81UIKRM
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b09c273caso148052f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592387; x=1793197187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UzBAet1nTx5+JCjWlEVDo/FdC70Ip2kEQYD2LrqnUXY=;
        b=e81UIKRMXgCgGAaYI6gBUg8X1gplA60C3b9g+VksRohU7pCAAEnb6NSnSLNbqXemui
         BORtyvtOoMpfOUOobA9JW0E+hPU08r1qnXi/1I3roPg4yb7J/IKjFVGNgENht8SPQ15L
         tWONyPeZATZS0TVScQ4ReXJKsK6yAV9ityd2lAgvBV0YHzondTJe3KI4kSuG5mMykEut
         DnhkLQJA2L2efsH/c4GFKixPwpoNtOQr7zVS8Dnscs3BirDcoef9BqLAkKhnVu9DE3Fn
         35Br4SzsiV/rE9NNHmMPAmvOLsHOnHRHU4StUg0Jt6HI+yEfQMe7wC6XkksmIjqc7wYM
         uN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592387; x=1793197187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UzBAet1nTx5+JCjWlEVDo/FdC70Ip2kEQYD2LrqnUXY=;
        b=foB4Dciye3uVISNG8UC6BFVwjS7sxCLq0PPS5xE3UEJDlqI/RcP5mxi5oxhd3+IF8u
         um759KddXDVCb1eHPSgaeIYiwN+U+1S3xTvMmLvFbqW1XBzVdo4o1+G/81j9E7xgucnB
         9NET/7ZX6gJ1lLP1qvcoPEUQ2/RawB1sqKSFKgtUCZZHICq5LFEYz7ra4I5jfmOR0T/P
         e3PCghev9TLrGZALiCIbTO6l07ooBBnzDbjnvNnFX7MPbLwUahgiYLkKRQN4TcBoaXi8
         o9wPv3FysTbCWzTDAnDOesgLXJCbJGqUX4WB0jBGA5k9DP7E+qAu4A5j8JOgGyRZdHmn
         S/oQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLY/2zkC4QFO0M5oWoaa0N2UIQKEcFD6myjYwfpdNqmyH1SgefxLKD8LxizITCmML3NO8aHNQrtGK+SuI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJypnqA6ba7CKH+gxQ7Wj8NEBdY+7OpoPGcWzEf4lCEeIHBfbTD
	Uj0WWru6Bbk7ZFHyrANcvmMmiX0h96DONly7TwoofPQyDzKjiMaONkw+
X-Gm-Gg: AYBFou2uqEjGxqjz3dNQo3PpN/+p8BWVRtr5c/qSLiJMDua+8kp77wvqx/IMPM9jDOj
	o/xXy9ohMQPUUUJ1/AQZWChy+NKwwjeq7zjvHnoWOAwsNluYVi+39a8vojHewyHOswlMi64G6XV
	tqJ3UCTH4Xpdb05x6JqIUp42ZFMksTId+aRpJME8144PFkl3kJNtzegJc2CPHrNqElvsUzvj9my
	FByX7YxjPWc/3GMuzAUXRL7XykvWP7v5zjgRxgMTcmtZzdo3byiClNdYmab4TiN7paJfDhvpfOX
	3xUktypeGBh+9Q86TdmWFmMX4tjl4Jir4clB/+67fMbV5giny0t2gk/VBYIyAwA8sc4c6HaPLg1
	BGHnzaoMSaadmJE8XAg/smjp4TBEWr26cWnh5ovRAoVXOmg5VBKsVqOlc17qRsHoPVfyiti6iQ4
	KyxJs4k4Hps5hCRAimEMT1CDJYNz+0+kEbw9uAZJs9qfuQPDwAu80f///HmMwZ6wdPieXAHP5Hh
	iNBKxZyjD2UKZbAd9UhiYNSkFnLuLSNQDjNonXQqaUQaqQOhHMWWQGi
X-Received: by 2002:a05:6000:4b18:b0:48c:6a50:cba0 with SMTP id ffacd0b85a97d-48e264c8737mr4197655f8f.5.1792592387338;
        Wed, 21 Oct 2026 07:19:47 -0700 (PDT)
Received: from localhost ([2a01:4b00:bd1d:5d00:1a26:c015:c64b:f840])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584c3b0sm6446815f8f.57.2026.10.21.07.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:19:46 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 21 Oct 2026 15:19:06 +0100
Subject: [PATCH net v4 2/3] netconsole: read np.dev under target_list_lock
 in local_mac_show()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-netcons-fixes-v4-2-3857120c6340@gmail.com>
References: <20261021-netcons-fixes-v4-0-3857120c6340@gmail.com>
In-Reply-To: <20261021-netcons-fixes-v4-0-3857120c6340@gmail.com>
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

Two places can free np.dev: (1) netconsole_netdev_event() moves a target
out of STATE_ENABLED under target_list_lock before netdev_put(), and (2)
process_resume_target() releases np.dev under dynamic_netconsole_mutex.

Fixes: 0953864160bd ("[NETPOLL]: no need to store local_mac")
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 1fb846ad07d1..be7eb632ee42 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -888,10 +888,23 @@ static ssize_t remote_ip_show(struct config_item *item, char *buf)
 
 static ssize_t local_mac_show(struct config_item *item, char *buf)
 {
-	struct net_device *dev = to_target(item)->np.dev;
-	static const u8 bcast[ETH_ALEN] = { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
+	struct netconsole_target *nt = to_target(item);
+	unsigned long flags;
+	u8 mac[ETH_ALEN];
+
+	eth_broadcast_addr(mac);
+
+	dynamic_netconsole_mutex_lock();
+	/* Hold target_list_lock here so netconsole_netdev_event() doesn't tear
+	 * down np.dev from under us.
+	 */
+	spin_lock_irqsave(&target_list_lock, flags);
+	if (nt->state == STATE_ENABLED && nt->np.dev)
+		memcpy(mac, nt->np.dev->dev_addr, ETH_ALEN);
+	spin_unlock_irqrestore(&target_list_lock, flags);
+	dynamic_netconsole_mutex_unlock();
 
-	return sysfs_emit(buf, "%pM\n", dev ? dev->dev_addr : bcast);
+	return sysfs_emit(buf, "%pM\n", mac);
 }
 
 static ssize_t remote_mac_show(struct config_item *item, char *buf)

-- 
2.56.0

