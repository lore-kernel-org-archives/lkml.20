Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89272F6577
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719511; cv=pass; b=HxS+rKJGLxQew8dVD8+tNGfLKsi8OH/pKh8CmrSKdsHQV5ctpzVryfVRwJ/3ApK0ukfVaMkX+ZhgMDY9V+KG36Tl5XzvToIVHGALzz33dteiJtp6HNVp6xKwluUzwlzGaHAi69ZgX/vdGMzC6UFR6IhwnQ1QdIArgFKMe7NFzBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719511; c=relaxed/simple;
	bh=pvvJqd7Euafnh/j2/YsbTiW/PcrYqSgdLGzLkgxVrCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edlaATZfoywp0MxO7EdGyO8lrqYbR9WIUciEvYtiHhZCQniyw1ZZaF9okTqZ5D/lJN6G4NbziCC9Ak58fKbp5DIaxV3HeWd2xdwEQU//2z+5n+IgXOytDkIgiyNrW8Q+snifm863wCctWQMJijZcncHlNeiHWjLZTKW76R79NUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Evd1MPP2; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Evd1MPP2"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-85b293528a9so33927527b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 11:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788719509; cv=none;
        d=google.com; s=arc-20260327;
        b=Wb8otEzP2DYevI+LxhhvYctv+6vUYhpr7jcs+EDRa+6yA8eTYXaRl+8zy21A7jJvuY
         ApwUzZjSSsGncAPbNUV9evZLoQ09YJMzC4xNupWgkmkuaqYSD5plsJjUfTkOCohHx7tX
         Hrf1bngR8VsAM32ouLU+Cv1z6wBAOZsH0WJV46T4I6Cy3DrNqxN8XbqPhAqmox6ApfKy
         SQrRXK0j/3YHJWtXFUDHb/RxyrQbNtF5xAdXP1F+AF3GWXn4l3xxiBElWD3zaogd7hy5
         QK2pSl1ARd7W+EesZxkqnu/ykOTU3AEnYLbu5j9gtBCDAZR6Oq1wXc9g0gSAxdUSvfvY
         0s+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TQkeSwtedLp1iDq5m8KD8XHS3VYT5RaCWuCgQNld12s=;
        fh=/gLxyoDN9X37uTm4O7vHvO5/SHC1iFl7oqB8IIymvdQ=;
        b=hGFB6zqKHX45yXvtk4ctkCy0meQCWmE9FjfVBjLAaQLOEqpPQqu4dXAsncciCC5kEb
         /oZHGJqnDGJWb0EZAbpsXKMcIdpoSjmUPjU/+YR0UpCFCLOQu6/SJAzn+uIqOQ5Dat8j
         lv/U8DcMjjr0GNFI3wesSV9gCBVG8X+WyPGzexWezKgjKD3t5aYPOXUEB40QK/p7CT7s
         r6FngYjSyRKVFHCY19wOyR8zhQuW31Ti5nVk+fyKw+LpJKUfsl0VIymGJRzZdT6JOJJJ
         hZDDUxoedbaQR8lr8ZwrNUqfcF6yDJzVzib720GlbpiO5K6Nq313For9xlOr8A8OoQjj
         qgxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788719509; x=1789324309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TQkeSwtedLp1iDq5m8KD8XHS3VYT5RaCWuCgQNld12s=;
        b=Evd1MPP2ae9RI8xQA/e4mGF7AG0IOTfrpmqWKNKTPZCFpMP1iagR2rLpyDykWRpdL1
         0BXcOJRac/vAIRNq4hYL95a/jACbSDRyza/flWGaM0PjaCpXOSTBjBZKQxDihp2TabKn
         9pTMrKSFHnuiYFB21Z7jC9HpHkVjKSrkc9pyGLNb2y7Q3emyER7+gY/AbNB5jo2OeCzT
         9JZK1xhUryo2gELVDELa+x9KwW4SDD1wcA9Nej2R9kNMG2h5bzFJp1AUpnDnTF7mM7Ma
         x4zbMLCa7qADhqMxxMLXeKSUyYfcfWpLlEucO2lfmwN8KS3GVxugpLZPYBYgOAg63TjR
         rQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788719509; x=1789324309;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQkeSwtedLp1iDq5m8KD8XHS3VYT5RaCWuCgQNld12s=;
        b=bnD0eX7Q/Hun6C06P3GT9IqbvzNeycvtunAgIUpudzWZkrME0Waki8ayAwyry108ka
         lYJn1VEamen/bUnInZk6TslUapI74saeZ2vU+iReHhZU9EPMvZdouPK93haSTVTW8Ljl
         BKa3rnSwrYc1SIzFM12BdfpU5PVqJFg9bLPz4eXz+y2mhNs22vcrCAF0dfGOrigXdgP6
         aJhETHZSbypqir8ROpZaGhaf/SUULRHW4IXdb27BpBpg+9IapNAxJBGMiPHzWgybjIff
         MxHcrBNw7Ol7P881PJlPdOqb4fMDzl8bCWJS4aFyTwTGBmxpEiXugDnYv/qRnMHMuoqW
         NXpg==
X-Forwarded-Encrypted: i=1; AKwUvBwDI9hUm5qpLo+oB9pPxHfhWA2dEs4Ug68u4ney6t+YgkIkomr3xii6O06Jw+n0ysU1iNEbsv98U5bB5J0=@vger.kernel.org
X-Gm-Message-State: AFuF++mpR7LFnFi1sahYckOq542PgIm6DqmIeG+IgFrxvyahtk5IkLNW
	uE9VJ1EtHHbRHI+q679hsMi3m5n+jgms3yr4p0MLD2CA7NxXx9sdYezXsVDDKtIiJfTJpbZ9H9V
	XlK/XtrnSJsamBf8vzw2r4RD3JiRQ6AA=
