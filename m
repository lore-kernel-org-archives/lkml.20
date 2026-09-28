Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455084E36D7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612199; cv=pass; b=Q4xHjschnksEwGZb/GH2Latd4HJkN8cxEcTzqqVtfRaNhjp75fkLv5MIvao/0sFX+HOXlLoCyaTy+rz7fUPSZrfAogdew65QmoZlB1unNg7pqgMV6Yco4mKxT5TZSY0tBclK2khee5Lb6CbIZUwPfBFzjhM9fxrwtBRBOiNIb70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612199; c=relaxed/simple;
	bh=AEk5RLn10fJLI/kXbvuc+LztgIi04lvQj1tx8uOQY7w=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q4rCnP5+5q5O6FTCKu08uUh8ecwUtPT7ArUc84B2qfXGTucj3abdHMNEaF5deQ4Ru8ejYh+0hwC2NmINgwZLCgiTz7OsN2aJwP1Qqnj0YpDVx16FuTtj/CiQVCiMPIVnb3a7+EVMXqOnf9gv1UjA04w0hqYI/Sw/+xlq4wPLQg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPvcJa9p; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPvcJa9p"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2ad8so2035994fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612188; cv=none;
        d=google.com; s=arc-20260327;
        b=H0AKgvMyNO9CHwSiuy63hgatdW6LvewG38TyjREtWSdQ2u8GHK3vK8uG1iqP6FD8pz
         f4vRxtV8YnzUBJR+j4ct67MQPaXV28058jNFJ6cgtsyqe/5ErsZHbM6niFYcKYs8cPzx
         TY9kRR1xOSzkRRsQLQIa284FEO6O5ZVY3Uq6ZoTzX6QlKrS9To6IxcnwsiaNYFNEnvsa
         T9hvphYDU4HI2kI3v0V1EkaO88LkGU9JFWcHn5YJIWc8lyH8MxrRO7MzAmrNpFpgFZFn
         +wdL8ObFcxY53T/APBVajCT2OsFDZrUi8I+TtmLOfkBgUNTnnOgtVV5tKVXWSniEM7mX
         9eXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=U7iukyadYas2XsIwnfWzVyvIWjktLS2Dir+fmM5Abis=;
        fh=P14y2Je1OFJqrVY18uPmI/4mI/H84L001cD08K7A5Ho=;
        b=SFcAKBBKaqQizRxnCMlfwUTqLSVviyUGB4Vqd6lkxBWZQ5dauZZdYsZq4FD9ebQhay
         98U+DpeI2G3P+5l7mG6D85sZaWgB9JYW4rD5SLTaXdb/ERUzFtnrjFIac3Ts/b81SPNl
         qylopTe92eZsNS6Prw9yyQ8hs2QP+0nBuZKDZyd0Qk2dsPwYuX01dJfdkJdaktyBuql5
         LYsF/VYng/UgxLPHlKgAR4ol3JiHjnZjqyM2hOUrtOi55VsSzhKp/LwNEBnntjnkYTuo
         EeplELX/G+/1KY1S9y+JsWbyaT6vOakX3e+ZPR3MKgry5/6Wufdo+39knfviP/p1ni6n
         AVVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790612188; x=1791216988; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7iukyadYas2XsIwnfWzVyvIWjktLS2Dir+fmM5Abis=;
        b=DPvcJa9pa748pEBTe9bOtoaV5U9PH06JLvnEw/3D1SR5NneYJvN8PZG53vTrNn2XRW
         wyPGoNz4UKb2DomPYz6Sjl0QDFl8fpXGKcXhMqN8v2A1bj1W5e0OphXURl3zBbQmRxEJ
         ihhHUXw1gnChhN4BSGqzro6DOZYi61OwzqbWIYg8jHz/Y7r6L1vGPqLut5VCCFD1fPCO
         Y8Sue8mTxlSM6m6DAZk6o5IeugGZ9HjSoesGs9bvaXTmpmLTqGvTU1WZsNtMv+/d+aZJ
         Md/VX0S8vuWd18TWDVaR3MpwX7vQcLlD8bEa1SzAxlHab1c5eP0UAVMsyhbFKTO+44Kg
         vkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612188; x=1791216988;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U7iukyadYas2XsIwnfWzVyvIWjktLS2Dir+fmM5Abis=;
        b=1WUTD7A59Vjgv6dY5YRwOXN5X38xXgc2Y5dD0C6z2ehk+B1KYnrEYtyNgMIKRyVc0J
         FtKtc73LtmcaVF83pfxRQDs4IGX2DsyR8KnQOmLK8+3EppCmYJAWA60fuY5Mrqf2ptwG
         0vcfLfjiPKbJADhV7ien/FqYdfZgUaUMqs4z/m9cmDh6xAvIm+SONM788LjYhjCPoSsm
         5neUjc07j+7RzLVHScBfwTpmpmPS0GBs2QWl/XGOaLRi8Xw0sJiu/D6+NIsfhGua8vOK
         qFg3Hu87++UDFBS+fHhQ6jNJkO3Cv06Opi0orfPFHbyTRp2XkyN4B2L7bl0I2NfAcbb1
         dq2A==
