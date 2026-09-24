Received: from mta1.migadu.com (out-160.mta1.migadu.com [95.215.58.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B523368AC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257888; cv=none; b=t67BfBsUjhYmoYEVg2fNc8KolHjcrKnRQyEZyo11tOmLURP14+XS+oIh0YfBfJlcidJYeDB1U6cVCrRYEb4z0iANEzrFAWijCrnv/hhrgL9Hkq+9BQ2WUvGemjWwReeOLDvDrDJRInDhScYNUPhsGjfCSeH2l33+rG8vZnR0SiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257888; c=relaxed/simple;
	bh=sSph9Jsw8F14AbnX84MTaIdC6tQYWQmd5qT/kg2mMDo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kWiKFw420RXgNo2RhwAijtg7xCZAUy+7Fe/+vaoTOCyCrK4Ua/hVP9ve6AL/yNPvnwZIMxxqDaXvor82v9CxO1pFoVxC+TLa82I+3lkV3c50rSokoBWYJyfpVUgyB1QDfL0+02LF/QgKOxhn1+9s9KrqZtOSzaGPjwLMNhT/Oo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=A+kS+nYw; arc=none smtp.client-ip=95.215.58.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="A+kS+nYw"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sSph9Jsw8F14AbnX84MTaIdC6tQYWQmd5qT/kg2mMDo=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790257881; v=1; x=1790862681;
 b=A+kS+nYwX94TxKs3bBgpA7GTCH3rob7GlGN6wTJq0/ad/eIxHcjzS+UysYgPqHE/1wzVXX/V
 p5w3giM/Pob9eoLU+4H+vX9JJB6ejVttV8RXlw1jM4sPoaI4pvHHl5gIdKwYM3LS1VuLH3PlhCJ
 0WkLhWS4eVUx5/uBPhN25doTKDkWGKQL5n9vyRF/7+FPAHSTEIKo0kPqQiDqoiDqLLA4KqYzuVj
 T1aqgMHsjrMdz3sxrOwmgXV2acQuus30m4FuOv6R8xiB6CnGXlNbo5RormAGuYXjw8CBx3h240V
 3dO2bdg93RlKdZ1UVVGO18Njfdl5rzvG1wRTifX98/mGw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c2b77ebc62d259c3;
	Thu, 24 Sep 2026 13:51:21 +0000
X-Mizu-Trace-ID: c2b77ebc62d259c3
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 15:51:13 +0200
Message-Id: <DLNLG9AJ5GB2.36BYH3TC0FF45@cknow-tech.com>
Cc: <kernel@collabora.com>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/4] media: Track v4l2 buffers through an allocator
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Detlev Casanova" <detlev.casanova@collabora.com>, "Tomasz Figa"
 <tfiga@chromium.org>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Nicolas Dufresne"
 <nicolas.dufresne@collabora.com>, "Benjamin Gaignard"
 <benjamin.gaignard@collabora.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Heiko Stuebner" <heiko@sntech.de>, "Ezequiel
 Garcia" <ezequiel@vanguardiasur.com.ar>, "Diederik de Haas"
 <diederik@cknow-tech.com>
X-Mailer: aerc 0.22.0-24-g39041fd9f179
References: <20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com>
 <DLK6XGIB22XG.58WF7VP9L3NH@cknow-tech.com>
 <jmuzPUMQRGeSHxc4mzcUjg@collabora.com>
In-Reply-To: <jmuzPUMQRGeSHxc4mzcUjg@collabora.com>

Hi,

On Thu Sep 24, 2026 at 2:36 PM CEST, Detlev Casanova wrote:
> On Sunday, September 20, 2026 9:50:24=E2=80=AFa.m. Eastern Daylight Time =
Diederik de=20
> Haas wrote:
>> On Wed Sep 16, 2026 at 4:25 PM CEST, Detlev Casanova wrote:
>> > Currently, the only way to track buffers allocated by v4l2 from usespa=
ce
>> > is to use the subsystem available debug information (e.g.:
>> > /sys/kernel/debug/dma_buf/bufinfo).
>> > But that information is generic and cannot be matched to a v4l2 driver=
 or
>> > to a userspace application: It is merely information about the allocat=
ion.
>> >=20
>> > ...
>> >=20
>> > Note that this depends on the ftrace support patch series[1] that
>> > provides fd/pid info in the v4l2_fh struct.
>> > That series is a bit old, so this is based on an older linux version, =
but
>> > that only changes things for the last 2 commits.
>> >=20
>> > A v4l2top utility[2] has been made, to be used in parallel with the
>> > fdinfo patch series[3], to show the list of active streams with their =
HW
>> > and memory usage.
>> >=20
>> > With this, debugfs looks like this when decoding a HEVC 1080p stream w=
ith
>> >=20
>> > rkvdec on rk3588:
>> >   root # cat /sys/kernel/debug/v4l2/fdc38100.video-codec/mem
>> >   created-by                      fd              pid             size=
   =20
>> >          label
>> >   --------------------------------------------------------------------=
---
>> >   ...
>>=20
>> I build a kernel with your 3 patch series and I also build the v4l2top
>> utility. Cool tool :-D
>> Especially after I found out I should build the 'upstream' branch ;-)
>>=20
>> There were a couple of things I noticed:
>> 1) With 'plain' kernel 7.3-rc3 but also with all my patches included, bu=
t
>>    excluding the patches from this series, I see this:
>> ...
>>=20
>> Checking v4l2 debug dir again results in this:
>> ```
>> root@nanopc-t6-plus:~# ls -lh /sys/kernel/debug/v4l2/
>> total 0
>> drwxr-xr-x 2 root root 0 Sep 20 15:13 fdb60000.rga
>> drwxr-xr-x 2 root root 0 Sep 20 15:13 fdb80000.rga
>> drwxr-xr-x 2 root root 0 Sep 20 15:13 fdc38000.video-codec
>> drwxr-xr-x 2 root root 0 Sep 20 15:13 fdee0000.hdmi_receiver
>> ```
>>=20
>> I noticed my video-codec address was slightly different from yours.
>
> Yes, mine is on rk3588. A different SoC will have a different device regi=
ster=20
> address.

