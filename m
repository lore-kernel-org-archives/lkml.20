Received: from mail-ed2-f43.google.com (mail-ed2-f43.google.com [74.125.228.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E71A3203B4
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789866340; cv=pass; b=FattOMAYrnCR2VaysI4YHh9qaBq9QogSzS1av++lz8qlrDZgCj5lfIIVLsjgeB5nZBWC7BQFcm7EnGEn0+oczKkpjtYi9sU9XfK2iLb74nlzqxIOz5XngMyQRl0Td3UNrx4/aZX+5UOmU7wSmHEdx/F6quavv1sjPFPWrzw7zJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789866340; c=relaxed/simple;
	bh=9Cl8MzOpqM4J6On4kxqgKOwRQOeDSnW9VyXB1VHn/7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PPk2saBbEyhrV+OqMuxQvGAFhGAMKu6klMsXyMDEpGaZEklafkT9YmHsW/lc8vKQlepXXwpqRSqKTCE2apE1QQ08vpeEYFrCdO7QTj6VgksYMMU1G+Nh3qjOpV5EjvM/gSV6mWvxkPO6XgIjZ2JR6Cw+58EzbdVQu+//e+21Xaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEIkRrMr; arc=pass smtp.client-ip=74.125.228.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEIkRrMr"
Received: by mail-ed2-f43.google.com with SMTP id 4fb4d7f45d1cf-6a9ba73bee8so1385770a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789866337; cv=none;
        d=google.com; s=arc-20260327;
        b=EOjohiacfmWe7zpoZskvBs2UUcy6YZoGe7G0ORDjqTtbDZGeCacY3PvwVsKaC7cPeq
         zyfC5OHArfCTJ6m/j194/oUuK9KdIt72+Jr9mzweY0n3ppgmEugzaWyY6pxKNr8sxGRP
         lVaKMsTIkOF2GiF52XiEDkJzIOB8nh/HssKe5SQbHBgkPzRLelFX7UlnR79GGP6A8jhR
         KWGyHY1bvIvUi/hLLpXQeZxqvr2bS6mB8gWuIokRhzZCKONB/FcrNwJps3SxFpYSonyM
         GtPfE+P/gKjGkzyrMZjtxNoDqMWQVk5gt4IMoeYURCMzI5oXO43DV77uInr7sXwivoHJ
         vNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Cl8MzOpqM4J6On4kxqgKOwRQOeDSnW9VyXB1VHn/7s=;
        fh=4BduCuoJaUcli9erUuf6xEag1fbhrpejSS4NDYQF6j0=;
        b=oa9KGZAZ36iE2DhYNHEvFuPH3OPgTCAYkynr4JL+cQR1eIWA5RHvtMDRq4pMLsfL6H
         fA+atfaMzD8cUBQHy9DWKAo7fTVIAEkNBqU+sg0wSsKu7GhuRjLlzxkAk/VMLhdhFXdg
         dqNeLxsHONy/XywVVwVURw5MOjeKzjwV/rZKCmFmo0LSwFsciD3kdldr+Gges9xT952e
         lZti3o9fxUOKYrP8VLCFTwl1Zr9BPkTJ8Jt7oflqzUy2XzlCAr4L5iPD9MXPNvCM/Vkp
         iZJPwIiw08DY+mb+07OWFb2IIoCqGxWETQZFAPLwNTq8OkMnDumhf1eC79qI8O2WN3SH
         aZCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789866337; x=1790471137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Cl8MzOpqM4J6On4kxqgKOwRQOeDSnW9VyXB1VHn/7s=;
        b=WEIkRrMr1kTjROhNQo4itlGjaxu5jZv1u3OviUO71+jRlgZowfS5k80ipfr+4ao4Zz
         3Tr6efn5zQgWGb/oaJaaT+N54JQBh2MPY6BFs+tn4CqQjc/k4g/jnCuAAMT62E7xKUCn
         2fhwheC0Jp3k8c3na4ciLkX7ADHYkdvp7MlL06FlgZu1aFY2LXfmVsN24tiQAc1oJlXE
         PE2dJW6Hxl6UBcscIgN1o699il7bkT6BMSlnCMPofbN2uYk+8wt4VaQkXC2U15dZ92ov
         MuAonuMprppQbMfKRJQdtz7TEW8lRRTsscvxIAJ3tFjhV3yq9/lJkzUUIlTzCEnJg+3C
         DQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789866337; x=1790471137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Cl8MzOpqM4J6On4kxqgKOwRQOeDSnW9VyXB1VHn/7s=;
        b=bwyh0gtnKzVG/MD0cCAw4IMGMWAzmnJthl7zsXPzjN3f3w1djlJcOKnON/y4Cxkrdw
         RGDfJIyiVDPKRl8gotBZIdleeSW7CikkZA8rqLl9WY94UEdy42+1y7HhiW+tLxVzkTaI
         YicChqgpg0mWi9eUxx555CfuyMJhUxoKxsX5682inyaiPcxhknw4AVqKcWhU2TGVP4y6
         TUOVYkU6xCQPxtNmmtdTkDGAV6C6bz+0UlXT0/CyYuXICPHV400az0+dg+e7346i/q2m
         ANpQKn+9uAQHsH1y+9SwV7SXvVRu1BBRx5WnDMDnwizVveWDonHH7fBOpE3K7eOeZxUT
         XGEg==
X-Forwarded-Encrypted: i=1; AKwUvBy2ZwPq/S63sVPJ9ueRIA8Q92aNax4LuHUr4dKGkjvPk+lGoGjpv8yOmgPHMMMO0ZyRpagXmi7lhoGCklg=@vger.kernel.org
X-Gm-Message-State: AFuF++lFpzoDC9I1CfpF0GU6niVR+pM0+9FZresvq9zkib82JQdHn29n
	7NqXBqRCxECTrL0lm5z7YiJU9fgPUppjdzOfGGUz8I/hKi62qpJvuuQpiuX46BNvxdLRTjgiYLM
	HGQRr/Dxqze4AgYPVXPuiZ2HQeQqJ6eI=
X-Gm-Gg: AYBFou1f7WlbEVFDEHP+6A09bfwaYU6Fo60F5VYki1ecl21VytZKcss3gCERTPst/SN
	y8dfZWDjqrCQym+ZtH7WAcGMYG6HixRynwU0DEvDN4i1hHyULU5b0+IuULTq9tcSW3Hcv3EZjeM
	UyVaNgMrIJ6M8zoo9SubV/HTUIDBVMMxsz1GwllRkJnAy4EtOskZywH0helFMD/E/5NBGQWAVKP
	gaXew2Dv+mokExSAH0/Kv+p8HJmksNeMWMdqSiwC+mAeQbAidnf+5UKM+vBIIwUhI3l4Y4b1pje
	EM85o5G1Ng53fWb6aQuJyXGBfMK/BY5U/gT+2WRvrUFThiaK5c04dOZthgSmUhtZej9v0ye6vVM
	J6cEe0lXMkCUegxOjtt7UujxDcGeSKvKl5sODRnFdXr/sFhpOUqXxp8nazUOm9tdzLT2uEAp6sh
	RphX+maN3QRR7zZInvIn8m5ABpD7U8fFLNuugxbIisVQOCj8athNZr4WggQH91vdo9DQ==
X-Received: by 2002:a17:906:2099:b0:c29:c575:de84 with SMTP id
 a640c23a62f3a-c2a164422b2mr369770066b.8.1789866337249; Sat, 19 Sep 2026
 18:05:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914212409.74539-1-rosenp@gmail.com> <20260919154133.3fd41455@kernel.org>
In-Reply-To: <20260919154133.3fd41455@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 19 Sep 2026 18:05:25 -0700
X-Gm-Features: AcwNN1WQnD1iBFmCVfW9pDJM-KDqAYyCx3hOiVJ0-12Jxjp3COQ2VYVvEI3MBjY
Message-ID: <CAKxU2N-aWS0hNFbirG9g+vzz=KEDHvr5Hi1gij531OXT-3Y0zQ@mail.gmail.com>
Subject: Re: [PATCHv2 net] net: phy: marvell: undo WoL setup when Wake-on-LAN
 is disabled
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Michael Stapelberg <michael@stapelberg.de>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 3:41=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 14 Sep 2026 14:24:09 -0700 Rosen Penev wrote:
> > Fully disabling Wake-on-LAN on the 88E1318S/88E1510 used to leave
> > the WoL interrupt enable bit (CSIER.WOL_EIE) set and LED[2]
> > configured as the INTn pin. A magic packet arriving after "wol d"
> > would still assert INTn, and a later "wol g" re-enabled WoL from a
> > dirty register state.
> >
> > Fully disabling WoL clears CSIER.WOL_EIE on the copper page. The
> > LED[2]/INTn pin mux is disposed of only when this driver forced it to
> > the INTn function: the INTn enable and polarity bits read at arming
> > time are saved, and restored once all WoL options are cleared, so PHYs
> > serving the MAC interrupt, strap configs, or marvell,reg-init values
> > are never touched. The FORCE_INT bit is not set while disposing of the
> > pin: it holds the interrupt line asserted and turns the shared PHY
> > interrupt into a "nobody cared" IRQ storm when the PHY interrupt is in
> > use.
>
> Oof, this is pretty hard to read. The paragraph is pretty much 2
> run-on sentences.
I'll get it to rewrite.
>
> Please add info about how the issue was discovered and how it was
> tested. If you don't have HW back to net-next without Fixes it goes.
> The AI is pretty bad at judging severity, I need to find time to tune
> the Fixes suggestions further :/
Probably. I don't know much about the specifics of Sashiko.

This patch was split from a larger one that adds support for WoL on an
mvebu device. LLM suggested the v1 of this as a bug fix. I did not.
But then sashiko did.

The full thing, which unfortunately needs patching of the PHY and GPIO
drivers, along with dts, was tested on a Helios 4. This alone does not
add support for anything but does prevent the IRQ storm as mentioned
in the description.
> --
> pw-bot: cr
