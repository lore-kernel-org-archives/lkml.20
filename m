Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793811524;
	b=4VS7yUuaZmbUe/LFvVoUxSlDSb7Wuwo+hWOxY0cDyyK+1xdbm9vZer/Ep9gCVa8+uxRn
	 iqD1q4D4O6T7DvhyB+eSRSSXq9kh9uoedGpsY0Qc2VfrmmfBMkQC+f3pdFgT8CwM9obDE
	 t7Ao6hH5zP/pIg4DWg4AZnI3axKHcEyC8T1AkPvTxiyuDfCvKqRdndMldTbzmPe7uZhc4
	 kJQOKIUQQc+NuOdNbsv3+HRuS0rKceT6sNJtG67/xWilbI9cl2dymPxsqv0ADWWOiOkbg
	 msR9k8w/z3PkINJ+FfkDFvkLv1+nWJ1POAF2RwrBHdVvxqGyx8OD5P0YMWUfe6oUYhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mhjJMlL62ST4Y1K7oksITyqF+52RqBDZwT8+hi33/dc=;
	b=sJGrnP9xAQIfgndz8RABI1pWjSdG4AISIGVZXWHZe6z5bqCHRHzTGUPunaTDS24tmJ68
	 hSPQ4UqASysdkYmEXezmTEYLg1xunuN2miNeY8azUJpEt/G1i1gfV6XtzpJg/V+EF3AcG
	 QFUiwJFWXWXXozc/xZEJjaPki/QLzuVrIRc1Ihf722m9OUi5bE/UCqdBAtFR/5NecDK0E
	 lDwuRUvWuTsKkLCY9XrXFKlO8zbGnMvrCVe5rhagJfkOEbTZQ3EPU2HZngcC04rzrbv/7
	 NnFG99uEGdiGOi7MdKlLRDYvWYABskvTMHf/JkirHHY2fACVs+j062DJg30wQ8ZjIxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CU4ReGa0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF600606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF600606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CU4ReGa0
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e503815adso86254885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:58:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793811523; cv=none;
        d=google.com; s=arc-20260327;
        b=RBxeCt8GKDWFnWSWD6ksUtsPUPi3fdj4W5OG8L71ooGGyyJNRgYlonlFE90wWxLADR
         xTzgC3OKzcSpffBU/k5HpwW2hE1BI/+xGsbkpnJ0+4GdIwPFHVnDJzbcmdDnxRIkQEBD
         AKw8e/wbV3WkqLY2ieP47Xg4+Wy02Zmcjr1+lEDMbanaKkJ/b/qiMtpxMOo/oZnXKEmb
         GskJF79gRvPf7NOtE30szQQ3MgnZL+GzbGK7T1/aDmmwQO25gt5b7QuBebI4oPsX96vi
         BqkSc1gbVGuJZbcU5vqojx0zoOmDKN5BgOuXKFVF0+FkS2qMkRi1gCSppSeL3bQCKOyf
         1nbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mhjJMlL62ST4Y1K7oksITyqF+52RqBDZwT8+hi33/dc=;
        fh=DxEss8zrobwSyTvcZxPpbIRG6wiAgF10+V0vOGXJGsg=;
        b=VDQdOXzWYQYdEnte9NAAWLv7otNEA/rN+H6X/7vWipzuxpnq8/E2r8uVDpen6i5nBY
         ucL76cbe9HgBEdEwkYW/EVHEGrbhyWnH4m+DpyNjulQJnFW5pNtHaeJAOrb6iz2ce7uk
         U4jtRPzInmN9HJPwdQsS5JVci3QXam8aEv+DZ8wuo1HnwhbkLEwY4widYs/sNph1YhTA
         +YpcwO4sHWi0FvOHmOYdRwS2q1c7lyKPi4zmPI6RFpa4BXj41lVPvr2sKovbvWPQH6OB
         z0O5CgKMSIpiNjlEIbqAHijm/jtxxdtCo1I0mDoxl2CyUqx/pVFwzCXeVdHPvL1ZW+6Y
         1hpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811523; x=1794416323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mhjJMlL62ST4Y1K7oksITyqF+52RqBDZwT8+hi33/dc=;
        b=CU4ReGa0OxTjAT5Zy3GuPXVhibZpVHRbhSjUfbtQG9FAM2BrEJ6nBNa47zJR4vqx4g
         qA/25GEU4XBS/xhSTCQPvTn0RSK/3G4tembMeYbEk2E1ytwSVIqU200+q/jARgz0h4Ug
         v0OpozLUrQ007awUXO8ESIx1x1tBDYAg8HjRhCzVX8l2YDfAiBu4cZ4gs2qnAmRXajr+
         S8Tb8uEhoLuQcz4VyMdsVmgtAcH/osf8fTc1gVwrO73IuhTgcwjpzhSwCi3oSOK5z0rI
         y4zuuuzoi2vMR+owoKYNIFnk6sl8HnLt3MkovzwKFYX5r5eavqcfNu0P/4dFFkRQBkM3
         50pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811523; x=1794416323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhjJMlL62ST4Y1K7oksITyqF+52RqBDZwT8+hi33/dc=;
        b=ve8FtB7vvHFkDph+wTp3UagWaQdmJMaInqyVipxzxugNBkIw13lDRMA92Y8rPGyCvr
         bGk8s/hIoPCOkQRADgf0b+tWCQSpQiJE99V/8qBQMmEpE+SIUkXKyxcGTpSQJB0bBJDn
         UrLFtYYQDGiU0oGAiBadG6P+7O4qrI2kPp7/ejGSP4eAbsRLYj3AtFLaCqiOmVDhCOlB
         PloCJUkCkKNR2MCs/PA60x/auqOAopKJzXiXGUHyJltVp/gzhPu9WbHqTLZ25hSRkZZI
         nJ6mPHi4Bl00HRD2fgy/IqoAZROfYRaF30ldCKwJ7iK0xYqxNi2wo9EBE15YAvNZ++D4
         cimQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuWozRgDPCVxDSxLOdGD6bOUuufwSj5sYKNRFJu3rQ9eLI3oNKJEa4JryhiWBPXY4+CHFcZq1ndCYuC/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KdeXUShylt+CWc843B3lruNxqzKKmYI4SYg7IMmDKHYMz6HjD
	UMK01Uv2D/0NMNTp1RgSzsdsdIHxWUyD0KsA4S13RDaDGVlWectoZBmSRmAiNq7BCDDgEQ6LBAe
	qglTcOp0uNPJ1ERVZANgR5maa5YFbvts=
