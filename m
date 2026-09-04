Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4D93B71DC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540788; cv=pass; b=oTaH8R8x1u0L/0a1oRVpADnRrwaIGUoFeqUEgaHCmYzGDvn7VuBmsWoZNU6AHkjrQAljMbXTpQ8TXsCuK4NxDLIvjZYOfwh1nDm+OEk+dg0ddfhf/o6i2PLRU8M8TACgX0//smrMQFHsnqdK40tbrmCTOuRfprH48NptOGYWYAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540788; c=relaxed/simple;
	bh=nCqEeX/YmPXgBfiXFWn13hZN8T7Z+lPuAqTre4JIEAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CW+Ji/f54I7We+UeXs5TYfS1Ovp+mqi7spVTbr5VLU1lBU8bATyblEaPQU9esLiqEj3azJBZR1M5IDULa5j/WOYV+kR9jKNZ0Nzsrw0c0z83IzuN49FkE8+zCdyiQUTf0KD2LN5u/z+S2YVqYBiWCWQJU/25hPkdLlF0FQK3HW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1ZP/d1W; arc=pass smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1ZP/d1W"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-78a338fe106so1786745137.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788540785; cv=none;
        d=google.com; s=arc-20260327;
        b=guhGK+3zpYVajYCEN0bxS7pDceOQU+fTviaeJzTzb5jsLu7wddwqQz37Xi5zAhu+XT
         h19I4dDTK9hvpHPHmLE+i7c1eN3TBHOcYOnKMLW+ET1e5FONUYMyBmXCFmATBBSjcPqf
         y/LLIMfbtn2rD6uFk8UaBmb0eJBI+mjc+Io+4TXBe8SMKbTzIhEr0fwhFFhOuhZQbZ8w
         rn7xdlaqiz3DBbh5jayu3oXvQMwxnZI0WkqRDPG2UkjOsSWdnvJWidZk3qfwOVAgtbx/
         PpNvtkpzu7gyNTtFgMBRBbI/JkDVKfJZFt8qV9CujDL7J3RhFetCjvsUUJFjTWuuzBD3
         XZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ien2o60ZIi4QpF5qZ3s+1MoomCrROw/TLgJB8j1A6bc=;
        fh=TnfsUGud7YLoO2PCI7q7ytltG0ieTBuxYBtyaxu127w=;
        b=n611pHuVa/TTkUw80pFt/4+mh/GO2OvH2L4SvjBDCDYQ5+oyofKpxlta5bsQhdEtYB
         nz9hF7JoYsg+LABs+n6I0mLED27NM8LqUP8jVy8LHZrZgCoIoZ4UoCUNySTiNxXIIG4w
         jZdd+ljt2Wbhwz2Btt4/GrxeiSkjlMtTUR7QCo0pDTh5ZesTkY6pA9ZnVCio9Yt3hSeo
         9kxzVXuJ3xX/dH1JqIjSUxxV0RaN15bsn9IUEewV7NJ4yoyTc0sDbgQbanOLfXEOZKCO
         pkYYUkG1RjMVxH/Viv4v+5XoSr3yx98iYfirH+cnvwpes+RzuTev3zCveQ5ry2Us4YZ0
         rE7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788540785; x=1789145585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ien2o60ZIi4QpF5qZ3s+1MoomCrROw/TLgJB8j1A6bc=;
        b=n1ZP/d1WnaHoZ63RS8LAuO0U5ornBPgSzw5TgTzHXmH0pJT1AiqPQU8u5k9t5Mclok
         SpNWq3PVzp0m3Hoo6YjVEPOcPBDnU/QELvDWiVUUhEq3Bu30dS0EmwAFNVCfRy+t181D
         HRPOcLCYJIYl9Gwd8Wgt13mQBZO/1S3AW+mAQ61tHGZ6GTSxfStoEfc54HDeLQKIlNdl
         +uo5fMDKxevqZ05nUYEcmi/2lX3jKqQt1VlhSqrbJoWexOqmwWH4+KZOGeueisJVCN5U
         kTwkxwl9H6K0cKYIGMTYhoyUGdcf/JBITTNrNKMONU2eD7k2Aej9r/2ivuKsZD3SWOtP
         ioEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540785; x=1789145585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ien2o60ZIi4QpF5qZ3s+1MoomCrROw/TLgJB8j1A6bc=;
        b=Om3hm/Ha3yDKGXMVwykAj1U0A3q7Z6CiTM6/7TsWSEd1ZH5X8gprNguhkM8upG+9Kh
         oucduWqlTnO+84ZQ1wEsxiWMKfsLtKZNWkqAQ9JngMsnwwDBGDi0XNLE+9XV5Qhn+xKC
         O6Y2UZuoEw91+aWo+PcKHGMhYe35NuFdJ844Z8SB4gw2/8dub3uNCZSGVK1zp2sU/bKg
         dNI6Z85r7uFCDjHKXF6yPsKOqZKMhQ5wdGW+G1PFdU+2ZldmNnuJUFPkOvBlZ/pVYTll
         Hk9uttmtFCi6edNf2N0xS7OxiatWzumydbKCQFcf5I8PnGx2jaIQGwKN3QZvAqhCeurs
         OjPA==
