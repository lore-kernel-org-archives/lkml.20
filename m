Received: from mail-qv2-f10.google.com (mail-qv2-f10.google.com [74.125.230.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EFB3DD86A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624992; cv=none; b=YZ76ZQhd/0P1UKS8wm6XYV15j5qzZWyzFJ/DFqzE5waZV3gvKsrQIRi3NUCWIB5zjCegBq5pV+/XurbAKgy5HvEocte7ie6aosL2GV0RYWGMNYv/I5ib26Sujyos0+cy5dTpx7fwrjEQ2BkFWfmiNinWUgpEvVhdFIZ4bkJQ0/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624992; c=relaxed/simple;
	bh=fMONoEBgG4nLBh7c5SXZ6poRJnWQ2qCJel9Yj+ssiBQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n4IZCIj3mUOQpLoMSiE86/b1EJp7PzYSUqucxmmS+DesGrn/MBTLvTB+tpuRbNptmOwxkGXx7dgbD8qxDNWsnhxPMlH6Faxb90th6pct5h/psEeVRi/UzCXc3b4JGl3efpHmIeKY69S8md7dAf4Np8AaccGY253IRTQaSz8Jq/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=A+vixkb4; arc=none smtp.client-ip=74.125.230.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="A+vixkb4"
Received: by mail-qv2-f10.google.com with SMTP id 6a1803df08f44-91055adb192so22099556d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790624989; x=1791229789; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lk8F8JKc1EoPYwR92nVb2I5Z7QuoWCCQFi9uhIFiIbw=;
        b=A+vixkb4RnSw7D3rDVd8b6wTgkd1ns/MTNOB4Kl8QN+9Wr5wrEqhG9AoJSVnErhhMa
         DkPNvpM670ffLLL3HorCu1KRf1isT0PcFespsWetlbkFTWfl2bull/4TRL0iPRD3C4uq
         MdHzHsZCFhgDPtef0ErPC6PPW4D36pzg8bvE5UhfXtp37FWW2pz1jcCKKQWJ8ORoVaim
         zeWUOeUdRsieoBetVIdQSV9oi1biF+kZX0ulX/3VaYGBkchMop1GLXMtah6qe8HvZvYM
         YiNw4rObn+gGWvgdIdzkhRcHH7hzD1TKJH0cqEYORbCh8+3T6PIoHvUQLGmNbD8k2mMt
         HQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624989; x=1791229789;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lk8F8JKc1EoPYwR92nVb2I5Z7QuoWCCQFi9uhIFiIbw=;
        b=UxAsOnr5cWpqRfWI8C1ovOggyqWOimLHhpeJktuXE0liV3PzPlXaH2HuR/iZJ4UOPJ
         i+TuGbHFwDLBDy64Tdnx3EUxgkAFDfI78q70BRUDx/E+N5Jm8jPYrFRa1oJXRRUSjcVp
         bMprQWgW6KL513rWX3BDvteVCBqnG43saUe55iZmYjATa8CZZTBI9p/QXanMmVDVQAsv
         CllLj84Bgun+ppfV55JObaP98ilJy8U65ITYPsCMB0NwJJn36abJr71rSYB/XQTBREaf
         4vYAPigJFyNWoIng+wiWF1tyBMuE+CtuxlbamEsW3+nCZmMAViIb+voosjRsthcF0X4C
         apUw==
X-Forwarded-Encrypted: i=1; AKwUvBw6QQrRczQnYAIOXQAQCgvxKYfrdi+N4/kMK4pFKwpfdXo059330bG/0ZcAcL6Yw/Ug4iyXRpWAg6e2v98=@vger.kernel.org
X-Gm-Message-State: AFuF++l2xAeTml4P6Kf3l4KQNpEGNGLEBNlrQq4VHQsJSMht70ecMfsp
	zDslfDkqsh87rIA3xv3T1Y+I2PYlCD483gJUfp4as+ggp3xwxUJH2GQFW7SCEBLWG+M=
X-Gm-Gg: AYBFou2JJqX7oj8RqH4zQDtjTU6j0vtlrGsOXCD73+viLT1uA2qZSxY9AGc9oldqMku
	Anvi7wl19oHF6tiL7D+EwZaeYkIp9hN/s4UPZs83pf5RtCPe+AQa9aftYM4zxdRWH86oSF5y7Qz
	o4eK7qniWS8pgeV0N3ijG9vqpcY3WDNQlTdwEvTtMIB8nxoVhJ4/1ycG7+xBY39+rp7HS73ETo8
	fOCX7S/9DxORQEvJhDKt4un4aYOsQDqAeDxZibYmZA5cJDdv1o+5GkKUFA0AHqA/Thzwsj0xY5Q
	9q/XY5WUarnthu1NSMRTmCQhvHzCDTHrgAXgcS3O/bD9mF/ccJnpeN9CYEE00wm4PRVHrxqni+D
	5P0WwNlKMXzG4lJKK8TOW1wazh9tohBUYBTcay7CuYn630Ph1mX/ETbZF5tX45W9xiU3r7p9S87
	Y5kuJubHnsMmEo8mLb4+Ex3BO2CnQRNLYyuxd889K4FtN3Q7V7HqfCpsH2qqOOng7II69IpneI1
	oMHxu5DWOdSWxnpLeazvdfR
X-Received: by 2002:a05:620a:2628:b0:93b:beb3:5898 with SMTP id af79cd13be357-93c43ce7bfcmr2220308485a.49.1790624989158;
        Mon, 28 Sep 2026 12:49:49 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c813dca59sm227347285a.22.2026.09.28.12.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:49:48 -0700 (PDT)
Message-ID: <b4666dae3ded36f157d77f839f692a19a3ad9d06.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: meson: vdec: fix use-after-free of in-use
 frames in codec_vp9_rm_noshow_frame()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Doruk Tan Ozturk <doruk@0sec.ai>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Kevin Hilman	
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, 	linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 28 Sep 2026 15:49:46 -0400
In-Reply-To: <20260627063905.79363-1-doruk@0sec.ai>
References: <20260627063905.79363-1-doruk@0sec.ai>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ZDhsxysEA1cWoT9Xmzeg"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-ZDhsxysEA1cWoT9Xmzeg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le samedi 27 juin 2026 =C3=A0 08:39 +0200, Doruk Tan Ozturk a =C3=A9crit=C2=
=A0:
> codec_vp9_rm_noshow_frame() frees the first non-shown reference frame on
> ref_frames_list without excluding frames that are still in use. When the
> previously decoded frame was a non-show (alt-ref) frame and the current
> frame is a non-show inter frame, the freed object is the one
> vp9->prev_frame still points to; codec_vp9_set_mpred_mv() then
> dereferences the stale pointer (use_prev_frame_mvs and
> codec_vp9_get_frame_mv_paddr()), a use-after-free. Freeing a frame that
> is still an active reference (codec_vp9_is_ref()) or the current frame
> has the same in-use-then-free shape and additionally desyncs the
> reference bookkeeping in codec_vp9_sync_ref().
>=20
> The sibling cleanup codec_vp9_show_frame() already guards exactly these
> cases before freeing:
>=20
> 	if (codec_vp9_is_ref(vp9, tmp) || tmp =3D=3D vp9->prev_frame)
> 		continue;
>=20
> rm_noshow_frame() simply omits the same check. Add it, also skipping
> cur_frame, so both cleanup paths agree on which frames are safe to free.
>=20
> The fields that drive this path (show_frame, frame_type, intra_only) are
> parsed from the VP9 bitstream, so a crafted stream fed to the stateless
> decoder can trigger the free-then-use.
>=20
> Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
> Found by static analysis; not yet runtime-reproduced (Amlogic Meson
> hardware required).
>=20
> Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>

I can't really do anything about this patch without an actual Tested-by. Pe=
rhaps
try and ping someone with the hardware to let this patch progress, meanwhil=
e
I'll pass.

This is also a staging driver that is likely to be removed in few cycles
considering it not being maintain and there is several competing drivers be=
ing
developed.

Nicolas

> ---
> v2: Per Dan Carpenter's review, also skip active reference frames
>     (codec_vp9_is_ref()) and cur_frame, matching codec_vp9_show_frame()
>     exactly =E2=80=94 freeing an in-use altref/reference frame here also =
caused a
>     codec_vp9_sync_ref() desync, not just the prev_frame UAF.
>=20
>  drivers/staging/media/meson/vdec/codec_vp9.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/stagi=
ng/media/meson/vdec/codec_vp9.c
> index 8e80ecf84193..dad75950933c 100644
> --- a/drivers/staging/media/meson/vdec/codec_vp9.c
> +++ b/drivers/staging/media/meson/vdec/codec_vp9.c
> @@ -1238,6 +1238,8 @@ static void codec_vp9_show_existing_frame(struct co=
dec_vp9 *vp9)
>  	pr_debug("showing frame %u\n", param->p.frame_to_show_idx);
>  }
> =20
> +static bool codec_vp9_is_ref(struct codec_vp9 *vp9, struct vp9_frame *fr=
ame);
> +
>  static void codec_vp9_rm_noshow_frame(struct amvdec_session *sess)
>  {
>  	struct codec_vp9 *vp9 =3D sess->priv;
> @@ -1247,6 +1249,18 @@ static void codec_vp9_rm_noshow_frame(struct amvde=
c_session *sess)
>  		if (tmp->show)
>  			continue;
> =20
> +		/*
> +		 * Mirror codec_vp9_show_frame(): never free an active
> +		 * reference frame, the previously decoded frame, or the
> +		 * current frame here. prev_frame is still dereferenced by the
> +		 * MV predictor in codec_vp9_set_mpred_mv(), and freeing an
> +		 * in-use altref/reference also desyncs codec_vp9_sync_ref();
> +		 * either is a use-after-free of an in-use frame.
> +		 */
> +		if (codec_vp9_is_ref(vp9, tmp) || tmp =3D=3D vp9->prev_frame ||
> +		    tmp =3D=3D vp9->cur_frame)
> +			continue;
> +
>  		pr_debug("rm noshow: %u\n", tmp->index);
>  		v4l2_m2m_buf_queue(sess->m2m_ctx, tmp->vbuf);
>  		list_del(&tmp->list);

--=-ZDhsxysEA1cWoT9Xmzeg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrE2gAKCRDZQZRRKWBy
9BjOAQCcJJZ7xjpltnqzUdi6P6d2itMrbhl41cjmeE/c74heSQD/fIwpHsmavr36
/iKd8Y6urOm/Xeb/2/lPx2ob8TKg3gQ=
=dr9M
-----END PGP SIGNATURE-----

--=-ZDhsxysEA1cWoT9Xmzeg--
