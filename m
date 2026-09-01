Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C466C438013
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234898; cv=pass; b=TzHJB7Mbzv6rtCVf3akaeS2q54cpyROMYOJ2FVwTJCBI3ALrzELq5mFyRrD3wwEQJQfE3AR3rN0TSlnV2WjlQgvLfUud6YjKVFpRZf2T3Hu3XGCxLBoaAy5X0LTW9oVZndVwLVnUV5jiUj3fKjRVgUmkp3VpIwkpbgaIHZm2Tcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234898; c=relaxed/simple;
	bh=p6Car4wLfCC9KNNoQ5FLbdWyWeAcQj3hc5NEF2Q1ifU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NJ6jkOtJcHi4AFKBfiHreCDHf9JkYop8vopGIFbJl04Mcks63Ev1XFr/9w/w4z5zCHjKtT/RcD2OSguIcLFaOm69nQSp5LciEXFYZuXjahS3OW3R6TAHbov4QoxaY4/Kl8NQRZyUpiyZF0SHBGu+9oa8owJSvEoHsEVL+Mx3zwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ym3TBudC; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ym3TBudC"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-52ff0b7c98aso30805751cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788234895; cv=none;
        d=google.com; s=arc-20260327;
        b=ncyijyzlfUU8nIxFOJlHlrIDqLWCJkK2WrjOH0yArd35NuO64bAv1ZsUGcuGyJsLru
         VRqBdXdQIRYCIPpe19t/qiDKB9sp96CbQ5sy2B0gsB0e6yyElLWx6lEKi5Aa2rOprdNm
         13fBh/G876erJAZRtnjxHHEg17Zt6BoJzah32xn6aIqMYPlb3mFH9CtXdMScE7hY8H0x
         rMWJQQBaWP7LZT3tz3AlcJ81VBogwKtnxecGtXxGu1wy1EPCdVZfByGO2NtyY8b0pfdD
         tW1nBQrYmbrRGpYcVL3QLJEXEmUEnCK+91vTy2cc8hdZm8VfoVVKBghqEDpxI9oFUDQi
         8g1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=p6Car4wLfCC9KNNoQ5FLbdWyWeAcQj3hc5NEF2Q1ifU=;
        fh=7+GtSLjKp9OiiL6+AWJ4mix20QjpHbynZmMRPdqZdjQ=;
        b=cy+ggNz+aMM2hUItGd6NR9MP7/IT0SvG0Y5N5D2qYxdeUwRTnnPaEXKV//Foz755wu
         a8PU+2AVeItod9VqofIGYb/Ag2XGOuzeg4ctap0cyPUibQldvVUbR2AfgamKiTTcGoUz
         Ln+T/ZfZZSXpol1t7ZDHIxCqUghVHrfZcJymk3BRU8Q0h/p4oxPHiettDiJNpn5TG+Av
         56lvjBrDD7GyPb8Zr3tnw2ZVdOqpoKV9gTomuxfaRsoGhtvjQdQvxTQTlmhOO9YLsVWH
         NGRi8/bEwwbMEXZsjHTmJ6vt/YhmcAHPXH5efUaM5k/YO3hGZhnFxoJQRlx14SP/3eDl
         s36g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788234895; x=1788839695; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6Car4wLfCC9KNNoQ5FLbdWyWeAcQj3hc5NEF2Q1ifU=;
        b=Ym3TBudCzV1a0rmBm4BiXjDTQsJIbNIMUioObI49+JpMCAvd1RWFooBMttVCFj6AQH
         8v0wOAz5bNZozcEit6oOpNVKZpGg/RopAtTLvbPdP6Rf5ubqyb+PCcepnkj2/pzPDAnY
         YHWKiRsRP3vV0Rwb7Peq+GINdzauF2+IYCBVNZZKVu7XDlilgWotAMhIyz1x79zbvnef
         WU/9s8Z1Gq7JylvQj0SayO18Hk1ljuWTZyRZ5eEbYObbDVhNzHVr2XrMQJ63kRYLVkPH
         QhQT3aX25qXr7FK/DeJi0uke+T9EigCbUqQZcd9Qrqfh/++KB+1RbqVbY9hFY8ngMro0
         Ptzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788234895; x=1788839695;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p6Car4wLfCC9KNNoQ5FLbdWyWeAcQj3hc5NEF2Q1ifU=;
        b=OMPIXb85Nqzr0JgD+eh5kRC2URk9QglbRVG46webdbGoslnEO9yfautmBwzDL8VhMG
         Qsl7xqM5zslR0ozb1Wfw+I15+DXyW+XvXrU//F2kz3wc62VBeev6eLkA1lSAdKg30yCY
         kQb04OUTJPDb/ztYp/jaTkVtQV/nPn5lna59kI9fuOYnGUTJcD+U42gpWj90vAc454q3
         B4h9WHGOfR/EWYm40VsO8FQQjlIR56oes5CKzgRJRW1J8Hi4SGtErYDnMxeVGnr2SwQr
         dH29ULGTWIF5bP2d3PGuNkBQ+iQomQHbtJe+UhbWFK69yqc6pUZLPp/oMhNtJY76HLzH
         o/+w==
X-Forwarded-Encrypted: i=1; AHgh+RqXZRIGxp8iy/vmFArkMCA+RTOQ2t5KlR6HKsa+O8S7aIYYNhnxZCg3ek6eE0K5pk2KnjONK7GtlfIW6Ng=@vger.kernel.org
X-Gm-Message-State: AFuF++mePMCM/DdQdXePX1rBqZ6rQyGSFGN3vD/U3sInGjesc9FgFCBl
	kbCLLI0qZtFYUnY4jk+JxBGUm8neFCBpqs+ZXgXI7CDTXqEDlk0sK9aI97mA1twBSf3ydA8103U
	Y6IAXoaSGUh37PcnSxUxCqRXMIjnHb9ciz74WTj9dRJEX
