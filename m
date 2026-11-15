Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794750429;
	b=uI16O0Xvj8WjEkoyY74FvQ6nZE5RMlD7gyvoURi+Ne4arpn0zewFc1nEex+ghiWS4qI1
	 zVp1RqumD89yakb3SZ5d63z9PYn3Mclk6O4sOdCmY/DFJk2YS1ozeoFwpOqiZOZwrhFLH
	 wDWcDSAWK76512R59MxX1djAv1qt3S74BXZe46jlbkFZabr6Ds8AS/+/HB89yjf4ZUnlT
	 h32Qm9GTLBM+Pw9fjfDcaEWdJ1Bvfi4w2bgPNxBScEoCG74MudaiWlEviRS/JpkFpLy48
	 9CIUgC+MtW7L+szrRNIAx245fiKm9huapyPHsI07WIpWdpkDk92b/MKDkwU3wuHWOLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FpOG0cpnBOHBYv9UoV4Ob8nspS31qekk4WrWeis1Ouw=;
	b=WirE8MWcRBiQU7PlBTaaVy8NhKD7oQO4vWChVEJSGFhc1p96b1100enPF/7mUguI27xm
	 hhYFBoDANm19jSR6wqQtZkqMtuv027vniB1ZGfZQWR0GBTT00QFU68KS8qiRx3+XekcqU
	 ei/CMDBQ09aoD/z0Eppg5O9AKvsSM5aAPZjBol02FWimeWteQFKqcr5mg2Vq8e60zp2hL
	 steDx8/XseLqRuaCvjdRo5taAHbOeTO6A8/WoPmxxiGTHoXyFKrdL8EV+hjDditHAhBX0
	 YV6bS2LfRj9npXjm87XOI2BNNr/9srbzzzT5ZGlvyFA2uyxK3KQm2C2f2WR3o/9ZuYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aWMyaooB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CC2606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25CC2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aWMyaooB
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-679a2b5fe87so2557105d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:47:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794750428; cv=none;
        d=google.com; s=arc-20260327;
        b=ivMZV25g39YdudxLtX2L7ZPhphpcU4XJY+mrgP8t3vP7JB71innbHwIlHriw4E4oUw
         5FEKg2BfjKL2DhCFiwccDfe54OwrUpE7lD2EDbpal8Y+Wt89ten0lH28gbAqkeJCVdP6
         qh8bRskWUb3eB/WM2z0pH1TTBORKxpSci7WlISIICZoseFEM5rVcFkYy07KI+I1zeAn9
         NVreihZcqoUjh8+bCJRdfH5FIMuBJ+dYKtBWR+ZyoFs4vyPSbH+MQHKs3xdR0BAG9Jd6
         o9PK9pbtCZ3iZ1aBZ37zRTy478l10CnprFce3q226lNr46g95qhcXYLqbhIiBqJyMxIc
         f4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FpOG0cpnBOHBYv9UoV4Ob8nspS31qekk4WrWeis1Ouw=;
        fh=4Q4m63qkV5jzjMZ/weiP0Dza6E7amtIM3C5sFW0CTPg=;
        b=V8U5YgAfKUH3JwjTncjTuxu3tjYypYdekSrmc4UC4wdzsUjcdD3GdscObait38kG0N
         n8J0V/U2C2Beu3MpZVo5HSCMOFW+wwofiTCr7YS3zGlVQC2UfwLJ3ZraakVGE78wpO4I
         iNBTMv1DCQ/VbeaRz+TMYJsscxSfet31B00kjIBEao5DchF5I0/XcP6vYfb61TlHTwH5
         a/KNN+SpDfqbF4gKWbkExRyTDKi1pqiWkWtfbM/OYmMFL/kSwW/P4FVk0EylEjB/yD30
         nrys1cla0qcH5dWBAK8lQ5y1PqQ4FHJ0nvcHhh/WVQ2Et+GvVFDy4Xvwan+MpV6JeLtp
         s+qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794750428; x=1795355228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FpOG0cpnBOHBYv9UoV4Ob8nspS31qekk4WrWeis1Ouw=;
        b=aWMyaooBHymqlhmmh9HmpWGiHQxNTYahKaz7UxgEAvmKiMGJJF9eMOC1+vOaHhX3/f
         kGPN0lbRMDckE8xmhyrAbQC5mPmMhSfjI70YIo+2LqeEmi+ixQFROlfbw46G/Un8ohjS
         vc8zcBbl3TAmuFVwAQz1YLvI7OX3tYO8IPJzVoGM9IhcGepL/55jwuvzwEjK57QHjZKD
         TiRFSUQOxIfEB21wY9/ZSIE7KAsBOBZ5wNsbifuhRwfml7/abdCw4/ag0PjK7oDwKKB5
         QwrrM2QLjWyKcZyW+8T+9zvDr7OKoZLJ6luVw9/868DD43vXKJt7ArOwpEFxhi2RpFNM
         keTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794750428; x=1795355228;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpOG0cpnBOHBYv9UoV4Ob8nspS31qekk4WrWeis1Ouw=;
        b=iNrCp/CeqKdVPgRbO3s9xBQQQlwyS/2taQxakGdfuEZvgAph4TRiB35MLMkgB7Obod
         ZaQ55KIA9Phu+ULoLoUWki2C+YdHY7wb4o1L5/t6Bv5nHKFY12GXeAdyXkg5a0NBT+yF
         Ls6AFKOySmnLWdkZxF+kiU0xhBHIY25lNFP/PmRk8sDts1wJuuJVmPXSdeA5y51Nou8E
         v7HRWmZjQcJgzljH1ouHVN+izKoP/rgntj6MjX945gnA4EjTVPlpq5ogq054sbFRbOhR
         1Da7bfFbjIzkqX5x1UxF2hNXaQq5gLHD7xureVFOKlncNeaC00x23VFtPCmGd5rSooOz
         MPUw==
