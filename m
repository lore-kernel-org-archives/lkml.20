Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.233.101.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500457;
	b=Kq30sM1eFN5O5mYgOJYhmQYaM8fPgioYs5vh9qKqw798gakm7lnwjiEO3cm3c0Dfo9rC
	 ZxIvYdRDX7TRLZy9VrU489JVLI9bgh7vhYeZyBo+UKcKbRTrH1eej9420t+tk+da9dtrH
	 I7Ftuv6NRs8bg4EwMJ+5Gq1v9D2u4p01NTBLmsmiyQxydOeBzqGRGtKW8Ablws5mzrLt4
	 lzLqtvK2DOq18pof/6S+P4A9HMVdopKIm3AXExpi846odzn4AinwZLBxLs7cm0B+sc0+K
	 ipDQH8HIJZ4RVxoajlaV8PcmAmnxB+64QogAjk62TnktyP/WcCz90HXzaUc6XTnBDPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500457;
	h=DMARC-Filter:Received:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Q8nPy2r1OpZT6atwx/ytsH3di2kxltVlicN2GvhKCyM=;
	b=zU063DrowYIzZS4YY8xHzW8m7j39eHC6hyfvB+CDPHnpaVn18GPWQ9+kZe49+EDRjMfs
	 5+DiPegEk+zxhSb1lAywacnyS2PaTJJJhJofLvU0Yob9XBaIPJMazCxy47ZKPObZQldLD
	 sOc2dHFxssFItq8pQwto7HQwoGLl1xErFlkeaHmGRccaltEET7rRqH9tscwI+rCgxbJWS
	 KA3GOcu9FcZer1Lr52dQpFxkwDE+QpJOCXjzCxIBPYU6y7IdbVkCBSEBlOuONg539bmrp
	 VYLLoj4PHbBRKDwe/LvtpCVYKXKT2cOOS1MR+Bg7y6Y0MvzNSulG7EDvRT6S5X105og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sys-base.io;
	spf=pass smtp.mailfrom=sys-base.io;
	arc=none smtp.remote-ip=185.233.101.22
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A873606A323;
	Thu, 12 Nov 2026 16:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A873606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 746313700F67;
	Thu, 12 Nov 2026 16:20:42 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 019C4B79C52; Thu, 12 Nov 2026 16:20:40 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id C86F2B79C46;
	Thu, 12 Nov 2026 16:20:39 +0000 (UTC)
Date: Thu, 12 Nov 2026 17:20:37 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: aiyengar1990@gmail.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH RFC 00/11] media: h264: Stateless encode core follow-ups:
 parameter sets, POC type 2, CBR and VBR
Message-ID: <avXnVapZS61WzrIT@collins>
References: <20261110-h264-encode-fixes-v1-0-7a64486df499@gmail.com>
 <22f2ec2c4994b36850656dfcb4dc5de09a22afa7.camel@collabora.com>
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
	protocol="application/pgp-signature"; boundary="2jKvOUAplrXawN9P"
Content-Disposition: inline
In-Reply-To: <22f2ec2c4994b36850656dfcb4dc5de09a22afa7.camel@collabora.com>

--2jKvOUAplrXawN9P
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Tue 10 Nov 26, 20:20, Nicolas Dufresne a =C3=A9crit :
> Hi,
>=20
> Le mardi 10 novembre 2026 =C3=A0 10:05 +0000, Arun Iyengar via B4 Relay a=
 =C3=A9crit=C2=A0:
> > Hi Paul,
> >=20
> > These are changes to the H.264 stateless encode core of your "media: Add
> > V4L2 H.264 stateless encode and VC8000E support" series, v1 (2026-05-22=
):
> > https://lore.kernel.org/all/20260522101653.2565125-1-paulk@sys-base.io/
> > (https://patchwork.kernel.org/project/linux-media/list/?series=3D109928=
1)
> >=20
> > They came out of three drivers written on top of the series: a VEPU2
> > backend for the Rockchip RK3588 VPU121 in the Hantro driver and a driver
> > for the Rockchip VEPU580 (both posted as separate RFCs on top of this
> > one), and a cedrus encoder backend for the Allwinner H616 that the
> > Orange Pi Zero 2 project carries (not posted). They apply on media next
> > 6628e7d4c6b2 (v7.4-rc1) with patches 1-7 of your v1 applied first; the
> > prerequisite-patch-id lines below are those seven patches. Patches 2, 4,
> > 5 and 7 of v1 need trivial context fixes on v7.4-rc1 (the HEVC
> > extended SPS RPS control declarations in v4l2-ctrls-core.c, the v4l2-isp
> > line in the v4l2-core Makefile); the code is unchanged.
> >=20
> > As far as I can see on patchwork there is no v2 yet. I'm sending these =
as
> > an RFC so that they can be folded into it or reworked with it, rather
> > than to be merged on their own.
> >=20
> > Patches 1-3 are fixes:
> > 1. The SPS/PPS change detection in rbsp_update() is inverted: every
> >    picture after the first gets the parameter sets again. Only write
> >    them for the first picture and when they change.
>=20
> An inline code review is immensely more useful then providing fixup over
> unmerged patches. Please consider doing code reviews if you'd like to help
> accelerate including of such a feature.

