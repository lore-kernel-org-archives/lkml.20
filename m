Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792742831;
	b=4Pzg+WMmi2/PQyob+wrHdyQxeVqV7GXo0xW3WN3e7Uso/qbKqdZLuBwE54O3ImRQPVyq
	 6wdrfhGhET0JkK7OLm8jezal+kCfzuNbBgsJYPjJk7Eijf67V4gKudUP5NU+8Nu1eRZDc
	 la+f9C0qFK8nZnDtKV1l337DJQxFzpJGDS2M16d0ZptVz5meA3V+itK4gPkjhkb9j6HvD
	 bNV9EMjPgHaIso0vvttFUoZ4SKlk1UruQhSynvXzLri/KFt+DYO2GMwUsdcPh6rjDVfRh
	 lruGGN5K3ChExXKFC9/YOLvGnDr92B0zdTYUMbejSycTyUnPyAC29bFQIhIhWfWIl5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NnvImXqrDQ/+gM4kxWTSIgQWWDlFGoCxyR2kWQPVQtg=;
	b=3pBvwRQ7WK1ihHjDLxqL1DXBxcE33PeTqKhIFE1HcBUtUi6ofqv8TSj3QrgcBJiGHVVH
	 PC9SD2dSDPMPdu3QuboMyroHTa7rWnKIhpmh/FouNrdz15/CFLJDPf4QwhTngJtMEkoYH
	 Suvw7Jcvfb5e5RATrxE3Ouyw8V+l1CQjjJKKptYiMmKauEhX8/Mah5ahRHtellqLorge1
	 qKXh8eIzMppADnlpCiNbkB+lmKHOXeAW0Aicy5llZ7AiWxxXy/fEGiWL46R12zGpa4TMR
	 hEcITqp2dzZ1Q88USgUiVU1Zdc1xLORK1sbROBp+OOXiOGNrGRgdg4do8H/eK03cWJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jgBrPVzq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EC0606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5EC0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jgBrPVzq
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-368581df789so610329eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792742830; cv=none;
        d=google.com; s=arc-20260327;
        b=HLQyGqgcc28/YQI5mSildEByQf419l5UeLayrmw+jSxBqiNwkK/dKqXnNOA1R4bAkx
         bTAMqqkUBGojp938lBhHQPxlsbPNI8ykZPh2xZ3bpccmqItBNpysBpsRVNrAnUOnKNRh
         BsgH5Ax1vRKbJo/UDAh6W3XifCWqqjsQoGrljWV0uv1JGMSKkKTE/cW0nA4NtB4fKHqC
         lF4F7h4b0VNmzJpGeY3fZxYmWazgKMki1zF5d8kDka14GRBUz7mkSsQC37VgwPtoKc9N
         5Do7VQBa84qzCH5e4vZLY8TnIDfjn14nmButsbaWuSCn58B+KmaVusO3mZSvGAeM7mmY
         NTGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NnvImXqrDQ/+gM4kxWTSIgQWWDlFGoCxyR2kWQPVQtg=;
        fh=Crk0ED7VCEQROHG3GHh+ePVFX5jBI3DaJup3u4x7afo=;
        b=kHLs5lMQUQEej/NvhEu2/qR+debPkgLGwfKU+YavmByxtzJSGYbHdfVnNGFZpN5Rp9
         LKHdKqky/cIf5TjB6aT2UuKZR6ROBP4cIXQimUlVp1+wILZpiV6KgM1NHsW66sczpGO/
         U+YJYlT4S2X87tGugRWS/cPnf57lsUa3xyvhpYZD9E6w+ZmGcvWFfDwwdorQoTmIDkX2
         gdun8tMXoEPoEQiG9wTBPa1d9teJtpTgmTaioI87p0aaymIui2YpLv8lf+EQEcX/qAzA
         Mm3qEhckVbzM+4qq3EH/Qkd85B5k35zpWLgLpiMuR4jffYZK1WarQqXWgINILpiijkkV
         xo/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792742830; x=1793347630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NnvImXqrDQ/+gM4kxWTSIgQWWDlFGoCxyR2kWQPVQtg=;
        b=jgBrPVzqsjDVKizM/9Djt4MRH0wUPhoMdeMCRHaXlJuEMyNSRwMOuh9WWoQ0zFtlzH
         xvX/5FPQSGvX3f8bn3U/WW4/hIAuSS7KjxdgNEfKcPv+eK/YI17hYcAKLIgci7NWND3S
         nf5xoAPu9FgRcpRGzNdehU8yzALLhiIaTk/YNaNCtgZSjt3WmNHDQRYToUHsYAZDzuht
         juvhQUB2q+yaennRu/MeDT2QBZVbE74ms80e7b/Kd33M7Hr3YyyR6Gs4GORlWuokLYHr
         vm8H6E28N+/Z4AP2oUtepgaJ+Ajt8HpJ9/3V+6wvChW8DSLrwM31BR4XMwCk38sHTeKO
         b3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742830; x=1793347630;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnvImXqrDQ/+gM4kxWTSIgQWWDlFGoCxyR2kWQPVQtg=;
        b=DxncKZV+ee+dBaL0W5DlgiW7V1znsAfnKxvNVe1UM0IAKhX+xLq3vNNSHOS2jp0Uof
         Q4K9Gkuwrh4SbuJVpaBVRXtsHgTt06qjb/bucpMEpwar+uIVPglu3mTq92idQm8Eyu6H
         3x8x7jSd9NHpy4NaqO6lepHOQxYN+ESV/Rqbz4U7aHrSyMch/VTHX/UcEBahAKLyL8sY
         eCrLDWNTBshjyVf7UZ08agBowDKOiYiExu0m2CvqumDXZikzYHUsv+56yvUiqTDmyBN7
         kmeXuizrtEHSjKiB1hTCoOtAFpCDSEP07seckbLni0I1lKh9OsRYL5qnUThICGCA9nay
         vLBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTnrq3WhN0hl2FjSf6pWVEFDsf9wvfuG+IppqGl4DVggOdQFAD4M/GNKTyLX8c7+82MDHvXlD7tJ3Sffs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwVWCejfQEFLlLS6Mk3Pz8KjBJNlHVjfzQkhOtFVOS3WpMjnGo
	+pJufTXRjEAYLszSHCtknDZtdTl6nAUFfieezBPfUc2MOku3Km8wiXnTxy6ho4vNx9tHyeEOOo4
	dVNvsG0u3wf6ykie0G3YIf9stV+LDgJE=
