Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0CC34C155
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790183771; cv=none; b=JWKc3QnqI77N+sQDWJCDd46gltL9j3oLITis/d6pR57QwOwkncFHhtL3Qo6JB2Re1KrlHxaZSTPe0OnhHvca3HaQ/FzsqQPHauYpNzlwSx5vRzpSn5pI3WrCYyoMdsRPmtuvf7oPgRiTXHhN1WeuItTpMckQaPXGB5cEnXBKQ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790183771; c=relaxed/simple;
	bh=s3VoHPfdGXRS6MChYVrimL6jd8QOiYICb6vP73NM4BQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pAWjsDSQ+qRKEcv8NtXn+o/IOKUYJZVANBo0rMstnzupu5KlBsPw8xOBOHK0mEstefI0NMYEWpbOROKJmvQKz49kDmd8otSeLspF0A4TOhQDQQPjZee+f5sEnLhEo7ZzzOtR69pUczBBo/UMii69AEyro8du1ok/g6ArQSkw6wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=CkWNvJ5U; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="CkWNvJ5U"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee6so492913e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790183759; x=1790788559; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Tnw0WBB0ykL71IZQC44P5CqwYSfWV4ItBvg5nSQyIs=;
        b=CkWNvJ5UR4gUnewigAHE0GNEDdeALBO5YjU7io0RqPC9l+duWuH3LbyDz8Gnh5S+Kb
         PHznbywUpDTBpG28ZKCrUxa6R2bGKzzjxwkTUYkoiTGX4RK5cKpjkbzS7MZ+MdpltcAs
         S51jrdt69j0zBGu1+fC0JW+IJncIpIERx532A1uiO8MZZam+ZsUA3pH8N0A+HXdTJ3Nr
         jv9M6rIitBcfqgvWtGZC8h3bVHh2wqXaJY8PlnHLF8yXpfuqIDGNBEqYCz4RnEnO0kST
         mLgy0w6zrH147SLFjgm/ZdXVmsL7IfoWECDMnrIRL/xfANH7qDWEFzDiCdnB1WP8/Twv
         YWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790183759; x=1790788559;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Tnw0WBB0ykL71IZQC44P5CqwYSfWV4ItBvg5nSQyIs=;
        b=TcIU6JzP5U7Qe9Noln/aNMm3yHgzplpzUHw05+zAnl0iBCZEVwW7KtRv+ngdLXV50l
         /B7rmnmg7PGGL7SudoDEBw84uGbew3n+w0YtDgusGiP+CnHUjNXr8A5nnrF4KeAEOZ0u
         BOd4ge574G4+8/In6zI3HpiqJURBQTG97eMGMZGWQn8T56syX+H2PhX9G7u5kmTvfBf8
         2DTo646YhOxCpUUe56LmMyH4SKZ6DH/Qv7MxozA7s5Q5XaH6QwiKUm3aEa8vWIzxvwH1
         iMZJEs4iVkgF+uPtcrBYus0pkBYaIzWmeImeyjSVDhyOkaRDMkbpzmhhFn4+YvKEPW1j
         ebfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ1qfDA8ff+9We/iqDXI/tqXjHZGDgMZb7Wd/Llwm5Ch+myAnPIBVG6Q4wdi0Sz3UbdHFO0S/dW59jTSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kHW9HBkav5PCycAayQWrPfb6YS6HldVnE5O4B0yAyzMjB6Um8S
	ou06nReeavWjHI/sp1eoPpjEOR3AVolQkzpeDlbPDv9nKkbq6cB4Os9XXfbkmj3VFw8=
X-Gm-Gg: AYBFou1m1AJChV2A9rGQZMQzBFNsl/IMLkHEHXprN8U8h07m1+bNy25OseLci/0X0tW
	keXoeDmSDRe4gFWueKdGhvlc5HT8JpJTpSSkTMHn5KbCNAYAHZkgsnxir3dmvTEcgov80N0ueUD
	8jgjd/pHcl1a/NMmAtj8D7ZrdemYDYACS4hkOVhklkBa5O8vNkBxZSEXTiX+0755+gPDS422YIo
	wwj5W1DMEXpyiPkVbk1KUzM2EiyJTh8qx7CYGJMbN55fJsvrY/eb84IBLxf9zqN3JMlZZPEZVrm
	VeVnDV1ef3ANkm7NsJdOJ0dwux+eKhcxUJolq43Dpt3lEiMrFxk1Cc3WsegrW9pKRTWlxdsDwrq
	iRmBT8uJvHap94gqnW0CkCzovNqb4KDVMOLP7uYo1z4vGTee/A364GXr7KNMWUEMxBj+B33/+/d
	+ilMS6G8WDo5v7vMNkO0ucsPxmjDIAR4nfWqxKxmgWIm9HYkjHRJgzbMqhHKJTiUg4GES7P0xSs
	jWrQJUcvu9MxYTAU21YpW9qAELW/Ku4eC3LooOjYY5qypD3xZAzr6JjXMq/t55VwJS2kw==
