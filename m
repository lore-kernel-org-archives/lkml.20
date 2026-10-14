Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FA84FC33B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970693; cv=pass; b=P8jNbvjq5T+I4Ecv4HUflz9TCPg2fBz+yF8HllUzU8OG4cPUhtmFOy0yrEwugcBKbkCyYk5AbJogpCcsdON1lrL7xP9lCxp3kBdWVosBht/EnKzbjA6VQM4RMSG1p3RWwRGM4W5NFs8GJ1k84g+MCjldKMLyMHfNL132F+ARCoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970693; c=relaxed/simple;
	bh=g7zY5LqWbX7zCAxfbqvGmNGg5FGFzE06omeqj1uG3CI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s7rqTW3JEX6Ul7DfOpxUsS89D/ZzUuase4DP1gdDa0B0Zs/vLgeU+oRD6APuWTHeq6NNMNfpFW+248b47JRgDCy8ifbXwtN5KiSwPMk3isjzaBwpnAvrJQCdJ/DN+wh7eonG1cCKnalhx24aJRGxCX9ZreoD8wlnuN6Jj/qM/Pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q/7zgEMj; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q/7zgEMj"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35834f72d94so7023400eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791970688; cv=none;
        d=google.com; s=arc-20260327;
        b=liJYrClQYslpOdP3WzYeDmwg38Ba2Ud7FMvjt6eUgX6IwPp6CQ3OcRvFrWbq3JFJpW
         Ac315S6uNlyV5XWwGm1oO6q5Xsg5b4O4+YvcDJcjWIRHJt1TDe14o0YaVw+yKr68cD+s
         ISWMkZtBKZ7zVQyMyND9NVeGvnJ/ipMxkCQg3/o1W36+IuJS2xhV4HF1MhFX/EV7ectG
         oa9qzTr8cqDXEp7Hq8wTQml9Gasg9z61OVcCmBdMnGtmA2DMtuh0f4zNC1EFUfao+8hG
         EUKaAagmPqiTedrPq1zLSdsuZQzz1h4aAbL2zCnTUKUfPwct/E9dDSN3JqW8MYuO8HZy
         90Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1GRnJUmV5s4dSNP1R/wksRwnenMI3escdmM6c2DfrR0=;
        fh=/m2QgCai8CILFuYHtCMgjv7DpFG1PH9ZIHPOLEX6RYk=;
        b=LXaU2SPmN3li9s1VItzcCf61s24ODHJ1V+XbtGDndjFh0/+2tbqE9FeONnsx+hiiEf
         kI2H+guU/G9KIrVr/cHU5xQ7NGSqq0U5taSjEiolK6y/wNHP7S1UJVQ22JusvnCRxUD3
         ok91hqDcBHILLW+Ms/kXPJ0QhNVpVd7QHjV9M04NvFTlz+FtrRBSAUSwmPeAtIezTvNG
         7XkSYTKlkQwdjcc8Jgoduf9ZZB24ONko2blP7Uty+T1oaYov9Cu7RMLkiBAytjRXrwWq
         RWMD8eYDS869H6gwrPAMgcMPlUYh0zQKkIIA0TIF4AuWg21AbN/P0b3dDM6ig17lt7oq
         cigQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791970688; x=1792575488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1GRnJUmV5s4dSNP1R/wksRwnenMI3escdmM6c2DfrR0=;
        b=q/7zgEMjdIv8rMv8KsQ23m57DHmzEJq2oy7GHZ4tFt4b76WiF854VC3Bzrig6VVxa1
         +xpKNLBOBMBlTXcfTxuPil7xG2o9+rzaelJJh93QRuRNBtwZCiTS5LHQlNZelFzOtmXL
         wneOa9aPDmvCyOSSMSpJFWAW3+wN3o+VAPQANbh6q5yVdbGutJj7SJC4tiPANyZHhhfP
         2piH254oDxVMIZIbTKPmX+dCcrOeWz5Tw2oE9exqVur4syQBaYmiKYStfCRNd15vKspD
         +pI8Dz4UOldHz+XXtp5KGLDX0ESzbN3cE5QCWImib6g9E2AFiX0MulbZDPIERsveT1R0
         i0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970688; x=1792575488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1GRnJUmV5s4dSNP1R/wksRwnenMI3escdmM6c2DfrR0=;
        b=2OI2bkybT6K8xm3+o6MiAyo/jSjKXhBzb2VZbfxo+mYfq9R0EKyZySNK0iPQouR5k9
         mADcYFAyM0msucLPEQluStSo/wHzzo/f+IIuRXXMyiRjGTzqPbquS2octRp01H0T47DD
         z3pn2LCufh+hVK2bPW9sGPmPLB5q/AXBJpnUCiBeBHESygDjOE90lpaBCZGLaRU2jVgG
         oOnQln7J+P8M7gMSmvKQ9IMmPZ1CKfr+NQyigoCzswE3yETu278aNoqxkx/eMDCV2LCV
         by2iELCOIAF6XFW2ReCUQrnLRs7ptmCqAzwsvc11LYFHbqjYXmU31D688OnN+Ew5WDue
         WIfg==
X-Forwarded-Encrypted: i=1; AKwUvByQ++OVNb8EKGLp8EnJaHV7vdbuAj7wPaTwg1jDhxpyLgV1feFmxcEKx6AOpu0SMDg3cWcyFOmHSUeHU1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6rfLOoTWijUJ3T4+tSDD+PxI/rTQ8bArUPFn19LZIACkUa6Rt
	ivGeGs8GVdzAmGe2O6gNrJ8OAMePtjWBKbiphv4yo7aQJ8GgMBbT29xvfJJOvzAbN+Mi7elIDIo
	8NKwQ9sU1ly/GLtor9/kaqcZy9s/CGYV+SpTd
