Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794495050;
	b=nZJmLmrQd5pSH+l2iICMemEl/aKMzYc+vvElcGUHhEtv/TFbC8zVwxXCGyCWarJTRemP
	 xvhOm399q2y1j8fCEpCIV+P9a4AA8DRzpeodaLHDqYKbCh0Z3h66DONcsbCyiEWTJHNtg
	 dU1kP2a5UcKjXDOQ7Cck6sAQMr7af8L4pVLdzLDGsruPxmx9J157zk+9jrOUuBHQm2Eg7
	 sksZsFZkdr7/pXZKFGkes702E9nFqxPAz8+Hv7zoO/LAtBmEHQfnsw1IZzuv8gvuuSt6E
	 t0CB8gBj9TWjILbfKKoGrmTWV9H5gR9Tzr8+HBgFcquERWVq2TdldnDyJ5Wlo0AFhEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tJHWQhGrI7GUoe4JaO+3Xzr1V22pkVxIBqr6rM+e5Z8=;
	b=f7rkjezILuMuhVSCx+wyE1hQRp7FT380Oj9nkbFHo3i2+TwPbUiBE9/052Y8wvyTNihj
	 T2mE8tgHFkd/odjq/Md7r/vkkEygX+tMpieRoV9FUYcw4nD4Fq8t1HGkUC8poRt9tNgiL
	 QorYSk2G26RFVqcmaDMTrX/A1cEipRccigCO9oQxn7prONsASsDAfTyekix7oMTePku3Q
	 L7wpxdkuKEYmUrbjbxBjm1fpfqpaTkti8JLPBBJ5K8AhLC7OP4+c1pDq0D6LlVXoKRK3L
	 NgKgGDSEZAf7G9polA5c5Et7Slyz8QbH6tm2l9Dlubt4wxCJEHiC79oJ00fk8zMWSjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CVxlyN1i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE5E606A885
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE5E606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CVxlyN1i
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-679aeeddc6bso5283416d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:50:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794495049; cv=none;
        d=google.com; s=arc-20260327;
        b=r0jXPPyU9C4PTi74GFRtPnpIJCaSRyVvvi1d4msCs6qXCg9z5zdo2yEjNiNX3yEmNH
         3Yy1DN4RHkgbfkBtywlwww9TXO4lkbL0GhGFaWxfGFLijSvIv4AY8a0l+SsatYXD/WbD
         C2htKwiCqMHEnDK3EoSTDdem3DoXfATLnDN2J2Uar0O22O0lO9VzhDtD2JtpxJJuLXLT
         JE5j986KvqXApnXh77rp98CtPZSV+1Q5IH8aqWS87QifaX5Rh0KASHvCegLS4/E+L14I
         WaxfWrgdE9COfetxNjoQtobWIshMgXGdkaeXTFWDiTFuvzdfnXim8YWmraeQMZKb1BS4
         HvPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJHWQhGrI7GUoe4JaO+3Xzr1V22pkVxIBqr6rM+e5Z8=;
        fh=3m3Cum/YcUyGYim6fV+NNiROL+EOlf+FEAkt/jTF+sM=;
        b=LqC1zIN7QqSSa3Sd5Ou8Tk32ZaGq9B4D3KR3nOcnGmSwR4MJ6cTrf4T92pdbeQ8guz
         kaoMUaoe/quPkHDO1816lZm0S5mwNLYA0jXisyPmek45xZ86W9i4Efxaejemb5dMd23l
         J1c5XbXa5SimY+DKoQLUb66gAsIyl1SIQ/rJ6D2ooFZDdVBBHrnFMSZt6NdNrHCWkye1
         QwQbkvvid9ied1jBkks3PXlEcHdPdZCsncETSeXsEqN9Bdtt3L1HBanDy0YIKSNA6e9B
         VFGTcP88q0ujC27pA8Lxo7kLfp07Gx6oi3dfHHqhWbCEMbjhdUIB60BG1HxJer+kNsdJ
         QyPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794495049; x=1795099849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tJHWQhGrI7GUoe4JaO+3Xzr1V22pkVxIBqr6rM+e5Z8=;
        b=CVxlyN1i5mCeQJUKMF+3j1mwH1QAze3gNw1vImWm0uo1MMp1/58bZ4VG3jxUDrOt/F
         eMANZNggK2UxZ6kJTR5o1KUcY7u4Ejyn+/29ASbovwwPgC4ifU9tUcFENq1dNDoQbCDm
         YHuDWsBhe4pwKsYLfGga/0HneNqgHFEY3ItybvEAXQkYVsQMbJMuN0w4OjMItoQ0+QRl
         hQlJEQUeNjN8qI8OoHsXS4zEGt7adm1sT/UrYHR20ik1LHooClawULvfw1RtPJOiui/D
         W0q3NMQvIiiyKQruxiNb3nMALaYaOByjEhN/e9l5cGA2icnviIqS5WEOtcnZIS+C8BS/
         AUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495049; x=1795099849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJHWQhGrI7GUoe4JaO+3Xzr1V22pkVxIBqr6rM+e5Z8=;
        b=BcT9DD4+4VI8It0Ug3UHZQXGxr6U653osV5Tx1oSTibpcrElj34NwRSYcqCx6MtRKI
         EU39bGknniKuvtukahvGo4Ls4971o2GyXflR0Q/7lTYp98VbL25dXncu5bEpluL3p4GR
         W046B5cUnON5mfJRTqW94zNhZZm9Z8yjqAd5/b8i/dsNXg1p9exHU8zgRYla3YCr+pfX
         zSpyEXjq3Zzq9Idw+k0sM1u7RRReMIwawdzWl2We+e6jtbnvS2Ls9iq5aW7xjhRY/RHt
         iCxSC4n32Rhh7pjW+l/GIXEOXkcawW/3Z7lFTpOmocFHkjhrd54q2nmwtebs74ThGRmx
         BSdA==
