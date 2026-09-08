Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC2153D0A5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871024; cv=none; b=L9x7iSIPWdvsttj1KGQvNBZEnZsrytM+q4uarfc8SNm8aEFW+Qio4SFgbrlfNVE/lipcGR0bRBZA3x9/WGSOAG7dQsLwtcPMJsPhhmxy/nhN8xC3GWfhJ3bfF2SIRV13etBQoJ15dtZpDpfqu2DfjMVnERw5z6AsfCSabDsnQqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871024; c=relaxed/simple;
	bh=rFgdO2dJ9qHWHCugdPsurRI0n1j/jdZfr1HAi1LVuiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kgdWzdNTydj5ummcAEyj9pLtb82v0+o1Bo5b6lIr6yoaHOr3TKOnd5vgqPW6gSLPXIv8sktXmoWHSVtd3BKhK0bEGO2+7tsq1vVBLpJb+405jAEw6rNOQCbWgpNiXhHgHFpi78ESC0mqT6GNs8qapuwTcygeZFb6fIV9bQw+r/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rLLyEI3S; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rLLyEI3S"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cfbdac7a1so1509525e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788871021; x=1789475821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+PniewoGsEvcFKc5X/0XmY8z47zqDeJXJz7RtOPgSmc=;
        b=rLLyEI3SMmxMOLKyiHNRr2PZaQulnFWIlx2NnPM+OfWM+ExYhYCjETiTGcWl020RC9
         U2kFNCCRPe9pUympox+69Lzx1EmI7eIvrQhhEBUVnBFoo/b3XiX66l1e2KjKxoSRTVs8
         RZQR5G15AZ5JwjiiMAEU7rFWOjt5D3TgBQL/7lVNE9lMGLuqYuCzM6KoLWM53BVcuyDp
         tGsqAdYPnjyXxH8ZjCxQ8wmytz0p2vWrO37529tMhsfESUrEWBrjYocL5N1ir8lm4NBj
         nTXO6mdXfUfMSIcFk40IuDj403NCLAGbRwqO+/pAYJBYb0/lir2WSjvcy/NgzMCOmJVO
         +uuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788871021; x=1789475821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+PniewoGsEvcFKc5X/0XmY8z47zqDeJXJz7RtOPgSmc=;
        b=PtmxPFem2XZX5ka7suufCz9hNd98lGVvRcGS2aMGUTSZSm30RGT/Pa+BsVSDJCREJt
         yaY0JqwGP2qViKqgGtL9UQLQdUD67a6oPdw9ureUOH2Dr1o7dsJd3ytgo/hRrtJOLsW/
         37yoh9HzCc8MmTzAYEd2PrlWy/SrmPCHoR0tempyZj/Vlkbus7ymAq523tsZsKfuKVuR
         loG3+Xg0vRpKNDKL8VI+Gf8oTSy+HmORzqEmKYoaljftY49acSFLI1Zm7bfMohgoENz2
         wmiUFP5Sm9weZcotwkdyxcvGwiGqJIOQzAKcboB5k2Hy/bYbftoN+hAVprgdeHi7BhZE
         LU9g==
X-Forwarded-Encrypted: i=1; AKwUvBweZclfX9v0EowozVRLBK35QbiGIUWY5ADHMJLu2eJJP4vpldCg12OAlIM79Sb5VpKQtg3uASzlcL9n05g=@vger.kernel.org
X-Gm-Message-State: AFuF++kVYGDX95JYwdeKgNIBm0xRnYeInihov5FioiFgMQKt6i8g9Vr+
	AuLN4OpK/fGKtIYPGWrJCqxfwPHswxiE2DqjJV+RqZ4iC8u2ryhnjqNu
X-Gm-Gg: AYBFou0tqWg8VMQRd5jPlYohsiXPQbkpoJyeop+NEDS6MaEwdrP2yLlfh3iEqTlgaRD
	pGMHR2SK7xzAFb/xfwDPTuf7BqMId3abMMTTEbpI8DLlUL0gIKmRc2sIqElcrUo4rcQt01kppJw
	VEUQaR8Hw9VFfAXIMEGuVmW4FeHiZjdISV2/c+QjGnGE8rlaVQ7DFmVBO+24u+Lnf9zugEYOzoX
	Up+34mjXDzvIPf24HdT0KHUDO9WmRF8IAOagYwqnpTEm5nL+Y6mN8XR2H1NsqK1ez5E4PIyBwmO
	M2XlLwE8F63gqqLy27UcBSvNCCaUTc/vu4zxcE4P2fl8qJ7RvNGbR/ciw8TYG0knHdegZepyVCu
	55rLGz72zi1LB/VjhMdg3CTCF8kXJ64ypT9ADhZ8s7OtW+WsjgYguyz9mrDptftLeELEZf/ylMr
	gZ09bv16VlW1P2bMRghvEkHaSKEIsBb/O3RynKWoEt8+JQigZXOyJohqxAAYex/aflxy0yaVJU0
	216S/ZTmzsJ69spdf3QkJwHC8YhUh8u/84E9TIKr1N8dNaF1sxUl+vg6N3Jj5ltQqwRIw==
