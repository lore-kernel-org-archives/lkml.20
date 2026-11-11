Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371173;
	b=y+ZuoDrBvFHNBfsPVanv0+Zam5z7GRNEhIfIZqInImQWIGT9uPJiBGLJ8KnKXk7ZmBa0
	 /yl8T18Gmni93W/H6CJjOzQVkXBs7dHGaVplOBu5ZLJzXhCH+QtxHIGE4sEpiHWRsMtKb
	 woAhvlLPk57s1pU81QI5Um9TgH5FcrHp4u8PPlnxZaop8I6v2WkbcFy1rWlraW5OZJQfx
	 6/LeCHM5/xZNc0PPw/MCSKEq/hYcWjnz4tKzusOqwAisJEr/uRS0iLS7rig82jIf7weXM
	 NJsdTiFyeZAB8z+Qmbc5aCJTvqjlEjXPWTcUEvoz0dMYiU0HLazyEmDUbigeQqq7V7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FFlOFP5DVT2Rk2YGKhSaGCUCFiztJA5CULaLG82EQoY=;
	b=NYKffTZWxoet0Ca3Vw0Kxmh60uHEa4S94QWSyBsmIE0kDhTI+yfRWRa4IqNx71tFsMFJ
	 ybipjA4CAnzMKce/CunNiaRWJS+udGbRIuIvxK+gZAU9HiL/kQsO8C1kEAsz6tSzdZPOo
	 Gzwy81/RCyE0m1Tvy5pQmhNmTaHxrPlpHfCkQTKpZ4sY+lE386ozq2MGnuKA1CjnvRg8L
	 bd1KGN+HTHiRcLeXlosypQ1+zgOntKYl6hvsrj8RObLvkw4bwytrqaFoeAfS+Ym+t+IpR
	 DSa2+PCfyiQq0wPbA20QwgPnQ0klXUPmnfQMOzdO+fX7LY5bj6ZjcN26ytQAaOD2toA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kX1dQBmo;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D07606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6D07606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kX1dQBmo
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso1053150a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371172; x=1794975972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FFlOFP5DVT2Rk2YGKhSaGCUCFiztJA5CULaLG82EQoY=;
        b=kX1dQBmoYUkhbQrT7/D3N5Fn3oralg9sdXpphgMzbyT4+5fco2MC5NMFsqhqrOfEY+
         qlBPX11ZfnXdfFl1/UhZOUry18CXbs1dBm6XOgqEff0yDNDERXfXrDjBYbR91ExvuSnU
         yqrihLZK0RQi2zzXVkNDNniEDkGQvgFhRahk3RfSIk8m8dcdD+zNQu82MTusmM29ZoEM
         MFgCsMzOiwQ7q6xOP66/o3juw4J68IX6rD0CF4OkkakPrewiVeSXBoNmT7/WdLsuB0uR
         91E2ULWgTDXfmLrWTZDYx/exFJM1ecc4VkKzPrWL8lntQJlt/WxznE7mAAEcdWT2Nfwu
         MB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371172; x=1794975972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFlOFP5DVT2Rk2YGKhSaGCUCFiztJA5CULaLG82EQoY=;
        b=NyLZIuzBPvQ+aX1rSRBZlb3tSwGAzzSyBxoTzD3eDt595Ni0W7kwSJZTagjxiY+OBB
         +fAcn+s2PkAI436jbRXMMtZB/hphRX+S+16axPq1kJ+a4zdT2UIBZPoUYnpii20V46vt
         QHN7jut1eUc6JGKt2niWSfI/PNnl4Zluz71rR12bI9rlIA5eRIuavo2a8FY1f6KIMdY3
         rn5mq8vGr/uaM6VWT1uUxZg3UmTKYrQRCNJ/SLx97Bl1uMiL9D9ZBKl+vIZr76jgV0tZ
         4mBFK6O/lrtKyouM1vZWWDn/KnIXJy5keL3O6LPb/urdd1/ljG4MyT1Q1OqKlcCoDWsU
         POfQ==
X-Forwarded-Encrypted: i=1; AL+hErExutKu6QD0LFgXHJYUnglwSwrIC3jJcr+9VnHsjAEDFsk3+l4aLznkJ3a/eEMvZbpN9IYodLtfjP6ufr8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YfOiyox3hrbi9MJ2v+36Ixm3XWE628hrR/GFyEGtH0GDJWywS
	9JdDkGd5JGzMbgK40rBhRjMDyyErXDUW9OQq8ZflFmZm4vSM0xU2hnFtgK2wAspq
