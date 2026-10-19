Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAE33F4122
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400538; cv=none; b=a7j5+lZeFZdlyVdK61qgWA96vdWGacHG5hEx5YZ/JoaMme1l9v7ULxgKJLBXZIavsMKoMrK7bNJy0Yluok55s+w9feUIFn/+Qox3P7rjI+lqYctOxe/WXs6m+i3Tg7jg1G37QvMn1uLCHNk8VZRysrXdbU8s7pGmNavKJ64inOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400538; c=relaxed/simple;
	bh=KEnNJh3rrhYtKOHUDjrU7apH2ucmijBgYQbutGWTkVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GUVvfYeXX+IYkgcRqYBbStxBNR6V00vBF+2UcKpiugWBZOR7MDehZQY6wYqTgxKjd7QRrQOrAgNeSsF0UJHUU8pfB7YkXj5GRdUxfS+pBRYvo4kn1eokO6ujK5X3XCAYQ5QyTVDQWKEo0R2PI+ucIEkumx3e1O/cJ3P9PBYcKSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1ILgQUo; arc=none smtp.client-ip=74.125.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1ILgQUo"
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-34cbc588a31so1057759eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792400536; x=1793005336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAvRyHlIfiRgj3s2BsPRbneZn58NB0+Nwn0y6jlCCk8=;
        b=A1ILgQUo79fTyddEUPvBZ8P6M1Y17gl1pEEMDxoJiIJxj9/SISPtfbH4sp4RLN9YOL
         X3IdRj0v1ijtytxlhQ3/OyX0UoNH4VZWZfMj/Tl9IywUvUCI61vYl9Sh0E8XWVFWAfE0
         vA8lq1C3ZZeAeW6vQx2s0leqNVMSW+VpR+9ckYi35O69xIGDk4I/AOLt1sGS461Gysrr
         T15Js5axuk8jfRiqIiYSbvQlnGcZQzstHXvct9Tv7GFwpmEoiHfKulEV9lLSdV+XvVLB
         bwJXxc/eUW4OIprp/paH3ivlLayGSmRjHG7eQ84Ja35uSvzImEhwyNV8GFY1w6Ar42jF
         10KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400536; x=1793005336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAvRyHlIfiRgj3s2BsPRbneZn58NB0+Nwn0y6jlCCk8=;
        b=FCdgdbkSwbKR0j/MzgTlA2N+DEJYtspSbPl0Js6AUZdlCdqhmQj04sTIe2M9GpZW+Y
         Zyz6KbY2dNs1g4n8rdQEfngEk01ybwc9zvm3y/9oMT7W+1wQXPuKu5xKGzJH6WvnyiSJ
         slW7v+VQPhoglgusMNh3wW8Rx01TfKWsQzddaWoyCRaLnCctC87X2zJkFiDQKgWwo9VH
         OgIWv2D+iGfK86MyoUnkiZBG9x4iDOkFizMgLD1CsoLiyCdrLpgdzCCDLIl5OImaynbS
         wt+l4a1Ef80qs3UmHOXWfyJZNS2OWWrl7pXxCJx8tCG+hLKs9OkNvxaxw6lQJzxbeosy
         Q6gA==
X-Forwarded-Encrypted: i=1; AKwUvByjsZheoj10ilsExomSqurK67DJ0N9dvyrVJ4pH/B+DTr2NKXdH4s2pnwbUtfpCXkyYazSQF7JU+cxha4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxECVa6xPT8mJoT+Hhj2Lxi9DvB+5DzQ2+dijVrFiPz4t5vh8F
	CGYYKAurjOJg0PBhs5yJuARxZDYndC8kz8Wpb/HC9wAIBEiG1RDAn3FX
X-Gm-Gg: AYBFou3UAhvV6YgO6Ukod35FouNspMV+E6KNawq2YIyklbyf+oAtZYR/U2zE6wSlVh5
	qHY2EeLE9EI4WwznQbEQXTvAnzqjEeT5lcekCtwPt27udUwBh9bSWucyyahYzR/oysgiW0NyFZB
	/5G54ilgTAP2H9tNfh27zcNP3ZVVjIeYvctPNhGCSkzk8fivM/naK030aQg92U08WFujm7lA3W9
	RVzhPC7ob3WrKnQNF+AEdLLGDeKkXSbaCYfUH3ym44HJv7e9gWvzDN/PbTSee9uQ7XBFj/upq4Y
	gby5w+51rrvDx9nWmwj42nrmNvy+RaKcZGsrizoSB6ZFd70Lrn/LDl013+v2AgZjUvYD8sSATyA
	sFaguJ5QA5Nra4GfTmR7TTBLFQqctdt4dojMOp9V7whK+x2/vdxfOZN2hSO7eq+2bJLNPoCjNjM
	PoFcKNNvlhtNSRC0VT/P2m3ECAsbtYm6V7WW0N1g1EYhUw3NTWwNo3ZYAUv9ZoU1AuNMMRzenOD
	xkjO7UcRwA14rY0Ns6BT7LZYMQ8bg3lKgM=
X-Received: by 2002:a05:701a:c951:b0:14c:637d:682d with SMTP id a92af1059eb24-18514b00b40mr12311278c88.43.1792400536345;
        Mon, 19 Oct 2026 02:02:16 -0700 (PDT)
Received: from blue.tailcc13ef.ts.net (104.194.64.109.16clouds.com. [104.194.64.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ba424a6sm27085064c88.17.2026.10.19.02.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:02:15 -0700 (PDT)
From: Yao Yiqi <yyaqia@gmail.com>
To: deller@gmx.de,
	tzimmermann@suse.de,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yaoyiqi3@huawei.com,
	Yao Yiqi <yyaqia@gmail.com>
Subject: [PATCH v4 0/3] fbcon: fix rotated font buffer handling on font change
Date: Mon, 19 Oct 2026 17:02:03 +0800
Message-ID: <20261019090206.1094958-1-yyaqia@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix out-of-bounds reads of the rotated font buffer when the console
font changes on a rotated console (fbcon=rotate:N). KDFONTOP installs
the new geometry and vc_resize() redraws before par->rotated.buf is
updated, so the old buffer is indexed with the new cell size.

Patch 1 keys the rotated font cache on the font geometry. Patch 2
rebuilds it on font changes, restoring the old buffer if the change
fails. Patch 3 retries a failed allocation.

Changes since v3: roll back via the saved buffer instead of re-running
rotate_font(), abort the font change on rebuild failure, and guard the
rotated state with CONFIG_FRAMEBUFFER_CONSOLE_ROTATION.

v1: https://lore.kernel.org/all/20261014085102.497789-1-yaoyiqi3@huawei.com/

Yao Yiqi (3):
  fbcon: Include font geometry in the rotated font cache
  fbcon: Rebuild rotated font buffer on font change
  fbcon: Retry rotated font allocation after failure

 drivers/video/fbdev/core/fbcon.c        | 50 +++++++++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbcon.h        |  9 ++++---
 drivers/video/fbdev/core/fbcon_rotate.c | 10 +++++++-
 3 files changed, 65 insertions(+), 4 deletions(-)

-- 
2.56.0


