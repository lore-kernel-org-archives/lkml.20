Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E543372ED0;
	Thu, 24 Sep 2026 12:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253420; cv=pass; b=Za+isNx18Q4QcLp4g9CKlVWP0lUYKpk+4IG7NkeC2t6Tyr+I05u+AvnvQYzDu0jNrAl/rV6CWKrHpa1Lw5tc6unOQQD0rz0FkV+QPXYmwJFxQ7hjAlRWVKLIMtDGTcGPJpnFMk36UqYV50O8AUdZT8JYklTMayLLiSgFdtdEGKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253420; c=relaxed/simple;
	bh=xzUol5ikhcfHZeeR2q20FVZeYh3BGyPUFgQL8aLKm2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EQwUi1FP8R08hSWA5PNW4Hb82FU1/gr3JmYi93LgRawiz4vNy37J1aHQicTT9BPZ1PXpgWoPFkJg3a+Lxh67YBUmqu+eQV48VbMH3WzVhIcSRFOalyccXttCIy8qO9QpQqWY0Qj3qshz15TzjxXXqZ1rCU3MQeyLoXE95p9hcmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=LHVNlk3j; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="LHVNlk3j"
ARC-Seal: i=1; a=rsa-sha256; t=1790253395; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XHVZvKE+IgFaJn7qjYthBHmxN+Iohax5UB4CnGEp4BYMTCnTLV0Lc6oOJygpNVzbnFz0wbu5Z7cFfgwNtm5FNxCo8OlMbKIwLE2MU6bQHgtwjrnb+CApzx01I2k521r0sxb9j96sUMdje30KJLm5Vk4CSSVoLIe3xBvKWX6D1sc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790253395; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OV+WKAnJJAziMnvnnktDB9mgyWSpWiiufh8J8gCcPuM=; 
	b=Uhv3RpeF34/PDDrzjvw8wBXSDOuGknensayir0WVaEdGY5YAE73WIP9po/M2hvC4PZjEcLOnY43dgvTOM5qegoEMmxL3f612IFTEU37xcCmhUiy+sg+VZm3aaFQNfjJ6QRmDg6qWiWMpAavz55XwzWDSTkdM0XbCefzMiuzxI2A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790253395;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=OV+WKAnJJAziMnvnnktDB9mgyWSpWiiufh8J8gCcPuM=;
	b=LHVNlk3jSC6gA7aakza5ZfADkKhSGfV451XAigklp/jrx531C9LC0ijbYYYsFDU9
	MDQDgtDl0RiLJAHgF02Ua/WCsTxKIo1ouhcaXU68ZqVM6nl39Fz7GWG9/512Rm2i/Dk
	fScaTpowMm4qqHQ0iMq211asJ69ExxzSuklKYIyw=
Received: by smtp.zohomail.com with SMTPS id 1790253393785375.45950290690473;
	Thu, 24 Sep 2026 05:36:33 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Diederik de Haas <diederik@cknow-tech.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] media: Track v4l2 buffers through an allocator
Date: Thu, 24 Sep 2026 08:36:15 -0400
Message-ID: <jmuzPUMQRGeSHxc4mzcUjg@collabora.com>
In-Reply-To: <DLK6XGIB22XG.58WF7VP9L3NH@cknow-tech.com>
References:
 <20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com>
 <DLK6XGIB22XG.58WF7VP9L3NH@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi Diederik,

Thank you for testing !


On Sunday, September 20, 2026 9:50:24=E2=80=AFa.m. Eastern Daylight Time Di=
ederik de=20
Haas wrote:
> Hi Detlev,
>=20
> On Wed Sep 16, 2026 at 4:25 PM CEST, Detlev Casanova wrote:
> > Hello,
> >=20
> > Currently, the only way to track buffers allocated by v4l2 from usespace
> > is to use the subsystem available debug information (e.g.:
> > /sys/kernel/debug/dma_buf/bufinfo).
> > But that information is generic and cannot be matched to a v4l2 driver =
or
> > to a userspace application: It is merely information about the allocati=
on.
> >=20
> > Other types of allocations require the developper to find where they are
> > exposed and how to link them to their test.
> >=20
> > This can become hard to track when mutliple drivers are working at the
> > same time.
> >=20
> > To improve that, add a small wrapper around buffer allocations to keep
> > track of them at the video device level so that we can add debug
> > information to them like a name, userspace pid/fd that did the
> > allocation,... and expose them to userspace via a debugfs entry.
> >=20
> > It currently only supports DMA buffer allocations and adds support for
> > VB2 allocations too.
> > Other kind of memory tracking can be added later.
> > The verisilicon and rkvdec drivers have been ported to use the tracked
> > dma alloactions.
> >=20
> > Note that this depends on the ftrace support patch series[1] that
> > provides fd/pid info in the v4l2_fh struct.
> > That series is a bit old, so this is based on an older linux version, b=
ut
> > that only changes things for the last 2 commits.
> >=20
> > A v4l2top utility[2] has been made, to be used in parallel with the
> > fdinfo patch series[3], to show the list of active streams with their HW
> > and memory usage.
> >=20
> > With this, debugfs looks like this when decoding a HEVC 1080p stream wi=
th
> >=20
> > rkvdec on rk3588:
> >   root # cat /sys/kernel/debug/v4l2/fdc38100.video-codec/mem
> >   created-by                      fd              pid             size =
  =20
