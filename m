Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96023C871D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135864; cv=none; b=bTc6NEdU6exOvfMVn1WUcwndQj0kd40AoQ527k1gxkKZqAMG88zvRr7F2a8dh6kFWpibFbpImdz3LkXd2k9kjZLmqBf9EfIxHWcWrwI+BCK7UIsEfSKpfP/EyT9NY8hrdxUY73jgd6+5Xa1BvdCjLrfeHp7oPTP5gS2Bo6rB5iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135864; c=relaxed/simple;
	bh=w78AxETGPHyzfmayF6RqGh9MNLfHyZeAJnbAFfjzWAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZCg9i1q5xJrTUMkZfcQY9CTwDFG4By2O2y6VGUyC9UjhziCWqR4ZyFleNEXFcIrGwEPr+1zCOB3PsQOMAw9EGpYLJ3IdPWtiRDZWARUgxgGhh71VEnmqOiifXS9Vic6Uh41Ii5w+kq3n7qljNm9+nb4onNIRUfUWGZm54WHx4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sL461faJ; arc=none smtp.client-ip=74.125.229.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sL461faJ"
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-1397ad3d891so1518832c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135862; x=1792740662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddI7wafcUO9ClL5oaRHB8Y5QOHWEf7RdloyAjD1mNAk=;
        b=sL461faJjIl2+cWt/R+J4hg5eBKnmPIFj3ytOAQEtjli1AtOpkcjAGsdNgsFN7dr31
         x1A6SQ1zO+VSwI2mrkdABeLRP2HUiCUrJFROIitaKMGqZhrB24OtFgHQg5JtydP50Unl
         p73zRKT3yymEJniuz57cRf2DDHUglSn0FTU4/mdLSnAEPIjE7KnXoHXpqnGnpfDIgGQD
         8FG2lY+JIwsCimquzqqjU8AvM+sqgY0IAFz7GyEo1iYt5E2IGhgDnxbsTll05AdBu439
         Z60jBUFJjR9lNr0HrdYTTcgWzLrH+ExP47h7G5Dwwhe+crtWGT3sSeSSs56P8p1Q3cpV
         i0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135862; x=1792740662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ddI7wafcUO9ClL5oaRHB8Y5QOHWEf7RdloyAjD1mNAk=;
        b=Ip3QBYJHwUquRs/XYkMUOCIRgtV+vQm1RCn2FuT1JLvZz/oWoms7Do8YesnBdicWML
         0gOLV59ZC0GYoA3jce2ohBptw3TBZQ4JpLHB6z63aiQemy+dUevL7gvUcpTmcuO8pXxG
         aidqmDI6oLs6GLDfefL2gswHhRemBG82CWVJRcrs87HxR9vcAXaCw2Wj6pjhLpHgspfP
         pIyBw1umt+hhlUs5szEovaqnTIFmuF66jJWLw80PGoRYkifLzImHIg6FXzzHBqLLdSzD
         YrncASvUOhuzPYpRBua+lX359gurJxIiUwpJZpu/+YOTV3iQh5DIlUeKM4zLZ1/cB8M7
         QSCw==
X-Forwarded-Encrypted: i=1; AKwUvBxCcf0lOtCLSteG5bXxLp1DYdg0JPqz3dJbSCopRDRygEShOceyyg8yeZoOgqhgQPsQcsCIAssb6IEbO/c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG9D386t3BybXcguvqwGvO69WcHZlQnAPRQwAagl7IC6ARP5H+
	xCtxsHtBmMwoEigsNMp1Eefcr8Myu9Fj/9s6DrHygFhH4aVvPI0IIxYw
X-Gm-Gg: AYBFou0mWSOeWFy8S9yyeD8nIMMVoDYOoU7MHI30SuWwU+fyMC93n+MmbO3HBtHufr4
	H0zKb/0qBYlR8bqwNxodRfiNzBTvXC/xEmMsMqUczYAiYOz5HYJ1iModMk5tiq+IOqU5kU3/g9c
	0bi8gPs8XA/CT3tE0ALXd0iwVwDjR1ai13ABFARPUZ/hJTFtwGzY3EwgEmkkr3r9rYXnNyYNVWh
	Jyng2cd4fPRQ6G+yUU4wfAuBSjduY+zMia6yQuBDNeQyy71Niauu+9V4PIwPPPzRnEVMZ/sTilm
	iNp2qujYMVcdTOknJDFg4mmbJ1CuKt3/fRQq8ozshToDjDEaw6CL1SR13MrpiVKzvdHAYF6nDSJ
	HMkwHjz1sSPHgm5An+x8ReJ1TPm9zgB6iZdZ5+7/e/u5j+I2Zg6QnxmCJryFrFWzf30sQ9Avkg9
	CTkha1OyqeFOCK35dTjx1pYVeiYPFC9lMOH/0VO2IcoXbTFiXR+nrMzfAznP0dHnmTgp7KzI95s
	C+3Ka3gTrNxuN3TceYR5D1B/WYvzD6cJkZQSewOaaEmtJY=
X-Received: by 2002:a05:701b:2713:b0:143:26cf:8615 with SMTP id a92af1059eb24-16a6169558fmr30706517c88.25.1792135861737;
        Fri, 16 Oct 2026 00:31:01 -0700 (PDT)
