Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8287A37DEA3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791410348; cv=pass; b=cI+yZmsPJnFDhhma9jKu8mGmFUeVq2J5b2u+ZGwXnhNFiQIBR3FxzVloTmpCf72eJmSgJ29CnIg2jlM6MML6Zrs9h8VlXDDoIvJmmjAZQTqeQ5DN9I6KrH0vlKE2PsyHY8Z/JPPoeDRzfQN82jOko0taL20xblchW/T600X4Fvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791410348; c=relaxed/simple;
	bh=NdpHyiQEK20ZJUkrXWW8lkNpvrkh/Tq1SrhZFgg2dxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZKMGn/AH2hZER2ti6XdOrDMgMFfXpl3/7mX3ztcVpWke6YH6hrEB77IMGV70h3bCN1+EHKWPBQUEJgG688ejIeUblRs6o6VbdXNE7NRUlIfxq0uuNGlOKby6p6GNxeKGN74yLgL9Y+sMw02pTMuGkr/qk4s/HaUqI02SI41VcvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=K6F154/d; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="K6F154/d"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so7770289a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 14:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791410346; cv=none;
        d=google.com; s=arc-20260327;
        b=O1B+4m9Ffu70XTS1Zz81tFOmjwtBvmlG+DrDYE5WKLW4RRUR3FMm4o2EPtlfAmg9Q1
         rMY5gAONCDxyGeBjAbtl4N5q1V1Sxtr4yCeHU/KMc5Y8Cus86cahCE12rykpm/PZoWya
         9m/9MtWonpljNNnWUTojLj4XDiorS7kfEqfzdsRajGvVb4YDVmUhzdUTLjJuP0Ol+19X
         qGo9zPbgkLezm6+Nk/WsnZePz5Sf9uiH5uy3ReqPiXkN2B3jlbP7fPoiTzaSoNMkH+P1
         1Pw8d9Rb+usbXsm1XFN/SoyzMt0mVcalgWjO8DtcFTgFHqFOYAKlKNCH/LBgFnS2powh
         1kig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gTupLQqOTwq3jH2ZB+au6HoSAz3uNI5sbJCpfgUjYak=;
        fh=leFYLNoVU7/wjU5ezz0l6znE4rA63ajUGf5KTGjtfBE=;
        b=g52E7sqDaL+FKg3+SmA5YkgZGT8oE26MmKX5yf2J9AROR1Ng+bnLcdTohqGkYO3m62
         ilMx4iuvFvVqbYzVte3JvdV2SYAS9Kk41Ax9jd7eMoUitWVVeRHlA7flaPqigtzrbkQv
         9kyBR1YozgkWp/pbOK3v5utE9Ez1X1FthHDOOnC4P49b/PfqCGKIN9KdWDGzBULn9rT9
         qkCnu1DqJOQMBCMijYgrv+9xsAsgULK3fOfu+UQNJBJa05fkO5aaCOQc655amGXiDAMd
         JCxlI9J64Yz4FjkP0BmV0Ppw0PGfjsIMpyGXnFhDqGkttBE3ow7jcS5ludJsp73VRz2C
         Wahg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1791410346; x=1792015146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gTupLQqOTwq3jH2ZB+au6HoSAz3uNI5sbJCpfgUjYak=;
        b=K6F154/dH/kooP5BOsLg7rgu5qE8VoRb28+/aNuZpnEpw0lM1KSAQ6DkMWyNBHhEBf
         GZiW3IXZiWIpy/9qc4fuQM9n6MYZOmoMwQfpuDAxHuK2TNEqPSREmOJLUmO2ogrXj4JF
         DBtXCu3VhHpX4my6zYmFxJoBIYF2ACGxya8FTbfXZXgwgnirO0jMxTexip47BCNPnEP+
         Zi48FERJjhw7AwGZiBiim+6gbFznxH62uAn/YWu+kZfOgReSSI9kEAIHxpdoXygZQOyO
         P8oEfpCyzpEcGmgGCUFgmqkFXwtEh73CDjcjL0K3QpdfGETYlQTCGTm3Fa8edo9RpZ0i
         ishA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791410346; x=1792015146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTupLQqOTwq3jH2ZB+au6HoSAz3uNI5sbJCpfgUjYak=;
        b=JIrRnWFJHjseMgFP1vrIOYPny3bvTjSEdW5asW6ooy7ZKpkqwmVPGG0nFcTMqTWdfR
         aPPTrDL3ndCf94jd8AV1njuwFsa/4TNttmJc0GMu3UfHaOhjSR9/uu8bPIHTwrmTjJkH
         JHrHjAneeaLuzPLupQnvGgW2pZPr0ht5UIlT7xM9bBM19NsolsD0hLOFDbaHk6JN67Z+
         w88+LVF/KhWM2xzjAExRq+dj/M7QPn3jxkGGA5Vd7kNcSoT1jgxN1H1Wl6VKY4Z2iGUt
         w0wLx5gNb/6OtjgV54a+bHFh56OCHnJk3oO1wMUmkZUeiOjoGoyGiKo8WQfLc7opLlYM
         6V0A==
