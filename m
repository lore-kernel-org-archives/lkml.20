Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390971;
	b=IsMYjeoPKghFqO8hcUOamUgj9gjjgdKPr/hWWJsDsVrsD9Hj9Df4wQjcwc6qLGk/3kFq
	 sNATVyqkhbF+jLJ92ZCNEf3X1dqEODCdShkSrWIRKeczwJJoTasZsYMIMhaHA7934syEd
	 SsTE0UmukI8AvvGjf2pIcuTod08jQGAWYuUp/wzX6xxaJD6e+0GPU+tbuZhy9ZVGRc7H3
	 5KDbYJyXyqojzmMwQ0D3hqsrpM72IMBXG8Q7NNvTMsluhWOCVXjoOUtAhfFIY9yCl64St
	 psQzoqvI+vtDRywHr3LkU2C/MN6gXKfqBclD3CFohqGAk8EIqzBdxek0He5wEjyaw1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=etMBeFFvTZ16JTCJaXFRCqu9zDzZcOqbu475oSnC7og=;
	b=pb5p5UGZAAyEYojhH6dZDN9sO5+smX9NPNGfmf+kT4c1DU1l9IGvqVy12cK1ULoHY+SI
	 6VVp9B5+eIK8Qc9znHaXsVK6YwRcfIpXNLCbXhfySwVzUdpZUyuj187HFZiMIx2sKGd1y
	 NQ1RSR8rS7vRnO1SqsiFLPTvj6c3xFeEav1Y87Amdyr3T5UW++tgpeVv7haPJyb+ldkk1
	 jsYLr3+yd9NifkN1naQH8Kb/VBE0UU5bMva3nMYHDpN4hoxqJ448co/a4bqA5P1UMuzl9
	 Af28EKMS0AIcjMNHhNFZ3XQPQyDQoZj1Rwsqpt/4yT5UGGUTYYQvDcRdOhb5fatX4Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJmfEAiC;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F15606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40F15606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJmfEAiC
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37605faade6so42812eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794390970; x=1794995770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etMBeFFvTZ16JTCJaXFRCqu9zDzZcOqbu475oSnC7og=;
        b=ZJmfEAiCphApfgbLZ4ZEnDNDjfl4nAm47bGuvagumN336f47UWyjVjCY2H/S8Mpm7V
         LwjPdUDJ4SYAmDnFi3jImFbeOQQu72pJ9rZOpV2Pcod1qlsm8J/xWEiXNsKAb35nrIWT
         mh5O1/Fy9B4QgwOhIydSzh/6aYNFCUAoR2o+3fRqIO6KEcp5ARNY9SuiSoMY59hjM0u7
         lbUWlUQ6TxwkvTsakxfhaSMobQbegayLu+gCGfYrwdy9Zyzp68CSJbhcSpnVC4YZrASl
         n6kv7FGEXxZEFpDuESdMhS30uWTUkItTQUyyaCBsn8QW+1GNtMM0di38tuaTlBUQ6ZxQ
         gPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794390970; x=1794995770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etMBeFFvTZ16JTCJaXFRCqu9zDzZcOqbu475oSnC7og=;
        b=AXybQBT662nrcNASMEVRWXeRUFhKn5XJlwSL4ZWd50rP/BKytCs/Z3A3R7KNdzXeNS
         rG3qH1od5XxWkXqIKIqb5w8xA5Txt3Egp7951PoVT3YqDgegCcKoMHdDmspN2508Rqnc
         WzCBma1Y4qFAWSlNawWZaq0IZogRZqvOQ9rLm2Mccs5wkYeVXAsVojhLE0hL6VWDFHls
         OQ+P6Xb9sWEpbuIAiSzYykSBZ++MHKM2gckPZwdepq6z211DNfHCoDreSYBqiYm0cBJ9
         MLvZhOGIqUCZjImi/BH8zQTt5ls/Fjlk2EJUrjsnaIiYzsdVgCxf6A3rO2h6wwrS2X/2
         iUXg==
X-Forwarded-Encrypted: i=1; AL+hErF8qEU+vrm+JXwA/Hf4ditKiki1eHMYFr4zF6oCrxK+eS+BlRklz5uJ/pK2hMTSVEb3xRCNdHduKoUx0NE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ntyw23gvpcnyYNJR6idyd5kgPjhXI34C26tfLkyWYRUr0IXC8
	DWl9v6D8+LAdEm+r8FlKMXNGH19rY8ZWMk5IkqaDMNCki1bi8Hz5mVBg
