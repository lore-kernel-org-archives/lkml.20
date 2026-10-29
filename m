Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793308261;
	b=qizYRiL1b85uPGUbOBC7yazuaD9uIcFa/MefBNblGfLrssuiIA7AlslnTSrykJ5/zmq8
	 w7v8YU/Md1kcDmWsA8la7CywNISc1Trpe5+u6yhE7ifvlYKbydq7ylX4d+8vXKalzRlUX
	 7cH0I0rjfYtrsDat5ksfsNrs51djVc9Q9m4CPpFOLo15+JFgypIwNbl1f6jxX6CDqmMNf
	 oJSPdAAXJxVwI8EzDLk4PRssrEhdHo6qmnvJ5cvumh57Y1Mam56qkm7B2j2yblr/jEXMU
	 TPTTXwF9SlfTAJaleO9MFYJtXfrAszBIVSwEiUn3wIou4aH/d1cBTGyds3uPgN88Nfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9osQKVV1wtsQAS7vDLfnrjRdubZ+d0or7yfUi9GRVJw=;
	b=iTlgWEs28cWhKm6OPdQ0MJgu4Ke5jZN7A+Sb+k+8XcbxbMwajgFpKf7n7HTaAwRNUlnZ
	 HlUACgyiN10zteaMnAyheVPXeyIHJPrGpWmIZ13SRjKCiwdM4rk3jOheMwJTTnjTwiZXk
	 4DWd9z6rfLFPfs64SVxh156xaUEuvhSco1xzMvCPvHToXCrNVBN4WqgYqoeE6fWeHeLX2
	 g3IJNDkc8XF9VpyD+tsBuUf3j3EPQXPVjP2JeKwta8Xmmm/Z8S06tdLlbdAHliAiN8/9o
	 4Fbl2QKhM7waY90hgyXjzyKRjRTWk86pUf9Igla6sVlsV2Ul+fwJOyiG636NSPNqOFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lPqUth3e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED89606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ED89606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lPqUth3e
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-451fe9bf738so5480fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793308259; cv=none;
        d=google.com; s=arc-20260327;
        b=ID1slubPC/m7jQqdKPdSEYHnVHQkauPc0pcJWsCVc1aKSUPkkdOzRJZHoBxA1NatFq
         tieagajy81UEePTFQnuhKxC9StcOy0agUYz8MExetXKLvVwRt3sd4WByLn1CLDt5glx2
         jOjSofFUKw5iYJaSL7ZUPR0m2wf2YjYhUFTkti1I9Ljjh7xmeq0XXuxMQY6DOn/YyJFw
         46lJtxOMAPkY/gbkcNCY1xWfW26C8xalh3aN2am8FwfbGv/6DQwmNmOjgcK7IFvJnQUt
         vzTPG58hDuywYyrSxaia7Oblwhs95RfzHfAoIJxyKwqQk1+IEs82vM8sWOu7XNK95AkB
         sw4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9osQKVV1wtsQAS7vDLfnrjRdubZ+d0or7yfUi9GRVJw=;
        fh=Uq0M9dZX8gJ2BsriOnaE2E+xdFAT2QtMRynMRWuGma8=;
        b=AuURvF+u4j3OJIZ3rcRhxOf0Qfi8hvHEy3ic82O9G78Tbv7mle/6tIrp4N4FmCpLKF
         GdO0FlSuvATAcJAUY/M0qX0NbVJk/vRN3QPmmBYzGR/DVW4GkOKHcP0rEJzdsj+gR9se
         DceMQ28Jq6ycNA0pLs603UJ5rCT62bKBgk6EcR7HD//F/0phiLJiuSU5iyUcjdwTxqKR
         s/6gJtsVfHsXgOijLeawNktPoYvE035Q3HfDxguF87IJSElkTsMekDkRmFyuau8t0yH5
         HQ9sxSHGuppZMleSNS4F5hLSDl8f+IfbhZGYKc6XdzVUc9aL0U5BhTRf1F6l1GYztukI
         lzrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793308259; x=1793913059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9osQKVV1wtsQAS7vDLfnrjRdubZ+d0or7yfUi9GRVJw=;
        b=lPqUth3eKO/Y0px5tRNis80GtDFfhKR/ac+GaCcUufT9DAd9jwjxOUq+6t80jkl3sB
         aaENgRatOdAZgU8v4Ou73MS/OVSGwhYwU7e4Zp65EZD/6jZZyHcIMs/d+7FmUCTtgA84
         Ekp0crgzhvlyTn62Q88wCJFWdG6YzPyz0mQBNl9Hc//hfO4Z29AdUe8Lmg21q4imaKml
         5IMEzu6AJeUpNKT+Yd95pJNGJIf43zgfueg3GugoQEecW76U+MPLscTslg0FaO5QDiEu
         Ia/eFGaTMp+p+70dXJyNhKiLNS6xHxmCVOLtfpydwHMz0KOXJshICjFYIW/QT87mRlo1
         0gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793308259; x=1793913059;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9osQKVV1wtsQAS7vDLfnrjRdubZ+d0or7yfUi9GRVJw=;
        b=T0l3krZwq4FWhDIIC0rzDj2GQ4BZru9VCbm2vmTWEdlzR6wBatvRbOpz6/0Ff7h/M1
         Yfq91hNtfn8drfY3+nFtw85xutOUH6YVNKFsaeJ1MqvVX3Lz9gEt/em6/eIcutM7bRWS
         z6XJWDhKFxie0rVPsLekAVAF2NzvAGQlzC5rUKddgRzNQ5lv/Gwc6dyugN/iZfQCkT56
         JoHuGI97iwW7hjBRGm/fDEJ0Of+o64GaKKC4YK/gIro+MxM3gS1z6CleaVQUwVdJPZts
         LEKPzz82/raekvX3zbtRTJ9in+Tq3yE9ennQaAdlipmMbdByrJteLjujqFswIWAFccVB
         6DUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbIYiFSI4dZ2Q5Abr0k8SD1g2YTbub0ULaGOn13T439+CUqw5mvQiI9Cu9h5+DWH5Al4rsiNxzcFnfuWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJivRUGj7G53ZNPDtKcquN9rL2VIASYIMVvXJgWgdCa9IPjIM+B
	s8PkIBcJ/iJNX/eVElwayxH+ZybZaJhmJq2EvcwvahN6v9b0rEJN5Q798WEbrTsCrq0vSi4b0Nt
	367VzOxvciMMT3MEInhYDjn1MN34TrLw=
