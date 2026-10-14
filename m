Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B07C3955EA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997664; cv=pass; b=tCIOUXpSQprEwg4vg+BhLTm1Z7D8XuffQhPummLD50c1b50KuSH9y9prCx75ORPgxVgeyjRQGIxuz20dErbJz5DdhSE4DD7cObQ2f0mdE2eW7wJ63fpweAgG2GDyosM70qXM2Qra+xKCNFa10gSGi8+CQLtSW2TPrS7VmQc/r3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997664; c=relaxed/simple;
	bh=mqlHJeBfyTwlYUc3NbiaMm0Dt0eUNRbSZnH5mzrwXDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nEU5/PW/i705BiTGQRXCObC15i9R3xAo78l0FbDuPeIjNaAO6Uv7Ke3Qd1HCMOsARRdpEnIWd9eDlAf2rmQRGB6PjP0hqcvJXuzs08vAVGosFCl33EO97DCroJXv+EPLoE3sp4IATFbykAkfSYc/wzdA7/wVXC4hu1Wbs/HUDUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrEYySNs; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrEYySNs"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso9032471a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791997661; cv=none;
        d=google.com; s=arc-20260327;
        b=A/6ge8X1V+D9ar/SruSCQAkiuUV+1FX/IdKW+XBtrd9bCXSJCeflRgcd0o71prZWhS
         RSqJBcQmh1NxmqEX/CnEqw1ScNdlEvo8RW/GhqLudBJTYr8b31yzaoTGqGVrZ3V7bGPC
         C3q+idkEpBznBL/EqApKtoyAnLIozB7Nouv5iiraMdXlUDcZiX/yZ1VFL5zAT9LUSRF3
         FSCjQHFim8H4Dg6PmK0XkM31dn56TQ70tqsN8O/oiMCl8iskwzSN9xFRxg34WfS4xn2N
         fQkgkH/QlHq2/EEgllIKoxMWyHvQcWXlhrK5OW12RcSfoHpvl1p3Al3FmUiARuKL+pDi
         9Z6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sdFd3r41M7yyc6N2ofKUYBcOXWgEzV7hB2FeJ/0r1mQ=;
        fh=s7qvI7P5A+GS/2KB0InchFO15dIZTTW7sPfQPhIO9i4=;
        b=UEhTUpdOsF+MrZ3YZLpXXQKXWtCA2ZIaJXKbXhs4Z6+XuYopVIWPnxye7q/pGKT0RY
         WbZbul07U4aH8jnlY7uDXMosa7DRizakNJv1o3W2Q+JHMNmAftAHpgw9MoGqDoDidTP+
         7aPaLr9EemwQFHKswC3WwgBuvq4k8gUY6eIItgSpW54dRTdUezB0KmZWXx2k6KOZm6XX
         /a81+9Hal4zRrGsLz5IO1QhkynyO4shrDzvOvurIVGsdIcM6eq9iajD/ybYx5mHCA2ZZ
         cy3uR0FHoBij4wr+04BrUeNzoXlIMZckR7Gtj4sfCrsQXFO0TjZkUNsDXfyiXgX0xqi1
         s+mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791997661; x=1792602461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sdFd3r41M7yyc6N2ofKUYBcOXWgEzV7hB2FeJ/0r1mQ=;
        b=mrEYySNsWseLC2l+53rWTlhw76X+YIL5ycc5vq0799t+s6A2x9vDqXVd9VqDf1FEy/
         pnZpRIrts8tgLvUaCfJWhkn6oEE8u8+3Eoe8PdFt8BP0/VHtDLTW8reB4uMoRt4DkzbD
         rUqP2G6xntA4N08A6CagNg+W73HGGEC0SpREw1oVo+SlI1q6TTPvR60ntSLIUK+d3NHg
         pDfzIlC3Au4QYu7R04VGC/FH0ajG4Qqw5xPzJ5SXsxlclq6JB93IxHHdBqqpNi3DUaVk
         3uyFZtd+DS/dKtimIlCO4gbQv0+rjL7Y0ykxr965BDomvtPVW/LMa//WnN8dM+Jq4l65
         2PCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791997661; x=1792602461;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdFd3r41M7yyc6N2ofKUYBcOXWgEzV7hB2FeJ/0r1mQ=;
        b=FE+Kx+s6nBtANw8azcYATm7FA+w2Bh20z2uRxMhtifwm1cX0CcPaXZnBOBs3W3+K2O
         idHKC2q7hDMBUX5m7FRIL3HC5c4Qn8I11CY2leRM5u17MakKb4RYDcGfJYOQQLJY8OU+
         R3NRXoliQ9sBWB++ti/wWPZSFxKfI+9WYDS7NQ8sP4jKSzBU0RVl3xZRSASMx4mxuFtF
         aUj7TnklowHZRwpX5X0vYNONo3HBARr6h6053WWEUcN1KyCh6gCsoAUoWJlQicD/PeE4
         H2zxSMj7m1PCYsCj2VdD+7G4IBWjrJWHKWks6/KUSQIxYKAPcKpvFKxjvOuMGBzQOSaq
         FCDA==
