Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DF32E8B64
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418327; cv=none; b=WfM8VuHMdSOi4kTTQi2/Sm8DvZs9gd3bdh1xfAUExTeXUF0fxqTz1VJUY2dAyWepwGuiHthR3yeGUeeJ1EMFpw9s+F3RM8p0xoUxu/6ArGYH2Pw7ooW3BlWffmkuL3gLXim2jxYp7doOJf3B1fOOmUF5VZLjuzbp2vrukIs8xa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418327; c=relaxed/simple;
	bh=zfpVwE/C7P0U1CMlr+A4eKfSJZmiYMDPOvpO8KOQ6wQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hlylKkFHK91C3MXhi05ORN4NYvb49w7f2coEBIBEm+OQsr/4LKkxo6lbkfiOd8HvseB1gTJKzjojTB5ERg4t4cLpp7lX+brvBM1stIQ1B0oxm9pvGl24KWLB0+Yod0mm84r9pdMchM9CI0i18Wcaza91un8gvXmc2dNJYphhzmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7ead32f5c6aso1471838a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418325; x=1789023125;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+feUEj/PJzrmIryiM/V/O8yhba+8sQ+wKzWwlx6ecYQ=;
        b=NgVl7as5PXUt5axvW4D62KjWejS3g6vpwisqubBO4v40EH9GN+aZDcACwgauYlOFqR
         an49SmjPxvys4f1h0za+OzZLXL4cnY+VisVu4+tjNAsDtpCY+f+yjdDgQfK2XpSFh5aF
         Y2C0I6MKaAvdSdpQDjEux7y/G4EVVMTusJolSd1aqEIPdSBJZz68XAHQEzVw6KvpiaEr
         2w44y0vc+jQlzgX/d2YCnZ01D8XoF5cfOyyfq+6PmT9NOupfLVGLFOL8WxU9mvUhvCCb
         bXIiC8OPtVqbl5yRtj/ht30xJ9KmNeXqi/NTVIRXZLwalBXYgwidcJmiygcJGTdCeTfD
         R28A==
X-Gm-Message-State: AFuF++mwrOiawuVDWYIGBNh1gyxu7sV4l7uSAtHOVgpXymyjydEIuHoj
	58vwesEK5a0lpu0cHwlnXKeODkHBG7mHel3ZLV4hLfMh2teyu+6/RAYENF8L/DtaJpytEqoKHVh
	xxjo4Oz4kuKqv2jFRO4iJvSOJ43EvVaBbuj68SOKND69qiX8I+UqPuCtToOM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:a0e:b0:6b1:4173:ca4a with SMTP id
 006d021491bc7-6b47d9bf9b9mr8843327eaf.11.1788418325182; Wed, 02 Sep 2026
 23:52:05 -0700 (PDT)
Date: Wed, 02 Sep 2026 23:52:05 -0700
In-Reply-To: <6a85e576.f7a79266.2f965f.003f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a991915.f03f19fe.169578.0002.GAE@google.com>
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

#syz test

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
@@ -562,7 +562,6 @@ int usb_driver_claim_interface(struct usb_driver
*driver,
        if (!iface->authorized)
                return -ENODEV;

-       dev->driver =3D &driver->driver;
        usb_set_intfdata(iface, data);
        iface->needs_binding =3D 0;

@@ -580,11 +579,19 @@ int usb_driver_claim_interface(struct usb_driver
*driver,
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
+                * skips ->probe() and attaches knode_driver so teardown is
safe.
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
@@ -2269,8 +2269,23 @@ int usb_set_configuration(struct usb_device *dev,
int configuration)
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
        unsigned resetting_device:1;    /* true: bandwidth alloc after
reset */
        unsigned authorized:1;          /* used for interface authorization
*/
+       unsigned claimed:1;             /* driver claimed before
device_add() */
+       struct usb_driver *claimed_driver;      /* driver for deferred bind
*/
        enum usb_wireless_status wireless_status;
        struct work_struct wireless_status_work;
--
2.34.1
