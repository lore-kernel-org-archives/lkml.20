Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693777;
	b=Yl+ZDeOB3RxjHbanSsChgTdNBRIA+uh6xX+NcDm8EX/4RgvHJrjwyjzZ23W6NgOGI4BN
	 AVz6v/JoXGVpxsbbEjM+L4PoBNaD+HckeNNCT8c58AX9dDflHr28+CvNG1QPH0dyRmbt7
	 2R2OU72tBzrMY/nWJge3a9CUr8Hnl+SAIEA/+o0Nd4TmTbYRp3kDGB7VnuwNJvSQtr4pD
	 IFfL9/39r36GSEQLBy4RWrockjfZEUe+8bV6GSBl6N7FpvmU0/ljzY5ehlmylMvnMLq45
	 IgGFlxRaHTaDzDGb0AXHx/dhS1mvvKclR5rbE/E9aBMdB8w1zw4WOnJihC4seivwmug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fNpgdSLyU0f9T1YtM2kvzGFULXH+7u9XixMiyrfLAIo=;
	b=PjhFdHlMlHthhe1sBpzTKZs5oQJTKMoltI3Ac/Or+6SJjvcSNkk2RcDwCzv9xdl6NK99
	 Md1kKCtd72TtgqvHNK7DxsOnC0gABZa31jSJ2ztkdum50lILkDqSuH6ipTgtRwRHM6/1O
	 nJSSaPz/wE4kvq9py+qn5+VRQfB8WCjGXNlEpw6JfNhpmqvzllE7OGHO+LAjKv8Ld7+Z4
	 FPzOiZ6llvX/8AB1tvUhE2qHKeNVa0j8v+HmuJ2jHJ0JvJMNuTbbqEDnz941XVXJX+Vvk
	 EpFKScSJElVlpvevTd/k87jdaZcJjrAOpD5AzsQOB58RcfRtBPuC9/qZuAooHZjSdzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sanglardf.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=byL+frIk;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DE3606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4DE3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sanglardf.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=byL+frIk
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so161671c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792693776; x=1793298576; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNpgdSLyU0f9T1YtM2kvzGFULXH+7u9XixMiyrfLAIo=;
        b=byL+frIkFyfOHmkKgw/m82fikBFuob4P3HvYNGqlai/88pwgy26IMlJImMxdpCjudP
         Dppfx/TVcFa/PTr4ROVNITLZ3JDWJXLBTVmgJVpviDFxBlZc62eChuLm1uIXEzNy/9L9
         AFe3yEKO/wqG4BzBY19rQ4nW1JrVkmkLuJ4dRQcEhjb2jVf2rRjlMcmJZjxuLlzv/c18
         hYPRTIyB/FqqKpUX5+XrjrkrPc2WuNAaNmfgXjulfh43rrUBRWPTbXnigqK33efjCqm0
         MZKiQD8TB+vq8kIjANhTH5jSx10LA244Fjfw2cFQUdX7jIYegOkX8cACqyomgfCXiZY7
         h8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693776; x=1793298576;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fNpgdSLyU0f9T1YtM2kvzGFULXH+7u9XixMiyrfLAIo=;
        b=1JXDzgUXthJbKMdnWcby7ics4y+vj5aUHw66Wy/MGJvHqA9aJbDfTtTtyU4+Gyn2lH
         F9EyKPSiSo4Rad9b6NGnDx1jqZZZdpfyPNs2TcMRifjR+CIh0+D1a6j/2h0d21RGkw3v
         xzOSHYaDqjVKfAGqOe8Pu9B/LYLRn/jK3vJNJ4AqOzoGTFcxqyOAl3iSz3TKx1KA9fAP
         xeBAq1jM670lGPdRxTfgt9k/84ZZq52UXIMTY+Sj+jXFMSbUWGdV4exjBPne8AAsI9M8
         VjEr2YsYNGCFvcowPQwZO0K+1FqwU8eqViFH/cHM1xlqOmSYoX2FW6R8KfNIBaMi/nk3
         3+Ow==
X-Forwarded-Encrypted: i=1; AKwUvBx8NhLNFeQurM9axNyuxE3PQ0p1wTLKYafWUAG9a10//BhMOraGQrkX18m7R+lU6ENlSMLAyZ6DZxdP0OU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5F45hwAsZ6rhQJzzjdbA6EJi4aZqmA+Lsz/gYREDBiaIlquth
	eJEtfwFwVXkztoxQtHkAqDZf9eIJSyDNhcFWDqf0RWFz8ldBkhCFYVqg0gM5qNYTiPcr6JpPBKk
	ly7E03hkQKLVz10JKFw==
