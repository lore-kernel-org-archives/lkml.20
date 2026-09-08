Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0235501F44
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861769; cv=none; b=iamxOGAmRtEM3x2Y66plfxcpkbp/2/iccDAbp/F7bHYHhdQ7Ci28Rf9hrcQwnn5ykkVj2VCzOPo74qdamGucuDFygC0bONd0pcjC9+zZV3glSWPcoI5Rlll/kcLJXFobyHXaGbYghzD4WvVufIQ4R+U84NL9ifhwVRZvS5NNcfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861769; c=relaxed/simple;
	bh=mfZ5aUfZ9W7xA/f9RA7WBvF1P6krtGyAok4kokbQcYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edbkgQilylyoYw27WdxqNjv9QrfL+Msc4RJKQLAT9lwcNY//6D9qAAUQnVu++DEzj565GxVbf7dOgjX/z7RM1H3uW0Xvw1eCgymcn3xHikEVX6yRblNhDKkDJ8mgRWVpwsUMSrMtvHASdu0SrQAfmtQ2uRm/JwSZ7xd/ByiDIes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ozlXgBMz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ozlXgBMz"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48436216a98so3050317f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788861765; x=1789466565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mfZ5aUfZ9W7xA/f9RA7WBvF1P6krtGyAok4kokbQcYw=;
        b=ozlXgBMzhZDIRvnYUMTOGzJY7y8NuWU+w9Rw6Pf+nuWmSm4iLJVDjPgz76HvaOTSCY
         wBt7Vf5Y11OQRgj+6JXU1zDJyL+uPHu/chtd0y2YIWvDiLI6Q0MQtZU7FWliP8oB+M1k
         bRm4FXLN0FwqEbl/HHWtmUwtRHIxs2hQyhKiuN0G67nTRuLp0gb8pIYlredUGsBfTYjX
         TzM5ELzx9lQ+8lfq6uPJVZzJTqR7wlRxdCel0/9WHnNQUOTdoyBMm7XximM+cTP9vvEf
         r5g7I8JxZ2Fhyg07zpIpvqqljB2p9i6rsT0AOc4540ZCsLxv7xPhI7VMDZdeAn7vbOFW
         2hPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861765; x=1789466565;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfZ5aUfZ9W7xA/f9RA7WBvF1P6krtGyAok4kokbQcYw=;
        b=D19VqqbWrK9pNEQbFd8fbAl/2IFEsv3R0KkU76b2qB1Vvprv/g54Yp6AhIZff7sjqq
         8O+AH59zJLLFv9Js/w3vayf9zVSZDZ+/4TrqvYjL0qoBh+nRe4eg5LvzXcWFBA1AXyw7
         dkbCHPgy13SNI9rM4vNonC2hzC/63F8nU90ax6pE6pYmJIjwmxFDztCpRB3wKk2CKobk
         9YQRM/gDQiGRT7yiw1GQTH1fuokUiMM6Sa3ipSG0UlqanoAfX6xDJkVLhnOuXzEEc6Yv
         ynKmYzbZnGZhNlmAnPL2Jmk/fMUthSkiCKHbcxlYYa7QD5a8JjR2J95zw1hn9Kj2wcM7
         3GNg==
X-Forwarded-Encrypted: i=1; AKwUvBzWM1HFrzZ7Q1+ujnTE3pmcEeqKwbN2dfAHxR5Q2an+bgkn7Q2BWE5uOABv1QAYGoS1UZD5DSj6+Qswn8s=@vger.kernel.org
X-Gm-Message-State: AFuF++lhT2/CdFhWv1NqF6f/jv9FVvw8+6qyHu9F0UiOP6jAvZzwdx0l
	9sTvER0QUAapE8+IxZNayoa8eyBQL2eYCWDYwmUSkq2W1Rtd9BWIRMeMM4uycS+VxNE=
