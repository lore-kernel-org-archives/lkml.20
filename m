Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794217147;
	b=DlnWF2XHVoI76jNCQfWabN20Evy/asw+umqYlXj2Fc8m31y7FrzAQzIvkgS50vx5d3jR
	 OHaQ+SHnGoqY28XRCVAlYnTNKSTZB4HYaOyu9XnUFKGVSQyEzNGWmdvsYjg3pWpNebXFm
	 z+3XyWJnPxEuyYGJoK9In1YbBYvwqxMzWzdHF2H27n5joY3f/dYUdNIG+OIC3uYvzQBHH
	 pNbCu6SxAdVes2pWXq2Ild8JabJovU8cDaP8pGtAypUOxOxZ2b4qGqWQs+W9amhdJtcGQ
	 KpJayOHQclohB6KJ6EuCYeIsuUDX+5H4FLMQBZy3DEgKXRT2b7ND3oO3xJvfBm3A4pQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Bt2kTkjGKfcd8zMvx1shHZytI48P75SXp34GvUI4/fg=;
	b=RanNrwp5VApLsgI3KmPfbdWV7H4XmvfqCNXXXb54WXGVURMqq6xu1RbFxm6cDjGvBjMG
	 f4AN0yvlcurd2Vk+s7tKqSF63MwZBu/R+qTapQNMuqBPk7l2YPY5P8SHBxj67luW4oMsA
	 /8DTC1T67m0p6OP1GcQOb+8e3TNxWEwFhPvy9rVLH3grrP7naw/vq8yCfz/zBLi3oCh0E
	 sdLNzASKFBr/Oxkvjar4MBR4F9ADnV4beGGLtl6+wmfAmzMyqO+pkbVvaLQ47X16HfkJr
	 3ujIyf4A7eZITi2ut3qdC4koZomrCh3WyFmk84PL58BOyNlkH6v75Y3SjEhcxMIQtyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ez/Z55b0";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0863F606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0863F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ez/Z55b0
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4ad587ba293so420469fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:39:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794217145; cv=none;
        d=google.com; s=arc-20260327;
        b=AnKQTvkxdNTb+orpTfXxntqC3hQ9HyibqC+8igbx7ZUWTsmm5AidzeiQ1x+gY5UW8I
         UOvZwDdFZd56FO5YYbChkd3SpjRxeBC3/aXuEPXxN0Rf55fEsKbRDKY/qUjnR6H1lYCb
         B62k47HFPNonKIinz9DVZlp/KqCsbS7nB+Z4VRmeq8hIrobINJ0B3ohqTawAsUmFR/a/
         d8zmoc8d9hQ1joYl9nv/vK8r3ujKFVddt8Ch+uD7PBIfLJXPgju7zTVy+1QpSoTy86zh
         WXl6MmQs4Pa3kI0FrX/1cyMT7gvXKOzUhSYT/olZ0yQFptSG4iiUqDspbS7O9v+MN+8f
         ROyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bt2kTkjGKfcd8zMvx1shHZytI48P75SXp34GvUI4/fg=;
        fh=QgxprfPpdNPhLvmb/1SbyN6Gn+WurmA5qzw93POA1lw=;
        b=hBE8fyPHoyQPfAeoLpK08mC34W/K3wS2zqUqiNN6BxcxCkK5vtfS1AQdmAhGyLXKJV
         hFx0iOXBzz/k4UG1B9vVck8lXWN8kN02OR1mqg7LXa5DCVAz+E/b0Sr4mWIcYTaKsBDZ
         YwX1dmtTRm/XD9hkZ6BKvrV2S0EaYRTNrYHJv2Q9qXB7d7S7iJ3xu2RhQocBtuDRAlrv
         Mk7RelBS++QAF1z5Borp2zJkTZ892yVRGB4kajtJVLOqmmfazP9QtWpjJRbw/TQDBU4B
         OcIhQU1qYRdNS2NJlh/4a3WJSb1W5c/Rvd/tEN87D+K4kJh0lELqXUBQITFh9P81/f9M
         LBPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794217145; x=1794821945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bt2kTkjGKfcd8zMvx1shHZytI48P75SXp34GvUI4/fg=;
        b=Ez/Z55b0uswFCCrOov466Vti5izMG1v2RfIprz1liD212lvlAPN/9oxAdWhDg8/HNo
         hRWSJkAfaoWCJV9ylz1pMAI4Im1eai8Bz2J7SNqnmNttW4mOzZXW/RNk5dwQcwPU18q2
         75/965pmobYanJrT/00PyCd01etzF7VJNN5PdoYALtWwGKJ7yf4bGFy01E6aOM4G9vJX
         PWCB2pPCGQ5kmudjm2rrRMbIBGZ3X/Q+hh0qoTWNhHgH3sg2OKQ1J9mkXdeR0soyUnUT
         oK4d4EoG2w6Fti24nb/9i+6XfjKQSiMsQJZ2EKY2yg41a89atwJ6KA/NBWy/R6jeI/mN
         9zLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217145; x=1794821945;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bt2kTkjGKfcd8zMvx1shHZytI48P75SXp34GvUI4/fg=;
        b=zFk3aoqi36rWZ3F1gQB8HI1MPAFgQdLFr1AJYtq0UHFHb+CSUsRwdyUTHKYUN9/vfH
         tOiLwHM2w8ub2sOFzi7ak5UNrhfRgCKQuipXFQaVhvumWGk59n8aFnS5wrBBbMwpcqvH
         YCiGmVmjG9HS2R98+lKZOpCMuHC7oLmx0ukdnLNCoi9vscxzE/vKX0103Sdoe6HAzOd1
         60qKI6+F8uNC1PYnoZPHq7Qmt+aHeBzHiyITrKQWXI8qSZIh8egUUIvSMI4Jl97TbXTN
         jbVngikNFtC4zWsT0k7phwxzhUCU+4QwAYzhsM2OC4FDDOLzw0GsGEnUcwE3+ybExz6F
         0BhQ==
