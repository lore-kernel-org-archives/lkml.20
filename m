Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D334B0E4B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.203
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596011; cv=pass; b=CSIr6BV9N5wl6f2JfENm47kyhfhv2yrzPDVo5xtGXcJhsUoy6NvjCbtyydc5dn0pFglUqx9e174bwRKjf2VslOko9FL+1L3aAjRPkpRceouhTydsJJhHOkNbOB9qRvxpwrqFYAc9LVU8UUXaAtEw0tnyifHRyir6XZ9PKQ0ukis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596011; c=relaxed/simple;
	bh=lBv8IBD6IJb/z9r6xNQnFgugXVsOeX1D0j5YFBOsNP8=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=orhQlUTsM2jymqTIMhffPCM1pa0QcrQbO+mjCb40PDrIV2UUVLCwsVOTDXPs/eOwrKIubiwjevHir6dH8AnNSDFuES1tdaGkbg/PevP9htzVBMaY3AO3pUjtIncQDvWokPCvKaEO9ikALYMbQMJr6/g3OUPedY/qjuWCFJ+YLGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEmd1BhH; arc=pass smtp.client-ip=74.125.231.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEmd1BhH"
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4e7133c0eeaso247424b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790596008; cv=none;
        d=google.com; s=arc-20260327;
        b=HPl4Ek9KX1rvyaJ5iis2lEKGgPDEK2Kz6eiGWYFQCpHJoc4ONWFhaISque/i8o+RQB
         r+EBvBABeKtevnpHv20Sf0MhyChHadP3042POMXmsJydvrWjdt3znFO04atJ177etqTv
         giNVrXDLj4UDW6qtYYVFAgji9KbbSCdhQymqcQYdEqetxPFI4YvaHCLTwW7Xy2J3I7Dy
         Bt6ctkzhupJI6vd2Lrk5XIkSwg9jHtUzMjqu91hOXXkJVr2Uod2AcefogaecS+qmi+kP
         54L8B1JF0pkkMU1dGt5jy643PRCf9wUkbOMbchmiVIDRoYzUWADA8GoMDK3/WHRwgWw0
         nuNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=8y/14vF+O1HeqA5emJg88NL5DefW60ELONqq7Ew71Mg=;
        fh=kcN3Ndz5bKhVKOoqw0gyyYpWkAdUsAHDCm8IRyXAdMQ=;
        b=Uf+0jPOzrlHfUCNWH+BkZvcMKnXNQVTpBfAuJTts6V5oikAwbPu/kA3Kvd8JU1yqMy
         2IUhpPptipCNKtvWouooP/n9924IJTiYnGh8jM2eKD2sfVmYKtNNDK+dNcryPMv9oTHn
         ImhEatoc+fOn0sxm2AJZ6FoTyFyiP1wswgyHnqtSWCIZKJkGaYJ9DTvRr/FheYIrBDBO
         HZzLTzpPc/zkOOb5GFYpRr7QPMLW+fz4unDV00pzaIys/F7zrKbABVnsyewEBmfg76i/
         RF+6+6eONDITkwAsmbgptaYyU9nnh7g9teBq2S/3kuuclio+EgJ+cBqKOrswZB6rFtJy
         H6iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790596008; x=1791200808; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8y/14vF+O1HeqA5emJg88NL5DefW60ELONqq7Ew71Mg=;
        b=fEmd1BhHfrHKOPJbcsNae+s3Qjv8xY7/kJNU/qJzo1aycD20k8tDOovLZxcZliA2B3
         1UR6ZsqPZFlNdsH9jf5ZOhVNoTWI2SUDCrF3pjjnbkAuE4NPinNzZKKbWHgb0PTfe7k1
         x0h/3oFwolKtCk/DbFHsHDdMDJag6rR6R43OWTV0+N+2f51mNjp1+h6FgsE2CJg5nIfE
         v5r7RjUdEywqXlDlRGf0jRqlrtX8qt0XwxgfopIsE4xPQQkPsmTIA8DOsSk3DVwEy9en
         Rzjaq96OGEl2HZytM9jKx4JEj6IO1kPI9Igdc4GY1dY48uILGGJIN/ipV5CgSxp/3TSW
         TbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790596008; x=1791200808;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8y/14vF+O1HeqA5emJg88NL5DefW60ELONqq7Ew71Mg=;
        b=dh8Di1CsC2oZ3ltBqkK72JL0uqSfE1a8Sq8FgwT4Xb6YftO/M+6AgnwneeEbs4y46p
         TFE7nypn+UGqEI3n2gjZczp7/T73Y10vxEWOXEoVgoD1Ivz2GtHxtPPkmAxIXAjddorz
         WrM0gnLB5Yvb9QPiORRMxV0Ych1bqtHNC1LJKXHPiS931W4Vt2b4yneJYlwHX/fHosWK
         rszi9vx6tQeMqQfL4+twAYnQ16cZtt3KmJSLrWhV2AqYhwP7sJLgfKaKCVGJ/Nlf7zsi
         25HjsGn96qfwU7IkGpWd7wF/DwPkvWdvwDlRghFzUJaid832k4czsS4vafyb2lFCA9YJ
         lgog==
