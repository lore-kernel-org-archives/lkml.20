Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794043489;
	b=YqjurkmJlU4KcR21LSNMY7H0tqSpU8Cd/3yb23KGSxMSpe00REhOPjNu2HgK9bY5rPuZ
	 oQrOe27sMcKLV8LQ+URaeTtenJoeSyWDjAVyVcXjyPu1niwNqZFfWx1Zk1cY49Lb4aTCs
	 Mr2hCX6AE9PirQKHPTVfpRW3Be2r4awMrArkTDKDbWPaNS+eJBSbdFoQXhgTMYX3sn9Jf
	 VnbW9cbyWxwZpQeSCQv9nFMS2saQ1l8xTpxtwDKlOUdoAZHQ344id3kfU1v7vaAD/XUXf
	 X7BgndlmmU/EIg4JVeDimemsqt5nHA37EN+VQaxkyQND6zFZE/Idq1AcwlHNQzsRW3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794043489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=teIWFoxvai1QgmA58nk8sElOSZ5xnCHuXb5DRKtxj7c=;
	b=bzUveUEwD8nv/z0wjpa440vbf8CsKwdvu3WFCQen/qK+lkP5YxjgBps6KjJmf+t3GhED
	 v3wJHZAN/l8uy8FyNYOFRyTAwDIPwXwVNuSSl324NTIzBEI3akqGPe0VBGgPoHfk5LKX0
	 Ps7UeiOnAo11koA0Chg3ETVC7W9dYxc4cxDI+sO6cam/C8+Ji5Rno3df7yvU00xkWwZ7x
	 UveZsK/UzOfRjkJ5u4Bqw0b3UUgiWzJ7sRbnNE/UXG+erASkZraT4pNusCwd/lkAhCMeo
	 e3JQoShgrMY1jERUA4wzn3FfDXiuLLUGT+gVVuSGjQmt4smBdNAHCKMx/tYrSzC6RmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKRf62T0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EE8606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 09:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64EE8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKRf62T0
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6de1fd5f572so573905eaf.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:24:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794043488; cv=none;
        d=google.com; s=arc-20260327;
        b=UihY1dYRu7oq99SgrGc41X8Z2/Ck4EDPBSwYxGR+qw78fDcNmh0Ad3LMPVE2p5yrOF
         HMwRbd6FSh+X6gVF4LTfkdJ5GTMrZOHE1ailXXSTSPxMnhqseQ8Oln5EYiOgayG8/lS4
         Ht37YhEHZIoiU0BY9KlK+AZhpR0NZZt4Pk/UNkuHv7SfUwjYUflO3/bytQ7rHRHnDvld
         XnwwScgFVZJtUMziYCJCz2L8JJ1MUWvqs/BQoDzSqzz1CkVFW9TB2grearn2NSKcwTVA
         RCq4RmOfhmF9oMTsFRmULJ/j/CgQUkO2dzlnQdUBNJYoKfBRy77hXwBYkL/MVDXNpFUc
         R3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=teIWFoxvai1QgmA58nk8sElOSZ5xnCHuXb5DRKtxj7c=;
        fh=iBsKYBCNk87bHiomQoWd4+sRDfN6h14kHZlrUzbBkyA=;
        b=lhR31tHZ0Lha9Xzr6P/RNoKcNeiBRNjfJdIge5TdClJa9HZBLbqBYYsEWgxpT1qwfS
         8omtnIh77cp0mFOAEytANbziHAILMLzjZ5KWwQ0FSnLhBIpFs0sWGE44ueisUUxnH11N
         twoaM7JAoTwwHZyegdYm3Vfi7uw0m4BsxuKOhBqPZBCnbErWhjcJgaM0+rQ74qwv3SPW
         uDo89xD+NF/pqcAivaoJn5aLEF57oX/a5juytqQ0j/eN1APIVz/7QhUERvl6HWsBp+/+
         UOHzE+1vQo8CywAtnoKTgn4QwwjacFnHAjoIvpCJz+MZ48l0M/BG5o7G7d1FFpNCIMVA
         ssUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794043488; x=1794648288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=teIWFoxvai1QgmA58nk8sElOSZ5xnCHuXb5DRKtxj7c=;
        b=dKRf62T0qDchXjN7y+3oYgItIUBw4g1wOVebySojyArE5WrnJkLBtygXKAlQMmAvZm
         kdFOrYwoB7UAttCcsl1YTPMs72CKId+u00yjTJgIhZ3uBIcRU88RPLA2Yr40t9cHWy3G
         dbf//uJPrVgjxTfI4dZzKh9MufpLsSorH2scs/XaB1mx1wop8OzYjvwM1uD/vdtXt45p
         P/CvVRegJWAfAcBhATsMy/NC+FdF72PISsB0bLC81+KTb5VhQ/ejLnvo8CX+R2M0TEje
         I1+6vdAqk32Rq2F8b03cZ0YH04HzSDSKrfCsVo+GjS3nVFcyuMKOoe31iKAlWmPn3Lpy
         Rcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794043488; x=1794648288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=teIWFoxvai1QgmA58nk8sElOSZ5xnCHuXb5DRKtxj7c=;
        b=chmiVcelQFnj/pjRZz3uCtF9+0YnO96E3zQhY62IXxtWU7RKM//jDM+n6v6EuAkz9j
         mXyzGV1DCSpZ7rAckOAD6EW1r1rwzTA1Ztfd0zomU+xqF85gWOO8w+Dk3WZNSvXQPraS
         19/pHIwA4ybczj/MOY8e32eIPRTR0hwIFX7YSvHnDk8JndBs58qDyemVTTD1QL/MXdif
         oLRpPDCHVVO1jSEWO6hjcfOZ72AIxbO+sqOJXaCxyUHe/9CibNDSfLgBsK5NQ18+NOwt
         FTF3sJfQ9NE28clZDN8q62dI1oz05JBBo8rqeu3yarjAi0yucWqOIeb54y/rOh/FIKBg
         fFWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIRZj5qehoXwrEBitZxP5zLzVtwSyTxY7WR2PhTEF/XPp8Ns27BEHozfOhasIDuTehkZg4EtbFJDyLPGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gQ2HVAA9JktjLhTR+Bk0S2TdC+qI128TjaK23q3OGswaTUYWT
	i0fWs79qqVZhm953bjYaJcKpOtshNNm2FRNkvyJLHFODl0i2QwZoBzdimyTJKkYeaGsd371diYR
	R09C8LY5asKdtpQtf/Mpis3xt1LCY+Y4=