> >          label
> >   ---------------------------------------------------------------------=
=2D-
> >   -------------- gst-launch-1.0                  7               635   =
  =20
> >         39184           vdpu381-hevc-priv-tbl gst-launch-1.0           =
 =20
> >       7               635             4177920       =20
> >   cap-00000000ac34392e-7 gst-launch-1.0                  7             =
=20
> >   635             4177920         cap-00000000ac34392e-6 gst-launch-1.0=
 =20
> >                  7               635             4177920       =20
> >   cap-00000000ac34392e-5 gst-launch-1.0                  7             =
=20
> >   635             4177920         cap-00000000ac34392e-4 gst-launch-1.0=
 =20
> >                  7               635             4177920       =20
> >   cap-00000000ac34392e-3 gst-launch-1.0                  7             =
=20
> >   635             4177920         cap-00000000ac34392e-2 gst-launch-1.0=
 =20
> >                  7               635             4177920       =20
> >   cap-00000000ac34392e-1 gst-launch-1.0                  7             =
=20
> >   635             4177920         cap-00000000ac34392e-0 gst-launch-1.0=
 =20
> >                  7               635             3133440       =20
> >   out-000000005c0230f6-1 gst-launch-1.0                  7             =
=20
> >   635             3133440         out-000000005c0230f6-0
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Total size: 39729424
>=20
> I build a kernel with your 3 patch series and I also build the v4l2top
> utility. Cool tool :-D
> Especially after I found out I should build the 'upstream' branch ;-)
>=20
> There were a couple of things I noticed:
> 1) With 'plain' kernel 7.3-rc3 but also with all my patches included, but
>    excluding the patches from this series, I see this:
>=20
> ```
> root@nanopc-t6-plus:~# ls -lh /sys/kernel/debug/v4l2/
> total 0
> drwxr-xr-x 3 root root 0 Sep 20 15:10 fdee0000.hdmi_receiver
> ```
>=20
> Which is presumably the reason that with a kernel which also includes this
> patch series, I get the following kernel error:
> ``[   10.849405] debugfs: 'v4l2' already exists in '/'``
>=20
> I don't think this should generate an error/warning/info message at all,
> but just silently dealt with.

Indeed, that is something I will fix in the next version.

>=20
> Checking v4l2 debug dir again results in this:
> ```
> root@nanopc-t6-plus:~# ls -lh /sys/kernel/debug/v4l2/
> total 0
> drwxr-xr-x 2 root root 0 Sep 20 15:13 fdb60000.rga
> drwxr-xr-x 2 root root 0 Sep 20 15:13 fdb80000.rga
> drwxr-xr-x 2 root root 0 Sep 20 15:13 fdc38000.video-codec
> drwxr-xr-x 2 root root 0 Sep 20 15:13 fdee0000.hdmi_receiver
> ```
>=20
> I noticed my video-codec address was slightly different from yours.

Yes, mine is on rk3588. A different SoC will have a different device regist=
er=20
address.

> Playing a 1080p BBB x264 video with a patched ffmpeg+mpv, results in this:
> ```
> root@nanopc-t6-plus:~# cat /sys/kernel/debug/v4l2/fdc38000.video-codec/mem
> created-by                      fd              pid             size     =
  =20
>    label
> -------------------------------------------------------------------------=
=2D-
> ---------- mpv                             26              2027          =
=20
> 4177920         cap-00000000205a3b3a-10 mpv                             2=
6=20
>             2027            4177920         cap-00000000205a3b3a-9 mpv   =
 =20
>                        26              2027            4177920       =20
> cap-00000000205a3b3a-8 mpv                             26              20=
27
>            16736           vdpu381-h264-priv-tbl mpv                     =
 =20
>      26              2027            3133440         out-0000000079002cb1=
=2D3
> mpv                             26              2027            3133440  =
 =20
>     out-0000000079002cb1-2 mpv                             26            =
=20
> 2027            3133440         out-0000000079002cb1-1 mpv               =
 =20
>            26              2027            3133440       =20
> out-0000000079002cb1-0 mpv                             26              20=
27
>            4177920         cap-00000000205a3b3a-7 mpv                    =
 =20
>       26              2027            4177920       =20
> cap-00000000205a3b3a-6 mpv                             26              20=
27
>            4177920         cap-00000000205a3b3a-5 mpv                    =
 =20
>       26              2027            4177920       =20
> cap-00000000205a3b3a-4 mpv                             26              20=
27
>            4177920         cap-00000000205a3b3a-3 mpv                    =
 =20
>       26              2027            4177920       =20
> cap-00000000205a3b3a-2 mpv                             26              20=
27
>            4177920         cap-00000000205a3b3a-1 mpv                    =
 =20
>       26              2027            4177920       =20
> cap-00000000205a3b3a-0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Total size: 58507616
> ```
>=20
> And looking at the v4l2top utility, I noticed the following:
> 1. I see differing indications of the load while it's playing :-D