X-Gm-Gg: AYBFou0S/NaGtoCiamoZajE3eW+kIK4gjQJR0m2UpWF6hkGJceJIoRF9yD4ZRsE53bD
	BMB1utX+yuwFi3WzZfbAtkHGJKEgILm6pMz6/9iGCYqD8Knkyzgf3qeBnaBaOIiPVvi7YvFQ1Jb
	8Tze+EpA8NTE3QsnC8QNwJNbku/qU09G7ERZUE7wjlPUnqJo2v8UrYM393d06ohVmit6FLNgCqy
	C1v7xOPNQEw8wyu62cEGrozf3p7ogtTO46Uato21a9UbcTmrnb9lrnh4CtXSI3KZtO08m+vsffI
	F9n14kiTiMUfQlnbP4U2QvnmADFLUKnuWIlNvWJCn+FEAoxGNBUI2y+5PMI9CfaqihyZnsafavz
	NJNVLtG3R9gq/SMq1DtealJEIwc+ZB5lGXXiw
X-Received: by 2002:a05:620a:8086:b0:93c:a191:88fe with SMTP id
 af79cd13be357-9442156a71cmr2529941985a.8.1793811521710; Wed, 04 Nov 2026
 08:58:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004111353.118025-1-jinmo44.yang@gmail.com>
 <20261005035912.910925-1-jinmo44.yang@gmail.com> <20261005035912.910925-2-jinmo44.yang@gmail.com>
In-Reply-To: <20261005035912.910925-2-jinmo44.yang@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Wed, 4 Nov 2026 08:58:30 -0800
X-Gm-Features: AclHuK-FdP23s5ukabALcToOILc3mh4j7aBgaHe1hYlJbkXDRRrTynEnDPtjRNA
Message-ID: <CANRwn3TyO9AhEO2j7wNgvZpS+pgPmtLZBsjD0qP1_mHeaL8dyw@mail.gmail.com>
Subject: Re: [PATCH v2] HID: wacom: serialize mode changes with device removal
To: Jinmo Yang <jinmo44.yang@gmail.com>
Cc: ping.cheng@wacom.com, jason.gerecke@wacom.com, jikos@kernel.org, 
	bentiss@kernel.org, dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 8:59=E2=80=AFPM Jinmo Yang <jinmo44.yang@gmail.com> =
