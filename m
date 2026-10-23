Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777911;
	b=32Pcb76W5kUpLD658Ihsb37sMatcgXw3ZONOzomC56kazT/ketAxtnYicXncSWFfvi78
	 GJDiNVo+ORJTs4o7oG6acT9c1GT3BHMi3V0rBIDBYxd6/MJ6zljPe1ee7LEQlAczlvUpH
	 8CUX72OWFwiw0q/IZj/54zdxcWtskvXMCmr5t8vR2cLhEGOajjsb3Dq+ctm2AOfQV2y0d
	 bdRJ0sLw2XBkk+nSoaUWo2QX8pGWfWM7Tv3CM6g0RZKMp8Sqbu7T+VWXjRjt4OW3yY3xO
	 3d97AZB4/1fDlTogZZIDwIV4upNiw98BC5fir37X22vRgxg2e2cK0lQBKKZNOxYcZAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7wwANjuDtZeTrIYJO8YoDGwetOTDKqWw0CaiXm+A6RE=;
	b=e0b8x7ocAkcmk5iGpYZLVrc3R5GYoLY2uiL37mwXU6xLWXWxSoDthIA48U+liOO1tENu
	 efSg2eCEoK/RcGYnZmh+A3czTsePfyhBYi9SyAK6dHvGUZ0+I4SpsN3TWmenYaLEcnd6+
	 fa1rMjjPCxoD0qmVECFycnytP1f21ftkXtusLsP5Y+h4Kr0F6EVVGIW49q7TG5OeBCGtb
	 MVptFjx/3TP5oAD1MYRk2FiUxqgkVjqOgalArRERFcizyqSnmUW7MKTQN3zQMmkVrTN52
	 6L+JoTbYOx1qrEqrBQp0M2kOMxRIxNp0QBPN/YH0i09gy6T1nRBr/324RKrDPyrTlww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KeN1mHlU;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400E1606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 400E1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KeN1mHlU
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36661f953e4so1965637eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792777910; x=1793382710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7wwANjuDtZeTrIYJO8YoDGwetOTDKqWw0CaiXm+A6RE=;
        b=KeN1mHlUE8H65mhqBFxPDjAG6SEA3nwST8Mc8fzc+ILmzrxXNLUzhLHAeC85poJFLa
         quV0YF5rE55k4WkIsNGxOT1aHSkPGtL7zMVPeGsh0zwDayyAHWAyFTuA+ZzJ1qr7CaJ8
         bLsmdSsXV1D0RZY8B7iZiajKfokJcj9zkcexZk2DPVANmTwQ44bePkUtlAvEsUbLktJ9
         omgOjWUQ5BKQMXONQtpD3K1BeatmQSTPtWeu5eIwfk+mUYyYOuEUzEId8oqciiXKRUXb
         U0uQL0eX667yZjF9NsuSsqRGjfCgMSHYrGdRznQRK2SiMMDXKi59nWjLV0BntKQP+79w
         NhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777910; x=1793382710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7wwANjuDtZeTrIYJO8YoDGwetOTDKqWw0CaiXm+A6RE=;
        b=tQL3FJO0nPIPAJG+VaocIlgqLzpTG8LzrdVheYXwg/3BT7SnoMAChpG8Gu9Zu/iqX1
         xSAmVjBJLlXQ369yjU2iLPwWQMb7Qc1ZW4lX2KgkHio+rYfbJkB4w5FQG8LKxdf2rZx0
         /cXwBrQ4OjcT6DYdgG5E48uScowz/o/mg+DbGUpQmdVXWcIzECXFKHaeuDZNwOf2sOwU
         cUs/ZszMXHrEJ3jsPQYJlTWIWjgnR1NNnnwu8OX9rsoY8vPEmDFwdF6X7A9Q5tr3Et3D
         i7XW6XwkbSSA8mOZ63o1ZnfV33qekAJWwqpqq91ZTF/r2Z0ZL6Rw/If+0X4+Qvl8uxnl
         XfuA==
X-Forwarded-Encrypted: i=1; AKwUvBz0p0alBv0g+9NHYeTfuT77Rp71ZrzWm1e7dQo/CeXm4NXjMpwd8xufYQRMyg7vpVcnlSh1jqv+b69iKao=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3+U0b/fDxc20eFXv7Q2/I4dqUAlCNT163P8uzVa9e5j+lj707
	J1DEUNL9KS6dfsPK0Qt3bYv2kpRUBAswW5h5a8rQo4STvJ7GOtFyp6L7
X-Gm-Gg: AYBFou0jGia1zh1zj22tzo5MuBqSQp55V7zwS3UQ83iFFYe6BtK7K9KOW1SQQr7xsgn
	F38JYJ/9w2kMcSaJnTUllIARA8brXpRnmZ3zRjchPiD834ECMBpTvbx15MBgl1aOnhpSL5eJs72
	CpQuNU4akWP+eIttJBltsv5vI7wpQ486DgyyYj5ZvAiit3j/W5JsSFbPqw6Bm0OGOM2+ktZFkgy
	YIShrtu7X77q6HqOJRCROyml8FRKES9f39oPu9uzd99tdRLFaZFZACzb980PjIO/XX0njRMqbrF
	ISWIxUFCq9aKnMWvZ4vAYijUKwEEZQ1lGVaI9IoAua0Z1gFqbvfeltGIT1CQ9N1+dEQR1zdNlp1
	wjGcjQprLdnZCk2JnjcozYFB1dQMzok+9PXWKljtX3LLoGOJN456iaeWVmVZBeA93rXDOnYInqg
	NPSB0TORf2vu7hb3MKuaWqvIQ1veRDfC0p79R13xe7V84KUaHqJkePeyQ1lXXXZK8YitDGR5E/N
	l9ykuLAwuW6vrckdY4Ces1yCV0Y3U9sm7WrkC6m7Gphtu6AauOYIaUfArH+aM886fmLoSs9uk4p
	AEsZXSJxSVLbWyu35BTN+9jJNd47
