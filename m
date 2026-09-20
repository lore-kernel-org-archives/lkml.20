Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09C42475CB
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789931585; cv=none; b=Q0W5vtvc5017LiXgorXxYRMPobkUWL6b/kGKeBQKgDVQ2OKQrTyhQhD6i9U6yB79a/S8K7wHYTuJzvCWt+CyfbygHR3FcQz/srVL8bmQxgMtXw38KNdV1ojvXtHn2ipeMOlExhX8g4xUSh1Bb/yR+tb/enpDOiS2c4VHDUJz+U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789931585; c=relaxed/simple;
	bh=YEjQFcOrPFVjwdYOCtNO28v9xVJqqgJhudYWVt/+NEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIOAJtLdWzsWKljjQWFvrbAH6T4NRtnegSQ+PWxgIm3xXcjiyLYZ/rUNOyOBMCZrN2DfWTtmPpGMHon4lHzdtRQgwIIKTje7rS+B4Zj/GVf37o+IJ2teE64I/xMSJIZX3D6ludJO5grq2EPV5com89kKKT+mwelsWB7Fvao0RL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=VkEyUHPo; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="VkEyUHPo"
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id 933493FA78
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:13:01 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id C6E3F3EAA3
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:13:00 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id D40F4201DEE
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:12:59 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1789931580;
	bh=PP2xkROBk2d3jxL7NGZhYF3KCnxtTFztqXPj5w6TCSQ=;
	h=Received:From:Subject:To;
	b=VkEyUHPoqyWO4rBzPQz65IX1StBhilo1mJhnIkLWDsNovzttRaKZm6vJ5W76IJNXW
	 mXY/DHQ+IETCMazlBQb9OnRr58pcqeLP5iN/pUa+Rv/A6RVeOGVjuxSJCsr33x4I+q
	 s5BAG54DQ/mxh1+8GK5Mmg3u6PDk+EXdSvyr5Tou0zyiPayF14w4j0jcX1++Ae21Z/
	 LuloCNAzU07kBclSpirFqyXFize1P/POn9ZHe7ifbxbn4u8F2QgpusTlpl9ntuV3Og
	 YV7HRL+U7Ar0b9+ay3USWKDkDfC3l+5Tq4Plczm2+AEAYkIgSSjLgw9GdRMSxnxKL8
	 kfqF/tzGfDUpw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.228.41) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pz2-f41.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pz2-f41.google.com with SMTP id
 d2e1a72fcca58-8692a8568e9so1938031b3a.3
        for <linux-kernel@vger.kernel.org>;
 Sun, 20 Sep 2026 12:12:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBzhpXmRs9mcJNkz50hr4LcXSr33Qd+dffVIilAcZNzX7JnkzKLUO9oN3gPf3De8QlO4zamCN2dD3BFHSNs=@vger.kernel.org
X-Gm-Message-State: AFuF++n7HcWP/FD6uw/CciO6wIi3LwLuWdz5LRAsYKfoHuF8DZgvezoT
	mHv4f0Md6rihCVLeH+ZPl3tPapfCl66/ph5oQ+MwxDZQDqUjZ9+FgX9O9YA0xi4DSbX6MZ8zShN
	ixO/tYiREPcd0CnlTjE3dEv6XbKTY5Rg=
X-Received: by 2002:a05:6a21:9086:b0:3dd:a196:9077 with SMTP id
 adf61e73a8af0-3dda196af91mr8166784637.65.1789931578377; Sun, 20 Sep 2026
 12:12:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727215947.118292-1-begeebe@gmail.com>
 <20260728083529.329772-1-begeebe@gmail.com>
 <20260728083529.329772-3-begeebe@gmail.com>
 <CAGwozwFAcHh0iUsKRcvtMe=Cn+pdNXAoSYqZ09k2srsSrqWs_w@mail.gmail.com>
 <5e115a2e-5317-0238-86aa-d9e75cf18dbe@linux.intel.com>
