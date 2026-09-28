Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F2148CD46;
	Mon, 28 Sep 2026 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790630487; cv=none; b=TSW7BuYVMg32uQ7/2ZS7nxhu/qkKzlS1hykCYMJh+Ik4dGR0mONx/6hSZx21e1hzlqMqH8sHwzTxUuCVGJ7v0Fr1kNuYg5CsuAzssUMMQzeWeUYVLWF8YTI8hhVhtVr4XppHE1+c8ocmy60bc7xfsJemIdxomZhfilm/hFCJI6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790630487; c=relaxed/simple;
	bh=uyZUJGIZ2MuHEU6KxAsdueiYQmlWjL4xh12qBYELzKo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kV6z7omnXjRIPTzUubu/sTf74XwLOOigfx5egZ+Fj8rWm7C3dFmcfcj8GuVd7TXCBz8f+gGv46C9v3af1wulXyQgyn2LiajbDQPm0TSOHRYDHwSmDeDYI1CP/nzNgeBg/16+d+ZwIophnwkOoZlD6hgvKohcanixf/Xf6Fi+3x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FC/rsACH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FC/rsACH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790630484;
	bh=uyZUJGIZ2MuHEU6KxAsdueiYQmlWjL4xh12qBYELzKo=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=FC/rsACHFDqg/czoPqYzHMTaEssax/0DGnDaSyo3wDdcpzPHYBJDRQ3meolX7iTQf
	 4ivj9vVtP8D3Pt/2ZE5EpI45vQ8SwR5D7MB3Es220blhsySpeCNB5M48q4+hbgfYM9
	 dfEkdh4RWfyAMna0WoRqq681xminS+4Qcl5OZULn0A5sH4gtrPuXP6zAg3w6VM2oEs
	 kNJ/kfqnRVmCxgO7oCVvCVjvdWXSWlz35NhYK5+/oxHO9BoFqUdG9BNa9q/E720/ln
	 nVAMQm0rvitmkYCWvNoHuZ+p1J8JnwRTuOMJHylJUSpvwbvMT3hhhIUTXXbipBWrCO
	 y+xviDk9fGS1Q==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7536517E0074;
	Mon, 28 Sep 2026 23:21:23 +0200 (CEST)
Message-ID: <700f89155d390d4fc9695440f5105d2ade57f8b1.camel@collabora.com>
Subject: Re: [PATCH v2 2/2] media: chips-media: wave5: Check decoder runtime
 resume errors
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Nas Chung
	 <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 28 Sep 2026 17:21:22 -0400
In-Reply-To: <1c34bc88f347384568438058ab69e4d0bc7bb9ca.camel@collabora.com>
References: <20260718130037.3306626-1-lgs201920130244@gmail.com>
		 <20260718130037.3306626-3-lgs201920130244@gmail.com>
	 <1c34bc88f347384568438058ab69e4d0bc7bb9ca.camel@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-o3TfNheptSAEs7rYlj9F"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-o3TfNheptSAEs7rYlj9F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 28 septembre 2026 =C3=A0 17:13 -0400, Nicolas Dufresne a =C3=A9cri=
t=C2=A0:
> Le samedi 18 juillet 2026 =C3=A0 21:00 +0800, Guangshuo Li a =C3=A9crit=
=C2=A0:
> > The decoder start_streaming, stop_streaming and device_run callbacks
> > resume the VPU before accessing hardware, but do not check the return
> > value from pm_runtime_resume_and_get().
> >=20
> > If runtime resume fails, continuing can access the VPU while it remains
> > suspended. Since pm_runtime_resume_and_get() does not retain a runtime =
PM
> > usage reference on failure, the later unconditional
> > pm_runtime_put_autosuspend() can also drop an unmatched reference.
> >=20
> > Check the return value in all three callbacks. Return queued buffers as
> > required by vb2 when start_streaming fails, clean up buffers without
> > touching hardware when stop_streaming fails, and finish the current
> > mem2mem job when device_run cannot resume.
> >=20
> > Only call pm_runtime_put_autosuspend() after a successful runtime
> > resume.
> >=20
> > Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspen=
d/resume")
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>=20
> Reviewed-by: Nicolas Dufresne =C5=86icolas.dufresne@collabora.com>
>=20
> Picked, ty

Spoken too fast, I picked the first, please rebase and resubmit this one, i=
t has
conflicts that are non trivial to fix.

Nicolas

>=20
> > ---
> >  .../chips-media/wave5/wave5-vpu-dec.c         | 36 +++++++++++++++++--
> >  1 file changed, 33 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b=
/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> > index 03d108b808ba..bb59bc962603 100644
> > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> > @@ -1380,7 +1380,11 @@ static int wave5_vpu_dec_start_streaming(struct =
vb2_queue *q, unsigned int count
> >  	int ret =3D 0;
> > =20
> >  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> > -	pm_runtime_resume_and_get(inst->dev->dev);
> > +	ret =3D pm_runtime_resume_and_get(inst->dev->dev);
> > +	if (ret < 0) {
> > +		wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
> > +		return ret;
> > +	}
> > =20
> >  	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
> > =20
> > @@ -1544,9 +1548,29 @@ static void wave5_vpu_dec_stop_streaming(struct =
vb2_queue *q)
> >  	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
> > =20
> >  	bool check_cmd =3D TRUE;
> > +	int ret;
> > =20
> >  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> > -	pm_runtime_resume_and_get(inst->dev->dev);
> > +	ret =3D pm_runtime_resume_and_get(inst->dev->dev);
> > +	if (ret < 0) {
> > +		struct vpu_src_buffer *vpu_buf;
> > +
> > +		v4l2_m2m_update_stop_streaming_state(m2m_ctx, q);
> > +
> > +		if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> > +			inst->retry =3D false;
> > +			inst->queuing_num =3D 0;
> > +			while ((vpu_buf =3D inst_src_buf_remove(inst)) !=3D NULL)
> > +				;
> > +			inst->eos =3D false;
> > +		}
> > +
> > +		wave5_return_bufs(q, VB2_BUF_STATE_ERROR);
> > +		inst->empty_queue =3D false;
> > +		inst->sent_eos =3D false;
> > +		return;
> > +	}
> > +
> >  	inst->empty_queue =3D true;
> >  	while (check_cmd) {
> >  		struct queue_status_info q_status;
> > @@ -1659,7 +1683,13 @@ static void wave5_vpu_dec_device_run(void *priv)
> >  	int ret =3D 0;
> > =20
> >  	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream =
data", __func__);
> > -	pm_runtime_resume_and_get(inst->dev->dev);
> > +
> > +	ret =3D pm_runtime_resume_and_get(inst->dev->dev);
> > +	if (ret < 0) {
> > +		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> > +		return;
> > +	}
> > +
> >  	if (!inst->retry) {
> >  		ret =3D fill_ringbuffer(inst);
> >  		if (ret < 0) {

--=-o3TfNheptSAEs7rYlj9F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarraUgAKCRDZQZRRKWBy
9JELAP98PhMzGQE7Kd4kRGg5wydxhztHMXMRB3xPM0ABTgIMXwD/ZTB11zTbixvW
QREg7qD2B4DDTaMyAi013wBWHqvGEgs=
=hWLh
-----END PGP SIGNATURE-----

--=-o3TfNheptSAEs7rYlj9F--