X-Received: by 2002:a05:6122:e148:b0:5c7:a3a3:a4bd with SMTP id 71dfb90a1353d-5c9f157c88fmr3579854e0c.4.1790183758932;
        Wed, 23 Sep 2026 10:15:58 -0700 (PDT)
Received: from [192.168.0.187] (modemcable086.138-200-24.mc.videotron.ca. [24.200.138.86])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ca2876229dsm2214244e0c.3.2026.09.23.10.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:15:58 -0700 (PDT)
Message-ID: <f3b50572e116cd82c518e013961f980121686e00.camel@ndufresne.ca>
Subject: Re: [PATCH] media: v4l2-ioctl: zero the ext control built for
 VIDIOC_{G,S}_CTRL
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nick Rogers <nick@getfieldwork.ai>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Brian Daniels
 <briandaniels@google.com>,  Alexandre Courbot	 <gnurou@gmail.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 23 Sep 2026 13:15:55 -0400
In-Reply-To: <20260923160936.33445-1-nick@getfieldwork.ai>
References: <20260923160936.33445-1-nick@getfieldwork.ai>
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
	protocol="application/pgp-signature"; boundary="=-QpuVmG4o+y4nZvyD+Tip"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-QpuVmG4o+y4nZvyD+Tip
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 23 septembre 2026 =C3=A0 17:09 +0100, Nick Rogers a =C3=A9crit=
=C2=A0:
> When a driver implements the extended control ioctls but has no control
> handler, v4l_g_ctrl() and v4l_s_ctrl() pass VIDIOC_G_CTRL and
> VIDIOC_S_CTRL on as a single struct v4l2_ext_control built on the stack.
> Only its id and value are set, and check_ext_ctrls() clears reserved[0]
> and reserved2[0]; the control's size and the rest of both structures are
> left uninitialized.
>=20
> A driver that forwards the controls rather than handling them through
> the control framework sees that stack garbage. The virtio-media driver
> under review takes a nonzero size as a payload to copy from userspace,
> so VIDIOC_G_CTRL and VIDIOC_S_CTRL fail with -EINVAL through it whenever
> the stack is dirty. GStreamer's V4L2 encoders set their profile with
> VIDIOC_S_CTRL, and cannot negotiate against such a device.
>=20
> Zero-initialize both structures.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Nick Rogers <nick@getfieldwork.ai>

One may argue that it could have been fixed in the unique driver not using =
the
ctrl framework, but I personally like the simplicity of the fix.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> Found running the virtio-media v9 series [1] in a VMM with a host-side
> stateful encoder: GStreamer's v4l2h264enc fails to negotiate because
> VIDIOC_S_CTRL returns -EINVAL. Tested on 6.18 with that series applied:
> VIDIOC_G_CTRL and VIDIOC_S_CTRL now reach the device intact, and
> v4l2-compliance 1.30.1 reports the same results with and without this
> patch. Build-tested on media.git next (arm64, W=3D1, no new warnings).
>=20
> [1] https://lore.kernel.org/all/20260917171921.2810550-1-briandaniels@goo=
gle.com/
>=20
>  drivers/media/v4l2-core/v4l2-ioctl.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 17ba1ae70..b7d248ab7 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2357,8 +2357,8 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *=
ops, struct file *file,
>  	struct video_device *vfd =3D video_devdata(file);
>  	struct v4l2_control *p =3D arg;
>  	struct v4l2_fh *vfh =3D file_to_v4l2_fh(file);
> -	struct v4l2_ext_controls ctrls;
> -	struct v4l2_ext_control ctrl;
> +	struct v4l2_ext_controls ctrls =3D {};
> +	struct v4l2_ext_control ctrl =3D {};
> =20
>  	if (vfh && vfh->ctrl_handler)
>  		return v4l2_g_ctrl(vfh->ctrl_handler, p);
> @@ -2388,8 +2388,8 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *=
ops, struct file *file,
>  	struct video_device *vfd =3D video_devdata(file);
>  	struct v4l2_control *p =3D arg;
>  	struct v4l2_fh *vfh =3D file_to_v4l2_fh(file);
> -	struct v4l2_ext_controls ctrls;
> -	struct v4l2_ext_control ctrl;
> +	struct v4l2_ext_controls ctrls =3D {};
> +	struct v4l2_ext_control ctrl =3D {};
>  	int ret;
> =20
>  	if (vfh && vfh->ctrl_handler)

--=-QpuVmG4o+y4nZvyD+Tip
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarQJSwAKCRDZQZRRKWBy
9FaIAQDWFRB/8K9U0kUK3lCh8LBxGAXbkQRJHHQaVr9enrpbkwEA28VLadXOqMoR
KqXQ3JeT7nnOx2yl6iqY/8biyela0wA=
=IRRl
-----END PGP SIGNATURE-----

--=-QpuVmG4o+y4nZvyD+Tip--