X-Forwarded-Encrypted: i=1; AKwUvBzEz7d90SihS/SPMN0zNz1YdNvRf2PK0Cw9tfM9QjQUmjR48rgAC2V8XxLwDOBrMPDILL/VElY3hoKkSEw=@vger.kernel.org
X-Gm-Message-State: AFuF++nfGFgRQYXx8/NhmTApYBoZWwcXigwVLkrCLYBLQKEWwlcdPQbQ
	AbjxTDREPg9zlxm73MmjPp1Ri7QOP4KNlHATjyxKsg3THLxOvfGxzPXCntIEpKPRm7PkU5lHjrB
	tRyJlWIXzQjYmltjD44YRqoGzu6HiMxg=
X-Gm-Gg: AYBFou36be4LsX4E50RFNpqsG/GeSH5qZRpBP65uJi/L6A7Zgk3fIJutFpO2KHVQo+W
	yUC4U9ElWKbtgLoPZ1W7Kk5+lOkwoQE4CLGmdyAX3BA3IGttPyO/MVNqQZXtuSVtoc/iZYZ5z35
	q74JUc1dgrMC4OYbm7uUyZ9MwxV2oTW5r9WZ+iZ/9oJTx/kvlekxZIKshMVkkIpzC4BGwwV/QTV
	bGKpr2wkMJ0xotHYuMWe8KrQrQZyo/JM7AMG8m497OPp2LcKGQnSB8P2XD05rqIBIw3YNXTLkpJ
	QJJbpT+n3zdHLtF1uIXvaAoCH/8cB5eMElgPHf+eiummUqAxv2Df
X-Received: by 2002:a05:6870:d32e:b0:485:d31b:7758 with SMTP id
 586e51a60fabf-491e539b64emr12474440fac.22.1790612187697; Mon, 28 Sep 2026
 09:16:27 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 28 Sep 2026 09:16:26 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 28 Sep 2026 09:16:26 -0700
In-Reply-To: <878q4l4baw.wl-tiwai@suse.de>
References: <CAP8ibudQFpGuCo+Z97ozKySft0dZ40DWAqf4tUMEe2vrbtu6jA@mail.gmail.com>
 <878q4l4baw.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ROJOX <rojoxoficial@gmail.com>
Date: Mon, 28 Sep 2026 09:16:26 -0700
X-Gm-Features: AclHuK-RmqYg9xQoznbpFe6J4aeYM1VuXNdnzqjPyFxoMAGQVWaxuyY18UYXZUg
Message-ID: <CAP8ibufezke_P6vkOakgg6wXvOKxdGGiYZ0gD6_+pFuwefA6-Q@mail.gmail.com>
Subject: Re: [RFC] ALSA: hda: clarify unsol_event locking across driver unbind
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

Thanks for taking a look.

Yes, I agree that the whole-controller teardown path appears safe in this
respect: snd_hdac_bus_exit() does cancel_work_sync(&bus->unsol_work), so an
already running unsolicited worker is drained before the bus itself is torn
down.

The case I am concerned about is the individual codec unbind/reset path,
where the HDA bus and its unsol_work remain alive.

For example, snd_hda_codec_reset() calls device_release_driver() for the
codec device:

https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/sound/hda/common/codec.c#L1799-L1810

and the legacy HDA remove wrapper reaches the codec driver's ->remove()
callback and subsequent unbind cleanup:

https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/sound/hda/common/bind.c#L152-L173

So I think there are two separate lifetime questions here.

Taking get_device() around the unsolicited dispatch would protect the
hdac_device/struct device object itself, which addresses the possibility of
the codec object disappearing while the worker is using it.

What I am not sure it protects is the bound driver's private state. The
device can remain alive while device_release_driver() runs the codec
driver's ->remove() callback and that callback tears down state subsequently
used by ->unsol_event().

Conceptually, I am worried about this ordering:

    unsol worker                     codec unbind
    ------------                     ------------
    get_device(codec)
    resolve current driver
                                     ->remove()
                                     free driver-private state
    ->unsol_event()
      use driver-private state
    put_device(codec)

So my concern is not primarily the lifetime of struct hdac_device itself,
but whether there is an existing guarantee that serializes the driver
binding/private state against unsol_event() during individual codec unbind.

If there is such an invariant elsewhere in the HDA or driver-core lifecycle,
I may simply be missing it.

Otherwise, would you expect the fix to protect only the device object with
get_device(), or would the current binding also need to be serialized or
revalidated against ->remove() before dispatch?

Thanks,
Rojox
iMac19,2 Linux audio project