X-Forwarded-Encrypted: i=1; AKwUvBwVLaDI+xbsRCqA9LAi2UHIQDlGo4zd2APz0Qavlri9rVIDGzy5BkTQs6imBkRB1WNV7K1ER8mVPKKz2iA=@vger.kernel.org
X-Gm-Message-State: AFuF++kaucif0AKoVqozvDzNnjEuQESJ4NDpZjv8G384UWt0DHCbIf4m
	6M96BVD7uR9+oYDkZ0ua/GcxoK6buS7KFCTymp3zfjhHs8EuYf01msxjObR8lYViCai1/vwL17V
	Oh73jiinO6mqZFZ4wqN8flieM+NqBZ3Zs10U0n9x/Rg==
X-Gm-Gg: AYBFou2sMt7AYgFQqQ8k5XcmRnsiBN9tRJgdL7FIgzV0i0W3hDqtYX0oRJO9lQ49R6E
	5fmEiK4Z7PKSUqhiGnM8azUM+9mePk/Ny2eH08jrAJlHyokl7Zo1y1h+HywtAuFNz+u87RjVv2u
	z+nhhG/oUbP1yqwZXGh8jSE7a2IhApLh8v3ON4F7++9+ww6OhiVkXS6rzGxSMjoA6ayH6Qpq/mF
	gXg1Qnsy/+i+kvl72EGsIbSVHja3RSPtPGJB4gHVbSrdud5apPhbsDviSdqtzb1h58naChkMYpc
	i2edf6V2tf06MA6QLhH7ZbsaaH1kejxaDNyKVGSsWHCPkDw8ba68fke+N7s4652Coxg=
X-Received: by 2002:a17:907:3d52:b0:c2e:7daa:23e2 with SMTP id
 a640c23a62f3a-c317c18cedbmr350164566b.48.1791410345894; Wed, 07 Oct 2026
 14:59:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
 <20261006-b4-rk3576-reboot-mode-v3-2-6edba064693b@flipper.net> <20261007212432.GA381404-robh@kernel.org>
In-Reply-To: <20261007212432.GA381404-robh@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 8 Oct 2026 01:58:55 +0400
X-Gm-Features: AclHuK9YQekpwAgg-J06h9HjpyEEerPcos0qnPQI7GTm7jMZgcXE5m4c13MgYQo
Message-ID: <CAKTNdwFo03jFGMeJQpxXp1yOX+cG+6BZOYf1eGGZTdZWAFdz5A@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: power: reset: syscon-reboot-mode:
 allow supplies
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sre@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 1:24=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Oct 06, 2026 at 08:02:40PM +0400, Alexey Charkov wrote:
> > Whatever program that acts on a reboot mode runs before a full OS, so i=
t
> > may lack the capability to enable the regulators it depends on, and a
> > reset that preserves the mode register generally leaves the regulators =
as
> > the previously running system left them.
> >
> > Allow a reboot mode node to name such supplies, so that they can be
> > turned on while the mode is being requested.
> >
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >  .../devicetree/bindings/power/reset/syscon-reboot-mode.yaml       | 8 =
++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboo=
t-mode.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot-m=
ode.yaml
> > index 79ffc78b23ea..5ed70c87269e 100644
> > --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.=
yaml
> > +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.=
yaml
> > @@ -36,6 +36,14 @@ patternProperties:
> >    "^mode-.*$":
> >      maxItems: 1
> >
> > +  "^[a-z0-9]+(-[a-z0-9]+)*-supply$":
> > +    description:
> > +      Supply that has to be powered for whatever program acts on the m=
ode.
> > +      That could be a boot ROM with no access to regulators, and a war=
m reset
> > +      leaves them as the previously running system left them and not n=
ecessarily
> > +      what their expected out-of-reboot state is. Any supply described=
 here is
> > +      enabled when a mode is requested, and stays enabled.
>
> Sorry, but no. If we allow this, then what next? clocks? power-domains?
> GPIO lines? The list is endless. Maybe if a not generic binding is used,
> but still pretty much pure configuration.

These are the resources which are required to handle the reboot mode
request, they are not exactly configuration. There is a limited and
hardware defined number of IP blocks which need to be powered for the
reboot mode request to complete successfully. In my case (Rockchip
RK3576), these are the IPs that need to be made aware of the trained
DDR memory parameters: if they are unpowered _at warm reboot_ then the
boot process stalls immediately with an exception (cold reboot is
handled by the power-on default state of the PMIC).

I see that this may be abused to hack around what should be a
bootloader's job, so it would be great to find a way to explicitly
limit the scope of these - though I couldn't think of one yet. Any
suggestions would be much appreciated.

Best regards,
Alexey