X-Gm-Gg: AYBFou1e2DmNNj4Z3JVGeOLgkZ9pzAGJXnCXca0j5fScOazDRu4KiRb5U/9Cx/PPeW3
	jxGRTpZEqKJgSQGjBN7WR3pHTHzQwhQ+8i3Zrh82hPIPF+mYi3Z70k8vAA51g9QjeMFmJCBVT1O
	k4t7Pvl1wRecZHH9X9eV2DuGREn9NqOY6m97TnprDWOTscxyloW9wFkv48E8JXXyAwVHNlE6rRb
	5c2PhlfLdjMH4jx0cJ607CyaanMmO+CvX6Tta0mOjo2foMUPIEHoarHg/kyFRCCl+tsyZWNIyKT
	DBKOeUVOUI0n+NQhUmItKPjS5dme0VsGZZReLSS9aHthCaZMkBQ3hZqFPCPj7Wro28w3ul+twpu
	1HB9m3qRI3FwpWRzkGxNEm8RueNox2Ep5RPcSDdkzqS4TLNKXGUSKoinEdn1LBppFmxuz8Q==
X-Received: by 2002:a05:7300:ff43:b0:358:c5c9:2661 with SMTP id
 5a478bee46e88-369d9825511mr1710525eec.10.1792742829641; Fri, 23 Oct 2026
 01:07:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022132259.240717-1-clamor95@gmail.com> <20261022132259.240717-5-clamor95@gmail.com>
 <Rqw6Z6zYRbyIFoTAHJtpuw@nvidia.com>