Yes I definitely agree, I'm not sure what to do with these patches,
especially since I've already been working on a v2 where this work won't
apply cleanly. Just sending out patches like this doesn't really help.

However some of the changes look interesting and would be good to have.
It's also good to see interest in the stateless encode series!

I might end up picking up some of the ideas. Also it really shows that
this is AI-generated and generally improper for upstreaming as-is.

Maybe next time just share a summary email with different findings
and ideas for improvements on the active series, instead of patches?

All the best,

Paul

>=20
> Nicolas
>=20
> > 2. Encoders whose hardware writes the slice header cannot put a
> >    pic_order_cnt_lsb in it: the Hantro H1 and the Rockchip VEPU1/VEPU2
> >    only produce slice headers for pic_order_cnt_type 2. Accept type 2
> >    (selected through state_constrain) and derive the picture order
> >    count from frame_num (H.264 8.2.1.3).
> > 3. The SPS and PPS NAL units are written with nal_ref_idc 0, which
> >    H.264 7.4.1 forbids (FFmpeg's probe gives such a stream a score of 1=
).
> >    Write them with nal_ref_idc 3.
> >=20
> > Patches 4-11 rework the rate control:
> > 4. Rework the constant bitrate mode after the frame-level rate control
> >    of the Rockchip MPP library: one QP state for the stream, picture
> >    size targets from a GOP plan with the I/P size ratio measured on the
> >    stream, and the size error spread over the next 8 pictures. The v1
> >    mode stays 5-9% below the bitrate and overshoots several times on
> >    the first P picture after each IDR picture (details in the patch).
> > 5. Move that model to a codec-independent helper, v4l2-enc-cbr, so that
> >    an HEVC core can use it (the HEVC encode RFC does).
> > 6-9. Bound the I picture size, halve the QP increase of I pictures,
> >    re-encode pictures far above their size target (for drivers that
> >    can run a picture again; the H.264 core does not offer it yet) and
> >    fix all-intra streams.
> > 10-11. A peak bitrate in the helper and a VBR mode
> >    (V4L2_MPEG_VIDEO_BITRATE_MODE_VBR with V4L2_CID_MPEG_VIDEO_BITRATE_P=
EAK)
> >    in the H.264 core.
> >=20
> > One more observation, not changed here: state_commit() publishes
> > V4L2_CID_STATELESS_H264_ENCODE_PARAMS before rc_step() sets
> > slice_qp_delta, so the slice_qp_delta read back from the request is the
> > value before rate control. The QP used for the encode is the right one.
> >=20
> > Tested on an Orange Pi 5 (RK3588S) through the VEPU2 (Hantro) and
> > VEPU580 drivers, on a v7.3-based kernel whose v4l2-core encode files are
> > byte-identical to this series. 1080p60, 300 pictures of two clips (Big
> > Buck Bunny and a natural one), every stream decoded with FFmpeg to 300
> > pictures:
> > - CBR at 4 Mbit/s with an IDR period of 120, 8 Mbit/s with 10 and
> >   20 Mbit/s all-intra: bitrate within 2.2% of the target on both
> >   encoders; the largest one second window is at most 1.37 times the
> >   bitrate (a scene change in a P picture of Big Buck Bunny on the
> >   VEPU580), 1.24 on the VEPU2;
> > - VBR with the peak at 1.5 times the bitrate, the same cases and
> >   8 Mbit/s with an IDR period of 120: bitrate within
> >   4.5% of the target, every one second window within the peak (at most
> >   0.94 of it);
> > - the GStreamer v4l2codecs H.264 encoder (local patches) on the VEPU2,
> >   CBR at 2-16 Mbit/s: bitrate within 2.5% of the target;
> > - patch 1: a 60-picture GOP-30 stream carries one SPS and PPS before
> >   each of its two IDR pictures and none before the P pictures.
> > The whole series also passes on an Orange Pi Zero 2 (Allwinner H616)
> > with the cedrus H.264 encoder: CBR and VBR rate control within 5% of the
> > target (measured within 0.1%, every one-second window at most 1.2 times
> > the peak bitrate), all-intra and GOP 10 streams, and every stream
> > decoded bit-exact by the board's hardware decoder against FFmpeg.
> >=20
> > This series was developed with Claude (Anthropic) as a coding assistant:
> > it wrote the code and the commit messages, and I reviewed and tested
> > every change as described above.
> >=20
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> > ---
> > Arun Iyengar (11):
> >       media: h264: Only write the SPS and PPS of a stateless encode whe=
n they change
> >       media: h264: Support picture order count type 2 in stateless enco=
de
> >       media: h264: Write the stateless encode SPS and PPS with nal_ref_=
idc 3
> >       media: v4l2-h264-enc-rc: Rework the constant bitrate mode
> >       media: v4l2-core: Move the H.264 encode CBR rate control to a hel=
per
> >       media: v4l2-core: Bound the I picture size in the encode CBR rate=
 control