X-Gm-Gg: AYBFou1qn/XLtIAYJPlTY4HOws0szP4NqM91bdT1dsSLlidiJrCYC8CrkTsPQP81Axq
	Gzxyifb8mabrn5Li53o4ug1HzFXArcvndmBb+DsmTpQSvmXIBlXoePAhDVsyubosaw+hgvOJQnU
	B2ivpD1kXoSUoST9acgyrK+V4whHLKpnGAQsiBITcbBtPN2Zk1dGxMIYs5/lVpitpul9OK2UQQF
	XeFi59oq0wR6j+cqYuziGOmZdLp0MjJyT3KD68EaWpTlKo2EWiBB6s6jZ9/nWvpPgcEnyN6SBOw
	3VgPBxRs3OSfnX2Az7fVI9cUG7toGGculw2Kapfl2Wx8jkIxCjZ4PC1ka3O/N4dMcEBKgNy99YN
	3BHoTEyqacF7Y6XNXKmPPCb34Gqdeb8MRG9I=
X-Received: by 2002:a05:6808:1246:b0:567:cbf5:bbab with SMTP id
 5614622812f47-567e14643fbmr3397829b6e.60.1794043488173; Sat, 07 Nov 2026
 01:24:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106204329.2176266-1-carlosalberto4ti@gmail.com>
In-Reply-To: <20261106204329.2176266-1-carlosalberto4ti@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sat, 7 Nov 2026 10:24:36 +0100
X-Gm-Features: AclHuK_3rVhhaI0Q0HYZNd1pYmMhMO7iRMGrNGROwjLOJBeK6Hdfo1HdSx7nPEI
Message-ID: <CAMeQTsZAfgfBadAV28-k9jmKoqJi03xghmnAqUwK8Unzd8JEsw@mail.gmail.com>
Subject: Re: [PATCH 0/2] staging: media: facetimehd: add driver for Apple
 FaceTime HD camera
