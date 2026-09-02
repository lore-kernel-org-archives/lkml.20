Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679FC4A8FCA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362948; cv=none; b=gRWLyCPTCZjKvPwOnfDYFlYnvzFsp9ch/2ceAO9BxblQthsjXst63Li7Ascp8na3a5Kdq3iDZYF3ojVgCyQvjudbV6Eed4ox7IZPm08o/AFPPVepVyGImI5Omkk9VyEX5BJrNj3M40fGMb2uurfBCzfi2CIZ+Vc52wOZnT3f7p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362948; c=relaxed/simple;
	bh=7jxUimKmwA7qH8dqE2wdT+jpFfjrgAx0/iSyWFPr+Xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gEqX2I+vp+F9U6jXYTXSb5+4X/KHxHlZLcNdfpQBiAe7Gzs1OzAvpVLfud0MbAW6mVvRdSgTNgcnnLtrlzUDydgPAPd2UO57FbyRdakLaV8PHVr0MfLgJ/nIYRr9t0vYT1TOx/uD9dBItgGcDuwcFTclx06AkXidrAxTmlRg2nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EelvvEeH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EelvvEeH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b96433ca3so441725e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788362942; x=1788967742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9gX6/N+hUOidEKEDGQo/G6sZJ3cDNUMsczJpk9kQyc=;
        b=EelvvEeHxJSnb/bRJE0RAbRbpTeWGgByjzxrYi7cVwmCmjS+BGAszNfhJP/Dgoy2ZQ
         eelStoTivHz39aEFgcPrSf0IPsjugiDCNlB1DV6dCRg6Yu/x9Vb1Hmh6YSaCV/dSzuDp
         1FzXdTXrCfhU+RgNVvDVPIfnuCJEAxO4nBqDo2kdICMvItquOXKev90yT82+D3gyLixI
         oPf4mCCE2JCUojHCRwRfUJx+YBLBi0R6J72OVRyCE2WN8dgYIg+N6CPm2i1XFE6O0c1q
         nVLXX2x7q9UKqfuDs4rB06W2pnhXYS2wVxcmFdgyr4/QpLbHsbTe2/tF30Bunt85MN4N
         cj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362942; x=1788967742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P9gX6/N+hUOidEKEDGQo/G6sZJ3cDNUMsczJpk9kQyc=;
        b=hn/klX5OoGX7XoIuv2dlNJVf/FAmKDCxkuT4zTboalnKq4L+hXZL+NSJel7q8nLMKY
         io7sSoT1Azcmk9uMcqVNpKIIRi0IYCyH5gulqECAYOnJsmep9AxYvkckQRprWygybH7v
         Aq+jHdj0qYmBGCfZHTgETqv/fAD65GP2eoDoLTItDgKfVe1j/ivf0biEXx5b4R48bwRx
         XUVT8pPuqR9wY/terD/wGZuJVARgbP1uXsuKPJ2CziCcZhyOfwugY9XAhmpGvYkJlYmz
         kxpAMTzA4EuEbKDUrG7XrTXFjUKZIY9vHgVzmp3/fbPe+Vc/TI+fBv3l0vhB3BTPpU0A
         gVXA==
X-Forwarded-Encrypted: i=1; AHgh+RphOPeHAhgcX6b6JL/p6a1DWVdTObLpxS9Nkv0O7/0PXaY3amEsT4q0RV1rsIVJyIfZasdrvTdWmqZ1YM0=@vger.kernel.org
X-Gm-Message-State: AFuF++mcwP7BmezTiPnqPiEoR6WAL1fDu13SsNMi1wbpKFmdwhuATZFy
	ZNK4BPluVenFzhuOBANBY1h3YpG0bvW1TMeP4F3leVmVU8tA35HyIECF
