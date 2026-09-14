Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC05739182C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419064; cv=none; b=pBeJTvOf1oaAOwqFwiH2oECFbyknDhkaMUwvYIPFaVD+Ad2IqsBxsbgfbiDd4m28LxNPExeud9FoDVBOKaNDD1zHfx+H0qukO52dsWDuOZaqQojVLePl5Gc/fy5YB3jQSn1KKztxOBxXNGRRYewSstYIkHd/2yYUug8toVuuhJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419064; c=relaxed/simple;
	bh=11EFCEUdQDWtb102v/7tbaZTYEHCfsPZlEHypjHOnrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZCG5KI+JqeSp/IEt/Bj6GjLZ47SxnbrZEGAdnie8Jf67g8+K90SQ0ycp0CMYMZ6g0MIXcJqzB1T9La+GzAYerMrpJlv3dsvif/VolnacI9TPbxRKvL8yMDqi0MuCYQMrQbwaqgWny+5udE44e6LJYvFxkYeHyBE2EbdJpMH5dEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZIL4J9yE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIL4J9yE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E9E1F00899
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789419063;
	bh=+b36E7wk7hE4cmoh1WHX+5JalEXD4393/J6pR2166W8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZIL4J9yEBc3Z5M4eHJF9WWJIuXe8mJe1LzTr1qPfd0tz8PONxVjYeg2LhFp5HVC2T
	 bh/Zf6/lFFv7zhHzJtJYVe1WW8RkLcopDJuoCtLexx+NaAKA1ZRyIoLihPjK6xGpHq
	 NcuLRwGVr31CW0Mr9oo91y7sip76nOVLSWj1KWx4TRhQWIRcHXxZh1Fe2ohHDde+ir
	 vBxWPCPEaq7lseSyz9CRXvIdzLNWaKTM9f++SccuFV7yXxgYwP2Lu6DV+i6oXBOGOL
	 eMk078k91EOFwpwPA4qJWGctsjRPCCDg11FoTzEFXymKE9Z5wCEm+EdT4gA9aQ4g/I
	 SRs++rwLf/1IQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b4a9994c20so4521476e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:51:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBywgD9+vg+eTfHTnO1TRKNpBFz2RXxNB9oHKiTycEwDXXqxDYSQfMByKtopZ1gxtlwJGXy06UGyMWcl8D0=@vger.kernel.org
X-Gm-Message-State: AFuF++mDis5/CEABjAFD+gMAoZg5U1g356jte7wIDYS/hugp0Y2Snmg6
	IF1XfChqdxegchL42aEf/4Vui+/0bKRGXcIk7DQD8mP/SKc8nQwSFuGllPyN3FB94sfcAElDH7g
	PrCgxbRMP2zfATBT1REuDIb4XdNpV34s=
X-Received: by 2002:a05:6512:3ba5:b0:5b6:1a7c:59e4 with SMTP id
 2adb3069b0e04-5b8ae6ad624mr1013808e87.62.1789419061687; Mon, 14 Sep 2026
 13:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
 <20260914-ux500-dts-snowball-regulator-v3-9-7f92a365628e@kernel.org> <aqfzURhgpX55Obfs@sirena.co.uk>
In-Reply-To: <aqfzURhgpX55Obfs@sirena.co.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 22:50:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLm1mLTVeM1p==_j5qZydJ-WmznQWc=uMT_ii1w_-UM0SA@mail.gmail.com>
X-Gm-Features: AcwNN1VJXSxJha7KEWvred5vtzBlknplZwKomIwbCJA-rqhCg2mTVlR0yNImmo4
Message-ID: <CAD++jLm1mLTVeM1p==_j5qZydJ-WmznQWc=uMT_ii1w_-UM0SA@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] regulator: ab8500: Preserve OTP-enabled buck regulators
To: Mark Brown <broonie@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>, 
	Axel Lin <axel.lin@ingics.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 3:15=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:

> > +     /*
> > +      * The SMPS enable state is selected by OTP.  An enabled rail may
> > +      * supply discrete board components which are not represented as
> > +      * regulator consumers, so keep it out of the unused-regulator sw=
eep.
> > +      */
> > +     rdev->constraints->boot_on =3D true;
> > +     rdev->constraints->always_on =3D true;
> > +     rdev->constraints->valid_ops_mask &=3D ~REGULATOR_CHANGE_STATUS;
>
> This unconditionally overrides machine constraints, the general idea is
> that we should always trust machine constraints.  For this particular
> driver it probably doesn't matter so much but it's a bad example and we
> really should update the DT too, and if we're going to enforce in kernel
> then warn about doing so.

I was actually a bit back and forth about that in my head.

My thinking was along the lines that DT is hardware description
but the OTP settings is also a kind of hardware description
so which one should win.

I'll probably just put the expected state into the DT and
add some warning print if this differs from the OTP,
should be sufficient, there may be cases where people
want to force things off in the DT for example.

Yours,
Linus Walleij
