Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3569650C2BF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539492; cv=pass; b=rvldwec8rhhmpmmB4bKBaUk73N+azpJu+K9xIXgKemeXvM+O9jS60ZSS22bDQnMAB4fq/CzPyPheQq+fY7Wl1mlVjGAr2HLasbbXMAyEpMaKSfDVqGGEQxkYEejp1C6+v1sd+dheH6QdzNcB3ewKBX/++5lqc4su+L4PT5d1eF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539492; c=relaxed/simple;
	bh=1TYJoC2Yz6/I6r6pmFu77YT+lJxpcBafXKju1XdltGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kl5I5Kp8GpWYPW5NoeVBoi908Wjq91e1wcRqPc86a04V6274pbWjRdZhQSb3zuQwI24RUgEdB7zsKj/0qtbrExz6NJZ+Umqve+mnXK+k0fUI4NdIr9+0vdKTJBr+zwumLQG/wrnOEPW0jPzOY/lQLMeKYfmfcug04QiUIMNcVjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YogrWbq4; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YogrWbq4"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-97cc20c05d3so389141241.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788539490; cv=none;
        d=google.com; s=arc-20260327;
        b=f1Lh8emaktM7DuAkRa/EiZ/EMmZKzc1zuncP/c7xvWBUSzMeIZ9pC+JuWyoSV7iM3g
         XMj4jdzm67J7VHVRwV8Ea6d16YnzmErezgf85opsuiyICME/j9A5D9rKNTSjZk4KULdZ
         LjhbnuRPgYXlvhJgeDilRXfy0LnyVelSajKDrPWf4bb4lOTM0fJR9wQa0LKS/DeWbz7r
         X95iU6HNy6hBs0li+czGB7Krn7XYpPVNZvYjYiLDmS5LDLvoDZ+41UY3kzjyQdr6gGZP
         8yHGIAgV/tva8F6M1mQVsAxSNqL1eivMg2YBHz0ovOyCiJJYvGflh/Kqxrqf1DwX0e3R
         I12w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3NKF4O2iR0V+5SNrnuau4g2PH1qtrH1bTsv5NR4P9c=;
        fh=FwxvqBr9rD4N8aNBiPR/2pgVWuAejL0zPwuczJVIfBw=;
        b=OoWzCJuCualdSpe0Tce2gZ6apL/egxpk8qsMF1FwqsGAWgCbgOf5hlFnTNitc8p5Az
         gGxNNY1Ciq6BEP6W8QGnV8JBqO54BGDT8/LCB1MCK8Rh2DoRAxPBAhrBC5BvOqMpfutK
         Cm1IE9R9vgLgaJLqT8G0BR7z4lkshZlVslXs0nrvFKJmiOl2ZMULPGyqOpL/P0UWZ8Dl
         o0/9Go9iBKSdglBYfbTXyWIIFUth1J102g19CXBD2mkAoTLSNb6U3Gf3K43mml+Py6+5
         AqsH11/PBOctx2owYUo4NBaqIOl3/BjGecb/Q+zl5aIef1KMAHNxx7vQY5Haa2pb7aon
         iBBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539490; x=1789144290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d3NKF4O2iR0V+5SNrnuau4g2PH1qtrH1bTsv5NR4P9c=;
        b=YogrWbq4jaU/JWJt4dXEgnP4/9VIlCm9/wpTMppiHEAzTSR3c6Wb71KykV7nThAtMC
         6Va5/TZP/PXWqttEeTJFXgWj3fafi1mQcCLWf0qhLfr/ttNmB6vqXicTDGDGfv3fJ0q3
         uj1i572Ivr5IayhrBUnXzkHYGOIo5qdIX5qzHff24KNWszzQZuSDn9um54vcJnSztK1H
         eSPcM2rb5MES8qXDc9IiBptkFOIF3vG1SHVAALojqZd4XxvDvY/fHWd+o4s+m84CnALG
         bK+OUlaEimI+aNxdAvkNwkQ9Ukowglnno2MB2SNJfLBbds8BLSB5eaEH9sVkkdtaydLJ
         Axiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539490; x=1789144290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3NKF4O2iR0V+5SNrnuau4g2PH1qtrH1bTsv5NR4P9c=;
        b=LzVZdde8t/Wh5HdSTtXSjzJoI29pckB7gF86QRFICSe4GG604mR3CkmYeseWX2DvNV
         2BMaNfefNy8NaLoyht5jPKxWUmQ5dWtP2mlbg6slEZJ4CS5sk+pWMEzKYWh90IApz/AT
         Pn6WI3dn0+U2HplrWMh+anSlbNXVzUaUdrjMJKtgIeO8e33sPn8Meg2fN1zF/ZTaUW4d
         Nabh9rInAsyik1kGYcXe7UAxr6Jbx2RSoRBzVkI/U6LmHK15ERd/ffm5HwfTJ98jmbVP
         CwcKBjezDWYmCT60f5shxXlqPvcg8AyDzF6cdzv5Ti1bD4T1raUBpaK9ESagdxQKeLCc
         Vutw==