X-Gm-Gg: AYBFou1gc789ctfw0Pw/awLJeEVqrM833dRFPwiErE5UcnKn4OL0q+F1h8L/DJRTa5m
	TDDHctbh7s4PHbY9piCtPUmzDdnElYcIOWmrD4jGyd/ajllVniQsuE84kkckbMSAWZgYE5MKfa8
	0IPCLt3u53XeIZnwjznQM+gUP1WNfTU4wp6DSP43Of9/Z0ApYxWVHNepzjFnJ1pkTJSi60pcYop
	dDPVPGH1rd7TVT32dDjUCwC/MpoUvjn/toN+vEL5lvsj55riSZqRGV6pyM1X4c1TuLs8zDf21vH
	3fpZHdL/5XTi7kASTLreG+7xwCAG/oUqRnZhUUAo6WIwLiVq6D1qrKDTyTwDcTBTBdQc5eKWt+g
	Mt5CL7HL68CA3lZ9mOvP/3Q9/OKwpn1TDLEVdNKhfc2iTmFG7dutNzvbhn3K2mCnhBGYWsX0aQj
	ZmO0jo6w/BAstyoKMxSlDijb9b0l61CMAIadR2DJt+O3mUmJY1AJF/aNTwQgREZtGBhb5NMpBhg
	MlICsX4WM9OBbsfGr8HJEJNIYrQcr49dqSWrNjV7l7eJAwc/dLd9LUab11bvXHIR5RbzeAZ8zqX
	S1zf1/xhWeSzH5kG/ZTq3W9tsMr2JUKaI8gVYW5/2lbZ5fFoyRMlTm6Un49CrDMHQClwEoLLm14
	1p1v9N9OHFVXnoVGyBgq7ohCOOvSKh6bF2jsoXZ0cKsOG29Rvnb9yQQUL5azoDyCI6rBjNJwK+L
	rsDHk=
X-Received: by 2002:a17:90b:4b84:b0:3a7:db88:3491 with SMTP id 98e67ed59e1d1-3b182f2862cmr1142659a91.33.1794371171647;
        Tue, 10 Nov 2026 20:26:11 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:09 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 0/7] wifi: brcmsmac: embed fixed-size allocations in brcms_c_info
Date: Tue, 10 Nov 2026 20:25:47 -0800
Message-ID: <20261111042554.232998-1-rosenp@gmail.com>
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

brcms_c_attach_malloc() allocates struct brcms_c_info and then a number
of fixed-size structures that live exactly as long as it does, each with
its own kzalloc(GFP_ATOMIC), error code and kfree(). This series embeds
seven of them in their parent structures. That removes the allocations
and their OOM error paths and, for the per-band state, the open-coded
pointer arithmetic that carved two arrays out of one allocation.

Patch 1 embeds the per-band state arrays of brcms_c_info and
brcms_hardware. Patches 2-7 embed the module callback array, the MAC
statistics snapshot, the default BSS info, the protection settings, the
core state and the BSS configuration. Patch 7 moves the definition of
struct brcms_bss_cfg, unchanged, above struct brcms_c_info.

There is no functional change. The pub, hw and stf allocations are left
alone: embedding them would touch most of the driver for little gain.

Each patch builds with W=1 (arm64, clang) and passes checkpatch.
Compile-tested only.

An AI coding assistant (Claude Code, Claude Opus 5.5) was used to review
the series, resolve rebase conflicts, write patches 5-7, and draft the
commit messages and this cover letter.

Rosen Penev (7):
  wifi: brcmsmac: embed bandstate arrays instead of separate allocation
  wifi: brcmsmac: embed modulecb array instead of separate allocation
  wifi: brcmsmac: embed macstat_snapshot in brcms_core
  wifi: brcmsmac: embed default_bss in brcms_c_info
  wifi: brcmsmac: embed brcms_protection in brcms_c_info
  wifi: brcmsmac: embed brcms_core in brcms_c_info
  wifi: brcmsmac: embed brcms_bss_cfg in brcms_c_info

 .../broadcom/brcm80211/brcmsmac/ampdu.c       |   2 +-
 .../broadcom/brcm80211/brcmsmac/channel.c     |  14 +-
 .../broadcom/brcm80211/brcmsmac/debug.c       |   2 +-
 .../broadcom/brcm80211/brcmsmac/mac80211_if.c |   4 +-
 .../broadcom/brcm80211/brcmsmac/main.c        | 226 ++++++------------
 .../broadcom/brcm80211/brcmsmac/main.h        |  82 +++----
 .../broadcom/brcm80211/brcmsmac/stf.c         |  22 +-
 7 files changed, 138 insertions(+), 214 deletions(-)


base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
-- 
2.56.0