On Mon, 28 Sep 2026 17:59:03 +0200, Takashi Iwai <tiwai@suse.de> wrote:
> On Fri, 25 Sep 2026 04:57:13 +0200,
> ROJOX wrote:
> >
> > Hi,
> >
> > Could you advise on the lifetime and locking contract for
> > hdac_driver::unsol_event() relative to codec driver unbind?
> >
> > In current torvalds/linux, snd_hdac_bus_process_unsol_events() looks up a
> > codec in bus->caddr_tbl under bus->reg_lock, checks codec->registered, and
> > then drops reg_lock. It subsequently reads codec->dev.driver and dispatches
> > drv->unsol_event(codec, res), without taking a codec device reference or
> > device_lock in that interval:
> >
> > https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/sound/hda/core/bus.c#L173-L189
> >
> > Separately, driver-core unbind acquires the device lock and calls the remove
> > path while that lock is held. The HDA reset path can initiate this through
> > device_release_driver():
> >
> > https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/drivers/base/dd.c#L1315-L1374
> > https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/sound/hda/common/codec.c#L1799-L1810
> >
> > This appears to permit the following source-level ordering:
> >
> > unsol worker unbind task
> > ------------ -----------
> > lookup codec under reg_lock
> > drop reg_lock
> > read codec->dev.driver
> > enter unsol_event()
> > acquire device_lock
> > invoke remove
> > tear down private state
> > callback continues using private state
>
> Usually the HD-audio controller driver calls snd_hdac_bus_exit() at
> its remove callback (or via the destructor invoked from there), and it
> does cancel_work_sync() for the unsol event worker.
>
> I thought the removal of codec->dev.driver happened after the
> driver_detach(), so at that point, isn't the device object itself
> still alive?
>
> Or maybe I haven't followed the flow completely yet. If the issue is
> real, just taking the codec's device reference around the call would
> be the easiest solution, I guess.
>
> thanks,
>
> Takashi
>
> > I do not see the worker taking the device lock or another explicit
> > binding/private-state lifetime reference before dispatch. If the callback
> > uses state destroyed by the remove path, the unlocked dispatch therefore
> > appears able to overlap that teardown.
> >
> > The codec/device object lifetime, driver binding lifetime, and
> > driver-private state lifetime are distinct here: get_device() alone would
> > pin the first, but would not by itself prevent unbind or preserve private
> > state.
> >
> > The legacy HDA wrapper additionally checks shutdown and system-PM state
> > before calling the codec callback, but those checks do not appear to drain
> > a callback that has already passed them:
> >
> > https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/sound/hda/common/bind.c#L42-L52
> >
> > I also found the older unsolicited queue-index synchronization fix,
> > c637fa151259c0f74665fde7cba5b7eac1417ae5. That appears to address queue
> > consistency rather than this binding/private-state lifetime interval.
> >
> > I tested one scratch proof candidate, not a proposed patch. It synchronizes
> > address-table lookup/removal, obtains a codec device reference while the
> > entry is protected, drops reg_lock, takes device_lock, revalidates the
> > current binding and codec registration state, and dispatches the callback
> > while that lock is held.
> >
> > That closes the ordinary callback-versus-remove schedule in a deterministic
> > model, and the modified HDA objects build cleanly in a scratch Ubuntu
> > 7.0.0-34.34 source tree. However, hdac_driver::unsol_event() currently does
> > not document callback-under-device_lock or reentry restrictions, so I am
> > not assuming that this is the correct fix.
> >
> > Could you please clarify:
> >
> > 1. Is HDA core expected to serialize unsol_event() against unbind by holding
> > the codec device_lock through dispatch, or is there another existing
> > lifetime guarantee intended here?
> >
> > 2. If that lock context is acceptable, should the callback contract prohibit
> > recursively taking the same device lock and synchronous same-codec
> > unbind/reset/reprobe? I found no direct same-codec teardown call in the
> > audited in-tree callback bodies, but indirect and out-of-tree behavior is
> > not established.
> >
> > 3. Would callback-under-device_lock conflict with expected HDA runtime-PM or
> > system-PM behavior? My source review did not establish a generic contract
> > for this.
> >
> > 4. For an event queued before unbind/rebind, is it expected to be deliverable
> > to the newly bound driver, or should it be discarded across the
> > binding/reset boundary?
> >
> > This came up while auditing HDA/CS8409 codec lifetime behavior; the question
> > is about the generic HDA unsolicited-callback contract.
> >
> > No runtime crash has been reproduced. This is based on source/lifetime
> > analysis and deterministic concurrency modeling, not a runtime stress test.
> > I may be missing an existing lifetime guarantee or invariant, and would
> > appreciate correction.
> >
> > The source snapshot checked is torvalds/linux master at
> > 165768bb70265b5c38cf0b73fafd75be235f8b14. No patch is proposed or attached.
> >
> > Thanks,
> > Rojox
> > iMac19,2 Linux audio project