To: Carlos Alberto <carlosalberto4ti@gmail.com>
Cc: gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl, 
	linux-media@vger.kernel.org, devel@driverdev.osuosl.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 9:43=E2=80=AFPM Carlos Alberto
<carlosalberto4ti@gmail.com> wrote:
>
> This patch series introduces the facetimehd driver to drivers/staging/med=
ia/.
> The driver supports the Broadcom BCM1570 (PCI ID 14e4:1570) PCIe Image Si=
gnal
> Processor found in Apple MacBook Pro, MacBook Air, and iMac machines (spa=
nning
> generations from 2013 to 2019).

Hi Carlos, thanks for working on the driver.

I don't mind people using AI for coding but I don't think an AI code
dump is the proper way to upstream this driver. Multiple people have
approached me recently on wanting to upstream this so my plan is to do
it myself. The problem is that we have a high stream of mostly AI
generated fixes queued on github. I would like to handle those before
submission.

>
> Historically, this driver remained out-of-tree primarily because it lacke=
d a
> redistributable firmware binary and relied on extracting proprietary blob=
s from
> macOS recovery packages. We have addressed this blocker by developing Ope=
nFTHD,
> a 100% clean-room, open-source firmware (GPL-2.0-only) written in freesta=
nding
> C and bare-metal embedded Rust. A separate patch for linux-firmware adds
> facetimehd/firmware.bin.

This was never really the blocker. There are other drivers in the
kernel without redistributable firmware. Our current script would have
been fine.

I had a quick glance at the OpenFTHD and it seems rather simplistic
for what the original firmware does. Did you only include code for the
sensor and not the ISP? ov5650 support is not included in the mainline
kernel.

-Patrik

