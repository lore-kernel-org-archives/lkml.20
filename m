Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285942;
	b=ul+hRNh2Bjcnlm0Bka2VfDqwGyYzNc2cr6zIAOnvN/cOsru1bbNJUygS96WN9TQmiH0e
	 oWYNOBIjQeZoHbR5FsHdxawzd3TWTrN55ZTeO47HWMlGd1CuXj0KmtZmDHGtIEd8DPcrf
	 29ClUQoXXeV1YNVnAelCaHY/hsZWR0BmUePN7lghbtS35WPELDRAFLd2SMiWhvPfq8Ww7
	 7deegTwY3wtrlnpURJ6/hAUNJy4aq5849UsqeAMQYQb8UH4bkcATJU2dBjfTV5Q9HuV4S
	 H71Tb1Zm4tFeAwy/g62tS8S9QC3a+N1byIQsP4x4cQvVbe4z0+3HuyBA+1XRK2ql7kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=W1NlihvaJXejrTDGGOl3Hof38A7ldhULq/AQA3ZMnok=;
	b=Tou9XCBO6o/H3NqnIvtCHidntLfmutGwCefgkLJ0BpkGRePYszkfnOzTLkEE2K5wQT7N
	 usKALACaXor1K+OJSHnCBf9MRjthifcVCoqDJtAsgpxubshuVs+rkxRlxDop7A7ASwEcJ
	 QpzxgaqgdqT4RWLyQ3E2C4/XpPJJAHtjHDOqYXua17i4qosL+DmG3VEJiLs2Mtmwc6y6X
	 pq4E1ayd4PhL5eIyMa9Zl9OWRfmM2jMqttD7LIFCtCsdfDOjlaRwLpRmUuCPIWj2/6VXB
	 aHBKg5mrt++bhKgBr7hvL8hH3mkyfFWraUr85oqBoFnkIL0qFos1WR/Cz+ulpxx47tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uEkVXSPm;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD98A606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD98A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uEkVXSPm
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso24487915e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793285940; x=1793890740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1NlihvaJXejrTDGGOl3Hof38A7ldhULq/AQA3ZMnok=;
        b=uEkVXSPmhnvCFI1L4+2+0k0KbwiX2lUGRnEl5UdcX5B5WerVThw0gKpk+7OXuT4NsS
         dagdzhqNEWgvTbQ88qQwx1SFzHT0gt/cznkFBxFJ05P78rx8TYrq019QxvsbwxyYb3fS
         R5Wo7p08Z4QA4sPa4k9vTNir8pltgp5IQJ5EaXkKWwRy2xkq/xZ76ZWJWmKrUvyUVMFh
         0hR92+Cn5TK7Ve9V7To7Swd3LDWmeMwVhKlYHwatOhuixMjkxa1rVwdc45hwH/HLqTc3
         xpHJHo/LS7XWKaeeX0zcVtSL0Y4fNEDBpUaVBuVz1tuZ8Hmtxp0Y+z60Urhdkpup+q1k
         NXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285940; x=1793890740;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W1NlihvaJXejrTDGGOl3Hof38A7ldhULq/AQA3ZMnok=;
        b=Gi6kbSdASo3RbsCfkKeq21FMv+IdOB77A7bJ86cxs3h9mqQEVxN4efYqTxIN3fh/gc
         65txUIrs0WMaGdZ15XpbmBYNPhZVpYRadrADHhA+/XfS/yS7apZOiWwEvmoKcL7hoxdp
         5mHG4FdxP7XF8vS/+1rMxzTHQINr8T4Gje44hzWaZqgjHZn36S4XsJUWqLmyhEfpJCC3
         e4O+Ae8tnArrehbDX8qYQ6C+oRhIjiCQWsLbDgqYaegWEtsUDsn0aPyKUJy6aGizVc75
         62vYWEiabEyVlgG40AAmaEn2f+U71HqLHoWTZyzkBw3IFwiIq5a9eHdEjHCc4DC73mRv
         kA4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxMnJPj9fkbXnJyyQKXTlpwWE1wU6ixuSh94t5XgZMQfzllJmjKOFL9B2PsJSxLHqRI+MnsnIIl55wTs4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJc/PvZNcTDGWanAX2xHVUV2VpGQ3pG3VHHYnm23ilnj3GXJe4
	tyA8zfeXFXZsQgMwCIb5FWMVDv/WNwyRHNdUXMKpoRhxd5f0VJ7ETWTs
