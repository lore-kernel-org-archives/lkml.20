Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C794AA3F4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486760; cv=none; b=HN+GC+3Pu1/Aa5fQc/7jF1cwgIv3iZFeR7pOhiJ1j2uzRmKc1/E5gogx5/g3jVrhnNjUnfgViwYIpR9HM/PRMHAhtnwEEIKhoyPlteglcAnPOOC47o12l/IUnBHrMYJxi0sa9tcvHMVG4+g7rKee2h5B+4XPza1Q2wgQsMU4csc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486760; c=relaxed/simple;
	bh=TWoS6wOOkitwbzIDv9Je6b6vVlU3qTi5hoLbd48PBGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNsOq2yAziopRHjDb0ESGZIk2QYjjI62MpRkZBJtrhntds7leBddM0Kip7GRHCfuLAgvfujfjbdBEYGbsrHcoC3tLnymbfOqaUcKOe+AJSFVi6ud6iQ1sjHBpM6IekW17bAZpfL3AL9bU0oDa6Ps60WA0YVMtWwaXPDK8Uo4Clw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTY/SJTp; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTY/SJTp"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43ac6090so34730587b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789486757; x=1790091557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BswwnU3mQ2zPeuSUfvCuf8xfaaNhvFO4u778jDi+rn0=;
        b=JTY/SJTpIOu2RLPOMouTlA+uMW7B+tR06Yi0Xd6APCmsvQdEicUhTVzaWfnYNZnmoF
         55wTVmqJEaQwJ0lmJQ3Fj5Gwi6jG6DFYZKddF5Eq37CO3FI5VCS6SbviUeJpthkAIOyb
         x8NIcGym8cast7lpHrL3JT+9XJZf/nc4322bFKYdKl7sXB6xWrjIm0US4M52Uo7AGgiu
         A0Bi4k+Gtec5psf4jfx0/p/5aZD2j6ip76KEdZydXt1alqz+5UHwxlMALICz/bNqgAQA
         E/QFaVJhTir8EIQdC2dS3WAjZ367hJn/8GrDrCiRpsdzLNVM7yqYL4bOb8SxdH1T0oan
         BMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789486757; x=1790091557;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BswwnU3mQ2zPeuSUfvCuf8xfaaNhvFO4u778jDi+rn0=;
        b=JivL1mq6dd908QbRfHUqZyKTobyltipq/U+sOjZUpTL5T5mIJOePtPa3NaC4b9XzTp
         Px+3K7C9xCFWF8Iki4XY4mrlgJwkbF35krl8F4xZyFXKDWPXZnBD4L37jeTY8jEfmaMe
         L9+F65F6V0ieghxoPrytsrDUI5iDU2PUJ9b5Gjkej6GektTbEg0F7FAkgrYj2n7X6ymj
         UGOCMEQ5PKAu3o7drDlS914jhGJvSrJHcGnR8FRSSbVfIbhkpccG9xHydSJfM0Cvg9rR
         efu5bNQgi0BIdKf4DX3ApxHMtbrdL/omy1EEsv4/0kVZayJgGUNBKGVhAEvLZ/ST/Twm
         LJgg==
X-Forwarded-Encrypted: i=1; AKwUvBz8MoP7QEpmgwC4U8TrILPRNw66s20d++/adQjpoGD853rLHOb/R7xNpeIRyKR1TQURaG6itmZOlzFVl60=@vger.kernel.org
X-Gm-Message-State: AFuF++kDZubKY9ef0tML4Er1RwfVjfUhPaeBiehoKOmseuXPhR5LCEXM
	sfLNd3ypzP9JcmD90FjYqnjphKoCyYgqe/6oH7cFPCt+k6TgUwsqd3AD
X-Gm-Gg: AYBFou1wMrwiacjDJ5mF7QA9JNvpNNZvZEDx0LiCIBfY2Pj1kY7YJ2buhuyP7zVUqNs
	Ok2Oslitd5Kzr8bSq7/Wmcq36GpmrMOQZXy5D8ypeck4Wbjk7tVBs1CowjQpLNUzYhOvTYFzw5l
	3rZDJBmlkF6G0QrKt08f6B3Xgj/A6xr0QZykyh2t5I1rh/5MlS/k0D8W+HGGUeH6ogAFv2i2tUH
	eia7MAWNhMmvUtI4akbrMmANJ8L35pB29NWSSVTuaRGL5b9nlUc8wgrPMffvM42xoMCrtWxk3xv
	jeq3qAxA2cxiKFvibVTqM8jiK2Qh9FkjJE+J6CPpNV0m0Rg7wlJq6xQj/qSJ6MzfuM3SGZJ47+u
	e4MUtepVgccynzzh1XtOsdgtOj1946yjq3ipzAkF1cZThLrIx+DKKge2tGgwo1QEnxuVsNOQ1DO
	u6h3N+5PVC+0TjmlVoriV4mQX6F5sFWUVMUp0SvZQxu7A3NDnydgy09EsOlF3B0xOAUrmM4Ga0+
	z9f/AlVzQ==
X-Received: by 2002:a05:690c:e29a:20b0:873:3f2:c102 with SMTP id 00721157ae682-88d1f402778mr20297257b3.27.1789486756988;
        Tue, 15 Sep 2026 08:39:16 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980:4f4c:9d3d:ae83:2fcc])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8847db45a31sm48357777b3.7.2026.09.15.08.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:39:16 -0700 (PDT)
Date: Tue, 15 Sep 2026 10:39:13 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: astian <astian@memeware.net>, linux-man <linux-man@vger.kernel.org>,
	libc-alpha@sourceware.org, Thomas Gleixner <tglx@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, linux-kernel@vger.kernel.org
