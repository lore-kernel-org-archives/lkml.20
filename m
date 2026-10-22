Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676368;
	b=W05jePVBuSNfG5+A8oaeI2Nm7J0EbfbZVzrWsgS72xTmyg4cD48K69COjd2qShGoSZv3
	 gbBI5Yx1RqIqB10pr/yRpK8UwT/JRPYiwsmkjmzcTtKb6VwSRR5dCb1ZSCCN1reSKHVB7
	 ZtqI3bm0mquGTs5itgmxS656LUM7HvwkIg2tr2EmcRGI5rcJ7BhdSWT3T+qUrveiURfWm
	 dDMKAGfDYvMXs+D6GzeShRjoQxJCKAuQLFDy5HqVEprtZTe7QTOnKW+EK6Khhd9iOxN7E
	 zJHnTbj55XnMUeY+/mXUK0fD7tVcBiKGfRQgreHtKyWt5L7twaohJpxrjzksgei5OTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676368;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:User-Agent:MIME-Version:
	 X-SRS-Rewrite;
	bh=lcGGnfrOaLIeKXUiqtJ1JwaG4WdQ9S7ok9Vw+27wWiw=;
	b=VG+kqevKWOKweqky4k7v/Fi+kn8zYBwuHnyn2c7HaKG668Y6baD9N6kSbAnKTSfA03g6
	 Ak098J1SQ9Tdaj1CpTY7bIvC7DLYTmw5LYRfoZBzhd/A+F98MtWi8eEe2dejmw8eIudwE
	 QTXIc/wneC4lzRnj7Uu1s8wdeWIP0VVNg/VngD6Cy0aofgbT6DowPzHraar9FlVP7+1+B
	 fjNLgoNDwfJtaBKbOCUJ4DjWkmQcpyoKHUMclKgFZRQYZJILL2CkUghOgWSBNSxsb8AlK
	 c38CbaHG4v43gjz20AD+zAJS5j9VzcFN6tnZ4mJmdofPTlhKZp1jiP2BdM7cgI9IpVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=none smtp.mailfrom=casper.srs.infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=mnv2x31M;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A97B606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A97B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=mnv2x31M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lcGGnfrOaLIeKXUiqtJ1JwaG4WdQ9S7ok9Vw+27wWiw=; b=mnv2x31M47jaqIJ4fxcQcKG5do
	LjpiDlOuS0JtFdJpmPxBHKYQehkEsCz5vYnxsK7Ehi+WS23ArSxQ3Q6aYdApx7uiFdTKUsezVzxc/
	IRwcWuAFe2cZmS3xPoEeM04awzd41n5fK8/vLm0gvvYKuDtAG7GwGB6Uy251VmWqLieFODj9R5OJ8
	QeaMQANARrk3x8rL9n0QwMLeYT6jSWOtujY8Ln1KhtlifDDfGzCdegn/d+eTMQ3AoP8fIivtM6hKW
	sLSfzMxi3GnNwOqS06L7EFOc6TAt9rrLAGSrwcH8lUTXN9UJMDT1WOPYUO3oATyOE51CkHzJd7Ylh
	nOcF02eg==;
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=freeip.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJt0u-00000001YUP-0gbF;
	Thu, 22 Oct 2026 13:39:24 +0000
Message-ID: <16216028b040ea38556bb59b3a8ce6e588ac5b38.camel@infradead.org>
Subject: Re: [PATCH 1/5] timekeeping: Allow tick_length changes to apply
 mid-tick
From: David Woodhouse <dwmw2@infradead.org>
To: John Stultz <jstultz@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Miroslav Lichvar <mlichvar@redhat.com>, Rodolfo Giometti
 <giometti@enneenne.com>, Ryan Luu <rluu@amazon.com>,  Julien Ridoux
 <ridouxj@amazon.com>, linux-kernel@vger.kernel.org
Date: Thu, 22 Oct 2026 14:39:23 +0100
In-Reply-To: <CANDhNCqY+RRCCXV+HfMNKf5Rmco7Y+kZ0RHv5sYC2dnw2U+V=A@mail.gmail.com>
References: <20261001202134.33929-1-dwmw2@infradead.org>
	 <20261001202134.33929-2-dwmw2@infradead.org>
	 <CANDhNCqY+RRCCXV+HfMNKf5Rmco7Y+kZ0RHv5sYC2dnw2U+V=A@mail.gmail.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-mhyjlgZxAtic6jlMa3m7"
