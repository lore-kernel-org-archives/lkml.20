Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930AF29405
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786152; cv=none; b=O67pyRQh3D0M5DaH/7l3LRjP+r3nZPpbBMLhjlpKEDRAyUCW7vdWxg5sy2CbWF1qDdxKrd31KgmmoJwh62MMvG2W2CtNbqLXUSriz7B2xquZdbQUx62AQWxlF5SF6JGi1HOX8ozn0Bj1Wxb/TAlC6fiW2xaNoZEPOHSBl0JkqSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786152; c=relaxed/simple;
	bh=T5LP3d0dIz8lqyd6e7lTkAl6SbvMdhSR37j4r00hq00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kQnensU1wwILnWT/bnHX5Lgx19AitTjxF0OiXtLHEJOfpPFuIn7ytg49DdELGHCwrc0lt0OLrxut6niFHay5Q5dexsUDEaFVU2vfvMKu1BIZz79UoiTlNEb1qY+KrETq+MfViMunSaN79rCk5SfjtAOQ269HQ/PcUFvAKZxJbuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQuFtQ9O; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQuFtQ9O"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48435ae9ca4so380711f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786144; x=1789390944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9dD8iQeap0g0kwIbuDXwIvsANqbhM2Iedn6PQrGnMQ=;
        b=RQuFtQ9OzN8wpmbAQLQQI6rUi4fHrAuggBpl65NxLk2/OQW2TOW8soW8I/KSO36eTb
         VFyLKracmhHRR+jM/Zj/xJfil+ySvvpXcHzHk/L/GMM1syAm76Qfe2sfjNrC3hZiKKwb
         4XUTNSFjEE5OPUVBxKkPbkUt51P/hL3jASiJw8RkYRuxiSzQSjRepZbS4EfjT3+t3Sk8
         zBMtjXTh+6YM74ynomfsWcPRvmG7/kX10zkbbbW5Oe11ANy1tEHTcyl8EgI8DU25MKAI
         YuAUk5MFyhG4fp08ZZWc9SPMDMycHNf75ZzjHTq93JC9CnmQ+qGuRO3g4am1+wGV5bke
         3ImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786144; x=1789390944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d9dD8iQeap0g0kwIbuDXwIvsANqbhM2Iedn6PQrGnMQ=;
        b=cATxzjBnkO1nVU/KKWqw8a5rrmMlkWEctW1WJRtEyg37xRYNFAQvuHpStw5Zj8ZFM2
         xEYKCe2AQRNG/pOXhdSJYionYx7m7/Rv+nMs0fsV/NyB6d3FlWaJ4POOFcbGmdUE2jOE
         2zwc4uYU/6QQs3FmUR/+F4gn66Tl2G+afFldBQ8not5a+DrQyFFAacqk28+gM7hOmpSt
         FwxhSTXjU2Ob94nZtyMRd/9222dow2lNKXYysEJVHM5zeaFGzE3FEUVvnEgy/LbsZM8J
         uWFI2oprE+tYO62AEWhR573YdnI9Jp93lJiVQdDnPTJw3QKKYAqCUJMjGUAP7UkVTj7q
         mBXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwR/wt6ty0iEqDDWFQSIMvJfrHd9vXWuGrtoFIVj9IgpyU22Dvwc21ntK3VaD+CP7b6MAf8hrTLFawykI=@vger.kernel.org
X-Gm-Message-State: AFuF++lRJoc1JR/GeIiSmoPOkSg4zOaGv758/2NGTJMc5lDrozt733yg
	uDTDKpQLsISNc5yuIrWbfoKIqmdoVP+zTrtu7YTJwkY8LavMf54awnVC