X-Forwarded-Encrypted: i=1; AL+hErEYt9VS5Fqdu8jT+FTzzXyhFHPZY400JFXp0E5FMstjSjkf1NvgZh67sIl9ZFn9KVz99cZGLauuhTjTvN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OcSRWJlo+IYQLp1bGLJAZxFSJQatENf8wLcAE56k25Lmj06rp
	8Hf1CLCmFG0KijCm0vPp0Cvj8YBw3gWbYw/FfLUOKFm2fJzyIX6ftPA5s46Y+6bowxLUjpQvhD7
	lVlg8Gys1N2S6F3V2XtxyCzhTwl/4qwGbIUYvqv0/9w==
X-Gm-Gg: AYBFou2M1ZOY69RWcUpXDXYMzNuYLPw/qYg9DnB8EkMdqF4hWJ+6eFshxw6rZJC0lpz
	vbFwfcn0+elSeqXOIHxI6xAYjJ1ctA2p8TEaSHHIQ/kHdM3kQGFH8IlhFKq3IC15m8/J/7lfmAU
	WiIOI9FYih8P3+J0+Dnu6OwrwFSh0YjUSKTw67WNJBpjcZdmcDxRa98zh+2b8nKy5qpNZIC5eS7
	prKwSQbBu03/NBG/Idm7whxW6GZjcztmwn8k+q6WeXI1ZTfiiW0vSHX7m8J5pXIckiAjYEu3j7B
	jc3pGnNNKtEp0xXMf4VbEx4xA3+Y0bcoCGpD96LLyONEphlZ0cxABA5DuT8occgfCWu3StrqgXE
	0awznjXJ6yDGiGhaccs84//PlIqxAr2avf6Nw7HMUKsVj2lY3icUEoQrHQ7jPO5ZYY2Wqy+g=
X-Received: by 2002:a05:690c:298:b0:8b3:3854:c288 with SMTP id
 00721157ae682-8b3a823c663mr33166307b3.110.1794495048660; Thu, 12 Nov 2026
 06:50:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
 <CAPb1+K2BxnfQ7VUQ15td5f9pVhn-ARSM9EjfOU8WuW72o+cvPg@mail.gmail.com>
 <2f722967b6db0692d4dd4164aff39b62@gmail.com> <CAPb1+K1J2F-=cJF_+Z+RkA+9uLD8-15m3hDv71DSPG47XLJttw@mail.gmail.com>
 <CAPb1+K1pr7wtp-CCE4x4i4HzVkGfpiyXRBdqWJ-fmJpx_-pfqA@mail.gmail.com> <CAPb1+K1mmyvipXSx96-j-+zgxeTztLNfYYTuERw0Ykf5WDv9sg@mail.gmail.com>
