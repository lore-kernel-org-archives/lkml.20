Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726467;
	b=KVnuMnODOvF+OrdpG2wZRs4bnogKhnZTt9xSdRQcUf7wIAQSPViAipXQzDfLnJDM2sae
	 bHdGpDkjLO4c43H+xxV2xCmnctO8kLm5aj0dmLWWLhrdwoAJgtYnJsP1FKXWy/IsJwjlf
	 c95eu7wks9EPWAVx9T0mIVbdPeqvDesl6MJnZFe3Ndb+vxksOZrdMbTGYFWJpvvrRUCH3
	 CaV9z7vMHaurhJeUweB7nyX2E57goULECjdCQo2R6XhR8r3cPuesBfBPm43HQ5Ei4/UgP
	 RU+sAUJ+Ll/Msjk96YjqL1asW44B7M7bVEjnBsYKZKsIxpU1ImZ7/vOzNWck2qG8rnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VdlowWmvfVZz+69VMJzw63b7hr3S2rAy0+a2cDKUzcU=;
	b=AU8+aCiHm9u9AaxphnaaHcquQ7uVzUv/qq7IviIcZDTjkSeaW4QL6iR9CckC3jfmRDGp
	 lUbKoS23kbeo0tNiBhLw1i8TSudT39cb10+ddECt3FSc8yzPoKn52IKtEoXeIuD4CP781
	 3qgKDVAM1gWm0cbE0YvsS6Tbu05HPAm+V58PWPwJtSEuT8/cQ1vlKy1m0TcZWFRqKWLUS
	 fvXM5T2qyKyrChFsNt9MfnKi6DnPbj0E68aH44L5K1dSEW+LyeEUC4dMB9eqS/n5gned9
	 UrEjWTgJnPgr2SAlUxisKjdzRLL1gAxr40tqJ5kFp6QdfsrzPl2p6vTAu2UXKl2JBbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05deI4v8;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C651606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C651606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05deI4v8
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so36355055e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793726466; x=1794331266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VdlowWmvfVZz+69VMJzw63b7hr3S2rAy0+a2cDKUzcU=;
        b=05deI4v877peuDZQXCEGpNlQGGkY0C1DEG6mwexeXb6DKhOP/4r/F8yyJFq+u8XSVi
         1R0zeaNPtZgl5jLlxkZsB053TbDKyphEuFYbbGLnWmaq5OWIwl0qUHVqAfWOP2sC1daX
         EyilZNTvQD5ul3BdNUN3qdzoZEv0R1kGnG5WHFn4GyFYa9yQfupUPHQNIfB8g+qjN/It
         XS26D5Nfm73PiA2iwcIC0Vx/xD5R1NOgH6Y+X7NZHciJzCyaDpIPr1jc57GEuwm9JqpS
         GEDBO1piSAaLm2+vZUQLzkQ7HAZg2tSVz1aKrg1Mywp4ovv/GIBzGHXqxxK1RhfNk2Bn
         jcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726466; x=1794331266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VdlowWmvfVZz+69VMJzw63b7hr3S2rAy0+a2cDKUzcU=;
        b=uqstKH9nJK1bL0rQDwTWYTIhoAsW7ub7g8WKLqbVjwcoKbEJgVuGgaJ1/VQm3acgDr
         Q7MNFs1Ma7Y7m9O0aoV3Eu6PdZvqwtq0YvDWACAmD/iTqMFjNwEm9YYkqbZZ9VHp4H6H
         qRFOMPnGYu1N/o/auiiRiotN8PkOlMSIZ0Q6rIq6WSXoVzTgtQziNN0ylt5WPy+uzQvG
         Cd8oASGSzm2dvQE2re77kQXM8AmiCwuBTgkm6TcTWklXVbtDj+3UYOSpecPwGnIm1yCe
         Fy8azZ7EMf1rZoowrCjoSHzJ9pRSAvluaV42MzJmQBA4cD+snTcnrYkxU0mxeTQkQM40
         s7aA==
X-Forwarded-Encrypted: i=1; AKwUvBzSck08qEd8fmB+wdh1tHuT043p18QyKwqxDd0KXSx57MDt3nX8NlqoauNhzBzLN3vJ3LGdPwsk2ArKxv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vhZ27sRE+OQnaD/644/jitCI+uy0KSQDcCJfK7a+3WGcBYcx3
	NrFyVUGaSfSBP8b7oGIUv/nEwxJI+PrTQsCu4c+QMOPmrkE+HZVfh+4y
X-Gm-Gg: AYBFou3hB6dzg+79T9tkQuercu+ZTrqFmWh+e8cJ48XQf11n8iqmsz2AjxNAz0RcuPm
	7EEtcKwGfFQcRs/To1RVS6UwnibEkIbUK0E66tGDGuGhTa+8eFHmEqMRrMluA2x8cKGbXWDYJWZ
	AYaBLNPxlwjK1KfgtuL5U1d4fXIP40BEnt64oEEFyKPDMjBkUOTAEPiJ2u1XyGmjoyiTf2f40US
	gYK803ziONVU3jjPuPJvgHIFTR6ArGgOkN9cWbPFSHGAVDIed2oPWIVQvAF+4NrZ/t3Ui3x7OrJ
	Qjr/6uxgsBi9uADNcOLl18t+Z3PKoCcz+oNbNb9JuyGpDVwmal7b/R7NMz4jKsHN7x3cya8GZjc
	XjNlJtEGlTLKIelZeieCOr9uRkO6jCNPrOm9y+o7jMSeP6l32bhSB/d2Zq01P1o6VdJfbScmX+J
	ZIicoG1Wuaf6OYvK3NZuOv2JkwjNEA+T99qrohdEfX4qeGRpx7s/MZVIuT4guBjqzpbA9/mik4e
	1iT9L8x+2IZ9kn92p2Qk6feWxxuUVqTFhklcTaPAHdm6rhHBnv9QdOo/+3QOwySHbS11SaSkrrO
	Sk/xB7kIGSIUAHyFduwRBo+1Bt88Y4trAEIi1aWfGuNdZhj4/ED+8p+C2Y5Faf7hmCIt4P+dsZL
	r4EPUFJwE3FKng2C9Xwjk0wYGchTy2BaUlSpV7tA=