\o/

> 2. The ``Clock rate`` is always 750.0MHz (or 786431991Hz) (expected I
> think?)

Yes, the clock won't change, for now at least. Some decoders could adapt th=
eir=20
clocks depending on the work. The frequency value will also be used to=20
determine exact core usage for those that expose a used cycle count after e=
ach=20
job (I did not implement that yet in v4l2top)

> 3. The ``Total Memory`` is always 0B and the ``Memory usage
> details`` column is always empty. That's also the case when I press one of
> the arrow keys which seems to select the entry. Am I missing sth or doing
> sth wrong?

My guess would be that you didn't run it as root (this is usually needed to=
=20
access the debugfs*). But if you did, we will have to dig a little.

*: Note that later, we'd like to report global memory usage through fdinfo,=
 so=20
that the metric is accessible as a user, with buffer details still from the=
=20
debugfs (so that'd need root access)

Detlev.

>=20
> > [1]:
> > https://lore.kernel.org/all/20260610-v4l2-add-ftrace-v2-0-9756edf72ac1@=
co
> > llabora.com/ [2]: https://github.com/cazou/v4l2top/tree/upstream
> > [3]:
> > https://lore.kernel.org/all/20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@=
co
> > llabora.com/
> >=20
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> >=20
> > Detlev Casanova (4):
> >       media: Add a v4l2 memory allocations tracker
> >       media: Store v4l2_fh in the vb_queue
> >       media: verisilicon: Switch to tracked dma allocations
> >       media: rkvdec: Switch to tracked dma allocations
> > =20
> >  drivers/media/common/videobuf2/Makefile            |   1 +
> >  drivers/media/common/videobuf2/v4l2-allocator.c    | 186
> >  +++++++++++++++++++++ .../media/common/videobuf2/videobuf2-dma-contig.=
c=20
> >  |  27 ++-
> >  .../media/platform/rockchip/rkvdec/rkvdec-h264.c   |  14 +-
> >  .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |  14 +-
> >  .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    |  21 ++-
> >  .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c |  14 +-
> >  .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c |  14 +-
> >  .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |  14 +-
> >  .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |  14 +-
> >  .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  33 ++--
> >  drivers/media/platform/rockchip/rkvdec/rkvdec.c    |   4 +
> >  drivers/media/platform/verisilicon/hantro.h        |   1 +
> >  drivers/media/platform/verisilicon/hantro_drv.c    |   4 +
> >  drivers/media/platform/verisilicon/hantro_h264.c   |   7 +-
> >  drivers/media/platform/verisilicon/hantro_hevc.c   | 100 ++++++-----
> >  drivers/media/platform/verisilicon/hantro_mpeg2.c  |  16 +-
> >  .../media/platform/verisilicon/hantro_postproc.c   |  14 +-
> >  drivers/media/platform/verisilicon/hantro_vp8.c    |  25 +--
> >  drivers/media/platform/verisilicon/hantro_vp9.c    |  34 +++-
> >  .../verisilicon/rockchip_vpu981_hw_av1_dec.c       | 160
> >  +++++++++++-------
> >  drivers/media/v4l2-core/v4l2-device.c              |   4 +-
> >  include/media/v4l2-allocator.h                     |  26 +++
> >  include/media/v4l2-device.h                        |   2 +
> >  include/media/videobuf2-core.h                     |   3 +
> >  25 files changed, 555 insertions(+), 197 deletions(-)
> >=20
> > ---
> > base-commit: 66affa37cfac0aec061cc4bcf4a065b0c52f7e19
> > change-id: 20260612-v4l2-add-mem-tracker-da0088c74a64
> > prerequisite-change-id: 20260608-v4l2-add-ftrace-aec6e7f60a6c:v2
> > prerequisite-patch-id: bd45b4df66799a7f9f22b49973a78d1bd3590a4a
> > prerequisite-patch-id: 6a5ed5615f08257cf854d441785066b5ff4d5d47
> > prerequisite-patch-id: 02594c869498b9e91e416d70242afbaa6b3a8d6a
> > prerequisite-patch-id: 9f25ec78f3b99ac1c5d42eb732f5bd9eae73fadd
> > prerequisite-patch-id: 4ed2c2e8c3abfa7f6328d0ea4f488ca5a3eec8fb
> > prerequisite-patch-id: 8787d50eb80e1a63a57a123268cade23c9e64618
> > prerequisite-patch-id: bfe85822378fa771f9bbc3e1e8c8ff6bce0eb7fd
> > prerequisite-patch-id: 784d0801da320f7b41194f4632ee422c32f1b5b8
> > prerequisite-patch-id: 362c8366e2efbfb5e6f1a3f71cfddbd46e8d1506
> >=20
> > Best regards,
> > --
> > Detlev Casanova <detlev.casanova@collabora.com>
> >=20
> >=20
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip




