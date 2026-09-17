Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1463783CC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617474; cv=pass; b=FUuwkHgOo6YqekgWILUbDdb1n9qaP85yFUaFR73BMilc382dHBk+fHuZYSmv/Mpt5GDYsSDeD5nnOtA25ZtlJXHXL1VYRTfm/A9v5pA+e5HEZg3U+4SiOwvr9Pw1XDAylrbhpD0JUaticBEsykehXIjiVhTn2ynHH+vLrYGdbxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617474; c=relaxed/simple;
	bh=QZDQFrqT//xAlMZSMIHXxRacLP/53JmUTQhvgHqdImc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxwXsuNePAwe+qNzsRzQLsUVmmG3ZYQNx1zvifEIBB14210ZV9f1UkP83HBo6NyL9HErYLgw0zvxp4bo7eKJzXS4GGMCUFKprIHyIhnVVgpDIt4BMCiJyWwMFOzoIPij7u55+cjLdtY97dj5sHO+Bpqqx6UDdXssO9mHoa6VYHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Un/FedW5; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Un/FedW5"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-79028ca9371so126218137.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789617471; cv=none;
        d=google.com; s=arc-20260327;
        b=CbX0FnhcWtWf1+UDH34vo0VK83PTBa9dX8wJ9MdbFHyIOKPrJemCCs/rlpPIZOb7sr
         rHAQI/Y1fcgzHCtH4lhS/lGx4bMoxFssnB0HqUhBRbG8HmDONRbXrLbC6xs+eW/2QTjL
         FPgajbUzm9M6IHODrQ6xBzjyUETeZNOA2zSAKn2dI2rrmqVx2Vm5uj2qynUT14YXF51e
         tTVy6X8AKeqjLtluENvsxoqN5v9AVB6B1Lmp4rDUneydKo22dAXj3JbB6D9DVmR2Si59
         vspaHYdVrddc2z/zi2kBmjUHdiox8F1+HgeKLF641Q3aDfalZ63GNjMDno2XlYR+YAUD
         8Phw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RCkoPqFTOwYe3ybrEe/kvAczlJcQA13QDTHKtLgag7U=;
        fh=XkTRTqPc/0HXIj/T4KYYEtCPPJsALQ2rR3cgSsccdNU=;
        b=s2azAzZ/ulgmF+3phg9/bM9c9Hy+Z4QLsdQazPYHeqycgWOPDlfN6lbMT02zgl3WRB
         4HX3Bpv5sOjXDSE1JX+k/Wp4cXEQCTigub5U+5q4x1uRpe9SFnTXTbSOompY0+dZ1Zwl
         e1L0SXWp6gQArzo7dnirgxtbB3thwueDDJntVELx77Lf0AdQoVHU6ZaOXdAu/frXvTo5
         K3TKmauxjIyvQZNeGCSxOB8Akehcmv0G9OawIwVfJx36qen5RyI7jTwi7vm4q7i2Bnx7
         MWFlT/YLaAGxggEwfhUVww9V+Zw1X16ipcCZBz8aVBkvqtlPU4YbbmdOhYZLS+qCnG4o
         FDmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789617471; x=1790222271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RCkoPqFTOwYe3ybrEe/kvAczlJcQA13QDTHKtLgag7U=;
        b=Un/FedW5UqVRvbbh4CSnowmccvd/cbjvm3ArxRzbEWWtQQfNHkf0Ufbxl8H2I31uHE
         pMlQayKkiTyrX+WL09hIuqRvmaNMwYKukAbSv17DK62iy38JsSosYHuatBQXttuXFkSE
         QIKI6uZcGPDtrc62cICPl13JM2kAgWo7iSmgkyw3Vrf1XjCgCxjKdDwaQTZCEHj3TrfE
         rjzZOxes3QDreZfKG0azyoslh9wcxjbZ98Rw5Aq+RJzfcY9C56PEiV1KQZEkRGXgz8oG
         S6Z3PM7rlTjRQjO2JVWit6hUK1asX5j1kQDIIa6DsYMOZRS8joR7HsDiDyYoDBMWNxko
         gP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617471; x=1790222271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCkoPqFTOwYe3ybrEe/kvAczlJcQA13QDTHKtLgag7U=;
        b=e7+zn+T+OAQb1GvzVnj4cgvsvJCt5fotxFQFCE2p/6QeEhL1fk6rVU1Qjr1u0xf0QZ
         BVMsR0m0Gs/b8m5T1676H7BA5eUiXwv6M1E0EDaI0HYVk23otyksJrOpLUQh2criL6MK
         lKBQzpACEC03V9scJx7X2h4nOlQ259mSSjwAFmNBkJk9R3BTZSPssOjIcXSTSh+5VCZD
         eSBhNx3JIKUa5wqNOGVLJuPmchK/2g6aE2e/tZnG32012vnkNQZF8Od09Bq+BwMvUDR+
         x1rIxjrQo4630DkvKDlsYruExps1+e8LqAxA+ne2zzNN/0BjRnpxmrLne2XE9x9EcS8Y
         0szw==