In-Reply-To: <CAPb1+K1mmyvipXSx96-j-+zgxeTztLNfYYTuERw0Ykf5WDv9sg@mail.gmail.com>
From: Gideon Heinz <gideonheinz02@gmail.com>
Date: Thu, 12 Nov 2026 15:50:37 +0100
X-Gm-Features: AclHuK_3Lkp7OPnByaiD3F5kLByxdFcRaFbVXKlPtrmlYrNHBVBXbqXKNw35LUM
Message-ID: <CAPb1+K2NSGzvp5b8_CfRrDK2trD74+pCi_a+OYV4cza++DP=8w@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] HID: logitech-hidpp: G920 force-feedback fixes,
 rework, and cleanups
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	=?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
	Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, Edwin Velds <e.velds@gmail.com>, 
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

One more result, this time the combination you asked for: your input
core patch in the kernel, plus the v2 series without patch 22/33 as
the driver.

Setup: CachyOS 7.3.4 kernel with only your =E2=80=9CInput: destroy
force-feedback device on input unregistration=E2=80=9D patch built in. On t=
op
of that, hid-logitech-hidpp built out of tree against the 7.3.4
headers from your v2 base (630059a5a632) with patches 1-21 and 23-33
(7.3.4 already has a different G920 init fix, so I could not apply the
series to the in-tree driver directly).

Same reproduction: fftest holding the G920 event node at the effect
prompt, rmmod hid_logitech_hidpp, then exiting fftest. Result: rmmod
returns in 98 ms, there are no =E2=80=9CFailed to send command to device!=
=E2=80=9D
lines at all, no hung task warning, and fftest exits normally with the
machine staying up. For comparison, your input patch with the stock
7.3.4 driver took about 3 minutes and printed 12 failures, as in my
previous mail.

If you would like me to add a Tested-by for the combination (input
patch + series without 22/33), please say so.

Thanks,
Gideon

On Thu, Nov 12, 2026 at 3:41=E2=80=AFPM Gideon Heinz <gideonheinz02@gmail.c=
om> wrote:
>
> Hi Dmitry,
>
> A follow-up to my last mail. I ran the rmmod test a second time with
> the same result: no crash, and rmmod blocked for 3m7s, again with 12
> =E2=80=9CFailed to send command to device!=E2=80=9D lines 15.36 s apart. =
This time the
> kernel printed a hung task warning, which shows where it waits:
>
> INFO: task rmmod:6286 blocked for more than 122 seconds.
>       Tainted: G S  7.3.4-1-cachyos #1
> task:rmmod state:D
> Call Trace:
>  schedule+0x6f/0xb0
>  schedule_timeout+0x31/0x140
>  wait_for_completion+0xc7/0x1f0
>  __flush_workqueue+0x198/0x420
>  drain_workqueue+0x4f/0x150
>  destroy_workqueue+0x56/0x390
>  hidpp_ff_destroy+0x42/0x50 [hid_logitech_hidpp]
>  input_ff_destroy+0x33/0x70
>  input_unregister_device+0x48/0x70
>  hidinput_disconnect+0x45/0xc0
>  hid_hw_stop+0x8c/0xc0
>  hidpp_remove+0x39/0x60 [hid_logitech_hidpp]
>  hid_device_remove+0x4a/0xa0
>  device_release_driver_internal+0x1c2/0x320
>  driver_detach+0x8f/0xd0
>  bus_remove_driver+0x102/0x190
>  hid_unregister_driver+0x22/0xb0
>  __se_sys_delete_module+0x291/0x3d0
>
> So with your patch the final teardown now runs from
> input_unregister_device() while the module is still loaded, which is
> what we wanted. The 3 minute wait is destroy_workqueue() draining the
> queued commands, each of which times out after the driver=E2=80=99s 3 x 5=
 s