X-Gm-Gg: AYBFou2Bcd8mS9IysSfu4DfBWQhDR9BSOH1vMO6HMXd5kSi9R+0x1wngu5/PPCEy6uV
	yDzYe7F1Vnu9xOqkoTmz9ULFkMpsHZUPyXcgKAascViXwACd8ws6Wa0SZDXPnqwY+IlADxqQLo9
	XFwmrFCfrQrZGiuwC11ga8XlvUX+7+qxYiEjATzOTUA/kDICxFlaHlUTQ0D5D2wj0YOxvHgpaii
	zB98cENmYocqeNWfIboNRpe+abhROOpIARDrCjhEyWegT703biJN7gpbm2G34olEfLItpE78xf4
	MhMu30a/cUHFpBMiGV61b6cYoaR1XaeltwVbv1ROnACtYmOFXz/XHqrGozbh58hld6QQQbwiBGR
	Zr9GzuWBH5g3wE0Lh07ldUfgwoyETFHOYKnmK53+1vTHPqTmHg9pWKXMqXPdA5fL9WRZt8ZoD9j
	bHTFQPGZ+YcLyyjkqAvr7Wof+0zL3LTIu7IU0mDy7wYAAcoDO1pJcbexbhClch1lr0QSjNEGiQe
	6IoH64TMdeju8ptppeUT/XoQ61Cv9Tf3GVvjmN6WWwG/7cGQ0I=
X-Received: by 2002:a05:6000:1843:b0:485:8c17:975f with SMTP id ffacd0b85a97d-4858c1798damr27182312f8f.33.1788861764527;
        Tue, 08 Sep 2026 03:02:44 -0700 (PDT)
Received: from localhost (p200300f65f19a904516ed84e8e7b3ca0.dip0.t-ipconnect.de. [2003:f6:5f19:a904:516e:d84e:8e7b:3ca0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-485883a9234sm34875344f8f.14.2026.09.08.03.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:02:43 -0700 (PDT)
Date: Tue, 8 Sep 2026 12:02:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Laight <david.laight.linux@gmail.com>, linux-iio@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>, 
	Ingo Molnar <mingo@redhat.com>, Thomas Gleinxer <tglx@linutronix.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, rodrigo.alencar@analog.com
Subject: Re: [PATCH 0/2] x86: Use "er" asm constriant for add/sub
Message-ID: <ap_cLN807bC56OBU@monoceros>
References: <20260803094702.3852-1-david.laight.linux@gmail.com>
 <11o7545n-7569-3p9r-1q77-8nor8513r6n1@syhkavp.arg>
 <20260803163955.627bdd3f@pumpkin>
 <20260823233536.30b984ed@jic23-huawei>
 <20260901175101.1e059ac8@jic23-huawei>
 <20260907231444.7fa2d116@jic23-huawei>
 <20260908033216.GAap-BwAmBqoVDUbMK@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="egsce43zaasbu3cd"
Content-Disposition: inline
In-Reply-To: <20260908033216.GAap-BwAmBqoVDUbMK@fat_crate.local>


--egsce43zaasbu3cd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] x86: Use "er" asm constriant for add/sub
MIME-Version: 1.0

On Mon, Sep 07, 2026 at 08:32:16PM -0700, Borislav Petkov wrote:
> On Mon, Sep 07, 2026 at 11:14:44PM +0100, Jonathan Cameron wrote:
> > I went ahead and picked these up on
> > https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git ib-iio-x8=
6-asm-fix-7.3
> > and merged that into the main IIO branch. I want to give plenty of time=
 in next
> > for the driver that was relying on them.
> >=20
> > Currently this is all in my testing branch but I'll push that out as a =
non rebasing
> > (ideally) branch a bit later in the week.
>=20
> No, this is not how this works. x86 changes go through tip and if you nee=
d an
> immutable branch, we can give you a tag.

While x86 usually goes through tip and none of the x86 maintainers
commented before Jonathan applied, it got positive feedback from hpa and
peterz a month ago and iio depends on it.

So I suggest to do the practical thing and pull Jonathan's branch into
tip. Technically that doesn't make a difference (apart from maybe branch
vs tag preferences).

Best regards
Uwe

--egsce43zaasbu3cd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqf3UAACgkQj4D7WH0S
/k6MzggApFuYnn+6K6MhbYPlYLbjpXHFLcOb0VRFR3FjSzeReqAmbonX1pAQ4+kY
QGkn6sZsZfmnZTATEc/2X1nK1PMlDg0cpqsqdhwJTbBVgC031QNORUSli98gnCqE
XU+P/bSIn2vUrJ51MJeUklZ3ipkxT3QV2gzO0dz7XklhN2RKvzQ8Y2Rbstgh7d6S
MND1/4xiz6mtKtvz2Uj51zZSawsayuE3ltPw+R9OP0+wCmo9DmZPth9yhkBgkhIQ
dOxJ0qSOOa2Bhq7lH+E61EFbGoCcGaFFNl8HGqb9U4E0nmFfA+s+feiyHAZUxkGI
Qj4Iu9/WCRXCl2RYNi2cNHavqBHpyw==
=lNlM
-----END PGP SIGNATURE-----

--egsce43zaasbu3cd--
