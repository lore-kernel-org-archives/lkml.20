Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918A33932D3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418772; cv=none; b=ciGNadlZjpdKjTo6DQizwz5z8fx5dXpBzEl1T6zxojT1VnoD3eVubcLes6aRzQ2O6SvYg2hB7Ld2PhIP/CQW94jDKU18bCC/XCEn3dxiwR4jYQiaCTmgDGh5n7zGFz1k/1mozrIGD3k0Kq+a142EyLF6e3UltcL/IBIAfrtvvLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418772; c=relaxed/simple;
	bh=AoN7vOanZv96QWsrrRoFGOG8To6SxuBoUFbXoEpFnlQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MZ2DgHDgCpPxvi8pxytGOL31/OExnMo+OY+gttIlCAOXv6+RSpSEvaTNMDGjwuRlrfgOFF4OwRa+J8aLl4RchkoFyo/sxABDZX1QF3dPBu0Z/3t0mFnJlzuLFBPZUSaUo2FfDFyeqZ1eTlKfNVLh86GYMJhSqKd65yf94cDl49Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b3962f71e7so2100696b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418769; x=1789023569;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rXk1ZPtHNRnSqIBUHJ5o3rHbpRWd6YIPTid6I3TT3Mo=;
        b=LKHnRiKPxsF4GPIpXO5BXi4RcQdhuH5tQqx5pG3kD9CffLTy1ZNhhdKyQYrhN0cWh2
         P6PWbZYRWeBZM0Iwbt1olwGTvE6vAiGqDJls5Ojg+Ns8pMM+oK0/X6JuOHOZH3GV11Si
         S4AnugEr4JnGIMxZSxr9eajABmxIPFNOuZcucfc0xdSsKUBG4thQTJHwF+M8a/i0WfCl
         3HekD/BhQyF4blM1Y7Na558UNrz/DFcRdMou1cPP0wH8l23WHJKzo2BDRwLAy23qhDAk
         wwM21rE1ygPu3XMuheklevdzuSygvxG/Q4RJvOBZNd31UNgEzMQ4vkDcwzkP4qaY0gUl
         rCUg==
X-Gm-Message-State: AFuF++nm/2k16qakZwFEJXcME0V6csgxAJLPUzpedcz/gsqRo+o1R2Bz
	rJNvHhbrOhtsNIBUoUQDDmOhwIbU8QzCMCuJyocf+7rIZqQxn20QSRVxFzfRekj9G7U1GL/6tXS
	uFhRRUkad6MVa5TbahzT9twrEIGqs0ABphQTzyLypgzJw3sDHh5433Iq87OE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:16a7:b0:6b1:29c1:3f37 with SMTP id
 006d021491bc7-6b47e6b34a4mr7296947eaf.23.1788418769378; Wed, 02 Sep 2026
 23:59:29 -0700 (PDT)
Date: Wed, 02 Sep 2026 23:59:29 -0700
In-Reply-To: <6a85e576.f7a79266.2f965f.003f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a991ad1.94649fcc.25487e.0006.GAE@google.com>
Subject: Forwarded: Re: [PATCH] usb: core: fix GPF on disconnect when
 interface claimed before registration
From: syzbot <syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [PATCH] usb: core: fix GPF on disconnect when interface claime=
d before registration
Author: khiemtranzo532001@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

usb_driver_claim_interface() sets dev->driver unconditionally before
checking device_is_registered(dev).  When called from usb_audio_probe()
during configuration, the interface device has not been added to the
driver core yet (device_add() is called later in usb_set_configuration()).

As a result, knode_driver is never attached to the driver's klist, but
dev->driver is set.  On subsequent disconnect, bus_remove_device() calls
__device_release_driver(), which calls klist_remove(&dev->p->knode_driver)
unconditionally on the uninitialized node, causing a general protection
fault:

  BUG: kernel NULL pointer dereference
  RIP: klist_remove+0x...
  Call Trace:
   __device_release_driver
   bus_remove_device
   device_del
   usb_disable_device
   usb_disconnect

