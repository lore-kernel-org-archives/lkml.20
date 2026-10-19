Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04582367B9B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403038; cv=none; b=BxpWz/Rq6owlCWm+ytiMWr1sEtHcsDb83OmAfSMczehQYit7j+JYfmYvb/tAAyk5uH6K3L4wJDg7bq8HartHxjJq1FnmcZqgbl8WMYo5zwGZ6ry2V6753X+h2zh0g9fzqCdyMytRExKC0PmQ+gHNsP4fTbaEpY2gRLb17QXyU0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403038; c=relaxed/simple;
	bh=NHZMWsqhaQ33Uo0xDtcv+OHeiqkGvqLsEmmgfpGzEN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwrdPHLpgwleVRUjdPG30wMKllYYnTpYY8dC1kMRj8qPX8YXR10iQe8kpIH7HOhfSB2S4A3OTyhe1HCDipCHy1e9sN/II0yeQ2NHBdJfO9IgduS8SZY8L7sWXCovASBBHdXOQB0d8fSxIWiBwDOe8pHW0iWhLkyqZf6iF6gov+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQzwGP2n; arc=none smtp.client-ip=74.125.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQzwGP2n"
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3514af07fb4so874964eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403036; x=1793007836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wD2WIpjKVnC6AxNSYVPPB4T+WOtPpt82EYJQTf5ufN8=;
        b=BQzwGP2nE8HTSgirKKpAkkAnaseifqzHpb1rf7SwAeJSpDY5kdrGcbuPZU40h3Pe80
         jpPNeodaQUQYQzoJRV378uVOcI2klYp0Z8OsB3ZecB2G/xt96QGeg9Q8tXfbUR7tQ0by
         yz/kWCNfUDB2xajVt+agCh+rA1T8o4pTWG+L4TMW4fZlbeALaSlNoe/2TeyhnTMhwwJF
         ex/n6bzvuMhgClkKNAos1bd9azlE0P+aOzTo/6yAJPuNY/3rlVX7K5tEGux7Myeu5Wp0
         nBTrMN/UZ873Z/R1Ixbnbd2XwCH8EpwdfhTXz0DU1vREUFu8koBEllT+Fkd2nk6J3YA/
         DA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403036; x=1793007836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wD2WIpjKVnC6AxNSYVPPB4T+WOtPpt82EYJQTf5ufN8=;
        b=Of5g7aL8YZVVX2DoBW3JOYSyLKKo8bpD6fiMCEzSpg/nfp2qq3PC5vOPYikdPGF4gn
         e3xmUudat/VYloWrklkBNxj+ernHTdMNgkucbdqtyJur6axpWhfbyxMJ0ppgxaiinaQL
         j3tGazfSL4fxyMU4y4mbBgfYEOM7l5ov07VHAlerqQMaiSQa+/wFYJCRd1MQrJh/oOEf
         1OcJAp3+VlgcfxIMvyywmE5demuFcGSMhEik7hyO5agvSVTFC+twtpg3hcyVA78joutM
         FUiKHpdlahwh03Ys0PfcRc+iE88gc4waY7IuPHXez3g0L56M0r/CzzmZkVRHJsUS/V/W
         7u/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxLY2QtGo+mwMNOsmDgtOqEhHkkcjppM6v1ZSQC3De1+3to9gUlr66n4rk7XGS3p9cX868vllFJMPztQgI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNr6RpRspSNUQYSx6VHR25AuL6MDbQJJ0blM9+DzB14j7rc+DZ
	BkcIiex+s6T2E7eXkwwRTQeZJUnmSnV08QgqWdDOL8R3B7CCn5gZCOgM
