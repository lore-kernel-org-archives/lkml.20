Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556412;
	b=dTkVSo2/rL2NNiIhLhn2sMpWBvaeCiUV3obkcb2nWzH7TitCJ1+NjlzwuTbd/tcZTafH
	 Fm74Vzm0K0TIlNkgFUNmvFBJUIK/Qa3T0X5Do2/IVpnoE/ewweeg56yUZhubJdzTCwQsy
	 A8XCWqXtjxWBI+Bf3/26tZRQ1XvzgBYRSfOQRj3Kx1BvureT7CnB/s9k2MCuqMDa/edEy
	 QYgxQhZERG7oovLf0ICB1DnC8V8GsTY9IpTpI/v2IKBaBd20PeaHq8pTO3jk4nczhaZBM
	 0fDR9CxhdQ9+9fXTerjT8n2BQLx5J3MPylPctFp5VT8IEyS6K4WXBvJZYrdZm6JBjdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6ZUV6tRnKnS42LZFZBhlQJ+eFn/2hJ53H3jt9WrofAQ=;
	b=EW/nJsAWtl8PgDY3ND6zTbfoS/6E9jv0G7Gb+En35XzxegjHeSv0Y5k5isceiqW0r5cx
	 33qRlNF3dqJfJ/Qgh9whFa1vfflmI3tHNP2Ar3svJKlDCuwGiF4N2rmZQ8zjmrXs/ic10
	 TK4cQirCV+b7dvxlgbeA1Ohl/0SfLR+NDeNCLBzBbIMH2PlQp/UI/pe3uFM4oNWMJwlnd
	 cAshxy0X+Ia8EhtplZjax9hQmoQmACqO/Q/9O5pHWOftftt4j6vZHtTT68aorOsCnu1P6
	 twY3deanzD98JvkXcsfkD4N46PdUR8L59xLI/bFdeEuurxCSYP5vl7BNc9KhzOgH3Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zCIeO/3t";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3BF606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE3BF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zCIeO/3t
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so298987a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556410; x=1795161210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ZUV6tRnKnS42LZFZBhlQJ+eFn/2hJ53H3jt9WrofAQ=;
        b=zCIeO/3tWBtEJ+HcJurCtTcNKd+pFHTImuxVmC4c3rsK/s4V0ezP803UdCxi+9FBtH
         yDtGJQSJ3Uc6T5ka2mtyvtL0ZxUbPBovEO/VpWbbP4yVdz04EvwUJSSqvirH6/1RXgkz
         gQojcop/mmFaZ0iVSQWu/owve6UTY7ANo0DWhv2puKZzy/aKXDs0iYNnYzmvR1dM6ryW
         rfaSRCT0AygKXfKpoMa+wqdCeAHeMlTZuUvU3hwNaK2rYldXCHxnW8nasUtJab0d2ER3
         lpuWvqcmckzcc+eZi1zwMBixsIGtVNhZ/thglUmls2yoB31+eIgY4GUFgcFTeWtU3kUq
         HL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556410; x=1795161210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZUV6tRnKnS42LZFZBhlQJ+eFn/2hJ53H3jt9WrofAQ=;
        b=N6Y1r95QXSBrHAB4xiMEKc9WbpH+tFYmBtCJcFJbshc01DIl9rmIyC83JyZWuO6c4X
         eApIvKi6m+XdQM4xpPvWvDRi5A0priM+bRb/Nbpyfs5qk5Y2bcMmneiKGf+6AfNFtRbS
         v/zNQWxCCTiGMA/37nyruQEDfWZ714vXf0beIxWbGa3jGBY7PeUhbN8mfNuJ7yHgTSqI
         sGBf4zu/AQhNzY60XcAAsY/p7SpR2UIrxEDRmutRQ+I51vLg3x3y1BquK7mS7OeUXFqu
         L9e4wp3HVEmELyBvirrMT1RzqysVK6I0PYkAFpm6Dlg9qfyRMchtOz9DmrehiwwVHjRN
         87VQ==
X-Forwarded-Encrypted: i=1; AL+hErEGU5Gf0zJUCUTZxr5N6i0gSccVIWdJrv0NOoNQTgt9+ZDLuFP1KaxVG5ryVlRK7QBWjuxZAg1QbOEhv+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qp3mVGPvPYlCQLI/IJZ8IplZ8VD6TMk+kpH5r/9uqKHzfQsS/
	Dh+yxuAgaeq+PHL+uAZoVwgGHyaFnP4ICrmkAgFQZqrgpb4QTai82lGY
