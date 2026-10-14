Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC6D5326B5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985847; cv=none; b=UvTrHs9nBaf11QSXFjI+gn4NpagnbbinXgCjosUDnbGsgF4vl24z88o3C1b/KtetFeobntJm8mr5/dQloS4ApHSoQxZkwy2IJ0KN2Ftgd/YuWbLYCHl3PTXLwgXmcqaJA9Y/yK+EqToT0FeQh29c6ryd3yZYVNRBPzZubw8x3/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985847; c=relaxed/simple;
	bh=2u2WHm6h5dWueqS1DRd6QBk9AYdbijDDY/d4tGX+N1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n7+rPOfY18x06BzTmf7G10307T+b2Yt8mAJnIVQKI0llVmiSyiYweLnOuB6raokrV4kRkaashVhVJN5ZkFh7rGTSeA5UFGUQ2inSyPMP/STfYg0NhIjIHb69Hj29ffRsJxLJyel9zV96SSqxu/V247oG/CyeHI4B7lNQA/E4Upc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bF/29187; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bF/29187"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-886e61fa30fso1489245b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791985844; x=1792590644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yas7S2ptUyRxsl5wgGVtE1bj+Q7zhE7wRKK3MWjRWrU=;
        b=bF/29187Yie/oLFVAyFtQwu14KbkCL5SNdWNAB9TJEYV8jjmu5dlgEYvpkVG9ZKgln
         ne0nmXlxh5rtFtc/WplLm8kMpiSlB3Ss6K4vcsHZue6W0rjjigFhw84PK5k4ibGQIOr0
         LieEivN1wTR2m2UC6cU5ZEuCiWLN2H9JSH5lw5DtLW9t9BTda9cPn38J2zBUUJsUBUCy
         tLrVzqLYCl8m/v2YDImLZ1ti4gwuJ36DobiXTOk/Ud8fEgKTs/zMJ9+7hm2NhVvgpz+J
         ynSF5D8YDZcp3I+g8VVd9oajfk/H0aC+CkwIjIyRzhzu28gbAAx8UuYMxhsu+HJ109Yo
         2MGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985844; x=1792590644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yas7S2ptUyRxsl5wgGVtE1bj+Q7zhE7wRKK3MWjRWrU=;
        b=sSqxF5lrEBk3ZKd2RGYbJ8/gPARhqFBDVj23lAx230mQ5r3ibbIVT8O82DDcxdBgE4
         i88ZB8o7ADdwfrmQoQuSHy19tdRSedqhpYyjFN3wbwWHDCaENaVIcO/uOKEN+Yr8Blrt
         LdOjCaLBGEELOboMduFxPgHR1oG3+qaH4K89JNbqC4UKyRED4f7Dqp5MMPsjVfO+6HEP
         14NUVgptYPNh7j9uSEHc6Kko7IPuuUH39jsdmDxOLXOhPZyoaI6kDd/oAQzoxItI22sc
         bQSSQWQ6J0Ptev/Js+axRpjVy4nAvAtLV6It34IbfeO/bx0oI/ng0ELCye5JzwIFHxkD
         PNPQ==
X-Forwarded-Encrypted: i=1; AKwUvBynzF8giWHuFHDW3Vqox6GILZ99N6ofmRVHN+buhI9cfZgU3Zakzw+gWYbOVLZY7NissD+1oDkwue2caxE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8XSQm2+BhyccYW3OrtyE8RBcggdromkMMK7OhUNwazzlvv82U
	nW3bcpUwvTbKJeViiAscqxhBB8NAaRmksVHhr1XdxnaCpBbSJuiZsOVe
