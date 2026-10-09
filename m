Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE593B19D8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565043; cv=none; b=WFVokcEDLBgwr5Dafr3H1w3YO7uHQjXEXLSz6FjEVDLINvubwkzyt1w1lozMq6ahS44g/7M8V28SYFXS1Seh11ai7dkeCzsgr77JboLim7lToXZXxS4v1xLqLDkTjV+xpmU5CsrU+Ku4RY3nO0Spgp6DTKYu9wTZx4SQzHg3bsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565043; c=relaxed/simple;
	bh=rZC3wFfLXh3OFzPBUj1DGSKdOdSemuPa52aNnHQOy6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7t38bVLwe/2AmrUif7nivqpcv7bgW23B1VwByddeqRh3kIZ72QvMoeekpywCPP57MVnUon4M1FzaCa+2hY56fwom3+yuugts+cK4W8FJ4L15UsDUH0Do1kCOqg/2iwF70l6NUhCgp9u9UWfbgCTUjHCXXKqheijfhe83cupB8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJfUpuCy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJfUpuCy"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso608865e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791565040; x=1792169840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWjLqKk0yqxiAbR3S+njyRWfevFYpE6Jwgag5MCgj+8=;
        b=nJfUpuCyTg7HLVCaZ5rL9xWznR1eWLvjrB6ldS7Rr0wVuLkIsX8RYyQ4uEUIkzVmkb
         eF+otPdD6IRv/UNbA/zUHvYyqiKR/CR1TZAxq3+Dymu8QTcwtt+80Xuq+U6XtF3NlNRV
         Bj0rFM0D8xr9U+DdD7ia0KYwTmBjzHGeYA6ya3OaxSkXrJ85cNJ1WkZeKpYFEjrDlnVp
         v3IEQDj6JC9POJldyA7CZSfSjpUv+olu1sxhYOk4T5An1qJUWWsq140O72J6u2mV8coW
         iAijmO+V1noBlwNxvvDikLhCHL8rIQm0Y1F5rOX9RUMpQ1DtE5sKbEVGZyx0mZah7T5A
         uqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565040; x=1792169840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWjLqKk0yqxiAbR3S+njyRWfevFYpE6Jwgag5MCgj+8=;
        b=nixU8pR1LvNGBdGSdy8BVm6KOwbCCmgUUtmMPpkAe+smtMnl8isUoCzOIHzXMNdGY/
         +tfgmZovMCgw7JuNf/XkYKva0NwbyjzS+hj6GX+SPVhtSMaFK85loMjgmRM+2odWYKk0
         SFQ95rVmTmRRFX3HySW3MbepEl1y9NHeiTJ363AyXjYkIuHS9efNtVxrnxjByBMQa/Rk
         svN02xJ9hZqkoOl2XHQenmxYVVCmwtCVwcNcn8Iat4fyyFvpWyLlX9/sCNj2h7Y5wuiZ
         OGAGokFeyP1fiusObQQB1WP3r3Cm1jVqBAZB3MYpyU+9h2pWwwrpGHVdJEkE0n0jJbYv
         JYxQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6mLZ17nO/QnOs/hpLCHmAH8AGvp4ZPPk/48VO4778k2R4GpKbVAcDB5jJomQWzZjr6Mk9FFG/EuevBgA=@vger.kernel.org
X-Gm-Message-State: AFuF++nHzDaV48l69NRGoi6L3GaOooMdbBOcaJlwOBw5xUHrF1QCYrfJ
	KdVNhIl3JJkcaqYhe77G3OUpRym6zzmIbnckWKroKtptsKcsffFiJuvJ
X-Gm-Gg: AYBFou3pyuynq1mq/9Op9CZ9L5GooLm6Nrruatqv1UN4NvjK3F5SH9zuagb+eqjFqAd
	bvRj6ElUUaYMA4xJTlFXy7IfPCJgUVbm2r5JlOLocA2G9E7VqLRJPGqpqExoVkMuYDL2g1DBFYz
	dOBSXJKF9zdA6wV5s4j740clO8NKMnRS9mYJylswlMKapkabPN5bltJ3B6YmMmzcIo6tUSSS705
	8gqPa5c2ROf9lO1jNVkgT+7Q0DM1t4xSt0CFDy9jYvI7Gjbh4ba1NGMxBo/Z0qCoLe2FzLbdLbJ
	SXDQy3klH36iiXPYCX6s4TarfAhaWWpOh47+YcXZdALM44cZFpXNax4+1M+lbwSBvZi9mLezpKq
	7SdZe5Jdhn7g+szjtYLbYqZ6wX5XixwEpl5a78vWmo9i3uF2DaHFOtzCFZUlrB4w9u2AS2Z1PRT
	tRqja/cCrdpYpGRdKbdWiKO77NwAzqmVsIj6y5hlR3W6zk3kJgWrmO7UNFWuMvEveMXZFMlqbBw
	asbNvLBsMiAk6w4PUxPXZCdToXPjtr3aYqXEyvLdEvr99Q7Y3HDhZBXDV5rYOfEreYBrkWXOoft
	icxSxnXAvX61vQO5+g==
X-Received: by 2002:a05:600d:82c7:b0:4a0:17a:8844 with SMTP id 5b1f17b1804b1-4a18e446454mr54043755e9.1.1791565039988;
        Fri, 09 Oct 2026 09:57:19 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm70667395e9.4.2026.10.09.09.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:57:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/5] soc: renesas: r9a09g05[67]-sys: Instantiate power sequencer auxiliary device
Date: Fri,  9 Oct 2026 17:57:07 +0100
Message-ID: <20261009165710.1320233-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On RZ/V2H(P) and RZ/V2N, the SYS_ADC_CFG.SY_MSTP_ADA bit controls the
power state of the A/D converter. RZ/V2H(P) has a single A/D converter
unit, while RZ/V2N has three units sharing the same bit.

Instantiate the power sequencer auxiliary device for both SoCs and
provide SoC-specific auxiliary device names so the power sequencer
driver can manage the shared power state across the ADC instances.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change
---
 drivers/soc/renesas/r9a09g056-sys.c | 2 ++
 drivers/soc/renesas/r9a09g057-sys.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/soc/renesas/r9a09g056-sys.c b/drivers/soc/renesas/r9a09g056-sys.c
index e6a66688423f..3895583fde07 100644
--- a/drivers/soc/renesas/r9a09g056-sys.c
+++ b/drivers/soc/renesas/r9a09g056-sys.c
@@ -86,6 +86,8 @@ static const struct rz_sysc_soc_id_init_data rzv2n_sys_soc_id_init_data __initco
 	.revision_mask = GENMASK(31, 28),
 	.specific_id_mask = GENMASK(27, 0),
 	.print_id = rzv2n_sys_print_id,
+	.pwrrdy_pwrseq = true,
+	.pwrseq_aux_devname = "r9a09g056-pwrseq",
 };
 
 static bool rzv2n_regmap_readable_writeable_reg(unsigned int reg)
diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
index 308492c31acb..b9def8dc73ae 100644
--- a/drivers/soc/renesas/r9a09g057-sys.c
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -89,6 +89,8 @@ static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initco
 	.revision_mask = GENMASK(31, 28),
 	.specific_id_mask = GENMASK(27, 0),
 	.print_id = rzv2h_sys_print_id,
+	.pwrrdy_pwrseq = true,
+	.pwrseq_aux_devname = "r9a09g057-pwrseq",
 };
 
 static bool rzv2h_regmap_readable_writeable_reg(unsigned int reg)
-- 
2.55.0