X-Gm-Gg: AYBFou00ARduIw6g5Tmu5PCh0HQ3Dzravizj6y0WjzcDRCP9crkpREgZe7Ev/RrkaZN
	iEJnPsEYHtKhJ8TMYog+V7YqPDUP6dovR+fulJl4n5ylHmB3Q7it7dAnkUY54+u18UvHNNpaWFA
	S3kW4wCEi7lcqi9f1UkoZAX1YxNRkxW+kwtgbzh5E1Yk/HrDeHSWf3kUDNFTwTdvL1s9Ae25u59
	WrTR982bXBaLXOhdcyybd9MThtqgME+SyDXbC3gcLkaxrT65Fw6Ofn0pZTmXPU6IYDFQ8C0eTfA
	DeNUJXCFtgbZto8b9VR3fkt9TNyKtNZ30M1EYdfxcXhyk1VjhQ/vfaFlxOGLyuQMexEs0h3qS0R
	mcOyuTBWE4PW1ApMAo3KZL6hFCMvjr4sxSaD1R/JIdg9V1Ipi3YoRfe2qPodOlAYRFxqu/oNdsB
	kn/vass092+T93FDTsLRtqvl4pdedhwAwsjnKiDmmTNbgTblWqJm9c6Fb/gWrt4RczJECsp3EvO
	a6nBElIMpvqE/Z6WTauAiEwftsqy+sxrA1QeP1BWQC9lzE6gneeZOAOK+yZdK4Iye4q858X5xl2
	27nl1gu8ZqqjHIwNxC3DPMyfHaMmyA5WqhI=
X-Received: by 2002:a17:90b:2e83:b0:3b0:a4d1:6d7a with SMTP id 98e67ed59e1d1-3b1b0a1f08cmr1423738a91.31.1794556410033;
        Thu, 12 Nov 2026 23:53:30 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm993234a91.4.2026.11.12.23.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:53:29 -0800 (PST)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vladazaharova2018@gmail.com
Subject: [PATCH v7 0/4] gpu: nova-core: retain the GSP-RM log buffers
Date: Fri, 13 Nov 2026 14:53:13 +0700
Message-ID: <20261113075317.934264-1-vladazaharova2018@gmail.com>
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

The GSP-RM log buffers are exposed through debugfs, but they go away
when the GPU is unbound, including when probe() fails, which is when
they are most useful.

Patch 1 moves the debugfs root into the module data, which also fixes
the root being leaked when the driver registration fails. Patch 2 moves
the log buffer code into its own file. Patch 3 adds a gsp_keep_logs
module parameter that keeps a copy of the buffers after unbind. Patch 4
drops the completed item from todo.rst.

Changes since v6:
 - drop the "retained/" directory: the copies are exposed in the same
   files as the live buffers, and are dropped when the GPU is bound
   again (Danilo, John)
 - split the code move out of the retain patch (Alexandre)
 - move DebugfsData into debugfs.rs, make the accessor
   NovaCoreModule::debugfs_data(), reword the comments around
   DEBUGFS_DATA as invariants, add a Fixes: tag (Alexandre, Danilo)
 - shorten the commit messages and comments (Alexandre)
 - rebase onto current drm-rust-next

The code and the commit messages were drafted with an LLM coding
assistant and reviewed by me. Each patch builds on its own, and the
series was tested on a GB203:

  - without gsp_keep_logs nothing changes;
  - with gsp_keep_logs=1, <BDF>/{loginit,logintr,logrm} keep the full
    64 KiB of each buffer after unbind, show the live buffers again
    after the next bind, and a second unbind replaces the copies;
  - with a failure injected after the GSP has booted, probe() fails
    with -EINVAL and the logs of that attempt are still readable;
  - with a failure injected into the driver registration, the module
    fails to load and leaves no debugfs directory behind;
  - 40 load/bind/unbind/unload cycles use no more memory with
    gsp_keep_logs=1 than without it.

v6: https://lore.kernel.org/nova-gpu/20261014154554.231015-1-vladazaharova2018@gmail.com/

Vladislav Zaharov (4):
  gpu: nova-core: move the debugfs root into the module data
  gpu: nova-core: gsp: move the log buffers into their own file
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/debugfs.rs       |  44 ++++++
 drivers/gpu/nova-core/gsp.rs           | 100 +++---------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 204 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     |  68 ++++++---
 5 files changed, 311 insertions(+), 117 deletions(-)
 create mode 100644 drivers/gpu/nova-core/debugfs.rs
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs


base-commit: 0ff9e5b9ff6736c37593cd7db89f4593ec4f8e86
-- 
2.56.0

