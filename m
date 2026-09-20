Received: from mta1.migadu.com (out-34.mta1.migadu.com [95.215.58.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCC23FADFA
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912235; cv=none; b=AaQgidGF6w0qZLvsexgFA6nqSPyCavoWhgQVfm0CI8NnLAlDQZuUk3iQ+Q6DlcIkV8fyztN7Xbx2ydpy2p/JjPnEB5qBJpUSBa8jcDHlNaadfeAfXBEl8zPlLiynseXnoA6SaSvn6NogaEHjcyEL1aD3dE17NDBvEt9rgCGa3zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912235; c=relaxed/simple;
	bh=XSgnM9/tTrs2Fbc7ahvU6+D7SlzrKgvkr5L6sZlWc5A=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=gtWo7UpouXCEAfoy6Pbo6z3e2DkUXd8318NAtRdrtb3cOfChmdpFh5DsSwdd1Rs9WftX/G7yQu8tBeb2eBt74ilv1ItUWqb3izEE9ricZQgTDrFOXN1mUbj/ceY/CuJi78eWDgfdTggPqqCFUKetFvuLQDZUk+x4owcWJ6IezQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=lQ6AAaQj; arc=none smtp.client-ip=95.215.58.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="lQ6AAaQj"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XSgnM9/tTrs2Fbc7ahvU6+D7SlzrKgvkr5L6sZlWc5A=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789912229; v=1; x=1790517029;
 b=lQ6AAaQjABn4A3L4NlFJ1wNg2d39i3guMeAE97Y4JgNTehJU+NYnaehSAhQfZ8GQFiTEmcOt
 ocisnZbBL7fFnUwITNNjS4v9HLrrnwSVAgh1oJBRqNJdaAsk0FAHk5o5/hyYaCnSqk7n7MeHFqr
 IgaCUOIEYMOINxQ92NHD1rokVBf8JqRhIdX9zOUzh3aQxgpZ3aRaiJaMdUYfarJbBn/yP6wAoyo
 KxxZd5kVbjTgPhJ0x0WChNiCUN/nZJoDUY2ccqPI4331qbrtBkdAMhgEiHfXVUIeydsa1CJ7q5X
 Pw5iNYOvK+zKvOYFdFlIvfxQtX7y0o6pchlS6PuEiZE2g==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9fed9906a7b4c0cf;
	Sun, 20 Sep 2026 13:50:25 +0000
X-Mizu-Trace-ID: 9fed9906a7b4c0cf
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Sep 2026 15:50:24 +0200
Message-Id: <DLK6XGIB22XG.58WF7VP9L3NH@cknow-tech.com>
To: "Detlev Casanova" <detlev.casanova@collabora.com>, "Tomasz Figa"
 <tfiga@chromium.org>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Nicolas Dufresne"
 <nicolas.dufresne@collabora.com>, "Benjamin Gaignard"
 <benjamin.gaignard@collabora.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Heiko Stuebner" <heiko@sntech.de>, "Ezequiel
 Garcia" <ezequiel@vanguardiasur.com.ar>
Cc: <kernel@collabora.com>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/4] media: Track v4l2 buffers through an allocator
From: "Diederik de Haas" <diederik@cknow-tech.com>
X-Mailer: aerc 0.22.0-24-g39041fd9f179
References: <20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com>
In-Reply-To: <20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com>

Hi Detlev,

On Wed Sep 16, 2026 at 4:25 PM CEST, Detlev Casanova wrote:
> Hello,
>
> Currently, the only way to track buffers allocated by v4l2 from usespace
> is to use the subsystem available debug information (e.g.:
> /sys/kernel/debug/dma_buf/bufinfo).
> But that information is generic and cannot be matched to a v4l2 driver or
> to a userspace application: It is merely information about the allocation=
.
>
> Other types of allocations require the developper to find where they are
> exposed and how to link them to their test.
>
> This can become hard to track when mutliple drivers are working at the
> same time.
>
> To improve that, add a small wrapper around buffer allocations to keep
> track of them at the video device level so that we can add debug
> information to them like a name, userspace pid/fd that did the
> allocation,... and expose them to userspace via a debugfs entry.
>
> It currently only supports DMA buffer allocations and adds support for
> VB2 allocations too.
> Other kind of memory tracking can be added later.
> The verisilicon and rkvdec drivers have been ported to use the tracked
> dma alloactions.
>
> Note that this depends on the ftrace support patch series[1] that
> provides fd/pid info in the v4l2_fh struct.
> That series is a bit old, so this is based on an older linux version, but
> that only changes things for the last 2 commits.
>
> A v4l2top utility[2] has been made, to be used in parallel with the
> fdinfo patch series[3], to show the list of active streams with their HW
> and memory usage.
>
> With this, debugfs looks like this when decoding a HEVC 1080p stream with
> rkvdec on rk3588:
>
>   root # cat /sys/kernel/debug/v4l2/fdc38100.video-codec/mem=20
>   created-by                      fd              pid             size   =
         label
>   -----------------------------------------------------------------------=
--------------
>   gst-launch-1.0                  7               635             39184  =
         vdpu381-hevc-priv-tbl
>   gst-launch-1.0                  7               635             4177920=
         cap-00000000ac34392e-7
>   gst-launch-1.0                  7               635             4177920=
         cap-00000000ac34392e-6
>   gst-launch-1.0                  7               635             4177920=
         cap-00000000ac34392e-5
>   gst-launch-1.0                  7               635             4177920=
         cap-00000000ac34392e-4
>   gst-launch-1.0                  7               635             4177920=
         cap-00000000ac34392e-3
>   gst-launch-1.0                  7               635             4177920=
         cap-00000000ac34392e-2
>   gst-launch-1.0                  7               635             4177920=
         cap-00000000ac34392e-1
>   gst-launch-1.0                  7               635             4177920=
         cap-00000000ac34392e-0
>   gst-launch-1.0                  7               635             3133440=
         out-000000005c0230f6-1
>   gst-launch-1.0                  7               635             3133440=
         out-000000005c0230f6-0
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   Total size: 39729424

I build a kernel with your 3 patch series and I also build the v4l2top util=
ity.
Cool tool :-D=20
Especially after I found out I should build the 'upstream' branch ;-)

There were a couple of things I noticed:
1) With 'plain' kernel 7.3-rc3 but also with all my patches included, but
   excluding the patches from this series, I see this:

```
root@nanopc-t6-plus:~# ls -lh /sys/kernel/debug/v4l2/
total 0
drwxr-xr-x 3 root root 0 Sep 20 15:10 fdee0000.hdmi_receiver
```

Which is presumably the reason that with a kernel which also includes this
patch series, I get the following kernel error:
``[   10.849405] debugfs: 'v4l2' already exists in '/'``

I don't think this should generate an error/warning/info message at all,
but just silently dealt with.

Checking v4l2 debug dir again results in this:
```
root@nanopc-t6-plus:~# ls -lh /sys/kernel/debug/v4l2/
total 0
drwxr-xr-x 2 root root 0 Sep 20 15:13 fdb60000.rga
drwxr-xr-x 2 root root 0 Sep 20 15:13 fdb80000.rga
drwxr-xr-x 2 root root 0 Sep 20 15:13 fdc38000.video-codec
drwxr-xr-x 2 root root 0 Sep 20 15:13 fdee0000.hdmi_receiver
```

I noticed my video-codec address was slightly different from yours.

Playing a 1080p BBB x264 video with a patched ffmpeg+mpv, results in this:
```
root@nanopc-t6-plus:~# cat /sys/kernel/debug/v4l2/fdc38000.video-codec/mem
created-by                      fd              pid             size       =
     label
---------------------------------------------------------------------------=
----------
mpv                             26              2027            4177920    =
     cap-00000000205a3b3a-10
mpv                             26              2027            4177920    =
     cap-00000000205a3b3a-9
mpv                             26              2027            4177920    =
     cap-00000000205a3b3a-8
mpv                             26              2027            16736      =
     vdpu381-h264-priv-tbl
mpv                             26              2027            3133440    =
     out-0000000079002cb1-3
mpv                             26              2027            3133440    =
     out-0000000079002cb1-2
mpv                             26              2027            3133440    =
     out-0000000079002cb1-1
mpv                             26              2027            3133440    =
     out-0000000079002cb1-0
mpv                             26              2027            4177920    =
     cap-00000000205a3b3a-7
mpv                             26              2027            4177920    =
     cap-00000000205a3b3a-6
mpv                             26              2027            4177920    =
     cap-00000000205a3b3a-5
mpv                             26              2027            4177920    =
     cap-00000000205a3b3a-4
mpv                             26              2027            4177920    =
     cap-00000000205a3b3a-3
mpv                             26              2027            4177920    =
     cap-00000000205a3b3a-2
mpv                             26              2027            4177920    =
     cap-00000000205a3b3a-1
mpv                             26              2027            4177920    =
     cap-00000000205a3b3a-0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Total size: 58507616
```