User-Agent: Evolution 3.62.0-0ubuntu1~ppa1~24.04 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-mhyjlgZxAtic6jlMa3m7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-10-21 at 12:01 -0700, John Stultz wrote:
> On Thu, Oct 1, 2026 at 1:21=E2=80=AFPM David Woodhouse <dwmw2@infradead.o=
rg> wrote:
> >=20
> > From: David Woodhouse <dwmw@amazon.co.uk>
> >=20
> > When the NTP tick length changes, timekeeping_apply_adjustment() applie=
s
> > the accounting for the new rate to ntp_error retrospectively for the
> > partial tick which is currently in progress. So the ideal line of the
> > clock conceptually changes from the moment of cycle_last (which can be
> > almost a full tick ago), and ntp_error grows to show the difference
> > between that and what userspace actually saw already.
> >=20
> > This can lead to a significant value (10s of microseconds) landing in
> > ntp_error which can take *days* to drain through the natural mult =C2=
=B11
> > dithering.
> >=20
> > The slow-draining ntp_error then applies a consistent bias to that =C2=
=B11
> > dithering, meaning that the precision of the effective frequency
> > requested by userspace is limited to integer 'mult' values, since the
> > dithering is no longer effective to achieve the fractional parts.
> >=20
> > Fix this by allowing the rate change to be conceptually applied at
> > 'offset' into the partial tick, rather than the start of the tick.
> > This means that the amount of delta which gets accumulated into
> > ntp_error remains low.
> >=20
> > Rather than factoring this into timekeeping_apply_adjustment() which
> > already makes my eyes bleed, pre-correct it when the rate changes, to
> > adjust the 'intended' clock position according to the delta between
> > old and new tick lengths (but leaving skew as it should be).
> >=20
> > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > Assisted-by: LLM
> > ---
> > =C2=A0kernel/time/timekeeping.c | 17 +++++++++++++++++
> > =C2=A01 file changed, 17 insertions(+)
> >=20
> > diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
> > index ea2e6e55f37b..e2f7e28dc16e 100644
> > --- a/kernel/time/timekeeping.c
> > +++ b/kernel/time/timekeeping.c
> > @@ -2444,6 +2444,8 @@ static void timekeeping_adjust(struct timekeeper =
*tk, s64 offset)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* Revert to the base mult rate. */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mult =3D tk->tkr_mono.mult - tk->ntp_err_mult;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 u64 old_ntp_tick =3D tk->ntp_tick;
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 tk->ntp_tick =3D ntp_tl;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 tk->skew_delta =3D skew;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /*
> > @@ -2453,6 +2455,21 @@ static void timekeeping_adjust(struct timekeeper=
 *tk, s64 offset)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 skew *=3D NTP_INTERVAL_FREQ;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mult =3D div64_u64((tk->ntp_tick + skew) >> tk->ntp_e=
rror_shift,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tk->cycle_interval);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * Rate adjustments are conceptually applied mid-tick =
in order
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * to avoid accumulating large deltas in ntp_error whi=
ch can
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * take days to drain. Offset the ntp_error that will =
be
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * introduced by timekeeping_apply_adjustment(), accor=
dingly.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (tk->ntp_tick !=3D old_ntp_tick) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 old_div=
idend =3D (old_ntp_tick + skew) >> tk->ntp_error_shift;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s64 old_bas=
e_mult =3D div64_u64(old_dividend, tk->cycle_interval);
>=20
> Total nit, but splitting the math up this way makes it less clear to
> dim-old-me as to what you're calculating.
> Maybe instead:
> s64 old_mult_w_skew =3D div64_u64((old_ntp_tick + skew) >> tk->ntp_error_=
shift,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tk->cycle_interval);
>=20
> Might more obviously visually match the logic above where mult is
> calculated (or alternatively you could alter the mult calcualtion to
> match what you have here)?
>=20

In fact I already do the latter in patch 5 (as I need 'dividend' again
to calculate the ntp_err_frac divergence rate), so it ends up looking
like this, and does match:

=E2=86=92		dividend =3D (tk->ntp_tick + skew) >> tk->ntp_error_shift;
=E2=86=92		mult =3D div64_u64(dividend, tk->cycle_interval);
		/*
		 * Stash the fractional part of the per-cycle ideal mult that
		 * the integer @mult discards, scaled by 2^32, in clock-shifted
		 * ns per cycle.
		 */
		dividend -=3D (u64)mult * tk->cycle_interval;
		tk->ntp_err_frac =3D div64_u64(dividend << 32, tk->cycle_interval);

		/*
		 * Rate adjustments are conceptually applied mid-tick in order
		 * to avoid accumulating large deltas in ntp_error which can
		 * take days to drain. Offset the ntp_error that will be
		 * introduced by timekeeping_apply_adjustment(), accordingly.
		 */
		if (tk->ntp_tick !=3D old_ntp_tick) {
=E2=86=92			u64 old_dividend =3D (old_ntp_tick + skew) >> tk->ntp_error_shi=
ft;
=E2=86=92			s64 old_base_mult =3D div64_u64(old_dividend, tk->cycle_interva=
l);
			s64 mult_delta =3D (s64)mult - old_base_mult;

			tk->ntp_error -=3D ((s64)offset * mult_delta)
					 << tk->ntp_error_shift;
		}


