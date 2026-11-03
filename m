Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746921;
	b=qIio4IZhSRE0/1jdMPaYMI8XXgsJNOey/9ICjRCGKpX11BkXwOg6cg9m3/0OcLwXlWDj
	 rqhgT+vBZlAqt513GIawsMx0POJ2HY0ZOxw5YqQMtenSGLQp4v8rmM/9Ks8uycF9gNSew
	 R2xhXd9CCLuwP9JANJiX9Fs5YXQ4h4at15kX1UR9UFQYy1a0Dn4Wl+ixxnY0NTd7vFl7d
	 W3Nf55niw/OCwfdW3zvfHpj+yIMS5wuvbMJ/1Qr0BELb992biBSEA931h8ZRCklt5imbh
	 1aPIqQdvds5y4rORqrwZQCZrJVbN0OesMosOCA0zF3Hx9aifVE+AwR858nu4KahqTiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746921;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=1UCUSKBQqgrHkI1t9dzEjagd7WWMsaWQHMbJErikrDU=;
	b=0RamT/KjFv95yFy9jPFKGu7UfVYcWXadWoLzh/80hQ56n0AhFs+526/BgGz0sswrY4E/
	 FWxaRbRtxdVZId7jG8DapzeI04qTxPBh7I6oR9YMvOBmclXmv0ddELGjoShlQJub/0qAp
	 dbRYqYTusnOhdHmTVdYhJydfQrnOaloN2I54+4+a76FseCrqGyQpDlK3+YQ3s0izM7zRB
	 jUdu6EzT4YJQ3grIECwtmJSm9bvpfb4Uvrqkr65H3T1C/ALnEnfXzFP5OL+0lI5ZQshcn
	 bMeLPw+w10Nmi5wh1zDeD9079F0/VH+287rQeJQZmIAVtmqNRTnVarRahK9C5N3E40g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=ONfc26xk;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52E1606A31B;
	Tue,  3 Nov 2026 23:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D52E1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=ONfc26xk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793746907; x=1794351707; i=arc@gmx.li;
	bh=1UCUSKBQqgrHkI1t9dzEjagd7WWMsaWQHMbJErikrDU=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ONfc26xk/dlAxJthLWwswfokcaZOqWvU6/u4N2KgzKqQbh8Vt7SBNYgFRBdDYMxO
	 kTtMj4t6eH4W8WsR/k0LzEObbCiE2ssMwHd+u0V191C/yWZINLtVaXwBirL0MJiF4
	 UaIIV7DNzwwE1+qm2H9PBY2S0hVvU0zPHd9sOSWANeKHGUCEeN44qc89MXaGCOMst
	 TyvNeCOrpwVWoFCDoZ/EqJsNaMyNL1hlOu7GRQm4inUR8bclugQAHMLb8coYxeGCx
	 PHFUTzj6fORBfXGPaIIBbB9qDRRkR2DBz1X4gkFe9lCFFwlL3XmMUfcuaYBS2h3s0
	 QIzcJHH0pnTzPxhoMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N33Il-1wNzhG2hcT-00w4tb; Wed, 04
 Nov 2026 00:01:47 +0100
Date: Wed, 4 Nov 2026 00:01:47 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: Re: [RFC V2 PATCH 00/11] Re: ALSA: usb-audio: Audient iD14 MkI vendor
Message-ID: <aupn1wwW7w08M3gu@khmer.arcnet>
References: <20261102003257.10134-1-arc@gmx.li>
 <20261103024518.948089-1-mrwillporter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5QQu8KC1L8iIjnZT"
Content-Disposition: inline
In-Reply-To: <20261103024518.948089-1-mrwillporter@gmail.com>
X-Provags-ID: V03:K1:weGslNtEDnWmcZHxAdqBDDmmgnFeTtCgpE0ZftF4tsgejv55Svt
 YXU5n+Wr9KJ2/lyzvmcANUHU5F8U0l+Jdk7pYHI6B5GkEQRkwH4sKydxQDmB53aIzMaReBA
 YH2lTcrj2LZhlpNWTDEO6LBNYsAQkOT3Zh3oNqR3SW87kfiF0ueNqFFJx5WmbWnUYnc0vmG
 h6Mq444o+yTDLgBVqzdJA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:myW3h1H5WJ4=;5Kw9MRX/1uBjdxeHPbEJ56MX8mF
 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
 w==