X-Gm-Gg: AYBFou2dJnMYxIybyOWP7hXuBk9uDw4GH3yDIliKbbt1Bin+dcrtGYYwd4vQRu1SHdg
	4jJ+iMRnpMXH/vMSLrX/fWU35ufQsEVQqKtI9XwZnXPZHtKDiFdrzGyvYerD//GFKxzds7mroa7
	WDIUdPTDfLSIm9znDC0HGlDQKMIQjRI/Bbj93kC/mnSnANLoDUPqbimDuRMqfIOMD/1rRBAUszK
	P1h5GDa8QA/F0onwBYwW9/CBsY0m8oRhNuhTxULsGM2w32QInOVPke8O1jlO8cpWTF9jWcu9caK
	jyL6nTHhw8W/pMhRPP6i2L/p3XFw60GkCKGJ6ZkjcWIWdL2JYHi2Vxu2ddkVzBj1GONUL3tNgX0
	5NbbDRwNyKZObGmPd0fgelC6VaU8gGnYQ2A7/mj51Byy8INxDkDSP8479B0tjvQX8SD8qKEqJ1y
	piEiOSziBgmlwzUKhw4fJgMRAO8mvd0givLo95Zoxc2Cp5wAu0RfL67nuoimTr+DvTP7dnfES8o
	R9nAZuxBpYMCf3TXgjmqF85y8QTdZGT2Ck=
X-Received: by 2002:a05:7300:a214:b0:35e:ebb1:8e5a with SMTP id 5a478bee46e88-361a1b5251cmr9702651eec.26.1792403035840;
        Mon, 19 Oct 2026 02:43:55 -0700 (PDT)
