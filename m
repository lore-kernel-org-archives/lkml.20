Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1958D56E051
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088589; cv=none; b=Y7NmsExr4s6ivKxBO/NHrnmHXeR/mMh3v/czJbKTbp3W1Uu5WPhFuzj4E/Bejrh8Gml/tDnzoL0ex6VgCvDi+LVs/kDgnsOS+7Szcy4o/OOsN89wI8hiEGs366X99rqj3LD2vuXzOhz6h6m+4ROMmH+9docgX1WHkwvtpaYCuFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088589; c=relaxed/simple;
	bh=141w4atlYroacLxgjGyINyQC13zsX0zf7Nm5/ty9B/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nkgWnytyAoaTGtVIDe6DeTmRtw97nPNEBKZED8nCpTOdgumm/Kk0D3AB0lPE8Aiz5C/4jA4kXNoOaO1BCE+PBrcWJmLZ1f0OIN+z545nNw16oEXWl7rjqUzCF0++8vosLg2603gGtHvhXH62rWZnooMbQ86l4oBMII1fe8hP+ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BNanEG8K; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BNanEG8K"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-17bc533fda3so2600236c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792088584; x=1792693384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DG4aA9TEdH04EQSq+KQevC5W4t18y00GnPull2P8sMI=;
        b=BNanEG8KIjUIiGEUJJpgAK2k2a5L58o1DTXmAgYCdV7+MuNTpiMbYyGX1B6H1pIVMs
         W4QP4t2guX5bFp2PKC+eszz+0nPXE/DIIqdZkWmbxfwlUOdp22id3TMeucsz8+ASHDpc
         vUen6CPlJ96MeL0j5uOCiWFt3ztwLgQOXCnOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792088584; x=1792693384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DG4aA9TEdH04EQSq+KQevC5W4t18y00GnPull2P8sMI=;
        b=tYAx6KxR/4Yamov5JBmr6kZ61RBJ+m/BFf1ScR4kQDWT9JE//425IA2YAy4I+M4Z8a
         3BvGBJXb8DO99Hu+daBmgWLQTmueKZpGJ4KviA/In/3tgcO6sNpdWeK62LXTVBEREhnV
         DEmo0m/gnxgwO1hjr0HfXSh5A2NS59GiziA22ybjOLSG7C2E0ApRQMVq+v4O530V1BRF
         HSIK4OVC9PKHJtnC7u+S6+Fcct8WnfBFM4MN/bXAumiCanDG5G8MUl2J03HygKDrDrrK
         LGgfvYFEW3AlTjm2p1uy2gd7tM2vmALpDl6US6y38T3rA4QaMickekU9lV812/qo3P3C
         XC9g==
X-Forwarded-Encrypted: i=1; AKwUvBwdgRjGa2XbfiseKa7BovBU9YLIhcHYH0XCkq+yXqpcxtjALYXYHT0z+II7/4sTW/4tj6vqRRX4oAQpLYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfyLp0c3m0Ip2C792AmK1i3ckPGb9TqVqe6KIZ+RgwatK3Ox3h
	YwRZub8TryzkejiOCw/yOHLZ76P3Oaw3UunbRj+WZSy1DkogEyRpn67wRD6NRD+xbA==
X-Gm-Gg: AYBFou2ggMTiTZQG2imA+02lgnB2tBz43rgfFEqXQM4cp4nmXy3w5CpTc7DwMF7wYmW
	JlSSOtpXYNQc3SKJzywv61l/f05UQUsXJOkfojVeHDbrACHGKq8wBCUDjdS1b9OslEhoyjSGK8C
	HoQgDlNegaw1fV5RwpKcBy5ls3c0v4RRVD6DyIhPf1/W3gauw6fdDC/n/N8v384ZoZqa/4ujUxT
	Qedmw5LVIy4CI1X95TI2emh4o4U2pV+e0iCY0CEDsE+KQ7jhCOPf+HTcmNVbvg1ljn6kZcT8S2j
	Jsi3Jzm31iszv2CI9R+Q98u3GAWsdsv8QikXhY/woI8pQxP5QwJCw/4vwtAJeoEsKoTjxBfO9mm
	64n55OarMDnssSMxUfqqWyvJwRnp/jjvwmgnvJvCY1Yh254zgVfUe/wpHwRbfK4FmTL3E5n6Vxi
	DRU/zZS6I2iwc5DXiXmyKcHuPZFicWq039j0CThDEul5aEUBMCR3aO034Prud0ipgpEHZeeDHsP
	wHYshLnBAmbqiGAuxEHCsDE0bTUfyHIfavqUYcU4UBcW5yJO7f15WG/fQXW
X-Received: by 2002:a05:7022:b0c8:b0:147:a685:912d with SMTP id a92af1059eb24-16a60811e7amr22989727c88.29.1792088584004;
        Thu, 15 Oct 2026 11:23:04 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:9ea0:3a29:323e:5f11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a8a4a56bsm727204c88.20.2026.10.15.11.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:23:03 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	Devicetree@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/4] tests: Fix Python test environment setup in meson.build
Date: Thu, 15 Oct 2026 11:21:34 -0700
Message-ID: <20261015182221.2931742-2-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261015182221.2931742-1-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ecb21febfdd3 ("meson: port python bindings to build natively via
meson and meson-python") moved the generated `libfdt.py` and `_libfdt`
extension module into `<build_root>/pylibfdt`, leaving
`<source_root>/pylibfdt` with only the source files.

`tests/meson.build` was still setting `PYTHONPATH` to
`meson.project_source_root() / 'pylibfdt'`, which only went unnoticed
because `tests/pylibfdt_tests.py` manually inserts `../pylibfdt` into
`sys.path`. It also checked `if not py.found()` instead of
`if not pylibfdt_enabled` when setting `NO_PYTHON`.

Update `tests/meson.build` to check `pylibfdt_enabled` and set
`PYTHONPATH` to `meson.project_build_root() / 'pylibfdt'` so Python
tools invoked by `run_tests.sh` can import `libfdt` directly.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 tests/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/meson.build b/tests/meson.build
index c6ac2d7f8ec4..c25500606059 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -114,12 +114,12 @@ endforeach
 run_tests = find_program('run_tests.sh')
 
 env = []
-if not py.found()
+if not pylibfdt_enabled
   env += 'NO_PYTHON=1'
 else
   env += [
     'PYTHON=' + py.full_path(),
-    'PYTHONPATH=' + meson.project_source_root() / 'pylibfdt',
+    'PYTHONPATH=' + meson.project_build_root() / 'pylibfdt',
     'NO_PYTHON=0',
   ]
 endif
-- 
2.56.0.176.g3575e65682-goog

