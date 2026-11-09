Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794233128;
	b=mtb2mJ3Z/q6ZkdnO+jEHO54MO5J8SR+nj4k0n+kTxa99rZikoLxFWI+5buM0Ok4/Axvo
	 d03kQqz3ZFzJb4K8KZjtj45PbDKefDvGEizHjw+MqBoCHCKJaz0rbaum97iW2Iod1Fg/I
	 U8KxC96nmiQ0bmAGMt/11SNxLrMrjUZEVViK7J8t3prGM0QuzE6sgefmx++MdIbZ1B37z
	 FLj20yDi51DkNCHUQk7di6nt2+7iatvcHOgNB28XEdi6AkkNUaqwnsv0I6WumquC7Yby7
	 nYC12IsNeF3b8sPfM5hcK9lke6ZGlq6CDxdOb1M9kmhQJhXVBl3nDPvv4TG99wriB5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hBMYWxF4MCqpQhvGes4d8FlHIJELgoUuQCBw2En9gT0=;
	b=ROrMVwbQsU7RD9+MpiXbJxzNTQRjFxj1px3p1iPMTVct99LFmsDMjEnBWfBNX2yfUjOc
	 XrucYj9YKdkw22mZEZws+RkJRu1NXpmNvIikL2z7oJ//+dc2REFbaN1Q1UVl/n+Pu6kJ8
	 QkCTRvNoJjgcppq02F5sqTPWESpvwg//M3YJ5Wdb4sxzxnSf+Hbsm/jr4nAjPKhUSfTzC
	 SaDApMAG+lEkeqkarn2+gxjMZXirxdeKsje589EIVydtrnKgKHRjuQ32yXaFZXG0RllqE
	 iKpEkD4/FigYl1rnCzOp4JMa7XQxIpOEFR0urqnU1+q51vlcnlgbmaaO5qgymS8XsRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7zSCsHV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEA3606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BEA3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7zSCsHV
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cc228078a1so24631137.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:05:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794233126; cv=none;
        d=google.com; s=arc-20260327;
        b=LEJ9a0tsT77w9MECbP3ZPDHGEs1S6zGuFmPhEzsKGI2ygnGN/mSkzkzcA4PeKq68Ps
         StYPWvzawa0Fs1Pw0h5I1/4ES7BVFDcyNiJ2Mzt/G9ntZiz+emD1t+Nb6pfkQoEmG5T5
         QCfBp3NvI4ZkKmJrt6d23MvjkGzLSJZiDjFCHpQbIf789y+u2SyVN13ZhqfX3yrvtXsr
         5Lo7QRD7oSziou5VSF4fc1vNruE/seB7Geuv7b+tx6c8XHzKdcJuYG2NV+0pIfQuoBAs
         W8UMsIzh2FAG+htF/NNTZiuk1vUdtuWCO5b+Jlp287tgMcKaP7F9+psynj21yW323qTu
         K95Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hBMYWxF4MCqpQhvGes4d8FlHIJELgoUuQCBw2En9gT0=;
        fh=BAyAlFxkxJEOoIFtUyFi2MeLRYFof8xJ0aFQ1/rnQdY=;
        b=ap5EMWVOGgXJgVpvQ3N3pfwEwlpvoXjG3PIwAhLBdVXgnrl3A8bhls2ddbxZYOSgzv
         +vSFcXB3D4whWIQyOQDjIrYvmZBR3GBBglhxOPtzvZSKjse5IqYMsJaqg5fKa+Vizrlr
         OGXQ+Bf2oKIitod0go+8ntWCwTyTBncmCoXqF/R6LR74elFU1QYkdlEvZeatO2ZIpdjV
         tTrzNdtHkI+0XR3Of0J+ZuhqrctnpFnJx/ozBBrRmyFo7fm1NjTPfMUSyswpQ8flb1PM
         4YxLL/1yIllCiv5Wxk8YUn0m7p+7LelCAZaxwudpNW1PajWBr/xmzrCV1O0fd+nCQ4ox
         s78A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794233126; x=1794837926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBMYWxF4MCqpQhvGes4d8FlHIJELgoUuQCBw2En9gT0=;
        b=X7zSCsHVWmGxBnoMbR8S4TAp/FmBz9TCxQ7D0fbfigLV2/9i1SCaIe2vdHFm9xrlTk
         GTQnUEuI1ReZrNrYm+BO6h6+8zUxYx9kcrRdmquY45FHIEZ5MRK9Vs3bjyupCq6xJ2DB
         bCrM2skiC8HMJtSTvvLyJm0tf2YSgIi+8uGuIxRz0JA/w8k3aYPoefuhWRSaEwunCa8F
         rqnK/JSSxZgkMxQ/sD9L5dqKQLkEmDYplr4DrYOiWxWacjyTKmodlOLjnFWQFKXN44NM
         w14uUpVU3lmYRun70ryJA4RaSoVwKwNLuvI9tiBR4mNqfPP+0xY6S5gzcbhJKVpCF4Sr
         DZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233126; x=1794837926;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBMYWxF4MCqpQhvGes4d8FlHIJELgoUuQCBw2En9gT0=;
        b=tTdEY2jsjNEnwahLnShJKlu+3eFUOHcDq9/h6UJ3GFt81osP6d2GKfLRYBtv5YwwFs
         07R/h7NUpi5bEut2Hth7UN4MAI3oXDDTP8Ae1JF5mm/BttOqoq7OBVR9bcbdEXEgiPYy
         +dSOYdBJt+LgrBWeLHm4ZW8JkSdFJXsxPEJgRTGwc0f6RGGPoizoxBU3wQqlBrT8jmXT
         sVQ/NdNZAHFY8Y/izVzKWCP817WMIi2Mjhz9gaFpYY5r4y6lbV9vfwj0GP8sKsEkUBoy
         dAZ8unQMxaP97x9cQOR6Kr8M0tELGFiYZ2ovDTKg9mb5BoUQ0NP93F/lrplKxtMWJ9a0
         9sUg==
