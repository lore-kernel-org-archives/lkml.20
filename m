Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E23F331A57
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417994; cv=none; b=XhWEn7WXIg0a9yijLGVD+hcuIX7l2dj8vUbAjKnn5L2tB20A9Exg7a/a/srqbw6RNavGB3x2WuFEOaLsp/uaO2NH8+a3leRhk2U4LOsCzHTWuGpZ0cUAOoOFsIHCeC4Sp4+pyjfSh4tyG6hPyV1u/b8iIH2Ui40+jUg1tmBGoEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417994; c=relaxed/simple;
	bh=mMCZGUtQFlO0+3Kc0V2oYcS2J9KKJD1SnRg2xFQ6Kco=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=g8Td6++1JmjNQgsqRIxtiHzJSTTaHivFVubqWCXXSJcOvLsXw+X+EPpwKPG5r45AzWHErMNFr5qNDEkvXWnjInIHBH4dOsCys9oOkp6Vj0+/USdp2Qx8y3qtNPtg6jGz7xCWYt6jlc7TtUx9s6rlcAnWt6lvwxIX6afNM+rzKqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b13d095a33so1742132eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417991; x=1789022791;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o0i+dbaVjUgfRHfCqf9JoGq2txagNpbeotX4U0IcR+A=;
        b=iLO1FN2e9BstURfaC1EJcjUo17Qz/hsBxEntdgM8YGVhRGcmsCrgvjiRIKayjmLrEr
         vyQpnsbAORmCQuiVHzX044K3ZDWL8oMjfvm7uoSqZM2iUmlEebcHyqiPvVukkglLH4aI
         zW8ezyAuGjQ+4E0pjO613ex8kl/L35Pvkov5mZ9SXQ3EnspvuO5rXKWh4fxjOeFd1Xf+
         /rDJ7DkOZ82j9K0dVzqoIUO53bvEvTqm3ME4MEP3tNcn/ydFYXk1HFKnfZqGk+nbfzc1
         nOvzm2jysM+aLhbrkdmP5EUjIKxC5TZFU23vVp8VX0CH1h3qSx+JUwMnqSiEjFsM5Iw5
         ySnQ==
X-Gm-Message-State: AFuF++kWOI1NOFhnQeRY05s2f7h9EU3aHwGY0Rm8W4bMQ712ZvAdZNh4
	8WtJpw9uZLkmASI8acl4MQ4q2lOOxZO78TY+zH3aUDszi3ioot+3d6LjqSYgh6DYtDVN3QD+pch
	DJZLSimoGsI0dw4RJ+i/xDVoiiKwvzY5WvQUE+U9fbN/hJ02C6J3ARPhEs2Q=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:ee0b:0:b0:6b1:404f:6eb4 with SMTP id
 006d021491bc7-6b47f30af35mr8816256eaf.9.1788417991144; Wed, 02 Sep 2026
 23:46:31 -0700 (PDT)
Date: Wed, 02 Sep 2026 23:46:31 -0700
In-Reply-To: <6a85e576.f7a79266.2f965f.003f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9917c7.9266084e.bf0d7.00af.GAE@google.com>
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

On Thu, Sep 3, 2026 at 1:37=E2=80=AFPM Akihiko Kai <khiemtranzo532001@gmail=
.com>
wrote:

