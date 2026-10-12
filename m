Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4633DA7F9
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817089; cv=pass; b=kxfJQQca0blDdMDzwoLlHMq4syQdu+1sdbW9QeDtz3N2Hxut245+oZOsivCqSOmR3Ifa3ENBff+kiPqbCx8u5CDF37wVqNzJKbCbiBzzmflX2wmc71GZl+x0Rrwnw0dKxZzlzerRLQWAdxsmbnsNVOJykczrVw/EGfaNo4uDAqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817089; c=relaxed/simple;
	bh=PDf9PTevrU3TjKRVfHzJfhuumh3qViGjZMfENWQXMFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mchDQx2msV65HdLuGTBFcUTCAM3rLvQfWhEkABFbnn4+vI8Gmza9yD+fEGU13zhqLfhtb7iweKGbXF3RTCzCIKQdv0MNMfZcMg4aA5vLPSG5dS6hWGoQDjYPlszjnWAKebAG/fX1vecDUuZdkPOuI0dDo8bviBQWEQxlHW+qIsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laybEXyy; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laybEXyy"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c315a445752so312142066b.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791817086; cv=none;
        d=google.com; s=arc-20260327;
        b=oaQTTP+ARIseV7noGEGAY/DG8eRLyMqI+I2VZjwUw8oJaZE2zikv93jFQ12c2WkeOM
         G0881OtkDAq4w4oQ6setJKMAwgoBV/MQQas808gJ2m2pnfrQWXgG5M0DgsPTD4okehsa
         TBOpoWCFiakLMAvsXNf26YfpaZR9apk/A8kADUD0e95e3NmmhD1FMK8SVCXTvFYUVGcy
         JD1D7Zid3ltUWo4Pz8Afa7bm7ILIUHA+p+NIp1o7Pq/8X78clr63nRlsEviyPu3h+e4u
         18q2Vchftbeg9E8t6FOeWwgYMAV4HqgYfs8Tmuo7ExjyxfipZ6ebdpUmjF58y6B6lbwi
         nwsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JVTRT0r/ReMiMwgJ0HrEGwYjTwBmKMQXnUxQbyPr24M=;
        fh=5ZGBdqN1dNJZO3pgfXDUrwWxY0vHqM0r+mCMslxZOG4=;
        b=NOFd5SIYbpfM6bHjso6/1ztNG7CWKv1R8xTmUH6oPeVznISl+lXLnmREPVmJDW+yVm
         XI4ZoiPmTXV6JEn0D/qUEyQEWLqds5eaFsgGLgm7qo5zNHxsD4QVS13RfC5bSHtpQ1b4
         kXr8gpXpKx0E7FnybP6RCLOG5oGMfP+AliG88OByoVEP9LutH0LoaiHvB7VZE9DCG0za
         BUBnv7HTtDQfEy4nbbnTA6Ez/0uDxNxXHXIsA+rQ94Td7UFMowXoZ5ABTMd8N+JDUdxO
         9BdF3fz166VUnPtmqlBKhnL6c8ERVNz5GaSTvP8KTq21tp8FwC7IP2udZqOgfF79xAyS
         PF1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791817086; x=1792421886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JVTRT0r/ReMiMwgJ0HrEGwYjTwBmKMQXnUxQbyPr24M=;
        b=laybEXyyBTwCM6IpiSv1O81picH6CIXJBWyy4Q7iHgjnDad97TP23qTjQyqcrLWOR+
         ojKWVFr2IrsxLnVLzfJ9wblfQKqXAcgLuRKt2rhlTntj+9boVqXQ8v3i3zr8BY144KXY
         J0h22PmfOEbsqISRai5ib7EDBQwKnK435fK7JWGZ9kKegpfd4OAQ/kcwvmFrUjtUpIBV
         O48a7TJXeGc9K3fs9/I5eDUvFCHV72wi60qrUfyA2bpqbLDuQlV8ZVJRB8V7UtDCR4qM
         VeUXel6ziHGqSVnqG/XRAXMf4SPviNsqqh/QYS9prC9KPVZ9y5w3GwCDvf3sKHOOnePC
         c6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817086; x=1792421886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVTRT0r/ReMiMwgJ0HrEGwYjTwBmKMQXnUxQbyPr24M=;
        b=fsrfGp/5ocoNxqDcOs+30Cna/iZhhFHJgCOZhOAXhKGByi7wMLMaulpEmDHr22A21M
         Rx6U5ekt+znXKsCB7w/KA6FlRcvXr9+fSrKDld8KcL9kK8fBlU0qQJ+0LqWd+a5Hhcll
         icotDEUnOZF2V/wjBIetpUMOQVdkW9W/Z6JKOymurO95toZtMzrn7m1nXrH8lkdbuXSH
         jMqoK4B81HrXg3YongS2S++IJ3UO0esLkPDJdC4WU18MVVMuvGPs872+4eAwJabgNcSi
         1dlJ5rkNANzx66lrmC9ELXPmWs669SHDzOxwcQuPiWHfls/gxvm5bTXVng7a8Pw5Ec15
         z00A==
