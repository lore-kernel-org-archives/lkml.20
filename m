Received: from mail-oa2-f0.google.com (mail-oa2-f0.google.com [74.125.231.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09082211A09
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788760904; cv=none; b=gIkdfEMKcrks4nt+cM/bNoNryV9FIG5AffFu4dZf1bJ3Wk4ebRorvFKhW3Tm2NIzEyZH3PpclDb2rEJUIOPDunsyqcc92Yp+qfJfk6xcMSLRq19E46eMJgJFYeAMZ140NIZiAsppPzALlOno4CXTVEDvO4qTM3KCRaMemuafAvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788760904; c=relaxed/simple;
	bh=nb7e40O2vHkCkRzIEYHaNAAJYNdeSoerKZswLkgEi18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VC4o7nrvddbKK206wBiWqWNvfgEFqFXbiVC6wGfZMWzImR72P+zmX3NkZ52b3ySmZJUnM7qL0EFF4EkprPNRSHz0KyjlQsx+AiyWKaKbSYIfXNXAT3R6NWnJuzeeWaLEfKNZy4Krv96nrUtC1gH1iZFl4oG9siMxM5W55XDmRXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1sSX41r; arc=none smtp.client-ip=74.125.231.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1sSX41r"
Received: by mail-oa2-f0.google.com with SMTP id 586e51a60fabf-4511f6a63edso526697fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788760902; x=1789365702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXRC1vJzIXUhQWExc4MItt9EZDnsCd9kQ4t3XgfcoB0=;
        b=h1sSX41rKMV9vKkIZ1d/y31k6vLrwySgR2ZHIyyMPh+jyeRR2jaUA4Dw0S1YE8huDW
         DGPdVm39mnxNfD31ZSwQu8foI3L3zobMsLx6WP8EQA3++lYe6UNqZplFPkYbYQ3hC75l
         W9AmCnvtsq7qFxbO2lwZJjCFg2JjKByRx/L+iY2SfMmmRTONbWB9sC5mOKxvYGQnkfTy
         0CKpebQNiCj9+9RdY6quqiin9YS4z0vpYNAtJGfU2btLDX8OjY1gE1Iqu8PMROB4aYWD
         pb3INR/RlRLMRrIjWomGGjBYFQtb6xKVZuJBdA6ik3WKjUjaRmHLZDQuL8nnKPnp+NQq
         YReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788760902; x=1789365702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oXRC1vJzIXUhQWExc4MItt9EZDnsCd9kQ4t3XgfcoB0=;
        b=dbOzXhY82v83v3LsNW1/bX4F4Mr30CAM8kTPcUVYADUD5FnFAShMAWwKRL4XQKp5K4
         7wj24W2xtsYtxwOczUEzeCEAGnbe+vgNsE63Yt1wntV8y+cgrkiVknbjIdehI+50Inxk
         Po3gE9BFKlxpUc7EsnQ7ixoDcqI7HQqqYol52b8u25KBhVPCpld3ql9yMA7IiYkRFGEw
         7nvrBIaQbu0+vyGZIxI3Ci3YsLRDSbAfRXilsjp64S+ee5hBROaAwM6VSWqSlCZSrsKA
         baBTRPMIydstVryqFmbzBMYQTXqPv5lRBAgaBn2Ugvz8KfW+Acc8YU89H3WMYZ98cYmx
         Qg+w==
X-Forwarded-Encrypted: i=1; AKwUvByy5bqN7EAgzOo3QGc1QUmgv9xDRbUE4pLuaSQb4DGxL5pHaGlLfomVbwMAcC8nm9mIErWtAv831izIjzg=@vger.kernel.org
X-Gm-Message-State: AFuF++lSVYldHnAXYOXNRGbdYxDSdnrplmNGjudSrJ2NiPduYB3sSi7g
	yeENABRy32Nu2UJQnlWcjOIV+wIvFskG98ai0y2Jww02q2MgV0oo1bb7
X-Gm-Gg: AYBFou0Kx0B4Q1IPdZ+m1WZ/RhZAmg866UkoGm5Rpz+9XS1MDrfLsQanbgdNy8sq0TD
	64HDCOQ8O48LOoTin9WIWLH8OIofeV/pcHmHet+c9xokwhLU/Mek9GcUCkp9jZ45mgpo+IfNU8+
	QgPNsUTbqdUEUVB7/CWBVHG7uXiNJufwb6jQhiNiReYCFtoGAs3/cvA6QIv5ZLLMNlbLz3V7PhW
	ouJWYi5cqH211UcmkhIW9wd7g62wT67Q+O+gLcddt/OrLe8fwACtT4hR3BNLK/V0Pws4A0LVEJ5
	U0YrMu79g1AkqhKLi8p8VlktANIug2UYqBp0GW8OU/tQuJeRr0BjT7c2GejvGEqWz+uAYkoDjYd
	mpi+gGSlG9vKIdOc4KpjO4nt9GnzRdr1xNr55002FAGvBRLaoEgp0UW6jjfxWKyKx3RnknFkjF9
	9xHPdy1vO024nCUPnDtJqO4zvraJFwP3k7apRJPaSDJLY82MSkhMGK4iLYncxYEg==
X-Received: by 2002:a05:6870:8127:b0:465:27b7:4009 with SMTP id 586e51a60fabf-47550f20db6mr13400608fac.4.1788760901877;
        Sun, 06 Sep 2026 23:01:41 -0700 (PDT)
Received: from ryan-dell ([2600:100b:b039:79f4:f7f:ccf7:cd6f:384])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4755493580fsm9761726fac.13.2026.09.06.23.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:01:40 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
To: Nickolay Goppen <setotau@mainlining.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Minnekhanov <alexeymin@minlexx.ru>
Subject: Re: [PATCH RFC 0/2] Novatek NT51021 DSI panel IC driver
Date: Mon,  7 Sep 2026 01:01:28 -0500
Message-ID: <20260907060129.120497-1-ryanbrue.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org>
References: <20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Nickolay,

I sent a duplicate NT51021 driver on September 5th without finding
yours from the 29th first. That was my mistake, and I have withdrawn
mine. That's my bad, I'm new to kernel development :)

Since I had the hardware set up, I tested your series on the device I
am working on: the Amazon Fire HD 10 (2017), an MT8173 tablet with a BOE
1200x1920 NT51021 module, driven by mediatek-drm rather than msm. It
works.

Concretely, on that panel:

  - your 10.1" register sequence, timings and mode_flags, unmodified,
    bring the panel up correctly at your 60 Hz / 993.5 Mbps per lane
  - it also works with my vendor's own sequence and timings under your
    driver, at 62.5 Hz / 980 Mbps
  - verified across a cold boot, display off and on cycles and a
    suspend/resume, with the MIPI TX PLL reading back at the intended
    rate each time

So, for what it is worth on hardware you cannot test:

Tested-by: Ryan Brue <ryanbrue.dev@gmail.com>

Two things I checked that might save you answering them later:

  - The generic writes are right. Xiaomi's own panel dtsi uses dtype
    0x29, and this panel accepts both generic and DCS short writes, so
    nothing depends on the choice.

  - prepare() never sending a set_display_on looked like an omission to
    me at first, but the 0x01 software reset at the head of the init
    restores it, and repeated off and on cycles pass. It may be worth a
    comment, since unprepare() does send set_display_off and the
    asymmetry invites the question.

One question on the binding, which is as much about my patch as yours.
Where does "boe,tv101wum-nx0" come from? Xiaomi's panel dtsi
(dsi-panel-nt51021-boe-10wu-video.dtsi) gives only

    qcom,mdss-dsi-panel-name = "NT51021_BOE_BOE10";

with no part number, and the register sequence in your driver matches
that file byte for byte. TV101WUM-NX0 is a real BOE part, and its
datasheet active area of 216.576 x 135.36 mm agrees nicely with the
135 x 216 in that dtsi, so the attribution looks reasonable. But if it
is inferred rather than read off the panel or a BOM, it may be worth
saying so in the commit message, or naming the compatible after the
board the way panel-novatek-nt36523.c does for
xiaomi,elish-boe-nt36523.

I ask because my module has no identity I can establish at all. It
answers no DSI read, DCS or generic, before or after sleep-out; the
vendor kernel and bootloader name it only "BOE", chosen from two board
ID straps; and its vendor-declared physical height is arithmetically
impossible, since 1200/136 and 1920/221 disagree by 1.5%. So I am
naming mine after the board, and would rather not accidentally imply it
is or is not your part.

If it is useful, I have the Fire HD 10 panel ready as a variant on top
of your series: two patches, binding and driver, adding
amazon,suez-boe-nt51021. The only change it needs in your code is
making mode_flags per variant. My vendor asks for sync-event video mode
with a continuously running HS clock rather than burst, and your two
panels keep exactly the flags they have now. Burst worked on my panel
too, so this is about matching what the module is characterised for,
not a fix.

I will hold that until your v2, since Neil's renaming will touch every
identifier it adds. Happy to test v2 on this hardware when you post it.

Thanks for doing this first.

Ryan