X-Forwarded-Encrypted: i=1; AL+hErHdJO/0uOdtekOxCqLeAhBmGP2/siFCBV4b/H0sg61lT/pVWOlC8Rg1oXn620t2pZpTblLms33eggFWPlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Eq9GBusVRXXJRHzGr1y1JywAPsxfWSAcZBNbZzhTZfnTsyTIy
	EaxSOz2EqiXUSEDWvLLRpdk9fJCz0KQyd1WjBJ0zQJv8hyOnlXxXGRkxO85+hEeHhuGJ7V1gLSl
	fXIfXMbLemUvaKmeKNPwNbOr9fc70WMNxvran
X-Gm-Gg: AYBFou0s8OCqpHOSpDpm+6juN2CAOvrlwkwJ3NG38co6JFGPzan4ngr1ZA2OX+qfTwZ
	bTqlIzoHyzpsB4TwQnuZGQnNDEIEEsE8jM7kBw09AqDoAxhpgTUoZhuzOGu435JOnd/Lp8F/xOZ
	5TOvZZV05MZhQqWcjgNVexGEq/EMO0RVZl0rG2ILUBtrWcG/VnN46eNU8MfY1w6EtY61ztsfpOJ
	6Us1jlOaPRWYxL3ZeDCBdMxZh/E+4/6FatrLa4NXbC/YtTgULCK46qAzoyolKvm+JwxamLKgf2r
	xDfjIH/nKr84wWfaOp9vfVZwAYI99/p0NBNTOZ+B5jNGMiULwpIsYBprt0eSonDNtFv88P2pHUB
	7rqEREFUttKHiYBob2ws8NdJLZp1Z6m2SR37JlnSUvjIEKH2KQ5zKeUL1MINPLOYfn5aOQAid0e
	dXvsyrSF0+UuKHzhKkAxmK4+s=
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id
 ada2fe7eead31-7d2db29ef38mr941152137.3.1794233126392; Mon, 09 Nov 2026
 06:05:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6af17cdb.63afbf66.14af03.b907@mx.google.com>
In-Reply-To: <6af17cdb.63afbf66.14af03.b907@mx.google.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Nov 2026 09:05:12 -0500
X-Gm-Features: AclHuK8YIrpsTz_YPSzrtqYc-opyD2z4sAfbPJ8JbZ9yoQBStN6cKaRjskmODbw
Message-ID: <CADnq5_Nvfm3sioOfxWpBkh7QgUDBerdzrsAj9HXN9T+2gw3TBQ@mail.gmail.com>
Subject: Re: [REGRESSION] amdgpu: Raven/Picasso MCLK stays at 1200 MHz after
 Chromium exits
