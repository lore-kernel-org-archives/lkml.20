Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB334028D9
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792380893; cv=none; b=fAM9GPz5c7QBipKm4hv+XrlSWY7ZdMSTh4+QtWbgNsukmaaCrVoUruJJJDax1msebaEhuacsrfU15zAoI3DO9s7trT46RTh7sKrr1hCttrmktyy1iNYgsslFtBKXGC2XIgwpE8Ri85sT5VZAMBpTDZ7HwF79DUzXSp35LZdfsUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792380893; c=relaxed/simple;
	bh=4Yjmn2WOkVpLe8VYEyQISbvZgK8n3WDI2qsSfL34KBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TUVgDA+ZnUgwg7nCrgI74Z7eliGtcInM0qB6dKJBQEkhunKiMINDXUEHQxBEo7LY4LrsY/CKoGooBop9QCTHmYmP/NKEbhGSXoC0pzVXejEEhIa5zryIjrKVSnYsSJgV7ctCm4B0frAALNLTMVm8Etd+oLiIBCZ8BZR/1/J3KDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjghTI/V; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjghTI/V"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so568206a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792380892; x=1792985692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDpleH9Ke2Y1+8VcMmyF2Ssvoq0mqvQ/mLFZpD9YEIk=;
        b=ZjghTI/VEzIkyay/IEWQu0fUouUfkuU6Y40nhiYDE61F4V+ezSw6GSSL/96VhzmX7f
         8tbwgWytgPKRt1U0zljpJTBx9j9R1HLLJP130mUxJ4xe1iv18dPf2Je0+rtDJxhUZNqg
         ssDFAo4KXlG+5pSnvGgKi2BB25hrmlosbizDgpE9ykXNS6NFOHkS5BVk3mxjXp4OPKL4
         4kd1BT5T02QdvWd5fW2E7bHNaOPqoU6lRh5edC1x7UPdQkSEdDgw5zhG/YIVaf4rO/MK
         DeUKt0nL44qVCPqHbA89d1ldYwaOwTzdzZIrLcbyH1mljPNGjc6k9qDpGmPoCGLxHfu5
         hMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792380892; x=1792985692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDpleH9Ke2Y1+8VcMmyF2Ssvoq0mqvQ/mLFZpD9YEIk=;
        b=0llxB6nOVqMQd1iSGUeBSPJOe0SuCt9DdJz5XrBFiRE8Xt8dglxXbyGQffi2S0XGvM
         v0bj4lk005cE2NOzrfDdOhvxONJ5LaGVIqadLPGw6UI57dOVFd+sphgjkHYM/rfwRqWi
         eShCwssqs7X/qJPKSAlu+sNYHIo2UgWkuIJUv9kilGaO6F5CZCbD3tmpB/UQFWSsshnd
         BmqLqGfxNQJB4Gf/ur4uHig+csO+o6u1eNLR0GFzShbJ3+BctlMkR+Wb6DPPwcuck7/4
         DJHt6TJs1PUYVjhaViaAwoh8Q5LsGjJ1CUBEclOYlVM3rrXzWVgmejYI/zxwwlq17pIu
         ztJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxV2/vwnN46OTeMqx0bmfqdb2z1dIEHltJlM34mb7kqdKz3vhcxkEtA4hInKL0uVJPaWNVMcsVCx3xNvD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYltCPJ5fSpiNSClz8MFhdRoODCPbNuSG09z4XlzN2WltV06YM
	9jad1bZvBv1jw2G2LWnnvWMvHinCov0Iw4q+Xzz1b+FWky+wCiuNlgTa