Subject: Markdown as a "less hairy" source format for man pages (was:
 ioperm(2): confusing terminology)
Message-ID: <20260915153913.gn4lupmyydvtehnw@illithid>
References: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>
 <aqXOgqne-v4GtglY@devuan>
 <DLDZ6A0QS5NY.E0Y1TPNME1IN@memeware.net>
 <aqfsMbQWdqq_TG_b@devuan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iwjzjcus7qq3nulh"
Content-Disposition: inline
In-Reply-To: <aqfsMbQWdqq_TG_b@devuan>


--iwjzjcus7qq3nulh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Markdown as a "less hairy" source format for man pages (was:
 ioperm(2): confusing terminology)
MIME-Version: 1.0

Hi Alex,

At 2026-09-14T14:56:21+0200, Alejandro Colomar wrote:
> > Date: 2026-09-13 06:29:43+0000
> > From: astian <astian@memeware.net>
> > Sorry, I've never written *roff before
>=20
> I've never written roff(7) myself, but luckily, man(7) is much simpler
> than roff(7).
>=20
> > and I don't think I want to spend my time learning that... although,
> > I might be able do this by just blindly replacing words without
> > touching the escapes...
>=20
> Indeed, that's how I learnt man(7).  Replacing words blindly is quite
> easier than it seems.  I was also scared the first time I wanted to
> fix a bug in a manual page, but I found it was easier than I thought.
>=20
> > Which bring up the question, why not moving to a less hairy source
> > format?
>=20
> This question comes up every now and then.  TL;DR: other formats are
> worse.
>=20
> man(7) is pretty simple, and easy to learn exactly by editing words
> blindly.  There are very few macros, and their behavior is trivial
> once you use them a few times.
>=20
> One thing that is very important is that we use semantic newlines.
> That discards .md and .rst, since they are meant to be written with
> paragraphs as they'd be read by humans.  mdoc(7) is more complex than
> man(7), and thus we don't want that.  There are other formats, also
> inappropriate, for the same or other reasons.
[...]

Another reason to not underestimate the "hairiness" of "plain text"
markup languages relative to man(7) is revealed by the sorts of trouble
that people get into with at least some of its dialects.

Here's an example from the util-linux project, which maintains its man
pages in AsciiDoc.

commit 36e1fb5802c0948f13ba0ec4ac68c94cb24856db
Author: Thomas Wei=DFschuh <thomas@t-8ch.de>
Date:   Mon Apr 27 15:24:47 2026 +0200

    lastlog2: (man) fix example syntax

    The examples are not using the right syntax for literal blocks,
    leading to errors from asciidoctor.

    Use the correct syntax.

    Fixes: cd112d860bf6 ("lastlog2: add --journal option to manage SQLite j=
ournal mode")
    Signed-off-by: Thomas Wei=DFschuh <thomas@t-8ch.de>

diff --git a/misc-utils/lastlog2.8.adoc b/misc-utils/lastlog2.8.adoc
index b8fcb055c..20a971242 100644
--- a/misc-utils/lastlog2.8.adoc
+++ b/misc-utils/lastlog2.8.adoc
@@ -91,19 +91,19 @@
 =3D=3D EXAMPLES

 Display the current journal mode:
-----
+....
 lastlog2 -j
-----
+....

 Enable WAL mode for better concurrency (recommended for high-traffic serve=
rs):
-----
+....
 lastlog2 -j WAL
-----
+....

 Switch back to the default DELETE mode:
-----
+....
 lastlog2 -j DELETE
-----
+....

 =3D=3D FILES
---end snip; there was much more in the same vein after this---

Not long ago I diagnosed our industry's collective, and persistent,
refusal to believe that writing worthwhile documentation could ever be a
more demanding task than the simplest computer program one can code.

https://lore.kernel.org/linux-man/20260710195854.ud4riftmhrfzu54d@illithid/

Regards,
Branden

--iwjzjcus7qq3nulh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmqpZpoACgkQ0Z6cfXEm
bc4cuw/+KkecYxT6oSfTdy+NBDhIAIa07rjAOFsppEoVXkmAAILhB5AEsERCzz17
zEnx0wgHTrMEteEKlK+/Ci+udNgIPTD58X6K73nDEz0k2Ipljma+cfBQSLBm1+dO
xw5R6PvNyE2I7EpAb4tNJe82eB5KvTk+T8TYrFxEa5ZBbO7SY9nmfjBme8sisswi
RmZDdLg+SZ3Uedk13GZKKW9fNbkMMe0F6sAPSo+syhCcknV/NwJAGuuMX3pdnO+9
dqklV8l5k96N2NRICJkQueefTFTTH8UxeC3iVLwxDNLpHnKS0NZXiOD1HJ7x5Afo
lL8x8T6xKeK0i2zb/X5SiIRSDj41AIoMVkeVr0synu78uvNGv9pmzNE6E++XRlpR
++yWxo8Xm7svLgo3J6fksUvRw/nRzPReszT+7Opd1SJP0KWSJMYzfQkfLVQDFKZG
kARULTr2esml94S67d1jHP+dMpJO9+uJ9GyrxqmEMmXcySA1TUArTyXE8JhSu3DI
qw4uqMlN4hTviSWNQPAVw2u6C6ns8XNmpRhtKdd/R+torB7MZdI/kZWfwrcSrotL
i4WfBI4mGkS+mk5Xg7f75iOzGsM9TPGWh96FhGIKsB24YwY6A3d8m0cPcsTCm417
iYN440j+pTtnKYjzEF2sGw3HXZ/pPzjaOh5HBYD4aV1oHGlu1/Y=
=7R14
-----END PGP SIGNATURE-----

--iwjzjcus7qq3nulh--
