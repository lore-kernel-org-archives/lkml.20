Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360065;
	b=Wz5ZWXkypaVh3pOYCGVYRCoHfRrtusduT5otG+q4Pmdi5qSi3Zw40u72oRIIfcV4de/6
	 jDcS3KfBpgz4B/cPGg3OHBGKZU6vG9mPqILTokCjR8wnSwph5Grh/NG3Jp4cu7+NSz4Jr
	 utyJikWDmQs7eixMkYg7iV1dchDhCjNdMsWHiFjoiVfoPAmCG97W3D5nhDkLJ7nWmUfai
	 wkUAq/9vEsbH9k3P7HG9fkoc4n3jSF9mL1m1cK7QnT+OaobosSJsz9Kh1b0B7XiiPOFxz
	 9GNlWFap4/B28+b8ojUbTMBi2TUhLA8e5CeA248W55xjhvjLpIF1iYXdhqBw0uklc5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360065;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=AF3Qo3XVIXk57CdqfqnQW3ff/YbSrfnHQDVjoesFyAQ=;
	b=BXCBHsPZxgks7Pz/Rq8tHcsdPMZOTkJg44pg85B8Ll5uSWAQL/v69Xxh3NtVYid2eLAx
	 tglaWX+cNdc30L0YAnOsHddcYk78gtdYWqwL0oF/flev2egj8hbZNcI4V9ZiEfwv+mFYy
	 rtB5oXGyuWf67VdsYRNed9o9k5i3fhKBko4Cf4P/2uadSwIDha+UxJzXZei6XDnGyeEC0
	 2S4Jt9PSygM2+5MNV1ULM10ZJr3zsyLKjfbVOAysx4HjdjqlG1Bzjry+AevxH+fAVttxT
	 zAV26ILlI0hPjsu5UzIj0zPhjxG2syaHO1XqYLVEPy9UBtxc5I/ulEfTKDbFMj4fC5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pw+2XUw+;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD342606A332;
	Wed, 11 Nov 2026 01:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD342606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pw+2XUw+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794360062;
	bh=5ST42t6aMAPhfYqb3SJyx/zrrBb1ZAicX8/Qne1e7Ls=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pw+2XUw+x1I4zzQA4vsEK6VUySjq0dBoxJWP4zrSPCuU8yDVRwzqaigkIihwz9NDq
	 L0h1Szyoa23E2/MqZQUtoUY7WGoFHUCB8qdcWIqubpk2HrNJIoD37vUv8DK0hPQc2u
	 pGJfES6RRvhqkYEPESrXqLEzxFwj69BzjKBQBHmKOMdxw7hVwDBXsNpxdukOJd7Zgp
	 rsZ9Mb1z/fXDwDw9ND7y0XaR85n24o0Qno3rOeG41NHAGAI8mTbRB8p7/a6XNvCuBp
	 5eFq7ri5w4Oqj+kzyhsvEhztXr5959kEQara90QTOx6pFUQSzpMikdJAWdE4w4B0fb
	 EMsEkcV+9Iv6w==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 778A817E0390;
	Wed, 11 Nov 2026 02:21:01 +0100 (CET)
Message-ID: <22f2ec2c4994b36850656dfcb4dc5de09a22afa7.camel@collabora.com>
Subject: Re: [PATCH RFC 00/11] media: h264: Stateless encode core
 follow-ups: parameter sets, POC type 2, CBR and VBR
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: aiyengar1990@gmail.com, Mauro Carvalho Chehab <mchehab@kernel.org>, Paul
 Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil	
 <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, Michael
 Tretter	 <m.tretter@pengutronix.de>
Date: Tue, 10 Nov 2026 20:20:59 -0500
In-Reply-To: <20261110-h264-encode-fixes-v1-0-7a64486df499@gmail.com>
References: <20261110-h264-encode-fixes-v1-0-7a64486df499@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-OU5s/4hBNjZQaWHfLytR"
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