--5QQu8KC1L8iIjnZT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 08:45:18PM -0600, Will Porter wrote:
> Hi Christian,
>=20
> Thanks for RFC V2, and for folding everything in so quickly.
>=20
> On Mon, Nov 02, 2026 at 01:32:46AM +0100, Christian Ruppert wrote:
> > Makes sense. Added to RFC V2 (in patch 10 where the cache is added).
> > Please double-check if the logic reflects what you had in mind.
>=20
> Yes, that is what I had in mind: a put of the cached value still
> writes it, but returns 0, so alsactl restore sends no change events.
> On an iD14 MkI, a put of the held value sent no change event on a
> write-only switch, a volume or a matrix control. A put of a new value
> on the write-only switch sent one.
>=20
> One question on the same function. A FORCE_SET control without CACHE
> now reads the device before each write; in RFC v1 the put skipped
> that read. If the device refuses the read, the put fails before it
> writes. No table uses FORCE_SET without CACHE today, so nothing
> breaks now.
>=20
> Should that combination work? If yes, the put could skip the read
> when the control has no cache slot, as the diff below does. If not,
> a comment or a check in snd_audient_add_ctrl() would say so, and you
> can drop the diff.

I guess that depends how we define force_set. In my mind it's literally
force set, i.e. for write-only values we must explicitly specify both
FORCE_SET and CACHE. The reasoning is that I don't see how write-only
controls can work correctly without cache. But force-setting uncached
read-write controls might be of value if the set operation as such
triggers an event inside a device, even if the value is the same as the
one just read back on some volatile control. I imagine this could become
useful for certain enumeration types, for example to load a preset.

The question is now what the put function should return in such a case and
until we encounter one it's rather hypothetical to say what's preferable:
- We could systematically return 1 because an event was triggered in the
  device. If you think this is the right thing to do, feel free to weave
  your diff into patch 10. I don't think it makes sense to reiterate
  RFC V3 for such a small change and I'll test the full patch set anwyay.
- We could return 1 if the value is changed and 0 if it isn't which is the
  current behaviour and designed to be consistent with FORCE_SET in case we
  do have a cache. I imagine (cached) write-only controls are more probable
  to trigger events on writing than volatile read-write controls so this
  seemed the reasonable choice.

> > I don't think this is necessary as it should be rather obvious to
> > everyone touching the driver that the u32 argument can't carry more
> > than 4 bytes. Added a comment to the parameter definition.
>=20
> Fine with me.
>=20
> checkpatch --strict on the 11 patches gives no errors or warnings,
> only CHECK-level style notes, mostly unneeded parentheses (04, 05,
> 07, 10) and alignment (01, 05). I'll leave those to your discretion.

Not sure if we need to reiterate because of those, Takashi please advise.
I would like to keep the parentheses for readability if possible and the
alignment issues can be fixed little by little when we touch the file over
time. Or otherwise, you can also weave in fixes if you prefer.

> iD14 patches on RFC V2
>=20
> I rebased my iD14 patch series on RFC V2. Three of my patches are now
> part of yours, so seven remain:
>=20
>   1. a step size for integer controls
>   2. enumerated controls
>   3. a separate mixer map for the iD14 MkI
>   4. iD14 MkI monitor and routing controls
>   5. iD14 MkI mixer matrix
>   6. iD14 MkI write-only controls
>   7. the iD14 MkI FU 12 control

Is there a reason 4, 5 and 6 are separate? They should all be one big
update in the device definition tables without any code changes, right?