X-Received: by 2002:a05:600c:4704:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4ac18992a21mr287850375e9.29.1793726465631;
        Tue, 03 Nov 2026 09:21:05 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:8b77:19e1:26f7:89f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac08b72579sm8800675e9.2.2026.11.03.09.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:21:05 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] clk/drm: renesas: Improve RZ/V2H(P) MIPI DSI PLL parameter selection
Date: Tue,  3 Nov 2026 17:20:53 +0000
Message-ID: <20261103172057.617203-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

On RZ/V2H(P) and RZ/V2N the DSI HS clock is derived from the pixel clock
produced by the CPG PLLDSI and its divider (HS clock = pixel clock *
bpp / lanes), and the PLL in the DSI block has to reproduce it to within
0.5 Hz. A display mode is usable only if a single set of CPG parameters
satisfies both the CPG and the DSI PLL constraints, but the two were
checked one after the other instead of together:

 - Mode validation took the CPG parameters with the smallest frequency
   error and only then checked the DSI PLL. A divider that lost on CPG
   error alone was never tried against the DSI PLL, so modes were
   rejected although another divider or PLL setting would have worked.
 - The PLLDSI divider's .determine_rate() runs its own search when the
   clock is set, so it can pick parameters other than the ones the DSI
   driver validated.

The first two patches add the clock-side support, the last two make the
DSI driver use it:

 1. Let the DSI driver cache the CPG divider parameters it validated,
    per PLLDSI instance, and have .determine_rate() reuse them when the
    requested rate matches.
 2. Add rzv2h_cpg_get_pll_pars_validate(), which offers each candidate
    to a callback and returns the first one it accepts.
    rzv2h_get_pll_pars() becomes a wrapper passing a NULL validator, so
    existing callers are unchanged.
 3. Evaluate every divider against the DSI PLL limits, keep the one with
    the smallest DSI PLL error and hand it to the CPG using the cache
    from patch 1.
 4. If no divider gives a usable pair, search again using patch 2 and
    take the first CPG candidate that is at most 50 Hz off at the PLLDSI
    output and gives a DSI HS clock error below 0.5 Hz. 50 Hz is at most
    2 ppm of the 25 MHz minimum PLLDSI output, so the pixel clock error
    stays negligible.

The cache in patch 1 is indexed by PLLDSI instance and shared by all CPG
instances, as the DSI driver only knows which instance it targets. If
there is a cleaner way to hand the parameters over to the CPG, I am
happy to rework it.

Testing
-------
"modetest -c" on [RZ/V2H EVK] (DSI -> ADV7535 -> HDMI, 4 lanes,
[monitor]) lists 27 modes instead of 21. No mode is lost, and these are
the newly usable ones:

  mode        refresh   pixel clock
  1920x1080   59.94 Hz  148352 kHz
  1280x720    59.94 Hz   74176 kHz
  720x480     60.00 Hz   27027 kHz
  640x480     60.00 Hz   25200 kHz
  640x480     59.94 Hz   25175 kHz
  720x400     70.08 Hz   28320 kHz

Dependencies
------------
Based on next-20261102 plus two patches from Tommaso that are not in
that tree:

  [1] clk: renesas: rzv2h: Forward PLLDSI mux rate requests to the parent
  [2] clk: renesas: rzv2h: Report the DSI duty cycle from the LVDS divider

[1] https://lore.kernel.org/all/20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-1-47f23de6bdb1@bp.renesas.com/
[2] https://lore.kernel.org/all/20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-2-47f23de6bdb1@bp.renesas.com/

Geert, Biju: I would suggest taking everything via renesas-clk
with an Ack from the DRM side, or providing an immutable branch with
patches 1-2 for the DRM tree. Please let me know which you prefer.

Cheers,
Prabhakar

Lad Prabhakar (4):
  clk: renesas: rzv2h-cpg: Allow MIPI DSI to reuse PLL divider
    parameters
  clk: renesas: rzv2h-cpg: Add validation hook to PLL parameter search
  drm: renesas: rz-du: mipi_dsi: Improve DSI PLL parameter selection and
    cache results
  drm: renesas: rz-du: mipi_dsi: Add fallback CPG PLLDSI parameter
    search

 drivers/clk/renesas/rzv2h-cpg-lib.c           | 109 ++++++++++-
 drivers/clk/renesas/rzv2h-cpg.c               |  15 +-
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 174 +++++++++++++++---
 include/linux/clk/renesas.h                   |  38 ++++
 4 files changed, 300 insertions(+), 36 deletions(-)

-- 
2.56.0