X-Received: by 2002:a05:7022:3b85:b0:187:efba:9ba2 with SMTP id a92af1059eb24-195c6f00fa6mr4412390c88.44.1792777910049;
        Fri, 23 Oct 2026 10:51:50 -0700 (PDT)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ea25sm132988c88.5.2026.10.23.10.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:51:48 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	co+b0df61d49532b2ee@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fbdev: vfb: Validate framebuffer geometry and memory size
Date: Fri, 23 Oct 2026 10:51:29 -0700
Message-ID: <20261023175128.4127122-2-bestswngs@gmail.com>
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

get_line_length() multiplies two int operands before assigning the
result to u_long. Setting xres_virtual to 0x8000000 at 32 bpp therefore
wraps the product to zero and bypasses vfb_check_var()'s video-memory
limit. fbcon can then clear margins with a zero line stride and write
past the vmalloc'ed framebuffer.

The xoffset + xres and yoffset + yres calculations can likewise wrap,
leaving an invalid offset in info->var after fb_pan_display() rejects
it. Subsequent fbcon drawing can then access far beyond the framebuffer.

Finally, PAGE_ALIGN(videomemorysize) was narrowed from unsigned long to
unsigned int. Values near or above 4 GiB could therefore allocate a much
smaller buffer than the size used for mode validation.

KASAN reports:

  BUG: KASAN: vmalloc-out-of-bounds in sys_fillrect
    drivers/video/fbdev/core/sysfillrect.c:24
  Write of size 8 at addr ffa0000001671000 by task poc/198
  sys_fillrect
    drivers/video/fbdev/core/sysfillrect.c:24
  bit_clear_margins
    drivers/video/fbdev/core/bitblit.c:247
  fbcon_clear_margins.constprop.0
    drivers/video/fbdev/core/fbcon.c:1410
  fbcon_switch
    drivers/video/fbdev/core/fbcon.c:2261
  redraw_screen
    drivers/tty/vt/vt.c:994
  fbcon_modechanged
    drivers/video/fbdev/core/fbcon.c:2693
  fbcon_update_vcs
    drivers/video/fbdev/core/fbcon.c:2732

Reject video-memory sizes whose aligned value is not representable by
the fbdev metadata. Check the offset additions for overflow. Compute the
line length and framebuffer size in u64, reject unrepresentable line
lengths, and check the total-size multiplication before comparing it
with the allocated video-memory size.

Cc: stable@vger.kernel.org
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: <co+b0df61d49532b2ee@bugs.sh>
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 drivers/video/fbdev/vfb.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/video/fbdev/vfb.c b/drivers/video/fbdev/vfb.c
index de137b2bd..84b0a937c 100644
--- a/drivers/video/fbdev/vfb.c
+++ b/drivers/video/fbdev/vfb.c
@@ -101,11 +101,11 @@ static const struct fb_ops vfb_ops = {
      *  Internal routines
      */
 
-static u_long get_line_length(int xres_virtual, int bpp)
+static u64 get_line_length(u32 xres_virtual, u32 bpp)
 {
-	u_long length;
+	u64 length;
 
-	length = xres_virtual * bpp;
+	length = (u64)xres_virtual * bpp;
 	length = (length + 31) & ~31;
 	length >>= 3;
 	return (length);
@@ -122,7 +122,8 @@ static u_long get_line_length(int xres_virtual, int bpp)
 static int vfb_check_var(struct fb_var_screeninfo *var,
 			 struct fb_info *info)
 {
-	u_long line_length;
+	u64 line_length, size;
+	u32 xres, yres;
 
 	/*
 	 *  FB_VMODE_CONUPDATE and FB_VMODE_SMOOTH_XPAN are equal!
@@ -159,17 +160,23 @@ static int vfb_check_var(struct fb_var_screeninfo *var,
 	else
 		return -EINVAL;
 
-	if (var->xres_virtual < var->xoffset + var->xres)
-		var->xres_virtual = var->xoffset + var->xres;
-	if (var->yres_virtual < var->yoffset + var->yres)
-		var->yres_virtual = var->yoffset + var->yres;
+	if (check_add_overflow(var->xoffset, var->xres, &xres) ||
+	    check_add_overflow(var->yoffset, var->yres, &yres))
+		return -EINVAL;
+
+	if (var->xres_virtual < xres)
+		var->xres_virtual = xres;
+	if (var->yres_virtual < yres)
+		var->yres_virtual = yres;
 
 	/*
 	 *  Memory limit
 	 */
 	line_length =
 	    get_line_length(var->xres_virtual, var->bits_per_pixel);
-	if (line_length * var->yres_virtual > videomemorysize)
+	if (line_length > U32_MAX ||
+	    check_mul_overflow(line_length, (u64)var->yres_virtual, &size) ||
+	    size > videomemorysize)
 		return -ENOMEM;
 
 	/*
@@ -434,9 +441,13 @@ static int __init vfb_setup(char *options)
 static int vfb_probe(struct platform_device *dev)
 {
 	struct fb_info *info;
-	unsigned int size = PAGE_ALIGN(videomemorysize);
+	unsigned int size;
 	int retval = -ENOMEM;
 
+	if (videomemorysize > U32_MAX - (PAGE_SIZE - 1))
+		return -EINVAL;
+	size = PAGE_ALIGN(videomemorysize);
+
 	/*
 	 * For real video cards we use ioremap.
 	 */
-- 
2.56.0