X-Forwarded-Encrypted: i=1; AKwUvBx6+qmm3vz8WgEpjPQ9OSV5MXrt0JAia94LtGQgyhbP6eIRw3dgBXvyy2oOsSsfm0Jc2rWdE4K/skk42t8=@vger.kernel.org
X-Gm-Message-State: AFuF++l2l3YCLacEmfAM/Mn09PpHGG58PWdtu/LaIAbkIdmuLkJM7WWx
	jmSnIABpzG/hoURg62zvlhH005Oaq0IPyI4iHqUM56GmK3nIy+XzueSoEjzV2p6rKnClMGf01Y/
	QteIU0iH05qgEWoARsBGsRBG7DcYyHc8=
X-Gm-Gg: AYBFou08Bj2Bj4AESepH7DisvBR4rS9I6BPEvtFdREEMabtJ6+5sLVZoi1HMbcStSEW
	tLrdhfiQiXdGfAJCr56YBnABxO7bac/Ezq+5tkF/p8W+TRBCEnIqPK+jbpZBS/hYhpcIWBcxFzc
	WFyyogMe8bDqPdp7Vk/ei8ZBSNv12xHge2s2UZ6Zzhf3RthGtAkF1v4PLyrAQoZzzPE8uDFqh6Z
	XqPRcJMIoG/5vFv5Va7UGgroRrG1DL8WVxWjgv7JVwMGNeCsQokdsBoxVwMCRAYpZAdpsiwFGtJ
	hTC+fmsQFqUmsV9OrxoEy5atomOuYAhDowSLfGCsv3zppm6DIukznaZLJokXaVII4fmjz03w/hk
	FNcWUo5vGwNh7o84wldQkddCHRf2Un8tMM9UfNTKXy7JZMFk+6lsSv/f4Bs8TT4BY31Atfy2Gpd
	hsYEUjNQpnWX0T8tagwgUkSx17/yOOJgm/I8szZ33xFXyRFsgOmw==
X-Received: by 2002:a05:6102:5e86:b0:78a:8a0:7116 with SMTP id
 ada2fe7eead31-78a4a6f61c1mr2282968137.6.1788539489982; Fri, 04 Sep 2026
 09:31:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
 <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com>
 <87se3p13jy.fsf@bootlin.com> <CADvTj4oW8Hxv_b5vWM5pbeB3wEO-WoqhLwyinCTFPNR6wTHYmQ@mail.gmail.com>
 <878q5h11gu.fsf@bootlin.com>