X-Gm-Gg: AYBFou1shBuX6nCR8RPVz3IK0edcTv+dDD4LGWse4U5jo+6aqrKg9DFrrROOJX2M1LW
	D/CmXW3KSPWtSqISKdc+Ulb68PbQu3jQMaoG3Bf3JZsjWj4IqeNxhlQpk0VOJqKCG0HAJAyNIdj
	D+8cnZhz2RFjQguxDOJrr6hVR1sxtiLzTH3lhipuO0tdIrOB8ts7eW4ge8BSWa2or0d1gPlUfqE
	QQ81izn926vuEYskzoGVtQlnmSdHzpsQsPpeF49M6tagY1Nn/vpTBG1yXrJwnKQIJTZGowBE7lw
	GaFhmEFQgbhzTPAGX2lvscFRY/DO91LpSL7Eso1DIQK04eU0Q/zcF+cgKDYlZowp2lkMXc/2Hys
	i7QTmQtaaiKSXC6OOjama7jGVksTCEDgSLQC6b3JcjaflFx252WzdB1L9YuqKvseQz9XAw0ApKA
	==
X-Received: by 2002:a05:6808:2219:b0:4bd:73d9:85c7 with SMTP id
 5614622812f47-5640d62be8amr717746b6e.0.1793308259501; Thu, 29 Oct 2026
 14:10:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-netcons-fixes-v4-0-3857120c6340@gmail.com>
 <20261021-netcons-fixes-v4-3-3857120c6340@gmail.com> <auBrysA0RUkVlTOA@gmail.com>
