Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4924DDB50
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605931; cv=none; b=c8qBakjggRPivX/TZu1iaoVmlTjR89MwMe1emwnN8ez3kI+VRM+Whg1yBJChP3yMtOVHh6zBejfKH0nS0JncudwjCNaOuj5rnYdV1Crmzb8vLTDkSIsjBFTeX41LAuU07G2dlqNZyCovi9cPdG5ZZFj6Uos2n8mDDNZNrJo4PJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605931; c=relaxed/simple;
	bh=PlUKL150dn2du9L3IVzBI7wLkDXJFZiENeb7jzv74sw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D1hnY/hDxMkdIFpJiXqhOssu89LsTAFa00mwwJjMIjfPlsXdlIZpV+GXpolmR3VN4UAXywb6dO4kgeu2z8ZDXSazbHskA+qh7rCwragQ2EV42Fn0Lrchovi7xd9FkLOgAYgtaYWzeSgB7gqzyrLEsnIQa7YABMSzqLVbYzhHDHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=qL1QSMre; arc=none smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="qL1QSMre"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e849c5fe49so1389777b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790605923; x=1791210723; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wplymnUDmIm0BRSXdlFUTBVv5g6UzG2wi49zmSLRRpU=;
        b=qL1QSMrek7nWRhd6mafQbAxpI0T2f/A5trFhlnK6Z53ZVIzUfhv8sNyl/uP4LmKee8
         DF6HDXOOWtuOaZBM8C+epFLQJZFfS10sF4mfTDDtCJbFRDwno9+nMw4NIMQ+e3+t1b4W
         ws45jkx0q19kJ7Kf+dRG/pNcvD3zBy1YXu1i1u4R0UN4PmGI8uH3laVtTgEpBtKc/ad3
         vWJqM7Xp9xXtDpZ261wAC/LTJSRAmz5C/0Xr5FMrOQUce0qnXPMgKi79Eu6uVGq8zFbY
         DQbG8ZvujFc+VqwoIMEMHPykE2Lya9hJa+O4veajCecxmS41ltG+QanBu9odg8Jg/hoI
         5tGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605923; x=1791210723;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wplymnUDmIm0BRSXdlFUTBVv5g6UzG2wi49zmSLRRpU=;
        b=ZQi2DMSqGDl7uePe1DOM/u10aAdcZeQBO/o2u1vF4d7XjUGCVEis/g28ijJXCmowb5
         aj0ldwSd27eRSBc+C98PwRrEeQlW0VaNj/vpuCjaM6Fc1ZepfiUl7sjJk+/gSlHnGDvh
         hKpd/O6r8KCp7zY6iQl38vbeqV6HsqV/iZjK1HUUF9YUsZAll3e+12Dv9YWWnhi6xkdE
         BFugQ6kIyQKAaUOlbqvFFt35/7YJIlh+5jxgMXSG2TDXMkVZBpN3EYQ8M1pE819aigE3
         t4zIMWVUoo6kOC5fOZ92/ch60Tf5lZ/TlRlyvrZYrSxeVZyObKy5DS5QpxMsmYIJZ8hb
         RdUg==
X-Forwarded-Encrypted: i=1; AKwUvBwVpBOsPQqUCMdf/bFBaEGxh5pN3n7WSq2P114QAvI/4+WTZtTitwoEoeQLJJhjC0G2BCe99QtrwFTI2ck=@vger.kernel.org
X-Gm-Message-State: AFuF++kopC2IrO2b8pBzVgJ90UddB827R5u91ULsVM+Z7AZ94xOLO+DB
	bzU7lmOUP7R+oWnhVKQNz81vGzssBuiaRUYRoTu4y+N4BuxxlCS6H4OnenwPVtvFcsc=
X-Gm-Gg: AYBFou0/ht722cQW77ZkYJ20ufv/PSjlTZxJzuaGpp77pHRepepl8bsVAH+TL/CDD66
	t+c1FtvDScrux+FAmstUqU3Zshhb1Rm1NyP2wGhxIuYh3WSzF0hvXO5YQA9+vK8UPiFygooPy4/
	6wUHJrczZfVxpBS/8ELHbM1HGF3w56vB5cZV37ZaHTAHP7uHvFbOKleTuZ6M5fymmq+YM+D5lvE
	mnnruxc1+mjuifDTR+gzimToWZqyA2PC6YPv2qGv+swloe7syrEDHmnpbBWwEUELIY5+gxC2izx
	BPqj/k03tq4Mvop16F4zAOROB3nNNSk91rJj+MdHSj1T/MgMnAbRiW3mOXZL6I68VhMVTVCMKgS
	Ny50XA283wmE4+59i7FO/qZz/lBhmdxndBVcwH+Zt1h9lITME6VQPfcGg1/UnSAaBygG9acunwp
	TwZ67iFfC+ad0E6sIvWe8mqlBgcmHfsqlq+7/W3BTP+3fVkI7cWXgkEp6Ex2fflJCxByX8ZL0mj
	jmTm6/89a0U7L6KLrHB8j7Y
X-Received: by 2002:a05:6808:10c7:b0:4d6:48c4:a819 with SMTP id 5614622812f47-4d72cb41616mr12356739b6e.29.1790605923559;
        Mon, 28 Sep 2026 07:32:03 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ebbaf87920sm1581461b6e.3.2026.09.28.07.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:02 -0700 (PDT)
