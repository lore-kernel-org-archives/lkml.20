Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793836329;
	b=RJuu/Awgwq4SrZrt3+xvRy4uttOhgXrXdJXuheaqezeE6Fj7XLaxK9UfEZywUTMgJ2uD
	 OVp6MI9X7r6EA2YHP1U/l37juwVI2gYNo9fdw5DmYVy3DO8x9/OHANz7z8atVSPBUSOLV
	 apMpiKGt3mu4jZj09nuZrg/BDFlstVhrdvXPFvFdYzmr/UIk0QEBd/kXTteV+oCabOZzT
	 tBNw6vwnbUOBakL9l9hUsQJXkFUGqQfWnb3LqzzGy4dpprBb/SX2VgbnMQ+n8jNoyzRtb
	 1fcX/OOANkzWYxj2NfcYXF1Xu9LN+tbsAb9Uq0T4ATDcDbjfStblWdWFdMl6RXUQgJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZDPMlWjER97QQloMvS3JLpRs94OY8/a/t6TOJ2vu8Gs=;
	b=4p1Ou380J3hwErrpIuTeZz0QdYm6dQ+8c2tGOLBgk5Zz+zM8H4edvgJPjdoT/SZ4QaaH
	 wmPLzhmEpUFK/s/8693/YaKDEZTY46at7LYSZwsNHBVRAdF3q+I7O2cNuxQAqgjhewkZD
	 WsOF3lcROF2B23U/E+q/IjeJNxkWxp/S8OSyR1SOvJhtcRJTcqZFzqjMbjwY0FT0zVP+D
	 WYfapjzd2ukiMqNwNSPNCCCmaFliyv3Vx0hyNWTaEsEt9aRUUYQe30BjV6KAoYtPoAnPG
	 11UaPafGbvsw5uZU1iKLvfL3jctlBspnDEQf9RJl+F4joDAz1nvH0+2lEiPzrdMZzEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lB8oTMKG;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB280606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB280606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lB8oTMKG
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so1777738a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793836327; x=1794441127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZDPMlWjER97QQloMvS3JLpRs94OY8/a/t6TOJ2vu8Gs=;
        b=lB8oTMKGbCrz0n9T4ZxhWzgI5fffGfnnC6lQCw84rNzk3oZMgSzNxICsux62s3XW7r
         4NVWZ1RhN3Hd0YNjkTLjGcOTOXtYJ4SiZ5c0afqKQaFZB+Gv/h/MKFq6ycKkkOrdDnuI
         8w14GDheZIvLXDx5IX+ZzGvHeUhEOBqNH0Bdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793836327; x=1794441127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDPMlWjER97QQloMvS3JLpRs94OY8/a/t6TOJ2vu8Gs=;
        b=RewScoPHgW0DbcoV6nZu+lzmLFdgNOz1Ck3Ujb4ePurMtt+ux/9XJ0yUWr/+8WneZN
         jraWV+/kQP2yZUCu28Bsgoo8rumXpXf6xaxXpNE2m9RkycJRmDgMVVAvsbVhzieybY9X
         +KaDJ5va6XZInu7wGHt6p5Bcp+QHEYQIHmyC3Tw72v5EWe7/EJDEqciItGCdpHI5sp7n
         3VUtrEol0aX6zdL7Vd37x1qW4ZA1Ph+yXb2ZSDZUYoGYWLObIrPvrykLNTznVGjeEhZC
         eO3R89qWPvQMXSBg8HDoPMiqIk6LNHCVvdQORfaTMhfHvH0U6yuCD1mc03rPDbVhwDLg
         vk+w==
X-Forwarded-Encrypted: i=1; AKwUvBxHnvPfC8ghe/rtIiimdbarH4bH/OsHypiaEnnw83Or+YU1NIHxIkrv436DjWTUxU3WF2YOy+La8RrmhEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PjuKYmjIbmRoznVJ0GzviiIh4stl2Ue5V2+IZszjQPnWg4iy8
	LJ7J8AYJ9r90MB8kZiyl8rCxyITK9uWUe46fhAJgXonne7YLju3/VHV51c3ExTc5upfFPwPS91a
	EbHUrgzQe
X-Gm-Gg: AYBFou3pp/fPbNv+rrdyoq5qRNuoAmMV6kZ4qYUWEStBAXylYHNjr+GLkoO1N/C8Zas
	OcjRiYSJ/omOexuASJLcpSubycEsVO2ZgAl2jO3cmrCUI/WQCx9Hp9Iplu2leW6cNhLRztPgmWp
	TTcGkssqcXdyGl2r5vZygHF2Y0RxS+zemQpWe+adYks2SiR3syzJZ54zsujUp8I87O7afvkV7Gf
	zEqNdaW2OLMAitPEzUtVrIi+oXkrHGjR6mXeUwIffGcCoZlMMb3Lt8XvNCvggVAxjdxDyRQpUF7
	SU7knvI8g1Zb0UF8OXzvtljyGEKg0mr/H30CKhqBMOmRt3xzAURFmq0i3IsgmmvRiMRi9hwawpv
	RAZe1edTvo+q5DQ3/RJqBqRZ/0R5PF2Lpazny7TBS3A20qcNkVICibnLEyIBZyenoTxg88mdja7
	2e7CyrVrn9WVyGSjZYhGBO5RzBx15HDD/S95/72YTtewDRO5dQdV/aq63ncDrXXVqGjj0aea6p5
	WALIB9MNJPc2afd6MsT8Lv50KrYmk1FNNoM0kdamF5h1DdliMaDwCC6m7oL+gFRaIrLT18enlVh
	XXpf++JIz+vZSxr2bL97clh+TrQwfK84M52W8cX0pEPpJxJO4DoD1y6PDPMsxKT4LINd