X-Gm-Gg: AYBFou1Idbdon1ps6ogB8edEen4GyGgvB01+O97m281c69IZK+CSbouiyvODFb1BEmM
	9yW4X1j7iskTm/ZXRSekKZeGM4luyNhCiWR2T5YjTknbf1AACHkYx5PjxfTTqtY1FS/Sya2huAL
	Tiowy9vi1lyHmQ+Yu6/MC3s0eS/9tHfPFoQOyr9Biu5Xe77P4p69HrfxaCmw745rWvfSpKpLNdh
	aKeiIG76to1OP6qJk6H5EgY+Awkl5CiIPuYw1Xa503zHHD+UUsjpEgGOpFhOjceSFKzDfZcrX+x
	gCj0Vh0JkS8y0ANH5PDQxviqWqYhMpzF0Hl1iVzw1cXk27QKcP9kNWq25gzXUch4uy8ss7pGsTI
	h9unZewbymlZsuVlwF5VnmXjg12flLkD+QA7OBJBJPGR5QyhHDIXavN23mntTrnI2N5oifMheAZ
	U7ov+fWWufOBvDTggTa7FFwJ9v9oh9zi3HOh9oxQXcumMTw7k7yWKzZmjCwF5tIzc6FTw5z+d0B
	KiKX60HI2+t5C3MgfZZ+AZkVl00aDS24YHZHG+x2PbYqJHREpcuEyh/xWv2QS7RSbeNOKtASngW
	UVF6AJvhWX5F9IubXHyk56k0WJ4=
X-Received: by 2002:a05:600c:37c3:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a9674e63d7mr123124135e9.26.1793285939996;
        Thu, 29 Oct 2026 07:58:59 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm70941745e9.14.2026.10.29.07.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:58:59 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abini <pabeni@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>,
	syzbot+88435e204734072bf39a@syzkaller.appspotmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] netdevsim: reject port addition and clean up ports after a failed reload
Date: Thu, 29 Oct 2026 17:58:34 +0300
Message-ID: <20261029145844.231018-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nsim_drv_port_add() does not check devlink_is_reload_failed(), so ports
can be added via new_port after a failed reload.  nsim_dev_reload_destroy()
returns early in that state, leaving them behind.  nsim_drv_remove() then
hits WARN_ON in bpf_offload_dev_destroy() and a subsequent use-after-free.

Block port creation with -EIO when reload has failed, and delete any
leftover ports on the early-return path as a safety net.

Fixes: 75ba029f3c07 ("netdevsim: implement proper devlink reload")
Reported-by: syzbot+88435e204734072bf39a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=88435e204734072bf39a
Cc: stable@vger.kernel.org
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
Tested with syzbot C reproducer.
 drivers/net/netdevsim/dev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/netdevsim/dev.c b/drivers/net/netdevsim/dev.c
index feb88ccbbced..61f0824ce4d3 100644
--- a/drivers/net/netdevsim/dev.c
+++ b/drivers/net/netdevsim/dev.c
@@ -1697,8 +1697,10 @@ static void nsim_dev_reload_destroy(struct nsim_dev *nsim_dev)
 {
 	struct devlink *devlink = priv_to_devlink(nsim_dev);

-	if (devlink_is_reload_failed(devlink))
+	if (devlink_is_reload_failed(devlink)) {
+		nsim_dev_port_del_all(nsim_dev);
 		return;
+	}
 	debugfs_remove(nsim_dev->take_snapshot);

 	if (nsim_dev_get_vfs(nsim_dev)) {
@@ -1758,7 +1760,9 @@ int nsim_drv_port_add(struct nsim_bus_dev *nsim_bus_dev, enum nsim_dev_port_type
 	int err;

 	devl_lock(priv_to_devlink(nsim_dev));
-	if (__nsim_dev_port_lookup(nsim_dev, type, port_index))
+	if (devlink_is_reload_failed(priv_to_devlink(nsim_dev)))
+		err = -EIO;
+	else if (__nsim_dev_port_lookup(nsim_dev, type, port_index))
 		err = -EEXIST;
 	else
 		err = __nsim_dev_port_add(nsim_dev, type, port_index, perm_addr);
--
2.56.0