X-Forwarded-Encrypted: i=1; AKwUvBxO4xSwHImrqfasG//CQ0/7KZ3DyfpfWvOXIvc4zyWnr4i6S0/wauTtZaR8btRrDhJhVEjcbQcGAEQlGKI=@vger.kernel.org
X-Gm-Message-State: AFuF++m1Y6rzAK4WdLk1OG4J0jHvUiQQDARHi/FimXdmGt9WxCaObUp9
	TPvEROuZ4tXQxaBQ3pluwG8wSFO5ZxyPsuxCPJ2U5xf8tUyvw3Y009yOMMuUuz0sB2l0QBNfyJn
	mm1CL4FMWERDPf9S47gXX/EUdNQkAYGA=
X-Gm-Gg: AYBFou0BJ7Q+wy+oFrEANBgnS4xKL8eHkuLO2zpmzUTAGEeMXfT/A2zPqeVSKgkl+JQ
	zOg4oljYYZDot5C59cWAT+wtI2J4YpS45/Uioy8H53P5X4E9Y7y7THAzP8/FH5sPjarCsQyU4Rt
	yVgWE45DFKiDf0nY0BC2VWXiM66fB74quCpD6LcrCGak6JVrsSv3ir/UrKj6v+SG7xf7/vkVLW+
	seNzOEmxv5r2gTgibse6rOHGFLKeEmp+P3CnVdayYPlzqDQZhKV1Ks+Yiy1VCNriwBskOqvlk9V
	GvK++ZQC/2t4TulmcVC1elKZMf2bttLeS8bZv0hheMo4OkOaMljF2659xA==
X-Received: by 2002:a05:6102:5121:b0:79f:45dc:118e with SMTP id
 ada2fe7eead31-7a0263727eemr4957458137.5.1789617471502; Wed, 16 Sep 2026
 20:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
 <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com>
 <20260907-chimp-pectin-20f4ea3b772c@spud> <CAPBH0A9GZSD5R657xo1woijKfgS6gecUND4uabguaqUON2exXw@mail.gmail.com>
 <20260908-dinner-atrophy-757595146656@spud> <CAPBH0A9yKhvDA_pda45Me1c0tXcSj3zLqLoFgUOQj3MES0Mk1A@mail.gmail.com>
 <20260915-showcase-reorder-e3c4d45eff60@spud> <20260915-recognize-activist-733d145c0ca7@spud>
