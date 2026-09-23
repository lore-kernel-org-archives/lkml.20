Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EA14E3EED
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165473; cv=pass; b=Xvu/5d4CxgmeEjKStU96ZC+hCUlSwzWHeWkp9K0MUOD3xkGRfYfdL1cpDLMaEPQaOiKvjKi9buslRvqHV87N2GffZJnKafPIpCzNd/aukG+b4w0Yck9ztTTdckh6fUwjBP3xhJyoDbJBNNbCLgUFIbclzWk5oc1v6sOxSeZ1MBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165473; c=relaxed/simple;
	bh=o9ESTc8AilBu3NYkC+X8HMlQp3tCaNfUdjSt8pFWTNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+hQEecFu9XjVqENM9u/q3r3SzlYm1TWZ3Fju7nSSs76/p6XvY2XRMdiCg7S4wMEZs4Dgfb6Y2fav1eBpoInIYKcmB4nr1+F+ClxBSawzblxdK56Ds6/jS06Mpn1iKbq7dFvGYIL04YMaQqwWvASlKoMzIwURvj56vCW6+N9PP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=OxuZWshG; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OxuZWshG"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e630052ebso982964eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790165465; cv=none;
        d=google.com; s=arc-20260327;
        b=co7SS1TlgICSLvKTwiYXypzIEr86HeKemPaiP3tR4yUagHF6KdAb7ADQGacZ0E9DnP
         1RjZooefIFQqkpI8zH4fX/aU9l5tOQSyEYa2UkzdWpNC0p1XIgD76++8kB79xd3RK1t4
         V1JFClXB3epALGtyv4HTtcnE1qG9SCFx7OKfd9oEAKzHW129ejA/Y1WagZW5cY/m1bxU
         fkqtZxWShqGPP8Oavxkv5ExafH91Bd+jJpdtvRL0NmCWyLGZ4MnuKd7WkjUWkzUAFr51
         OsZW+wC63VJnfZx1RemoHyebQ9x+YLzdNdhUcikqKspkF0wG9QqC46wdVp/sXLuGF9bP
         J34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D+sAs6/yZPqQPCCjoSh/yVQa4eqK/t0Brk5AQsTggYw=;
        fh=aWOrHff6b5h+c8WwMjjJ4GQ4RQWNjqhy9JIAk7dH7ck=;
        b=QbqeLTihTGZLkqsdp6sJ+kVW4ZnSdg/IBkxu+JExb1rdhURUabeEhpKKcm//cmbrT2
         ho93RPtl7aoHq/aVIC0+jCDwkPYlPAze5ME4GD4YO6/p6BznhW1g4R3OTwC1480Riotv
         CPCCeiwCm1mxmyhReDPIBbCFRjly0uj3/+Vy4daxNp6eKrrMCPgpMnW98vVB+giJ8vK6
         UDri5pSeyxc1ZSIQf7nT3y58CZ/Qp2GWMSmgi2c/z0DkTgOgJztLNPxk3WSIDbwK6+O2
         UrEu0j8mUx/Dq5WGb2HIDPbVnQszyWXsmbvA92w/S2x+24cBJxzEAdSlC42XAfantUTa
         7aSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790165465; x=1790770265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D+sAs6/yZPqQPCCjoSh/yVQa4eqK/t0Brk5AQsTggYw=;
        b=OxuZWshG81Pu7Q/R9zG6hbx+dwDw7NwyKM7czLs2lWaBn8/7gpC/FHK2oiCmmsjHMQ
         3fCDRnxSP6EEPQ6UF/eA7HxQiR401m7ejC8xcEaRF16egQQuwEkBLgc+KQQ32sqLZHYj
         O4Ac8xA2zyyCCBMOVRGJ+oNYUbeAd3e0L2nn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165465; x=1790770265;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+sAs6/yZPqQPCCjoSh/yVQa4eqK/t0Brk5AQsTggYw=;
        b=QsbHl3mn9WUudOWEnbnFctw7VNhnkIyCiUZ/CGVNulN6/ri5RFmVfA1NaE0rPdKcVL
         rTghcPZGVEQAU7hnvaCxuCaKEMBsNDJyxFXVzHwZ7msISfz4Vh4ag767ZX+pNUHW7yVW
         Vqaoxznoq6+Es1W5oyVuVLoAXE9wUdTrKPvaR4rQvkQTCf13pGOY9C8BaJEMKh38oyOS
         npp9Hz7dI0eTCsEYAmDLpMjzbSNOt21QhwGmx9Bdh81NCSFEe6pK5c/1U650Bn5achow
         I5s7iNrxbaSTFqnx4nQwGRQ0PXQ9DVj0a2SVcGkznU0Jc9c5dTEIPFVmfDQyhkKGkyQy
         bRIg==