To: =?UTF-8?B?QXRhIMSwbGhhbiBLw7ZrdMO8cms=?= <atailhan2006@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 4:56=E2=80=AFAM Ata =C4=B0lhan K=C3=B6kt=C3=BCrk <at=
ailhan2006@gmail.com> wrote:
>
> Hi,
>
> On a Picasso/Raven2 laptop, MCLK stays pinned at its highest level
> (1200 MHz) after a Chromium-based browser (Brave) has used the GPU and
> been closed. I could not find where the state is set or released from
> the driver side, so I am asking whether this is known and what else I
> should collect. I have the kernel tree and can test patches.
>
> =3D=3D System =3D=3D
>
> Laptop:  Huawei MateBook D14 (NBLK-WAX9X), Ryzen 5 3500U,
>           Picasso/Raven2 1002:15d8 rev c2
> Distro:  Fedora 44, Sway 1.11 on Wayland
> Kernel:  7.2.13-200.fc44.x86_64 (Fedora kernel, not tested on drm-next)
> amdgpu 3.64.0, DCN 1.0, SMU10, VCN 1.0 (ENC 1.15 DEC 3 VEP 0 Rev 9)
> Mesa 26.2.5, libva 2.23.0
> Boot:    amdgpu.noretry=3D0 amdgpu.ppfeaturemask=3D0xffffffff
> amdgpu.gpu_recovery=3D1 amdgpu.vcnfw_log=3D1
> amdgpu.dcdebugmask=3D0x10
> Userspace: no daemon or tool writes to amdgpu sysfs.
>
> =3D=3D Symptom =3D=3D
>
> Idle: pp_dpm_mclk shows "0: 667Mhz *".
>
> After WebGL (WebGL Aquarium, sometimes this doesn't trigger?) or
> VA-API video (YouTube, VP9 1080p) in Brave, and closing the tab
> or the whole browser, pp_dpm_mclk shows "3: 1200Mhz *" indefinitely,
> with GPU load 0% and SCLK back at idle. amdgpu_pm_info reports
> "VCN: Powered down". Battery drain is about 5 W higher, (which for
> my machine it makes about 1.5 hour at my daily usage).
>
> - Persists across tab close, browser kill -9, all fds closed, VT switch.
> - power_dpm_force_performance_level stays "auto" and
>    pp_power_profile_mode stays BOOTUP_DEFAULT throughout.
> - While latched, writing "low" or manual MCLK levels does not move it.
>    After it is cleared, MCLK follows low/manual requests normally.
> - Cleared by: amdgpu_gpu_recover (debugfs), or by playing a video in
>    Firefox (MCLK goes to 667 MHz -sometimes 933 MHz- during playback).
> - Firefox itself does not trigger it.
>
> =3D=3D What triggers it =3D=3D
>
> - WebGL alone in Brave latches it, with VCN powered down the whole
>    time. So this is not specific to a VCN decode teardown path.
>    A clean Brave without custom flags behaves the same.
> - VA-API video decode in Brave latches it with VaapiVideoDecoder
>    confirmed active in media-internals, in each of these variants:
>    default flags, --use-angle=3Dgl,
>    --disable-features=3DUseMultiPlaneFormatForHardwareVideo,
>    --disable-features=3DVaapiIgnoreDriverChecks, even I run with
>    temp user directory with no flags, VA-API decoding ran and same issue
>    continued.
> - mpv --hwdec=3Dvaapi on the same file: MCLK is 933 MHz during playback.
>
> =3D=3D Kernel-side =3D=3D
>
> I attached bpftrace kprobes (with kstack) to smum_send_msg_to_smc and
> smum_send_msg_to_smc_with_parameter and ran: Brave WebGL, Brave
> YouTube, close (latched), Firefox WebGL, Firefox video (released),
> then amdgpu_gpu_recover.
>
> - Before the latch was first observed: 152 SMU messages, all either
>    GFXOFF enable/disable (smu10_gfx_off_control) or two VCN power
>    up/down pairs (smu10_powergate_vcn). No smu10_dpm_force_dpm_level,
>    no hard-min, active-display-count or deep-sleep messages.
> - Between the latched read and the released read (Firefox): again only
>    GFXOFF toggles and two balanced VCN up/down pairs. Brave's video
>    session produces the same two pairs and does not release.
> - A kprobe on rv1_update_clocks never fires during any browser
>    activity, only during gpu_recover.
> - Each read of pp_dpm_sclk/pp_dpm_mclk issues an SMU query
>    (smu10_emit_clock_levels), so the reported value is live.
>
> So neither setting nor releasing the state is visible on the SMU
> mailbox through these wrappers. This would not show direct register or
> table writes. I cannot tell whether the state lives in SMU firmware,
> in the display/data fabric p-state handshake, or elsewhere.
>
> =3D=3D Questions =3D=3D
>
> 1. Is this a known issue on Raven/Picasso?
> 2. On SMU10, what other path can hold FCLK/MCLK high that does not go
>     through the mailbox (DCN hubbub watermarks, DF p-state, firmware
>     internal state)?
> 3. What should I trace next? amdgpu_dm_dtn_log returns EPERM here even
>     as root (probably lockdown); I can boot without Secure Boot if that
>     output would help.
>

Please open a ticket at:
https://gitlab.freedesktop.org/drm/amd/-/work_items
If you recently updated the firmware can you try going back to an
older firmware?  If you changed your kernel can you bisect?

Alex
