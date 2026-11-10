Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312716;
	b=RlJPVJrH4dcT9SB0G1V+jXKDTLCv9v2XAMely12oJQlB1vF1/W2SFbTHVMUPoX4buPIi
	 3+yB6XSESikseSO+MRhYEn9ox5eH01ylgA99erZ6HaBaQ7KDhgjD0N8+nsWmXEbaGEYrF
	 VxicrgjmAaXKvuytlGSnfrawx42QILKzU/UNHdXfsGXIqqkTE5baCXxTAzIRtf4uwob+6
	 sAHu+GH7Umq7mlJxfsXTSbr+Dul1wC3hgpsZjJ+IsBP/sADQ2W5ZDfFmVINfs7B+nMlw+
	 SgooHnWyRxj1KQdaKkSuOBpu08miqyYDXIrhLnfSV9CdC40r51wozfLVLjLo6o5cUzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312716;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=tD7qGW/s5oeJ2DBBIRje4FsXgEysjpoBnFMFva+fOTE=;
	b=DtAz0A4CmkMUHNB+pbsJpJjeP44GLaxbVU8IrD12I8rikY970CrOle15qYdNSs0WYqgU
	 4Ho11cjz20yOAZzI4qzIGYEOjZBRasz/i6NJDnMUSJPZ9OfMdg24rBUFeNunUzmlnCJFE
	 B/rxSRiUXsEjY4qGOatB1GqSKlQqJuEByMwcVsKN0vhjspxfVQwOwAiaHVWFqcnK6er+M
	 hWrCVsp2SENolvSJIpo3SggMXOPcfu61a54IE16C+79NyyQzlVqYQiAa5wO3HRVTRXUWm
	 5ye6c0BT2qAChcVyUYxHsN1yZ6Kdt0gqQ16SCthyrYZTOY3tU6jYpLQK6qyqMHSxf1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WphPGQT6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473FA606A338;
	Tue, 10 Nov 2026 12:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WphPGQT6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BFB1F008A1;
	Tue, 10 Nov 2026 12:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312715;
	bh=tD7qGW/s5oeJ2DBBIRje4FsXgEysjpoBnFMFva+fOTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WphPGQT60ndSl/fT00up4p6UOmimSvHl+Z4QGCnkEQD5emXwGRlQfEZAP8meg3xtt
	 Vfyn1mKfvMGxvORVblLnZRa7PrvVFGCKsJl5TTJQRtfecAoz1uBwMqbEhh6dDuRwgx
	 smN8cIIAgE/2IC+XLvD1oipdAj95dyH8+yMw2dfDE4om6EY4OBOKc3BblzgCT4DYH+
	 XvQ+jg2aNOIChY32qbMh1JIvK+2hI03zOAO7Ov6o7qgS2q6yb39Iv/2X7s1D/GGrWV
	 X9DTO07ATWUenxnzR2d2Rj7VAG46kr865p8ttVyGTSzcjmgPfReLKEkyhxcLjh4xrm
	 k0p4UEKD5Hekg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 93976310C14A; Tue, 10 Nov 2026 12:11:52 +0000 (GMT)
Date: Tue, 10 Nov 2026 12:11:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	shengchao.guo@oss.qualcomm.com,
	mohammad.rafi.shaik@oss.qualcomm.com,
	bartosz.golaszewski@oss.qualcomm.com,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: qcom: audioreach: support multichannel PCM
 formats
Message-ID: <7195c2b6-e1d7-4816-b86c-55e1936e11a2@sirena.org.uk>
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
 <20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com>
 <CAFkd8hvXor7A5zaRtH5iQm6NsphzsxrjbADcRwedsONo=6J2gA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z5PpBErLLgIutFTu"
Content-Disposition: inline
In-Reply-To: <CAFkd8hvXor7A5zaRtH5iQm6NsphzsxrjbADcRwedsONo=6J2gA@mail.gmail.com>
X-Cookie: Whoever dies with the most toys wins.


--Z5PpBErLLgIutFTu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 03:59:44PM +0800, Zhangfei Gao wrote:
> On Wed, Oct 28, 2026 at 10:47=E2=80=AFAM Zhangfei Gao
> <zhangfei.gao@oss.qualcomm.com> wrote:
> >
> > AudioReach currently rejects PCM streams with more than four channels in
> > the PCM and shared-memory media format paths.


Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--Z5PpBErLLgIutFTu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavMKBAAKCRAv73Ows9A4
iRDrAQDAqT8DpX9wcQEUCFKrlo0Xwf8FZARYHt5LPoZ2z1CcWgD+NhReofjPRdwd
dPFIv3Vl2sj2YB9DDPXF7UF478xUYAU=
=3j0y
-----END PGP SIGNATURE-----

--Z5PpBErLLgIutFTu--