X-Forwarded-Encrypted: i=1; AKwUvBz1Fg8+j3Xm0eeaKiBqy0pmel0lc9yarENm5JRuuRR1613SjyznEDEJ3wbf7jBjGXX25Ux/Tm7R9DoL2MM=@vger.kernel.org
X-Gm-Message-State: AFuF++lonhISTcti+61KRvv6K8Y4zt7WnKBFe7plDX5H+PizoHVMvylE
	NsMe2XCqcyCMurjZxVnePsmlj65WAv/q9yNS4ZWF4GlnTaAZRQXEezaSsKUZvlAqSLlNt6nAbtA
	HxsTMP8lVvzPGCa1y0GoyZCjYMwhqCJE=
X-Gm-Gg: AYBFou2/esrX8p4mds3Qavywte3IZyOy4/UkKVOxTtQLc3op7QHmEGQpbc+3G4Dp9Rz
	AqpR82TnvVa26AfIrC2QbTxSMTVUGpFQIDgfGC7i0tCNPa+wY9n9f6RXHdsYPiAuhHY8mLVn++E
	C89JAYdjVLVaJfLexJ5jQGD0Ny6I+Tr8T+zrXxnBibbCXESOTiOT5GCxpg3xMpY8sDtMTNN1ZIw
	uax1aYtz//Z9mf4ufPJgk64843gYDaQr0WNKeOgRMOwFjXvPnec23B7gbWdaqJTG8qJefVS3mN3
	KnQJkWtaGjBACva6jnidxeh8drx6bSIRbdMao2UwBwkTUHjyb8blzbAsgjUY04foIcMXHFOqXet
	6YFGUR4AICg==
X-Received: by 2002:a05:6808:bcc:b0:4b3:7da2:f393 with SMTP id
 5614622812f47-4d72c636b6cmr12794285b6e.15.1790596008135; Mon, 28 Sep 2026
 04:46:48 -0700 (PDT)
Received: from 578479312649 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 13:46:47 +0200
Received: from 578479312649 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 13:46:47 +0200
From: Aveline Noir <jm5905938@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 28 Sep 2026 13:46:47 +0200
X-Gm-Features: AclHuK8vvWWUjI-1FK5rP_VlhGDEQ4c_Oaxo0Aq7l7qcc2S08USGBF3bm-pvFn0
Message-ID: <CANOyQmEg5abcMc-Xk6=2hQQWu9vq9wevGR3spe352QLyxsZNEw@mail.gmail.com>
Subject: [PATCH 0/2] HID: picolcd: Fix output-request and framebuffer locking
To: =?UTF-8?Q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+912222e4cb82423535fa@syzkaller.appspotmail.com, bigeasy@linutronix.de, 
	linux-rt-devel@lists.linux.dev, deller@gmx.de, simona@ffwll.ch, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

This series fixes two PicoLCD locking problems. The first moves output
requests into sleepable context and serializes LED state updates. The
second breaks the last-close/deferred-worker lock dependency using a
private framebuffer update mutex.

The first patch was tested separately with the original syzkaller C
reproducer and bounded concurrent sysfs/UHID-destroy workloads on
PREEMPT_RT. The complete series additionally passed repeated framebuffer
open/write/close and persistent-open framebuffer tests. Pre-fix modules
reproduced the respective failures. Physical hardware, prolonged stress
and suspend/resume have not been tested.

Patch 2's Fixes tag identifies the fbdev change that began draining
deferred work from fb_release() while holding info->lock. Patch 1's Fixes
tag was checked against the upstream transport-conversion diff.

Aveline Noir (2):
  HID: picolcd: Move output requests out of spinlocked sections
  HID: picolcd: Avoid framebuffer last-close deadlock

 drivers/hid/hid-picolcd.h           |  4 +++
 drivers/hid/hid-picolcd_backlight.c |  7 ++--
 drivers/hid/hid-picolcd_core.c      | 46 +++++++++++++++---------
 drivers/hid/hid-picolcd_fb.c        | 56 ++++++++++++++++++-----------
 drivers/hid/hid-picolcd_lcd.c       |  7 ++--
 drivers/hid/hid-picolcd_leds.c      | 31 +++++++++-------
 6 files changed, 93 insertions(+), 58 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0