I can happily pull the cosmetic part up to this patch, leaving those
first two highlighted lines exactly as they are for symmetry, before
patch 5 adds the extra bit in the middle.


> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s64 mult_de=
lta =3D (s64)mult - old_base_mult;
>=20
> It might be useful to add a comment clarifying exactly what the
> mult_delta here represents vs the (mult - tk->tkr_mono.mult) value
> later passed to timekeeping_apply_adjustment?

Rather than "add a comment", I think that should actually be "rewrite
the existing four-line comment cited above that clearly isn't doing its
job".  How about this...

	/*
	 * In timekeeping_apply_adjustment(), the mult_adj value is
	 * retrospectively applied as if it had come into effect at
	 * the *start* of the current tick.  Any discrepancy due to
	 * the fact that time has *actually* been counted at the old
	 * mult rate between the start of the tick and now ('offset'
	 * cycles into that tick) is dumped into ntp_error.
	 *
	 * When tick_length is changed by a large amount, that can
	 * lead to tens of microseconds of ntp_error being accrued.
	 *
	 * Fix this by conceptually applying the tick_length change
	 * now (at 'offset'), rather than the start of the tick.
	 *
	 * That means calculating what 'mult' would have been with
	 * the old ntp_tick length (but the *current* value of skew),
	 * and pre-adjusting ntp_error to compensate.
	 */

It's more than four lines now, but if we want it fully stated in the
code rather than just the commit message, I don't think it could be
much smaller.