X-Gm-Gg: AR+sD10dK4cA6rBh5GAIfTSJfWAtyKT3OqlPermySLGYj/27N/CVrC9U/oEC7GtOE3i
	BB1yNywBVDwIWEn7/uCled5EQi5o+wr6aPoUT83eGef1g4Un/OVYKYvnoXU94USP1eIHUnZjJvt
	A+Jt18i8TPT67DzuEDAZFY+G01C5Bhf0NjPsne6xArLg82ihc9fP+S8FOJNgj7nAUTRuLZ2/vMZ
	1N/69ewc8wXBZFHeXMFt0lnBWQor5OlJbgW9jBm+a3QktKhMdLRFHDKYgGTNYB6rMkMBuQkvpo6
	vJOphYz6+BOiAVCT7jst1+qoZL/1SkdL13oFz/hBxnfTc7cj8q5zUXVGAwu9fOiUxWgGfx4F5SY
	aOWZnGV31XhkH51d0MkyQ200DzPGO
X-Received: by 2002:a05:622a:551:b0:52f:b0f9:e4f2 with SMTP id
 d75a77b69052e-52fb93d5108mr371246021cf.1.1788234895329; Mon, 31 Aug 2026
 20:54:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ZW Tang <tangzw515@gmail.com>
Date: Tue, 1 Sep 2026 11:54:43 +0800
X-Gm-Features: AcwNN1U_A0RRNxrNZ7TVVkm0IgIj8V4painWMfBL2quCl7WNYWN1-87P4mqd3Hg
Message-ID: <CAA2SOT5LP5kNmw5qG6OCDijBYQNZoxCiKGRM8zcbApN62UKnTA@mail.gmail.com>
Subject: [BUG] media: usb: siano: WARNING in free_large_kmalloc from smsusb
 cleanup path
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a warning triggered by a syzkaller USB reproducer on
Linux 7.2. The issue is reproducible with HEAD commit
45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229.

The reproducer connects a crafted USB device that is bound to the Siano
SMS USB media driver. During probe, the device repeatedly returns URB
errors. The driver then fails to start the device and enters the cleanup
path.

The relevant failure path is:

smsusb_probe()
smscore_start_device()
smsusb_term_device()
usb_free_urb()
free_large_kmalloc()

The warning is reported by mm/slub.c, but the root cause appears to be in
the Siano USB driver cleanup path. The page owner information shows that
the buffer was allocated through smscore_register_device() and later freed
through smscore_unregister_device(). After that, the cleanup path continues
to release URBs through usb_free_urb(), which reaches free_large_kmalloc()
and triggers the warning.

This looks like a URB/buffer lifetime or ownership mismatch in the smsusb
error path. A partially initialized Siano USB device can fail during probe,
and the cleanup path may free a buffer through an URB after the common
Siano device buffer has already been released or is no longer a valid
kmalloc allocation. The driver should make sure that URB transfer buffers
are not freed twice or freed through the wrong owner during failed probe
cleanup.

Reproducer:

syz reproducer: https://pastebin.com/raw/F41UFB6g
console output: https://pastebin.com/raw/riuUBdGs
kernel config: https://pastebin.com/raw/1ADB4Xp8

Kernel:

HEAD commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
git tree: torvalds/linux
kernel version: 7.2.0-14827-g45c13f3f9e3b #1 PREEMPT(full)

Relevant log:

smsusb:smsusb_onresponse: error, urb status -71, 0 bytes
smsmdtv:smscore_sendrequest_and_wait: sendrequest returned error -22
smsmdtv:smscore_set_device_mode: mode detect failed -22
smsmdtv:smscore_start_device: set device mode failed , rc -22
smsusb:smsusb_init_device: smscore_start_device(...) failed

------------[ cut here ]------------
WARNING: mm/slub.c:6724 at free_large_kmalloc+0x9a/0x110, CPU#1: kworker/1:1/30

CPU: 1 UID: 0 PID: 30 Comm: kworker/1:1 Tainted: G W
7.2.0-14827-g45c13f3f9e3b #1 PREEMPT(full)
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009)
Workqueue: usb_hub_wq hub_event

RIP: 0010+0x9a/0x110

Call Trace:
<TASK>
usb_free_urb+0xd0/0x120
smsusb_term_device+0x1d7/0x3e0
smsusb_probe+0x1aa3/0x2200
usb_probe_interface+0x71e/0xe00
really_probe+0x267/0xb20
__driver_probe_device+0x1f9/0x420
driver_probe_device+0x4f/0x240
__device_attach_driver+0x286/0x430
bus_for_each_drv+0x251/0x2e0
__device_attach+0x2b3/0x440
device_initial_probe+0xa1/0xd0
bus_probe_device+0x12a/0x220
device_add+0x7ec/0xb90
usb_set_configuration+0x19dc/0x2050
usb_generic_driver_probe+0x8d/0x150
usb_probe_device+0x1d3/0x3c0
usb_new_device+0xbc6/0x1ae0
hub_event+0x2c04/0x4ef0
process_scheduled_works+0xc97/0x1920
worker_thread+0xa59/0xfe0
kthread+0x38c/0x480
ret_from_fork+0x508/0xb90
ret_from_fork_asm+0x1a/0x30
</TASK>

page dumped because: Not a kmalloc allocation
page_owner tracks the page as freed

page last allocated via:
___kmalloc_large_node
__kmalloc_noprof
smscore_register_device
smsusb_probe
usb_probe_interface

page last free stack trace:
__free_pages_ok
smscore_unregister_device
smsusb_term_device
smsusb_probe
usb_probe_interface