X-Gm-Gg: AYBFou36x3GixubRxjSWvEo4ok73hQBa2JEsi/Tjj3LfcW9jFYmt6JDUQVnTpuJsmro
	fTL10fYfKHCOfrtRnN6IoA1q6PXKhdV2rEtQtrE1HhqrXu+psNJpXJFLNOo6Si9YeeqGx1Kfabw
	TOGJBuncVI2hiOVPOywCi5Z30WIm3iK4hmgIxbudeaAUEEBa9CK4R3kTmdQRtQIXDHXdGWf+yfJ
	it1Yk6MOClRQyBEL20oSHsmiKHlkmGJL7baTNMwNoDgHBp7BPIjDdM2vhsQEluo6hPA9vEm2ZTd
	51m7014MAwENhRjQ8RcoR2DspLORKoEiSYA+vKIh8yHuAfelyjw5VO5HHQQRbNq2L05c71gxfjb
	Zc0a/BmKt5FpTOFcPMHFi3yyVhClIZyFV/YLrs9yFKB6qEGrP0muhZkhKjdspeLOQFHMORhroSX
	TguwdmC4ROA6g53ZhIdrLoaotWled1E5BKDqWlcCoabJBpNsA3Fnt6JBP66Ye+RB31/wtwP+i8J
	0x1NlvVUyHZ7HPugerMzfQpdmDQ3CYKdSKBr14b/7YvC4y7LuS3PZ4npe/iCbHABBSp
X-Received: by 2002:a05:6000:25ed:b0:485:82f7:9053 with SMTP id ffacd0b85a97d-48589246177mr21918965f8f.1.1788786144043;
        Mon, 07 Sep 2026 06:02:24 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8822007B3AD9A87B9E27CB.dsl.pool.telekom.hu. [2001:4c4e:1b88:2200:7b3a:d9a8:7b9e:27cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfe14sm28947635f8f.35.2026.09.07.06.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:02:23 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Maud Spierings <maud_spierings@hotmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Frank Zhang <rmxpzlb@gmail.com>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: dw-hdmi-qp: Return -EOPNOTSUPP in HDMI audio functions
Date: Mon,  7 Sep 2026 15:01:30 +0200
Message-ID: <20260907153000.hdmiqp-audio-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519-fix-hdmi-audio-warnings-v1-1-9608966c993f@collabora.com>
References: <20260519-fix-hdmi-audio-warnings-v1-1-9608966c993f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Detlev,

One more data point for this one, from an Orange Pi 5 Plus (RK3588).

Without the patch, every prepare on an HDMI PCM whose output is not lit
(tmds_char_rate == 0: early in boot before the compositor enables the
output, or with the output disabled in the compositor) logs

  hdmi-audio-codec hdmi-audio-codec.N.auto: ASoC error (-19): at snd_soc_dai_prepare() on i2s-hifi

On two boots here with the link perfectly fine that was 115 and 114 lines,
in two bursts each (60 and 55 prepares ~1 ms apart at 15.7 s and 28.1 s
after boot on one, 60 and 54 at 14.8 s and 22.0 s on the other) - as far
as I can tell PipeWire probing the cards from the greeter session before
the compositor had lit the outputs. On the boot just before those two,
where the sink had also failed SCDC, there were four of them and then the
SError described in [2].

Disabling one output in the compositor and opening its PCM reproduces
it on demand: exactly one line per prepare - and, on the close that
follows, the abort in clear_audio_infoframe() described in [2].

With the patch applied (rebuilt dw_hdmi_qp module, same kernel), opening
the PCM of an output disabled in the compositor now fails right away in
hdmi_codec_startup() with EOPNOTSUPP - nothing from ASoC or the bridge
in the kernel log, aplay says "Operation not supported" - and audio on
the output that has a link works as before.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus

One more reason I think this and Frank Zhang's patch [1] belong together:
since the startup now fails, ASoC never marks the DAI as started, so for
a PCM opened on a dead link the close never reaches hdmi_codec_shutdown()
-> dw_hdmi_qp_audio_disable() -> clear_audio_infoframe(). That is the
same class of bug as the SError we hit here on 02.09 (PCM closed after a
failed prepare, register access with the PHY down -> SError, panic; full
trace in [2]). I can't be certain this patch alone would have prevented
that particular crash - a PCM that is already open when the output goes
down still walks that path, which is what Frank's guard is for - so both
still look needed to me. (I saw Cristian's question on v4 about
open-coding the clear; either shape works for the crash I hit.)

[1] https://lore.kernel.org/all/20260512103153.8861-1-rmxpzlb@gmail.com/
[2] https://lore.kernel.org/all/20260907153000.hdmiqp-audio-1-royalnet026@gmail.com/

Thanks,
Igor
