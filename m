Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784935;
	b=kwgmdMl0ZkBs6a/ZzbchF/ygLzueq9uJ+Rw7n+WfBB02fpz3exVwJTOyJdB7bVrvJAWv
	 YEGH5C985prgUHyqh8oVK3RB6O3Qzzud0nwTa46ioo/ioBYiwBilYS/ZgXlk2UF4Jwj5b
	 ctq5s+qZIwt3ArXbE+wD05LTNI0a/Uu1wdlyrCTncxWiFKUUReOxtmaBGGkE1fR9U5K+0
	 LWJx8ANs+t+/FaMyyzL7XUBxxanWXi5CxdZxr8xNJxL201AKGlgtZkLpRoC0CP6sUQfTu
	 vIGzz5ThttD6onXCI3hZr19ZcDm15DDEUAzYEKH3/21lzy6e/tchO9AdtL7sR0sTSgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=uREsKIEDczdDVdj720bXK/T41S+3ar5PxkrrHsI/TEM=;
	b=gC9nYQXiUEopOOPQuJrkT87VeXJEneUaR+Ca4JL/80rwJ2jqbI71oAjiAqVLQRaH31xf
	 Lh7AS5YNpIt8ASCwrwiN8oln0ODyCeb/WFB1KJ2rBOQJ72/Qb3XcY+Qu0vaUKAugiWeeA
	 Xdc+oMWlkCFDU5iIHIyhK6nHRZ2quvzktkvrqCfCAIxHskINVFk+s/RFMMBhbhPi6TdF9
	 lI5ECArhuqZtQgCjnWDkteetCR2HAa6pR3qJ6Cb0QIMDB5q8rbiF7PWPruNMSkwxQBaRh
	 nWvieeqA/WvSAzxbkxC6O2Ezg14LW3T89lFZswlbjFrsQOLradCclT9j8PIXrMq+6vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQkNrinm;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7A3606A333
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF7A3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQkNrinm
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so1645675e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794784933; x=1795389733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uREsKIEDczdDVdj720bXK/T41S+3ar5PxkrrHsI/TEM=;
        b=jQkNrinmnyiH3DT7YlgTu03VUyhi7q9DOquQaVlWG2jLJQvITuOTfMsr31WXFI+y8G
         +Ms42TCNfD1X8Dl6ARmdwurW4X+BahBcgVm8UHxkrzd8kxbab0jv+ZArjfC5id5O4hdm
         GzWp+0uOyvdUhTypeyVI95yeEE2pWqOZXxXXhi8gCTsDd6ZjFC3cyM4MtwGcv3j1c2E/
         I84JM9NZjz4EQwQzv7fYTqHIxRyZ1rZX8ReX7qzYdCxIqdLajnu0wbev3sqsM13aXYpO
         PG+kJApuGBCqeDWtl3PDAywcNnmBGGlKcyWUwatKPfe9hZBUeNTrDbGmpnHeB+Dymb9V
         upkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794784933; x=1795389733;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uREsKIEDczdDVdj720bXK/T41S+3ar5PxkrrHsI/TEM=;
        b=tuPE6E8LspHCQwNG/rAzvvzX6roGt+L3G/jRAGfR8IwhOXLMoJQnj7wZt884RijR66
         4Co/sdiC32XIszgryRG1k0yW4dl4DK8MzSoe4CjWdLIUItxm43zlFnGkE65IsLWWUEjy
         YmOP9PKbbZb/Wg/79NtkvEyVa0JUxAo26HqUPkBVGrIIzM0IH9ur46hTnedSUr77+Za9
         1hD1UyB2s85Unz2ofiWsbSf8Ebwsp2pM68zPdrtUgZWZA3OAhQlLM8PH0s+gr8mllyD1
         Dd/o51U65+c85mA4PJCZFyQYSqlpCBWLcXtBV7NEfEFcP2g3bRsTBzFFJ9TApLfcyzJs
         otLg==
X-Forwarded-Encrypted: i=1; AL+hErHir2MGfYvIwRT0LSXJkqtRFiSFeMo8JObmgcuSqguOPF1Bq5YYfFABICEWfVPGU5PSulD5M3Q06TyTCDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8unTXnJ+q3pu1p1g3dsxUIH+a5QbvI44gzMfgRwCCm1AqB5Y5y
	yC8FYE9+BNGJadbgtoVFi+86225qHSJAg9Yd03C1qPpKjHcCWp5HUA5I
X-Gm-Gg: AYBFou2vREPGJqm//amJ+Ux0b6SoIfm6Lfg/hJj6C1TCNz6aHBVf6JUylhZ8C7QaB1o
	FxWYAZg6B5cr8DHDlpcahrKJ7C/W1NIbFiFmbLCRJe0fGmpKTwLdwWfy03wxFRFLtGlUwynWqd3
	S5VFcGLrYcDS47VIWtQzeL48jvIw4hlx4tTrfkK3i5kRWSP70YfQ10IVvQu1iVHQw2FGn+AZYr6
	zCjWSaX0DzSNevFEXDFctUQVhnGAYpz5CVzr1RvSKGdEzsEvVJVmNrIPkCmhCveCRJ3bwYYfBck
	cbl42BYlZhYCv0mRs3+IavIU2VejmdZOA8OwlbNbIJWmP3ENIs430kRV4gpEWWg0fsnCfah525I
	230ZCVInlhh1nuz7xLodx5a+FG0EdqOPkFM0Z9HvoDxWpd0s0K4YTbmeL04WtQpR6Dc+/YoRQWa
	ecBallB44Iv/pX3nlOWd7JenjRr3C+pmstAaRLh7Be2Hyg7ftYQrKTXXU0fXoy27aY5jtpEUeWr
	bZ9emK7lTlJ/yPwIRMZ1YRLJOfGubrJVbCj9sWoMdXoekr0fslpHqwvwZFKrBUExWQ0aUKVIqjb
	YrrJazfiGpmvaI4aRBCehG3Ub4UTCNppst64MS/IbvLaE0m4l6iWGNQ=
X-Received: by 2002:a05:600c:34d5:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb55ab1610mr175771075e9.26.1794784932986;
        Sun, 15 Nov 2026 15:22:12 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm127920955e9.3.2026.11.15.15.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:22:12 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>
Cc: Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	linux-efi@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/6] drm: docs: remove bootsplash from TODO
Date: Mon, 16 Nov 2026 01:21:55 +0100
Message-Id: <20261116002156.1027726-6-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261116002156.1027726-1-maximpedraza@gmail.com>
References: <20261116002156.1027726-1-maximpedraza@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Francesco Valla <francesco@valla.it>

Now that a splash client exists, remove the bootsplash task from the
TODO list for the DRM subsystem.

Signed-off-by: Francesco Valla <francesco@valla.it>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 Documentation/gpu/todo.rst | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index e6d36f8da086..5e987e18bfcd 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -756,23 +756,6 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
 Contact: Harry Wentland, Alex Deucher
 
-Bootsplash
-==========
-
-There is support in place now for writing internal DRM clients making it
-possible to pick up the bootsplash work that was rejected because it was written
-for fbdev.
-
-- [v6,8/8] drm/client: Hack: Add bootsplash example
-  https://patchwork.freedesktop.org/patch/306579/
-
-- [RFC PATCH v2 00/13] Kernel based bootsplash
-  https://lore.kernel.org/r/20171213194755.3409-1-mstaudt@suse.de
-
-Contact: Sam Ravnborg
-
-Level: Advanced
-
 Brightness handling on devices with multiple internal panels
 ============================================================
 
-- 
2.39.5

