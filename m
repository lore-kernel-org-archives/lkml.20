Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793448796;
	b=UUPyBFhruUEWPmuB/duIDfgJ2NuyXviTQaP25U6+iBCsjElcH4h1glRrp+Vvs/fmvT0A
	 JrWyH63CXeEnFc+QAoj637f1tv+tX5lP+mXMItiLP1IvJLA6XfMl1Y9CX3JQY3rOdCSnp
	 N5iGDoXl/Yy0Y33Yo8DiKeYQE6zkJ9ATmZE/e5QpY3Fq+pPDggFmaS8m6z8bGwhjVa+QI
	 blfCYrKTgCqEPUZ25/imvl83KZLm94211agAs2X4bRdEDknNkElS+9dUIpCz3aCCHlHb/
	 q84l0iA+5YQhaKTdSxd8JWOCYWJvKwC9fBDHB1EvWePiZtcLVIj9r9wzi96gXgwvIhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793448796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=92RxbdIoYdks54JXgIdkuC9nu61dKUU8qHkYk11QqtA=;
	b=ZgvCI85Q1Kx5AgdnhENw+stQ9nwY32m5hJnO0JfASNkJvbbyutQaJlzvFS4VQylBDK27
	 7MyiogS4EZmc31M27Rwa4TFNe+tw5UfIFNmz4LO2QqdmSsPbRnVfT1C1K3Zxp+LO/sdgq
	 3MMfMUU//bh8IciqO0JUsrEl5/iYzA2bqg9+1Wheznt/Np6QSW7LaaCSP9oMWlk8qsLCl
	 3B+vwSM96XFm2Ba5K8lHh3QWWqVkeR2aI2NDcYVp6oyCCvf/DTQp6FY8GQY6qwvMKEeq7
	 RgCpe5Y/W3Bgg0/Q/lToC2D54h4LrCoPQ/lWyJUzBOA8RaTAtiyxtyhtwP5vYe5K0DQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9fry2D8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D0B606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24D0B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9fry2D8
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1931ff67a29so1495247c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:13:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793448795; cv=none;
        d=google.com; s=arc-20260327;
        b=eAuual4CgeHdUJPW7gu9o1O4lI/w2dfxD07IO6Tf/JjbldoonkGGvJgGAnwZlIlYnb
         0AHqAprgPZg2FNJdLiVGQt1RWGR6geOuV4r/0XgwyUROQGaaw+pDnHyyqAa+4ISMbcHS
         X5RMxyztDk7ht3RiTK4FJ3JbUJx1AO7/5ljYSbpVDj8j7zGHu0IkR9c5GtgBV9Vpb5qU
         gXIRuuORPYfS6bejUXWrMYDeGGx47rF9ZlvaQePeqWBncr8DCqLN5UcG7kZHvAVXs93c
         DAncWia8bXogjdlPGTkIgUZwrzAcD65+nwnis4lAyj8oj12H7h9NjjYgYBWrfHM83l+7
         GE9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=92RxbdIoYdks54JXgIdkuC9nu61dKUU8qHkYk11QqtA=;
        fh=a9FYkmgBrtqIEuPRM0fU+uNnbUckDpTJm9E5aWevIoo=;
        b=arE+809FPKbtRJrVBhks0TvERAWuXdJw/fGeAxbm3y5XJ3ItdtOoiWadeN2O0vXwIb
         x8/WHf8QMl+eWLtrKHzgtkgo+TOh2Ihs8IvpEpadU8TSkf1s1023UxJJnV/ZjPqwqDKN
         gYXu6D12wxkobY6BP9crwZ2DDwTUVkBVCbtMW/Vo7/04s3iHjOEXyk/3nQMNUMJxk1Cy
         lzw6LT6ElxyRX9TNzrGvFUEvY+HFC2v1kgM7/s8sGzolKZ9utUooHrGaEIl6M6y3hG71
         qdtNhHHnP23p3yT8r+/zeNkxHJJGDeoQnGqCg4UKdb5DigQ6CD8tNc+WTRFxnocZ6yZQ
         Mnuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793448795; x=1794053595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=92RxbdIoYdks54JXgIdkuC9nu61dKUU8qHkYk11QqtA=;
        b=Z9fry2D8wh2yx0cc7IMuInySHMnBgZbBvurkYrzrVLpzrJAe3y5yXU2AWQE3h/oXn2
         Ug6cpQxxeatxaF2T2Rx5HmyNsQqlx78qpKU1OcaYFQKo4r2egqAgUjH5FqGTgJVPx80a
         9J0ZBmcxfYcm/P3sM7nF4EOe23jNHXB+3If/aFu/i+rhExoDPTMO/o2B5/jbNpFDfZHD
         KpT0PzcQyaq/zKlBVODJx/ycVjE+tkMgLga/eqM/m4CJ1TNeFYYH2g4QCQ//ULX5IwFE
         SyKEoTt/xhnxQrY7nrzSJh/uXYlRAM+JuwEQNTmHF/qkM6HovV4uAd0v7b3UUVF/zDSe
         ZU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793448795; x=1794053595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92RxbdIoYdks54JXgIdkuC9nu61dKUU8qHkYk11QqtA=;
        b=Y1mwZpPHRZnvY7HF9trtSXSWroC7A9aJSNyXUS0kzHgzabf7HSCHdBqkxNxurMZDUD
         9/UVTXZFXdjO2LgoDQghKcdBjmUa1U0D0w5azUHvzheCYdGQ/XLQshXaH7ENx6z47l/F
         yiqwurK8yheYAkFqeIBBiHemtvgv14Ym7zgbITZX0LnICrLwQS0vbZt5zccTSw4rbZ6l
         ek9E6/8RXSZVyo/ut9TA+psgeFF0FkmRTln42TfpitXw25oBeQ/Ju7Z7WR4npJ4aphq3
         r+4O5YXY97YVWmOpvyDR4FSRIMnw0KgkawBkktmfQNe08hldYHZPBcAYTROGfoCZu//E
         iZMA==