--=-OU5s/4hBNjZQaWHfLytR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 10 novembre 2026 =C3=A0 10:05 +0000, Arun Iyengar via B4 Relay a =
=C3=A9crit=C2=A0:
> Hi Paul,
>=20
> These are changes to the H.264 stateless encode core of your "media: Add
> V4L2 H.264 stateless encode and VC8000E support" series, v1 (2026-05-22):
> https://lore.kernel.org/all/20260522101653.2565125-1-paulk@sys-base.io/
> (https://patchwork.kernel.org/project/linux-media/list/?series=3D1099281)
>=20
> They came out of three drivers written on top of the series: a VEPU2
> backend for the Rockchip RK3588 VPU121 in the Hantro driver and a driver
> for the Rockchip VEPU580 (both posted as separate RFCs on top of this
> one), and a cedrus encoder backend for the Allwinner H616 that the
> Orange Pi Zero 2 project carries (not posted). They apply on media next
> 6628e7d4c6b2 (v7.4-rc1) with patches 1-7 of your v1 applied first; the
> prerequisite-patch-id lines below are those seven patches. Patches 2, 4,
> 5 and 7 of v1 need trivial context fixes on v7.4-rc1 (the HEVC
> extended SPS RPS control declarations in v4l2-ctrls-core.c, the v4l2-isp
> line in the v4l2-core Makefile); the code is unchanged.
>=20
> As far as I can see on patchwork there is no v2 yet. I'm sending these as
> an RFC so that they can be folded into it or reworked with it, rather
> than to be merged on their own.
>=20
> Patches 1-3 are fixes:
> 1. The SPS/PPS change detection in rbsp_update() is inverted: every
>    picture after the first gets the parameter sets again. Only write
>    them for the first picture and when they change.

An inline code review is immensely more useful then providing fixup over
unmerged patches. Please consider doing code reviews if you'd like to help
accelerate including of such a feature.

Nicolas

> 2. Encoders whose hardware writes the slice header cannot put a
>    pic_order_cnt_lsb in it: the Hantro H1 and the Rockchip VEPU1/VEPU2
>    only produce slice headers for pic_order_cnt_type 2. Accept type 2
>    (selected through state_constrain) and derive the picture order
>    count from frame_num (H.264 8.2.1.3).
> 3. The SPS and PPS NAL units are written with nal_ref_idc 0, which
>    H.264 7.4.1 forbids (FFmpeg's probe gives such a stream a score of 1).
>    Write them with nal_ref_idc 3.
>=20
> Patches 4-11 rework the rate control:
> 4. Rework the constant bitrate mode after the frame-level rate control
>    of the Rockchip MPP library: one QP state for the stream, picture
>    size targets from a GOP plan with the I/P size ratio measured on the
>    stream, and the size error spread over the next 8 pictures. The v1
>    mode stays 5-9% below the bitrate and overshoots several times on
>    the first P picture after each IDR picture (details in the patch).
> 5. Move that model to a codec-independent helper, v4l2-enc-cbr, so that
>    an HEVC core can use it (the HEVC encode RFC does).
> 6-9. Bound the I picture size, halve the QP increase of I pictures,
>    re-encode pictures far above their size target (for drivers that
>    can run a picture again; the H.264 core does not offer it yet) and
>    fix all-intra streams.
> 10-11. A peak bitrate in the helper and a VBR mode
>    (V4L2_MPEG_VIDEO_BITRATE_MODE_VBR with V4L2_CID_MPEG_VIDEO_BITRATE_PEA=
K)
>    in the H.264 core.
>=20
> One more observation, not changed here: state_commit() publishes
> V4L2_CID_STATELESS_H264_ENCODE_PARAMS before rc_step() sets
> slice_qp_delta, so the slice_qp_delta read back from the request is the
> value before rate control. The QP used for the encode is the right one.
>=20
> Tested on an Orange Pi 5 (RK3588S) through the VEPU2 (Hantro) and
> VEPU580 drivers, on a v7.3-based kernel whose v4l2-core encode files are
> byte-identical to this series. 1080p60, 300 pictures of two clips (Big
> Buck Bunny and a natural one), every stream decoded with FFmpeg to 300
> pictures:
> - CBR at 4 Mbit/s with an IDR period of 120, 8 Mbit/s with 10 and
>   20 Mbit/s all-intra: bitrate within 2.2% of the target on both
>   encoders; the largest one second window is at most 1.37 times the
>   bitrate (a scene change in a P picture of Big Buck Bunny on the
>   VEPU580), 1.24 on the VEPU2;
> - VBR with the peak at 1.5 times the bitrate, the same cases and
>   8 Mbit/s with an IDR period of 120: bitrate within
>   4.5% of the target, every one second window within the peak (at most
>   0.94 of it);
> - the GStreamer v4l2codecs H.264 encoder (local patches) on the VEPU2,
>   CBR at 2-16 Mbit/s: bitrate within 2.5% of the target;
> - patch 1: a 60-picture GOP-30 stream carries one SPS and PPS before
>   each of its two IDR pictures and none before the P pictures.
> The whole series also passes on an Orange Pi Zero 2 (Allwinner H616)
> with the cedrus H.264 encoder: CBR and VBR rate control within 5% of the
> target (measured within 0.1%, every one-second window at most 1.2 times
> the peak bitrate), all-intra and GOP 10 streams, and every stream
> decoded bit-exact by the board's hardware decoder against FFmpeg.
>=20
> This series was developed with Claude (Anthropic) as a coding assistant:
> it wrote the code and the commit messages, and I reviewed and tested
> every change as described above.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Arun Iyengar (11):
>       media: h264: Only write the SPS and PPS of a stateless encode when =
they change
>       media: h264: Support picture order count type 2 in stateless encode
>       media: h264: Write the stateless encode SPS and PPS with nal_ref_id=
c 3
>       media: v4l2-h264-enc-rc: Rework the constant bitrate mode
>       media: v4l2-core: Move the H.264 encode CBR rate control to a helpe=
r
>       media: v4l2-core: Bound the I picture size in the encode CBR rate c=
ontrol
>       media: v4l2-core: Halve the I picture QP increase of the encode CBR
>       media: v4l2-core: Re-encode oversized pictures in the encode CBR
>       media: v4l2-core: Fix all-intra streams in the encode CBR rate cont=
rol
>       media: v4l2-core: Add a peak bitrate to the encode rate control
>       media: h264: Add a VBR mode to the stateless encode rate control
>=20
>  drivers/media/v4l2-core/Kconfig              |   5 +
>  drivers/media/v4l2-core/Makefile             |   1 +
>  drivers/media/v4l2-core/v4l2-enc-cbr.c       | 593 +++++++++++++++++++++=
++++++
>  drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c |   7 +-
>  drivers/media/v4l2-core/v4l2-h264-enc-rc.c   | 294 +++----------
>  drivers/media/v4l2-core/v4l2-h264-enc.c      |  65 ++-
>  include/media/v4l2-enc-cbr.h                 | 103 +++++
>  include/media/v4l2-h264-enc-rc.h             |   3 +
>  include/media/v4l2-h264-enc.h                |   3 +
>  9 files changed, 820 insertions(+), 254 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261110-h264-encode-fixes-c1c2ff90197f
> prerequisite-patch-id: fd11f19266754d1bd40bf61dd5d1da74a0dc13c2
> prerequisite-patch-id: 7c7edc7344998d520efaf7b430c90fd527c704c7
> prerequisite-patch-id: 4689de770eb1bcdc153d6beda2e392d0ce6f344d
> prerequisite-patch-id: 0afdcc24892eac773036d05d8f504e5ccb35eb62
> prerequisite-patch-id: ecc849b3328d4396380f0cfc331536c16d2e0d28
> prerequisite-patch-id: c62d0fd16706c4328624948805eb2f8d7b223ae0
> prerequisite-patch-id: e955d15603fd070034960a1362e4867c2f124d69
>=20
> Best regards,
> -- =20
> Arun Iyengar <aiyengar1990@gmail.com>
>=20

--=-OU5s/4hBNjZQaWHfLytR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavPC+wAKCRDZQZRRKWBy
9EPlAP9XbDtezOoCdo82TJ04+wHJanKNjbpr6sQoZqc5Vj8IWgEA293D6wWYkJ6O
Xar/qflRNOiurphj+gGbz3RfTGl+fAY=
=F0OR
-----END PGP SIGNATURE-----

--=-OU5s/4hBNjZQaWHfLytR--
