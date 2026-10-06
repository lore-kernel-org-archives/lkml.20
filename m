Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18EE3B42CE
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281786; cv=none; b=lGaxIuytWLmcIUONJOIRXN98HdyF6OUuj3Y3tScKIBzJUIZ9avFlZDupE82AZR4MfWXMA8hlCpuYFaiw4Es5gn4NewI+p6me7XrAeFU1g209onUayUVK+W0vX3cIVhkPThcBwGa/7+5rWsuIUrudrrsHjvx/4HUucmJUAtIHvA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281786; c=relaxed/simple;
	bh=zMu7p4w1FFyQwFOl6coYwO47IzKVkZ6aTy9C/T+sik4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QrpjMZXIsDOOeJWYY1wX3GwoUllOZIuMp484iLfIXgPxjA86JiP3t/WfZY9dksL/m4tY1XRvd3/ag6xoKKvvMGP/BHwq9ydo2C4ANzjo29cODzExRGmnd1cB4mWaCIesJVnUeFH45m9cbfZHwdzNG4bRTA/enkj5n6FAzHMZN/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7EYZqOa; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7EYZqOa"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8875d220446so313277b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281784; x=1791886584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qoB87xt/si/5SQ89z++VwfJlgKEBpZZ8oa5UH367RG0=;
        b=p7EYZqOapn5+Oofy87z0phMPAtxOLSGK7YNzVgEDkbTkKpxcODNDYK6n/etNRhY80B
         oNLPlnvesA/YiyAbkpvs8duz2Doi/5rp2OeQ4KBKXfHKKY3T9sRNT8+V4MuJHdHknvdh
         IvePyDZgGm+IKyvn3kq9I6wCDEbrbOtbDAQZpkAvhJncfxXQlhsyjyI6EdmukYEBRUkU
         tc/NATdtvmh2tdHX8vA/zbGW8XTQ8rhg/CBzsdywGLo4/1e9fGOSj+blKN+1Jwi61dv/
         DwYx2pXlf2OoxTuVBK5EX6fivrzJFEtjFlzqMa4lUmR3ppth3Vi1JsO7082gCi284mXY
         capQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281784; x=1791886584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoB87xt/si/5SQ89z++VwfJlgKEBpZZ8oa5UH367RG0=;
        b=er0pC6OcvP43GSp+gIFGK+NxYamNPA4upKIavwMAsiaHG3Z1tHnM9f0RO2w2azdYzv
         zmGEdDgOMvbf5bvm+CmNEKyI/pDXRTaFOlnX5TrqQuAUEP+BokdDdpqf5+ZH1uCNUwv1
         t8REe+8W9Yy1MKICIsyL65KWDw3WOj2KZi2czwhf7qYzQsgp81sSaHuPhRbzSMBfK86C
         NhS+ehgCjyyfA7keIVnmcCwFPu11s3Ppj4P6j6ZqGyFzkS5/neIiwD9IaW6NtezsRm+3
         3lp030otLov6eGHHHBuq9T1ONrwtUAs0H9W7nwPN98vxM9BUK5voPQXrota1+xFzGRG2
         Qg/A==
X-Forwarded-Encrypted: i=1; AKwUvBzsjN6Hea1stKOCpsfAQpqz5C6T+nSe+K/8Z9qwZrG1LnU0NnE5neQuMn3paog0cz2Lu1lgc7o2vOiaNgQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mLdJKcZU6GW0OHLdxZPHAc15AoO6bd5UuG8meWIGowM4XAwULt
	g5ng2t+Ocn5vB1y+b3imd3NqsiihE3jO7Yfy6Dba1Ujg/ES1IAZ2sdfi
X-Gm-Gg: AYBFou0MPUFcY0CKNny74jSlULm4KF2flVONEwK/fTg2Td3XSOsCFfDcetSJixdyvib
	qCtEktoBHYh+DoEESdCd8bEyGlUsA3OAYoxg84HX3T2ZPDkm/U70lqMlcMWPcxbC+Rb8zNz/I4g
	FnPFeB0kN/9V9i4JxfT6RCXlbAHz7+JknZiywDRK5Im0CJm7t8jNNQMOdu+wyZlDJM7ssis1FsX
	RaObUu367I48i5IALUt4INYJC8+EqVcs/BOEUx1+nZ6toJxbL8k/xVlTEG9dWWDQDVIXdVi34ly
	BglMbSQ0DZygkmscqMqR26koN726cf1dDZI6EiexJ6RB6AgcWxTHIdcwvG+fiicXSl9ugtYer2n
	DPMBaSgHVtruzvdkNED5Segk8dJ9rKIQoKK0Y4KljpozhW63H5GROQIBUNek20DYkcERp0/hu1f
	Oe+TIs55XXJtD9LhHps6JB2MxzLNdZBsDChYssGWzypzdblz+y3N84EWMZmwpOUo2rcmBAbrJ1U
	kKMTCl1CDTQqxnCPHF31K6wAhbu/jARlg4hn0jL61JtAFS1nY/FAeIXaUPKvMbkGyz0ld8qFN7y
	dibV1GyByWGcx1hneI2OK0hh
X-Received: by 2002:a05:6a21:511:b0:3e0:da23:874a with SMTP id adf61e73a8af0-3e1246e1ec9mr796494637.18.1791281784146;
        Tue, 06 Oct 2026 03:16:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/4] ASoC: mediatek: Return 0 from FE startup on success
Date: Tue,  6 Oct 2026 17:16:02 +0700
Message-ID: <20261006101606.54079-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

Some FE startup callbacks may return a positive value from constraint 
helpers, but ASoC expects 0 on success. This can cause .shutdown() to be 
skipped during rollback.

Return 0 explicitly on success.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: mediatek: common: return 0 from mtk_afe_fe_startup() on success
  ASoC: mediatek: mt8188: return 0 from mt8188_afe_fe_startup() on
    success
  ASoC: mediatek: mt8189:return 0 from mt8189_fe_startup() on success
  ASoC: mediatek: mt8365: return 0 from mt8365_afe_fe_startup() on
    success

 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 +++++---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 5 ++++-
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 8 +++++---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 7 +++++--
 4 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.43.0