In-Reply-To: <5e115a2e-5317-0238-86aa-d9e75cf18dbe@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 20 Sep 2026 21:12:47 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwEcCDLhgKnmvn7TB7ziEWNGKHVGzGvbr+UDYy14EY-HJQ@mail.gmail.com>
X-Gm-Features: AcwNN1Vu1JQMwKn6dzfTj8nU-oG8y9e8TfpJ2g8pQ-N2vcoQ1cLVhkmPmE78ees
Message-ID: 
 <CAGwozwEcCDLhgKnmvn7TB7ziEWNGKHVGzGvbr+UDYy14EY-HJQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/x86: oxpec: Report tablet mode on
 OneXPlayer detachables
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Alexander Egorov <begeebe@gmail.com>, platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>, derekjohn.clark@gmail.com,
 samsagax@gmail.com,
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <178993158008.1731691.11634256621080714311@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 15 Sept 2026 at 14:46, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 30 Jul 2026, Antheas Kapenekakis wrote:
>
> > On Tue, 28 Jul 2026 at 10:35, Alexander Egorov <begeebe@gmail.com> wrot=
e:
> > >
> > > The OneXPlayer X1 family and Super X have detachable pogo-pin
> > > keyboards. The firmware does not expose a tablet-mode input switch.
> > >
> > > The Super X keyboard enumerates as 1a86:1305. The X1 family folio
> > > keyboard enumerates as 258a:001e.
> > >
> > > Register an input device on these boards and report SW_TABLET_MODE fr=
om
> > > the model-specific pogo keyboard USB hotplug state. Other USB and
> > > Bluetooth keyboards do not affect the switch.
> > >
> > > A complete dump of the 256-byte Super X EC register map was compared
> > > with the keyboard attached, detached, and reattached. No register
> > > changed predictably with the attachment state.
> > >
> > > Tested on a OneXPlayer Super X. Mutter enables accelerometer-driven
> > > display rotation only while the pogo keyboard is absent.
> > >
> > > Assisted-by: Codex:gpt-5.6
> > > Signed-off-by: Alexander Egorov <begeebe@gmail.com>
> > > ---
> > >  drivers/platform/x86/Kconfig |   2 +
> > >  drivers/platform/x86/oxpec.c | 103 +++++++++++++++++++++++++++++++++=
++
> > >  2 files changed, 105 insertions(+)
> > >
> > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> > > index b54b521..3bcbd49 100644
> > > --- a/drivers/platform/x86/Kconfig
> > > +++ b/drivers/platform/x86/Kconfig
> > > @@ -1055,6 +1055,8 @@ config OXP_EC
> > >         depends on ACPI_EC
> > >         depends on ACPI_BATTERY
> > >         depends on HWMON
> > > +       depends on INPUT
> > > +       depends on USB
> > >         depends on X86
> > >         help
> > >                 Enables support for the platform EC of OneXPlayer and=
 AOKZOE
> > > diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpe=
c.c
> > > index df29e41..5c07a35 100644
> > > --- a/drivers/platform/x86/oxpec.c
> > > +++ b/drivers/platform/x86/oxpec.c
> > > @@ -18,10 +18,12 @@
> > >  #include <linux/dmi.h>
> > >  #include <linux/hwmon.h>
> > >  #include <linux/init.h>
> > > +#include <linux/input.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/module.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/processor.h>
> > > +#include <linux/usb.h>
> > >  #include <acpi/battery.h>
> > >
> > >  /* Handle ACPI lock mechanism */
> > > @@ -55,6 +57,8 @@ enum oxp_board {
> > >
> > >  static enum oxp_board board;
> > >  static struct device *oxp_dev;
> > > +static struct input_dev *oxp_tablet_mode_input;
> > > +static struct notifier_block oxp_usb_notifier;
> > >
> > >  /* Fan reading and PWM */
> > >  #define OXP_SENSOR_FAN_REG             0x76 /* Fan reading is 2 regi=
sters long */
> > > @@ -293,6 +297,74 @@ static const struct dmi_system_id dmi_table[] =
=3D {
> > >         {},
> > >  };
> > >
> > > +#define OXP_KEYBOARD_VID_QINHENG       0x1a86
> > > +#define OXP_KEYBOARD_PID_K2445         0x1305
> > > +#define OXP_KEYBOARD_VID_HAILUCK       0x258a
> > > +#define OXP_KEYBOARD_PID_HAILUCK       0x001e
> >
> > These defines need to go above with the other defines.
> >
> > Can you explain the reasoning behind the name PID_K2445 and PID_HAILUCK=
?
> >
> > > +
> > > +static int oxp_find_keyboard(struct usb_device *udev, void *data)
> > > +{
> > > +       bool *keyboard_attached =3D data;
> > > +       u16 vid =3D le16_to_cpu(udev->descriptor.idVendor);
> > > +       u16 pid =3D le16_to_cpu(udev->descriptor.idProduct);
> > > +
> > > +       switch (board) {
> > > +       case oxp_x1:
> > > +               if (vid =3D=3D OXP_KEYBOARD_VID_HAILUCK &&
> > > +                   pid =3D=3D OXP_KEYBOARD_PID_HAILUCK)
> > > +                       *keyboard_attached =3D true;
> > > +               break;
> > > +       case oxp_super_x:
> > > +               if (vid =3D=3D OXP_KEYBOARD_VID_QINHENG &&
> > > +                   pid =3D=3D OXP_KEYBOARD_PID_K2445)
> > > +                       *keyboard_attached =3D true;
> > > +               break;
> > > +       default:
> > > +               break;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int oxp_usb_notify(struct notifier_block *nb,
> > > +                         unsigned long action, void *data)
> > > +{
> > > +       struct usb_device *udev =3D data;
> > > +       u16 vid =3D le16_to_cpu(udev->descriptor.idVendor);
> > > +       u16 pid =3D le16_to_cpu(udev->descriptor.idProduct);
> > > +       bool keyboard =3D false;
> > > +
> > > +       switch (board) {
> > > +       case oxp_x1:
> > > +               keyboard =3D vid =3D=3D OXP_KEYBOARD_VID_HAILUCK &&
> > > +                          pid =3D=3D OXP_KEYBOARD_PID_HAILUCK;
> > > +               break;
> > > +       case oxp_super_x:
> > > +               keyboard =3D vid =3D=3D OXP_KEYBOARD_VID_QINHENG &&
> > > +                          pid =3D=3D OXP_KEYBOARD_PID_K2445;
>
> Why are you doing these manually instead of constructing proper usb id
> table, etc.?
>
> > > +               break;
> > > +       default:
> > > +               break;
> > > +       }
> > > +
> > > +       if (!keyboard)
> > > +               return NOTIFY_DONE;
> > > +
> > > +       switch (action) {
> > > +       case USB_DEVICE_ADD:
> > > +               input_report_switch(oxp_tablet_mode_input, SW_TABLET_=
MODE, false);
> > > +               break;
> > > +       case USB_DEVICE_REMOVE:
> > > +               input_report_switch(oxp_tablet_mode_input, SW_TABLET_=
MODE, true);
> > > +               break;
> > > +       default:
> > > +               return NOTIFY_DONE;
> > > +       }
> > > +
> > > +       input_sync(oxp_tablet_mode_input);
> > > +       return NOTIFY_OK;
> > > +}
> > > +
> > >  /* Helper functions to handle EC read/write */
> > >  static int read_from_ec(u8 reg, int size, long *val)
> > >  {
> > > @@ -948,6 +1020,7 @@ static const struct hwmon_chip_info oxp_ec_chip_=
info =3D {
> > >  /* Initialization logic */
> > >  static int oxp_platform_probe(struct platform_device *pdev)
> > >  {
> > > +       bool keyboard_attached =3D false;
> > >         struct device *dev =3D &pdev->dev;
> > >         struct device *hwdev;
> > >         int ret;
> > > @@ -965,6 +1038,33 @@ static int oxp_platform_probe(struct platform_d=
evice *pdev)
> > >                         return ret;
> > >         }
> > >
> > > +       switch (board) {
> > > +       case oxp_x1:
> > > +       case oxp_super_x:
> > > +               oxp_tablet_mode_input =3D devm_input_allocate_device(=
dev);
> > > +               if (!oxp_tablet_mode_input)
> > > +                       return -ENOMEM;
> > > +
> > > +               oxp_tablet_mode_input->name =3D "OneXPlayer Tablet Mo=
de Switch";
> > > +               oxp_tablet_mode_input->phys =3D "oxp-platform/input0"=
;
> > > +               oxp_tablet_mode_input->id.bustype =3D BUS_HOST;
> > > +               input_set_capability(oxp_tablet_mode_input, EV_SW, SW=
_TABLET_MODE);
> > > +
> > > +               ret =3D input_register_device(oxp_tablet_mode_input);
> > > +               if (ret)
> > > +                       return ret;
> > > +
> > > +               oxp_usb_notifier.notifier_call =3D oxp_usb_notify;
> > > +               usb_register_notify(&oxp_usb_notifier);
> > > +               usb_for_each_dev(&keyboard_attached, oxp_find_keyboar=
d);
> > > +               input_report_switch(oxp_tablet_mode_input, SW_TABLET_=
MODE,
> > > +                                   !keyboard_attached);
> > > +               input_sync(oxp_tablet_mode_input);
> > > +               break;
> > > +       default:
> > > +               break;
> > > +       }
> > > +
> > >         return 0;
> > >  }
> > >
> > > @@ -1005,6 +1105,9 @@ static int __init oxp_platform_init(void)
> > >
> > >  static void __exit oxp_platform_exit(void)
> > >  {
> > > +       if (board =3D=3D oxp_x1 || board =3D=3D oxp_super_x)
> > > +               usb_unregister_notify(&oxp_usb_notifier);
> >
> > You used a switch statement above. Match the logic and use a switch
> > statement here too.
>
> Yes, definitely.
>
> > Give it a few days before sending a V3 for Ilpo to reply.
> >
> > @Ilpo do you think this is an acceptable expansion for the EC driver?
>
> Often platform drivers start with a one feature, and may even be very
> specifically named after that feature, but then more platform stuff gets
> added.
>
> (Even our mailing list now bears "x86" in its name despite the scope of
> platform drivers having expanded also to non-x86 platforms.)

I am waiting for feedback from a user with an X2Mini Pro and I should
be able to test on an X1 this week.

Then  I will do another feedback round so we should be able to unblock this=
.

Antheas

> --
>  i.
>
> > The rest of the patch looks fine to me.
> >
> > Best,
> > Antheas
> >
> > > +
> > >         platform_device_unregister(oxp_platform_device);
> > >         platform_driver_unregister(&oxp_platform_driver);
> > >  }
> > > --
> > > 2.55.0
> > >
> > >
> >
>
>