> retry. I have not tested whether the series=E2=80=99 changes to the send =
path
> and removal order shorten this on this kernel.
>
> Thanks,
> Gideon
>
> On Thu, Nov 12, 2026 at 3:30=E2=80=AFPM Gideon Heinz <gideonheinz02@gmail=
.com> wrote:
> >
> > Hi Dmitry,
> >
> > I tested your input core patch (=E2=80=9CInput: destroy force-feedback =
device
> > on input unregistration=E2=80=9D) on a real kernel: CachyOS 7.3.4 (stab=
le,
> > which already has an equivalent G920 init fix) plus only your patch,
> > with the stock hid-logitech-hidpp driver. The hidpp series is not
> > applied, since it doesn=E2=80=99t apply to 7.3.4 as is.
> >
> > Same reproduction as before: fftest holding the G920 event node at the
> > effect prompt, rmmod hid_logitech_hidpp from another terminal, then
> > fftest exiting. The machine no longer goes down. The module unloaded
> > cleanly and the system stayed responsive.
> >
> > One observation: with the stock driver, rmmod blocked for about 3
> > minutes. After =E2=80=9CUnloading HID++ force feedback.=E2=80=9D dmesg =
shows 12
> > =E2=80=9CFailed to send command to device!=E2=80=9D lines, 15.36 s apar=
t (the 3 x 5 s
> > retry per command), then rmmod returned. I assume these are the queued
> > effect erases timing out because the transport is already closed, and
> > that the series=E2=80=99 changes to hidpp_send_message_sync() and the
> > synchronous erase would remove this wait, but I have not tested that
> > combination on this kernel.
> >
> > Tested-by: Gideon Heinz gideonheinz02@gmail.com
> >
> > Thanks,
> > Gideon
> >
> > On Thu, Nov 12, 2026 at 11:48=E2=80=AFAM Gideon Heinz <gideonheinz02@gm=
ail.com> wrote:
> > >
> > > Hi Dmitry,
> > >
> > > I tested the out-of-tree equivalent you suggested, ff->destroy =3D NU=
LL;
> > > in hidpp_ff_stop(), on top of the 33-patch v2 module (G920 046d:c262,
> > > 7.3.1-1-cachyos).
> > >
> > > Same reproduction as before: fftest holding the event node at the
> > > effect prompt, rmmod hid_logitech_hidpp from another terminal, then
> > > entering -1 in fftest.
> > > This time fftest exits normally, the machine stays up, and there are
> > > no errors in dmesg.
> > > The only message is the single =E2=80=9CUnloading HID++ force feedbac=
k.=E2=80=9D at rmmod time.
> > >
> > > I=E2=80=99ll try your input core patch on a rebuilt kernel later and =
report back
> > >
> > > Thanks,
> > > Gideon
> > >
> > > On Thu, Nov 12, 2026 at 3:43=E2=80=AFAM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > Hi Gideon,
> > > >
> > > > On Thu, Nov 12, 2026 at 02:30:39AM +0100, Gideon Heinz wrote:
> > > > > Hi Dmitry,
> > > > >
> > > > > I tested v2 of the series on my G920 (046d:c262). Everything on m=
y
> > > > > list works except one scenario that takes the whole machine down,=
 with
> > > > > and without your series (last item).
> > > > ...
> > > > >  - rmmod with fftest holding the device open: rmmod returned afte=
r
> > > > >    2.99 s with "Unloading HID++ force feedback" and nothing else =
in
> > > > >    dmesg. When I then exited fftest (entering -1), the machine we=
nt
> > > > >    down: the first time with a garbled panic screen that I couldn=
't
> > > > >    read, and on later attempts as a total hang with no output. Th=
e
> > > > >    same sequence on stock Arch 7.2.11-arch1-1 with the unpatched
> > > > >    driver also hangs the whole system, so this predates the serie=
s.
> > > > >
> > > > >    To reproduce: with the module loaded and the G920 plugged in, =
start
> > > > >    fftest on its event node and leave it at the effect prompt, ru=
n
> > > > >    "rmmod hid_logitech_hidpp" from another terminal, then enter -=
1 in
> > > > >    fftest.
> > > > >
> > > > >    I could not recover a trace yet and will send one if I manage =
to.
> > > > >
> > > > >    My guess, from reading the code and not verified by a trace:
> > > > >    hidpp_ff_create() stores hidpp_ff_destroy() and the other FF
> > > > >    callbacks in the ff_device as pointers into the module. With f=
ftest
> > > > >    holding the evdev open, the input_dev outlives the driver, so =
when
> > > > >    fftest closes, the final input_dev release calls ff->destroy i=
n
> > > > >    module code that rmmod has already freed.
> > > >
> > > > Thank you very much for the thorough testing!
> > > >
> > > > Your diagnosis is spot on. Opening /dev/input/eventX pins the evdev=
 cdev
> > > > (and through it input_dev), but does not hold a module reference on=
 the