Received: from blue.tailcc13ef.ts.net (104.194.64.109.16clouds.com. [104.194.64.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm5367021c88.11.2026.10.16.00.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:31:01 -0700 (PDT)
From: Yao Yiqi <yyaqia@gmail.com>
To: deller@gmx.de,
	tzimmermann@suse.de,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yaoyiqi3@huawei.com,
	Yao Yiqi <yyaqia@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/3] fbcon: Rebuild rotated font buffer on font change
Date: Fri, 16 Oct 2026 15:30:22 +0800
Message-ID: <20261016073023.490430-3-yyaqia@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016073023.490430-1-yyaqia@gmail.com>
References: <20261016073023.490430-1-yyaqia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yao Yiqi <yaoyiqi3@huawei.com>

fbcon_rotate_font() caches a rotated copy of the console font in
par->rotated.buf. The buffer is sized from the font's width, height
and charcount, and is rebuilt in fbcon_init(), fbcon_switch() and
fbcon_modechanged(), but not in fbcon_do_set_font().

When the console font is changed through KDFONTOP/KD_FONT_OP_SET, the
new font data and geometry are installed and vc_resize() is called.
The redraw that follows reaches the rotated bitops while the buffer
still holds the old font: the rotated putcs/cursor ops index
par->rotated.buf with the new cell size and character codes, so a
stale, too-small buffer is read out of bounds.

KASAN reports, for example:

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

Rebuild the buffer for the visible console right after the new font
geometry has been installed and before any redraw. Select the
console's blitting state with set_blitting_type() first, as
fbcon_init(), fbcon_switch() and fbcon_modechanged() do before their
rotate_font() calls: fbcon_rotate_font() reads the source font
through par->p, which may otherwise still refer to another console of
this framebuffer. On tile-blitting hardware, the same call uploads
the new font's map to the text engine, which previously happened only
when the console was switched. Background consoles keep their rebuild
at fbcon_switch() time, as the buffer is shared per framebuffer and
must not be rebuilt for a console that is not being displayed.

If vc_resize() fails, err_out restores the previous font. The rotated
buffer that was rebuilt for the new font earlier in the function
cannot be restored with it: font_data_rotate() has already reused or
freed the buffer that belonged to the old font. Select the blitting
type and rebuild the buffer again after the restore: the upload to
tile-blitting hardware and the rotated cache would otherwise keep
describing the rejected font, and par->rotated.fontdata would keep
referencing the font data whose last reference the error path drops.
A failing rebuild leaves par->rotated.buf NULL, so the rotated ops
skip drawing instead of reading a mismatched buffer; the next patch
retries the allocation on the following call.

Unlike the other callers, this one does not fall back to unrotated
rendering on failure. The "par->rotate = FB_ROTATE_UR;
set_blitting_type(vc, info);" fallback they use does not actually
switch to unrotated rendering: set_blitting_type() calls
fbcon_set_rotation(), which immediately re-derives par->rotate from
par->p->con_rotate. Replicating that pattern here would not change
the outcome; repairing the fallback is left to separate work.

Fixes: 6cc50e1c5b57 ("[PATCH] fbcon: Console Rotation - Add support to rotate font bitmap")
Cc: stable@vger.kernel.org
Signed-off-by: Yao Yiqi <yaoyiqi3@huawei.com>
---
Changes in v3:

- Also select the blitting type again in the error path of
  fbcon_do_set_font(). On tile-blitting hardware, set_blitting_type()
  uploads the font map to the text engine; without the second call, a
  failed vc_resize() left the engine with the rejected font (found by
  the Sashiko review).

Changes in v2:

- Rebuild the buffer again in the error path of fbcon_do_set_font().
  Without this, a failed vc_resize() left the rotated cache describing
  the rejected font while the console rendered with the restored one,
  and par->rotated.fontdata referenced freed font data (found by the
  Sashiko review).
- Select the console's blitting state with set_blitting_type() before
  rebuilding, like the other rotate_font() callers, instead of writing
  par->p directly.
- Reworded the note about the unrotated-rendering fallback, which is
  now left to separate work.
---
 drivers/video/fbdev/core/fbcon.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 01715873ea49..d90a2ad45053 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2432,6 +2432,17 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 	else if (!vc->vc_hi_font_mask && charcount == 512)
 		set_vc_hi_font(vc, true);
 
+	/*
+	 * Select the console's blitting state and update par->rotated to
+	 * match the new font, so that the rendering below does not use a
+	 * cache that was built for the old font.
+	 */
+	if (con_is_visible(vc)) {
+		set_blitting_type(vc, info);
+		if (par->bitops->rotate_font)
+			par->bitops->rotate_font(info, vc);
+	}
+
 	if (resize) {
 		int cols, rows;
 
@@ -2466,6 +2477,18 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 	else if (!old_hi_font_mask && vc->vc_hi_font_mask)
 		set_vc_hi_font(vc, false);
 
+	/*
+	 * Restore the rendering state for the old font: re-select the
+	 * blitting type, which re-uploads the font map on tile-blitting
+	 * hardware, and overwrite par->rotated with the restored font's
+	 * state.
+	 */
+	if (con_is_visible(vc)) {
+		set_blitting_type(vc, info);
+		if (par->bitops->rotate_font)
+			par->bitops->rotate_font(info, vc);
+	}
+
 	font_data_put(data);
 
 	return ret;
-- 
2.56.0

