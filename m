Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E24F372ECB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986330; cv=none; b=N+tF+R86IoUnhLbySumKlgG53wvU9krgu+ObuDUzrUI+upvF5U3P889D2aVfok1tj7lNNjwbXoPu/eo9c8sjGbTB5LXm7fabX7/fW0wv02Rd9m6sNsC9ssxGNI1RdiOBfTc8zAHH8wnBnCFzAiL9F9681Jb6IgUbCicvW5QDH4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986330; c=relaxed/simple;
	bh=2eomYsKhtyUjg78mXiDsoL3CzLp2fP0U1GQBuUbeoJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CbyAYu2Bj4fDSsBglPAmHaBiQ3CC8tBIpGik9dhY8mY8Tlo+hW9LgUlBX6TNLt94Fku4rFxq6e3hUAeU2pYt6xhope0UlzqR6gfh0Yk8IoiIF72hCqLv0XAmmkxgesnSuz4pUnP8DQOQPhPLksfFDNBfOJAK2xiVSLDrCZQLlbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXpvxE8s; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXpvxE8s"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8692a856865so2558171b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986328; x=1790591128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TT5lRmym0T1mzXaOaX/8a6/gNfD3HTc1xl19TrAEELM=;
        b=eXpvxE8sBD4ik3g/WHokPk6zdAIubfdm/S+e1wlUY+AjGnsaKXmwiJ+g4A9C0iBjQ8
         kRR2X+hCX0A6sI0Qgwra4Mu1O/ComapYzd+CBMv3aYJ0OE9F4x5O5V/8m8Tm1NSWPM62
         D/DfnudoHRslKf6bdso/0Oh4hwNjhpKK0pLiXls5wX6bC7ww/S+Y9/DpBRqq151ikxKz
         GOliGE8XVzgt0Xiy2/pb7jehsZytoSwcnrSyM0phGDQHB29cfTyNJ1N72kEtVfOMsJvx
         DeKHJMZDXhHGHaVWAjiX9+/Iph3yl9cYKj6/QcOmMEsMQc2YmdzMglH+RtDOoGl7EmTb
         OyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986328; x=1790591128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TT5lRmym0T1mzXaOaX/8a6/gNfD3HTc1xl19TrAEELM=;
        b=BfpmfkvgHHIi9TzdoBVEgkDtzhlD8HpdEH6SwW9+56nMy/iXA0HdTHnz2nZizJCUpX
         t9HMg26UCVA13oDIepNYFlD9tICF+o3HTMeA0a0s4BrAC5tsrQVXVZmsZXQToLfVmkon
         4d2bgQ0DYl8eqFDRgBwVTkXE2FyUHNHbf//zLleplqAsPQEUvJEFUzbqB0gFpDev+6v4
         ONt5DZmrA+opclv9Aw1uKtXW2C00wQes+mnBsFT96S6H5CxzBAgJbWrlRn4Qo9qGvlzw
         2MLEJLkFnukBlMdxjgLqsC0Yo6exF5+VddtuA4knfOeT2s6KayqvIYGgda9DCI00hUPp
         n99A==
X-Forwarded-Encrypted: i=1; AKwUvBxslm9tCHLyjnDa+ufkBwhRBBtZCELC6pc46L5uC7C32S5SGSwcR11F6K/uRSZNPwp3f6BpTeYjIFr3KwI=@vger.kernel.org
X-Gm-Message-State: AFuF++n/wbcUXT90xrd2+zzqHLKoa78uDfZr72qlZWSEbfwOjWq1q/UX
	opLoVTxfrVdSwgA3KsMfPofHTDhSgufzMs+6Zf/vulqlPVPL8HJiZH/E
X-Gm-Gg: AYBFou0/MbKiVX/++D66QmoPjheBe+283CsQnUl6aSHDDB0cHOrAda5/nWUkz8LAxRS
	I9ttH/WBC7n1sX3T0hKnt5Awg1q4cjn8z5GTmjPM3wEBOkAOLYQ5txnAQY5AvJxDCeiVrU2C0R3
	blza9QW7Wyq4mlnASCVOD0Bb6KrVhWa70xLbyV/gHO3EcxaDdI6dqO85ysEGWAPkzDXu1gyh5B3
	MMc00JOY094RKuJS/mvud4Rz1I4lTl/P1ss6fC5GuDjd3MqidVM+WLTBw2q86C6VOof4UX5CGNg
	RinqZIbLzwtIz68BwPmsV7408lu4/gz1FpSfOZ1a3HGNtNeiDCDzRGgw9fPLORsFqQinSPHpr78
	o8ZQEfd/0rpCwRT/zJJ5VUI/GHsnBypfzHCOkDvnaAdz4/5K4AkaqjXdBdpdWOWHtYEF7avK4aa
	22S7yE6FBwT/M7YhtIAJLrKM/YRZL86XNx3iNC3buR50wLvMdDFYvMjGkU1W0ccd9dI1iC1Z7KT
	RYWz+dJr45siymoMApjp1gfEvKr
X-Received: by 2002:a05:6a00:1911:b0:878:34e7:9a3c with SMTP id d2e1a72fcca58-87834e7a3a3mr7459656b3a.53.1789986328468;
        Mon, 21 Sep 2026 03:25:28 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:28 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 0/6] clk: mediatek: Fix descriptor clock ID allocation
Date: Mon, 21 Sep 2026 19:25:16 +0900
Message-ID: <20260921102522.1640072-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several MediaTek clock providers have clock IDs that do not match the
size of the clock array allocated by the common descriptor-based probe.

Add dummy entries for missing IDs so that the allocated onecell data
covers the complete clock ID space used by each provider.

Akari Tsuyukusa (6):
  clk: mediatek: Fix MT6779 clock onecell IDs
  clk: mediatek: Fix MT6797 clock onecell IDs
  clk: mediatek: Reserve missing MT8167 clock ID
  clk: mediatek: Reserve missing MT8173 topckgen IDs
  clk: mediatek: Reserve missing MT8196 MDP clock IDs
  clk: mediatek: Reserve missing MT8516 top clock IDs

 drivers/clk/mediatek/clk-mt6779-aud.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-cam.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-img.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-ipe.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-mfg.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-mm.c       | 2 ++
 drivers/clk/mediatek/clk-mt6779-vdec.c     | 1 +
 drivers/clk/mediatek/clk-mt6779-venc.c     | 1 +
 drivers/clk/mediatek/clk-mt6779.c          | 1 +
 drivers/clk/mediatek/clk-mt6797-img.c      | 1 +
 drivers/clk/mediatek/clk-mt6797-mm.c       | 1 +
 drivers/clk/mediatek/clk-mt6797-vdec.c     | 1 +
 drivers/clk/mediatek/clk-mt6797-venc.c     | 1 +
 drivers/clk/mediatek/clk-mt8167.c          | 1 +
 drivers/clk/mediatek/clk-mt8173-topckgen.c | 7 +++++++
 drivers/clk/mediatek/clk-mt8196-mdpsys.c   | 2 ++
 drivers/clk/mediatek/clk-mt8516.c          | 2 ++
 17 files changed, 26 insertions(+)

-- 
2.55.0