X-Forwarded-Encrypted: i=1; AKwUvBwBNJAwYHpAdp4NoSCZruZx3UlwwdwPHxCQhjC90QVghkdoGPYymMCuKFBhqyEWMCNind45AliFBrR+4UI=@vger.kernel.org
X-Gm-Message-State: AFuF++kylaLK7SsVw8EKyt/sES860mS+Fs6wdrlufP7tNbweCFLOSEdo
	VTkzNipFJd3OkZ+9+4yPU2idrbhlI89asf2uNO/eW0261Vqo/nHNCPDnt4VpsMAd45FrdjqFAcM
	A1Q9LUC7Uss29rvgQ/Dcw1wzwOMTzvKA=
X-Gm-Gg: AYBFou24Y45Zm1RCHWnoL0NmDi/xeL7+BVM87iEb8Hkw8IXkPr6KvAGQaAPuj/dITNg
	Bdj2rP8cf8M2JQE1G4Yi0bZwFhOS1MoNxU+otJ/FCjNU4Nr/XHIz8u4cm5kmFBkPESuKynwkoDb
	L9iw07/0MgvhP1AEcKTjUglYzIqESqRZyh+4uzZSBcY4/N6qO2jm7qDMhgs6Hq9PSfl5sJ4s7YR
	fYe9CYNmWoy80X7Dux+UUssjM8Sa41RdG2PUmU4vhosK2YFvKLwx99CBJRg2T4uhuGrM4y+Pv/q
	5MU/z+/JARLDFd2Eebt6gYjCE1RTuaPHV0Wlx0STYeA+cOOybwSvmqcUE70j6Mxboknbk4ZX2su
	nWQTiEx2SSkrCG4QY0uNhh6ELoFLSt/qOt3Sea1Li8j7KyI65aTgXP62sZ6zHpjlR+/WZh1+ymS
	CmTbavNFcxmzqsdkpX+pK3AksqZ1KjMVQ1GZ/tEw==
X-Received: by 2002:a05:6102:4b01:b0:786:a11e:484d with SMTP id
 ada2fe7eead31-78a4a86b686mr1500572137.6.1788540780511; Fri, 04 Sep 2026
 09:53:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811060651.227431-1-james.hilliard1@gmail.com> <87ecf911jr.fsf@bootlin.com>
In-Reply-To: <87ecf911jr.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Sep 2026 12:52:49 -0400
X-Gm-Features: AcwNN1VzoX6Wx03j6h-GsWo7X9YwKmv-DqDt9ZWJFHiKu2jY-uxo82M8zbL9kdI
Message-ID: <CADvTj4p3kFN+4NeeouXscPrnHTWKbauVcYXnh2uW1OGHUL_sbQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: sunxi: reject invalid ECC step sizes
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	stable@vger.kernel.org, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Richard Genoud <richard.genoud@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Boris Brezillon <bbrezillon@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 9:25=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 11/08/2026 at 00:06:48 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > ECC maximization forces a 1024-byte ECC step and divides the
> > available OOB bytes by the number of steps. A NAND with a smaller
> > page therefore produces zero steps and a division by zero.
>
> No, steps cannot be < 1. If they are, it's a bug that must be fixed.

The zero step count is created by the Sunxi maximization path itself.
sunxi_nand_hw_ecc_ctrl_init() unconditionally sets ecc->size to 1024,
including for a 512-byte-page NAND, before calculating nsectors.

The controller attach callback runs before nand_scan_tail(), so this
division happens before the generic ECC handling can reject the
configuration or fall back to software ECC.

For this case, would you expect the Sunxi maximization path to retain a
512-byte ECC step on 512-byte-page NANDs, rather than selecting 1024 and
then validating the resulting step count?

> > An explicitly configured ECC step which is larger than, or does not
> > divide, the page also produces an unusable step count before the NAND
> > core can diagnose the configuration.
> >
> > Validate the step size at both points where the driver derives the
> > number of sectors and reject invalid geometries.
> >
> > Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/mtd/nand/raw/sunxi_nand.c | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/s=
unxi_nand.c
> > index 45ccbce91551..ad314c0e30b2 100644
> > --- a/drivers/mtd/nand/raw/sunxi_nand.c
> > +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> > @@ -2032,6 +2032,15 @@ static void sunxi_nand_detach_chip(struct nand_c=
hip *nand)
> >       sunxi_nand->user_data_bytes =3D NULL;
> >  }
> >
> > +static int sunxi_nfc_ecc_steps(struct mtd_info *mtd, unsigned int step=
_size)
> > +{
> > +     if (!step_size || mtd->writesize < step_size ||
> > +         mtd->writesize % step_size)
>
> I don't get it, mtd->writesize < step_size is conceptually
> impossible. If that happens, it must be fixed earlier than that.

An explicitly configured step reaches the controller attach callback
after the NAND geometry has been detected but before nand_scan_tail().
The Sunxi binding permits step sizes of 512 and 1024 without constraining
them against the detected page size.

Could you clarify where you expect this invariant to be established:
in the raw NAND core before ->attach_chip(), or in the Sunxi driver when
it selects or consumes the ECC configuration?

> > +             return -EINVAL;
> > +
> > +     return mtd->writesize / step_size;
> > +}
> > +
> >  static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32=
_t oobsize,
> >                                       int ecc_bytes, int nsectors)
> >  {
>
> Thanks,
> Miqu=C3=A8l