> > > > underlying HID driver. When rmmod unloads hid_logitech_hidpp while =
fftest
> > > > still has the file descriptor open, __input_unregister_device() dis=
connects
> > > > evdev (flushing effects, closing the device, and marking evdev dead=
 so all
> > > > subsequent ioctls and writes return -ENODEV) and runs ff->stop(), a=
fter
> > > > which rmmod frees the module text. When fftest finally exits and cl=
oses the
> > > > file descriptor, input_dev_release() calls input_ff_destroy(), whic=
h
> > > > invokes ff->destroy() pointing into the already-unmapped module tex=
t.
> > > >
> > > > Rather than working around this in individual drivers with a separa=
te
> > > > ff->stop() callback, input core should call input_ff_destroy() dire=
ctly in
> > > > __input_unregister_device() once all handlers are disconnected and =
the
> > > > device is removed from sysfs. At that point nothing touches dev->ff
> > > > anymore, and calling input_ff_destroy() there guarantees ff->destro=
y()
> > > > always runs while the driver and its module are still loaded (while=
 the
> > > > second input_ff_destroy() call in input_dev_release() becomes a no-=
op once
> > > > dev->ff is NULL).
> > > >
> > > > Could you try the input core patch below (with patch 22/33 "HID:
> > > > logitech-hidpp: shut down G920 force feedback on input unregister" =
dropped
> > > > from the hid-logitech-hidpp series, since ff->stop is removed and
> > > > hidpp_ff_destroy() will now run on input unregistration)?
> > > >
> > > > Alternatively, if you prefer to test with your out-of-tree module b=
uild
> > > > without rebuilding the kernel, you can test the equivalent effect b=
y
> > > > setting:
> > > >
> > > >         ff->destroy =3D NULL;
> > > >
> > > > inside hidpp_ff_stop() in hid-logitech-hidpp.c.
> > > >
> > > > Thanks.
> > > >
> > > > ---
> > > > From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > Subject: [PATCH] Input: destroy force-feedback device on input unre=
gistration
> > > >
> > > > When an input device is unregistered while userspace holds an open =
file
> > > > descriptor to its event node, input_dev_release() is deferred until=
 the
