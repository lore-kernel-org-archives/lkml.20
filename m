Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794831608;
	b=5HF1PMUuImO9+BGRkS5zXOlez+yCZuAlr0f7tBrxUMaPPuDemEzWX1CpyUSShfhY8G+B
	 p4Sn1bSIGT6HwqyLXqkBkOviWeWccSxvqrFGPl3FRPpUJhnmulNaojtYYx1nzL0FsuLoi
	 15DjT7owVNj0VBAcyMuyurNM7gmo/6SkiFmzZ7ZwAMOuKmgMjLN//O72CcGsry6dRrJCh
	 9nVj5mrOJDSL9WuSmQvfbsoIwo4ONAQKYDvk1xGgQQFUKzydBZZeJHnfqw8chgcQ17Kn0
	 7MelhlBHKpAamnAN/rU0Lo7bAsm4/T4cuwJdT+U6jPpCHPrC4Wul6mXGrQuv29a7QZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ThqMa+Cp5rT1AxTJtuViQctpO4Z1h4bDlUNe0sOzkYo=;
	b=rQkpZ+CXYOy9pmVAOXPrepk00QVUvkvCtAnXIXz3JwwEouiE7VS2ZSLb2t6cACOjYOFo
	 sXp+W/U8B7CJvm8tygirXUeIOfuiE2lOvPQcsOLCTWtnBgkV5xyCddud/BXlHWI20ML++
	 pa3Qzdu8Du3W7bCbnq/eVs3+FkhFYFqSgOmbxZFaE7d75oG6N2ZL2Lhz5as51E4LH0hx8
	 bbG0OWX926vOky7KwvnkTWR6dgDB3l+izY+b/fPCd0qbHJsN1hjRLfQFqwHSMFp7f0UF1
	 VNRwkzF22j/xcyFxSoUtXyt6wyK/Fg4G546FA2r+SYsHojmQqfNOUrcW++m4erw5Fmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YP0q+c5D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026CA606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 026CA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YP0q+c5D
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a315ed211so3190838eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:20:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794831606; cv=none;
        d=google.com; s=arc-20260327;
        b=fCrb6A37fXdVLjiD50onHsvPhbDhSqmVCu1lPdeEeDN7d9pXPWdRmfQQKRsScf9HHi
         Boqil4AJErMVgf2k3BuUeA7ORvqJpe/VutoKXIb186bWt+P2TwfI5SvFoQ5J6GadhR8Z
         IdLlCZUVDUzBh3Gv6Sl2xUME3j3OkNWRQ9gziblndNEjfu57JHxAwnhMk7oy1Pc7Kxqw
         zjkPZMEBmtzz+UrstAz4mfuAj82gIIr3GRLUPmlmplLZ05MFgWpm7PcNqKEf6QyLs/G3
         8qGrOdHgRPyyNHfxDRpay2dAqVWPMVGlfw73eLnwVelROFlLtcvkz2eA4ZoFu3iBaYdk
         x06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ThqMa+Cp5rT1AxTJtuViQctpO4Z1h4bDlUNe0sOzkYo=;
        fh=daGeJsUkjaxs2RM7j31MvYuIyC06f9uuPwEK8lX85to=;
        b=IzH4+Y8hPGAJ00iQkZktTvU8fUzrX2kamvKNoTzjtgTVF6VrObBzQHW4BetnT4tZt2
         uEVVXIpLtiAC87MsrXghfF3hhF39ezYEHn0YY5ez2sAqRg7pBYKVHZU/nUkiStFl7UOL
         a+K2vMt3q5uNKzoEnf3EswinI4FjP0hIrefNLy7x4A9yghIQi0swuETJyHTGhMqElvnV
         OotrCPv5dYqjnmfxcB12jgE9yvlACkYaIHhJyhEdFJ8Lws/cSVooYNnoCfYf9vmEVF7G
         NMv2tmegsJwvEHiE9O7yw8984znkWuT9jr99HPB5FMD41whsnVXzNmrF/qUSaVDJrx3T
         qn7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831606; x=1795436406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ThqMa+Cp5rT1AxTJtuViQctpO4Z1h4bDlUNe0sOzkYo=;
        b=YP0q+c5DiPP+pGsJld3fJfzdtEhWj1PKCzybA7s8F54w02EiZAWYbIiLlBag3EaQLK
         znrv4XXPNYdvd3hpesHSQHBr6j6PqScpc4Vy0vRT8tt+YCEwbBP40lfrwoHlMKmk2Bnl
         kekCCTJQ9DnVrxUv7a6gAb2wOGWEGz/6mJvPkru+9ib5BB8hxFn33elEu+hr29cGzGxO
         YtTzXUwz3CVbacnGAMtywLjA6jrDtV74ZAcW/mGOWvZlUxWCHNt9xpsmeIkQlfy6RxYv
         Bl0qipYTYDlUnuG3LKfwG15aG+ilexeUNl0JkVNbyXY37nXP2SrpOZWUQ9BTq6lEqoHE
         qwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831606; x=1795436406;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ThqMa+Cp5rT1AxTJtuViQctpO4Z1h4bDlUNe0sOzkYo=;
        b=AhPqQZ7K9VIbYYJiBEwX+KFZiAmrMToXLoLMZLIb73Si4zwXiFou9jYx+jEfbtPXg4
         FjDYamVe6zWH3bJVsKiIepefH6vEKCVidcXLz2jXKE/xVBU4vhY6k1S4YDhIRb6qWXPx
         crSGiafeB8vXiUigrQgyZ2nTOY2pQYwMd00R/iLRE82ixGHK3ej8+8pugkCbOanPjmZP
         4P3SVXwxviosO+DnfDEzVILXWwhRv7kP+CnLSmj0gCFnRIIo16u6Q9EDxCKJa/tSu4z5
         JE4GxpcM6gpnyVE/z1G4saf5fv9+4/RPQqLU0UVKAkGqHHMhDkkcsBcTv2XKN0BIl+Y4
         a1Vg==
