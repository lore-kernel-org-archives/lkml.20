Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794335280;
	b=y+xrk3b1apRR1nJ8ftwCp2nJkOmKRuOPJQlmofCv9baq/+PD5mVC4pAcT82vCw/SGTIu
	 HhMyXe0EbTAAvlAy17fQKfbbuRK0ZpnDR1WlqFVR/yiurMCKnb/czuNyJJOF+ux1jcm7b
	 geirnyvOoOQrHsjyNUUgKqvx50FeCd0d/BzDP2kZxHvZSegb6B9m1cJsHFwuyAIMbdRag
	 YMy+6gCR++SV4GnwUBHomsAYYf3JlR+kW/ZZH1zF4SHWEXErDnHugITBYFgCN8IT5Qohr
	 FAebjhVlRf18kbwUk4rxbDPzCFp6dMran2lmmmPFRvPku3TrxQVNF2AC5CrBy/0tNIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0YLdB3g9tnxFjs9/6VH9nFXGUYkvbUmaGAC4N10mcqc=;
	b=PmPu0DcSfrVZHhMgAbgoQY09T4KbCsW+N+MNI2zD4QTyD0Ew+Ttqcq9qFvXTtACZetwv
	 zhgIca3Zf7SOGl+susnz7aq4UYheq7uCPZMhwbGtgT8nlOr99d0KXDRuq4YNOSHUiUnN2
	 TK30rxhjDB/F/TGpuQmHePY05FofPgeW0ntfAUDl0w2vRgOvvREn9eRvI0Y93qA4KvTPo
	 DOEyv+3NdUv8cbJPQjqM3iQ8DfB6/aGpL0cOS3J5roNdccMoyGFzvh7qK8JHTWydxOjOR
	 JdXdCpljUgwl9PJdU+q4aewl9NMrW8wZL/sKl+fyJo5TqTWGMUZEuTNBv5sf1mJfq0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IM8+v6VO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B878606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B878606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IM8+v6VO
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so690454f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:28:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794335279; cv=none;
        d=google.com; s=arc-20260327;
        b=hvU5pmHANPeiegCDM9Mfnf5zgtrActd9jz7eLhCe8fztMeweXxKBOkEjORweRR1qif
         jPBxolg/iP841iXJNGTCgD52L6TeIaTOo4jBCuyB5Os9fztgbpJ9jxX5YBRlhG96roVm
         1M4AGlC1cqRGwQQcq62Yer/dZ3Zko8AqcUC3WUZDO8xgOSSVcv2F4/OoWswxlktw6WEc
         XkZqMbw1e0Lm3tiTCh23ygDu8z4krJmMYyJCCsXwpEGs9lflVj/q/MMhlsb2Hol9IlSO
         jzH2vuszsaRK6jGRlX58GK8F+nfLNHC/tsoeKRRNi/IaqXu9a1kwWtvq2uTEjHMusu6o
         sjiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0YLdB3g9tnxFjs9/6VH9nFXGUYkvbUmaGAC4N10mcqc=;
        fh=ykvIf7rzMhJTj+vw8OWSOqDzJJN1EF5TA52IlqDp32k=;
        b=b20RTyu7PSXz0BGk0KtfHy2u0O6kp9MMitn0Ya44vI5Hj/HrSmQ0WmVVEklB2tcR5u
         N2B9zWIdN7z1TdYdpevR5yYGlpccYKLH5DF/xZ+40i/OI7vbFna1oiRpynY/szT2kdCo
         aCj9fQAgxurs1tLR0xiBmA0FvUGVlaOdcjJnckeAWMfvFvzCIr7dfcQpf/tomAemUptI
         G40P4gMKf6G0didYjrUDkeS0ftOX5LeaBWB36abiovgPZn1r9sjZimkHYIqW2G9JKgtW
         6OaMXKK8cmJ9KzT832OFwP1m65XJVct9LAYie68vxd1eR5ltA5eUdYV0PEZjiTPQqvPX
         X76g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794335279; x=1794940079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0YLdB3g9tnxFjs9/6VH9nFXGUYkvbUmaGAC4N10mcqc=;
        b=IM8+v6VODEbzMLsKcWFuS9S9xmHEUoFxom2xO9uGGR2po2iJ8Dyah1rV6I5MVQIepp
         FfMJQKJo0h45UV+I253ihetGTCLcW/dxxRDVS6h8150p0rNWBiMMaQ2hUEtgkCmQjTD5
         6BcW5zyErZbXnw97oCdTfwLjdyLNUAv2hR1lGm09IFwq1BY8Trf2XHfoNcijdpPeliSd
         i2luqxZEOJcpks0DzraY1rEoQsAvm8hzfHI6o/TmyNwWgrl/L/i9yN9RqJPMTHhvrOMx
         CniLDvEv0mJYgHUBcmLNKldfp0u6a5wZpHp5+JT0t0OSQYx+Rr6giQ6NRElSDUlHR/BG
         w/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335279; x=1794940079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YLdB3g9tnxFjs9/6VH9nFXGUYkvbUmaGAC4N10mcqc=;
        b=U/Z9TbMORRj+M+Y8gLNky/uiacKg6f7O5/ycfFvWgXiAS9cpDXEbyLrAealmmjKEpY
         EjoA6hcMB6mCTgy32bz/alPwyS3cOoxCy+46t4+6duTDyH8eEaPjQDYq/kl8JIlrv71Y
         dIoDUooV2cDkcu2Z4Ovr97RgGfytWxPYo0YsaG4X5lRZDB+9HtkSkbB6a/89ncY4DMYI
         RtxhFyC9kPqK8kudD4g/B1T/sKb1grJaTiJ/qetl3PMajwaANecnaiZkG8ZIjT/CCQmn
         0kvmDLhGllm6ZshnITeVwY40b3dsWVth5B/b8MMSkwsAdk3EP5zJeEDXUJkdmndmPjJw
         223Q==