In-Reply-To: <20260915-recognize-activist-733d145c0ca7@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 17 Sep 2026 11:57:40 +0800
X-Gm-Features: AcwNN1VrNcAwBNna1EDTqdfzEQKrVEmI67efoueReVinzmjRkDLk6TzzxfA2BgY
Message-ID: <CAPBH0A_UGsiSV8G0aM6DDnytrPNCXYj-6y8MRdmDj9+GgoxBng@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
To: Conor Dooley <conor@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Grant Peltier <grant.peltier.jg@renesas.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=8816=E6=97=
=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=881:04=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Sep 15, 2026 at 06:00:50PM +0100, Conor Dooley wrote:
> > On Mon, Sep 14, 2026 at 08:06:25PM +0800, Colin Huang wrote:
> > > Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=889=E6=
=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:57=E5=AF=AB=E9=81=93=EF=BC=9A
> > > >
> > > > On Tue, Sep 08, 2026 at 02:31:40PM +0800, Colin Huang wrote:
> > > > > Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=88=
8=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=881:01=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > > > > >
> > > > > > On Mon, Sep 07, 2026 at 03:03:29PM +0800, Colin Huang wrote:
> > > > > > > From: Colin Huang <u8813345@gmail.com>
> > > > > > >
> > > > > > > Add Device Tree compatible strings for Renesas RAA229639 and
> > > > > > > RAA229640 PMBus devices.
> > > > > >
> > > > > > Driver change suggests fallback compatibles could be used.
> > > > > > Why aren't they? If they can be, add them. Otherwise, explain w=
hy not in
> > > > > > your commit message.
> > > > > >
> > > > > > pw-bot: changes-requested
> > > > > >
> > > > > > Thanks,
> > > > > > Conor.
> > > > > >
> > > > > Hi Conor
> > > > >   Thanks for the review.
> > > > >
> > > > >   I didn't add a fallback compatible because I only have document=
 for
