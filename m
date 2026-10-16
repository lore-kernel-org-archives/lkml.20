Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22E3422523
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135852; cv=none; b=l94LfguiJ4mNb/tiMtIoCrh8eOJ7Dpy1KCUxnHCobLx4cM8dES7z7AZ2RYOZGsqRLPykVtThQshaCeCbYWmtpWBCp4HUWZA9p/QvJaCK1+QOLE5i3o1eYCVGH293FNyXl0JPYLU49Ph/MrPsmp31XcPKFyDRrGMJQO/hMzj5/LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135852; c=relaxed/simple;
	bh=rJVA4xz64RMxbQqM/HGg8tB1zxyaxikVW5mfthZO61c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Aj+uLdIwquRzeijLH3hdrIL8KVKjbeI+p2aORDn/PyzQXhp+1Fye56iNcaE3AtroIUcz/1SBsH6a/cvCQaxhk/23yi51NCxQNnHArkP/vqqbrfP51qCkWaFwibKUDwZcjsn56G8zxEHGYNQF5WEs2ggZaa2Hx28oSNoNtSiiG6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbVSO6t8; arc=none smtp.client-ip=74.125.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbVSO6t8"
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso2934083eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135850; x=1792740650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=62P/spIL5ufVeOJfaaQ7/HUKNwliOVhhQKYr2DiCnw4=;
        b=SbVSO6t8n0whpjjhOF2m2dupOgF9KvhVdKkZ/wE3V2y86YbY6KY1yiAqunsgGjkODd
         0ZEJyLhf/UFxS9X/ROVXUtFM+r7iYfcU4A21O/4viKGE2WdesLmumnEJVi6BqtsZ+Y7d
         eXYl1h3iTC13yeseshB3NHmWu3DLbcOwuvjc8dnbzlFNokgBYAAyzrMaeSfEYYtzqKHk
         kpz0qPM4bCM2FEDB1/YoQkXi9eq9SaxyW0kaLyE8iWbixs3NwemguUezT3RNFMXcZo5h
         jN9rPQ4A9iS05FtxtZpTWjBnS/JmGnnJVq+fyeFgZKc2IuMpAYhJtZeHMDQ1JqvWnXEY
         qE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135850; x=1792740650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=62P/spIL5ufVeOJfaaQ7/HUKNwliOVhhQKYr2DiCnw4=;
        b=LEBOYRk9uPYnuTINgAMrDBkc2maX/5Q8Gte58v5gJB5nk0Y29IQbdvt5PpMdLjcvMJ
         S77p8aIR6ATTnGo0WEfGAR3YBmKOUVEqSPiJCZDSER1IjQKAaRjztXT+KFnF+hKiPajh
         2oFp7ewN2C8uoVXILbGBQlpspHaSDPbuRDVaWXu2zPROaTBkY4jZu/pQpBA2kemAlxsP
         W4aoo3/gmNbXRKrSVXsZo+1VydkWoExY+OxXAc0FWS94JGiabL67lMMrkQ9o4bojif/0
         8L/yU8UXkcDa8Zk9TUhvsh4pnp09p0OvetttZO9eMFjxXzn+/+g7y/3MjJ8dNn/5EFQ0
         N34A==
X-Forwarded-Encrypted: i=1; AKwUvBzvX4xtTUhGZveMSUUT7O6uT5hdLy/i03hYw4Y+0GbjnXtW9gjGkkqkjelVocrLr7xlqjaFkWAUiqqwQvQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgA0PKXFReKLDhaFMhhY5nXIRNTVtm6LYM6e40W++tnUL86g9J
	s38/vQ3RwdGf49yFaiCQape1j/fOMRcvaQ/qzuni0zm8S7UE0Pd2K8Ov
X-Gm-Gg: AYBFou243Gs2vHnt5G2k26FybmkDuIRhumEeX4iZpdM+WsxDhJCEXEQ0F9rwJUHKMjr
	/0WBYTnPVSCiLcBrCD8BuzkKC/7fiphIiIfynucdH1gDLuhNGN+0iQL6A6DvvIjJPCRQXzYJx6A
	JRXMSe0hbnZDMSPU8vyPTnythzFW/fN7niAeSeWRH/sgxxTg1MNXzckvQVizkWEdLdL4yIgWzQN
	k20/fUU6ie7SqWjz1953ijF7z6/IvchnKm+E4wNRaB0+RfxBbtYNnU5TuUBcSChZN09CBQxJy06
	7+WGXs7VkUC8nHnsGC5X4bWk6GyaQVL4aE7s1/f3cY05Mjq0DrNAT0KSlBwZvwunUGfoTD5YEyz
	QClxRoaicc+ZpHw5CFywFGP28W5G1TWwaRcDNSoK+4r1ZElF3j9VybIJUtHWVBs36jFu9uc3r3b
	eJzFnS50L/8P1AZEc7Dng5roPvLnNaO46ET2eY8pCXxn1lxMUMifbvSazq5HGqwglZGKlGZ9k2Z
	GupRbpmxvyon1o9aQNv2y5XVJVakjXhwYc=