X-Received: by 2002:a05:6402:1ec4:b0:6b5:665a:d5d9 with SMTP id 4fb4d7f45d1cf-6b5665ad6bamr2194839a12.14.1793836327156;
        Wed, 04 Nov 2026 15:52:07 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55abd5569sm1321160a12.5.2026.11.04.15.52.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:52:05 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e4831c028so1191869f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:52:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByESmOZs+HNuOA6UZh7A971CbBkUdvWTra1/hgCCYN6vaDhkkoO1TcMLuSGtY3aE3ghJvbr/L1c7qV8fAg=@vger.kernel.org
X-Received: by 2002:a05:6000:1603:b0:48d:f36e:ccc0 with SMTP id
 ffacd0b85a97d-48e6e262c42mr27271389f8f.0.1793836324117; Wed, 04 Nov 2026
 15:52:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mipi-multi-series-v1-0-6a29add1ec92@gmail.com>
In-Reply-To: <20261012-mipi-multi-series-v1-0-6a29add1ec92@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Nov 2026 15:51:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=USBt_pE--C0P1=PZt+iaoTpgNebZ+DXP=dKb-8VUcoVQ@mail.gmail.com>
X-Gm-Features: AclHuK-CEolTZr0relxi0kTBUfKlXKIQK4RtBZ_FLD2bdc50G61iDALtJZq5MD8
Message-ID: <CAD=FV=USBt_pE--C0P1=PZt+iaoTpgNebZ+DXP=dKb-8VUcoVQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/panel: Convert four panel drivers to mipi_dsi_*_multi()
To: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Heiko Stuebner <heiko@sntech.de>, Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 12, 2026 at 9:35=E2=80=AFPM Akash Sukhavasi
<akash.sukhavasi@gmail.com> wrote:
>
> This series converts deprecated mipi_dsi_dcs_*() calls to their
> _multi() equivalents in four panel drivers: leadtek-ltk500hd1829,
> kingdisplay-kd097d04, innolux-p079zca, and newvision-nv3051d. The
> first two drivers also convert mipi_dsi_generic_write().
>
> In patches 2-4, unprepare() previously returned early when
> enter_sleep_mode() failed, skipping GPIO and regulator teardown.
> Because drm_panel_unprepare() leaves panel->prepared set when the
> callback returns an error, the panel could not be prepared again.
> These patches remove the early return, so GPIO and regulator
> teardown always runs, and have unprepare() always return 0, so
> drm_panel_unprepare() clears panel->prepared. Patches 2 and 3
> likewise stop returning regulator disable errors from unprepare().
>
> In patches 1, 3, and 4, the original code treated a set_display_off()
> failure as non-fatal and still attempted enter_sleep_mode(). These
> patches clear accum_err after set_display_off_multi() to keep that
> behaviour.
>
> All four patches are compile tested only. checkpatch and a W=3D1 build
> are clean. Tested-by tags would be very welcome.
>
> While converting nv3051d, I noticed that panel_nv3051d_init_sequence()
> always returns 0, so init sequence errors never reach prepare(). This
> series leaves that unchanged, and I plan to send a separate fix.
>
> Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> ---
> Akash Sukhavasi (4):
>       drm/panel: leadtek-ltk500hd1829: Use mipi_dsi_*_multi()
>       drm/panel: kingdisplay-kd097d04: Use mipi_dsi_*_multi(); fix minor =
bugs
>       drm/panel: innolux-p079zca: Use mipi_dsi_*_multi(); fix minor bugs
>       drm/panel: newvision-nv3051d: Use mipi_dsi_*_multi(); fix minor bug=
s
>
>  drivers/gpu/drm/panel/panel-innolux-p079zca.c      | 43 +++++++---------=
--
>  drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c | 53 ++++++++--------=
------
>  drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c | 40 ++++++----------
>  drivers/gpu/drm/panel/panel-newvision-nv3051d.c    | 36 ++++++---------
>  4 files changed, 61 insertions(+), 111 deletions(-)

Pushed all 4 to drm-misc-next:

[1/4] drm/panel: leadtek-ltk500hd1829: Use mipi_dsi_*_multi()
      commit: d8b25f5f482250ecb4afc48913cb34de4938234c
[2/4] drm/panel: kingdisplay-kd097d04: Use mipi_dsi_*_multi(); fix minor bu=
gs
      commit: 7877fc6d086f861e0006dc5f008217899d7af3e3
[3/4] drm/panel: innolux-p079zca: Use mipi_dsi_*_multi(); fix minor bugs
      commit: a00bd7fb1dcdb3d2e33d11242e38e317a4111828
[4/4] drm/panel: newvision-nv3051d: Use mipi_dsi_*_multi(); fix minor bugs
      commit: 3944ca3e6b7d25e545e8ef6498f69941e8e0c8ae

There were followups suggested in several of the threads, but these
patches still improve the status quo.

-Doug