X-Forwarded-Encrypted: i=1; AKwUvBw1PnyFyvVsNJopBmvdSB9XIVP01Ej5bPL+tWqqX4G8IYtTo607PlyGl3ZVO2EL79GHTXersjt2GG1b5rs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDrNP8K5ZxahvHdUXVzdVtTY5SJeOLFDL1kloL6za01fMZtr2v
	gCK8YI/WmG6z656Wl0FoqkldMsbSoiCu1rKS0iAZ+pAF22Hr/ANmdhbw15gUzj/HGPmNdgcM/zy
	FNolWHqYKFCpm+KpAL89MgJ6CkqFj9lM=
X-Gm-Gg: AYBFou1CB4GJmHiHN3Dd6pMTE1AHKqCAk5r2/aKbLQG508zYmUWuWzaYGv2kqVGNKUS
	m9sdNuOGElBBoa314aT+nPoax3YFiGRTiRoh6Wgd07KFgNBiNBE7lan60IZ5nTw9TYAWdy193pz
	ncsaKU0aZBvs8zS7heqnxpI/g9Q30s9PtPitCVUC6KJZDohInWZtGxdcBtDZkrH/rhGAbrpFyB7
	lngZviXzGXEeanAu8OH3d2W8xi2F9sF0ti0KpwxIdplUUDlaHlWakG/qSg3EER6UH0l+IaVEvUy
	nb2l8/Z4t3l2lOE8D0XtV9uEOiU05sBtL8LZhTDWblasNuJpxrEcqLAwQ/im5BB1hD/OyIQXTRX
	MQezEOOWNfpFJSrhnkXp5IOfzPgwRVL1mgPImtVjtcg==
X-Received: by 2002:a17:906:4790:b0:c25:5faf:b207 with SMTP id
 a640c23a62f3a-c31a9a10e7fmr977505266b.3.1791817085896; Mon, 12 Oct 2026
 07:58:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011195729.981243-1-linmag7@gmail.com> <20261011195729.981243-7-linmag7@gmail.com>
 <1f66c850-faa7-477f-9535-761074ccc077@kernel.org>
In-Reply-To: <1f66c850-faa7-477f-9535-761074ccc077@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 16:57:54 +0200
X-Gm-Features: AclHuK_IcZyjHiUIK3u3hTnPLckXjpGLARIbdXHePuP-SPEHyVHxb2JKX2D2wsY
Message-ID: <CA+=Fv5STgFEmKU7V7rAE1-CSCnYHN8e=TA=mNDT8Wp_HBZzu+Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] hvc: add an M3000 firmware console backend
To: Jiri Slaby <jirislaby@kernel.org>
Cc: davem@davemloft.net, andreas@gaisler.com, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, krzk@kernel.org, 
	oleg@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

On Mon, Oct 12, 2026 at 8:46=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> w=
rote:
>
> On 11. 10. 26, 21:55, Magnus Lindholm wrote:
> ...
> > --- /dev/null
> > +++ b/drivers/tty/hvc/hvc_m3000.c
> > @@ -0,0 +1,205 @@
>
> > +struct m3000_console {
> > +     int stdin;
> > +     bool ready;
> > +     u8 buffer[256];
> > +     raw_spinlock_t buffer_lock;
> > +     struct timer_list poll_timer;
> > +     struct mutex poll_mutex; /* Serialize open against synchronous cl=
ose. */
> > +     spinlock_t poll_lock; /* Protect active state and timer rearming.=
 */
> > +     bool poll_active;
>
> Perhaps group these a bit better, so that there are not such holes?
>

Done for v3. Reordering the members reduced the structure from 344
to 336 bytes with the tested configuration.

> > +};
> ...
> > +/*
> > + * HVC's idle backoff can exceed the firmware input FIFO's capacity.
> > + * Wake its worker each tick while open; keep PROM calls out of the ti=
mer.
> > + */
> > +static void m3000_poll_tick(struct timer_list *timer)
> > +{
> > +     struct m3000_console *con =3D timer_container_of(con, timer, poll=
_timer);
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&con->poll_lock, flags);
>
> Any reason not to use guard()s?
>

