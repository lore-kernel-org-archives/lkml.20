Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0881837268C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143807; cv=none; b=ZaDssscvx1VmGYf7DsSlLsmRWFZrpaSWWfoieChb09IfehBCHydo1SMMcmtIXLeOr4gLozL269lyp4QaN1eA15pS5G7zNE3HSva5onIVNCPJKIVJ2U0MHtbjLh6X3KDORFEyNrRUZ41xcg40vX3ipxMarkmfp+J7faiTwB2MSH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143807; c=relaxed/simple;
	bh=iP+xM/Nm2s51I7N4uWGzs3QFeDnfkK6qhX2Exs+Av50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iIxA4SQW4LTThJky89quYPW21wsrgkFZRNLqKm1P+HGQnR1HVClGpNXdNMIdwyg9u0RtOPHVJwccaKyQ0y0a3oxwl9RMV4Q9fahcQzMN3bL4g1S+Ii4+rKCKQzUe0rdanlOJiUTz1TkTX4fnCGcwzPNsFrKE10ZbttleUHUZoGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3zU1l5A; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3zU1l5A"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so2347555e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790143804; x=1790748604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzigS/BodMBW2I1kmdTZEpfx589O3xIFW3xCJjMx4pU=;
        b=R3zU1l5ANLXB6AmevKSoH2wkA7OKXHI7gUqdHojrX5vEbMBWQB0iTxtC/HTAFFvS7K
         C5ph+af8P3PZGluQpTcknwFA+2CIMHx5UOXoo6TM2oIXG96dnxzAsDcnJs18g+M1KVyI
         HSzS7cDnNKRI0cL/bn5H+iPKGeTC2OgUNVgwE7CZcs2rfky7SGj+HdPaElg3jqb9UDEg
         NoDUOeJZ4pfHQxFXGXqI5d4cgcliHO2TnDoqPqn47FOplz1IKxgcyTV6VL8jI1cGou0o
         0PAn5tvnC7Vs1Kv2WeBg1jyPLlmQsE72iURY3xiyh3IKOvwUoqIMZ8bh80JwZTJT4WJL
         Xewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790143804; x=1790748604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzigS/BodMBW2I1kmdTZEpfx589O3xIFW3xCJjMx4pU=;
        b=eubFISiGtidnPZP4I2CHpDe8q5LqK2L58TDz7cIgGUbK4bRZhfgw0tZQSWd0T51IyA
         Pm7kRYK1cv0fbP20PZmFiBcOE0lAi8Vr4o0Z9MpMdByEHmkcIpF8goxWyOqHKLUT70Yl
         xqZfDRw/TubevcWLNCn47ugSM0fwaU1Ir8bBs2q3sp8pd0eAl40xqvIlJkkMBCdigJUD
         qupZ+J6Yvu8O1LeVSF/Bjs+YzsB6dOBWO5d7sFKa+MTvpHjrLa9aXvlMwXFvr9562TYn
         dlS3nXanG5B/JZ8yo41FTUaYZDPd8JxKeMFZa52HHY2iaecpsz1lETXqsRAJ1OfZgtQt
         kHiA==
X-Forwarded-Encrypted: i=1; AKwUvBw1AKMPj3Z0yNyaa4FennVn5TD/YMBsjNrEXTU5V+S5nZzdqheQewO8LAsSZmkKMRxhrO+bOTFYO7n1aBA=@vger.kernel.org
X-Gm-Message-State: AFuF++lqH0I5PNrJ/ifpi7+L/lZj+cUZlKavG0bkuDddHU6qv1WC0q7q
	/NLF7zcG0VwgGA7ol1h5b+4t1DzY/b7Dq7Es+b+ky8npPufGp0evWsfX
X-Gm-Gg: AYBFou2peRtbGeEg0gapJ3uCDVGEZkSB6JAwyWJWa/zH87kFkKuYlUokvgdGD43mXP4
	7N/Rkr/J6/I1K7E6qhyparRlKTBDfITJFj0evIvoIQh9JYIb1s+Y90XwT3xq6t+OcAVb3U+qYic
	RmtHyI7E6yvxX0qwCMkCHQG2Br38WjyvIFSJCVTipwRxu2CJbVYVAas22PrKz6wcvqobQ2eym0d
	pGWG8RrTIZa977ofKphS1SzvrTDFiIbuu9OwEZSAfIBZr6d223i4n9vw6OSkFTfgwl5Lg+dxttz
	+YOt3Rt1PkqQNtiXy3pVZKqBvIzmQ+3TfoI0SZG/uZShy2F6SAaC3QePhNDKvf+8cQ9SFeIYI7u
	xgdtOdOB6nY60x+sd4l2malLGnJfRa/3Hk30rQw+YiHzk/dY3TD2C/ukO0nrU7Fz7pMy8fq3zk+
	eOeGFC3K1U+p7q3UnIPU0mzIHfD259JT010iDDRwMdOCVsoqT6s0IuFnleqfPS1V83Hn7LlSj8x
	Jd6O+layDGVi9RxOcolKdUZGn+nqi/LPD/qkephc2+edxWIx/Ylhvk=