X-Gm-Gg: AYBFou3FNtnYDWVfYbJ0yDm0tSuypQzIB3TyUjhxNscVXM6O9b33q5bgEzA4OIas6En
	+l+eNAKndMTvFElsQTlZNKMcNrVkgXAVKJ7374JQzgGM9srdcIIr7P7DuRSKNaKnMYj1T61sqZY
	VwlrBVuiEzTxJT5iP6YRfeKi/hMUJ/5DrtqbSZNzMVhx/vh+kooUXo0cmLERqNLdbe6uYOC2qzR
	rLLRUIWFv91hU4O/J1jfS7QTfZq00ZHDeaWtWzWQaaSOxm+DKDWvQH9OOx3/PHv4kfvtgxrwDh/
	oSMSxma7pJytOACkBDHs8HiKA13eUjNjcN+0MWdTFaKrDBzyp1bePmWWGEnvKWov17mgnRfTe3o
	N2m3AllTrWcPr
X-Received: by 2002:a05:693c:41c5:20b0:35c:ba31:6fef with SMTP id
 5a478bee46e88-35cba3173b2mr5358615eec.36.1791970688092; Wed, 14 Oct 2026
 02:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007085457.98762-1-clamor95@gmail.com> <20261007085457.98762-3-clamor95@gmail.com>
 <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com> <CAPVz0n0FiT93626L3MnMCto1X0_FmWp_zzQpQ=yRBXn+ir6OPg@mail.gmail.com>
 <4abc72fd-c645-4410-9387-3f03c751fd3c@gmail.com> <CAPVz0n1YKV84J6eG9juM_V5kLCy63WY0hmicUmyEXZp2eEHKyw@mail.gmail.com>
 <f7475c9d-8dda-4dd7-9d11-4b981de1b7f8@gmail.com> <20261014091732.GH199624@google.com>
In-Reply-To: <20261014091732.GH199624@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 14 Oct 2026 12:37:56 +0300
X-Gm-Features: AclHuK8zDp7qUuUBcdJaZ9_rNb2h2tvvcSZ1LWN8ZXrMNyjbELJoL8dMw154gZI
Message-ID: <CAPVz0n3-=xn0Hy3BgPintGoONVO2NKyENYDQ_jSnM_Awxowjhw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
To: Lee Jones <lee@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 14 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:1=
7 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 13 Oct 2026, Jacek Anaszewski wrote:
>
> > On 10/12/26 9:25 AM, Svyatoslav Ryhel wrote:
> > > =D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 20:35 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=88=
=D0=B5:
> > > >
> > > > On 10/11/26 3:55 PM, Svyatoslav Ryhel wrote:
> > > > > =D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =
=D0=BE 16:28 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=
=88=D0=B5:
> > > > > >
> > > > > > Hi Svyatoslav,
> > > > > >
> > > > > > On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> > > > > > > Both the AAT1270 and AAT1290 feature a FLINH pin used for man=
datory Flash
> > > > > > > inhibition.
> > > > > > >
> > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > ---
> > > > > > >     Documentation/devicetree/bindings/leds/skyworks,aat1290.y=
aml | 4 ++++
> > > > > > >     1 file changed, 4 insertions(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/leds/skyworks,=
aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > > > > > > index a65d92522c9cf..596b5e284f44a 100644
> > > > > > > --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290=
.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290=
.yaml
> > > > > > > @@ -31,6 +31,10 @@ properties:
> > > > > > >         maxItems: 1
> > > > > > >         description: FL_EN pin
> > > > > > >
> > > > > > > +  flinh-gpios:
> > > > > > > +    maxItems: 1
> > > > > > > +    description: FLINH pin
> > > > > > > +
> > > > > >
> > > > > > You don't seem to make use of it in your patch.
> > > > > >
> > > > >
> > > > > I don't have to use it in my patch. This change completes and imp=
roves
> > > > > hardware description of the AAT1290/1270.
> > > >
> > > > Still, If we don't have the use case I'd avoid adding it to not con=
fuse
> > > > people looking for its use in the driver.
> > > >
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/Documentation/devicetree/bindings/writing-bindings.rst?h=3Dnext-2026100=
9#n17
> > >
> > > - DO attempt to make bindings complete even if a driver doesn't
> > > support some features. For example, if a device has an interrupt, the=
n
> > > include the 'interrupts' property even if the driver is only polled
> > > mode.
> > >
> > > - DON'T refer to Linux or "device driver" in bindings. Bindings shoul=
d
> > > be based on what the hardware has, not what an OS and driver currentl=
y
> > > support.
> >
> > I'll leave it to the maintainer.
>
> DT should be OS agnostic and driver orthogonal.  So long as it
> accurately and indisputably describes the H/W, then I think it's fair
> game.
>
> Is `flinh` a datasheet term or did we make this up?
>

You can check yourself if you don't believe me. Both AAT1270 and
AAT1290 can be found freely.

FLINH pin #10

Flash inhibit pin. FLINH is an active HIGH control input with an
internal 200k=CE=A9 resistor to AGND. A low-to-high transition on the FLINH
pin reduces FL sink current to the maximum (default) movie-mode
current level for the duration of FLINH. Strobing the FLINH pin low to
high does not reset the flash timer.

> --
> Lee Jones