X-Forwarded-Encrypted: i=1; AKwUvBwUxpzMXzrP3cbICndHjU/a9xbNQJ99BUWRZuofkuk2aBDUY3JEKsTwTQeMbr75WtFVtkQyC3E9eUyIiEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnM1H5mA/yoGJWEYB5dIi/QQZBBmHqnR8vhE0NjFfi8h7JHLZs
	ffMmfgSHbwHGRPCBZFmTKI17/RBj1vMe9J7RsxSW3D/AevRRNjb/u9rH3JSz2WvcBD4ZdGM7Lvd
	fK3/CUlNzA2M/lpKffE6Ed4bjZT68yodtcQV6
X-Gm-Gg: AYBFou0Km1d+PjAQgg/ZI3XHPYfKfEZhvvdiYYjS/5Bewq0jaPz9Mtq2PI9q5e2+uUC
	EwQirfLF/ooHWkx8GYIuZNYtBOsv8R52Kb84ij6lebCK3m2vLoSHFMoS0uMA+ADsX53ynfgSysb
	hl7i+K4ZnSP7S6JDa0hj07dg/TKMgkrELOqYouN4d8Q2pqAwpUiV0y1837wDPAGPUNb9MeydmwD
	mCGTXZiCPvdic/HDXYnHELGWoDFFUhQPRAD+hhw1mKGX0UF0KPLbKiXH6mozVbleob5mlwFN02C
	/9Eb9Y7dnESy7Bp9pptzHylEnFTjoQDOpHrk2GzdkPY3hX+KeiYCFbp0/IFqxrQLDWB00rQHNSf
	V3t877S7ebTQfydD7WYBw80q84Nzou/KKZYsU5xFO5jNRC/kjEDcMlx72+OXnQQuNT+KmtiA=
X-Received: by 2002:a05:7022:f50a:b0:149:50cb:2175 with SMTP id
 a92af1059eb24-1ac5cb1881bmr6786689c88.33.1793448795055; Sat, 31 Oct 2026
 05:13:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CABD5TJy-sp0knXTpaBhJ4+zvc42jaDFggX7jKpqUvz6tTVhoTA@mail.gmail.com>
 <CABD5TJyqC846A1=dL2F540X2rs-t2Xv=uT2SzLLtCnczCYHqeA@mail.gmail.com> <CABD5TJxfTaNfLvPEjyGwrTb9Jn-bqq0mjXjUn7Vv7dCeLD_6pQ@mail.gmail.com>