--=-mhyjlgZxAtic6jlMa3m7
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCE8Ew
ggWvMIIEl6ADAgECAhANkOKMSmGXhF5eMl0rsRhvMA0GCSqGSIb3DQEBDAUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBHMjAeFw0yNDAzMTMwMDAwMDBaFw0zNDAz
MTIyMzU5NTlaMGIxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE6MDgGA1UE
AxMxRGlnaUNlcnQgQXNzdXJlZCBHMiBTTUlNRSBSU0E0MDk2IFNIQTM4NCAyMDI0IENBMTCCAiIw
DQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAOfSIeC0vv1xPQ+dgSxbIIrkaru6skAWJYaGFzmv
q4Kq+2wU2jxhcWlJg/JeP5jEkq/LM3pn5aaLao79j+XRmS7J1ZpJKUODJVoM4s9MQJhTMvo4qS5Z
S64g6QR7Obkz3I1Lr3aWeSBmDDEyzue+NKtuWZ1Cxy3RdXo/w5HgRc3l2AercOM3Gt1XonTzEtTb
Z/Hwc0Sn9Gz8RmGRK6Ka4hVDl8q/2l110KaV233Kh5etP0csXS8MIMdVRfRu3sc5hp13DG7lCKzK
72a2GEpI8Wpl26G6I1/LMzz/98T+FqjTqxsdquk7Cj7m2vKGLW1BorpQH7WFGPdJQXJe1hfbfiZA
CcVdCtl4nAacFacmsiArZBfX7AQGL7isvHUwwYFEtcApyGW4p2Lt+t8nvU0CANA6BHOpOz1xOP8W
mAESbUriIjyuTUf3fJ9oDNCurVqhASMJCDaWI3lYX/QAoiAzt6akqbbZxo2ujW7mGGqc0KxqE2cs
h2T79v7pC8aUtHBfwNrTR19GnZVxE0eQ7ViIQhR6mpSaUQFA9sG+cmD2G8TnCgYsLa0q8De6F61a
CBevQGHNzrbZ3JAMneveYg/Jy1XxQHDRcvrMfWKe0jjcWbdKYlaGVPm5V1ILwYz7Yv5ewo3NUrxI
GJiywe9qPhuJSDZs7VehTuI0FxGIsgKzVjgbAgMBAAGjggFcMIIBWDASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBT3m6JO05fF9DQPQw6Bhc6RkzKv+TAfBgNVHSMEGDAWgBTOw0q5mVXyuNtg
v6l+vVa1lzan1jAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MHkGCCsGAQUFBwEBBG0wazAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEMG
CCsGAQUFBzAChjdodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURS
b290RzIuY3J0MEUGA1UdHwQ+MDwwOqA4oDaGNGh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdp
Q2VydEFzc3VyZWRJRFJvb3RHMi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUA
A4IBAQA+b8Uw53sDspdZgukU+qzLyyHkcjlxGGhHlP+zrmDLKm1wEFvCRS2pili3Hy67i8N4N5NU
vw5Rg6kv3lxb9S9Rktxk43k+tvm68pl7OxQE55ZjVY87P0lUPGwEqOOwLLyH02ZQcsfq5p5LrOH9
0JvmvZ1yy73HS+VpDAqOlytE0NSvTIRqFFkKQGQwfjvtql9YflujuNNvJztjBaHKYZsnNSg+J38o
jYq4TP3pSg3UdVH0PncVjPQyqxC9xef5Xae92Kbkzol3x7Nel3A1bwAkalrDMspvTHvey6LfiBks
FIqviTnoy7fgjaRAJgHS+RXx/cmuRd3rUAclSVVrYu8RMIIHAzCCBOugAwIBAgIQAzUotrsybJHx
HTjKOIVdIDANBgkqhkiG9w0BAQsFADBiMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQs
IEluYy4xOjA4BgNVBAMTMURpZ2lDZXJ0IEFzc3VyZWQgRzIgU01JTUUgUlNBNDA5NiBTSEEzODQg
MjAyNCBDQTEwHhcNMjYwNzE4MDAwMDAwWhcNMjgwMTA0MjM1OTU5WjAeMRwwGgYDVQQDDBNkd213
MkBpbmZyYWRlYWQub3JnMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA2pYux73kdbYX
sWF8f1u6DJP91qcqaZetsyfPkZk0B+MmXmAEv0kVes5n15V2mbDThOnpoPFly0UugQO9JYqLfrtD
tKD5yL58fgrDB9Dw+LQikgrHafl6YSCds5AvUu/8hw2J6noKrcOLJpKlKn9Fl/4IB9Q3JIdLx5aa
EtTqMalIPqHFOlgrJ7s+aua8xbB8YQ9ahqYBXWRJNv3P/2b1DYtdrz1oqZPE3CcB8Pc6Gf2a1Tcm
6TAgtEx7Cf1BFcrsrMz7TWHmGQITieNb2r9UYWSc2Gp+GtYFNJCgT0JJXKUBIauPMKBLteYrL8Fo
ff/uY44dC/mDWjdCP/5x0qelPQjlBvWdHL5zvBTOj06rJ0m3HNI/hnIcDh0Qu2j9reb9rLVcdym6
bWmBM4uDEB8Zv9Ph0KTBFSy1IosyakuD1j1Os30EzjGfbi0EUXIvnOcYbTBAbM5UAzrxEHMhBvoX
Pvnx+OyvjJmc9tWxTX6AcSz+m40esbT17URBeZS18afgieiikm5TynlUYP1LciR3hSgGVzvGXnKO
02VDFR5itGWdRKZ2W5wIShNfWfhSa0D0K5UdIDt5Qc7sjzwK1Yb1sY5Tu0uA5mhIS82q1ov83uxB
sFkriNnhGv/M1NCDVLBiOMsHu73qUM+yKmgKLwF9Hfn9WI25glbAMI4S5r3hYzcCAwEAAaOCAfcw
ggHzMB8GA1UdIwQYMBaAFPebok7Tl8X0NA9DDoGFzpGTMq/5MB0GA1UdDgQWBBRcYhqbcGzn1jrT
JOZaB8O7qllDpzAwBgNVHREEKTAngRNkd213MkBpbmZyYWRlYWQub3JngRBkYXZpZEB3b29kaG91
LnNlMBQGA1UdIAQNMAswCQYHZ4EMAQUBAjAOBgNVHQ8BAf8EBAMCBeAwHQYDVR0lBBYwFAYIKwYB
BQUHAwIGCCsGAQUFBwMEMIGpBgNVHR8EgaEwgZ4wTaBLoEmGR2h0dHA6Ly9jcmwzLmRpZ2ljZXJ0
LmNvbS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNBNDA5NlNIQTM4NDIwMjRDQTEuY3JsME2gS6BJ
hkdodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkRzJTTUlNRVJTQTQwOTZT
SEEzODQyMDI0Q0ExLmNybDCBjQYIKwYBBQUHAQEEgYAwfjAkBggrBgEFBQcwAYYYaHR0cDovL29j
c3AuZGlnaWNlcnQuY29tMFYGCCsGAQUFBzAChkpodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20v
RGlnaUNlcnRBc3N1cmVkRzJTTUlNRVJTQTQwOTZTSEEzODQyMDI0Q0ExLmNydDANBgkqhkiG9w0B
AQsFAAOCAgEAocabrh1cPd5s3vY5rnlBVQSTc7zs2ZWs67dAIltR+05WELrYClVzzUhMs/LOJPlr
EUo45UDDomXq38DxFepaPd9+iNLjXfn33EX/IG44j04lU/oF/Rg9VeQILkYLbCZ/x9wOjNHZc4SN
ydY7Dhvf/sT5aBz88u7D5+azZJ7Qf1U57wYseCH1Mt0nDrtr5y19IJ8D9xJJ33RFL6vfpHZBBAQ8
+3RqkKNxLoV2aFvQhxdhjNLDqTv3LjUIdicwPraN7JkxEu7CV2Lka7eRqJgkWL7SK0YmBjGpRafs
+icP/ON5RCCKTTb6VlX8eTG2sJJfsFhvJNCCt6xexbWzWtIrfP7NvPBvwBB737AyEGBZkS5aNizT
McURJGTv9UKvBh1LF/+tNhYtLvPCN7oecGzhCHht9jcwSkygTo3Y6YlK3QgOu+ncmiBbfeuwlLZ1
LxbYvG6hgNqXv7u6YyADbYajAQJXJ2OQen39pm3Q/AQSyLYG+B8lDglWsM8tYXPlEdrYJcksGK6F
nqIX6Bumn43rBooLJdiZp4WmfWdL2pxe+LxRDjprmqu1WprixDxULSTOKJZoqTlugs6y3Bc+if+s
gHnBBtz9WQ6MtPHkh7zONDAFIKcBmv8OqPQCx0F3Wv3OEybwMpXx0OsKgK8wLldaX1pXcMuyDgTL
Sqs0AV0OHUgwggcDMIIE66ADAgECAhADNSi2uzJskfEdOMo4hV0gMA0GCSqGSIb3DQEBCwUAMGIx
CzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE6MDgGA1UEAxMxRGlnaUNlcnQg
QXNzdXJlZCBHMiBTTUlNRSBSU0E0MDk2IFNIQTM4NCAyMDI0IENBMTAeFw0yNjA3MTgwMDAwMDBa
Fw0yODAxMDQyMzU5NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqG
SIb3DQEBAQUAA4ICDwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZe
YAS/SRV6zmfXlXaZsNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2z
kC9S7/yHDYnqegqtw4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qG
pgFdZEk2/c//ZvUNi12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41va
v1RhZJzYan4a1gU0kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0c
vnO8FM6PTqsnSbcc0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PW
PU6zfQTOMZ9uLQRRci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXt
REF5lLXxp+CJ6KKSblPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQr
lR0gO3lBzuyPPArVhvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7Iq
aAovAX0d+f1YjbmCVsAwjhLmveFjNwIDAQABo4IB9zCCAfMwHwYDVR0jBBgwFoAU95uiTtOXxfQ0
D0MOgYXOkZMyr/kwHQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3
bXcyQGluZnJhZGVhZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEC
MA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwgakGA1UdHwSB
oTCBnjBNoEugSYZHaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZEcyU01J
TUVSU0E0MDk2U0hBMzg0MjAyNENBMS5jcmwwTaBLoEmGR2h0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNv
bS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNBNDA5NlNIQTM4NDIwMjRDQTEuY3JsMIGNBggrBgEF
BQcBAQSBgDB+MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wVgYIKwYBBQUH
MAKGSmh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNB
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
kc5Ak9TE3amSUqGZPKHQClgAAAAAAAA=


--=-mhyjlgZxAtic6jlMa3m7--