X-Gm-Gg: AYBFou1qgiBgd99j0AQwkQ8qLoT7hwXBL+lQo6Gji0lf+MV44AAdxPLkXhfvLPAfeea
	DAJNIjn3zeXuW+pSa5HZTutJaUHoKruQNl1O6stiwskL7DuGGZvlOeDQbhCpS/1gvS3Jl7D7P/o
	kzu/+n7TSVX7SmzlVYNgMvrej+TIue8H/hJDipIW+e5nyNNT7c9up0gZPI2m96b/mR+G8JtFgPJ
	juPQPmy/kV/4OJzu+/o62WYn5n4KLSt5sLtUUVSYzSry2bTV7nqiTTECAE5XiM9lPreCySdQitc
	g5H4ExIBC9v07RGEKbKOSMaZYHvoh2UP9FrD8Nt6UrymYslqyXWDzW18zsEN4fNNVYyD00+3tKP
	jN6tCP5ugu4wLNNAeToQXJz5rTD2dpIeDBiRktoAAisVZdPttOMlSGgUM0w6DRtw9GmP+Za6DYn
	znkt56wD7k78KIEyCTDn03kPyJlhep26vTtz8+C52yHBp+iDzvPgU0oADQ2OzQ9bTHUkE7oRKcA
	athyK2iifdqXEJ1Gt7Mccow1cSWc3NrDtcGdnimfd5oOAr+ZsFbc0Ets04Nw5cpNlRu+5W1BRSb
	dPdFGCLNe2EW5VR1niHgpruKVSIdf4x+7XS22GlA2MwgRA5C3YZfAxvb
X-Received: by 2002:a05:6a00:3692:b0:893:3f00:3292 with SMTP id d2e1a72fcca58-897c634de71mr11932341b3a.9.1791985843529;
        Wed, 14 Oct 2026 06:50:43 -0700 (PDT)
Received: from NB150512.ADVANTECH.CORP (2001-b011-6c00-3d72-751d-cebe-164a-ae70.dynamic-ip6.hinet.net. [2001:b011:6c00:3d72:751d:cebe:164a:ae70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804e514bsm1168418b3a.41.2026.10.14.06.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:50:42 -0700 (PDT)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: dianders@chromium.org,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com
Cc: jagan@amarulasolutions.com,
	osama.abdelkader@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH 0/3] drm/panel: Use mipi_dsi_*_multi() in feiyang and rm68200
Date: Wed, 14 Oct 2026 21:50:25 +0800
Message-ID: <20261014135028.1438841-1-hungen3108@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts the feiyang-fy07024di26a30d and raydium-rm68200
panel drivers from the deprecated MIPI DSI helpers to their _multi
variants, as suggested in Documentation/gpu/todo.rst.

Patch 1 converts feiyang. As in commit 00efe8a68565 ("drm/panel:
ronbo-rb070d30: Ignore DCS errors in disable()"), disable() now always
returns 0 so that a failed SET_DISPLAY_OFF cannot leave panel->enabled
stale.

Patch 2 converts the deprecated calls in rm68200's prepare() and
unprepare(), preserving the existing error handling.

Patch 3 converts the rm68200 initialization sequence and shares the
multi-context with prepare(). This changes the error handling: a failed
initialization command now stops subsequent DCS transfers and makes
prepare() fail, whereas previously the error was only logged and
prepare() could still report success.

Doug, do you think this fail-fast behavior is appropriate here, or
would you prefer to preserve the existing best-effort initialization?

This series modifies the prepare(), unprepare(), enable(), and disable()
callbacks and the initialization sequence. It is independent of Osama
Abdelkader's "drm/panel: Use managed helpers in DSI panels" v7, which
modifies probe() and remove() in both drivers.

Compile-tested on arm64 with both panels enabled and W=1.
Neither panel was tested on hardware.

Hsieh Hung-En (3):
  drm/panel: feiyang-fy07024di26a30d: Use mipi_dsi_*_multi() functions
  drm/panel: raydium-rm68200: Use mipi_dsi_*_multi() functions
  drm/panel: raydium-rm68200: Use multi-context helpers for init
    sequence

 .../drm/panel/panel-feiyang-fy07024di26a30d.c |  35 +--
 drivers/gpu/drm/panel/panel-raydium-rm68200.c | 211 ++++++++----------
 2 files changed, 112 insertions(+), 134 deletions(-)


base-commit: 91f52e99824b0beebb48cad51bbda81437af8664
-- 
2.43.0