In-Reply-To: <CABD5TJxfTaNfLvPEjyGwrTb9Jn-bqq0mjXjUn7Vv7dCeLD_6pQ@mail.gmail.com>
From: Anup Keshwani <keshwani.anup@gmail.com>
Date: Sat, 31 Oct 2026 17:43:03 +0530
X-Gm-Features: AclHuK85zhkFXPh1CfiySAdqs0FwOZF4O4AGOyDP7lNgetzPcM9OWC97WmNYNNk
Message-ID: <CABD5TJzXM+XCM0fhkRCaKdr9wQcgCTvH0RhhUpfaR1X2=z9VBw@mail.gmail.com>
Subject: Re: Subject: [PATCH] ACPI: video: Add backlight=native quirk for Dell
 OptiPlex AIO 7410 35W
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, johannes.goede@oss.qualcomm.com
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, hansg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Maintainers,

I noticed that the following patch
https://patchwork.kernel.org/project/linux-acpi/patch/20261010124830.116750=
-1-chitranshmandhaniya@gmail.com/
was recently accepted. I actually submitted the identical fix a few
months ago here:
https://patchwork.kernel.org/project/linux-acpi/patch/CABD5TJy-sp0knXTpaBhJ=
4+zvc42jaDFggX7jKpqUvz6tTVhoTA@mail.gmail.com/

I just wanted to point this out so that we can ensure the history
reflects the original implementation, or perhaps I could be added as a
co-developer or 'reported by contributor'.

Thanks,
Anup

On Tue, Aug 4, 2026 at 11:21=E2=80=AFPM Anup Keshwani <keshwani.anup@gmail.=
com> wrote:
>
> Hi Rafael, len, and Hans,
>
> Resending this reminder to Hans' updated kernel.org address (apologies
> for the bounce).
> Just a gentle ping on this backlight quirk patch when you have a moment.
>
> Please let me know if any changes are needed.
>
> Thanks,
> Anup
>
> On Tue, Aug 4, 2026 at 11:10=E2=80=AFPM Anup Keshwani <keshwani.anup@gmai=
l.com> wrote:
> >
> > Hi Rafael, Len, and Hans,
> >
> > Just a gentle ping on this backlight quirk patch when you have a moment=
.
> >
> > Please let me know if any changes are needed.
> >
> > Thanks,
> > Anup
> >
> > On Tue, Jun 16, 2026 at 12:29=E2=80=AFAM Anup Keshwani <keshwani.anup@g=
mail.com> wrote:
> > >
> > > From b289e63d7f44500517dc94b7028b707616fd1dd1 Mon Sep 17 00:00:00 200=
1
> > > From: Anup Keshwani <anup.keshwani@dell.com>
> > > Date: Tue, 16 Jun 2026 02:57:11 +0530
> > > Subject: [PATCH] ACPI: video: Add backlight=3Dnative quirk for Dell O=
ptiPlex AIO
> > >  7410 35W
> > >
> > > Dell All In One (AIO) models released after 2017 may use a backlight
> > > controller board connected to a UART.
> > >
> > > In DSDT this uart port will be defined as:
> > >
> > > Name (_HID, "DELL0501")
> > > Name (_CID, EisaId ("PNP0501")
> > >
> > > Signed-off-by: Anup Keshwani <anup.keshwani@dell.com>
> > > ---
> > >  drivers/acpi/video_detect.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.=
c
> > > index 458efa4fe..10e3c1657 100644
> > > --- a/drivers/acpi/video_detect.c
> > > +++ b/drivers/acpi/video_detect.c
> > > @@ -886,6 +886,14 @@ static const struct dmi_system_id
> > > video_detect_dmi_table[] =3D {
> > >   DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 7770 AIO"),
> > >   },
> > >   },
> > > + {
> > > + .callback =3D video_detect_force_native,
> > > + /* Dell OptiPlex AIO 7410 35W */
> > > + .matches =3D {
> > > + DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > > + DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex AIO 7410 35W"),
> > > + },
> > > + },
> > >
> > >   /*
> > >   * Models which have nvidia-ec-wmi support, but should not use it.
> > > --
> > > 2.43.0