X-Forwarded-Encrypted: i=1; AKwUvBwOYy8nXphMooORMfzTTSYJ9GStJZ1VpFQhtlOTyFJBIocXuziOGH3rw36oAnw52/PMomio6HQWMVdbJfw=@vger.kernel.org
X-Gm-Message-State: AFuF++kl9zMjeVaYUcfuJwNiZIB78TIF8iTVsrb+Jbu4YqB4JywpHxhy
	WyMChC0D5Nn2ugNBRbhr4BKne9YA6RbZsHoY5oCdOMIehkUaz4N/iqa9M2HF6EM29Za21py+MLe
	xcZDgPpMfilUDZIchnuCSCD+VciqmagfEdxcJsLOT0g==
X-Gm-Gg: AYBFou1IXYJqRgll8JkMC0C5423qfHAJDTjcbXeXTohCVqna6puiGGXFHKntH2UlWiw
	BSL9B8I57PfDqEzRQ7MUEYIySMWTA7auaQhPgNPo1xwUBXmS1aIgBU90iNMbI5caah+UMQwbcv1
	TH7wTTNM0UXl46MzDXR1Wn3wX/UZ1zE3AgwNEB6+ImT+V9ZjaKcmzP7Dr308DB+6UoG6GoHu1s0
	HGaZuE+3rPPyPH3EjZ/MqcsUBFfZGLLbYowiSKsAyFVaB/g8wEY1oMF5Pm4E56dmFJ/VKzsBicR
	Gyi63U06QUc6ugEsYM6ziRQ0DMNlxxX4KFf3CprbzdnutHA8Xz4eQF8HdETP0jrfJsagwYj4waB
	vWyDHgZJ1
X-Received: by 2002:a05:7300:c7c8:b0:315:9d54:6bf with SMTP id
 5a478bee46e88-33ea4d875damr2193402eec.10.1790165464415; Wed, 23 Sep 2026
 05:11:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