X-Gm-Gg: AYBFou1mVMjEpYTdQ2PxCKj6tN17Jpu01huMF95nBkGrWm39fnoB7qwgMsCR8zi/Uqj
	j9tCiZNaQKn707O4nJ4zu+bVfnd8oNsMxBYygCLmMdSjdhmkbFkx0nUDrsbncmrENgClWYcz7A7
	Oa9uc29aFBH6zStNkSqXWaRFsRiq0TbYtsOcmVFzw2ot4KFOtoxVY7Yi6OWiWoMb89TOZ+nMEjk
	oxYYjiupWvb+mJPa2xpYnHjiV4u6iO8t1R+VbJuoosZqCYviV2eIDGwXuWEHb908XM4TVub9bIX
	/iZObaKUqFWm58SayyuDBI7QohT5n7XjRjnogweJ1BM1TtjJDmweKi99nZfKHCdzrUmRHCYt9U8
	qxvcVFk0CFrkWUmJYpaK0o7zcHxIfUBRfNks9FpHge1hurDku67wP4kY3cXAGFX11TL2hveabYe
	lHkvPZcJMx1+0WRVRNEh+XMOnhoAwyiyR6o+gWrV+LvpVL0Lt8PtniBBLIIw0lbYCTW6uHdC1PP
	N+HTIHELeYW0EU4kEwYNIY0HJuoUc8Rzpgn1++L3Lpz36p0MS+Jb3toJQFBSvFzA30Pyy5dF3EH
	qn3zq8Onor+2rn/q4TXWY8SYYOmj4znIIbDfsBR5U9D82Vjx8lvDRKAoocl5zb+5z7+3X9A=
X-Received: by 2002:a05:7300:5621:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-37684af683dmr3732846eec.1.1794390970156;
        Wed, 11 Nov 2026 01:56:10 -0800 (PST)
