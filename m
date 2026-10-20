Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510657;
	b=T1mThwIROliu+n6wqzuQM5gUKY9yGntxYafYH/PYANrCW1GQqux6Ib3OiLVOGJ3xUnn8
	 713KKBhy1AuYZqdyv/yXl+LRKAG1ckMChU5BpGPi8LIXWVxAZ6gT6w8dwJquVlqrx47WN
	 sZZmBJwESIhtQD868mvpfN432tmVIajm8Eto7gT8SpDQODbRsBc9ePBGWKRh1dPAkiX4d
	 eH24G+eXNxNd52xM4sihIIRSfWUOAJTBlwzAB/9nFwSs5F0/I1kycaK4hQZbZQyZHj9zW
	 d5To95TVPF3FD0wS5zmXX2PtzUmtN08YuNFzNEHCcvmoDvAUbCxi8i4a1/K+RcAj5Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
	b=gqscz4w7sUH6v9oeauCUTVGCFq3zLmcN4Zq1CafMFe5wOBxGP6p8WX+ova2IrigUIWNI
	 qHDTTHq5UtTVF+qYgcVsH7GTt8WR9Euuism3VlokgcB9zdKlNGomxHf4BnaDboTxsXEOh
	 WlXQaaYsHQfWWcCHjuZwBKYU3OR0lU+oSitrjwjXtAHgSla/TJrwVxLvw2wgJMb66YF5A
	 L/L3CNzwr/EPzXjoqnhFJSLBID95Y1PLGk/looLJUDJrNWxZcHkqLhzNiaI9NiVmQQYUJ
	 kV0kt5hev+wXdUdZ6NlhaCDLyuyeB0mf6GUu4Lf4kh78RxU2SWe7EMtCJqOz/V6af+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IEWFjXdY;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0866D60A381D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0866D60A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IEWFjXdY
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-366421dc8ebso1152812eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510656; x=1793115456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
        b=IEWFjXdYPvHf1GX8A4uK2ABfWGSlVp/WQdtFWAFPb9xPpTeDY0wm5hQzqHNR0CGNyG
         gw52LIeiYhC9IHIn6FIdkvW2vBm4vC3ehHqZJblz1xfrlYYx/RYysnM2pQ/Y4+etxin0
         IzpXTkMh6gCy2nqoHlR5KxsNg1/pU5B6tIaMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510656; x=1793115456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
        b=mhvltnqwH/iyftdh1Cd+CY7SFax9lPZxewd9jOnsLREOdNvITga6oayInNJR+mx7MO
         X6eUu+gq43sSEL9js6W1zfdGyxuCKjkIQJPoF8rJJaTkbqMB9q3LgPLfIQG+/jftpouO
         Px/js4/SvI2MTwc0KcJz8fLdTzQHYBlVAZDWoR8qpxDPBVF7xOUBVna3UM2OlCoiKi6+
         9kNJeogSNNA8S81Qjly5B8FgBO+uP/BX5feDkV2UY3yCq1sURUsxB8SSkRVgVEB493ks
         tnzH6StPIktvm23a2KHxeM5+Kp9moUD1ON8pCrPUOJroqfAxxGfFlu9aVt8cTmqyM7Hy
         bNnA==
X-Forwarded-Encrypted: i=1; AKwUvBwBTvHByXgD3WVi7iLWwMQwBy0iSc9RnFrCT44QNI6KQZSpD+jXGgz+7+r80nxkqMC0Es6CVqV9cRgqrXI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2osirVHJ0DqnIsNhKmRtp1ChSbFisD/3zYnp7nnkan0Om322Q
	A4qFPOg6pW0IcLNSzSq/CPmow56jz/QASFh6Lnw0pFCpHgHRqPJk7pUmzcdyI0irlw==
X-Gm-Gg: AYBFou3LUzreNL0w9PmebbAcVVBP9y3YS9NOv6mdhEvoJVm/ArrBnWBJITCP+ckEJsm
	W87ks3DYYwSYMzQF0FgSZPZQVJhUqgnedJkaR43eYantBGxR1zm3GheOxkXcrfB5lqeAc0J+jow
	Hp8ZagRByTyqija/9VXjhQJdfHSRHYbFvTMyfcJw1bwQKqOri2S4acny9cCToWijNM7Z0Bx+WAG
	KAajzUDvrTqslg7GzACVMvZ3FGBn7nCtRj66mPe7ZG9MXRMCGwAxp/KvL1+5TRP6HuHYN3greS9
	bxGbVfP/I8r5fdrLL81oLppXsMLSVY677QpOMEDVUk8QILkHYPDu2Y7VMJzwZT6uhDDZGIaSpSZ
	p4jzxqSEZypCzcW6E+9ohs+gePtJeJOmPqkn2cdLC0kXuS8cHYctG+pMR3veWPue4rIlBd9RVWy
	DmOJ3vUr6kdP2+jACGK/N6PyJOPbs5rc+rdr1djhsMWdVoWgTRKAv74UDuQw/At0qgWGHl92etA
	XpvT3ez6ZoPpNOhSY5yCAbuREfo9+hWlHCDLUiuQ0EfZUdE4Q2ppX5089c=
X-Received: by 2002:a05:7301:1408:b0:353:ba38:789d with SMTP id 5a478bee46e88-365f53e0019mr2964076eec.0.1792510655681;
        Tue, 20 Oct 2026 08:37:35 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:34 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Devicetree@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 3/7] scripts/dtc: Build fdtget and fdtput host tools
Date: Tue, 20 Oct 2026 08:35:21 -0700
Message-ID: <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
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

Build `fdtget` and `fdtput` alongside `dtc` and `fdtoverlay` when
`CONFIG_DTC` is enabled so Kbuild rules can query and update properties
in compiled device tree / FIT blobs.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/dtc/.gitignore | 2 ++
 scripts/dtc/Makefile   | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/dtc/.gitignore b/scripts/dtc/.gitignore
index e0b5c1d2464a..24357adc8896 100644
--- a/scripts/dtc/.gitignore
+++ b/scripts/dtc/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 /dtc
 /fdtoverlay
+/fdtget
+/fdtput
diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index b47f4daa4515..6bce3542d8a9 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -2,7 +2,7 @@
 # scripts/dtc makefile
 
 # *** Also keep .gitignore in sync when changing ***
-hostprogs-always-$(CONFIG_DTC)		+= dtc fdtoverlay
+hostprogs-always-$(CONFIG_DTC)		+= dtc fdtoverlay fdtget fdtput
 hostprogs-always-$(CHECK_DTBS)		+= dtc
 
 dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
@@ -10,10 +10,12 @@ dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
 dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
 
 # The upstream project builds libfdt as a separate library.  We are choosing to
-# instead directly link the libfdt object files into fdtoverlay.
+# instead directly link the libfdt object files into the host tools.
 libfdt-objs	:= fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
 libfdt		= $(addprefix libfdt/,$(libfdt-objs))
 fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
+fdtget-objs	:= $(libfdt) fdtget.o util.o
+fdtput-objs	:= $(libfdt) fdtput.o util.o
 
 # Source files need to get at the userspace version of libfdt_env.h to compile
 HOST_EXTRACFLAGS += -I $(src)/libfdt
-- 
2.56.0.212.g129ede20d9-goog