X-Received: by 2002:a05:600c:8b86:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49fdf1354b4mr15462555e9.16.1790143804001;
        Tue, 22 Sep 2026 23:10:04 -0700 (PDT)
Received: from LS-Tayyab-Farooq.dreambig.corp ([58.27.187.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1acb91sm48246775e9.15.2026.09.22.23.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:10:03 -0700 (PDT)
From: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
To: Helge Deller <deller@gmx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@osdl.org>,
	Antonino Daplas <adaplas@pol.net>,
	dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER CONSOLE),
	linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER CONSOLE),
	linux-kernel@vger.kernel.org (open list)
Cc: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>,
	syzbot+bf4020519fbd94b2355d@syzkaller.appspotmail.com
Subject: [PATCH] fbdev: fbcon: Fix KASAN slab-out-of-bounds read in rotated font buffer
Date: Wed, 23 Sep 2026 11:08:07 +0500
Message-ID: <20260923060924.45742-1-syedtayyabfarooq08@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The root cause of this KASAN slab-out-of-bounds read is that fbcon fails to
reallocate the rotated font buffer (par->rotated.buf) when the font
character count changes but the font dimensions (width and height) remain
the same.

When a user changes the font via ioctl(KDFONTOP), fbcon_do_set_font() is
called. If the user first sets a 256-character font, enables rotation, and
then sets a 512-character font with the exact same width and height, resize
evaluates to false. The function then directly calls update_screen(vc).
Notice that fbcon_do_set_font() never calls par->bitops->rotate_font() to
update the rotated font buffer for the new font. As a result,
par->rotated.buf remains sized for the old 256-character font.

When update_screen(vc) is called, it eventually reaches cw_putcs_aligned(),
which attempts to read the glyphs from the rotated buffer. Since
vc->vc_font.charcount is now 512, vc->vc_hi_font_mask is set, making
charmask equal to 0x1ff (511). If the text buffer contains a character with
an index >= 256, src will point out of bounds of the old par->rotated.buf
(which only holds 256 glyphs). The subsequent read in
__fb_pad_aligned_buffer() triggers the KASAN slab-out-of-bounds crash.

To fix this, fbcon_do_set_font() must call par->bitops->rotate_font() to
update the rotated font buffer before calling vc_resize() or
update_screen(). If vc_resize() fails and the old font is restored in the
error path, rotate_font() must be called again to restore the rotated
buffer.

This pattern of updating the rotated font buffer was previously established
in fbcon_modechanged() by commit ef7656e85f1a ("fbdev: Fix out-of-bounds
access when rotating console after font resize"). The fix applies this
exact idiom to fbcon_do_set_font(). By placing it before vc_resize() and
update_screen(), we ensure the buffer is correctly sized before any
rendering occurs. Checking con_is_visible(vc) is also correct here, as
hidden consoles will have their rotation state updated later via
fbcon_switch() when they become visible.

Furthermore, by calling rotate_font() again in the err_out path, we ensure
that if vc_resize() fails, the rotated buffer is restored to match the old
vc->vc_font. Without this, restoring a 512-character font to a
256-character font on failure would leave the rotated buffer sized for 512
characters, which wastes memory; or worse, restoring a 256-character font
to a 512-character font would leave the buffer too small, causing an
out-of-bounds read later.

Fixes: e4fc27618b75 ("[PATCH] fbcon: Console Rotation - Prepare fbcon for console rotation")
Assisted-by: Gemini:gemini-3.6-flash Gemini:gemini-3.1-pro-preview syzbot
Reported-by: syzbot+bf4020519fbd94b2355d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=bf4020519fbd94b2355d
Link: https://syzkaller.appspot.com/ai_job?id=59f0d7d9-607c-4497-b2e2-0b16693f9502
Signed-off-by: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 01715873ea49..158b2f91d68e 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2432,6 +2432,13 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 	else if (!vc->vc_hi_font_mask && charcount == 512)
 		set_vc_hi_font(vc, true);
 
+	if (con_is_visible(vc)) {
+		if (par->bitops->rotate_font && par->bitops->rotate_font(info, vc)) {
+			par->rotate = FB_ROTATE_UR;
+			set_blitting_type(vc, info);
+		}
+	}
+
 	if (resize) {
 		int cols, rows;
 
@@ -2466,6 +2473,13 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 	else if (!old_hi_font_mask && vc->vc_hi_font_mask)
 		set_vc_hi_font(vc, false);
 
+	if (con_is_visible(vc)) {
+		if (par->bitops->rotate_font && par->bitops->rotate_font(info, vc)) {
+			par->rotate = FB_ROTATE_UR;
+			set_blitting_type(vc, info);
+		}
+	}
+
 	font_data_put(data);
 
 	return ret;
-- 
2.43.0