Message-ID: <0235d9d9418c998b6fe18c51db4e7ff308cc2282.camel@ndufresne.ca>
Subject: Re: [PATCH v7 2/5] media: uapi: Introduce new control for video
 encoder ROI
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
Date: Mon, 28 Sep 2026 10:32:00 -0400
In-Reply-To: <20260924-enc_roi_enable-v7-2-6fa7413af23c@oss.qualcomm.com>
References: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
	 <20260924-enc_roi_enable-v7-2-6fa7413af23c@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="=-EGki3gnESU+nfIDZ1ISo"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-EGki3gnESU+nfIDZ1ISo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 24 septembre 2026 =C3=A0 17:28 -0700, Deepa Guthyappa Madivalara a=
 =C3=A9crit=C2=A0:
> Add array control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
> video encoder Region of Interest to allow applications to specify
> different quality levels for specific regions in video frames. Define
> V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
> codec from the hardware encoder and set the corresponding ROI MB delta_qp
> map that adjusts quantization relative to the frame QP's base value.
>=20
> This enables use cases like prioritizing quality for faces in video
> conferencing or important objects in surveillance footage while reducing
> bitrate for less critical areas.
>=20
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.=
com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 26 ++++++++++++++++=
++++++
>  drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c          | 10 +++++++++
>  include/uapi/linux/v4l2-controls.h                 |  2 ++
>  4 files changed, 41 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/=
Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..a02ec20ec18f0e684973964d2=
de1759ad179b819 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1674,6 +1674,32 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type=
 -
>      Codecs need to always use the specified range, rather then a HW cust=
om range.
>      Applicable to encoders
> =20
> +``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (__s8 array)``
> +    This control is a dynamically sized 1-dimensional array,
> +    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
> +    This array control is used to set ROI MB map delta_Qp for the whole =
frame.
> +    The frame is divided into a grid of MB Size by MB Size pixels (MB Si=
ze is
> +    obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``). Each bl=
ock
> +    is configured with delta_Qp in raster order. The valid range for del=
ta_Qp
> +    is encoder dependent.
> +    Applicable to encoders.

Since there is no manue to enable/disable this. Can you define in the spec =
how
one should disable this feature ?

> +
> +``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE`` (integer)
> +    A read-only control that reports the MB Size used for the ROI delta_=
QP map.
> +    The supported MB Size depends on the encoder codec.
> +    Only square MBs are supported. The value returned represents the
> +    width and height of each block in pixels. The ROI delta_QP map provi=
ded
> +    through the ROI control must use the MB Size reported by this contro=
l.
> +    The number of entries in the ROI delta_QP array is determined by the
> +    frame resolution and the reported MB Size. If frame_width or frame_h=
eight
> +    is not MB Size aligned, they must be ceiled using ceil(frame_width/M=
B Size)
> +    ceil(frame_height/MB Size) for calculating the array size.
> +    For example, for a QCIF frame if reported MB Size is 16,
> +    the delta_QP array must contain 99 entries, ceil(176/16) * ceil(144/=
16) =3D 99.
> +    For frame resolutions that are not aligned to the MB size, for examp=
le
> +    1920x1080, if the reported MB size is 32, the delta_qp array
> +    must contain ceil(1920/32) * ceil(1080/32) =3D 2040 entries.
> +
>  .. raw:: latex
> =20
>      \normalsize
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index c5df0e0a54f81c73975f427957b7c99fd421d5ad..2318a548f16ebc1ec582f829c=
7945a8998b96708 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1410,6 +1410,9 @@ static int std_validate_compound(const struct v4l2_=
ctrl *ctrl, u32 idx,
>  			return -EINVAL;
>  		break;
> =20
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
> +		break;
> +
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index e062f2088490470c42d6c579ff7675be454a29b0..8f895060799ea13443143edd3=
98dfb97f4ba0085 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -974,6 +974,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
>  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
>  	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:		return "Encoder ROI MB Delta=
 QP";
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:			return "Encoder ROI MB Size";
> =20
>  	/* VPX controls */
>  	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Par=
titions";
> @@ -1622,6 +1624,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enu=
m v4l2_ctrl_type *type,
>  	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
>  		*type =3D V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
> +		*type =3D V4L2_CTRL_TYPE_S8;
> +		*flags |=3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
> +		*type =3D V4L2_CTRL_TYPE_U8;
> +		*flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +		break;
>  	default:
>  		*type =3D V4L2_CTRL_TYPE_INTEGER;
>  		break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index d17e41d51d2ec1ccb9e8ceb3ccc89ebc4381a4cd..be484156ed35a19229be23ad2=
4fd224cb5a8a0cc 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -941,6 +941,8 @@ enum v4l2_mpeg_video_av1_level {
>  };
> =20
>  #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
> =20
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by =
V4L2 */
>  #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)

--=-EGki3gnESU+nfIDZ1ISo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarp6YAAKCRDZQZRRKWBy
9PLZAQDqqutEjxJKBF4aX4VidB8wRkgp5wKrCMvgAzo3hEozvwEAgMiLNzE2wCcL
zJPflDm0uNaEu8cgQxyhN3K/CJspfAc=
=+3eK
-----END PGP SIGNATURE-----

--=-EGki3gnESU+nfIDZ1ISo--
