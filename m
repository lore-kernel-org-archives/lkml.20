Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBAF52E050
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920800; cv=pass; b=oQhoYx6qcfAXbO1hZrBKS+WMHuyNnZHyKu/7GwNtgiZxao/lBnNcq60zKgyecJMxyk26Khx/sJaFhn3HtziscJORnViI4WTvhUfsOWi5Rmfeg/XqSdm52OFUhbl4+Hf0LgkZFUQz0J2nxj7Jva2Cas4i2gO5kk4J4BBaajGST24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920800; c=relaxed/simple;
	bh=FXG86Vc5Z3HtOtD7Ma7mNf0CfsAgAIGs82fO1RvGgYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGXvRJ6GCAInYgm5ah9+W73FoOn7F1iW/ZvetUv4PIqe8jh/JvsKUYYPIWIrXnxiL2HUVBJj9vTNxC2HFxR+C8IBL22FcFNHH/+wYI0Uxxs7Ew2HsrJd4GwLI+bdz46qTQ0pvXxlyH6iuH2jvB/x2//7XSD1oH3pCofq+y8mECY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ncq/l4Xs; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ncq/l4Xs"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so3909554a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791920797; cv=none;
        d=google.com; s=arc-20260327;
        b=EUaQn+MQjtVmwT3y2vNHdpfhy6Nkce0kQhTe13+KZACrNICGeQO04+05jbaTqDcGbo
         b0k8fuYBZgDuh3aIKAERe3M6R42LGUFV9myoilOszzSCOOGtUDFG6V/LCdB6zEm3y8l1
         hEpRIzpRdYllcLMx9+DTKO6VNg7wVE0vxu/6Bk6M3bu3QWT0+GbfOlhKM0ZxPdu56srN
         ZCC1CIup8E2qHLJEEw1KSGqdm++uhpog8bx3b6PlnoEMQG2nwyrRfdMSsJpWrkq3qwJL
         PJutga4AyayCC/nm8wxtTLJ5FD/PLvXdELirOyLwnAe7MeRxV0n5bkbRCQLCi0usNI2P
         MGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CVKDBAWO9v4x/qHowfYZV6oyH69UJO9Z+8aTiczsXHQ=;
        fh=bJ/5h1f1T7jVQaold4SL2ueB+hEvYCZpSMN04AjNrhY=;
        b=oh1cgEYlDWKqBb6A+iDfK4gC6yC+xEa+l+2QxJNIcTHWCv3uxwWf0vxWLp5NyBZb7k
         jnm8CFRdZFGfut4vYrwH4iyBkr0Z9feLHBhv44WNx3jWVfakCQlok5WQzTk/zBNndk+X
         LAdMALaqk4KICBOfNlLEGoJoRoCkG2/mWHgnBYPwZuaSoQP79uPxeUvEPoz6bYNiACi1
         qML7tjaY2/mvi0yYLbOTrCdXoR/ZXRNdiBzLHVqHnpZcAAcXui7FXSa+xMh8B1QT8hwm
         5nCn/hNjlbu3dNRiWSuFu5EWBHB96gckNaFZ2Njkaf+vhR7jXtOfjGWgIzhizjH7o4lZ
         ty1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791920797; x=1792525597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CVKDBAWO9v4x/qHowfYZV6oyH69UJO9Z+8aTiczsXHQ=;
        b=Ncq/l4Xsx61d6s5Zq7UQjrcZuzv3YTonNTtufS15woh21syVCmTo5TdTkm2roADliI
         hQ48nB3OWtGpFmcU+nxqgG+WyO7eUSx3LFdaPWvTF7y41v7LKE4RULxPNFTvu2YN71tr
         MkxZWrUkAEIq6z9ZaF/8ig1H9ztjhbtsDCXUYbwwhiQlUypNJETpk59b9RxWsf8Ngl5F
         0oc0e4ARG69Vl33znWek5v64n0Xbnm6IU8Na8KwoB7VHcG3FYdDFNDs+xdNzTcuxUF2j
         flyKkJd5NBquYAVeRUgLMOGWP8bpRZKyOmzrQxABTqdRFJBoO8I/RJAgtkRPNt2KxNba
         6xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920797; x=1792525597;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVKDBAWO9v4x/qHowfYZV6oyH69UJO9Z+8aTiczsXHQ=;
        b=Fw42azLd1FgSfrC7GK++9ETKVPKg/kDbXpTfMzpCv4psBJdBL1dLb2bNMwV57kkBOy
         A7Y7Xqu4+k7d3E17GKqDPW6y4qS3B/BRe90WsBMXjMRy8C1f4hnN9pZES+V0heVE+sLH
         NNUvhv7k+1IzuXaGhX7h+f2wozIf6Tei3fgLSOhv+O5trHmJQgMy+G8yjty4BZ2drsf5
         RtnAXddTlqY0abdOEpnYsfZW6158psDX+ta7WhGo0mhUdjx0fAEZT1Mxq7TECA0f41t8
         M8OQpySHORbNTZM0vpXI9TX+XSS4mWuXGB1vFTNZvzA1C56WD2BxqnZL9ZKPtmLhqAC8
         xpwA==