And looking at the v4l2top utility, I noticed the following:
1. I see differing indications of the load while it's playing :-D
2. The ``Clock rate`` is always 750.0MHz (or 786431991Hz) (expected I think=
?)
3. The ``Total Memory`` is always 0B and the ``Memory usage details`` colum=
n
   is always empty. That's also the case when I press one of the arrow keys
   which seems to select the entry. Am I missing sth or doing sth wrong?

Cheers,
  Diederik

> [1]: https://lore.kernel.org/all/20260610-v4l2-add-ftrace-v2-0-9756edf72a=
c1@collabora.com/
> [2]: https://github.com/cazou/v4l2top/tree/upstream
> [3]: https://lore.kernel.org/all/20260706-v4l2-add-fdinfo-v3-0-d556568cf3=
8e@collabora.com/
>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> Detlev Casanova (4):
>       media: Add a v4l2 memory allocations tracker
>       media: Store v4l2_fh in the vb_queue
>       media: verisilicon: Switch to tracked dma allocations
>       media: rkvdec: Switch to tracked dma allocations
>
>  drivers/media/common/videobuf2/Makefile            |   1 +
>  drivers/media/common/videobuf2/v4l2-allocator.c    | 186 +++++++++++++++=
++++++
>  .../media/common/videobuf2/videobuf2-dma-contig.c  |  27 ++-
>  .../media/platform/rockchip/rkvdec/rkvdec-h264.c   |  14 +-
>  .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |  14 +-
>  .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    |  21 ++-
>  .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c |  14 +-
>  .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c |  14 +-
>  .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |  14 +-
>  .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |  14 +-
>  .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  33 ++--
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c    |   4 +
>  drivers/media/platform/verisilicon/hantro.h        |   1 +
>  drivers/media/platform/verisilicon/hantro_drv.c    |   4 +
>  drivers/media/platform/verisilicon/hantro_h264.c   |   7 +-
>  drivers/media/platform/verisilicon/hantro_hevc.c   | 100 ++++++-----
>  drivers/media/platform/verisilicon/hantro_mpeg2.c  |  16 +-
>  .../media/platform/verisilicon/hantro_postproc.c   |  14 +-
>  drivers/media/platform/verisilicon/hantro_vp8.c    |  25 +--
>  drivers/media/platform/verisilicon/hantro_vp9.c    |  34 +++-
>  .../verisilicon/rockchip_vpu981_hw_av1_dec.c       | 160 +++++++++++----=
---
>  drivers/media/v4l2-core/v4l2-device.c              |   4 +-
>  include/media/v4l2-allocator.h                     |  26 +++
>  include/media/v4l2-device.h                        |   2 +
>  include/media/videobuf2-core.h                     |   3 +
>  25 files changed, 555 insertions(+), 197 deletions(-)
> ---
> base-commit: 66affa37cfac0aec061cc4bcf4a065b0c52f7e19
> change-id: 20260612-v4l2-add-mem-tracker-da0088c74a64
> prerequisite-change-id: 20260608-v4l2-add-ftrace-aec6e7f60a6c:v2
> prerequisite-patch-id: bd45b4df66799a7f9f22b49973a78d1bd3590a4a
> prerequisite-patch-id: 6a5ed5615f08257cf854d441785066b5ff4d5d47
> prerequisite-patch-id: 02594c869498b9e91e416d70242afbaa6b3a8d6a
> prerequisite-patch-id: 9f25ec78f3b99ac1c5d42eb732f5bd9eae73fadd
> prerequisite-patch-id: 4ed2c2e8c3abfa7f6328d0ea4f488ca5a3eec8fb
> prerequisite-patch-id: 8787d50eb80e1a63a57a123268cade23c9e64618
> prerequisite-patch-id: bfe85822378fa771f9bbc3e1e8c8ff6bce0eb7fd
> prerequisite-patch-id: 784d0801da320f7b41194f4632ee422c32f1b5b8
> prerequisite-patch-id: 362c8366e2efbfb5e6f1a3f71cfddbd46e8d1506
>
> Best regards,
> -- =20
> Detlev Casanova <detlev.casanova@collabora.com>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