X-Received: by 2002:a05:600c:8485:b0:499:5b0f:72b with SMTP id 5b1f17b1804b1-49d01dcc32cmr183513645e9.1.1788871020732;
        Tue, 08 Sep 2026 05:37:00 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B825D004857F441745A19CB.dsl.pool.telekom.hu. [2001:4c4e:1b82:5d00:4857:f441:745a:19cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d0af538d0sm253454955e9.8.2026.09.08.05.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 05:36:59 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Frank Zhang <rmxpzlb@gmail.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com,
	andrzej.hajda@intel.com,
	luca.ceresoli@bootlin.com,
	daniels@collabora.com,
	dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	macromorgan@hotmail.com,
	dri-devel@lists.freedesktop.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] drm/bridge: dw-hdmi-qp: Guard clear_audio_infoframe when PHY is down
Date: Tue,  8 Sep 2026 14:36:34 +0200
Message-ID: <20260908123638.7282-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908070220.41574-1-rmxpzlb@gmail.com>
References: <20260908070220.41574-1-rmxpzlb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Frank,

Thank you for sending v5 so quickly.

I tested it on an Orange Pi 5 Plus (RK3588) against the exact case I
reported in [1]. v5 applied cleanly to my 7.2.0-rc7 based tree with no
context fixup, which v4 still needed here.

Reproducer, unchanged from [1]: the compositor turns the HDMI sink off
(so tmds_char_rate is 0 and the PHY is down), then plughw:hdmi1,0 is
opened and closed. Before, that took the machine down on close, in
dw_hdmi_qp_bridge_clear_audio_infoframe() -> regmap_update_bits_base()
-> _regmap_read() -> regmap_mmio_read32le(), either as a synchronous
external abort in the closing task or as an asynchronous SError panic.
The task died with interrupts disabled, so the codec lock stayed held
and every later open of that PCM hung in D state until reboot.

With v5 applied, three consecutive open/close cycles in that state all
behave identically: prepare fails with -ENODEV as before (3 x "ASoC
error (-19) at snd_soc_dai_prepare()"), no external abort, no SError,
the shutdown path completes, and the PCM can be opened again afterwards.

I also confirmed with ftrace that the guard is what stops it, rather than
the path simply not being reached. Tracing
dw_hdmi_qp_bridge_clear_audio_infoframe with function_graph:

  - sink off (tmds_char_rate == 0): the function is entered and returns
    as a leaf, 2.9 us, with no calls inside it at all.

  - sink on, as a positive control: the same function shows
    regmap_update_bits_base() -> _regmap_update_bits() -> _regmap_read()
    / _regmap_write() nested inside - the same frames the crash walked
    through - so the tracer does see the body, and "empty" in the first
    case really is the tmds_char_rate check taking effect.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus (RK3588)

Two notes, so this is not read as more than it is.

First, what I exercised is the sequential case: the display is already
off before the audio device is closed. I did not try to hit the narrow
window the automated review raised in this thread, where the atomic
disable lands between the tmds_char_rate check and the register access,
so my test says nothing about that race either way.

Second, for whoever picks this up: Detlev Casanova's patch [2] covers
the other half of the same problem on this hardware - the enable/prepare
side returning -EOPNOTSUPP when there is no link - and has three
Tested-by tags. The two are complementary here. His cuts the case where
the PCM is opened while the sink is already off; yours covers the case
where the PCM is already open and the output goes away underneath it.
Taking only one of them still leaves a way to reach the crash. With both
applied together on this board the path is quiet and the -19 messages
are gone as well.

[1] https://lore.kernel.org/all/20260907153000.hdmiqp-audio-1-royalnet026@gmail.com/
[2] https://lore.kernel.org/all/20260519-fix-hdmi-audio-warnings-v1-1-9608966c993f@collabora.com/

Igor
