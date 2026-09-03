Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B498B3793D0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461954; cv=pass; b=l3FIQtM0rmlZVjrtd02OD/IhJn8A5ytIQFfVblZE1pSNkCYk9dPGNvtoE5WgUzT6/R59HesJNvAXzc8kYZggP8DSz5Q4xc/AUgbmlR15D5B72uWsg33IKXSP2E+D8EQMIvQKzt3b1USRumg1KzrYw7vh1YH1RWHtv7oAP3Uf0f4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461954; c=relaxed/simple;
	bh=/OxdHj9ysvfR57EEzc0+AuUsvMW1G0r5zIF1Md1GvvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hH4zQyYw55FJjejmp/tktUdtSQfXdEsRq076fKIVs09h1TTsqiXSjcP5VZ2qdUJODkg0cRSWyQhG56rEKC0m4M1/Qyb5fKlDqykAoa5pfLvQgs8s0oaxCQDWodDc2hqojJVhewME9pp1MsAA+J0bcMgcaxcopVMyLLKkkFrmYDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njSLHGQx; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njSLHGQx"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso156621a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788461945; cv=none;
        d=google.com; s=arc-20260327;
        b=iVlGWtl6Sj+P5zVMiVvRm14+rsTCWu1B0BaFpL1q45IXxpcS68FeefXSrB/XosSB6b
         v0mTP8wqSX47J76vqAb64wM6mbYAC6awNFPT7KerSIjnraQ3RHjcsjVze0Y3eiaOMMuj
         4U4EwpDn3/0SIEkz3I2RJq4+P/ItWgyJTm0XT3WLo/H57aIavGwluAwSqpVOUIXgoLXQ
         HBU7tXNHtY9g1qzOdkKOFHIqwoPTcysQV+7LyUAeHibEkVEn+Y6cbeIbdGLUWFrsflWe
         AvnMsXKENZgThCGXTQ2iTuW3PVpW30oClvVr4LiPtGZu8C8oQr2SHban601/JGGciDk8
         4F+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nI/hqBwcSMNIp3RBgD0iAO6W4qosGQLQpAKeR8JRNrs=;
        fh=MlNYjy5+lqdSLAjL1YpHcAD82yeGnK6q8vVt5sPVtdw=;
        b=b1pziHajcxBziuc3c/amxxHfHzorg53Xxzx/5j0e6H0qtweiUoKIM2eGOEvhwtSxZ7
         YuXUudkZofN6KtoQie8jaNxzLgfVaBzFDxqyZDhx7k6bKy+kzWpYuGdY08351Q/tqPwH
         6unDvO0ZG4Z6JsEaNoutR0gA1H8cqAuKwkM6qfyiCyLXjvs7gXSNCiq8/VzRxCtwIMU7
         op4dXfO2EGIYE2c2PyDGal/zeghQcRZtucItxoo1EBjNwmhrZVAJhURsH9vjIwLcRXI2
         DaMIokBPiEf/vu1BEr5el7w/UMf+crftLi+W7jhUqgvFOZI1LjejFsjJeMEubOz+G21R
         WaAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788461945; x=1789066745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nI/hqBwcSMNIp3RBgD0iAO6W4qosGQLQpAKeR8JRNrs=;
        b=njSLHGQxCP2li48YR6bUqLXOlIVAOS9Y4DfCyF+hwyMgmNTpgeiJ5/HJ0/q0FpxfcH
         zWNz3e/bRS6ozvpZiy//nb9Ywndb+AjQCmAFskXYWkIIoSGuz8C2RSwc4iREuLGrugnT
         q3DzOlS4ydOhd6BdRx0AoN3EabGSxbkvWtVKukNvb4/swQcc3ZVNhBfZTHN/oTcW/hdp
         SAwGo302vNaGl+2mAv9k6AZ+RtVMPcdEARFSVPFr/wCArpNHT1qn03CrC4AQeo2QvR4M
         aDW9BIVfPgE/DgeuKDbQT3AQFbaDgZGdK3KJHxt871q6kx7pVeYaKfZhCiVwtNUFTuoY
         z7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461945; x=1789066745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nI/hqBwcSMNIp3RBgD0iAO6W4qosGQLQpAKeR8JRNrs=;
        b=DLISG8UwYtdn2qeOYfizYmqwy16DywlyXjxS3OTNakx/vOjPZqk4k2OrofqG4zJO7X
         yv6wWRSjlya8sxTckUxou6+Ma2YMrCNzDYfn04ylVSDy0RZdlKVa6egDNV6FIUQ6hPg5
         gYC20zynemtp3+LW85+fPBg/bRMyp4sUZBMhuqJve4SqMuOQuZqnCPyHAaTDlU7mLHpD
         lGaY2SBnRnxLt8MgPmUEqrNqLrVSp8Kq0g6AQjbE8v9Z5Zu51c0kI8+JO3tVZU8nU5jZ
         iI7LkCOC4rBtjD0S4SqGPQKqX3h4UVllUmuLH6NSMX7WBwErZ7BfUJJOW5D8NI6kRGWp
         nRpg==
X-Forwarded-Encrypted: i=1; AKwUvBySbV70ddC6k8sHj+1hl/FPf1simeRnpGgIDBBJ5n3uA2b1A2A6MSyENfc7dibREhGjLUkVeo04d9xydJc=@vger.kernel.org
X-Gm-Message-State: AFuF++klkgzVyQAe5XchxaE7V76/ofPq7TJ8L3HHkH8NRh+bo0ac2jk2
	tJ5tO1s2c5ghn3+oCxvGB3NB1FD+znqIaxCpVWcMzX8LXRaag5qCNQpsIJUW7CNqftV26LM6xUH
	TFEdDhnKCONUWnq8xdN+5ydm0eHu8RGM=
