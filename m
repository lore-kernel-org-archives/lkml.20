Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414056;
	b=r3WrA21G22k3sgleRn9sPrsUAPjaquNWcXY7pNmHY/x2BSEhnripTPuPHU66L/+BgeFd
	 +qhXNaaYj2FND2bliWeNGS9srdKCK9DXTs4/IKdNgiQsJf37wIbZ6QZaV2zIHon6OVMhZ
	 5PT3GmkS6i/7deIWijgxB2w/iqKBLIVOwqX1DuJfj3njNt+WNAbaEB6mQOz7Piaf4sjD0
	 JkJe39a7ctwcA6Xxd4FW9YxnxtcH0E92Oz1VO190nHgiT2Yij7u8oNU+kDrFgK2DpgMe9
	 eegUarI4kKZ8iBPG7iHgCFAM5zv5k5SolZarOpXJl4Ig5/erR8oWakGaDEQcvvxSa9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414056;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=8PIwwuvGx4dg2zZ4xlkoKMKwWpwNL9QB1hZ+n9A+Veo=;
	b=y2jd/QYTuqPX918VEEfbo+jV4jfKrFhKE/rRkJ8DtMJxxqzvGw8JgLr4D/i6knIncnqH
	 7eot5C7gixNUCyAKNT151VoUTpEy5+9OQ2PZnsc/KfriurwymgxfDC8KlMy/ZTrhj7wcW
	 kPYl4lkflrED0A42OyEf5fP3MVrU7pA0tn/UJec13srU4qcL6MK+6Aarmal0OO0LrLLRT
	 ijPln5/w5E6VjHZkjP0uATpToJFUeAYYORL2P8cNr5IffdGfqnpDcZr1iX5AfUnzjPSZR
	 ieuhprp5/ElYI5+auAXLMGL+ZXudXQg/VWPwG+IN3IyKWAFjdVii+TuKHpb7NaWLVdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RJZqXdAP;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF5A606A321;
	Wed, 11 Nov 2026 16:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FF5A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RJZqXdAP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794414047;
	bh=3TiRtBRNtkBquPgK528nEXIk+5j999A1W706HVwqbuE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RJZqXdAPgx+IKfAIxwhExq9C0IJr4FEgCuV7Xh6QpsBCbjCLM7oX8LrOfuTf5H62P
	 mFnLHFhjbdCO5mp3rBLjMjZZM7rsymGQJKsJbwWuDDC3HBQCUahkuknPVrLuubz6bB
	 xidLeswWL0LWjJzqh4s3d4MBARPFfGAzjXRCHudkbIpdrR6AMLY4BYKW88ZbzeCfvq
	 IdkJoLIAW0v/7t6UiPNGvppiGAgxx29Cq/r4dtSMMBDw/DyeHNvKRM+U4eILEJUO+n
	 vzAnK1B33f4iKRiycqpDNX0LXBm7my/7wXy+VHz9R2mGpdZmughF9mbfps7tPeNt2v
	 /c/T1W/itz/9A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D88A517E0840;
	Wed, 11 Nov 2026 17:20:46 +0100 (CET)
Message-ID: <749a3f00696551f4738c70aef2241b96e57f221a.camel@collabora.com>
Subject: Re: [PATCH v1] media: codecs: vp9: Add tile_info control
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 	hverkuil+cisco@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Date: Wed, 11 Nov 2026 11:20:45 -0500
In-Reply-To: <20261110152826.128259-1-benjamin.gaignard@collabora.com>
References: <20261110152826.128259-1-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-hSdHJS2SNWcR/aIdP8CL"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-hSdHJS2SNWcR/aIdP8CL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 10 novembre 2026 =C3=A0 16:28 +0100, Benjamin Gaignard a =C3=A9cri=
t=C2=A0:
> Some hardware accelerators needs to know tiles location and size
> in the bitstream.
> Tiles size are coded inside the bitstream so it is up to the
> userland to provide theses information by calling
> V4L2_CID_STATELESS_VP9_TILE_INFO_ENTRY control.