Received: from blue.tailcc13ef.ts.net (104.194.64.109.16clouds.com. [104.194.64.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607bc950f9sm34370074eec.0.2026.10.19.02.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:43:55 -0700 (PDT)
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
Subject: [PATCH v5 2/3] fbcon: Rebuild rotated font buffer on font change
Date: Mon, 19 Oct 2026 17:43:30 +0800
Message-ID: <20261019094331.1128871-3-yyaqia@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019094331.1128871-1-yyaqia@gmail.com>
References: <20261019094331.1128871-1-yyaqia@gmail.com>
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

When the font is changed through KDFONTOP, the new geometry is
installed and vc_resize() redraws before the buffer is rebuilt. The
rotated putcs/cursor ops then index the old buffer with the new cell
size; KASAN reports a slab-out-of-bounds read in soft_cursor().

Rebuild the buffer for the visible console before the redraw, as the
other callers do: select the console's blitting state with
set_blitting_type() (which also uploads the new font's map on
tile-blitting hardware), then rebuild. Background consoles keep
their rebuild at fbcon_switch() time, as the buffer is shared per
framebuffer and must not be updated for a console that is not being
displayed.

To ensure a correct rollback when the rebuild or the following
vc_resize() fails, save the rotated font state, clear it before
rebuilding, and restore it in the error path of
fbcon_do_set_font().

Fixes: 6cc50e1c5b57 ("[PATCH] fbcon: Console Rotation - Add support to rotate font bitmap")
Cc: stable@vger.kernel.org
Signed-off-by: Yao Yiqi <yaoyiqi3@huawei.com>
---
Changes in v5:

- Save, clear and restore the entire par->rotated state instead of only
  the buffer. Restoring only the buffer left the cache key describing
  the rejected font, so a later switch could take the early-out and
  index the smaller buffer with the larger font's geometry. Clearing
  the whole state also makes the rebuild unconditional, so it does not
  depend on the next patch's buffer check (found by the Sashiko
  review).

Changes in v4:

- Restore the saved rotated buffer on failure instead of re-running
  rotate_font(), so that a second allocation failure cannot leave the
  console in a third state.
- Keep the old buffer out of the rebuild by allocating a fresh one.
- Abort the font change when the rebuild fails.
- Guard the rotated state with CONFIG_FRAMEBUFFER_CONSOLE_ROTATION.
---
 drivers/video/fbdev/core/fbcon.c | 46 ++++++++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbcon.h | 22 ++++++++-------
 2 files changed, 59 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 01715873ea49..9a5d50d69d00 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2414,6 +2414,10 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 	font_data_t *old_fontdata = p->fontdata;
 	const u8 *old_data = vc->vc_font.data;
 	unsigned short old_hi_font_mask = vc->vc_hi_font_mask;
+#ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
+	struct fbcon_rotated saved_rotated = { };
+	bool rotated_saved = false;
+#endif
 
 	font_data_get(data);
 
@@ -2432,6 +2436,27 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 	else if (!vc->vc_hi_font_mask && charcount == 512)
 		set_vc_hi_font(vc, true);
 
+	/*
+	 * Select the console's blitting state and update par->rotated to
+	 * match the new font, so that the rendering below does not use a
+	 * cache that was built for the old font. Clear the cached state so
+	 * the rebuild allocates a fresh buffer; the old state is kept until
+	 * the font change can no longer fail.
+	 */
+	if (con_is_visible(vc)) {
+		set_blitting_type(vc, info);
+		if (par->bitops->rotate_font) {
+#ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
+			saved_rotated = par->rotated;
+			memset(&par->rotated, 0, sizeof(par->rotated));
+			rotated_saved = true;
+#endif
+			ret = par->bitops->rotate_font(info, vc);
+			if (ret)
+				goto err_out;
+		}
+	}
+
 	if (resize) {
 		int cols, rows;
 
@@ -2448,12 +2473,26 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 		update_screen(vc);
 	}
 
+#ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
+	if (rotated_saved)
+		kfree(saved_rotated.buf);
+#endif
 	if (old_fontdata)
 		font_data_put(old_fontdata);
 
 	return 0;
 
 err_out:
+#ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
+	/*
+	 * Drop the buffer built for the new font and restore the saved
+	 * state.
+	 */
+	if (rotated_saved) {
+		kfree(par->rotated.buf);
+		par->rotated = saved_rotated;
+	}
+#endif
 	p->fontdata = old_fontdata;
 	vc->vc_font.data = old_data;
 	vc->vc_font.width = old_width;
@@ -2466,6 +2505,13 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 	else if (!old_hi_font_mask && vc->vc_hi_font_mask)
 		set_vc_hi_font(vc, false);
 
+	/*
+	 * Re-select the blitting type, which re-uploads the font map on
+	 * tile-blitting hardware.
+	 */
+	if (con_is_visible(vc))
+		set_blitting_type(vc, info);
+
 	font_data_put(data);
 
 	return ret;
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index bfbd70f8b1cd..a618adf3c871 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -72,6 +72,18 @@ struct fbcon_bitops {
 	int  (*rotate_font)(struct fb_info *info, struct vc_data *vc);
 };
 
+#ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
+struct fbcon_rotated {
+	font_data_t *fontdata;       /* source font */
+	u8 *buf;                     /* rotated glyphs */
+	size_t bufsize;
+	int buf_rotate;              /* rotation of buf */
+	unsigned int buf_width;      /* geometry of source font */
+	unsigned int buf_height;
+	unsigned int buf_charcount;
+};
+#endif
+
 struct fbcon_par {
 	struct fb_var_screeninfo var;  /* copy of the current fb_var_screeninfo */
 	struct delayed_work cursor_work; /* Cursor timer */
@@ -88,15 +100,7 @@ struct fbcon_par {
 	int    rotate;
 	char  *cursor_data;
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
-	struct {
-		font_data_t *fontdata;       /* source font */
-		u8 *buf;                     /* rotated glyphs */
-		size_t bufsize;
-		int buf_rotate;              /* rotation of buf */
-		unsigned int buf_width;      /* geometry of source font */
-		unsigned int buf_height;
-		unsigned int buf_charcount;
-	} rotated;
+	struct fbcon_rotated rotated;
 #endif
 	u8    *cursor_src;
 	u32    cursor_size;
-- 
2.56.0