> All 18 patches build one by one with W=3D1 without warnings.
> On an iD14 MkI (7.2.11 stable), the controls passed the same read and
> write checks as on RFC v1.
>=20
> Next steps
>=20
> As agreed, I'll send the final series: your 11 patches, then the
> seven iD14 patches. Two questions first:
>=20
> - Your four mixer_evo fixes ("ALSA: mixer_evo: minor fixes and tlv
>   addition") are still open on Patchwork. Should they still go in
>   separately, before this series? Then I'd base the final series on
>   sound for-next once Takashi applies them. Or should I put them at
>   the front of the final series?

In principle they are bugfixes and the intention was to keep them small
enough so they can still squeeze into 7.4. If Takashi decides that it's
already too late for this type of fixes I'm happy remove the ones which
are fixed by our new patch set anyway and resubmit the remaining ones at
the beginning of our serie.

Happy to review and test an RFC of the complete series until he's back and
takes a decision. I expect your seven patches aren't massively impacted by
the four pending fixes so starting to review them as soon as you're ready
would allow for one or two iterations if required, without losing any time
while waiting.

> - If the diff below looks right to you, shall I fold it into patch
>   10 when I send, or would you prefer to take it into your own tree
>   first?

See above. If you think it makes sense to apply it please just fold it in,
I don't think we need a full iteration for this.

> Thanks,
> Will
>=20
> -- >8 --
> From: Will Porter <mrwillporter@gmail.com>
> Subject: [RFC PATCH] ALSA: mixer_audient: Skip the read for an uncached F=
ORCE_SET put
>=20
> A FORCE_SET put without a cache slot reads the device before the
> write, and fails without writing if that read fails. Skip the read
> in that case, as RFC v1 did. Puts on cached controls keep their
> change reporting.
>=20
> Also fix a typo in a comment and drop a blank line.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Will Porter <mrwillporter@gmail.com>
> ---
> Proposed change to patch 10.
>=20
> diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
> index 483ab8f..33c2d1f 100644
> --- a/sound/usb/mixer_audient.c
> +++ b/sound/usb/mixer_audient.c
> @@ -329,11 +329,12 @@ static int snd_audient_raw_set_one(struct usb_mixer=
_interface *const mixer,
>  	int ret;
>  	u32 val;
> =20
> -	if (force) {
> +	if (force ||
> +	    (!slot && (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET))) {
>  		val =3D !value;		/* just make it different */
>  	} else {
>  		ret =3D snd_audient_raw_get_one(mixer, ctype, slot, cidx, &val);
> -		if (ret =3D=3D -ENODATA)	/* FORCED_SET and not cached yet */
> +		if (ret =3D=3D -ENODATA)	/* FORCE_SET and not cached yet */
>  			val =3D !value;	/* just make it different */
>  		else if (ret < 0)
>  			return ret;
> @@ -352,7 +353,6 @@ static int snd_audient_raw_set_one(struct usb_mixer_i=
nterface *const mixer,
>  			slot->value =3D value;
>  			slot->valid =3D true;
>  		}
> -
>  	}
> =20
>  	return val !=3D value;

--=20
  Christian Ruppert                                             <arc@gmx.li>

This message is digitally signed with GnuPG.
GPG/PGP Key fingerprint =3D 4492 2196 75F0 EAA0 981E  B661 1476 F17A 975F 5=
87B

--5QQu8KC1L8iIjnZT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAEBCAA5FiEERJIhlnXw6qCYHrZhFHbxepdfWHsFAmrqZ9cbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEBR28XqXX1h7KNEQAKF1EZm4xijHZkjZaw1+
BxvrT6mcb0qnrIHQ94yAW2UvpW1KAKrCrg/JNmbK8XsRdXQd/fV/Kx0BzJHpYwwa
3wQ6WOhgSdCOUjy4K29zQpcqRrEDj1xzY6YMDmFUIlNjtV7/mPGisFkZOaRJhdd6
IoFqBjxwmghdO5HRtJFG/6QYPlfSiP4KcFHleLs99zIeRHsTgCMyU7Wog0k2YPfq
/YcDEp9xkjUKlkSovE+eFCH8XGL1Hd5KpAMGt0nEJqrmEwbSt/2RR3bj0QAniywp
lVkvhBH+nrcrqqIwfdvmTX4UYvLxWwDCrtcrtaX3yAhcnaJkNXlQVhmsDA2jwAQ4
PpSbhqNKmp9qvddVSMAc0BUZTYzkJW4Bx0N14pNME7T0TDV8dYhN+PZE1khszOW+
OarV1+gB7LpqUwdX+VNm7m3f+UnuA+qWdAVYUNHa5iEluIe9pa8OCXDGC+heufc8
5GytcXJkdiWwmm1VaxsQTrvgVflPd9OM+YThFU1jjtgvRO/p2ftsanboamiSeWs2
MmXIknDAezz+L9r+RIzJNfvGE+CxKIluMd2+Hpcng1yuh8x/++/+rDLxzp9SO+Sn
v9P6RrkzDomM+Bno0wrP7w0ZC0AEdRefd3GoB6e2A3S/8M1XqwGZQumCALD+juYi
VQnob6EDqwvZf+QekDctbD/T
=hwCl
-----END PGP SIGNATURE-----

--5QQu8KC1L8iIjnZT--