Received: from [192.168.1.205] (2607-8700-5500-a805-0000-0000-0000-0002.16clouds.com. [2607:8700:5500:a805::2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm28141912eec.16.2026.11.11.01.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 01:56:09 -0800 (PST)
Message-ID: <72a2f21b-fd6b-427d-afa6-b15dc0729650@gmail.com>
Date: Wed, 11 Nov 2026 17:56:00 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/bridge: dw-hdmi-qp: serialize HDMI audio callbacks
 with PHY enable/disable
To: Tim Surber <me@timsurber.de>
Cc: Igor Paunovic <royalnet026@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Maxime Ripard
 <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261110215535.2658927-1-me@timsurber.de>
Content-Language: en-US
From: Frank Zhang <rmxpzlb@gmail.com>
In-Reply-To: <20261110215535.2658927-1-me@timsurber.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 05:55, Tim Surber wrote:
> Hi Frank,
> 
> On Tue, Sep 15, 2026 at 06:34:33PM +0800, Frank Zhang wrote:
>> The crash occurs when HDMI audio callbacks access registers after DRM
>> atomic framework disabled the PHY.
> 
> I reproduced this on a FriendlyElec CM3588 NAS (RK3588) and tested v6.
> The bug can be hit in more situations than the reboot case in the
> commit message. The details are below in case they help with the
> commit message or with the stable backport.
> 
> Setup:
> - rockchip for-next at c3baae5f1 (7.4.0-rc1), arm64 defconfig
> - HDMI TX/RX audio DT enablement for CM3588 on top (HDMI-IN series)
> - Debian forky, GNOME 50 / Mutter 50.5
> - HDMI0 TX looped back into the RK3588 HDMI RX, so playback on HDMI0
>    can be captured on the HDMI-IN card for a functional check
> - netconsole to capture oopses
> 
> Without the patch:
> 
> 1) Display off, then open/close the PCM
> 
>     Mutter switches the outputs off (CRTC fully disabled):
> 
>       busctl --user set-property org.gnome.Mutter.DisplayConfig \
>           /org/gnome/Mutter/DisplayConfig \
>           org.gnome.Mutter.DisplayConfig PowerSaveMode i 3
>       cat /sys/class/drm/card0-HDMI-A-1/enabled   # -> disabled
>       speaker-test -D hw:HDMI0 -c2 -r 48000 -t sine -F S16_LE -l 1
> 
>     hw_params fails with -ENODEV (prepare sees tmds_char_rate == 0).
>     The close that follows still reaches clear_audio_infoframe:
> 
>       Internal error: synchronous external abort: 0000000096000010 [#1] SMP
>       pc : regmap_mmio_read32le+0xc/0x24
>       Call trace:
>        regmap_mmio_read32le+0xc/0x24 (P)
>        _regmap_bus_reg_read+0x68/0xac
>        _regmap_read+0x60/0xd8
>        _regmap_update_bits+0xfc/0x14c
>        regmap_update_bits_base+0x54/0x80
>        dw_hdmi_qp_bridge_clear_audio_infoframe+0x30/0x40 [dw_hdmi_qp]
>        drm_bridge_connector_clear_audio_infoframe+0x20/0x40 [drm_display_helper]
>        clear_infoframe+0x50/0xf4 [drm_display_helper]
>        drm_atomic_helper_connector_hdmi_clear_audio_infoframe+0x64/0xcc [drm_display_helper]
>        dw_hdmi_qp_audio_disable+0x1c/0xa4 [dw_hdmi_qp]
>        drm_bridge_connector_audio_shutdown+0x28/0x4c [drm_display_helper]
>        drm_connector_hdmi_audio_shutdown+0x1c/0x30 [drm_display_helper]
>        hdmi_codec_shutdown+0x58/0x7c [snd_soc_hdmi_codec]
>        snd_soc_dai_shutdown+0x54/0x80 [snd_soc_core]
>        soc_pcm_clean.isra.0+0x5c/0x1e0 [snd_soc_core]
>        soc_pcm_close+0x34/0x60 [snd_soc_core]
>        snd_pcm_release_substream.part.0+0x88/0xe0 [snd_pcm]
>        snd_pcm_release+0x58/0xc8 [snd_pcm]
>        __fput+0xd0/0x300
>        ...
>       note: speaker-test[1576] exited with irqs disabled
>       note: speaker-test[1576] exited with preempt_count 1
> 
>     The task dies holding the ASoC PCM mutex. Afterwards the
>     close_delayed_work kworker stays in D state in
>     snd_soc_close_delayed_work(), so audio stays broken until reboot.
>     One of my runs ended in an SError panic instead of the
>     synchronous abort.
> 
> 2) Display turned off while a stream is running (the wider case)
> 
>     Start playback on hw:HDMI0 with the display on, switch the display
>     off through Mutter as above, keep playing, then stop the stream.
>     Playback keeps running normally (state RUNNING, hw_ptr advancing)
>     and nothing is reported to user space. When the stream is closed,
>     the board dies: SSH drops, nothing reaches netconsole, and it
>     reboots only through kernel.panic. I reproduced this twice.
> 
>     No application error is needed for this. Playing audio over HDMI
>     while the desktop blanks the screen, or while the sink is
>     unplugged, and then stopping playback is enough. I suspect this is
>     also what most users hit in practice, more than the reboot path.
> 
> 3) HDMI output never enabled (HDMI1, nothing connected)
> 
>     Opening and closing hw:HDMI1 repeatedly fails with -ENODEV and does
>     not crash. The same holds for WirePlumber probing HDMI0 at boot,
>     before the compositor enables it. The register accesses only fault
>     after the PHY has been initialised once and then disabled, which
>     matches your analysis.
> 
> With v6 applied:
> 
> - Case 1: the open now fails cleanly ("Playback open error: -95,
>    Operation not supported" from the new startup check). No abort,
>    and the system stays healthy.
> - Case 2: playback continues after the display goes off, and the
>    close completes cleanly. No hang.
> - Case 3: unchanged, -ENODEV, no crash.
> - Functional check: after re-enabling the display, a 440 Hz sine played
>    on HDMI0 is captured correctly on the HDMI-IN card through the
>    loopback, so the prepare/infoframe path still works.
> - Stress test: for 2 minutes, HDMI0 was toggled on and off 114 times
>    (atomic commits disabling/enabling the CRTC at random 0.1-0.9 s
>    intervals), racing about 2950 open/play/close cycles on hw:HDMI0
>    with random lifetimes. No oops, no hung tasks, nothing new in
>    dmesg (lockdep was not enabled).
> 
> It may be worth adding the "stream open while the output is disabled"
> case to the commit message. It is much easier to trigger than the
> reboot race and makes a stronger case for the stable backport.
> 
> Tested-by: Tim Surber <me@timsurber.de> # FriendlyElec CM3588 NAS (RK3588)
> 
> Thanks,
> Tim

Hi Tim,

Thank you for the thorough testing and suggestion. I'll update the 
commit message and send a new version as soon as possible.

Best regards,
Frank