In-Reply-To: <878q5h11gu.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Sep 2026 12:31:19 -0400
X-Gm-Features: AcwNN1V5YDZSFNMjnzJoP1G8O-i3NIxVjKyBABCYlVfSDwIJgBSeFv9BnhDuMNw
Message-ID: <CADvTj4o4Rwcmy7ByuBcpcPkcXctvgB8Tuda2_7UV1v=vx7JwRw@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: support randomized OOB formats
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 9:27=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 04/09/2026 at 11:17:46 -04, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > On Fri, Sep 4, 2026 at 8:42=E2=80=AFAM Miquel Raynal <miquel.raynal@boo=
tlin.com> wrote:
> >>
> >> On 10/08/2026 at 17:04:50 -06, James Hilliard <james.hilliard1@gmail.c=
om> wrote:
> >>
> >> > The controller randomizer covers the bad block marker along with the
> >> > rest of the OOB data. The driver currently compensates the marker by=
tes
> >> > before writes and after reads so that they remain plain on flash.
> >> >
> >> > Allwinner NAND firmware instead stores the marker through the
> >> > randomizer. Media using that format appears to contain bad blocks un=
less
> >> > the randomizer is enabled while reading the marker.
> >> >
> >> > Honor the allwinner,randomized-oob property by unconditionally enabl=
ing
> >> > page scrambling and leaving the marker in the randomizer data stream=
.
> >> > Keep the existing plain marker behavior when the property is absent.
> >> > This changes marker handling on all supported controllers; the H6/H6=
16
> >> > protected user-data placement is handled separately.
> >>
> >> But I think the reason why this has never been done is because it just
> >> breaks raw accesses, including the BBT reads. I don't think this is
> >> handled, is it?
> >
> > From my understanding raw access bypasses randomization entirely.
>
> yes, so the implementation you propose is invalid, raw reads shall
> show the BBM. And also, when accessing a BBT, it is made in raw mode,
> without randomization, and hence totally fail. This cannot fly!

I may be misunderstanding which raw and BBT access paths are at issue,
so I would like to clarify the expected semantics.

The allwinner,randomized-oob property does not alter the per-operation
rule controlling the randomizer. MTD_OPS_RAW still leaves the randomizer
disabled, while normal ECC operations enable it. The property does set
NAND_NEED_SCRAMBLING, ensuring that normal accesses use the randomizer
when the NAND does not already set that flag.

The property instead selects the Allwinner firmware's physical
normal-page OOB representation. It leaves the BBM in the randomizer data
stream and, on H6/H616, selects the firmware's protected-user-data
placement. It does not change the randomizer algorithm or seeds, nor
does it enable the randomizer during raw accesses.

With NAND_NEED_SCRAMBLING set, I understand the current mainline sunxi
behavior as follows:

ops.mode   fd mode  ECC  rand  main data       OOB with -o      nanddump
---------  -------  ---  ----  --------------  ---------------  --------
PLACE_OOB  NORMAL   on   on    corrected and   de-randomized    -o
                                de-randomized   logical OOB
PLACE_OOB  RAW      on   on    corrected and   de-randomized    unavailable
                                de-randomized   logical OOB
RAW        NORMAL   off  off   physical bytes  physical OOB     unavailable
RAW        RAW      off  off   physical bytes  physical OOB     -n -o

OOB data is returned only when the caller supplies an OOB buffer. For
nanddump, this is selected by -o. For MEMREAD/MEMWRITE, ops.mode
overrides the file mode. Stock nanddump exposes only the two diagonal
cases:

nanddump --bb=3Ddumpbad -o /dev/mtdX
nanddump -n --bb=3Ddumpbad -o /dev/mtdX

The first uses the normal ECC/randomizer path and returns corrected,
de-randomized main data followed by de-randomized OOB. The second sets
MTD_FILE_MODE_RAW and reaches the raw callbacks with both ECC and the
randomizer disabled, returning the physical main and OOB bytes.

In current mainline, that physical OOB contains a plain BBM because the
normal write path compensates the marker before hardware randomization.
The normal read path reverses that compensation. With
allwinner,randomized-oob, the compensation is omitted, so a raw read
remains physical but returns the BBM in its randomized on-flash form.
A normal read returns the logical BBM with either representation.

I do not see the current BBT access paths selecting MTD_OPS_RAW:

- nand_block_bad() calls chip->ecc.read_oob();
- scan_block_fast() and scan_read_oob() use MTD_OPS_PLACE_OOB; and
- read_bbt() uses an ordinary mtd_read().

For sunxi, ecc.read_oob calls ecc.read_page, which enables both ECC and
the randomizer when NAND_NEED_SCRAMBLING is set. The internal BBM and
BBT paths therefore appear to receive the decoded marker rather than
the physical randomized bytes.

Could you clarify which BBT path performs an MTD_OPS_RAW access, or
whether I am overlooking another path?

Also, when you say that raw reads must show the BBM, does that mean the
BBM must always be stored plain on flash, or may the raw interface
normalize just the BBM while otherwise returning physical data? If raw
access must remain entirely physical and the BBM must simultaneously be
directly recognizable, does that mean the Allwinner firmware's
randomized-BBM representation cannot be supported through the existing
raw NAND interface?

>