X-Forwarded-Encrypted: i=1; AL+hErHxiuFT+E91Vrzbr2VH/gZEWDRl5jfA81UhTi3rg6huzh540BqQZjLq4DKn4csVeq77AdR3Jk9Ba4EjLJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z92C395L9g1rzelYvvWAULY6Ox3cxmu7PqbFIvMS4LEbFjExvCb
	Ma4YtTSmkBaPmEv2AHHec/Y2TM7nW+EI4P/CWxGbxEURgGj0YHhbXbVMiHaXB7KSoiEIGmaSany
	/sCtMjqgXVpnd1nUyFQugiDdDPNrQbcw=
X-Gm-Gg: AZFdTZfJu5YsBKG/NOdxNHYsAAV4MISD1/sx9PMoRIewvq09vyNGM3328z5o5+nt9Kc
	RulD1gRaj7A0hNvQdn9dvPQJnGp8nDUhzDzzgvjL/EiWxo0Dup/wS0YV5Potusfe2z1KEZVq8zP
	jXwG099wI3tr7xK3VMZCvfBXR+j15X+myZVhB0d++W97QHiYJ60qXljl6bWtTd1FDZAZv/6199h
	ll0s3MYUy6D6JvT+tL6IEezPAjKMkuqhoO8MqXe6z5Q+BJEtb7FWShodLPtJroAnfIuvQudLrvw
	iYwpCaiBS1P4vkIeSMZrfqK3K1gD1Mo8aAqNoReW+jkQ3S7o7Ag4bFDmdyW4iPMRQC8ZAT+jsux
	lJl+np3mAZNhbQDwQjXa3l0vHOBVnf0iGwnKjReNF7y8pbOSsTjfVSsG5uGOOmeskaLSooayzyo
	eJokgyuvuXs7fZfw==
X-Received: by 2002:a05:7300:c00b:10b0:36a:647b:2d7a with SMTP id
 5a478bee46e88-377db7c8ac3mr14514561eec.0.1794831605962; Mon, 16 Nov 2026
 04:20:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106043621.1903211-1-hj351016@gmail.com> <20261106074316.2204392-1-hj351016@gmail.com>
 <6857ee54-81b3-4c8e-106f-d5c871f44375@linux.intel.com>
In-Reply-To: <6857ee54-81b3-4c8e-106f-d5c871f44375@linux.intel.com>
From: khj <hj351016@gmail.com>
Date: Mon, 16 Nov 2026 21:19:54 +0900
X-Gm-Features: Aa3M54pVVjYR42whJPeh4iY9-bRtomZTkPyisKrDYdR3jFietSTG2pxyOQFxoak
Message-ID: <CAGr5VtO-tOv5GMMfbipQYYiAEbQOZ882QFL7QWZ=9HRt+9iLMQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger:
 cancel work on teardown
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, v3 uses devm_work_autocancel() now.