X-Forwarded-Encrypted: i=1; AKwUvBzimWQAYqMQBdwCEnur7lOKYo0jWXSLSZbLi/L+ZcReaQ4lDFv/b2WM580OVi8Jm5wIsg6XApKD+J+jZzE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKahid3GFob7WuYr2XQJVEGbsFPf27Q/028ocIEQjGG24x56PtD
	B1SJTy/gu/MAutnjDEXjLSIBuUz1+NcyI/bxLBgwO5TiDlm0fzesm2aZVr0hjKvAYhdv6IOBdri
	6gwYWC+2bD6CjfMLIqUdhXMR0oR6IQoA=
X-Gm-Gg: AYBFou1xfHNg+snuBG0C7dzPXnukswyKQiW++VrRsrMVwIM7GqBU3YYkW1/t532LBKp
	7UW3pVm6yAXHBjlGa3AP5QvN6V9YMCS/Ezh7JnGlmoZflxtbpvUWpo0r/1IShrAz+/4rSiisafw
	75a0kJqArwKkxV52EOU2te6bd3lst027Px18hP9grVFz+02y0ThvFsqYGCt6Eo+ef/UirJYd9+a
	Bu4DpuJsVEWd3Y8B4z5e0V9OEQs/GSZn2dVN2vjqRFxMOP3X9JraPPqcuHuisJJlh/hD90UwRbt
	V0pctIuMNaif6aRbE57duFaJdE+bbpPdPMMHfO81JQ5SvxyZrfEhHfCDF0Bhr7abc9PR3mlemzA
	7CKAMDNClWOrZmmpJnol6TypROeKTXxejqv2eMqyA/gs6Brw53Fz+Q6PIPkBZr6qfb/FqUncNQx
	J6dLqjRGR2f44p7jWl75N9nD7//Jd0MYwyGunMAqeRSIhL
X-Received: by 2002:aa7:cf16:0:b0:6a9:9a0e:e05f with SMTP id
 4fb4d7f45d1cf-6b17ae26000mr9090745a12.2.1791997661286; Wed, 14 Oct 2026
 10:07:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-submit-phylink-suspended-stop-v1-v2-1-8b8e5d53dfc2@gmail.com>
 <224296ea-f196-44f3-91d6-1461846c55a5@lunn.ch> <CADvTj4qgcXE6azsNx-Wg5afatezLeuctGR607qO1WhZSmuqzBg@mail.gmail.com>
 <7ffb9b38-75e1-42e2-86e2-21a1666fc51f@lunn.ch>
In-Reply-To: <7ffb9b38-75e1-42e2-86e2-21a1666fc51f@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 11:07:27 -0600
X-Gm-Features: AclHuK8jlqpg-qIbwAqpxCbEEkIemf37SHQz8CwDLoD9nKTqJNXJIwBV8qcy8Jo
Message-ID: <CADvTj4pVtoMh=H=nJJaPxYf-ZqU8xJEJLMANUAXTFJWb5zBe-g@mail.gmail.com>
Subject: Re: [PATCH net v2] net: phylink: allow stopping a suspended instance
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 10:02=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Tue, Oct 13, 2026 at 01:46:24PM -0600, James Hilliard wrote:
> > On Mon, Oct 12, 2026 at 7:22=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > On Mon, Oct 05, 2026 at 01:09:05PM -0600, James Hilliard wrote:
> > > > After a failed MAC resume, a driver must be able to stop phylink wi=
thout
> > > > resuming it and reconfiguring the failed MAC. This is needed when r=
ecovery
> > > > leaves the interface administratively up but detached until a subse=
quent
> > > > down/up: ndo_stop() must finish the suspended phylink lifetime even=
 though
> > > > the MAC could not be restored. The missing transition was identifie=
d by
> > > > code inspection of the stmmac recovery paths.
> > >
> > > I don't particularly like this. It feels like a workaround for a
> > > broken MAC. It would be better to fix the MAC so that resume does not
> > > fail.
> >
> > Fixing an identified cause of resume failure belongs in the MAC
> > driver. The intended purpose here is narrower: allow orderly shutdown
> > after the driver has returned an error, rather than recover the MAC
> > through phylink.
> >
> > stmmac_resume() already returns before phylink_resume() when hardware
> > setup fails.
>
> But why did the hardware setup fail?

The exercised failure was injected, rather than a diagnosed spontaneous
MAC fault. This change comes from auditing the existing error paths for
the deferred stmmac recovery fix.

> This is what i mean about it being a workaround.

The deferred fix addresses a separate software failure: suspend has
already disabled NAPI, but an unsuccessful resume leaves the interface
administratively up. Closing it can then disable NAPI again and hang.
The recovery changes preserve resource ownership so administrative down
can finish and a later open can retry initialization.

That shutdown also has to finish the suspended phylink lifetime.
Without MAC WoL, suspend has already stopped phylink, although
prepare_resume() may have powered the PHY back up. With MAC WoL,
link-down was deferred and the MAC_WOL disable bit remains set.
Suspend-owned advertisement changes also need restoring.

Those are phylink-owned states. Avoiding the second NAPI disable in
stmmac does not resolve them, and calling phylink_resume() just to
permit shutdown would reconfigure the MAC after its setup failed.

The required operation is therefore to terminate the suspended
instance without bringing it back into service. Cleanup must not
depend on first succeeding at the initialization that failed.

The original resume error remains an error, and an identified
MAC/PHY sequencing defect still needs its own fix. This transition
addresses the subsequent shutdown failure; it does not hide or
work around the cause of the unsuccessful resume.

>     Andrew
>