wrote:
>
> wacom_mode_change_work() takes both siblings' struct wacom out of
> wacom_shared and tears down and rebuilds them, holding no reference to
> either. wacom_remove() cancels only the work owned by the device being
> removed, so a worker owned by the other sibling keeps using this device
> after its remove callback returns, and hid_device_remove() then frees
> struct wacom along with the driver's devres group.
>
> Reproduced under KASAN on hid.git master, 10 boots out of 10:
>
>   BUG: KASAN: slab-use-after-free in wacom_parse_and_register+0x4fa8/0x58=
e0
>   Read of size 8 at addr ffff88800be431f8 by task kworker/0:2/75
>   Workqueue: events wacom_mode_change_work
>    wacom_parse_and_register+0x4fa8/0x58e0
>    wacom_mode_change_work+0x333/0x7e0
>    process_one_work+0xa3b/0x19b0
>   Allocated by task 11:  devm_kmalloc <- wacom_probe
>   Freed by task 82:      devres_release_group <- hid_device_remove,
>                          under uhid_char_release <- __x64_sys_close
>
> The same object is also written: wacom_feature_mapping() stores
> features->touch_max into it, four bytes at a fixed offset, with the value
> taken from a feature report. Closing one sibling's /dev/uhid descriptor i=
s
> all it takes, with no privilege, and a reference on the hid_device would
> not help: struct wacom is devm_kzalloc() on &hdev->dev.
>
> Serialize mode-change workers with wacom_remove() using a driver-wide
> mutex, held across the whole teardown. Any step left outside it is undone
> by a sibling worker and never repeated, because such a worker brings the
> device back up through wacom_parse_and_register(): stopping the hardware
> outside the mutex leaves hidraw registered on an unbound device, since
> hidraw_disconnect() is reached only from hid_hw_stop(), and cancelling th=
e
> delayed work outside it leaves init_work armed on memory devres is about
> to free.
>
> Cancel this device's own mode-change work before taking the mutex, since =
a
> worker blocked on it would deadlock that cancel, and once more after the
> unlock, because a report processed before hid_hw_stop() can queue it agai=
n.
> That worker can only find a NULL wacom_wac.shared and return.
>
> Because wacom_add_shared_data() registers its devres action inside the
> group wacom_parse_and_register() opens, the wacom_release_resources() cal=
l
> under the mutex clears this device from the shared pen and touch pointers=
,
> so a worker starting after the unlock cannot select it.
>
> The worker also snapshots both shared pointers and returns on a NULL
> wacom_wac.shared, because releasing the first sibling's devres can drop
> the last reference to the shared data.
>
> Fixes: 4082da80f46a ("HID: wacom: generic: add mode change touch key")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
> ---
>  drivers/hid/wacom_sys.c | 60 ++++++++++++++++++++++++++++++++++-------
>  1 file changed, 50 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index 40770affdbde..092e91ed1c3d 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -764,6 +764,7 @@ struct wacom_hdev_data {
>
>  static LIST_HEAD(wacom_udev_list);
>  static DEFINE_MUTEX(wacom_udev_list_lock);
> +static DEFINE_MUTEX(wacom_mode_change_lock);

I'm not a huge fan of a driver-wide mutexes. An alternative would seem
to be having both siblings share a common `struct work_struct
mode_change_work` and then relying on similar on disable_work_sync
calls inside of wacom_remove to ensure the teardown/recreation fully
completes regardless of which device gets removed.

I asked an LLM for an example of this idea and it requires a bit more
work (probably too much to backport to stable) but I'd still be
interested in following up on that path... Maybe submit a two-part
patch--one that uses this mutex idea and which can be backported to
stable, and a second that then relaxes the driver-wide mutex into a
shared mode_change_work. Thoughts?

>
>  static bool wacom_are_sibling(struct hid_device *hdev,
>                 struct hid_device *sibling)
> @@ -2783,22 +2784,32 @@ static void wacom_remote_work(struct work_struct =
*work)
>  static void wacom_mode_change_work(struct work_struct *work)
>  {
>         struct wacom *wacom =3D container_of(work, struct wacom, mode_cha=
nge_work);
> -       struct wacom_shared *shared =3D wacom->wacom_wac.shared;
> +       struct wacom_shared *shared;
> +       struct hid_device *pen;
> +       struct hid_device *touch;
>         struct wacom *wacom1 =3D NULL;
>         struct wacom *wacom2 =3D NULL;
> -       bool is_direct =3D wacom->wacom_wac.is_direct_mode;
> +       bool is_direct;
>         int error =3D 0;
>
> -       if (shared->pen) {
> -               wacom1 =3D hid_get_drvdata(shared->pen);
> +       mutex_lock(&wacom_mode_change_lock);
> +       shared =3D wacom->wacom_wac.shared;
> +       if (!shared)
> +               goto out;
> +       pen =3D shared->pen;
> +       touch =3D shared->touch;
> +       is_direct =3D wacom->wacom_wac.is_direct_mode;
> +
> +       if (pen) {
> +               wacom1 =3D hid_get_drvdata(pen);
>                 wacom_release_resources(wacom1);
>                 hid_hw_stop(wacom1->hdev);
>                 wacom1->wacom_wac.has_mode_change =3D true;
>                 wacom1->wacom_wac.is_direct_mode =3D is_direct;
>         }
>
> -       if (shared->touch) {
> -               wacom2 =3D hid_get_drvdata(shared->touch);
> +       if (touch) {
> +               wacom2 =3D hid_get_drvdata(touch);
>                 wacom_release_resources(wacom2);
>                 hid_hw_stop(wacom2->hdev);
>                 wacom2->wacom_wac.has_mode_change =3D true;
> @@ -2808,16 +2819,17 @@ static void wacom_mode_change_work(struct work_st=
ruct *work)
>         if (wacom1) {
>                 error =3D wacom_parse_and_register(wacom1, false);
>                 if (error)
> -                       return;
> +                       goto out;
>         }
>
>         if (wacom2) {
>                 error =3D wacom_parse_and_register(wacom2, false);
>                 if (error)
> -                       return;
> +                       goto out;
>         }
>
> -       return;
> +out:
> +       mutex_unlock(&wacom_mode_change_lock);
>  }
>
>  static int wacom_probe(struct hid_device *hdev,
> @@ -2905,6 +2917,21 @@ static void wacom_remove(struct hid_device *hdev)
>         struct wacom_wac *wacom_wac =3D &wacom->wacom_wac;
>         struct wacom_features *features =3D &wacom_wac->features;
>
> +       /*
> +        * Cancel our own mode-change work first: a worker blocked on the
> +        * mutex below would deadlock this cancel if the order were rever=
sed.
> +        */
> +       cancel_work_sync(&wacom->mode_change_work);

Regardless of the comments above, I think it makes sense to swap this
out for a call to 'disable_work_sync' instead. The documentation for
that indicates that it does the same thing as 'cancel_work_sync' but
also prevents future attempts to schedule the work (which should let
you remove the second call to 'cancel_work_sync' at the end of this
function).

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....


> +
> +       /*
> +        * A sibling's mode-change work tears this device down and brings=
 it
> +        * back up, so hold the mutex across the whole teardown. Stopping=
 the
> +        * hardware outside it would let such a worker run hid_hw_start()=
 for
> +        * this device afterwards and leave hidraw registered on a device=
 that
> +        * is about to be unbound.
> +        */
> +       mutex_lock(&wacom_mode_change_lock);
> +
>         if (features->device_type & WACOM_DEVICETYPE_WL_MONITOR)
>                 hid_hw_close(hdev);
>
> @@ -2915,7 +2942,6 @@ static void wacom_remove(struct hid_device *hdev)
>         cancel_work_sync(&wacom->wireless_work);
>         cancel_work_sync(&wacom->battery_work);
>         cancel_work_sync(&wacom->remote_work);
> -       cancel_work_sync(&wacom->mode_change_work);
>         timer_delete_sync(&wacom->idleprox_timer);
>         if (hdev->bus =3D=3D BUS_BLUETOOTH)
>                 device_remove_file(&hdev->dev, &dev_attr_speed);
> @@ -2923,8 +2949,22 @@ static void wacom_remove(struct hid_device *hdev)
>         /* make sure we don't trigger the LEDs */
>         wacom_led_groups_release(wacom);
>
> +       /*
> +        * Releasing our resources runs the wacom_remove_shared_data() de=
vres
> +        * action, which clears this device from the shared pen and touch
> +        * pointers, so no worker started after the unlock can select it.
> +        */
>         if (wacom->wacom_wac.features.type !=3D REMOTE)
>                 wacom_release_resources(wacom);
> +
> +       mutex_unlock(&wacom_mode_change_lock);
> +
> +       /*
> +        * A report processed before hid_hw_stop() may have queued our wo=
rk
> +        * again. It can only find a NULL wacom_wac.shared and return now=
, but
> +        * it must not still be running when devres frees this device.
> +        */
> +       cancel_work_sync(&wacom->mode_change_work);
>  }
>
>  static int wacom_resume(struct hid_device *hdev)
>
> base-commit: fe2ec83746e501645709761605c2464a44fd2929
> --
> 2.53.0
>
>