X-Gm-Gg: AYBFou1ut0HflU8ZMvKPOQnPP9m+oO8HrsoWxs9hySUokFtEteBvZzKA50ck7wt/DTr
	1aNrZUqpi7FQss8/6NeE1NSd4RCmw2bTADOIVMLvxt5ShGY+I0EZ5tiivNJzhOHokZxYm0148cQ
	H7RK38ZFyFtYyiOINxQsi+b83FMP5lN7752H9KbohcmUHCckn6+YOOObK79zTfD0KVD7AHgn6g6
	UVcVNDZ2F5StAu+ogajN8fsdK8HnuTJH15e0O9PJIrhMx3t36skQdUAQvqJQ0eeszRmzdowFmJ3
	pIbpP7tPWd8DGj3cFmKou3yzwpXu5ssYjaw1wK4cQRbQJLguOA4cS7xFHM2WENb16ckeprSC3As
	9qj/Dw0B0cZ/+W88f629oSPb6TBN4wGFWmIqX4+Bev3Ql+k0q5S3ypm34KrEt802uYEGFe0YNmL
	dbVA2jGmrJcgL+vKoIo1vz0Na0zf0SeCN9FzItsNxDf8KXcvVEcAfYhcVVwqQrKFeK5/Z633QK1
	dL/HbWP+vQffhD8YhUnIXfJOXhmqZ5UKAn1aRW79uSUKOZU7QIw8kaZTXQ+T6f41lpZIOGerOGn
	tgeuA7+h3RewFzCXS6R68fh1jpskZqoU4ZQsMtdJaQ72oOMZ
X-Received: by 2002:a17:90b:2ec3:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3acef134d96mr5136229a91.23.1792380891798;
        Sun, 18 Oct 2026 20:34:51 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd05c9255sm7373900a91.2.2026.10.18.20.34.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 20:34:51 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] usb: gadget: u_serial: use-after-free of gserial in gs_write()/gs_flush_chars() remote-wakeup path
Date: Mon, 19 Oct 2026 13:34:46 +1000
Message-ID: <20261019033446.73554-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

gs_write() and gs_flush_chars() cache

	struct gserial *gser = port->port_usb;

at function entry, before taking port->port_lock. In the
"if (port->suspended)" branch they drop port_lock and call
gserial_wakeup_host(gser) on that cached pointer, with no re-check of
port->port_usb -- unlike the sibling gs_start_tx() path in the very same
functions, which is guarded by "if (port->port_usb)" after re-acquiring
the lock.

gserial_wakeup_host() dereferences gser->func.config->cdev->gadget. A
concurrent gserial_disconnect() clears port->port_usb (under port_lock),
and the following unbind / function teardown frees the enclosing
struct f_acm / struct f_gser (which embeds the gserial) via ->free_func.
The cached gser is then used after free:

  BUG: KASAN: slab-use-after-free in gs_write+0x120/0x240
  Read of size 8 at addr ffff888006c5d430 by task ...
   gs_write+0x120/0x240
   n_tty_write+0x355/0xc30
   file_tty_write.isra.0+...
   vfs_write+...
   ksys_write+...
  Allocated by task ...:
   acm_alloc_func+0x34/0x1f0
   config_usb_cfg_link+0x15c/0x220
   configfs_symlink+...
  Freed by task ...:
   kfree+...
   acm_free_func+0x29/0x60
   config_usb_cfg_unlink+0x1a9/0x240
   configfs_unlink+...
   __x64_sys_unlink+0x34/0x50

gs_flush_chars() has the identical shape.

== Reproduction ==

acm gadget on dummy_hcd (CONFIG_USB_DUMMY_HCD, CONFIG_USB_U_SERIAL,
CONFIG_USB_CONFIGFS_ACM), KASAN. Put the bus into suspend so
port->suspended is set: write "auto" to the gadget's host-side
.../power/control with autosuspend_delay_ms=0, which makes dummy_hcd
suspend the port and run the gadget ->suspend / gserial_suspend. Then:

  - task A: write to /dev/ttyGS0  (enters the gs_write() suspended branch)
  - task B: echo "" > g1/UDC ; rm g1/configs/c.1/acm.0 ; rmdir g1/functions/acm.0
            (unbind + drop the acm function -> frees the gserial)

The gserial_wakeup_host(gser) call in task A then touches freed memory.
(I widened the window after the port_lock drop with a debug mdelay to make
it deterministic; without it this is a narrow race.)

The sibling gs_start_tx() call in the same two functions is guarded with
"if (port->port_usb)" after re-acquiring port_lock; the suspended/wakeup
branch dereferences the pre-lock cached gser with no equivalent check.