I'm missing both a driver and userspace implementation to process this one.

cheers,
Nicolas

>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/v4l/ext-ctrls-codec-stateless.rst   | 42 +++++++++++++++++++
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     |  8 ++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  5 +++
>  include/media/v4l2-ctrls.h                    |  2 +
>  include/uapi/linux/v4l2-controls.h            | 27 ++++++++++++
>  include/uapi/linux/videodev2.h                |  2 +
>  7 files changed, 90 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-statel=
ess.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.r=
st
> index d7a3b8ef03a7..effd3eb47e29 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -2050,6 +2050,48 @@ This structure contains all loop filter related pa=
rameters. See sections
>        - When set, the bitstream contains additional syntax elements that
>          specify which mode and reference frame deltas are to be updated.
> =20
> +``V4L2_CID_STATELESS_VP9_TILE_INFO_ENTRY (struct)``
> +    Specifies VP9 Tile Info entry as describe in section 6.4 "Decode til=
e syntax"
> +    of :ref:`vp9`.
> +    MiRowStart, MiRowEnd, MiColStart and MiColEnd can be retrieved from =
struct
> +    v4l2_ctrl_vp9_frame using tile_row and tile_col.
> +
> +.. c:type:: v4l2_ctrl_vp9_tile_info_entry
> +
> +.. raw:: latex
> +
> +    \small
> +
> +.. tabularcolumns:: |p{1.2cm}|p{9.2cm}|p{6.9cm}|
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_ctrl_vp9_tile_info_entry
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u32
> +      - ``tile_offset``
> +      - Specifies the offset from the tile data after frame header,
> +        i.e. where the coded tile data actually starts.
> +    * - __u32
> +      - ``tile_size``
> +      - Specifies the size in bytes of the coded tile.
> +        Equivalent to "tile_size" in :ref:`vp9`
> +    * - __u32
> +      - ``tile_row``
> +      - Specifies the row of the current tile.
> +        Equivalent to "tileRow" in :ref:`vp9`
> +    * - __u32
> +      - ``tile_col``
> +      - Specifies the col of the current tile.
> +        Equivalent to "tileCol" in :ref:`vp9`
> +
> +.. raw:: latex
> +
> +    \normalsize
> +
>  .. _v4l2-codec-stateless-hevc:
> =20
>  ``V4L2_CID_STATELESS_HEVC_SPS (struct)``
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst=
 b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index d78328152b75..836b227c10c9 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -258,6 +258,10 @@ still cause this situation.