X-Forwarded-Encrypted: i=1; AL+hErH80MJaYKuWj1sA8iy3mSiq+/fL1Ubqq1d5IIWn0XDpYqptjtBZEW46f9tF6hmPdCHgTH1tqmwrRXcyX9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JyKd5pkCq0ItJEyrXFFKloJUNa9eqmZwd6Qo/MH/4khPij3cZ
	Cw+HC89HgEEHzHQTM0aS5iWf9u61yk5Ijwmv+1Hj/NaWhvVwB7U+SiJCmNd3ohwvrJ9akTTriiP
	szPxGTaVocv+3sg4jTN26bK/j2jnCYQ8=
X-Gm-Gg: AYBFou28pCuXcEREEOJJjmTAOblwgu+P8XkCLgYF/ipHxTttXwfwmb0k6mekrDeEvH2
	hTlP9QSUNjsC2A3zjXrFK4VZ8VwTxf9de9bk8P74L7Fel922QQGz/pKpHHELVMyzQZzwlPC1E5p
	WC2YIL5a6X7y6Jiw8/VNo02GNu9wn/dlriDYkdEjUB9DJO/gGGYoV9+wcnv+VClbu4Zeydky69U
	4KU+pQc4qsH4M7nthoOBSvyNfB2+DkhxFfF8wHouMcuH5GBbJcMKMSXUeP1SF+wdV80ipkj1jnn
	bzSK6bYxQoVHgRlbZmrgiZHkRuCh/vg6cKNsq0/QNqUST7lKzVdbB8oWuyPoOvMvNaGZKpFmBIu
	Q7ZXh8SPyok+QuSQg+M6e2QKE7poaNYV/H6jUVror3p2pkoVGtPRzr3IItyqntPV+45jQwATBtq
	AlqXQmLRpp6kRWPA==
X-Received: by 2002:a05:6871:b09:b0:499:c554:b635 with SMTP id
 586e51a60fabf-4adec9a0521mr1832827fac.28.1794217144641; Mon, 09 Nov 2026
 01:39:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106114551.212675-1-amaan.cheval@gmail.com>
 <20261106114551.212675-2-amaan.cheval@gmail.com> <CALuQH+VtASWP=w9ibTJ7ioYxWrS5sgi9yCZMVK0D831_A-zusw@mail.gmail.com>