I put it after devm_serdev_device_open()/devm_pinctrl_get() and before the
extcon notifier (not at the INIT_WORK() spot), so on teardown the work is
cancelled while fc->pinctrl and the serdev are still live -- the worker
touches both. Details in the v3 changelog.

2026=EB=85=84 11=EC=9B=94 16=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 8:30, =
Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=
=91=EC=84=B1:
>
> On Fri, 6 Nov 2026, hyunjungg wrote:
>
> > From: Hyunjung Ko <hj351016@gmail.com>
> >
> > fc->work is scheduled from the extcon notifier callback
> > yt2_1380_fc_extcon_evt() (and once from probe), but it is never cancell=
ed.
> > The containing struct yt2_1380_fc and the extcon notifier are both
> > device-managed on the serdev device, and the serdev driver has no
> > ->remove callback, so teardown happens entirely via devres unwinding
> > when yt2_1380_fc_pdev_remove() calls serdev_device_remove().
> >
> > devm_extcon_register_notifier_all() unregistering on teardown only stop=
s
> > future notifications; it does not drain a work item that the notifier h=
as
> > already queued. A fast-charger extcon event that races device unbind ca=
n
> > therefore queue fc->work just before teardown; the work then runs after
> > devres has torn the device down. yt2_1380_fc_worker() dereferences not
> > only fc itself but also fc->pinctrl (pinctrl_select_state()) and the
> > serdev (serdev_device_write_buf()), so it must be drained before those
> > device-managed resources are released, not merely before fc is freed.
> >
> > Cancel the work via devm_add_action_or_reset(), registered after the
> > serdev is opened and pinctrl is acquired but before
> > devm_extcon_register_notifier_all(). Because devres runs cleanup in
> > reverse order, teardown then unregisters the notifier first (so it can =
no
> > longer queue the work), next cancels the work while fc->pinctrl and the
> > serdev are still valid, and only then closes the serdev, releases pinct=
rl
> > and frees fc. This closes both the re-arm window and the use-after-free
> > of fc and of its sub-resources in the worker.
> >
> > Found by static analysis / code review; compile-tested only, not
> > reproduced on hardware (requires the Lenovo Yoga Tablet 2 1380 charger)=
.
> >
> > Fixes: b2ed33e8d486 ("platform/x86: Add lenovo-yoga-tab2-pro-1380-fastc=
harger driver")
> > Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> > ---
> > v2:
> >  - Move the devm_add_action_or_reset(cancel_work) registration from rig=
ht
> >    after INIT_WORK to after devm_serdev_device_open()/devm_pinctrl_get(=
)
> >    and before devm_extcon_register_notifier_all(). The v1 placement
> >    registered the cancel action first, so devres (LIFO) drained the wor=
k
> >    last - after the serdev was closed and pinctrl released - leaving th=
e
> >    worker's fc->pinctrl / serdev dereferences racing freed resources.
> >    The new placement drains the work while those resources are still li=
ve.
> >
> >  drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c | 17 ++++=
+++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger=
.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
> > --- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
> > +++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
> > @@ -148,6 +148,11 @@
> >       .write_wakeup =3D serdev_device_write_wakeup,
> >  };
> >
> > +static void yt2_1380_fc_cancel_work(void *data)
> > +{
> > +     cancel_work_sync(data);
> > +}
> > +
> >  static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
> >  {
> >       struct device *dev =3D &serdev->dev;
> > @@ -209,6 +214,18 @@
> >       serdev_device_set_baudrate(serdev, 600);
> >       serdev_device_set_flow_control(serdev, false);
> >
> > +     /*
> > +      * Register work cancellation after the serdev is opened and pinc=
trl
> > +      * is acquired, but before the extcon notifier.  devres unwinds i=
n
> > +      * reverse, so teardown unregisters the notifier first (no new wo=
rk
> > +      * can be queued), then cancels the work while fc->pinctrl and th=
e
> > +      * serdev are still valid, and only then closes the serdev and
> > +      * releases pinctrl.
> > +      */
> > +     ret =3D devm_add_action_or_reset(dev, yt2_1380_fc_cancel_work, &f=
c->work);
> > +     if (ret)
> > +             return ret;
>
> Why not devm_work_autocancel() ?
>
> > +
> >       ret =3D devm_extcon_register_notifier_all(dev, fc->extcon, &fc->n=
b);
> >       if (ret)
> >               return dev_err_probe(dev, ret, "registering extcon notifi=
er\n");
> >
>
> --
>  i.
>
