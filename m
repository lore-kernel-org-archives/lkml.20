Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A28179A3
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226168; cv=none; b=bbH6bB/6yry3Boiu79NLislaBD5LYS/uYClsQivyderzJ1p3Cg6NsDmydOX8ZARjp8JBp7PcoxHbml4QwIetsKWB0RdmlACaAiqs31lyCkSSG/sSujNd9mz8RwJpug4FBOaMP74cjiC8bBSp+/528UTJaqEI0yP6oHi3WPEdRfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226168; c=relaxed/simple;
	bh=RtCye4OYr+2e3wcQltPUd/mx5SOGyuXm6AFbqyk9vo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E60uquQfj3CNqAMVPiMNqD8Iu845MF0RrYxZCpjNNVEvxw9d2jzAhx1M+rSLRve5KbT7AWNGYpATcYZvzvJD2wmKwyOb/MwMydmXJsMTndOTvwRHmJUB3ybbdH97LrQz51qaCCpkhNz3hKEoPDFJYFM4+qDTJdzjN3yP8gYACPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlzoV/+V; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlzoV/+V"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4821449so420007a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792226166; x=1792830966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Q8IZ33W6NNgXpiE2H7gk1DjA4QMN4AQzf1Ck9B7ifM=;
        b=nlzoV/+VZDRgzPhY0+QeuJDgDsAkDUnBfuugqLTJKZ60negPfaGJlvnRyKCo3k+wR+
         tyoMMkZXf6/Ig2EjFgfnOdNs1vB2AyrIU5bNG1gMy1mVdZl6/7DzyYy90gH2CIWEPhwC
         lkttDZqbvtNGn5ULSaw3YAzgQ1VL0dRXSXd5JP+YF9ynNimKDxMC/2tyivq+isdcmhv3
         ZFqDdhk5dkHS1da0/OE8EGBRSiUHK73r/U3Yoq+yAnRGfm3tW+wwRp+q+Nf31fnIDugs
         FlvYTF58AJV7R0vDp44OhZMSde6nt3qNNq9t1RrEm9za6oM+jqGPh/TvbE+Z9J8KeC4J
         wCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792226166; x=1792830966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Q8IZ33W6NNgXpiE2H7gk1DjA4QMN4AQzf1Ck9B7ifM=;
        b=nAjG8pS6p3/TVjS6o9xWVjFXomVLqevvaZ3tQDK9cmNV8eahZ1JmMEV14Seh23X7LC
         Zz1dMUfpi3mmiKZ9cERoTEqXEWZ6aVGTuwX3ZFtwp9klscPM6Xu4psbNP8Afv90K6V8+
         bakxAUzn+HWXyPPMLzCm60E6hh2u3n+46VJbSVYnf2xH45sfx0b6U25EUioAeaDTo5zW
         /0Tv9fwCR6iT7nDzkyFFV0FsSsFIEXY6pSZqZTITCjTjBd8syvMPJ3FZtO7ZJYBePTDe
         RBNVTm0sWgqMR/nEaofXLh6UWGF0mWZi9/dMe6injnilR9Vz/k/bjMLVyvOhRDMTY4jA
         wRKg==
X-Forwarded-Encrypted: i=1; AKwUvBxGk9p1M2dp0Z6Bqn7UQEc1+NnUw4ty6xHPMSaEDfqz7SGAguJOk8ffBNJPtzRYopR5Pw2OTNc6WrCe2YA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIac4qYiN8SemLgx6fmAEZU6A+EDeDdpVWezJ6bvqZhktyirUrA
	HKf4rH8YL4n0cPIhjZ+3xYj4WgLp3MtU4Rtq4XKQwm3CQgoHwNrWJBSjjuFp9wZU5ComRCFY
X-Gm-Gg: AYBFou0AHf/nofbmU1LRNurNeRV0d+QTfVKCvyqdtlmbIdEoznfkzjzLmVa6EDL0RH8
	RnTSW71aK5+YniwfCwZ+hv7sGCYDw/e3DAbjOcF8LBDRRpuK8cx/pUBIY5qfFbDl9GZCLaC4rPm
	bJuMdhcyyWUMD2939rkBjTZQg+NM6kjw6nF8Erez5elLi5c2LQ5Uwu0fy9jVDzf5L7VJ5YTY1NZ
	8ot0i6oaZlECryppR9q1pNHV0zEqvTyqW5MVrxRzSJSHd7GkdJ8c6TAVg5P4EQkR4JOyL0AgbiR
	WGQFEjxiJSZBD6PWnPnx3OejK+GatKNN5igK8jY0OqgZV3AAl5zGcX19ZX9TmHN93VhwBvjDFJl
	nF7fMPaKUtyhGsl+CNfQcEPUkShdUAMSFb4l+Qbo9xmFabgbolfdA9k2ab5/NZm1JgjvVfk97ri
	4HKI/R3LFQeUC2XDFgf7zghtFtqpkbtKcqWVM1Ar8tjb4g+YkLIHjTrQ0=
X-Received: by 2002:a17:90b:5111:b0:3ac:a521:960 with SMTP id 98e67ed59e1d1-3acee2927aemr1967627a91.1.1792226166418;
        Sat, 17 Oct 2026 01:36:06 -0700 (PDT)
Received: from Linux-PC ([2a09:bac5:1f0f:3141::4e8:8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9461d71esm12548544a91.7.2026.10.17.01.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 01:36:05 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>
Subject: [PATCH 0/3] drm/panel: Add Smartisan TD4362 panel support
Date: Sat, 17 Oct 2026 16:35:28 +0800
Message-ID: <20261017083531.766557-1-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Chen <tianshi12127@gmail.com>

This series adds support for the Smartisan TD4362, a 1080x2242
command mode DSI panel found in the Smartisan R1 (trident)
smartphone.

The initialization and power sequences were converted from the
downstream device tree with linux-mdss-dsi-panel-driver-generator,
and the driver was tested on a Smartisan R1 (trident).

Patch 1 adds the "smartisan" vendor prefix, patch 2 documents the
panel binding, and patch 3 adds the DRM panel driver itself.

Lu Chen (3):
  dt-bindings: vendor-prefixes: add smartisan
  dt-bindings: display: panel: add Smartisan TD4362
  drm/panel: add driver for Smartisan TD4362

 .../display/panel/smartisan,td4362.yaml       |  75 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-smartisan-td4362.c    | 263 ++++++++++++++++++
 5 files changed, 354 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-smartisan-td4362.c

-- 
2.56.0