X-Forwarded-Encrypted: i=1; AL+hErFw0geQ4LfHbKrZwBto0i9b4xK58AbOe8lzRXyNUcopvdNz+ZZhfOl/YmEDvcSt3e+SzTPpQz69MamzVpo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qf5XVmMJicGj09ViiKGSEZ2Ev0GXO09AnzEiiQBxdwnRRnz+i
	FUl4Itn6VeMDZSjiyd/vWQmm/4q1HtQTiLiHD2E3N1P9EDQEMEfAN578nqQ/L/Lah3jFor1jXDi
	Jec3ruwLMblmgqqgHZr6/KQg+lVQ59rt5FQ==
X-Gm-Gg: AYBFou0RrOb0CsUGwPNxiNB4V9dgA2WnqtESLGmob8O7H2m8X1Wmfjk6E207JO44ckc
	KEvkKovKEKMC3h4DOuFcFiCaR8yDaTY/p5vu7i0wc0caeXSqHV7pF7DDea8Nqzz9O7CzntvczTu
	jS2KmFqu7F3ohQsii8Sxym8dXinDFDMvsUBndrda2FsG5GppFB8KfVhwy0legJkZSX0o08YtL1R
	MryP2XczTyF6HeVKhZwp9gz9F+URoNerGUdhujrhlnjrGcwMDuDvidJ25MaPK3jt2Usw7ImXTOZ
	FwMrfPT9zzg60ZEHobYn1zQiBtqh2ae/rm84u7kPDqxyrTgfYPEfB0IwEJcamv5NJ/hXjhlSfh7
	3Ls9K/VaNAkflFXf5z8c6Uillel9kzWacr8lOwbVf8u67W8q85Ig8ghWAaTGJ2cvvw7G6WGZb6D
	oDdCBMgF4tRm6ozFKsSfePnTeBxtLR3hkoadFOha8JJfUDqL0mQFr69zn8IcjMtEVfI7ORYepjB
	q1gaQrBtnvmLt5heF9ekX/pXin8kEsB
