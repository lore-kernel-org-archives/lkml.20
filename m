Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862078;
	b=3V6hi4ef2XoPrAeCZv8z3sfrOABoUZX1/hboGasvh7adi+8UIqEfxavIQ5o6UgIBHXO4
	 44cNhs+G89UPQWh0dXFqSGYkK8WjM5iML3gQ/FTfdIy6/NOOvEWzork4z0evNgVuf+SLY
	 mCWYDEA+G4SGFKii9f3G7cNKtnjnqBZ11wBpKZ7C7xMwTScYAoIYbiro+YZWkaMaCp6tq
	 YGyjq42IRbZRwJnpCROcPQ8BwhBWfH8XB/cNAMVCSe9v+RaT6IEQFrfbRDkGkkdZZAyb7
	 6V5wAGQ8Ko6zZTtn1V+Fiiqv6JptNhC6um57sNdwMvXirT5xMo2SIBQhAJbuUt2liNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SvleQPQxuspsOfczyKT3no41nY6ahcqtcV2ZKq+gdBc=;
	b=J14xXjVz0ntW038iG0IQZ67Pu9z074SdIGKSgeTbtKZ6knvPCVmKEniEoKCAl7bHgw3a
	 YWvK2rb1GqtdU2g7p3iP0SDTAH3QuEyJF7bA5nzTnxKeAvIljh0jUZ4kkG1GN6FVA5CzW
	 cbGonp2x3752symWYPrzZkErz/ZbcSZfgBXJ5PSPxibBzaQgHIb96NmsgRcX1+fD5L2Hd
	 X9FEiabPRx72ZRWCipCK4oCANoXAoh5Q7gX7wi8uOlinIXVT3azcu7uUA+IjRzfdX3uhI
	 cxnfpo6qToNsMTWrWSLFHPG29+nl+DMnk9vtB59Fr0vQtZZ3JsEQuMrYYu0WWDIY/TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBVGU0ye;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D30606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D30606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBVGU0ye
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so11109905e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862076; x=1794466876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvleQPQxuspsOfczyKT3no41nY6ahcqtcV2ZKq+gdBc=;
        b=cBVGU0ye0km98YY6rzSibqk+YOAsqmuO4VwxQySr2PTZe6uVSSv5E5s4Xm6GbHnTCi
         3N8J66tfTEzlqxB8nVaqFyFM11xBt9AMdClhypKG0mArGQ1WDLqGPIpyqvvaBIAGdM4Z
         annPeaQAcJa+XU/dJ/6003fAQXMqUWBHADzYS7pmBzA42kZ5eveMdGXdtTruvtOzHjRq
         qF4/cJs/+hpO33mcZ+IcCgO2llfdn0ndXRV/V6Yz1XKVXltUg0pWfUkC3TeOx5YPGuDK
         mUS1Fx/NKBJfh8us92VTcA8YEnNxgFtNkeURSpjm9UugHdoTQemevikE6GVo3ydLCenD
         HBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862076; x=1794466876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SvleQPQxuspsOfczyKT3no41nY6ahcqtcV2ZKq+gdBc=;
        b=oG3Lip2kAWUmn2486cTeGDkLgRJC0NyjUHdjX4Sn2rc2mjGDzJRp48bO+OMjSY4TOP
         enDuRMg07c1CUJWsRrgU5a9ZDYOo/psKoHrN+SAA9pM+8dnEQKLCELQgPmRgjaPmKd/+
         DvA0eV2Hm+4mfWe23VOFrhp3TVqDTiSWOwwXRWkO2Lk/EwgiXZpbBNWTGrgb7vi8TsBG
         FhtCsCRZcAlOAuglvsYneuuthXGk98oYq/HKU4BrACJJlwoQX9KcTuv+pGwag71iI9L3
         NSdxkV8m9imqLnZHF2LiCVqvfw6/ucjXwr8HyPVpITe8h2lcH+r14VF3I1bHupmbM1lS
         Pu5w==
X-Forwarded-Encrypted: i=1; AKwUvBzSCVEIi4dwCiuIj2K9GOUPNg7b08UZ/gPwCfbZt7zjXKeA2oC5YYPbDdnY99E0Vt0VC1W74auykILlbUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NbRHyhHSvpUVqqawwY+pGixR184DDbo+z4VZCLFnlerITqhyu
	p/JJohX9vUsvks3iabfM5ZYlbHHvmogJ92CmEWMDHXhp/9dcHZpKPxQo