> #syz test
>
> usb_driver_claim_interface() sets dev->driver unconditionally before
> checking device_is_registered(dev).  When called from usb_audio_probe()
> during configuration, the interface device has not been added to the
> driver core yet (device_add() is called later in usb_set_configuration())=
.
>
> As a result, knode_driver is never attached to the driver's klist, but
> dev->driver is set.  On subsequent disconnect, bus_remove_device() calls
> __device_release_driver(), which calls klist_remove(&dev->p->knode_driver=
)
> unconditionally on the uninitialized node, causing a general protection
> fault:
>
>   BUG: kernel NULL pointer dereference
>   RIP: klist_remove+0x...
>   Call Trace:
>    __device_release_driver
>    bus_remove_device
>    device_del
>    usb_disable_device
>    usb_disconnect
>
> Fix this by deferring the assignment of dev->driver for interfaces that
> are not yet registered.  Instead, record the claim via two new fields in
> struct usb_interface: a claimed bitflag and a claimed_driver pointer.
> After device_add() completes in usb_set_configuration(), call
> device_bind_driver() explicitly for claimed interfaces.
>
> device_bind_driver() skips ->probe() (which is exactly what usb_audio
> needs =E2=80=94 PCM and MIDI devices are created before bind), but it doe=
s
> attach knode_driver to the driver's klist, making teardown safe.
>
> The else-if branch in dd.c that handles dev->driver already set at
> device_add() time (used by w1, usb_port, ccwgroup, pata_parport, and
> others) is intentionally left untouched.
>
> Reported-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D87188222c77c0dbbdb4d
> Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
> ---
>  drivers/usb/core/driver.c  | 19 ++++++++++++++-----
>  drivers/usb/core/message.c | 15 +++++++++++++++
>  include/linux/usb.h        |  2 ++
>  3 files changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index f63004417..59e74872b 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -562,7 +562,6 @@ int usb_driver_claim_interface(struct usb_driver
> *driver,
>         if (!iface->authorized)
>                 return -ENODEV;
>
> -       dev->driver =3D &driver->driver;
>         usb_set_intfdata(iface, data);
>         iface->needs_binding =3D 0;
>
> @@ -580,11 +579,19 @@ int usb_driver_claim_interface(struct usb_driver
> *driver,
>         else
>                 pm_runtime_set_active(dev);
>
> -       /* if interface was already added, bind now; else let
> -        * the future device_add() bind it, bypassing probe()
> -        */
> -       if (device_is_registered(dev))
> +       if (device_is_registered(dev)) {
> +               dev->driver =3D &driver->driver;
>                 retval =3D device_bind_driver(dev);
> +       } else {
> +               /*
> +                * Interface not yet registered: record the claim without
> +                * setting dev->driver.  usb_set_configuration() will cal=
l
> +                * device_bind_driver() explicitly after device_add(),
> which
> +                * skips ->probe() and attaches knode_driver so teardown
> is safe.
> +                */
> +               iface->claimed =3D 1;
> +               iface->claimed_driver =3D driver;
> +       }
>
>         if (retval) {
>                 dev->driver =3D NULL;
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 75e2bfd74..73c630750 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -2269,8 +2269,23 @@ int usb_set_configuration(struct usb_device *dev,
> int configuration)
>                 if (ret !=3D 0) {
>                         dev_err(&dev->dev, "device_add(%s) --> %d\n",
>                                 dev_name(&intf->dev), ret);
> +                       intf->claimed =3D 0;
> +                       intf->claimed_driver =3D NULL;
>                         continue;
>                 }
> +               if (intf->claimed) {
> +                       intf->dev.driver =3D &intf->claimed_driver->drive=
r;
> +                       ret =3D device_bind_driver(&intf->dev);
> +                       if (ret) {
> +                               dev_err(&dev->dev,
> +                                       "device_bind_driver(%s) --> %d\n"=
,
> +                                       dev_name(&intf->dev), ret);
> +                               intf->dev.driver =3D NULL;
> +                               intf->condition =3D USB_INTERFACE_UNBOUND=
;
> +                       }
> +                       intf->claimed =3D 0;
> +                       intf->claimed_driver =3D NULL;
> +               }
>                 create_intf_ep_devs(intf);
>         }
>
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 1da4ad161..0ec743e76 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -266,6 +266,8 @@ struct usb_interface {
>         unsigned needs_binding:1;       /* needs delayed unbind/rebind */
>         unsigned resetting_device:1;    /* true: bandwidth alloc after
> reset */
>         unsigned authorized:1;          /* used for interface
> authorization */
> +       unsigned claimed:1;             /* driver claimed before
> device_add() */
> +       struct usb_driver *claimed_driver;      /* driver for deferred
> bind */
>         enum usb_wireless_status wireless_status;
>         struct work_struct wireless_status_work;
> --
> 2.34.1
>
> On Thu, Sep 3, 2026 at 1:30=E2=80=AFPM Akihiko Kai <khiemtranzo532001@gma=
il.com>
> wrote:
>
>> usb_driver_claim_interface() sets dev->driver unconditionally before
>> checking device_is_registered(dev).  When called from usb_audio_probe()
>> during configuration, the interface device has not been added to the
>> driver core yet (device_add() is called later in usb_set_configuration()=
).
>>
>> As a result, knode_driver is never attached to the driver's klist, but
>> dev->driver is set.  On subsequent disconnect, bus_remove_device() calls
>> __device_release_driver(), which calls klist_remove(&dev->p->knode_drive=
r)
>> unconditionally on the uninitialized node, causing a general protection
>> fault:
>>
>>   BUG: kernel NULL pointer dereference
>>   RIP: klist_remove+0x...
>>   Call Trace:
>>    __device_release_driver
>>    bus_remove_device
>>    device_del
>>    usb_disable_device
>>    usb_disconnect
>>
>> Fix this by deferring the assignment of dev->driver for interfaces that
>> are not yet registered.  Instead, record the claim via two new fields in
>> struct usb_interface: a claimed bitflag and a claimed_driver pointer.
>> After device_add() completes in usb_set_configuration(), call
>> device_bind_driver() explicitly for claimed interfaces.
>>
>> device_bind_driver() skips ->probe() (which is exactly what usb_audio
>> needs =E2=80=94 PCM and MIDI devices are created before bind), but it do=
es
>> attach knode_driver to the driver's klist, making teardown safe.
>>
>> The else-if branch in dd.c that handles dev->driver already set at
>> device_add() time (used by w1, usb_port, ccwgroup, pata_parport, and
>> others) is intentionally left untouched.
>>
>> Reported-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=3D87188222c77c0dbbdb4d
>> Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
>> ---
>>  drivers/usb/core/driver.c  | 19 ++++++++++++++-----
>>  drivers/usb/core/message.c | 15 +++++++++++++++
>>  include/linux/usb.h        |  2 ++
>>  3 files changed, 31 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
>> index f63004417..59e74872b 100644
>> --- a/drivers/usb/core/driver.c
>> +++ b/drivers/usb/core/driver.c
>> @@ -562,7 +562,6 @@ int usb_driver_claim_interface(struct usb_driver
>> *driver,
>>         if (!iface->authorized)
>>                 return -ENODEV;
>>
>> -       dev->driver =3D &driver->driver;
>>         usb_set_intfdata(iface, data);
>>         iface->needs_binding =3D 0;
>>
>> @@ -580,11 +579,19 @@ int usb_driver_claim_interface(struct usb_driver
>> *driver,
>>         else
>>                 pm_runtime_set_active(dev);
>>
>> -       /* if interface was already added, bind now; else let
>> -        * the future device_add() bind it, bypassing probe()
>> -        */
>> -       if (device_is_registered(dev))
>> +       if (device_is_registered(dev)) {
>> +               dev->driver =3D &driver->driver;
>>                 retval =3D device_bind_driver(dev);
>> +       } else {
>> +               /*
>> +                * Interface not yet registered: record the claim withou=
t
>> +                * setting dev->driver.  usb_set_configuration() will ca=
ll
>> +                * device_bind_driver() explicitly after device_add(),
>> which
>> +                * skips ->probe() and attaches knode_driver so teardown
>> is safe.
>> +                */
>> +               iface->claimed =3D 1;
>> +               iface->claimed_driver =3D driver;
>> +       }
>>
>>         if (retval) {
>>                 dev->driver =3D NULL;
>> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
>> index 75e2bfd74..73c630750 100644
>> --- a/drivers/usb/core/message.c
>> +++ b/drivers/usb/core/message.c
>> @@ -2269,8 +2269,23 @@ int usb_set_configuration(struct usb_device *dev,
>> int configuration)
>>                 if (ret !=3D 0) {
>>                         dev_err(&dev->dev, "device_add(%s) --> %d\n",
>>                                 dev_name(&intf->dev), ret);
>> +                       intf->claimed =3D 0;
>> +                       intf->claimed_driver =3D NULL;
>>                         continue;
>>                 }
>> +               if (intf->claimed) {
>> +                       intf->dev.driver =3D &intf->claimed_driver->driv=
er;
>> +                       ret =3D device_bind_driver(&intf->dev);
>> +                       if (ret) {
>> +                               dev_err(&dev->dev,
>> +                                       "device_bind_driver(%s) --> %d\n=
",
>> +                                       dev_name(&intf->dev), ret);
>> +                               intf->dev.driver =3D NULL;
>> +                               intf->condition =3D USB_INTERFACE_UNBOUN=
D;
>> +                       }
>> +                       intf->claimed =3D 0;
>> +                       intf->claimed_driver =3D NULL;
>> +               }
>>                 create_intf_ep_devs(intf);
>>         }
>>
>> diff --git a/include/linux/usb.h b/include/linux/usb.h
>> index 1da4ad161..0ec743e76 100644
>> --- a/include/linux/usb.h
>> +++ b/include/linux/usb.h
>> @@ -266,6 +266,8 @@ struct usb_interface {
>>         unsigned needs_binding:1;       /* needs delayed unbind/rebind *=
/
>>         unsigned resetting_device:1;    /* true: bandwidth alloc after
>> reset */
>>         unsigned authorized:1;          /* used for interface
>> authorization */
>> +       unsigned claimed:1;             /* driver claimed before
>> device_add() */
>> +       struct usb_driver *claimed_driver;      /* driver for deferred
>> bind */
>>         enum usb_wireless_status wireless_status;
>>         struct work_struct wireless_status_work;
>> --
>> 2.34.1
>>
>