X-Forwarded-Encrypted: i=1; AL+hErHjC2qiKv9lI9f9wdW7+ffp/05k3wiU7Jjf498yodUoJQ+mr0ax2+QChDfzoXO8W5/WZeiBKrcM8HdEfz8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zprlWfJhEwFG4MK9bymg2EKGZ+CtufYJRKbJEzQsJIzKCBNZl
	feegy8ciFstPN9SSDh94GH82exEqQMbaX2BzkMuHw7JV5q/c7KWjMQGBxkx3x//qV9cAPEri11h
	Y2kqockOukmCnexSfBe4tbu9Rlklhk8s=
X-Gm-Gg: AYBFou1lsH2ReRgY8Fp6XWhRTwtOXWiL1L0WJhzkIKN4HT5nVzFXJgU6t9W6xOvH23y
	pw4jgTo5jQrWupa90xwS9rUnrEUX5oEedYpwN2xeBvhCt2S7sjdzQfCdlb9HoGEx2fB3IDxLbKy
	R44kCds5gwqH57q9p+8Kzes39n0XpmKC8LcXJnEkjgpdmwqkYszH2UuKjm9Jed5fLzJgFuyQ19e
	lZbBqNvob1k8pVWJBTXYWD5vU09hN9mOsDwYitKJm4+r6wY2/91eHX5D/ioYpYpOL+I0LyPz+/b
	El84+WxFGLbn6xUDbqYUORL1wc3PV0TrYFGpBHCyali5K7khbzU396PZ/M1aW/Vsguz5zRX+Cdh
	kueNxvqq73UWUjWBUBkb/FWDw0iJ3A/mVENCZA4SYPmmbrrplam3Q+70VoJ/lY8KkC5tB5YJDrk
	1pIjAwIVgkmO18XMrc
X-Received: by 2002:a05:6000:1a86:b0:488:57ad:d5c8 with SMTP id
 ffacd0b85a97d-4982ba3297amr6630503f8f.3.1794335278568; Tue, 10 Nov 2026
 10:27:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105084518.386234-1-nikitash.mariiaw@gmail.com>
 <20261108200800.2b3b15cf@pumpkin> <ed2a6a4e-f480-4b39-9684-0dbd2d55e261@kernel.org>