X-Received: by 2002:a05:701b:21d3:10b0:143:296a:3ee with SMTP id a92af1059eb24-16a5ef28797mr29299595c88.25.1792135849519;
        Fri, 16 Oct 2026 00:30:49 -0700 (PDT)
Received: from blue.tailcc13ef.ts.net (104.194.64.109.16clouds.com. [104.194.64.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm5367021c88.11.2026.10.16.00.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:30:47 -0700 (PDT)
From: Yao Yiqi <yyaqia@gmail.com>
To: deller@gmx.de,
	tzimmermann@suse.de,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yaoyiqi3@huawei.com,
	Yao Yiqi <yyaqia@gmail.com>
Subject: [PATCH v3 0/3] fbcon: fix rotated font buffer handling on font
Date: Fri, 16 Oct 2026 15:30:20 +0800
Message-ID: <20261016073023.490430-1-yyaqia@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes out-of-bounds reads of the rotated font buffer on
consoles that use fbcon's software rotation (fbcon=rotate:N).

Changing the console font through KDFONTOP installs the new font
geometry and then calls vc_resize(), whose redraw indexes
par->rotated.buf with the new cell size while the buffer is still
sized and laid out for the old font. KASAN reports, for example:

  BUG: KASAN: slab-out-of-bounds in soft_cursor
  Read of size 64 at addr ...
   memcpy
   soft_cursor
   cw_cursor
   fbcon_cursor
   hide_cursor
   redraw_screen
   vc_do_resize
   fbcon_do_set_font
   fbcon_set_font
   con_font_op
   vt_ioctl

Patch 2 adds the missing rebuild for the font-change path, and
compensates in the error path of fbcon_do_set_font(): if vc_resize()
fails, the font state is rolled back, and the rendering state has to
be selected and the rotated cache rebuilt for the restored font as
well. The rebuild itself cannot be undone, because font_data_rotate()
has already reused or freed the old buffer.

The cache key in fbcon_rotate_font() compared only the fontdata
pointer and the rotation. Raw font data does not store geometry, and
fbcon_set_font() deduplicates uploads by byte equality, so re-uploading
the same bytes with different dimensions keeps the pointer unchanged
while the geometry changes; the early-out then skips the rebuild and
the stale buffer is overrun during the resize redraw. Patch 1 adds the
font geometry to the cache key. Patch 3 makes a failed buffer
allocation retried on the next call, instead of blanking the console
until a font or rotation with a different key is installed.

The unrotated-rendering fallback that fbcon_init(), fbcon_switch() and
fbcon_modechanged() attempt when rotate_font() fails is ineffective:
set_blitting_type() immediately re-derives par->rotate from
par->p->con_rotate and reinstalls the rotated bitops. This is a
pre-existing issue that is independent of the font-change path, so it
is deliberately not addressed here and will be sent separately.

Changes since v2:

- patch 2: also select the blitting type again in the error path of
  fbcon_do_set_font(). On tile-blitting hardware, set_blitting_type()
  uploads the font map to the text engine; without the second call, a
  failed vc_resize() left the engine with the rejected font (found by
  the Sashiko review)

Changes since v1 [1]:

- new patch 1 ("Include font geometry in the rotated font cache") in
  response to the review, which noted that the early-out relies on the
  fontdata pointer alone
- patch 2 (was patch 1): also rebuild in the error path of
  fbcon_do_set_font(), so a failed vc_resize() no longer leaves the
  cache describing the rejected font while the console renders with
  the restored one; and select the console's blitting state with
  set_blitting_type() before rebuilding, like the other rotate_font()
  callers, instead of writing par->p directly
- patch 3 (was patch 2): unchanged in essence; the retry now covers
  the geometry-aware key of patch 1

[1] https://lore.kernel.org/all/20261014085102.497789-1-yaoyiqi3@huawei.com/

Yao Yiqi (3):
  fbcon: Include font geometry in the rotated font cache
  fbcon: Rebuild rotated font buffer on font change
  fbcon: Retry rotated font allocation after failure

 drivers/video/fbdev/core/fbcon.c        | 23 +++++++++++++++++++++++
 drivers/video/fbdev/core/fbcon.h        |  9 ++++++---
 drivers/video/fbdev/core/fbcon_rotate.c | 10 +++++++++-
 3 files changed, 38 insertions(+), 4 deletions(-)

-- 
2.56.0

