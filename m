Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B3824BBEB;
	Mon, 28 Sep 2026 21:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629818; cv=none; b=gpytyRJoHFAgP7zw1n+pL1bKXWNoUq/Ng4GcIrDg9bmkjDpkWYDTqOGTxJ1s7JBHr5PPS35VxACK/uvjRrcSCCpDsjEOXsPkz3PIV7SeTgJgANrswqzR4KWt5XEfyqDlhw5KoWkj2LIEypm1Dmp/YZIRWeUqQBEyQsNuiQbw3Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629818; c=relaxed/simple;
	bh=rWRswMjJNBV37VKPBkrSTVW8oc9a8tCEVPyFHGTO8TM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZI11+nxb95dC6E/U1A/UXZW1RnzBFDWMnFHfq/fko0i27h89Sl7Xm6SrDe+HiH5psZe21UznQEQg2sPa1a+/wvlATh38/4WF3okTSj1UUc8Mh8HEnvmOPjuMvH4M9m+N+NYSU5UQOAUn1pi93EMhL9npAgx6oRpmXgJNrff3Wxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HjrWZsan; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HjrWZsan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790629815;
	bh=rWRswMjJNBV37VKPBkrSTVW8oc9a8tCEVPyFHGTO8TM=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=HjrWZsan5F+g3G6mtqTwflgzqPCX4w3UP4jTO3darzGT6mQZ83dl1YGZzafUFs6Fl
	 RS5R72PDuXjYSzV+MsK9pDZpVB1vq4XqhuGVo0caINBx4fnF7BpBDVw7c7DCaOP7T1
	 F6/2dJ1sP683eYnx0JUJIqUfEIfGjdqDQGZi0hDCWtSfiNI8tI8RjdvLc4gdxLB0EZ
	 CS8Wnl4hwtXsJKKW/astePBq46quMqaI7w3AqTx0ZQWj3/vaqsaCn5TNGsuT8Vuo5q
	 X5U+mLRLhdagcU14iNV3SMo9wmbXDFxJPEILJQqMlSI2uOLjVqPbvpxftTFYnvZk6S
	 TSBRAnZ95ydNQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2F5B817E05F4;
	Mon, 28 Sep 2026 23:10:14 +0200 (CEST)
Message-ID: <e403311cc682d89b44a9d8864422e98429b6931b.camel@collabora.com>
Subject: Re: [PATCH v2 1/2] media: chips-media: wave5: Check decoder qbuf
 runtime resume
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Nas Chung
	 <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 28 Sep 2026 17:10:13 -0400
In-Reply-To: <20260718130037.3306626-2-lgs201920130244@gmail.com>
References: <20260718130037.3306626-1-lgs201920130244@gmail.com>
	 <20260718130037.3306626-2-lgs201920130244@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-MUiEUO9xCjPtJKY8Ido9"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-MUiEUO9xCjPtJKY8Ido9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 18 juillet 2026 =C3=A0 21:00 +0800, Guangshuo Li a =C3=A9crit=C2=
=A0:
> wave5_vpu_dec_buf_queue_dst() resumes the VPU before it may clear a
> decoder display flag. This is needed because clearing the display flag
> accesses VPU registers.
>=20
> However, the return value from pm_runtime_resume_and_get() is ignored.
> If the resume fails, pm_runtime_resume_and_get() returns without holding
> a runtime PM usage reference. The unconditional
> pm_runtime_put_autosuspend() at the end of the function then drops an
> unmatched reference.
>=20
> The failed resume path can also continue into
> wave5_vpu_dec_clr_disp_flag() while the device is still suspended.
>=20
> Check the return value. If the resume fails, complete the queued buffer
> with an error and return without touching the hardware or dropping an
> unmatched runtime PM reference.
>=20
> Fixes: cbb9c0d50e47 ("media: chips-media: wave5: Fix SError of kernel pan=
ic when closed")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Picked, ty

> ---
>  drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index bb2ba9204a83..03d108b808ba 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1290,8 +1290,14 @@ static void wave5_vpu_dec_buf_queue_dst(struct vb2=
_buffer *vb)
>  	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
>  	struct vpu_instance *inst =3D vb2_get_drv_priv(vb->vb2_queue);
>  	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
> +		return;
> +	}
> =20
> -	pm_runtime_resume_and_get(inst->dev->dev);
>  	vbuf->sequence =3D inst->queued_dst_buf_num++;
> =20
>  	if (inst->state =3D=3D VPU_INST_STATE_PIC_RUN) {

--=-MUiEUO9xCjPtJKY8Ido9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrXtQAKCRDZQZRRKWBy
9BacAQCRslDUv3Nny69RjeQpCD7Ey733YObu/dXsw8qQQLLTCwEAikvLoG4i0K8H
5Nj8fhc5ZEqBumbasl9mAZWPzCnSyQU=
=T5F6
-----END PGP SIGNATURE-----

--=-MUiEUO9xCjPtJKY8Ido9--
