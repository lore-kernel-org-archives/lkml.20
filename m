Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353E838F233
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486795; cv=none; b=Ax7mhMNNk5fXdj8pfgc7Ey3fUqzdaWGiZqNCjS1fCq8WZ2M1Gh7p8ze3eUxOIVYJ+tt84D9tyPr9dg76a+6VqqloozzbR8jUCtMCSKS/1aylnXHPiLsf2TuQTbAP+Lo9vcAWWyfyio5ftTdBISAfkps31NvC+aHlxTSzgbexg9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486795; c=relaxed/simple;
	bh=AxXokR9yTnXIXLj9Db4ukgIhemDv2YeEJlYdS2h6TgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FY8H2Lo7gCn+Mk9iOeJ3xXdjlvlgRirfJTg+DHgpTxO+Jrip1dIIUnDO5O6wT2wO1YakX6jf544rBESXOYU9xLUeY2xsHE7RpnT0snZbvn3LMB4ZU0e6l/3LGXob9u+EketdBc2SL2D6WrDOzGsQB/1oq6u5RaN3S2u50HQIir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=YsJviukk; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="YsJviukk"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33e6279a1d7so3244687eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791486793; x=1792091593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gGgE3kKeoX2vWEaOMwOk44hmNWlNe6dYYIaxJ66sqbw=;
        b=YsJviukkd+L2i+QOPAEmQWGEy+Qi3sqFfYHjM8kZPNHyxDviGTrrADrgnmRizjkq79
         tKK+sGWtRKhBa9a8nojTQxpHNdvm/yO4ytkNFdWgK/JAtBpj4EN8nKG5A8ZALDzmDdcK
         F6S15GWxjACHApcV91REtCeWtZnOyLoUxypA1E+ENwPcFmyLIWrxdIIHxP7YCfoAT44m
         GREBdiqOYkSd23WbYfI0KPHbUlJeoLmFWZb0jt5KM/RM0gMW612+34Y6jH8Gn6kSVWNB
         LJ4emMEKObjd0wF91sJN8Q2R/ifIjOS6Bg2YRvLlrVZT+VDm9Q2ZjSVxxLtE8NkhkM84
         nT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486793; x=1792091593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGgE3kKeoX2vWEaOMwOk44hmNWlNe6dYYIaxJ66sqbw=;
        b=M3zCSTv3wgOSpn+mVWwXzihZrve9RXdf1s+z2snJ2/MF08npBczwPqfL+AD5jdT+YR
         4J45nSNwscBT37kuNf4SxarMN5Hyuo6DfcLtoY/PdopQ7EQsmFaEbo6HKDleutFG2dPu
         miHeOBJ2cKcba+DrTd6/QI0IVfND3ihUYkQxsmDT0kqGzx1QFh0NcR7hfW1+Y8xYq07G
         wk15tNAiyHBJDULZJ6N3L4VJDMNo8E5JHbhDNyGT3iwh+T/iDXf3ojlD2ni95+ntz7zv
         wKfUm3tRxw5mCO9Yj3lpCNSLeH/dVdi9Od51rg1X9qhH889W1h/1o1KTfa5+S5pL/ahp
         ewyw==
X-Forwarded-Encrypted: i=1; AKwUvBzH7eAxIH8HvAqD5LNqVmXK+clJFy03a7HWQrHI/ZLlu9+N/0OFo/c2a60chxOQZCuuvulcyyU3Lopzdds=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2nCIOQRillwqO3C/UB8BWuNsN8rqc7B5RJu/H+4zeB1WdSC6N
	ShdPpvAFoMUIC0ykm3eq7NsoC1xcqo689qeZZBJxXqqjSAkhVMHl+YkIoMphM//Ujck=
X-Gm-Gg: AYBFou2X/8rmdKxTiEurUZFG+1GGF9ZSKQprJKRUaHwOEtHhPpHVDanp0ICMLpUyC27
	TJxDYk8/y75kf7LiBkhMd9Xv1cDwzG39Cw3FrSxPBYreqBNv+KConCgj1DGPPlXr2US56kpLo/R
	PMK/U4B+R56/lr6ElITSvb6BTTVnPHiNX4/tsvwHcJ5wokAOVULE3xSZnB2g+xl+w7k3d6d5tke
	3YG17wMN/w88go9uS5VsA7RVejZTDEPjJuDtrqvqtwDbhVwbHhSJZADNpYEmmrD+FTB8OKgO8al
	lt+weyRvlhS7kkz2r2JhNxJ4tuZxsmRD/lAcK9e9OgSNEPWlYco30YHoHZ1SBq5rcwnBwFWSb9L
	zdsmUU1HWED1fp846pGAq4gbg6cIZu/GkqAg3QdpI1e3+YK0o/kE3WqN7q6OLAEdtps315s8/m2
	Q1vwWS3Vwqs279bXGld0+4UqPfGK+vDqFj8ITc0nmMRfD0B5NTRtWE/LmtOGa3lN60Od1rnvJzq
	SIrKurwY1JGsOP5JKTnfuPhTgtMriRprl6cjHr/2dslXwWOJW1za2ziWWsg57J/aJRQFNZoqZSe
	spuKJw==
X-Received: by 2002:a05:7301:c8a:b0:351:7ec0:cd4e with SMTP id 5a478bee46e88-3517ec0ce24mr3629562eec.41.1791486792986;
        Thu, 08 Oct 2026 12:13:12 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm94214eec.4.2026.10.08.12.13.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:13:12 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Saurabh Sengar <ssengar@linux.microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Wei Liu <wei.liu@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>,
	Helge Deller <deller@gmx.de>,
	linux-hyperv@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: [PATCH 6.6.y 0/2] fbdev: backport CVE-2025-21976
Date: Thu,  8 Oct 2026 15:13:03 -0400
Message-ID: <20261008191309.98263-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg, Sasha, and maintainers,

I'm working through the smaller CVE backports still missing from 6.6.y.
These 2 upstream changes belong together for CVE-2025-21976. They must be
applied in this order because the later change depends on or completes the
earlier one.

The complete series is already present in 6.12.y, 6.18.y, and 7.2.y.
These fixes also affect 6.1.y, which will need a separate backport; this
series is only for 6.6.y.

Could you please consider this series for 6.6.y?

Thanks,
Artem Dinaburg

Series:
  1. fbdev: hyperv_fb: Simplify hvfb_putmem
  2. fbdev: hyperv_fb: Allow graceful removal of framebuffer

base: v6.6.157 (79643295eba17affbd16ca97f3ef04c90266b28c) plus stable-queue
revision 958ddf240a33ef26b1771be944f0ea6c3b597472