> >       media: v4l2-core: Halve the I picture QP increase of the encode C=
BR
> >       media: v4l2-core: Re-encode oversized pictures in the encode CBR
> >       media: v4l2-core: Fix all-intra streams in the encode CBR rate co=
ntrol
> >       media: v4l2-core: Add a peak bitrate to the encode rate control
> >       media: h264: Add a VBR mode to the stateless encode rate control
> >=20
> >  drivers/media/v4l2-core/Kconfig              |   5 +
> >  drivers/media/v4l2-core/Makefile             |   1 +
> >  drivers/media/v4l2-core/v4l2-enc-cbr.c       | 593 +++++++++++++++++++=
++++++++
> >  drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c |   7 +-
> >  drivers/media/v4l2-core/v4l2-h264-enc-rc.c   | 294 +++----------
> >  drivers/media/v4l2-core/v4l2-h264-enc.c      |  65 ++-
> >  include/media/v4l2-enc-cbr.h                 | 103 +++++
> >  include/media/v4l2-h264-enc-rc.h             |   3 +
> >  include/media/v4l2-h264-enc.h                |   3 +
> >  9 files changed, 820 insertions(+), 254 deletions(-)
> > ---
> > base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> > change-id: 20261110-h264-encode-fixes-c1c2ff90197f
> > prerequisite-patch-id: fd11f19266754d1bd40bf61dd5d1da74a0dc13c2
> > prerequisite-patch-id: 7c7edc7344998d520efaf7b430c90fd527c704c7
> > prerequisite-patch-id: 4689de770eb1bcdc153d6beda2e392d0ce6f344d
> > prerequisite-patch-id: 0afdcc24892eac773036d05d8f504e5ccb35eb62
> > prerequisite-patch-id: ecc849b3328d4396380f0cfc331536c16d2e0d28
> > prerequisite-patch-id: c62d0fd16706c4328624948805eb2f8d7b223ae0
> > prerequisite-patch-id: e955d15603fd070034960a1362e4867c2f124d69
> >=20
> > Best regards,
> > -- =20
> > Arun Iyengar <aiyengar1990@gmail.com>
> >=20



--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--2jKvOUAplrXawN9P
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmr151UACgkQhP3B6o/u
lQyMsQ//Yd9cJ2u/7Q/ZmfyysDBUP/J/MEKni4bxHatI7IoAZvYCJVS8pFJ6EkpQ
HxJZ4RmFSfqeJ4iJLyF4/rvfr/mGI6mZp3HYJBgJ8AXW+0TEIBurNvGn8oNUwPD2
Xx8veiXNdC6ml2pHOWrPwBjmKYXu6XO2ZHJTipSp3vFWIkPONlhpQzigCxNZVluR
lagbhBquSAvlNsy53XMkDoZudCgWb++Ss62PjYvdBIoAucpE2H2I+ELFYRqpEf14
sf32zOHXGuTZCH/YF87SojzNExPBTT0p2pC3KhaB0VGeJpWADvrwvJoje/DEfEfr
LwIg8aUaMXfteBAfb7qnQz2bRnFXb6h2R0cfc1tHsDHiIvmaWIMxPSff49KLjOjR
FkpkkEeWH+H6ALa4ORmSQW73bCzdXcKeljtqP3B3PSj1mElbdlYXCe0/RzdKzqGf
WUAuuE578aSL2NttWOknc+32gUk7mA0I6xiYoE2WS+BIRHf/GFc6Xb++xeflncc8
O/UwVQAHCmfsJ++GjkHHYcwqedcCDiEFVuQlRFS/pnHix9qOKbdHbCWtJ+hed92c
2UAhRO+Xxx4AKwfNdOewvwvX/S0hnhBfHr6D0+nhCLW4Uvu1S7T2+5lz6XPu981C
IElvcuJwR6wtbQ1U4U7T0Qsvrof/icDiryk8uVXb9JfPmqduZq4=
=7LMf
-----END PGP SIGNATURE-----

--2jKvOUAplrXawN9P--