Fix this by deferring the assignment of dev->driver for interfaces that
are not yet registered.  Instead, record the claim via two new fields in
struct usb_interface: a claimed bitflag and a claimed_driver pointer.
After device_add() completes in usb_set_configuration(), call
device_bind_driver() explicitly for claimed interfaces.

device_bind_driver() skips ->probe() (which is exactly what usb_audio
needs =E2=80=94 PCM and MIDI devices are created before bind), but it does
attach knode_driver to the driver's klist, making teardown safe.

The else-if branch in dd.c that handles dev->driver already set at
device_add() time (used by w1, usb_port, ccwgroup, pata_parport, and
others) is intentionally left untouched.

Reported-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3D87188222c77c0dbbdb4d
Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
---
 drivers/usb/core/driver.c  | 19 ++++++++++++++-----
 drivers/usb/core/message.c | 15 +++++++++++++++
 include/linux/usb.h        |  2 ++
 3 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index f63004417..59e74872b 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -562,7 +562,6 @@ int usb_driver_claim_interface(struct usb_driver *drive=
r,
        if (!iface->authorized)
                return -ENODEV;

-       dev->driver =3D &driver->driver;
        usb_set_intfdata(iface, data);
        iface->needs_binding =3D 0;

@@ -580,11 +579,19 @@ int usb_driver_claim_interface(struct usb_driver *dri=
ver,
        else
                pm_runtime_set_active(dev);

-       /* if interface was already added, bind now; else let
-        * the future device_add() bind it, bypassing probe()
-        */
-       if (device_is_registered(dev))
+       if (device_is_registered(dev)) {
+               dev->driver =3D &driver->driver;
                retval =3D device_bind_driver(dev);
+       } else {
+               /*
+                * Interface not yet registered: record the claim without
+                * setting dev->driver.  usb_set_configuration() will call
+                * device_bind_driver() explicitly after device_add(), whic=
h
+                * skips ->probe() and attaches knode_driver so
teardown is safe.
+                */
+               iface->claimed =3D 1;
+               iface->claimed_driver =3D driver;
+       }

        if (retval) {
                dev->driver =3D NULL;
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 75e2bfd74..73c630750 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -2269,8 +2269,23 @@ int usb_set_configuration(struct usb_device
*dev, int configuration)
                if (ret !=3D 0) {
                        dev_err(&dev->dev, "device_add(%s) --> %d\n",
                                dev_name(&intf->dev), ret);
+                       intf->claimed =3D 0;
+                       intf->claimed_driver =3D NULL;
                        continue;
                }
+               if (intf->claimed) {
+                       intf->dev.driver =3D &intf->claimed_driver->driver;
+                       ret =3D device_bind_driver(&intf->dev);
+                       if (ret) {
+                               dev_err(&dev->dev,
+                                       "device_bind_driver(%s) --> %d\n",
+                                       dev_name(&intf->dev), ret);
+                               intf->dev.driver =3D NULL;
+                               intf->condition =3D USB_INTERFACE_UNBOUND;
+                       }
+                       intf->claimed =3D 0;
+                       intf->claimed_driver =3D NULL;
+               }
                create_intf_ep_devs(intf);
        }

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 1da4ad161..0ec743e76 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -266,6 +266,8 @@ struct usb_interface {
        unsigned needs_binding:1;       /* needs delayed unbind/rebind */
        unsigned resetting_device:1;    /* true: bandwidth alloc after rese=
t */
        unsigned authorized:1;          /* used for interface authorization=
 */
+       unsigned claimed:1;             /* driver claimed before device_add=
() */
+       struct usb_driver *claimed_driver;      /* driver for deferred bind=
 */
        enum usb_wireless_status wireless_status;
        struct work_struct wireless_status_work;
--
2.34.1