X-Forwarded-Encrypted: i=1; AKwUvBzDCF8BWp1ZFyIanWKOGWoBkUeVnFUcewsz8DSs9veXMLK2LvaMBNPqTqN9I/RkwqZZfMNyyoaQqeOPiJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+Jy/XxYI8XRl5fOZGplTfvsAnTyHKUftEzqJ6DPc34aHrm+Ub
	nVmELrguphxmNMM3Cn+WA/pajxdVBZlcwO63gSey8b7Pr3Cxh+iL1qsD+fe7RoIlos0h24sDaUn
	l/JtPeQvXlsIiw5X469H+itUc9R06fUg=
X-Gm-Gg: AYBFou1Nfua08aJ0VzcJ2DW0f7UBLOOT50Oj+T0O9vKpkJtsCBmWUftfmteCzeN0fMv
	goJNBOzDjG2gR5Iw07tWOpuZ/snTYuKyzTE9AXcbzwcJBGdNpN5PS9SPc9gdSbAHo7E5jpA8Lak
	WeV4zksXcLphyF3o7LlTApUcpUJumwDGrZFfmW22lh3zCiCzTk7WykFPAIGyrDOGyLAH2pFV5qj
	lELHpFuCTEVV+BoQyxjIMXXlm4txql83BrSTUHuPZ5m+UOgwhYlWjMoMgbxg9o7LycV83HqDl/c
	aHNUWzE81KlDZc0myT2CeLd8VtNOz0cxwkbSjA2z+VrBx2aKbQsDxAvrRc3Es9OyJPvchn5AYB1
	5iMOkXhkGDynTUOtxZ/mqlmmQ7Pyad2Zu/UQOmS0M+H6O7mGJK73BdtcCIHdr+JysepsNnBy0aW
	M1YaWq+4reyGQbTTJ7jK/GSfD7HCPwetSRbMHhyZU01OiB
X-Received: by 2002:a05:6402:1e8c:b0:6b1:e474:e0e0 with SMTP id
 4fb4d7f45d1cf-6b1e474eb16mr2804797a12.9.1791920797110; Tue, 13 Oct 2026
 12:46:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-submit-phylink-suspended-stop-v1-v2-1-8b8e5d53dfc2@gmail.com>
 <224296ea-f196-44f3-91d6-1461846c55a5@lunn.ch>
In-Reply-To: <224296ea-f196-44f3-91d6-1461846c55a5@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 Oct 2026 13:46:24 -0600
X-Gm-Features: AclHuK_-ExkCTDuO98uNJR7veehspk26g_HVMQrxEAv1f54ELeztHi6cVQvhtyw
Message-ID: <CADvTj4qgcXE6azsNx-Wg5afatezLeuctGR607qO1WhZSmuqzBg@mail.gmail.com>
Subject: Re: [PATCH net v2] net: phylink: allow stopping a suspended instance
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 7:22=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Oct 05, 2026 at 01:09:05PM -0600, James Hilliard wrote:
> > After a failed MAC resume, a driver must be able to stop phylink withou=
t
> > resuming it and reconfiguring the failed MAC. This is needed when recov=
ery
> > leaves the interface administratively up but detached until a subsequen=
t
> > down/up: ndo_stop() must finish the suspended phylink lifetime even tho=
ugh
> > the MAC could not be restored. The missing transition was identified by
> > code inspection of the stmmac recovery paths.
>
> I don't particularly like this. It feels like a workaround for a
> broken MAC. It would be better to fix the MAC so that resume does not
> fail.

Fixing an identified cause of resume failure belongs in the MAC
driver. The intended purpose here is narrower: allow orderly shutdown
after the driver has returned an error, rather than recover the MAC
through phylink.

stmmac_resume() already returns before phylink_resume() when hardware
setup fails. The associated stmmac recovery work keeps the interface
administratively up but detached, allowing an ordinary down/up to
recover it.

That leaves a subsequent ndo_stop() needing to finish the suspended
phylink lifetime. Calling phylink_resume() just to make shutdown
possible would reapply MAC configuration and restart link resolution
before the driver has successfully restored the MAC. That is the
transition this prerequisite was intended to address.

> As far as i know, this it theoretical, only triggered by fault
> injection. If we find a real error situation where the MAC cannot be
> resumed, then i will consider it. But until then, i prefer to reject
> this patch.
>
>      Andrew