In-Reply-To: <ed2a6a4e-f480-4b39-9684-0dbd2d55e261@kernel.org>
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Date: Tue, 10 Nov 2026 10:27:46 -0800
X-Gm-Features: AclHuK-s0hGDrA9NemleLuGLRjjsAkkNcY2oEM2MlQ1hpilpfd-nAy6wrrOh58c
Message-ID: <CAPDEY+UxXCg3M3oLxxqjgEOdaVVaHJSwQCyt+=v2zLP8ESWVgA@mail.gmail.com>
Subject: Re: [PATCH] media: verisilicon: Replace strlcat() with seq_buf
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, nicolas.dufresne@collabora.com, 
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	kees@kernel.org, justinstitt@google.com, morbo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:13=E2=80=AFAM Hans Verkuil <hverkuil+cisco@kernel=
.org> wrote:
>
> On 08/11/2026 21:08, David Laight wrote:
> > On Thu,  5 Nov 2026 00:45:18 -0800
> > Mariia Nikitash <nikitash.mariiaw@gmail.com> wrote:
> >
> >> In preparation for removing the deprecated strlcat() API[1], replace
> >> the strscpy() and strlcat() calls with seq_buf operations when
> >> constructing Hantro video device names.
> >>
> >> This preserves the resulting strings, including truncation
> >> when the compatible string and suffix exceed the destination
> >> buffer's capacity.
> >
> > This is just stupid...
> >
> > David
> >
> >>
> >> Link: https://github.com/KSPP/linux/issues/370 [1]
> >> Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
>
> Nacked-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>
> Just use scnprintf.

Thanks for the reviews, I will simplify it to use scnprintf and send a v2.
>
> Regards,
>
>         Hans
>

Best,
Mariia
> >> ---
> >>  drivers/media/platform/verisilicon/hantro_drv.c | 11 ++++++++---
> >>  1 file changed, 8 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers=
/media/platform/verisilicon/hantro_drv.c
> >> index 26e5d5547466..2bfcd45cc55e 100644
> >> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> >> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> >> @@ -17,6 +17,7 @@
> >>  #include <linux/platform_device.h>
> >>  #include <linux/pm.h>
> >>  #include <linux/pm_runtime.h>
> >> +#include <linux/seq_buf.h>
> >>  #include <linux/slab.h>
> >>  #include <linux/videodev2.h>
> >>  #include <linux/workqueue.h>
> >> @@ -883,6 +884,7 @@ static int hantro_add_func(struct hantro_dev *vpu,=
 unsigned int funcid)
> >>      const struct of_device_id *match;
> >>      struct hantro_func *func;
> >>      struct video_device *vfd;
> >> +    struct seq_buf s;
> >>      int ret;
> >>
> >>      match =3D of_match_node(of_hantro_match, vpu->dev->of_node);
> >> @@ -902,9 +904,12 @@ static int hantro_add_func(struct hantro_dev *vpu=
, unsigned int funcid)
> >>      vfd->vfl_dir =3D VFL_DIR_M2M;
> >>      vfd->device_caps =3D V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLA=
NE;
> >>      vfd->ioctl_ops =3D &hantro_ioctl_ops;
> >> -    strscpy(vfd->name, match->compatible, sizeof(vfd->name));
> >> -    strlcat(vfd->name, funcid =3D=3D MEDIA_ENT_F_PROC_VIDEO_ENCODER ?
> >> -            "-enc" : "-dec", sizeof(vfd->name));
> >> +
> >> +    seq_buf_init(&s, vfd->name, sizeof(vfd->name));
> >> +    seq_buf_puts(&s, match->compatible);
> >> +    seq_buf_puts(&s, funcid =3D=3D MEDIA_ENT_F_PROC_VIDEO_ENCODER ?
> >> +                    "-enc" : "-dec");
> >> +    seq_buf_terminate(&s);
> >>
> >>      if (funcid =3D=3D MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
> >>              vpu->encoder =3D func;
> >
> >
>