> > > > > RAA229639 and RAA229640
> > > > >   and could not verify full DT level compatibility with any exist=
ing
> > > > > supported devices. While both devices
> > > > >   are handled by the existing raa_dmpvr2_2rail driver variant, I =
don't
> > > > > have sufficient information to establish
> > > > >   a compatible fallback relationship.
> > > >
> > > > Given that the match data table looks like this:
> > > > static const struct of_device_id isl68137_of_match[] =3D {
> > > >         { .compatible =3D "isil,isl68137", .data =3D (void *)raa_dm=
pvr1_2rail },
> > > >         { .compatible =3D "renesas,isl68220", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl68221", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >         { .compatible =3D "renesas,isl68222", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl68223", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl68224", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >         { .compatible =3D "renesas,isl68225", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl68226", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >         { .compatible =3D "renesas,isl68227", .data =3D (void *)raa=
_dmpvr2_1rail },
> > > >         { .compatible =3D "renesas,isl68229", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >         { .compatible =3D "renesas,isl68233", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl68239", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >
> > > >         { .compatible =3D "renesas,isl69222", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69223", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >         { .compatible =3D "renesas,isl69224", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69225", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69227", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >         { .compatible =3D "renesas,isl69228", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >         { .compatible =3D "renesas,isl69234", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69236", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69239", .data =3D (void *)raa=
_dmpvr2_3rail },
> > > >         { .compatible =3D "renesas,isl69242", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69243", .data =3D (void *)raa=
_dmpvr2_1rail },
> > > >         { .compatible =3D "renesas,isl69247", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69248", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69254", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69255", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69256", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69259", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "isil,isl69260", .data =3D (void *)raa_dm=
pvr2_2rail },
> > > >         { .compatible =3D "renesas,isl69268", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >         { .compatible =3D "isil,isl69269", .data =3D (void *)raa_dm=
pvr2_3rail },
> > > >         { .compatible =3D "renesas,isl69298", .data =3D (void *)raa=
_dmpvr2_2rail },
> > > >
> > > >         { .compatible =3D "renesas,raa228000", .data =3D (void *)ra=
a_dmpvr2_hv },
> > > >         { .compatible =3D "renesas,raa228004", .data =3D (void *)ra=
a_dmpvr2_hv },
> > > >         { .compatible =3D "renesas,raa228006", .data =3D (void *)ra=
a_dmpvr2_hv },
> > > >         { .compatible =3D "renesas,raa228228", .data =3D (void *)ra=
a_dmpvr2_2rail_nontc },
> > > >         { .compatible =3D "renesas,raa228244", .data =3D (void *)ra=
a_dmpvr2_2rail_nontc },
> > > >         { .compatible =3D "renesas,raa228246", .data =3D (void *)ra=
a_dmpvr2_2rail_nontc },
> > > >         { .compatible =3D "renesas,raa229001", .data =3D (void *)ra=
a_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,raa229004", .data =3D (void *)ra=
a_dmpvr2_2rail },
> > > >         { .compatible =3D "renesas,raa229621", .data =3D (void *)ra=
a_dmpvr2_2rail },
> > > >         { },
> > > > };
> > > >
> > > > It's probably pretty safe to assume that a fallback would work here=
,
> > > > given how many devices are served by the same data structures but
> > > > maybe one of the Renesas folks on CC can confirm that for us.
> > > > At the very least, you have documents for two devices and should be=
 able
> > > > to confirm if they're compatible with one another.
> > > >
> > > > Thanks,
> > > > Conor.
> > > >
> > > Hi Conor,
> > >   Thanks for the review.
> > >   I found a very similar precedent here:
> > >       Link: https://lore.kernel.org/r/20260325090208.857-2-dawei.liu.=
jy@renesas.com
> > >       RAA228942 and RAA228943 use renesas,raa228244 as fallback compa=
tible
> > >
> > >   Therefore, I plan to followthe same approach:
> > >   RAA229639 and RAA229640 also use renesas,raa228244 as fallback comp=
atible.
> > >
> > > ```
> > > @@ -60,13 +60,13 @@ properties:
> > >            - renesas,raa229001
> > >            - renesas,raa229004
> > >            - renesas,raa229621
> > >
> > >        - items:
> > >            - enum:
> > >                - renesas,raa228942
> > >                - renesas,raa228943
> > > +              - renesas,raa229639
> > > +              - renesas,raa229640
> > >            - const: renesas,raa228244
> > >
> > >    reg:
> > > ```
> > > Does this look reasonable?
> >
> > It does, thanks for the update.
>
> Actually no. The idea is right, but the specific fallback is not?
> You added to the driver
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl6813=
7.c
> index 2f7f825bfb69..53b44775ba1e 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -456,6 +456,8 @@ static const struct i2c_device_id raa_dmpvr_id[] =3D =
{
>         { .name =3D "raa229004", .driver_data =3D raa_dmpvr2_2rail },
>         { .name =3D "raa229141", .driver_data =3D raa_dmpvr2_2rail_pmbus =
},
>         { .name =3D "raa229621", .driver_data =3D raa_dmpvr2_2rail },
> +       { .name =3D "raa229639", .driver_data =3D raa_dmpvr2_2rail },
> +       { .name =3D "raa229640", .driver_data =3D raa_dmpvr2_2rail },
>         { }
>  };
>
> @@ -506,6 +508,8 @@ static const struct of_device_id isl68137_of_match[] =
=3D {
>         { .compatible =3D "renesas,raa229001", .data =3D (void *)raa_dmpv=
r2_2rail },
>         { .compatible =3D "renesas,raa229004", .data =3D (void *)raa_dmpv=
r2_2rail },
>         { .compatible =3D "renesas,raa229621", .data =3D (void *)raa_dmpv=
r2_2rail },
> +       { .compatible =3D "renesas,raa229639", .data =3D (void *)raa_dmpv=
r2_2rail },
> +       { .compatible =3D "renesas,raa229640", .data =3D (void *)raa_dmpv=
r2_2rail },
>
> but the raa228244 uses a different bit of match data:
> > > >         { .compatible =3D "renesas,raa228244", .data =3D (void *)ra=
a_dmpvr2_2rail_nontc },
>
> So you need something like
> - items:
>     - enum:
>         - renesas,raa229639
>         - renesas,raa229640
>     - const: renesas,raa229001

Thanks Conor,
   I miss some information to you.
  I will modify the compatible to following, because they don't
support temperature 3.
 +       { .compatible =3D "renesas,raa229639", .data =3D (void
*)raa_dmpvr2_2rail_nontc },
 +       { .compatible =3D "renesas,raa229640", .data =3D (void
*)raa_dmpvr2_2rail_nontc },

so.. fallback  will be like following.
      - items:
          - enum:
              - renesas,raa228942
              - renesas,raa228943
              - renesas,raa229639
              - renesas,raa229640
          - const: renesas,raa228244

Best regards,
Colin Huang
