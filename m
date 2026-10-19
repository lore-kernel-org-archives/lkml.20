Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0B64AA1CD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403027; cv=none; b=WqUkwAe9n7cCQfu1JcfaCNk65BbpDFH6anc063n9uy9oko2A4mOj7RkQdbUBYMP48JVxjFSkWLAqBV1Ojn/EL6KeI9Kl9tNwRF7DOFwjuihUlvZ7mknUaMYZkqO2B4IjpHAeeP6uzN3iDQfYWTXh+vmFTiu7Lr7KdmjXDR4pko8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403027; c=relaxed/simple;
	bh=Pf5auVrKMgDnMWWbNxu/l4Lc3KB3RvGuDckatQ4rOPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pgPX1xS4TabpPO3PYVjowvKU1aN3PnbDNytPmfijXV2kdwoPIKKJHWTvOekm3lSwPgNSVAxBj11p5z3gouVLh5kbhh0ycM/Ef7G3v/1q13IjnxEZFNqsf5QjDKmX2+aQwXE0ql28IqZl0Fhsa14yyImhmewVQziOxO2XfoGcUQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cz6njLRr; arc=none smtp.client-ip=74.125.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cz6njLRr"
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso4272964eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403025; x=1793007825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=knrHyzES/QXTzztJhLzmWRpJR+Ay5sPD9k7TLCcmxn4=;
        b=cz6njLRr26uzvJQnM2o1NsSJ9ZuB92ZxbzhPCjyjAw4PilfbmQ17Kpa5UThDuSblUY
         QekfGhmB4o/PFjeWgDj2dVA3uoOlwBlKUU5g3HcJkFooVBvaySyg58GZ6EVDPp7/5Dyc
         z+cZu/8pQkg44ad6wsIR0XftKSnnOH7Jto+mpYX386u4EfhHLvwd876U0Xnw/5/assbW
         Rju2jEkW92ilvS0n9JiQRctJd8i1J8W+gE8edsq0OefbMf1d7qfYXnOJD96yGHOzqjW/
         znHjtm4I81DzFBeOy+dYsxF6D1fwY22wW8zL17GUXCdxRMVv3sv6O4kutTObevmWeFFM
         wUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403025; x=1793007825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knrHyzES/QXTzztJhLzmWRpJR+Ay5sPD9k7TLCcmxn4=;
        b=TrPJR1+DtksC79kliUpiecuP7Fb529PomY52LlVVnbDRuZebFOHZ3koFQtIOcRXqRU
         /vuImdbbB9kZtmlCjQ8IimlcgJ/xvY3O/mzHdwEUVb3BzdAu5Zc2P0oqsHdTym1j7NyL
         zNcO4JMEu1gufJP647Y2PGbqpJ6FQf+DO/7LCr55XwR+X+2yxxP7M1scPdHUrFoY5He0
         Onp+1QenVFwBx5i6/DdjiZSY9/vXGkJXO0oK+L04zVq+K1Lmc9yExpof/rlHzSgxMLGy
         9PHqupNUgKCeH4UOXyVKndpmfeYVlufJbTPi0SnXHdI/lwBakE46nRedAx0Yzf9PvZ8L
         cdgA==
X-Forwarded-Encrypted: i=1; AKwUvBy0LeuhNdDlWIzuB/90YgfwdVH18Rby+CZENXb5tBUt/U41W42G6g+hrAI86kFwX7HU6H3peH0VbEcEy/U=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+p6x8YU+hv60+3CjnLg2K8p28Mll03kAi/O76G0PkdjHUAkPY
	d9ZfaSJHICgHCdPJoif/qsaBbqgs1tCE1bhcEupE2aYuF8S6XW4FqBEY
X-Gm-Gg: AYBFou2xi2D4QWDWuQjdycGkjcNqdDd9FTG/bM1loZ7LzsOzZgvxTSOvnL279LctfhS
	EQMw8RXPflFUtC3c1IA43AWXOZt8ObTcWDTAjOClR+dCEu8+rFpG3/7PUti/5Co1/a0vDsRYdqF
	FY0Qe/20ybDbOqI+cHvgJJydt0BkId1RZ7lFcYpPHouudtOpn3f6tZbIDrgE5AveZNEuXyFMTID
	aNyI2elsG+KFbJoatfxEQLNk0cI04/kc6Z9j/cWgolF09nyx0Wc0AF5RUXGm9IhSWihN7p0ZXhU
	NxNTEAWAAAQx/RYtWUgZg9btSd6ZnaLmoLLsrZsmcS4s8CqlIXouI9cYMlVtpIomszP3ZeDI/Bx
	WwvOUyB1MQy8B07r980QSxCnqDCRapWhGJNVbxNjGzhJKcdAPDgbTRHg17k0D3NQoWaZBVTiGe5
	s4NRmdFdDuGz/3jlCLd7G4nq6plJUJpgJQUgVAtoBLg0vwS0PHfOW7jA0XWFCZokAtaYgMmvCm9
	jfrBXfe82F5YHNqNVQC9ll/8EeXfiCyNsYO
X-Received: by 2002:a05:7301:2727:b0:35d:a10d:11ef with SMTP id 5a478bee46e88-361a186599emr11742279eec.11.1792403025311;
        Mon, 19 Oct 2026 02:43:45 -0700 (PDT)
Received: from blue.tailcc13ef.ts.net (104.194.64.109.16clouds.com. [104.194.64.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607bc950f9sm34370074eec.0.2026.10.19.02.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:43:44 -0700 (PDT)
From: Yao Yiqi <yyaqia@gmail.com>
To: deller@gmx.de,
	tzimmermann@suse.de,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yaoyiqi3@huawei.com,
	Yao Yiqi <yyaqia@gmail.com>
Subject: [PATCH v5 0/3] fbcon: fix rotated font buffer handling on font change
Date: Mon, 19 Oct 2026 17:43:28 +0800
Message-ID: <20261019094331.1128871-1-yyaqia@gmail.com>
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
rebuilds it on font changes, saving and restoring the whole cache if
the change fails. Patch 3 retries a failed allocation.

Changes since v4: save, clear and restore the entire par->rotated
state instead of only the buffer; restoring just the buffer left the
cache key describing the rejected font, which could make a later
switch skip the rebuild and index the smaller buffer with the larger
font's geometry (found by the Sashiko review).

v4: https://lore.kernel.org/all/20261019090206.1094958-1-yyaqia@gmail.com/
v1: https://lore.kernel.org/all/20261014085102.497789-1-yaoyiqi3@huawei.com/

Yao Yiqi (3):
  fbcon: Include font geometry in the rotated font cache
  fbcon: Rebuild rotated font buffer on font change
  fbcon: Retry rotated font allocation after failure

 drivers/video/fbdev/core/fbcon.c        | 46 ++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbcon.h        | 19 ++++++----
 drivers/video/fbdev/core/fbcon_rotate.c | 10 ++++++-
 3 files changed, 68 insertions(+), 7 deletions(-)

-- 
2.56.0