X-Gm-Gg: AYBFou2WnvsU1ffXqjm3CiVX+GBS01JEP8q/E5PZFbFAKOI0BJvVmlzGnmqEgUl8SuM
	bP4Yp/xk7HV7hr6AL2rPdVQVl94tVUxw7tNLb7htWJkV5hFxqnoGVlw+Vo34KM+mLBGs5zb5vgC
	W7oPXN0MdWQTGY31bceLh3p/Ia+mKnf5VJ261bfFsSi5PC+li6KTL/VF5E8FLdxCxoMPS8cEryZ
	dRZC9D5FQ9e1X5/3WV4GTkLxMvkjCbST/39aSOMc4bjrouIUOk1DMzNx9+lhaUzGLppSDuQ84zS
	c1vtBuUZiCjmwqFd3UBg7leBsPHG1//2iseLzKh9SFnvjUb8IjlMOFb9zwxe735ndkWXTHU9GHC
	Nsz+ay14Srk6+O+tAKQVGExWDYZgz0lK4GqnNY0WqontGi9QTax/QAlU5VMil0t9u0PrPcR2vlk
	t/EJtAwFkhygwvJfXJuXpa8/ZLN7Y7/GULLaq2Kpgycq/13JpdggRPWdg=
X-Received: by 2002:a05:6402:3886:b0:6a6:32f5:5571 with SMTP id
 4fb4d7f45d1cf-6a7e8f946bfmr27530a12.19.1788461944874; Thu, 03 Sep 2026
 11:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901004203.49686-1-rosenp@gmail.com> <20260901-corrode-unvented-4cf271941722@spud>
 <CAKxU2N9X=fvr-a5h5o5XaRLuRuSUq7wR85xmSduK9vff4z4CQA@mail.gmail.com> <20260903-pettiness-crested-c4fb1b3ac05a@spud>
In-Reply-To: <20260903-pettiness-crested-c4fb1b3ac05a@spud>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 3 Sep 2026 11:58:53 -0700
X-Gm-Features: AcwNN1VKJMbKCu_T1F0VY384x3qLO0B2LRU-9HQpE-yQn8Eo44X7b4XrjE7mWcM
Message-ID: <CAKxU2N__+u-mJ4bbAEFcT3jbxPShi4BeEj+0cAN3oHWzqeGzZw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: 8250: add marvell,armada-38x-uart compatible
To: Conor Dooley <conor@kernel.org>
Cc: linux-serial@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, in file <devicetree@vger.kernel.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 8:42=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Sep 02, 2026 at 02:34:55PM -0700, Rosen Penev wrote:
> > On Tue, Sep 1, 2026 at 10:51=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Mon, Aug 31, 2026 at 05:42:03PM -0700, Rosen Penev wrote:
> > > > The Armada 38x and 98DX3236 SoCs use this compatible, either paired
> > > > with "ns16550a" (armada-38x.dtsi) or on its own
> > > > (armada-xp-98dx3236.dtsi). Neither form is covered by the 8250
> > > > binding, so dtbs_check reports:
> > > >
> > > >   serial@12000: failed to match any schema with compatible:
> > > >   ['marvell,armada-38x-uart', 'ns16550a']
> > > >
> > > > Add a standalone const entry and a two-string variant paired with
> > > > "ns16550a".
> > >
> > > Only one of these is correct, add one and fix the users.
> > > Given there's match data, it's probably the standalone one.
>
> > Commit 62480772263a adds the second one to support earlycon.
>
> So the one with the ns16550a fallback is the correct one?
Good question. I posted an alternative to this patch here:
https://lore.kernel.org/linux-serial/20260902222555.30C151F000E9@smtp.kerne=
l.org/T/#t

If accepted, it would avoid needing ns16550a in dts, and a v2 of this
patch would be the first hunk + dts fixup.
>
> > >
> > > pw-bot: changes-requested
> > >
> > > Thanks,
> > > Conor.
> > >
> > > >
> > > > Validated with make dt_binding_check (8250.yaml) and dt-validate on
> > > > armada-38x and armada-xp 98DX3236 boards: the UART schema errors ar=
e
> > > > gone.
> > > >
> > > > Assisted-by: opencode:big-pickle
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/serial/8250.yaml | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/D=
ocumentation/devicetree/bindings/serial/8250.yaml
> > > > index 8c2c177faf89..f71c6afe02f2 100644
> > > > --- a/Documentation/devicetree/bindings/serial/8250.yaml
> > > > +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> > > > @@ -109,6 +109,7 @@ properties:
> > > >        - const: aspeed,ast2500-vuart
> > > >        - const: intel,xscale-uart
> > > >        - const: mrvl,pxa-uart
> > > > +      - const: marvell,armada-38x-uart
> > > >        - const: nuvoton,wpcm450-uart
> > > >        - const: nuvoton,npcm750-uart
> > > >        - const: nvidia,tegra20-uart
> > > > @@ -119,6 +120,9 @@ properties:
> > > >                - exar,xr16l2551
> > > >                - exar,xr16l2550
> > > >            - const: ns8250
> > > > +      - items:
> > > > +          - const: marvell,armada-38x-uart
> > > > +          - const: ns16550a
> > > >        - items:
> > > >            - enum:
> > > >                - altr,16550-FIFO32
> > > > --
> > > > 2.55.0
> > > >