In-Reply-To: <CALuQH+VtASWP=w9ibTJ7ioYxWrS5sgi9yCZMVK0D831_A-zusw@mail.gmail.com>
From: Amaan Cheval <amaan.cheval@gmail.com>
Date: Mon, 9 Nov 2026 15:08:53 +0530
X-Gm-Features: AclHuK8ZY94zA-0byUQ__DrC9NeVtoJKfHv6SKapSVwO8ABChRUHJeGPjboSxYY
Message-ID: <CAG+wEg3VCFnPMkkXVLBNgSNra2YBSZAM-Q--AEQvA597z7X5MA@mail.gmail.com>
Subject: Re: [PATCH net v4 1/2] gve: block XDP on the DQO-QPL queue format
To: Joshua Washington <joshwash@google.com>
Cc: netdev@vger.kernel.org, hramamurthy@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	bcf@google.com, jordanrhee@google.com, przemyslaw.kitszel@intel.com, 
	maciej.fijalkowski@intel.com, pkaligineedi@google.com, maolson@google.com, 
	csully@google.com, willemb@google.com, yangchun@google.com, npl@google.com, 
	awogbemila@google.com, shailend@google.com, nktgrg@google.com, 
	maxyuan@google.com, bpf@vger.kernel.org, john.fastabend@gmail.com, 
	hawk@kernel.org, sdf@fomichev.me, daniel@iogearbox.net, ast@kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 8:43=E2=80=AFAM Joshua Washington <joshwash@google.c=
om> wrote:
>
> On Fri, Nov 6, 2026 at 3:46=E2=80=AFAM Amaan Cheval <amaan.cheval@gmail.c=
om> wrote:
> >
> > Commit d8a8ca14c937 ("gve: add XDP_TX and XDP_REDIRECT support for DQ
> > RDA") enabled XDP on DQO-RDA by dropping the queue_format check from
> > verify_xdp_configuration(), which until then refused every format but
> > GQI-QPL. Nothing replaced it for DQO-QPL: gve_set_netdev_xdp_features()
> > advertises no XDP features there and gve_xdp_xmit() rejects it, but the
> > core only checks that ndo_bpf exists, so a native XDP program, and an
> > AF_XDP socket on top of it, can still be attached on DQO-QPL.
> >
> > The DQO-QPL RX path was never written for that. Its page accounting
> > assumes the driver keeps a reference of its own across every handoff:
> > gve_xdp_done_dqo() passes the buffer to xdp_do_redirect() and then
> > recycles it with gve_reuse_buffer(), so a redirect target that releases
> > the buffer synchronously, such as an AF_XDP socket in copy mode, can
> > drop the page's last reference when pagecnt_bias runs out. The page is
> > then freed while it is still DMA-mapped and registered in the QPL, and
> > the driver posts it back to the device.
> >
> > Refuse XDP program setup on DQO-QPL in gve_verify_xdp_configuration(),
> > matching the features the driver advertises. A zero-copy XSK pool bind
> > is already refused by the core for the same reason, and a copy-mode
> > bind never reaches the driver and is harmless without a program.
> >
> > Fixes: d8a8ca14c937 ("gve: add XDP_TX and XDP_REDIRECT support for DQ R=
DA")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Amaan Cheval <amaan.cheval@gmail.com>
> > ---
> >  drivers/net/ethernet/google/gve/gve_main.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/e=
thernet/google/gve/gve_main.c
> > index 2437cd8ba633..4e9e692a0ed0 100644
> > --- a/drivers/net/ethernet/google/gve/gve_main.c
> > +++ b/drivers/net/ethernet/google/gve/gve_main.c
> > @@ -1723,6 +1723,12 @@ static int gve_verify_xdp_configuration(struct n=
et_device *dev,
> >         struct gve_priv *priv =3D netdev_priv(dev);
> >         u16 max_xdp_mtu;
> >
> > +       if (priv->queue_format =3D=3D GVE_DQO_QPL_FORMAT) {
>
> Thanks for implementing this!
>
> Minor suggestion: Can we check based on dev->xdp_features
> (NETDEV_XDP_ACT_BASIC) instead?

Thank you, yes, I'll respin.

>
> > +               NL_SET_ERR_MSG_MOD(extack,
> > +                                  "XDP is not supported in DQO QPL que=
ue format.");
> > +               return -EOPNOTSUPP;
> > +       }
> > +
> >         if (dev->features & NETIF_F_GRO_HW) {
> >                 NL_SET_ERR_MSG_MOD(extack,
> >                                    "XDP is not supported when HW-GRO is=
 on.");
> > --
> > 2.47.3
> >