In-Reply-To: <Rqw6Z6zYRbyIFoTAHJtpuw@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 23 Oct 2026 11:06:55 +0300
X-Gm-Features: AclHuK_5rggW1YEyeeWCARrgxFz7VynuFiVi0IUrlR8AYmBGFbwzWkAjfApMGS0
Message-ID: <CAPVz0n1dRyoMXNJe4ewY_3YQcaKFXQ08ROvNJr4=HRz4UDBeHw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] drm/tegra: dc: Expand available registers layouts
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10:1=
4 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, October 22, 2026 10:22=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Expand existing DC register definitions with additional fields in
> > preparation for adding the 8-bit CPU interface.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c |  3 ++-
> >  drivers/gpu/drm/tegra/dc.h | 49 +++++++++++++++++++++++++++++++++-----
> >  2 files changed, 45 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index b0bfa946e6979..5c67928bcabfa 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -2384,7 +2384,8 @@ static void tegra_crtc_atomic_enable(struct drm_c=
rtc *crtc,
> >
> >       if (dc->rgb) {
> >               /* XXX: parameterize? */
> > -             value =3D SC0_H_QUALIFIER_NONE | SC1_H_QUALIFIER_NONE;
> > +             value =3D SC0_H_QUALIFIER(SC_H_QUALIFIER_NONE) |
> > +                     SC1_H_QUALIFIER(SC_H_QUALIFIER_NONE);
> >               tegra_dc_writel(dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
> >       }
> >
> > diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
> > index 0cb0515968b35..7005df32f485f 100644
> > --- a/drivers/gpu/drm/tegra/dc.h
> > +++ b/drivers/gpu/drm/tegra/dc.h
> > @@ -274,8 +274,11 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define DC_COM_CRC_CHECKSUM                  0x301
> >  #define DC_COM_PIN_OUTPUT_ENABLE(x) (0x302 + (x))
> >  #define DC_COM_PIN_OUTPUT_POLARITY(x) (0x306 + (x))
> > +#define LSC0_OUTPUT_POLARITY_LOW BIT(24)
> >  #define LVS_OUTPUT_POLARITY_LOW (1 << 28)
> >  #define LHS_OUTPUT_POLARITY_LOW (1 << 30)
> > +#define LSPI_OUTPUT_POLARITY_LOW BIT(8)
>
> Please update the existing defines to use BIT(n) as well, and align the
> define values (incl. the lines around here that are already there) like
> elsewhere in the file. Also, currently it's hard to tell which register
> each bit define corresponds to, so I'd like some comments like ..
>
> /* DC_COM_PIN_OUTPUT_POLARITY(0): */
> #define ...
> #define ...
>
> > +#define LDC_OUTPUT_SELECT_V_PULSE1 BIT(14)
>
> Please move this below the DC_COM_PIN_OUTPUT_SELECT(x) define.
>

Sure, I will refactor this header in a more readable manner.

> >  #define DC_COM_PIN_OUTPUT_DATA(x) (0x30a + (x))
> >  #define DC_COM_PIN_INPUT_ENABLE(x) (0x30e + (x))
> >  #define DC_COM_PIN_INPUT_DATA(x) (0x312 + (x))
> > @@ -303,9 +306,15 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define  UNDERFLOW_REPORT_ENABLE (1 << 0)
> >
> >  #define DC_DISP_DISP_SIGNAL_OPTIONS0         0x400
> > -#define H_PULSE0_ENABLE (1 <<  8)
> > -#define H_PULSE1_ENABLE (1 << 10)
> > -#define H_PULSE2_ENABLE (1 << 12)
> > +#define H_PULSE0_ENABLE                              BIT(8)
> > +#define H_PULSE1_ENABLE                              BIT(10)
> > +#define H_PULSE2_ENABLE                              BIT(12)
> > +#define V_PULSE0_ENABLE                              BIT(16)
> > +#define V_PULSE1_ENABLE                              BIT(18)
> > +#define V_PULSE2_ENABLE                              BIT(19)
> > +#define V_PULSE3_ENABLE                              BIT(20)
> > +#define M0_ENABLE                            BIT(24)
> > +#define M1_ENABLE                            BIT(26)
> >
> >  #define DC_DISP_DISP_SIGNAL_OPTIONS1         0x401
> >
> > @@ -451,12 +460,26 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define BASE_COLOR_SIZE_888    (  8 << 0)
> >  #define BASE_COLOR_SIZE_101010 ( 10 << 0)
> >  #define BASE_COLOR_SIZE_121212 ( 12 << 0)
> > +#define DISP_COLOR_SWAP_BGR  BIT(16)
> >  #define CMU_ENABLE_ENABLE      (1 << 20)
> >
> >  #define DC_DISP_SHIFT_CLOCK_OPTIONS          0x431
> > -#define  SC1_H_QUALIFIER_NONE        (1 << 16)
> > -#define  SC0_H_QUALIFIER_NONE        (1 <<  0)
> > -
> > +#define SC0_H_QUALIFIER(x)                   (((x) & 0x7) <<  0)
> > +#define SC1_H_QUALIFIER(x)                   (((x) & 0x7) << 16)
> > +#define SC_H_QUALIFIER_DISABLE                       0
> > +#define SC_H_QUALIFIER_NONE                  1
> > +#define SC_H_QUALIFIER_HACTIVE                       2
> > +#define SC_H_QUALIFIER_EXT_HACTIVE           3
> > +#define SC_H_QUALIFIER_HPULSE                        4
> > +#define SC_H_QUALIFIER_EXT_HPULSE            5
> > +#define SC0_V_QUALIFIER(x)                   (((x) & 0x7) <<  3)
> > +#define SC1_V_QUALIFIER(x)                   (((x) & 0x7) <<  19)
> > +#define SC_V_QUALIFIER_NONE                  0
> > +#define SC_V_QUALIFIER_RSVD                  1
> > +#define SC_V_QUALIFIER_VACTIVE                       2
> > +#define SC_V_QUALIFIER_EXT_VACTIVE           3
> > +#define SC_V_QUALIFIER_VPULSE                        4
> > +#define SC_V_QUALIFIER_EXT_VPULSE            5
> >  #define DC_DISP_DATA_ENABLE_OPTIONS          0x432
> >  #define DE_SELECT_ACTIVE_BLANK  (0 << 0)
> >  #define DE_SELECT_ACTIVE        (1 << 0)
> > @@ -493,6 +516,20 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define DC_DISP_CURSOR_POSITION_NS           0x441
> >
> >  #define DC_DISP_INIT_SEQ_CONTROL             0x442
> > +#define SEND_INIT_SEQUENCE                   BIT(0)
> > +#define INIT_SEQUENCE_MODE_SPI                       BIT(1)
> > +#define INIT_SEQUENCE_MODE_PLCD                      0x0
> > +#define INIT_SEQ_DC_SIGNAL_SHIFT             4
> > +#define INIT_SEQ_DC_SIGNAL_MASK                      (0x7 << INIT_SEQ_=
DC_SIGNAL_SHIFT)
> > +#define NO_DC_SIGNAL                         0
> > +#define DC_SIGNAL_VSYNC                              1
> > +#define DC_SIGNAL_VPULSE0                    2
> > +#define DC_SIGNAL_VPULSE1                    3
> > +#define DC_SIGNAL_VPULSE2                    4
> > +#define DC_SIGNAL_VPULSE3                    5
> > +#define INIT_SEQ_DC_CONTROL_SHIFT            7
> > +#define FRAME_INIT_SEQ_CYCLES_SHIFT          8
> > +
> >  #define DC_DISP_SPI_INIT_SEQ_DATA_A          0x443
> >  #define DC_DISP_SPI_INIT_SEQ_DATA_B          0x444
> >  #define DC_DISP_SPI_INIT_SEQ_DATA_C          0x445
> > --
> > 2.53.0
> >
> >
>
>
>
>
