Received: from mail-dl2-f38.google.com (mail-dl2-f38.google.com [74.125.229.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4491863CB
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790443654; cv=none; b=nStAjXnnrKfnk2TyDFAwmUld8hT0aGkVhQw4p1WWWQ1VhruyDJqyu6qX8CXjCp5UXpNQsKdQ88p2aXIOGkJPcvTIu6cNpykKIubXoGIBqqEXfSZI8ZWZtjdOOrtWUfpqBBErQYP3K9PRXYlB2l1gdRT97cnOj9/c1TmyhULRm2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790443654; c=relaxed/simple;
	bh=2ZTmtkIFSofC2JVrEOSYkSGryK/4WBfRMxRimqC7VJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uztnibM8/5/UBMcslSKFPqCm4kA4Ty1yYFbEAe3QercWTvzp+UlkKiN934VTlJETF9eoXPqDz8XK1rEL05aRcCdAS2YdTUXPVBw44XNXE4zH8WjG186T24yYJzPq1+z6xEcXwV9ABZYaV6Hi7IewcTvoawXJbiw++42sW69KIpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/yE7S3o; arc=none smtp.client-ip=74.125.229.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/yE7S3o"
Received: by mail-dl2-f38.google.com with SMTP id a92af1059eb24-141a5d476aaso46454c88.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790443650; x=1791048450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWkCXAv8KL7gS3gupSCkFH2TZ/H32WNAz15njK7x33c=;
        b=U/yE7S3oayvOj97t1Yo9gN7YzqOxqVAW2SMBXNxVvfzqDFfD07iJ5ToxAdkR7vz0Ym
         JXM+WSYourTGDdWd20ZKNvokQ368OB0qZJXuOTRsS7JXXPSdjCrCySngN2TUMs1wXvwu
         +MOMFLuWOKsJz6RIM2iioDCp5JPlwURX46y18gU0+HuM9jZPX7WEsI0ggq32ytAMZNJI
         GMyrSeH5yt3z9yUEB/b5fhnQb1gQ3dujEUYji3ZAoxrVS3eIqwO1uEEMVMcskzgatQQh
         cClD+IQMfNo/JdXPYF6ieVtSkOWJpAhkpHr+jLBmPN50R5XMaXIeUyIW/r7hVmDHEaDw
         BoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790443650; x=1791048450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWkCXAv8KL7gS3gupSCkFH2TZ/H32WNAz15njK7x33c=;
        b=joD7Mx1siRW0+joGrnuHa21Wgwckjry3emAhAEVrwBfFTHffNtr0KT5qM9frfbhxJv
         GirGFxLuNDVCn04IEHDAs09QIGA6NuEO7bFJTGCPMTav0I5H/Ou5bUNC7/AjQ43NpZW1
         +rTu3eH6a0MP+GVLi3m0EmVDzuDR2/HP85JsJbxdiBff8mdIBCmKX1yE6pMUhAfuZpOX
         YQGw9DXeRMU7oeqBMTQHWq3nX1v5AKRCZMqTvPyD/xUsltyV3kFSSBhWM1OWLpTSCjTD
         cpBbRUZhOlG4Gau3tMRpeR4fjWPhy6SqklzG+4kwGYZlC/w3NYshQhTfOO/fzI9VkL+H
         90ow==
X-Forwarded-Encrypted: i=1; AKwUvByORiM7+lpMhlN5V35BwMe4RUbUxeCjdTKIL4j+nI8zNu6Jf4lusYKo2vTyRuaW5wCegaP8Z96ZSpohFTo=@vger.kernel.org
X-Gm-Message-State: AFuF++kRxthqquSfGM0KhlALD357mi3uFA2HIo9tsjVJ8Buj1veZP8pv
	eCJmGRfZ98rilIjIbdCOBokgdrOpDlW3pVmYmiTiVxI5FDkZIP5Fq8Tlz2Gov+kRgyFjkA==
X-Gm-Gg: AYBFou0zGJbEb4AuvLSRRCxTyfqWNa3GGDkHl1NpYAO8ysyCiZFBjYMSCk/A/BQZT8Z
	GuEniiwwOJJg+4XqbnjYfng+muUmyBYNryU3Z4W1Qfxwo7qg0yyG9wKk0UPNpU+INBIoFcuFcbr
	5nPQbTXbXyZpHrkDoHoN2NFLr/b1SbJQmdNuHkIhkX8wEvZiJ6fhwE7cU8W6KFdZmhUfpTEb6ZR
	Wvm2BUiCypxPNAw8i/6yvW1D0wGYWgDnMpTLGYARP/AlfRYoA2B6TvL5JaQKoK3Apf10GjyKjkP
	y91046IaVCPSXpcC1CEhC2Om597vK3btFzg0o+N6XbcDAAqd+ljubnEAZb2yID3ED/zLnbeIGSx
	6jt1H+GrITywWUdtBZa1bsEZf1RCuzjvQIIsKyTaaq+rL912gJvcsqvlsnN7iAgWFCC4FxIGv48
	lKse3+xNk6IFgEmxtnzKgR1g5sJLo2FufWGPpKRLo8e2Dn4U19z7Dx4wpGbqkEPM6GzN40XXNvY
	+UPoLPwwZoIwrHlnhp7XO07BCx52GY2geEa4FFL5olwQCbcRoM0Ao3sFuzIh4ZulamiMg==
X-Received: by 2002:a05:701a:c919:b0:143:3240:89ac with SMTP id a92af1059eb24-146cfdcef79mr6165010c88.2.1790443650232;
        Sat, 26 Sep 2026 10:27:30 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145a7318afcsm13436097c88.0.2026.09.26.10.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:27:29 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	Tim Bird <tim.bird@sony.com>,
	Kees Cook <kees@kernel.org>,
	Peter Hurley <peter@hurleysoftware.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] Bluetooth: RFCOMM: Fix initial port reference race
Date: Sun, 27 Sep 2026 01:27:23 +0800
Message-ID: <20260926172723.2405885-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For RFCOMM_RELEASE_ONHUP devices, rfcomm_tty_install() and
__rfcomm_release_dev() both use RFCOMM_TTY_OWNED to decide who drops the
initial tty_port reference. The release path tests the bit separately
from the install path setting it, so both can drop that reference.

The synchronous hangup does not prevent this race: port->tty is not
assigned until tty_port_open(), after installation. The following
interleaving is possible:

  1. Install and release each obtain a reference with rfcomm_dev_get().
  2. Release observes RFCOMM_TTY_OWNED clear.
  3. Install sets RFCOMM_TTY_OWNED and drops the initial reference.
  4. Release drops the same initial reference again.
  5. TTY cleanup drops its reference and frees the device.
  6. Release performs its final tty_port_put() on the freed port.

KASAN reported:

  BUG: KASAN: slab-use-after-free in tty_port_put+0x22/0x190
  Write of size 4 at addr ffff8881001d3d5c by task poc/92

  Call Trace:
   tty_port_put+0x22/0x190
   rfcomm_dev_ioctl+0x1d4/0x1930
   sock_do_ioctl+0x110/0x260
   sock_ioctl+0x380/0x590
   __x64_sys_ioctl+0x134/0x1c0

  Allocated by task 88:
   rfcomm_dev_ioctl+0x8f6/0x1930
   sock_do_ioctl+0x110/0x260
   sock_ioctl+0x380/0x590
   __x64_sys_ioctl+0x134/0x1c0

  Freed by task 65:
   kfree+0x131/0x3c0
   rfcomm_dev_destruct+0x23b/0x2f0
   release_one_tty+0xc1/0x370
   process_one_work+0x661/0x1090

Use test_and_set_bit() in both paths so that only the caller that changes
RFCOMM_TTY_OWNED from clear to set drops the initial reference. Each path
keeps its own lookup reference until release or TTY cleanup, preserving
the existing callback ordering and error handling.

Fixes: 80ea73378af4 ("Bluetooth: Fix unreleased rfcomm_dev reference")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 net/bluetooth/rfcomm/tty.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/rfcomm/tty.c b/net/bluetooth/rfcomm/tty.c
index b2c1060394e6..dc3cdf614def 100644
--- a/net/bluetooth/rfcomm/tty.c
+++ b/net/bluetooth/rfcomm/tty.c
@@ -462,7 +462,7 @@ static int __rfcomm_release_dev(void __user *arg)
 	/* Shut down TTY synchronously before freeing rfcomm_dev */
 	tty_port_tty_vhangup(&dev->port);
 
-	if (!test_bit(RFCOMM_TTY_OWNED, &dev->status))
+	if (!test_and_set_bit(RFCOMM_TTY_OWNED, &dev->status))
 		tty_port_put(&dev->port);
 
 	tty_port_put(&dev->port);
@@ -724,10 +724,9 @@ static int rfcomm_tty_install(struct tty_driver *driver, struct tty_struct *tty)
 	 * when the last process closes the tty. The behaviour is expected by
 	 * userspace.
 	 */
-	if (test_bit(RFCOMM_RELEASE_ONHUP, &dev->flags)) {
-		set_bit(RFCOMM_TTY_OWNED, &dev->status);
+	if (test_bit(RFCOMM_RELEASE_ONHUP, &dev->flags) &&
+	    !test_and_set_bit(RFCOMM_TTY_OWNED, &dev->status))
 		tty_port_put(&dev->port);
-	}
 
 	return 0;
 }
-- 
2.43.0