X-Gm-Gg: AR+sD126e6P2gyn6BkfOHhmBWcm73/IIpbl6IMNcf8uU05Vijyl8WnYwFZcWVk63oKK
	WQVYu58YdA1uwAJKXl2sUQVfi8m+omL1BRghW+ZpE65Fp8DQesvfArxo/sPG50zovegavcg0q4Q
	jWgD+jx2LDa9GuwOoUR1JsNCRNw2N/Vi7KXIJor/5xJvZMd3Myt9671CzeVwQDI2z/AZSAbo3w4
	q0j4MEA6JzExKFQSDcuNRfNF1UaHdynVcxdj8Ntc48vP4fdfEZEPEhQofpjgF/GSqXYCrOrBMtt
	InbnknxviYrU4xES7q1A1w786zPWskCAmBlTPcBVx2wvPAqB1ceo36Ol2VYfO1sqKiEZh1VssES
	jdIT7VuBUpwkLncVraS4rHV7hB60YyGXqSm3gp8J/vhmMUqMLJvOwS9jCKSq7M/4cYWmI/eiLRE
	H0/cbXZYBCWNtj0AQoBvWZ2Ex793niw6oBajynHgH1ivuAh5JWsc6XpMSJIuC+vswJB7XD7Y2CJ
	fAcdutn612gqmwpyR0VhSjgfhgMO/eCnStYWNnF5sqQpVvygCMTnGlZgLOeRxAKB40TBdBoBFTA
	RMur
X-Received: by 2002:a05:600c:c48e:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49ce558d5cbmr47256105e9.0.1788362942067;
        Wed, 02 Sep 2026 08:29:02 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B831700D60D5CCF7970D839.dsl.pool.telekom.hu. [2001:4c4e:1b83:1700:d60d:5ccf:7970:d839])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4775005sm91395395e9.10.2026.09.02.08.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:29:01 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	mcanal@igalia.com,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Algea Cao <algea.cao@rock-chips.com>,
	Daniel Stone <daniels@collabora.com>,
	Liu Ying <victor.liu@nxp.com>,
	Phong LE <ple@baylibre.com>,
	Helge Deller <deller@gmx.de>,
	kernel@collabora.com,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Maud Spierings <maud_spierings@hotmail.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v11 00/74] Add HDMI 2.0 support to DW HDMI QP TX
Date: Wed,  2 Sep 2026 17:28:35 +0200
Message-ID: <20260902152838.5771-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Cristian,

> This has been tested on the following boards:

One more, with a sink pair your boards cannot cover:

Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588 Orange Pi 5 Plus, dual HDMI

Setup: whole v11 on its stated base (drm-misc-next 47b823940e38),
both SoC HDMI ports driven at once: a Samsung with HF-VSDB (max
TMDS character rate 600 MHz, SCDC present) and a Sony limited to
300 MHz TMDS.

1) HDMI 2.0 path: the Samsung now offers and runs 3840x2160@60 RGB
   with a 594 MHz pixel clock (modetest-confirmed). Without the
   series the same port tops out at 4K@30. A stable picture at
   594 MHz is only possible with scrambling and the 1/40 TMDS ratio
   active; it stayed stable across boot, mode changes and hotplug.

2) Non-2.0 fallback: the Sony keeps its 297 MHz 4K@30 modes.
   No regression.

3) The result I care most about: this Sony in standby keeps EDID/5V
   up but drops the link, and on my 7.2 stack that generates a
   storm of detect/modeset cycles - measured 119-194 per hour,
   enough to make the desktop stutter. On v11, twenty minutes of
   standby produced ZERO events, and wake restored both sinks by
   itself. Whatever share of that the cached-status detect and the
   SCDC-loss handling each take - thank you.

4) Hotplug on both ports: clean detach and reattach, no storms.

5) Audio on a dead link: this morning my 7.2 stack took an SError
   panic (regmap read in dw_hdmi_qp_bridge_clear_audio_infoframe
   when a PCM was closed on a link whose SCDC never came up - full
   UART trace available if useful). On v11 I could not reproduce
   the class: six open/close cycles against the standby sink plus
   one natural prepare-failure-then-close during replug all
   survived cleanly. Caveat: different base kernels, so this is
   not a clean A/B on the series alone.

Scope: RGB output only (the YUV420 output series is separate), no
USB-C DP on this base, VC4 side not exercised.

Igor