X-Received: by 2002:a05:690e:bc2:b0:67d:b309:a23d with SMTP id
 956f58d0204a3-67db309a28emr432606d50.113.1794750428013; Sun, 15 Nov 2026
 05:47:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260821114854.12218-1-kartikey406@gmail.com> <2026092925-licorice-strode-7905@gregkh>
 <CADhLXY6t7UL9Ys65qDSBBAUzj+sQkS26xFZX3YjkFZ8ufS16wQ@mail.gmail.com>
 <CADhLXY55XwzujRCg+xgm4v4UJmfdgUQ0oihS39f3iMwFDzXTRw@mail.gmail.com> <2026101828-oxidation-squishy-51e3@gregkh>
In-Reply-To: <2026101828-oxidation-squishy-51e3@gregkh>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 15 Nov 2026 19:16:56 +0530
X-Gm-Features: AclHuK9Otwj5KZQGTuXt58Ob917qEckKqwNSKFzQk-AX8IyL3DHhyoRMo2Da_E8
Message-ID: <CADhLXY4N5ia9-J7ahmnOE2i6r5w-SMZC0KiezFu0P1n7=O_xrQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_audio: reject srate request for
 unconfigured direction
To: Greg KH <gregkh@linuxfoundation.org>
Cc: kees@kernel.org, pavel.hofman@ivitera.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 5:24=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sun, Oct 18, 2026 at 04:28:49PM +0530, Deepanshu Kartikey wrote:
> > On Wed, Sep 30, 2026 at 1:48=E2=80=AFPM Deepanshu Kartikey
> > <kartikey406@gmail.com> wrote:
> > >
> > > On Tue, Sep 29, 2026 at 6:53=E2=80=AFPM Greg KH <gregkh@linuxfoundati=
on.org> wrote:
> > > >
> > > > On Fri, Aug 21, 2026 at 05:18:54PM +0530, Deepanshu Kartikey wrote:
> > > > > u_audio_get_playback_srate() unconditionally locks and reads
> > > > > uac->p_prm.lock/srate, but g_audio_setup() only initializes
> > > > > p_prm.lock when p_chmask is set. On a UAC2 instance configured
> > > > > without a playback direction, this results in acquiring a
> > > > > never spin_lock_init()'d lock when a GET_CUR sample rate
> > > > > request targets playback, triggering a lockdep "trying to
> > > > > register non-static key" warning.
> > > > >
> > > > > Reject the request with -EOPNOTSUPP when p_chmask is not set,
> > > > > before touching prm->lock.
> > > > >
> > > > > Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playback =
srate getter")
> > > > > Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.co=
m
> > > > > Closes: http://syzkaller.appspot.com/bug?extid=3De1d0e66badecc32d=
45eb
> > > > > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > > > > ---
> > > >
> > > > How was this tested?
> > >
> > > I have not been able to test this since there is no
> > > repro present in syzbot.
> > >
> > > I verified the fix by static analysis of the call path in the report
> > > (afunc_setup -> in_rq_cur -> u_audio_get_playback_srate) and confirme=
d
> > > in g_audio_setup() that uac->p_prm.lock is only passed through
> > > spin_lock_init() inside the "if (p_chmask)" block, so it is left
> > > uninitialized whenever p_chmask is 0. Leading to lock splat issue.
> > >
> > > This patch is compile test only
> > >
> > > > Did you forget a Assisted-by: tag?
> > >
> > > Sure I will add assisted by tag
> > >
> > > thanks
> > >
> > > Deepanshu
> >
> > Hi Greg,
> >
> > Please let me know the status of this patch.
>
> Burried with 2000+ other pending USB patches, please be patient, there
> is no rush here as this is not affecting any real device you have,
> right?
>
> thanks,
>
> greg k-h

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu
