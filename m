Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138172931E6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024927; cv=none; b=O4Uuw+cMVQTaVwKjbMjun6wWDmYwKxrVRdwHMKGwNcQjGu2srg87w2zVWZMbsmDSZQ1x8cGQfwrS3bpY+IPmfkZQEB1OUnaHtIxWGKUY4tktbjfMYF1MIbZaHoOjJNdZxPJHFfaeYkXjd//YaFv2hHD7iqgLrBi2Oq7owa/JS6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024927; c=relaxed/simple;
	bh=zKmceE7iJ3pFkJAPAZa69mvHkW/SDXp+nT5N7qLGRy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uHt5VMxTD3lggZNaUbHMWBjwIZ+rDKjRapoIMNLZgsGCR2Wn4WAV5UV++laXEz30nY/HRUK7h4x4FsMshiHKHFTzhlWE3Eou1fpNw511JEc+WtOP8DRpWwIELIlmgV5t/Y1iEGubVT+K4oZHes4ZtOqQcJYeRPr5ULWOqcLkuBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlXk6HXz; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlXk6HXz"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-917a20e9efeso67154086d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792024923; x=1792629723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCmGfQtmli9ezK+MFtUWjQexKDnk5+HZKyUUtdEwtk4=;
        b=XlXk6HXzrChaVnO117/DlsL+SieOlhc8dhjGsLCHgzu8Lx2PK1kUJuh0JlAX0L6cr0
         9zWG3ouqLPokOez/iF+Jf+4hJnQujrMFqRvXgRWEXhy6PH6wBoURYXUaYaBk80bDguVG
         vbuhiLl+y7cqxxHgSqQj1lnVWVmJm87t/qSUzZr87rV66F04ZZTqHDMk87hVlpsLvn7N
         pEwXKPTjRE9YDgFxvFt6TmJAgMbISmxkrKmTPghfiNBwuWqygIWvdrm2kTo+7+nVEQgs
         j0EnR58n0sn53bkx5zXtx7p2DySnGAuZamxDcd1qOsGQQrVKhe2pCLTEsAgplvkdW+mN
         2JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024923; x=1792629723;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CCmGfQtmli9ezK+MFtUWjQexKDnk5+HZKyUUtdEwtk4=;
        b=N5o16WivCq7CyP59SFn4PCqBM5odXojbklonWU2KaC14vQw94lRWM66At41zca09Ku
         PERILOqiMWSs7GyIuuQ4cjN+XzQ6Zpkb3hrO3bV+VZooijNAXzz9CHrUQmF80uT+3oVC
         5o5PvOgoYOq0I+JZH6OE+D3lIYQUF14hpSArFgZwarxp6+pyxfBGzLUF2JHKisg3z3nx
         0lO9nomcbqimYbx2anfn2MZiSshMOvoklfqUoAQtY7ZGtXmssfYqvy9psNrr/SjoFWBM
         zk/qSPbEgbcGK36tDOBjFuv8v0z4BH6BBtJLH369mcCzsy/Zk1oaB7itAJ8iuVgMCc3e
         Wxvg==
X-Forwarded-Encrypted: i=1; AKwUvBwYJ410YyhNzq6cQdDXHnJAI6u22b4HrIfC/4hYJBU8x9Cb7fqCZr4hKBq3P/D78ajcxtjuxAC2nS+uHXU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLd3raUMp932Uv09BwLYxL5R7iTwNeZIiwmFmRgM8L8vtDI7UJO
	5I6C6vWfXYlQNLhi1nJEDDMt+UzYEvEl2yz3pqJ114VTCSPwpyF16CI=
X-Gm-Gg: AYBFou1RkPvxMfUsQYdB1+quo0X+0Qxm8lFdmRl8bTBC8kRl7NgKBIPW8GQU5nl4FJp
	OtuUeVzWSQluhvL0Q1K4mQp2k4/IquVwhEoIZBaSTeDNnZdZLMKxNoVpAZj2/vsLmIt53nmsuiO
	Uvpesi1IoaflTy0NGymrnN9A+cVPI9I19uLG3VbHV7L2QixGmrAlqRgsO5EjhWATpWLXvQGhomG
	M00SlTHth+y211pSB25Rr2urqZavimyHq75v46J6vJuT2NY8XOM6+Fd3CUZddczwAUqbz6tPKYN
	9Tfr+sS1zBVyC3KBrDPntLan5UBTv28v09qNoEqeGoVnvgj2qCYZn0SbwMXVEHdTQ08JGoxRqLC
	2z9eRVsad4OWffHwEfmSOer1b6uQWBRphp6s0bB/ROzfdBbD6zxKiseMkpWcDjrk9plRQ8aBg+Z
	s1EKcExBR9oNjJalCLl+Y5/NWJSU6NHQneGT1+UBS3Ok/VxEIE5UnRCVIHWFiWXx2SbntNYz5fd
	vhlY2hq+QUactdrD+IIRpV8UU7zI3B1L39/0FAYDYj/zI+xrhX4xmDWO0aFO1Hnc5A184znjIza
	hxn9OHEssF7J+RZY
X-Received: by 2002:ad4:5aad:0:b0:912:127b:c56a with SMTP id 6a1803df08f44-91b553398damr291404816d6.2.1792024922795;
        Wed, 14 Oct 2026 17:42:02 -0700 (PDT)
Received: from gmail.com ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b7b31esm66811476d6.26.2026.10.14.17.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:42:01 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ae878000@gmail.com,
	jacopo.mondi+renesas@ideasonboard.com,
	sakari.ailus@linux.intel.com
Subject: [PATCH v2 0/2] media: rcar-isp: fix core registration and IRQ lifetime
Date: Wed, 14 Oct 2026 20:41:57 -0400
Message-ID: <20261015004159.2202899-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ISP core IRQ is registered before the RPPX1 object and interrupt
handler state are initialized. On removal, it remains registered until
after the RPPX1 object has been freed. An interrupt handler can therefore
access RPPX1 outside its lifetime.

This series requests the IRQ after its dependencies are initialized and
releases it before destroying RPPX1. It also distinguishes an absent
optional core from a registration failure after core resources have been
prepared.

Patch 1 handles the -ENODEV distinction. Patch 2 moves IRQ registration
and release within the RPPX1 lifetime. The error-handling change comes
first so a failure from the later IRQ request cannot be mistaken for an
absent core after registration has unwound.

Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.

Changes in v2:
- Split the -ENODEV handling into patch 1.
- Explain the RPPX1 allocation, free and pre-lock IRQ accesses in patch 2.
- Combined code changes are identical to v1.

v1: https://lore.kernel.org/r/20261011214448.2043581-1-mhun512@gmail.com

Myeonghun Pak (2):
  media: rcar-isp: distinguish absent cores from registration failures
  media: rcar-isp: release the core interrupt before destroying RPPX1

 drivers/media/platform/renesas/rcar-isp/core.c      | 13 +++++++++----
 drivers/media/platform/renesas/rcar-isp/csisp.c     |  2 ++
 drivers/media/platform/renesas/rcar-isp/risp-core.h |  2 ++
 3 files changed, 13 insertions(+), 4 deletions(-)

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