That's why I noticed/mentioned it as mine is rk3588 too. Maybe this commit?
b481c11cd20a ("arm64: dts: rockchip: Update vdec register blocks order on R=
K3588")

>> Playing a 1080p BBB x264 video with a patched ffmpeg+mpv, results in thi=
s:
>> ...
>>=20
>> And looking at the v4l2top utility, I noticed the following:
>> 1. I see differing indications of the load while it's playing :-D
>
> \o/

Just did another quick test (for 3.) and noticed sometimes green 'lines' an=
d
sometimes red 'lines'. Any significance to the color?
There also seems to be some kind of 'delay' when stopping a video and playi=
ng
another one (can be the same video). It looks like it's 'flatlining' until =
the
line of the previous video is scrolled off ...  and then it seems to 'repai=
nt'
itself as the 'flatline' comes back alive :-P

But this is REALLY minor and not bothersome at all.

>> 2. The ``Clock rate`` is always 750.0MHz (or 786431991Hz) (expected I
>> think?)
>
> Yes, the clock won't change, for now at least. Some decoders could adapt =
their=20
> clocks depending on the work. The frequency value will also be used to=20
> determine exact core usage for those that expose a used cycle count after=
 each=20
> job (I did not implement that yet in v4l2top)
>
>> 3. The ``Total Memory`` is always 0B and the ``Memory usage
>> details`` column is always empty. That's also the case when I press one =
of
>> the arrow keys which seems to select the entry. Am I missing sth or doin=
g
>> sth wrong?
>
> My guess would be that you didn't run it as root (this is usually needed =
to=20
> access the debugfs*). But if you did, we will have to dig a little.

I did indeed not run it as root the first time around. But just did another
test and with root the memory data is displayed :-)

Cheers,
  Diederik

