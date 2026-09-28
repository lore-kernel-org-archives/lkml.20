Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673B84F4039;
	Mon, 28 Sep 2026 21:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790630038; cv=none; b=OVLXiXYLI01l4yMWoA0cWd8r6oZSgSOzGIEld8Nnon1ZTTtaugFoSWnONoNufI9ZoZEa6qsXncbFV0qZ/Z3JrkOGkjPxsmehQ3gpaQ+2inO76SG9ukqRarBEwc2Nl7cKpfoL0NDCb0z6GZILZQY+PbhSBDKtlk3hyd668r5h5nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790630038; c=relaxed/simple;
	bh=f9QTasY+MZq43f1xg5juh3CBMgqFD9HpRSrHoR1iilA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PF67xfyUdBoJP4DNlsgofeM84+34vZYtROIAJoLkRz9MyNQ8DR09OOjmnIk0XvUaY7P2VKfWx3JLt5Na6WejCZSSsdJ/Uuz/pzFN+dq0Zjiz1tM8GxR0q939tHXZKfNOZOfZ4j3GB2AjzenEFFY22/45gz/tbhhPXawuqJ2RIII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VIXAzaXi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VIXAzaXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790630034;
	bh=f9QTasY+MZq43f1xg5juh3CBMgqFD9HpRSrHoR1iilA=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=VIXAzaXit0VHJD4lpdAiACQ5Sx+Q1h0UrnVBl6/PUduut7kY4y+f9z7OwtxfAtJKF
	 14QmojNBFjCdURn+CmY9SaBHE6ZftduS7H22MYzzeuJx2XhR0uy+dSVpdWtfdGcYXF
	 OxRA5Int9RbfhhCvW0bwdbbS1yGUZLYZ5tIyWIiAhSeJhm2PxotqA1aVTzBniYR41S
	 xhsSHt36snZrCQ5af6lIciHRAkddzcUWmXGXQ9WVSuO1QRXMro96KYRH+hYz8jbm6e
	 rIwHBgRwVOgrgH+kBCMz3WvuudZtaFfB718dsiV+FnGRtUzkQ5/cLbF+qJNrMHtW/h
	 avNGPWVp2K9XQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A49B417E00A9;
	Mon, 28 Sep 2026 23:13:53 +0200 (CEST)
Message-ID: <1c34bc88f347384568438058ab69e4d0bc7bb9ca.camel@collabora.com>
Subject: Re: [PATCH v2 2/2] media: chips-media: wave5: Check decoder runtime
 resume errors
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Nas Chung
	 <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 28 Sep 2026 17:13:52 -0400
In-Reply-To: <20260718130037.3306626-3-lgs201920130244@gmail.com>
References: <20260718130037.3306626-1-lgs201920130244@gmail.com>
	 <20260718130037.3306626-3-lgs201920130244@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-7d4MvWLwCQcsX118trUs"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-7d4MvWLwCQcsX118trUs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 18 juillet 2026 =C3=A0 21:00 +0800, Guangshuo Li a =C3=A9crit=C2=
=A0:
> The decoder start_streaming, stop_streaming and device_run callbacks
> resume the VPU before accessing hardware, but do not check the return
> value from pm_runtime_resume_and_get().
>=20
> If runtime resume fails, continuing can access the VPU while it remains
> suspended. Since pm_runtime_resume_and_get() does not retain a runtime PM
> usage reference on failure, the later unconditional
> pm_runtime_put_autosuspend() can also drop an unmatched reference.
>=20
> Check the return value in all three callbacks. Return queued buffers as
> required by vb2 when start_streaming fails, clean up buffers without
> touching hardware when stop_streaming fails, and finish the current
> mem2mem job when device_run cannot resume.
>=20
> Only call pm_runtime_put_autosuspend() after a successful runtime
> resume.
>=20
> Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspend/=
resume")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Nicolas Dufresne =C5=86icolas.dufresne@collabora.com>

Picked, ty

> ---
>  .../chips-media/wave5/wave5-vpu-dec.c         | 36 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index 03d108b808ba..bb59bc962603 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1380,7 +1380,11 @@ static int wave5_vpu_dec_start_streaming(struct vb=
2_queue *q, unsigned int count
>  	int ret =3D 0;
> =20
>  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret =3D pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
> +		return ret;
> +	}
> =20
>  	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
> =20
> @@ -1544,9 +1548,29 @@ static void wave5_vpu_dec_stop_streaming(struct vb=
2_queue *q)
>  	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
> =20
>  	bool check_cmd =3D TRUE;
> +	int ret;
> =20
>  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret =3D pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		struct vpu_src_buffer *vpu_buf;
> +
> +		v4l2_m2m_update_stop_streaming_state(m2m_ctx, q);
> +
> +		if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +			inst->retry =3D false;
> +			inst->queuing_num =3D 0;
> +			while ((vpu_buf =3D inst_src_buf_remove(inst)) !=3D NULL)
> +				;
> +			inst->eos =3D false;
> +		}
> +
> +		wave5_return_bufs(q, VB2_BUF_STATE_ERROR);
> +		inst->empty_queue =3D false;
> +		inst->sent_eos =3D false;
> +		return;
> +	}
> +
>  	inst->empty_queue =3D true;
>  	while (check_cmd) {
>  		struct queue_status_info q_status;
> @@ -1659,7 +1683,13 @@ static void wave5_vpu_dec_device_run(void *priv)
>  	int ret =3D 0;
> =20
>  	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream da=
ta", __func__);
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +
> +	ret =3D pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> +		return;
> +	}
> +
>  	if (!inst->retry) {
>  		ret =3D fill_ringbuffer(inst);
>  		if (ret < 0) {

--=-7d4MvWLwCQcsX118trUs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrYkAAKCRDZQZRRKWBy
9BoAAQCZH+p70zx6wUF2ifQGe0lo1OULxe+RcQHIsM1/Qz7eVAD/czrEhAtI3sSy
QEFQ9Py9lGVuruHp/gtTt4LL3DNw+gA=
=GLkk
-----END PGP SIGNATURE-----

--=-7d4MvWLwCQcsX118trUs--