>        - ``p_vp9_frame``
>        - A pointer to a struct :c:type:`v4l2_ctrl_vp9_frame`. Valid if th=
is
>          control is of type ``V4L2_CTRL_TYPE_VP9_FRAME``.
> +    * - struct :c:type:`v4l2_ctrl_vp9_tile_info_entry` *
> +      - ``p_vp9_tile_info_entry``
> +      - A pointer to a struct :c:type:`v4l2_ctrl_vp9_tile_info_entry`. V=
alid if this
> +        control is of type ``V4L2_CTRL_TYPE_VP9_TILE_INFO_ENTRY``.
>      * - struct :c:type:`v4l2_ctrl_hdr10_cll_info` *
>        - ``p_hdr10_cll``
>        - A pointer to a struct :c:type:`v4l2_ctrl_hdr10_cll_info`. Valid =
if this control is
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 6e751a043a21..a426a716f3d4 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -425,6 +425,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ct=
rl)
>  =09case V4L2_CTRL_TYPE_VP9_FRAME:
>  =09=09pr_cont("VP9_FRAME");
>  =09=09break;
> +=09case V4L2_CTRL_TYPE_VP9_TILE_INFO_ENTRY:
> +=09=09pr_cont("VP9_TILE_INFO_ENTRY");
> +=09=09break;
>  =09case V4L2_CTRL_TYPE_HEVC_SPS:
>  =09=09pr_cont("HEVC_SPS");
>  =09=09break;
> @@ -1415,6 +1418,8 @@ static int std_validate_compound(const struct v4l2_=
ctrl *ctrl, u32 idx,
> =20
>  =09case V4L2_CTRL_TYPE_VP9_FRAME:
>  =09=09return validate_vp9_frame(p);
> +=09case V4L2_CTRL_TYPE_VP9_TILE_INFO_ENTRY:
> +=09=09break;
>  =09case V4L2_CTRL_TYPE_AV1_FRAME:
>  =09=09return validate_av1_frame(p);
>  =09case V4L2_CTRL_TYPE_AV1_SEQUENCE:
> @@ -2135,6 +2140,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_=
ctrl_handler *hdl,
>  =09case V4L2_CTRL_TYPE_VP9_FRAME:
>  =09=09elem_size =3D sizeof(struct v4l2_ctrl_vp9_frame);
>  =09=09break;
> +=09case V4L2_CTRL_TYPE_VP9_TILE_INFO_ENTRY:
> +=09=09elem_size =3D sizeof(struct v4l2_ctrl_vp9_tile_info_entry);
> +=09=09break;
>  =09case V4L2_CTRL_TYPE_AV1_SEQUENCE:
>  =09=09elem_size =3D sizeof(struct v4l2_ctrl_av1_sequence);
>  =09=09break;
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index e062f2088490..f7a98925027b 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1228,6 +1228,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  =09case V4L2_CID_STATELESS_MPEG2_QUANTISATION:=09=09return "MPEG-2 Quant=
isation Matrices";
>  =09case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:=09return "VP9 Probabiliti=
es Updates";
>  =09case V4L2_CID_STATELESS_VP9_FRAME:=09=09=09return "VP9 Frame Decode P=
arameters";
> +=09case V4L2_CID_STATELESS_VP9_TILE_INFO_ENTRY:=09=09return "VP9 Tile In=
fo Entry";
>  =09case V4L2_CID_STATELESS_HEVC_SPS:=09=09=09return "HEVC Sequence Param=
eter Set";
>  =09case V4L2_CID_STATELESS_HEVC_PPS:=09=09=09return "HEVC Picture Parame=
ter Set";
>  =09case V4L2_CID_STATELESS_HEVC_SLICE_PARAMS:=09=09return "HEVC Slice Pa=
rameters";
> @@ -1602,6 +1603,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enu=
m v4l2_ctrl_type *type,
>  =09case V4L2_CID_STATELESS_AV1_SEQUENCE:
>  =09=09*type =3D V4L2_CTRL_TYPE_AV1_SEQUENCE;
>  =09=09break;
> +=09case V4L2_CID_STATELESS_VP9_TILE_INFO_ENTRY:
> +=09=09*type =3D V4L2_CTRL_TYPE_VP9_TILE_INFO_ENTRY;
> +=09=09*flags |=3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> +=09=09break;
>  =09case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:
>  =09=09*type =3D V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY;
>  =09=09*flags |=3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index cec9217d97ac..286e72a00a9d 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -45,6 +45,7 @@ struct video_device;
>   * @p_h264_pred_weights:=09Pointer to a struct v4l2_ctrl_h264_pred_weigh=
ts.
>   * @p_vp8_frame:=09=09Pointer to a VP8 frame params structure.
>   * @p_vp9_compressed_hdr_probs:=09Pointer to a VP9 frame compressed head=
er probs structure.
> + * @p_vp9_tile_info_entry:=09Pointer to a VP9 tile info structure.
>   * @p_vp9_frame:=09=09Pointer to a VP9 frame params structure.
>   * @p_hevc_sps:=09=09=09Pointer to an HEVC sequence parameter set struct=
ure.
>   * @p_hevc_pps:=09=09=09Pointer to an HEVC picture parameter set structu=
re.
> @@ -83,6 +84,7 @@ union v4l2_ctrl_ptr {
>  =09struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
>  =09struct v4l2_ctrl_vp9_compressed_hdr *p_vp9_compressed_hdr_probs;
>  =09struct v4l2_ctrl_vp9_frame *p_vp9_frame;
> +=09struct v4l2_ctrl_vp9_tile_info_entry *p_vp9_tile_info_entry;
>  =09struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
>  =09struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>  =09struct v4l2_area *p_area;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index d17e41d51d2e..8eb8da0073cd 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -2642,6 +2642,8 @@ struct v4l2_ctrl_hevc_ext_sps_lt_rps {
> =20
>  /* Stateless VP9 controls */
> =20
> +#define V4L2_VP9_MAX_TILE_COUNT=09=09=09512
> +
>  #define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED=090x1
>  #define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE=090x2
> =20
> @@ -2924,6 +2926,31 @@ struct v4l2_ctrl_vp9_compressed_hdr {
>  =09struct v4l2_vp9_mv_probs mv;
>  };
> =20
> +#define V4L2_CID_STATELESS_VP9_TILE_INFO_ENTRY (V4L2_CID_CODEC_STATELESS=
_BASE + 302)
> +/**
> + * struct v4l2_ctrl_vp9_tile_info_entry - VP9 Tile Info entry
> + *
> + * Represents a single VP9 tile inside. Note that MiRowStart,
> + * MiRowEnd, MiColStart and MiColEnd can be retrieved from struct
> + * v4l2_ctrl_vp9_frame using tile_row and tile_col.
> + * See section 6.4 "Decode tile syntax" for more details.
> + *
> + * @tile_offset: offset from the tile data after frame header,
> + * i.e. where the coded tile data actually starts.
> + * @tile_size: specifies the size in bytes of the coded tile. Equivalent=
 to
> + * "tile_size" in the VP9 Specification.
> + * @tile_row: specifies the row of the current tile. Equivalent to "tile=
Row" in
> + * the VP9 Specification.
> + * @tile_col: specifies the col of the current tile. Equivalent to "tile=
Col" in
> + * the VP9 Specification.
> + */
> +struct v4l2_ctrl_vp9_tile_info_entry {
> +=09__u32 tile_offset;
> +=09__u32 tile_size;
> +=09__u32 tile_row;
> +=09__u32 tile_col;
> +};
> +
>  /* Stateless AV1 controls */
> =20
>  #define V4L2_AV1_TOTAL_REFS_PER_FRAME=098
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 5373dba640fa..b4338af93a39 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1903,6 +1903,7 @@ struct v4l2_ext_control {
>  =09=09struct v4l2_ctrl_mpeg2_quantisation __user *p_mpeg2_quantisation;
>  =09=09struct v4l2_ctrl_vp9_compressed_hdr __user *p_vp9_compressed_hdr_p=
robs;
>  =09=09struct v4l2_ctrl_vp9_frame __user *p_vp9_frame;
> +=09=09struct v4l2_ctrl_vp9_tile_info_entry *p_vp9_tile_info_entry;
>  =09=09struct v4l2_ctrl_hevc_sps __user *p_hevc_sps;
>  =09=09struct v4l2_ctrl_hevc_pps __user *p_hevc_pps;
>  =09=09struct v4l2_ctrl_hevc_slice_params __user *p_hevc_slice_params;
> @@ -1984,6 +1985,7 @@ enum v4l2_ctrl_type {
> =20
>  =09V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR=09=3D 0x0260,
>  =09V4L2_CTRL_TYPE_VP9_FRAME=09=09=3D 0x0261,
> +=09V4L2_CTRL_TYPE_VP9_TILE_INFO_ENTRY=09=3D 0x0262,
> =20
>  =09V4L2_CTRL_TYPE_HEVC_SPS=09=09=09=3D 0x0270,
>  =09V4L2_CTRL_TYPE_HEVC_PPS=09=09=09=3D 0x0271,

--=-hSdHJS2SNWcR/aIdP8CL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavSV3QAKCRDZQZRRKWBy
9BQLAP4nzhJAlZarSBn4qmpID+kiWWwNL2ERWPCfa/utbw8f8wEA7IrnWafNIuce
F1B/H74s0CeC/Bz2MidykQgBa8r/zgc=
=5rnV
-----END PGP SIGNATURE-----

--=-hSdHJS2SNWcR/aIdP8CL--