> > > > last file descriptor is closed. Because input_ff_destroy() was only
> > > > called from input_dev_release(), force-feedback teardown (ff->destr=
oy
> > > > and freeing ff->private) could run after the parent driver had alre=
ady
> > > > unbound, freed its device state, or even been unloaded via rmmod,
> > > > causing use-after-free errors or page faults in unmapped module tex=
t.
> > > >
> > > > Commit ef166ce08801 ("Input: stop force-feedback timer when
> > > > unregistering input devices") added a separate ff->stop callback fo=
r
> > > > ff-memless, but left ff->destroy invoked from input_dev_release().
> > > >
> > > > Once __input_unregister_device() has disconnected all input handler=
s
> > > > (which flushes effects, closes the device, and marks evdev dead) an=
d
> > > > deleted the device from sysfs, nothing accesses dev->ff anymore. Ca=
ll
> > > > input_ff_destroy() directly in __input_unregister_device() so that
> > > > ff->destroy() always runs synchronously while the driver and its mo=
dule
> > > > are still active, and remove the now-redundant ff->stop callback. K=
eep
> > > > input_ff_destroy() in input_dev_release() (where it is a no-op once
> > > > dev->ff is NULL) to handle input_free_device() on devices that were
> > > > never registered.
> > > >
> > > > Fixes: 509ca1a93836 ("Input: implement new force feedback interface=
")
> > > > Cc: stable@vger.kernel.org
> > > > Reported-by: Gideon Heinz <gideonheinz02@gmail.com>
> > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > ---
> > > >  drivers/input/ff-core.c    |  2 +-
> > > >  drivers/input/ff-memless.c | 23 -----------------------
> > > >  drivers/input/input.c      |  5 ++---
> > > >  include/linux/input.h      |  3 ---
> > > >  4 files changed, 3 insertions(+), 30 deletions(-)
> > > >
> > > > diff --git a/drivers/input/ff-core.c b/drivers/input/ff-core.c
> > > > index 0e5d1d1ceb46..133b4622dc49 100644
> > > > --- a/drivers/input/ff-core.c
> > > > +++ b/drivers/input/ff-core.c
> > > > @@ -338,7 +338,7 @@ EXPORT_SYMBOL_GPL(input_ff_create);
> > > >   *
> > > >   * This function is only needed in error path as input core will
> > > >   * automatically free force feedback structures when device is
> > > > - * destroyed.
> > > > + * unregistered or destroyed.
> > > >   */
> > > >  void input_ff_destroy(struct input_dev *dev)
> > > >  {
> > > > diff --git a/drivers/input/ff-memless.c b/drivers/input/ff-memless.=
c
> > > > index d1fefd1dfc0d..3069436148ec 100644
> > > > --- a/drivers/input/ff-memless.c
> > > > +++ b/drivers/input/ff-memless.c
> > > > @@ -483,32 +483,10 @@ static void ml_ff_destroy(struct ff_device *f=
f)
> > > >  {
> > > >         struct ml_device *ml =3D ff->private;
> > > >
> > > > -       /*
> > > > -        * The timer is normally shut down in ml_ff_stop() when the=
 device
> > > > -        * is unregistered. However, we still shut it down here as =
a safety
> > > > -        * net and for cases where the device was never registered =
(e.g.
> > > > -        * error paths during probe).
> > > > -        */
> > > >         timer_shutdown_sync(&ml->timer);
> > > > -
> > > >         kfree(ml->private);
> > > >  }
> > > >
> > > > -static void ml_ff_stop(struct ff_device *ff)
> > > > -{
> > > > -       struct ml_device *ml =3D ff->private;
> > > > -
> > > > -       /*
> > > > -        * Even though we stop all playing effects when tearing dow=
n an
> > > > -        * input device (by the way of evdev calling input_flush_de=
vice()
> > > > -        * that calls into input_ff_flush() that stops and erases a=
ll
> > > > -        * effects), we do not actually shutdown the timer, and the=
refore
> > > > -        * we should do it here to prevent it firing after the inpu=
t
> > > > -        * device is unregistered and its associated resources are =
freed.
> > > > -        */
> > > > -       timer_shutdown_sync(&ml->timer);
> > > > -}
> > > > -
> > > >  /**
> > > >   * input_ff_create_memless() - create memoryless force-feedback de=
vice
> > > >   * @dev: input device supporting force-feedback
> > > > @@ -543,7 +521,6 @@ int input_ff_create_memless(struct input_dev *d=
ev, void *data,
> > > >         ff->playback =3D ml_ff_playback;
> > > >         ff->set_gain =3D ml_ff_set_gain;
> > > >         ff->destroy =3D ml_ff_destroy;
> > > > -       ff->stop =3D ml_ff_stop;
> > > >
> > > >         /* we can emulate periodic effects with RUMBLE */
> > > >         if (test_bit(FF_RUMBLE, ff->ffbit)) {
> > > > diff --git a/drivers/input/input.c b/drivers/input/input.c
> > > > index 210635ef147e..7be69deed8eb 100644
> > > > --- a/drivers/input/input.c
> > > > +++ b/drivers/input/input.c
> > > > @@ -2286,10 +2286,9 @@ static void __input_unregister_device(struct=
 input_dev *dev)
> > > >                 input_wakeup_procfs_readers();
> > > >         }
> > > >
> > > > -       if (dev->ff && dev->ff->stop)
> > > > -               dev->ff->stop(dev->ff);
> > > > -
> > > >         device_del(&dev->dev);
> > > > +
> > > > +       input_ff_destroy(dev);
> > > >  }
> > > >
> > > >  static void devm_input_device_unregister(struct device *dev, void =
*res)
> > > > diff --git a/include/linux/input.h b/include/linux/input.h
> > > > index 3381608127f7..02047cc45d04 100644
> > > > --- a/include/linux/input.h
> > > > +++ b/include/linux/input.h
> > > > @@ -549,8 +549,6 @@ extern const struct class input_class;
> > > >   * @set_autocenter: Called to auto-center device
> > > >   * @destroy: called by input core when parent input device is bein=
g
> > > >   *     destroyed
> > > > - * @stop: called by input core when parent input device is being
> > > > - *     unregistered
> > > >   * @private: driver-specific data, will be freed automatically
> > > >   * @ffbit: bitmap of force feedback capabilities truly supported b=
y
> > > >   *     device (not emulated like ones in input_dev->ffbit)
> > > > @@ -579,7 +577,6 @@ struct ff_device {
> > > >         void (*set_autocenter)(struct input_dev *dev, u16 magnitude=
);
> > > >
> > > >         void (*destroy)(struct ff_device *);
> > > > -       void (*stop)(struct ff_device *);
> > > >
> > > >         void *private;
> > > >
> > > >
> > > > --
> > > > Dmitry