X-Received: from dlbts17-n2.prod.google.com ([2002:a05:7022:b051:20b0:18f:4e29:3ddd])
 (user=sanglardf job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4551:10b0:166:4b44:66e9 with SMTP id a92af1059eb24-195c5f9ab58mr70105c88.32.1792693775457;
 Thu, 22 Oct 2026 11:29:35 -0700 (PDT)
Date: Thu, 22 Oct 2026 18:29:32 +0000
In-Reply-To: <f86ca4e0-b294-42cb-b51a-d9e9984544ef@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <f86ca4e0-b294-42cb-b51a-d9e9984544ef@suse.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022182932.3262876-1-sanglardf@google.com>
Subject: Re: [PATCH] usb: core: Emit KOBJ_CHANGE on unbound interface
From: Fabien Sanglard <sanglardf@google.com>
To: gregkh@linuxfoundation.org
Cc: oneukum@suse.com, stern@rowland.harvard.edu, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Fabien Sanglard <sanglardf@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2026 at 07:01:31AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Oct 13, 2026 at 09:48:21AM -0700, Fabien Sanglard wrote:
> > But it might be worth "trying". I am unsure what the kernel team
> > philosophy is in this regard. If you all agree, we could trigger the
> > KOBJ_CHANGE event unconditionally inside rebind_marked_interfaces()
> > instead of conditionally inside usb_rebind_intf().
>
> Please try and test to verify.

On Wed, Oct 21, 2026 at 10:01:24AM +0200, Oliver Neukum wrote:
> On a generic note, it seems to me that you are concerned about
> an unavoidable case. You can check whether an interface is
> unclaimed. Yet you have no way to ensure that the result of
> your check is still current and thus valid, at time you act
> upon it.
>
> In other words, you were about to design an interface that is
> inherently racy. That is not a good idea.

Emitting KOBJ_CHANGE unconditionally on the usb_device (&udev->dev.kobj)
in usb_reset_device() when ret == 0, right after
usb_unbind_and_rebind_marked_interfaces(udev), avoids the racy
unclaimed-interface check and is in line with the earlier feedback
("Why not always tell user space that a device has been reset?").
Instead of asserting that an interface is unclaimed, the event simply
tells userspace that the device has changed and, if tracked, should be
re-inspected.

I tested this across devices with snd-usb-audio (no pre/post_reset),
usbhid (with pre/post_reset), and usbfs (adb) using udevadm monitor:

Interface driver                Uevent sequence on reset (ret == 0)
--------------------------------------------------------------------------
Kernel (no pre/post_reset)      UNBIND(intf) -> BIND(intf) -> CHANGE(dev)
Kernel (with pre/post_reset)    CHANGE(dev)
Userspace (usbfs, e.g. adb)     UNBIND(intf) -> CHANGE(dev)

In all cases, CHANGE(dev) is emitted after in-kernel interface
rebinding has finished, notifying userspace that the reset is complete.
Because it is a usb_device uevent, it also includes DEVNAME (which
usb_interface uevents lack), making it trivial for usbfs clients to
re-inspect and re-claim the device without polling.

Thanks,
Fabien

-- >8 --
Subject: [PATCH v2] usb: core: Emit KOBJ_CHANGE when usb_reset_device() succeeds

When usb_reset_device() succeeds without re-enumerating the device,
userspace receives no device-level uevent indicating that the reset has
completed. For usbfs clients such as adb, usb_forced_unbind_intf()
unbinds the interface before the port reset, and device_attach() leaves
it unbound afterward because no kernel driver matches. Since usbfs
suppresses uevents on interface claim/release, userspace receives
UNBIND(intf) before the reset and no event when the device is ready to
be re-claimed, forcing it to fall back to polling /dev/bus/usb.

Emit KOBJ_CHANGE on &udev->dev.kobj in usb_reset_device() when the reset
succeeds, after usb_unbind_and_rebind_marked_interfaces(udev), so
userspace is notified (with DEVNAME) once the reset and all kernel
interface rebinding are complete.

Suggested-by: Oliver Neukum <oneukum@suse.com>
Signed-off-by: Fabien Sanglard <sanglardf@google.com>
---
Changes in v2:
- Emit KOBJ_CHANGE on &udev->dev.kobj in usb_reset_device() after
  usb_unbind_and_rebind_marked_interfaces() when ret == 0, instead of
  on the interface in usb_rebind_intf().
- v1: https://lore.kernel.org/linux-usb/20261012171609.88273-1-sanglardf@google.com/

 drivers/usb/core/hub.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index b446905b4..4db428adf 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -6447,8 +6447,10 @@ int usb_reset_device(struct usb_device *udev)
 		}
 
 		/* If the reset failed, hub_wq will unbind drivers later */
-		if (ret == 0)
+		if (ret == 0) {
 			usb_unbind_and_rebind_marked_interfaces(udev);
+			kobject_uevent(&udev->dev.kobj, KOBJ_CHANGE);
+		}
 	}
 
 	usb_autosuspend_device(udev);
-- 
2.55.0