>
> Key capabilities included in this submission:
> - Modern V4L2 and videobuf2-dma-sg implementation compatible with Linux 6=
.12+
>   through 7.0+ (removal of deprecated vb2 callbacks).
> - Seamless PipeWire and Flatpak streaming via in-page USERPTR offset supp=
ort
>   (programming obj->byte_offset into ISP DMA descriptors) and chained sca=
tterlist
>   iteration with for_each_sg().
> - Discrete framesize enumeration (1080p, 720p, VGA, QVGA) and matching
>   discrete frameintervals for WebRTC, PipeWire, OBS, and browser capture.
> - Native V4L2_PIX_FMT_YUYV pixel pipeline with power-of-two 8-pixel macro=
block
>   stride alignment and immediate Auto White Balance (AWB) on channel star=
t.
> - Hardware ePTZ digital zoom (VIDIOC_G_SELECTION / VIDIOC_S_SELECTION for
>   V4L2_SEL_TGT_CROP), executing lossless sensor crop without host CPU ove=
rhead.
> - Auto-Exposure Photometry Metering (V4L2_CID_EXPOSURE_METERING: Average,
>   Center-Weighted, Spot, Matrix).
> - Wide Dynamic Range / HDR (V4L2_CID_WIDE_DYNAMIC_RANGE) tone adaptation.
> - Camera status / privacy indicator LED control (V4L2_CID_ILLUMINATORS_1)=
.
> - Runtime module parameters and power profiles (High Performance, Balance=
d,
>   Aggressive Low Power sensor sleep) exposed under /sys/module/facetimehd=
/parameters/.
>
> The driver has been validated on physical hardware (MacBook Pro Retina 15=
-inch
> Mid 2014, MacBookPro11,2, PCI 03:00.0) running Linux 7.0.0-14-generic,
> streaming cleanly at a steady 30.0 fps in both native V4L2 and PipeWire
> (GNOME Cheese / Snapshot in Flatpak containers) with zero dropped frames.
>
> Repository & Upstream Pull Request References:
> - Out-of-tree repository: https://github.com/patjak/facetimehd
> - Tracking Pull Request: https://github.com/patjak/facetimehd/pull/368
> - Active branch with test suite: https://github.com/programandosolucoes/f=
acetimehd/tree/linux-6.12-compat
> - OpenFTHD clean-room firmware: https://github.com/programandosolucoes/op=
en-fthd-firmware
>
> A TODO file is provided detailing the roadmap for graduating from staging
> into drivers/media/pci/facetimehd/.
>
> Carlos Alberto (2):
>   staging: media: facetimehd: add driver for Apple FaceTime HD (BCM1570)
>     PCIe camera
>   staging: media: wire up facetimehd in Kconfig and Makefile
>
>  drivers/staging/media/Kconfig                 |    1 +
>  drivers/staging/media/Makefile                |    1 +
>  drivers/staging/media/facetimehd/Kconfig      |   16 +
>  drivers/staging/media/facetimehd/Makefile     |    5 +
>  drivers/staging/media/facetimehd/TODO         |   18 +
>  .../staging/media/facetimehd/fthd_buffer.c    |  125 ++
>  .../staging/media/facetimehd/fthd_buffer.h    |   73 +
>  drivers/staging/media/facetimehd/fthd_ddr.c   |  670 ++++++++
>  drivers/staging/media/facetimehd/fthd_ddr.h   |   30 +
>  .../staging/media/facetimehd/fthd_debugfs.c   |  198 +++
>  .../staging/media/facetimehd/fthd_debugfs.h   |   17 +
>  drivers/staging/media/facetimehd/fthd_drv.c   |  600 +++++++
>  drivers/staging/media/facetimehd/fthd_drv.h   |  133 ++
>  drivers/staging/media/facetimehd/fthd_hw.c    |  712 ++++++++
>  drivers/staging/media/facetimehd/fthd_hw.h    |  128 ++
>  drivers/staging/media/facetimehd/fthd_isp.c   | 1483 +++++++++++++++++
>  drivers/staging/media/facetimehd/fthd_isp.h   |  768 +++++++++
>  drivers/staging/media/facetimehd/fthd_reg.h   |  184 ++
>  .../staging/media/facetimehd/fthd_ringbuf.c   |  135 ++
>  .../staging/media/facetimehd/fthd_ringbuf.h   |   44 +
>  drivers/staging/media/facetimehd/fthd_v4l2.c  |  881 ++++++++++
>  drivers/staging/media/facetimehd/fthd_v4l2.h  |   34 +
>  22 files changed, 6256 insertions(+)
>  create mode 100644 drivers/staging/media/facetimehd/Kconfig
>  create mode 100644 drivers/staging/media/facetimehd/Makefile
>  create mode 100644 drivers/staging/media/facetimehd/TODO
>  create mode 100644 drivers/staging/media/facetimehd/fthd_buffer.c
>  create mode 100644 drivers/staging/media/facetimehd/fthd_buffer.h
>  create mode 100644 drivers/staging/media/facetimehd/fthd_ddr.c
>  create mode 100644 drivers/staging/media/facetimehd/fthd_ddr.h
>  create mode 100644 drivers/staging/media/facetimehd/fthd_debugfs.c
>  create mode 100644 drivers/staging/media/facetimehd/fthd_debugfs.h
>  create mode 100644 drivers/staging/media/facetimehd/fthd_drv.c
>  create mode 100644 drivers/staging/media/facetimehd/fthd_drv.h
>  create mode 100644 drivers/staging/media/facetimehd/fthd_hw.c
>  create mode 100644 drivers/staging/media/facetimehd/fthd_hw.h
>  create mode 100644 drivers/staging/media/facetimehd/fthd_isp.c
>  create mode 100644 drivers/staging/media/facetimehd/fthd_isp.h
>  create mode 100644 drivers/staging/media/facetimehd/fthd_reg.h
>  create mode 100644 drivers/staging/media/facetimehd/fthd_ringbuf.c
>  create mode 100644 drivers/staging/media/facetimehd/fthd_ringbuf.h
>  create mode 100644 drivers/staging/media/facetimehd/fthd_v4l2.c
>  create mode 100644 drivers/staging/media/facetimehd/fthd_v4l2.h
>
> --
> 2.53.0
>