No particular reason. I've switched this to guard(spinlock_irqsave).

> > +     if (con->poll_active) {
> > +             hvc_kick();
> > +             mod_timer(&con->poll_timer, jiffies + 1);
> > +     }
> > +     spin_unlock_irqrestore(&con->poll_lock, flags);
> > +}
> > +
> > +static int m3000_open(struct hvc_struct *hp, int data)
> > +{
> > +     struct m3000_console *con =3D m3000_console(hp->vtermno);
> > +     unsigned long flags;
> > +
> > +     if (!con)
> > +             return -ENODEV;
> > +     mutex_lock(&con->poll_mutex);
> > +     spin_lock_irqsave(&con->poll_lock, flags);
>
> Same here.
>

Done, using guards for both locks, preserving their acquisition and
release order.

> > +     con->poll_active =3D true;
> > +     mod_timer(&con->poll_timer, jiffies + 1);
> > +     spin_unlock_irqrestore(&con->poll_lock, flags);
> > +     mutex_unlock(&con->poll_mutex);
> > +     return 0;
> > +}
> > +
> > +static void m3000_close(struct hvc_struct *hp, int data)
> > +{
> > +     struct m3000_console *con =3D m3000_console(hp->vtermno);
> > +     unsigned long flags;
> > +
> > +     if (!con)
> > +             return;
> > +     mutex_lock(&con->poll_mutex);
> > +     spin_lock_irqsave(&con->poll_lock, flags);
>
> And here.
>

Done, using guard(mutex) and a scoped spinlock guard. The spinlock is
released before timer_delete_sync(), while the mutex remains held.

> > +     con->poll_active =3D false;
> > +     spin_unlock_irqrestore(&con->poll_lock, flags);
> > +     /* Block reopen until the callback has finished and cannot rearm.=
 */
> > +     timer_delete_sync(&con->poll_timer);
> > +     mutex_unlock(&con->poll_mutex);
> > +}
> > +
> > +static ssize_t m3000_io(struct m3000_console *con, u8 *in,
> > +                     const u8 *out, size_t count)
> > +{
> > +     unsigned long args[7], flags;
> > +     bool input =3D in;
>
> You can test "in" below directly, right?
>

Yes, I've removed the boolean and now test "in" directly.

> > +     int ret;
> > +
> > +     if (!count)
> > +             return 0;
> > +     count =3D min(count, input ? 1 : sizeof(con->buffer));
> > +     /* Console writes can run with interrupts disabled; this lock can=
not sleep. */
> > +     raw_spin_lock_irqsave(&con->buffer_lock, flags);
>
> scoped_guard()
>

Done for v3. Reordering the members reduced the structure from 344
to 336 bytes with the tested configuration.

> > +     if (!input)
> > +             memcpy(con->buffer, out, count);
> > +     args[0] =3D (unsigned long)(input ? "read" : "write");
> > +     args[1] =3D 3;
> > +     args[2] =3D 1;
> > +     args[3] =3D (unsigned int)(input ? con->stdin : prom_stdout);
> > +     args[4] =3D (unsigned long)con->buffer;
> > +     args[5] =3D count;
> > +     args[6] =3D (unsigned long)-1;
> > +     p1275_cmd_direct(args);
> > +     ret =3D (int)args[6];
> > +     if (ret > 0 && ret <=3D count && input)
> > +             memcpy(in, con->buffer, ret);
> > +     raw_spin_unlock_irqrestore(&con->buffer_lock, flags);
> > +     if (ret =3D=3D -2 || ret =3D=3D 0)
>
> That's full of magic constants. Can we have defines for those?
>

I've added defines for the firmware argument/return counts and the
-1/-2 status values. I've kept zero literal as a zero-byte result.

> > +             return 0;
> > +     if (ret < 0 || ret > count)
> > +             return -EIO;
> > +     return ret;
> thanks,
> --
> js
> suse labs

Both GCC and Clang W=3D1 builds completed, and the GCC-built kernel
passed boot and HVC input/output, open/close, and hangup/reopen tests
on the M3000.

I'll put out the v3 asap

Regards,
Magnus