In-Reply-To: <auBrysA0RUkVlTOA@gmail.com>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Thu, 29 Oct 2026 21:10:48 +0000
X-Gm-Features: AclHuK_lhhdW3qGKBlVfZfDNDceq2jZZUkfDOPfDKThGEP0H147Qd10qhtEEAFA
Message-ID: <CAGSyskX4mJJT=VTrS43pWG4UyoJur3hxQ56Qe9MMRL5-c2nnXA@mail.gmail.com>
Subject: Re: [PATCH net v4 3/3] netconsole: recheck device registration after
 waiting for carrier
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 9:19=E2=80=AFAM Breno Leitao <leitao@debian.org> wr=
ote:
>
> On Wed, Oct 21, 2026 at 03:19:07PM +0100, Gustavo Luiz Duarte wrote:
> > netcons_netpoll_setup() drops RTNL while it waits for carrier when the
> > device is not yet up. If the device is unregistered in that window, the
> > NETDEV_UNREGISTER notifier runs before np->dev is set and has nothing
> > to match.
> >
> > We might then end up setting up netpoll on a device that is being
> > unregistered while holding a reference to it, stalling
> > unregister_netdevice() in netdev_wait_allrefs_any().
> >
> > Add a check to confirm the device is still registered once we retake
> > RTNL. Release the device reference and return -ENODEV otherwise.
> >
> > Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261012-ne=
tcons-fixes-v3-1-1aac85ed7665@gmail.com
> > Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
> > ---
> >  drivers/net/netconsole.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
> > index be7eb632ee42..bd36ebd334aa 100644
> > --- a/drivers/net/netconsole.c
> > +++ b/drivers/net/netconsole.c
> > @@ -534,6 +534,16 @@ static int netcons_netpoll_setup(struct netconsole=
_target *nt)
> >               rtnl_unlock();
> >               netcons_wait_carrier(np, ndev);
> >               rtnl_lock();
> > +
> > +             /* Check that ndev hasn't been unregistered when we relea=
sed
> > +              * the RTNL above.
> > +              */
> > +             if (ndev->reg_state !=3D NETREG_REGISTERED) {
> > +                     np_err(np, "%s was unregistered while waiting for=
 carrier, aborting\n",
> > +                            netcons_egress_dev(np, buf, sizeof(buf)));
> > +                     err =3D -ENODEV;
> > +                     goto put;
> > +             }
> >       }
>
> I think there is a better way to do it, inside netcons_wait_carrier().
>
> netcons_wait_carrier() loops waiting for the carrier, and exit if in
> time_after(). I think it will be cleaner to exit there.

Yes, I think it makes sense to bail out of netcons_wait_carrier() if
we detect that the device is being unregistered. It doesn't replace
the check under RTNL, though, since the device can still be
unregistered after the loop exits and before we retake RTNL.


> then netcons_wait_carrier() would return a bool, and you goto 'put' in
> both case (ndev->reg_state !=3D NETREG_REGISTERED) or in the
> time_after() exit.

Do we really need to check the return value of netcons_wait_carrier()?
If it detected that the device is being unregistered, then
(ndev->reg_state !=3D NETREG_REGISTERED) will still be true here, since
reg_state never goes back to NETREG_REGISTERED, no?

Or do you mean to fail netcons_netpoll_setup() not only when the
device is being unregistered but also when the carrier times out? That
would be a considerable behavior change, because then a slow link
would fail netconsole completely instead of only losing the messages
sent before the link comes up.

I'll keep this patch as the fix for the missed NETDEV_UNREGISTER and
add a separate patch to bail out of netcons_wait_carrier() early.