> *: Note that later, we'd like to report global memory usage through fdinf=
o, so=20
> that the metric is accessible as a user, with buffer details still from t=
he=20
> debugfs (so that'd need root access)
>
> Detlev.
>
>>=20
>> > [1]:
>> > https://lore.kernel.org/all/20260610-v4l2-add-ftrace-v2-0-9756edf72ac1=
@co
>> > llabora.com/ [2]: https://github.com/cazou/v4l2top/tree/upstream
>> > [3]:
>> > https://lore.kernel.org/all/20260706-v4l2-add-fdinfo-v3-0-d556568cf38e=
@co
>> > llabora.com/
>> >=20
>> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>> > ---
>> >=20
>> > Detlev Casanova (4):
>> >       media: Add a v4l2 memory allocations tracker
>> >       media: Store v4l2_fh in the vb_queue
>> >       media: verisilicon: Switch to tracked dma allocations
>> >       media: rkvdec: Switch to tracked dma allocations
>> > =20
>> >  drivers/media/common/videobuf2/Makefile            |   1 +
>> >  drivers/media/common/videobuf2/v4l2-allocator.c    | 186
>> >  +++++++++++++++++++++ .../media/common/videobuf2/videobuf2-dma-contig=
.c=20
>> >  |  27 ++-
>> >  .../media/platform/rockchip/rkvdec/rkvdec-h264.c   |  14 +-
>> >  .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |  14 +-
>> >  .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    |  21 ++-
>> >  .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c |  14 +-
>> >  .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c |  14 +-
>> >  .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |  14 +-
>> >  .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |  14 +-
>> >  .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  33 ++--
>> >  drivers/media/platform/rockchip/rkvdec/rkvdec.c    |   4 +
>> >  drivers/media/platform/verisilicon/hantro.h        |   1 +
>> >  drivers/media/platform/verisilicon/hantro_drv.c    |   4 +
>> >  drivers/media/platform/verisilicon/hantro_h264.c   |   7 +-
>> >  drivers/media/platform/verisilicon/hantro_hevc.c   | 100 ++++++-----
>> >  drivers/media/platform/verisilicon/hantro_mpeg2.c  |  16 +-
>> >  .../media/platform/verisilicon/hantro_postproc.c   |  14 +-
>> >  drivers/media/platform/verisilicon/hantro_vp8.c    |  25 +--
>> >  drivers/media/platform/verisilicon/hantro_vp9.c    |  34 +++-
>> >  .../verisilicon/rockchip_vpu981_hw_av1_dec.c       | 160
>> >  +++++++++++-------
>> >  drivers/media/v4l2-core/v4l2-device.c              |   4 +-
>> >  include/media/v4l2-allocator.h                     |  26 +++
>> >  include/media/v4l2-device.h                        |   2 +
>> >  include/media/videobuf2-core.h                     |   3 +
>> >  25 files changed, 555 insertions(+), 197 deletions(-)
>> >=20
>> > ---
>> > base-commit: 66affa37cfac0aec061cc4bcf4a065b0c52f7e19
>> > change-id: 20260612-v4l2-add-mem-tracker-da0088c74a64
>> > prerequisite-change-id: 20260608-v4l2-add-ftrace-aec6e7f60a6c:v2
>> > prerequisite-patch-id: bd45b4df66799a7f9f22b49973a78d1bd3590a4a
>> > prerequisite-patch-id: 6a5ed5615f08257cf854d441785066b5ff4d5d47
>> > prerequisite-patch-id: 02594c869498b9e91e416d70242afbaa6b3a8d6a
>> > prerequisite-patch-id: 9f25ec78f3b99ac1c5d42eb732f5bd9eae73fadd
>> > prerequisite-patch-id: 4ed2c2e8c3abfa7f6328d0ea4f488ca5a3eec8fb
>> > prerequisite-patch-id: 8787d50eb80e1a63a57a123268cade23c9e64618
>> > prerequisite-patch-id: bfe85822378fa771f9bbc3e1e8c8ff6bce0eb7fd
>> > prerequisite-patch-id: 784d0801da320f7b41194f4632ee422c32f1b5b8
>> > prerequisite-patch-id: 362c8366e2efbfb5e6f1a3f71cfddbd46e8d1506
>> >=20
>> > Best regards,
>> > --
>> > Detlev Casanova <detlev.casanova@collabora.com>
>> >=20
>> >=20
>> > _______________________________________________
>> > Linux-rockchip mailing list
>> > Linux-rockchip@lists.infradead.org
>> > http://lists.infradead.org/mailman/listinfo/linux-rockchip


