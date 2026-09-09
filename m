Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C031B2EC09B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 03:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788925850; cv=none; b=gFnWdzBrJuIIH9UI44Q52x0UskjiRqXulxV8fVVrcwLbY2Yx+EPtML72JDOaW+3wjTq90tTzVD6tqU9Gy9CaLl9vaAXa8q+66fPcCGZ1WNsNNgsXI5iI0ytjK95u3NQxiX1+lP+Qh4XOX21SBr4LcesSUuE2/W4OmYx0BYdksgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788925850; c=relaxed/simple;
	bh=AhuEEJfJXAW5jJEXow7KlfpNuompEqNNGI+LEVIIOeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J9KckB/Ad0nvP4yyy/GAZbHw71d2fWZUZ8hs5aj+39F/DAqNaHTmYx0Vg+F9VRATIWRgCgfC2CQ+CXDXyBMzlJDo6SPLFOwIJILwc/RqlBC2Yim9jFzl+fHKmBEnpkYdQEz4J1AW0Xdu4QHEaNUyTtafqBpWjv8uzf02i2ItOj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABejMCLT; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABejMCLT"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca06b03so7091755ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 20:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788925848; x=1789530648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zeqg9OVR1P74ongtyOgESAhm4/yUelGPhQFrlEwPtQ4=;
        b=ABejMCLT+YSq/uajZsu4FucKyFTyGR79My7JbADliri2v4coCko/aLKR57pzrnYaqK
         TZZVgA5bdDMdqsJOIfUGqmz6DUHn7iDwpr5d2nCSwcjV/fId+79S8E2rHdc/K7M92vry
         fBVufdfLjo8b0/LieFNtYob7k7YjGiuSvUelH9cLHH4/j2ChkqkGbutS6iwc2BWerZoi
         WQThzZFhmcF0E939xW720c9gfxbNLrJhNy2Otrk4HLMhe0b4vqIAm9sUuLceWyAIs8Rq
         MwlSQqTmGcNpAjmAYejrYID5UOiAlIPDOqlYsLb18BgyMSPiNk+YBHOSQL/KyY2Zarjm
         JYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788925848; x=1789530648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zeqg9OVR1P74ongtyOgESAhm4/yUelGPhQFrlEwPtQ4=;
        b=JLqeDEZvH503tUGh+ZDDl6YXEaY2jIbvgoLZOuxC/UfmgqtFiuDufW/BEKqZmAF2/M
         RppkP4VF78wLDxs7TwfXB7GbNVPyiPPtcLQUpqM02ynJsvCCm7jjOPoK2fCNwqGIfKbG
         zSmR2e4ZWmT8RHwF50no0E/LwKrFfsSV82xa6OOYoBRacjhf4pjx15dS1KJygbX1saag
         0zntTu9hOQ9TwH+Kp6UcRCxOjEstIXP1l2uFn0CQvoX0UigMBHCRLXnAlRCleoxRyn3h
         EZ70cGqSTqBQtzJHG73iLGCl8hjKV4/8XqiY8Ps/RD6ZrhDWkjXix18JcSX1J1rzg65g
         XeKA==
X-Forwarded-Encrypted: i=1; AKwUvBxe9BOwwQSJx9n0EDv0W9WrmBu3R9trwsNSeYTKqxRo49TZW2r/1q8kvYS64SvGvGqAxjbLNHUGiMtgbqA=@vger.kernel.org
X-Gm-Message-State: AFuF++mUSEcuY8Hc80KFymVM+GC/Fa94SL2FNm68xAm1Iog1H1IJlDMr
	FTpcz8Lgkk1K4W2sforzrOcEU2KT7YnHuBPusYfLFBIaVPCRffGpyc8U
X-Gm-Gg: AYBFou2g6zw1Q7nAJ+ZPlafXEKsJDwSK5SXHQlJMGkOkfqRaQo5fkSEN/OS5kuEi2dI
	w9WHlQxvS492w6j3ntMb3b9EfMN4oHXg468ptXNSi3bYtYl+PBE1xXVed0ersqNC7C/cE0JcW8e
	+IjyzULcZW11/LCBi2czV/85iJAI0YLaJVkkz1Pe6g1UKL2Hux4eF9V9ZIh6WccZlaIKpM6ySRr
	de9tq6hRGM81WpPRj9YHd81/ibWgpln8e58YNhQyd9VeSJOj1DqRmTMf4eWlODjQz7dLATllTcd
	jgHsJhFrt1M5FClC3k441cdTMnlEYsJs7ePsIkjRsQCXPwYO7GZwBlqKSTfUxBaBdKD/uoqBchB
	hDeD58QPY6EYfHhi99KHh9hVxehLpveNyp7Vw2vs10lB90vE1PE+0BfzEpG6GKgZ7Pj8Xegv7X/
	U+iFeLv3Icm/99p+4AMmvRiK8ZTCKGP4IoQy3FleUyHi9wLwgjGytuiHbEZSilD9CxwFYwlT0Sz
	9Lc2lTT/th9
X-Received: by 2002:a17:902:c40b:b0:2d7:4bc8:41a4 with SMTP id d9443c01a7336-2db701f6af8mr93965615ad.10.1788925847884;
        Tue, 08 Sep 2026 20:50:47 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm65891705ad.79.2026.09.08.20.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 20:50:47 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] thunderbolt: Validate router-provided port numbers
Date: Wed,  9 Sep 2026 12:50:38 +0900
Message-ID: <20260909035040.2929285-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two six-bit port numbers received from a router are used to index the
router's sw->ports array without first comparing them with
max_port_number. The array contains only max_port_number + 1 entries.

Patch 1 validates the port in a DP bandwidth notification before
tb_handle_dp_bandwidth_request() calls tb_port_is_dpin(). Patch 2
validates HOPS out_port at all three path-discovery sites and performs
the construction-pass check before allocating an input HopID.

I tested a private synthetic KUnit reproducer on current mainline
893e11787f78. It allocates ports 0 through 12 and supplies port 63. On
x86_64, struct tb_port is 200 bytes, so the requested allocation is
2,600 bytes and the selected object starts at offset 12,600.

The unmodified accesses produced:

  - a four-byte KASAN slab-out-of-bounds read in
    tb_port_is_dpin(), 3/3 boots;
  - an eight-byte KASAN slab-out-of-bounds read of
    out_port->remote, 3/3 boots.

With this series, both controls pass 3/3 with no KASAN report and the
complete Thunderbolt KUnit suite passes 47/47. drivers/thunderbolt/tb.o
and path.o also build with W=1 without warnings.

I have not performed hardware control-channel or HOPS injection. The DP
notification index is used before tunnel lookup or bandwidth-mode
validation. The HOPS sites are used to discover already enabled preboot
tunnels and during resume discovery; ordinary hotplug path construction
uses tb_path_alloc() instead.

The private reproducer is available to the maintainers on request and is
not included in this public series.

Daehyeon Ko (2):
  thunderbolt: Validate DP bandwidth notification port
  thunderbolt: Validate output ports while discovering paths

 drivers/thunderbolt/path.c | 27 ++++++++++++++++++++++-----
 drivers/thunderbolt/tb.c   |  5 +++++
 2 files changed, 27 insertions(+), 5 deletions(-)


base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
-- 
2.55.0