X-Gm-Gg: AYBFou34vrlJWUtaUPIziwfSXVOnz/Gu2RmTndYzX/Py+e2P0v190LhPQzcQCsi0ciR
	pnac56ay0HJ/TisiORHN5XRsAS5m706LC0/PuNhSJWja+HCgb6rrXlTrMztCeVYskEOhqbwOx6W
	ZylRooJ5v43yp0hepkODyw+8uu/m6Y5iBkmMcmq/uRwv/PvPwPjBY3/wW5vtijJBlCi+ZPEeF82
	2zQA9O4ajtcvu6/xJplB+ZVz7u3SYGo3PioeQt/d9MW5uBrmVv7mJ9DQ0yuJL1XMj1aRf4TcesW
	rAmzGG9KyI0ddPhaqiX2dylsQqwnCSsNz6fUSTwimWd14Y0SMJKo4ns0h/CSdyYjD6O6DlY/a7U
	owyc=
X-Received: by 2002:a05:690e:43cd:b0:66f:c1bc:403a with SMTP id
 956f58d0204a3-66fc1bc490emr1136508d50.27.1788719508881; Sun, 06 Sep 2026
 11:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <12955564.O9o76ZdvQC@rafael.j.wysocki> <CAJOGg3x4nMtSJeiLa2nsBFFuG4GRyvj7MbErcdOgxyuXCkr_og@mail.gmail.com>
 <apbPV_tsyYVzvEVt@kernel.org>
In-Reply-To: <apbPV_tsyYVzvEVt@kernel.org>
From: Julien <julien82453@gmail.com>
Date: Sun, 6 Sep 2026 20:31:38 +0200
X-Gm-Features: AcwNN1XY9sFlhyINrgcYqoQq92RQCKR2qxwUOv8SXLhPuRgwGnTe1uxZUxAdUfE
Message-ID: <CAJOGg3z22-G_+izney69i3AhesqwX-u0Coj74zXSjb-RzSCdvw@mail.gmail.com>
Subject: Re: [PATCH v2] ACPI: scan: Do not combine resources that overlap completely
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, linux-integrity@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 3:12=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org> =
wrote:
>
> On Sat, Aug 29, 2026 at 12:43:30AM +0200, Julien wrote:
> > On Thu, Aug 20, 2026 at 9:11=E2=80=AFPM Rafael J. Wysocki <rafael@kerne=
l.org> wrote:
> > >
> > > From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> > >
> > > Commit f234fdaae1ca ("ACPI: scan: Avoid registering platform devices
> > > with resource overlaps") attempted to avoid platform device registrat=
ion
> > > errors due to overlaps of resources of the same type returned by the
> > > same _CRS object in the ACPI tables.  It did that by combining two or
> > > more overlapping resources into one, but it went too far and also
> > > caused resources that overlap completely to be combined which broke
> > > the arm-cmn driver that expects two MMIO resources to be present for
> > > each device it binds to and it expects those two resources to overlap
> > > completely.
> > >
> > > Address this issue by adding checks for completely overlapping
> > > resources to acpi_platform_adjust_resources() and add a comment
> > > explaining what is done there.
> > >
> > > Fixes: f234fdaae1ca ("ACPI: scan: Avoid registering platform devices =
with resource overlaps")
> > > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > > Tested-by: Nathan Chancellor <nathan@kernel.org>
> > > Closes: https://lore.kernel.org/linux-acpi/20260819003752.GA3063251@a=
x162/
> > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > ---
> > >
> > > v1 -> v2:
> > >    * It is better to check for complete overlaps both ways as suggest=
ed
> > >      by Sashiko.
> > >
> > > @Julien: I would appreciate testing this on the machine that needed
> > > commit f234fdaae1ca.
> > >
> > > ---
> > >  drivers/acpi/acpi_platform.c |    8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > --- a/drivers/acpi/acpi_platform.c
> > > +++ b/drivers/acpi/acpi_platform.c
> > > @@ -85,7 +85,13 @@ static unsigned int acpi_platform_adjust
> > >         for (i =3D 0; i < count; ) {
> > >                 struct resource *res =3D &resources[i];
> > >
> > > -               if (resource_type(new_res) !=3D resource_type(res) ||
> > > +               /*
> > > +                * Look for overlaps of resources of the same type th=
at would
> > > +                * cause resource insertion to fail down the road.
> > > +                */
> > > +               if (__resource_contains_unbound(res, new_res) ||
> > > +                   __resource_contains_unbound(new_res, res) ||
> > > +                   resource_type(new_res) !=3D resource_type(res) ||
> > >                     !resource_union(new_res, res, new_res)) {
> > >                         i++;
> > >                         continue;
> > >
> > >
> > >
> >
> > I have tested this on commit 1b78070aaef6. It seems the patch is
> > already included in it.
> >
> > TPM device still works. Here are the logs.
> > acpi MSFT0101:00: [mem 0xfed40000-0xfed4103f] expanded due to overlap
> > tpm_crb_acpi MSFT0101:00: [Firmware Bug]: Bad ACPI memory layout
> >
> > If in the future if I need to make tests again, should I do them on
> > the Linus Torvalds' branch?
>
> What was the hardware where this happens?
>
> Sorry, if I've ignored it (if it was mentioned previously).
>
> BR, Jarkko

It is the Acer Aspire ES1-572. I reported it here
https://lore.kernel.org/linux-integrity/CAJOGg3z6LJPDsdPNBxajgy8_wQxfhYBRxe=
4EiurZf3kPU5A5Bw@mail.gmail.com/.