In-Reply-To: <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 23 Sep 2026 14:10:52 +0200
X-Gm-Features: AclHuK-84lPkb8p5nYwdkesZrMKYeKl0UBKC7sQ4h-YVRpCrvvaQQCitxdpuwrs
Message-ID: <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, May 22, 2026 at 4:55=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi Paul,
>
> Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9cri=
t :
> > This series introduces support for the V4L2 H.264 stateless encode uAPI=
,
> > core and support in the hantro driver for the Verisilicon VC8000E.
> >
> > While this is a first version that will likely need some level of rewor=
k,
> > it is already usable for most common use-cases and supports constant
> > bitrate rate-control.
> >
> > A GStreamer tree can be used to test the series at:
> > https://github.com/paulkocialkowski/gstreamer/tree/v4l2codecs/h264enc
> > And an example pipeline would look like:
> > gst-launch-1.0 videotestsrc pattern=3Dsmpte num-buffers=3D25 ! video/x-=
raw,width=3D640,height=3D480 ! v4l2slh264enc rate-control=3Dcbr bitrate=3D8=
000000 qp-min=3D8 qp-max=3D42 ! h264parse ! matroskamux ! filesink location=
=3Dencode.mkv
> >
> > Note that documentation for the new uAPI is intentionally left out of
> > this series since it has not yet received approval.
>
> The unfortunate part is that the spec is important for the actual review =
and
> interops analyses. That omission qualify this submission as RFC from my p=
oint of
> view. Any chances you can reply to this cover filling the blank for the f=
ew
> important bit (something similar but non spec style of:
>
> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-statel=
ess-decoder.html#initialization
>
> - Querying capabilities
> - Initialization
> - Encoding
> - Dynamic Resolution Changes**
>
> The other sections are just going to be the same imho. The ** for the DRC=
 is
> because H.264 is not that complicated, its intra only, so you can reset t=
he
> encoder (use the drain flow). So that's probably something for future us
> (VP9/AV1). Adding your view on these topics (or just matching what you ha=
ve
> implemented) will make review more constructive.
>
> cheers,
> Nicolas
>
> >
> > Marco Felsch (2):
> >   media: hantro: use hantro_decoded_buffer only for dst_vq
> >   arm64: dts: imx8mp: add VC8000E encoder node
> >
> > Paul Kocialkowski (12):
> >   media: h264: Add a more generic reflist builder init
> >   media: uapi: Add H.264 stateless encode support
> >   media: h264: Add SPS video definitions
> >   media: h264: Add stateless encode core
> >   media: h264: Add stateless encode rbsp
> >   media: h264: Add stateless encode reference management
> >   media: h264: Add stateless encode rate control
> >   media: verisilicon: Report default pixel coding for non-JPEG and fix =
JPEG case
> >   media: verisilicon: Cancel job with runtime pm put/clk disable on fai=
lure
> >   media: verisilicon: Add common encoder parm and frameintervals ioctls
> >   media: verisilicon: Add support for the VC8000E H.264 encoder
> >   media: verilisicon: imx8m: Add support for the VC8000E on i.MX8MP
> >
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   11 +
> >  drivers/media/platform/verisilicon/Kconfig    |    1 +
> >  drivers/media/platform/verisilicon/Makefile   |    2 +
> >  drivers/media/platform/verisilicon/hantro.h   |   17 +
> >  .../media/platform/verisilicon/hantro_drv.c   |  180 +-
> >  .../media/platform/verisilicon/hantro_h264.c  |    6 +-
> >  .../media/platform/verisilicon/hantro_hw.h    |   28 +
> >  .../media/platform/verisilicon/hantro_v4l2.c  |  123 +-
> >  .../platform/verisilicon/hantro_vc8000e.c     |   68 +
> >  .../verisilicon/hantro_vc8000e_h264_enc.c     |  883 +++++++
> >  .../verisilicon/hantro_vc8000e_regs.h         | 2129 +++++++++++++++++
> >  .../media/platform/verisilicon/imx8m_vpu_hw.c |  113 +
> >  drivers/media/v4l2-core/Kconfig               |    4 +
> >  drivers/media/v4l2-core/Makefile              |    2 +
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c     |   62 +
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    4 +
> >  drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c  | 1173 +++++++++
> >  drivers/media/v4l2-core/v4l2-h264-enc-rc.c    |  558 +++++
> >  drivers/media/v4l2-core/v4l2-h264-enc.c       | 1322 ++++++++++
> >  drivers/media/v4l2-core/v4l2-h264.c           |   69 +
> >  include/media/v4l2-ctrls.h                    |    2 +
> >  include/media/v4l2-h264-enc-rbsp.h            |   72 +
> >  include/media/v4l2-h264-enc-rc.h              |  108 +
> >  include/media/v4l2-h264-enc.h                 |  135 ++
> >  include/media/v4l2-h264.h                     |  146 ++
> >  include/uapi/linux/v4l2-controls.h            |   33 +
> >  include/uapi/linux/videodev2.h                |    1 +
> >  27 files changed, 7231 insertions(+), 21 deletions(-)
> >  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e.c
> >  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_h=
264_enc.c
> >  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_r=
egs.h
> >  create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
> >  create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rc.c
> >  create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc.c
> >  create mode 100644 include/media/v4l2-h264-enc-rbsp.h
> >  create mode 100644 include/media/v4l2-h264-enc-rc.h
> >  create mode 100644 include/media/v4l2-h264-enc.h

I tested on px30 and achieved working H.264 encoding with some small change=
s

Michael