X-Gm-Gg: AYBFou2c026tG64RhnHpMoGA8sueC5mwDecgbXfb8sEkpgLD1Y0uxX1Jew1OB68hICM
	XhiuVb+T7nNIbQwDsK3bJDbddb9rYcsGHBZqqVHj1wpRNqmPEo33qJmewT3km4V2lnsbbn8OhRf
	ECXnDhCFcZL5F9jgeVo6eYuJPK2uZ79Up59Sb8pnPavmAVu7T3UXprzAPaHE/+N70WRz72c/IyP
	b10J23aIb0XmfjlBPgks1uUNpPkvPzlDr7f7ISiN42G2ohlqRyLz7+eI1dYkMyjz+iWPnkLpXJ6
	3tDCaNOOhvi1OoTwbI1iA7lCzeWdr7/dRc9rwVVImaHqA9ZRrN4wZnZNbRMoF6BuD7GK4g6iTtP
	UqB11tJUz6z0wLyp+t7JQlJURjntWH1kLf9P/ATrtOb/3f5JN36rPVLe5NhMDD8wVNs29j+8xM8
	TBmMZxfxOYPzL64CPSgDDn1VjfAyWXOhG+UrH/7XCKLbZE2nm1KGNtQC8KkCbwR8KqVY7pbO57p
	S/bF0ql7ZLIA/poacSowboCKKEw31WNlBwrx0uilRoGBJqp66gFbEoz+SnvuJZ3HtQ0/KKHw49S
	t9mOZcDqVWRJPsSwMCU8poKSzWgm3mYmS/n2CjboxNmpiirf2B8QTEMdSdgwN/P2Fr/phboiMG4
	q6EAeuA==
X-Received: by 2002:a05:600c:6095:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4ac18b7e1c1mr359585225e9.23.1793862075779;
        Wed, 04 Nov 2026 23:01:15 -0800 (PST)
Received: from recorder.play.pl ([2a02:a31a:a1b6:b080:23ca:4af6:2cc9:8091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba0f3sm40116155e9.9.2026.11.04.23.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:01:15 -0800 (PST)
From: Greg Sikorski <sikorski.grzegorz@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	"Jiangong . Han" <jiangong.han@windriver.com>,
	linux-kernel@vger.kernel.org,
	Greg Sikorski <sikorski.grzegorz@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: em28xx: fix NULL pointer dereference on disconnect of dual-TS devices
Date: Thu,  5 Nov 2026 08:01:10 +0100
Message-ID: <20261105070110.122371-1-sikorski.grzegorz@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104052800.44551-1-sikorski.grzegorz@gmail.com>
References: <20261104052800.44551-1-sikorski.grzegorz@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 826915b6b65e ("media: em28xx: fix use-after-free of
dev_next->devlist on disconnect") made em28xx_close_extension() unlink
dev->dev_next->devlist from em28xx_devlist. On a regular dual-TS board
(e.g. Hauppauge WinTV-dualHD, 2040:8265) the secondary device is never
added to that list: em28xx_duplicate_dev() kmemdup()s the primary device
during probe, before request_modules() -> em28xx_init_extension() links
the primary one, so dev_next->devlist is { NULL, NULL }. With
CONFIG_LIST_HARDENED the inlined list_del() validity check dereferences
the NULL prev pointer and every disconnect oopses in usb_hub_wq with
em28xx_devlist_mutex held; the device never re-enumerates and the USB hub
thread stays stuck until reboot:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  Workqueue: usb_hub_wq hub_event
  RIP: 0010:em28xx_close_extension+0x80/0x130 [em28xx]
  Call Trace:
   em28xx_usb_disconnect.cold+0x87/0xed [em28xx]
   usb_unbind_interface+0x9b/0x2c0
   ...
   usb_disconnect+0xe7/0x300
   hub_port_connect+0x7f/0x930

Initialise the list head in em28xx_init_dev(), which runs for both
devices (for the secondary one after the kmemdup()), and unlink both
entries with list_del_init(). That is correct whether or not dev_next was
ever linked, so the use-after-free fixed by that commit stays fixed.

Fixes: 826915b6b65e ("media: em28xx: fix use-after-free of dev_next->devlist on disconnect")
Cc: stable@vger.kernel.org
Signed-off-by: Greg Sikorski <sikorski.grzegorz@gmail.com>
---
v2: refer to the fixed commit without a bare sha1 in the last paragraph
    (checkpatch: GIT_COMMIT_ID); no code change.

 drivers/media/usb/em28xx/em28xx-cards.c | 1 +
 drivers/media/usb/em28xx/em28xx-core.c  | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 8440eafad..4d2ea2e27 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3845,6 +3845,7 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 	const char *chip_name = NULL;
 
 	dev->intf = intf;
+	INIT_LIST_HEAD(&dev->devlist);
 	mutex_init(&dev->ctrl_urb_lock);
 	spin_lock_init(&dev->slock);
 
diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 62a1c25a2..ab1e1e18b 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -1263,8 +1263,8 @@ void em28xx_close_extension(struct em28xx *dev)
 		}
 	}
 	if (dev->dev_next)
-		list_del(&dev->dev_next->devlist);
-	list_del(&dev->devlist);
+		list_del_init(&dev->dev_next->devlist);
+	list_del_init(&dev->devlist);
 	mutex_unlock(&em28xx_devlist_mutex);
 }
 
-- 
2.53.0

